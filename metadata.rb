name 'orchestrator'
maintainer 'Silvia Botros'
maintainer_email 'silvia.botros@sendgrid.com'
license 'All rights reserved'
description 'Installs/Configures chef-orchestrator'
long_description 'Installs/Configures chef-orchestrator'
version IO.read(File.join(File.dirname(__FILE__), 'version_wf'))

depends 'yum'
depends 'packagecloud'
depends 'database', '~> 2.0'
depends 'percona', '~> 0.15.0'

supports 'centos'
supports 'ubuntu'
