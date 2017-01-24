<!DOCTYPE html>
<html>
<head>
  <title>Tambah Buku</title>
</head>
<body>

<h1>Tambah Buku</h1>

<!-- #include file="inc/navigasi.asp" -->
<!-- #include file="inc/koneksi.asp" -->

<%
conn.open

' Ambil data dari form
judul    = request.form("judul")
resensi  = request.form("resensi")
penulis  = request.form("penulis")
penerbit = request.form("penerbit")
tahun    = request.form("tahun")
kategori = request.form("kategori")

' Pastikan form terisi
if judul <> "" and resensi <> "" and penulis <> "" and penerbit <> "" and tahun <> "" and kategori <> "" then

  'Tambahkan data ke database
  query = "insert into buku_tbl (judul, resensi, penulis, penerbit, tahun, kategori) values ('" & judul & "', '" & resensi & "', '" & penulis & "', '" & penerbit & "', '" & tahun & "', '" & kategori & "')"
  set data = conn.execute(query)

end if

%>

<h3>Form Tambah Data Buku</h3>
<form method="post" action="tambah-buku.asp">
  <label>Judul Buku:</label>
  <input type="text" name="judul" required> <br><br>

  <label>Resensi</label>
  <textarea name="resensi" rows="4" cols="70" required></textarea> <br><br>

  <label>Penulis:</label>
  <input type="text" name="penulis" required> <br><br>

  <label>Penerbit:</label>
  <input type="text" name="penerbit" required> <br><br>

  <label>Tahun Terbit:</label>
  <input type="number" name="tahun" required> <br><br>

  <label>Kategori:</label>
  <select name="kategori" required>
    <option value="">- pilih -</option>
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
  <button type="submit">Tambahkan</button>
</form>

<!-- #include file="inc/footer.asp" -->

</body>
</html>