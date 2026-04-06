Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39E5317165
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Apr 2026 09:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775467649; cv=none; b=TmgIf2LIzcbMJoo6Hcv+BL1K47eTiIEUmdw1J+5TDWKuflJeH6eESZS9QivLWvZm6cBEfnsUZ2xaf0ZkRAAeUAYRBpZrhLoutlbQeKAUqjsNK17ypcJmfQypEpCyP0I5JgVfGz/V8X5HtHOObmD1WXMAfkSFj0fcoo7Wa/l1Vak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775467649; c=relaxed/simple;
	bh=xWNmJDuEIjJrx/TVgsirWUSpTWBl99xC4eFTliw6GkU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AUuwF4UDziPWFOCFgzktokrdFn87KVqTnDf7u7F3HY5qjDdTHNTdDoje28b1ngEWLnWqDPfSlbUGT/75byxhWryzkxEmA5yhVdH/teDO6G3UkuFakGQx/FhF0ZiyiJe/ZXrqxz+enT0BSdoWtybNxriJBcmY1c7iV1sZjrIa+sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k9wfRCGy; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k9wfRCGy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775467644; x=1807003644;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xWNmJDuEIjJrx/TVgsirWUSpTWBl99xC4eFTliw6GkU=;
  b=k9wfRCGyZZ9E5mvaRJLAOELk3GQsZIV6WXiGH9zX5eergLD7zYjugLjz
   05bdWmfg1c4dIW0zN2IeB/xhrhnmNVmdCyt7zHq6C9nQfDFhoM9myD0ER
   7gj8WKe/sAX+LIJcJEfXuoFJXc5LOSyP0cFDcJB6mmMR0Ht9PRuPhUjFK
   tMkq8AHaFP7SVgcelnLNw8jOzneYYDBSWLNQUtEWk0qSjkt5IrW3ynRY1
   E3/PjjY77IW/XCjQgkVqfj3SqOODWpBhoU3MK3ot4rqfOkcZh660JGbWr
   g2XjnP4NvBn1VJGF8GTHBFWoY2g8Tug33MvKAEgy8rfU5Jqw89YMJxJCv
   w==;
X-CSE-ConnectionGUID: gUe3FF0jTFmDmd/Q3RZJug==
X-CSE-MsgGUID: Gmbj1nZuR3y9BNh8XxCCYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="87873215"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; 
   d="scan'208";a="87873215"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 02:27:24 -0700
X-CSE-ConnectionGUID: 0zePNiDqSi21G3kExBQ4zg==
X-CSE-MsgGUID: Q7M+4a3sTp+po+Jxc+OM/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; 
   d="scan'208";a="227737444"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 06 Apr 2026 02:27:22 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9gEo-00000000A0b-085T;
	Mon, 06 Apr 2026 09:27:18 +0000
Date: Mon, 6 Apr 2026 11:26:41 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: mfd: twl: Reference converted YAML schemas
 for subnodes
Message-ID: <202604061116.Fl5GYwdC-lkp@intel.com>
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
In-Reply-To: <20260325095016.48752-1-jihed.chaibi.dev@gmail.com>
References: <20260325095016.48752-1-jihed.chaibi.dev@gmail.com>
TO: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
TO: lee@kernel.org
TO: andreas@kemnade.info
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: jihed.chaibi.dev@gmail.com

Hi Jihed,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on lee-leds/for-leds-next robh/for-next lee-mfd/for-mfd-fixes linus/master v7.0-rc6 next-20260402]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jihed-Chaibi/dt-bindings-mfd-twl-Reference-converted-YAML-schemas-for-subnodes/20260327-125508
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20260325095016.48752-1-jihed.chaibi.dev%40gmail.com
patch subject: [PATCH] dt-bindings: mfd: twl: Reference converted YAML schemas for subnodes
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: arm-randconfig-2051-20260327 (https://download.01.org/0day-ci/archive/20260406/202604061116.Fl5GYwdC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
dtschema: 2025.13.dev13+g7ce498b67
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260406/202604061116.Fl5GYwdC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604061116.Fl5GYwdC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /soc/mpu: failed to match any schema with compatible: ['ti,omap2-mpu']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: ocp (simple-bus): $nodename:0: 'ocp' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: aes@480a6000 (ti,omap2-aes): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap2-aes.yaml
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/1w@480b2000: failed to match any schema with compatible: ['ti,omap2420-1w']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap2430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap2430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: twl@48 (ti,twl4030): keypad: 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: keypad (ti,twl4030-keypad): 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/dss@48050000: failed to match any schema with compatible: ['ti,omap2-dss']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/dss@48050000/dispc@48050400: failed to match any schema with compatible: ['ti,omap2-dispc']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/dss@48050000/encoder@48050800: failed to match any schema with compatible: ['ti,omap2-rfbi']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/dss@48050000/encoder@48050c00: failed to match any schema with compatible: ['ti,omap2-venc']
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: l4_wkup@49000000 (ti,omap2-l4-wkup): $nodename:0: 'l4_wkup@49000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: /ocp/l4_wkup@49000000: failed to match any schema with compatible: ['ti,omap2-l4-wkup', 'simple-bus']
--
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: twl@48 (ti,twl4030): keypad: 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: keypad (ti,twl4030-keypad): 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: tsc2004@48 (ti,tsc2004): $nodename:0: 'tsc2004@48' does not match '^touchscreen(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,tsc2005.yaml
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-35xx-devkit.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
--
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: twl@48 (ti,twl4030): keypad: 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: keypad (ti,twl4030-keypad): 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: tsc2004@48 (ti,tsc2004): $nodename:0: 'tsc2004@48' does not match '^touchscreen(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,tsc2005.yaml
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/logicpd-som-lv-37xx-devkit.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
--
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: twl@48 (ti,twl4030): keypad: 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: keypad (ti,twl4030-keypad): 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/mmu@5d000000: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3430-sdp.dtb: /ocp@68000000/mcbsp@48074000: failed to match any schema with compatible: ['ti,omap3-mcbsp']
--
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: twl@48 (ti,twl4030): keypad: 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: keypad (ti,twl4030-keypad): 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/mmu@5d000000: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-beagle.dtb: /ocp@68000000/mcbsp@48074000: failed to match any schema with compatible: ['ti,omap3-mcbsp']
--
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: twl@48 (ti,twl4030): keypad: 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: keypad (ti,twl4030-keypad): 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/mmu@5d000000: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-beagle-ab4.dtb: /ocp@68000000/mcbsp@48074000: failed to match any schema with compatible: ['ti,omap3-mcbsp']
--
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: twl@48 (ti,twl4030): keypad: 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: keypad (ti,twl4030-keypad): 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/mmu@5d000000: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dtb: /ocp@68000000/mcbsp@48074000: failed to match any schema with compatible: ['ti,omap3-mcbsp']
--
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: twl@48 (ti,twl4030): keypad: 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: keypad (ti,twl4030-keypad): 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/mmu@5d000000: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-beagle-xm-ab.dtb: /ocp@68000000/mcbsp@48074000: failed to match any schema with compatible: ['ti,omap3-mcbsp']
--
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-evm.dtb: twl@48 (ti,twl4030): gpio: 'en-on-board-gpio-61-hog' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
>> arch/arm/boot/dts/ti/omap/omap3-evm.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('en-on-board-gpio-61-hog' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: gpio (ti,twl4030-gpio): 'en-on-board-gpio-61-hog' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/ti,twl4030-gpio.yaml
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/i2c@48060000/tvp5146@5c: failed to match any schema with compatible: ['ti,tvp5146m2']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-evm.dtb: /ocp@68000000/mmu@5d000000: failed to match any schema with compatible: ['ti,omap2-iommu']
--
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: twl@48 (ti,twl4030): gpio: 'en-on-board-gpio-61-hog' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
>> arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: twl@48 (ti,twl4030): gpio: Unevaluated properties are not allowed ('en-on-board-gpio-61-hog' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: gpio (ti,twl4030-gpio): 'en-on-board-gpio-61-hog' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/ti,twl4030-gpio.yaml
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/i2c@48060000/tvp5146@5c: failed to match any schema with compatible: ['ti,tvp5146m2']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-evm-37xx.dtb: /ocp@68000000/mmu@5d000000: failed to match any schema with compatible: ['ti,omap2-iommu']
--
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-ha.dtb: twl@48 (ti,twl4030): keypad: 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: keypad (ti,twl4030-keypad): 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/mmu@5d000000: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-ha.dtb: /ocp@68000000/mcbsp@48074000: failed to match any schema with compatible: ['ti,omap3-mcbsp']
--
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: twl@48 (ti,twl4030): keypad: 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: keypad (ti,twl4030-keypad): 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/mmu@5d000000: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dtb: /ocp@68000000/mcbsp@48074000: failed to match any schema with compatible: ['ti,omap3-mcbsp']
--
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: twl@48 (ti,twl4030): keypad: 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: keypad (ti,twl4030-keypad): 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/i2c@48060000/eeprom@50: failed to match any schema with compatible: ['ti,eeprom']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-igep0020.dtb: /ocp@68000000/mmu@5d000000: failed to match any schema with compatible: ['ti,omap2-iommu']
--
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: twl@48 (ti,twl4030): keypad: 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: keypad (ti,twl4030-keypad): 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/i2c@48060000/eeprom@50: failed to match any schema with compatible: ['ti,eeprom']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-igep0020-rev-f.dtb: /ocp@68000000/mmu@5d000000: failed to match any schema with compatible: ['ti,omap2-iommu']
--
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: twl@48 (ti,twl4030): keypad: 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: keypad (ti,twl4030-keypad): 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/mmu@5d000000: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-igep0030.dtb: /ocp@68000000/mcbsp@48074000: failed to match any schema with compatible: ['ti,omap3-mcbsp']
--
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: twl@48 (ti,twl4030): keypad: 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: keypad (ti,twl4030-keypad): 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/mmu@5d000000: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-igep0030-rev-g.dtb: /ocp@68000000/mcbsp@48074000: failed to match any schema with compatible: ['ti,omap3-mcbsp']
--
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: twl@48 (ti,twl4030): keypad: 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: keypad (ti,twl4030-keypad): 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/mmu@5d000000: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-lilly-dbb056.dtb: /ocp@68000000/mcbsp@48074000: failed to match any schema with compatible: ['ti,omap3-mcbsp']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: twl@48 (ti,twl4030): keypad: 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: keypad (ti,twl4030-keypad): 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: lis33de@1d (st,lis33de): 'Vdd-supply', 'Vdd_IO-supply', 'st,click-single-x', 'st,click-single-y', 'st,click-single-z', 'st,click-thresh-x', 'st,click-thresh-y', 'st,click-thresh-z', 'st,irq1-click', 'st,irq2-click', 'st,max-limit-x', 'st,max-limit-y', 'st,max-limit-z', 'st,min-limit-x', 'st,min-limit-y', 'st,min-limit-z', 'st,wakeup-x-hi', 'st,wakeup-x-lo', 'st,wakeup-y-hi', 'st,wakeup-y-lo', 'st,wakeup-z-hi', 'st,wakeup-z-lo' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-alto35.dtb: lis33de@1d (st,lis33de): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
   	'st,iis328dq' was expected
   	'st,lis33de' is not one of ['silan,sc7a20']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: twl@48 (ti,twl4030): keypad: 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: keypad (ti,twl4030-keypad): 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: lis33de@1d (st,lis33de): 'Vdd-supply', 'Vdd_IO-supply', 'st,click-single-x', 'st,click-single-y', 'st,click-single-z', 'st,click-thresh-x', 'st,click-thresh-y', 'st,click-thresh-z', 'st,irq1-click', 'st,irq2-click', 'st,max-limit-x', 'st,max-limit-y', 'st,max-limit-z', 'st,min-limit-x', 'st,min-limit-y', 'st,min-limit-z', 'st,wakeup-x-hi', 'st,wakeup-x-lo', 'st,wakeup-y-hi', 'st,wakeup-y-lo', 'st,wakeup-z-hi', 'st,wakeup-z-lo' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-chestnut43.dtb: lis33de@1d (st,lis33de): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
   	'st,iis328dq' was expected
   	'st,lis33de' is not one of ['silan,sc7a20']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: twl@48 (ti,twl4030): keypad: 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: keypad (ti,twl4030-keypad): 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: lis33de@1d (st,lis33de): 'Vdd-supply', 'Vdd_IO-supply', 'st,click-single-x', 'st,click-single-y', 'st,click-single-z', 'st,click-thresh-x', 'st,click-thresh-y', 'st,click-thresh-z', 'st,irq1-click', 'st,irq2-click', 'st,max-limit-x', 'st,max-limit-y', 'st,max-limit-z', 'st,min-limit-x', 'st,min-limit-y', 'st,min-limit-z', 'st,wakeup-x-hi', 'st,wakeup-x-lo', 'st,wakeup-y-hi', 'st,wakeup-y-lo', 'st,wakeup-z-hi', 'st,wakeup-z-lo' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-gallop43.dtb: lis33de@1d (st,lis33de): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
   	'st,iis328dq' was expected
   	'st,lis33de' is not one of ['silan,sc7a20']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: twl@48 (ti,twl4030): keypad: 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: keypad (ti,twl4030-keypad): 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: lis33de@1d (st,lis33de): 'Vdd-supply', 'Vdd_IO-supply', 'st,click-single-x', 'st,click-single-y', 'st,click-single-z', 'st,click-thresh-x', 'st,click-thresh-y', 'st,click-thresh-z', 'st,irq1-click', 'st,irq2-click', 'st,max-limit-x', 'st,max-limit-y', 'st,max-limit-z', 'st,min-limit-x', 'st,min-limit-y', 'st,min-limit-z', 'st,wakeup-x-hi', 'st,wakeup-x-lo', 'st,wakeup-y-hi', 'st,wakeup-y-lo', 'st,wakeup-z-hi', 'st,wakeup-z-lo' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-palo35.dtb: lis33de@1d (st,lis33de): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
   	'st,iis328dq' was expected
   	'st,lis33de' is not one of ['silan,sc7a20']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: twl@48 (ti,twl4030): keypad: 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: keypad (ti,twl4030-keypad): 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: lis33de@1d (st,lis33de): 'Vdd-supply', 'Vdd_IO-supply', 'st,click-single-x', 'st,click-single-y', 'st,click-single-z', 'st,click-thresh-x', 'st,click-thresh-y', 'st,click-thresh-z', 'st,irq1-click', 'st,irq2-click', 'st,max-limit-x', 'st,max-limit-y', 'st,max-limit-z', 'st,min-limit-x', 'st,min-limit-y', 'st,min-limit-z', 'st,wakeup-x-hi', 'st,wakeup-x-lo', 'st,wakeup-y-hi', 'st,wakeup-y-lo', 'st,wakeup-z-hi', 'st,wakeup-z-lo' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-palo43.dtb: lis33de@1d (st,lis33de): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
   	'st,iis328dq' was expected
   	'st,lis33de' is not one of ['silan,sc7a20']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: twl@48 (ti,twl4030): keypad: 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: keypad (ti,twl4030-keypad): 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: lis33de@1d (st,lis33de): 'Vdd-supply', 'Vdd_IO-supply', 'st,click-single-x', 'st,click-single-y', 'st,click-single-z', 'st,click-thresh-x', 'st,click-thresh-y', 'st,click-thresh-z', 'st,irq1-click', 'st,irq2-click', 'st,max-limit-x', 'st,max-limit-y', 'st,max-limit-z', 'st,min-limit-x', 'st,min-limit-y', 'st,min-limit-z', 'st,wakeup-x-hi', 'st,wakeup-x-lo', 'st,wakeup-y-hi', 'st,wakeup-y-lo', 'st,wakeup-z-hi', 'st,wakeup-z-lo' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-alto35.dtb: lis33de@1d (st,lis33de): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
   	'st,iis328dq' was expected
   	'st,lis33de' is not one of ['silan,sc7a20']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: twl@48 (ti,twl4030): keypad: 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: keypad (ti,twl4030-keypad): 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: lis33de@1d (st,lis33de): 'Vdd-supply', 'Vdd_IO-supply', 'st,click-single-x', 'st,click-single-y', 'st,click-single-z', 'st,click-thresh-x', 'st,click-thresh-y', 'st,click-thresh-z', 'st,irq1-click', 'st,irq2-click', 'st,max-limit-x', 'st,max-limit-y', 'st,max-limit-z', 'st,min-limit-x', 'st,min-limit-y', 'st,min-limit-z', 'st,wakeup-x-hi', 'st,wakeup-x-lo', 'st,wakeup-y-hi', 'st,wakeup-y-lo', 'st,wakeup-z-hi', 'st,wakeup-z-lo' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-chestnut43.dtb: lis33de@1d (st,lis33de): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
   	'st,iis328dq' was expected
   	'st,lis33de' is not one of ['silan,sc7a20']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: twl@48 (ti,twl4030): keypad: 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: keypad (ti,twl4030-keypad): 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: lis33de@1d (st,lis33de): 'Vdd-supply', 'Vdd_IO-supply', 'st,click-single-x', 'st,click-single-y', 'st,click-single-z', 'st,click-thresh-x', 'st,click-thresh-y', 'st,click-thresh-z', 'st,irq1-click', 'st,irq2-click', 'st,max-limit-x', 'st,max-limit-y', 'st,max-limit-z', 'st,min-limit-x', 'st,min-limit-y', 'st,min-limit-z', 'st,wakeup-x-hi', 'st,wakeup-x-lo', 'st,wakeup-y-hi', 'st,wakeup-y-lo', 'st,wakeup-z-hi', 'st,wakeup-z-lo' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-gallop43.dtb: lis33de@1d (st,lis33de): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
   	'st,iis328dq' was expected
   	'st,lis33de' is not one of ['silan,sc7a20']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: twl@48 (ti,twl4030): keypad: 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: keypad (ti,twl4030-keypad): 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: lis33de@1d (st,lis33de): 'Vdd-supply', 'Vdd_IO-supply', 'st,click-single-x', 'st,click-single-y', 'st,click-single-z', 'st,click-thresh-x', 'st,click-thresh-y', 'st,click-thresh-z', 'st,irq1-click', 'st,irq2-click', 'st,max-limit-x', 'st,max-limit-y', 'st,max-limit-z', 'st,min-limit-x', 'st,min-limit-y', 'st,min-limit-z', 'st,wakeup-x-hi', 'st,wakeup-x-lo', 'st,wakeup-y-hi', 'st,wakeup-y-lo', 'st,wakeup-z-hi', 'st,wakeup-z-lo' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo35.dtb: lis33de@1d (st,lis33de): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
   	'st,iis328dq' was expected
   	'st,lis33de' is not one of ['silan,sc7a20']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: twl@48 (ti,twl4030): keypad: 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: keypad (ti,twl4030-keypad): 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: lis33de@1d (st,lis33de): 'Vdd-supply', 'Vdd_IO-supply', 'st,click-single-x', 'st,click-single-y', 'st,click-single-z', 'st,click-thresh-x', 'st,click-thresh-y', 'st,click-thresh-z', 'st,irq1-click', 'st,irq2-click', 'st,max-limit-x', 'st,max-limit-y', 'st,max-limit-z', 'st,min-limit-x', 'st,min-limit-y', 'st,min-limit-z', 'st,wakeup-x-hi', 'st,wakeup-x-lo', 'st,wakeup-y-hi', 'st,wakeup-y-lo', 'st,wakeup-z-hi', 'st,wakeup-z-lo' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-palo43.dtb: lis33de@1d (st,lis33de): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
   	'st,iis328dq' was expected
   	'st,lis33de' is not one of ['silan,sc7a20']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: twl@48 (ti,twl4030): keypad: 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: keypad (ti,twl4030-keypad): 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: lis33de@1d (st,lis33de): 'Vdd-supply', 'Vdd_IO-supply', 'st,click-single-x', 'st,click-single-y', 'st,click-single-z', 'st,click-thresh-x', 'st,click-thresh-y', 'st,click-thresh-z', 'st,irq1-click', 'st,irq2-click', 'st,max-limit-x', 'st,max-limit-y', 'st,max-limit-z', 'st,min-limit-x', 'st,min-limit-y', 'st,min-limit-z', 'st,wakeup-x-hi', 'st,wakeup-x-lo', 'st,wakeup-y-hi', 'st,wakeup-y-lo', 'st,wakeup-z-hi', 'st,wakeup-z-lo' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-summit.dtb: lis33de@1d (st,lis33de): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
   	'st,iis328dq' was expected
   	'st,lis33de' is not one of ['silan,sc7a20']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: twl@48 (ti,twl4030): keypad: 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: keypad (ti,twl4030-keypad): 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: lis33de@1d (st,lis33de): 'Vdd-supply', 'Vdd_IO-supply', 'st,click-single-x', 'st,click-single-y', 'st,click-single-z', 'st,click-thresh-x', 'st,click-thresh-y', 'st,click-thresh-z', 'st,irq1-click', 'st,irq2-click', 'st,max-limit-x', 'st,max-limit-y', 'st,max-limit-z', 'st,min-limit-x', 'st,min-limit-y', 'st,min-limit-z', 'st,wakeup-x-hi', 'st,wakeup-x-lo', 'st,wakeup-y-hi', 'st,wakeup-y-lo', 'st,wakeup-z-hi', 'st,wakeup-z-lo' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobi.dtb: lis33de@1d (st,lis33de): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
   	'st,iis328dq' was expected
   	'st,lis33de' is not one of ['silan,sc7a20']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: twl@48 (ti,twl4030): keypad: 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: keypad (ti,twl4030-keypad): 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: lis33de@1d (st,lis33de): 'Vdd-supply', 'Vdd_IO-supply', 'st,click-single-x', 'st,click-single-y', 'st,click-single-z', 'st,click-thresh-x', 'st,click-thresh-y', 'st,click-thresh-z', 'st,irq1-click', 'st,irq2-click', 'st,max-limit-x', 'st,max-limit-y', 'st,max-limit-z', 'st,min-limit-x', 'st,min-limit-y', 'st,min-limit-z', 'st,wakeup-x-hi', 'st,wakeup-x-lo', 'st,wakeup-y-hi', 'st,wakeup-y-lo', 'st,wakeup-z-hi', 'st,wakeup-z-lo' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-storm-tobiduo.dtb: lis33de@1d (st,lis33de): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
   	'st,iis328dq' was expected
   	'st,lis33de' is not one of ['silan,sc7a20']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: twl@48 (ti,twl4030): keypad: 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: keypad (ti,twl4030-keypad): 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: lis33de@1d (st,lis33de): 'Vdd-supply', 'Vdd_IO-supply', 'st,click-single-x', 'st,click-single-y', 'st,click-single-z', 'st,click-thresh-x', 'st,click-thresh-y', 'st,click-thresh-z', 'st,irq1-click', 'st,irq2-click', 'st,max-limit-x', 'st,max-limit-y', 'st,max-limit-z', 'st,min-limit-x', 'st,min-limit-y', 'st,min-limit-z', 'st,wakeup-x-hi', 'st,wakeup-x-lo', 'st,wakeup-y-hi', 'st,wakeup-y-lo', 'st,wakeup-z-hi', 'st,wakeup-z-lo' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-summit.dtb: lis33de@1d (st,lis33de): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
   	'st,iis328dq' was expected
   	'st,lis33de' is not one of ['silan,sc7a20']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: twl@48 (ti,twl4030): keypad: 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: keypad (ti,twl4030-keypad): 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: lis33de@1d (st,lis33de): 'Vdd-supply', 'Vdd_IO-supply', 'st,click-single-x', 'st,click-single-y', 'st,click-single-z', 'st,click-thresh-x', 'st,click-thresh-y', 'st,click-thresh-z', 'st,irq1-click', 'st,irq2-click', 'st,max-limit-x', 'st,max-limit-y', 'st,max-limit-z', 'st,min-limit-x', 'st,min-limit-y', 'st,min-limit-z', 'st,wakeup-x-hi', 'st,wakeup-x-lo', 'st,wakeup-y-hi', 'st,wakeup-y-lo', 'st,wakeup-z-hi', 'st,wakeup-z-lo' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-tobi.dtb: lis33de@1d (st,lis33de): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
   	'st,iis328dq' was expected
   	'st,lis33de' is not one of ['silan,sc7a20']
--
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: twl@48 (ti,twl4030): keypad: 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: keypad (ti,twl4030-keypad): 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: lis33de@1d (st,lis33de): 'Vdd-supply', 'Vdd_IO-supply', 'st,click-single-x', 'st,click-single-y', 'st,click-single-z', 'st,click-thresh-x', 'st,click-thresh-y', 'st,click-thresh-z', 'st,irq1-click', 'st,irq2-click', 'st,max-limit-x', 'st,max-limit-y', 'st,max-limit-z', 'st,min-limit-x', 'st,min-limit-y', 'st,min-limit-z', 'st,wakeup-x-hi', 'st,wakeup-x-lo', 'st,wakeup-y-hi', 'st,wakeup-y-lo', 'st,wakeup-z-hi', 'st,wakeup-z-lo' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml
   arch/arm/boot/dts/ti/omap/omap3-overo-tobiduo.dtb: lis33de@1d (st,lis33de): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,lis33de', 'st,lis3lv02d'] is too long
   	'st,lis33de' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
   	'st,iis328dq' was expected
   	'st,lis33de' is not one of ['silan,sc7a20']
--
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3430-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: twl@48 (ti,twl4030): keypad: 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: keypad (ti,twl4030-keypad): 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/mmu@5d000000: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-thunder.dtb: /ocp@68000000/mcbsp@48074000: failed to match any schema with compatible: ['ti,omap3-mcbsp']
--
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/cm@48004000/clockdomains/cam_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/cm@48004000/clockdomains/iva2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll2_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/cm@48004000/clockdomains/d2d_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/cm@48004000/clockdomains/dpll5_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/cm@48004000/clockdomains/sgx_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/cm@48004000/clockdomains/usbhost_clkdm: failed to match any schema with compatible: ['ti,clockdomain']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/target-module@48320000/counter@0: failed to match any schema with compatible: ['ti,omap-counter32k']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/target-module@48056000/dma-controller@0: failed to match any schema with compatible: ['ti,omap3630-sdma', 'ti,omap-sdma']
>> arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: twl@48 (ti,twl4030): keypad: 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: keypad (ti,twl4030-keypad): 'linux,keymap' is a required property
   	from schema $id: http://devicetree.org/schemas/input/ti,twl4030-keypad.yaml
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/i2c@48060000/tvp5146@5c: failed to match any schema with compatible: ['ti,tvp5146m2']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/1w@480b2000: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/mmc@4809c000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/mmc@480b4000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/mmc@480ad000: failed to match any schema with compatible: ['ti,omap3-hsmmc']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/mmu@480bd400: failed to match any schema with compatible: ['ti,omap2-iommu']
   arch/arm/boot/dts/ti/omap/omap3-zoom3.dtb: /ocp@68000000/mmu@5d000000: failed to match any schema with compatible: ['ti,omap2-iommu']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
