# InfoMapper / Deployment #

This section describes the steps needed to deploy the InfoMapper to AWS to a S3
bucket behind CloudFront. Any other steps, tips, and issues that fought back will
be mentioned as well.

This section is also a work in progress. The following links were invaluable to resolving
some deployment issues and will be left here as reference:

* [CloudFront events that can trigger a Lambda@Edge function](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/lambda-cloudfront-trigger-events.html)
* [Using Lambda@Edge to handle Angular client-side routing with S3 and CloudFront](https://andrewlock.net/using-lambda-at-edge-to-handle-angular-client-side-routing-with-s3-and-cloudfront/)

## Deployment script (`copy-to-owf-amazon-s3.sh`) ##

Path: `build-util/copy-to-owf-amazon-s3.sh`

This script dynamically builds the deployment files and bundles, uses the AWS CLI
to upload and sync to S3, and invalidates all the files using CloudFront so changes
can be almost immediately viewed. **Right now the script is not totally complete
for the InfoMapper. Use the owf-infomapper-poudre script to finish making changes.**

## Troubleshooting ##

### Dealing with server side routing ###

Using the PathLocationStrategy in a deployed Angular application as is will work
as expected at first glance. Entering in the app's URL to its home page will show
the home page, and navigating from page to page will be fine. The issue stems from
a page reload. When this happens, the URL is sent to the origin server (S3).
For example, the URL `poudre.openwaterfoundation.org/latest/content-page/home`
is sent as a request, 