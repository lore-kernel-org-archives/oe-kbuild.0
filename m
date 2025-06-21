Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F5239FCE
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Jun 2025 16:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750524623; cv=none; b=a3uIsUOfQvxrjrL5EQ3CrXbTPr32kYO4+/99K+lZ9+DqrdfbIDgAHE9po/FWHseJWamU2toZBSRsjv6WtXAPtAvNNxzTQ1LYVLhGbfEOYNAfueUvQ0UBcbomyFEo1g2zAmhY4pEy8oIg0MBGOV4v12XYRK+kSUBimpYa5/eVxI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750524623; c=relaxed/simple;
	bh=2sc88llxrkg7O5W4kg6ZJVJhit+JNCFCibF/M4esIPs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FkdiWS8JZ7Rhlz6zm5K+vZk+I6tHdmsCQ2mIqU/NH0yPUzp/NOssQmBQfsFWpotBLUt1CEA//teLgSv0xu2z6QwPfw9cmL9hPHhlVVFRyvBZ1Wi3Ffy7Pz0xQd2sUbPcTDHaQ7gXBszNa3R7BWU6vUqCwgctlT+FSVLE7Ila7rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P2tIef7/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P2tIef7/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750524620; x=1782060620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2sc88llxrkg7O5W4kg6ZJVJhit+JNCFCibF/M4esIPs=;
  b=P2tIef7/wYVM0XYZoxWB9CF3P2PnRgv9d6VUZqfknAhw4TzgrNV90vBP
   N/OLNjlbyNucA0qfeovvLMo7mcmjzTEzLADMwOyS5fUzckl7h0nKtloqd
   h8VJQu82ROVzbtsl+8XuogcAMxHRo6yi9/oiDTPMYYYAT4gziJcZ8wlcX
   nUc0xd7mNzqj/OLTqKyamV2pTmaHzTdxR+XMqlqitHKZE0GjN1Zi8cejZ
   SKEiuX9sUHFDJWjjPE+kWDkysoL6P1YkcyOk+GSHbzCA9oUTQhTLJfP52
   sZhnxzpB9kwdKs8R/VC8tlN4RNf1wrLXRUR9dvbeWgkiuM9eUGwhUX10o
   w==;
X-CSE-ConnectionGUID: Ow0hWUKsShKpm9cIWvGzRA==
X-CSE-MsgGUID: FA+ZOh6QSHaKJhmdmHr1mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11470"; a="52915556"
X-IronPort-AV: E=Sophos;i="6.16,254,1744095600"; 
   d="scan'208";a="52915556"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2025 09:50:19 -0700
X-CSE-ConnectionGUID: h7Fqje8ZT9O1sfM7Zk2E1g==
X-CSE-MsgGUID: 8I3XUbNNSpyOybbeFy8CIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,254,1744095600"; 
   d="scan'208";a="151704033"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Jun 2025 09:50:18 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uT1Q0-000Mjq-20;
	Sat, 21 Jun 2025 16:50:16 +0000
Date: Sun, 22 Jun 2025 00:50:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: net: convert socfpga-dwmac.txt to DT schema
Message-ID: <202506220015.sGp2X6lx-lkp@intel.com>
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
In-Reply-To: <20250621034401.586780-1-dinguyen@kernel.org>
References: <20250621034401.586780-1-dinguyen@kernel.org>
TO: Dinh Nguyen <dinguyen@kernel.org>
TO: robh+dt@kernel.org
TO: krzysztof.kozlowskii+dt@linaro.org
TO: conor+dt@kernel.org
CC: dinguyen@kernel.org
CC: devicetree@vger.kernel.org

