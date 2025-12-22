Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F9D31159C
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Dec 2025 22:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766443170; cv=none; b=Cx0FAaaA/Jci1BO0r1zn/C+qIX2FVETso3SHpQ65Bm1OTF7YjxA16Vy3E5EEVp0To8b3qDRtC8SrtG3ccZH58qfD2MhzTEX05lVf5MrfpMrJ49aNpFFTc8Gr0te8YLFOweqH4lZjNhwhSsmYewZ2KnXGvJEnivKvqz5qE+5Ydio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766443170; c=relaxed/simple;
	bh=hLFEqqr/enUoJaTUlSEBiKrR7Sl+td9ZM7lNo1dew+8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pnbO+Hi25ddLj3SYUALIF3K3N0qIKFC5IUBcBwJ22SR/8q6ieiLNGEOexx+UcQH92SinS5ZWRb7kcFdYt8PBnJuzqznvKD+TMx6J2b+uwQ+vtDSZjUD2BS6T2lr1YT3MyABe1TXzwLuPDkqnAapIdEbC8oSp3SMC/XnC4RKu2JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RpSko6F4; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RpSko6F4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766443168; x=1797979168;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hLFEqqr/enUoJaTUlSEBiKrR7Sl+td9ZM7lNo1dew+8=;
  b=RpSko6F4K/fXl3FHngzmLqbqwybB6j6LavfmVMOnRBzAn+8G4sudo49f
   SOlt4/JectpnC28466uCcR/jvS88SHtPTrKFpRMdYH9wJb67cLgWD7TRE
   MIP3hx9hIpM5ZIi9uCvl1FRiJE6P3fre9jzaCXVexwe1PS+Dtag2BEgTU
   uxITY80qPlnQOwb2Rg14oZQg6NdxdpG9k08Vew7OPlz+AbhWeXsQHd6JE
   AgT6SDz+vV6brABTkSRUdEOSaVyqUd1HAUowuo7SnX/W92SkdwG7GOywu
   2gySmBSsXQLEcoto5Sow6naWpS1aBLOtWW06r2Q6ht2jcuhCCmMalTZXP
   Q==;
X-CSE-ConnectionGUID: DfVMSyq1RBykKEw0FutYXQ==
X-CSE-MsgGUID: sFE2zDrbQZ2xaNjwzfmSOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68340707"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="68340707"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 14:39:27 -0800
X-CSE-ConnectionGUID: xjEQ0xe1RKKay7GAR93hxg==
X-CSE-MsgGUID: mxZejDkqQI6gmVIojZghgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="200125772"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 22 Dec 2025 14:39:26 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXoYm-000000005e4-1hsT;
	Mon, 22 Dec 2025 22:39:24 +0000
Date: Mon, 22 Dec 2025 23:39:15 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: arm: vexpress-config: Update clock and
 regulator node names
