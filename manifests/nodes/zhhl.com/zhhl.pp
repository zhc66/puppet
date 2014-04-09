node 'puppetnode1.zhhl.com' {
  $environment = 'dev'
  $developer_machine = true
  $configure_ipaddress = '192.168.1.81'
  #require soe
  require ntp
}

node 'puppetnode2.zhhl.com' {
  $environment = 'dev'
  $developer_machine = true
  $configure_ipaddress = '192.168.1.82'
  require soe
}


node 'puppetnode3.zhhl.com' {
  $environment = 'dev'
  $developer_machine = true
  $configure_ipaddress = '192.168.1.83'
  require soe
}
