Content-Type: multipart/mixed; boundary="===============2489948399285781566=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/i3c/master.c:2207 i3c_master_i2c_attach() warn: passing a valid pointer to 'PTR_ERR'
Date: Sun, 03 Apr 2022 23:59:34 +0800
Message-ID: <202204032346.k676YzCx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2489948399285781566==
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
:::::: branch date: 20 hours ago
:::::: commit date: 4 weeks ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
403/202204032346.k676YzCx-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/i3c/master.c:2207 i3c_master_i2c_attach() warn: passing a valid poi=
nter to 'PTR_ERR'

Old smatch warnings:
drivers/i3c/master.c:459 mode_show() warn: unsigned 'i3cbus->mode' is never=
 less than zero.
drivers/i3c/master.c:1590 i3c_master_set_info() warn: passing a valid point=
er to 'PTR_ERR'
drivers/i3c/master.c:1695 i3c_master_bus_init() warn: passing a valid point=
er to 'PTR_ERR'
drivers/i3c/master.c:1866 i3c_master_add_i3c_dev_locked() warn: passing a v=
alid pointer to 'PTR_ERR'
drivers/i3c/master.c:2279 i3c_i2c_notifier_call() error: uninitialized symb=
ol 'ret'.
drivers/i3c/master.c:2311 i3c_master_i2c_adapter_init() error: potentially =
dereferencing uninitialized 'i2cdev'.

vim +/PTR_ERR +2207 drivers/i3c/master.c

72a4501b5d0897 Jamie Iles 2022-01-17  2185  =

72a4501b5d0897 Jamie Iles 2022-01-17  2186  static int i3c_master_i2c_attac=
h(struct i2c_adapter *adap, struct i2c_client *client)
72a4501b5d0897 Jamie Iles 2022-01-17  2187  {
72a4501b5d0897 Jamie Iles 2022-01-17  2188  	struct i3c_master_controller *=
master =3D i2c_adapter_to_i3c_master(adap);
72a4501b5d0897 Jamie Iles 2022-01-17  2189  	enum i3c_addr_slot_status stat=
us;
72a4501b5d0897 Jamie Iles 2022-01-17  2190  	struct i2c_dev_desc *i2cdev;
72a4501b5d0897 Jamie Iles 2022-01-17  2191  	int ret;
72a4501b5d0897 Jamie Iles 2022-01-17  2192  =

72a4501b5d0897 Jamie Iles 2022-01-17  2193  	/* Already added by board info=
? */
72a4501b5d0897 Jamie Iles 2022-01-17  2194  	if (i3c_master_find_i2c_dev_by=
_addr(master, client->addr))
72a4501b5d0897 Jamie Iles 2022-01-17  2195  		return 0;
72a4501b5d0897 Jamie Iles 2022-01-17  2196  =

72a4501b5d0897 Jamie Iles 2022-01-17  2197  	status =3D i3c_bus_get_addr_sl=
ot_status(&master->bus, client->addr);
72a4501b5d0897 Jamie Iles 2022-01-17  2198  	if (status !=3D I3C_ADDR_SLOT_=
FREE)
72a4501b5d0897 Jamie Iles 2022-01-17  2199  		return -EBUSY;
72a4501b5d0897 Jamie Iles 2022-01-17  2200  =

72a4501b5d0897 Jamie Iles 2022-01-17  2201  	i3c_bus_set_addr_slot_status(&=
master->bus, client->addr,
72a4501b5d0897 Jamie Iles 2022-01-17  2202  				     I3C_ADDR_SLOT_I2C_DEV);
72a4501b5d0897 Jamie Iles 2022-01-17  2203  =

72a4501b5d0897 Jamie Iles 2022-01-17  2204  	i2cdev =3D i3c_master_alloc_i2=
c_dev(master, client->addr,
72a4501b5d0897 Jamie Iles 2022-01-17  2205  					  i3c_master_i2c_get_lvr(c=
lient));
72a4501b5d0897 Jamie Iles 2022-01-17  2206  	if (IS_ERR(i2cdev)) {
72a4501b5d0897 Jamie Iles 2022-01-17 @2207  		ret =3D PTR_ERR(i2cdev);
72a4501b5d0897 Jamie Iles 2022-01-17  2208  		goto out_clear_status;
72a4501b5d0897 Jamie Iles 2022-01-17  2209  	}
72a4501b5d0897 Jamie Iles 2022-01-17  2210  =

72a4501b5d0897 Jamie Iles 2022-01-17  2211  	ret =3D i3c_master_attach_i2c_=
dev(master, i2cdev);
72a4501b5d0897 Jamie Iles 2022-01-17  2212  	if (ret)
72a4501b5d0897 Jamie Iles 2022-01-17  2213  		goto out_free_dev;
72a4501b5d0897 Jamie Iles 2022-01-17  2214  =

72a4501b5d0897 Jamie Iles 2022-01-17  2215  	return 0;
72a4501b5d0897 Jamie Iles 2022-01-17  2216  =

72a4501b5d0897 Jamie Iles 2022-01-17  2217  out_free_dev:
72a4501b5d0897 Jamie Iles 2022-01-17  2218  	i3c_master_free_i2c_dev(i2cdev=
);
72a4501b5d0897 Jamie Iles 2022-01-17  2219  out_clear_status:
72a4501b5d0897 Jamie Iles 2022-01-17  2220  	i3c_bus_set_addr_slot_status(&=
master->bus, client->addr,
72a4501b5d0897 Jamie Iles 2022-01-17  2221  				     I3C_ADDR_SLOT_FREE);
72a4501b5d0897 Jamie Iles 2022-01-17  2222  =

72a4501b5d0897 Jamie Iles 2022-01-17  2223  	return ret;
72a4501b5d0897 Jamie Iles 2022-01-17  2224  }
72a4501b5d0897 Jamie Iles 2022-01-17  2225  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2489948399285781566==--

