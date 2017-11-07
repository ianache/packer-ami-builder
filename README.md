## Packer AMI Builder

Builds an AMI from ISO Media.

## Requirements

* Packer `1.1.1` - Includes puppet masterless fix
* VirtualBox `5.1.x` - VirtualBox Download https://www.virtualbox.org/wiki/Downloads
* Amazon Access Keys configured in `$HOME/.aws/credentials` - http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html
* Configure your environment variables - For OSX `~./bashrc` with the "AWS_S3_BUCKET" or Windows System Variables.

## How does it work

* update your windows variables inside the `autounattend` directory.
* Run `rake` to parse variables inside the `autounattend` directory.
* Validate a Packer template `packer validate <template_name>.json`.
* Run a Packer build `packer build <template_name>.json`.

## References

* Packer Amazon Import Post-Processor - https://www.packer.io/docs/post-processors/amazon-import.html
* Amazon Import Process - http://docs.aws.amazon.com/vm-import/latest/userguide/vmimport-image-import.html
