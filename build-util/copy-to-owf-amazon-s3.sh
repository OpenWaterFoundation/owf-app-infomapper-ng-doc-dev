#!/bin/sh
(set -o igncr) 2>/dev/null && set -o igncr; # this comment is required
# The above line ensures that the script can be run on Cygwin/Linux even with Windows CRNL
#
# Copy the site/* contents to the software.openwaterfoundation.org website
# - replace all the files on the web with local files
# - must specify Amazon profile as argument to the script

# Supporting functions, alphabetized

# Make sure the MkDocs version is consistent with the documentation content
# - require that at least version 1.0 is used because of use_directory_urls = True default
# - must use "file.md" in internal links whereas previously "file" would work
# - it is not totally clear whether version 1 is needed but try this out to see if it helps avoid broken links
checkMkdocsVersion() {
  # Required MkDocs version is at least 1
  requiredMajorVersion="1"
  # On Cygwin, mkdocs --version gives:  mkdocs, version 1.0.4 from /usr/lib/python3.6/site-packages/mkdocs (Python 3.6)
  # On Debian Linux, similar to Cygwin:  mkdocs, version 0.17.3
  if [ "${operatingSystem}" = "cygwin" ] || [ "${operatingSystem}" = "linux" ]; then
    mkdocsVersionFull=$(mkdocs --version)
  elif [ "${operatingSystem}" = "mingw" ]; then
    mkdocsVersionFull=$(py -m mkdocs --version)
  else
    echo ""
    echo "Don't know how to run on operating system ${operatingSystem}"
    exit 1
  fi
  echo "MkDocs --version:  ${mkdocsVersionFull}"
  mkdocsVersion=$(echo "${mkdocsVersionFull}" | cut -d ' ' -f 3)
  echo "MkDocs full version number:  ${mkdocsVersion}"
  mkdocsMajorVersion=$(echo "${mkdocsVersion}" | cut -d '.' -f 1)
  echo "MkDocs major version number:  ${mkdocsMajorVersion}"
  if [ "${mkdocsMajorVersion}" -lt ${requiredMajorVersion} ]; then
    echo ""
    echo "MkDocs version for this documentation must be version ${requiredMajorVersion} or later."
    echo "MkDocs mersion that is found is ${mkdocsMajorVersion}, from full version ${mkdocsVersion}."
    exit 1
  else
    echo ""
    echo "MkDocs major version (${mkdocsMajorVersion}) is OK for this documentation."
  fi
}

# Determine the operating system that is running the script
# - mainly care whether Cygwin or MINGW
checkOperatingSystem()
{
  if [ ! -z "${operatingSystem}" ]; then
    # Have already checked operating system so return
    return
  fi
  operatingSystem="unknown"
  os=$(uname | tr "[:lower:]" "[:upper:]")
  case "${os}" in
    CYGWIN*)
      operatingSystem="cygwin"
      ;;
    LINUX*)
      operatingSystem="linux"
      ;;
    MINGW*)
      operatingSystem="mingw"
      ;;
  esac
}

# Check the source files for issues
# - the main issue is internal links need to use [](file.md), not [](file)
checkSourceDocs() {
  # Currently don't do anything but could check the above
  # Need one line to not cause an error
  :
}

# Get the InfoMapper version.
# - the version is in the 'assets/version.json' file in format:  "version": "0.7.0.dev (2020-04-24)"
getVersion() {
  infoMapperVersionFile="${infoMapperAssetsFolder}/version.json"
  version=$(grep '"version":' "${infoMapperVersionFile}" | cut -d ":" -f 2 | cut -d "(" -f 1 | tr -d '"' | tr -d ' ' | tr -d ',')
}

# Entry point into the script.

# Check the operating system.
checkOperatingSystem

# Make sure the MkDocs version is OK.
checkMkdocsVersion

# Check the source files for issues.
checkSourceDocs

