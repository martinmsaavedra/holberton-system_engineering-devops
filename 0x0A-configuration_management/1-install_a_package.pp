# Install puppet package

package { 'puppet-lint':
  provider => 'gem',
  ensure   => '2.1.1',
}
