Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A640A31984B
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Aug 2025 18:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755196809; cv=none; b=pn2ura78et/K0IcK3+e5cbtybyHm3gA6LTwApAgn4uiuSPEf1FLs4Ay6b/VwbWQz7iUg6fsGDeUGNuMpRvX9w1lNrS9lPuJlHSJl9LnqE/A6Mzg8+uVU5plDld0MVi3Plt27v+DGGeqUdJ5Exd/aDc6yFb91pZJJwyu875l2Thw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755196809; c=relaxed/simple;
	bh=lnGdHJokPh+XDTPqXODVSTfdLGGcgW2gqkShVO2qypM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JogcYq+ZW4xl8JTqlXz2BTN1mgWLukdtE4I31t3whBivX4B6kBQm3t6Mau/T8a1mPH7gRTKFjbWjJIAFCDKsT2nmiO5Lov7sVcxWwQN9crZs7m+Z6p5ZJrqIf3v2s1COUdK/B24R4Nf6HYUH0TMTOWz193XW0oRatqlGSBg9LRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HtKlw71e; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HtKlw71e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755196808; x=1786732808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lnGdHJokPh+XDTPqXODVSTfdLGGcgW2gqkShVO2qypM=;
  b=HtKlw71ek79LzXmC6qSTr3r7qAqaMC3axhEmRMr/1ZLTo1v9j4Kd+Rb8
   Mt4YY+N0F5xHuh56ES4qLhHLd88jNErebEPQjt6y4KYvRTbJjLiy1E9+f
   ySQXkmtyAAVr03KWzw5dbeg4y6J7qAGtdcY/ZZVYDcE4NEQHfZ7UAqPAO
   YO4ONeD72YLV5VpP+NAVsh8ImqeCrxkk5Ffyp4BPHLeH7b3sZYbhJQsHD
   1Z5L65wQNOGFDpQkCOcz0s9ZZ0YlU4lsApFTePYf3YFQdgZlhViYJ6VkQ
   JLYiy+LJ8EEDNgLxrgO7L/pVaKfVzZ9R6WvTubSc8iQckDS+tducDwhTy
   A==;
X-CSE-ConnectionGUID: /c3CB2TmTxW5jTY3VmqdYA==
X-CSE-MsgGUID: 5BvhrC/gQoKeW9y1WRr28A==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57387159"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="57387159"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 11:40:08 -0700
X-CSE-ConnectionGUID: /zIcB2fQQEqPzmWbrztW/g==
X-CSE-MsgGUID: +z+UAv6RSjSCW2nQKiJisQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="172161238"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 14 Aug 2025 11:40:06 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umcrr-000BFM-2h;
	Thu, 14 Aug 2025 18:40:03 +0000
Date: Fri, 15 Aug 2025 02:39:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:for-next 2/9]
 arch/mips/boot/dts/pic32/pic32mzda.dtsi:32.7-40.4: Warning
 (avoid_unnecessary_addr_size): /cpus: unnecessary #address-cells/#size-cells
 without "ranges", "dma-ranges" or child "reg" or "ranges" property
