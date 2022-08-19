Content-Type: multipart/mixed; boundary="===============7889093061151848194=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 1/3] driver: input: matric-keypad: switch to gpiod
Date: Fri, 19 Aug 2022 23:53:02 +0800
Message-ID: <202208192340.m1XMlTj5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7889093061151848194==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220819065946.9572-1-Gireesh.Hiremath@in.bosch.com>
References: <20220819065946.9572-1-Gireesh.Hiremath@in.bosch.com>
TO: Gireesh.Hiremath(a)in.bosch.com
TO: linux-omap(a)vger.kernel.org
TO: devicetree(a)vger.kernel.org
TO: linux-kernel(a)vger.kernel.org
TO: linux-input(a)vger.kernel.org
TO: bcousson(a)baylibre.com
TO: tony(a)atomide.com
TO: robh+dt(a)kernel.org
TO: krzysztof.kozlowski+dt(a)linaro.org
TO: dmitry.torokhov(a)gmail.com
TO: mkorpershoek(a)baylibre.com
TO: davidgow(a)google.com
TO: m.felsch(a)pengutronix.de
TO: swboyd(a)chromium.org
TO: fengping.yu(a)mediatek.com
TO: y.oudjana(a)protonmail.com
TO: rdunlap(a)infradead.org
TO: colin.king(a)intel.com
TO: Gireesh.Hiremath(a)in.bosch.com
CC: sjoerd.simons(a)collabora.co.uk
CC: VinayKumar.Shettar(a)in.bosch.com
CC: Govindaraji.Sivanantham(a)in.bosch.com
CC: anaclaudia.dias(a)de.bosch.com

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on linus/master v6.0-rc1 next-20220819]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gireesh-Hiremath-in-=
bosch-com/driver-input-matric-keypad-switch-to-gpiod/20220819-151155
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
819/202208192340.m1XMlTj5-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/input/keyboard/matrix_keypad.c:432 matrix_keypad_parse_dt() error: =
uninitialized symbol 'ret'.

Old smatch warnings:
drivers/input/keyboard/matrix_keypad.c:439 matrix_keypad_parse_dt() error: =
uninitialized symbol 'ret'.

vim +/ret +432 drivers/input/keyboard/matrix_keypad.c

b83643ebf22423 Dmitry Torokhov  2012-04-20  378  =

