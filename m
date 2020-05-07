Content-Type: multipart/mixed; boundary="===============1593096467141723226=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [ti:ti-linux-5.4.y 5467/6347] drivers/crypto/sa2ul.c:1938:9: sparse: sparse: non size-preserving pointer to integer cast
Date: Fri, 08 May 2020 05:09:52 +0800
Message-ID: <202005080544.0gqTAEie%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1593096467141723226==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Tero Kristo <t-kristo@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-5.4.y
head:   c8469270aa0e018913e0af1de913a70257742e6e
commit: 40741e7feb85b1a21bee7cd518ed4ef6e600bf23 [5467/6347] crypto: sa2ul:=
 add support for multichunk sha handling
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        git checkout 40741e7feb85b1a21bee7cd518ed4ef6e600bf23
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 27 hours ago
:::::: commit date: 4 weeks ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/crypto/sa2ul.c:341:25: sparse: sparse: incorrect type in assignm=
ent (different base types) @@    expected unsigned int [usertype] @@    got=
 restrunsigned int [usertype] @@
   drivers/crypto/sa2ul.c:341:25: sparse:    expected unsigned int [usertyp=
e]
   drivers/crypto/sa2ul.c:341:25: sparse:    got restricted __be32 [usertyp=
e]
   drivers/crypto/sa2ul.c:348:25: sparse: sparse: incorrect type in assignm=
ent (different base types) @@    expected unsigned int [usertype] @@    got=
 restrunsigned int [usertype] @@
   drivers/crypto/sa2ul.c:348:25: sparse:    expected unsigned int [usertyp=
e]
   drivers/crypto/sa2ul.c:348:25: sparse:    got restricted __be32 [usertyp=
e]
   drivers/crypto/sa2ul.c:351:6: sparse: sparse: symbol 'sa2ul_sha256_init'=
 was not declared. Should it be static?
   drivers/crypto/sa2ul.c:377:25: sparse: sparse: incorrect type in assignm=
ent (different base types) @@    expected unsigned int [usertype] @@    got=
 restrunsigned int [usertype] @@
   drivers/crypto/sa2ul.c:377:25: sparse:    expected unsigned int [usertyp=
e]
   drivers/crypto/sa2ul.c:377:25: sparse:    got restricted __be32 [usertyp=
e]
   drivers/crypto/sa2ul.c:384:25: sparse: sparse: incorrect type in assignm=
ent (different base types) @@    expected unsigned int [usertype] @@    got=
 restrunsigned int [usertype] @@
   drivers/crypto/sa2ul.c:384:25: sparse:    expected unsigned int [usertyp=
e]
   drivers/crypto/sa2ul.c:384:25: sparse:    got restricted __be32 [usertyp=
e]
   drivers/crypto/sa2ul.c:592:31: sparse: sparse: cast to restricted __be32
   drivers/crypto/sa2ul.c:592:31: sparse: sparse: cast to restricted __be32
   drivers/crypto/sa2ul.c:592:31: sparse: sparse: cast to restricted __be32
   drivers/crypto/sa2ul.c:592:31: sparse: sparse: cast to restricted __be32
   drivers/crypto/sa2ul.c:592:31: sparse: sparse: cast to restricted __be32
   drivers/crypto/sa2ul.c:592:31: sparse: sparse: cast to restricted __be32
   drivers/crypto/sa2ul.c:1021:35: sparse: sparse: incorrect type in assign=
ment (different base types) @@    expected unsigned int [usertype] @@    go=
t restrunsigned int [usertype] @@
   drivers/crypto/sa2ul.c:1021:35: sparse:    expected unsigned int [userty=
pe]
   drivers/crypto/sa2ul.c:1021:35: sparse:    got restricted __be32 [userty=
pe]
   drivers/crypto/sa2ul.c:1253:30: sparse: sparse: incorrect type in assign=
ment (different base types) @@    expected unsigned int [usertype] @@    go=
t restrunsigned int [usertype] @@
   drivers/crypto/sa2ul.c:1253:30: sparse:    expected unsigned int [userty=
pe]
   drivers/crypto/sa2ul.c:1253:30: sparse:    got restricted __be32 [userty=
pe]
   drivers/crypto/sa2ul.c:1667:27: sparse: sparse: incorrect type in assign=
ment (different base types) @@    expected unsigned int [usertype] @@    go=
t restrunsigned int [usertype] @@
   drivers/crypto/sa2ul.c:1667:27: sparse:    expected unsigned int [userty=
pe]
   drivers/crypto/sa2ul.c:1667:27: sparse:    got restricted __be32 [userty=
pe]
   drivers/crypto/sa2ul.c:2360:6: sparse: sparse: symbol 'sa_register_algos=
