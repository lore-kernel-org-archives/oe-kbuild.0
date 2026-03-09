Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4E02D8DCA
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Mar 2026 17:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773078516; cv=none; b=napVvLx2ex3R8nRSuAXNFAiYkZ2KhFonzjpKFQHkIXJM5oEnMojcYh3yAdNKsRD6iuxQqVYQqPDigWhW6/DDalw7dA+Gat2VXq/f9aO+pbupcqUVQL8313W2LatCCYoEJpegaCSv6TBrrXgOgNN1bjy0zKx235NIHRCeZkxhmk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773078516; c=relaxed/simple;
	bh=G+Ha1wAHX8A/EtKTSSLf3ySSPxl+Dgr6/klYhXDAJEI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Tbw7S68TwJNYRq6XHGJ69l43S5CvSY6hXVDqHy2420xuWR3ddrhkwYc1iTr0+VlivAJaWZBWOe8TEAH/V4OxgwtnBSOUyYAANMcV4bzmWZ/sjs1uL2HG7S6Dcr3FXdD8qbk+majoBvQPzUWDQOnmnObYQGLr5CSBZAJ0ZTU4/Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C4WRf0I+; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C4WRf0I+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773078513; x=1804614513;
  h=date:from:to:cc:subject:message-id;
  bh=G+Ha1wAHX8A/EtKTSSLf3ySSPxl+Dgr6/klYhXDAJEI=;
  b=C4WRf0I+cVPdV8U+CJqsyCAgnN55t0MaefaFsKq+uP/pzvhlU4mo3qRm
   3ro+fhdsMms+nbFvJlAXmhRhMc6KMiks4xwaBMwZueBQBP78RiGdoq97X
   mbyRMIQjh+wvrCIsELivkhhqG+Uu/m3RazAZY+823YqiGEBmnlwJSKGdx
   U3Ra783Ar6pTncim8G4yseZ+Ku/ol5NQzx0M/JVMllPGO8y02XgrZ1Pwo
   Ff0Sln7iGhyv568wNsZ/iNmhJaAFGtMezKbN3IxvznezLl8QuiZdunJDw
   wPmaIi9oWleo0L/JqIjqnUmV/qk/izCjC2wLVN5GmWI/r55KuTTUj+Yju
   Q==;
X-CSE-ConnectionGUID: qAZDfxw9RJWbgjE2ZlwCtw==
X-CSE-MsgGUID: pZos8iXVTQaOeE6255c4CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="85200531"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="85200531"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 10:48:33 -0700
X-CSE-ConnectionGUID: z81WH0WfTSauYZhMfaGVFQ==
X-CSE-MsgGUID: hZbU19AYShquX7VUhl+TlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="218972980"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 09 Mar 2026 10:48:32 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzeiT-000000002uL-2TDg;
	Mon, 09 Mar 2026 17:48:29 +0000
Date: Mon, 09 Mar 2026 18:48:17 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [at91:at91-next 4/9]
 arch/arm/boot/dts/microchip/at91rm9200ek.dtb: timer@fffffd00
 (atmel,at91rm9200-st): Unevaluated properties are not allowed ('watchdog' was
 unexpected)
Message-ID: <202603091833.WSAsXQYH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Akhila YS <akhilayalmati@gmail.com>
CC: Claudiu Beznea <claudiu.beznea@tuxon.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git at91-next
head:   f082fefaf9abb93d234835e160e54661392472bb
commit: ae18e2543c4a07317a03c7cf042d8a0596cd5bd0 [4/9] dt-bindings: arm: atmel,at91rm9200-st: convert to DT schema
:::::: branch date: 25 hours ago
:::::: commit date: 2 days ago
config: arm-randconfig-2052-20260308 (https://download.01.org/0day-ci/archive/20260309/202603091833.WSAsXQYH-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260309/202603091833.WSAsXQYH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603091833.WSAsXQYH-lkp@intel.com/

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
