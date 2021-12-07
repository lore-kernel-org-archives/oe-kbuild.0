Content-Type: multipart/mixed; boundary="===============7719764137280807231=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/input/touchscreen/ili210x.c:664 ili251x_firmware_busy() error: uninitialized symbol 'data'.
Date: Tue, 07 Dec 2021 11:34:52 +0800
Message-ID: <202112071130.VjoibOrG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7719764137280807231==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Marek Vasut <marex@denx.de>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   cd8c917a56f20f48748dd43d9ae3caff51d5b987
commit: c6ac8f0b4ca927316eb40e1e9ba83df5d29f3793 Input: ili210x - add ili25=
1x firmware update support
date:   7 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 7 weeks ago
config: x86_64-randconfig-m001-20211206 (https://download.01.org/0day-ci/ar=
chive/20211207/202112071130.VjoibOrG-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/input/touchscreen/ili210x.c:664 ili251x_firmware_busy() error: unin=
itialized symbol 'data'.

Old smatch warnings:
drivers/input/touchscreen/ili210x.c:600 ili251x_firmware_to_buffer() error:=
 uninitialized symbol 'fw_addr'.
drivers/input/touchscreen/ili210x.c:600 ili251x_firmware_to_buffer() error:=
 uninitialized symbol 'fw_len'.
drivers/input/touchscreen/ili210x.c:690 ili251x_firmware_write_to_ic() warn=
: right shifting more than type allows 16 vs 16
drivers/input/touchscreen/ili210x.c:691 ili251x_firmware_write_to_ic() warn=
: right shifting more than type allows 16 vs 16

vim +/data +664 drivers/input/touchscreen/ili210x.c

c6ac8f0b4ca927 Marek Vasut 2021-10-16  650  =

c6ac8f0b4ca927 Marek Vasut 2021-10-16  651  static int ili251x_firmware_bus=
y(struct i2c_client *client)
c6ac8f0b4ca927 Marek Vasut 2021-10-16  652  {
c6ac8f0b4ca927 Marek Vasut 2021-10-16  653  	struct ili210x *priv =3D i2c_g=
et_clientdata(client);
c6ac8f0b4ca927 Marek Vasut 2021-10-16  654  	int error, i =3D 0;
c6ac8f0b4ca927 Marek Vasut 2021-10-16  655  	u8 data;
c6ac8f0b4ca927 Marek Vasut 2021-10-16  656  =

c6ac8f0b4ca927 Marek Vasut 2021-10-16  657  	do {
c6ac8f0b4ca927 Marek Vasut 2021-10-16  658  		/* The read_reg already conta=
ins suitable delay */
c6ac8f0b4ca927 Marek Vasut 2021-10-16  659  		error =3D priv->chip->read_re=
g(client, REG_IC_BUSY, &data, 1);
c6ac8f0b4ca927 Marek Vasut 2021-10-16  660  		if (error)
c6ac8f0b4ca927 Marek Vasut 2021-10-16  661  			return error;
c6ac8f0b4ca927 Marek Vasut 2021-10-16  662  		if (i++ =3D=3D 100000)
c6ac8f0b4ca927 Marek Vasut 2021-10-16  663  			return -ETIMEDOUT;
c6ac8f0b4ca927 Marek Vasut 2021-10-16 @664  	} while (data !=3D REG_IC_BUSY=
_NOT_BUSY);
c6ac8f0b4ca927 Marek Vasut 2021-10-16  665  =

c6ac8f0b4ca927 Marek Vasut 2021-10-16  666  	return 0;
c6ac8f0b4ca927 Marek Vasut 2021-10-16  667  }
c6ac8f0b4ca927 Marek Vasut 2021-10-16  668  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7719764137280807231==--

