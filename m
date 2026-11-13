Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794609715;
	b=yuK3oZeTUM/u5cACqfIF6LzlyMlXERvFd4ObsvvrPLV+IA26UFa4Lv3ZJB2evlTM9LuZ
	 nLO7Dk20PW4AtX9UE1DDYs36cJumsvTpHMHOTs73MJR35SdTmV37495DxuxuwXpxjS7BK
	 EIRvAAwPe5dWYL+oKunH9blYEY8KZqtD7PDt1Az7bcGXgkjQQC8NGyAki35kTeUTkTGjN
	 dHOD64UCFwQyVSSdaczutM7FOlrk/VDnVKCelBFr5Ze5Y7mHjNNx+f6oRWTyjtnKRo3zn
	 6UA7hC/U210x9tKiCTUhWsOepD/0teeZ0hpHnnRh/mZeBhQBd5NGSgnBWEqqk2N1fnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794609715;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=A2um2ImoWv99G73WJQmeGzTlfJ5ppa+eajA2BygjZzE=;
	b=HPeb7cxuDyATPXN9MoD6QDWFSHU6YHYm8j45a++n/lY5vB4/dhYAZUPGSomypSm0Z/UO
	 ILt89iSILs+qeAsYNhE0lbzXPuCqNk9tLD8Zle+CJXu28QCd7xtOHWLJNLmKl/CAUgrSb
	 iE4E8SGoTas/vYfcQX6sLXi8yvGq4PChaj8pRe3PcCm5f1XliksGg0X1HeFrHyVCIXFyi
	 y0sm1JcZ8WTsuEn9bsxKswBpQ2FE8hRab+l5XIcUAzvBWkZZHn1IDMEt9/ikFdSxJ8J2h
	 N2yXfctXDu96mdQntf+a/PJlKE2QnJpPUXxUBKAyQebwjQdxeUqGwYEj/AHMk6lBiMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YKWEt3eU;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA666606A54E
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Nov 2026 22:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA666606A54E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YKWEt3eU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794609715; x=1826145715;
  h=date:from:to:cc:subject:message-id;
  bh=52ulNfTDsK54Kqgw1dHcPJ99RaqiNpQLbI2BqgcfKw0=;
  b=YKWEt3eUWmHc6zLnEpfCPn2Ca51l0oewrU01rgQJ9SzXBMzYXesooiOu
   fV2BSgXBU9J9n8Pg4EO8y16gN/dWiMx2gz8BqzPSIbBMgo1+S2VZ5vYf4
   eefTAmkXMhZuApBsOL1D197hZJkedrUr6IQFvBNABEuAANoQmZtZncjSO
   IdLzG/DnR1J2/Rb/2B92XEz+pDh7vRSxIZLNz+Y1zbDH+rVxghwEUr69F
   nOMCoKYWmlDiMkXysVyWMc+Dvw3ET53Jcz+tDSANN//OzX8pJ0px7OV2Q
   DtoKo/cDQNjuJlK1W2iWEhiOPcGxSAOJDlSX1nIjY0CjtX6V7Z1tilDJo
   A==;
X-CSE-ConnectionGUID: PrYqACMnSX+DtmP4zVyhuA==
X-CSE-MsgGUID: T7SEy1YTSoW9DLoSWzZ9ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3436805"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3436805"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 14:41:54 -0800
X-CSE-ConnectionGUID: eyRW9eqmSBWhEZjRbqZKuA==
X-CSE-MsgGUID: ntCAOnkaTDaF6Mbm+pllVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="9296430"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 13 Nov 2026 14:41:54 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRzxv-000000001Lx-1PF2;
	Fri, 13 Nov 2026 22:41:51 +0000
Date: Fri, 13 Nov 2026 23:41:37 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 5014/7428] lib/maple_tree.o: warning:
 objtool: mas_validate_parent_slot+0x2a8: unreachable instruction
Message-ID: <202611132300.Vj25JGD0-lkp@intel.com>
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
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Liam R. Howlett (Google)" <liam@infradead.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   84abb955b1015477aa11a96e2f3ac1b938b77f48
commit: f51d35b81fb572c551e82ff72575d6dbb8e35ba9 [5014/7428] maple_tree: update internal warning and bug_on code
:::::: branch date: 5 hours ago
:::::: commit date: 4 days ago
config: loongarch-randconfig-r2109-20261113 (https://download.01.org/0day-ci/archive/20261113/202611132300.Vj25JGD0-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611132300.Vj25JGD0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611132300.Vj25JGD0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/maple_tree.o: warning: objtool: mas_validate_parent_slot+0x2a8: unreachable instruction
>> lib/maple_tree.o: warning: objtool: mas_validate_limits+0x694: unreachable instruction
>> lib/maple_tree.o: warning: objtool: mas_validate_child_slot+0x24c: unreachable instruction
>> lib/maple_tree.o: warning: objtool: mas_validate_gaps+0x174: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
