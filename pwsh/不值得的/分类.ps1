#�����ļ��������˿���
$fullText = Get-Content '.\try.txt' | where { !([string]::IsNullOrWhiteSpace($_)) }
#Ѱ���ļ�ͷ��ʼ��־
$startFlagIndex = -1
For ($i = 0; $i -lt $fullText.Length; $i++) {
    if ($fullText[$i].Contains("~")) {
        $startFlagIndex = $i
        break
    }
 
}
#ȥ���ļ�ͷ
$fullText = $fullText | Select-Object -Skip ($startFlagIndex + 1)
 
<#
 #���ļ�ת����CSV��ʽ��Ȼ���ٴ�CSVת���ɶ���
 #�������ۺ���Ҫ����������ݴ��������÷ǳ�����
#>
$objs = $fullText | foreach {
    $tokens = $_.Split(' ', [StringSplitOptions]::RemoveEmptyEntries)
    '"{0}"' -f [string]::Join('","', $tokens)
} | ConvertFrom-Csv
 
#ͳ�Ʒ�����ֵ��Ϊ�յĶ���
Write-Host "ͳ�Ʒ�����ֵΪ�յĶ���"
$objs | where { $_.������ֵ -ne $null } | Format-Table -AutoSize
 
#�����е���ֵ�ĸ�����ƽ��ֵ���ܺͣ����ֵ����Сֵ
Write-Host "�����е���ֵ�ĸ�����ƽ��ֵ���ܺͣ����ֵ����Сֵ:"
$objs | Measure-Object -Property 'shit' -Average -Sum -Maximum -Minimum