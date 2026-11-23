Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795414721;
	b=tPmVdaWMYOGTrNKIOWtD4SOpSsnuLA03TjENpBgBpFSNoSZ8i8lTLBQdtgW5pdq/GeXL
	 qejfREQOUO7bQGK+f47tu2zoL3GnhDkRXIC/q/DsyN+gxDum70tFPWBuziO6UwvbaqNx3
	 qwZGbPwrX9GvuauLKMhNOq/yLIA3yoDGXcW/ds0ipbo/P0SDO2aUkhqtsZBADZhbWnU8i
	 Ewpgw4rNKTUfSfwuO5GZB4h+vHeUgkORnamvPRdJlRUliyLo0F94Jxkg6AjphO4YWFnw6
	 bbbZVLcuuiXBDl1vlGNzzrgHaJDneMG9OZnoBssrC0iHFOlKOJSLHRk+c9lxgR7FNuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795414721;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=XUkQuvHc3pSlkFEgdZW6hIVGdBw9Odu79siHU2A1CZk=;
	b=qXlT8Lnrd0Ngm3GcerkWlke+tuninf0yYnPhu0mzDVGSQBikkYB3i9/JaMxduZopGYHj
	 cwaVsG7SqSVK3a2WJXa0r+dejMfEVEXY9dXqmAnCmHH+YKzUwNTBeL/61R9e++1ayeLqZ
	 lBRcM5/l5bGWS5hBHBzvIGlkfZy8stTTWumtlWRy7QxrUIBojLnwq9g7fVWqybCs+n6Re
	 sNp6IWl7OdMUH5Ff+264s0b9R1N92LxvEzohKw1SuORK7kpa06UlczpgzDRvqLZuuuvMP
	 THMQ2qd5oM+0MY58+/gJC+dLLyLq5eZbFb+H9kw4nGuBwubyjozB5H5bjIkl0UTxDsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bcif2ELw;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0265606A31A
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Nov 2026 06:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0265606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bcif2ELw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795414721; x=1826950721;
  h=date:from:to:cc:subject:message-id;
  bh=fnSIpQypJi/Z2VjXdi1jPVU/NMx190oHzPcAeTMCq48=;
  b=Bcif2ELwcvrt8BwjFMVfdch7x4XfR3G1Sdmu+j2UZQHt1Imjfv1/9kyf
   1LSCBTVS/dYDIlwXwYnfZ0QqAh3Lw0BUVmS0H5VM7b+sPhQJppuwtqg74
   2UnAAlgpauAZBE55+6xSNoBLi91kEndy+DDIkEBjv8ax6EkHe0+L0wlyi
   LeFs/SX7ZOnkAUuo2pbtZphU5Xws21/F7l2RIJRh4bqCkLB5tZ8N8yhqj
   9KkHth0e8qS51Wqy6+6JSOAormWSzui86Q++CZgKYyU2xTUn46hf+Im1b
   aaufhZBHJ7vFLAKXc8sI1jCv63yXV8/+tiAznmU61rYlwI8I2G5/nfpmX
   A==;
X-CSE-ConnectionGUID: q7TabGY5TcabZmCewxltAQ==
X-CSE-MsgGUID: l8v+/sxyRYSt7u9BLU+H+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4244648"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4244648"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 22:18:40 -0800
X-CSE-ConnectionGUID: E0U3qgYjSfOZ4JBNRy9lpA==
X-CSE-MsgGUID: JsYNdH0UQNWEPwg5EhHiWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11342705"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 22 Nov 2026 22:18:39 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVNNt-000000004li-0ARO;
	Mon, 23 Nov 2026 06:18:37 +0000
Date: Mon, 23 Nov 2026 07:17:54 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ebiggers:crc-pending 3/3] lib/crc/crc64-neon.c:85:9:
 sparse: sparse: Trying to use reserved word 'do' as identifier
