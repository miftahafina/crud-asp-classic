<!DOCTYPE html>
<html>
<head>
  <title>Daftar Buku</title>
</head>
<body>

<h1>Daftar Buku</h1>

<!-- #include file="inc/navigasi.asp" -->
<!-- #include file="inc/koneksi.asp" -->

<%
conn.open

' Ambil data dari database
query = "select * from buku_tbl"
set data = conn.execute(query)

no_urut = 0
%>

<h3>Tabel Data Buku</h3>
<table border="1">
  <thead>
    <tr>
      <th>No.</th>
      <th>Judul</th>
      <th>Penulis</th>
      <th>Penerbit</th>
      <th>Tahun Terbit</th>
      <th>Kategori</th>
      <th>Aksi</th>
    </tr>
  </thead>
  <tbody>

    <%
      ' Menampilkan data dari database
      while not data.eof

      no_urut = no_urut + 1
    %>
    <tr>
      <td><% =no_urut %></td>
      <td><% =data("judul") %></td>
      <td><% =data("penulis") %></td>
      <td><% =data("penerbit") %></td>
      <td><% =data("tahun") %></td>
      <td><% =data("kategori") %></td>
      <td>
        <a href="lihat-buku.asp?id=<% =data("id") %>">Lihat</a> | 
        <a href="ubah-buku.asp?id=<% =data("id") %>">Ubah</a> | 
        <a href="hapus-buku.asp?id=<% =data("id") %>" onclick="return confirm('Yakin hapus buku <% =data("judul") %>?')">Hapus</a>
      </td>
    </tr>
    <%
    data.movenext
    wend

    conn.close
    %>

  </tbody>
</table>

<!-- #include file="inc/footer.asp" -->

</body>
</html>