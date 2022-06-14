Content-Type: multipart/mixed; boundary="===============1708027359997908125=="
MIME-Version: 1.0
From: jim.cromie@gmail.com
Subject: Re: [jimc:ddn3h 20/23] lib/dynamic_debug.c:636 param_set_dyndbg_class_strings() warn: variable dereferenced before check 'dcp' (see line 630)
Date: Tue, 14 Jun 2022 12:06:14 -0600
Message-ID: <CAJfuBxz105SF6TDaMjChrWt2sCZbwquk8Y1mgC_edHdJxvVFiw@mail.gmail.com>
In-Reply-To: <202206142148.900MvDQ7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1708027359997908125==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 14, 2022 at 7:37 AM Dan Carpenter <dan.carpenter@oracle.com>
wrote:

> tree:   https://github.com/jimc/linux.git  ddn3h
> head:   4ec4d6e7cc8be5dbb9fc98fa7d186eb3c92279f6
> commit: a989dd267981b06281b4d068bc5b1cf34fd24932 [20/23] dyndbg: support
> symbolic class-names in class_bitmap
> config: parisc-randconfig-m031-20220613 (
> https://download.01.org/0day-ci/archive/20220614/202206142148.900MvDQ7-lk=
p(a)intel.com/config
> )
> compiler: hppa-linux-gcc (GCC) 11.3.0
>
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> smatch warnings:
> lib/dynamic_debug.c:636 param_set_dyndbg_class_strings() warn: variable
> dereferenced before check 'dcp' (see line 630)
>
> vim +/dcp +636 lib/dynamic_debug.c
>
> a989dd267981b0 Jim Cromie 2022-04-06  627  static int
> param_set_dyndbg_class_strings(const char *instr, const struct kernel_par=
am
> *kp)
> a989dd267981b0 Jim Cromie 2022-04-06  628  {
> a989dd267981b0 Jim Cromie 2022-04-06  629       const struct
> ddebug_classes_bitmap_param *dcp =3D kp->arg;
> a989dd267981b0 Jim Cromie 2022-04-06 @630       const struct
> ddebug_classes_map *map =3D dcp->map;
>
>              ^^^^^^^^
> Dereference
>
> a989dd267981b0 Jim Cromie 2022-04-06  631       unsigned long inbits;
> a989dd267981b0 Jim Cromie 2022-04-06  632       int idx_rc, totct =3D 0;
> a989dd267981b0 Jim Cromie 2022-04-06  633       bool wanted;
> a989dd267981b0 Jim Cromie 2022-04-06  634       char *cls, *p;
> a989dd267981b0 Jim Cromie 2022-04-06  635
> a989dd267981b0 Jim Cromie 2022-04-06 @636       if (!dcp || !dcp->map) {
>                                                     ^^^^
> Check for NULL too late.
>
>

yes, I moved deref up wo cleanup.
I think I got distracted by the "is deref safe here ?"
I guess YES, IFF the right kp is there. which the macros do.

thanks


> a989dd267981b0 Jim Cromie 2022-04-06  637
>  pr_err("set_dyndbg_classes: no bits=3D>queries map\n");
> a989dd267981b0 Jim Cromie 2022-04-06  638               return -EINVAL;
> a989dd267981b0 Jim Cromie 2022-04-06  639       }
> a989dd267981b0 Jim Cromie 2022-04-06  640
>
> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp
> _______________________________________________
> kbuild mailing list -- kbuild(a)lists.01.org
> To unsubscribe send an email to kbuild-leave(a)lists.01.org
>
>

--===============1708027359997908125==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGJyPjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIFR1ZSwgSnVu
IDE0LCAyMDIyIGF0IDc6MzcgQU0gRGFuIENhcnBlbnRlciAmbHQ7PGEgaHJlZj0ibWFpbHRvOmRh
bi5jYXJwZW50ZXJAb3JhY2xlLmNvbSI+ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPC9hPiZndDsg
d3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1h
cmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQs
MjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij50cmVlOsKgIMKgPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIu
Y29tL2ppbWMvbGludXguZ2l0IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRw
czovL2dpdGh1Yi5jb20vamltYy9saW51eC5naXQ8L2E+wqAgZGRuM2g8YnI+CmhlYWQ6wqAgwqA0
ZWM0ZDZlN2NjOGJlNWRiYjlmYzk4ZmE3ZDE4NmViM2M5MjI3OWY2PGJyPgpjb21taXQ6IGE5ODlk
ZDI2Nzk4MWIwNjI4MWI0ZDA2OGJjNWIxY2YzNGZkMjQ5MzIgWzIwLzIzXSBkeW5kYmc6IHN1cHBv
cnQgc3ltYm9saWMgY2xhc3MtbmFtZXMgaW4gY2xhc3NfYml0bWFwPGJyPgpjb25maWc6IHBhcmlz
Yy1yYW5kY29uZmlnLW0wMzEtMjAyMjA2MTMgKDxhIGhyZWY9Imh0dHBzOi8vZG93bmxvYWQuMDEu
b3JnLzBkYXktY2kvYXJjaGl2ZS8yMDIyMDYxNC8yMDIyMDYxNDIxNDguOTAwTXZEUTctbGtwQGlu
dGVsLmNvbS9jb25maWciIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8v
ZG93bmxvYWQuMDEub3JnLzBkYXktY2kvYXJjaGl2ZS8yMDIyMDYxNC8yMDIyMDYxNDIxNDguOTAw
TXZEUTctbGtwQGludGVsLmNvbS9jb25maWc8L2E+ICk8YnI+CmNvbXBpbGVyOiBocHBhLWxpbnV4
LWdjYyAoR0NDKSAxMS4zLjA8YnI+Cjxicj4KSWYgeW91IGZpeCB0aGUgaXNzdWUsIGtpbmRseSBh
ZGQgZm9sbG93aW5nIHRhZyB3aGVyZSBhcHBsaWNhYmxlPGJyPgpSZXBvcnRlZC1ieToga2VybmVs
IHRlc3Qgcm9ib3QgJmx0OzxhIGhyZWY9Im1haWx0bzpsa3BAaW50ZWwuY29tIiB0YXJnZXQ9Il9i
bGFuayI+bGtwQGludGVsLmNvbTwvYT4mZ3Q7PGJyPgpSZXBvcnRlZC1ieTogRGFuIENhcnBlbnRl
ciAmbHQ7PGEgaHJlZj0ibWFpbHRvOmRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbSIgdGFyZ2V0PSJf
YmxhbmsiPmRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbTwvYT4mZ3Q7PGJyPgo8YnI+CnNtYXRjaCB3
YXJuaW5nczo8YnI+CmxpYi9keW5hbWljX2RlYnVnLmM6NjM2IHBhcmFtX3NldF9keW5kYmdfY2xh
c3Nfc3RyaW5ncygpIHdhcm46IHZhcmlhYmxlIGRlcmVmZXJlbmNlZCBiZWZvcmUgY2hlY2sgJiMz
OTtkY3AmIzM5OyAoc2VlIGxpbmUgNjMwKTxicj4KPGJyPgp2aW0gKy9kY3AgKzYzNiBsaWIvZHlu
YW1pY19kZWJ1Zy5jPGJyPgo8YnI+CmE5ODlkZDI2Nzk4MWIwIEppbSBDcm9taWUgMjAyMi0wNC0w
NsKgIDYyN8KgIHN0YXRpYyBpbnQgcGFyYW1fc2V0X2R5bmRiZ19jbGFzc19zdHJpbmdzKGNvbnN0
IGNoYXIgKmluc3RyLCBjb25zdCBzdHJ1Y3Qga2VybmVsX3BhcmFtICprcCk8YnI+CmE5ODlkZDI2
Nzk4MWIwIEppbSBDcm9taWUgMjAyMi0wNC0wNsKgIDYyOMKgIHs8YnI+CmE5ODlkZDI2Nzk4MWIw
IEppbSBDcm9taWUgMjAyMi0wNC0wNsKgIDYyOcKgIMKgIMKgIMKgY29uc3Qgc3RydWN0IGRkZWJ1
Z19jbGFzc2VzX2JpdG1hcF9wYXJhbSAqZGNwID0ga3AtJmd0O2FyZzs8YnI+CmE5ODlkZDI2Nzk4
MWIwIEppbSBDcm9taWUgMjAyMi0wNC0wNiBANjMwwqAgwqAgwqAgwqBjb25zdCBzdHJ1Y3QgZGRl
YnVnX2NsYXNzZXNfbWFwICptYXAgPSBkY3AtJmd0O21hcDs8YnI+CsKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Xl5eXl5eXl48YnI+CkRlcmVmZXJlbmNlPGJyPgo8YnI+CmE5ODlkZDI2Nzk4MWIwIEppbSBDcm9t
aWUgMjAyMi0wNC0wNsKgIDYzMcKgIMKgIMKgIMKgdW5zaWduZWQgbG9uZyBpbmJpdHM7PGJyPgph
OTg5ZGQyNjc5ODFiMCBKaW0gQ3JvbWllIDIwMjItMDQtMDbCoCA2MzLCoCDCoCDCoCDCoGludCBp
ZHhfcmMsIHRvdGN0ID0gMDs8YnI+CmE5ODlkZDI2Nzk4MWIwIEppbSBDcm9taWUgMjAyMi0wNC0w
NsKgIDYzM8KgIMKgIMKgIMKgYm9vbCB3YW50ZWQ7PGJyPgphOTg5ZGQyNjc5ODFiMCBKaW0gQ3Jv
bWllIDIwMjItMDQtMDbCoCA2MzTCoCDCoCDCoCDCoGNoYXIgKmNscywgKnA7PGJyPgphOTg5ZGQy
Njc5ODFiMCBKaW0gQ3JvbWllIDIwMjItMDQtMDbCoCA2MzXCoCA8YnI+CmE5ODlkZDI2Nzk4MWIw
IEppbSBDcm9taWUgMjAyMi0wNC0wNiBANjM2wqAgwqAgwqAgwqBpZiAoIWRjcCB8fCAhZGNwLSZn
dDttYXApIHs8YnI+CsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIF5eXl48YnI+CkNoZWNrIGZvciBOVUxM
IHRvbyBsYXRlLjxicj4KPGJyPjwvYmxvY2txdW90ZT48ZGl2Pjxicj48L2Rpdj48ZGl2Pjxicj48
L2Rpdj48ZGl2PnllcywgSSBtb3ZlZCBkZXJlZiB1cCB3byBjbGVhbnVwLjwvZGl2PjxkaXY+SSB0
aGluayBJIGdvdCBkaXN0cmFjdGVkIGJ5IHRoZSAmcXVvdDtpcyBkZXJlZiBzYWZlIGhlcmUgPyZx
dW90OzwvZGl2PjxkaXY+SSBndWVzcyBZRVMsIElGRiB0aGUgcmlnaHQga3AgaXMgdGhlcmUuIHdo
aWNoIHRoZSBtYWNyb3MgZG8uPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj50aGFua3M8L2Rpdj48
ZGl2PsKgPC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2lu
OjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQp
O3BhZGRpbmctbGVmdDoxZXgiPgphOTg5ZGQyNjc5ODFiMCBKaW0gQ3JvbWllIDIwMjItMDQtMDbC
oCA2MzfCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHByX2VycigmcXVvdDtzZXRfZHluZGJnX2NsYXNz
ZXM6IG5vIGJpdHM9Jmd0O3F1ZXJpZXMgbWFwXG4mcXVvdDspOzxicj4KYTk4OWRkMjY3OTgxYjAg
SmltIENyb21pZSAyMDIyLTA0LTA2wqAgNjM4wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4g
LUVJTlZBTDs8YnI+CmE5ODlkZDI2Nzk4MWIwIEppbSBDcm9taWUgMjAyMi0wNC0wNsKgIDYzOcKg
IMKgIMKgIMKgfTxicj4KYTk4OWRkMjY3OTgxYjAgSmltIENyb21pZSAyMDIyLTA0LTA2wqAgNjQw
wqAgPGJyPgo8YnI+Ci0tIDxicj4KMC1EQVkgQ0kgS2VybmVsIFRlc3QgU2VydmljZTxicj4KPGEg
aHJlZj0iaHR0cHM6Ly8wMS5vcmcvbGtwIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij5odHRwczovLzAxLm9yZy9sa3A8L2E+IDxicj4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX188YnI+CmtidWlsZCBtYWlsaW5nIGxpc3QgLS0gPGEgaHJlZj0i
bWFpbHRvOmtidWlsZEBsaXN0cy4wMS5vcmciIHRhcmdldD0iX2JsYW5rIj5rYnVpbGRAbGlzdHMu
MDEub3JnPC9hPjxicj4KVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byA8YSBocmVmPSJt
YWlsdG86a2J1aWxkLWxlYXZlQGxpc3RzLjAxLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPmtidWlsZC1s
ZWF2ZUBsaXN0cy4wMS5vcmc8L2E+PGJyPgo8YnI+CjwvYmxvY2txdW90ZT48L2Rpdj48L2Rpdj4K

--===============1708027359997908125==--

