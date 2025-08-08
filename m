Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C66B7462
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Aug 2025 02:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754620252; cv=none; b=Eqg5sNUGznbDufR/vTEgI4INJgTCnbOHU7lIUQ6c7LxV6qWVrXOxJQFq0T0vzDjN59xo6xzzBUX22Q05N6K5GyqFgHnuaaNpR6LYvgLawQZ1aIeG1ha7EaQ4dDNHHNceb8M9QwaXMW2mEjzWjygn/cdJh3zXgtU8Ho5rJDMIycs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754620252; c=relaxed/simple;
	bh=sba3bzHr0x3gqgMkHnmbUlKB2bZ0NzaC7h4PyoRd07I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GYkZ+PEay4/a+oDVBKc/+dZ3nvSMUzYkEXler3/rsus6e0mNSLyflJyTJkbc3h/sGUM3TDJ6TaywNMetPCp6YmBK0dU2mwHBR/FvWLjRAZOPxLT8mzI2nDTYFXofiTcpCv3ZUB7lhq/JIH3P3AK9B8zAe4om1cJrBEszBju/n4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A3L4aahx; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A3L4aahx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754620251; x=1786156251;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sba3bzHr0x3gqgMkHnmbUlKB2bZ0NzaC7h4PyoRd07I=;
  b=A3L4aahxVL+bK7DMukACbHFGIhGtBbsxoR5rU0dLgCIWgLvIho5MBCFq
   TGBqLKZO92EmLmP/jISOu54wPMz1KZ4KNfG+HHsm1ECoxogDnbZ/L8EUG
   7gzi7ZnXnlMz7M89RwLrzfnr4FNFn/b1G1sj9Qt+b1pVKrePj3tPzBZ3c
   3qZnV/3j1LMkAGgWlUjfKkhMzfKAwpXqBQ8BDfU3/nGWKv9ctN1vz91pB
   QDnA0Ds2i2q5cs/n8L8D4TJHrg+1pVTbIFEmeyDdcsPG5li64aY4AxNep
   hDJKwc23SklihTv76bDy9S6nOC3UtFgwZ0hPTrOrJL9BDsfgAEGvNBGZB
   g==;
X-CSE-ConnectionGUID: OWtcmZQDSbqh/mJHDcEQKQ==
X-CSE-MsgGUID: dtJmyIIiReGzt3DN86y2xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56682656"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="56682656"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 19:30:51 -0700
X-CSE-ConnectionGUID: NvuA3pgNT+2r+/YJEMX3uw==
X-CSE-MsgGUID: q28XhxT4R0qpnxJV6l78Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="164729058"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 07 Aug 2025 19:30:50 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukCsI-0003Ss-06;
	Fri, 08 Aug 2025 02:30:46 +0000
Date: Fri, 8 Aug 2025 10:29:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 357/801] arch/powerpc/boot/dts/fsp2.dtb:
 mmc@20c0000 (st,sdhci-stih407): clock-names: ['mmc'] is too short
Message-ID: <202508081017.OXZBo3bW-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: 6a4f8dc911cddde74de255e93930c5f3139a30af [357/801] dt-bindings: mmc: Convert st,sdhci to DT schema
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: powerpc-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250808/202508081017.OXZBo3bW-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.3.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508081017.OXZBo3bW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508081017.OXZBo3bW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsp2.dtb: /plb4/l2-error-irq: failed to match any schema with compatible: ['ibm,bus-error-irq']
   arch/powerpc/boot/dts/fsp2.dtb: /plb4/plb6-plb4-irq: failed to match any schema with compatible: ['ibm,bus-error-irq']
   arch/powerpc/boot/dts/fsp2.dtb: /plb4/plb4-ahb-irq: failed to match any schema with compatible: ['ibm,bus-error-irq']
   arch/powerpc/boot/dts/fsp2.dtb: /plb4/opbd-error-irq: failed to match any schema with compatible: ['ibm,opbd-error-irq']
   arch/powerpc/boot/dts/fsp2.dtb: /plb4/cmu-error-irq: failed to match any schema with compatible: ['ibm,cmu-error-irq']
   arch/powerpc/boot/dts/fsp2.dtb: /plb4/conf-error-irq: failed to match any schema with compatible: ['ibm,conf-error-irq']
   arch/powerpc/boot/dts/fsp2.dtb: /plb4/mc-ue-irq: failed to match any schema with compatible: ['ibm,mc-ue-irq']
   arch/powerpc/boot/dts/fsp2.dtb: /plb4/reset-warning-irq: failed to match any schema with compatible: ['ibm,reset-warning-irq']
   arch/powerpc/boot/dts/fsp2.dtb: /plb4/mcmal0: failed to match any schema with compatible: ['ibm,mcmal']
   arch/powerpc/boot/dts/fsp2.dtb: /plb4/mcmal1: failed to match any schema with compatible: ['ibm,mcmal']
>> arch/powerpc/boot/dts/fsp2.dtb: mmc@20c0000 (st,sdhci-stih407): clock-names: ['mmc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/st,sdhci.yaml#
>> arch/powerpc/boot/dts/fsp2.dtb: mmc@20c0000 (st,sdhci-stih407): clocks: [[10]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/st,sdhci.yaml#
>> arch/powerpc/boot/dts/fsp2.dtb: mmc@20c0000 (st,sdhci-stih407): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,sdhci-stih407', 'st,sdhci'] is too long
   	'st,sdhci-stih407' is not one of ['st', 'sdhci-stih407']
   	'st,sdhci' was expected
   	'st, sdhci' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/st,sdhci.yaml#
   arch/powerpc/boot/dts/fsp2.dtb: mmc@20c0000 (st,sdhci-stih407): pinctrl-0: True is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/mmc/st,sdhci.yaml#
>> arch/powerpc/boot/dts/fsp2.dtb: mmc@20c0000 (st,sdhci-stih407): reg: [[34340864, 131072]] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/st,sdhci.yaml#
>> arch/powerpc/boot/dts/fsp2.dtb: mmc@20c0000 (st,sdhci-stih407): reg-names: ['mmc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/st,sdhci.yaml#
   arch/powerpc/boot/dts/fsp2.dtb: /plb4/mmc@20c0000: failed to match any schema with compatible: ['st,sdhci-stih407', 'st,sdhci']
   arch/powerpc/boot/dts/fsp2.dtb: mmc@20c0000 (st,sdhci-stih407): pinctrl-0: True is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/powerpc/boot/dts/fsp2.dtb: /plb4/opb: failed to match any schema with compatible: ['ibm,opb']
   arch/powerpc/boot/dts/fsp2.dtb: /plb4/opb/ethernet@b0000000: failed to match any schema with compatible: ['ibm,emac4sync']
   arch/powerpc/boot/dts/fsp2.dtb: /plb4/opb/ethernet@b0000100: failed to match any schema with compatible: ['ibm,emac4sync']
   arch/powerpc/boot/dts/fsp2.dtb: /plb4/opb/rgmii@b0000600: failed to match any schema with compatible: ['ibm,rgmii']
   arch/powerpc/boot/dts/fsp2.dtb: serial@b0020000 (ns16550): Unevaluated properties are not allowed ('device_type', 'virtual-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
