Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8ED29CEB
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Jul 2025 14:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752934001; cv=none; b=EO3o+X2oVXUZUCXtMpn1eqJtmPQtgV/KIzpXVORvt/Yp1+4aUXyTlrDPluIfDSypJC2CjgQBULAQyHuFJzkzEPBb4s0Gajf7U02DXcxX4bjn0nm/flbUV13WiBK+0juB+7d7ju6BgcuAaPsCmnh2xlxZQJI3we7h3dz6/PVJC68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752934001; c=relaxed/simple;
	bh=HQ34az0v8wFVBWGuwm3zyMoKHUtAco+Qd+XojtLqFXE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UdefflEFDaO9khwuy+eKdRmd4le+2OZ9FbEuZyDDZ18koikfF/cJX6zrA9zBnJP4eGIry+hWHey/bqjb/RH5o3D52WfdEBirVdEX7JWh2Wnh6A4RwlaqyeW+QXfBEsV5y3Mke7a12WYVRQgj2qUwlqKj1gK8zNeGuIw+oIe3j8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dD3EEOow; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dD3EEOow"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752933999; x=1784469999;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HQ34az0v8wFVBWGuwm3zyMoKHUtAco+Qd+XojtLqFXE=;
  b=dD3EEOow5PZABbK5YTtnu6BzWoV7EILUy6chcH8m+++WUFdAOhreN9ou
   X4aZyNweGsim2dP9GjsYu0zPlCF/n1VmxlD4Qu4/uDJ2KFFs0sJ1W00NH
   rCfyh0R2EHgStIETyV/LScVxvTtGxz3sS44k5orPHzYZtmyngnlyiMopO
   ifMViRQapOFlYD+p7ISZAcw430ezsN8Ta2LitZv2go8I220gHUjgv1NxU
   cMwZ4rgtkozr8l8N2K9tHt95sqlATxFH5/WfUJMmI9QFGxzEOTACx8Gft
   FnT12xWB2rZut2/qh6a8NLEN6q+8DKCDWXTzQlzhhRI3TG7OGBZV9p506
   w==;
X-CSE-ConnectionGUID: Nzl5QHNLTMKFdaNUXf3yxA==
X-CSE-MsgGUID: QO7mftvNTA60em5vTlhQ3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11497"; a="72663401"
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; 
   d="scan'208";a="72663401"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2025 07:06:38 -0700
X-CSE-ConnectionGUID: m3B4mQxQQoC4pii/8IJgOQ==
X-CSE-MsgGUID: INeNQMMYT1iyp0ygcpXQ2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; 
   d="scan'208";a="189404027"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 19 Jul 2025 07:06:37 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ud8Cx-000169-2U;
	Sat, 19 Jul 2025 14:06:35 +0000
Date: Sat, 19 Jul 2025 16:06:05 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:imx93-ethos-v2 4/49]
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: /: failed to match any
 schema with compatible: ['fsl,imx93-11x11-frdm', 'fsl,imx93']
Message-ID: <202507191645.CpPNsKy0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Fabian Pflug <f.pflug@pengutronix.de>
CC: Tomeu Vizoso <tomeu@tomeuvizoso.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git imx93-ethos-v2
head:   b81e8ee214f77950479c304b6ca560903de46c7c
commit: ab8d0290a971b84a8c79e92b987cdb5ceb04d003 [4/49] arm64: dts: freescale: add support for NXP i.MX93 FRDM
:::::: branch date: 4 days ago
:::::: commit date: 4 weeks ago
config: arm64-randconfig-2051-20250717 (https://download.01.org/0day-ci/archive/20250719/202507191645.CpPNsKy0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507191645.CpPNsKy0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507191645.CpPNsKy0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'fsl,ls2081a' was expected
   	'fsl,ls2088a' was expected
   	'fsl,lx2160a' was expected
   	'solidrun,lx2160a-cex7' was expected
   	'solidrun,lx2162a-som' was expected
   	'tq,lx2160a-tqmlx2160a' was expected
   	'nxp,s32g2' was expected
   	'nxp,s32g3' was expected
   	'fsl,s32v234' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
>> arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: /: failed to match any schema with compatible: ['fsl,imx93-11x11-frdm', 'fsl,imx93']
   arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: sram@20480000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: sram@20480000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: sram@20480000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: /soc@0/npu@4a900000: failed to match any schema with compatible: ['arm,ethos-u65']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
