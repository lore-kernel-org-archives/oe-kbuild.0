Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACDF42A9B
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Nov 2024 14:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730730319; cv=none; b=mzL3a5fcO1tINL6wulTphYz1mvy4f8cD3ocgQV4OmWIe0XVK7sqBEQxOYYGyBMWTG2/rxGVjrpzCGzQSrSkPNXEtcC1lQTBZcD3gEfzUJAjeO30mrmZM1y5t3NDBbcfgjkJp6y5462BE9+6lZ1WclOXmiR8xl2H88lGyp1gQW7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730730319; c=relaxed/simple;
	bh=g8ue4P5HFY6S2y860sel4IfGNN1rWcBEBd6otQq1kBA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C5BJuoKv4Qep3O6tNXDbdZkrZHGE0s1KGU8AqEmeRDnUu4urL8NWgBkzFUfvbzyxoBu1qNWEXnecq2RBcKLb7XaKWv58WDXkMG/VytdA+YzgHEIeiWaG94hO9iuwurDDBSLWmViC/UvAcc3N8ZYHlpU+Z8R2lsdk7qVNO1emlJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m/uHG4QI; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m/uHG4QI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730730317; x=1762266317;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g8ue4P5HFY6S2y860sel4IfGNN1rWcBEBd6otQq1kBA=;
  b=m/uHG4QIxXHn4eHOQ0/OPDMHHXw2osnQPNl7SXYMnOKWdXOfIv2BORoF
   hUNeSsHJ3NYL2Bw/0PUYeI5JpPrAjtnKeEqxUGH6AHFP8vLSpOgixVjV6
   aWsCjg8qLZw30V0e37POvvnI3G3+Ubdee5cURuAtRt3F++84p5ip9recR
   l1hxF05jMXYOa2f48oNOQw+eqgzYfiHl0Onfz8Uzq5B3SwRGT/9m2/HZC
   jtK3cYJv1x2Wiby1E9+8zMLr77qldkd70+jZyfeFbQ9B3waaIYzKI41Jn
   ayOUNjsOBPlN/ebNIaiJII2D5lTXaFXkzH5oY5K5RdgbQxQioaCfbt8N8
   A==;
X-CSE-ConnectionGUID: 0dZYt/HjTZqp33dcHGgizA==
X-CSE-MsgGUID: +oeTGhqlT7+H2/fyCeZWWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52993361"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52993361"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 06:25:16 -0800
X-CSE-ConnectionGUID: IXUNKcY+R0ylyYgt112G1w==
X-CSE-MsgGUID: +rOOGTlPT8qZaQ1KLmEkFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="84113958"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Nov 2024 06:25:16 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7y13-000ktx-1P;
	Mon, 04 Nov 2024 14:25:13 +0000
Date: Mon, 4 Nov 2024 22:24:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android15-6.6-desktop 1/1]
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /: failed to
 match any schema with compatible: ['google,pico-sku1', 'google,pico',
 'mediatek,mt8183']
Message-ID: <202411042239.YItwcZ1v-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   81bd1eb3862e37f2ce6e1148ed51ac214ab5c007
commit: cbae8f3e9b30d9136bff1155071d3d2505c45e64 [1/1] CHROMIUM: arm64: dts: mt8183: Use icarus dtsi for pico dts file
:::::: branch date: 4 days ago
:::::: commit date: 6 months ago
config: arm64-randconfig-051-20241030 (https://download.01.org/0day-ci/archive/20241104/202411042239.YItwcZ1v-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411042239.YItwcZ1v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411042239.YItwcZ1v-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'google,kakadu-rev2-sku22' was expected
   	'google,kodama' was expected
   	'google,willow' was expected
   	'mediatek,mt8365' was expected
   	'mediatek,mt8516' was expected
   	'google,elm-rev6' was expected
   	'google,hana-rev4' was expected
   	'google,spherion-rev1' was expected
   	'google,kakadu' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /: failed to match any schema with compatible: ['google,pico-sku1', 'google,pico', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /: failed to match any schema with compatible: ['google,pico-sku1', 'google,pico', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: pinctrl@10005000: mmc0-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-ds:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: pinctrl@10005000: mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
