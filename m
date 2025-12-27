Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDD71CDFD5
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Dec 2025 09:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766826701; cv=none; b=CGfjBAhcKDNGa4+wiaxlJZXIkg3xiF1Uk/Qxu/Fkttzx9ERL2o+ibTk/Vt5hGB2PWWseSZXQv7sEpP+7EzocXUiyCWr1rek1WfR+kRYHDgJkCITTHG2mmqFnvRJn1sXf1AS9UpciBtXQiCO9ZVB2jPZYi8jO2IrGbTzKKQY7R3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766826701; c=relaxed/simple;
	bh=OXo3SGWw76JrvyDT61Le1QTrmTIT1+HymLVls2GS1dE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IWB6TbVE/8Y7d97AioGCtdP6ndmcPTEQLDJCkbOWWwUlryO1l3IU5D92hZSt/8mrXsYN0YjKkRvEW5HV+i3qeppbAobE9CI83GFslOqFAzmQ+2p2vEGfRUHwKn8O80mWYK7hijzWaVbclUalLEc0pEBmCFFnCtz+jAIIi/UXPpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fApZz1gF; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fApZz1gF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766826699; x=1798362699;
  h=date:from:to:cc:subject:message-id;
  bh=OXo3SGWw76JrvyDT61Le1QTrmTIT1+HymLVls2GS1dE=;
  b=fApZz1gF6Wj4affORZur55Rx6Iztxg3nvS59izm10FlWi6WRrA3/wWWi
   pDJ92HvDU16FfCyqTR+P0kghAzdHBfbOONFv6WuDODwXM6TXYBkSEmyos
   iI+nuy9M7TdvHr3CmY4lF0YT2677QqervhOd+N1k4EudGiobwz91bxxg9
   8XZFXe0tSawe0UYmospH4z2c9EiF/BTGy2LtZMzCN22bX37RDKOXv/KMA
   p3+VaRQ7SirVvLh3cMX10gDsnNZ1x5NW1tQR1dcloaNItT73LRyyovwqg
   H+LaKhv0EDpunHO/kI4c6stv6MhxAZPXTlbeNnoJBSZCiGl8Nj9yoAjzC
   g==;
X-CSE-ConnectionGUID: T6rAm/FySLi4FLQbPSz/qQ==
X-CSE-MsgGUID: DfaimuruQZWKluBeqUyipw==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="79172220"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="79172220"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 01:11:38 -0800
X-CSE-ConnectionGUID: KsAOo7QfT7S2ZEITDuwpUA==
X-CSE-MsgGUID: KxvZeP5aS4KtL5NV+BhLFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="201000762"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 27 Dec 2025 01:11:38 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZQKl-000000005i1-1x53;
	Sat, 27 Dec 2025 09:11:35 +0000
Date: Sat, 27 Dec 2025 17:11:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [drm-misc:for-linux-next 3/4]
 drivers/gpu/drm/bridge/inno-hdmi.c:1136:1: sparse: sparse: bad integer
 constant expression
