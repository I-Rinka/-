function Stop-FolderHandle {
    param($name = 0)
    if ($name -eq 0) {
        "������Ŀǰ�޷���ɾ�����ļ��е�����
        �磺
        Stop-FolderHandle C:\Users\I_Rin\Desktop\try
        "
    }
    else {
        $pattern = "^(?<name>.*)\s*pid:(?<pid>.*)\s*type"
        handle64.exe $name -nobanner | Where-Object { $_ -match $pattern } | 
        ForEach-Object {
            if ($Matches.name -ne "explorer.exe       ") {
                Stop-Process $Matches.pid
            } 
        }
        do { $myInput = (Read-Host 'Remove Folder? (Y/N)').ToLower() } while ($myInput -notin @('y', 'n'))
        if ($myInput -eq 'y') {
            # 'branch for yes'
            Remove-Item $name -Force -Recurse
        }
        else {
            # 'branch for no'
        }
    }
}
function Get-FolderHandle {
    param($name = 0)
    if ($name -eq 0) {
        "������Ŀǰ�޷���ɾ�����ļ��е�����
        �磺
        Get-FolderHandle C:\Users\I_Rin\Desktop\try
        "
    }
    else {
        handle64.exe $name -nobann
    }
}