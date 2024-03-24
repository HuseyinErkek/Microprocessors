// Bir interrupt geldiðinde mevcut komutu çalýþtýrýp normal programýn yürütülmesini durdurmaktýr.
// Program adresi otomatik olarak adres yýðýnýna kaydedilir ve varsayýla program adresi program sayacýna yerleþtirilir.
// Programýn çalýþmaya baþladýðý yere KESME RUTÝNÝ denir.
// Kesme isteði geldikten sonra yürütülecek olan program parçasýna KESME RUTÝNÝ denir.
// Kesme rutini iþini yaptýktan sonra RETFIE komutuna ulaþýr ve adres yýðýndan çýkarýlýr, program kaldýðý yerden devam eder.
void interrupt(){    // kesme rutini oluyor ve burada kullanýcý tarafýndan doldururuluyor.
cnt++;
}
void main() {

}