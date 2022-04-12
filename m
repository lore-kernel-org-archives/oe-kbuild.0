Content-Type: multipart/mixed; boundary="===============7190948520921640407=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 4/4] leds: pca955x: Add HW blink support
Date: Tue, 12 Apr 2022 19:22:41 +0800
Message-ID: <202204121953.zHZcX6EV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7190948520921640407==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220411162033.39613-5-eajames@linux.ibm.com>
References: <20220411162033.39613-5-eajames@linux.ibm.com>
TO: Eddie James <eajames@linux.ibm.com>
TO: linux-leds(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: pavel(a)ucw.cz
CC: patrick(a)stwcx.xyz
CC: andy.shevchenko(a)gmail.com
CC: openbmc(a)lists.ozlabs.org
CC: joel(a)jms.id.au
CC: Eddie James <eajames@linux.ibm.com>

Hi Eddie,

I love your patch! Perhaps something to improve:

[auto build test WARNING on pavel-leds/for-next]
[also build test WARNING on linus/master v5.18-rc2 next-20220412]
[cannot apply to linux/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Eddie-James/leds-pca=
955x-Add-HW-blink-support/20220412-002330
base:   git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git =
for-next
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: i386-randconfig-m021-20220411 (https://download.01.org/0day-ci/arch=
ive/20220412/202204121953.zHZcX6EV-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/leds/leds-pca955x.c:455 pca955x_led_blink() error: uninitialized sy=
mbol 'ret'.

vim +/ret +455 drivers/leds/leds-pca955x.c

3b7b1899f6cc6d Eddie James      2022-04-11  389  =

3b7b1899f6cc6d Eddie James      2022-04-11  390  static int pca955x_led_bli=
nk(struct led_classdev *led_cdev,
3b7b1899f6cc6d Eddie James      2022-04-11  391  			     unsigned long *del=
ay_on, unsigned long *delay_off)
3b7b1899f6cc6d Eddie James      2022-04-11  392  {
3b7b1899f6cc6d Eddie James      2022-04-11  393  	struct pca955x_led *pca95=
5x_led =3D led_to_pca955x(led_cdev);
3b7b1899f6cc6d Eddie James      2022-04-11  394  	struct pca955x *pca955x =
=3D pca955x_led->pca955x;
3b7b1899f6cc6d Eddie James      2022-04-11  395  	unsigned long p =3D *dela=
y_on + *delay_off;
3b7b1899f6cc6d Eddie James      2022-04-11  396  	int ret;
3b7b1899f6cc6d Eddie James      2022-04-11  397  =

3b7b1899f6cc6d Eddie James      2022-04-11  398  	mutex_lock(&pca955x->lock=
);
3b7b1899f6cc6d Eddie James      2022-04-11  399  =

3b7b1899f6cc6d Eddie James      2022-04-11  400  	if (p) {
3b7b1899f6cc6d Eddie James      2022-04-11  401  		if (*delay_on !=3D *dela=
y_off) {
3b7b1899f6cc6d Eddie James      2022-04-11  402  			ret =3D -EINVAL;
3b7b1899f6cc6d Eddie James      2022-04-11  403  			goto out;
3b7b1899f6cc6d Eddie James      2022-04-11  404  		}
3b7b1899f6cc6d Eddie James      2022-04-11  405  =

3b7b1899f6cc6d Eddie James      2022-04-11  406  		if (p < pca955x_psc_to_p=
eriod(pca955x, 0) ||
3b7b1899f6cc6d Eddie James      2022-04-11  407  		    p > pca955x_psc_to_p=
eriod(pca955x, 0xff)) {
3b7b1899f6cc6d Eddie James      2022-04-11  408  			ret =3D -EINVAL;
3b7b1899f6cc6d Eddie James      2022-04-11  409  			goto out;
3b7b1899f6cc6d Eddie James      2022-04-11  410  		}
3b7b1899f6cc6d Eddie James      2022-04-11  411  	} else {
3b7b1899f6cc6d Eddie James      2022-04-11  412  		p =3D pca955x->active_bl=
ink ? pca955x->blink_period :
3b7b1899f6cc6d Eddie James      2022-04-11  413  			PCA955X_BLINK_DEFAULT_M=
S;
3b7b1899f6cc6d Eddie James      2022-04-11  414  	}
3b7b1899f6cc6d Eddie James      2022-04-11  415  =

3b7b1899f6cc6d Eddie James      2022-04-11  416  	if (!pca955x->active_blin=
k ||
3b7b1899f6cc6d Eddie James      2022-04-11  417  	    pca955x->active_blink=
 =3D=3D BIT(pca955x_led->led_num) ||
3b7b1899f6cc6d Eddie James      2022-04-11  418  	    pca955x->blink_period=
 =3D=3D p) {
3b7b1899f6cc6d Eddie James      2022-04-11  419  		u8 psc =3D pca955x_perio=
d_to_psc(pca955x, p);
f46e9203d9a100 Nate Case        2008-07-16  420  =

3b7b1899f6cc6d Eddie James      2022-04-11  421  		if (!test_and_set_bit(pc=
a955x_led->led_num,
3b7b1899f6cc6d Eddie James      2022-04-11  422  				      &pca955x->active=
_blink)) {
3b7b1899f6cc6d Eddie James      2022-04-11  423  			u8 ls;
3b7b1899f6cc6d Eddie James      2022-04-11  424  			int reg =3D pca955x_led=
->led_num / 4;
3b7b1899f6cc6d Eddie James      2022-04-11  425  			int bit =3D pca955x_led=
->led_num % 4;
3b7b1899f6cc6d Eddie James      2022-04-11  426  =

3b7b1899f6cc6d Eddie James      2022-04-11  427  			ret =3D pca955x_read_ls=
(pca955x, reg, &ls);
3b7b1899f6cc6d Eddie James      2022-04-11  428  			if (ret)
3b7b1899f6cc6d Eddie James      2022-04-11  429  				goto out;
3b7b1899f6cc6d Eddie James      2022-04-11  430  =

3b7b1899f6cc6d Eddie James      2022-04-11  431  			ls =3D pca955x_ledsel(l=
s, bit, PCA955X_LS_BLINK0);
9e58c2a7bb91f6 Eddie James      2022-04-11  432  			ret =3D pca955x_write_l=
s(pca955x, reg, ls);
3b7b1899f6cc6d Eddie James      2022-04-11  433  			if (ret)
3b7b1899f6cc6d Eddie James      2022-04-11  434  				goto out;
3b7b1899f6cc6d Eddie James      2022-04-11  435  		}
3b7b1899f6cc6d Eddie James      2022-04-11  436  =

3b7b1899f6cc6d Eddie James      2022-04-11  437  		if (pca955x->blink_perio=
d !=3D p) {
3b7b1899f6cc6d Eddie James      2022-04-11  438  			pca955x->blink_period =
=3D p;
3b7b1899f6cc6d Eddie James      2022-04-11  439  			ret =3D pca955x_write_p=
sc(pca955x, 0, psc);
3b7b1899f6cc6d Eddie James      2022-04-11  440  			if (ret)
3b7b1899f6cc6d Eddie James      2022-04-11  441  				goto out;
3b7b1899f6cc6d Eddie James      2022-04-11  442  		}
3b7b1899f6cc6d Eddie James      2022-04-11  443  =

3b7b1899f6cc6d Eddie James      2022-04-11  444  		p =3D pca955x_psc_to_per=
iod(pca955x, psc);
3b7b1899f6cc6d Eddie James      2022-04-11  445  		p /=3D 2;
3b7b1899f6cc6d Eddie James      2022-04-11  446  		*delay_on =3D p;
3b7b1899f6cc6d Eddie James      2022-04-11  447  		*delay_off =3D p;
3b7b1899f6cc6d Eddie James      2022-04-11  448  	} else {
3b7b1899f6cc6d Eddie James      2022-04-11  449  		ret =3D -EBUSY;
3b7b1899f6cc6d Eddie James      2022-04-11  450  	}
e7e11d8ba807d4 Alexander Stein  2012-05-29  451  =

1591caf2d5eafd C=C3=A9dric Le Goater 2017-08-30  452  out:
e7e11d8ba807d4 Alexander Stein  2012-05-29  453  	mutex_unlock(&pca955x->lo=
ck);
f46e9203d9a100 Nate Case        2008-07-16  454  =

1591caf2d5eafd C=C3=A9dric Le Goater 2017-08-30 @455  	return ret;
f46e9203d9a100 Nate Case        2008-07-16  456  }
f46e9203d9a100 Nate Case        2008-07-16  457  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7190948520921640407==--

