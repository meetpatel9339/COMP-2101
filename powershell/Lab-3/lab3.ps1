# lab 3 - Network related information
 
get-ciminstance win32_networkadapterconfiguration | where {$_.IPEnabled -eq 'true'} | select Description,Index,IPAddress,IPSubnet,DNSDomain | ft