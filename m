Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E25D43AA1
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Jun 2025 08:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751098420; cv=none; b=lqSA8x19cQDGw1U2ba8rAPEDe5Q7kzBdsGQG7v2QDpysBQqnGiHVHZLPpe9NOOfjMOG/dXiYGLxovpORCsoO1ZNZzO6mPH8dhNhUW7TJ5d5oAfFBVH7lJ2ZvQcZU5CJjtPrYA5mRoYuBkKPPYNQGSft+QUWN31oFYhNO1zPBexs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751098420; c=relaxed/simple;
	bh=Mazi4pZ5ZRxhbIpLZNIOFcvw/xY3o+zGLO9h5cUsHHE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sDC4tzYHt9iUGwqRpb3EwHiOg293vi2DFqPBdnYoMwlO3h91Qagp/WsXrTHExUB5OupI+HUdYSWOvHIlyI4pJ83Ux07s3u4ZsRZgL5etcDcSWw7Kp+UHFyTLl739KSuSyq3il2APXgXkIiNEEHuQyPeiVxzqyAEIzTe4ei2HXq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fw23dDp7; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fw23dDp7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751098419; x=1782634419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mazi4pZ5ZRxhbIpLZNIOFcvw/xY3o+zGLO9h5cUsHHE=;
  b=fw23dDp7ZRsK9roXNIJQtJh5I8cyW+0C9ftgBJrdxEPAO83b1SIIok6C
   /uVao0ZMBDKw44PTQHm77XsUVLv0DqJLP6CRoqTlELVCFNdtgDcrHtr0D
   Dwyy1j/tjsgeBy2XJNuemqMcQt8r+7cRqA5Y50PTBx2ibHJf/jbsK9u61
   NsZTe4fg/LKPQn4umwGC8U90ymBfcYPOW5slqv/ay9S3ej3ImbpcC6J3O
   Smw1Z9nfPZ/q9SeyBQmj1v4XB2j+AOXCtvG8I1SKO7t0LH/SyfOaIJdJE
   eJGPEs7mpwL058Fb4yVkK7CpZJ3u52B0EoUbeQZiLuJ2qeatL5voLWncj
   Q==;
X-CSE-ConnectionGUID: HBlOyqniQFSicV//fRdHMQ==
X-CSE-MsgGUID: BHHqtjeySHWebKEMXoOKkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="57180132"
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; 
   d="scan'208";a="57180132"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 01:13:38 -0700
X-CSE-ConnectionGUID: XDTQgm7ETGKLHtZ2exlnxw==
X-CSE-MsgGUID: M9suHhpLS6eZvyfh7jA1Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; 
   d="scan'208";a="153704464"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Jun 2025 01:13:38 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVQgo-000Wv2-35;
	Sat, 28 Jun 2025 08:13:34 +0000
Date: Sat, 28 Jun 2025 16:12:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:b4/genexis-xg6846b-v6.16-rc1 8/10]
 arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dtb: switch@0
 (marvell,mv88e6085): Unevaluated properties are not allowed
 ('#address-cells', '#size-cells' were unexpected)
Message-ID: <202506281659.nzPRieVO-lkp@intel.com>
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
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/genexis-xg6846b-v6.16-rc1
head:   5420b6e9c9c247c32861570d0332ec5376c283a8
commit: a58c76fa47514e22d425dac1995032f23556606a [8/10] ARM: dts: bcm6846: Add Marvell switch and SFP
:::::: branch date: 9 days ago
:::::: commit date: 10 days ago
config: arm-randconfig-051-20250627 (https://download.01.org/0day-ci/archive/20250628/202506281659.nzPRieVO-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250628/202506281659.nzPRieVO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506281659.nzPRieVO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts:236.20-300.4: Warning (avoid_unnecessary_addr_size): /bus@ff800000/mdio@2060/switch@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dtb: switch@0 (marvell,mv88e6085): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/marvell,mv88e6xxx.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
