Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC658F72
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jul 2024 02:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720666446; cv=none; b=WG901lOxLCleDJrS5P73chu4RgrCgfvCOm+WKkzzKgrWUHL9yB6ZGaDIz751g8C97pJliadu8Eo3dgkEXRdKCmF+t/aGV//Z4q8HdKmgPd2BCet9ecm9b8A1emBnsRvYO1BrZ5aLLK6QYY7rvUJxxFWJPu0BXLh6gn2cyzqgA1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720666446; c=relaxed/simple;
	bh=Oon68NiodylOuXSTlcb9m0/EaWiyOSwAFJQ4IKYVqzg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J73nwX59YkO+KZSXeDGMjXxA/2fULhpoeT6jgRyvV+2P1sWrioiZ3kPAbHi3B6Q4dfb6PNZqlMla10Xoi86RUQGBYHxXa65wYOqtftpmUI7jdLR5U2Y40wPfnJE+NDxYKw7FkaIsIRMM82Tw3tngxfLnD/YPbVNsMaD8ngjdF2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CChnhNuX; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CChnhNuX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720666443; x=1752202443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Oon68NiodylOuXSTlcb9m0/EaWiyOSwAFJQ4IKYVqzg=;
  b=CChnhNuXdN8RgsBpvPnAu1hhMls11IpBcWHcVy7fLbvloZUmyo3lbTQV
   jZ07bVhzMry3WK19k1b0vi1q8YLhvsYOxzO6vBdpp/SLOGQeKh0tdFG6j
   WkcUs1982u8FxaaD0dTvHacKsLq+0JBogw9qI5QIetl5j+LWbn5vxgFUZ
   +Bq828YAvRO0NBRwfty4Tv+GZAJF/pXj9pru2MpRf0DoyleBOI4r3fthf
   znUfKlHu0HTiOh4eWda67jOeiaM5/vN3vhRF3u4xpjrpwpdrZ0OremVK1
   fpdZKKSfH26GtxMySggorfWDniXxgtIazIq4RnS5Den+7PF1fB/Kn6tzS
   w==;
X-CSE-ConnectionGUID: YE9+rMMOTie30PWIcKbxgw==
X-CSE-MsgGUID: 8NBb23/FQJaMSMNh6dHu9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="21787252"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="21787252"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 19:54:02 -0700
X-CSE-ConnectionGUID: ircX8N9ATcWtUK8QiTKoAg==
X-CSE-MsgGUID: KdQb5/PPSq6nuCYUqOWQ0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="52714367"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Jul 2024 19:54:00 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRjwT-000YfG-2m;
	Thu, 11 Jul 2024 02:53:57 +0000
Date: Thu, 11 Jul 2024 10:53:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [freescale-fslc:6.6-1.0.x-imx 2607/11740]
 arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb:
 /ahb/apb/bus@1e78a000/i2c-bus@480/gpio@77: failed to match any schema with
 compatible: ['nxp,pca9539']
