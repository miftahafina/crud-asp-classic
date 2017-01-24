<!-- #include file="inc/koneksi.asp" -->

<%
conn.open

' Ambil data dari url
id = request.querystring("id")

' Hapus data dari database
query = "delete from buku_tbl where id = " & id
set data = conn.execute(query)

' Kembali ke halaman daftar buku
response.redirect "daftar-buku.asp"
%>