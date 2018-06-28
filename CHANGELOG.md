# orchestrator

## 2.1.0
* use build-essential to install gcc,make, etc
* rubocop (.rubocop.yml added and files corrected)
* use generic centos-6 VM to test on, not internal sendgrid images
* alphabetize attributes
* replace ruby_block with file resource with sensitive
* add `Debian 8` support
* add `Centos 7` support
* add `travis-ci` config, Gemfile, etc
* allow for orchestrator package source/checksum to be defined and overridden
* replace `minitest` with `inspec`x

## 2.0.2
Orchestrator has officially moved to Github

## 2.0.1
Fix spelling mistake in ListenAddress

## 2.0.0
Move to a single hash for all config values
Use ruby to create the config from the hash

## 1.5.0
Install orchestrator using package cloud repo (Thanks Shlomi for setting that up)
Remove spec tests. Sticking with minitests only
Update the kitchen platforms because it isn't 2012 anymore

## 1.4.1
Add new config attribute for HostnameResolveMethod

## 1.4.0
Add a new CLI only recipe installation
Set some version constraints to the upstream dependencies
Use supermarket for the cookbook API

## 1.3.3
Add ReaadOnly to the config template

## 1.3.2
Set a default auth method and actually set a default user and password
Add the auth method to the config template

## 1.3.1
GA release 1.2.10 is the default version now
Set Orchestrator to read only by default
Use local template variables in the config file 
Moved the minitest file location to match more recent versions of chef-minitest

## 1.3.0
Refactored installation into a package recipe
Made the version an attribute
Use the service resource to manage Orchestrator (Thanks Shlomi for adding the init script)

## 1.2.0
Added minitests

## 1.1.1
Chefspec passes and 100% coverage

## 1.1.0
Added Chefspec tests

## 1.0.0
First real release. Now converged for both centos and Ubuntu

## 0.1.0

Initial release of chef-orchestrator

* Enhancements
  * an enhancement

* Bug Fixes
  * a bug fix
