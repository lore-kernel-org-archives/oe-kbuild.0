Content-Type: multipart/mixed; boundary="===============6124373072738048210=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/asix/ax88796c_main.c:50:5: warning: Uninitialized variable: ret [uninitvar]
Date: Sat, 04 Dec 2021 15:27:46 +0800
Message-ID: <202112041549.FF9xdlFs-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6124373072738048210==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "=C5=81ukasz Stelmach" <l.stelmach@samsung.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   12119cfa1052d512a92524e90ebee85029a918f8
commit: a97c69ba4f30e46abb9cc7be8b98227cb468fdf9 net: ax88796c: ASIX AX8879=
6C SPI Ethernet Adapter Driver
date:   6 weeks ago
:::::: branch date: 11 hours ago
:::::: commit date: 6 weeks ago
compiler: alpha-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/ethernet/asix/ax88796c_main.c:50:5: warning: Uninitialized v=
ariable: ret [uninitvar]
       (ret & PSR_DEV_READY),
       ^
   drivers/net/ethernet/asix/ax88796c_main.c:79:5: warning: Uninitialized v=
ariable: ret [uninitvar]
       (ret & PSR_DEV_READY),
       ^

vim +50 drivers/net/ethernet/asix/ax88796c_main.c

a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  38  =

a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  39  static int ax88796c_sof=
t_reset(struct ax88796c_device *ax_local)
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  40  {
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  41  	u16 temp;
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  42  	int ret;
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  43  =

a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  44  	lockdep_assert_held(&a=
x_local->spi_lock);
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  45  =

a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  46  	AX_WRITE(&ax_local->ax=
_spi, PSR_RESET, P0_PSR);
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  47  	AX_WRITE(&ax_local->ax=
_spi, PSR_RESET_CLR, P0_PSR);
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  48  =

a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  49  	ret =3D read_poll_time=
out(AX_READ, ret,
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20 @50  				(ret & PSR_DEV_READ=
Y),
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  51  				0, jiffies_to_usecs=
(160 * HZ / 1000), false,
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  52  				&ax_local->ax_spi, =
P0_PSR);
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  53  	if (ret)
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  54  		return ret;
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  55  =

a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  56  	temp =3D AX_READ(&ax_l=
ocal->ax_spi, P4_SPICR);
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  57  	if (ax_local->priv_fla=
gs & AX_CAP_COMP) {
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  58  		AX_WRITE(&ax_local->a=
x_spi,
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  59  			 (temp | SPICR_RCEN =
| SPICR_QCEN), P4_SPICR);
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  60  		ax_local->ax_spi.comp=
 =3D 1;
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  61  	} else {
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  62  		AX_WRITE(&ax_local->a=
x_spi,
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  63  			 (temp & ~(SPICR_RCE=
N | SPICR_QCEN)), P4_SPICR);
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  64  		ax_local->ax_spi.comp=
 =3D 0;
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  65  	}
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  66  =

a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  67  	return 0;
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  68  }
a97c69ba4f30e4 =C5=81ukasz Stelmach 2021-10-20  69  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6124373072738048210==--

