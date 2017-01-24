<!DOCTYPE html>
<html>
<head>
  <title>Lihat Buku</title>
</head>
<body>

<h1>Lihat Buku</h1>

<!-- #include file="inc/navigasi.asp" -->
<!-- #include file="inc/koneksi.asp" -->

<%
conn.open

' Ambil data dari url
id = request.querystring("id")

' Ambil data dari database
query = "select * from buku_tbl where id = " & id
set data = conn.execute(query)
%>

<article>
  <h3><% =data("judul") %></h3>

  <p><% =data("resensi") %></p>

  <small>
    Buku dengan kategori <% =data("kategori") %> ini ditulis oleh <% =data("penulis") %> <br>
    Diterbitkan oleh <% =data("penerbit") %> pada tahun <% =data("tahun") %>
  </small>
</article>

<br>

<button type="button" onclick="history.go(-1)">Kembali</button>

<small>
  <a href="ubah-buku.asp?id=<% =data("id") %>">Ubah Data</a>
</small>

<% conn.close %>

<!-- #include file="inc/footer.asp" -->

</body>
</html>