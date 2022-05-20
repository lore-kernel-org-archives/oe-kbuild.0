Content-Type: multipart/mixed; boundary="===============8842213203802249224=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] udmabuf: Set the DMA mask for the udmabuf device
Date: Sat, 21 May 2022 03:32:17 +0800
Message-ID: <202205210319.OvuI0mKr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8842213203802249224==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220520062308.3660563-1-vivek.kasireddy@intel.com>
References: <20220520062308.3660563-1-vivek.kasireddy@intel.com>
TO: Vivek Kasireddy <vivek.kasireddy@intel.com>
TO: dri-devel(a)lists.freedesktop.org
CC: Vivek Kasireddy <vivek.kasireddy@intel.com>
CC: Gerd Hoffmann <kraxel@redhat.com>

Hi Vivek,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on linus/master tegra-drm/drm/tegra/for-next v5.18=
-rc7 next-20220520]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Vivek-Kasireddy/udma=
buf-Set-the-DMA-mask-for-the-udmabuf-device/20220520-144218
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20521/202205210319.OvuI0mKr-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/dma-buf/udmabuf.c:383 udmabuf_dev_init() warn: '&udmabuf_misc' from=
 misc_register() not released on lines: 380.

Old smatch warnings:
drivers/dma-buf/udmabuf.c:239 udmabuf_create() error: uninitialized symbol =
'subpgoff'.
drivers/dma-buf/udmabuf.c:242 udmabuf_create() error: uninitialized symbol =
'maxsubpgs'.

vim +383 drivers/dma-buf/udmabuf.c

fbb0de79507819 Gerd Hoffmann   2018-08-27  365  =

fbb0de79507819 Gerd Hoffmann   2018-08-27  366  static int __init udmabuf_d=
ev_init(void)
fbb0de79507819 Gerd Hoffmann   2018-08-27  367  {
0fdcc793991b9f Vivek Kasireddy 2022-05-19  368  	int ret;
0fdcc793991b9f Vivek Kasireddy 2022-05-19  369  =

0fdcc793991b9f Vivek Kasireddy 2022-05-19  370  	ret =3D misc_register(&udm=
abuf_misc);
0fdcc793991b9f Vivek Kasireddy 2022-05-19  371  	if (ret < 0) {
0fdcc793991b9f Vivek Kasireddy 2022-05-19  372  		pr_err("Could not initial=
ize udmabuf device\n");
0fdcc793991b9f Vivek Kasireddy 2022-05-19  373  		return ret;
0fdcc793991b9f Vivek Kasireddy 2022-05-19  374  	}
0fdcc793991b9f Vivek Kasireddy 2022-05-19  375  =

0fdcc793991b9f Vivek Kasireddy 2022-05-19  376  	ret =3D dma_coerce_mask_an=
d_coherent(udmabuf_misc.this_device,
0fdcc793991b9f Vivek Kasireddy 2022-05-19  377  					   DMA_BIT_MASK(64));
0fdcc793991b9f Vivek Kasireddy 2022-05-19  378  	if (ret < 0) {
0fdcc793991b9f Vivek Kasireddy 2022-05-19  379  		pr_err("Could not setup D=
MA mask for udmabuf device\n");
0fdcc793991b9f Vivek Kasireddy 2022-05-19  380  		return ret;
0fdcc793991b9f Vivek Kasireddy 2022-05-19  381  	}
0fdcc793991b9f Vivek Kasireddy 2022-05-19  382  =

0fdcc793991b9f Vivek Kasireddy 2022-05-19 @383  	return 0;
fbb0de79507819 Gerd Hoffmann   2018-08-27  384  }
fbb0de79507819 Gerd Hoffmann   2018-08-27  385  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8842213203802249224==--

