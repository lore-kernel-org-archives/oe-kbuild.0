Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EDF3F20F0
	for <oe-kbuild@lists.linux.dev>; Mon, 11 May 2026 14:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778509453; cv=none; b=cqF73V3Cibes9KqE0HRS7rHsrIGhGx/2G7Tcpv09yra885/XcRcPjDeqn8WtdOgfm3dsBoKb27A8m6/QiovDcSvtNkXvURjgoz9SzACj56fdiFcO5meu0aO+4fVYTOUUhV9yrjVWZ3N/SWfLMTNxSpT1hcEfoP5aXCKYVFO4Sc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778509453; c=relaxed/simple;
	bh=rp+ksefvyXjlGLi4Q6OlpmmsDyFuiBWg7OoBC6hqAdc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ODswkrQM9DJD4aJjnnoOt5sedba6vJvCzBKZokCIyNdSyAFoZ1eIjDRHPrQJRSSrZHgDm2oiQQ0smjdDiUVTCHVQqYaVUfyq+WEinHT+YJtDHMTeI9UUqRAcWDBBEgkAROTRnB7JauiQV4Xt1OrxEiMUQGJDv2qQfp7MFF4vgPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VFbvbAg5; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VFbvbAg5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778509451; x=1810045451;
  h=date:from:to:cc:subject:message-id;
  bh=rp+ksefvyXjlGLi4Q6OlpmmsDyFuiBWg7OoBC6hqAdc=;
  b=VFbvbAg5OOXGo60eEepcp74SXalvHebBDApiXtt4MSLxetP7+KkDbWEq
   fEGdZA4xKzisjJgytY0vO96nfc5ljo1NaE8EzOc7zWHdJ0yVNrB1xW5nk
   JT/zeAtFdy5K51+u2NakXF593EnWP4gYUMV1A/onXulL6OuJ09knEIJxV
   Er7Jp7AoJI57dBJKZvycYrGvRg9fOHhpJOLBHMdb8W1zTWZlPgAgVwPpz
   gv5LjwneGw/sHbYnaDdrpnMw66xe9XVeL7LfqFWsk07UOqxa/RkgY4qPh
   gEj+YMfU0kq4CDSp3yYS7QP9kvCCp2ZC6jS7fn6K7XGoFdOyq2Zzx64YI
   w==;
X-CSE-ConnectionGUID: uRLASQ+oQxqH2Tk/i2O1/w==
X-CSE-MsgGUID: 9mlSFqVhRfOkOcAd6wl9GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79257810"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="79257810"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 07:24:10 -0700
X-CSE-ConnectionGUID: duUFJLDLR/COKP1Q5+P9zg==
X-CSE-MsgGUID: xCFScmrvRGujJzSD37fDWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="242433000"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 11 May 2026 07:24:09 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMRYF-000000007xl-2n7i;
	Mon, 11 May 2026 14:24:07 +0000
Date: Mon, 11 May 2026 16:23:53 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: des@0
 (ti,omap4-des): 'clocks' is a required property
Message-ID: <202605111607.BZaDFPnh-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5d6919055dec134de3c40167a490f33c74c12581
commit: 8c8dea2664fcfe861f10980059a116dfe61f536b dt-bindings: crypto: Convert ti,omap4-des to DT schema
date:   11 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-2051 (https://download.01.org/0day-ci/archive/20260511/202605111607.BZaDFPnh-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605111607.BZaDFPnh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 8c8dea2664fc ("dt-bindings: crypto: Convert ti,omap4-des to DT schema")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605111607.BZaDFPnh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: switch@0 (ti,am4372-cpsw-switch): clocks: [[92], [93]] is too long
   	from schema $id: http://devicetree.org/schemas/net/ti,cpsw-switch.yaml
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: /ocp@44000000/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am4372']
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: /ocp@44000000/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: /ocp@44000000/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: /ocp@44000000/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: /ocp@44000000/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: /ocp@44000000/target-module@47810000/mmc@0: failed to match any schema with compatible: ['ti,am437-sdhci']
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: sham@0 (ti,omap5-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
>> arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: des@0 (ti,omap4-des): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: sram@0 (mmio-sram): 'pm-code-sram@0', 'pm-data-sram@1000' do not match any of the regexes: '^([a-z0-9]*-)?sram(-section)?@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: /ocp@44000000/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am437x-cm-t43.dtb: /ocp@44000000/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
