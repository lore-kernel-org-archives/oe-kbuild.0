Content-Type: multipart/mixed; boundary="===============4084832010402472050=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH v3 2/7] bus/cdx: add the cdx bus driver
Date: Wed, 07 Sep 2022 16:55:18 +0800
Message-ID: <202209071635.ieqyLzSg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4084832010402472050==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220906134801.4079497-3-nipun.gupta@amd.com>
References: <20220906134801.4079497-3-nipun.gupta@amd.com>
TO: Nipun Gupta <nipun.gupta@amd.com>

Hi Nipun,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on robh/for-next]
[also build test WARNING on masahiroy-kbuild/for-next linus/master v6.0-rc4=
 next-20220906]
[cannot apply to awilliam-vfio/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nipun-Gupta/dt-bindi=
ngs-bus-add-CDX-bus-device-tree-bindings/20220906-224815
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
next
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: csky-randconfig-c024-20220907 (https://download.01.org/0day-ci/arch=
ive/20220907/202209071635.ieqyLzSg-lkp(a)intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>

cocci warnings: (new ones prefixed by >>)
>> drivers/bus/cdx/cdx.c:375:17-25: ERROR: reference preceded by free on li=
ne 373

vim +375 drivers/bus/cdx/cdx.c

fd1f6db9b17721 Nipun Gupta 2022-09-06  342  =

fd1f6db9b17721 Nipun Gupta 2022-09-06  343  static int cdx_bus_probe(struct=
 platform_device *pdev)
fd1f6db9b17721 Nipun Gupta 2022-09-06  344  {
fd1f6db9b17721 Nipun Gupta 2022-09-06  345  	struct cdx_mcdi_t *cdx_mcdi;
fd1f6db9b17721 Nipun Gupta 2022-09-06  346  	int ret;
fd1f6db9b17721 Nipun Gupta 2022-09-06  347  =

fd1f6db9b17721 Nipun Gupta 2022-09-06  348  	cdx_mcdi =3D kzalloc(sizeof(*c=
dx_mcdi), GFP_KERNEL);
fd1f6db9b17721 Nipun Gupta 2022-09-06  349  	if (!cdx_mcdi) {
fd1f6db9b17721 Nipun Gupta 2022-09-06  350  		dev_err(&pdev->dev, "Failed t=
o allocate memory for cdx_mcdi\n");
fd1f6db9b17721 Nipun Gupta 2022-09-06  351  		return -ENOMEM;
fd1f6db9b17721 Nipun Gupta 2022-09-06  352  	}
fd1f6db9b17721 Nipun Gupta 2022-09-06  353  =

fd1f6db9b17721 Nipun Gupta 2022-09-06  354  	/* MCDI FW: Initialize the FW =
path */
fd1f6db9b17721 Nipun Gupta 2022-09-06  355  	ret =3D cdx_mcdi_init(cdx_mcdi=
);
fd1f6db9b17721 Nipun Gupta 2022-09-06  356  	if (ret) {
fd1f6db9b17721 Nipun Gupta 2022-09-06  357  		dev_err(&pdev->dev, "MCDI Ini=
tialization failed: %d\n", ret);
fd1f6db9b17721 Nipun Gupta 2022-09-06  358  		goto mcdi_init_fail;
fd1f6db9b17721 Nipun Gupta 2022-09-06  359  	}
fd1f6db9b17721 Nipun Gupta 2022-09-06  360  	platform_set_drvdata(pdev, cdx=
_mcdi);
fd1f6db9b17721 Nipun Gupta 2022-09-06  361  =

fd1f6db9b17721 Nipun Gupta 2022-09-06  362  	/* Discover all the devices on=
 the bus */
fd1f6db9b17721 Nipun Gupta 2022-09-06  363  	ret =3D cdx_bus_device_discove=
ry(pdev);
fd1f6db9b17721 Nipun Gupta 2022-09-06  364  	if (ret) {
fd1f6db9b17721 Nipun Gupta 2022-09-06  365  		dev_err(&pdev->dev,
fd1f6db9b17721 Nipun Gupta 2022-09-06  366  			"CDX bus device discovery fa=
iled: %d\n", ret);
fd1f6db9b17721 Nipun Gupta 2022-09-06  367  		goto device_discovery_fail;
fd1f6db9b17721 Nipun Gupta 2022-09-06  368  	}
fd1f6db9b17721 Nipun Gupta 2022-09-06  369  =

fd1f6db9b17721 Nipun Gupta 2022-09-06  370  	return 0;
fd1f6db9b17721 Nipun Gupta 2022-09-06  371  =

fd1f6db9b17721 Nipun Gupta 2022-09-06  372  mcdi_init_fail:
fd1f6db9b17721 Nipun Gupta 2022-09-06 @373  	kfree(cdx_mcdi);
fd1f6db9b17721 Nipun Gupta 2022-09-06  374  device_discovery_fail:
fd1f6db9b17721 Nipun Gupta 2022-09-06 @375  	cdx_mcdi_finish(cdx_mcdi);
fd1f6db9b17721 Nipun Gupta 2022-09-06  376  =

fd1f6db9b17721 Nipun Gupta 2022-09-06  377  	return ret;
fd1f6db9b17721 Nipun Gupta 2022-09-06  378  }
fd1f6db9b17721 Nipun Gupta 2022-09-06  379  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4084832010402472050==--

