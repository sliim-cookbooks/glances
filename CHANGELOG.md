# glances CHANGELOG

This file is used to list changes made in each version of the glances cookbook.

## 1.0.3
- Restart glances service when configuration or init script changed

## 1.0.2
- Reload daemon for systemd service
- Set system user for glances service

## 1.0.1
- Fixed specs..

## 1.0.0
- `glances::service` recipe to setup glances service
- Supports `ubuntu`, `debian`, `centos` and `fedora` platforms
- `[glances][version]` attribute to install specific glances version
- `[glances][daemon]` attribute is replaces by `[glances][service]` for service config

## 0.3.0
- New attribute: `[glances][extra_pip_packages]`

## 0.2.0
- Glances configuration improved

## 0.1.0
- Initial release of glances