Message-ID: <20261123071217.R9zmpDz0-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: lib/crc/crc64-neon.c:85:9: sparse: sparse: Trying to use reserved word 'do' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Shreesh Adiga <16567adigashreesh@gmail.com>
CC: Eric Biggers <ebiggers@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc-pending
head:   41978d598781c96225973a8e639b87497f45139c
commit: 41978d598781c96225973a8e639b87497f45139c [3/3] lib/crc: Add 4-way folding in NEON crc64_nvme implementation
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: arm64-randconfig-r2303-20261123 (https://download.01.org/0day-ci/archive/20261123/20261123071217.R9zmpDz0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261123/20261123071217.R9zmpDz0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261123071217.R9zmpDz0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34484:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34491:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34491:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34498:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34498:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34505:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34505:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34513:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34513:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34521:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34521:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34529:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34529:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34537:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34537:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34545:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34545:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34553:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34553:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34561:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34561:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34569:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34569:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34577:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34577:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34585:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34585:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34593:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34593:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34601:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34601:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34609:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34609:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34617:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34617:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34625:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34625:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34633:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34633:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34642:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34642:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34649:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34649:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34656:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34656:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34663:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34663:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34670:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34670:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34677:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34677:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34684:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34684:1: sparse: sparse: got }
   lib/crc/crc64-neon.c: note: in included file:
   lib/crc/arm64/crc64-neon.h:20:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/crc/arm64/crc64-neon.h:20:16: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm64/crc64-neon.h:20:16: sparse: sparse: got r
   lib/crc/arm64/crc64-neon.h:21:1: sparse: sparse: Expected ; at the end of type declaration
   lib/crc/arm64/crc64-neon.h:21:1: sparse: sparse: got }
   lib/crc/arm64/crc64-neon.h:28:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/crc/arm64/crc64-neon.h:28:16: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm64/crc64-neon.h:28:16: sparse: sparse: got r
   lib/crc/arm64/crc64-neon.h:29:1: sparse: sparse: Expected ; at the end of type declaration
   lib/crc/arm64/crc64-neon.h:29:1: sparse: sparse: got }
   lib/crc/arm64/crc64-neon.h:34:1: sparse: sparse: Expected ; at the end of type declaration
   lib/crc/arm64/crc64-neon.h:34:1: sparse: sparse: got }
   lib/crc/crc64-neon.c:26:26: sparse: sparse: Expected ; at end of declaration
   lib/crc/crc64-neon.c:26:26: sparse: sparse: got fold_single_round
   lib/crc/crc64-neon.c:30:20: sparse: sparse: Expected ; at end of declaration
   lib/crc/crc64-neon.c:30:20: sparse: sparse: got temp2
   lib/crc/crc64-neon.c:32:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/crc/crc64-neon.c:32:16: sparse: sparse: Expected ; at end of declaration
   lib/crc/crc64-neon.c:32:16: sparse: sparse: got temp
   lib/crc/crc64-neon.c:33:1: sparse: sparse: Expected ; at the end of type declaration
   lib/crc/crc64-neon.c:33:1: sparse: sparse: got }
   lib/crc/crc64-neon.c:54:20: sparse: sparse: Expected ; at end of declaration
   lib/crc/crc64-neon.c:54:20: sparse: sparse: got last16
   lib/crc/crc64-neon.c:55:20: sparse: sparse: Expected ; at end of declaration
   lib/crc/crc64-neon.c:55:20: sparse: sparse: got a
   lib/crc/crc64-neon.c:65:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/crc/crc64-neon.c:65:16: sparse: sparse: Expected ; at end of declaration
   lib/crc/crc64-neon.c:65:16: sparse: sparse: got fold_single_round
   lib/crc/crc64-neon.c:66:1: sparse: sparse: Expected ; at the end of type declaration
   lib/crc/crc64-neon.c:66:1: sparse: sparse: got }
   lib/crc/crc64-neon.c:72:20: sparse: sparse: Expected ; at end of declaration
   lib/crc/crc64-neon.c:72:20: sparse: sparse: got fold_consts_4x
   lib/crc/crc64-neon.c:73:20: sparse: sparse: Expected ; at end of declaration
   lib/crc/crc64-neon.c:73:20: sparse: sparse: got fold_consts_2x
   lib/crc/crc64-neon.c:74:20: sparse: sparse: Expected ; at end of declaration
   lib/crc/crc64-neon.c:74:20: sparse: sparse: got v0
   lib/crc/crc64-neon.c:75:20: sparse: sparse: Expected ; at end of declaration
   lib/crc/crc64-neon.c:75:20: sparse: sparse: got zero
   lib/crc/crc64-neon.c:76:20: sparse: sparse: Expected ; at end of declaration
   lib/crc/crc64-neon.c:76:20: sparse: sparse: got v1
   lib/crc/crc64-neon.c:78:12: sparse: sparse: Expected ; at end of declaration
   lib/crc/crc64-neon.c:78:12: sparse: sparse: got ^=
   lib/crc/crc64-neon.c:83:11: sparse: sparse: Expected ; at end of declaration
   lib/crc/crc64-neon.c:83:11: sparse: sparse: got +=
   lib/crc/crc64-neon.c:84:13: sparse: sparse: Expected ; at end of declaration
   lib/crc/crc64-neon.c:84:13: sparse: sparse: got -=
