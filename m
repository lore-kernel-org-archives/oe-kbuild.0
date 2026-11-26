Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699178;
	b=la1qJBrPusAajdUfVkPUcjLpkI0h3GAIAg71/bgdReBToRQT6kfbJzFxI4M8gXt8S1Sj
	 s4ySTpWeQX+kqDak9T6xXwfLIRMPtXdxskTspfCXfkOKv9XpzsV2Kj7iUAtY9SNAeLX8i
	 BTQ0k00x6QuovLnkNP7QsJeQzif2wCsUrKTu4tR9e5iso1vcLxitPbuCf9yRMsz9DJ9Tw
	 oCtChJQ7+gnuJGBfIseC/irdmRyJPazSQSWgIVXkV6JE/uIhEPiivoplNlRQrMHmdfdae
	 GaZJEnC7nwfQi68BWdxnDD9PYVUrC7ALaA2RtS4eH4n7HCKGJCADbXRKcLm00iP39CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699178;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=9QMcToBJBgcSyMglVbOp96SlnDFM4jA0sBPj8YrAeac=;
	b=G6Zg5nr8/UVJSHyIOvkNK+GaKvzzINzFjs5QzD6tU6WVD04mGYPkz8v8o3DMxkg488lx
	 0Rwy3yBTPIQxPtqcTVrlD8YxVJugVgs2pgOJefKfpFd1s+lDZT4rmNm0mrSCwXSBRMMVP
	 Lhj/Nvy2GoCPnOc1Zm0XCxnEpDme2FnJ4ey+7rfcWtOk6HkZ+03SxEFAw43F6L8vBRf8r
	 N/HaFcyjblWTKWNkqJHn9fb2GXslZas5yPibVB0rCVFmQZOOiArBIkHqL5/lnUHOgJdki
	 EnRp56dHwA65H+K/LvDNZcCG3v1kgQ6bfcE5wDtctqRc0w59laNQpELF6pRUpeslOfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BGGPPNZL;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27F9606A31C
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Nov 2026 13:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A27F9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BGGPPNZL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795699177; x=1827235177;
  h=date:from:to:cc:subject:message-id;
  bh=fGzhkVpX0wbyOkfrBUTErTfu2eHRo4r2GuTC/Bjy0hQ=;
  b=BGGPPNZLhbwlWMYQb9Gn2Kp1oy4Gd47wbaldYqaWdiEVY+7Hi/QmBtn5
   755QeM8ayUaDkCymci6WzFi1mx2tdvyxrgK4dEv+aNzvkpF1qtd7EvGBV
   0GQVU/f5aNRQzu6nyE0n2Ft5LPGXhNcBTXDrj81gJqj3LsQ1B8ZDQqbUn
   4vIunzKAQkRiNthrFgP9pddyDX6hjzlCkcUGjdIVghuYJJexiCbsh1aR7
   RB+8i/uwot5cUpwAOVZlCWQtUPmoJ3N2P8R++6zJDo/4MdW4Xg+dJwSLu
   jdcvitj5o39Z13umaFSYWiSR5fHjQO4cIysePmDl14cWxpU4syN0+wRjE
   Q==;
X-CSE-ConnectionGUID: cOghiSTBTYeqWrRCPgDLRw==
X-CSE-MsgGUID: EZLWrAebQlKZbzn0BGOOcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4616176"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4616176"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 05:19:37 -0800
X-CSE-ConnectionGUID: jJvsph+GRhe2jO5LEYDKTw==
X-CSE-MsgGUID: 2l9MpQMmQ8m2Un+1G7aXnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="12175932"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 Nov 2026 05:19:35 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWZNt-00000001UAA-0xrU;
	Thu, 26 Nov 2026 13:19:33 +0000
Date: Thu, 26 Nov 2026 21:19:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: WARNING: modpost:
 drivers/net/ethernet/freescale/fs_enet/mii-bitbang.ko: missing
 MODULE_DESCRIPTION()
Message-ID: <20261126211250.dslmEzpt-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit"
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jani Nikula <jani.nikula@intel.com>
CC: Nicolas Schier <nsc@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ebb7a8dc1e74c705daffe11c2faf38ec2628f838
commit: d900723d78adec229996aefbab0dcaa66a177b77 modpost: use mod_warn() and mod_error(), clean up logging
date:   3 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 3 months ago
config: powerpc-randconfig-1000-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126211250.dslmEzpt-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126211250.dslmEzpt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d900723d78ad ("modpost: use mod_warn() and mod_error(), clean up logging")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261126211250.dslmEzpt-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: drivers/net/ethernet/freescale/fs_enet/mii-bitbang.ko: missing MODULE_DESCRIPTION()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
