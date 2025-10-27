Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672E41F4CA9
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Oct 2025 17:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761587210; cv=none; b=SfAyc0wS3TLvZ8sUqGaCG33xtoTJuhfbUnyz92J1pcOXIfk3KSa2Fi+Evz9NzZ2TtIt2e3KANsMfWGXfYCRnaLS1t4DDv8uM0C+QBo6rKRLAhQ92D93UJ7kHxUbgRJWkWXEDeNq46pv0LHJJm+EbsW788QVuQ2eF3uqLK+SPWos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761587210; c=relaxed/simple;
	bh=E4HLWczTpHy6zd8k2FEHwa7pmJBFAaxq0QQDLE2SBl0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YomD0HS7qLqJidBsrVv5blGAmkmleNz75plsUR9tLKf0Zm71y4cJIdu4tf9YVnyEHd+gaiKEyNKenrLAjCtVG4ucaIjvL/37Uph4SB6QR/2Ki+nsG6UcDGZCvXVhxaJQE6eO4gRBw+TeNpM8LHuErKiM8vVb1hFnpB+FdSJCZMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U97CX822; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U97CX822"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761587206; x=1793123206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E4HLWczTpHy6zd8k2FEHwa7pmJBFAaxq0QQDLE2SBl0=;
  b=U97CX822Fwx7O05Ighybd2l1AYUq5tajzDhlQ6UmA3VXyro6sEUTA8BE
   /eXvpiUfabNGhpy+MIOEd/y3vYBSZBq/wl8onhbMh8e16JrS97eKi/zoH
   78i0dswlHpDAu9A8HsNoPq4bznemgysJ5JBCdhsFwKKrwdbRH/vEyuu+k
   JZfk2AYLTg1gfcQLvQ/KLo7K/99j3U/ZnJaeg0CMtQrJyt1IQWwWiMgZj
   dei5LEf0J4VuZAtQMwBvg09s9klq1CsCl7yXzWTqp6xXCEnVuLQ3PF/pC
   AUhuWxE6LXkIxpqmyUWj/XqcMVSqDOIBynKyXNpnWbPAy4dCb0Z5T1nxf
   w==;
X-CSE-ConnectionGUID: 4Jt+KZ1RQh2m+Q7TPYtoqw==
X-CSE-MsgGUID: 5OPMnc6wQNa/SuD2UMVO0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67512493"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67512493"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 10:46:46 -0700
X-CSE-ConnectionGUID: FXtEujIVT5uHiEVM073SHQ==
X-CSE-MsgGUID: vL6BJnF5QbSY7OBXN+A98Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="189483758"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 27 Oct 2025 10:46:44 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vDRIo-000000000NJ-1lcL;
	Mon, 27 Oct 2025 17:46:42 +0000
Date: Mon, 27 Oct 2025 18:46:01 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arc/boot/dts/nsim_700.dtb: /: failed to match any schema with
 compatible: ['snps,nsim']
