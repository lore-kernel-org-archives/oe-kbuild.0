Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3FD396D33
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Jan 2026 12:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768392472; cv=none; b=IuqMmQ20PI+bQPqxcKP4RpNiwOA1OVb+jxLB5zvldOX7lIl6dCCp1ElVlt22pE4QgCACAfEGYOOBsw8gEp2P8SYVfaefQZZaPCOCUexJ4KfhehQPlIaZoq+5REqfhJHiCyTDKYZe3kPizHn99u2ZhPW+L29fkrvEhwU858ZChs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768392472; c=relaxed/simple;
	bh=/P4uYNa+oKvDKNvvMbk5FGWJZEEv7U4xUNqi1/7zka8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fszp3rn2JGhGuO1/WC3SL+EiCvHlLnBOVAM1Q3HU9TP4VWA0TR7Q/eMfTcy6u9wdAvXOxPVEWqvqP+S79n5sKDcd0R9I92Kw00gVaJ7Pqtf0r4hJSS+SLVLYDJvvvhDyRNXdqyyFewfMPbHwiCvXbO07v3LGoNb1KusV5QUyMgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ogu6P5ef; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ogu6P5ef"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768392467; x=1799928467;
  h=date:from:to:cc:subject:message-id;
  bh=/P4uYNa+oKvDKNvvMbk5FGWJZEEv7U4xUNqi1/7zka8=;
  b=Ogu6P5ef5gavRPAlrM+uaT1YgJzcVenOH8WFlgyFanks/yME4TdlHcRU
   cHIw8tVQ5uSnEsQcXHdbkWc/hevP/d/Sg0JRqZzfSBI9X6TE9+Re8wmL/
   3MSk8HBQtZ5vbpArwpF5et3iIyjfbrM0cRkssDk1G+uyetX7BFMHjJUcR
   38Yid8m6gPxXBVS74ol4czQIAfwp3SSI0J8uVIk57zABGuT9UoLFuGUH2
   KIK2haZCUMXCrRaYYuMRLTkbSkJE4Ju+DvuoRAIRmCKQKKV9acidJ5Ww2
   +19uMjPCnMp/Q+V3Xt2EBcXuIz9eByXZoiKxbYDYrGHwWF3z/IVW/imzm
   g==;
X-CSE-ConnectionGUID: 3VJGwnzHSZixh4IX6H0ZPw==
X-CSE-MsgGUID: boOSv+o+Q1WYtunLOqmq3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="79984553"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="79984553"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 04:07:42 -0800
X-CSE-ConnectionGUID: jU2aApwOSWK5LwwS/Z3quQ==
X-CSE-MsgGUID: 2Sy/DJ8tT/i2zXXoCjepmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="209168862"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Jan 2026 04:07:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfzf0-00000000GLM-0Hm2;
	Wed, 14 Jan 2026 12:07:38 +0000
Date: Wed, 14 Jan 2026 20:07:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 5764/6121] mm/slub.c:6961 slab_ksize()
 warn: bitwise AND condition is false here
Message-ID: <202601142041.3U595kXU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Harry Yoo <harry.yoo@oracle.com>
CC: Vlastimil Babka <vbabka@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b775e489bec70895b7ef6b66927886bbac79598f
commit: 1e8eb4117f27366855b192104098330a2f290f26 [5764/6121] mm/slab: move [__]ksize and slab_ksize() to mm/slub.c
:::::: branch date: 8 hours ago
:::::: commit date: 23 hours ago
config: alpha-randconfig-r072-20260114 (https://download.01.org/0day-ci/archive/20260114/202601142041.3U595kXU-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601142041.3U595kXU-lkp@intel.com/

smatch warnings:
mm/slub.c:6961 slab_ksize() warn: bitwise AND condition is false here

vim +6961 mm/slub.c

81819f0fc8285a Christoph Lameter 2007-05-06  6950  
1e8eb4117f2736 Harry Yoo         2026-01-13  6951  static inline size_t slab_ksize(const struct kmem_cache *s)
1e8eb4117f2736 Harry Yoo         2026-01-13  6952  {
1e8eb4117f2736 Harry Yoo         2026-01-13  6953  #ifdef CONFIG_SLUB_DEBUG
1e8eb4117f2736 Harry Yoo         2026-01-13  6954  	/*
1e8eb4117f2736 Harry Yoo         2026-01-13  6955  	 * Debugging requires use of the padding between object
1e8eb4117f2736 Harry Yoo         2026-01-13  6956  	 * and whatever may come after it.
1e8eb4117f2736 Harry Yoo         2026-01-13  6957  	 */
1e8eb4117f2736 Harry Yoo         2026-01-13  6958  	if (s->flags & (SLAB_RED_ZONE | SLAB_POISON))
1e8eb4117f2736 Harry Yoo         2026-01-13  6959  		return s->object_size;
1e8eb4117f2736 Harry Yoo         2026-01-13  6960  #endif
1e8eb4117f2736 Harry Yoo         2026-01-13 @6961  	if (s->flags & SLAB_KASAN)
1e8eb4117f2736 Harry Yoo         2026-01-13  6962  		return s->object_size;
1e8eb4117f2736 Harry Yoo         2026-01-13  6963  	/*
1e8eb4117f2736 Harry Yoo         2026-01-13  6964  	 * If we have the need to store the freelist pointer
1e8eb4117f2736 Harry Yoo         2026-01-13  6965  	 * back there or track user information then we can
1e8eb4117f2736 Harry Yoo         2026-01-13  6966  	 * only use the space before that information.
1e8eb4117f2736 Harry Yoo         2026-01-13  6967  	 */
1e8eb4117f2736 Harry Yoo         2026-01-13  6968  	if (s->flags & (SLAB_TYPESAFE_BY_RCU | SLAB_STORE_USER))
1e8eb4117f2736 Harry Yoo         2026-01-13  6969  		return s->inuse;
1e8eb4117f2736 Harry Yoo         2026-01-13  6970  	/*
1e8eb4117f2736 Harry Yoo         2026-01-13  6971  	 * Else we can use all the padding etc for the allocation
1e8eb4117f2736 Harry Yoo         2026-01-13  6972  	 */
1e8eb4117f2736 Harry Yoo         2026-01-13  6973  	return s->size;
1e8eb4117f2736 Harry Yoo         2026-01-13  6974  }
1e8eb4117f2736 Harry Yoo         2026-01-13  6975  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
