Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A96936EAA7
	for <oe-kbuild@lists.linux.dev>; Fri, 15 May 2026 01:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778808968; cv=none; b=l38fdfmD7Ep+uKa5z0BR90MX317yErGWtiiEKL0XHm8ryTaOKxOfHU0LqQL2dJj6xemxY0D1UXUdV3zM0RD6Lt+ESdMFUDlDKCuivBz2FzK0nLN7POlb4sBRFYXnQdev1jc2u5fDCORBoQDNhFAD1KHwfhwa36fODz1iMfNFg0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778808968; c=relaxed/simple;
	bh=BrGLQi8BHX+AOJ6Id++R1xm7V9pNB4UeozSxQoOeW3c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Fk3rzthvuif6B6x5owJP6R5Xx7u2jugd0wNUieB+XUZ1oeiB0c3dh82gTvKMg6gZCys/o3HhfQ8XT3HI8ecn9gAMdIIj20zUbfvuwGAdCd0zy2G/Z4v5b2P+wjPEZOXunnuy1NZhcx1BAu4qkUGKt5XQmoTLvVrbVBvaOyxxTwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LG9qDj95; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LG9qDj95"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778808965; x=1810344965;
  h=date:from:to:cc:subject:message-id;
  bh=BrGLQi8BHX+AOJ6Id++R1xm7V9pNB4UeozSxQoOeW3c=;
  b=LG9qDj95bxgw6SoxeVV+mCRiMqWblsbZjLN0rysHqEv4CwNByCh2nt/M
   jwaIO5AO4WN51Htkxb6ftPmXnbJyHqjRopi0It6XPm/udB6moJ74e6EIM
   49VNw8n2vnLpS+qIH6V2ro1fzezXWFMdzYCbcWMsc1cCNFLRUiTMGGuUw
   zPV8fIPWlvezU0ef8hywwlS3fNP/LmTnjGzLgA+v+m+oy7v7g01nvOtrU
   F3ce2JwRPLbeXyo8uOwaov5H467FkXWtN2ZNI/fj2lA/rvyXD+KlneMBI
   H7Wbiu8IiwdXAu410oN2X4b5iTguYWSjp4WNPeyCuEvpoCb101doXVgYv
   g==;
X-CSE-ConnectionGUID: 90zssSxNTXydTOzF/2n/mg==
X-CSE-MsgGUID: hlB/AkWzSwS4EOEaFv+hgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="83376644"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="83376644"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 18:36:04 -0700
X-CSE-ConnectionGUID: YLqxxjbCRi2sun1e3JY8aw==
X-CSE-MsgGUID: SqmhFqECQDCmNWTjiu4Qpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="235505222"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 14 May 2026 18:36:04 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNhT8-000000008v7-37wi;
	Fri, 15 May 2026 01:36:02 +0000
Date: Fri, 15 May 2026 03:35:04 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:aspeed/dt32 5/7]
 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-paul-ipmi-card.dtb:
 /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible:
 ['aspeed,ast2500-lhc']
Message-ID: <202605150343.jM4nvN8I-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: Anirudh Srinivasan <anirudhsriniv@gmail.com>
CC: Andrew Jeffery <andrew@codeconstruct.com.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git aspeed/dt32
head:   76b4ec8efdc3887cdbf730da2e55881fc1a18770
commit: 633d9ef1da63e82cfb4c1e731abd6e9ade544c92 [5/7] ARM: dts: aspeed: Add Asrock Paul IPMI card
:::::: branch date: 3 months ago
:::::: commit date: 3 months ago
config: arm-randconfig-2054-20260513 (https://download.01.org/0day-ci/archive/20260515/202605150343.jM4nvN8I-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605150343.jM4nvN8I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605150343.jM4nvN8I-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-paul-ipmi-card.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2500-lhc']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