Message-ID: <202510271842.NzqdjZ54-lkp@intel.com>
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
CC: Conor Dooley <conor.dooley@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
commit: 61a6ba233fe1198e9eacc9ca1d1cbdb27f70cee5 dt-bindings: Unify "fsl,liodn" type definitions
date:   11 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 11 months ago
config: arc-randconfig-2052-20251024 (https://download.01.org/0day-ci/archive/20251027/202510271842.NzqdjZ54-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 10.5.0
dtschema version: 2025.9.dev12+gd6be03029
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510271842.NzqdjZ54-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510271842.NzqdjZ54-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arc/boot/dts/skeleton.dtsi:44.9-47.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/nsim_700.dts:32.22-36.5: Warning (simple_bus_reg): /fpga/core_clk: missing or empty reg/ranges property
   arch/arc/boot/dts/nsim_700.dts:38.35-42.5: Warning (simple_bus_reg): /fpga/interrupt-controller: missing or empty reg/ranges property
   arch/arc/boot/dts/nsim_700.dts:55.16-57.5: Warning (simple_bus_reg): /fpga/pct: missing or empty reg/ranges property
   no-loopback-test: size (4) error for type flag
>> arch/arc/boot/dts/nsim_700.dtb: /: failed to match any schema with compatible: ['snps,nsim']
>> arch/arc/boot/dts/nsim_700.dtb: / (snps,nsim): False schema does not allow {'device_type': ['memory'], 'reg': [[2147483648, 268435456]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arc/boot/dts/nsim_700.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['snps,arc770d']
   arch/arc/boot/dts/nsim_700.dtb: /timer0: failed to match any schema with compatible: ['snps,arc-timer']
   arch/arc/boot/dts/nsim_700.dtb: /timer1: failed to match any schema with compatible: ['snps,arc-timer']
>> arch/arc/boot/dts/nsim_700.dtb: fpga (simple-bus): core_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/nsim_700.dtb: fpga (simple-bus): pct: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/nsim_700.dtb: fpga (simple-bus): interrupt-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/nsim_700.dtb: fpga (simple-bus): $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/nsim_700.dtb: /fpga/interrupt-controller: failed to match any schema with compatible: ['snps,arc700-intc']
>> arch/arc/boot/dts/nsim_700.dtb: serial@f0000000 (ns16550a): no-loopback-test: 1 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
>> arch/arc/boot/dts/nsim_700.dtb: serial@f0000000 (ns16550a): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
>> arch/arc/boot/dts/nsim_700.dtb: /fpga/pct: failed to match any schema with compatible: ['snps,arc700-pct']
--
   arch/arc/boot/dts/abilis_tb100_dvk.dts:22.9-25.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/abilis_tb10x.dtsi:48.20-52.5: Warning (simple_bus_reg): /soc100/oscillator: missing or empty reg/ranges property
   arch/arc/boot/dts/abilis_tb10x.dtsi:53.23-58.5: Warning (simple_bus_reg): /soc100/clkdiv_cpu: missing or empty reg/ranges property
   arch/arc/boot/dts/abilis_tb10x.dtsi:59.23-64.5: Warning (simple_bus_reg): /soc100/clkdiv_ahb: missing or empty reg/ranges property
   arch/arc/boot/dts/abilis_tb10x.dtsi:72.30-76.5: Warning (simple_bus_reg): /soc100/interrupt-controller: missing or empty reg/ranges property
   arch/arc/boot/dts/abilis_tb10x.dtsi:201.40-216.5: Warning (simple_bus_reg): /soc100/tb10x-stream-proc: simple-bus unit address format error, expected "fff00000"
   arch/arc/boot/dts/abilis_tb100_dvk.dts:52.8-114.5: Warning (simple_bus_reg): /soc100/leds: missing or empty reg/ranges property
>> arch/arc/boot/dts/abilis_tb100_dvk.dtb: /: failed to match any schema with compatible: ['abilis,arc-tb10x']
>> arch/arc/boot/dts/abilis_tb100_dvk.dtb: / (abilis,arc-tb10x): False schema does not allow {'device_type': ['memory'], 'reg': [[2147483648, 134217728]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arc/boot/dts/abilis_tb100_dvk.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['snps,arc770d']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /timer0: failed to match any schema with compatible: ['snps,arc-timer']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /timer1: failed to match any schema with compatible: ['snps,arc-timer']
>> arch/arc/boot/dts/abilis_tb100_dvk.dtb: soc100 (abilis,tb10x): oscillator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/abilis_tb100_dvk.dtb: soc100 (abilis,tb10x): leds: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/abilis_tb100_dvk.dtb: soc100 (abilis,tb10x): clkdiv_ahb: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/abilis_tb100_dvk.dtb: soc100 (abilis,tb10x): tb10x-stream-proc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/abilis_tb100_dvk.dtb: soc100 (abilis,tb10x): clkdiv_cpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/abilis_tb100_dvk.dtb: soc100 (abilis,tb10x): interrupt-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/abilis_tb100_dvk.dtb: soc100 (abilis,tb10x): $nodename:0: 'soc100' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100: failed to match any schema with compatible: ['abilis,tb10x', 'simple-bus']
>> arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/iomux@ff10601c: failed to match any schema with compatible: ['abilis,tb10x-iomux']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/interrupt-controller: failed to match any schema with compatible: ['snps,arc700-intc']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/pic@fe002000: failed to match any schema with compatible: ['abilis,tb10x-ictl']
>> arch/arc/boot/dts/abilis_tb100_dvk.dtb: uart@ff100000 (snps,dw-apb-uart): $nodename:0: 'uart@ff100000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
>> arch/arc/boot/dts/abilis_tb100_dvk.dtb: dma@fe000000 (snps,dma-spear1340): $nodename:0: 'dma@fe000000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/snps,dma-spear1340.yaml
>> arch/arc/boot/dts/abilis_tb100_dvk.dtb: dma@fe000000 (snps,dma-spear1340): dma-requests: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/dma/snps,dma-spear1340.yaml
>> arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/spi@fe010000: failed to match any schema with compatible: ['abilis,tb100-spi']
>> arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/spi@fe011000: failed to match any schema with compatible: ['abilis,tb100-spi']
>> arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/tb10x-tsm@ff316000: failed to match any schema with compatible: ['abilis,tb100-tsm']
>> arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/tb10x-stream-proc: failed to match any schema with compatible: ['abilis,tb100-streamproc']
>> arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/tb10x-mdscr@ff300000: failed to match any schema with compatible: ['abilis,tb100-mdscr']
>> arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/tb10x-mdscr@ff307000: failed to match any schema with compatible: ['abilis,tb100-mdscr']
>> arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/tb10x-mdscr@ff30e000: failed to match any schema with compatible: ['abilis,tb100-mdscr']
>> arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/tb10x-mdscr@ff312000: failed to match any schema with compatible: ['abilis,tb100-mdscr']
>> arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/tb10x-wfb@ff319000: failed to match any schema with compatible: ['abilis,tb100-wfb']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/gpio@ff140000: failed to match any schema with compatible: ['abilis,tb10x-gpio']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/gpio@ff141000: failed to match any schema with compatible: ['abilis,tb10x-gpio']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/gpio@ff142000: failed to match any schema with compatible: ['abilis,tb10x-gpio']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/gpio@ff143000: failed to match any schema with compatible: ['abilis,tb10x-gpio']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/gpio@ff144000: failed to match any schema with compatible: ['abilis,tb10x-gpio']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/gpio@ff145000: failed to match any schema with compatible: ['abilis,tb10x-gpio']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/gpio@ff146000: failed to match any schema with compatible: ['abilis,tb10x-gpio']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/gpio@ff147000: failed to match any schema with compatible: ['abilis,tb10x-gpio']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/gpio@ff148000: failed to match any schema with compatible: ['abilis,tb10x-gpio']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/gpio@ff149000: failed to match any schema with compatible: ['abilis,tb10x-gpio']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/gpio@ff14a000: failed to match any schema with compatible: ['abilis,tb10x-gpio']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/gpio@ff14b000: failed to match any schema with compatible: ['abilis,tb10x-gpio']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/gpio@ff14c000: failed to match any schema with compatible: ['abilis,tb10x-gpio']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/gpio@ff14d000: failed to match any schema with compatible: ['abilis,tb10x-gpio']
>> arch/arc/boot/dts/abilis_tb100_dvk.dtb: leds (gpio-leds): 'heartbeat', 'power' do not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml
--
   arch/arc/boot/dts/abilis_tb101_dvk.dts:22.9-25.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/abilis_tb10x.dtsi:48.20-52.5: Warning (simple_bus_reg): /soc100/oscillator: missing or empty reg/ranges property
   arch/arc/boot/dts/abilis_tb10x.dtsi:53.23-58.5: Warning (simple_bus_reg): /soc100/clkdiv_cpu: missing or empty reg/ranges property
   arch/arc/boot/dts/abilis_tb10x.dtsi:59.23-64.5: Warning (simple_bus_reg): /soc100/clkdiv_ahb: missing or empty reg/ranges property
   arch/arc/boot/dts/abilis_tb10x.dtsi:72.30-76.5: Warning (simple_bus_reg): /soc100/interrupt-controller: missing or empty reg/ranges property
   arch/arc/boot/dts/abilis_tb10x.dtsi:201.40-216.5: Warning (simple_bus_reg): /soc100/tb10x-stream-proc: simple-bus unit address format error, expected "fff00000"
   arch/arc/boot/dts/abilis_tb101_dvk.dts:52.8-114.5: Warning (simple_bus_reg): /soc100/leds: missing or empty reg/ranges property
>> arch/arc/boot/dts/abilis_tb101_dvk.dtb: /: failed to match any schema with compatible: ['abilis,arc-tb10x']
>> arch/arc/boot/dts/abilis_tb101_dvk.dtb: / (abilis,arc-tb10x): False schema does not allow {'device_type': ['memory'], 'reg': [[2147483648, 134217728]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arc/boot/dts/abilis_tb101_dvk.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['snps,arc770d']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /timer0: failed to match any schema with compatible: ['snps,arc-timer']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /timer1: failed to match any schema with compatible: ['snps,arc-timer']
>> arch/arc/boot/dts/abilis_tb101_dvk.dtb: soc100 (abilis,tb10x): leds: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/abilis_tb101_dvk.dtb: soc100 (abilis,tb10x): oscillator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/abilis_tb101_dvk.dtb: soc100 (abilis,tb10x): interrupt-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/abilis_tb101_dvk.dtb: soc100 (abilis,tb10x): tb10x-stream-proc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/abilis_tb101_dvk.dtb: soc100 (abilis,tb10x): clkdiv_cpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/abilis_tb101_dvk.dtb: soc100 (abilis,tb10x): clkdiv_ahb: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/abilis_tb101_dvk.dtb: soc100 (abilis,tb10x): $nodename:0: 'soc100' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100: failed to match any schema with compatible: ['abilis,tb10x', 'simple-bus']
>> arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/iomux@ff10601c: failed to match any schema with compatible: ['abilis,tb10x-iomux']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/interrupt-controller: failed to match any schema with compatible: ['snps,arc700-intc']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/pic@fe002000: failed to match any schema with compatible: ['abilis,tb10x-ictl']
>> arch/arc/boot/dts/abilis_tb101_dvk.dtb: uart@ff100000 (snps,dw-apb-uart): $nodename:0: 'uart@ff100000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
>> arch/arc/boot/dts/abilis_tb101_dvk.dtb: dma@fe000000 (snps,dma-spear1340): $nodename:0: 'dma@fe000000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/snps,dma-spear1340.yaml
>> arch/arc/boot/dts/abilis_tb101_dvk.dtb: dma@fe000000 (snps,dma-spear1340): dma-requests: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/dma/snps,dma-spear1340.yaml
>> arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/spi@fe010000: failed to match any schema with compatible: ['abilis,tb100-spi']
>> arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/spi@fe011000: failed to match any schema with compatible: ['abilis,tb100-spi']
>> arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/tb10x-tsm@ff316000: failed to match any schema with compatible: ['abilis,tb100-tsm']
>> arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/tb10x-stream-proc: failed to match any schema with compatible: ['abilis,tb100-streamproc']
>> arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/tb10x-mdscr@ff300000: failed to match any schema with compatible: ['abilis,tb100-mdscr']
>> arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/tb10x-mdscr@ff307000: failed to match any schema with compatible: ['abilis,tb100-mdscr']
>> arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/tb10x-mdscr@ff30e000: failed to match any schema with compatible: ['abilis,tb100-mdscr']
>> arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/tb10x-mdscr@ff312000: failed to match any schema with compatible: ['abilis,tb100-mdscr']
>> arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/tb10x-wfb@ff319000: failed to match any schema with compatible: ['abilis,tb100-wfb']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/gpio@ff140000: failed to match any schema with compatible: ['abilis,tb10x-gpio']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/gpio@ff141000: failed to match any schema with compatible: ['abilis,tb10x-gpio']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/gpio@ff142000: failed to match any schema with compatible: ['abilis,tb10x-gpio']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/gpio@ff143000: failed to match any schema with compatible: ['abilis,tb10x-gpio']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/gpio@ff144000: failed to match any schema with compatible: ['abilis,tb10x-gpio']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/gpio@ff145000: failed to match any schema with compatible: ['abilis,tb10x-gpio']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/gpio@ff146000: failed to match any schema with compatible: ['abilis,tb10x-gpio']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/gpio@ff147000: failed to match any schema with compatible: ['abilis,tb10x-gpio']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/gpio@ff148000: failed to match any schema with compatible: ['abilis,tb10x-gpio']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/gpio@ff149000: failed to match any schema with compatible: ['abilis,tb10x-gpio']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/gpio@ff14a000: failed to match any schema with compatible: ['abilis,tb10x-gpio']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/gpio@ff14b000: failed to match any schema with compatible: ['abilis,tb10x-gpio']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/gpio@ff14c000: failed to match any schema with compatible: ['abilis,tb10x-gpio']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/gpio@ff14d000: failed to match any schema with compatible: ['abilis,tb10x-gpio']
>> arch/arc/boot/dts/abilis_tb101_dvk.dtb: leds (gpio-leds): 'heartbeat', 'power' do not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml
--
   arch/arc/boot/dts/axs10x_mb.dtsi:13.12-329.4: Warning (unit_address_vs_reg): /axs10x_mb: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/axc001.dtsi:25.22-29.5: Warning (simple_bus_reg): /cpu_card/core_clk: missing or empty reg/ranges property
   arch/arc/boot/dts/axc001.dtsi:31.24-35.5: Warning (simple_bus_reg): /cpu_card/input-clk: missing or empty reg/ranges property
   arch/arc/boot/dts/axc001.dtsi:37.30-41.5: Warning (simple_bus_reg): /cpu_card/arc700-intc@cpu: missing or empty reg/ranges property
   arch/arc/boot/dts/axc001.dtsi:77.16-79.5: Warning (simple_bus_reg): /cpu_card/pct: missing or empty reg/ranges property
   arch/arc/boot/dts/axs10x_mb.dtsi:33.10-64.5: Warning (simple_bus_reg): /axs10x_mb/clocks: missing or empty reg/ranges property
   arch/arc/boot/dts/axs10x_mb.dtsi:233.20-241.5: Warning (simple_bus_reg): /axs10x_mb/connector: missing or empty reg/ranges property
   arch/arc/boot/dts/axs10x_mb.dtsi:318.18-328.5: Warning (simple_bus_reg): /axs10x_mb/sound_playback: missing or empty reg/ranges property
   arch/arc/boot/dts/axs10x_mb.dtsi:73.24-88.5: Warning (interrupt_provider): /axs10x_mb/ethernet@18000: '#interrupt-cells' found, but node is not an interrupt provider
   arch/arc/boot/dts/axs101.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
>> arch/arc/boot/dts/axs101.dtb: /: failed to match any schema with compatible: ['snps,axs101', 'snps,arc-sdp']
>> arch/arc/boot/dts/axs101.dtb: /: failed to match any schema with compatible: ['snps,axs101', 'snps,arc-sdp']
>> arch/arc/boot/dts/axs101.dtb: / (snps,axs101): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 2147483648, 0, 452984832]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arc/boot/dts/axs101.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['snps,arc770d']
   arch/arc/boot/dts/axs101.dtb: /timer0: failed to match any schema with compatible: ['snps,arc-timer']
   arch/arc/boot/dts/axs101.dtb: /timer1: failed to match any schema with compatible: ['snps,arc-timer']
>> arch/arc/boot/dts/axs101.dtb: cpu_card (simple-bus): core_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/axs101.dtb: cpu_card (simple-bus): arc700-intc@cpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/axs101.dtb: cpu_card (simple-bus): input-clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/axs101.dtb: cpu_card (simple-bus): pct: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/axs101.dtb: cpu_card (simple-bus): $nodename:0: 'cpu_card' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/axs101.dtb: cpu_card (simple-bus): 'arc700-intc@cpu' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arc/boot/dts/axs101.dtb: /cpu_card/arc700-intc@cpu: failed to match any schema with compatible: ['snps,arc700-intc']
>> arch/arc/boot/dts/axs101.dtb: dw-apb-gpio@2000 (snps,dw-apb-gpio): $nodename:0: 'dw-apb-gpio@2000' does not match '^gpio@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml
>> arch/arc/boot/dts/axs101.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): $nodename:0: 'dw-apb-uart@5000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
>> arch/arc/boot/dts/axs101.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
>> arch/arc/boot/dts/axs101.dtb: /cpu_card/pct: failed to match any schema with compatible: ['snps,arc700-pct']
   arch/arc/boot/dts/axs101.dtb: /interrupt-controller@e0012000: failed to match any schema with compatible: ['snps,dw-apb-ictl']
>> arch/arc/boot/dts/axs101.dtb: axs10x_mb (simple-bus): sound_playback: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/axs101.dtb: axs10x_mb (simple-bus): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/axs101.dtb: axs10x_mb (simple-bus): connector: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/axs101.dtb: axs10x_mb (simple-bus): $nodename:0: 'axs10x_mb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/axs101.dtb: /axs10x_mb/i2sclk@100a0: failed to match any schema with compatible: ['snps,axs10x-i2s-pll-clock']
>> arch/arc/boot/dts/axs101.dtb: /axs10x_mb/pguclk@10080: failed to match any schema with compatible: ['snps,axs10x-pgu-pll-clock']
>> arch/arc/boot/dts/axs101.dtb: uart@20000 (snps,dw-apb-uart): $nodename:0: 'uart@20000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
>> arch/arc/boot/dts/axs101.dtb: uart@20000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
   arch/arc/boot/dts/axs101.dtb: uart@21000 (snps,dw-apb-uart): $nodename:0: 'uart@21000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
   arch/arc/boot/dts/axs101.dtb: uart@21000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
   arch/arc/boot/dts/axs101.dtb: uart@22000 (snps,dw-apb-uart): $nodename:0: 'uart@22000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
   arch/arc/boot/dts/axs101.dtb: uart@22000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
>> arch/arc/boot/dts/axs101.dtb: i2s@1e000 (snps,designware-i2s): clocks: [[11], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/snps,designware-i2s.yaml
>> arch/arc/boot/dts/axs101.dtb: adv7511@39 (adi,adv7511): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml
>> arch/arc/boot/dts/axs101.dtb: adv7511@39 (adi,adv7511): 'avdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml
>> arch/arc/boot/dts/axs101.dtb: adv7511@39 (adi,adv7511): 'dvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml
>> arch/arc/boot/dts/axs101.dtb: adv7511@39 (adi,adv7511): 'pvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml
>> arch/arc/boot/dts/axs101.dtb: adv7511@39 (adi,adv7511): 'dvdd-3v-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml
>> arch/arc/boot/dts/axs101.dtb: adv7511@39 (adi,adv7511): 'bgvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml
>> arch/arc/boot/dts/axs101.dtb: /axs10x_mb/pgu@17000: failed to match any schema with compatible: ['snps,arcpgu']
--
   arch/arc/boot/dts/axc003.dtsi:24.24-28.5: Warning (simple_bus_reg): /cpu_card/input-clk: missing or empty reg/ranges property
   arch/arc/boot/dts/axc003.dtsi:45.29-49.5: Warning (simple_bus_reg): /cpu_card/archs-intc@cpu: missing or empty reg/ranges property
   arch/arc/boot/dts/axc003.dtsi:85.16-90.5: Warning (simple_bus_reg): /cpu_card/pct: missing or empty reg/ranges property
   arch/arc/boot/dts/axs10x_mb.dtsi:33.10-64.5: Warning (simple_bus_reg): /axs10x_mb/clocks: missing or empty reg/ranges property
   arch/arc/boot/dts/axs10x_mb.dtsi:233.20-241.5: Warning (simple_bus_reg): /axs10x_mb/connector: missing or empty reg/ranges property
   arch/arc/boot/dts/axs10x_mb.dtsi:318.18-328.5: Warning (simple_bus_reg): /axs10x_mb/sound_playback: missing or empty reg/ranges property
   arch/arc/boot/dts/axc003.dtsi:85.16-90.5: Warning (interrupt_provider): /cpu_card/pct: '#interrupt-cells' found, but node is not an interrupt provider
   arch/arc/boot/dts/axc003.dtsi:102.18-104.5: Warning (interrupt_provider): /axs10x_mb/ethernet@18000: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/arc/boot/dts/axs103.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
>> arch/arc/boot/dts/axs103.dtb: /: failed to match any schema with compatible: ['snps,axs103', 'snps,arc-sdp']
>> arch/arc/boot/dts/axs103.dtb: /: failed to match any schema with compatible: ['snps,axs103', 'snps,arc-sdp']
>> arch/arc/boot/dts/axs103.dtb: / (snps,axs103): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 2147483648, 0, 536870912], [1, 3221225472, 0, 1073741824]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arc/boot/dts/axs103.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/axs103.dtb: /timer0: failed to match any schema with compatible: ['snps,arc-timer']
>> arch/arc/boot/dts/axs103.dtb: /rtc: failed to match any schema with compatible: ['snps,archs-timer-rtc']
   arch/arc/boot/dts/axs103.dtb: /timer1: failed to match any schema with compatible: ['snps,arc-timer']
>> arch/arc/boot/dts/axs103.dtb: cpu_card (simple-bus): input-clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/axs103.dtb: cpu_card (simple-bus): archs-intc@cpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/axs103.dtb: cpu_card (simple-bus): pct: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/axs103.dtb: cpu_card (simple-bus): $nodename:0: 'cpu_card' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/axs103.dtb: cpu_card (simple-bus): 'archs-intc@cpu' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arc/boot/dts/axs103.dtb: /cpu_card/core-clk@80: failed to match any schema with compatible: ['snps,axs10x-arc-pll-clock']
   arch/arc/boot/dts/axs103.dtb: /cpu_card/archs-intc@cpu: failed to match any schema with compatible: ['snps,archs-intc']
>> arch/arc/boot/dts/axs103.dtb: dw-apb-gpio@2000 (snps,dw-apb-gpio): $nodename:0: 'dw-apb-gpio@2000' does not match '^gpio@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml
>> arch/arc/boot/dts/axs103.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): $nodename:0: 'dw-apb-uart@5000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
>> arch/arc/boot/dts/axs103.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
>> arch/arc/boot/dts/axs103.dtb: pct (snps,archs-pct): '#interrupt-cells', 'interrupt-parent', 'interrupts' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml
>> arch/arc/boot/dts/axs103.dtb: pct (snps,archs-pct): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml
>> arch/arc/boot/dts/axs103.dtb: pct (snps,archs-pct): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml
>> arch/arc/boot/dts/axs103.dtb: axs10x_mb (simple-bus): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/axs103.dtb: axs10x_mb (simple-bus): connector: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/axs103.dtb: axs10x_mb (simple-bus): sound_playback: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/axs103.dtb: axs10x_mb (simple-bus): $nodename:0: 'axs10x_mb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/axs103.dtb: usb@40000 (generic-ehci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml
>> arch/arc/boot/dts/axs103.dtb: usb@60000 (generic-ohci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml
>> arch/arc/boot/dts/axs103.dtb: mmc@15000 (altr,socfpga-dw-mshc): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/synopsys-dw-mshc.yaml
>> arch/arc/boot/dts/axs103.dtb: /axs10x_mb/i2sclk@100a0: failed to match any schema with compatible: ['snps,axs10x-i2s-pll-clock']
>> arch/arc/boot/dts/axs103.dtb: /axs10x_mb/pguclk@10080: failed to match any schema with compatible: ['snps,axs10x-pgu-pll-clock']
>> arch/arc/boot/dts/axs103.dtb: uart@20000 (snps,dw-apb-uart): $nodename:0: 'uart@20000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
>> arch/arc/boot/dts/axs103.dtb: uart@20000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
   arch/arc/boot/dts/axs103.dtb: uart@21000 (snps,dw-apb-uart): $nodename:0: 'uart@21000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
   arch/arc/boot/dts/axs103.dtb: uart@21000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
   arch/arc/boot/dts/axs103.dtb: uart@22000 (snps,dw-apb-uart): $nodename:0: 'uart@22000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
   arch/arc/boot/dts/axs103.dtb: uart@22000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
>> arch/arc/boot/dts/axs103.dtb: i2s@1e000 (snps,designware-i2s): clocks: [[11], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/snps,designware-i2s.yaml
>> arch/arc/boot/dts/axs103.dtb: adv7511@39 (adi,adv7511): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml
>> arch/arc/boot/dts/axs103.dtb: adv7511@39 (adi,adv7511): 'avdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml
>> arch/arc/boot/dts/axs103.dtb: adv7511@39 (adi,adv7511): 'dvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml
>> arch/arc/boot/dts/axs103.dtb: adv7511@39 (adi,adv7511): 'pvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml
>> arch/arc/boot/dts/axs103.dtb: adv7511@39 (adi,adv7511): 'dvdd-3v-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml
>> arch/arc/boot/dts/axs103.dtb: adv7511@39 (adi,adv7511): 'bgvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml
>> arch/arc/boot/dts/axs103.dtb: /axs10x_mb/pgu@17000: failed to match any schema with compatible: ['snps,arcpgu']
   arch/arc/boot/dts/axs103.dtb: /interrupt-controller@e0012000: failed to match any schema with compatible: ['snps,dw-apb-ictl']
--
   arch/arc/boot/dts/axc003_idu.dtsi:45.29-49.5: Warning (simple_bus_reg): /cpu_card/archs-intc@cpu: missing or empty reg/ranges property
   arch/arc/boot/dts/axc003_idu.dtsi:51.38-56.5: Warning (simple_bus_reg): /cpu_card/idu-interrupt-controller: missing or empty reg/ranges property
   arch/arc/boot/dts/axc003_idu.dtsi:92.16-97.5: Warning (simple_bus_reg): /cpu_card/pct: missing or empty reg/ranges property
   arch/arc/boot/dts/axs10x_mb.dtsi:33.10-64.5: Warning (simple_bus_reg): /axs10x_mb/clocks: missing or empty reg/ranges property
   arch/arc/boot/dts/axs10x_mb.dtsi:233.20-241.5: Warning (simple_bus_reg): /axs10x_mb/connector: missing or empty reg/ranges property
   arch/arc/boot/dts/axs10x_mb.dtsi:318.18-328.5: Warning (simple_bus_reg): /axs10x_mb/sound_playback: missing or empty reg/ranges property
   arch/arc/boot/dts/axc003_idu.dtsi:92.16-97.5: Warning (interrupt_provider): /cpu_card/pct: '#interrupt-cells' found, but node is not an interrupt provider
   arch/arc/boot/dts/axc003_idu.dtsi:109.18-111.5: Warning (interrupt_provider): /axs10x_mb/ethernet@18000: '#interrupt-cells' found, but node is not an interrupt provider
   arch/arc/boot/dts/axs103_idu.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
>> arch/arc/boot/dts/axs103_idu.dtb: /: failed to match any schema with compatible: ['snps,axs103', 'snps,arc-sdp']
>> arch/arc/boot/dts/axs103_idu.dtb: /: failed to match any schema with compatible: ['snps,axs103', 'snps,arc-sdp']
>> arch/arc/boot/dts/axs103_idu.dtb: / (snps,axs103): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 2147483648, 0, 536870912], [1, 3221225472, 0, 1073741824]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arc/boot/dts/axs103_idu.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/axs103_idu.dtb: /cpus/cpu@1: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/axs103_idu.dtb: /cpus/cpu@2: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/axs103_idu.dtb: /cpus/cpu@3: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/axs103_idu.dtb: /timer0: failed to match any schema with compatible: ['snps,arc-timer']
>> arch/arc/boot/dts/axs103_idu.dtb: /gfrc: failed to match any schema with compatible: ['snps,archs-timer-gfrc']
>> arch/arc/boot/dts/axs103_idu.dtb: cpu_card (simple-bus): idu-interrupt-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/axs103_idu.dtb: cpu_card (simple-bus): input-clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/axs103_idu.dtb: cpu_card (simple-bus): archs-intc@cpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/axs103_idu.dtb: cpu_card (simple-bus): pct: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/axs103_idu.dtb: cpu_card (simple-bus): $nodename:0: 'cpu_card' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/axs103_idu.dtb: cpu_card (simple-bus): 'archs-intc@cpu' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arc/boot/dts/axs103_idu.dtb: /cpu_card/core-clk@80: failed to match any schema with compatible: ['snps,axs10x-arc-pll-clock']
   arch/arc/boot/dts/axs103_idu.dtb: /cpu_card/archs-intc@cpu: failed to match any schema with compatible: ['snps,archs-intc']
   arch/arc/boot/dts/axs103_idu.dtb: /cpu_card/idu-interrupt-controller: failed to match any schema with compatible: ['snps,archs-idu-intc']
>> arch/arc/boot/dts/axs103_idu.dtb: dw-apb-gpio@2000 (snps,dw-apb-gpio): $nodename:0: 'dw-apb-gpio@2000' does not match '^gpio@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml
>> arch/arc/boot/dts/axs103_idu.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): $nodename:0: 'dw-apb-uart@5000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
>> arch/arc/boot/dts/axs103_idu.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
>> arch/arc/boot/dts/axs103_idu.dtb: pct (snps,archs-pct): '#interrupt-cells', 'interrupt-parent', 'interrupts' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml
>> arch/arc/boot/dts/axs103_idu.dtb: pct (snps,archs-pct): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml
>> arch/arc/boot/dts/axs103_idu.dtb: pct (snps,archs-pct): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml
>> arch/arc/boot/dts/axs103_idu.dtb: axs10x_mb (simple-bus): connector: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/axs103_idu.dtb: axs10x_mb (simple-bus): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/axs103_idu.dtb: axs10x_mb (simple-bus): sound_playback: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/axs103_idu.dtb: axs10x_mb (simple-bus): $nodename:0: 'axs10x_mb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/axs103_idu.dtb: usb@40000 (generic-ehci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml
>> arch/arc/boot/dts/axs103_idu.dtb: usb@60000 (generic-ohci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml
>> arch/arc/boot/dts/axs103_idu.dtb: mmc@15000 (altr,socfpga-dw-mshc): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/synopsys-dw-mshc.yaml
>> arch/arc/boot/dts/axs103_idu.dtb: /axs10x_mb/i2sclk@100a0: failed to match any schema with compatible: ['snps,axs10x-i2s-pll-clock']
>> arch/arc/boot/dts/axs103_idu.dtb: /axs10x_mb/pguclk@10080: failed to match any schema with compatible: ['snps,axs10x-pgu-pll-clock']
>> arch/arc/boot/dts/axs103_idu.dtb: uart@20000 (snps,dw-apb-uart): $nodename:0: 'uart@20000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
>> arch/arc/boot/dts/axs103_idu.dtb: uart@20000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
   arch/arc/boot/dts/axs103_idu.dtb: uart@21000 (snps,dw-apb-uart): $nodename:0: 'uart@21000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
   arch/arc/boot/dts/axs103_idu.dtb: uart@21000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
   arch/arc/boot/dts/axs103_idu.dtb: uart@22000 (snps,dw-apb-uart): $nodename:0: 'uart@22000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
   arch/arc/boot/dts/axs103_idu.dtb: uart@22000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
>> arch/arc/boot/dts/axs103_idu.dtb: i2s@1e000 (snps,designware-i2s): clocks: [[12], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/snps,designware-i2s.yaml
>> arch/arc/boot/dts/axs103_idu.dtb: adv7511@39 (adi,adv7511): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml
>> arch/arc/boot/dts/axs103_idu.dtb: adv7511@39 (adi,adv7511): 'avdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml
>> arch/arc/boot/dts/axs103_idu.dtb: adv7511@39 (adi,adv7511): 'dvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml
>> arch/arc/boot/dts/axs103_idu.dtb: adv7511@39 (adi,adv7511): 'pvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml
>> arch/arc/boot/dts/axs103_idu.dtb: adv7511@39 (adi,adv7511): 'dvdd-3v-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml
>> arch/arc/boot/dts/axs103_idu.dtb: adv7511@39 (adi,adv7511): 'bgvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml
>> arch/arc/boot/dts/axs103_idu.dtb: /axs10x_mb/pgu@17000: failed to match any schema with compatible: ['snps,arcpgu']
   arch/arc/boot/dts/axs103_idu.dtb: /interrupt-controller@e0012000: failed to match any schema with compatible: ['snps,dw-apb-ictl']
--
   arch/arc/boot/dts/skeleton_hs.dtsi:45.9-48.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/haps_hs.dts:31.7-98.4: Warning (unit_address_vs_reg): /fpga: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/haps_hs.dts:40.22-44.5: Warning (simple_bus_reg): /fpga/core_clk: missing or empty reg/ranges property
   arch/arc/boot/dts/haps_hs.dts:46.35-50.5: Warning (simple_bus_reg): /fpga/interrupt-controller: missing or empty reg/ranges property
   arch/arc/boot/dts/haps_hs.dts:63.16-67.5: Warning (simple_bus_reg): /fpga/pct: missing or empty reg/ranges property
   arch/arc/boot/dts/haps_hs.dts:63.16-67.5: Warning (interrupt_provider): /fpga/pct: '#interrupt-cells' found, but node is not an interrupt provider
   arch/arc/boot/dts/haps_hs.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
   no-loopback-test: size (4) error for type flag
>> arch/arc/boot/dts/haps_hs.dtb: /: failed to match any schema with compatible: ['snps,zebu_hs']
>> arch/arc/boot/dts/haps_hs.dtb: / (snps,zebu_hs): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 2147483648, 0, 1073741824], [1, 0, 0, 1073741824]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arc/boot/dts/haps_hs.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/haps_hs.dtb: /timer0: failed to match any schema with compatible: ['snps,arc-timer']
>> arch/arc/boot/dts/haps_hs.dtb: /rtc: failed to match any schema with compatible: ['snps,archs-timer-rtc']
   arch/arc/boot/dts/haps_hs.dtb: /timer1: failed to match any schema with compatible: ['snps,arc-timer']
>> arch/arc/boot/dts/haps_hs.dtb: fpga (simple-bus): core_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/haps_hs.dtb: fpga (simple-bus): interrupt-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/haps_hs.dtb: fpga (simple-bus): pct: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/haps_hs.dtb: fpga (simple-bus): $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/haps_hs.dtb: /fpga/interrupt-controller: failed to match any schema with compatible: ['snps,archs-intc']
>> arch/arc/boot/dts/haps_hs.dtb: serial@f0000000 (ns16550a): no-loopback-test: 1 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
>> arch/arc/boot/dts/haps_hs.dtb: serial@f0000000 (ns16550a): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
>> arch/arc/boot/dts/haps_hs.dtb: pct (snps,archs-pct): '#interrupt-cells', 'interrupts' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml
>> arch/arc/boot/dts/haps_hs.dtb: pct (snps,archs-pct): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml
>> arch/arc/boot/dts/haps_hs.dtb: pct (snps,archs-pct): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml
--
   arch/arc/boot/dts/skeleton_hs_idu.dtsi:57.9-60.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/haps_hs_idu.dts:37.22-41.5: Warning (simple_bus_reg): /fpga/core_clk: missing or empty reg/ranges property
   arch/arc/boot/dts/haps_hs_idu.dts:43.35-47.5: Warning (simple_bus_reg): /fpga/interrupt-controller: missing or empty reg/ranges property
   arch/arc/boot/dts/haps_hs_idu.dts:49.38-54.5: Warning (simple_bus_reg): /fpga/idu-interrupt-controller: missing or empty reg/ranges property
   arch/arc/boot/dts/haps_hs_idu.dts:68.16-72.5: Warning (simple_bus_reg): /fpga/pct: missing or empty reg/ranges property
   arch/arc/boot/dts/haps_hs_idu.dts:68.16-72.5: Warning (interrupt_provider): /fpga/pct: '#interrupt-cells' found, but node is not an interrupt provider
   arch/arc/boot/dts/haps_hs_idu.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
   no-loopback-test: size (4) error for type flag
>> arch/arc/boot/dts/haps_hs_idu.dtb: /: failed to match any schema with compatible: ['snps,zebu_hs']
>> arch/arc/boot/dts/haps_hs_idu.dtb: / (snps,zebu_hs): False schema does not allow {'device_type': ['memory'], 'reg': [[2147483648, 536870912]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arc/boot/dts/haps_hs_idu.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/haps_hs_idu.dtb: /cpus/cpu@1: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/haps_hs_idu.dtb: /cpus/cpu@2: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/haps_hs_idu.dtb: /cpus/cpu@3: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/haps_hs_idu.dtb: /timer0: failed to match any schema with compatible: ['snps,arc-timer']
>> arch/arc/boot/dts/haps_hs_idu.dtb: /gfrc: failed to match any schema with compatible: ['snps,archs-timer-gfrc']
>> arch/arc/boot/dts/haps_hs_idu.dtb: fpga (simple-bus): interrupt-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/haps_hs_idu.dtb: fpga (simple-bus): core_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/haps_hs_idu.dtb: fpga (simple-bus): pct: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/haps_hs_idu.dtb: fpga (simple-bus): idu-interrupt-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/haps_hs_idu.dtb: fpga (simple-bus): $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/haps_hs_idu.dtb: /fpga/interrupt-controller: failed to match any schema with compatible: ['snps,archs-intc']
   arch/arc/boot/dts/haps_hs_idu.dtb: /fpga/idu-interrupt-controller: failed to match any schema with compatible: ['snps,archs-idu-intc']
>> arch/arc/boot/dts/haps_hs_idu.dtb: serial@f0000000 (ns16550a): no-loopback-test: 1 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
>> arch/arc/boot/dts/haps_hs_idu.dtb: serial@f0000000 (ns16550a): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
>> arch/arc/boot/dts/haps_hs_idu.dtb: pct (snps,archs-pct): '#interrupt-cells', 'interrupts' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml
>> arch/arc/boot/dts/haps_hs_idu.dtb: pct (snps,archs-pct): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml
>> arch/arc/boot/dts/haps_hs_idu.dtb: pct (snps,archs-pct): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml
--
   arch/arc/boot/dts/hsdk.dts:109.6-341.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/hsdk.dts:148.20-152.5: Warning (simple_bus_reg): /soc/gmacclk: missing or empty reg/ranges property
   arch/arc/boot/dts/hsdk.dts:154.26-169.5: Warning (simple_bus_reg): /soc/mmcclk-ciu: missing or empty reg/ranges property
   arch/arc/boot/dts/hsdk.dts:171.26-175.5: Warning (simple_bus_reg): /soc/mmcclk-biu: missing or empty reg/ranges property
   arch/arc/boot/dts/hsdk.dts:177.30-181.5: Warning (simple_bus_reg): /soc/gpu-core-clk: missing or empty reg/ranges property
   arch/arc/boot/dts/hsdk.dts:183.28-187.5: Warning (simple_bus_reg): /soc/gpu-dma-clk: missing or empty reg/ranges property
   arch/arc/boot/dts/hsdk.dts:189.28-193.5: Warning (simple_bus_reg): /soc/gpu-cfg-clk: missing or empty reg/ranges property
   arch/arc/boot/dts/hsdk.dts:195.32-199.5: Warning (simple_bus_reg): /soc/dmac-core-clk: missing or empty reg/ranges property
   arch/arc/boot/dts/hsdk.dts:201.34-205.5: Warning (simple_bus_reg): /soc/dmac-gpu-cfg-clk: missing or empty reg/ranges property
>> arch/arc/boot/dts/hsdk.dtb: /: failed to match any schema with compatible: ['snps,hsdk']
>> arch/arc/boot/dts/hsdk.dtb: / (snps,hsdk): memory@80000000: '#address-cells', '#size-cells' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory.yaml
>> arch/arc/boot/dts/hsdk.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/hsdk.dtb: /cpus/cpu@1: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/hsdk.dtb: /cpus/cpu@2: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/hsdk.dtb: /cpus/cpu@3: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/hsdk.dtb: /cpu-interrupt-controller: failed to match any schema with compatible: ['snps,archs-intc']
   arch/arc/boot/dts/hsdk.dtb: /idu-interrupt-controller: failed to match any schema with compatible: ['snps,archs-idu-intc']
>> arch/arc/boot/dts/hsdk.dtb: pct (snps,archs-pct): 'interrupt-parent', 'interrupts' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml
>> arch/arc/boot/dts/hsdk.dtb: pct (snps,archs-pct): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml
>> arch/arc/boot/dts/hsdk.dtb: pct (snps,archs-pct): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml
   arch/arc/boot/dts/hsdk.dtb: /timer: failed to match any schema with compatible: ['snps,arc-timer']
>> arch/arc/boot/dts/hsdk.dtb: /gfrc: failed to match any schema with compatible: ['snps,archs-timer-gfrc']
>> arch/arc/boot/dts/hsdk.dtb: soc (simple-bus): gmacclk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/hsdk.dtb: soc (simple-bus): dmac-core-clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/hsdk.dtb: soc (simple-bus): dmac-gpu-cfg-clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/hsdk.dtb: soc (simple-bus): mmcclk-biu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/hsdk.dtb: soc (simple-bus): gpu-core-clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/hsdk.dtb: soc (simple-bus): gpu-dma-clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/hsdk.dtb: soc (simple-bus): mmcclk-ciu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/hsdk.dtb: soc (simple-bus): gpu-cfg-clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/hsdk.dtb: /soc/reset-controller@8a0: failed to match any schema with compatible: ['snps,hsdk-reset']
>> arch/arc/boot/dts/hsdk.dtb: /soc/core-clk@0: failed to match any schema with compatible: ['snps,hsdk-core-pll-clock']
>> arch/arc/boot/dts/hsdk.dtb: serial@5000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
>> arch/arc/boot/dts/hsdk.dtb: usb@60000 (snps,hsdk-v1.0-ohci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml
>> arch/arc/boot/dts/hsdk.dtb: usb@40000 (snps,hsdk-v1.0-ehci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml
>> arch/arc/boot/dts/hsdk.dtb: mmc@a000 (altr,socfpga-dw-mshc): Unevaluated properties are not allowed ('dma-coherent', 'num-slots' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/synopsys-dw-mshc.yaml
   arch/arc/boot/dts/hsdk.dtb: /soc/gpio@14b0: failed to match any schema with compatible: ['snps,creg-gpio-hsdk']
>> arch/arc/boot/dts/hsdk.dtb: dmac@80000 (snps,axi-dma-1.01a): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/snps,dw-axi-dmac.yaml
>> arch/arc/boot/dts/hsdk.dtb: dmac@80000 (snps,axi-dma-1.01a): $nodename:0: 'dmac@80000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/snps,dw-axi-dmac.yaml
>> arch/arc/boot/dts/hsdk.dtb: dmac@80000 (snps,axi-dma-1.01a): '#dma-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/snps,dw-axi-dmac.yaml
--
   arch/arc/boot/dts/skeleton.dtsi:44.9-47.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/nsimosci.dts:35.22-39.5: Warning (simple_bus_reg): /fpga/core_clk: missing or empty reg/ranges property
   arch/arc/boot/dts/nsimosci.dts:41.35-45.5: Warning (simple_bus_reg): /fpga/interrupt-controller: missing or empty reg/ranges property
   arch/arc/boot/dts/nsimosci.dts:58.18-62.5: Warning (simple_bus_reg): /fpga/pguclk: missing or empty reg/ranges property
   arch/arc/boot/dts/nsimosci.dts:71.21-76.5: Warning (simple_bus_reg): /fpga/ps2@f9001000: simple-bus unit address format error, expected "f9000400"
   arch/arc/boot/dts/nsimosci.dts:84.16-86.5: Warning (simple_bus_reg): /fpga/pct: missing or empty reg/ranges property
   no-loopback-test: size (4) error for type flag
>> arch/arc/boot/dts/nsimosci.dtb: /: failed to match any schema with compatible: ['snps,nsimosci']
>> arch/arc/boot/dts/nsimosci.dtb: / (snps,nsimosci): False schema does not allow {'device_type': ['memory'], 'reg': [[2147483648, 268435456]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arc/boot/dts/nsimosci.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['snps,arc770d']
   arch/arc/boot/dts/nsimosci.dtb: /timer0: failed to match any schema with compatible: ['snps,arc-timer']
   arch/arc/boot/dts/nsimosci.dtb: /timer1: failed to match any schema with compatible: ['snps,arc-timer']
>> arch/arc/boot/dts/nsimosci.dtb: fpga (simple-bus): interrupt-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/nsimosci.dtb: fpga (simple-bus): pguclk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/nsimosci.dtb: fpga (simple-bus): pct: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/nsimosci.dtb: fpga (simple-bus): core_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/nsimosci.dtb: fpga (simple-bus): $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/nsimosci.dtb: /fpga/interrupt-controller: failed to match any schema with compatible: ['snps,arc700-intc']
>> arch/arc/boot/dts/nsimosci.dtb: serial@f0000000 (ns8250): no-loopback-test: 1 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
>> arch/arc/boot/dts/nsimosci.dtb: serial@f0000000 (ns8250): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
>> arch/arc/boot/dts/nsimosci.dtb: /fpga/pgu@f9000000: failed to match any schema with compatible: ['snps,arcpgu']
>> arch/arc/boot/dts/nsimosci.dtb: /fpga/ps2@f9001000: failed to match any schema with compatible: ['snps,arc_ps2']
>> arch/arc/boot/dts/nsimosci.dtb: /fpga/ethernet@f0003000: failed to match any schema with compatible: ['ezchip,nps-mgt-enet']
>> arch/arc/boot/dts/nsimosci.dtb: /fpga/pct: failed to match any schema with compatible: ['snps,arc700-pct']
--
   arch/arc/boot/dts/skeleton_hs.dtsi:45.9-48.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/nsimosci_hs.dts:35.22-39.5: Warning (simple_bus_reg): /fpga/core_clk: missing or empty reg/ranges property
   arch/arc/boot/dts/nsimosci_hs.dts:41.40-45.5: Warning (simple_bus_reg): /fpga/core-interrupt-controller: missing or empty reg/ranges property
   arch/arc/boot/dts/nsimosci_hs.dts:58.18-62.5: Warning (simple_bus_reg): /fpga/pguclk: missing or empty reg/ranges property
   arch/arc/boot/dts/nsimosci_hs.dts:71.21-76.5: Warning (simple_bus_reg): /fpga/ps2@f9001000: simple-bus unit address format error, expected "f9000400"
   arch/arc/boot/dts/nsimosci_hs.dts:84.16-88.5: Warning (simple_bus_reg): /fpga/pct: missing or empty reg/ranges property
   arch/arc/boot/dts/nsimosci_hs.dts:84.16-88.5: Warning (interrupt_provider): /fpga/pct: '#interrupt-cells' found, but node is not an interrupt provider
   arch/arc/boot/dts/nsimosci_hs.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
   no-loopback-test: size (4) error for type flag
>> arch/arc/boot/dts/nsimosci_hs.dtb: /: failed to match any schema with compatible: ['snps,nsimosci_hs']
>> arch/arc/boot/dts/nsimosci_hs.dtb: / (snps,nsimosci_hs): False schema does not allow {'device_type': ['memory'], 'reg': [[2147483648, 268435456]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arc/boot/dts/nsimosci_hs.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/nsimosci_hs.dtb: /timer0: failed to match any schema with compatible: ['snps,arc-timer']
>> arch/arc/boot/dts/nsimosci_hs.dtb: /rtc: failed to match any schema with compatible: ['snps,archs-timer-rtc']
   arch/arc/boot/dts/nsimosci_hs.dtb: /timer1: failed to match any schema with compatible: ['snps,arc-timer']
>> arch/arc/boot/dts/nsimosci_hs.dtb: fpga (simple-bus): core_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/nsimosci_hs.dtb: fpga (simple-bus): pct: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/nsimosci_hs.dtb: fpga (simple-bus): pguclk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/nsimosci_hs.dtb: fpga (simple-bus): core-interrupt-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/nsimosci_hs.dtb: fpga (simple-bus): $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/nsimosci_hs.dtb: /fpga/core-interrupt-controller: failed to match any schema with compatible: ['snps,archs-intc']
>> arch/arc/boot/dts/nsimosci_hs.dtb: serial@f0000000 (ns8250): no-loopback-test: 1 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
>> arch/arc/boot/dts/nsimosci_hs.dtb: serial@f0000000 (ns8250): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
>> arch/arc/boot/dts/nsimosci_hs.dtb: /fpga/pgu@f9000000: failed to match any schema with compatible: ['snps,arcpgu']
>> arch/arc/boot/dts/nsimosci_hs.dtb: /fpga/ps2@f9001000: failed to match any schema with compatible: ['snps,arc_ps2']
>> arch/arc/boot/dts/nsimosci_hs.dtb: /fpga/ethernet@f0003000: failed to match any schema with compatible: ['ezchip,nps-mgt-enet']
>> arch/arc/boot/dts/nsimosci_hs.dtb: pct (snps,archs-pct): '#interrupt-cells', 'interrupts' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml
>> arch/arc/boot/dts/nsimosci_hs.dtb: pct (snps,archs-pct): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml
>> arch/arc/boot/dts/nsimosci_hs.dtb: pct (snps,archs-pct): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml
--
   arch/arc/boot/dts/skeleton_hs_idu.dtsi:57.9-60.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/nsimosci_hs_idu.dts:33.22-37.5: Warning (simple_bus_reg): /fpga/core_clk: missing or empty reg/ranges property
   arch/arc/boot/dts/nsimosci_hs_idu.dts:39.40-43.5: Warning (simple_bus_reg): /fpga/core-interrupt-controller: missing or empty reg/ranges property
   arch/arc/boot/dts/nsimosci_hs_idu.dts:45.38-50.5: Warning (simple_bus_reg): /fpga/idu-interrupt-controller: missing or empty reg/ranges property
   arch/arc/boot/dts/nsimosci_hs_idu.dts:64.18-68.5: Warning (simple_bus_reg): /fpga/pguclk: missing or empty reg/ranges property
   arch/arc/boot/dts/nsimosci_hs_idu.dts:77.21-83.5: Warning (simple_bus_reg): /fpga/ps2@f9001000: simple-bus unit address format error, expected "f9000400"
   arch/arc/boot/dts/nsimosci_hs_idu.dts:92.16-96.5: Warning (simple_bus_reg): /fpga/pct: missing or empty reg/ranges property
   arch/arc/boot/dts/nsimosci_hs_idu.dts:92.16-96.5: Warning (interrupt_provider): /fpga/pct: '#interrupt-cells' found, but node is not an interrupt provider
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
   no-loopback-test: size (4) error for type flag
>> arch/arc/boot/dts/nsimosci_hs_idu.dtb: /: failed to match any schema with compatible: ['snps,nsimosci_hs']
>> arch/arc/boot/dts/nsimosci_hs_idu.dtb: / (snps,nsimosci_hs): False schema does not allow {'device_type': ['memory'], 'reg': [[2147483648, 268435456]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arc/boot/dts/nsimosci_hs_idu.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: /cpus/cpu@1: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: /cpus/cpu@2: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: /cpus/cpu@3: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: /timer0: failed to match any schema with compatible: ['snps,arc-timer']
>> arch/arc/boot/dts/nsimosci_hs_idu.dtb: /gfrc: failed to match any schema with compatible: ['snps,archs-timer-gfrc']
>> arch/arc/boot/dts/nsimosci_hs_idu.dtb: fpga (simple-bus): core-interrupt-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/nsimosci_hs_idu.dtb: fpga (simple-bus): pguclk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/nsimosci_hs_idu.dtb: fpga (simple-bus): core_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/nsimosci_hs_idu.dtb: fpga (simple-bus): pct: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/nsimosci_hs_idu.dtb: fpga (simple-bus): idu-interrupt-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/nsimosci_hs_idu.dtb: fpga (simple-bus): $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: /fpga/core-interrupt-controller: failed to match any schema with compatible: ['snps,archs-intc']
   arch/arc/boot/dts/nsimosci_hs_idu.dtb: /fpga/idu-interrupt-controller: failed to match any schema with compatible: ['snps,archs-idu-intc']
>> arch/arc/boot/dts/nsimosci_hs_idu.dtb: serial@f0000000 (ns8250): no-loopback-test: 1 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
>> arch/arc/boot/dts/nsimosci_hs_idu.dtb: serial@f0000000 (ns8250): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
>> arch/arc/boot/dts/nsimosci_hs_idu.dtb: /fpga/pgu@f9000000: failed to match any schema with compatible: ['snps,arcpgu']
>> arch/arc/boot/dts/nsimosci_hs_idu.dtb: /fpga/ps2@f9001000: failed to match any schema with compatible: ['snps,arc_ps2']
>> arch/arc/boot/dts/nsimosci_hs_idu.dtb: /fpga/ethernet@f0003000: failed to match any schema with compatible: ['ezchip,nps-mgt-enet']
>> arch/arc/boot/dts/nsimosci_hs_idu.dtb: pct (snps,archs-pct): '#interrupt-cells', 'interrupts' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml
>> arch/arc/boot/dts/nsimosci_hs_idu.dtb: pct (snps,archs-pct): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml
>> arch/arc/boot/dts/nsimosci_hs_idu.dtb: pct (snps,archs-pct): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml
--
   arch/arc/boot/dts/vdk_axc003.dtsi:17.11-47.4: Warning (unit_address_vs_reg): /cpu_card: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/vdk_axc003.dtsi:30.29-34.5: Warning (unit_address_vs_reg): /cpu_card/archs-intc@cpu: node has a unit name, but no reg or ranges property
   arch/arc/boot/dts/vdk_axs10x_mb.dtsi:9.16-111.4: Warning (unit_address_vs_reg): /axs10x_mb_vdk: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/vdk_axc003.dtsi:24.22-28.5: Warning (simple_bus_reg): /cpu_card/core_clk: missing or empty reg/ranges property
   arch/arc/boot/dts/vdk_axc003.dtsi:30.29-34.5: Warning (simple_bus_reg): /cpu_card/archs-intc@cpu: missing or empty reg/ranges property
   arch/arc/boot/dts/vdk_axs10x_mb.dtsi:16.10-34.5: Warning (simple_bus_reg): /axs10x_mb_vdk/clocks: missing or empty reg/ranges property
   arch/arc/boot/dts/vdk_axs10x_mb.dtsi:94.21-99.5: Warning (simple_bus_reg): /axs10x_mb_vdk/ps2@e0017400: simple-bus unit address format error, expected "17400"
   arch/arc/boot/dts/vdk_axs10x_mb.dtsi:36.18-47.5: Warning (interrupt_provider): /axs10x_mb_vdk/ethernet@18000: '#interrupt-cells' found, but node is not an interrupt provider
   arch/arc/boot/dts/vdk_hs38.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
>> arch/arc/boot/dts/vdk_hs38.dtb: /: failed to match any schema with compatible: ['snps,axs103']
>> arch/arc/boot/dts/vdk_hs38.dtb: / (snps,axs103): memory: '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory.yaml
>> arch/arc/boot/dts/vdk_hs38.dtb: / (snps,axs103): False schema does not allow {'device_type': ['memory'], 'reg': [[2147483648, 536870912]], '#address-cells': 1, '#size-cells': 1, 'ranges': [[0, 2147483648, 1073741824]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arc/boot/dts/vdk_hs38.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/vdk_hs38.dtb: /timer0: failed to match any schema with compatible: ['snps,arc-timer']
>> arch/arc/boot/dts/vdk_hs38.dtb: /rtc: failed to match any schema with compatible: ['snps,archs-timer-rtc']
   arch/arc/boot/dts/vdk_hs38.dtb: /timer1: failed to match any schema with compatible: ['snps,arc-timer']
>> arch/arc/boot/dts/vdk_hs38.dtb: cpu_card (simple-bus): archs-intc@cpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/vdk_hs38.dtb: cpu_card (simple-bus): core_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/vdk_hs38.dtb: cpu_card (simple-bus): $nodename:0: 'cpu_card' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/vdk_hs38.dtb: cpu_card (simple-bus): 'archs-intc@cpu' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arc/boot/dts/vdk_hs38.dtb: /cpu_card/archs-intc@cpu: failed to match any schema with compatible: ['snps,archs-intc']
>> arch/arc/boot/dts/vdk_hs38.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): $nodename:0: 'dw-apb-uart@5000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
>> arch/arc/boot/dts/vdk_hs38.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
   arch/arc/boot/dts/vdk_hs38.dtb: /interrupt-controller@e0012000: failed to match any schema with compatible: ['snps,dw-apb-ictl']
>> arch/arc/boot/dts/vdk_hs38.dtb: axs10x_mb_vdk (simple-bus): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/vdk_hs38.dtb: axs10x_mb_vdk (simple-bus): $nodename:0: 'axs10x_mb_vdk' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/vdk_hs38.dtb: uart@20000 (snps,dw-apb-uart): $nodename:0: 'uart@20000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
>> arch/arc/boot/dts/vdk_hs38.dtb: uart@20000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
   arch/arc/boot/dts/vdk_hs38.dtb: uart@21000 (snps,dw-apb-uart): $nodename:0: 'uart@21000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
   arch/arc/boot/dts/vdk_hs38.dtb: uart@21000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
   arch/arc/boot/dts/vdk_hs38.dtb: uart@22000 (snps,dw-apb-uart): $nodename:0: 'uart@22000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
   arch/arc/boot/dts/vdk_hs38.dtb: uart@22000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
>> arch/arc/boot/dts/vdk_hs38.dtb: /axs10x_mb_vdk/pgu@17000: failed to match any schema with compatible: ['snps,arcpgu']
>> arch/arc/boot/dts/vdk_hs38.dtb: /axs10x_mb_vdk/ps2@e0017400: failed to match any schema with compatible: ['snps,arc_ps2']
>> arch/arc/boot/dts/vdk_hs38.dtb: /uio@d0000000: failed to match any schema with compatible: ['generic-uio']
--
   arch/arc/boot/dts/vdk_axc003_idu.dtsi:18.11-55.4: Warning (unit_address_vs_reg): /cpu_card: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/vdk_axc003_idu.dtsi:31.29-35.5: Warning (unit_address_vs_reg): /cpu_card/archs-intc@cpu: node has a unit name, but no reg or ranges property
   arch/arc/boot/dts/vdk_axs10x_mb.dtsi:9.16-111.4: Warning (unit_address_vs_reg): /axs10x_mb_vdk: node has a reg or ranges property, but no unit name
   arch/arc/boot/dts/vdk_axc003_idu.dtsi:25.22-29.5: Warning (simple_bus_reg): /cpu_card/core_clk: missing or empty reg/ranges property
   arch/arc/boot/dts/vdk_axc003_idu.dtsi:31.29-35.5: Warning (simple_bus_reg): /cpu_card/archs-intc@cpu: missing or empty reg/ranges property
   arch/arc/boot/dts/vdk_axc003_idu.dtsi:37.38-42.5: Warning (simple_bus_reg): /cpu_card/idu-interrupt-controller: missing or empty reg/ranges property
   arch/arc/boot/dts/vdk_axs10x_mb.dtsi:16.10-34.5: Warning (simple_bus_reg): /axs10x_mb_vdk/clocks: missing or empty reg/ranges property
   arch/arc/boot/dts/vdk_axs10x_mb.dtsi:94.21-99.5: Warning (simple_bus_reg): /axs10x_mb_vdk/ps2@e0017400: simple-bus unit address format error, expected "17400"
   arch/arc/boot/dts/vdk_axs10x_mb.dtsi:36.18-47.5: Warning (interrupt_provider): /axs10x_mb_vdk/ethernet@18000: '#interrupt-cells' found, but node is not an interrupt provider
   arch/arc/boot/dts/vdk_hs38_smp.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
>> arch/arc/boot/dts/vdk_hs38_smp.dtb: /: failed to match any schema with compatible: ['snps,axs103']
>> arch/arc/boot/dts/vdk_hs38_smp.dtb: / (snps,axs103): memory: '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory.yaml
>> arch/arc/boot/dts/vdk_hs38_smp.dtb: / (snps,axs103): False schema does not allow {'device_type': ['memory'], 'reg': [[2147483648, 536870912]], '#address-cells': 1, '#size-cells': 1, 'ranges': [[0, 2147483648, 1073741824]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arc/boot/dts/vdk_hs38_smp.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/vdk_hs38_smp.dtb: /cpus/cpu@1: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/vdk_hs38_smp.dtb: /cpus/cpu@2: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/vdk_hs38_smp.dtb: /cpus/cpu@3: failed to match any schema with compatible: ['snps,archs38']
   arch/arc/boot/dts/vdk_hs38_smp.dtb: /timer0: failed to match any schema with compatible: ['snps,arc-timer']
>> arch/arc/boot/dts/vdk_hs38_smp.dtb: /gfrc: failed to match any schema with compatible: ['snps,archs-timer-gfrc']
>> arch/arc/boot/dts/vdk_hs38_smp.dtb: cpu_card (simple-bus): core_clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/vdk_hs38_smp.dtb: cpu_card (simple-bus): archs-intc@cpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/vdk_hs38_smp.dtb: cpu_card (simple-bus): idu-interrupt-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/vdk_hs38_smp.dtb: cpu_card (simple-bus): $nodename:0: 'cpu_card' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/vdk_hs38_smp.dtb: cpu_card (simple-bus): 'archs-intc@cpu' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arc/boot/dts/vdk_hs38_smp.dtb: /cpu_card/archs-intc@cpu: failed to match any schema with compatible: ['snps,archs-intc']
   arch/arc/boot/dts/vdk_hs38_smp.dtb: /cpu_card/idu-interrupt-controller: failed to match any schema with compatible: ['snps,archs-idu-intc']
>> arch/arc/boot/dts/vdk_hs38_smp.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): $nodename:0: 'dw-apb-uart@5000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
>> arch/arc/boot/dts/vdk_hs38_smp.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
   arch/arc/boot/dts/vdk_hs38_smp.dtb: /interrupt-controller@e0012000: failed to match any schema with compatible: ['snps,dw-apb-ictl']
>> arch/arc/boot/dts/vdk_hs38_smp.dtb: axs10x_mb_vdk (simple-bus): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/vdk_hs38_smp.dtb: axs10x_mb_vdk (simple-bus): $nodename:0: 'axs10x_mb_vdk' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arc/boot/dts/vdk_hs38_smp.dtb: uart@20000 (snps,dw-apb-uart): $nodename:0: 'uart@20000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
>> arch/arc/boot/dts/vdk_hs38_smp.dtb: uart@20000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
   arch/arc/boot/dts/vdk_hs38_smp.dtb: uart@21000 (snps,dw-apb-uart): $nodename:0: 'uart@21000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
   arch/arc/boot/dts/vdk_hs38_smp.dtb: uart@21000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
   arch/arc/boot/dts/vdk_hs38_smp.dtb: uart@22000 (snps,dw-apb-uart): $nodename:0: 'uart@22000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
   arch/arc/boot/dts/vdk_hs38_smp.dtb: uart@22000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
>> arch/arc/boot/dts/vdk_hs38_smp.dtb: /axs10x_mb_vdk/pgu@17000: failed to match any schema with compatible: ['snps,arcpgu']
>> arch/arc/boot/dts/vdk_hs38_smp.dtb: /axs10x_mb_vdk/ps2@e0017400: failed to match any schema with compatible: ['snps,arc_ps2']
>> arch/arc/boot/dts/vdk_hs38_smp.dtb: /uio@d0000000: failed to match any schema with compatible: ['generic-uio']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
