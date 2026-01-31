param(
    [Parameter(Mandatory=$true)]
    [string]$prefix,

    [Parameter(Mandatory=$true)]
    [string]$dns
)

for ($i = 1; $i -le 254; $i++) {
    $ip = "$prefix.$i"
    try {
        $results = Resolve-DnsName -DnsOnly $ip -Server $dns -ErrorAction Ignore

        $ptr = $results | Where-Object {$_.QueryType -eq "PTR"}

        if ($ptr) {
            "{0} {1}" -f $ip, $ptr.NameHost
        }

    } catch {
        continue
    }
}