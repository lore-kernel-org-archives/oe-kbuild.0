Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4044E493D4A
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Oct 2026 12:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791980366; cv=none; b=EBVhltEMX4w1DY+drhpNDDvH6GwReUFB1Gle3BuDnxAVgsi3oTHpRoPVwVG+cgAuYc2TV2mEr2mv14Y0jfTlmYgK6EPx1px6fcBCB7zEt21xyW443ZNTDW7JM5PmzjNxjkwTDkGALnU9WMv398OlVhnZAziOXSspkf69QqZIpMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791980366; c=relaxed/simple;
	bh=rlfJMTaPjIpSkK9zDkYyQ1SXXm0mEVaRJ7PUf/TgMoU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h5QFK/97GWuh2cxztZJElHnEXuqQOMkjOnkGx7v0/2B1Ay2ZUq5ZQseDoag2Sdi0B41yMqnuaVuO6lD5CrCLQyIcQWQE7gc2pTH0Y1OpO+pNED0UVyT5sXjb4puOqZ9RmYff3LlmNHPchtfNe80gZHNEeUxcEDOb/UOqd6wMnVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z6sqAvyU; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z6sqAvyU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791980364; x=1823516364;
  h=date:from:to:cc:subject:message-id;
  bh=rlfJMTaPjIpSkK9zDkYyQ1SXXm0mEVaRJ7PUf/TgMoU=;
  b=Z6sqAvyUOakE/If8WJ1T1e5+UexTZk+ljEXvPB4nhPOwayyth+WsSjHJ
   M0zqrG1lPhW0DPtocbRVBKSlDz2gxjVdFcBaTmID7cEOGWFF+0IzNUY7I
   S4Ujn4ZOC6Km9SIcqbz6IOECNVRtj9hpBGdFn1h5EPWcU6N8gfVpwcMLF
   v0NtGkkVk/K/Ka62pmy3TpLMuZi+LLlkKNo+R+VbBFDPiCvM1ax/Ln7Jz
   SOoBDhPJXvOQUjVj5LvkY4r35vkS4gtunFJE1vvKiV3/4MuqWpESUc7Th
   CuVsn+XPT5qZu7LknyqIdlx2MGfaeYJmhQQlFZjMkk/ytKexBqQQZ0t4S
   Q==;
X-CSE-ConnectionGUID: I6ROxJT1TaG5fOcVmoTWyg==
X-CSE-MsgGUID: hI0IC8Z9Q2Odx4X3QdJ6sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="734198"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="734198"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 05:19:23 -0700
X-CSE-ConnectionGUID: 1Ordsn2sSSOS1Y+X02IWGw==
X-CSE-MsgGUID: clHdYykLR5GPytHZFQPDBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1334196"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 14 Oct 2026 05:19:22 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGxx2-00000000B3v-2P0T;
	Wed, 14 Oct 2026 12:19:20 +0000
Date: Wed, 14 Oct 2026 14:19:00 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: net/phonet/pep.o: warning: objtool: pipe_do_rcv+0x258:
 unreachable instruction
Message-ID: <202610141405.7dUkTwLZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Simon Horman <horms@kernel.org>

Hi Eric,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4056b3c9d3c92ea45955641dbafeb9b960e146ef
commit: a9b460225e47a3d98296eba71c62ff0ad58a2032 net: always inline some skb helpers
date:   6 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 6 months ago
config: loongarch-randconfig-2001-20261014 (https://download.01.org/0day-ci/archive/20261014/202610141405.7dUkTwLZ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261014/202610141405.7dUkTwLZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a9b460225e47 ("net: always inline some skb helpers")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610141405.7dUkTwLZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/phonet/pep.o: warning: objtool: pipe_do_rcv+0x258: unreachable instruction
--
>> net/core/skbuff.o: warning: objtool: skb_pull_rcsum+0x64: unreachable instruction
   net/core/skbuff.o: warning: objtool: pskb_expand_head+0x70: unreachable instruction
   net/core/skbuff.o: warning: objtool: skb_segment+0x484: unreachable instruction
   net/core/skbuff.o: warning: objtool: skb_shift+0x55c: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
