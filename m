Content-Type: multipart/mixed; boundary="===============8579882710657977168=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 01/12] misc: fastrpc: separate fastrpc device from channel context
Date: Thu, 27 Jan 2022 18:15:24 +0800
Message-ID: <202201271857.MGiOkhFo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8579882710657977168==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220126135304.16340-2-srinivas.kandagatla@linaro.org>
References: <20220126135304.16340-2-srinivas.kandagatla@linaro.org>
TO: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
TO: robh+dt(a)kernel.org
TO: gregkh(a)linuxfoundation.org
CC: devicetree(a)vger.kernel.org
CC: ekangupt(a)qti.qualcomm.com
CC: bkumar(a)qti.qualcomm.com
CC: linux-kernel(a)vger.kernel.org
CC: srini(a)kernel.org
CC: bjorn.andersson(a)linaro.org
CC: linux-arm-msm(a)vger.kernel.org
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Hi Srinivas,

I love your patch! Perhaps something to improve:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on robh/for-next linux/master linus/master v5.17-r=
c1 next-20220127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Srinivas-Kandagatla/misc-f=
astrpc-Add-missing-DSP-FastRPC-features/20220126-215705
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.gi=
t 515a2f507491e7c3818e74ef4f4e088c1fecb190
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: openrisc-randconfig-m031-20220124 (https://download.01.org/0day-ci/=
archive/20220127/202201271857.MGiOkhFo-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/misc/fastrpc.c:1636 fastrpc_device_register() warn: passing devm_ a=
llocated variable to kfree. 'fdev'

Old smatch warnings:
drivers/misc/fastrpc.c:504 fastrpc_context_alloc() warn: should 'ret << 4' =
be a 64 bit type?

vim +/fdev +1636 drivers/misc/fastrpc.c

f6f9279f2bf0e37 Srinivas Kandagatla 2019-02-08  1619  =

99d9d7a1c5f2dae Srinivas Kandagatla 2022-01-26  1620  static int fastrpc_de=
vice_register(struct device *dev, struct fastrpc_channel_ctx *cctx,
99d9d7a1c5f2dae Srinivas Kandagatla 2022-01-26  1621  				   const char *do=
main)
99d9d7a1c5f2dae Srinivas Kandagatla 2022-01-26  1622  {
99d9d7a1c5f2dae Srinivas Kandagatla 2022-01-26  1623  	struct fastrpc_devic=
e *fdev;
99d9d7a1c5f2dae Srinivas Kandagatla 2022-01-26  1624  	int err;
99d9d7a1c5f2dae Srinivas Kandagatla 2022-01-26  1625  =

99d9d7a1c5f2dae Srinivas Kandagatla 2022-01-26  1626  	fdev =3D devm_kzallo=
c(dev, sizeof(*fdev), GFP_KERNEL);
99d9d7a1c5f2dae Srinivas Kandagatla 2022-01-26  1627  	if (!fdev)
99d9d7a1c5f2dae Srinivas Kandagatla 2022-01-26  1628  		return -ENOMEM;
99d9d7a1c5f2dae Srinivas Kandagatla 2022-01-26  1629  =

99d9d7a1c5f2dae Srinivas Kandagatla 2022-01-26  1630  	fdev->cctx =3D cctx;
99d9d7a1c5f2dae Srinivas Kandagatla 2022-01-26  1631  	fdev->miscdev.minor =
=3D MISC_DYNAMIC_MINOR;
99d9d7a1c5f2dae Srinivas Kandagatla 2022-01-26  1632  	fdev->miscdev.fops =
=3D &fastrpc_fops;
99d9d7a1c5f2dae Srinivas Kandagatla 2022-01-26  1633  	fdev->miscdev.name =
=3D devm_kasprintf(dev, GFP_KERNEL, "fastrpc-%s", domain);
99d9d7a1c5f2dae Srinivas Kandagatla 2022-01-26  1634  	err =3D misc_registe=
r(&fdev->miscdev);
99d9d7a1c5f2dae Srinivas Kandagatla 2022-01-26  1635  	if (err)
99d9d7a1c5f2dae Srinivas Kandagatla 2022-01-26 @1636  		kfree(fdev);
99d9d7a1c5f2dae Srinivas Kandagatla 2022-01-26  1637  	else
99d9d7a1c5f2dae Srinivas Kandagatla 2022-01-26  1638  		cctx->fdevice =3D f=
dev;
99d9d7a1c5f2dae Srinivas Kandagatla 2022-01-26  1639  =

99d9d7a1c5f2dae Srinivas Kandagatla 2022-01-26  1640  	return err;
99d9d7a1c5f2dae Srinivas Kandagatla 2022-01-26  1641  }
99d9d7a1c5f2dae Srinivas Kandagatla 2022-01-26  1642  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8579882710657977168==--

