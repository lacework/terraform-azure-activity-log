# v2.2.5

## Other Changes
* ci: update job name in test compat workflow (#111) (Timothy MacDonald)([4b8b55f](https://github.com/lacework/terraform-azure-activity-log/commit/4b8b55f487c8858daa2fb53c258ff7d530a40e97))
* ci: version bump to v2.2.5-dev (Lacework)([9d95a50](https://github.com/lacework/terraform-azure-activity-log/commit/9d95a5040947a1649eb0bd585d11ec62b2f7bf65))
---
# v2.2.4

## Bug Fixes
* fix: bugs when use existing storage account (#107) (Pengyuan Zhao)([cdbd2cb](https://github.com/lacework/terraform-azure-activity-log/commit/cdbd2cbb68968685d3806d67ca60508c686866ab))
## Other Changes
* ci: add workflows for codefresh migration (#108) (Timothy MacDonald)([de64a52](https://github.com/lacework/terraform-azure-activity-log/commit/de64a526f3649ff1204c88cbab117267eaf8cd9b))
* ci: add workflows for testing codefresh migration (#106) (Timothy MacDonald)([5c62e4b](https://github.com/lacework/terraform-azure-activity-log/commit/5c62e4bcf1014e95bc765e768b5302cb4c39c8d5))
* ci: version bump to v2.2.4-dev (Lacework)([6af5300](https://github.com/lacework/terraform-azure-activity-log/commit/6af530036db0499f9434efe7a9e25b380f84dc6e))
---
# v2.2.3

## Other Changes
* chore: fix local var module_name (#103) (Darren)([f887e96](https://github.com/lacework/terraform-azure-activity-log/commit/f887e961f302b2db2e6671fc8cdefdf38bc0843e))
* ci: version bump to v2.2.3-dev (Lacework)([01209a8](https://github.com/lacework/terraform-azure-activity-log/commit/01209a82e16419b0ab6596cb2a1bf6bfaa908100))
---
# v2.2.2

## Bug Fixes
* fix: lacework-global-534 (#100) (Darren)([ef88784](https://github.com/lacework/terraform-azure-activity-log/commit/ef88784f08fc14e45df5cfe49d95c575c8870c13))
## Other Changes
* ci: version bump to v2.2.2-dev (Lacework)([65b948a](https://github.com/lacework/terraform-azure-activity-log/commit/65b948a9a495d15815199c2ca653a5cfaa15a1c1))
---
# v2.2.1

## Bug Fixes
* fix: ignore resource group tags changes to avoid policy collisions (#97) (Pengyuan Zhao)([a272218](https://github.com/lacework/terraform-azure-activity-log/commit/a272218dcc53f20c3ee2628d0a74ae550a42542d))
## Other Changes
* ci: version bump to v2.2.1-dev (Lacework)([f9f643e](https://github.com/lacework/terraform-azure-activity-log/commit/f9f643ea19c63ddf2077564d19b7eaa5c50f047d))
---
# v2.2.0

## Features
* feat: use existing Diagnostic Settings (#96) (Pengyuan Zhao)([395823e](https://github.com/lacework/terraform-azure-activity-log/commit/395823ee90c1b69d5b195c8edf261304a06c30c2))
## Other Changes
* chore: add lacework_metric_module datasource (#98) (Darren)([701287d](https://github.com/lacework/terraform-azure-activity-log/commit/701287d4f3274858d1174e2c94a32b749d11e4eb))
* ci: version bump to v2.1.2-dev (Lacework)([8f4b3af](https://github.com/lacework/terraform-azure-activity-log/commit/8f4b3afb299be5e500c481cea8b0be6f202fa145))
---
# v2.1.1

## Bug Fixes
* fix: allow optional storage account network rules configuration' (#93) (Darren)([f424502](https://github.com/lacework/terraform-azure-activity-log/commit/f42450207a1d95010cb7c739fde189a40cee3c39))
## Documentation Updates
* docs: correct variable descriptions (#95) (Darren)([c060a5f](https://github.com/lacework/terraform-azure-activity-log/commit/c060a5f56eb864aa7a99e2f959b731e8a33a0f0b))
## Other Changes
* ci: version bump to v2.1.1-dev (Lacework)([2db2053](https://github.com/lacework/terraform-azure-activity-log/commit/2db20536b596bcb0ed1921efb91af54192252164))
---
# v2.1.0

## Features
* feat(infra-encryption): storage account infrastructure encryption support (#91) (Matt Cadorette)([5bc0748](https://github.com/lacework/terraform-azure-activity-log/commit/5bc074871767cc032d65f377635e3e6f42bab7bd))
## Refactor
* refactor: use `for_each instead of `count` (#86) (Salim Afiune)([e79cf34](https://github.com/lacework/terraform-azure-activity-log/commit/e79cf3450ca815bc624c957646782cf8b003939a))
## Documentation Updates
* docs(readme): add terraform docs automation  (#90) (Timothy MacDonald)([9597a2b](https://github.com/lacework/terraform-azure-activity-log/commit/9597a2b0665ed1cac3f351a5ad543c844f1f3100))
## Other Changes
* ci: version bump to v2.0.6-dev (Lacework)([f9eda03](https://github.com/lacework/terraform-azure-activity-log/commit/f9eda038316d214cabe8fbd559c8aa5fd6cb2201))
---
# v2.0.5

## Bug Fixes
* fix: Replace deprecated `log` blocks with `enabled_log` (#88) (Laurent Raufaste)([5b2d94a](https://github.com/lacework/terraform-azure-activity-log/commit/5b2d94aed35dbe5d78a708679c05853ec9aed35a))
## Other Changes
* ci: version bump to v2.0.5-dev (Lacework)([9be1685](https://github.com/lacework/terraform-azure-activity-log/commit/9be1685cbdeb4a4c28d722bd184f400cf185ef62))
---
# v2.0.4

## Bug Fixes
* fix: log_retention_days input variable (jon-stewart)([0efecfd](https://github.com/lacework/terraform-azure-activity-log/commit/0efecfd29a7de8dfe5e4400b8cc5858b6b5a56ef))
* fix: tfsec violations (jon-stewart)([a0021bf](https://github.com/lacework/terraform-azure-activity-log/commit/a0021bf6983b69bc7a8afb0fb6b866e603684e77))
## Other Changes
* ci: version bump to v2.0.4-dev (Lacework)([acf7be4](https://github.com/lacework/terraform-azure-activity-log/commit/acf7be428480f8fcc5ac5cb7a014592ba1bf84bb))
---
# v2.0.3

## Documentation Updates
* docs: add multiple examples (#78) (Salim Afiune)([b2eb554](https://github.com/lacework/terraform-azure-activity-log/commit/b2eb55476e9222882fa19c5d5d535da28073a765))
## Other Changes
* ci: version bump to v2.0.3-dev (Lacework)([849b02c](https://github.com/lacework/terraform-azure-activity-log/commit/849b02c60078f4cff42e321a40799d97b57a31e0))
---
# v2.0.2

## Bug Fixes
* fix(storage): turn off nested public permission (#76) (jympetalmd)([cba533c](https://github.com/lacework/terraform-azure-activity-log/commit/cba533c05b92496fd7551302ff9d75da9e9e40db))
## Other Changes
* ci: version bump to v2.0.2-dev (Lacework)([c896a7e](https://github.com/lacework/terraform-azure-activity-log/commit/c896a7e57966dd6475321a13c239235edd2fdaa1))
---
# v2.0.1

## Bug Fixes
* fix: add dependency to azurerm_monitor_diagnostic_setting resource (#72) (Salim Afiune)([f5846cd](https://github.com/lacework/terraform-azure-activity-log/commit/f5846cd58d125d2e202a51deb1f21ad6d3f731a9))
## Other Changes
* ci: version bump to v2.0.1-dev (Lacework)([94da791](https://github.com/lacework/terraform-azure-activity-log/commit/94da791facc941a895fb5f2b953e3fe047011a0e))
---
# v2.0.0

## Features
* feat: allow subscription exclusions when `all_subscriptions` is used (#69) (Alan Nix)([e80258f](https://github.com/lacework/terraform-azure-activity-log/commit/e80258f3a7de2906d226d1b00344b178e3c62279))
## Other Changes
* chore: updating `azurerm` to v3 (#68) (Alan Nix)([430e750](https://github.com/lacework/terraform-azure-activity-log/commit/430e750dc16e2bfcdb9069272697f977075c4e35))
* ci: version bump to v1.2.2-dev (Lacework)([44dea77](https://github.com/lacework/terraform-azure-activity-log/commit/44dea771a6336855feb7ba31b295a9a2e9083280))
---
# v1.2.1

## Documentation Updates
* docs: update Lacework provider version in readme (#66) (Darren)([e305a43](https://github.com/lacework/terraform-azure-activity-log/commit/e305a43ca734cea5f6bfccea5ab45c37fca891da))
## Other Changes
* chore: update Lacework provider version to v1 (#65) (Darren)([87983b1](https://github.com/lacework/terraform-azure-activity-log/commit/87983b12a4ae866db4b68e40f7e8145c01327ecd))
* ci: version bump to v1.2.1-dev (Lacework)([87f1f17](https://github.com/lacework/terraform-azure-activity-log/commit/87f1f170f75319bab24cae2fd41b1f403ac15d19))
---
# v1.2.0

## Features
* feat: deprecate support for Terraform 0.12 and 0.13 (#61) (Darren)([b780460](https://github.com/lacework/terraform-azure-activity-log/commit/b780460890d72cd16a637c0f9ef73d91e421e41d))
## Other Changes
* ci: version bump to v1.1.2-dev (Lacework)([d704528](https://github.com/lacework/terraform-azure-activity-log/commit/d704528bebc11b084afe818e7ef6dc53c1ebfabf))
---
# v1.1.1

## Bug Fixes
* fix: pull only enabled subscriptions (#59) (Andre Elizondo)([aac728d](https://github.com/lacework/terraform-azure-activity-log/commit/aac728d1c90a23caa8ca8ae6b250bd382aea678c))
## Other Changes
* chore: update location in variables.tf to match README.md definition (David McTavish)([aa4d166](https://github.com/lacework/terraform-azure-activity-log/commit/aa4d166d27d9372d319a860abc4a4a8b159b48f9))
* chore: update PR template (#57) (Darren)([fcc2b20](https://github.com/lacework/terraform-azure-activity-log/commit/fcc2b20cbf9b003b4f62b570cdc897f04c7ec852))
* ci: version bump to v1.1.1-dev (Lacework)([04c30fa](https://github.com/lacework/terraform-azure-activity-log/commit/04c30faa33bbc107dc1e63c5281a7f5140b7f35a))
---
# v1.1.0

## Features
* feat: create unique diagnostic setting (#54) (Salim Afiune)([ec2e514](https://github.com/lacework/terraform-azure-activity-log/commit/ec2e514f5ce5a956fd6dcab8dabb9e5ac9f8f05a))
## Other Changes
* chore: rename diagnostic_settings_name default name (#55) (Salim Afiune)([cec58a9](https://github.com/lacework/terraform-azure-activity-log/commit/cec58a99e3e1b1d665fd016e6012a84a9c5f6bb6))
* ci: version bump to v1.0.1-dev (Lacework)([b14ec3a](https://github.com/lacework/terraform-azure-activity-log/commit/b14ec3ab0fad2e4b091c5cb7d14c290d31c7e750))
---
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
