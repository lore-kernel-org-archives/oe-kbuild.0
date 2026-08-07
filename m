Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199983783C3
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Aug 2026 05:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786081659; cv=none; b=ZLk0D3zrQDYJLO3obIaZkGpK80bnuTNF1ZYv3wuZZazATavzdjERHudpR5kOq3dsZmfeaAW3eT2rbSvk/TGYvi02ot+cjzO/Z/PwSmknQOK6nE42kbIUzJWqRSMdjCrWyZPWtt+U0rF0eBEQA67nZONWkwjJJ6v/SUw5FngxOx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786081659; c=relaxed/simple;
	bh=avvM2omyXL2Pl4CehvcCuoGESlOWtHOlVjrApVdPIYs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p9jjvfpWVNlDeqdrcqTCKhqQisUWK7Lu6utxwDRbssWxBJ8tqoQqVO4ASpDCiC4eq3w33iOEfLSacWZ7mArCTOneJRA3BZ5zYuCpV5GwERp90CDmex+njJLTqAPOo8U+02n1eKAfz0DbZ6KL2BZHWz9gaJx2EkTlCyPuyc+fuFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gR1uKYz8; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gR1uKYz8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786081657; x=1817617657;
  h=date:from:to:cc:subject:message-id;
  bh=avvM2omyXL2Pl4CehvcCuoGESlOWtHOlVjrApVdPIYs=;
  b=gR1uKYz8G2M45kECejIKQnddVbNmw1+Cyvhk8uxGiL1catMloufWbEPX
   EklibP84aNF6olVapWx/4pvZqFlwXPK+AUVYLxJF3Ni8Zyno+tF/YjN8f
   hYNNzpnLGbdd6ikvWm+WjoZVkyPsNBTwn5voV+I8APYFldU0mxkpWYl+q
   C/47pKqf+nuO8MKyL5dIYAJOZbI1ep9nYZK954AjncieR05bVYRlhl+Iz
   wM7sqrvd1wJxjmsD0NMXGPhnVgx1UuDewQi1kEhG3rbZiDqJ7C83gyfaO
   SzeFe57cnecD7cfbbpbFCeFLLxjHMvguDAQqyx7Ps3nYStE9/jKSMXSC/
   w==;
X-CSE-ConnectionGUID: FkpK53KvQMGw0NSoqJe42g==
X-CSE-MsgGUID: dn/jUP38Q0q5qZjqjNB2iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="109478546"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="109478546"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 22:47:36 -0700
X-CSE-ConnectionGUID: y+sMQ+1URb6Hlg+ebmLMbg==
X-CSE-MsgGUID: HOUwb3AgR2mE5pLNVOqkww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="258978087"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 06 Aug 2026 22:47:01 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsDQ2-000000004ne-40iE;
	Fri, 07 Aug 2026 05:46:58 +0000
Date: Fri, 07 Aug 2026 07:46:46 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb:
 /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible:
 ['aspeed,ast2600-lhc']
Message-ID: <202608070736.Q36r1HLb-lkp@intel.com>
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
TO: Kevin Tung <kevin.tung.openbmc@gmail.com>
CC: Andrew Jeffery <andrew@codeconstruct.com.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c0a27675eaf08255017b3cabc28c99c0cd71f468
commit: a5c59a29239c35c28c6dd9f712b5ac4bc01b1bc5 ARM: dts: aspeed: yosemite5: Add Meta Yosemite5 BMC
date:   10 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-2051-20260805 (https://download.01.org/0day-ci/archive/20260807/202608070736.Q36r1HLb-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project ade128740327db281859708ddcb3b072903b3414)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260807/202608070736.Q36r1HLb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a5c59a29239c ("ARM: dts: aspeed: yosemite5: Add Meta Yosemite5 BMC")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608070736.Q36r1HLb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: syscon@1e6e2000 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: adc@1e6e9000 (aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: adc@1e6e9100 (aspeed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: crypto@1e6fa000 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-acry.yaml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: /ahb/apb/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,ast2600-ibt-bmc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: /ahb/apb/dma-controller@1e79e000: failed to match any schema with compatible: ['aspeed,ast2600-udma']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