Hi Dinh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16-rc2 next-20250620]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dinh-Nguyen/dt-bindings-net-convert-socfpga-dwmac-txt-to-DT-schema/20250621-114611
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250621034401.586780-1-dinguyen%40kernel.org
patch subject: [PATCH] dt-bindings: net: convert socfpga-dwmac.txt to DT schema
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: arc-randconfig-051-20250621 (https://download.01.org/0day-ci/archive/20250622/202506220015.sGp2X6lx-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250622/202506220015.sGp2X6lx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506220015.sGp2X6lx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: soc100 (abilis,tb10x): leds: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: soc100 (abilis,tb10x): clkdiv_ahb: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: soc100 (abilis,tb10x): $nodename:0: 'soc100' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100: failed to match any schema with compatible: ['abilis,tb10x', 'simple-bus']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/iomux@ff10601c: failed to match any schema with compatible: ['abilis,tb10x-iomux']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: uart@ff100000 (snps,dw-apb-uart): $nodename:0: 'uart@ff100000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
>> arch/arc/boot/dts/abilis_tb100_dvk.dtb: ethernet@fe100000 (snps,dwmac-3.70a): compatible:0: 'snps,dwmac-3.70a' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: dma@fe000000 (snps,dma-spear1340): $nodename:0: 'dma@fe000000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/snps,dma-spear1340.yaml#
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: dma@fe000000 (snps,dma-spear1340): dma-requests: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/dma/snps,dma-spear1340.yaml#
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: dma@fe000000 (snps,dma-spear1340): Unevaluated properties are not allowed ('dma-requests' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/snps,dma-spear1340.yaml#
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/spi@fe010000: failed to match any schema with compatible: ['abilis,tb100-spi']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/spi@fe011000: failed to match any schema with compatible: ['abilis,tb100-spi']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/tb10x-tsm@ff316000: failed to match any schema with compatible: ['abilis,tb100-tsm']
--
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: soc100 (abilis,tb10x): clkdiv_ahb: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: soc100 (abilis,tb10x): leds: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: soc100 (abilis,tb10x): $nodename:0: 'soc100' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100: failed to match any schema with compatible: ['abilis,tb10x', 'simple-bus']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/iomux@ff10601c: failed to match any schema with compatible: ['abilis,tb10x-iomux']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: uart@ff100000 (snps,dw-apb-uart): $nodename:0: 'uart@ff100000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
>> arch/arc/boot/dts/abilis_tb101_dvk.dtb: ethernet@fe100000 (snps,dwmac-3.70a): compatible:0: 'snps,dwmac-3.70a' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: dma@fe000000 (snps,dma-spear1340): $nodename:0: 'dma@fe000000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/snps,dma-spear1340.yaml#
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: dma@fe000000 (snps,dma-spear1340): dma-requests: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/dma/snps,dma-spear1340.yaml#
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: dma@fe000000 (snps,dma-spear1340): Unevaluated properties are not allowed ('dma-requests' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/snps,dma-spear1340.yaml#
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/spi@fe010000: failed to match any schema with compatible: ['abilis,tb100-spi']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/spi@fe011000: failed to match any schema with compatible: ['abilis,tb100-spi']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/tb10x-tsm@ff316000: failed to match any schema with compatible: ['abilis,tb100-tsm']
--
   arch/arc/boot/dts/axs101.dtb: axs10x_mb (simple-bus): sound_playback: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs101.dtb: axs10x_mb (simple-bus): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs101.dtb: axs10x_mb (simple-bus): connector: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs101.dtb: axs10x_mb (simple-bus): $nodename:0: 'axs10x_mb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs101.dtb: /axs10x_mb/i2sclk@100a0: failed to match any schema with compatible: ['snps,axs10x-i2s-pll-clock']
   arch/arc/boot/dts/axs101.dtb: /axs10x_mb/pguclk@10080: failed to match any schema with compatible: ['snps,axs10x-pgu-pll-clock']
>> arch/arc/boot/dts/axs101.dtb: ethernet@18000 (snps,dwmac): '#interrupt-cells', 'max-speed', 'snps,pbl' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arc/boot/dts/axs101.dtb: ethernet@18000 (snps,dwmac): compatible:0: 'snps,dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arc/boot/dts/axs101.dtb: uart@20000 (snps,dw-apb-uart): $nodename:0: 'uart@20000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/axs101.dtb: uart@20000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/axs101.dtb: uart@21000 (snps,dw-apb-uart): $nodename:0: 'uart@21000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/axs101.dtb: uart@21000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/axs101.dtb: uart@22000 (snps,dw-apb-uart): $nodename:0: 'uart@22000' does not match '^serial(@.*)?$'
--
   arch/arc/boot/dts/axs103.dtb: pct (snps,archs-pct): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
   arch/arc/boot/dts/axs103.dtb: axs10x_mb (simple-bus): sound_playback: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103.dtb: axs10x_mb (simple-bus): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103.dtb: axs10x_mb (simple-bus): connector: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103.dtb: axs10x_mb (simple-bus): $nodename:0: 'axs10x_mb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arc/boot/dts/axs103.dtb: ethernet@18000 (snps,dwmac): '#interrupt-cells', 'dma-coherent', 'max-speed', 'snps,pbl' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arc/boot/dts/axs103.dtb: ethernet@18000 (snps,dwmac): compatible:0: 'snps,dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arc/boot/dts/axs103.dtb: usb@40000 (generic-ehci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arc/boot/dts/axs103.dtb: usb@60000 (generic-ohci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arc/boot/dts/axs103.dtb: mmc@15000 (altr,socfpga-dw-mshc): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/synopsys-dw-mshc.yaml#
   arch/arc/boot/dts/axs103.dtb: /axs10x_mb/i2sclk@100a0: failed to match any schema with compatible: ['snps,axs10x-i2s-pll-clock']
   arch/arc/boot/dts/axs103.dtb: /axs10x_mb/pguclk@10080: failed to match any schema with compatible: ['snps,axs10x-pgu-pll-clock']
   arch/arc/boot/dts/axs103.dtb: uart@20000 (snps,dw-apb-uart): $nodename:0: 'uart@20000' does not match '^serial(@.*)?$'
--
   arch/arc/boot/dts/axs103_idu.dtb: pct (snps,archs-pct): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: axs10x_mb (simple-bus): sound_playback: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: axs10x_mb (simple-bus): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: axs10x_mb (simple-bus): connector: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: axs10x_mb (simple-bus): $nodename:0: 'axs10x_mb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arc/boot/dts/axs103_idu.dtb: ethernet@18000 (snps,dwmac): '#interrupt-cells', 'dma-coherent', 'max-speed', 'snps,pbl' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arc/boot/dts/axs103_idu.dtb: ethernet@18000 (snps,dwmac): compatible:0: 'snps,dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: usb@40000 (generic-ehci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: usb@60000 (generic-ohci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: mmc@15000 (altr,socfpga-dw-mshc): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/synopsys-dw-mshc.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: /axs10x_mb/i2sclk@100a0: failed to match any schema with compatible: ['snps,axs10x-i2s-pll-clock']
   arch/arc/boot/dts/axs103_idu.dtb: /axs10x_mb/pguclk@10080: failed to match any schema with compatible: ['snps,axs10x-pgu-pll-clock']
   arch/arc/boot/dts/axs103_idu.dtb: uart@20000 (snps,dw-apb-uart): $nodename:0: 'uart@20000' does not match '^serial(@.*)?$'
--
   arch/arc/boot/dts/hsdk.dtb: soc (simple-bus): dmac-gpu-cfg-clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/hsdk.dtb: soc (simple-bus): gmacclk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/hsdk.dtb: soc (simple-bus): gpu-dma-clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/hsdk.dtb: /soc/reset-controller@8a0: failed to match any schema with compatible: ['snps,hsdk-reset']
   arch/arc/boot/dts/hsdk.dtb: /soc/core-clk@0: failed to match any schema with compatible: ['snps,hsdk-core-pll-clock']
   arch/arc/boot/dts/hsdk.dtb: serial@5000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
>> arch/arc/boot/dts/hsdk.dtb: ethernet@8000 (snps,dwmac): 'dma-coherent', 'mdio', 'phy-handle', 'snps,pbl' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arc/boot/dts/hsdk.dtb: ethernet@8000 (snps,dwmac): compatible:0: 'snps,dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arc/boot/dts/hsdk.dtb: ethernet@8000 (snps,dwmac): phy-mode:0: 'rgmii-id' is not one of ['rgmii', 'gmii', 'mii']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arc/boot/dts/hsdk.dtb: usb@60000 (snps,hsdk-v1.0-ohci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arc/boot/dts/hsdk.dtb: usb@40000 (snps,hsdk-v1.0-ehci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
   arch/arc/boot/dts/hsdk.dtb: mmc@a000 (altr,socfpga-dw-mshc): Unevaluated properties are not allowed ('dma-coherent', 'num-slots' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/synopsys-dw-mshc.yaml#
   arch/arc/boot/dts/hsdk.dtb: /soc/gpio@14b0: failed to match any schema with compatible: ['snps,creg-gpio-hsdk']
   arch/arc/boot/dts/hsdk.dtb: dmac@80000 (snps,axi-dma-1.01a): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/snps,dw-axi-dmac.yaml#
--
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/snps,archs-intc.yaml#
   arch/arc/boot/dts/vdk_hs38.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): $nodename:0: 'dw-apb-uart@5000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/vdk_hs38.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/vdk_hs38.dtb: axs10x_mb_vdk (simple-bus): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/vdk_hs38.dtb: axs10x_mb_vdk (simple-bus): $nodename:0: 'axs10x_mb_vdk' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arc/boot/dts/vdk_hs38.dtb: ethernet@18000 (snps,dwmac): '#interrupt-cells', 'snps,pbl', 'snps,phy-addr' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arc/boot/dts/vdk_hs38.dtb: ethernet@18000 (snps,dwmac): compatible:0: 'snps,dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arc/boot/dts/vdk_hs38.dtb: uart@20000 (snps,dw-apb-uart): $nodename:0: 'uart@20000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/vdk_hs38.dtb: uart@20000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/vdk_hs38.dtb: uart@21000 (snps,dw-apb-uart): $nodename:0: 'uart@21000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/vdk_hs38.dtb: uart@21000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/vdk_hs38.dtb: uart@22000 (snps,dw-apb-uart): $nodename:0: 'uart@22000' does not match '^serial(@.*)?$'
--
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/snps,archs-intc.yaml#
   arch/arc/boot/dts/vdk_hs38_smp.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): $nodename:0: 'dw-apb-uart@5000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/vdk_hs38_smp.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/vdk_hs38_smp.dtb: axs10x_mb_vdk (simple-bus): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/vdk_hs38_smp.dtb: axs10x_mb_vdk (simple-bus): $nodename:0: 'axs10x_mb_vdk' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arc/boot/dts/vdk_hs38_smp.dtb: ethernet@18000 (snps,dwmac): '#interrupt-cells', 'snps,pbl', 'snps,phy-addr' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
>> arch/arc/boot/dts/vdk_hs38_smp.dtb: ethernet@18000 (snps,dwmac): compatible:0: 'snps,dwmac' is not one of ['altr,socfpga-stmmac', 'altr,socfpga-stmmac-a10-s10']
   	from schema $id: http://devicetree.org/schemas/net/altr,dwmac-socfpga.yaml#
   arch/arc/boot/dts/vdk_hs38_smp.dtb: uart@20000 (snps,dw-apb-uart): $nodename:0: 'uart@20000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/vdk_hs38_smp.dtb: uart@20000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/vdk_hs38_smp.dtb: uart@21000 (snps,dw-apb-uart): $nodename:0: 'uart@21000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/vdk_hs38_smp.dtb: uart@21000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/vdk_hs38_smp.dtb: uart@22000 (snps,dw-apb-uart): $nodename:0: 'uart@22000' does not match '^serial(@.*)?$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
