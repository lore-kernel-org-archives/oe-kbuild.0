Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50F67488
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Nov 2023 00:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c9UVR778"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699922835; x=1731458835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dMxYHxFlvorJDPG1Edwq7pZoK1PFlUF6bhKpT0V/bKE=;
  b=c9UVR778Eyku6BxUHtJaz+dFR9b5j5ObNcmo+Xnmx5qqx4ahCRpvBMjs
   o0LbAGpuw6I3eVaO70EBpRvFmxSoSKpUGlAAH10P0GBwBSwXJVmyihjal
   x30nSDNUdJWKuGjepTantyhT/Tx9HMcd0FZU4sEkEPP4RVUfoqJxL6p4m
   vvHHcbYzLX/W9eiCsTxcl4M12ZYb06MccFh5JPaqmK+XIvTPDJsPpX6GG
   XL7cbGYRb2K+FIBmpY4C2oDplw6XlwgLbieq0a48wLkZgVJL4xrvOi13P
   2PRsyt44IBGOFdojsU+REdOvM0vJuD+jN24HOLWeRnxhc4bLxm3nks5hT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="369878341"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="369878341"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 16:47:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="757982373"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="757982373"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 13 Nov 2023 16:47:13 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2haB-000Cfi-15;
	Tue, 14 Nov 2023 00:47:11 +0000
Date: Tue, 14 Nov 2023 08:46:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sre-misc:rk3588 31/37]
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:3251:12: warning:
 'dw_hdmi_rockchip_suspend' defined but not used
