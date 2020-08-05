Content-Type: multipart/mixed; boundary="===============3815487775615678475=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/misc/xilinx_sdfec.c:248:9: warning: Identical condition 'err', second condition is always false
Date: Wed, 05 Aug 2020 12:50:20 +0800
Message-ID: <202008051217.LOx7I3Nf%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3815487775615678475==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Dragan Cvetic <dragan.cvetic@xilinx.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Derek Kiernan <derek.kiernan@xilinx.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   442489c219235991de86d0277b5d859ede6d8792
commit: 6f86ed820178ba35f87712548e6cd43b91608a6c misc: xilinx_sdfec: Add ab=
ility to configure turbo
date:   12 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 12 months ago
compiler: nds32le-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/misc/xilinx_sdfec.c:248:9: warning: Identical condition 'err', s=
econd condition is always false [identicalConditionAfterEarlyExit]
    return err;
           ^
   drivers/misc/xilinx_sdfec.c:231:6: note: first condition
    if (err)
        ^
   drivers/misc/xilinx_sdfec.c:248:9: note: second condition
    return err;
           ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D6f86ed820178ba35f87712548e6cd43b91608a6c
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout 6f86ed820178ba35f87712548e6cd43b91608a6c
vim +/err +248 drivers/misc/xilinx_sdfec.c

6d54e455689edc Dragan Cvetic 2019-07-27  223  =

6f86ed820178ba Dragan Cvetic 2019-07-27  224  static int xsdfec_set_turbo(s=
truct xsdfec_dev *xsdfec, void __user *arg)
6f86ed820178ba Dragan Cvetic 2019-07-27  225  {
6f86ed820178ba Dragan Cvetic 2019-07-27  226  	struct xsdfec_turbo turbo;
6f86ed820178ba Dragan Cvetic 2019-07-27  227  	int err;
6f86ed820178ba Dragan Cvetic 2019-07-27  228  	u32 turbo_write;
6f86ed820178ba Dragan Cvetic 2019-07-27  229  =

6f86ed820178ba Dragan Cvetic 2019-07-27  230  	err =3D copy_from_user(&turb=
o, arg, sizeof(turbo));
6f86ed820178ba Dragan Cvetic 2019-07-27  231  	if (err)
6f86ed820178ba Dragan Cvetic 2019-07-27  232  		return -EFAULT;
6f86ed820178ba Dragan Cvetic 2019-07-27  233  =

6f86ed820178ba Dragan Cvetic 2019-07-27  234  	if (turbo.alg >=3D XSDFEC_TU=
RBO_ALG_MAX)
6f86ed820178ba Dragan Cvetic 2019-07-27  235  		return -EINVAL;
6f86ed820178ba Dragan Cvetic 2019-07-27  236  =

6f86ed820178ba Dragan Cvetic 2019-07-27  237  	if (turbo.scale > XSDFEC_TUR=
BO_SCALE_MAX)
6f86ed820178ba Dragan Cvetic 2019-07-27  238  		return -EINVAL;
6f86ed820178ba Dragan Cvetic 2019-07-27  239  =

6f86ed820178ba Dragan Cvetic 2019-07-27  240  	/* Check to see what device =
tree says about the FEC codes */
6f86ed820178ba Dragan Cvetic 2019-07-27  241  	if (xsdfec->config.code =3D=
=3D XSDFEC_LDPC_CODE)
6f86ed820178ba Dragan Cvetic 2019-07-27  242  		return -EIO;
6f86ed820178ba Dragan Cvetic 2019-07-27  243  =

6f86ed820178ba Dragan Cvetic 2019-07-27  244  	turbo_write =3D ((turbo.scal=
e & XSDFEC_TURBO_SCALE_MASK)
6f86ed820178ba Dragan Cvetic 2019-07-27  245  		       << XSDFEC_TURBO_SCAL=
E_BIT_POS) |
6f86ed820178ba Dragan Cvetic 2019-07-27  246  		      turbo.alg;
6f86ed820178ba Dragan Cvetic 2019-07-27  247  	xsdfec_regwrite(xsdfec, XSDF=
EC_TURBO_ADDR, turbo_write);
6f86ed820178ba Dragan Cvetic 2019-07-27 @248  	return err;
6f86ed820178ba Dragan Cvetic 2019-07-27  249  }
6f86ed820178ba Dragan Cvetic 2019-07-27  250  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============3815487775615678475==--

