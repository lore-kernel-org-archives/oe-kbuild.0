Content-Type: multipart/mixed; boundary="===============8875936725183349498=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/i3c/master.c:2279 i3c_i2c_notifier_call() error: uninitialized symbol 'ret'.
Date: Mon, 04 Apr 2022 02:13:12 +0800
Message-ID: <202204040221.Zr8Q8QIq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8875936725183349498==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jamie Iles <quic_jiles@quicinc.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   be2d3ecedd9911fbfd7e55cc9ceac5f8b79ae4cf
commit: 72a4501b5d089772671360a6ec74d5350acf8c2e i3c: support dynamically a=
dded i2c devices
date:   4 weeks ago
:::::: branch date: 22 hours ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20404/202204040221.Zr8Q8QIq-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/i3c/master.c:2279 i3c_i2c_notifier_call() error: uninitialized symb=
ol 'ret'.

Old smatch warnings:
drivers/i3c/master.c:459 mode_show() warn: unsigned 'i3cbus->mode' is never=
 less than zero.
drivers/i3c/master.c:2311 i3c_master_i2c_adapter_init() error: potentially =
dereferencing uninitialized 'i2cdev'.

vim +/ret +2279 drivers/i3c/master.c

3a379bbcea0af62 Boris Brezillon 2017-07-19  2247  =

72a4501b5d08977 Jamie Iles      2022-01-17  2248  static int i3c_i2c_notifi=
er_call(struct notifier_block *nb, unsigned long action,
72a4501b5d08977 Jamie Iles      2022-01-17  2249  				 void *data)
72a4501b5d08977 Jamie Iles      2022-01-17  2250  {
72a4501b5d08977 Jamie Iles      2022-01-17  2251  	struct i2c_adapter *adap;
72a4501b5d08977 Jamie Iles      2022-01-17  2252  	struct i2c_client *clien=
t;
72a4501b5d08977 Jamie Iles      2022-01-17  2253  	struct device *dev =3D d=
ata;
72a4501b5d08977 Jamie Iles      2022-01-17  2254  	struct i3c_master_contro=
ller *master;
72a4501b5d08977 Jamie Iles      2022-01-17  2255  	int ret;
72a4501b5d08977 Jamie Iles      2022-01-17  2256  =

72a4501b5d08977 Jamie Iles      2022-01-17  2257  	if (dev->type !=3D &i2c_=
client_type)
72a4501b5d08977 Jamie Iles      2022-01-17  2258  		return 0;
72a4501b5d08977 Jamie Iles      2022-01-17  2259  =

72a4501b5d08977 Jamie Iles      2022-01-17  2260  	client =3D to_i2c_client=
(dev);
72a4501b5d08977 Jamie Iles      2022-01-17  2261  	adap =3D client->adapter;
72a4501b5d08977 Jamie Iles      2022-01-17  2262  =

72a4501b5d08977 Jamie Iles      2022-01-17  2263  	if (adap->algo !=3D &i3c=
_master_i2c_algo)
72a4501b5d08977 Jamie Iles      2022-01-17  2264  		return 0;
72a4501b5d08977 Jamie Iles      2022-01-17  2265  =

72a4501b5d08977 Jamie Iles      2022-01-17  2266  	master =3D i2c_adapter_t=
o_i3c_master(adap);
72a4501b5d08977 Jamie Iles      2022-01-17  2267  =

72a4501b5d08977 Jamie Iles      2022-01-17  2268  	i3c_bus_maintenance_lock=
(&master->bus);
72a4501b5d08977 Jamie Iles      2022-01-17  2269  	switch (action) {
72a4501b5d08977 Jamie Iles      2022-01-17  2270  	case BUS_NOTIFY_ADD_DEVI=
CE:
72a4501b5d08977 Jamie Iles      2022-01-17  2271  		ret =3D i3c_master_i2c_=
attach(adap, client);
72a4501b5d08977 Jamie Iles      2022-01-17  2272  		break;
72a4501b5d08977 Jamie Iles      2022-01-17  2273  	case BUS_NOTIFY_DEL_DEVI=
CE:
72a4501b5d08977 Jamie Iles      2022-01-17  2274  		ret =3D i3c_master_i2c_=
detach(adap, client);
72a4501b5d08977 Jamie Iles      2022-01-17  2275  		break;
72a4501b5d08977 Jamie Iles      2022-01-17  2276  	}
72a4501b5d08977 Jamie Iles      2022-01-17  2277  	i3c_bus_maintenance_unlo=
ck(&master->bus);
72a4501b5d08977 Jamie Iles      2022-01-17  2278  =

72a4501b5d08977 Jamie Iles      2022-01-17 @2279  	return ret;
72a4501b5d08977 Jamie Iles      2022-01-17  2280  }
72a4501b5d08977 Jamie Iles      2022-01-17  2281  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8875936725183349498==--

