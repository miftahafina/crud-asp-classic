<% 
' Koneksi ke database
set conn = createObject("ADODB.connection")
set cmd = createObject("ADODB.command")
set rs = createObject("ADODB.recordSet")

conn.connectionString = "Provider=SQLOLEDB; Data Source=(local); Database=buku_db; User ID=miftahafina; password=123"
%>