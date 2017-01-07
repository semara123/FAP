{sekadar profil aja ini adalah sebuah aplikasi sederhana dan saya masukkan dalam deltaproject yang berarti project iseng saya :D
* Profil Aplikasi
* 	Nama : FAP (Fast in Any Pressure)
* 	Versi: 1
* 	Revisi: 12
* 	Project Name : DeltaProject
* 	CodeName : Poci
}

uses unix,crt;
var p:string;
s,t,u,v:longint;
letak:integer=0;

procedure hentikan;
begin
	writeln('Terima Kasih telah menggunakan FAP');
	writeln('Beritahu jika anda menemukan BUG di Github');
	Writeln('Menghentikan FAP....');
	halt(1);
end;

procedure header;
begin
fpsystem('clear');
textbackground(blue);
fpsystem('clear');
textcolor(red);
writeln('                               |  ___/ \  |  _ \') ;
writeln('                               | |_ / _ \ | |_) |');
writeln('                               |  _/ ___ \|  __/ ');
writeln('                               |_|/_/   \_\_|');    
textcolor(white);
writeln('                              Fast in Any Pressure');
writeln('                                  Version : 1');
writeln('                                  Revision: 12');
writeln;
writeln;
end;

procedure ketiga;
begin
//xrandr --output VGA --auto
writeln('Konfigurasi monitor...');
writeln('Menjalankan perintah xrandr');
s:=fpsystem(' xrandr --output VGA-1 --off');
if (s=0) then begin
	writeln('Telah dikembalikan');
	write('Ketik pilihan anda: ');
end else begin
	writeln('Ada sedikit masalah saat mengembalikan');
	write('Ketik pilihan anda: ');
	end;
end;

procedure distribusi;
begin
letak:=2;
textcolor(white);
writeln('Menampilkan Info Distribusi Linux Anda');
fpsystem('lsb_release -a');
writeln;
writeln('Kembali Ke Menu Utama [Y/N]');
end;

procedure utama;
begin
header;
letak:=0;
textcolor(white);
writeln('Selamat Datang di FAP silahkan pilih menunya :v :');
writeln('[1] Install App Penting');
writeln('[2] Konek ke Proyektor');
writeln('[3] Diskonek Proyektor');
writeln('[4] Linux Distribution Info');
writeln('[5] Keluar dari app');
writeln;
write('Ketik pilihan anda : '); textcolor(red);
//detektor;
//pilih2;
end;

procedure pertama;
begin
header;
letak:=1;
textcolor(white);
writeln('Daftar Aplikasi Rekomendasi Untuk Diinstall :D :');
writeln('[1] Build-essentials');
writeln('[2] Modem Manager GUI');
writeln('[3] perekam desktop GTK-RecordMyDesktop');
writeln('[4] Geany(C++ Development)');
writeln('[5] fpc(Pascal Development)');
writeln('[6] Wine(Run Windows App)');
writeln('[7] PlayOnLinux');
writeln('[8] Kembali Ke Menu Utama');
writeln;
//writeln('This Proccess Will Use Changed Repository From Your Default Repository, so please dont close FAP before the proccess finish and make sure you have good internet connection');
write('What Is Your Choice: ');
//fpsystem('reset');
letak:=1;
//readln(p);
end;

procedure kedua;
begin
//xrandr --output VGA --auto
writeln('Konfigurasi monitor...');
writeln('Menjalankan perintah xrandr');
s:=fpsystem('xrandr --output VGA-1 --auto');
s:=fpsystem('xrandr --output VGA --mode 1024x768 --same-as DVI --output DVI --mode 1024x768');
write('Ketik pilihan anda: ');
end;

procedure pilih;
begin
//textcolor(blue);
while(not eof) do
begin
readln(p);
textcolor(white);
if (letak = 0) then begin
case p of 
'1' : pertama;
'2' : kedua;
'3' : ketiga;
'4' : distribusi;
'5' : hentikan;
else textcolor(white); write('Tentukan Pilihan Anda : '); textcolor(white); end;  end
else if(letak=1) and (t<>0) then begin
writeln('No Internet Connection This Service Cant be Used.'); write('What Is Your Choice: ');
end else if(letak = 1) and (t=0)then begin
case p of 
'1' : fpsystem('sudo apt-get install build-essential');
'2' : fpsystem('sudo apt-get install modem-manager-gui');
'3' : fpsystem('sudo apt-get install recordmydesktop');
'4' : fpsystem('sudo apt-get install geany');
'5' : fpsystem('sudo apt-get install fpc'); 
'6' : fpsystem('sudo apt-get install wine');
'7' : fpsystem('sudo apt-get install playonlinux');
'8' : utama;
else write('Tentukan Pilihan Anda : '); textcolor(white); end; end 
else if(letak=2) then begin
case p of 
'Y' : utama;
'y' : utama;
'N' : hentikan;
'n' : hentikan;
end; end else write('Tentukan Pilihan Anda : '); textcolor(white); 
end;
end;

procedure pengenalan;
begin
	writeln;
	writeln;
	textcolor(red);
	writeln('                          Selamat Datang di FAP');
	textcolor(white);
	writeln('FAP merupakan aplikasi yang dibuat menggunakan bahasa pascal sederhana dan ditujukan untuk pengguna linux dengan based debian :D');
	writeln('Jika anda menginginkan source code anda bisa mengunduhnya');writeln('di akun github semara123');
	writeln('Fitur FAP masih dalam tahap BETA alias belum sempurna ini disebabkan karena kemampuan saya dalam programming masih jelek :v jadi saya membuat aplikasi ini sebenarnya karena iseng');
	writeln('Semoga project ini bisa bermanfaat bagi anda');
	writeln;
	writeln;
	textcolor(green);
	write('Tekan apa saja Untuk Lanjut... ');
	readkey;
end;


begin
{header checker AWAL}
textcolor(black);
	t:=fpsystem('ping google.com'); //responsnya 512 berarti gk konek
	u:=fpsystem('dpkg');
	fpsystem('reset');
textcolor(white);
if(t=0) then begin
writeln('[OK]Internet Connection');
end else begin writeln('[ERROR]No Internet Connection'); end;
if(u=512) then begin
writeln('[OK]Debian Based Linux OS');
end else begin writeln('[ERROR]Not Debian Based OS'); writeln('Aborting...'); halt(1); end;

pengenalan; // membuka fitur intro sebagai pengenalan :v
{header checker AKHIR}
	fpsystem('reset');
	fpsystem('clear');
	textcolor(red);
	utama;
	pilih;
end.
