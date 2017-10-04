[![Code Climate](https://codeclimate.com/github/silviabotros/chef-orchestrator/badges/gpa.svg)](https://codeclimate.com/github/silviabotros/chef-orchestrator)
[![Issue Count](https://codeclimate.com/github/silviabotros/chef-orchestrator/badges/issue_count.svg)](https://codeclimate.com/github/silviabotros/chef-orchestrator)

# chef-orchestrator-cookbook
 This cookbook sets up and runs mysql-orchestror (https://github.com/github/orchestrator/). 

## Presumptions:
- The backend mysql for orchestrator is going to run on the same server as orchestrator itself
- That backend DB is going to use Percona MySQL which is setup using the chef-percona cookbook by Philiper (https://github.com/phlipper/chef-percona.git)
- That you, the end user, own adding privileges for orchestrator to access your existing DB infrastructure 
- That you wrap this cookbook to use the CLI and add your production databases for discovery

## Supported Platforms
Tested with 
- Centos 6.5
- Ubuntu 12.04

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['orchestrator']['version']</tt></td>
    <td>nil | string</td>
    <td>version to install, nil provides latest (and will upgrade)</td>
    <td><tt>nil</tt></td>
  </tr>
</table>

## Usage

### Installation
Starting in version _2.1.0_, the orchestator cookbook now respects the `version` attribute. If set to `nil` (the default), the cookbook will perform the same steps as previous versions--always upgrade to the latest version available via the repos available on a node.
Setting this attribute to a specific package version will result in that version being installed.

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
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: Silvia Botros(<silvia.botros@sendgrid.com>)
