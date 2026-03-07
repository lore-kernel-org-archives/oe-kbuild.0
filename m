Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E0D1A682D
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Mar 2026 05:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772861827; cv=none; b=RIh0vc3j1DcjDcpbgSMUb4kQPl1iJmpHkFoeLlWBZzFOYEA+lmvICgI38bzi0WE/xNhuWm4m/ZlA0256HG9sPQI04I/zj8o5HXWV5MwjD3GxUa3fEE4nRvrvKnPl2f2rYtSszy9eSet8swkyhjDcjRjsnhl90Hk0kXA6rvJ2AcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772861827; c=relaxed/simple;
	bh=R6VIAK/B6yPR2mYMpWXQUjL1sFETImKQ6ctrzGeI/Ak=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N3/HHNbYmfnychfxARu2exQS7br5mQEq/6fyEdfTmGJITzG+U/9ih0nLZYpcRbdR56mFfN5ZttB3KzdqkLM5ARQLkleSwXQrlFYdd+egPTwWDTYZhoTk7QyvVooWB2fp0tr1K4KMOJh/ZF+tJI4OknGUzPZd1BULXxVmqffJlfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f+8BMIj0; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f+8BMIj0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772861827; x=1804397827;
  h=date:from:to:cc:subject:message-id;
  bh=R6VIAK/B6yPR2mYMpWXQUjL1sFETImKQ6ctrzGeI/Ak=;
  b=f+8BMIj0xf1DlnHfqk96qb9fJ7qk7fsXBQNxF9OOfrO/9Ja2847ejeCz
   lIhm55icxObucf4WhvGBAD6akBfTPSYcN8uG5R/2+P+bd6YIyfafTZ0Gl
   OCN/xBOLhGilEhAXnJZmpRSofsayeihiRcCUiq5ZgvTxtmWOWO0kPXYHJ
   7+9mBZti29xpRxg5hvvweeEcDb/YJOtpCsu29xJznx8ZV1OYxB0jENTQw
   X6B1xkrgyTvBVd34nkqS7HMPo1ATVnw7Mwm7yl/aG06GfMygX0MpnyLPs
   iJDFUJwuyW2eMaVmk8HqcM1tlX1VsfuZ6C3ZMJkI5lUCYi7sMb8i0Mtnn
   g==;
X-CSE-ConnectionGUID: 6hwiNMIUTz2sQxccV3+M8w==
X-CSE-MsgGUID: SJ1lcjRDQb+JisrDHZxlnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73938090"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="73938090"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 21:37:06 -0800
X-CSE-ConnectionGUID: T4J7Ws81SpGvILO5szwtKg==
X-CSE-MsgGUID: lRknvVe2SUCsOhzBh0AHfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="221987651"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 06 Mar 2026 21:37:05 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vykLX-000000002Q9-26ar;
	Sat, 07 Mar 2026 05:37:03 +0000
Date: Sat, 07 Mar 2026 06:36:13 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-li:imx/dt64 23/47]
 arch/arm64/boot/dts/freescale/imx93w-evk.dtb: system-controller@4ac10000
 (fsl,imx93-media-blk-ctrl): 'dpi-bridge' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202603070640.a8s7nWXS-lkp@intel.com>
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
TO: Sherry Sun <sherry.sun@nxp.com>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git imx/dt64
head:   455842162c230a6310e3cf9d9a14de9239d6763c
commit: 8c2d3dd02d1a22d3f2c00ba98e90e283c1d0db20 [23/47] arm64: dts: imx93: Add i.MX93 Wireless EVK board support
:::::: branch date: 12 hours ago
:::::: commit date: 10 days ago
config: arm64-randconfig-2052-20260306 (https://download.01.org/0day-ci/archive/20260307/202603070640.a8s7nWXS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603070640.a8s7nWXS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603070640.a8s7nWXS-lkp@intel.com/

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
   arch/arm64/boot/dts/freescale/imx93w-evk.dtb: /: failed to match any schema with compatible: ['fsl,imx93-wireless-evk', 'fsl,imx93']
>> arch/arm64/boot/dts/freescale/imx93w-evk.dtb: system-controller@4ac10000 (fsl,imx93-media-blk-ctrl): 'dpi-bridge' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx93-media-blk-ctrl.yaml
>> arch/arm64/boot/dts/freescale/imx93w-evk.dtb: /soc@0/system-controller@4ac10000/dpi-bridge: failed to match any schema with compatible: ['nxp,imx93-pdfc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
