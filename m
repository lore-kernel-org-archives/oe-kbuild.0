Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FA7390C9F
	for <oe-kbuild@lists.linux.dev>; Fri, 22 May 2026 13:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779454892; cv=none; b=o413sWPJp+NLIU5jSf8+mgzvm5RnshYpjcr6xsuJh0J3WpKHCl1GXd4A2OYGe7rtTWpwVs3m65+EqBXW5sK5K4MsPWD6djsjEA7Ogwh0YSVY+9O3ODnBDOT9gLUCuICLrnEnmX3g16uVwND4JZEMPAZOHKR9DEhFqQMKnsxJOSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779454892; c=relaxed/simple;
	bh=4Bh9ChutTZoXd1muFh52Jj7Jv4fQ8oQNzOZtEPyG1SY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I+JjUk6skxtawwREyPQgIRiHi7UvJb10NSlzG/j4PyA76ghl9/cOYCt73POC7hZKbUAWebvA1ivPWf/ywM3+X0DksjS8CNbS5ruhcRWMd3r11jRHTTEUcw1T+lZBSjLib4aKebXwkZnCVBqwXEL+YK1n7X2H1BUawGYJ9ci5cGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bpAplFZd; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bpAplFZd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779454890; x=1810990890;
  h=date:from:to:cc:subject:message-id;
  bh=4Bh9ChutTZoXd1muFh52Jj7Jv4fQ8oQNzOZtEPyG1SY=;
  b=bpAplFZdMW54ZN4FjL9IlqG69PB5QQlepuSAkKWD6Lq6cEcOLzxNfIa0
   xJPj3a+FdHxeZqwb/Es8Bwv8jY6UOhEPie564OyyfpSUqydnWn0wbjAn2
   /Mpl6pBHDucftFLk1Lx4CrFFOUaWlLhgubEERlX60Mk225QGz9Mr8sgJL
   UIk+NSw/8V9qcah9r8t/ta4lccaRhtTDzcezeIYDk6dm9bGJwH2NGbp02
   GtoRaNTg82Af74oCBDO9gu+EnjIBu2F+5QD0CQvd9MJWN18wLhVeoni9m
   FZAQx5B3HfdNVayjGO/VPUsBty526UMWTmg7MBG1pq4KQ/PWk3HmVlecq
   w==;
X-CSE-ConnectionGUID: n3zReqUWSDCfO/elnniOzQ==
X-CSE-MsgGUID: QSqrUqyzTuK09O7RVZhmag==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="80352275"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="80352275"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 06:01:30 -0700
X-CSE-ConnectionGUID: bYUHXzFvSOysH5UaSEjkKA==
X-CSE-MsgGUID: EACOmGIJQDK78cnj/7VUvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="236686228"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 22 May 2026 06:01:28 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQPVG-00000000BM1-0e4u;
	Fri, 22 May 2026 13:01:26 +0000
Date: Fri, 22 May 2026 15:01:04 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/broadcom/bcm911360_entphn.dtb:
 wdt@18009000 (arm,sp805): $nodename:0: 'wdt@18009000' does not match
 '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
