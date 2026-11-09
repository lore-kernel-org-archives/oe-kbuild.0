Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794203347;
	b=XO+dK8oR71d9wVf3LTPcHaG6EzCMPqTzZhZTmf2EhRCg12PdAruyCBMFP/l5F50aGb3c
	 L+YxGiHx8sowXZ06c52PEcGIkrdTh81ePAfbB6WOMITVWMKuvkJe6AntfAmPVUnUs1ZtD
	 2hWbYg65LhbNUaRLXoRTB+z+2bGeBh1KFr0Xva0mrSnZq2UyhXLf/1P+SGGZpKyMzXaM7
	 pJS7rkzcB6JRuJedtwJYSf2qhLQ8k1thhoCHI058myFVfwEWbCPGlgE7FVjmZorivUZ5X
	 vVJx9zzWQVDA+fidaZaMGwxzMnhODr1UCTyLKLXeLwrzwYeJSOXLfP0y9GDpsGYWMLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203347;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=mdMn5RGKGXoZjKm33gezRJIDZnyz4eToY4gr5TKAecs=;
	b=4Ems0n5rtOrN4PQPMHA9oE8FUdN6D/R/uPWSIiiPHfGHvmuaKwBk64rSfdU7Bovifl9l
	 kekilmcmbIzgVXePrigyYICg2Y4ZsL1lq9COzTeq87r5Ljl79WJfOAsMy+c4Utr0uTsyT
	 XWce4PI2NczcL4buyqFj9n+ynrtYGgidozU3KjbzDNfDcl8zLPaYgpTy533Oi1smAzq/a
	 0rFKIBAiNg78LZuSjCG5I4BS5d77RfToPSbKXYEvxHrqW9+B0LjphXYc5n4uvugJ3w6m7
	 Zk8S3iBmNk4HU9+eZeW3U6rmbjvc/AfnmBHxIPb713EZjoFUJZl4Si2lTZS8nHwtypA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bywZGHp5;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE0D606A31C
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Nov 2026 05:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BE0D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bywZGHp5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794203344; x=1825739344;
  h=date:from:to:cc:subject:message-id;
  bh=W3+wPJATPaOXbEvHXB/aNJNnOlCZfFW4bFO/rBAGdVQ=;
  b=bywZGHp5aaaPUUTZhd0Utrd8C1O1kODbC1Su2FtnoKWPwaPKl1/F0iGh
   Vf2BWlRdFO9ccosrG76ruiAyM34uU40etivhovVjyBcr7h+IQmAXnYQcY
   MlShRewc13XhKmbh7dPsmQ0t/IAbVSW4T/PARsXuHszF0OqAdT8GVIWL/
   d7GPFcFmm9tUHSGo2FazM0BM63i2zluxVLJI9tiF6lz0mf/GeQQsR6WDM
   XFoAwHprjIfTq5JNMwHcQDB85heeipNe1dsTtGYyaDz+XkmJW7KODUBQd
   GTt5iCr3yhdM9n98Ht+pGKnYwGr3CJuFyXa1gyHMVOInk72V01cY69Y3u
   Q==;
X-CSE-ConnectionGUID: o+Yzh+K0Q4+xMjxgpOYkdA==
X-CSE-MsgGUID: KtjZvIGrSP+JXIzPemr6qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2800213"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2800213"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 21:49:03 -0800
X-CSE-ConnectionGUID: sS3KkMywRhSBZiq3FXxPow==
X-CSE-MsgGUID: u3SxF2hvTXGIWGN4X9+fVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="9560482"
Received: from igk-lkp-server01.igk.intel.com (HELO 1db0d17a343c) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 08 Nov 2026 21:49:02 -0800
Received: from kbuild by 1db0d17a343c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQIFW-000000000EZ-3T27;
	Mon, 09 Nov 2026 05:48:58 +0000
Date: Mon, 09 Nov 2026 06:48:54 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [zen:7.3/mglru-fg-v4 18/32] include/linux/mm_inline.h:149:2:
 error: call to '__compiletime_assert_416' declared with 'error' attribute:
 BUILD_BUG_ON failed: fls(LRU_REFS_MAX - 1) > MAX_NR_TIERS - 1
Message-ID: <202611090632.oqGNHHW7-lkp@intel.com>
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
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: steven@liquorix.net

tree:   https://github.com/zen-kernel/zen-kernel 7.3/mglru-fg-v4
head:   1c52d132ec8cf1221060daaddca5f816dbae3f2f
commit: 3e21218556778907f06dfa833bf881773cd3dffc [18/32] mm/mglru: frequency guided workingset promotion (MGLRU-FG)
:::::: branch date: 11 hours ago
:::::: commit date: 3 weeks ago
config: hexagon-randconfig-2200-20261109 (https://download.01.org/0day-ci/archive/20261109/202611090632.oqGNHHW7-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611090632.oqGNHHW7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611090632.oqGNHHW7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/vmscan.c:30:
>> include/linux/mm_inline.h:149:2: error: call to '__compiletime_assert_416' declared with 'error' attribute: BUILD_BUG_ON failed: fls(LRU_REFS_MAX - 1) > MAX_NR_TIERS - 1
     149 |         BUILD_BUG_ON(fls(LRU_REFS_MAX - 1) > MAX_NR_TIERS - 1);
         |         ^
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:231:1: note: expanded from here
     231 | __compiletime_assert_416
         | ^
   In file included from mm/vmscan.c:30:
>> include/linux/mm_inline.h:149:2: error: call to '__compiletime_assert_416' declared with 'error' attribute: BUILD_BUG_ON failed: fls(LRU_REFS_MAX - 1) > MAX_NR_TIERS - 1
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:231:1: note: expanded from here
     231 | __compiletime_assert_416
         | ^
   2 errors generated.
--
   In file included from mm/workingset.c:9:
>> include/linux/mm_inline.h:149:2: error: call to '__compiletime_assert_416' declared with 'error' attribute: BUILD_BUG_ON failed: fls(LRU_REFS_MAX - 1) > MAX_NR_TIERS - 1
     149 |         BUILD_BUG_ON(fls(LRU_REFS_MAX - 1) > MAX_NR_TIERS - 1);
         |         ^
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:47:1: note: expanded from here
      47 | __compiletime_assert_416
         | ^
   In file included from mm/workingset.c:9:
>> include/linux/mm_inline.h:149:2: error: call to '__compiletime_assert_416' declared with 'error' attribute: BUILD_BUG_ON failed: fls(LRU_REFS_MAX - 1) > MAX_NR_TIERS - 1
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:47:1: note: expanded from here
      47 | __compiletime_assert_416
         | ^
   2 errors generated.


vim +149 include/linux/mm_inline.h

ac35a490237446 Yu Zhao     2022-09-18  146  
3e212185567789 Kairui Song 2026-10-16  147  static inline int lru_tier_from_refs(unsigned int refs)
ac35a490237446 Yu Zhao     2022-09-18  148  {
3e212185567789 Kairui Song 2026-10-16 @149  	BUILD_BUG_ON(fls(LRU_REFS_MAX - 1) > MAX_NR_TIERS - 1);
3e212185567789 Kairui Song 2026-10-16  150  	VM_WARN_ON_ONCE(refs > LRU_REFS_MAX);
3e212185567789 Kairui Song 2026-10-16  151  	if (refs < LRU_REFS_WORKINGSET)
3e212185567789 Kairui Song 2026-10-16  152  		return 0;
3e212185567789 Kairui Song 2026-10-16  153  	return fls(refs - 1);
ac35a490237446 Yu Zhao     2022-09-18  154  }
ac35a490237446 Yu Zhao     2022-09-18  155  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
