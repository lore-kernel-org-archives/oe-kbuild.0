Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD2E175A74
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Jun 2026 18:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782151918; cv=none; b=CnMTV9xtTuwUyFDNEAMpI1GAcon2UR6W81O4JaUiBIC8QxUuxC3UgppuSGdt+m4ij+hNoE+HQHpf9tjN4reHpQ8sjzOKqCAM84ZHumZvpnjJqQYR3aEwFq+rYlzGH69PJaXisvk/HY4z406NP+FY7zuhmyuKMQKYjQa/VfJ2Qss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782151918; c=relaxed/simple;
	bh=5iIE3yy9JXE5DOurM1cKROAblTIzbDPcCluHU5CP+bc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ae8ECsQgOvIFzbbauvx27xIA3SdqIRt9e47v11iYQ1vzftS2Jj5Ch/22DbwIgbQGNlmNqX8XlRy/L2ji6mkPIYCHlZNuUUMO43Ed+Foc/kmXritxbtUJ5N++nm/Hom8U3jQVrvTnPkOQbrCtLt+yjsNDr8TZrCCDUYXGnpuEkRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oD8F7SxZ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oD8F7SxZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782151916; x=1813687916;
  h=date:from:to:cc:subject:message-id;
  bh=5iIE3yy9JXE5DOurM1cKROAblTIzbDPcCluHU5CP+bc=;
  b=oD8F7SxZSPNQG4/7dEc1BlWbDeZJzxhvb9Id8/6AyR9kOhEO4zvI6rON
   i73sWESIIln6Hefs2QifNCAXYXWtDoiLs6uB4AdIAF6Y8P2W+OJA4JEW4
   1stgnXGxnxJk0yZoTAzEHiYpsKlWl8AVuNDGTQN8xwSxhlguFzz6TqAbc
   q6I7BtDP/Mh0Fyy6LgdZmAYyqaueIbDPcJiPgsfcHBp9ce8+01VgNVEC7
   7zOZEAa3NW/gszSuxtiCZfQxiEaP9PpfptSnd2ktN9kLddbtEN9zUqZw0
   /iHYJ1qOcXCHG7FqVi2+jUzhL6nwQ8o1ybJRxmmlchf+pKKX05ltrQqxi
   Q==;
X-CSE-ConnectionGUID: U8ElIvgnQQqbkZGRRaqJMQ==
X-CSE-MsgGUID: pOeQQOfeQBasL6IFAXx7HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="86576681"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="86576681"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 11:11:55 -0700
X-CSE-ConnectionGUID: 0gzvpmB0Rl2KRxwqZEg7UQ==
X-CSE-MsgGUID: 5llDkIzAQGKqFJ6NrUCkkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="253631671"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 22 Jun 2026 11:11:53 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbj7f-0000000064L-1Aur;
	Mon, 22 Jun 2026 18:11:51 +0000
Date: Mon, 22 Jun 2026 20:11:19 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/microchip/at91rm9200ek.dtb: timer@fffffd00
 (atmel,at91rm9200-st): Unevaluated properties are not allowed ('watchdog' was
 unexpected)
