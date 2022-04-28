Content-Type: multipart/mixed; boundary="===============5047727510649404844=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [sailus-media-tree:master 55/60] drivers/media/i2c/adv7180.c:573 adv7180_test_pattern() error: uninitialized symbol 'reg'.
Date: Fri, 29 Apr 2022 06:23:13 +0800
Message-ID: <202204290610.SVJgr8qV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5047727510649404844==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Fabio Estevam <festevam@gmail.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   git://linuxtv.org/sailus/media_tree.git master
head:   ea1280040a678f38a4ce6f1817933c04cfe74552
commit: f3b4b140d87dc7f256229f20a8d70429a7549aca [55/60] media: i2c: adv718=
0: Add support for the test patterns
:::::: branch date: 12 hours ago
:::::: commit date: 26 hours ago
config: microblaze-randconfig-m031-20220427 (https://download.01.org/0day-c=
i/archive/20220429/202204290610.SVJgr8qV-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/media/i2c/adv7180.c:573 adv7180_test_pattern() error: uninitialized=
 symbol 'reg'.

vim +/reg +573 drivers/media/i2c/adv7180.c

f3b4b140d87dc7f Fabio Estevam 2022-04-27  562  =

f3b4b140d87dc7f Fabio Estevam 2022-04-27  563  static int adv7180_test_patt=
ern(struct adv7180_state *state, int value)
f3b4b140d87dc7f Fabio Estevam 2022-04-27  564  {
f3b4b140d87dc7f Fabio Estevam 2022-04-27  565  	unsigned int reg;
f3b4b140d87dc7f Fabio Estevam 2022-04-27  566  =

f3b4b140d87dc7f Fabio Estevam 2022-04-27  567  	/* Map menu value into regi=
ster value */
f3b4b140d87dc7f Fabio Estevam 2022-04-27  568  	if (value < 3)
f3b4b140d87dc7f Fabio Estevam 2022-04-27  569  		reg =3D value;
f3b4b140d87dc7f Fabio Estevam 2022-04-27  570  	if (value =3D=3D 3)
f3b4b140d87dc7f Fabio Estevam 2022-04-27  571  		reg =3D 5;
f3b4b140d87dc7f Fabio Estevam 2022-04-27  572  =

f3b4b140d87dc7f Fabio Estevam 2022-04-27 @573  	adv7180_write(state, ADV718=
0_REG_ANALOG_CLAMP_CTL, reg);
f3b4b140d87dc7f Fabio Estevam 2022-04-27  574  =

f3b4b140d87dc7f Fabio Estevam 2022-04-27  575  	if (value =3D=3D ARRAY_SIZE=
(test_pattern_menu) - 1) {
f3b4b140d87dc7f Fabio Estevam 2022-04-27  576  		reg =3D adv7180_read(state=
, ADV7180_REG_DEF_VALUE_Y);
f3b4b140d87dc7f Fabio Estevam 2022-04-27  577  		reg &=3D ~ADV7180_DEF_VAL_=
EN;
f3b4b140d87dc7f Fabio Estevam 2022-04-27  578  		adv7180_write(state, ADV71=
80_REG_DEF_VALUE_Y, reg);
f3b4b140d87dc7f Fabio Estevam 2022-04-27  579  		return 0;
f3b4b140d87dc7f Fabio Estevam 2022-04-27  580  	}
f3b4b140d87dc7f Fabio Estevam 2022-04-27  581  =

f3b4b140d87dc7f Fabio Estevam 2022-04-27  582  	reg =3D adv7180_read(state,=
 ADV7180_REG_DEF_VALUE_Y);
f3b4b140d87dc7f Fabio Estevam 2022-04-27  583  	reg |=3D ADV7180_DEF_VAL_EN=
 | ADV7180_DEF_VAL_AUTO_EN;
f3b4b140d87dc7f Fabio Estevam 2022-04-27  584  	adv7180_write(state, ADV718=
0_REG_DEF_VALUE_Y, reg);
f3b4b140d87dc7f Fabio Estevam 2022-04-27  585  =

f3b4b140d87dc7f Fabio Estevam 2022-04-27  586  	return 0;
f3b4b140d87dc7f Fabio Estevam 2022-04-27  587  }
f3b4b140d87dc7f Fabio Estevam 2022-04-27  588  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5047727510649404844==--

