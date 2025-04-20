Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5F0130A54
	for <oe-kbuild@lists.linux.dev>; Sun, 20 Apr 2025 13:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745156032; cv=none; b=Pla7jBcwhYMxJjcCmtKuGDkYY2i53c4RRqcHBHJv5jj1QTaEanuU3uU2HC0prYxx/YA9GpJzaemNaRaU8bGwKhLMpZtfvCoN/Ey2V/KC5t0lPDJAMn0lHkmsOTwOf5OtMua60qFo9CvqPSLeMVUvw4rQOsbEFkqi08cdy3ftiKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745156032; c=relaxed/simple;
	bh=dCiFqK4IWPEi731VKY60bZu5YrihaJDKd0ncj3iRkTE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K5lKHu9NByqE9jxu5ua8KCOTCzbi5/LUSa9EzE141QvQTsz7yBNbXEtC0x/PIIbm2JJQsYMbICkaPaxHdavUAiiWsjUplOvYWLZjaqGF671tgObeljH1qYmYxxxOMHrB5HFslhYKq+K0ek7kQTAX09io59SHrwxTuBarPjyuXKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ln7afESz; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ln7afESz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745156029; x=1776692029;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dCiFqK4IWPEi731VKY60bZu5YrihaJDKd0ncj3iRkTE=;
  b=ln7afESzYzAuhHY4GRvpKIUXRjQHTuz4FPN/Fq/1hOskvuT2RwoH2Kwf
   jCdBdzwF8YGJSZnSRuI0LNu9aM+JACzseVtNyOF8+6mgUzr/C6E4kVBZe
   OfQ9DuNEhFEM1D5oMLsi+fLP4YtqJr+AhsueL3AXSW6etntj/vaQU34vI
   0uYHHxrWzbr6LW6SsAWg4hC4Tc+Xy2zrOVsVquKAcakvdxwxqvRGWFT/L
   6Procbn1e367OmLy4RCNuh2S4BRKAfmvI49c8dOa3QvUEiknabgFix4HX
   gNtFmXw6xCmU48Q2iiNwZlqoLiFq6SjDqvwDN6IjIOnI5kUVynAQDaAEB
   A==;
X-CSE-ConnectionGUID: MDPYff04RLybIeb1/JXaaA==
X-CSE-MsgGUID: y+jjG2S2SzW1mDVFLw8xZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="69203928"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="69203928"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 06:33:48 -0700
X-CSE-ConnectionGUID: wTm9fpH2SgWlGKyC9q2QMg==
X-CSE-MsgGUID: jmk2qPZyTtuaDyglZnmItA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="132074327"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Apr 2025 06:33:47 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6Uno-0004f7-24;
	Sun, 20 Apr 2025 13:33:44 +0000
Date: Sun, 20 Apr 2025 21:33:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/4] powerpc: 86xx: Rename wdt@ nodes to watchdog@
Message-ID: <202504202102.vb05OYPG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250418-watchdog-v1-3-987ff2046272@posteo.net>
References: <20250418-watchdog-v1-3-987ff2046272@posteo.net>
TO: "J. Neuschäfer via B4 Relay" <devnull+j.ne.posteo.net@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Madhavan Srinivasan <maddy@linux.ibm.com>
TO: Michael Ellerman <mpe@ellerman.id.au>
TO: Nicholas Piggin <npiggin@gmail.com>
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
TO: Naveen N Rao <naveen@kernel.org>
CC: devicetree@vger.kernel.org
CC: linuxppc-dev@lists.ozlabs.org
CC: linux-kernel@vger.kernel.org
CC: "J. Neuschäfer" <j.ne@posteo.net>

Hi Neuschäfer,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0af2f6be1b4281385b618cb86ad946eded089ac8]

