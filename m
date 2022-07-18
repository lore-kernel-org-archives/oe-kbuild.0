Content-Type: multipart/mixed; boundary="===============2572161813558671420=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 2/2] pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO driver
Date: Mon, 18 Jul 2022 21:41:22 +0800
Message-ID: <202207182110.aSJvcRmT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2572161813558671420==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/p=
inctrl/nuvoton/pinctrl-npcm8xx.c:1360:9: sparse: sparse: obsolete array ini=
tializer, use C99 syntax"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220714122322.63663-3-tmaimon77@gmail.com>
References: <20220714122322.63663-3-tmaimon77@gmail.com>
TO: Tomer Maimon <tmaimon77@gmail.com>
TO: avifishman70(a)gmail.com
TO: tali.perry1(a)gmail.com
TO: joel(a)jms.id.au
TO: venture(a)google.com
TO: yuenn(a)google.com
TO: benjaminfair(a)google.com
TO: linus.walleij(a)linaro.org
TO: robh+dt(a)kernel.org
TO: krzysztof.kozlowski+dt(a)linaro.org
TO: j.neuschaefer(a)gmx.net
TO: zhengbin13(a)huawei.com
CC: openbmc(a)lists.ozlabs.org
CC: linux-gpio(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: devicetree(a)vger.kernel.org
CC: Tomer Maimon <tmaimon77@gmail.com>

Hi Tomer,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linus/master v5.19-rc7 next-20220718]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomer-Maimon/pinctrl=
-nuvoton-add-pinmux-and-GPIO-driver-for-NPCM8XX/20220714-202424
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctr=
l.git devel
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: sh-randconfig-s042-20220715 (https://download.01.org/0day-ci/archiv=
e/20220718/202207182110.aSJvcRmT-lkp(a)intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/0a5f158322b21ab2b71=
cc606adc2ee7573d8be0d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Tomer-Maimon/pinctrl-nuvoton-add-p=
inmux-and-GPIO-driver-for-NPCM8XX/20220714-202424
        git checkout 0a5f158322b21ab2b71cc606adc2ee7573d8be0d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Ds=
h SHELL=3D/bin/bash .// drivers/ fs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1360:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1361:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1362:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1363:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1364:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1365:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1366:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1367:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1368:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1369:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1370:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1371:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1372:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1373:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1374:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1375:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1376:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1377:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1378:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1379:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1380:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1381:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1382:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1383:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1384:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1385:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1386:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1387:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1388:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1389:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1390:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1391:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1392:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1393:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1394:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1395:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1396:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1397:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1398:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1399:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1400:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1401:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1402:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1403:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1404:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1405:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1406:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1407:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1408:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1409:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1410:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1411:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1412:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1413:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1414:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1415:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1416:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1417:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1418:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1419:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1420:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1421:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1422:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1423:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1424:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1425:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1426:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1427:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1428:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1429:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1430:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1431:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1432:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1433:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1434:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1435:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1436:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1437:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1438:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1439:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1440:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1441:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1442:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1443:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1444:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1445:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1446:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1447:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1448:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1449:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1450:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1451:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1452:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1453:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1454:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1455:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1456:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1457:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1458:9: sparse: sparse: obsole=
te array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1459:9: sparse: sparse: too ma=
ny warnings

vim +1360 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c

0a5f158322b21a Tomer Maimon 2022-07-14  1357  =

0a5f158322b21a Tomer Maimon 2022-07-14  1358  static const struct npcm8xx_p=
incfg pincfg[] =3D {
0a5f158322b21a Tomer Maimon 2022-07-14  1359  	/*		PIN	  FUNCTION 1		   FUN=
CTION 2		  FUNCTION 3		FUNCTION 4		FUNCTION 5		FLAGS */
0a5f158322b21a Tomer Maimon 2022-07-14 @1360  	NPCM8XX_PINCFG(0,	iox1, MFSE=
L1, 30,	smb6c, I2CSEGSEL, 25,	smb18, MFSEL5, 26,	none, NONE, 0,		none, NONE=
, 0,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1361  	NPCM8XX_PINCFG(1,	iox1, MFSE=
L1, 30,	smb6c, I2CSEGSEL, 25,	smb18, MFSEL5, 26,	none, NONE, 0,		none, NONE=
, 0,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1362  	NPCM8XX_PINCFG(2,	iox1, MFSE=
L1, 30,	smb6b, I2CSEGSEL, 24,	smb17, MFSEL5, 25,	none, NONE, 0,		none, NONE=
, 0,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1363  	NPCM8XX_PINCFG(3,	iox1, MFSE=
L1, 30,	smb6b, I2CSEGSEL, 24,	smb17, MFSEL5, 25,	none, NONE, 0,		none, NONE=
, 0,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1364  	NPCM8XX_PINCFG(4,	iox2, MFSE=
L3, 14,	smb1d, I2CSEGSEL, 7,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,=
		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1365  	NPCM8XX_PINCFG(5,	iox2, MFSE=
L3, 14,	smb1d, I2CSEGSEL, 7,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,=
		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1366  	NPCM8XX_PINCFG(6,	iox2, MFSE=
L3, 14,	smb2d, I2CSEGSEL, 10,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0=
,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1367  	NPCM8XX_PINCFG(7,	iox2, MFSE=
L3, 14,	smb2d, I2CSEGSEL, 10,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0=
,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1368  	NPCM8XX_PINCFG(8,	lkgpo1,	FL=
OCKR1, 4,	tp_gpio0b, MFSEL7, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE,=
 0,		DS(8, 12)),
0a5f158322b21a Tomer Maimon 2022-07-14  1369  	NPCM8XX_PINCFG(9,	lkgpo2,	FL=
OCKR1, 8,	tp_gpio1b, MFSEL7, 9,	none, NONE, 0,		none, NONE, 0,		none, NONE,=
 0,		DS(8, 12)),
0a5f158322b21a Tomer Maimon 2022-07-14  1370  	NPCM8XX_PINCFG(10,	ioxh, MFS=
EL3, 18,	smb6d, I2CSEGSEL, 26,	smb16, MFSEL5, 24,	none, NONE, 0,		none, NON=
E, 0,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1371  	NPCM8XX_PINCFG(11,	ioxh, MFS=
EL3, 18,	smb6d, I2CSEGSEL, 26,	smb16, MFSEL5, 24,	none, NONE, 0,		none, NON=
E, 0,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1372  	NPCM8XX_PINCFG(12,	gspi, MFS=
EL1, 24,	smb5b, I2CSEGSEL, 19,	none, NONE, 0,		none, NONE, 0,		none, NONE, =
0,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1373  	NPCM8XX_PINCFG(13,	gspi, MFS=
EL1, 24,	smb5b, I2CSEGSEL, 19,	none, NONE, 0,		none, NONE, 0,		none, NONE, =
0,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1374  	NPCM8XX_PINCFG(14,	gspi, MFS=
EL1, 24,	smb5c, I2CSEGSEL, 20,	none, NONE, 0,		none, NONE, 0,		none, NONE, =
0,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1375  	NPCM8XX_PINCFG(15,	gspi, MFS=
EL1, 24,	smb5c, I2CSEGSEL, 20,	none, NONE, 0,		none, NONE, 0,		none, NONE, =
0,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1376  	NPCM8XX_PINCFG(16,	lkgpo0, F=
LOCKR1, 0,	smb7b, I2CSEGSEL, 27,	tp_gpio2b, MFSEL7, 10,	none, NONE, 0,		non=
e, NONE, 0,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1377  	NPCM8XX_PINCFG(17,	pspi2, MF=
SEL3, 13,	cp1gpio5, MFSEL6, 7,	none, NONE, 0,		none, NONE, 0,		none, NONE, =
0,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1378  	NPCM8XX_PINCFG(18,	pspi2, MF=
SEL3, 13,	smb4b, I2CSEGSEL, 14,	none, NONE, 0,		none, NONE, 0,		none, NONE,=
 0,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1379  	NPCM8XX_PINCFG(19,	pspi2, MF=
SEL3, 13,	smb4b, I2CSEGSEL, 14,	none, NONE, 0,		none, NONE, 0,		none, NONE,=
 0,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1380  	NPCM8XX_PINCFG(20,	hgpio0,	M=
FSEL2, 24,	smb15, MFSEL3, 8,	smb4c, I2CSEGSEL, 15,	none, NONE, 0,		none, NO=
NE, 0,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1381  	NPCM8XX_PINCFG(21,	hgpio1,	M=
FSEL2, 25,	smb15, MFSEL3, 8,	smb4c, I2CSEGSEL, 15,	none, NONE, 0,		none, NO=
NE, 0,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1382  	NPCM8XX_PINCFG(22,	hgpio2,	M=
FSEL2, 26,	smb14, MFSEL3, 7,	smb4d, I2CSEGSEL, 16,	none, NONE, 0,		none, NO=
NE, 0,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1383  	NPCM8XX_PINCFG(23,	hgpio3,	M=
FSEL2, 27,	smb14, MFSEL3, 7,	smb4d, I2CSEGSEL, 16,	none, NONE, 0,		none, NO=
NE, 0,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1384  	NPCM8XX_PINCFG(24,	hgpio4,	M=
FSEL2, 28,	ioxh, MFSEL3, 18,	smb7c, I2CSEGSEL, 28,	tp_smb2, MFSEL7, 28,	non=
e, NONE, 0,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1385  	NPCM8XX_PINCFG(25,	hgpio5,	M=
FSEL2, 29,	ioxh, MFSEL3, 18,	smb7c, I2CSEGSEL, 28,	tp_smb2, MFSEL7, 28,	non=
e, NONE, 0,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1386  	NPCM8XX_PINCFG(26,	smb5, MFS=
EL1, 2,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1387  	NPCM8XX_PINCFG(27,	smb5, MFS=
EL1, 2,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1388  	NPCM8XX_PINCFG(28,	smb4, MFS=
EL1, 1,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1389  	NPCM8XX_PINCFG(29,	smb4, MFS=
EL1, 1,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1390  	NPCM8XX_PINCFG(30,	smb3, MFS=
EL1, 0,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1391  	NPCM8XX_PINCFG(31,	smb3, MFS=
EL1, 0,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1392  	NPCM8XX_PINCFG(32,	spi0cs1, =
MFSEL1, 3,	smb14, MFSEL7, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0=
,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1393  	NPCM8XX_PINCFG(33,	i3c4, MFS=
EL6, 10,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SL=
EW),
0a5f158322b21a Tomer Maimon 2022-07-14  1394  	NPCM8XX_PINCFG(34,	i3c4, MFS=
EL6, 10,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SL=
EW),
0a5f158322b21a Tomer Maimon 2022-07-14  1395  	NPCM8XX_PINCFG(37,	smb3c, I2=
CSEGSEL, 12,	smb23, MFSEL5, 31,	none, NONE, 0,		none, NONE, 0,		none, NONE,=
 0,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1396  	NPCM8XX_PINCFG(38,	smb3c, I2=
CSEGSEL, 12,	smb23, MFSEL5, 31,	none, NONE, 0,		none, NONE, 0,		none, NONE,=
 0,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1397  	NPCM8XX_PINCFG(39,	smb3b, I2=
CSEGSEL, 11,	smb22, MFSEL5, 30,	none, NONE, 0,		none, NONE, 0,		none, NONE,=
 0,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1398  	NPCM8XX_PINCFG(40,	smb3b, I2=
CSEGSEL, 11,	smb22, MFSEL5, 30,	none, NONE, 0,		none, NONE, 0,		none, NONE,=
 0,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1399  	NPCM8XX_PINCFG(41,	bmcuart0a=
, MFSEL1, 9,	cp1urxd, MFSEL6, 31,	none, NONE, 0,		none, NONE, 0,		none, NON=
E, 0,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1400  	NPCM8XX_PINCFG(42,	bmcuart0a=
, MFSEL1, 9,	cp1utxd, MFSEL6, 1,	none, NONE, 0,		none, NONE, 0,		none, NONE=
, 0,		DS(2, 4)),
0a5f158322b21a Tomer Maimon 2022-07-14  1401  	NPCM8XX_PINCFG(43,	uart1, MF=
SEL1, 10,	bmcuart1, MFSEL3, 24,	none, NONE, 0,		none, NONE, 0,		none, NONE,=
 0,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1402  	NPCM8XX_PINCFG(44,	hsi1b, MF=
SEL1, 28,	nbu1crts, MFSEL6, 15,	jtag2, MFSEL4, 0,	tp_jtag3, MFSEL7, 13,	j2j=
3, MFSEL5, 2,	0),
0a5f158322b21a Tomer Maimon 2022-07-14  1403  	NPCM8XX_PINCFG(45,	hsi1c, MF=
SEL1, 4,	jtag2, MFSEL4, 0,	j2j3, MFSEL5, 2,	tp_jtag3, MFSEL7, 13,	none, NON=
E, 0,		DS(2, 8)),
0a5f158322b21a Tomer Maimon 2022-07-14  1404  	NPCM8XX_PINCFG(46,	hsi1c, MF=
SEL1, 4,	jtag2, MFSEL4, 0,	j2j3, MFSEL5, 2,	tp_jtag3, MFSEL7, 13,	none, NON=
E, 0,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1405  	NPCM8XX_PINCFG(47,	hsi1c, MF=
SEL1, 4,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DS=
(2, 8)),
0a5f158322b21a Tomer Maimon 2022-07-14  1406  	NPCM8XX_PINCFG(48,	hsi2a, MF=
SEL1, 11,	bmcuart0b, MFSEL4, 1,	none, NONE, 0,		none, NONE, 0,		none, NONE,=
 0,		GPO),
0a5f158322b21a Tomer Maimon 2022-07-14  1407  	NPCM8XX_PINCFG(49,	hsi2a, MF=
SEL1, 11,	bmcuart0b, MFSEL4, 1,	none, NONE, 0,		none, NONE, 0,		none, NONE,=
 0,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1408  	NPCM8XX_PINCFG(50,	hsi2b, MF=
SEL1, 29,	bu6, MFSEL5, 6,		tp_uart, MFSEL7, 12,	none, NONE, 0,		none, NONE,=
 0,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1409  	NPCM8XX_PINCFG(51,	hsi2b, MF=
SEL1, 29,	bu6, MFSEL5, 6,		tp_uart, MFSEL7, 12,	none, NONE, 0,		none, NONE,=
 0,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1410  	NPCM8XX_PINCFG(52,	hsi2c, MF=
SEL1, 5,	bu5, MFSEL5, 7,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0=
),
0a5f158322b21a Tomer Maimon 2022-07-14  1411  	NPCM8XX_PINCFG(53,	hsi2c, MF=
SEL1, 5,	bu5, MFSEL5, 7,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0=
),
0a5f158322b21a Tomer Maimon 2022-07-14  1412  	NPCM8XX_PINCFG(54,	hsi2c, MF=
SEL1, 5,	bu4, MFSEL5, 8,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0=
),
0a5f158322b21a Tomer Maimon 2022-07-14  1413  	NPCM8XX_PINCFG(55,	hsi2c, MF=
SEL1, 5,	bu4, MFSEL5, 8,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0=
),
0a5f158322b21a Tomer Maimon 2022-07-14  1414  	NPCM8XX_PINCFG(56,	r1err, MF=
SEL1, 12,	r1oen, MFSEL5, 9,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,	=
	0),
0a5f158322b21a Tomer Maimon 2022-07-14  1415  	NPCM8XX_PINCFG(57,	r1md, MFS=
EL1, 13,	tpgpio4b, MFSEL5, 20,	none, NONE, 0,		none, NONE, 0,		none, NONE, =
0,		DS(2, 4)),
0a5f158322b21a Tomer Maimon 2022-07-14  1416  	NPCM8XX_PINCFG(58,	r1md, MFS=
EL1, 13,	tpgpio5b, MFSEL5, 22,	none, NONE, 0,		none, NONE, 0,		none, NONE, =
0,		DS(2, 4)),
0a5f158322b21a Tomer Maimon 2022-07-14  1417  	NPCM8XX_PINCFG(59,	hgpio6, M=
FSEL2, 30,	smb3d, I2CSEGSEL, 13,	smb19, MFSEL5, 27,	none, NONE, 0,		none, N=
ONE, 0,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1418  	NPCM8XX_PINCFG(60,	hgpio7, M=
FSEL2, 31,	smb3d, I2CSEGSEL, 13,	smb19, MFSEL5, 27,	none, NONE, 0,		none, N=
ONE, 0,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1419  	NPCM8XX_PINCFG(61,	hsi1c, MF=
SEL1, 4,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1420  	NPCM8XX_PINCFG(62,	hsi1b, MF=
SEL1, 28,	jtag2, MFSEL4, 0,	j2j3, MFSEL5, 2,	nbu1crts, MFSEL6, 15,	tp_jtag3=
, MFSEL7, 13,	0),
0a5f158322b21a Tomer Maimon 2022-07-14  1421  	NPCM8XX_PINCFG(63,	hsi1a, MF=
SEL1, 10,	bmcuart1, MFSEL3, 24,	none, NONE, 0,		none, NONE, 0,		none, NONE,=
 0,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1422  	NPCM8XX_PINCFG(64,	fanin0, M=
FSEL2, 0,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0=
),
0a5f158322b21a Tomer Maimon 2022-07-14  1423  	NPCM8XX_PINCFG(65,	fanin1, M=
FSEL2, 1,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0=
),
0a5f158322b21a Tomer Maimon 2022-07-14  1424  	NPCM8XX_PINCFG(66,	fanin2, M=
FSEL2, 2,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0=
),
0a5f158322b21a Tomer Maimon 2022-07-14  1425  	NPCM8XX_PINCFG(67,	fanin3, M=
FSEL2, 3,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0=
),
0a5f158322b21a Tomer Maimon 2022-07-14  1426  	NPCM8XX_PINCFG(68,	fanin4, M=
FSEL2, 4,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0=
),
0a5f158322b21a Tomer Maimon 2022-07-14  1427  	NPCM8XX_PINCFG(69,	fanin5, M=
FSEL2, 5,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0=
),
0a5f158322b21a Tomer Maimon 2022-07-14  1428  	NPCM8XX_PINCFG(70,	fanin6, M=
FSEL2, 6,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0=
),
0a5f158322b21a Tomer Maimon 2022-07-14  1429  	NPCM8XX_PINCFG(71,	fanin7, M=
FSEL2, 7,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0=
),
0a5f158322b21a Tomer Maimon 2022-07-14  1430  	NPCM8XX_PINCFG(72,	fanin8, M=
FSEL2, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0=
),
0a5f158322b21a Tomer Maimon 2022-07-14  1431  	NPCM8XX_PINCFG(73,	fanin9, M=
FSEL2, 9,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0=
),
0a5f158322b21a Tomer Maimon 2022-07-14  1432  	NPCM8XX_PINCFG(74,	fanin10, =
MFSEL2, 10,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,	=
	0),
0a5f158322b21a Tomer Maimon 2022-07-14  1433  	NPCM8XX_PINCFG(75,	fanin11, =
MFSEL2, 11,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,	=
	0),
0a5f158322b21a Tomer Maimon 2022-07-14  1434  	NPCM8XX_PINCFG(76,	fanin12, =
MFSEL2, 12,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,	=
	0),
0a5f158322b21a Tomer Maimon 2022-07-14  1435  	NPCM8XX_PINCFG(77,	fanin13, =
MFSEL2, 13,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,	=
	0),
0a5f158322b21a Tomer Maimon 2022-07-14  1436  	NPCM8XX_PINCFG(78,	fanin14, =
MFSEL2, 14,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,	=
	0),
0a5f158322b21a Tomer Maimon 2022-07-14  1437  	NPCM8XX_PINCFG(79,	fanin15, =
MFSEL2, 15,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,	=
	0),
0a5f158322b21a Tomer Maimon 2022-07-14  1438  	NPCM8XX_PINCFG(80,	pwm0, MFS=
EL2, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DS=
(4, 8)),
0a5f158322b21a Tomer Maimon 2022-07-14  1439  	NPCM8XX_PINCFG(81,	pwm1, MFS=
EL2, 17,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DS=
(4, 8)),
0a5f158322b21a Tomer Maimon 2022-07-14  1440  	NPCM8XX_PINCFG(82,	pwm2, MFS=
EL2, 18,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DS=
(4, 8)),
0a5f158322b21a Tomer Maimon 2022-07-14  1441  	NPCM8XX_PINCFG(83,	pwm3, MFS=
EL2, 19,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DS=
(4, 8)),
0a5f158322b21a Tomer Maimon 2022-07-14  1442  	NPCM8XX_PINCFG(84,	r2, MFSEL=
1, 14,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DS(=
8, 12) | SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1443  	NPCM8XX_PINCFG(85,	r2, MFSEL=
1, 14,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DS(=
8, 12) | SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1444  	NPCM8XX_PINCFG(86,	r2, MFSEL=
1, 14,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DS(=
8, 12) | SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1445  	NPCM8XX_PINCFG(87,	r2, MFSEL=
1, 14,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1446  	NPCM8XX_PINCFG(88,	r2, MFSEL=
1, 14,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1447  	NPCM8XX_PINCFG(89,	r2, MFSEL=
1, 14,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1448  	NPCM8XX_PINCFG(90,	r2err, MF=
SEL1, 15,	r2oen, MFSEL5, 10,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,=
		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1449  	NPCM8XX_PINCFG(91,	r2md, MFS=
EL1, 16,	cp1gpio6, MFSEL6, 8,	tp_gpio0, MFSEL7, 0,	none, NONE, 0,		none, NO=
NE, 0,		DS(2, 4)),
0a5f158322b21a Tomer Maimon 2022-07-14  1450  	NPCM8XX_PINCFG(92,	r2md, MFS=
EL1, 16,	cp1gpio7, MFSEL6, 9,	tp_gpio1, MFSEL7, 1,	none, NONE, 0,		none, NO=
NE, 0,		DS(2, 4)),
0a5f158322b21a Tomer Maimon 2022-07-14  1451  	NPCM8XX_PINCFG(93,	ga20kbc, =
MFSEL1, 17,	smb5d, I2CSEGSEL, 21,	none, NONE, 0,		none, NONE, 0,		none, NON=
E, 0,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1452  	NPCM8XX_PINCFG(94,	ga20kbc, =
MFSEL1, 17,	smb5d, I2CSEGSEL, 21,	none, NONE, 0,		none, NONE, 0,		none, NON=
E, 0,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1453  	NPCM8XX_PINCFG(95,	lpc, NONE=
, 0,		espi, MFSEL4, 8,	gpio, MFSEL1, 26,	none, NONE, 0,		none, NONE, 0,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1454  	NPCM8XX_PINCFG(96,	rg1, MFSE=
L4, 22,	cp1gpio7b, MFSEL6, 24,	tp_gpio7, MFSEL7, 7,	none, NONE, 0,		none, N=
ONE, 0,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1455  	NPCM8XX_PINCFG(97,	rg1, MFSE=
L4, 22,	cp1gpio6b, MFSEL6, 25,	tp_gpio6, MFSEL7, 6,	none, NONE, 0,		none, N=
ONE, 0,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1456  	NPCM8XX_PINCFG(98,	bu4b, MFS=
EL5, 13,	cp1gpio5b, MFSEL6, 26,	tp_gpio5, MFSEL7, 5,	none, NONE, 0,		none, =
NONE, 0,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1457  	NPCM8XX_PINCFG(99,	bu4b, MFS=
EL5, 13,	cp1gpio4b, MFSEL6, 27,	tp_gpio4, MFSEL7, 4,	none, NONE, 0,		none, =
NONE, 0,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1458  	NPCM8XX_PINCFG(100,	bu5b, MF=
SEL5, 13,	cp1gpio3c, MFSEL6, 28,	tp_gpio3, MFSEL7, 3,	none, NONE, 0,		none,=
 NONE, 0,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1459  	NPCM8XX_PINCFG(101,	bu5b, MF=
SEL5, 13,	cp1gpio2c, MFSEL6, 29,	tp_gpio2, MFSEL7, 2,	none, NONE, 0,		none,=
 NONE, 0,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1460  	NPCM8XX_PINCFG(102,	vgadig, =
MFSEL7, 29,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,	=
	DS(4, 8)),
0a5f158322b21a Tomer Maimon 2022-07-14  1461  	NPCM8XX_PINCFG(103,	vgadig, =
MFSEL7, 29,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,	=
	DS(4, 8)),
0a5f158322b21a Tomer Maimon 2022-07-14  1462  	NPCM8XX_PINCFG(104,	vgadig, =
MFSEL7, 29,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,	=
	0),
0a5f158322b21a Tomer Maimon 2022-07-14  1463  	NPCM8XX_PINCFG(105,	vgadig, =
MFSEL7, 29,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,	=
	0),
0a5f158322b21a Tomer Maimon 2022-07-14  1464  	NPCM8XX_PINCFG(106,	i3c5, MF=
SEL3, 22,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		S=
LEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1465  	NPCM8XX_PINCFG(107,	i3c5, MF=
SEL3, 22,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		S=
LEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1466  	NPCM8XX_PINCFG(108,	rg1mdio,=
 MFSEL4, 21,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,=
		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1467  	NPCM8XX_PINCFG(109,	rg1mdio,=
 MFSEL4, 21,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,=
		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1468  	NPCM8XX_PINCFG(110,	rg2, MFS=
EL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,=
		SLEW), /* DSCNT */
0a5f158322b21a Tomer Maimon 2022-07-14  1469  	NPCM8XX_PINCFG(111,	rg2, MFS=
EL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,=
		SLEW), /* DSCNT */
0a5f158322b21a Tomer Maimon 2022-07-14  1470  	NPCM8XX_PINCFG(112,	rg2, MFS=
EL4, 24,	ddr, MFSEL3, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		S=
LEW), /* DSCNT */
0a5f158322b21a Tomer Maimon 2022-07-14  1471  	NPCM8XX_PINCFG(113,	rg2, MFS=
EL4, 24,	ddr, MFSEL3, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		S=
LEW), /* DSCNT */
0a5f158322b21a Tomer Maimon 2022-07-14  1472  	NPCM8XX_PINCFG(114,	smb0, MF=
SEL1, 6,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1473  	NPCM8XX_PINCFG(115,	smb0, MF=
SEL1, 6,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1474  	NPCM8XX_PINCFG(116,	smb1, MF=
SEL1, 7,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1475  	NPCM8XX_PINCFG(117,	smb1, MF=
SEL1, 7,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1476  	NPCM8XX_PINCFG(118,	smb2, MF=
SEL1, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1477  	NPCM8XX_PINCFG(119,	smb2, MF=
SEL1, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1478  	NPCM8XX_PINCFG(120,	smb2c, I=
2CSEGSEL, 9,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,=
		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1479  	NPCM8XX_PINCFG(121,	smb2c, I=
2CSEGSEL, 9,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,=
		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1480  	NPCM8XX_PINCFG(122,	smb2b, I=
2CSEGSEL, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,=
		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1481  	NPCM8XX_PINCFG(123,	smb2b, I=
2CSEGSEL, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,=
		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1482  	NPCM8XX_PINCFG(124,	smb1c, I=
2CSEGSEL, 6,	cp1gpio3b, MFSEL6, 23,	none, NONE, 0,		none, NONE, 0,		none, N=
ONE, 0,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1483  	NPCM8XX_PINCFG(125,	smb1c, I=
2CSEGSEL, 6,	cp1gpio2b, MFSEL6, 22,	none, NONE, 0,		none, NONE, 0,		none, N=
ONE, 0,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1484  	NPCM8XX_PINCFG(126,	smb1b, I=
2CSEGSEL, 5,	cp1gpio1b, MFSEL6, 21,	none, NONE, 0,		none, NONE, 0,		none, N=
ONE, 0,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1485  	NPCM8XX_PINCFG(127,	smb1b, I=
2CSEGSEL, 5,	cp1gpio0b, MFSEL6, 20,	none, NONE, 0,		none, NONE, 0,		none, N=
ONE, 0,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1486  	NPCM8XX_PINCFG(128,	smb8, MF=
SEL4, 11,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0=
),
0a5f158322b21a Tomer Maimon 2022-07-14  1487  	NPCM8XX_PINCFG(129,	smb8, MF=
SEL4, 11,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0=
),
0a5f158322b21a Tomer Maimon 2022-07-14  1488  	NPCM8XX_PINCFG(130,	smb9, MF=
SEL4, 12,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0=
),
0a5f158322b21a Tomer Maimon 2022-07-14  1489  	NPCM8XX_PINCFG(131,	smb9, MF=
SEL4, 12,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0=
),
0a5f158322b21a Tomer Maimon 2022-07-14  1490  	NPCM8XX_PINCFG(132,	smb10, M=
FSEL4, 13,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		=
0),
0a5f158322b21a Tomer Maimon 2022-07-14  1491  	NPCM8XX_PINCFG(133,	smb10, M=
FSEL4, 13,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		=
0),
0a5f158322b21a Tomer Maimon 2022-07-14  1492  	NPCM8XX_PINCFG(134,	smb11, M=
FSEL4, 14,	smb23b, MFSEL6, 0,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0=
,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1493  	NPCM8XX_PINCFG(135,	smb11, M=
FSEL4, 14,	smb23b, MFSEL6, 0,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0=
,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1494  	NPCM8XX_PINCFG(136,	jm1, MFS=
EL5, 15,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SL=
EW),
0a5f158322b21a Tomer Maimon 2022-07-14  1495  	NPCM8XX_PINCFG(137,	jm1, MFS=
EL5, 15,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SL=
EW),
0a5f158322b21a Tomer Maimon 2022-07-14  1496  	NPCM8XX_PINCFG(138,	jm1, MFS=
EL5, 15,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SL=
EW),
0a5f158322b21a Tomer Maimon 2022-07-14  1497  	NPCM8XX_PINCFG(139,	jm1, MFS=
EL5, 15,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SL=
EW),
0a5f158322b21a Tomer Maimon 2022-07-14  1498  	NPCM8XX_PINCFG(140,	jm1, MFS=
EL5, 15,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SL=
EW),
0a5f158322b21a Tomer Maimon 2022-07-14  1499  	NPCM8XX_PINCFG(141,	smb7b, I=
2CSEGSEL, 27,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0=
,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1500  	NPCM8XX_PINCFG(142,	smb7d, I=
2CSEGSEL, 29,	tp_smb1, MFSEL7, 11,	none, NONE, 0,		none, NONE, 0,		none, NO=
NE, 0,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1501  	NPCM8XX_PINCFG(143,	smb7d, I=
2CSEGSEL, 29,	tp_smb1, MFSEL7, 11,	none, NONE, 0,		none, NONE, 0,		none, NO=
NE, 0,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1502  	NPCM8XX_PINCFG(144,	pwm4, MF=
SEL2, 20,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		D=
S(4, 8)),
0a5f158322b21a Tomer Maimon 2022-07-14  1503  	NPCM8XX_PINCFG(145,	pwm5, MF=
SEL2, 21,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		D=
S(4, 8)),
0a5f158322b21a Tomer Maimon 2022-07-14  1504  	NPCM8XX_PINCFG(146,	pwm6, MF=
SEL2, 22,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		D=
S(4, 8)),
0a5f158322b21a Tomer Maimon 2022-07-14  1505  	NPCM8XX_PINCFG(147,	pwm7, MF=
SEL2, 23,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		D=
S(4, 8)),
0a5f158322b21a Tomer Maimon 2022-07-14  1506  	NPCM8XX_PINCFG(148,	mmc8, MF=
SEL3, 11,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		D=
S(8, 12) | SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1507  	NPCM8XX_PINCFG(149,	mmc8, MF=
SEL3, 11,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		D=
S(8, 12) | SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1508  	NPCM8XX_PINCFG(150,	mmc8, MF=
SEL3, 11,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		D=
S(8, 12) | SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1509  	NPCM8XX_PINCFG(151,	mmc8, MF=
SEL3, 11,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		D=
S(8, 12) | SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1510  	NPCM8XX_PINCFG(152,	mmc, MFS=
EL3, 10,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DS=
(8, 12) | SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1511  	NPCM8XX_PINCFG(153,	mmcwp, F=
LOCKR1, 24,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,	=
	0),
0a5f158322b21a Tomer Maimon 2022-07-14  1512  	NPCM8XX_PINCFG(154,	mmc, MFS=
EL3, 10,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DS=
(8, 12) | SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1513  	NPCM8XX_PINCFG(155,	mmccd, M=
FSEL3, 25,	mmcrst, MFSEL4, 6,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0=
,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1514  	NPCM8XX_PINCFG(156,	mmc, MFS=
EL3, 10,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DS=
(8, 12) | SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1515  	NPCM8XX_PINCFG(157,	mmc, MFS=
EL3, 10,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DS=
(8, 12) | SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1516  	NPCM8XX_PINCFG(158,	mmc, MFS=
EL3, 10,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DS=
(8, 12) | SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1517  	NPCM8XX_PINCFG(159,	mmc, MFS=
EL3, 10,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DS=
(8, 12) | SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1518  	NPCM8XX_PINCFG(160,	clkout, =
MFSEL1, 21,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,	=
	DS(8, 12) | SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1519  	NPCM8XX_PINCFG(161,	lpc, NON=
E, 0,		espi, MFSEL4, 8,	gpio, MFSEL1, 26,	none, NONE, 0,		none, NONE, 0,		0=
),
0a5f158322b21a Tomer Maimon 2022-07-14  1520  	NPCM8XX_PINCFG(162,	serirq, =
NONE, 0,	gpio, MFSEL1, 31,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		=
DS(8, 12)),
0a5f158322b21a Tomer Maimon 2022-07-14  1521  	NPCM8XX_PINCFG(163,	lpc, MFS=
EL1, 26,	espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0=
),
0a5f158322b21a Tomer Maimon 2022-07-14  1522  	NPCM8XX_PINCFG(164,	lpc, MFS=
EL1, 26,	espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0=
),
0a5f158322b21a Tomer Maimon 2022-07-14  1523  	NPCM8XX_PINCFG(165,	lpc, MFS=
EL1, 26,	espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0=
),
0a5f158322b21a Tomer Maimon 2022-07-14  1524  	NPCM8XX_PINCFG(166,	lpc, MFS=
EL1, 26,	espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0=
),
0a5f158322b21a Tomer Maimon 2022-07-14  1525  	NPCM8XX_PINCFG(167,	lpc, MFS=
EL1, 26,	espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0=
),
0a5f158322b21a Tomer Maimon 2022-07-14  1526  	NPCM8XX_PINCFG(168,	lpcclk, =
MFSEL1, 31,	espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,=
		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1527  	NPCM8XX_PINCFG(169,	scipme, =
MFSEL3, 0,	smb21, MFSEL5, 29,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0=
,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1528  	NPCM8XX_PINCFG(170,	sci, MFS=
EL1, 22,	smb21, MFSEL5, 29,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,	=
	0),
0a5f158322b21a Tomer Maimon 2022-07-14  1529  	NPCM8XX_PINCFG(171,	smb6, MF=
SEL3, 1,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1530  	NPCM8XX_PINCFG(172,	smb6, MF=
SEL3, 1,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1531  	NPCM8XX_PINCFG(173,	smb7, MF=
SEL3, 2,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1532  	NPCM8XX_PINCFG(174,	smb7, MF=
SEL3, 2,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1533  	NPCM8XX_PINCFG(175,	spi1, MF=
SEL3, 4,	faninx, MFSEL3, 3,	fm1, MFSEL6, 17,	none, NONE, 0,		none, NONE, 0,=
		DS(8, 12)),
0a5f158322b21a Tomer Maimon 2022-07-14  1534  	NPCM8XX_PINCFG(176,	spi1, MF=
SEL3, 4,	faninx, MFSEL3, 3,	fm1, MFSEL6, 17,	none, NONE, 0,		none, NONE, 0,=
		DS(8, 12)),
0a5f158322b21a Tomer Maimon 2022-07-14  1535  	NPCM8XX_PINCFG(177,	spi1, MF=
SEL3, 4,	faninx, MFSEL3, 3,	fm1, MFSEL6, 17,	none, NONE, 0,		none, NONE, 0,=
		DS(8, 12)),
0a5f158322b21a Tomer Maimon 2022-07-14  1536  	NPCM8XX_PINCFG(178,	r1, MFSE=
L3, 9,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DS(=
8, 12) | SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1537  	NPCM8XX_PINCFG(179,	r1, MFSE=
L3, 9,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DS(=
8, 12) | SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1538  	NPCM8XX_PINCFG(180,	r1, MFSE=
L3, 9,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DS(=
8, 12) | SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1539  	NPCM8XX_PINCFG(181,	r1, MFSE=
L3, 9,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1540  	NPCM8XX_PINCFG(182,	r1, MFSE=
L3, 9,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1541  	NPCM8XX_PINCFG(183,	spi3, MF=
SEL4, 16,	gpio1836, MFSEL6, 19,	none, NONE, 0,		none, NONE, 0,		none, NONE,=
 0,		DS(8, 12) | SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1542  	NPCM8XX_PINCFG(184,	spi3, MF=
SEL4, 16,	gpio1836, MFSEL6, 19,	none, NONE, 0,		none, NONE, 0,		none, NONE,=
 0,		DS(8, 12) | SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1543  	NPCM8XX_PINCFG(185,	spi3, MF=
SEL4, 16,	gpio1836, MFSEL6, 19,	none, NONE, 0,		none, NONE, 0,		none, NONE,=
 0,		DS(8, 12) | SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1544  	NPCM8XX_PINCFG(186,	spi3, MF=
SEL4, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		D=
S(8, 12)),
0a5f158322b21a Tomer Maimon 2022-07-14  1545  	NPCM8XX_PINCFG(187,	gpio187,=
 MFSEL7, 24,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,=
		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1546  	NPCM8XX_PINCFG(188,	spi3quad=
, MFSEL4, 20,	spi3cs2, MFSEL4, 18,	gpio1889, MFSEL7, 25,	none, NONE, 0,		no=
ne, NONE, 0,		DS(8, 12) | SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1547  	NPCM8XX_PINCFG(189,	spi3quad=
, MFSEL4, 20,	spi3cs3, MFSEL4, 19,	gpio1889, MFSEL7, 25,	none, NONE, 0,		no=
ne, NONE, 0,		DS(8, 12) | SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1548  	NPCM8XX_PINCFG(190,	gpio, FL=
OCKR1, 20,	nprd_smi, NONE, 0,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0=
,		DS(2, 4)),
0a5f158322b21a Tomer Maimon 2022-07-14  1549  	NPCM8XX_PINCFG(191,	spi1d23,=
 MFSEL5, 3,	spi1cs2, MFSEL5, 4,	fm1, MFSEL6, 17,	smb15, MFSEL7, 27,	none, N=
ONE, 0,		DS(0, 2)),
0a5f158322b21a Tomer Maimon 2022-07-14  1550  	NPCM8XX_PINCFG(192,	spi1d23,=
 MFSEL5, 3,	spi1cs3, MFSEL5, 5,	fm1, MFSEL6, 17,	smb15, MFSEL7, 27,	none, N=
ONE, 0,		DS(0, 2)),
0a5f158322b21a Tomer Maimon 2022-07-14  1551  	NPCM8XX_PINCFG(193,	r1, MFSE=
L3, 9,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1552  	NPCM8XX_PINCFG(194,	smb0b, I=
2CSEGSEL, 0,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0=
,		DS(0, 1)),
0a5f158322b21a Tomer Maimon 2022-07-14  1553  	NPCM8XX_PINCFG(195,	smb0b, I=
2CSEGSEL, 0,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0=
,		DS(0, 1)),
0a5f158322b21a Tomer Maimon 2022-07-14  1554  	NPCM8XX_PINCFG(196,	smb0c, I=
2CSEGSEL, 1,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0=
,		DS(0, 1)),
0a5f158322b21a Tomer Maimon 2022-07-14  1555  	NPCM8XX_PINCFG(197,	smb0den,=
 I2CSEGSEL, 22,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE=
, 0,		DS(0, 1)),
0a5f158322b21a Tomer Maimon 2022-07-14  1556  	NPCM8XX_PINCFG(198,	smb0d, I=
2CSEGSEL, 2,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0=
,		DS(0, 1)),
0a5f158322b21a Tomer Maimon 2022-07-14  1557  	NPCM8XX_PINCFG(199,	smb0d, I=
2CSEGSEL, 2,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0=
,		DS(0, 1)),
0a5f158322b21a Tomer Maimon 2022-07-14  1558  	NPCM8XX_PINCFG(200,	r2, MFSE=
L1, 14,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1559  	NPCM8XX_PINCFG(201,	r1, MFSE=
L3, 9,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
0a5f158322b21a Tomer Maimon 2022-07-14  1560  	NPCM8XX_PINCFG(202,	smb0c, I=
2CSEGSEL, 1,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0=
,		DS(0, 1)),
0a5f158322b21a Tomer Maimon 2022-07-14  1561  	NPCM8XX_PINCFG(203,	faninx, =
MFSEL3, 3,	spi1cs0, MFSEL3, 4,	fm1, MFSEL6, 17,	none, NONE, 0,		none, NONE,=
 0,		DS(8, 12)),
0a5f158322b21a Tomer Maimon 2022-07-14  1562  	NPCM8XX_PINCFG(208,	rg2, MFS=
EL4, 24,	ddr, MFSEL3, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		S=
LEW), /* DSCNT */
0a5f158322b21a Tomer Maimon 2022-07-14  1563  	NPCM8XX_PINCFG(209,	rg2, MFS=
EL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,=
		SLEW), /* DSCNT */
0a5f158322b21a Tomer Maimon 2022-07-14  1564  	NPCM8XX_PINCFG(210,	rg2, MFS=
EL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,=
		DS(8, 12) | SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1565  	NPCM8XX_PINCFG(211,	rg2, MFS=
EL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,=
		DS(8, 12) | SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1566  	NPCM8XX_PINCFG(212,	rg2, MFS=
EL4, 24,	ddr, MFSEL3, 26,	r3rxer, MFSEL6, 30,	none, NONE, 0,		none, NONE, 0=
,		DS(8, 12) | SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1567  	NPCM8XX_PINCFG(213,	rg2, MFS=
EL4, 24,	ddr, MFSEL3, 26,	r3oen, MFSEL5, 14,	none, NONE, 0,		none, NONE, 0,=
		DS(8, 12) | SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1568  	NPCM8XX_PINCFG(214,	rg2, MFS=
EL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,=
		DS(8, 12) | SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1569  	NPCM8XX_PINCFG(215,	rg2, MFS=
EL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,=
		DS(8, 12) | SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1570  	NPCM8XX_PINCFG(216,	rg2mdio,=
 MFSEL4, 23,	ddr, MFSEL3, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0=
,		DS(8, 12) | SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1571  	NPCM8XX_PINCFG(217,	rg2mdio,=
 MFSEL4, 23,	ddr, MFSEL3, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0=
,		DS(8, 12) | SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1572  	NPCM8XX_PINCFG(218,	wdog1, M=
FSEL3, 19,	smb16, MFSEL7, 30,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0=
,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1573  	NPCM8XX_PINCFG(219,	wdog2, M=
FSEL3, 20,	smb16, MFSEL7, 30,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0=
,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1574  	NPCM8XX_PINCFG(220,	smb12, M=
FSEL3, 5,	pwm8, MFSEL6, 11,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,	=
	SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1575  	NPCM8XX_PINCFG(221,	smb12, M=
FSEL3, 5,	pwm9, MFSEL6, 12,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,	=
	SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1576  	NPCM8XX_PINCFG(222,	smb13, M=
FSEL3, 6,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		S=
LEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1577  	NPCM8XX_PINCFG(223,	smb13, M=
FSEL3, 6,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		S=
LEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1578  	NPCM8XX_PINCFG(224,	spix, MF=
SEL4, 27,	fm2, MFSEL6, 18,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		=
DS(8, 12) | SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1579  	NPCM8XX_PINCFG(225,	spix, MF=
SEL4, 27,	fm2, MFSEL6, 18,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		=
GPO | DS(8, 12) | SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1580  	NPCM8XX_PINCFG(226,	none, NO=
NE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO=
 | DS(8, 12) | SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1581  	NPCM8XX_PINCFG(227,	spix, MF=
SEL4, 27,	fm2, MFSEL6, 18,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		=
DS(8, 12) | SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1582  	NPCM8XX_PINCFG(228,	spixcs1,=
 MFSEL4, 28,	fm2, MFSEL6, 18,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0=
,		DS(8, 12) | SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1583  	NPCM8XX_PINCFG(229,	spix, MF=
SEL4, 27,	fm2, MFSEL6, 18,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		=
DS(8, 12) | SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1584  	NPCM8XX_PINCFG(230,	spix, MF=
SEL4, 27,	fm2, MFSEL6, 18,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		=
DS(8, 12) | SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1585  	NPCM8XX_PINCFG(231,	clkreq, =
MFSEL4, 9,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		=
DS(4, 12) | SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1586  	NPCM8XX_PINCFG(233,	spi1cs1,=
 MFSEL5, 0,	fm1, MFSEL6, 17,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,=
		SLEWLPC), /* slewlpc ? */
0a5f158322b21a Tomer Maimon 2022-07-14  1587  	NPCM8XX_PINCFG(234,	pwm10, M=
FSEL6, 13,	smb20, MFSEL5, 28,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0=
,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1588  	NPCM8XX_PINCFG(235,	pwm11, M=
FSEL6, 14,	smb20, MFSEL5, 28,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0=
,		SLEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1589  	NPCM8XX_PINCFG(240,	i3c0, MF=
SEL5, 17,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		S=
LEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1590  	NPCM8XX_PINCFG(241,	i3c0, MF=
SEL5, 17,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		S=
LEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1591  	NPCM8XX_PINCFG(242,	i3c1, MF=
SEL5, 19,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		S=
LEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1592  	NPCM8XX_PINCFG(243,	i3c1, MF=
SEL5, 19,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		S=
LEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1593  	NPCM8XX_PINCFG(244,	i3c2, MF=
SEL5, 21,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		S=
LEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1594  	NPCM8XX_PINCFG(245,	i3c2, MF=
SEL5, 21,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		S=
LEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1595  	NPCM8XX_PINCFG(246,	i3c3, MF=
SEL5, 23,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		S=
LEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1596  	NPCM8XX_PINCFG(247,	i3c3, MF=
SEL5, 23,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		S=
LEW),
0a5f158322b21a Tomer Maimon 2022-07-14  1597  	NPCM8XX_PINCFG(251,	jm2, MFS=
EL5, 1,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SL=
EW),
0a5f158322b21a Tomer Maimon 2022-07-14  1598  	NPCM8XX_PINCFG(253,	none, NO=
NE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPI=
), /* SDHC1 power */
0a5f158322b21a Tomer Maimon 2022-07-14  1599  	NPCM8XX_PINCFG(254,	none, NO=
NE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPI=
), /* SDHC2 power */
0a5f158322b21a Tomer Maimon 2022-07-14  1600  	NPCM8XX_PINCFG(255,	none, NO=
NE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPI=
), /* DACOSEL */
0a5f158322b21a Tomer Maimon 2022-07-14  1601  };
0a5f158322b21a Tomer Maimon 2022-07-14  1602  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2572161813558671420==--

