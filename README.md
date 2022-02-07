# sync-config

This is a streamlined Snyk Sync configuration repository to be used with the sync-deploy terraform project

The repository is deployed by the [aws_cron.sh](https://github.com/snyk-playground/snyk-sync/blob/main/scripts/aws_cron.sh) script in the snyk-sync repository. The intended workflow is one configures and tunes their Snyk Sync config locally using this repository as a template, then update their snyk-sync-deploy terraform configuration to deploy this repo in the ec2 instance. Once this repository is deployed, the cron job will pull down the latest version of main before running a sync.

In order to handle multiple Import Jobs, use the aws_import_cse_group.sh as a starting point for a custom import script for a group. The aws_cron.sh script will attemp to run every script it finds in the scripts/imports/ folder of the repository. Note how the script sources the SNYK_TOKEN value (which must be set for snyk-api-import) from a specific groups security token.

```shell
├── README.md
├── cache
│   ├── logs
│   └── org
├── crontab-entry
├── scripts
│   ├── autoconf.sh
│   ├── full-sync.sh
│   ├── gen_targets.sh
│   ├── import_group.sh
│   ├── imports
│   │   └── aws_import_cse_group.sh
│   ├── test.sh
│   └── update_tags.sh
├── snyk-orgs.yaml
├── snyk-sync.yaml
├── tags
└── targets
```
