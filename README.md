# glances Cookbook | [![Cookbook Version](https://img.shields.io/cookbook/v/glances.svg)](https://community.opscode.com/cookbooks/glances) [![Build Status](https://travis-ci.org/sliim-cookbooks/glances.svg?branch=master)](https://travis-ci.org/sliim-cookbooks/glances) 

Installs/Configures [glances](https://github.com/nicolargo/glances) on your server!

## Requirements

#### cookbooks
- `python`

## Attributes

#### glances::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['glances']['daemon']['args']</tt></td>
    <td>String</td>
    <td>Arguments for server mode</td>
    <td><tt>-s</tt></td>
  </tr>
  <tr>
    <td><tt>['glances']['daemon']['run']</tt></td>
    <td>Boolean</td>
    <td>Run glances at startup</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['glances']['config']</tt></td>
    <td>Hash</td>
    <td>Optional glances configuration</td>
    <td><tt>Default glances config</tt></td>
  </tr>
  <tr>
    <td><tt>['glances']['extra_pip_packages']</tt></td>
    <td>Array</td>
    <td>List of extra packages</td>
    <td><tt>[pystache]</tt></td>
  </tr>
</table>

## Usage

#### glances::default

Just include `glances` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[glances]"
  ]
}
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

## License and Authors

Authors: Sliim <sliim@mailoo.org>

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
