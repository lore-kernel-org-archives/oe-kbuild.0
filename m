Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90B210785
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Apr 2026 19:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777146497; cv=none; b=HK5o4Jy/Bsoqcl+4eLi+2jZDnxvVh3RD9TydfzXd0m/RkMZj2uzLsVqugTOKJg5dqgy6tmYolBs239HESbnM0B8D+dSe/aijgcVe0ZSqaXKnUVqDsJCLme8fiQtm4AkGK+Xnk8hszMuwGdzXsZ7S9nTPH4lEVnuQy35PJ6FEkOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777146497; c=relaxed/simple;
	bh=p74UmiyH+/c3/010VVY1jWIlaZmZlR+Nbhe+CKZ9Y5M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SqSvuupXuoynKRpZ/pwADrmXQkj67N5wXxvzvmeuKeTZ4DMAqBhkWvVbIxBk10Zk/0Zre7jH7xVwT57H5IVyhaYGYMVGNRsVMlNu9DG84467wZ2fMpp+M20gPfy4jw6WsndyKv0/0EU8I3TRDAtZwucN3seu0KtQyWpN+qhFJt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TLUK+285; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TLUK+285"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777146496; x=1808682496;
  h=date:from:to:cc:subject:message-id;
  bh=p74UmiyH+/c3/010VVY1jWIlaZmZlR+Nbhe+CKZ9Y5M=;
  b=TLUK+2855scfIh3w1B9tROq/PFk2FNJOwCoMm5eWrGhIYV4nmpEf2igF
   xqURE2xXfHO2xYoUpFzxsGgGwaKjf4wlg68TVwewj4Nm/H93uBNJjWIDv
   8CAFMhuv+HfRS547P65bTrTgz7jotyaLwDwkF6SPf7tx/m4K5KztxW/rw
   3crfrsPL+UgnS/3TfsBPWdXm+HxYG5+2pFG8urqKVBcPD98lbRetsKK/V
   2dTqGWly75X9+tj2gk2NrX3FRIg9tShc/CJsWtjT1QyctpHq9KNMtdR8H
   7vQy2lPbmVlS5jRCiGKVa3A0s6iYsm7NacS9n5fhSpoNtzumagz2FCyZE
   A==;
X-CSE-ConnectionGUID: TY3DAJJ+RYyXQKdOlZcRFw==
X-CSE-MsgGUID: maToNeISSKOR3ZuJAsnFXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11767"; a="77254575"
X-IronPort-AV: E=Sophos;i="6.23,198,1770624000"; 
   d="scan'208";a="77254575"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2026 12:48:15 -0700
X-CSE-ConnectionGUID: oyEGSFKsRYG1leyZ9jb6Mg==
X-CSE-MsgGUID: /sqhznAuRACHOdzsCB/u8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,198,1770624000"; 
   d="scan'208";a="256769877"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 25 Apr 2026 12:48:14 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGiz6-000000003Rp-1pK7;
	Sat, 25 Apr 2026 19:48:12 +0000
Date: Sat, 25 Apr 2026 21:48:08 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bmc:for-next 10/33]
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb:
 /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible:
 ['aspeed,ast2600-lhc']
Message-ID: <202604252151.UDPNYW8a-lkp@intel.com>
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
TO: Kevin Tung <kevin.tung.openbmc@gmail.com>
CC: Andrew Jeffery <andrew@codeconstruct.com.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git for-next
head:   cd44dc5ead3042f2873244b0598e39a16dc7b940
commit: a5c59a29239c35c28c6dd9f712b5ac4bc01b1bc5 [10/33] ARM: dts: aspeed: yosemite5: Add Meta Yosemite5 BMC
:::::: branch date: 4 weeks ago
:::::: commit date: 6 months ago
config: arm-randconfig-2051-20260423 (https://download.01.org/0day-ci/archive/20260425/202604252151.UDPNYW8a-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev2+g3579443c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260425/202604252151.UDPNYW8a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604252151.UDPNYW8a-lkp@intel.com/

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
