// Bir interrupt geldi�inde mevcut komutu �al��t�r�p normal program�n y�r�t�lmesini durdurmakt�r.
// Program adresi otomatik olarak adres y���n�na kaydedilir ve varsay�la program adresi program sayac�na yerle�tirilir.
// Program�n �al��maya ba�lad��� yere KESME RUT�N� denir.
// Kesme iste�i geldikten sonra y�r�t�lecek olan program par�as�na KESME RUT�N� denir.
// Kesme rutini i�ini yapt�ktan sonra RETFIE komutuna ula��r ve adres y���ndan ��kar�l�r, program kald��� yerden devam eder.
void interrupt(){    // kesme rutini oluyor ve burada kullan�c� taraf�ndan doldururuluyor.
cnt++;
}
void main() {

}