initial_setup Cookbook
===================

Initial setup for Debian / Ubuntu machine

Requirements
------------
Debian / Ubuntu

#### packages
- `user` - for creating/updating users.
- `sudo` - to create sudo rules.
- `ssh_known_hosts` - to create set of knosn hosts for easy ssh connect.

Attributes
----------

#### initial_setup::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['initial_setup']['packages']</tt></td>
    <td>Array</td>
    <td>Default set of packages</td>
    <td><tt>["sshpass", "bash-completion", "unattended-upgrades", "htop", "figlet"]</tt></td>
  </tr>
</table>

Usage
-----
#### initial_setup::default

Just include `initial_setup` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[initial_setup]"
  ]
}
```

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: TODO: List authors
