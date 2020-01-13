Content-Type: multipart/mixed; boundary="===============4370640574980937185=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v3 4/4] power: supply: bq2515x: Introduce the bq2515x family
Date: Mon, 13 Jan 2020 13:33:20 +0300
Message-ID: <20200113103320.GA9488@kadam>
In-Reply-To: <20200108202314.11791-5-dmurphy@ti.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4370640574980937185==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Dan,

url:    https://github.com/0day-ci/linux/commits/Dan-Murphy/BQ25150-155-Cha=
rger/20200110-055201
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-sup=
ply.git for-next

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/power/supply/bq2515x_charger.c:316 bq2515x_set_ilim_lvl() error: bu=
ffer overflow 'bq2515x_ilim_lvl_values' 8 <=3D 8

Old smatch warnings:
drivers/power/supply/bq2515x_charger.c:320 bq2515x_set_ilim_lvl() error: bu=
ffer overflow 'bq2515x_ilim_lvl_values' 8 <=3D 8
drivers/power/supply/bq2515x_charger.c:322 bq2515x_set_ilim_lvl() error: bu=
ffer overflow 'bq2515x_ilim_lvl_values' 8 <=3D 8

# https://github.com/0day-ci/linux/commit/f5918978695e4e465d54f5c34f356af86=
874b051
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout f5918978695e4e465d54f5c34f356af86874b051
vim +/bq2515x_ilim_lvl_values +316 drivers/power/supply/bq2515x_charger.c

f5918978695e4e Dan Murphy 2020-01-08  311  static int bq2515x_set_ilim_lvl(=
struct bq2515x_device *bq2515x, int val)
f5918978695e4e Dan Murphy 2020-01-08  312  {
f5918978695e4e Dan Murphy 2020-01-08  313  	int i;
f5918978695e4e Dan Murphy 2020-01-08  314  =

f5918978695e4e Dan Murphy 2020-01-08  315  	for (i =3D 0; i <=3D ARRAY_SIZE=
(bq2515x_ilim_lvl_values); i++) {
                                                            ^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^
Typo.  This should be < ARRAY_SIZE().

f5918978695e4e Dan Murphy 2020-01-08 @316  		if (val =3D=3D bq2515x_ilim_lv=
l_values[i])
f5918978695e4e Dan Murphy 2020-01-08  317  			break;
f5918978695e4e Dan Murphy 2020-01-08  318  =

f5918978695e4e Dan Murphy 2020-01-08  319  		if (val > bq2515x_ilim_lvl_val=
ues[i - 1] &&
f5918978695e4e Dan Murphy 2020-01-08  320  		    val < bq2515x_ilim_lvl_val=
ues[i]) {
f5918978695e4e Dan Murphy 2020-01-08  321  			if (val - bq2515x_ilim_lvl_va=
lues[i - 1] <
f5918978695e4e Dan Murphy 2020-01-08  322  			    bq2515x_ilim_lvl_values[i=
] - val) {
f5918978695e4e Dan Murphy 2020-01-08  323  				i =3D i - 1;
f5918978695e4e Dan Murphy 2020-01-08  324  				break;
f5918978695e4e Dan Murphy 2020-01-08  325  			}
f5918978695e4e Dan Murphy 2020-01-08  326  		}
f5918978695e4e Dan Murphy 2020-01-08  327  	}
f5918978695e4e Dan Murphy 2020-01-08  328  =

f5918978695e4e Dan Murphy 2020-01-08  329  	return regmap_write(bq2515x->re=
gmap, BQ2515X_ILIMCTRL, i);
f5918978695e4e Dan Murphy 2020-01-08  330  }

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============4370640574980937185==--