Message-ID: <202512271707.PNxKbYqZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/bridge/inno-hdmi.c:1136:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: dri-devel@lists.freedesktop.org
TO: Andy Yan <andy.yan@rock-chips.com>
CC: Dmitry Baryshkov <lumag@kernel.org>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git for-linux-next
head:   130343ee6bca9895c47d314467db7dd3dcc8bc35
commit: 969325a2597ebc4cb001a92992f06f698ab2b467 [3/4] drm/rockchip: inno-hdmi: Convert to drm bridge
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-r122-20251227 (https://download.01.org/0day-ci/archive/20251227/202512271707.PNxKbYqZ-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512271707.PNxKbYqZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512271707.PNxKbYqZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/bridge/inno-hdmi.c:1136:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/bridge/inno-hdmi.c:1136:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/gpu/drm/bridge/inno-hdmi.c:1137:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/bridge/inno-hdmi.c:1137:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/gpu/drm/bridge/inno-hdmi.c:1138:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/bridge/inno-hdmi.c:1138:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/gpu/drm/bridge/inno-hdmi.c:1138:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/bridge/inno-hdmi.c:1138:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +1136 drivers/gpu/drm/bridge/inno-hdmi.c

412d4ae6b7a508 drivers/gpu/drm/rockchip/inno_hdmi.c Yakir Yang  2016-02-03  1061  
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1062  struct inno_hdmi *inno_hdmi_bind(struct device *dev,
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1063  				 struct drm_encoder *encoder,
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1064  				 const struct inno_hdmi_plat_data *plat_data)
412d4ae6b7a508 drivers/gpu/drm/rockchip/inno_hdmi.c Yakir Yang  2016-02-03  1065  {
412d4ae6b7a508 drivers/gpu/drm/rockchip/inno_hdmi.c Yakir Yang  2016-02-03  1066  	struct platform_device *pdev = to_platform_device(dev);
412d4ae6b7a508 drivers/gpu/drm/rockchip/inno_hdmi.c Yakir Yang  2016-02-03  1067  	struct inno_hdmi *hdmi;
412d4ae6b7a508 drivers/gpu/drm/rockchip/inno_hdmi.c Yakir Yang  2016-02-03  1068  	int irq;
412d4ae6b7a508 drivers/gpu/drm/rockchip/inno_hdmi.c Yakir Yang  2016-02-03  1069  	int ret;
412d4ae6b7a508 drivers/gpu/drm/rockchip/inno_hdmi.c Yakir Yang  2016-02-03  1070  
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1071  	if (!plat_data->phy_configs || !plat_data->default_phy_config) {
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1072  		dev_err(dev, "Missing platform PHY ops\n");
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1073  		return ERR_PTR(-ENODEV);
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1074  	}
412d4ae6b7a508 drivers/gpu/drm/rockchip/inno_hdmi.c Yakir Yang  2016-02-03  1075  
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1076  	hdmi = devm_drm_bridge_alloc(dev, struct inno_hdmi, bridge, &inno_hdmi_bridge_funcs);
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1077  	if (IS_ERR(hdmi))
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1078  		return ERR_CAST(hdmi);
5f2e93e6719701 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee    2023-12-22  1079  
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1080  	hdmi->dev = dev;
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1081  	hdmi->plat_data = plat_data;
5f2e93e6719701 drivers/gpu/drm/rockchip/inno_hdmi.c Alex Bee    2023-12-22  1082  
61735698103faf drivers/gpu/drm/rockchip/inno_hdmi.c Cai Huoqing 2021-08-31  1083  	hdmi->regs = devm_platform_ioremap_resource(pdev, 0);
412d4ae6b7a508 drivers/gpu/drm/rockchip/inno_hdmi.c Yakir Yang  2016-02-03  1084  	if (IS_ERR(hdmi->regs))
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1085  		return ERR_CAST(hdmi->regs);
412d4ae6b7a508 drivers/gpu/drm/rockchip/inno_hdmi.c Yakir Yang  2016-02-03  1086  
6a1b9229ecf11f drivers/gpu/drm/rockchip/inno_hdmi.c Andy Yan    2025-05-12  1087  	hdmi->pclk = devm_clk_get_enabled(hdmi->dev, "pclk");
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1088  	if (IS_ERR(hdmi->pclk)) {
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1089  		dev_err_probe(dev, PTR_ERR(hdmi->pclk), "Unable to get HDMI pclk\n");
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1090  		return ERR_CAST(hdmi->pclk);
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1091  	}
412d4ae6b7a508 drivers/gpu/drm/rockchip/inno_hdmi.c Yakir Yang  2016-02-03  1092  
6a1b9229ecf11f drivers/gpu/drm/rockchip/inno_hdmi.c Andy Yan    2025-05-12  1093  	hdmi->refclk = devm_clk_get_optional_enabled(hdmi->dev, "ref");
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1094  	if (IS_ERR(hdmi->refclk)) {
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1095  		dev_err_probe(dev, PTR_ERR(hdmi->refclk), "Unable to get HDMI refclk\n");
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1096  		return ERR_CAST(hdmi->refclk);
ad10b82c2bcac7 drivers/gpu/drm/rockchip/inno_hdmi.c Andy Yan    2025-04-22  1097  	}
ad10b82c2bcac7 drivers/gpu/drm/rockchip/inno_hdmi.c Andy Yan    2025-04-22  1098  
55137487bdee89 drivers/gpu/drm/rockchip/inno_hdmi.c Andy Yan    2025-05-12  1099  	inno_hdmi_init_hw(hdmi);
412d4ae6b7a508 drivers/gpu/drm/rockchip/inno_hdmi.c Yakir Yang  2016-02-03  1100  
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1101  	irq = platform_get_irq(pdev, 0);
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1102  	if (irq < 0)
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1103  		return ERR_PTR(irq);
412d4ae6b7a508 drivers/gpu/drm/rockchip/inno_hdmi.c Yakir Yang  2016-02-03  1104  
412d4ae6b7a508 drivers/gpu/drm/rockchip/inno_hdmi.c Yakir Yang  2016-02-03  1105  	ret = devm_request_threaded_irq(dev, irq, inno_hdmi_hardirq,
412d4ae6b7a508 drivers/gpu/drm/rockchip/inno_hdmi.c Yakir Yang  2016-02-03  1106  					inno_hdmi_irq, IRQF_SHARED,
412d4ae6b7a508 drivers/gpu/drm/rockchip/inno_hdmi.c Yakir Yang  2016-02-03  1107  					dev_name(dev), hdmi);
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1108  	if (ret)
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1109  		return ERR_PTR(ret);
412d4ae6b7a508 drivers/gpu/drm/rockchip/inno_hdmi.c Yakir Yang  2016-02-03  1110  
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1111  	hdmi->bridge.driver_private = hdmi;
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1112  	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT |
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1113  			   DRM_BRIDGE_OP_EDID |
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1114  			   DRM_BRIDGE_OP_HDMI |
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1115  			   DRM_BRIDGE_OP_HPD;
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1116  	hdmi->bridge.of_node = pdev->dev.of_node;
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1117  	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1118  	hdmi->bridge.vendor = "Inno";
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1119  	hdmi->bridge.product = "Inno HDMI";
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1120  
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1121  	hdmi->bridge.ddc = inno_hdmi_i2c_adapter(hdmi);
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1122  	if (IS_ERR(hdmi->bridge.ddc))
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1123  		return ERR_CAST(hdmi->bridge.ddc);
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1124  
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1125  	ret = devm_drm_bridge_add(dev, &hdmi->bridge);
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1126  	if (ret)
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1127  		return ERR_PTR(ret);
412d4ae6b7a508 drivers/gpu/drm/rockchip/inno_hdmi.c Yakir Yang  2016-02-03  1128  
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1129  	ret = drm_bridge_attach(encoder, &hdmi->bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1130  	if (ret)
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1131  		return ERR_PTR(ret);
412d4ae6b7a508 drivers/gpu/drm/rockchip/inno_hdmi.c Yakir Yang  2016-02-03  1132  
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1133  	return hdmi;
412d4ae6b7a508 drivers/gpu/drm/rockchip/inno_hdmi.c Yakir Yang  2016-02-03  1134  }
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16  1135  EXPORT_SYMBOL_GPL(inno_hdmi_bind);
969325a2597ebc drivers/gpu/drm/bridge/inno-hdmi.c   Andy Yan    2025-10-16 @1136  MODULE_AUTHOR("Andy Yan <andyshrk@163.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
