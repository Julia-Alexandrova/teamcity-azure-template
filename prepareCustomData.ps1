param (
    [string]$cloudConfigFile = 'cloud-config.yaml'
)

if (!(Test-Path $cloudConfigFile)) {
    Write-Host "Cloud config file '$cloudConfigFile' is not accessible"
    exit 1
}

$replacementTokens = @{
    '\u0027' = "'";
    '\u003e' = '>';
    "%RDSHost%" = "',variables('dbServerName'),'";
    "%RDSPassword%" = "',parameters('databasePassword'),'";
    "%RDSDataBase%" = "',variables('dbName'),'";
    "%StorageAccount%" = "',variables('storageAccountName'),'";
    "%StorageKey%" = "',listKeys(variables('storageAccountName'), '2017-10-01').keys[0].value,'";
    "%FileShare%" = "',variables('storageFileShare'),'";
}

$content = Get-Content -Path $cloudConfigFile -Raw
$json = ConvertTo-Json $content.replace("'", "''")
$json = $json.substring(1, $json.length - 2)

Foreach ($key in $replacementTokens.keys) {
    $json = $json.replace($key, $replacementTokens.Item($key))
}

Write-Host "[base64(concat('$json'))]"