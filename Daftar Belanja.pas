program Daftar_Belanja;

uses crt, SysUtils;

//Pembuatan Tipe data record untuk data barang
type
    TBarang = record
        nama: string[50];
        harga: longint;
        jumlah: longint;
    end;

//Pembuatan variabel global
var
    sektor: integer;
    daftarBelanja: array of TBarang;
    daftarBarang: array[1..4, 1..5] of TBarang;
    pilihan, i: integer;
    jumlah, totalHarga, totalJumlah: longint;
    lanjut, lanjutSektor, lanjutBarang: char;

// Fungsi untuk mendapatkan daftar barang berdasarkan sektor
function GetDaftarBarang(sektor: integer): string;
var
    daftar: string;
    i: integer;
begin
    daftar := '';
    case sektor of
        1: daftar := 'Sektor 1: Buah'#13#10;
        2: daftar := 'Sektor 2: Sayur'#13#10;
        3: daftar := 'Sektor 3: Cemilan'#13#10;
        4: daftar := 'Sektor 4: Hygiene'#13#10;
    end;
    for i := 1 to 5 do
        daftar := daftar + IntToStr(i) + '. ' + daftarBarang[sektor, i].nama + ' - Rp ' + IntToStr(daftarBarang[sektor, i].harga) + #13#10;
    GetDaftarBarang := daftar;
end;

// Fungsi untuk menghitung total harga barang belanjaan
function HitungTotalHarga: longint;
var
    i: integer;
    total: longint;
begin
    total := 0;
    for i := 0 to High(daftarBelanja) do
    begin
        total := total + (daftarBelanja[i].harga * daftarBelanja[i].jumlah);
    end;
    HitungTotalHarga := total;
end;

// Prosedur untuk menampilkan daftar belanja
procedure TampilkanBelanjaan;
begin
    writeln('--------------------------------------------');
    writeln('Daftar Belanjaan Anda:');
    writeln('--------------------------------------------');
    totalHarga := 0;
    totalJumlah := 0;
    for i := 0 to High(daftarBelanja) do
    begin
        with daftarBelanja[i] do
        begin
            writeln(i + 1, '. ', nama, ' - ', jumlah, ' pcs - Rp ', harga * jumlah);
            totalHarga := totalHarga + (harga * jumlah);
            totalJumlah := totalJumlah + jumlah;
        end;
    end;
    writeln('--------------------------------------------');
    writeln('Total Barang Dibeli: ', totalJumlah, ' pcs');
    writeln('Total Harga: Rp ', totalHarga);
    writeln('--------------------------------------------');
end;

begin
    clrscr;

    // Inisialisasi barang per sektor
    daftarBarang[1, 1].nama := 'Pisang'; daftarBarang[1, 1].harga := 20000;
    daftarBarang[1, 2].nama := 'Semangka'; daftarBarang[1, 2].harga := 25000;
    daftarBarang[1, 3].nama := 'Rambutan'; daftarBarang[1, 3].harga := 15000;
    daftarBarang[1, 4].nama := 'Jeruk'; daftarBarang[1, 4].harga := 10000;
    daftarBarang[1, 5].nama := 'Mangga'; daftarBarang[1, 5].harga := 20000;

    daftarBarang[2, 1].nama := 'Bayam'; daftarBarang[2, 1].harga := 7000;
    daftarBarang[2, 2].nama := 'Sawi Hijau'; daftarBarang[2, 2].harga := 8000;
    daftarBarang[2, 3].nama := 'Buncis'; daftarBarang[2, 3].harga := 8000;
    daftarBarang[2, 4].nama := 'Wortel'; daftarBarang[2, 4].harga := 9000;
    daftarBarang[2, 5].nama := 'Mentimun'; daftarBarang[2, 5].harga := 10000;

    daftarBarang[3, 1].nama := 'Es Krim'; daftarBarang[3, 1].harga := 5000;
    daftarBarang[3, 2].nama := 'Yoghurt'; daftarBarang[3, 2].harga := 8000;
    daftarBarang[3, 3].nama := 'Minuman'; daftarBarang[3, 3].harga := 6000;
    daftarBarang[3, 4].nama := 'Cokelat'; daftarBarang[3, 4].harga := 12000;
    daftarBarang[3, 5].nama := 'Popcorn'; daftarBarang[3, 5].harga := 15000;

    daftarBarang[4, 1].nama := 'Shampoo'; daftarBarang[4, 1].harga := 18000;
    daftarBarang[4, 2].nama := 'Sabun'; daftarBarang[4, 2].harga := 15000;
    daftarBarang[4, 3].nama := 'Pasta Gigi'; daftarBarang[4, 3].harga := 10000;
    daftarBarang[4, 4].nama := 'Sikat Gigi'; daftarBarang[4, 4].harga := 10000;
    daftarBarang[4, 5].nama := 'Deodorant'; daftarBarang[4, 5].harga := 20000;

    // Memulai proses belanja
    repeat
        clrscr;
        writeln('Pilih Sektor Belanja:');
        writeln('1. Buah');
        writeln('2. Sayur');
        writeln('3. Cemilan');
        writeln('4. Hygiene');
        writeln;
        write('Masukkan nomor sektor: ');
        readln(sektor);
        //Permisalan untuk pilihan sektor
        if (sektor >= 1) and (sektor <= 4) then
        begin
            repeat
                clrscr;
                writeln(GetDaftarBarang(sektor));
                writeln;
                write('Masukkan nomor barang yang ingin dibeli: ');
                readln(pilihan);

                if (pilihan >= 1) and (pilihan <= 5) then
                begin
                    write('Masukkan jumlah barang yang ingin dibeli: ');
                    readln(jumlah);

                    if jumlah > 0 then
                    begin
                        // Menyimpan barang yang dibeli ke array daftarBelanja
                        SetLength(daftarBelanja, Length(daftarBelanja) + 1);
                        daftarBelanja[High(daftarBelanja)] := daftarBarang[sektor, pilihan];
                        daftarBelanja[High(daftarBelanja)].jumlah := jumlah;

                        writeln('Barang berhasil ditambahkan ke daftar belanja.');
                    end
                    else
                        writeln('Jumlah barang harus lebih dari 0.');
                end
                else
                    writeln('Nomor barang tidak valid.');

                writeln;
                write('Apakah Anda ingin membeli barang lain dari sektor ini? (Y/N): ');
                readln(lanjutBarang);
            until (lanjutBarang = 'N') or (lanjutBarang = 'n');
        end
        else
            writeln('Nomor sektor tidak valid.');

        writeln;
        write('Apakah Anda ingin belanja di sektor lain? (Y/N): ');
        readln(lanjutSektor);
    until (lanjutSektor = 'N') or (lanjutSektor = 'n');

    // Menampilkan daftar belanjaan
    clrscr;
    if Length(daftarBelanja) > 0 then
    begin
        TampilkanBelanjaan;
        writeln('Total Harga (dari fungsi): Rp ', HitungTotalHarga);
    end
    else
        writeln('Anda tidak membeli apa pun.');

    writeln('Terima kasih telah berbelanja!');
    readln;
end.
