# v1.0.0

## Refactor
* refactor(v1.0): deprecate Log Profiles in favor of Diagnostic Settings (#49) (Marc Garcia)([b0b472f](https://github.com/lacework/terraform-azure-activity-log/commit/b0b472f6d33e082b074d533a7b38a86fef07e6cc))
## Bug Fixes
* fix: Avoid 400 Error in upgrade scenario  (#52) (Marc Garcia)([6f7107e](https://github.com/lacework/terraform-azure-activity-log/commit/6f7107e8dd7d071f7f8e294d18fdbf2b319afc3c))
## Other Changes
* ci: version bump to v0.3.4-dev (Lacework)([c06ef57](https://github.com/lacework/terraform-azure-activity-log/commit/c06ef57c8c6be8701c038a9c3cfec7524bee0044))
---
# v0.3.3

## Bug Fixes
* fix: use data source when using existing storage account (#46) (Salim Afiune)([0e8b3a5](https://github.com/lacework/terraform-azure-activity-log/commit/0e8b3a5bdb100738c0ad90141614c305dc508e97))
## Other Changes
* ci: version bump to v0.3.3-dev (Lacework)([14cce67](https://github.com/lacework/terraform-azure-activity-log/commit/14cce679e4b3e809173d252649f451b43c3686ca))
---
# v0.3.2

## Refactor
* refactor: increase azure timeout to 20s (#37) (Marc Garcia)([404b46d](https://github.com/lacework/terraform-azure-activity-log/commit/404b46d410b53b8088aeb7dda59d211061329d57))
## Bug Fixes
* fix: add correct dependency to storage account (#40) (Salim Afiune)([1eaa14a](https://github.com/lacework/terraform-azure-activity-log/commit/1eaa14af0346f860a982fd2b08a411ff3916e810))
* fix: remove unneeded version pin for azuread (#39) (Marc Garcia)([08aa105](https://github.com/lacework/terraform-azure-activity-log/commit/08aa1057a5485f629fa1f3de4429208dfe5ccce8))
## Documentation Updates
* docs: Add contributing documentation (#35) (Darren)([244b3da](https://github.com/lacework/terraform-azure-activity-log/commit/244b3da3cf5b49e7bd95589976cd6dd84bda23c9))
## Other Changes
* chore: version bump to v0.3.2-dev (Lacework)([060d79f](https://github.com/lacework/terraform-azure-activity-log/commit/060d79f0db79de9bbf5174d619fdd0bf6b36413a))
* ci: sign lacework-releng commits (#29) (Salim Afiune)([c566535](https://github.com/lacework/terraform-azure-activity-log/commit/c566535a1d2b76752da0749d582ddcfa2897756e))
---
# v0.3.1

## Bug Fixes
* fix(deps): upgrade min azurerm version to ~> 2.28 (#27) (Salim Afiune)([cb060c3](https://github.com/lacework/terraform-azure-activity-log/commit/cb060c3256605fab330f2adc4f4ce9c5951a2844))
## Other Changes
* chore: version bump to v0.3.1-dev (Lacework)([ce51128](https://github.com/lacework/terraform-azure-activity-log/commit/ce51128d1887c943cdfe135e952b9aaa39d1c680))
---
# v0.3.0

## Features
* feat: add support for resource tags (#23) (Tomáš Bohuněk)([106103e](https://github.com/lacework/terraform-azure-activity-log/commit/106103efbd6b7576a26c46534f40b9864611d1f2))
## Refactor
* refactor: reduce permissions needed for Audit Log integration (#22) (Marcos Garcia)([a0ed59a](https://github.com/lacework/terraform-azure-activity-log/commit/a0ed59a7642b73bd3b48d9cde28ea2147956441a))
## Other Changes
* chore: version bump to v0.2.3-dev (Lacework)([770104f](https://github.com/lacework/terraform-azure-activity-log/commit/770104fc24c6da1567fd3090a9c934be1324eb60))
---
# v0.2.2

## Bug Fixes
* fix: azurerm_role_assignment definition id (#18) (Salim Afiune)([656a958](https://github.com/lacework/terraform-azure-activity-log/commit/656a9581ec67b4eaa79a9c4a29a7f61fc51decca))
## Other Changes
* chore: version bump to v0.2.2-dev (Lacework)([45edf9d](https://github.com/lacework/terraform-azure-activity-log/commit/45edf9d4f3bfb063629bce29082693727defa8e4))
---
# v0.2.1

## Bug Fixes
* fix: corrected azure provider version constraints (#16) (Alan Nix)([678ec95](https://github.com/lacework/terraform-azure-activity-log/commit/678ec957be15d9bbc4487db2e5569aa105815fdd))
## Other Changes
* chore: version bump to v0.2.1-dev (Lacework)([d1e27ba](https://github.com/lacework/terraform-azure-activity-log/commit/d1e27baced470b57f3cb14586f292f8feeeb3a44))
---
# v0.2.0

## Features
* feat: added ability to use existing infrastructure (#14) (Alan Nix)([9366258](https://github.com/lacework/terraform-azure-activity-log/commit/93662581e6950b8769f3c7a2cf4100359bbe5e32))
## Other Changes
* chore: version bump to v0.1.5-dev (Lacework)([b3a9db4](https://github.com/lacework/terraform-azure-activity-log/commit/b3a9db4e6ce9850183be55313d620970b9554fee))
---
# v0.1.4

## Other Changes
* chore: bump required TF version to 0.12.31 (Scott Ford)([fbc8732](https://github.com/lacework/terraform-azure-activity-log/commit/fbc87323c7162acf4adcb84bfe37ad54238b09af))
* chore: fix pessimistic version pinning on dependent modules (Scott Ford)([49c2d25](https://github.com/lacework/terraform-azure-activity-log/commit/49c2d2562c85a806fa986a627aad250808af2e8f))
* ci: fix finding major versions during release (#10) (Salim Afiune)([d0457ae](https://github.com/lacework/terraform-azure-activity-log/commit/d0457ae443d5d9f49d565ff6f6d89bd8017ec7fb))
* ci: switch PR test from CircleCI to CodeFresh (#9) (Darren)([7ba5843](https://github.com/lacework/terraform-azure-activity-log/commit/7ba58430930e961ed50dd1fe499aec634f36d7d4))
* ci: switch releases to be own by Lacework releng ⚡ (#8) (Salim Afiune)([55b6cb9](https://github.com/lacework/terraform-azure-activity-log/commit/55b6cb9f81aa196e87cb172ce038215540a87d98))
---
# v0.1.3

## Documentation Updates
* docs: Update all examples with README files (#6) (Scott Ford)([32775ac](https://github.com/lacework/terraform-azure-activity-log/commit/32775ac4ab60c7650707e7526893a302c06656e5))
## Other Changes
* ci: send slack notifications to team alias ⭐ (#5) (Salim Afiune)([ab90f8d](https://github.com/lacework/terraform-azure-activity-log/commit/ab90f8d4640a12effb359298638cfba271d93245))
---
# v0.1.2

## Bug Fixes
* fix: specify correct version constraints (Salim Afiune Maya)([5d0d1bc](https://github.com/lacework/terraform-azure-activity-log/commit/5d0d1bc6109e62e0f2b1a3e666fca12bf9a3cbd0))
## Other Changes
* chore: update variable descriptions (Salim Afiune Maya)([5a31b99](https://github.com/lacework/terraform-azure-activity-log/commit/5a31b99fbf1938e0d6915f4f50bdf5b66457c4c9))
* ci: update release notes generation (Salim Afiune Maya)([519085c](https://github.com/lacework/terraform-azure-activity-log/commit/519085c3299f9cdc3c02339c07efef1f391f59d7))
---
# v0.1.1

## Bug Fixes
* fix(variables): Updated default for prefix and identifier URI (Alan Nix)([38e6a74](https://github.com/lacework/terraform-azure-activity-log/commit/38e6a7449caf38d90f030a36443ce0b12c1c3ef1))
* fix: Added unique suffix for created resources (Alan Nix)([780b696](https://github.com/lacework/terraform-azure-activity-log/commit/780b696366d2426704ce8c47a0a40b2cf38bec9b))
## Other Changes
* chore: pinned version using pessimistic constraint (Alan Nix)([ae889d0](https://github.com/lacework/terraform-azure-activity-log/commit/ae889d0c75c50875a7a2879292419086e652ce8c))
* ci: fix scripts (Salim Afiune Maya)([36d9485](https://github.com/lacework/terraform-azure-activity-log/commit/36d9485d8cf40cbe2f4f6a1b61bbfd6b7c4bb211))
---
# v0.1.0

🎊 Initial commit