url:    https://github.com/intel-lab-lkp/linux/commits/J-Neusch-fer-via-B4-Relay/powerpc-512x-Rename-wdt-node-to-watchdog/20250419-033055
base:   0af2f6be1b4281385b618cb86ad946eded089ac8
patch link:    https://lore.kernel.org/r/20250418-watchdog-v1-3-987ff2046272%40posteo.net
patch subject: [PATCH 3/4] powerpc: 86xx: Rename wdt@ nodes to watchdog@
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: powerpc-randconfig-052-20250420 (https://download.01.org/0day-ci/archive/20250420/202504202102.vb05OYPG-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev19+g53ef030
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504202102.vb05OYPG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504202102.vb05OYPG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dts:211.22-213.4: Warning (pci_bridge): /pcie@fef09000: missing ranges for PCI bridge (or not a bridge)
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:129.9-143.4: Warning (pci_bridge): /pcie@fef09000/pcie@0: missing ranges for PCI bridge (or not a bridge)
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: Warning (unit_address_format): Failed prerequisite 'pci_bridge'
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: Warning (pci_device_reg): Failed prerequisite 'pci_bridge'
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: Warning (pci_device_bus_num): Failed prerequisite 'pci_bridge'
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dts:56.13-72.5: Warning (simple_bus_reg): /localbus@fef05000/flash@1,0: simple-bus unit address format error, expected "100000000"
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dts:74.13-78.5: Warning (simple_bus_reg): /localbus@fef05000/nvram@3,0: simple-bus unit address format error, expected "300000000"
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dts:80.12-83.5: Warning (simple_bus_reg): /localbus@fef05000/fpga@4,0: simple-bus unit address format error, expected "400000000"
>> arch/powerpc/boot/dts/fsl/gef_ppc9a.dts:85.19-91.5: Warning (simple_bus_reg): /localbus@fef05000/watchdog@4,2000: simple-bus unit address format error, expected "400002000"
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dts:101.23-108.5: Warning (simple_bus_reg): /localbus@fef05000/pic@4,4000: simple-bus unit address format error, expected "400004000"
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dts:109.26-114.5: Warning (simple_bus_reg): /localbus@fef05000/gpio@7,14000: simple-bus unit address format error, expected "700014000"
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:44.16-46.4: Warning (simple_bus_reg): /soc@fef00000/dma-channel@0: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:47.17-49.4: Warning (simple_bus_reg): /soc@fef00000/dma-channel@80: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:50.18-52.4: Warning (simple_bus_reg): /soc@fef00000/dma-channel@100: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:53.18-55.4: Warning (simple_bus_reg): /soc@fef00000/dma-channel@180: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:22.12-26.4: Warning (unique_unit_address_if_enabled): /soc@fef00000/mcm-law@0: duplicate unit-address (also used in node /soc@fef00000/dma-channel@0)
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dts:195.22-209.4: Warning (interrupt_provider): /pcie@fef08000: '#interrupt-cells' found, but node is not an interrupt provider
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dts:211.22-213.4: Warning (interrupt_provider): /pcie@fef09000: '#interrupt-cells' found, but node is not an interrupt provider
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: localbus@fef05000 (fsl,mpc8641-localbus): nvram@3,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: localbus@fef05000 (fsl,mpc8641-localbus): watchdog@4,2000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: localbus@fef05000 (fsl,mpc8641-localbus): pic@4,4000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /localbus@fef05000: failed to match any schema with compatible: ['fsl,mpc8641-localbus', 'simple-bus']
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /localbus@fef05000/nvram@3,0: failed to match any schema with compatible: ['simtek,stk14ca8']
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /localbus@fef05000/fpga@4,0: failed to match any schema with compatible: ['gef,ppc9a-fpga-regs']
>> arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /localbus@fef05000/watchdog@4,2000: failed to match any schema with compatible: ['gef,ppc9a-fpga-wdt', 'gef,fpga-wdt-1.00', 'gef,fpga-wdt']
>> arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /localbus@fef05000/watchdog@4,2000: failed to match any schema with compatible: ['gef,ppc9a-fpga-wdt', 'gef,fpga-wdt-1.00', 'gef,fpga-wdt']
>> arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /localbus@fef05000/watchdog@4,2000: failed to match any schema with compatible: ['gef,ppc9a-fpga-wdt', 'gef,fpga-wdt-1.00', 'gef,fpga-wdt']
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /localbus@fef05000/pic@4,4000: failed to match any schema with compatible: ['gef,ppc9a-fpga-pic', 'gef,fpga-pic-1.00']
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /localbus@fef05000/pic@4,4000: failed to match any schema with compatible: ['gef,ppc9a-fpga-pic', 'gef,fpga-pic-1.00']
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /localbus@fef05000/gpio@7,14000: failed to match any schema with compatible: ['gef,ppc9a-gpio', 'gef,sbc610-gpio']
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /localbus@fef05000/gpio@7,14000: failed to match any schema with compatible: ['gef,ppc9a-gpio', 'gef,sbc610-gpio']
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: soc@fef00000 (fsl,mpc8641-soc): dma-channel@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: soc@fef00000 (fsl,mpc8641-soc): dma-channel@80: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
--
   arch/powerpc/boot/dts/fsl/gef_sbc310.dts:23.9-26.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:44.16-46.4: Warning (unit_address_vs_reg): /soc@fef00000/dma-channel@0: node has a unit name, but no reg or ranges property
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:47.17-49.4: Warning (unit_address_vs_reg): /soc@fef00000/dma-channel@80: node has a unit name, but no reg or ranges property
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:50.18-52.4: Warning (unit_address_vs_reg): /soc@fef00000/dma-channel@100: node has a unit name, but no reg or ranges property
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:53.18-55.4: Warning (unit_address_vs_reg): /soc@fef00000/dma-channel@180: node has a unit name, but no reg or ranges property
   arch/powerpc/boot/dts/fsl/gef_sbc310.dts:53.13-69.5: Warning (simple_bus_reg): /localbus@fef05000/flash@1,0: simple-bus unit address format error, expected "100000000"
   arch/powerpc/boot/dts/fsl/gef_sbc310.dts:71.13-75.5: Warning (simple_bus_reg): /localbus@fef05000/nvram@3,0: simple-bus unit address format error, expected "300000000"
   arch/powerpc/boot/dts/fsl/gef_sbc310.dts:77.12-80.5: Warning (simple_bus_reg): /localbus@fef05000/fpga@4,0: simple-bus unit address format error, expected "400000000"
>> arch/powerpc/boot/dts/fsl/gef_sbc310.dts:82.19-88.5: Warning (simple_bus_reg): /localbus@fef05000/watchdog@4,2000: simple-bus unit address format error, expected "400002000"
   arch/powerpc/boot/dts/fsl/gef_sbc310.dts:98.23-105.5: Warning (simple_bus_reg): /localbus@fef05000/pic@4,4000: simple-bus unit address format error, expected "400004000"
   arch/powerpc/boot/dts/fsl/gef_sbc310.dts:106.25-111.5: Warning (simple_bus_reg): /localbus@fef05000/gpio@4,8000: simple-bus unit address format error, expected "400008000"
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:44.16-46.4: Warning (simple_bus_reg): /soc@fef00000/dma-channel@0: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:47.17-49.4: Warning (simple_bus_reg): /soc@fef00000/dma-channel@80: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:50.18-52.4: Warning (simple_bus_reg): /soc@fef00000/dma-channel@100: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:53.18-55.4: Warning (simple_bus_reg): /soc@fef00000/dma-channel@180: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:22.12-26.4: Warning (unique_unit_address_if_enabled): /soc@fef00000/mcm-law@0: duplicate unit-address (also used in node /soc@fef00000/dma-channel@0)
   arch/powerpc/boot/dts/fsl/gef_sbc310.dts:217.22-231.4: Warning (interrupt_provider): /pcie@fef09000: '#interrupt-cells' found, but node is not an interrupt provider
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: localbus@fef05000 (fsl,mpc8641-localbus): flash@1,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: localbus@fef05000 (fsl,mpc8641-localbus): nvram@3,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: localbus@fef05000 (fsl,mpc8641-localbus): watchdog@4,2000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /localbus@fef05000: failed to match any schema with compatible: ['fsl,mpc8641-localbus', 'simple-bus']
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /localbus@fef05000/nvram@3,0: failed to match any schema with compatible: ['simtek,stk14ca8']
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /localbus@fef05000/fpga@4,0: failed to match any schema with compatible: ['gef,fpga-regs']
>> arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /localbus@fef05000/watchdog@4,2000: failed to match any schema with compatible: ['gef,sbc310-fpga-wdt', 'gef,fpga-wdt-1.00', 'gef,fpga-wdt']
>> arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /localbus@fef05000/watchdog@4,2000: failed to match any schema with compatible: ['gef,sbc310-fpga-wdt', 'gef,fpga-wdt-1.00', 'gef,fpga-wdt']
>> arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /localbus@fef05000/watchdog@4,2000: failed to match any schema with compatible: ['gef,sbc310-fpga-wdt', 'gef,fpga-wdt-1.00', 'gef,fpga-wdt']
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /localbus@fef05000/pic@4,4000: failed to match any schema with compatible: ['gef,sbc310-fpga-pic', 'gef,fpga-pic']
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /localbus@fef05000/pic@4,4000: failed to match any schema with compatible: ['gef,sbc310-fpga-pic', 'gef,fpga-pic']
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /localbus@fef05000/gpio@4,8000: failed to match any schema with compatible: ['gef,sbc310-gpio']
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: soc@fef00000 (fsl,mpc8641-soc): dma-channel@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: soc@fef00000 (fsl,mpc8641-soc): dma-channel@80: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
--
   arch/powerpc/boot/dts/fsl/gef_sbc610.dts:209.22-211.4: Warning (pci_bridge): /pcie@fef09000: missing ranges for PCI bridge (or not a bridge)
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:129.9-143.4: Warning (pci_bridge): /pcie@fef09000/pcie@0: missing ranges for PCI bridge (or not a bridge)
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: Warning (unit_address_format): Failed prerequisite 'pci_bridge'
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: Warning (pci_device_reg): Failed prerequisite 'pci_bridge'
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: Warning (pci_device_bus_num): Failed prerequisite 'pci_bridge'
   arch/powerpc/boot/dts/fsl/gef_sbc610.dts:56.13-72.5: Warning (simple_bus_reg): /localbus@fef05000/flash@1,0: simple-bus unit address format error, expected "100000000"
   arch/powerpc/boot/dts/fsl/gef_sbc610.dts:74.13-78.5: Warning (simple_bus_reg): /localbus@fef05000/nvram@3,0: simple-bus unit address format error, expected "300000000"
   arch/powerpc/boot/dts/fsl/gef_sbc610.dts:80.12-83.5: Warning (simple_bus_reg): /localbus@fef05000/fpga@4,0: simple-bus unit address format error, expected "400000000"
>> arch/powerpc/boot/dts/fsl/gef_sbc610.dts:85.19-90.5: Warning (simple_bus_reg): /localbus@fef05000/watchdog@4,2000: simple-bus unit address format error, expected "400002000"
   arch/powerpc/boot/dts/fsl/gef_sbc610.dts:99.23-106.5: Warning (simple_bus_reg): /localbus@fef05000/pic@4,4000: simple-bus unit address format error, expected "400004000"
   arch/powerpc/boot/dts/fsl/gef_sbc610.dts:107.26-112.5: Warning (simple_bus_reg): /localbus@fef05000/gpio@7,14000: simple-bus unit address format error, expected "700014000"
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:44.16-46.4: Warning (simple_bus_reg): /soc@fef00000/dma-channel@0: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:47.17-49.4: Warning (simple_bus_reg): /soc@fef00000/dma-channel@80: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:50.18-52.4: Warning (simple_bus_reg): /soc@fef00000/dma-channel@100: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:53.18-55.4: Warning (simple_bus_reg): /soc@fef00000/dma-channel@180: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:22.12-26.4: Warning (unique_unit_address_if_enabled): /soc@fef00000/mcm-law@0: duplicate unit-address (also used in node /soc@fef00000/dma-channel@0)
   arch/powerpc/boot/dts/fsl/gef_sbc610.dts:193.22-207.4: Warning (interrupt_provider): /pcie@fef08000: '#interrupt-cells' found, but node is not an interrupt provider
   arch/powerpc/boot/dts/fsl/gef_sbc610.dts:209.22-211.4: Warning (interrupt_provider): /pcie@fef09000: '#interrupt-cells' found, but node is not an interrupt provider
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: localbus@fef05000 (fsl,mpc8641-localbus): nvram@3,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: localbus@fef05000 (fsl,mpc8641-localbus): gpio@7,14000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: localbus@fef05000 (fsl,mpc8641-localbus): pic@4,4000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: /localbus@fef05000: failed to match any schema with compatible: ['fsl,mpc8641-localbus', 'simple-bus']
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: /localbus@fef05000/nvram@3,0: failed to match any schema with compatible: ['simtek,stk14ca8']
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: /localbus@fef05000/fpga@4,0: failed to match any schema with compatible: ['gef,fpga-regs']
>> arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: /localbus@fef05000/watchdog@4,2000: failed to match any schema with compatible: ['gef,fpga-wdt']
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: /localbus@fef05000/pic@4,4000: failed to match any schema with compatible: ['gef,fpga-pic']
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: /localbus@fef05000/gpio@7,14000: failed to match any schema with compatible: ['gef,sbc610-gpio']
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: soc@fef00000 (fsl,mpc8641-soc): dma-channel@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: soc@fef00000 (fsl,mpc8641-soc): dma-channel@80: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#

vim +/400002000 +85 arch/powerpc/boot/dts/fsl/gef_ppc9a.dts

740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   18  
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   19  / {
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   20  	model = "GEF_PPC9A";
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   21  	compatible = "gef,ppc9a";
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   22  
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   23  	memory {
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   24  		device_type = "memory";
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   25  		reg = <0x0 0x40000000>;	// set by uboot
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   26  	};
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   27  
334479d1ccc2dd8 arch/powerpc/boot/dts/fsl/gef_ppc9a.dts Alessio Igor Bogani 2016-03-04   28  	lbc: localbus@fef05000 {
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   29  		reg = <0xfef05000 0x1000>;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   30  
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   31  		ranges = <0 0 0xff000000 0x01000000	// 16MB Boot flash
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   32  			  1 0 0xe8000000 0x08000000	// Paged Flash 0
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   33  			  2 0 0xe0000000 0x08000000	// Paged Flash 1
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   34  			  3 0 0xfc100000 0x00020000	// NVRAM
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   35  			  4 0 0xfc000000 0x00008000	// FPGA
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   36  			  5 0 0xfc008000 0x00008000	// AFIX FPGA
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   37  			  6 0 0xfd000000 0x00800000	// IO FPGA (8-bit)
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   38  			  7 0 0xfd800000 0x00800000>;	// IO FPGA (32-bit)
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   39  
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   40  		/* flash@0,0 is a mirror of part of the memory in flash@1,0
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   41  		flash@0,0 {
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   42  			compatible = "gef,ppc9a-firmware-mirror", "cfi-flash";
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   43  			reg = <0x0 0x0 0x1000000>;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   44  			bank-width = <4>;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   45  			device-width = <2>;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   46  			#address-cells = <1>;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   47  			#size-cells = <1>;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   48  			partition@0 {
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   49  				label = "firmware";
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   50  				reg = <0x0 0x1000000>;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   51  				read-only;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   52  			};
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   53  		};
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   54  		*/
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   55  
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   56  		flash@1,0 {
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   57  			compatible = "gef,ppc9a-paged-flash", "cfi-flash";
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   58  			reg = <0x1 0x0 0x8000000>;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   59  			bank-width = <4>;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   60  			device-width = <2>;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   61  			#address-cells = <1>;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   62  			#size-cells = <1>;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   63  			partition@0 {
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   64  				label = "user";
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   65  				reg = <0x0 0x7800000>;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   66  			};
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   67  			partition@7800000 {
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   68  				label = "firmware";
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   69  				reg = <0x7800000 0x800000>;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   70  				read-only;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   71  			};
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   72  		};
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   73  
3bc265627a0e163 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-07-02   74  		nvram@3,0 {
3bc265627a0e163 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-07-02   75  			device_type = "nvram";
3bc265627a0e163 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-07-02   76  			compatible = "simtek,stk14ca8";
3bc265627a0e163 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-07-02   77  			reg = <0x3 0x0 0x20000>;
3bc265627a0e163 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-07-02   78  		};
3bc265627a0e163 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-07-02   79  
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   80  		fpga@4,0 {
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   81  			compatible = "gef,ppc9a-fpga-regs";
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   82  			reg = <0x4 0x0 0x40>;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   83  		};
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   84  
13b11e7e43ab8ac arch/powerpc/boot/dts/fsl/gef_ppc9a.dts J. Neuschäfer       2025-04-18  @85  		watchdog@4,2000 {
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   86  			compatible = "gef,ppc9a-fpga-wdt", "gef,fpga-wdt-1.00",
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   87  				"gef,fpga-wdt";
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   88  			reg = <0x4 0x2000 0x8>;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   89  			interrupts = <0x1a 0x4>;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   90  			interrupt-parent = <&gef_pic>;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   91  		};
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   92  		/* Second watchdog available, driver currently supports one.
13b11e7e43ab8ac arch/powerpc/boot/dts/fsl/gef_ppc9a.dts J. Neuschäfer       2025-04-18   93  		watchdog@4,2010 {
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   94  			compatible = "gef,ppc9a-fpga-wdt", "gef,fpga-wdt-1.00",
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   95  				"gef,fpga-wdt";
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   96  			reg = <0x4 0x2010 0x8>;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   97  			interrupts = <0x1b 0x4>;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   98  			interrupt-parent = <&gef_pic>;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19   99  		};
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  100  		*/
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  101  		gef_pic: pic@4,4000 {
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  102  			#interrupt-cells = <1>;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  103  			interrupt-controller;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  104  			compatible = "gef,ppc9a-fpga-pic", "gef,fpga-pic-1.00";
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  105  			reg = <0x4 0x4000 0x20>;
595207b93fe43e6 arch/powerpc/boot/dts/fsl/gef_ppc9a.dts Alessio Igor Bogani 2016-03-04  106  			interrupts = <0x8 0x9 0 0>;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  107  
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  108  		};
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  109  		gef_gpio: gpio@7,14000 {
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  110  			#gpio-cells = <2>;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  111  			compatible = "gef,ppc9a-gpio", "gef,sbc610-gpio";
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  112  			reg = <0x7 0x14000 0x24>;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  113  			gpio-controller;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  114  		};
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  115  	};
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  116  
334479d1ccc2dd8 arch/powerpc/boot/dts/fsl/gef_ppc9a.dts Alessio Igor Bogani 2016-03-04  117  	soc: soc@fef00000 {
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  118  		ranges = <0x0 0xfef00000 0x00100000>;
da385780489db4f arch/powerpc/boot/dts/gef_ppc9a.dts     Kumar Gala          2009-04-27  119  
595207b93fe43e6 arch/powerpc/boot/dts/fsl/gef_ppc9a.dts Alessio Igor Bogani 2016-03-04  120  		i2c@3000 {
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  121  			hwmon@48 {
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  122  				compatible = "national,lm92";
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  123  				reg = <0x48>;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  124  			};
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  125  
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  126  			hwmon@4c {
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  127  				compatible = "adi,adt7461";
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  128  				reg = <0x4c>;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  129  			};
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  130  
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  131  			rtc@51 {
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  132  				compatible = "epson,rx8581";
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  133  				reg = <0x00000051>;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  134  			};
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  135  
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  136  			eti@6b {
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  137  				compatible = "dallas,ds1682";
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  138  				reg = <0x6b>;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  139  			};
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  140  		};
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  141  
d8bc55fb334e112 arch/powerpc/boot/dts/gef_ppc9a.dts     Anton Vorontsov     2009-03-19  142  		enet0: ethernet@24000 {
62f3de91e4cfb11 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2011-11-03  143  			tbi-handle = <&tbi0>;
d8bc55fb334e112 arch/powerpc/boot/dts/gef_ppc9a.dts     Anton Vorontsov     2009-03-19  144  			phy-handle = <&phy0>;
d8bc55fb334e112 arch/powerpc/boot/dts/gef_ppc9a.dts     Anton Vorontsov     2009-03-19  145  			phy-connection-type = "gmii";
334479d1ccc2dd8 arch/powerpc/boot/dts/fsl/gef_ppc9a.dts Alessio Igor Bogani 2016-03-04  146  		};
d8bc55fb334e112 arch/powerpc/boot/dts/gef_ppc9a.dts     Anton Vorontsov     2009-03-19  147  
334479d1ccc2dd8 arch/powerpc/boot/dts/fsl/gef_ppc9a.dts Alessio Igor Bogani 2016-03-04  148  		mdio@24520 {
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  149  			phy0: ethernet-phy@0 {
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  150  				interrupt-parent = <&gef_pic>;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  151  				interrupts = <0x9 0x4>;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  152  				reg = <1>;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  153  			};
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  154  			phy2: ethernet-phy@2 {
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  155  				interrupt-parent = <&gef_pic>;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  156  				interrupts = <0x8 0x4>;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  157  				reg = <3>;
62f3de91e4cfb11 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2011-11-03  158  			};
62f3de91e4cfb11 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2011-11-03  159  			tbi0: tbi-phy@11 {
62f3de91e4cfb11 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2011-11-03  160  				reg = <0x11>;
62f3de91e4cfb11 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2011-11-03  161  				device_type = "tbi-phy";
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  162  			};
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  163  		};
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  164  
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  165  		enet1: ethernet@26000 {
62f3de91e4cfb11 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2011-11-03  166  			tbi-handle = <&tbi2>;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  167  			phy-handle = <&phy2>;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  168  			phy-connection-type = "gmii";
334479d1ccc2dd8 arch/powerpc/boot/dts/fsl/gef_ppc9a.dts Alessio Igor Bogani 2016-03-04  169  		};
62f3de91e4cfb11 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2011-11-03  170  
334479d1ccc2dd8 arch/powerpc/boot/dts/fsl/gef_ppc9a.dts Alessio Igor Bogani 2016-03-04  171  		mdio@26520 {
62f3de91e4cfb11 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2011-11-03  172  			tbi2: tbi-phy@11 {
62f3de91e4cfb11 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2011-11-03  173  				reg = <0x11>;
62f3de91e4cfb11 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2011-11-03  174  				device_type = "tbi-phy";
62f3de91e4cfb11 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2011-11-03  175  			};
62f3de91e4cfb11 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2011-11-03  176  		};
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  177  
334479d1ccc2dd8 arch/powerpc/boot/dts/fsl/gef_ppc9a.dts Alessio Igor Bogani 2016-03-04  178  		enet2: ethernet@25000 {
334479d1ccc2dd8 arch/powerpc/boot/dts/fsl/gef_ppc9a.dts Alessio Igor Bogani 2016-03-04  179  			status = "disabled";
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  180  		};
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  181  
334479d1ccc2dd8 arch/powerpc/boot/dts/fsl/gef_ppc9a.dts Alessio Igor Bogani 2016-03-04  182  		mdio@25520 {
334479d1ccc2dd8 arch/powerpc/boot/dts/fsl/gef_ppc9a.dts Alessio Igor Bogani 2016-03-04  183  			status = "disabled";
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  184  		};
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  185  
334479d1ccc2dd8 arch/powerpc/boot/dts/fsl/gef_ppc9a.dts Alessio Igor Bogani 2016-03-04  186  		enet3: ethernet@27000 {
334479d1ccc2dd8 arch/powerpc/boot/dts/fsl/gef_ppc9a.dts Alessio Igor Bogani 2016-03-04  187  			status = "disabled";
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  188  		};
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  189  
334479d1ccc2dd8 arch/powerpc/boot/dts/fsl/gef_ppc9a.dts Alessio Igor Bogani 2016-03-04  190  		mdio@27520 {
334479d1ccc2dd8 arch/powerpc/boot/dts/fsl/gef_ppc9a.dts Alessio Igor Bogani 2016-03-04  191  			status = "disabled";
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  192  		};
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  193  	};
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  194  
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  195  	pci0: pcie@fef08000 {
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  196  		reg = <0xfef08000 0x1000>;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  197  		ranges = <0x02000000 0x0 0x80000000 0x80000000 0x0 0x40000000
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  198  			  0x01000000 0x0 0x00000000 0xfe000000 0x0 0x00400000>;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  199  
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  200  		pcie@0 {
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  201  			ranges = <0x02000000 0x0 0x80000000
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  202  				  0x02000000 0x0 0x80000000
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  203  				  0x0 0x40000000
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  204  
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  205  				  0x01000000 0x0 0x00000000
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  206  				  0x01000000 0x0 0x00000000
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  207  				  0x0 0x00400000>;
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  208  		};
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  209  	};
a66639d4eec5e03 arch/powerpc/boot/dts/fsl/gef_ppc9a.dts Alessio Igor Bogani 2016-04-20  210  
a66639d4eec5e03 arch/powerpc/boot/dts/fsl/gef_ppc9a.dts Alessio Igor Bogani 2016-04-20 @211  	pci1: pcie@fef09000 {
a66639d4eec5e03 arch/powerpc/boot/dts/fsl/gef_ppc9a.dts Alessio Igor Bogani 2016-04-20  212  		status = "disabled";
a66639d4eec5e03 arch/powerpc/boot/dts/fsl/gef_ppc9a.dts Alessio Igor Bogani 2016-04-20  213  	};
740d36ae6344f38 arch/powerpc/boot/dts/gef_ppc9a.dts     Martyn Welch        2009-03-19  214  };
334479d1ccc2dd8 arch/powerpc/boot/dts/fsl/gef_ppc9a.dts Alessio Igor Bogani 2016-03-04  215  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
