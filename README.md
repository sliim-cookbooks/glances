# glances Cookbook | [![Cookbook Version](https://img.shields.io/cookbook/v/glances.svg)](https://community.opscode.com/cookbooks/glances) [![Build Status](https://travis-ci.org/sliim-cookbooks/glances.svg?branch=master)](https://travis-ci.org/sliim-cookbooks/glances) 

Installs/Configures [glances](http://nicolargo.github.io/glances/) on your server!

## Requirements

#### cookbooks
- `python`

## Recommended cookbooks:
- `apt` for debian/ubuntu platforms
- `build-essential` for all platforms

#### Platforms
The following platforms and versions are tested and supported using Opscode's test-kitchen:
- Ubuntu 12.04
- Ubuntu 14.04
- Debian 6
- Debian 7
- Debian 8
- Centos 5
- Centos 6
- Centos 7
- Fedora 20
- Fedora 21

## Attributes

#### glances::default
|               Key               |  Type   |                 Description                  |
| ------------------------------- | ------- | -------------------------------------------- |
| `[glances][extra_pip_packages]` | Array   | List of extra packages (default: [pystache]) |
| `[glances][version]`            | String  | Glances package version (default: nil)       |
| `[glances][config]`             | Hash    | Glances configuration                        |
| `[glances][daemon][run]`        | Boolean | Run glances at startup (default: false)      |
| `[glances][daemon][args]`       | String  | Arguments for server mode (default: -s)      |

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

