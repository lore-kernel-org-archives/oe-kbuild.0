Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175B927991E
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Mar 2026 09:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772875272; cv=none; b=JnYGTAh2/HnWZbXm0JPddC1C4JS9hjxsJIQEtWkHkAKu+e+pciHhYpmGORk1XdHrlZLdoE0TdYHBvKnDLEkw9snRPiHRkp3GPs7shJ5tO5L+kk677ilsgryCfdKi5XL/YaYT4kXyCcMmwuUAP2MWUncEZF4n9ySuZgAdiwC5jYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772875272; c=relaxed/simple;
	bh=ZoM9tRjUtvODvinv/YiGTigCNRRZlzktuFs7Cenb2Bo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KuDdh8Vh93wqsytci1CaRApkUAzBeBO0HzTW+8QZ829dkHh674eGqHP+x66bsikO/9QcVTNUnd6sOwxRLC/+LToKHCzitcihDnej90i783qA/PvXm7ZPt6ObS7tbZ7MXTyfwrf2IahlggR1lgn2Whvahd2VfZwO2vOaTWAq4RnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dGW+9wWq; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dGW+9wWq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772875269; x=1804411269;
  h=date:from:to:cc:subject:message-id;
  bh=ZoM9tRjUtvODvinv/YiGTigCNRRZlzktuFs7Cenb2Bo=;
  b=dGW+9wWqykq6ROP2zsGbQtigleStJubTxpdBWIJ1J+AHn+gt5w2MUNjk
   m2vvBtd9dOSsw78dLGkoMhShVBtdR+WgxsCcqrU4ck+mnQOdjgvBFUkX4
   eNK9pj4SkUyi/0rdp4A9+38wUi8hLF+Wne39lO90CoRL4rcsCp+/NH4C+
   b4ajxZ6cuwi/Mg2D4PgF0CNdeZRtVjQPHqpj9MXuUHVTI905ZpoU2wq8W
   VBu5ZP58gosNJrwiZ80fN8uYY1+/urcz/ZYd2DcoxJALqO5d8dCPv944A
   Cgd9YGsG8soraNs21BWv9CZWG3wUM4eoB8r7EhYsfQMlo3fjrjxKCMTSL
   w==;
X-CSE-ConnectionGUID: yDJO8iCxQPuJA7ACJDdE6g==
X-CSE-MsgGUID: ozQEVUv8RP2SA816GH2TNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="84299425"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="84299425"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 01:21:09 -0800
X-CSE-ConnectionGUID: luduk4hESc+dF85IPWNjEw==
X-CSE-MsgGUID: B3HuOeGwT5W5uaqJUAj8Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="219223239"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 07 Mar 2026 01:21:08 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vynqL-000000002Rx-07qt;
	Sat, 07 Mar 2026 09:21:05 +0000
Date: Sat, 07 Mar 2026 10:20:25 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-li:imx/dt64 34/47]
 arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dtb:
 system-controller@4ac10000 (fsl,imx91-media-blk-ctrl): 'dpi-bridge' does not
 match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202603071025.byFptcxi-lkp@intel.com>
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
TO: Yanan Yang <yanan.yang@nxp.com>
CC: Frank Li <Frank.Li@nxp.com>
CC: Lei Xu <lei.xu@nxp.com>
CC: Xiaofeng Wei <xiaofeng.wei@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git imx/dt64
head:   455842162c230a6310e3cf9d9a14de9239d6763c
commit: 9a7dded511a789ff4abb9b6db5db001d7cef06da [34/47] arm64: dts: freescale: add NXP FRDM-IMX91S board support
:::::: branch date: 15 hours ago
:::::: commit date: 5 days ago
config: arm64-randconfig-2052-20260306 (https://download.01.org/0day-ci/archive/20260307/202603071025.byFptcxi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603071025.byFptcxi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603071025.byFptcxi-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'fsl,ls2088a' was expected
   	'fsl,lx2160a' was expected
   	'solidrun,lx2160a-cex7' was expected
   	'solidrun,lx2162a-som' was expected
   	'tq,lx2160a-tqmlx2160a' was expected
   	'nxp,s32g2' was expected
   	'nxp,s32g3' was expected
   	'fsl,s32v234' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dtb: /: failed to match any schema with compatible: ['fsl,imx91-11x11-frdm-s', 'fsl,imx91']
>> arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dtb: system-controller@4ac10000 (fsl,imx91-media-blk-ctrl): 'dpi-bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx93-media-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dtb: /soc@0/system-controller@4ac10000/dpi-bridge: failed to match any schema with compatible: ['nxp,imx93-pdfc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
