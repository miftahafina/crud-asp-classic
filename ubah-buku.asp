<!DOCTYPE html>
<html>
<head>
  <title>Ubah Buku</title>
</head>
<body>

<h1>Ubah Buku</h1>

<!-- #include file="inc/navigasi.asp" -->
<!-- #include file="inc/koneksi.asp" -->

<%
conn.open

' Ambil data dari url
id = request.querystring("id")

' Ambil data dari form
judul    = request.form("judul")
resensi  = request.form("resensi")
penulis  = request.form("penulis")
penerbit = request.form("penerbit")
tahun    = request.form("tahun")
kategori = request.form("kategori")

' Ambil data dari database
query = "select * from buku_tbl where id = " & id
set data = conn.execute(query)

' Pastikan form terisi
if judul <> "" and resensi <> "" and penulis <> "" and penerbit <> "" and tahun <> "" and kategori <> "" then

  'Perbaharui data di database
  query_update = "update buku_tbl set judul = '" & judul & "', resensi = '" & resensi & "', penulis = '" & penulis & "', penerbit = '" & penerbit & "', tahun = '" & tahun & "', kategori = '" & kategori & "' where id = " & id
  set update = conn.execute(query_update)

end if
%>

<h3>Form Ubah Data Buku</h3>
<form method="post" action="ubah-buku.asp?id=<% =data("id") %>">
  <label>Judul Buku:</label>
  <input type="text" name="judul" value="<% =data("judul") %>" required> <br><br>

  <label>Resensi</label>
  <textarea name="resensi" rows="4" cols="70" required><% =data("resensi") %></textarea> <br><br>

  <label>Penulis:</label>
  <input type="text" name="penulis" value="<% =data("penulis") %>" required> <br><br>

  <label>Penerbit:</label>
  <input type="text" name="penerbit" value="<% =data("penerbit") %>" required> <br><br>

  <label>Tahun Terbit:</label>
  <input type="number" name="tahun" value="<% =data("tahun") %>" required> <br><br>

  <label>Kategori:</label>
  <select name="kategori" required>
    <option value="<% =data("kategori") %>"><% =data("kategori") %></option>
    <option value="Antologi">Antologi</option>
    <option value="Atlas">Atlas</option>
    <option value="Biografi">Biografi</option>
    <option value="Cergam">Cergam</option>
    <option value="Dongeng">Dongeng</option>
    <option value="Ensiklopedi">Ensiklopedi</option>
    <option value="Fotografi">Fotografi</option>
    <option value="Ilmiah">Ilmiah</option>
    <option value="Kamus">Kamus</option>
    <option value="Karya Ilmiah">Ilmiah</option>
    <option value="Komik">Komik</option>
    <option value="Novel">Novel</option>
    <option value="Tafsir">Tafsir</option>
    <option value="Teks">Teks</option>
    <option value="Tutorial">Tutorial</option>
    <option value="Lainnya">Lainnya...</option>
  </select> <br><br>

  <button type="button" onclick="history.go(-1)">Batal</button>
  <button type="submit">Perbaharui</button>
</form>

<!-- #include file="inc/footer.asp" -->

</body>
</html>