>> lib/crc/crc64-neon.c:85:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/crc/crc64-neon.c:85:12: sparse: sparse: Expected ; at end of declaration
   lib/crc/crc64-neon.c:85:12: sparse: sparse: got {
   lib/crc/crc64-neon.c:87:28: sparse: sparse: Expected ; at end of declaration
   lib/crc/crc64-neon.c:87:28: sparse: sparse: got t1
   lib/crc/crc64-neon.c:88:28: sparse: sparse: Expected ; at end of declaration
   lib/crc/crc64-neon.c:88:28: sparse: sparse: got t2
   lib/crc/crc64-neon.c:89:28: sparse: sparse: Expected ; at end of declaration
   lib/crc/crc64-neon.c:89:28: sparse: sparse: got t3
   lib/crc/crc64-neon.c:95:19: sparse: sparse: Expected ; at end of declaration
   lib/crc/crc64-neon.c:95:19: sparse: sparse: got +=
   lib/crc/crc64-neon.c:96:21: sparse: sparse: Expected ; at end of declaration
   lib/crc/crc64-neon.c:96:21: sparse: sparse: got -=
   lib/crc/crc64-neon.c:97:9: sparse: sparse: Expected ; at the end of type declaration
   lib/crc/crc64-neon.c:97:9: sparse: sparse: got }
   lib/crc/crc64-neon.c:102:17: sparse: sparse: Expected ) in function declarator
   lib/crc/crc64-neon.c:102:17: sparse: sparse: got >=
   lib/crc/crc64-neon.c:102:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   lib/crc/crc64-neon.c:104:28: sparse: sparse: Expected ; at end of declaration
   lib/crc/crc64-neon.c:104:28: sparse: sparse: got t1
   lib/crc/crc64-neon.c:108:19: sparse: sparse: Expected ; at end of declaration
   lib/crc/crc64-neon.c:108:19: sparse: sparse: got +=
   lib/crc/crc64-neon.c:109:21: sparse: sparse: Expected ; at end of declaration
   lib/crc/crc64-neon.c:109:21: sparse: sparse: got -=
   lib/crc/crc64-neon.c:110:9: sparse: sparse: Expected ; at the end of type declaration
   lib/crc/crc64-neon.c:110:9: sparse: sparse: got }
   lib/crc/crc64-neon.c:114:17: sparse: sparse: Expected ) in function declarator
   lib/crc/crc64-neon.c:114:17: sparse: sparse: got >=
   lib/crc/crc64-neon.c:114:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   lib/crc/crc64-neon.c:118:19: sparse: sparse: Expected ; at end of declaration
   lib/crc/crc64-neon.c:118:19: sparse: sparse: got +=
   lib/crc/crc64-neon.c:119:21: sparse: sparse: Expected ; at end of declaration
   lib/crc/crc64-neon.c:119:21: sparse: sparse: got -=
   lib/crc/crc64-neon.c:120:9: sparse: sparse: Expected ; at the end of type declaration
   lib/crc/crc64-neon.c:120:9: sparse: sparse: got }
   lib/crc/crc64-neon.c:129:20: sparse: sparse: Expected ; at end of declaration
   lib/crc/crc64-neon.c:129:20: sparse: sparse: got bconsts
   lib/crc/crc64-neon.c:130:20: sparse: sparse: Expected ; at end of declaration
   lib/crc/crc64-neon.c:130:20: sparse: sparse: got final
   lib/crc/crc64-neon.c:132:12: sparse: sparse: Expected ; at end of declaration
   lib/crc/crc64-neon.c:132:12: sparse: sparse: got ^=
   lib/crc/crc64-neon.c:134:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/crc/crc64-neon.c:134:16: sparse: sparse: Expected ; at end of declaration
   lib/crc/crc64-neon.c:134:16: sparse: sparse: got vgetq_lane_u64
   lib/crc/crc64-neon.c:135:1: sparse: sparse: Expected ; at the end of type declaration
   lib/crc/crc64-neon.c:135:1: sparse: sparse: got }
   lib/crc/crc64-neon.c: note: in included file (through arch/arm64/include/asm/neon-intrinsics.h):
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3131:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3131:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3138:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3138:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3145:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3145:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3152:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3152:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3159:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3159:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3166:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3166:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3173:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3173:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3180:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3180:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3187:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3187:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3194:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3194:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3201:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3201:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3208:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3208:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3215:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3215:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3222:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3222:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3231:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3231:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3238:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3238:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3245:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3245:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3252:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3252:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3259:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3259:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3266:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3266:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3273:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3273:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3280:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3280:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3287:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3287:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3294:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3294:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3301:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3301:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3308:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3308:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3315:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3315:10: sparse: sparse: bad constant expression type

