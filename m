Content-Type: multipart/mixed; boundary="===============4414987816668369299=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/rockchip/rkisp1/rkisp1-params.c:488:15: warning: Shifting signed 32-bit value by 31 bits is undefined behaviour
Date: Thu, 04 Feb 2021 02:39:08 +0800
Message-ID: <202102040259.bE0z7a80-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4414987816668369299==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Helen Koike <helen.koike@collabora.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Tomasz Figa <tfiga@chromium.org>
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3aaf0a27ffc29b19a62314edd684b9bc6346f9a8
commit: e6938cc1cb7763a363f62b78147f1f2fb972f49c media: rockchip: rkisp1: d=
estage Rockchip ISP1 driver
date:   3 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 3 months ago
compiler: or1k-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/media/platform/rockchip/rkisp1/rkisp1-params.c:488:15: warning: =
Shifting signed 32-bit value by 31 bits is undefined behaviour [shiftTooMan=
yBitsSigned]
      reg_val |=3D RKISP1_CIF_ISP_AWB_MODE_RGB_EN;
                 ^
   drivers/media/platform/rockchip/rkisp1/rkisp1-params.c:490:15: warning: =
Shifting signed 32-bit value by 31 bits is undefined behaviour [shiftTooMan=
yBitsSigned]
      reg_val |=3D RKISP1_CIF_ISP_AWB_MODE_YCBCR_EN;
                 ^

vim +488 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c

bae1155cf5798c drivers/staging/media/rkisp1/rkisp1-params.c Jacob Chen 2020=
-01-08  475  =

bae1155cf5798c drivers/staging/media/rkisp1/rkisp1-params.c Jacob Chen 2020=
-01-08  476  static void
bae1155cf5798c drivers/staging/media/rkisp1/rkisp1-params.c Jacob Chen 2020=
-01-08  477  rkisp1_awb_meas_enable(struct rkisp1_params *params,
bae1155cf5798c drivers/staging/media/rkisp1/rkisp1-params.c Jacob Chen 2020=
-01-08  478  		       const struct rkisp1_cif_isp_awb_meas_config *arg,
bae1155cf5798c drivers/staging/media/rkisp1/rkisp1-params.c Jacob Chen 2020=
-01-08  479  		       bool en)
bae1155cf5798c drivers/staging/media/rkisp1/rkisp1-params.c Jacob Chen 2020=
-01-08  480  {
bae1155cf5798c drivers/staging/media/rkisp1/rkisp1-params.c Jacob Chen 2020=
-01-08  481  	u32 reg_val =3D rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_AW=
B_PROP);
bae1155cf5798c drivers/staging/media/rkisp1/rkisp1-params.c Jacob Chen 2020=
-01-08  482  =

bae1155cf5798c drivers/staging/media/rkisp1/rkisp1-params.c Jacob Chen 2020=
-01-08  483  	/* switch off */
bae1155cf5798c drivers/staging/media/rkisp1/rkisp1-params.c Jacob Chen 2020=
-01-08  484  	reg_val &=3D RKISP1_CIF_ISP_AWB_MODE_MASK_NONE;
bae1155cf5798c drivers/staging/media/rkisp1/rkisp1-params.c Jacob Chen 2020=
-01-08  485  =

bae1155cf5798c drivers/staging/media/rkisp1/rkisp1-params.c Jacob Chen 2020=
-01-08  486  	if (en) {
bae1155cf5798c drivers/staging/media/rkisp1/rkisp1-params.c Jacob Chen 2020=
-01-08  487  		if (arg->awb_mode =3D=3D RKISP1_CIF_ISP_AWB_MODE_RGB)
bae1155cf5798c drivers/staging/media/rkisp1/rkisp1-params.c Jacob Chen 2020=
-01-08 @488  			reg_val |=3D RKISP1_CIF_ISP_AWB_MODE_RGB_EN;
bae1155cf5798c drivers/staging/media/rkisp1/rkisp1-params.c Jacob Chen 2020=
-01-08  489  		else
bae1155cf5798c drivers/staging/media/rkisp1/rkisp1-params.c Jacob Chen 2020=
-01-08  490  			reg_val |=3D RKISP1_CIF_ISP_AWB_MODE_YCBCR_EN;
bae1155cf5798c drivers/staging/media/rkisp1/rkisp1-params.c Jacob Chen 2020=
-01-08  491  =

bae1155cf5798c drivers/staging/media/rkisp1/rkisp1-params.c Jacob Chen 2020=
-01-08  492  		rkisp1_write(params->rkisp1, reg_val, RKISP1_CIF_ISP_AWB_PRO=
P);
bae1155cf5798c drivers/staging/media/rkisp1/rkisp1-params.c Jacob Chen 2020=
-01-08  493  =

bae1155cf5798c drivers/staging/media/rkisp1/rkisp1-params.c Jacob Chen 2020=
-01-08  494  		/* Measurements require AWB block be active. */
bae1155cf5798c drivers/staging/media/rkisp1/rkisp1-params.c Jacob Chen 2020=
-01-08  495  		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
bae1155cf5798c drivers/staging/media/rkisp1/rkisp1-params.c Jacob Chen 2020=
-01-08  496  				      RKISP1_CIF_ISP_CTRL_ISP_AWB_ENA);
bae1155cf5798c drivers/staging/media/rkisp1/rkisp1-params.c Jacob Chen 2020=
-01-08  497  	} else {
bae1155cf5798c drivers/staging/media/rkisp1/rkisp1-params.c Jacob Chen 2020=
-01-08  498  		rkisp1_write(params->rkisp1,
bae1155cf5798c drivers/staging/media/rkisp1/rkisp1-params.c Jacob Chen 2020=
-01-08  499  			     reg_val, RKISP1_CIF_ISP_AWB_PROP);
bae1155cf5798c drivers/staging/media/rkisp1/rkisp1-params.c Jacob Chen 2020=
-01-08  500  		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CTRL,
bae1155cf5798c drivers/staging/media/rkisp1/rkisp1-params.c Jacob Chen 2020=
-01-08  501  					RKISP1_CIF_ISP_CTRL_ISP_AWB_ENA);
bae1155cf5798c drivers/staging/media/rkisp1/rkisp1-params.c Jacob Chen 2020=
-01-08  502  	}
bae1155cf5798c drivers/staging/media/rkisp1/rkisp1-params.c Jacob Chen 2020=
-01-08  503  }
bae1155cf5798c drivers/staging/media/rkisp1/rkisp1-params.c Jacob Chen 2020=
-01-08  504  =


:::::: The code at line 488 was first introduced by commit
:::::: bae1155cf5798cc65fedeecfa82c2f48fa3ed18b media: staging: rkisp1: add=
 output device for parameters

:::::: TO: Jacob Chen <jacob2.chen@rock-chips.com>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4414987816668369299==--

