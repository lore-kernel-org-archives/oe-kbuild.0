Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795276294;
	b=qYNnsceImAxvPYwXtCBYukgrNr/VED5gjchIT7QpI9/vh456T7J+tpLhlM3GfJ8fr/6v
	 +mtfEne7PM7uWqK+ZwR1G4YfDvE6bH0bTNw0lkaMl/Xv6CI0MBXGq66j2Rq/U6IKP6opw
	 AKA9tS8UtN5Lya2ojulO9OwhxFKn4XH4kotCvdujn/zdhxlOxF0I30mWyIqDcThG+WECc
	 K77j48xS//jClr8RDcxNz2xvVK3HMbdJVCJHukHyoXw9YEfIBiFzs8gC7syX6pZgd6TkG
	 ABva3/T93rCyNRnOHKF7ORLhYscASSMOXv4fE/lDhGeJcsMoTYcVmY0CIn5uawbFS5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795276294;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=yhzA8xfOoREdlsEuc8/L5q5hsUgvgsleu2y7SH5Ymbk=;
	b=E3M70huFbml75HF+naKDAFxpfdDPyVsYPNfruVOneQLhd0yTqnyL4Spi1EgCS1jaY4Z7
	 T0MGV28p9M9PVaX4JWGVzBKDfgeaWPxFYSJt+bA9U59hYdQ7M5+Hyy0/ignvCigj8BCbz
	 1fXdZLdmpwxJ5uUm33BkZZ5w/pibU+lldKVSFXA8KaptslR6avqOBY6qk60H70ixTE2GE
	 432GgD5d+XCiSEM+dcyheVL2NYW3lqypDIVrNSUh65sVz06fUn4d+mZIRfgtvAFr2vZ7z
	 eC5vbHObY8LdfwUj1AENMtlpLGZtaNYxoWwcUOnKQ/zDRXFIYgS1Ix7sWBW5FPhkG5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=arhO13Zb;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BD2606A32C
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 15:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63BD2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=arhO13Zb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795276293; x=1826812293;
  h=date:from:to:cc:subject:message-id;
  bh=wohbJjSMzvajRj3YGWc5akRLQOQUoNUEfCS6hCZEHEA=;
  b=arhO13ZbZxkzSi5qH6KE7mdi5D4Mw3c4rEIrTMWlWfqwC6O8aPFImTvv
   86OD+cRAC6ECKMEHTpBxZYNpam7ipQrn0mQzq1+/Txnvwzff/tHYpojn+
   a/07yVkU7JmcskysOHURsPvuzMlMIvO2+/wVdns5o7haV4X78+yyWhxvT
   snr+VwdO3LBugOokpZoa1eqtJzft3m2WTgaN6YqWh8lUYQK8AkbxWGugK
   6QhiEgwAg5KSnB7ZZVBSqi9ifreXcR0mg/hXknQa1gUOa9PLIENapRAH5
   cqObtlNP9EvYf8P5/eHuh7gqFLHO/qrgw2Ac0H5XVWyBxt/9iInEeJ0UE
   g==;
X-CSE-ConnectionGUID: 2l3X6HFHS8aDbimgz5pqYA==
X-CSE-MsgGUID: hbH3j22JQBSqea0Px2ScQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4029986"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4029986"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 07:51:32 -0800
X-CSE-ConnectionGUID: 3YAcJIpySBqkKtE0teL2nA==
X-CSE-MsgGUID: WJ0P+jwhRDq6EMCtTCqXbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="11507707"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 21 Nov 2026 07:51:31 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUnNA-000000004LV-3JRG;
	Sat, 21 Nov 2026 15:51:28 +0000
Date: Sat, 21 Nov 2026 16:50:33 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-li:imx/dt64 75/93]
 arch/arm64/boot/dts/freescale/imx95-data-modul-edm-sbc.dtb: gpio@43810000
 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
Message-ID: <20261121164747.GFNtjHyp-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Marek Vasut <marex@nabladev.com>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git imx/dt64
head:   e32bda9845c5239c3b7605c465d61f3e2d350599
commit: d92df623e90b3ff8a07fd926d8521a431d01bd05 [75/93] arm64: dts: imx95: Add support for Data Module i.MX95 eDM SBC
:::::: branch date: 23 hours ago
:::::: commit date: 2 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261121/20261121164747.GFNtjHyp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121164747.GFNtjHyp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261121164747.GFNtjHyp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx95.dtsi:1873.16-1902.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-data-modul-edm-sbc.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-data-modul-edm-sbc.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[25, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-data-modul-edm-sbc.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-data-modul-edm-sbc.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[25, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-data-modul-edm-sbc.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-data-modul-edm-sbc.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[25, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-data-modul-edm-sbc.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio'] is too short

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
