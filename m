Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE3F35950
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Sep 2025 20:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759006265; cv=none; b=rzGyvTIen6koMDPcUs8HPuf91q7oHkJDq4YE16j6VsvFcsR+fcrMPEtbk4K74tXQsirxXGMPIJgxcof7OqSBoNCDIRL+HCGiKHKRCNKvz1WOw61o630sElBdCu7XN1oqhloT6+1rf3e3rRq3kbhpfiDARII6av1AhrznobnLiXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759006265; c=relaxed/simple;
	bh=lHpPNMyQz8fHZqpFKhY3vdKv8qXGevdxTAR94gJ+oMs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z2EqgdZ+qdFemXbjPHvPZsewUZybAI+srXwcRbhywo2WOWm5KgtAy0zFBeA6xw7/6WqadrtMpYjiITbgjluM45KFiXIxZ+mTscaQdnjpEFdkb/02AnzrJo5fVtEJ8Lmnu0AGcRKPXWjN+TfWgVgzAMkuORywLXIoHS/GVe5Faig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fcauLLj1; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fcauLLj1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759006263; x=1790542263;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lHpPNMyQz8fHZqpFKhY3vdKv8qXGevdxTAR94gJ+oMs=;
  b=fcauLLj1mowKElQD9qdxQeyoPruZTc0Gigxxgx70iKeWoLkf6tQIxzOv
   QlBy2YPY0PAJ1p+J5Gip3ZkQ71E3pyogjS9vvR+gvc7qcVLQe4PlpA6/t
   kTE1g3vCYwUR/DV88O4vSVDs3OOgC+xdX0M7ywmcBCatKPG+VwXFCCwAh
   nnpDaGaJs9wcSHVsKvK4kNOZIohylKs2hpjSo0vuAJ9j9FJIB2QlflJCD
   M4cGjiz37NDxMUJruFTDRO/CGCDUJZ5wr3+WQNztqPOGP75F8Jyy3HN6w
   7KdLNNP5n0vULrgUD0ZPJUEgP74w1OsuXbJpwWQ8tunNo2RAyjhF9D7hq
   A==;
X-CSE-ConnectionGUID: xGz/JS7oQMeFQWBBBZl1+A==
X-CSE-MsgGUID: M69MxpTUSpWfHNMxPCsGDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="72401365"
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; 
   d="scan'208";a="72401365"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 13:51:02 -0700
X-CSE-ConnectionGUID: zHznxl/KTZ6iHrh6Bqh/ag==
X-CSE-MsgGUID: EC4cPkQJRcq6aYxVTOOAPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; 
   d="scan'208";a="178328457"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 27 Sep 2025 13:51:01 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2bsg-0007LT-2W;
	Sat, 27 Sep 2025 20:50:58 +0000
Date: Sun, 28 Sep 2025 04:50:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wsa:renesas/v4h/wwdt 9/11]
 arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dtb: watchdog@40008000
 (renesas,r9a06g032-wdt): 'timeout-sec' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202509280449.l2b4Oy3d-lkp@intel.com>
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
TO: Wolfram Sang <wsa-dev@sang-engineering.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/v4h/wwdt
head:   535543a86b5603755640519524e906fa69e74126
commit: ce520739ffb7e19a3f617ad6adea4c959271e71b [9/11] dt-bindings: watchdog: factor out RZ/N1 watchdog
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: arm-randconfig-051-20250927 (https://download.01.org/0day-ci/archive/20250928/202509280449.l2b4Oy3d-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250928/202509280449.l2b4Oy3d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509280449.l2b4Oy3d-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/renesas/r9a06g032.dtsi:439.27-488.5: Warning (avoid_unnecessary_addr_size): /soc/switch@44050000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/renesas/r9a06g032.dtsi:156.4-158.33: Warning (interrupt_map): /soc/pci@40030000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@44101000, using 0 as fallback
   arch/arm/boot/dts/renesas/r9a06g032.dtsi:156.4-158.33: Warning (interrupt_map): /soc/pci@40030000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@44101000, using 0 as fallback
   arch/arm/boot/dts/renesas/r9a06g032.dtsi:156.4-158.33: Warning (interrupt_map): /soc/pci@40030000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@44101000, using 0 as fallback
>> arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dtb: watchdog@40008000 (renesas,r9a06g032-wdt): 'timeout-sec' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/watchdog/renesas,rzn1-wdt.yaml#
   arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dtb: switch@44050000 (renesas,r9a06g032-a5psw): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/renesas,rzn1-a5psw.yaml#
--
   arch/arm/boot/dts/renesas/r9a06g032.dtsi:439.27-488.5: Warning (avoid_unnecessary_addr_size): /soc/switch@44050000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/renesas/r9a06g032.dtsi:156.4-158.33: Warning (interrupt_map): /soc/pci@40030000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@44101000, using 0 as fallback
   arch/arm/boot/dts/renesas/r9a06g032.dtsi:156.4-158.33: Warning (interrupt_map): /soc/pci@40030000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@44101000, using 0 as fallback
   arch/arm/boot/dts/renesas/r9a06g032.dtsi:156.4-158.33: Warning (interrupt_map): /soc/pci@40030000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@44101000, using 0 as fallback
>> arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: watchdog@40008000 (renesas,r9a06g032-wdt): 'timeout-sec' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/watchdog/renesas,rzn1-wdt.yaml#
   arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: switch@44050000 (renesas,r9a06g032-a5psw): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/renesas,rzn1-a5psw.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