Message-ID: <202311140850.0vkZsfyQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "has Makefile file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
CC: Sebastian Reichel <sre@kernel.org>
CC: Algea Cao <algea.cao@rock-chips.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git rk3588
head:   f41b3e9a9d7f22bef0735b4fe0007321ce6b6d6b
commit: 171fd53717525f0f6dc56e90e6f38a9038c5c779 [31/37] drm/bridge: synopsys: Add initial support for DW HDMI QP TX Controller
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231114/202311140850.0vkZsfyQ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231114/202311140850.0vkZsfyQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311140850.0vkZsfyQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2139:11: error: 'RK_IF_FORMAT_YCBCR_LQ' undeclared here (not in a function)
    2139 |         { RK_IF_FORMAT_YCBCR_LQ, "ycbcr_low_subsampling" },
         |           ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2140:11: error: 'RK_IF_FORMAT_MAX' undeclared here (not in a function)
    2140 |         { RK_IF_FORMAT_MAX, "invalid_output" },
         |           ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c: In function 'dw_hdmi_rockchip_attach_properties':
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2219:49: error: 'RK_IF_PROP_COLOR_DEPTH' undeclared (first use in this function)
    2219 |                                                 RK_IF_PROP_COLOR_DEPTH,
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2228:60: error: 'RK_IF_PROP_COLOR_FORMAT' undeclared (first use in this function)
    2228 |         prop = drm_property_create_enum(connector->dev, 0, RK_IF_PROP_COLOR_FORMAT,
         |                                                            ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2237:42: error: 'RK_IF_PROP_COLOR_DEPTH_CAPS' undeclared (first use in this function)
    2237 |                                          RK_IF_PROP_COLOR_DEPTH_CAPS,
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2245:42: error: 'RK_IF_PROP_COLOR_FORMAT_CAPS' undeclared (first use in this function)
    2245 |                                          RK_IF_PROP_COLOR_FORMAT_CAPS,
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2316:21: error: 'struct rockchip_drm_private' has no member named 'connector_id_prop'
    2316 |         if (!private->connector_id_prop)
         |                     ^~
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2317:24: error: 'struct rockchip_drm_private' has no member named 'connector_id_prop'
    2317 |                 private->connector_id_prop = drm_property_create_range(connector->dev,
         |                        ^~
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2320:20: error: 'struct rockchip_drm_private' has no member named 'connector_id_prop'
    2320 |         if (private->connector_id_prop)
         |                    ^~
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2321:69: error: 'struct rockchip_drm_private' has no member named 'connector_id_prop'
    2321 |                 drm_object_attach_property(&connector->base, private->connector_id_prop, hdmi->id);
         |                                                                     ^~
   In file included from include/linux/bits.h:6,
                    from include/linux/bitops.h:6,
                    from include/linux/kernel.h:23,
                    from include/linux/clk.h:13,
                    from drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:6:
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c: In function 'dw_hdmi_rockchip_get_property':
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2463:28: error: 'RK_IF_DEPTH_8' undeclared (first use in this function)
    2463 |                 *val = BIT(RK_IF_DEPTH_8);
         |                            ^~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2468:37: error: 'RK_IF_DEPTH_10' undeclared (first use in this function)
    2468 |                         *val |= BIT(RK_IF_DEPTH_10);
         |                                     ^~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2470:37: error: 'RK_IF_DEPTH_12' undeclared (first use in this function)
    2470 |                         *val |= BIT(RK_IF_DEPTH_12);
         |                                     ^~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2472:37: error: 'RK_IF_DEPTH_16' undeclared (first use in this function)
    2472 |                         *val |= BIT(RK_IF_DEPTH_16);
         |                                     ^~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2474:37: error: 'RK_IF_DEPTH_420_10' undeclared (first use in this function)
    2474 |                         *val |= BIT(RK_IF_DEPTH_420_10);
         |                                     ^~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2476:37: error: 'RK_IF_DEPTH_420_12' undeclared (first use in this function)
    2476 |                         *val |= BIT(RK_IF_DEPTH_420_12);
         |                                     ^~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2478:37: error: 'RK_IF_DEPTH_420_16' undeclared (first use in this function)
    2478 |                         *val |= BIT(RK_IF_DEPTH_420_16);
         |                                     ^~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c: In function 'dw_hdmi_rockchip_bind':
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2880:44: error: 'drm_mode_convert_to_split_mode' undeclared (first use in this function); did you mean 'drm_mode_convert_to_umode'?
    2880 |         plat_data->convert_to_split_mode = drm_mode_convert_to_split_mode;
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                            drm_mode_convert_to_umode
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2881:45: error: 'drm_mode_convert_to_origin_mode' undeclared (first use in this function); did you mean 'drm_mode_convert_to_umode'?
    2881 |         plat_data->convert_to_origin_mode = drm_mode_convert_to_origin_mode;
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                             drm_mode_convert_to_umode
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:3101:25: error: implicit declaration of function 'rockchip_drm_register_sub_dev' [-Werror=implicit-function-declaration]
    3101 |                         rockchip_drm_register_sub_dev(&hdmi->sub_dev);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c: In function 'dw_hdmi_rockchip_unbind':
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:3166:17: error: implicit declaration of function 'rockchip_drm_unregister_sub_dev' [-Werror=implicit-function-declaration]
    3166 |                 rockchip_drm_unregister_sub_dev(&hdmi->sub_dev);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c: In function 'dw_hdmi_rockchip_get_edid_dsc_info':
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:2068:1: warning: control reaches end of non-void function [-Wreturn-type]
    2068 | }
         | ^
   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c: At top level:
>> drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c:3251:12: warning: 'dw_hdmi_rockchip_suspend' defined but not used [-Wunused-function]
    3251 | static int dw_hdmi_rockchip_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/dw_hdmi_rockchip_suspend +3251 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c

171fd53717525f0 Cristian Ciocaltea 2023-11-01  3250  
171fd53717525f0 Cristian Ciocaltea 2023-11-01 @3251  static int dw_hdmi_rockchip_suspend(struct device *dev)
171fd53717525f0 Cristian Ciocaltea 2023-11-01  3252  {
171fd53717525f0 Cristian Ciocaltea 2023-11-01  3253  	struct rockchip_hdmi *hdmi = dev_get_drvdata(dev);
171fd53717525f0 Cristian Ciocaltea 2023-11-01  3254  
171fd53717525f0 Cristian Ciocaltea 2023-11-01  3255  	if (hdmi->is_hdmi_qp)
171fd53717525f0 Cristian Ciocaltea 2023-11-01  3256  		dw_hdmi_qp_suspend(dev, hdmi->hdmi_qp);
171fd53717525f0 Cristian Ciocaltea 2023-11-01  3257  	else
171fd53717525f0 Cristian Ciocaltea 2023-11-01  3258  		dw_hdmi_suspend(hdmi->hdmi);
171fd53717525f0 Cristian Ciocaltea 2023-11-01  3259  
171fd53717525f0 Cristian Ciocaltea 2023-11-01  3260  	pm_runtime_put_sync(dev);
171fd53717525f0 Cristian Ciocaltea 2023-11-01  3261  
171fd53717525f0 Cristian Ciocaltea 2023-11-01  3262  	return 0;
12b9f204e804b2a Andy Yan           2015-01-07  3263  }
12b9f204e804b2a Andy Yan           2015-01-07  3264  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
