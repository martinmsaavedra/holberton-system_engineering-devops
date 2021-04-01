# Install puppet package

package { 'puppet_lint':
  name     => 'puppet-lint',
  provider => 'gem',
  ensure   => '2.1.1',
}