' was not declared. Should it be static?
   drivers/crypto/sa2ul.c:2398:6: sparse: sparse: symbol 'sa_unregister_alg=
os' was not declared. Should it be static?
   drivers/crypto/sa2ul.c:622:41: sparse: sparse: incorrect type in assignm=
ent (different base types) @@    expected unsigned int [usertype] @@    got=
 restrunsigned int [usertype] @@
   drivers/crypto/sa2ul.c:622:41: sparse:    expected unsigned int [usertyp=
e]
   drivers/crypto/sa2ul.c:622:41: sparse:    got restricted __be32 [usertyp=
e]
   drivers/crypto/sa2ul.c:483:22: sparse: sparse: incorrect type in assignm=
ent (different base types) @@    expected unsigned int [usertype] @@    got=
 restrunsigned int [usertype] @@
   drivers/crypto/sa2ul.c:483:22: sparse:    expected unsigned int [usertyp=
e]
   drivers/crypto/sa2ul.c:483:22: sparse:    got restricted __be32 [usertyp=
e]
   drivers/crypto/sa2ul.c:622:41: sparse: sparse: incorrect type in assignm=
ent (different base types) @@    expected unsigned int [usertype] @@    got=
 restrunsigned int [usertype] @@
   drivers/crypto/sa2ul.c:622:41: sparse:    expected unsigned int [usertyp=
e]
   drivers/crypto/sa2ul.c:622:41: sparse:    got restricted __be32 [usertyp=
e]
   drivers/crypto/sa2ul.c:483:22: sparse: sparse: incorrect type in assignm=
ent (different base types) @@    expected unsigned int [usertype] @@    got=
 restrunsigned int [usertype] @@
   drivers/crypto/sa2ul.c:483:22: sparse:    expected unsigned int [usertyp=
e]
   drivers/crypto/sa2ul.c:483:22: sparse:    got restricted __be32 [usertyp=
e]
   drivers/crypto/sa2ul.c:622:41: sparse: sparse: incorrect type in assignm=
ent (different base types) @@    expected unsigned int [usertype] @@    got=
 restrunsigned int [usertype] @@
   drivers/crypto/sa2ul.c:622:41: sparse:    expected unsigned int [usertyp=
e]
   drivers/crypto/sa2ul.c:622:41: sparse:    got restricted __be32 [usertyp=
e]
   drivers/crypto/sa2ul.c:483:22: sparse: sparse: incorrect type in assignm=
ent (different base types) @@    expected unsigned int [usertype] @@    got=
 restrunsigned int [usertype] @@
   drivers/crypto/sa2ul.c:483:22: sparse:    expected unsigned int [usertyp=
e]
   drivers/crypto/sa2ul.c:483:22: sparse:    got restricted __be32 [usertyp=
e]
>> drivers/crypto/sa2ul.c:1938:9: sparse: sparse: non size-preserving point=
er to integer cast

git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
git remote update ti
git checkout 40741e7feb85b1a21bee7cd518ed4ef6e600bf23
vim +1938 drivers/crypto/sa2ul.c

dfcac7a6a1f9e0 Keerthy     2020-01-17  1932  =

dfcac7a6a1f9e0 Keerthy     2020-01-17  1933  static int sa_sham_init(struct=
 ahash_request *req)
dfcac7a6a1f9e0 Keerthy     2020-01-17  1934  {
dfcac7a6a1f9e0 Keerthy     2020-01-17  1935  	struct crypto_ahash *tfm =3D =
crypto_ahash_reqtfm(req);
dfcac7a6a1f9e0 Keerthy     2020-01-17  1936  	struct sa_dma_req_ctx *rctx =
=3D ahash_request_ctx(req);
dfcac7a6a1f9e0 Keerthy     2020-01-17  1937  =

40741e7feb85b1 Tero Kristo 2020-03-20 @1938  	dev_dbg(sa_k3_dev, "init: dig=
est size: %d, rctx=3D%llx\n",
40741e7feb85b1 Tero Kristo 2020-03-20  1939  		crypto_ahash_digestsize(tfm)=
, (u64)rctx);
dfcac7a6a1f9e0 Keerthy     2020-01-17  1940  =

40741e7feb85b1 Tero Kristo 2020-03-20  1941  	memzero_explicit(rctx, sizeof=
(*rctx));
dfcac7a6a1f9e0 Keerthy     2020-01-17  1942  =

40741e7feb85b1 Tero Kristo 2020-03-20  1943  	return 0;
dfcac7a6a1f9e0 Keerthy     2020-01-17  1944  }
dfcac7a6a1f9e0 Keerthy     2020-01-17  1945  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1593096467141723226==--