vim +/do +85 lib/crc/crc64-neon.c

41978d598781c9 lib/crc/crc64-neon.c             Shreesh Adiga  2026-11-18  67  
061cef5fcee5a4 lib/crc/crc64-neon.c             Ard Biesheuvel 2026-04-22  68  u64 crc64_nvme_neon(u64 crc, const u8 *p, size_t len)
8fdef85d601db6 lib/crc/arm64/crc64-neon-inner.c Ard Biesheuvel 2026-03-30  69  {
41978d598781c9 lib/crc/crc64-neon.c             Shreesh Adiga  2026-11-18  70  	/* Assumes len >= 128. */
8fdef85d601db6 lib/crc/arm64/crc64-neon-inner.c Ard Biesheuvel 2026-03-30  71  	uint64x2_t fold_consts = vld1q_u64(fold_consts_val);
41978d598781c9 lib/crc/crc64-neon.c             Shreesh Adiga  2026-11-18  72  	uint64x2_t fold_consts_4x = vld1q_u64(fold_consts_4x_val);
41978d598781c9 lib/crc/crc64-neon.c             Shreesh Adiga  2026-11-18  73  	uint64x2_t fold_consts_2x = vld1q_u64(fold_consts_2x_val);
8fdef85d601db6 lib/crc/arm64/crc64-neon-inner.c Ard Biesheuvel 2026-03-30  74  	uint64x2_t v0 = { crc, 0 };
8fdef85d601db6 lib/crc/arm64/crc64-neon-inner.c Ard Biesheuvel 2026-03-30  75  	uint64x2_t zero = { };
41978d598781c9 lib/crc/crc64-neon.c             Shreesh Adiga  2026-11-18  76  	uint64x2_t v1, v2, v3;
63432fd625372a lib/crc/arm64/crc64-neon-inner.c Demian Shulhan 2026-03-29  77  
8fdef85d601db6 lib/crc/arm64/crc64-neon-inner.c Ard Biesheuvel 2026-03-30  78  	v0 ^= vreinterpretq_u64_u8(vld1q_u8(p));
41978d598781c9 lib/crc/crc64-neon.c             Shreesh Adiga  2026-11-18  79  	v1  = vreinterpretq_u64_u8(vld1q_u8(p + 16));
41978d598781c9 lib/crc/crc64-neon.c             Shreesh Adiga  2026-11-18  80  	v2  = vreinterpretq_u64_u8(vld1q_u8(p + 32));
41978d598781c9 lib/crc/crc64-neon.c             Shreesh Adiga  2026-11-18  81  	v3  = vreinterpretq_u64_u8(vld1q_u8(p + 48));
41978d598781c9 lib/crc/crc64-neon.c             Shreesh Adiga  2026-11-18  82  
41978d598781c9 lib/crc/crc64-neon.c             Shreesh Adiga  2026-11-18  83  	p += 64;
41978d598781c9 lib/crc/crc64-neon.c             Shreesh Adiga  2026-11-18  84  	len -= 64;
41978d598781c9 lib/crc/crc64-neon.c             Shreesh Adiga  2026-11-18 @85  	do {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