Message-ID: <202605221419.xGOdmhFO-lkp@intel.com>
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
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Wim Van Sebroeck <wim@linux-watchdog.org>
CC: Guenter Roeck <linux@roeck-us.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6779b50faa562e6cca1aa6a4649a4d764c6c7e28
commit: 017bca91639f01302382013033b685ec8759aba4 dt-bindings: watchdog: Allow node names named 'pmic'
date:   6 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 6 months ago
config: arm-randconfig-2052-20260520 (https://download.01.org/0day-ci/archive/20260522/202605221419.xGOdmhFO-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605221419.xGOdmhFO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 017bca91639f ("dt-bindings: watchdog: Allow node names named 'pmic'")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605221419.xGOdmhFO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/broadcom/bcm911360_entphn.dtb: /axi/mailbox@3024024: failed to match any schema with compatible: ['brcm,iproc-mailbox']
   arch/arm/boot/dts/broadcom/bcm911360_entphn.dtb: switch@18007000 (brcm,bcm11360-srab): ports:port@8: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm911360_entphn.dtb: switch@18007000 (brcm,bcm11360-srab): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
   arch/arm/boot/dts/broadcom/bcm911360_entphn.dtb: i2c@18008000 (brcm,cygnus-iproc-i2c): compatible:0: 'brcm,cygnus-iproc-i2c' is not one of ['brcm,iproc-i2c', 'brcm,iproc-nic-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/brcm,iproc-i2c.yaml
   arch/arm/boot/dts/broadcom/bcm911360_entphn.dtb: i2c@18008000 (brcm,cygnus-iproc-i2c): compatible: ['brcm,cygnus-iproc-i2c', 'brcm,iproc-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/brcm,iproc-i2c.yaml
   arch/arm/boot/dts/broadcom/bcm911360_entphn.dtb: /axi/i2c@18008000: failed to match any schema with compatible: ['brcm,cygnus-iproc-i2c', 'brcm,iproc-i2c']
>> arch/arm/boot/dts/broadcom/bcm911360_entphn.dtb: wdt@18009000 (arm,sp805): $nodename:0: 'wdt@18009000' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/arm,sp805.yaml
   arch/arm/boot/dts/broadcom/bcm911360_entphn.dtb: i2c@1800b000 (brcm,cygnus-iproc-i2c): compatible:0: 'brcm,cygnus-iproc-i2c' is not one of ['brcm,iproc-i2c', 'brcm,iproc-nic-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/brcm,iproc-i2c.yaml
   arch/arm/boot/dts/broadcom/bcm911360_entphn.dtb: i2c@1800b000 (brcm,cygnus-iproc-i2c): compatible: ['brcm,cygnus-iproc-i2c', 'brcm,iproc-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/brcm,iproc-i2c.yaml
   arch/arm/boot/dts/broadcom/bcm911360_entphn.dtb: /axi/i2c@1800b000: failed to match any schema with compatible: ['brcm,cygnus-iproc-i2c', 'brcm,iproc-i2c']
   arch/arm/boot/dts/broadcom/bcm911360_entphn.dtb: dma@18018000 (arm,pl330): $nodename:0: 'dma@18018000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/arm,pl330.yaml
   arch/arm/boot/dts/broadcom/bcm911360_entphn.dtb: sdhci@18041000 (brcm,sdhci-iproc-cygnus): $nodename:0: 'sdhci@18041000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/brcm,iproc-sdhci.yaml
--
   arch/arm/boot/dts/broadcom/bcm911360k.dtb: axi (simple-bus): gpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/broadcom/bcm911360k.dtb: /axi/otp@301c800: failed to match any schema with compatible: ['brcm,ocotp']
   arch/arm/boot/dts/broadcom/bcm911360k.dtb: /axi/pinctrl@301d0c8: failed to match any schema with compatible: ['brcm,cygnus-pinmux']
   arch/arm/boot/dts/broadcom/bcm911360k.dtb: /axi/mailbox@3024024: failed to match any schema with compatible: ['brcm,iproc-mailbox']
   arch/arm/boot/dts/broadcom/bcm911360k.dtb: i2c@18008000 (brcm,cygnus-iproc-i2c): compatible:0: 'brcm,cygnus-iproc-i2c' is not one of ['brcm,iproc-i2c', 'brcm,iproc-nic-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/brcm,iproc-i2c.yaml
   arch/arm/boot/dts/broadcom/bcm911360k.dtb: i2c@18008000 (brcm,cygnus-iproc-i2c): compatible: ['brcm,cygnus-iproc-i2c', 'brcm,iproc-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/brcm,iproc-i2c.yaml
   arch/arm/boot/dts/broadcom/bcm911360k.dtb: /axi/i2c@18008000: failed to match any schema with compatible: ['brcm,cygnus-iproc-i2c', 'brcm,iproc-i2c']
>> arch/arm/boot/dts/broadcom/bcm911360k.dtb: wdt@18009000 (arm,sp805): $nodename:0: 'wdt@18009000' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/arm,sp805.yaml
   arch/arm/boot/dts/broadcom/bcm911360k.dtb: i2c@1800b000 (brcm,cygnus-iproc-i2c): compatible:0: 'brcm,cygnus-iproc-i2c' is not one of ['brcm,iproc-i2c', 'brcm,iproc-nic-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/brcm,iproc-i2c.yaml
   arch/arm/boot/dts/broadcom/bcm911360k.dtb: i2c@1800b000 (brcm,cygnus-iproc-i2c): compatible: ['brcm,cygnus-iproc-i2c', 'brcm,iproc-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/brcm,iproc-i2c.yaml
   arch/arm/boot/dts/broadcom/bcm911360k.dtb: /axi/i2c@1800b000: failed to match any schema with compatible: ['brcm,cygnus-iproc-i2c', 'brcm,iproc-i2c']
   arch/arm/boot/dts/broadcom/bcm911360k.dtb: dma@18018000 (arm,pl330): $nodename:0: 'dma@18018000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/arm,pl330.yaml
   arch/arm/boot/dts/broadcom/bcm911360k.dtb: sdhci@18041000 (brcm,sdhci-iproc-cygnus): $nodename:0: 'sdhci@18041000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/brcm,iproc-sdhci.yaml
--
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/broadcom/bcm958300k.dtb: /axi/otp@301c800: failed to match any schema with compatible: ['brcm,ocotp']
   arch/arm/boot/dts/broadcom/bcm958300k.dtb: /axi/pinctrl@301d0c8: failed to match any schema with compatible: ['brcm,cygnus-pinmux']
   arch/arm/boot/dts/broadcom/bcm958300k.dtb: /axi/mailbox@3024024: failed to match any schema with compatible: ['brcm,iproc-mailbox']
   arch/arm/boot/dts/broadcom/bcm958300k.dtb: i2c@18008000 (brcm,cygnus-iproc-i2c): compatible:0: 'brcm,cygnus-iproc-i2c' is not one of ['brcm,iproc-i2c', 'brcm,iproc-nic-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/brcm,iproc-i2c.yaml
   arch/arm/boot/dts/broadcom/bcm958300k.dtb: i2c@18008000 (brcm,cygnus-iproc-i2c): compatible: ['brcm,cygnus-iproc-i2c', 'brcm,iproc-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/brcm,iproc-i2c.yaml
   arch/arm/boot/dts/broadcom/bcm958300k.dtb: /axi/i2c@18008000: failed to match any schema with compatible: ['brcm,cygnus-iproc-i2c', 'brcm,iproc-i2c']
>> arch/arm/boot/dts/broadcom/bcm958300k.dtb: wdt@18009000 (arm,sp805): $nodename:0: 'wdt@18009000' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/arm,sp805.yaml
   arch/arm/boot/dts/broadcom/bcm958300k.dtb: i2c@1800b000 (brcm,cygnus-iproc-i2c): compatible:0: 'brcm,cygnus-iproc-i2c' is not one of ['brcm,iproc-i2c', 'brcm,iproc-nic-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/brcm,iproc-i2c.yaml
   arch/arm/boot/dts/broadcom/bcm958300k.dtb: i2c@1800b000 (brcm,cygnus-iproc-i2c): compatible: ['brcm,cygnus-iproc-i2c', 'brcm,iproc-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/brcm,iproc-i2c.yaml
   arch/arm/boot/dts/broadcom/bcm958300k.dtb: /axi/i2c@1800b000: failed to match any schema with compatible: ['brcm,cygnus-iproc-i2c', 'brcm,iproc-i2c']
   arch/arm/boot/dts/broadcom/bcm958300k.dtb: dma@18018000 (arm,pl330): $nodename:0: 'dma@18018000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/arm,pl330.yaml
   arch/arm/boot/dts/broadcom/bcm958300k.dtb: sdhci@18041000 (brcm,sdhci-iproc-cygnus): $nodename:0: 'sdhci@18041000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/brcm,iproc-sdhci.yaml
--
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/broadcom/bcm958305k.dtb: /axi/otp@301c800: failed to match any schema with compatible: ['brcm,ocotp']
   arch/arm/boot/dts/broadcom/bcm958305k.dtb: /axi/pinctrl@301d0c8: failed to match any schema with compatible: ['brcm,cygnus-pinmux']
   arch/arm/boot/dts/broadcom/bcm958305k.dtb: /axi/mailbox@3024024: failed to match any schema with compatible: ['brcm,iproc-mailbox']
   arch/arm/boot/dts/broadcom/bcm958305k.dtb: i2c@18008000 (brcm,cygnus-iproc-i2c): compatible:0: 'brcm,cygnus-iproc-i2c' is not one of ['brcm,iproc-i2c', 'brcm,iproc-nic-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/brcm,iproc-i2c.yaml
   arch/arm/boot/dts/broadcom/bcm958305k.dtb: i2c@18008000 (brcm,cygnus-iproc-i2c): compatible: ['brcm,cygnus-iproc-i2c', 'brcm,iproc-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/brcm,iproc-i2c.yaml
   arch/arm/boot/dts/broadcom/bcm958305k.dtb: /axi/i2c@18008000: failed to match any schema with compatible: ['brcm,cygnus-iproc-i2c', 'brcm,iproc-i2c']
>> arch/arm/boot/dts/broadcom/bcm958305k.dtb: wdt@18009000 (arm,sp805): $nodename:0: 'wdt@18009000' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/arm,sp805.yaml
   arch/arm/boot/dts/broadcom/bcm958305k.dtb: i2c@1800b000 (brcm,cygnus-iproc-i2c): compatible:0: 'brcm,cygnus-iproc-i2c' is not one of ['brcm,iproc-i2c', 'brcm,iproc-nic-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/brcm,iproc-i2c.yaml
   arch/arm/boot/dts/broadcom/bcm958305k.dtb: i2c@1800b000 (brcm,cygnus-iproc-i2c): compatible: ['brcm,cygnus-iproc-i2c', 'brcm,iproc-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/brcm,iproc-i2c.yaml
   arch/arm/boot/dts/broadcom/bcm958305k.dtb: /axi/i2c@1800b000: failed to match any schema with compatible: ['brcm,cygnus-iproc-i2c', 'brcm,iproc-i2c']
   arch/arm/boot/dts/broadcom/bcm958305k.dtb: dma@18018000 (arm,pl330): $nodename:0: 'dma@18018000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/arm,pl330.yaml
   arch/arm/boot/dts/broadcom/bcm958305k.dtb: sdhci@18041000 (brcm,sdhci-iproc-cygnus): $nodename:0: 'sdhci@18041000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/brcm,iproc-sdhci.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
