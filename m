Content-Type: multipart/mixed; boundary="===============5577658820341774006=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/4] drm/etnaviv: add pci device driver support
Date: Sat, 27 Nov 2021 21:37:26 +0800
Message-ID: <202111272118.uTFLgQrD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5577658820341774006==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211120075926.2671-3-15330273260@189.cn>
References: <20211120075926.2671-3-15330273260@189.cn>
TO: Sui Jingfeng <15330273260@189.cn>
TO: Lucas Stach <l.stach@pengutronix.de>
TO: Russell King <linux+etnaviv@armlinux.org.uk>
TO: Christian Gmeiner <christian.gmeiner@gmail.com>
TO: David Airlie <airlied@linux.ie>
TO: Daniel Vetter <daniel@ffwll.ch>
TO: Rob Herring <robh+dt@kernel.org>
TO: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
TO: Sam Ravnborg <sam@ravnborg.org>

Hi Sui,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-tip/drm-tip linus/master v5.16-rc2 next-202=
11126]
[cannot apply to drm/drm-next robh/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Sui-Jingfeng/dt-bindings-l=
s2k1000-add-gpu-device-node/20211120-165949
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: microblaze-randconfig-s031-20211122 (https://download.01.org/0day-c=
i/archive/20211127/202111272118.uTFLgQrD-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/85be7d6c6ecf8364546054827=
b621699e9fb632b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Sui-Jingfeng/dt-bindings-ls2k1000-=
add-gpu-device-node/20211120-165949
        git checkout 85be7d6c6ecf8364546054827b621699e9fb632b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dm=
icroblaze SHELL=3D/bin/bash drivers/gpu/drm/etnaviv/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/etnaviv/etnaviv_drv.c:741:1: sparse: sparse: unused labe=
l 'unregister_platform_driver'

vim +/unregister_platform_driver +741 drivers/gpu/drm/etnaviv/etnaviv_drv.c

85be7d6c6ecf83 suijingfeng         2021-11-20  716  =

246774d17fc05a Lucas Stach         2018-01-24  717  	/*
246774d17fc05a Lucas Stach         2018-01-24  718  	 * If the DT contains =
at least one available GPU device, instantiate
246774d17fc05a Lucas Stach         2018-01-24  719  	 * the DRM platform de=
vice.
246774d17fc05a Lucas Stach         2018-01-24  720  	 */
246774d17fc05a Lucas Stach         2018-01-24  721  	for_each_compatible_no=
de(np, NULL, "vivante,gc") {
246774d17fc05a Lucas Stach         2018-01-24  722  		if (!of_device_is_ava=
ilable(np))
246774d17fc05a Lucas Stach         2018-01-24  723  			continue;
1a866306e0fbf3 Lucas Stach         2018-09-12  724  =

85be7d6c6ecf83 suijingfeng         2021-11-20  725  		ret =3D etnaviv_creat=
e_platform_device("etnaviv", np);
1a866306e0fbf3 Lucas Stach         2018-09-12  726  =

45a0faaba9c8c5 Fabio Estevam       2018-06-27  727  		of_node_put(np);
1a866306e0fbf3 Lucas Stach         2018-09-12  728  =

85be7d6c6ecf83 suijingfeng         2021-11-20  729  		if (ret)
85be7d6c6ecf83 suijingfeng         2021-11-20  730  			goto unregister_pci_=
driver;
85be7d6c6ecf83 suijingfeng         2021-11-20  731  =

246774d17fc05a Lucas Stach         2018-01-24  732  		break;
246774d17fc05a Lucas Stach         2018-01-24  733  	}
246774d17fc05a Lucas Stach         2018-01-24  734  =

45a0faaba9c8c5 Fabio Estevam       2018-06-27  735  	return 0;
45a0faaba9c8c5 Fabio Estevam       2018-06-27  736  =

85be7d6c6ecf83 suijingfeng         2021-11-20  737  unregister_pci_driver:
85be7d6c6ecf83 suijingfeng         2021-11-20  738  #ifdef CONFIG_DRM_ETNAV=
IV_PCI_DRIVER
85be7d6c6ecf83 suijingfeng         2021-11-20  739  	pci_unregister_driver(=
&etnaviv_pci_driver);
85be7d6c6ecf83 suijingfeng         2021-11-20  740  #endif
45a0faaba9c8c5 Fabio Estevam       2018-06-27 @741  unregister_platform_dri=
ver:
45a0faaba9c8c5 Fabio Estevam       2018-06-27  742  	platform_driver_unregi=
ster(&etnaviv_platform_driver);
45a0faaba9c8c5 Fabio Estevam       2018-06-27  743  unregister_gpu_driver:
45a0faaba9c8c5 Fabio Estevam       2018-06-27  744  	platform_driver_unregi=
ster(&etnaviv_gpu_driver);
a8c21a5451d831 The etnaviv authors 2015-12-03  745  	return ret;
a8c21a5451d831 The etnaviv authors 2015-12-03  746  }
a8c21a5451d831 The etnaviv authors 2015-12-03  747  module_init(etnaviv_ini=
t);
a8c21a5451d831 The etnaviv authors 2015-12-03  748  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5577658820341774006==--

