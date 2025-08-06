Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BDE220F29
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Aug 2025 21:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754514313; cv=none; b=EU8R2nP1gzseCuKFvzGrNMSQ/RpttQhSxF42nlFIX7M6sWO1XV42M+0HWodqrDy64fN5Kffz2S8Cp1lM28KoDC16ZCqu2V1VIK3reVaVg6utligT/jn8C4MWFpUhUbs81tYFT2naQLtPq9R1UJWN8pX3igRFs923k/3+jWlGNj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754514313; c=relaxed/simple;
	bh=KdvqO4p6fa7phbwpotSZc5lyGifusc7eZKAqmF1n2r8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dPGe388mDH6CzEhVH7nj7uikQuKBV2lrOf80bXI6C/2bgi+6SmH285Z4fAomWqBobdhEIsLR8NGQPkzf9GXcwTao7fqtOFSTtpJN1MbI3WzUsEaOaaQrv5OdTapuBR/MC6Ce86Evt8jh0ZJdIw7DKQatQFfsE/YvmVW/l3kQ8DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R6zLZMnK; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R6zLZMnK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754514312; x=1786050312;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KdvqO4p6fa7phbwpotSZc5lyGifusc7eZKAqmF1n2r8=;
  b=R6zLZMnKBG1nMJickswLFsQOkyKxv65jPw0RpShdWw97rSe1WcODAij1
   fcCHNu1FTfltXZxWPrUUlReoVKaJAqRdcplfKC2DEG932R0u1xi/1SlLU
   e14+WpPcTWwWT/2bX6WxLi375oECF0FyeGRWHEb817cKPg9ixUtoKiMSM
   u+Vl6BD1H8g44QbNY87zcdi/bEOY8xiPguCDGXlvn+n/80Kb1NoGyKs2n
   AN98M36j/uXYybhscbAqcCZSa7GkF7t8Se3rj2P9BfMQLBZn3953MmQoa
   tR7Bk1iqSu7tgjhUlLgzUcW0wQSM7CLhW7UOg5xjW1UtzJP1ZjNYqKn5w
   Q==;
X-CSE-ConnectionGUID: KnDnhU6uQX29cmqrHXsGbA==
X-CSE-MsgGUID: mMOf3/MfSOe7B/KPkggGQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="79392248"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="79392248"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 14:05:11 -0700
X-CSE-ConnectionGUID: b59BfBtKTeuBwqH9ZUepYw==
X-CSE-MsgGUID: 031bwzCXQFed+xTRZ5wQ9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="169126857"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 06 Aug 2025 14:05:10 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujlJf-00026m-2m;
	Wed, 06 Aug 2025 21:04:58 +0000
Date: Thu, 7 Aug 2025 05:03:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:asahi-wip 20/208]
 arch/arm64/boot/dts/apple/t6001-j316c.dtb: network@0,1 (pci14e4,5f71):
 $nodename:0: 'network@0,1' does not match '^bluetooth(@.*)?$'
Message-ID: <202508070529.YLLpXz6f-lkp@intel.com>
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
TO: Hector Martin <marcan@marcan.st>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux asahi-wip
head:   0fcda52c969c6fe276e3f63f02438233ca592077
commit: ceb71d91cf1d661936202257e99853580c063652 [20/208] arm64: dts: apple: t600x: Add bluetooth device trees
:::::: branch date: 3 days ago
:::::: commit date: 10 days ago
config: arm64-randconfig-052-20250804 (https://download.01.org/0day-ci/archive/20250807/202508070529.YLLpXz6f-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508070529.YLLpXz6f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508070529.YLLpXz6f-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:113.45-116.7: Warning (unique_unit_address_if_enabled): /soc/spmi@2920a1300/pmic@f/nvmem-layout/boot-error-count@6002: duplicate unit-address (also used in node /soc/spmi@2920a1300/pmic@f/nvmem-layout/panic-count@6002)
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:73.10-82.6: Warning (graph_child_address): /soc/i2c@39b040000/usb-pd@38/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:99.10-108.6: Warning (graph_child_address): /soc/i2c@39b040000/usb-pd@3f/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:125.10-134.6: Warning (graph_child_address): /soc/i2c@39b040000/usb-pd@3b/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: network@0,1 (pci14e4,5f71): $nodename:0: 'network@0,1' does not match '^bluetooth(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/brcm,bcm4377-bluetooth.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: usb@702280000 (apple,t6000-dwc3): iommus: [[146, 0], [147, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: usb@702280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: usb@b02280000 (apple,t6000-dwc3): iommus: [[150, 0], [151, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: usb@b02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
--
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:113.45-116.7: Warning (unique_unit_address_if_enabled): /soc/spmi@2920a1300/pmic@f/nvmem-layout/boot-error-count@6002: duplicate unit-address (also used in node /soc/spmi@2920a1300/pmic@f/nvmem-layout/panic-count@6002)
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:59.10-68.6: Warning (graph_child_address): /soc/i2c@39b040000/usb-pd@38/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:85.10-94.6: Warning (graph_child_address): /soc/i2c@39b040000/usb-pd@3f/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:111.10-120.6: Warning (graph_child_address): /soc/i2c@39b040000/usb-pd@3b/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:137.10-146.6: Warning (graph_child_address): /soc/i2c@39b040000/usb-pd@3c/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: network@0,1 (pci14e4,5f71): $nodename:0: 'network@0,1' does not match '^bluetooth(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/brcm,bcm4377-bluetooth.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@702280000 (apple,t6000-dwc3): iommus: [[147, 0], [148, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@702280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@b02280000 (apple,t6000-dwc3): iommus: [[151, 0], [152, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: usb@b02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
--
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:113.45-116.7: Warning (unique_unit_address_if_enabled): /soc@200000000/spmi@2920a1300/pmic@f/nvmem-layout/boot-error-count@6002: duplicate unit-address (also used in node /soc@200000000/spmi@2920a1300/pmic@f/nvmem-layout/panic-count@6002)
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:59.10-68.6: Warning (graph_child_address): /soc@200000000/i2c@39b040000/usb-pd@38/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:85.10-94.6: Warning (graph_child_address): /soc@200000000/i2c@39b040000/usb-pd@3f/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:111.10-120.6: Warning (graph_child_address): /soc@200000000/i2c@39b040000/usb-pd@3b/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:137.10-146.6: Warning (graph_child_address): /soc@200000000/i2c@39b040000/usb-pd@3c/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t6002-j375d.dts:36.10-45.6: Warning (graph_child_address): /soc@200000000/i2c@39b040000/usb-pd@39/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t6002-j375d.dts:63.10-72.6: Warning (graph_child_address): /soc@200000000/i2c@39b040000/usb-pd@3a/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: network@0,1 (pci14e4,5f71): $nodename:0: 'network@0,1' does not match '^bluetooth(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/brcm,bcm4377-bluetooth.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@702280000 (apple,t6000-dwc3): iommus: [[166, 0], [167, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@702280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/usb@702280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@b02280000 (apple,t6000-dwc3): iommus: [[170, 0], [171, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: usb@b02280000 (apple,t6000-dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
