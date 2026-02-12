Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526593EBF31
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Feb 2026 08:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770885279; cv=none; b=R3NCDVeGMO9AV3gA7rFI9vR6X/hYwsWF+T6KUxHLgmILjxB6Ett8zCHbloZ8WjAxhLPRdrZttzPk2lL+ai1S1QNNE2jafURTQNcP5+54e2U2VXeqkpPCQGQ9ld98E/UqS00TxB4v2ou4XflLFW+CPrQBVmK2ODYHa53LoMATFlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770885279; c=relaxed/simple;
	bh=821SdxVAXQGvaSbRKXan80uMFlTM7/ZtcsUJ0HPCibs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mjPsAjd5DSEoSFpbDId9j3Se/GsGo5HsvIpHtXhfQo+LH97JfsX6phpiv0eo1sf2dVgtKV19tDNuIJdJUmECxeP+h6IcxByeiUiS/ZhhJm4JpCsmR5DMrVaQGa3BLsYb9BABZAY1i7RZgq7/uEfGRpLf0XauY5i2R0k8uaJ+LW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eySc++7/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eySc++7/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770885277; x=1802421277;
  h=date:from:to:cc:subject:message-id;
  bh=821SdxVAXQGvaSbRKXan80uMFlTM7/ZtcsUJ0HPCibs=;
  b=eySc++7/FegYpzME7Gs9V/xKIjoQMewIHT91aQ/y0IFLr6lQgoOTQVAE
   3WMCWyxNZq+K+PVj2Hob3X2TD5iP1NHRmh641fHQchIQDLgF7kCSpaVH+
   gQE3wjShGuM5+tAii+D5KNKBDwwWtF+skHnPMPIQZugEFqNPHQb80b/PJ
   OYlDQcvFndomBCi6NhlcooS0PqocdQzLMTkZfp5yGI+a53eq3CQ4tBs1v
   yzM0FCP5hOKUx/8rxkSfkVgWxrMz7vvPLDIbWlQaG3rlhjAn/2qXRNKII
   6zapbtN9VCVx4vgZjsCYvjsLKO69/DZXHaS/WIQkcKefd5wTbUoSweJgW
   w==;
X-CSE-ConnectionGUID: Ox6R5aJBRM+z/FUcgXX7Sw==
X-CSE-MsgGUID: 6V+StFr/Q4ebCY2MBlgAVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="75895065"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="75895065"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 00:34:37 -0800
X-CSE-ConnectionGUID: MgvL67DwQfKIvWDU/9XRSQ==
X-CSE-MsgGUID: 2kfThEVxQV2+A0AmxLnICg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="217486254"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 12 Feb 2026 00:34:36 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqS9g-000000001If-3tAG;
	Thu, 12 Feb 2026 08:34:32 +0000
Date: Thu, 12 Feb 2026 09:33:44 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/nxp/imx/imx6dl-sabrelite.dtb: camera@42
 (ovti,ov5642): 'gp-gpios' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202602120907.HKJm7KrA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Frank Li <Frank.Li@nxp.com>
CC: Shawn Guo <shawnguo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   37a93dd5c49b5fda807fd204edf2547c3493319c
commit: 0978cbfe5bccacb1f1bee5c88d667769557b5e4f ARM: dts: remove undocumented clock-names for ov5642
date:   4 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-2051-20260206 (https://download.01.org/0day-ci/archive/20260212/202602120907.HKJm7KrA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260212/202602120907.HKJm7KrA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602120907.HKJm7KrA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6dl-sabrelite.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): 'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-sabrelite.dtb: ethernet@2188000 (fsl,imx6q-fec): mdio: Unevaluated properties are not allowed ('ethernet-phy' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fec.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-sabrelite.dtb: ethernet-phy (ethernet-phy-ieee802.3-c22): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
>> arch/arm/boot/dts/nxp/imx/imx6dl-sabrelite.dtb: camera@42 (ovti,ov5642): 'gp-gpios' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5642.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
