# Changes to our configuration file

file_line {'No_password':
    ensure => 'present',
    path   => '/etc/ssh/ssh_config',
    line   => 'PasswordAuthentication no',
    match  => 'PasswordAuthentication yes',
}
file_line {'Key_file':
    ensure => 'present',
    path   => '/etc/ssh/ssh_config',
    line   => 'IdentityFile ~/.ssh/holberton',
}