# Get the folder where this script is located since it may have been run from any folder.
scriptFolder=$(cd "$(dirname "$0")" && pwd)
repoFolder=$(dirname "${scriptFolder}")
gitReposFolder=$(dirname "${repoFolder}")
infoMapperRepoFolder="${gitReposFolder}/owf-app-infomapper-ng"
infoMapperMainFolder="${infoMapperRepoFolder}/infomapper"
infoMapperAssetsFolder="${infoMapperMainFolder}/src/assets"

echo "Script folder = ${scriptFolder}"
# Change to the folder where the script is since other actions below are relative to that
cd "${scriptFolder}" || exit

# Get the software version
getVersion

# Set --dryrun to test before actually doing
dryrun=""
#dryrun="--dryrun"
s3VersionFolder="s3://software.openwaterfoundation.org/infomapper/${version}/doc-dev"
s3LatestFolder="s3://software.openwaterfoundation.org/infomapper/latest/doc-dev"

if [ "$1" = "" ]
  then
  echo ""
  echo "Usage:  $0 AmazonConfigProfile"
  echo ""
  echo "Copy the site files to the Amazon S3 static website folders:"
  echo "  $s3VersionFolder"
  echo "  $s3LatestFolder"
  echo ""
  exit 0
fi

awsProfile="$1"

# First build the site so that the "site" folder contains current content.
# - "mkdocs serve" does not do this

echo "Building mkdocs-project/site folder..."
cd "${repoFolder}/mkdocs-project" || exit
if [ "$operatingSystem" = "cygwin" ] || [ "$operatingSystem" = "linux" ]; then
  mkdocs build --clean
elif [ "$operatingSystem" = "mingw" ]; then
  # This is used by Git Bash
  py -m mkdocs build --clean
fi
cd "${scriptFolder}" || exit

# Now sync the local files up to Amazon S3, for version and latest
exitStatus=0
for versionFolder in ${s3VersionFolder} ${s3LatestFolder}; do
  echo ""
  echo "Uploading documentation to:  ${versionFolder}"
  read -r -p "Continue [Y/n/q]? " answer
  if [ "${answer}" = "q" ] || [ "${answer}" = "Q" ]; then 
    exit 0
  elif [ -z "${answer}" ] || [ "${answer}" = "y" ] || [ "${answer}" = "Y" ]; then 
    if [ "$operatingSystem" = "mingw" ]; then
      # If "aws" is in path, run it
      if [ "$(which aws 2> /dev/null | cut -c 1)" = "/" ]; then
        # Found aws
        aws s3 sync ../mkdocs-project/site ${versionFolder} ${dryrun} --delete --profile "$awsProfile"
        exitStatus=$(expr ${exitStatus} + $?)
      else
        # Figure out the Python installation path
        pythonExePath=$(py -c "import sys; print(sys.executable)")
        if [ -n "$pythonExePath" ]; then
          # Path will be something like:  C:\Users\sam\AppData\Local\Programs\Python\Python37\python.exe
          # - so strip off the exe and substitute Scripts
          # - convert the path to posix first
          pythonExePathPosix="/$(echo $pythonExePath | sed 's/\\/\//g' | sed 's/://')"
          pythonScriptsFolder="$(dirname $pythonExePathPosix)/Scripts"
          echo $pythonScriptsFolder
          $pythonScriptsFolder/aws s3 sync ../mkdocs-project/site ${versionFolder} ${dryrun} --delete --profile "$awsProfile"
          exitStatus=$(expr ${exitStatus} + $?)
        else
          echo "ERROR: Unable to find Python installation location to find 'aws' script"
          echo "ERROR: Make sure Python 3.x is installed on Windows so 'py' is available in PATH"
        fi
      fi
    else
      # For other Linux just try to run
      aws s3 sync ../mkdocs-project/site ${versionFolder} ${dryrun} --delete --profile "$awsProfile"
      exitStatus=$(expr ${exitStatus} + $?)
    fi
  fi
done

exit "${exitStatus}"