Message-ID: <202606222024.XGKo4u2D-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Akhila YS <akhilayalmati@gmail.com>
CC: Claudiu Beznea <claudiu.beznea@tuxon.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ef0c9f75a19532d7675384708fc8621e10850104
commit: ae18e2543c4a07317a03c7cf042d8a0596cd5bd0 dt-bindings: arm: atmel,at91rm9200-st: convert to DT schema
date:   4 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-2051-20260619 (https://download.01.org/0day-ci/archive/20260622/202606222024.XGKo4u2D-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260622/202606222024.XGKo4u2D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ae18e2543c4a ("dt-bindings: arm: atmel,at91rm9200-st: convert to DT schema")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606222024.XGKo4u2D-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'microchip,sama7g5' was expected
   	'microchip,lan9662' was expected
   	'microchip,lan9668' was expected
   	'kontron,s1921' was expected
   	'atmel,sams70' was expected
   	'atmel,samv70' was expected
   	'atmel,samv71' was expected
   	from schema $id: http://devicetree.org/schemas/arm/atmel-at91.yaml
   arch/arm/boot/dts/microchip/at91rm9200ek.dtb: /: failed to match any schema with compatible: ['atmel,at91rm9200ek', 'atmel,at91rm9200']
   arch/arm/boot/dts/microchip/at91rm9200ek.dtb: /ahb/apb/ramc@ffffff00: failed to match any schema with compatible: ['atmel,at91rm9200-sdramc', 'syscon']
>> arch/arm/boot/dts/microchip/at91rm9200ek.dtb: timer@fffffd00 (atmel,at91rm9200-st): Unevaluated properties are not allowed ('watchdog' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/atmel,at91rm9200-st.yaml
   arch/arm/boot/dts/microchip/at91rm9200ek.dtb: watchdog (atmel,at91rm9200-wdt): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/watchdog/atmel,at91rm9200-wdt.yaml
   arch/arm/boot/dts/microchip/at91rm9200ek.dtb: ethernet@fffbc000 (cdns,at91rm9200-emac): Unevaluated properties are not allowed ('ethernet-phy' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/cdns,macb.yaml
   arch/arm/boot/dts/microchip/at91rm9200ek.dtb: ethernet-phy: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/arm/boot/dts/microchip/at91rm9200ek.dtb: /ahb/apb/gadget@fffb0000: failed to match any schema with compatible: ['atmel,at91rm9200-udc']
   arch/arm/boot/dts/microchip/at91rm9200ek.dtb: /ahb/nand@40000000: failed to match any schema with compatible: ['atmel,at91rm9200-nand']
   arch/arm/boot/dts/microchip/at91rm9200ek.dtb: usb@300000 (atmel,at91rm9200-ohci): compatible: 'oneOf' conditional failed, one must be fixed:
--
   	'microchip,sama7g5' was expected
   	'microchip,lan9662' was expected
   	'microchip,lan9668' was expected
   	'kontron,s1921' was expected
   	'atmel,sams70' was expected
   	'atmel,samv70' was expected
   	'atmel,samv71' was expected
   	from schema $id: http://devicetree.org/schemas/arm/atmel-at91.yaml
   arch/arm/boot/dts/microchip/mpa1600.dtb: /: failed to match any schema with compatible: ['phontech,mpa1600', 'atmel,at91rm9200']
   arch/arm/boot/dts/microchip/mpa1600.dtb: /ahb/apb/ramc@ffffff00: failed to match any schema with compatible: ['atmel,at91rm9200-sdramc', 'syscon']
>> arch/arm/boot/dts/microchip/mpa1600.dtb: timer@fffffd00 (atmel,at91rm9200-st): Unevaluated properties are not allowed ('watchdog' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/atmel,at91rm9200-st.yaml
   arch/arm/boot/dts/microchip/mpa1600.dtb: watchdog (atmel,at91rm9200-wdt): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/watchdog/atmel,at91rm9200-wdt.yaml
   arch/arm/boot/dts/microchip/mpa1600.dtb: /ahb/apb/gadget@fffb0000: failed to match any schema with compatible: ['atmel,at91rm9200-udc']
   arch/arm/boot/dts/microchip/mpa1600.dtb: /ahb/nand@40000000: failed to match any schema with compatible: ['atmel,at91rm9200-nand']
   arch/arm/boot/dts/microchip/mpa1600.dtb: usb@300000 (atmel,at91rm9200-ohci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['atmel,at91rm9200-ohci', 'usb-ohci'] is too long
   	'atmel,at91rm9200-ohci' is not one of ['allwinner,sun4i-a10-ohci', 'allwinner,sun50i-a100-ohci', 'allwinner,sun50i-a64-ohci', 'allwinner,sun50i-h6-ohci', 'allwinner,sun50i-h616-ohci', 'allwinner,sun55i-a523-ohci', 'allwinner,sun5i-a13-ohci', 'allwinner,sun6i-a31-ohci', 'allwinner,sun7i-a20-ohci', 'allwinner,sun8i-a23-ohci', 'allwinner,sun8i-a83t-ohci', 'allwinner,sun8i-h3-ohci', 'allwinner,sun8i-r40-ohci', 'allwinner,sun8i-v3s-ohci', 'allwinner,sun9i-a80-ohci', 'allwinner,sun20i-d1-ohci', 'brcm,bcm3384-ohci', 'brcm,bcm63268-ohci', 'brcm,bcm6328-ohci', 'brcm,bcm6358-ohci', 'brcm,bcm6362-ohci', 'brcm,bcm6368-ohci', 'brcm,bcm7125-ohci', 'brcm,bcm7346-ohci', 'brcm,bcm7358-ohci', 'brcm,bcm7360-ohci', 'brcm,bcm7362-ohci', 'brcm,bcm7420-ohci', 'brcm,bcm7425-ohci', 'brcm,bcm7435-ohci', 'hpe,gxp-ohci', 'ibm,476gtr-ohci', 'ingenic,jz4740-ohci', 'rockchip,rk3588-ohci', 'snps,hsdk-v1.0-ohci']
   	'atmel,at91rm9200-ohci' is not one of ['generic-ohci', 'ti,ohci-omap3']
   	'atmel,at91rm9200-ohci' is not one of ['cavium,octeon-6335-ohci', 'nintendo,hollywood-usb-ohci', 'nxp,ohci-nxp', 'st,spear600-ohci']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