Message-ID: <202407111024.zK7pBX9h-lkp@intel.com>
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
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Otavio Salvador <otavio@ossystems.com.br>

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   13ed4e83694299049a3d4449fdb61471292ef19b
commit: 5c8cf515d45b79e8a788443c1446204e742a1549 [2607/11740] MLK-19251-01 gpio: max732x: add output IO default voltage set
:::::: branch date: 11 hours ago
:::::: commit date: 9 months ago
config: arm-randconfig-051-20240711 (https://download.01.org/0day-ci/archive/20240711/202407111024.zK7pBX9h-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.3.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407111024.zK7pBX9h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407111024.zK7pBX9h-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/bus@1e78a000/i2c-bus@280/i2c-mux@70/i2c@3/temperature-sensor@7c: failed to match any schema with compatible: ['microchip,emc1413']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/bus@1e78a000/i2c-bus@280/i2c-mux@70/i2c@3/temperature-sensor@4c: failed to match any schema with compatible: ['microchip,emc1413']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: i2c-bus@300: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: i2c-bus@380: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: i2c-bus@400: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: i2c-bus@480: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/bus@1e78a000/i2c-bus@480/gpio@77: failed to match any schema with compatible: ['nxp,pca9539']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: i2c-bus@500: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: i2c-bus@600: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: i2c-bus@780: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/fsi@1e79b100: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/fsi@1e79b100: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
--
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10: failed to match any schema with compatible: ['ipmb-dev']
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: i2c-bus@180: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: i2c-bus@1c0: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: i2c-bus@300: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: i2c-bus@340: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: /ahb/apb/bus@1e78a000/i2c-bus@340/pca9555@24: failed to match any schema with compatible: ['nxp,pca9555']
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: /ahb/apb/bus@1e78a000/i2c-bus@340/pca9555@25: failed to match any schema with compatible: ['nxp,pca9555']
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: i2c-bus@380: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: i2c-bus@3c0: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: i2c-bus@400: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: i2c-bus@440: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: i2c-bus@480: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: /ahb/apb/bus@1e78a000/i2c-bus@40/pca9541@79/i2c-arb/efuse@56: failed to match any schema with compatible: ['lm25066']
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: /ahb/apb/bus@1e78a000/i2c-bus@40/pca9541@79/i2c-arb/efuse@57: failed to match any schema with compatible: ['lm25066']
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: i2c-bus@80: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: i2c-bus@c0: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: i2c-bus@100: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: i2c-bus@140: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: /ahb/apb/bus@1e78a000/i2c-bus@140/pca9541@7a/i2c-arb/gpio@20: failed to match any schema with compatible: ['nxp,pca9534']
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: /ahb/apb/bus@1e78a000/i2c-bus@140/pca9541@7a/i2c-arb/efuse@10: failed to match any schema with compatible: ['lm25066']
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: /ahb/apb/bus@1e78a000/i2c-bus@140/pca9541@7a/i2c-arb/efuse@11: failed to match any schema with compatible: ['lm25066']
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: /ahb/apb/bus@1e78a000/i2c-bus@140/pca9541@7a/i2c-arb/efuse@12: failed to match any schema with compatible: ['lm25066']
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: /ahb/apb/bus@1e78a000/i2c-bus@140/pca9541@7a/i2c-arb/efuse@13: failed to match any schema with compatible: ['lm25066']
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: /ahb/apb/bus@1e78a000/i2c-bus@140/pca9541@7a/i2c-arb/efuse@14: failed to match any schema with compatible: ['lm25066']
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: /ahb/apb/bus@1e78a000/i2c-bus@140/pca9541@7a/i2c-arb/efuse@15: failed to match any schema with compatible: ['lm25066']
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: /ahb/apb/bus@1e78a000/i2c-bus@140/pca9541@7a/i2c-arb/efuse@16: failed to match any schema with compatible: ['lm25066']
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: /ahb/apb/bus@1e78a000/i2c-bus@140/pca9541@7a/i2c-arb/efuse@17: failed to match any schema with compatible: ['lm25066']
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: /ahb/apb/bus@1e78a000/i2c-bus@140/pca9541@7a/i2c-arb/efuse@40: failed to match any schema with compatible: ['lm25066']
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: /ahb/apb/bus@1e78a000/i2c-bus@140/pca9541@7a/i2c-arb/efuse@41: failed to match any schema with compatible: ['lm25066']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2600-ibt-bmc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: sdc@1e740000: sdhci@1e740100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: sdc@1e740000: sdhci@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: i2c-bus@80: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /ahb/apb/bus@1e78a000/i2c-bus@80/mp5023@40: failed to match any schema with compatible: ['mps,mp5023']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /ahb/apb/bus@1e78a000/i2c-bus@80/pca9536@41: failed to match any schema with compatible: ['nxp,pca9536']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /ahb/apb/bus@1e78a000/i2c-bus@80/pca9539@76: failed to match any schema with compatible: ['nxp,pca9539']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /ahb/apb/bus@1e78a000/i2c-bus@80/pca9552@67: failed to match any schema with compatible: ['nxp,pca9552']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: i2c-bus@100: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /ahb/apb/bus@1e78a000/i2c-bus@100/mp5023@40: failed to match any schema with compatible: ['mps,mp5023']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /ahb/apb/bus@1e78a000/i2c-bus@100/pca9536@41: failed to match any schema with compatible: ['nxp,pca9536']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /ahb/apb/bus@1e78a000/i2c-bus@100/pca9539@76: failed to match any schema with compatible: ['nxp,pca9539']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /ahb/apb/bus@1e78a000/i2c-bus@100/pca9552@67: failed to match any schema with compatible: ['nxp,pca9552']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: i2c-bus@180: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /ahb/apb/bus@1e78a000/i2c-bus@180/mp5023@40: failed to match any schema with compatible: ['mps,mp5023']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: i2c-bus@580: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: i2c-bus@600: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: power-sensor@10: compatible:0: 'adi, adm1272' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c-bus@600/power-sensor@10: failed to match any schema with compatible: ['adi, adm1272']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: power-sensor@12: compatible:0: 'adi, adm1272' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c-bus@600/power-sensor@12: failed to match any schema with compatible: ['adi, adm1272']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c-bus@600/gpio@20: failed to match any schema with compatible: ['nxp,pca9555']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c-bus@600/gpio@21: failed to match any schema with compatible: ['nxp,pca9555']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c-bus@600/gpio@22: failed to match any schema with compatible: ['nxp,pca9555']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c-bus@600/gpio@23: failed to match any schema with compatible: ['nxp,pca9555']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: i2c-bus@680: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: i2c-bus@700: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: i2c-bus@780: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: adc@1d: ti,mode: b'\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/adc@37: failed to match any schema with compatible: ['ti,adc128d818']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: i2c-mux@71: idle-state: [0] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: i2c-mux@71: Unevaluated properties are not allowed ('idle-state' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: adc@1f: ti,mode: b'\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@71/i2c@0/adc@1f: failed to match any schema with compatible: ['ti,adc128d818']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@71/i2c@0/pwm@20: failed to match any schema with compatible: ['max31790']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@71/i2c@0/gpio@22: failed to match any schema with compatible: ['ti,tca6424']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@71/i2c@0/pwm@23: failed to match any schema with compatible: ['max31790']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@71/i2c@0/gpio@61: failed to match any schema with compatible: ['nxp,pca9552']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: adc@1f: ti,mode: b'\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@71/i2c@1/adc@1f: failed to match any schema with compatible: ['ti,adc128d818']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@71/i2c@1/pwm@20: failed to match any schema with compatible: ['max31790']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@71/i2c@1/gpio@22: failed to match any schema with compatible: ['ti,tca6424']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@71/i2c@1/pwm@23: failed to match any schema with compatible: ['max31790']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@71/i2c@1/gpio@61: failed to match any schema with compatible: ['nxp,pca9552']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: i2c-mux@73: idle-state: [0] is not of type 'integer'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2600-ibt-bmc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: sdc@1e740000: sdhci@1e740100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: sdc@1e740000: sdhci@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: i2c-bus@80: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/bus@1e78a000/i2c-bus@80/tca9554@20: failed to match any schema with compatible: ['ti,tca9554']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: i2c-bus@100: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: i2c-bus@180: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/bus@1e78a000/i2c-bus@180/ucd90160@64: failed to match any schema with compatible: ['ti,ucd90160']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: i2c-bus@200: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: i2c-bus@280: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: i2c-bus@300: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2600-ibt-bmc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: sdc@1e740000: sdhci@1e740100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: sdc@1e740000: sdhci@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: i2c-bus@80: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/bus@1e78a000/i2c-bus@80/tca9554@20: failed to match any schema with compatible: ['ti,tca9554']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: i2c-bus@100: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: i2c-bus@180: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: i2c-bus@200: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/bus@1e78a000/i2c-bus@200/pca9552@61: failed to match any schema with compatible: ['nxp,pca9552']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: i2c-bus@280: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/bus@1e78a000/i2c-bus@280/i2c-mux@70/i2c@0/pca9551@60: failed to match any schema with compatible: ['nxp,pca9551']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2600-ibt-bmc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: sdc@1e740000: sdhci@1e740100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: sdc@1e740000: sdhci@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: i2c-bus@80: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/bus@1e78a000/i2c-bus@80/tca9554@20: failed to match any schema with compatible: ['ti,tca9554']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: i2c-bus@100: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: i2c-bus@180: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: i2c-bus@200: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/bus@1e78a000/i2c-bus@200/pca9552@61: failed to match any schema with compatible: ['nxp,pca9552']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: i2c-bus@280: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/bus@1e78a000/i2c-bus@280/i2c-mux@70/i2c@0/pca9551@60: failed to match any schema with compatible: ['nxp,pca9551']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2600-ibt-bmc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: sdc@1e740000: sdhci@1e740100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: sdc@1e740000: sdhci@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: i2c-bus@80: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/bus@1e78a000/i2c-bus@80/tca9554@20: failed to match any schema with compatible: ['ti,tca9554']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: i2c-bus@100: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: i2c-bus@180: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: i2c-bus@200: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/bus@1e78a000/i2c-bus@200/pca9552@61: failed to match any schema with compatible: ['nxp,pca9552']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: i2c-bus@280: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/bus@1e78a000/i2c-bus@280/i2c-mux@70/i2c@0/pca9551@60: failed to match any schema with compatible: ['nxp,pca9551']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: i2c-bus@140: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: i2c-bus@180: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: i2c-bus@1c0: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: i2c-bus@300: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: i2c-bus@340: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: /ahb/apb/bus@1e78a000/i2c-bus@340/pca9555@20: failed to match any schema with compatible: ['nxp,pca9555']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: /ahb/apb/bus@1e78a000/i2c-bus@340/pca9555@21: failed to match any schema with compatible: ['nxp,pca9555']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: /ahb/apb/bus@1e78a000/i2c-bus@340/pca9555@22: failed to match any schema with compatible: ['nxp,pca9555']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: /ahb/apb/bus@1e78a000/i2c-bus@340/pca9555@23: failed to match any schema with compatible: ['nxp,pca9555']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: /ahb/apb/bus@1e78a000/i2c-bus@340/pca9555@24: failed to match any schema with compatible: ['nxp,pca9555']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: /ahb/apb/bus@1e78a000/i2c-bus@340/pca9555@25: failed to match any schema with compatible: ['nxp,pca9555']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: i2c-bus@380: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: i2c-bus@3c0: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: i2c-bus@400: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: i2c-bus@140: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: i2c-bus@180: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: i2c-bus@1c0: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: i2c-bus@300: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: i2c-bus@340: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: /ahb/apb/bus@1e78a000/i2c-bus@340/pca9555@23: failed to match any schema with compatible: ['nxp,pca9555']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: /ahb/apb/bus@1e78a000/i2c-bus@340/pca9555@22: failed to match any schema with compatible: ['nxp,pca9555']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: /ahb/apb/bus@1e78a000/i2c-bus@340/pca9555@20: failed to match any schema with compatible: ['nxp,pca9555']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: /ahb/apb/bus@1e78a000/i2c-bus@340/pca9555@21: failed to match any schema with compatible: ['nxp,pca9555']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: i2c-bus@380: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: i2c-bus@3c0: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: /ahb/apb/bus@1e78a000/i2c-bus@3c0/pca9555@24: failed to match any schema with compatible: ['nxp,pca9555']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: /ahb/apb/bus@1e78a000/i2c-bus@3c0/pca9555@25: failed to match any schema with compatible: ['nxp,pca9555']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: i2c-bus@400: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: i2c-bus@440: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: i2c-bus@480: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: leds: 'bmc_alive', 'front-fan', 'front-memory', 'front-psu', 'front-syshot', 'identify' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: iio-hwmon: io-channels: [[57, 0], [57, 1], [57, 2], [57, 3], [57, 4], [57, 5], [57, 6], [57, 7], [57, 8], [57, 9], [57, 10], [57, 11], [57, 12], [57, 13], [57, 14], [57, 15]] is too long
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: /ahb/apb/bus@1e78a000/i2c-bus@300/si7021a20@20: failed to match any schema with compatible: ['si,si7021a20']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: /ahb/apb/bus@1e78a000/i2c-bus@300/pca9551@60: failed to match any schema with compatible: ['nxp,pca9551']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: i2c-bus@340: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: /ahb/apb/bus@1e78a000/i2c-bus@340/pca9552@60: failed to match any schema with compatible: ['nxp,pca9552']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: /ahb/apb/bus@1e78a000/i2c-bus@340/ucd90160@64: failed to match any schema with compatible: ['ti,ucd90160']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: i2c-bus@380: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: /ahb/apb/bus@1e78a000/i2c-bus@380/ir35221@71: failed to match any schema with compatible: ['infineon,ir35221']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: /ahb/apb/bus@1e78a000/i2c-bus@380/ir35221@72: failed to match any schema with compatible: ['infineon,ir35221']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: /ahb/apb/bus@1e78a000/i2c-bus@380/pca9539@74: failed to match any schema with compatible: ['nxp,pca9539']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: i2c-bus@3c0: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: /ahb/apb/bus@1e78a000/i2c-bus@3c0/ir35221@71: failed to match any schema with compatible: ['infineon,ir35221']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: /ahb/apb/bus@1e78a000/i2c-bus@3c0/ir35221@72: failed to match any schema with compatible: ['infineon,ir35221']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: /ahb/apb/bus@1e78a000/i2c-bus@3c0/pca9539@74: failed to match any schema with compatible: ['nxp,pca9539']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: i2c-bus@400: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: i2c-bus@440: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: i2c-bus@480: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: leds: 'fan0', 'fan1', 'fan2', 'fan3', 'fanboost', 'front-fault', 'front-id', 'front-power', 'rear-fault', 'rear-id' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: /gpio-fsi: failed to match any schema with compatible: ['fsi-master-gpio', 'fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dtb: /gpio-fsi: failed to match any schema with compatible: ['fsi-master-gpio', 'fsi-master']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: i2c-bus@80: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: i2c-bus@c0: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: i2c-bus@100: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: i2c-bus@140: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: i2c-bus@180: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: /ahb/apb/bus@1e78a000/i2c-bus@180/pca9555@27: failed to match any schema with compatible: ['nxp,pca9555']
   arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: i2c-bus@1c0: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: i2c-bus@340: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: leds: 'postcode0', 'postcode1', 'postcode2' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: sdc@1e740000: sdhci@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: i2c-bus@80: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: i2c-bus@100: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: i2c-bus@180: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: /ahb/apb/bus@1e78a000/i2c-bus@180/pca9535@20: failed to match any schema with compatible: ['nxp,pca9535']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: i2c-bus@200: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: i2c-bus@280: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: /ahb/apb/bus@1e78a000/i2c-bus@280/psu@58: failed to match any schema with compatible: ['pmbus']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: i2c-bus@300: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: /ahb/apb/bus@1e78a000/i2c-bus@300/psu@58: failed to match any schema with compatible: ['pmbus']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: i2c-bus@480: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: i2c-bus@380: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: i2c-bus@3c0: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: i2c-bus@400: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: at24@50: $nodename:0: 'at24@50' does not match '^eeprom@[0-9a-f]{1,2}$'
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: at24@50: Unevaluated properties are not allowed ('$nodename' was unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: /ahb/apb/bus@1e78a000/i2c-bus@400/gpio@21: failed to match any schema with compatible: ['nxp,pcal9535']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: /ahb/apb/bus@1e78a000/i2c-bus@400/gpio@27: failed to match any schema with compatible: ['nxp,pca9698']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: i2c-bus@440: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: i2c-bus@480: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: iio-hwmon: io-channels: [[50, 0], [50, 1], [50, 2], [50, 3], [50, 4], [50, 5], [50, 6], [50, 7], [50, 8], [50, 9], [50, 10], [50, 11], [50, 12], [50, 13], [50, 14], [50, 15]] is too long
   	from schema $id: http://devicetree.org/schemas/hwmon/iio-hwmon.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: leds: 'identify', 'power_fault', 'power_ok', 'status_amber', 'status_green' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: i2c-bus@380: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: i2c-bus@3c0: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: i2c-bus@400: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: at24@50: $nodename:0: 'at24@50' does not match '^eeprom@[0-9a-f]{1,2}$'
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: at24@50: Unevaluated properties are not allowed ('$nodename' was unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: /ahb/apb/bus@1e78a000/i2c-bus@400/gpio@21: failed to match any schema with compatible: ['nxp,pcal9535']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: /ahb/apb/bus@1e78a000/i2c-bus@400/gpio@23: failed to match any schema with compatible: ['nxp,pcal9535']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: /ahb/apb/bus@1e78a000/i2c-bus@400/gpio@27: failed to match any schema with compatible: ['nxp,pca9698']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: /ahb/apb/bus@1e78a000/i2c-bus@400/gpio@39: failed to match any schema with compatible: ['nxp,pca9554']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: i2c-bus@440: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: i2c-bus@480: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: at24@50: $nodename:0: 'at24@50' does not match '^eeprom@[0-9a-f]{1,2}$'
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: at24@50: Unevaluated properties are not allowed ('$nodename' was unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: iio-hwmon: io-channels: [[51, 0], [51, 1], [51, 2], [51, 3], [51, 4], [51, 5], [51, 6], [51, 7], [51, 8], [51, 9], [51, 10], [51, 11], [51, 12], [51, 13], [51, 14], [51, 15]] is too long
   	from schema $id: http://devicetree.org/schemas/hwmon/iio-hwmon.yaml#
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: i2c-bus@380: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: i2c-bus@3c0: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: i2c-bus@400: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: at24@50: $nodename:0: 'at24@50' does not match '^eeprom@[0-9a-f]{1,2}$'
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: at24@50: Unevaluated properties are not allowed ('$nodename' was unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: /ahb/apb/bus@1e78a000/i2c-bus@400/gpio@21: failed to match any schema with compatible: ['nxp,pcal9535']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: /ahb/apb/bus@1e78a000/i2c-bus@400/gpio@27: failed to match any schema with compatible: ['nxp,pca9698']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: i2c-bus@440: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: i2c-bus@480: Unevaluated properties are not allowed ('#interrupt-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: iio-hwmon: io-channels: [[51, 0], [51, 1], [51, 2], [51, 3], [51, 4], [51, 5], [51, 6], [51, 7], [51, 8], [51, 9], [51, 10], [51, 11], [51, 12], [51, 13], [51, 14], [51, 15]] is too long
   	from schema $id: http://devicetree.org/schemas/hwmon/iio-hwmon.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: leds: 'identify', 'power_fault', 'power_ok', 'status_amber', 'status_green' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
