Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637AFB65C
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Mar 2025 01:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740878618; cv=none; b=WamtbxmPCpaJlQujY7ekzEsc6fE1B2SLvy7R26rwbiFbuvLOp2/7eElIDb34akWAkAh8GnMglMfVZYQRaDnDbE1hMIbepFZDcMdGfmnQGCmMDygnsZlGT6scrMfM3ThmzyW3U8tGRagvqcjyrWlRUaWzQF3hrjT/UYGe7Lm40fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740878618; c=relaxed/simple;
	bh=0tw/Oc0+ugNRWQwHuswzf5r9utXLg06ibX+5B1wjLVk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DMFEpYdgLzYdi5erd1hEdo1uiA81z+w550H08KfR0LBqALOcpkpywYjQFyK4kLX65OyGQiJK0sCjS4snNhwc0g+78465Bc06PWVyOLpvf1ujy66okjjjkI2H4bMRqx/4TEn6l2a8xdLYaq+EEyICMKD2+XNxKAbNdan/uS5MGRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dpdf46ji; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dpdf46ji"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740878616; x=1772414616;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0tw/Oc0+ugNRWQwHuswzf5r9utXLg06ibX+5B1wjLVk=;
  b=dpdf46ji+jsyzl5djDXW7xHKZ7HL6XxSfHZ1610wDeaozVZ0mmDxZvqb
   GiF7njf3Slm2kqew5AXkrklHLLvqVFrKpF12bryONnOytsD+fD3p0QwEY
   iL89bfsmzMq6FTYY5/93zlpcjTAX2OT9fQ45mB1jylZ4V6is8HhdjAhGU
   GwPoqi/LbMe+oADCufZ6iptCGeWSzPCX4M3zLwYwGmtqe+QPh9uCgshZm
   Em2Dcz3IP+WWLKeM4rdTzuCoajKyQ6gnsBXoKPDaQHZwcryVZDvgeQcRH
   uIsxGvLLZNwJowX+S4Os7M4NQ9Hx9C/hoh0io4zKqiId/YuOVWkAoOcPl
   A==;
X-CSE-ConnectionGUID: 5iFuIDXbRiqrUzPsECEOYg==
X-CSE-MsgGUID: TmOnBClcRrWsj6F0OWDrcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="42027442"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="42027442"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 17:23:35 -0800
X-CSE-ConnectionGUID: ObQ80z3XQMeEwsx3eTTUng==
X-CSE-MsgGUID: yZ2zaqPUSNCro1maboEdWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="117458846"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 01 Mar 2025 17:23:34 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toY3I-000Gvc-1b;
	Sun, 02 Mar 2025 01:23:32 +0000
Date: Sun, 2 Mar 2025 09:22:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/2] leds: add new LED driver for TI LP5812
Message-ID: <202503020907.u7Bo0vhO-lkp@intel.com>
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
In-Reply-To: <20250225170601.21334-3-trannamatk@gmail.com>
References: <20250225170601.21334-3-trannamatk@gmail.com>
TO: Nam Tran <trannamatk@gmail.com>
TO: pavel@kernel.org
TO: lee@kernel.org
TO: krzk+dt@kernel.org
TO: robh@kernel.org
TO: conor+dt@kernel.org
CC: devicetree@vger.kernel.org
CC: linux-leds@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Nam Tran <trannamatk@gmail.com>

Hi Nam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-leds/for-leds-next]
[also build test WARNING on robh/for-next linus/master v6.14-rc4 next-20250228]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nam-Tran/dt-bindings-leds-Add-LP5812-LED-driver-bindings/20250226-011634
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20250225170601.21334-3-trannamatk%40gmail.com
patch subject: [PATCH v2 2/2] leds: add new LED driver for TI LP5812
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-051-20250227 (https://download.01.org/0day-ci/archive/20250302/202503020907.u7Bo0vhO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503020907.u7Bo0vhO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503020907.u7Bo0vhO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   scripts/dtc/include-prefixes/arm/broadcom/bcm2835-rpi.dtsi:15.16-19.5: Warning (simple_bus_reg): /soc/power: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dtb: soc: firmware: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dtb: soc: power: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dtb: /soc/cprman@7e101000: failed to match any schema with compatible: ['brcm,bcm2711-cprman']
   arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dtb: /soc/gpio@7e200000: failed to match any schema with compatible: ['brcm,bcm2711-gpio']
   arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dtb: /soc/i2s@7e203000: failed to match any schema with compatible: ['brcm,bcm2835-i2s']
   arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dtb: /soc/aux@7e215000: failed to match any schema with compatible: ['brcm,bcm2835-aux']
>> arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dtb: /soc/i2c@7e804000/lp5812@1b: failed to match any schema with compatible: ['ti,lp5812']
   arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dtb: interrupt-controller@40000000: 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/brcm,bcm2836-l1-intc.yaml#
   arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dtb: interrupt-controller@40000000: '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/brcm,bcm2836-l1-intc.yaml#
   arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dtb: emmc2bus: $nodename:0: 'emmc2bus' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dtb: scb: $nodename:0: 'scb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   scripts/dtc/include-prefixes/arm/broadcom/bcm2835-rpi.dtsi:15.16-19.5: Warning (simple_bus_reg): /soc/power: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: soc: firmware: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: soc: power: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: /soc/cprman@7e101000: failed to match any schema with compatible: ['brcm,bcm2711-cprman']
   arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: /soc/gpio@7e200000: failed to match any schema with compatible: ['brcm,bcm2711-gpio']
   arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: /soc/i2s@7e203000: failed to match any schema with compatible: ['brcm,bcm2835-i2s']
   arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: /soc/aux@7e215000: failed to match any schema with compatible: ['brcm,bcm2835-aux']
>> arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: /soc/i2c@7e804000/lp5812@1b: failed to match any schema with compatible: ['ti,lp5812']
   arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: interrupt-controller@40000000: 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/brcm,bcm2836-l1-intc.yaml#
   arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: interrupt-controller@40000000: '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/brcm,bcm2836-l1-intc.yaml#
   arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: emmc2bus: $nodename:0: 'emmc2bus' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: scb: $nodename:0: 'scb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
