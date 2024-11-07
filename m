Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1821DE88D
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Nov 2024 08:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730969712; cv=none; b=iViny50HdyRgwnGwPhPSWGrttMk0N5RcPF4Jg6CQogM5nwfFUpsGTYzjgerQmmLLFTWI46qFMSgOcPZQIULKtZu9IOcZqGYOGbt2xTfaW7VxTd+cKr/mdlSOPbhaFtPwAr+MZ6VjoT8AVxBJqwEZ//Djg8HoeXiOHbmlILg0+jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730969712; c=relaxed/simple;
	bh=mdc2ph8hKAaLoH+XruZvgUidcdaEYWcrSv67xeBEwrk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ulaefj5OlQEzEjF8dLsYscAtiVB4KISpdH7jhsWYWD/x+i5Vy3CyLFe2h/oF9paraJUVKNCyMLQ/3znaUcdn8+lMl19WJiPBH9f33x0hi1FY3iPBAdbyRoCASHI8DOUr9h6k7pT30mnjYJPkCKaEmieMXObrfG1cGAYz8FHJ1Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=loLi4zDU; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="loLi4zDU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730969709; x=1762505709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mdc2ph8hKAaLoH+XruZvgUidcdaEYWcrSv67xeBEwrk=;
  b=loLi4zDUIGWb+6HRkk2bMEhErea8VuHZ343nLpOoQn8p5l3DghOGPZgZ
   Ee2/4ASqxXz4kamydF38Zl6HuE2h6LXiqO3R47EXUYHzl/crcTmamj1Kp
   BRg9SdO0THYPhaqOP0WKev9SfPxdVV02Ue8U2lQTwCXX+AeXpWMUPtbgI
   Gh9AnZsT02dyT7ooAgztEt0BB9ju139q6Stb3Bov0/oBtj0bWKktpbr/D
   xLzUXFjM2IuiKynqSINVFw+Fzp4R5K0UMm2YgUxEMYejTpRGjcpH9eveb
   V9XjNTDID/RcQTyM6EZvJWDRPcK4kYhk9HBZ2zR1AJHnW3S7jHizPGxEF
   A==;
X-CSE-ConnectionGUID: DNpfLYLuSsK1YB7MYjFEgw==
X-CSE-MsgGUID: vFhfsTGqSOeSYFTPOaaP7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30658552"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30658552"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 00:55:06 -0800
X-CSE-ConnectionGUID: smjS9N7iRb2BTn0tTkhkIQ==
X-CSE-MsgGUID: TIpFqdwER9OUuXPIi5Zc2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="90113317"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Nov 2024 00:55:05 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8yI9-000q1Q-24;
	Thu, 07 Nov 2024 08:55:01 +0000
Date: Thu, 7 Nov 2024 16:54:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: clock: ti: Convert mux.txt to json-schema
Message-ID: <202411071630.ktrIyJlt-lkp@intel.com>
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
In-Reply-To: <20241104135549.38486-1-andreas@kemnade.info>
References: <20241104135549.38486-1-andreas@kemnade.info>
TO: Andreas Kemnade <andreas@kemnade.info>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: linux-kernel@vger.kernel.org
TO: linux-clk@vger.kernel.org
TO: linux-omap@vger.kernel.org
TO: Tero Kristo <kristo@kernel.org>
TO: Tony Lindgren <tony@atomide.com>
TO: Andreas Kemnade <andreas@kemnade.info>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Stephen Boyd <sboyd@kernel.org>
TO: devicetree@vger.kernel.org

