Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B356126CE32
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Jun 2026 02:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780971857; cv=none; b=a0TLVp7HgLZy+ZhzQ770cOHF0eMCXdr778Rbp6kpaVxkC033Zed5m0ZR1wu8HmJ9xeGRj9gxR97nPCMOJaMDhC/kao2PsxqOXBIhSRosMDUPvgUl6eY1qN+pTfnMuy1Hpt95uqSAoK9jQWR++GxfL32ps+urF7l8kBbhJJmggr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780971857; c=relaxed/simple;
	bh=XHcZQILUpvTl0V/Xgvb8kqwt7tw+3ozOumqJOIXdANY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iGDWuWbHMoTzDjZpaZqduuMIG+YOpozca4RPaP/jRWV+Qq1Yj9GS9p8u7uCr9J0AzOnX4cysTlpyz2ZbcESK49pwRPmw5WpqdMgx+yfxibzuy9Cg5zdKQ47OVV49IMO0V54V5i7W+Yd6WdKUIYp6/R3hS5s3UQ/k3Jyl7oDSX7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bHjok3hg; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bHjok3hg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780971855; x=1812507855;
  h=date:from:to:cc:subject:message-id;
  bh=XHcZQILUpvTl0V/Xgvb8kqwt7tw+3ozOumqJOIXdANY=;
  b=bHjok3hgzfxzyVeZzNAq72j0sKSP8dsBLYbbQVsHsLIZmnNkEqZ9LPy4
   WI/T3inFNVOhSzfcPQUHXIN1DfUAPC2bXBrtgGvH3/OQ5eR9OeImkbE/r
   rYvIX8lbn6FuAkOXX4xaLv9mJ2lGu/d28clMFCbRDcp1EuZlC+RDYgilt
   7R+aSoS/2/jqdArUisE+z5NV/2c1TLiApk7YpcjsJa/mjXeX3nmRo8klk
   os6iHUBJRa3w5xxswkC4MoK3YX3lpRPTn3953oGMy2FessnF1G1VaosUY
   JeYv8fmAVWJBhJhrLPDip8nrIe/xymgsx+PoofY+gtQGBjAhVeN8IQIWE
   Q==;
X-CSE-ConnectionGUID: vJt2daomRIWtqGGVwP1lsg==
X-CSE-MsgGUID: acrIUizpTzei9dP+1SEQew==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="92046209"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="92046209"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 19:24:15 -0700
X-CSE-ConnectionGUID: e6EnBj1ET6+ND5bEXpVQBg==
X-CSE-MsgGUID: XDXfWHHHSnShUCDO9GamYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="244871424"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 08 Jun 2026 19:24:15 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wWm8R-000000003Nd-3YF2;
	Tue, 09 Jun 2026 02:24:11 +0000
Date: Tue, 09 Jun 2026 04:23:47 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dtb:
 /rga@fdb60000: failed to match any schema with compatible:
 ['rockchip,rk3588-rga3']
Message-ID: <202606090431.NAzviJkK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Hrushiraj Gandhi <hrushirajg23@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Hrushiraj-Gandhi/dt-bindings-arm-rockchip-add-Vicharak-Axon-board/20260608-141200
head:   57313957ec6a4186b550d73e17c0d41320845976
commit: 57313957ec6a4186b550d73e17c0d41320845976 arm64: dts: rockchip: add Vicharak Axon board
date:   20 hours ago
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: arm64-randconfig-2051-20260608 (https://download.01.org/0day-ci/archive/20260609/202606090431.NAzviJkK-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260609/202606090431.NAzviJkK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606090431.NAzviJkK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dtb: /rga@fdb60000: failed to match any schema with compatible: ['rockchip,rk3588-rga3']
>> arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dtb: /rga@fdb70000: failed to match any schema with compatible: ['rockchip,rk3588-rga3']
   arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dtb: /video-capture@fdce0000: failed to match any schema with compatible: ['rockchip,rk3588-vicap']
>> arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
>> arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dtb: pmic@0 (rockchip,rk806): Unevaluated properties are not allowed ('rk806_dvs1_null', 'rk806_dvs1_pwrdn', 'rk806_dvs1_rst', 'rk806_dvs1_slp', 'rk806_dvs2_dvs', 'rk806_dvs2_gpio', 'rk806_dvs2_null', 'rk806_dvs2_pwrdn', 'rk806_dvs2_rst', 'rk806_dvs2_slp', 'rk806_dvs3_dvs', 'rk806_dvs3_gpio', 'rk806_dvs3_null', 'rk806_dvs3_pwrdn', 'rk806_dvs3_rst', 'rk806_dvs3_slp' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk806.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