Message-ID: <202508150245.TjZ7k8Jh-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
head:   f56fbb6a1b36da1d481d7ce8245f7bedad3aa863
commit: c072d2b49507420edd57ba3d87690ab81ef5273a [2/9] scripts/dtc: Update to upstream version v1.7.2-35-g52f07dcca47c
:::::: branch date: 5 hours ago
:::::: commit date: 3 days ago
config: mips-randconfig-052-20250815 (https://download.01.org/0day-ci/archive/20250815/202508150245.TjZ7k8Jh-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508150245.TjZ7k8Jh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508150245.TjZ7k8Jh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/pic32/pic32mzda.dtsi:36.9-39.5: Warning (unit_address_vs_reg): /cpus/cpu@0: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/pic32/pic32mzda_sk.dts:17.9-20.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/mips/boot/dts/pic32/pic32mzda.dtsi:32.7-40.4: Warning (avoid_unnecessary_addr_size): /cpus: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/mips/boot/dts/pic32/pic32mzda.dtsi:78.34-84.4: Warning (avoid_unnecessary_addr_size): /pinctrl@1f801400: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/mips/boot/dts/pic32/pic32mzda_sk.dtb: /: failed to match any schema with compatible: ['microchip,pic32mzda-sk', 'microchip,pic32mzda']
   arch/mips/boot/dts/pic32/pic32mzda_sk.dtb: /: failed to match any schema with compatible: ['microchip,pic32mzda-sk', 'microchip,pic32mzda']
   arch/mips/boot/dts/pic32/pic32mzda_sk.dtb: / (microchip,pic32mzda-sk): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[134217728, 134217728]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/mips/boot/dts/pic32/pic32mzda_sk.dtb: cpu@0 (mti,mips14KEc): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml#
   arch/mips/boot/dts/pic32/pic32mzda_sk.dtb: /soc: failed to match any schema with compatible: ['microchip,pic32mzda-infra']
   arch/mips/boot/dts/pic32/pic32mzda_sk.dtb: /pinctrl@1f801400: failed to match any schema with compatible: ['microchip,pic32mzda-pinctrl']

vim +32 arch/mips/boot/dts/pic32/pic32mzda.dtsi

842b6b16f5178c6 Joshua Henderson     2016-01-13   7  
842b6b16f5178c6 Joshua Henderson     2016-01-13   8  / {
842b6b16f5178c6 Joshua Henderson     2016-01-13   9  	#address-cells = <1>;
842b6b16f5178c6 Joshua Henderson     2016-01-13  10  	#size-cells = <1>;
842b6b16f5178c6 Joshua Henderson     2016-01-13  11  	interrupt-parent = <&evic>;
842b6b16f5178c6 Joshua Henderson     2016-01-13  12  
842b6b16f5178c6 Joshua Henderson     2016-01-13  13  	aliases {
842b6b16f5178c6 Joshua Henderson     2016-01-13  14  		gpio0 = &gpio0;
842b6b16f5178c6 Joshua Henderson     2016-01-13  15  		gpio1 = &gpio1;
842b6b16f5178c6 Joshua Henderson     2016-01-13  16  		gpio2 = &gpio2;
842b6b16f5178c6 Joshua Henderson     2016-01-13  17  		gpio3 = &gpio3;
842b6b16f5178c6 Joshua Henderson     2016-01-13  18  		gpio4 = &gpio4;
842b6b16f5178c6 Joshua Henderson     2016-01-13  19  		gpio5 = &gpio5;
842b6b16f5178c6 Joshua Henderson     2016-01-13  20  		gpio6 = &gpio6;
842b6b16f5178c6 Joshua Henderson     2016-01-13  21  		gpio7 = &gpio7;
842b6b16f5178c6 Joshua Henderson     2016-01-13  22  		gpio8 = &gpio8;
842b6b16f5178c6 Joshua Henderson     2016-01-13  23  		gpio9 = &gpio9;
842b6b16f5178c6 Joshua Henderson     2016-01-13  24  		serial0 = &uart1;
842b6b16f5178c6 Joshua Henderson     2016-01-13  25  		serial1 = &uart2;
842b6b16f5178c6 Joshua Henderson     2016-01-13  26  		serial2 = &uart3;
842b6b16f5178c6 Joshua Henderson     2016-01-13  27  		serial3 = &uart4;
842b6b16f5178c6 Joshua Henderson     2016-01-13  28  		serial4 = &uart5;
842b6b16f5178c6 Joshua Henderson     2016-01-13  29  		serial5 = &uart6;
842b6b16f5178c6 Joshua Henderson     2016-01-13  30  	};
842b6b16f5178c6 Joshua Henderson     2016-01-13  31  
842b6b16f5178c6 Joshua Henderson     2016-01-13 @32  	cpus {
842b6b16f5178c6 Joshua Henderson     2016-01-13  33  		#address-cells = <1>;
842b6b16f5178c6 Joshua Henderson     2016-01-13  34  		#size-cells = <0>;
842b6b16f5178c6 Joshua Henderson     2016-01-13  35  
842b6b16f5178c6 Joshua Henderson     2016-01-13 @36  		cpu@0 {
842b6b16f5178c6 Joshua Henderson     2016-01-13  37  			compatible = "mti,mips14KEc";
842b6b16f5178c6 Joshua Henderson     2016-01-13  38  			device_type = "cpu";
842b6b16f5178c6 Joshua Henderson     2016-01-13  39  		};
842b6b16f5178c6 Joshua Henderson     2016-01-13  40  	};
842b6b16f5178c6 Joshua Henderson     2016-01-13  41  
842b6b16f5178c6 Joshua Henderson     2016-01-13  42  	soc {
842b6b16f5178c6 Joshua Henderson     2016-01-13  43  		compatible = "microchip,pic32mzda-infra";
842b6b16f5178c6 Joshua Henderson     2016-01-13  44  		interrupts = <0 IRQ_TYPE_EDGE_RISING>;
842b6b16f5178c6 Joshua Henderson     2016-01-13  45  	};
842b6b16f5178c6 Joshua Henderson     2016-01-13  46  
9125f19bbb97e74 Purna Chandra Mandal 2016-05-13  47  	/* external clock input on TxCLKI pin */
9125f19bbb97e74 Purna Chandra Mandal 2016-05-13  48  	txcki: txcki_clk {
9125f19bbb97e74 Purna Chandra Mandal 2016-05-13  49  		#clock-cells = <0>;
9125f19bbb97e74 Purna Chandra Mandal 2016-05-13  50  		compatible = "fixed-clock";
9125f19bbb97e74 Purna Chandra Mandal 2016-05-13  51  		clock-frequency = <4000000>;
9125f19bbb97e74 Purna Chandra Mandal 2016-05-13  52  		status = "disabled";
9125f19bbb97e74 Purna Chandra Mandal 2016-05-13  53  	};
9125f19bbb97e74 Purna Chandra Mandal 2016-05-13  54  
9125f19bbb97e74 Purna Chandra Mandal 2016-05-13  55  	/* external input on REFCLKIx pin */
9125f19bbb97e74 Purna Chandra Mandal 2016-05-13  56  	refix: refix_clk {
9125f19bbb97e74 Purna Chandra Mandal 2016-05-13  57  		#clock-cells = <0>;
9125f19bbb97e74 Purna Chandra Mandal 2016-05-13  58  		compatible = "fixed-clock";
9125f19bbb97e74 Purna Chandra Mandal 2016-05-13  59  		clock-frequency = <24000000>;
9125f19bbb97e74 Purna Chandra Mandal 2016-05-13  60  		status = "disabled";
9125f19bbb97e74 Purna Chandra Mandal 2016-05-13  61  	};
9125f19bbb97e74 Purna Chandra Mandal 2016-05-13  62  
9125f19bbb97e74 Purna Chandra Mandal 2016-05-13  63  	rootclk: clock-controller@1f801200 {
9125f19bbb97e74 Purna Chandra Mandal 2016-05-13  64  		compatible = "microchip,pic32mzda-clk";
9125f19bbb97e74 Purna Chandra Mandal 2016-05-13  65  		reg = <0x1f801200 0x200>;
9125f19bbb97e74 Purna Chandra Mandal 2016-05-13  66  		#clock-cells = <1>;
9125f19bbb97e74 Purna Chandra Mandal 2016-05-13  67  		microchip,pic32mzda-sosc;
9125f19bbb97e74 Purna Chandra Mandal 2016-05-13  68  	};
9125f19bbb97e74 Purna Chandra Mandal 2016-05-13  69  
842b6b16f5178c6 Joshua Henderson     2016-01-13  70  	evic: interrupt-controller@1f810000 {
842b6b16f5178c6 Joshua Henderson     2016-01-13  71  		compatible = "microchip,pic32mzda-evic";
842b6b16f5178c6 Joshua Henderson     2016-01-13  72  		interrupt-controller;
842b6b16f5178c6 Joshua Henderson     2016-01-13  73  		#interrupt-cells = <2>;
842b6b16f5178c6 Joshua Henderson     2016-01-13  74  		reg = <0x1f810000 0x1000>;
842b6b16f5178c6 Joshua Henderson     2016-01-13  75  		microchip,external-irqs = <3 8 13 18 23>;
842b6b16f5178c6 Joshua Henderson     2016-01-13  76  	};
842b6b16f5178c6 Joshua Henderson     2016-01-13  77  
842b6b16f5178c6 Joshua Henderson     2016-01-13 @78  	pic32_pinctrl: pinctrl@1f801400 {

:::::: The code at line 32 was first introduced by commit
:::::: 842b6b16f5178c66da0959a935dafa80a979b745 MIPS: dts: Add initial DTS for the PIC32MZDA Starter Kit

:::::: TO: Joshua Henderson <joshua.henderson@microchip.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