Hi Andreas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on next-20241105]
[cannot apply to robh/for-next krzk-dt/for-next linus/master v6.12-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andreas-Kemnade/dt-bindings-clock-ti-Convert-mux-txt-to-json-schema/20241104-215728
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20241104135549.38486-1-andreas%40kemnade.info
patch subject: [PATCH] dt-bindings: clock: ti: Convert mux.txt to json-schema
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-052-20241105 (https://download.01.org/0day-ci/archive/20241107/202411071630.ktrIyJlt-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411071630.ktrIyJlt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411071630.ktrIyJlt-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760/clock@0: failed to match any schema with compatible: ['ti,clkctrl']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: cm_core@0: $nodename:0: 'cm_core@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: cm_core@0: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: cm_core@0: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0: failed to match any schema with compatible: ['ti,dra7-cm-core', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@200: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
>> arch/arm/boot/dts/ti/omap/am571x-idk.dtb: clock-apll-pcie-in-clk-mux-7@4ae06118: reg: [[540], [4]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,mux-clock.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@21c: failed to match any schema with compatible: ['ti,dra7-apll-clock']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: clock-optfclk-pciephy-div-8@4a00821c: ti,max-div: False schema does not allow 2
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@140: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@180: failed to match any schema with compatible: ['ti,omap4-dpll-j-type-clock']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-clkout2-8@6b0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-l3init-960m-gfclk-8@6c0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy1-always-on-clk32k-8@640: failed to match any schema with compatible: ['ti,gate-clock']
--
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760/clock@0: failed to match any schema with compatible: ['ti,clkctrl']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: cm_core@0: $nodename:0: 'cm_core@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: cm_core@0: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: cm_core@0: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0: failed to match any schema with compatible: ['ti,dra7-cm-core', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@200: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
>> arch/arm/boot/dts/ti/omap/am572x-idk.dtb: clock-apll-pcie-in-clk-mux-7@4ae06118: reg: [[540], [4]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,mux-clock.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@21c: failed to match any schema with compatible: ['ti,dra7-apll-clock']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: clock-optfclk-pciephy-div-8@4a00821c: ti,max-div: False schema does not allow 2
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@140: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@180: failed to match any schema with compatible: ['ti,omap4-dpll-j-type-clock']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-clkout2-8@6b0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-l3init-960m-gfclk-8@6c0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy1-always-on-clk32k-8@640: failed to match any schema with compatible: ['ti,gate-clock']
--
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760/clock@0: failed to match any schema with compatible: ['ti,clkctrl']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: cm_core@0: $nodename:0: 'cm_core@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: cm_core@0: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: cm_core@0: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0: failed to match any schema with compatible: ['ti,dra7-cm-core', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@200: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: clock-apll-pcie-in-clk-mux-7@4ae06118: reg: [[540], [4]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,mux-clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@21c: failed to match any schema with compatible: ['ti,dra7-apll-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: clock-optfclk-pciephy-div-8@4a00821c: ti,max-div: False schema does not allow 2
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@140: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@180: failed to match any schema with compatible: ['ti,omap4-dpll-j-type-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-clkout2-8@6b0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-l3init-960m-gfclk-8@6c0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy1-always-on-clk32k-8@640: failed to match any schema with compatible: ['ti,gate-clock']
--
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760/clock@0: failed to match any schema with compatible: ['ti,clkctrl']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: cm_core@0: $nodename:0: 'cm_core@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: cm_core@0: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: cm_core@0: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0: failed to match any schema with compatible: ['ti,dra7-cm-core', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@200: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: clock-apll-pcie-in-clk-mux-7@4ae06118: reg: [[540], [4]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,mux-clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@21c: failed to match any schema with compatible: ['ti,dra7-apll-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: clock-optfclk-pciephy-div-8@4a00821c: ti,max-div: False schema does not allow 2
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@140: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@180: failed to match any schema with compatible: ['ti,omap4-dpll-j-type-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-clkout2-8@6b0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-l3init-960m-gfclk-8@6c0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy1-always-on-clk32k-8@640: failed to match any schema with compatible: ['ti,gate-clock']
--
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760/clock@0: failed to match any schema with compatible: ['ti,clkctrl']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: cm_core@0: $nodename:0: 'cm_core@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: cm_core@0: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: cm_core@0: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0: failed to match any schema with compatible: ['ti,dra7-cm-core', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@200: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: clock-apll-pcie-in-clk-mux-7@4ae06118: reg: [[540], [4]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,mux-clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@21c: failed to match any schema with compatible: ['ti,dra7-apll-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: clock-optfclk-pciephy-div-8@4a00821c: ti,max-div: False schema does not allow 2
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@140: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@180: failed to match any schema with compatible: ['ti,omap4-dpll-j-type-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-clkout2-8@6b0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-l3init-960m-gfclk-8@6c0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy1-always-on-clk32k-8@640: failed to match any schema with compatible: ['ti,gate-clock']
--
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760/clock@0: failed to match any schema with compatible: ['ti,clkctrl']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: cm_core@0: $nodename:0: 'cm_core@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: cm_core@0: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: cm_core@0: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0: failed to match any schema with compatible: ['ti,dra7-cm-core', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@200: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
>> arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: clock-apll-pcie-in-clk-mux-7@4ae06118: reg: [[540], [4]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,mux-clock.yaml#
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@21c: failed to match any schema with compatible: ['ti,dra7-apll-clock']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: clock-optfclk-pciephy-div-8@4a00821c: ti,max-div: False schema does not allow 2
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@140: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@180: failed to match any schema with compatible: ['ti,omap4-dpll-j-type-clock']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-clkout2-8@6b0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-l3init-960m-gfclk-8@6c0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy1-always-on-clk32k-8@640: failed to match any schema with compatible: ['ti,gate-clock']
--
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760/clock@0: failed to match any schema with compatible: ['ti,clkctrl']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: cm_core@0: $nodename:0: 'cm_core@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: cm_core@0: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: cm_core@0: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0: failed to match any schema with compatible: ['ti,dra7-cm-core', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@200: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
>> arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: clock-apll-pcie-in-clk-mux-7@4ae06118: reg: [[540], [4]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,mux-clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@21c: failed to match any schema with compatible: ['ti,dra7-apll-clock']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: clock-optfclk-pciephy-div-8@4a00821c: ti,max-div: False schema does not allow 2
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@140: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@180: failed to match any schema with compatible: ['ti,omap4-dpll-j-type-clock']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-clkout2-8@6b0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-l3init-960m-gfclk-8@6c0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy1-always-on-clk32k-8@640: failed to match any schema with compatible: ['ti,gate-clock']
--
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760/clock@0: failed to match any schema with compatible: ['ti,clkctrl']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: cm_core@0: $nodename:0: 'cm_core@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: cm_core@0: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: cm_core@0: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0: failed to match any schema with compatible: ['ti,dra7-cm-core', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@200: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
>> arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: clock-apll-pcie-in-clk-mux-7@4ae06118: reg: [[540], [4]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,mux-clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@21c: failed to match any schema with compatible: ['ti,dra7-apll-clock']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: clock-optfclk-pciephy-div-8@4a00821c: ti,max-div: False schema does not allow 2
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@140: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@180: failed to match any schema with compatible: ['ti,omap4-dpll-j-type-clock']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-clkout2-8@6b0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-l3init-960m-gfclk-8@6c0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy1-always-on-clk32k-8@640: failed to match any schema with compatible: ['ti,gate-clock']
--
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760/clock@0: failed to match any schema with compatible: ['ti,clkctrl']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: cm_core@0: $nodename:0: 'cm_core@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: cm_core@0: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: cm_core@0: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0: failed to match any schema with compatible: ['ti,dra7-cm-core', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@200: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
>> arch/arm/boot/dts/ti/omap/am574x-idk.dtb: clock-apll-pcie-in-clk-mux-7@4ae06118: reg: [[540], [4]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,mux-clock.yaml#
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@21c: failed to match any schema with compatible: ['ti,dra7-apll-clock']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: clock-optfclk-pciephy-div-8@4a00821c: ti,max-div: False schema does not allow 2
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@140: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@180: failed to match any schema with compatible: ['ti,omap4-dpll-j-type-clock']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-clkout2-8@6b0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-l3init-960m-gfclk-8@6c0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy1-always-on-clk32k-8@640: failed to match any schema with compatible: ['ti,gate-clock']
--
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760/clock@0: failed to match any schema with compatible: ['ti,clkctrl']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: cm_core@0: $nodename:0: 'cm_core@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: cm_core@0: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: cm_core@0: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0: failed to match any schema with compatible: ['ti,dra7-cm-core', 'simple-bus']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@200: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
>> arch/arm/boot/dts/ti/omap/dra7-evm.dtb: clock-apll-pcie-in-clk-mux-7@4ae06118: reg: [[540], [4]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,mux-clock.yaml#
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@21c: failed to match any schema with compatible: ['ti,dra7-apll-clock']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: clock-optfclk-pciephy-div-8@4a00821c: ti,max-div: False schema does not allow 2
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@140: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@180: failed to match any schema with compatible: ['ti,omap4-dpll-j-type-clock']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-clkout2-8@6b0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-l3init-960m-gfclk-8@6c0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy1-always-on-clk32k-8@640: failed to match any schema with compatible: ['ti,gate-clock']
--
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760/clock@0: failed to match any schema with compatible: ['ti,clkctrl']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: cm_core@0: $nodename:0: 'cm_core@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: cm_core@0: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: cm_core@0: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0: failed to match any schema with compatible: ['ti,dra7-cm-core', 'simple-bus']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@200: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
>> arch/arm/boot/dts/ti/omap/dra72-evm.dtb: clock-apll-pcie-in-clk-mux-7@4ae06118: reg: [[540], [4]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,mux-clock.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@21c: failed to match any schema with compatible: ['ti,dra7-apll-clock']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: clock-optfclk-pciephy-div-8@4a00821c: ti,max-div: False schema does not allow 2
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@140: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@180: failed to match any schema with compatible: ['ti,omap4-dpll-j-type-clock']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-clkout2-8@6b0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-l3init-960m-gfclk-8@6c0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy1-always-on-clk32k-8@640: failed to match any schema with compatible: ['ti,gate-clock']
--
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760/clock@0: failed to match any schema with compatible: ['ti,clkctrl']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: cm_core@0: $nodename:0: 'cm_core@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: cm_core@0: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: cm_core@0: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0: failed to match any schema with compatible: ['ti,dra7-cm-core', 'simple-bus']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@200: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
>> arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: clock-apll-pcie-in-clk-mux-7@4ae06118: reg: [[540], [4]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,mux-clock.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@21c: failed to match any schema with compatible: ['ti,dra7-apll-clock']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: clock-optfclk-pciephy-div-8@4a00821c: ti,max-div: False schema does not allow 2
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@140: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@180: failed to match any schema with compatible: ['ti,omap4-dpll-j-type-clock']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-clkout2-8@6b0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-l3init-960m-gfclk-8@6c0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy1-always-on-clk32k-8@640: failed to match any schema with compatible: ['ti,gate-clock']
--
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760/clock@0: failed to match any schema with compatible: ['ti,clkctrl']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: cm_core@0: $nodename:0: 'cm_core@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: cm_core@0: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: cm_core@0: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0: failed to match any schema with compatible: ['ti,dra7-cm-core', 'simple-bus']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@200: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
>> arch/arm/boot/dts/ti/omap/dra71-evm.dtb: clock-apll-pcie-in-clk-mux-7@4ae06118: reg: [[540], [4]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,mux-clock.yaml#
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@21c: failed to match any schema with compatible: ['ti,dra7-apll-clock']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: clock-optfclk-pciephy-div-8@4a00821c: ti,max-div: False schema does not allow 2
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@140: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@180: failed to match any schema with compatible: ['ti,omap4-dpll-j-type-clock']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-clkout2-8@6b0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-l3init-960m-gfclk-8@6c0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy1-always-on-clk32k-8@640: failed to match any schema with compatible: ['ti,gate-clock']
--
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760/clock@0: failed to match any schema with compatible: ['ti,clkctrl']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: cm_core@0: $nodename:0: 'cm_core@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: cm_core@0: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: cm_core@0: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0: failed to match any schema with compatible: ['ti,dra7-cm-core', 'simple-bus']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@200: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
>> arch/arm/boot/dts/ti/omap/dra76-evm.dtb: clock-apll-pcie-in-clk-mux-7@4ae06118: reg: [[540], [4]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,mux-clock.yaml#
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@21c: failed to match any schema with compatible: ['ti,dra7-apll-clock']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: clock-optfclk-pciephy-div-8@4a00821c: ti,max-div: False schema does not allow 2
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@140: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@180: failed to match any schema with compatible: ['ti,omap4-dpll-j-type-clock']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-clkout2-8@6b0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-l3init-960m-gfclk-8@6c0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy1-always-on-clk32k-8@640: failed to match any schema with compatible: ['ti,gate-clock']
--
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760/clock@0: failed to match any schema with compatible: ['ti,clkctrl']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: cm_core@0: $nodename:0: 'cm_core@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: cm_core@0: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: cm_core@0: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0: failed to match any schema with compatible: ['ti,dra7-cm-core', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@200: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
>> arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: clock-apll-pcie-in-clk-mux-7@4ae06118: reg: [[540], [4]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,mux-clock.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@21c: failed to match any schema with compatible: ['ti,dra7-apll-clock']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: clock-optfclk-pciephy-div-8@4a00821c: ti,max-div: False schema does not allow 2
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@140: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@180: failed to match any schema with compatible: ['ti,omap4-dpll-j-type-clock']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-clkout2-8@6b0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-l3init-960m-gfclk-8@6c0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am571x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy1-always-on-clk32k-8@640: failed to match any schema with compatible: ['ti,gate-clock']
--
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760/clock@0: failed to match any schema with compatible: ['ti,clkctrl']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: cm_core@0: $nodename:0: 'cm_core@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: cm_core@0: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: cm_core@0: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0: failed to match any schema with compatible: ['ti,dra7-cm-core', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@200: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
>> arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: clock-apll-pcie-in-clk-mux-7@4ae06118: reg: [[540], [4]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,mux-clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@21c: failed to match any schema with compatible: ['ti,dra7-apll-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: clock-optfclk-pciephy-div-8@4a00821c: ti,max-div: False schema does not allow 2
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@140: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@180: failed to match any schema with compatible: ['ti,omap4-dpll-j-type-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-clkout2-8@6b0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-l3init-960m-gfclk-8@6c0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy1-always-on-clk32k-8@640: failed to match any schema with compatible: ['ti,gate-clock']
--
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760/clock@0: failed to match any schema with compatible: ['ti,clkctrl']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: cm_core@0: $nodename:0: 'cm_core@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: cm_core@0: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: cm_core@0: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0: failed to match any schema with compatible: ['ti,dra7-cm-core', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@200: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
>> arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: clock-apll-pcie-in-clk-mux-7@4ae06118: reg: [[540], [4]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,mux-clock.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@21c: failed to match any schema with compatible: ['ti,dra7-apll-clock']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: clock-optfclk-pciephy-div-8@4a00821c: ti,max-div: False schema does not allow 2
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@140: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@180: failed to match any schema with compatible: ['ti,omap4-dpll-j-type-clock']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-clkout2-8@6b0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-l3init-960m-gfclk-8@6c0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am572x-idk-overlays.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy1-always-on-clk32k-8@640: failed to match any schema with compatible: ['ti,gate-clock']
--
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@5000/cm_core_aon@0/clock@760/clock@0: failed to match any schema with compatible: ['ti,clkctrl']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: cm_core@0: $nodename:0: 'cm_core@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: cm_core@0: clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: cm_core@0: clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0: failed to match any schema with compatible: ['ti,dra7-cm-core', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@200: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
>> arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: clock-apll-pcie-in-clk-mux-7@4ae06118: reg: [[540], [4]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,mux-clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@21c: failed to match any schema with compatible: ['ti,dra7-apll-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: clock-optfclk-pciephy-div-8@4a00821c: ti,max-div: False schema does not allow 2
   	from schema $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@140: failed to match any schema with compatible: ['ti,omap4-dpll-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock@180: failed to match any schema with compatible: ['ti,omap4-dpll-j-type-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-dpll-per-x2: failed to match any schema with compatible: ['ti,omap4-dpll-x2-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-clkout2-8@6b0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-l3init-960m-gfclk-8@6c0: failed to match any schema with compatible: ['ti,gate-clock']
   arch/arm/boot/dts/ti/omap/am57xx-evm-reva3.dtb: /ocp/interconnect@4a000000/segment@0/target-module@8000/cm_core@0/clocks/clock-usb-phy1-always-on-clk32k-8@640: failed to match any schema with compatible: ['ti,gate-clock']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
