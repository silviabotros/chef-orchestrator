# chef-orchestrator-cookbook
 This cookbook sets up and runs mysql-orchestror (https://github.com/outbrain/orchestrator/) which is a project by Outbrain. 
*Presumptions*:
- The backend mysql for orchestrator is going to run on the same server as orchestrator itself
- That backend DB is going to use vanilla MySQL
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
    <td><tt>['chef-orchestrator']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### chef-orchestrator::default

Include `chef-orchestrator` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[chef-orchestrator::default]"
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
