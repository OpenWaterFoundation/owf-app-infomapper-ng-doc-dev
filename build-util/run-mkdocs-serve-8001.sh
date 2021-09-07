#!/bin/sh
#
# Run 'mkdocs serve' on port 8001, which allows user documentation to use port 8000

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
    # Check if the last command worked, and if not, try `python3 -m mkdocs --version`.
    if [ "$?" = "1" ]; then
      mkdocsVersionFull=$(python3 -m mkdocs --version)
    fi
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
checkOperatingSystem() {
  if [ -n "${operatingSystem}" ]; then
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
  echo "Detected operating system:  ${operatingSystem}"
}

# Check the source files for issues
# - the main issue is internal links need to use [](file.md), not [](file)
checkSourceDocs() {
  # Currently don't do anything but could check the above
  # Need one line to not cause an error
  :
}

# Entry point into the script

# Check the operating system
checkOperatingSystem

# Make sure the MkDocs version is OK
checkMkdocsVersion

# Check the source files for issues
checkSourceDocs

# Get the folder where this script is located since it may have been run from any folder
scriptFolder=$(cd "$(dirname "$0")" && pwd)
# Change to the folder where the script is since other actions below are relative to that
cd "${scriptFolder}" || exit

# Change to the MkDocs project folder so that 'mkdocs' can be run and find files it expects.
cd ../mkdocs-project || exit

# Run 'mkdocs serve' using an appropriate variation of Python command line.
echo "View the website using http://localhost:8001"
echo "Stop the server with CTRL-C"
if [ "${operatingSystem}" = "cygwin" ] || [ "${operatingSystem}" = "linux" ]; then
  # For cygwin and linux, 'mkdocs' will probably be in the PATH
  echo "On Cygwin and Linux... running 'mkdocs serve...'"
  mkdocs serve -a 0.0.0.0:8001
  # Check if the last command worked, and if not, try `python3 -m mkdocs serve -a 0.0.0.0:8001`.
  if [ "$?" = "1" ]; then
    python3 -m mkdocs serve -a 0.0.0.0:8001
  fi
elif [ "${operatingSystem}" = "mingw" ]; then
  # This is used by Git Bash
  echo "On MinGW (Git Bash) ... running 'py -m mkdocs serve...'"
  py -m mkdocs serve -a 0.0.0.0:8001
fi

# Exiting the script will return to the starting folder
