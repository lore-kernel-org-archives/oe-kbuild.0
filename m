Content-Type: multipart/mixed; boundary="===============3034171851618320363=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/hid/hid-ft260.c:374:0: warning: syntax error [syntaxError]
Date: Wed, 04 Aug 2021 08:22:21 +0800
Message-ID: <202108040813.GPhfzrHH-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3034171851618320363==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Michael Zaidman <michael.zaidman@gmail.com>
CC: Jiri Kosina <jkosina@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d5ad8ec3cfb56a017de6a784835666475b4be349
commit: 6a82582d9fa438045191074856f47165334f2777 HID: ft260: add usb hid to=
 i2c host bridge driver
date:   5 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 5 months ago
compiler: powerpc-linux-gcc (GCC) 10.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/hid/hid-ft260.c:374:0: warning: syntax error [syntaxError]
   =

   ^

vim +374 drivers/hid/hid-ft260.c

6a82582d9fa438 Michael Zaidman 2021-02-19  351  =

6a82582d9fa438 Michael Zaidman 2021-02-19  352  static int ft260_hid_output=
_report_check_status(struct ft260_device *dev,
6a82582d9fa438 Michael Zaidman 2021-02-19  353  						u8 *data, int len)
6a82582d9fa438 Michael Zaidman 2021-02-19  354  {
6a82582d9fa438 Michael Zaidman 2021-02-19  355  	int ret, usec, try =3D 3;
6a82582d9fa438 Michael Zaidman 2021-02-19  356  	struct hid_device *hdev =
=3D dev->hdev;
6a82582d9fa438 Michael Zaidman 2021-02-19  357  =

6a82582d9fa438 Michael Zaidman 2021-02-19  358  	ret =3D ft260_hid_output_r=
eport(hdev, data, len);
6a82582d9fa438 Michael Zaidman 2021-02-19  359  	if (ret < 0) {
6a82582d9fa438 Michael Zaidman 2021-02-19  360  		hid_err(hdev, "%s: failed=
 to start transfer, ret %d\n",
6a82582d9fa438 Michael Zaidman 2021-02-19  361  			__func__, ret);
6a82582d9fa438 Michael Zaidman 2021-02-19  362  		ft260_i2c_reset(hdev);
6a82582d9fa438 Michael Zaidman 2021-02-19  363  		return ret;
6a82582d9fa438 Michael Zaidman 2021-02-19  364  	}
6a82582d9fa438 Michael Zaidman 2021-02-19  365  =

6a82582d9fa438 Michael Zaidman 2021-02-19  366  	/* transfer time =3D 1 / c=
lock(KHz) * 10 bits * bytes */
6a82582d9fa438 Michael Zaidman 2021-02-19  367  	usec =3D 10000 / dev->cloc=
k * len;
6a82582d9fa438 Michael Zaidman 2021-02-19  368  	usleep_range(usec, usec + =
100);
6a82582d9fa438 Michael Zaidman 2021-02-19  369  	ft260_dbg("wait %d usec, l=
en %d\n", usec, len);
6a82582d9fa438 Michael Zaidman 2021-02-19  370  	do {
6a82582d9fa438 Michael Zaidman 2021-02-19  371  		ret =3D ft260_xfer_status=
(dev);
6a82582d9fa438 Michael Zaidman 2021-02-19  372  		if (ret !=3D -EAGAIN)
6a82582d9fa438 Michael Zaidman 2021-02-19  373  			break;
6a82582d9fa438 Michael Zaidman 2021-02-19 @374  	} while (--try);
6a82582d9fa438 Michael Zaidman 2021-02-19  375  =

6a82582d9fa438 Michael Zaidman 2021-02-19  376  	if (ret =3D=3D 0 || ret =
=3D=3D -EBUSY)
6a82582d9fa438 Michael Zaidman 2021-02-19  377  		return 0;
6a82582d9fa438 Michael Zaidman 2021-02-19  378  =

6a82582d9fa438 Michael Zaidman 2021-02-19  379  	ft260_i2c_reset(hdev);
6a82582d9fa438 Michael Zaidman 2021-02-19  380  	return -EIO;
6a82582d9fa438 Michael Zaidman 2021-02-19  381  }
6a82582d9fa438 Michael Zaidman 2021-02-19  382  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3034171851618320363==--

