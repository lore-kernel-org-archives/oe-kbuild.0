Content-Type: multipart/mixed; boundary="===============7806844065162985610=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/crypto/atmel-tdes.c:683:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 22 Feb 2022 19:17:20 +0800
Message-ID: <202202221939.g3OdDxDA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7806844065162985610==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   038101e6b2cd5c55f888f85db42ea2ad3aecb4b6
commit: 817b804ca36747f0c9db667d7d8aa9fdd55335c7 crypto: atmel-tdes - Handl=
e error messages
date:   7 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 7 months ago
config: riscv-randconfig-c006-20220216 (https://download.01.org/0day-ci/arc=
hive/20220222/202202221939.g3OdDxDA-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0e628a=
783b935c70c80815db6c061ec84f884af5)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D817b804ca36747f0c9db667d7d8aa9fdd55335c7
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 817b804ca36747f0c9db667d7d8aa9fdd55335c7
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/media/usb/uvc/uvc_ctrl.c:836:37: warning: The result of the left=
 shift is undefined because the left operand is negative [clang-analyzer-co=
re.UndefinedBinaryOperatorResult]
                   *data =3D (*data & ~mask) | ((value << offset) & mask);
                                               ~~~~~ ^
   drivers/media/usb/uvc/uvc_ctrl.c:828:6: note: Assuming field 'v4l2_type'=
 is equal to V4L2_CTRL_TYPE_BUTTON
           if (mapping->v4l2_type =3D=3D V4L2_CTRL_TYPE_BUTTON)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/uvc/uvc_ctrl.c:828:2: note: Taking true branch
           if (mapping->v4l2_type =3D=3D V4L2_CTRL_TYPE_BUTTON)
           ^
   drivers/media/usb/uvc/uvc_ctrl.c:834:9: note: Assuming 'bits' is > 0
           for (; bits > 0; data++) {
                  ^~~~~~~~
   drivers/media/usb/uvc/uvc_ctrl.c:834:2: note: Loop condition is true.  E=
ntering loop body
           for (; bits > 0; data++) {
           ^
   drivers/media/usb/uvc/uvc_ctrl.c:837:13: note: Assuming 'offset' is 0
                   value >>=3D offset ? offset : 8;
                             ^~~~~~
   drivers/media/usb/uvc/uvc_ctrl.c:837:13: note: '?' condition is false
   drivers/media/usb/uvc/uvc_ctrl.c:837:3: note: The value -1 is assigned t=
o 'value'
                   value >>=3D offset ? offset : 8;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/uvc/uvc_ctrl.c:834:9: note: Assuming 'bits' is > 0
           for (; bits > 0; data++) {
                  ^~~~~~~~
   drivers/media/usb/uvc/uvc_ctrl.c:834:2: note: Loop condition is true.  E=
ntering loop body
           for (; bits > 0; data++) {
           ^
   drivers/media/usb/uvc/uvc_ctrl.c:836:37: note: The result of the left sh=
ift is undefined because the left operand is negative
                   *data =3D (*data & ~mask) | ((value << offset) & mask);
                                               ~~~~~ ^
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   sound/usb/line6/midi.c:229:2: warning: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(rmidi->id, line6->properties->id);
           ^~~~~~
   sound/usb/line6/midi.c:229:2: note: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119
           strcpy(rmidi->id, line6->properties->id);
           ^~~~~~
   sound/usb/line6/midi.c:230:2: warning: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(rmidi->name, line6->properties->name);
           ^~~~~~
   sound/usb/line6/midi.c:230:2: note: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119
           strcpy(rmidi->name, line6->properties->name);
           ^~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   sound/usb/line6/pcm.c:489:2: warning: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(pcm->name, line6->properties->name);
           ^~~~~~
   sound/usb/line6/pcm.c:489:2: note: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119
           strcpy(pcm->name, line6->properties->name);
           ^~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/crypto/atmel-tdes.c:683:17: warning: Value stored to 'dev' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D ctx->dd->dev;
                          ^~~   ~~~~~~~~~~~~
   drivers/crypto/atmel-tdes.c:683:17: note: Value stored to 'dev' during i=
ts initialization is never read
           struct device *dev =3D ctx->dd->dev;
                          ^~~   ~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/mmc/host/bcm2835.c:195:17: warning: Value stored to 'dev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &host->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/mmc/host/bcm2835.c:195:17: note: Value stored to 'dev' during it=
s initialization is never read
           struct device *dev =3D &host->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/mmc/host/bcm2835.c:210:17: warning: Value stored to 'dev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &host->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/mmc/host/bcm2835.c:210:17: note: Value stored to 'dev' during it=
s initialization is never read
           struct device *dev =3D &host->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/mmc/host/bcm2835.c:718:17: warning: Value stored to 'dev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &host->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/mmc/host/bcm2835.c:718:17: note: Value stored to 'dev' during it=
s initialization is never read
           struct device *dev =3D &host->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/media/usb/gspca/topro.c:4745:3: warning: Value stored to 'ret' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D gspca_expo_autogain(gspca_dev, luma,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/gspca/topro.c:4745:3: note: Value stored to 'ret' is n=
ever read
                   ret =3D gspca_expo_autogain(gspca_dev, luma,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/media/usb/gspca/vc032x.c:2793:8: warning: Excessive padding in '=
struct sensor_info' (2 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   VpId, =

   sensorId, =

   I2cAdd, =

   IdAdd, =

   m1, =

   m2, =

   op, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct sensor_info {
   ~~~~~~~^~~~~~~~~~~~~
   drivers/media/usb/gspca/vc032x.c:2793:8: note: Excessive padding in 'str=
uct sensor_info' (2 padding bytes, where 0 is optimal). Optimal fields orde=
r: VpId, sensorId, I2cAdd, IdAdd, m1, m2, op, consider reordering the field=
s or adding explicit padding members
   struct sensor_info {
   ~~~~~~~^~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/dev +683 drivers/crypto/atmel-tdes.c

13802005d8f2db Nicolas Royer  2012-07-01  677  =

967d4910ef0e83 Ard Biesheuvel 2019-11-09  678  static int atmel_tdes_crypt(=
struct skcipher_request *req, unsigned long mode)
13802005d8f2db Nicolas Royer  2012-07-01  679  {
61b0dd664fa187 Tudor Ambarus  2019-11-15  680  	struct crypto_skcipher *skc=
ipher =3D crypto_skcipher_reqtfm(req);
61b0dd664fa187 Tudor Ambarus  2019-11-15  681  	struct atmel_tdes_ctx *ctx =
=3D crypto_skcipher_ctx(skcipher);
967d4910ef0e83 Ard Biesheuvel 2019-11-09  682  	struct atmel_tdes_reqctx *r=
ctx =3D skcipher_request_ctx(req);
817b804ca36747 Tudor Ambarus  2021-07-20 @683  	struct device *dev =3D ctx-=
>dd->dev;
13802005d8f2db Nicolas Royer  2012-07-01  684  =

848572f8177214 Tudor Ambarus  2019-12-05  685  	switch (mode & TDES_FLAGS_O=
PMODE_MASK) {
848572f8177214 Tudor Ambarus  2019-12-05  686  	case TDES_FLAGS_CFB8:
967d4910ef0e83 Ard Biesheuvel 2019-11-09  687  		if (!IS_ALIGNED(req->crypt=
len, CFB8_BLOCK_SIZE)) {
817b804ca36747 Tudor Ambarus  2021-07-20  688  			dev_dbg(dev, "request siz=
e is not exact amount of CFB8 blocks\n");
13802005d8f2db Nicolas Royer  2012-07-01  689  			return -EINVAL;
13802005d8f2db Nicolas Royer  2012-07-01  690  		}
1f858040c2f780 Nicolas Royer  2013-02-20  691  		ctx->block_size =3D CFB8_B=
LOCK_SIZE;
848572f8177214 Tudor Ambarus  2019-12-05  692  		break;
848572f8177214 Tudor Ambarus  2019-12-05  693  =

848572f8177214 Tudor Ambarus  2019-12-05  694  	case TDES_FLAGS_CFB16:
967d4910ef0e83 Ard Biesheuvel 2019-11-09  695  		if (!IS_ALIGNED(req->crypt=
len, CFB16_BLOCK_SIZE)) {
817b804ca36747 Tudor Ambarus  2021-07-20  696  			dev_dbg(dev, "request siz=
e is not exact amount of CFB16 blocks\n");
13802005d8f2db Nicolas Royer  2012-07-01  697  			return -EINVAL;
13802005d8f2db Nicolas Royer  2012-07-01  698  		}
1f858040c2f780 Nicolas Royer  2013-02-20  699  		ctx->block_size =3D CFB16_=
BLOCK_SIZE;
848572f8177214 Tudor Ambarus  2019-12-05  700  		break;
848572f8177214 Tudor Ambarus  2019-12-05  701  =

848572f8177214 Tudor Ambarus  2019-12-05  702  	case TDES_FLAGS_CFB32:
967d4910ef0e83 Ard Biesheuvel 2019-11-09  703  		if (!IS_ALIGNED(req->crypt=
len, CFB32_BLOCK_SIZE)) {
817b804ca36747 Tudor Ambarus  2021-07-20  704  			dev_dbg(dev, "request siz=
e is not exact amount of CFB32 blocks\n");
13802005d8f2db Nicolas Royer  2012-07-01  705  			return -EINVAL;
13802005d8f2db Nicolas Royer  2012-07-01  706  		}
1f858040c2f780 Nicolas Royer  2013-02-20  707  		ctx->block_size =3D CFB32_=
BLOCK_SIZE;
848572f8177214 Tudor Ambarus  2019-12-05  708  		break;
848572f8177214 Tudor Ambarus  2019-12-05  709  =

848572f8177214 Tudor Ambarus  2019-12-05  710  	default:
967d4910ef0e83 Ard Biesheuvel 2019-11-09  711  		if (!IS_ALIGNED(req->crypt=
len, DES_BLOCK_SIZE)) {
817b804ca36747 Tudor Ambarus  2021-07-20  712  			dev_dbg(dev, "request siz=
e is not exact amount of DES blocks\n");
13802005d8f2db Nicolas Royer  2012-07-01  713  			return -EINVAL;
13802005d8f2db Nicolas Royer  2012-07-01  714  		}
1f858040c2f780 Nicolas Royer  2013-02-20  715  		ctx->block_size =3D DES_BL=
OCK_SIZE;
848572f8177214 Tudor Ambarus  2019-12-05  716  		break;
1f858040c2f780 Nicolas Royer  2013-02-20  717  	}
13802005d8f2db Nicolas Royer  2012-07-01  718  =

1f858040c2f780 Nicolas Royer  2013-02-20  719  	rctx->mode =3D mode;
1f858040c2f780 Nicolas Royer  2013-02-20  720  =

c65d123742a7bf Tudor Ambarus  2019-12-05  721  	if ((mode & TDES_FLAGS_OPMO=
DE_MASK) !=3D TDES_FLAGS_ECB &&
c65d123742a7bf Tudor Ambarus  2019-12-05  722  	    !(mode & TDES_FLAGS_ENC=
RYPT) && req->src =3D=3D req->dst) {
61b0dd664fa187 Tudor Ambarus  2019-11-15  723  		unsigned int ivsize =3D cr=
ypto_skcipher_ivsize(skcipher);
61b0dd664fa187 Tudor Ambarus  2019-11-15  724  =

61b0dd664fa187 Tudor Ambarus  2019-11-15  725  		if (req->cryptlen >=3D ivs=
ize)
61b0dd664fa187 Tudor Ambarus  2019-11-15  726  			scatterwalk_map_and_copy(=
rctx->lastc, req->src,
61b0dd664fa187 Tudor Ambarus  2019-11-15  727  						 req->cryptlen - ivsiz=
e,
61b0dd664fa187 Tudor Ambarus  2019-11-15  728  						 ivsize, 0);
61b0dd664fa187 Tudor Ambarus  2019-11-15  729  	}
61b0dd664fa187 Tudor Ambarus  2019-11-15  730  =

1f858040c2f780 Nicolas Royer  2013-02-20  731  	return atmel_tdes_handle_qu=
eue(ctx->dd, req);
1f858040c2f780 Nicolas Royer  2013-02-20  732  }
1f858040c2f780 Nicolas Royer  2013-02-20  733  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7806844065162985610==--

