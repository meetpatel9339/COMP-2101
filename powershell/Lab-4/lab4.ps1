#  Bullet Point - 1
function get-cs {
	get-ciminstance win32_computersystem | select Description | format-list
}
get-cs

# Bullet Point - 2 
function get-os {
	get-ciminstance win32_operatingsystem | select Name,Version | format-list
}
get-os

# Bullet Point - 3
function get-processor {
	get-ciminstance win32_processor | select Description,NumberOfCores,MaxClockSpeed,L2CacheSize,L3CacheSize | format-list
}
get-processor

# Bullet Point - 4
function get-pmem {
	get-ciminstance win32_physicalmemory | select BankLabel,Description,DeviceLocator,Capacity,Manufacturer | format-table
}
get-pmem

# Bullet Point - 6 
function get-netconfig {
	get-ciminstance win32_networkadapterconfiguration | where {$_.IPEnabled -eq 'true'} | select Description,Index,IPAddress,IPSubnet,DNSDomain,DNSServerSearchOrder | ft
}
get-netconfig