4a83eecff65bd3 AnilKumar Ch     2012-11-20  379  #ifdef CONFIG_OF
5298cc4cc753bb Bill Pemberton   2012-11-23  380  static struct matrix_keypa=
d_platform_data *
4a83eecff65bd3 AnilKumar Ch     2012-11-20  381  matrix_keypad_parse_dt(str=
uct device *dev)
4a83eecff65bd3 AnilKumar Ch     2012-11-20  382  {
4a83eecff65bd3 AnilKumar Ch     2012-11-20  383  	struct matrix_keypad_plat=
form_data *pdata;
4a83eecff65bd3 AnilKumar Ch     2012-11-20  384  	struct device_node *np =
=3D dev->of_node;
90bb4ee8dc3c27 Gireesh Hiremath 2022-08-19  385  	struct gpio_desc **gpios;
90bb4ee8dc3c27 Gireesh Hiremath 2022-08-19  386  	struct gpio_desc *desc;
d55bda1b3e7c5a Christian Hoff   2018-11-12  387  	int ret, i, nrow, ncol;
4a83eecff65bd3 AnilKumar Ch     2012-11-20  388  =

4a83eecff65bd3 AnilKumar Ch     2012-11-20  389  	if (!np) {
4a83eecff65bd3 AnilKumar Ch     2012-11-20  390  		dev_err(dev, "device lac=
ks DT data\n");
4a83eecff65bd3 AnilKumar Ch     2012-11-20  391  		return ERR_PTR(-ENODEV);
4a83eecff65bd3 AnilKumar Ch     2012-11-20  392  	}
4a83eecff65bd3 AnilKumar Ch     2012-11-20  393  =

4a83eecff65bd3 AnilKumar Ch     2012-11-20  394  	pdata =3D devm_kzalloc(de=
v, sizeof(*pdata), GFP_KERNEL);
4a83eecff65bd3 AnilKumar Ch     2012-11-20  395  	if (!pdata) {
4a83eecff65bd3 AnilKumar Ch     2012-11-20  396  		dev_err(dev, "could not =
allocate memory for platform data\n");
4a83eecff65bd3 AnilKumar Ch     2012-11-20  397  		return ERR_PTR(-ENOMEM);
4a83eecff65bd3 AnilKumar Ch     2012-11-20  398  	}
4a83eecff65bd3 AnilKumar Ch     2012-11-20  399  =

90bb4ee8dc3c27 Gireesh Hiremath 2022-08-19  400  	pdata->num_row_gpios =3D =
nrow =3D gpiod_count(dev, "row");
90bb4ee8dc3c27 Gireesh Hiremath 2022-08-19  401  	pdata->num_col_gpios =3D =
ncol =3D gpiod_count(dev, "col");
e80beb27d2f81a Grant Likely     2013-02-12  402  	if (nrow <=3D 0 || ncol <=
=3D 0) {
4a83eecff65bd3 AnilKumar Ch     2012-11-20  403  		dev_err(dev, "number of =
keypad rows/columns not specified\n");
4a83eecff65bd3 AnilKumar Ch     2012-11-20  404  		return ERR_PTR(-EINVAL);
4a83eecff65bd3 AnilKumar Ch     2012-11-20  405  	}
4a83eecff65bd3 AnilKumar Ch     2012-11-20  406  =

4a83eecff65bd3 AnilKumar Ch     2012-11-20  407  	if (of_get_property(np, "=
linux,no-autorepeat", NULL))
4a83eecff65bd3 AnilKumar Ch     2012-11-20  408  		pdata->no_autorepeat =3D=
 true;
aeda5003d0b987 Dmitry Torokhov  2015-07-16  409  =

aeda5003d0b987 Dmitry Torokhov  2015-07-16  410  	pdata->wakeup =3D of_prop=
erty_read_bool(np, "wakeup-source") ||
aeda5003d0b987 Dmitry Torokhov  2015-07-16  411  			of_property_read_bool(n=
p, "linux,wakeup"); /* legacy */
aeda5003d0b987 Dmitry Torokhov  2015-07-16  412  =

aa0e26bb786b00 David Rivshin    2017-03-29  413  	pdata->drive_inactive_col=
s =3D
aa0e26bb786b00 David Rivshin    2017-03-29  414  		of_property_read_bool(np=
, "drive-inactive-cols");
aa0e26bb786b00 David Rivshin    2017-03-29  415  =

4a83eecff65bd3 AnilKumar Ch     2012-11-20  416  	of_property_read_u32(np, =
"debounce-delay-ms", &pdata->debounce_ms);
4a83eecff65bd3 AnilKumar Ch     2012-11-20  417  	of_property_read_u32(np, =
"col-scan-delay-us",
4a83eecff65bd3 AnilKumar Ch     2012-11-20  418  						&pdata->col_scan_del=
ay_us);
4a83eecff65bd3 AnilKumar Ch     2012-11-20  419  =

a86854d0c599b3 Kees Cook        2018-06-12  420  	gpios =3D devm_kcalloc(de=
v,
a86854d0c599b3 Kees Cook        2018-06-12  421  			     pdata->num_row_gpi=
os + pdata->num_col_gpios,
90bb4ee8dc3c27 Gireesh Hiremath 2022-08-19  422  			     sizeof(*gpios),
4a83eecff65bd3 AnilKumar Ch     2012-11-20  423  			     GFP_KERNEL);
4a83eecff65bd3 AnilKumar Ch     2012-11-20  424  	if (!gpios) {
4a83eecff65bd3 AnilKumar Ch     2012-11-20  425  		dev_err(dev, "could not =
allocate memory for gpios\n");
4a83eecff65bd3 AnilKumar Ch     2012-11-20  426  		return ERR_PTR(-ENOMEM);
4a83eecff65bd3 AnilKumar Ch     2012-11-20  427  	}
4a83eecff65bd3 AnilKumar Ch     2012-11-20  428  =

d55bda1b3e7c5a Christian Hoff   2018-11-12  429  	for (i =3D 0; i < nrow; i=
++) {
90bb4ee8dc3c27 Gireesh Hiremath 2022-08-19  430  		desc =3D devm_gpiod_get_=
index(dev, "row", i, GPIOD_IN);
90bb4ee8dc3c27 Gireesh Hiremath 2022-08-19  431  		if (IS_ERR(desc))
d55bda1b3e7c5a Christian Hoff   2018-11-12 @432  			return ERR_PTR(ret);
90bb4ee8dc3c27 Gireesh Hiremath 2022-08-19  433  		gpios[i] =3D desc;
d55bda1b3e7c5a Christian Hoff   2018-11-12  434  	}
4a83eecff65bd3 AnilKumar Ch     2012-11-20  435  =

d55bda1b3e7c5a Christian Hoff   2018-11-12  436  	for (i =3D 0; i < ncol; i=
++) {
90bb4ee8dc3c27 Gireesh Hiremath 2022-08-19  437  		desc =3D devm_gpiod_get_=
index(dev, "col", i, GPIOD_IN);
90bb4ee8dc3c27 Gireesh Hiremath 2022-08-19  438  		if (IS_ERR(desc))
d55bda1b3e7c5a Christian Hoff   2018-11-12  439  			return ERR_PTR(ret);
90bb4ee8dc3c27 Gireesh Hiremath 2022-08-19  440  		gpios[nrow + i] =3D desc;
d55bda1b3e7c5a Christian Hoff   2018-11-12  441  	}
4a83eecff65bd3 AnilKumar Ch     2012-11-20  442  =

4a83eecff65bd3 AnilKumar Ch     2012-11-20  443  	pdata->row_gpios =3D gpio=
s;
4a83eecff65bd3 AnilKumar Ch     2012-11-20  444  	pdata->col_gpios =3D &gpi=
os[pdata->num_row_gpios];
4a83eecff65bd3 AnilKumar Ch     2012-11-20  445  =

4a83eecff65bd3 AnilKumar Ch     2012-11-20  446  	return pdata;
4a83eecff65bd3 AnilKumar Ch     2012-11-20  447  }
4a83eecff65bd3 AnilKumar Ch     2012-11-20  448  #else
4a83eecff65bd3 AnilKumar Ch     2012-11-20  449  static inline struct matri=
x_keypad_platform_data *
4a83eecff65bd3 AnilKumar Ch     2012-11-20  450  matrix_keypad_parse_dt(str=
uct device *dev)
4a83eecff65bd3 AnilKumar Ch     2012-11-20  451  {
4a83eecff65bd3 AnilKumar Ch     2012-11-20  452  	dev_err(dev, "no platform=
 data defined\n");
4a83eecff65bd3 AnilKumar Ch     2012-11-20  453  =

4a83eecff65bd3 AnilKumar Ch     2012-11-20  454  	return ERR_PTR(-EINVAL);
4a83eecff65bd3 AnilKumar Ch     2012-11-20  455  }
4a83eecff65bd3 AnilKumar Ch     2012-11-20  456  #endif
4a83eecff65bd3 AnilKumar Ch     2012-11-20  457  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7889093061151848194==--