Message-ID: <202512222312.Twb9vQqw-lkp@intel.com>
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
In-Reply-To: <20251215212914.3323741-1-robh@kernel.org>
References: <20251215212914.3323741-1-robh@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk/for-next krzk-mem-ctrl/for-next krzk-dt/for-next linus/master v6.16-rc1]
[cannot apply to next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/dt-bindings-arm-vexpress-config-Update-clock-and-regulator-node-names/20251216-053816
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20251215212914.3323741-1-robh%40kernel.org
patch subject: [PATCH] dt-bindings: arm: vexpress-config: Update clock and regulator node names
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm-randconfig-2052-20251217 (https://download.01.org/0day-ci/archive/20251222/202512222312.Twb9vQqw-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512222312.Twb9vQqw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512222312.Twb9vQqw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi:419.9-490.7: Warning (simple_bus_reg): /bus@8000000/motherboard-bus@8000000/iofpga-bus@300000000/mcc: missing or empty reg/ranges property
   arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi:366.13-376.9: Warning (graph_child_address): /bus@8000000/motherboard-bus@8000000/iofpga-bus@300000000/i2c@160000/dvi-transmitter@39/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dtb: / (arm,vexpress,v2p-ca5s): bus@8000000: Unevaluated properties are not allowed ('#interrupt-cells', 'interrupt-map', 'interrupt-map-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,vexpress-juno.yaml
   arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dtb: iofpga-bus@300000000 (simple-bus): mcc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dtb: mcc (arm,vexpress,config-bus): 'oscclk0', 'oscclk1', 'oscclk2', 'volt-vio' do not match any of the regexes: '^amp-.+$', '^clock-controller.*$', '^energy(-.+)?$', '^pinctrl-[0-9]+$', '^power-.+$', '^regulator-.+$', '^reset[0-9]*$', '^temp-.+$'
   	from schema $id: http://devicetree.org/schemas/arm/vexpress-config.yaml
   arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dtb: hdlcd@2a110000 (arm,hdlcd): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/arm,hdlcd.yaml
   arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dtb: /memory-controller@2a150000: failed to match any schema with compatible: ['arm,pl341', 'arm,primecell']
   arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dtb: timer@2c000200 (arm,cortex-a5-global-timer): compatible: ['arm,cortex-a5-global-timer', 'arm,cortex-a9-global-timer'] is too long
   	from schema $id: http://devicetree.org/schemas/timer/arm,global_timer.yaml
   arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dtb: interrupt-controller@2c001000 (arm,cortex-a5-gic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['arm,cortex-a5-gic', 'arm,cortex-a9-gic'] is too long
   	arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dtb: interrupt-controller@2c001000 (arm,cortex-a5-gic): compatible: 'oneOf' conditional failed, one must be fixed:
   		['arm,cortex-a5-gic', 'arm,cortex-a9-gic'] is too long
--
   arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi:419.9-490.7: Warning (simple_bus_reg): /bus@8000000/motherboard-bus@8000000/iofpga-bus@300000000/mcc: missing or empty reg/ranges property
   arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi:366.13-376.9: Warning (graph_child_address): /bus@8000000/motherboard-bus@8000000/iofpga-bus@300000000/i2c@160000/dvi-transmitter@39/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dtb: / (arm,vexpress,v2p-ca15,tc1): bus@8000000: Unevaluated properties are not allowed ('#interrupt-cells', 'interrupt-map', 'interrupt-map-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,vexpress-juno.yaml
   arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dtb: iofpga-bus@300000000 (simple-bus): mcc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dtb: mcc (arm,vexpress,config-bus): 'oscclk0', 'oscclk1', 'oscclk2', 'volt-vio' do not match any of the regexes: '^amp-.+$', '^clock-controller.*$', '^energy(-.+)?$', '^pinctrl-[0-9]+$', '^power-.+$', '^regulator-.+$', '^reset[0-9]*$', '^temp-.+$'
   	from schema $id: http://devicetree.org/schemas/arm/vexpress-config.yaml
   arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dtb: hdlcd@2b000000 (arm,hdlcd): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/arm,hdlcd.yaml
   arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dtb: /memory-controller@2b0a0000: failed to match any schema with compatible: ['arm,pl341', 'arm,primecell']
   arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dtb: wdt@2b060000 (arm,sp805): $nodename:0: 'wdt@2b060000' does not match '^(timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/arm,sp805.yaml
   arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dtb: interrupt-controller@2c001000 (arm,cortex-a15-gic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['arm,cortex-a15-gic', 'arm,cortex-a9-gic'] is too long
   	arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dtb: interrupt-controller@2c001000 (arm,cortex-a15-gic): compatible: 'oneOf' conditional failed, one must be fixed:
   		['arm,cortex-a15-gic', 'arm,cortex-a9-gic'] is too long
--
   arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi:419.9-490.7: Warning (simple_bus_reg): /bus@8000000/motherboard-bus@8000000/iofpga-bus@300000000/mcc: missing or empty reg/ranges property
   arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi:366.13-376.9: Warning (graph_child_address): /bus@8000000/motherboard-bus@8000000/iofpga-bus@300000000/i2c@160000/dvi-transmitter@39/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dtb: / (arm,vexpress,v2p-ca15_a7): bus@8000000: Unevaluated properties are not allowed ('#interrupt-cells', 'interrupt-map', 'interrupt-map-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,vexpress-juno.yaml
   arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dtb: iofpga-bus@300000000 (simple-bus): mcc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dtb: mcc (arm,vexpress,config-bus): 'oscclk0', 'oscclk1', 'oscclk2', 'volt-vio' do not match any of the regexes: '^amp-.+$', '^clock-controller.*$', '^energy(-.+)?$', '^pinctrl-[0-9]+$', '^power-.+$', '^regulator-.+$', '^reset[0-9]*$', '^temp-.+$'
   	from schema $id: http://devicetree.org/schemas/arm/vexpress-config.yaml
   arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dtb: wdt@2a490000 (arm,sp805): $nodename:0: 'wdt@2a490000' does not match '^(timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/arm,sp805.yaml
   arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dtb: hdlcd@2b000000 (arm,hdlcd): 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/arm,hdlcd.yaml
   arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dtb: /memory-controller@2b0a0000: failed to match any schema with compatible: ['arm,pl341', 'arm,primecell']
   arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dtb: interrupt-controller@2c001000 (arm,cortex-a15-gic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['arm,cortex-a15-gic', 'arm,cortex-a9-gic'] is too long
   	arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dtb: interrupt-controller@2c001000 (arm,cortex-a15-gic): compatible: 'oneOf' conditional failed, one must be fixed:
   		['arm,cortex-a15-gic', 'arm,cortex-a9-gic'] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
