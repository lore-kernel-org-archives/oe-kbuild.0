Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D92D1F7075
	for <oe-kbuild@lists.linux.dev>; Thu, 29 May 2025 11:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748518747; cv=none; b=I/HuuBpy3B8DepCgNdad8lEjA5YeUaehOz2ifVcN9HxK94qGyjNQhjw46M5z24fsB+/S9Eyaxykt5PEUgs92H0JXFaaLFnRM2AOFZbj3nwalbcFL1Mx1JAJ5O8wVHQa8AFK4zqvyyTcSZ/bqgUKQrp2HbmKydwwf8J1e28qrIK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748518747; c=relaxed/simple;
	bh=6dkRP9Fh6DvksZQBTBweQ2CP+Qk+9iz5p394WdZ/IH4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VWMhQ6oNPWINTyu3m2uQcUVDLab77+DspHVdktWrE3yIvlEeHrOEtbdVeKnWfSdQfr++l6ruwe1Sa7mfjrkd7WecqAWV7CrvEMpJ5qPjCgVSF9ppppolMpMEq/dXxkDGhvI5bXhWqWdpM94PPcJB1Was6V6IeVRryYQ0LPEPYlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D0fSS1fl; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D0fSS1fl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748518745; x=1780054745;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6dkRP9Fh6DvksZQBTBweQ2CP+Qk+9iz5p394WdZ/IH4=;
  b=D0fSS1flGsLkwTSdn5qBpJKxiqv2NBMv168sjbV6+YEgN2Ta6/grr69d
   D20+5JZdcaqGaCQaz/OHsxYah+mDPQD8tE5uTdn8JFgSXdj9NsmElXrXO
   YNz4L5/uCvX0qtUCP3jXL0kONE7tzAGS++5L37tkAa9wKN/J9TIR/axA1
   hc2Vxq9RYM7a9RpXwbf25M8eNdLQSsLN6Wd6HzrO0bRQyR/2tbg1tpjrW
   hNXm2RfLcxwvogo60zhveAydxd12sMR6EoPmwGy9UFYVGBQUzsK9VGAF9
   nfnnBZL6PgLPP4z8+ZzG0ABQbCtesGh4b/zaFd4MWipSe4Edxq4Oh1TzR
   g==;
X-CSE-ConnectionGUID: X+3kipvVQuqgxp8m0vweuQ==
X-CSE-MsgGUID: oSzX/HB9QOaOF/fkfN1Hng==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50629214"
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; 
   d="scan'208";a="50629214"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 04:39:04 -0700
X-CSE-ConnectionGUID: rhROjDdMS7+uhSlGwJqqHg==
X-CSE-MsgGUID: GiY7kJxCRYe6hX6Lh1fgRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; 
   d="scan'208";a="174410693"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 May 2025 04:39:04 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKbbB-000Wda-2J;
	Thu, 29 May 2025 11:39:01 +0000
Date: Thu, 29 May 2025 19:38:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dtb: mcc
 (arm,vexpress,config-bus): 'clock-controller' does not match any of the
 regexes: '^amp-.+$', '^energy(-.+)?$', '^pinctrl-[0-9]+$', '^power-.+$',
 '^reset[0-9]*$', '^temp-.+$', '^volt-.+$', 'clk[0-9]*$'
Message-ID: <202505291906.4CK36BfL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Sudeep Holla <sudeep.holla@arm.com>

Hi Rob,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   90b83efa6701656e02c86e7df2cb1765ea602d07
commit: 04f08ef291d4b8d76f8d198bf2929ad43b96eecf arm/arm64: dts: arm: Use generic clock and regulator nodenames
date:   11 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 11 months ago
config: arm64-randconfig-052-20250529 (https://download.01.org/0day-ci/archive/20250529/202505291906.4CK36BfL-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250529/202505291906.4CK36BfL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505291906.4CK36BfL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dtb: / (arm,rtsm_ve,aemv8a): bus@8000000: Unevaluated properties are not allowed ('#interrupt-cells', 'interrupt-map', 'interrupt-map-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,vexpress-juno.yaml#
>> arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dtb: mcc (arm,vexpress,config-bus): 'clock-controller' does not match any of the regexes: '^amp-.+$', '^energy(-.+)?$', '^pinctrl-[0-9]+$', '^power-.+$', '^reset[0-9]*$', '^temp-.+$', '^volt-.+$', 'clk[0-9]*$'
   	from schema $id: http://devicetree.org/schemas/arm/vexpress-config.yaml#
--
   scripts/dtc/include-prefixes/arm/arm/vexpress-v2m-rs1.dtsi:419.9-490.7: Warning (simple_bus_reg): /bus@8000000/motherboard-bus@8000000/iofpga-bus@300000000/mcc: missing or empty reg/ranges property
   scripts/dtc/include-prefixes/arm/arm/vexpress-v2m-rs1.dtsi:366.13-376.9: Warning (graph_child_address): /bus@8000000/motherboard-bus@8000000/iofpga-bus@300000000/i2c@160000/dvi-transmitter@39/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dtb: / (arm,vexpress,v2f-1xv7,ca53x2): bus@8000000: Unevaluated properties are not allowed ('#interrupt-cells', 'interrupt-map', 'interrupt-map-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,vexpress-juno.yaml#
   arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dtb: iofpga-bus@300000000 (simple-bus): mcc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dtb: dcc (arm,vexpress,config-bus): 'clock-controller', 'regulator-12v', 'regulator-vio' do not match any of the regexes: '^amp-.+$', '^energy(-.+)?$', '^pinctrl-[0-9]+$', '^power-.+$', '^reset[0-9]*$', '^temp-.+$', '^volt-.+$', 'clk[0-9]*$'
   	from schema $id: http://devicetree.org/schemas/arm/vexpress-config.yaml#
--
   arch/arm64/boot/dts/arm/fvp-base-revc.dtb: / (arm,fvp-base-revc): bus@8000000: Unevaluated properties are not allowed ('#interrupt-cells', 'interrupt-map', 'interrupt-map-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,vexpress-juno.yaml#
>> arch/arm64/boot/dts/arm/fvp-base-revc.dtb: mcc (arm,vexpress,config-bus): 'clock-controller' does not match any of the regexes: '^amp-.+$', '^energy(-.+)?$', '^pinctrl-[0-9]+$', '^power-.+$', '^reset[0-9]*$', '^temp-.+$', '^volt-.+$', 'clk[0-9]*$'
   	from schema $id: http://devicetree.org/schemas/arm/vexpress-config.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
