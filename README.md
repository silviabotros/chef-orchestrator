# chef-orchestrator-cookbook

This cookbook sets up and runs [mysql-orchestror](https://github.com/github/orchestrator/).

[![Code Climate](https://codeclimate.com/github/silviabotros/chef-orchestrator/badges/gpa.svg)](https://codeclimate.com/github/silviabotros/chef-orchestrator)
[![Issue Count](https://codeclimate.com/github/silviabotros/chef-orchestrator/badges/issue_count.svg)](https://codeclimate.com/github/silviabotros/chef-orchestrator)

## Presumptions

- The backend mysql for orchestrator is going to run on the same server as orchestrator itself
- That backend DB is going to use Percona MySQL which is setup using the [chef-percona](https://github.com/phlipper/chef-percona) cookbook by [Philiper](https://github.com/phlipper)
- That you, the end user, own adding privileges for orchestrator to access your existing DB infrastructure
- That you wrap this cookbook to use the CLI and add your production databases for discovery

## Supported Platforms

- Centos 6.5
- Ubuntu 12.04

## Attributes

| Key | Type | Description | Default |
| --- | ---- | ----------- | ------- |
| ['orchestrator']['package']['version'] | nil | string | version to install, nil provides latest (and will upgrade) |
| ['orchestrator']['package']['url'] | nil | string | URL to download the RPM from |
| ['orchestrator']['package']['checksum'] | nil | string | Checksum for the file provided by URL |

## Usage

### Installation

Starting in version _2.1.0_, the orchestrator cookbook now respects the `version` attribute. If set to `nil` (the default), the cookbook will perform the same steps as previous versions -- always upgrade to the latest version available via the repos available on a node.
Setting this attribute to a specific package version will result in that version being installed. If you want to install the package from an internal source, you can also specify the url and optional checksum to download the orchestrator package.

### orchestrator::default

Include `orchestrator` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[orchestrator::default]"
  ]
}
```

## Contributing

1. Fork the repository on Github
1. Create a named feature branch (i.e. `add-new-recipe`)
1. Write your change
1. Write tests for your change (if applicable)
1. Run the tests, ensuring they all pass
1. Submit a Pull Request

## License and Authors

Author:: Silvia Botros(<silvia.botros@sendgrid.com>)
