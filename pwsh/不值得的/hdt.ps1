# ����ģʽ: ��Tab�ָ�������ַ���
$name = 'C:\Users\I_Rin\Desktop\try'
$pattern = "^(?<process>.*)\s*pid:(?<pid>.*)\s*type"#�����ŵı���ǰ���һ���ʺű������µĶ���ͬʱ����ԭ���Ƿ�Ϊ�����ַ����õ���(.*)���Ծͻ�������
# ����һ����Tab�ָ���ַ���
# ʹ��������ʽƥ��:
handle.exe $name -nobanner | where { $_ -match $pattern } | foreach { if ($Matches.process -ne 'explorer.exe       ') { Stop-Process $Matches.pid } }
# Stop-Process  $Matches.pid;}
#���Էǳ��ɹ������У��������ǰ����ĳɺ�������ʽ

#���Ҫ�Ӹ���ʾ���Ƿ�ɾ�����ļ��У�


