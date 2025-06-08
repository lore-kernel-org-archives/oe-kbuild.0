Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363D61898F8
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Jun 2025 17:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749402456; cv=none; b=GihZY/T80rrCRnKL4deUQ6FHe4bBeqV5NtoHExEfpZM4Tw2CpaVGhhcyj8bjnBW9XdkIg4IqtW+ssRhoLTgs5sWoBodnWVRFN/7W7AoUV8vCVX4syQyx98Z0oTXeW2h5LSUygM8CrFtNSdAubi28lSCtWdE53U+B9e6KrIhjVdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749402456; c=relaxed/simple;
	bh=IJIi0viKwTQJbPV/5W4P2e6hGnxDr6ILTwKjBdVwFCE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ew7S2Cieg3nerzPpRG19D1ttJUP55aMuyhFmom28o7kMLgOzvikgxPOISuzSf4SInGcU5wZU7qHmhIfSZKXzxJ4SO5W4/4Q9xJjkau41AImsealJqlrrM9OIPcfw09MRN30DC/LGywIo593K7mgvcGsgFyMCiD58Xer+Dd1O100=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eH3Gkm+N; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eH3Gkm+N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749402450; x=1780938450;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IJIi0viKwTQJbPV/5W4P2e6hGnxDr6ILTwKjBdVwFCE=;
  b=eH3Gkm+NxcwTaWKtsI2VjoCcfJtjwwgsr8VMp9YyFOcMRVpP/Qb4I4rb
   splOUUJ1gZ5bFy6TzJu9NHQALixJ4IQUnEKxNDfN7I6LByZ2cHcCRnuIv
   LE/6A+k5ksJjtXHWI87od6D+Rmsbcls4xyXIHhaTyhGQHKbSOnC8j8tGc
   l1m16AKP/Oc8DtBMZt8Oz5ptkOfyJhfd6hsDbRLixKMMB4vmT2rLwLdib
   Hxw9GuapMaWSIks8f8W153GDxqsh6DdNGwyeA9X68GxVpm/85tlzh+twj
   KPunTkuLV4nAfbs6/czQnSri+3Sq5tS0prvqG+czp3W9fgpNnwv4ea54S
   w==;
X-CSE-ConnectionGUID: fUa8O9WuSjy1lB746o6aOA==
X-CSE-MsgGUID: X5y+Ky76Q2qn4uOH5JP+Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="39117964"
X-IronPort-AV: E=Sophos;i="6.16,220,1744095600"; 
   d="scan'208";a="39117964"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2025 10:07:28 -0700
X-CSE-ConnectionGUID: 3KyTXKJ5T/u6PKKYRYnjYQ==
X-CSE-MsgGUID: pqMtBe/YQVizzHSOHHiIVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,220,1744095600"; 
   d="scan'208";a="146653213"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Jun 2025 10:07:26 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOJUS-0006U5-0t;
	Sun, 08 Jun 2025 17:07:24 +0000
Date: Mon, 9 Jun 2025 01:06:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: phy: Convert marvell,comphy-cp110 to DT
 schema
Message-ID: <202506090013.91J0QVrk-lkp@intel.com>
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
In-Reply-To: <20250607212605.743176-1-robh@kernel.org>
References: <20250607212605.743176-1-robh@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.15 next-20250606]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/dt-bindings-phy-Convert-marvell-comphy-cp110-to-DT-schema/20250608-052955
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250607212605.743176-1-robh%40kernel.org
patch subject: [PATCH] dt-bindings: phy: Convert marvell,comphy-cp110 to DT schema
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: arm64-randconfig-052-20250608 (https://download.01.org/0day-ci/archive/20250609/202506090013.91J0QVrk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.3.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250609/202506090013.91J0QVrk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506090013.91J0QVrk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/marvell/armada-3720-db.dtb: /soc/bus@d0000000/watchdog@8300: failed to match any schema with compatible: ['marvell,armada-3700-wdt']
   arch/arm64/boot/dts/marvell/armada-3720-db.dtb: /soc/bus@d0000000/serial@12000: failed to match any schema with compatible: ['marvell,armada-3700-uart']
   arch/arm64/boot/dts/marvell/armada-3720-db.dtb: /soc/bus@d0000000/serial@12200: failed to match any schema with compatible: ['marvell,armada-3700-uart-ext']
   arch/arm64/boot/dts/marvell/armada-3720-db.dtb: /soc/bus@d0000000/nb-periph-clk@13000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-nb', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-db.dtb: /soc/bus@d0000000/sb-periph-clk@18000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-sb']
   arch/arm64/boot/dts/marvell/armada-3720-db.dtb: /soc/bus@d0000000/tbg@13200: failed to match any schema with compatible: ['marvell,armada-3700-tbg-clock']
   arch/arm64/boot/dts/marvell/armada-3720-db.dtb: /soc/bus@d0000000/pinctrl@13800: failed to match any schema with compatible: ['marvell,armada3710-nb-pinctrl', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/marvell/armada-3720-db.dtb: pinctrl@13800 (marvell,armada3710-nb-pinctrl): reg: [[79872, 256], [80896, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-db.dtb: /soc/bus@d0000000/pinctrl@13800/xtal-clk: failed to match any schema with compatible: ['marvell,armada-3700-xtal-clock']
>> arch/arm64/boot/dts/marvell/armada-3720-db.dtb: phy@18300 (marvell,comphy-a3700): clock-names: False schema does not allow ['xtal']
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-db.dtb: phy@18300 (marvell,comphy-a3700): clocks: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-db.dtb: phy@18300 (marvell,comphy-a3700): clock-names:0: 'mg_clk' was expected
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-db.dtb: phy@18300 (marvell,comphy-a3700): clock-names: ['xtal'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-db.dtb: phy@18300 (marvell,comphy-a3700): clocks: [[4]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-db.dtb: /soc/bus@d0000000/pinctrl@18800: failed to match any schema with compatible: ['marvell,armada3710-sb-pinctrl', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/marvell/armada-3720-db.dtb: pinctrl@18800 (marvell,armada3710-sb-pinctrl): reg: [[100352, 256], [101376, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-db.dtb: /soc/bus@d0000000/ethernet@30000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-db.dtb: /soc/bus@d0000000/ethernet@40000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-db.dtb: usb@58000 (marvell,armada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-db.dtb: /soc/bus@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-db.dtb: usb@5e000 (marvell,armada-3700-ehci): phy-names:0: 'usb' was expected
--
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /soc/bus@d0000000/watchdog@8300: failed to match any schema with compatible: ['marvell,armada-3700-wdt']
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /soc/bus@d0000000/serial@12000: failed to match any schema with compatible: ['marvell,armada-3700-uart']
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /soc/bus@d0000000/serial@12200: failed to match any schema with compatible: ['marvell,armada-3700-uart-ext']
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /soc/bus@d0000000/nb-periph-clk@13000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-nb', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /soc/bus@d0000000/sb-periph-clk@18000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-sb']
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /soc/bus@d0000000/tbg@13200: failed to match any schema with compatible: ['marvell,armada-3700-tbg-clock']
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /soc/bus@d0000000/pinctrl@13800: failed to match any schema with compatible: ['marvell,armada3710-nb-pinctrl', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: pinctrl@13800 (marvell,armada3710-nb-pinctrl): reg: [[79872, 256], [80896, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /soc/bus@d0000000/pinctrl@13800/xtal-clk: failed to match any schema with compatible: ['marvell,armada-3700-xtal-clock']
>> arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: phy@18300 (marvell,comphy-a3700): clock-names: False schema does not allow ['xtal']
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: phy@18300 (marvell,comphy-a3700): clocks: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: phy@18300 (marvell,comphy-a3700): clock-names:0: 'mg_clk' was expected
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: phy@18300 (marvell,comphy-a3700): clock-names: ['xtal'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: phy@18300 (marvell,comphy-a3700): clocks: [[4]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /soc/bus@d0000000/pinctrl@18800: failed to match any schema with compatible: ['marvell,armada3710-sb-pinctrl', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: pinctrl@18800 (marvell,armada3710-sb-pinctrl): reg: [[100352, 256], [101376, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /soc/bus@d0000000/ethernet@30000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /soc/bus@d0000000/ethernet@40000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: usb@58000 (marvell,armada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /soc/bus@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: usb@5e000 (marvell,armada-3700-ehci): phy-names:0: 'usb' was expected
--
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /soc/bus@d0000000/watchdog@8300: failed to match any schema with compatible: ['marvell,armada-3700-wdt']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /soc/bus@d0000000/serial@12000: failed to match any schema with compatible: ['marvell,armada-3700-uart']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /soc/bus@d0000000/serial@12200: failed to match any schema with compatible: ['marvell,armada-3700-uart-ext']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /soc/bus@d0000000/nb-periph-clk@13000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-nb', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /soc/bus@d0000000/sb-periph-clk@18000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-sb']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /soc/bus@d0000000/tbg@13200: failed to match any schema with compatible: ['marvell,armada-3700-tbg-clock']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /soc/bus@d0000000/pinctrl@13800: failed to match any schema with compatible: ['marvell,armada3710-nb-pinctrl', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: pinctrl@13800 (marvell,armada3710-nb-pinctrl): reg: [[79872, 256], [80896, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /soc/bus@d0000000/pinctrl@13800/xtal-clk: failed to match any schema with compatible: ['marvell,armada-3700-xtal-clock']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: phy@18300 (marvell,comphy-a3700): clock-names: False schema does not allow ['xtal']
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: phy@18300 (marvell,comphy-a3700): clocks: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: phy@18300 (marvell,comphy-a3700): clock-names:0: 'mg_clk' was expected
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: phy@18300 (marvell,comphy-a3700): clock-names: ['xtal'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: phy@18300 (marvell,comphy-a3700): clocks: [[4]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /soc/bus@d0000000/pinctrl@18800: failed to match any schema with compatible: ['marvell,armada3710-sb-pinctrl', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: pinctrl@18800 (marvell,armada3710-sb-pinctrl): reg: [[100352, 256], [101376, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /soc/bus@d0000000/ethernet@30000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /soc/bus@d0000000/ethernet@40000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: usb@58000 (marvell,armada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /soc/bus@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: usb@5e000 (marvell,armada-3700-ehci): phy-names:0: 'usb' was expected
--
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/bus@d0000000/watchdog@8300: failed to match any schema with compatible: ['marvell,armada-3700-wdt']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/bus@d0000000/serial@12000: failed to match any schema with compatible: ['marvell,armada-3700-uart']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/bus@d0000000/serial@12200: failed to match any schema with compatible: ['marvell,armada-3700-uart-ext']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/bus@d0000000/nb-periph-clk@13000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-nb', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/bus@d0000000/sb-periph-clk@18000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-sb']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/bus@d0000000/tbg@13200: failed to match any schema with compatible: ['marvell,armada-3700-tbg-clock']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/bus@d0000000/pinctrl@13800: failed to match any schema with compatible: ['marvell,armada3710-nb-pinctrl', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: pinctrl@13800 (marvell,armada3710-nb-pinctrl): reg: [[79872, 256], [80896, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/bus@d0000000/pinctrl@13800/xtal-clk: failed to match any schema with compatible: ['marvell,armada-3700-xtal-clock']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: phy@18300 (marvell,comphy-a3700): clock-names: False schema does not allow ['xtal']
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: phy@18300 (marvell,comphy-a3700): clocks: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: phy@18300 (marvell,comphy-a3700): clock-names:0: 'mg_clk' was expected
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: phy@18300 (marvell,comphy-a3700): clock-names: ['xtal'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: phy@18300 (marvell,comphy-a3700): clocks: [[4]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/bus@d0000000/pinctrl@18800: failed to match any schema with compatible: ['marvell,armada3710-sb-pinctrl', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: pinctrl@18800 (marvell,armada3710-sb-pinctrl): reg: [[100352, 256], [101376, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/bus@d0000000/ethernet@30000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/bus@d0000000/ethernet@40000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: usb@58000 (marvell,armada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /soc/bus@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: usb@5e000 (marvell,armada-3700-ehci): phy-names:0: 'usb' was expected
--
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/bus@d0000000/watchdog@8300: failed to match any schema with compatible: ['marvell,armada-3700-wdt']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/bus@d0000000/serial@12000: failed to match any schema with compatible: ['marvell,armada-3700-uart']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/bus@d0000000/serial@12200: failed to match any schema with compatible: ['marvell,armada-3700-uart-ext']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/bus@d0000000/nb-periph-clk@13000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-nb', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/bus@d0000000/sb-periph-clk@18000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-sb']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/bus@d0000000/tbg@13200: failed to match any schema with compatible: ['marvell,armada-3700-tbg-clock']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/bus@d0000000/pinctrl@13800: failed to match any schema with compatible: ['marvell,armada3710-nb-pinctrl', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: pinctrl@13800 (marvell,armada3710-nb-pinctrl): reg: [[79872, 256], [80896, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/bus@d0000000/pinctrl@13800/xtal-clk: failed to match any schema with compatible: ['marvell,armada-3700-xtal-clock']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: phy@18300 (marvell,comphy-a3700): clock-names: False schema does not allow ['xtal']
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: phy@18300 (marvell,comphy-a3700): clocks: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: phy@18300 (marvell,comphy-a3700): clock-names:0: 'mg_clk' was expected
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: phy@18300 (marvell,comphy-a3700): clock-names: ['xtal'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: phy@18300 (marvell,comphy-a3700): clocks: [[4]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/bus@d0000000/pinctrl@18800: failed to match any schema with compatible: ['marvell,armada3710-sb-pinctrl', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: pinctrl@18800 (marvell,armada3710-sb-pinctrl): reg: [[100352, 256], [101376, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/bus@d0000000/ethernet@30000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/bus@d0000000/ethernet@40000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: usb@58000 (marvell,armada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /soc/bus@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: usb@5e000 (marvell,armada-3700-ehci): phy-names:0: 'usb' was expected
--
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: /soc/bus@d0000000/watchdog@8300: failed to match any schema with compatible: ['marvell,armada-3700-wdt']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: /soc/bus@d0000000/serial@12000: failed to match any schema with compatible: ['marvell,armada-3700-uart']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: /soc/bus@d0000000/serial@12200: failed to match any schema with compatible: ['marvell,armada-3700-uart-ext']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: /soc/bus@d0000000/nb-periph-clk@13000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-nb', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: /soc/bus@d0000000/sb-periph-clk@18000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-sb']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: /soc/bus@d0000000/tbg@13200: failed to match any schema with compatible: ['marvell,armada-3700-tbg-clock']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: /soc/bus@d0000000/pinctrl@13800: failed to match any schema with compatible: ['marvell,armada3710-nb-pinctrl', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: pinctrl@13800 (marvell,armada3710-nb-pinctrl): reg: [[79872, 256], [80896, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: /soc/bus@d0000000/pinctrl@13800/xtal-clk: failed to match any schema with compatible: ['marvell,armada-3700-xtal-clock']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: phy@18300 (marvell,comphy-a3700): clock-names: False schema does not allow ['xtal']
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: phy@18300 (marvell,comphy-a3700): clocks: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: phy@18300 (marvell,comphy-a3700): clock-names:0: 'mg_clk' was expected
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: phy@18300 (marvell,comphy-a3700): clock-names: ['xtal'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: phy@18300 (marvell,comphy-a3700): clocks: [[4]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: /soc/bus@d0000000/pinctrl@18800: failed to match any schema with compatible: ['marvell,armada3710-sb-pinctrl', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: pinctrl@18800 (marvell,armada3710-sb-pinctrl): reg: [[100352, 256], [101376, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: /soc/bus@d0000000/ethernet@30000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: /soc/bus@d0000000/ethernet@40000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: usb@58000 (marvell,armada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: /soc/bus@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: usb@5e000 (marvell,armada-3700-ehci): phy-names:0: 'usb' was expected
--
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: /soc/bus@d0000000/watchdog@8300: failed to match any schema with compatible: ['marvell,armada-3700-wdt']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: /soc/bus@d0000000/serial@12000: failed to match any schema with compatible: ['marvell,armada-3700-uart']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: /soc/bus@d0000000/serial@12200: failed to match any schema with compatible: ['marvell,armada-3700-uart-ext']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: /soc/bus@d0000000/nb-periph-clk@13000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-nb', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: /soc/bus@d0000000/sb-periph-clk@18000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-sb']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: /soc/bus@d0000000/tbg@13200: failed to match any schema with compatible: ['marvell,armada-3700-tbg-clock']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: /soc/bus@d0000000/pinctrl@13800: failed to match any schema with compatible: ['marvell,armada3710-nb-pinctrl', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: pinctrl@13800 (marvell,armada3710-nb-pinctrl): reg: [[79872, 256], [80896, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: /soc/bus@d0000000/pinctrl@13800/xtal-clk: failed to match any schema with compatible: ['marvell,armada-3700-xtal-clock']
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: phy@18300 (marvell,comphy-a3700): clock-names: False schema does not allow ['xtal']
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: phy@18300 (marvell,comphy-a3700): clocks: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: phy@18300 (marvell,comphy-a3700): clock-names:0: 'mg_clk' was expected
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: phy@18300 (marvell,comphy-a3700): clock-names: ['xtal'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: phy@18300 (marvell,comphy-a3700): clocks: [[4]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: /soc/bus@d0000000/pinctrl@18800: failed to match any schema with compatible: ['marvell,armada3710-sb-pinctrl', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: pinctrl@18800 (marvell,armada3710-sb-pinctrl): reg: [[100352, 256], [101376, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: /soc/bus@d0000000/ethernet@30000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: /soc/bus@d0000000/ethernet@40000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: usb@58000 (marvell,armada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: /soc/bus@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: usb@5e000 (marvell,armada-3700-ehci): phy-names:0: 'usb' was expected
--
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /soc/bus@d0000000/watchdog@8300: failed to match any schema with compatible: ['marvell,armada-3700-wdt']
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /soc/bus@d0000000/serial@12000: failed to match any schema with compatible: ['marvell,armada-3700-uart']
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /soc/bus@d0000000/serial@12200: failed to match any schema with compatible: ['marvell,armada-3700-uart-ext']
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /soc/bus@d0000000/nb-periph-clk@13000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-nb', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /soc/bus@d0000000/sb-periph-clk@18000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-sb']
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /soc/bus@d0000000/tbg@13200: failed to match any schema with compatible: ['marvell,armada-3700-tbg-clock']
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /soc/bus@d0000000/pinctrl@13800: failed to match any schema with compatible: ['marvell,armada3710-nb-pinctrl', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: pinctrl@13800 (marvell,armada3710-nb-pinctrl): reg: [[79872, 256], [80896, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /soc/bus@d0000000/pinctrl@13800/xtal-clk: failed to match any schema with compatible: ['marvell,armada-3700-xtal-clock']
>> arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: phy@18300 (marvell,comphy-a3700): clock-names: False schema does not allow ['xtal']
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: phy@18300 (marvell,comphy-a3700): clocks: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: phy@18300 (marvell,comphy-a3700): clock-names:0: 'mg_clk' was expected
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: phy@18300 (marvell,comphy-a3700): clock-names: ['xtal'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: phy@18300 (marvell,comphy-a3700): clocks: [[4]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /soc/bus@d0000000/pinctrl@18800: failed to match any schema with compatible: ['marvell,armada3710-sb-pinctrl', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: pinctrl@18800 (marvell,armada3710-sb-pinctrl): reg: [[100352, 256], [101376, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /soc/bus@d0000000/ethernet@30000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: ethernet-switch@1 (marvell,mv88e6085): ethernet-ports:ethernet-port@0: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/marvell,mv88e6xxx.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: ethernet-switch@1 (marvell,mv88e6085): ethernet-ports:ethernet-port@0: 'oneOf' conditional failed, one must be fixed:
   	'fixed-link' is a required property
   	'phy-handle' is a required property
--
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/spi@10600/moxtet@1/gpio@0: failed to match any schema with compatible: ['cznic,moxtet-gpio']
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/serial@12000: failed to match any schema with compatible: ['marvell,armada-3700-uart']
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/serial@12200: failed to match any schema with compatible: ['marvell,armada-3700-uart-ext']
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/nb-periph-clk@13000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-nb', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/sb-periph-clk@18000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-sb']
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/tbg@13200: failed to match any schema with compatible: ['marvell,armada-3700-tbg-clock']
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/pinctrl@13800: failed to match any schema with compatible: ['marvell,armada3710-nb-pinctrl', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: pinctrl@13800 (marvell,armada3710-nb-pinctrl): reg: [[79872, 256], [80896, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/pinctrl@13800/xtal-clk: failed to match any schema with compatible: ['marvell,armada-3700-xtal-clock']
>> arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: phy@18300 (marvell,comphy-a3700): clock-names: False schema does not allow ['xtal']
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: phy@18300 (marvell,comphy-a3700): clocks: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: phy@18300 (marvell,comphy-a3700): phy@2: 'connector' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: phy@18300 (marvell,comphy-a3700): clock-names:0: 'mg_clk' was expected
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: phy@18300 (marvell,comphy-a3700): clock-names: ['xtal'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: phy@18300 (marvell,comphy-a3700): clocks: [[4]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: connector (usb-a-connector): Unevaluated properties are not allowed ('phy-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/pinctrl@18800: failed to match any schema with compatible: ['marvell,armada3710-sb-pinctrl', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: pinctrl@18800 (marvell,armada3710-sb-pinctrl): reg: [[100352, 256], [101376, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/ethernet@30000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /soc/bus@d0000000/ethernet@40000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: usb@58000 (marvell,armada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
--
   arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/watchdog@8300: failed to match any schema with compatible: ['marvell,armada-3700-wdt']
   arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/serial@12000: failed to match any schema with compatible: ['marvell,armada-3700-uart']
   arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/serial@12200: failed to match any schema with compatible: ['marvell,armada-3700-uart-ext']
   arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/nb-periph-clk@13000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-nb', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/sb-periph-clk@18000: failed to match any schema with compatible: ['marvell,armada-3700-periph-clock-sb']
   arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/tbg@13200: failed to match any schema with compatible: ['marvell,armada-3700-tbg-clock']
   arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/pinctrl@13800: failed to match any schema with compatible: ['marvell,armada3710-nb-pinctrl', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: pinctrl@13800 (marvell,armada3710-nb-pinctrl): reg: [[79872, 256], [80896, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/pinctrl@13800/xtal-clk: failed to match any schema with compatible: ['marvell,armada-3700-xtal-clock']
>> arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: phy@18300 (marvell,comphy-a3700): clock-names: False schema does not allow ['xtal']
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: phy@18300 (marvell,comphy-a3700): clocks: False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: phy@18300 (marvell,comphy-a3700): clock-names:0: 'mg_clk' was expected
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: phy@18300 (marvell,comphy-a3700): clock-names: ['xtal'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: phy@18300 (marvell,comphy-a3700): clocks: [[4]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/pinctrl@18800: failed to match any schema with compatible: ['marvell,armada3710-sb-pinctrl', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: pinctrl@18800 (marvell,armada3710-sb-pinctrl): reg: [[100352, 256], [101376, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/ethernet@30000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/ethernet@40000: failed to match any schema with compatible: ['marvell,armada-3700-neta']
   arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: usb@58000 (marvell,armada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /soc/bus@d0000000/system-controller@5d800: failed to match any schema with compatible: ['marvell,armada-3700-usb2-host-device-misc', 'syscon']
   arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: usb@5e000 (marvell,armada-3700-ehci): phy-names:0: 'usb' was expected
--
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: mmc@6e0000 (marvell,armada-ap806-sdhci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap806-clock']
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap806-thermal']
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu@278: failed to match any schema with compatible: ['marvell,ap806-cpu-clock']
>> arch/arm64/boot/dts/marvell/armada-7040-db.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-7040-db.dtb: phy@120000 (marvell,comphy-cp110): phy@1: 'connector' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: connector (usb-a-connector): Unevaluated properties are not allowed ('phy-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: connector (usb-a-connector): Unevaluated properties are not allowed ('phy-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-7k-pinctrl']
   arch/arm64/boot/dts/marvell/armada-7040-db.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
--
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: mmc@6e0000 (marvell,armada-ap806-sdhci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap806-clock']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap806-thermal']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu@278: failed to match any schema with compatible: ['marvell,ap806-cpu-clock']
>> arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-7k-pinctrl']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
--
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: mmc@6e0000 (marvell,armada-ap806-sdhci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap806-clock']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap806-thermal']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu@278: failed to match any schema with compatible: ['marvell,ap806-cpu-clock']
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cpm-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0-bus/bus@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0-bus/bus@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: mmc@780000 (marvell,armada-cp110-sdhci): Unevaluated properties are not allowed ('dma-coherent', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0-bus/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0-bus/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp0-bus/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: phy@120000 (marvell,comphy-cp110): phy@2: 'connector' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: connector (usb-a-connector): Unevaluated properties are not allowed ('phy-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp1-bus/bus@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp1-bus/bus@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cps-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb: /cp1-bus/bus@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
--
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: mmc@6e0000 (marvell,armada-ap806-sdhci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap806-clock']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap806-thermal']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu@278: failed to match any schema with compatible: ['marvell,ap806-cpu-clock']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cpm-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0-bus/bus@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0-bus/bus@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: mmc@780000 (marvell,armada-cp110-sdhci): Unevaluated properties are not allowed ('dma-coherent', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0-bus/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0-bus/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp0-bus/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: phy@120000 (marvell,comphy-cp110): phy@2: 'connector' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: connector (usb-a-connector): Unevaluated properties are not allowed ('phy-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1-bus/bus@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1-bus/bus@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cps-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb: /cp1-bus/bus@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
--
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: mmc@6e0000 (marvell,armada-ap806-sdhci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap806-clock']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap806-thermal']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu@278: failed to match any schema with compatible: ['marvell,ap806-cpu-clock']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cpm-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0-bus/bus@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0-bus/bus@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: mmc@780000 (marvell,armada-cp110-sdhci): Unevaluated properties are not allowed ('dma-coherent', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0-bus/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0-bus/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp0-bus/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: phy@120000 (marvell,comphy-cp110): phy@2: 'connector' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: connector (usb-a-connector): Unevaluated properties are not allowed ('phy-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1-bus/bus@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1-bus/bus@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cps-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb: /cp1-bus/bus@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
--
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap806-clock']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap806-thermal']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu@278: failed to match any schema with compatible: ['marvell,ap806-cpu-clock']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: thermal-zones: ap-cpu1-thermal:cooling-maps: 'fan-map' does not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cpm-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0-bus/bus@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0-bus/bus@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: mmc@780000 (marvell,armada-cp110-sdhci): Unevaluated properties are not allowed ('dma-coherent', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0-bus/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0-bus/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp0-bus/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
>> arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: phy@120000 (marvell,comphy-cp110): phy@2: 'connector' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: connector (usb-a-connector): Unevaluated properties are not allowed ('phy-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp1-bus/bus@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp1-bus/bus@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,armada-8k-cps-pinctrl']
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb: /cp1-bus/bus@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
--
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: mmc@6e0000 (marvell,armada-ap807-sdhci): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/cn9130-db.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9130-db.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
--
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: mmc@6e0000 (marvell,armada-ap807-sdhci): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9130-db-B.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
--
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: mmc@6e0000 (marvell,armada-ap807-sdhci): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/cn9131-db.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
--
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp0-bus/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp0-bus/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp0-bus/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: usb-phy-1 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: usb-phy-2 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: usb-phy-3 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-db.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp1-bus/bus@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp1-bus/bus@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: /cp1-bus/bus@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9131-db.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
--
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: mmc@6e0000 (marvell,armada-ap807-sdhci): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
--
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp0-bus/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp0-bus/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp0-bus/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: usb-phy-1 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: usb-phy-2 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: usb-phy-3 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
>> arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp1-bus/bus@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp1-bus/bus@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: /cp1-bus/bus@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9131-db-B.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
--
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: mmc@6e0000 (marvell,armada-ap807-sdhci): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
--
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp0-bus/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp0-bus/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp0-bus/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: usb-phy-1 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: usb-phy-2 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: usb-phy-3 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp1-bus/bus@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp1-bus/bus@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp1-bus/bus@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp1-bus/bus@f4000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp1-bus/bus@f4000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp1-bus/pcie@f4600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp1-bus/pcie@f4620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp1-bus/pcie@f4640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: usb-phy-4 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: usb-phy-5 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp2-bus/bus@f6000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp2-bus/bus@f6000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: /cp2-bus/bus@f6000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9132-db.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
--
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: mmc@6e0000 (marvell,armada-ap807-sdhci): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
--
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp0-bus/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp0-bus/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp0-bus/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: usb-phy-1 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: usb-phy-2 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: usb-phy-3 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp1-bus/bus@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp1-bus/bus@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp1-bus/bus@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp1-bus/bus@f4000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp1-bus/bus@f4000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp1-bus/pcie@f4600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp1-bus/pcie@f4620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp1-bus/pcie@f4640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: usb-phy-4 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: usb-phy-5 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
>> arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp2-bus/bus@f6000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp2-bus/bus@f6000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: /cp2-bus/bus@f6000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9132-db-B.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
--
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: mmc@6e0000 (marvell,armada-ap807-sdhci): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb: usb@500000 (marvell,armada-8k-xhci): 'phys' is a dependency of 'phy-names'
   	from schema $id: http://devicetree.org/schemas/phy/phy-consumer.yaml#
--
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: mmc@6e0000 (marvell,armada-ap807-sdhci): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: /cp0-bus/bus@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb: /cp0-bus/bus@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
--
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: mmc@6e0000 (marvell,armada-ap807-sdhci): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
--
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0-bus/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp0-bus/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: regulator-1 (regulator-gpio): 'gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/gpio-regulator.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: usb-phy-1 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: usb-phy-2 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: usb-phy-3 (usb-nop-xceiv): '#phy-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/usb-nop-xceiv.yaml#
>> arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp1-bus/bus@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp1-bus/bus@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: /cp1-bus/bus@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/ac5x-rd-carrier-cn9131.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
--
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: mmc@6e0000 (marvell,armada-ap807-sdhci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9130-cf-base.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'vbus-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
--
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: mmc@6e0000 (marvell,armada-ap807-sdhci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9130-cf-pro.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode', 'vbus-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
--
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: mmc@6e0000 (marvell,armada-ap807-sdhci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
--
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: gpio@41 (nxp,pca9536): '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: rtc@68 (st,m41t83): Unevaluated properties are not allowed ('reset-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/rtc/st,m41t80.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: mmc@780000 (marvell,armada-cp110-sdhci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0-bus/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0-bus/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp0-bus/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1-bus/bus@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1-bus/bus@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: /cp1-bus/bus@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
--
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: mmc@6e0000 (marvell,armada-ap807-sdhci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /soc/bus@f0000000/system-controller@6f4000/pinctrl: failed to match any schema with compatible: ['marvell,ap806-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /soc/bus@f0000000/system-controller@6f4000/clock: failed to match any schema with compatible: ['marvell,ap807-clock']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /soc/bus@f0000000/system-controller@6f8000/thermal-sensor@80: failed to match any schema with compatible: ['marvell,armada-ap807-thermal']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /soc/bus@f0000000/system-controller@6f8000/clock-cpu: failed to match any schema with compatible: ['marvell,ap807-cpu-clock']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0-bus/bus@f2000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0-bus/bus@f2000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0-bus/bus@f2000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: usb@510000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0-bus/bus@f2000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0-bus/bus@f2000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: mmc@780000 (marvell,armada-cp110-sdhci): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0-bus/pcie@f2600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0-bus/pcie@f2620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp0-bus/pcie@f2640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1-bus/bus@f4000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1-bus/bus@f4000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1-bus/bus@f4000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1-bus/bus@f4000000/spi@700600: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1-bus/bus@f4000000/spi@700680: failed to match any schema with compatible: ['marvell,armada-380-spi']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1-bus/pcie@f4600000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1-bus/pcie@f4620000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp1-bus/pcie@f4640000: failed to match any schema with compatible: ['marvell,armada8k-pcie', 'snps,dw-pcie']
>> arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: phy@120000 (marvell,comphy-cp110): 'phy@3', 'phy@4', 'phy@5' do not match any of the regexes: '^phy@[0-2]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2-bus/bus@f6000000/system-controller@440000/clock: failed to match any schema with compatible: ['marvell,cp110-clock']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2-bus/bus@f6000000/system-controller@440000/pinctrl: failed to match any schema with compatible: ['marvell,cp115-standalone-pinctrl']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: /cp2-bus/bus@f6000000/system-controller@400000/thermal-sensor@70: failed to match any schema with compatible: ['marvell,armada-cp110-thermal']
   arch/arm64/boot/dts/marvell/cn9132-clearfog.dtb: usb@500000 (marvell,armada-8k-xhci): Unevaluated properties are not allowed ('dr_mode' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
