## KIWI Image Descriptions

This repository contains KIWI image descriptions for building various Linux distributions and configurations. Currently includes Amazon Linux 2023 (AL2023) and Amazon Linux 2027 (AL2027) attestable images with security-focused configurations.

## Available Image Descriptions

* **AL2023 Attestable Image**:  Amazon Linux 2023 with TPM attestation, dm-verity protection. Creates an isolated compute environment
* **AL2027 Attestable Image**:  Amazon Linux 2027 with TPM attestation, dm-verity protection. Creates an isolated compute environment

## Quick Start

Build an image using KIWI:

```bash
sudo kiwi-ng --color-output --loglevel 0 system build \
  --description ./kiwi-image-descriptions-examples/<distribution>/<image-type> \
  --target-dir ./image
```

## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This project is licensed under the Apache-2.0 License.
