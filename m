Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FBA2868B5
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Apr 2026 12:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777551086; cv=none; b=n7cJIvyVMaqRxEY2kuZnslE1Fb3KtRkdpdyBFecw13ZiSAlzpkLUoqHqK7+6MfzimS+7II/uEoFZrfzTFJAGljlYZgCN9U82ytMErZH361r0XLyk5lIvLX26mxqD1hZyk4URHQHY79FeYp69dm/Ej/sl2W/CtvgaNoW3XKKIG0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777551086; c=relaxed/simple;
	bh=u3aNhPxdvd8ePVlwMRSlCAU7O/kkZizuXqhyIL6usp4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DFBDFvwyWkv4mh9G/nq9XshlWDOiuskVCg51S8TvXOD5J4K9gCHuNBaL9fzJ9zGClu2hDINZErCKzJDbRxclf20KmhqhmIUWRCG11zms5Vtd17vsKtg/8ZzX++pgZMEKb3RCnvhoqay1wUu8Mky15trLeCK9O4DNuGlVn5u29mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Aoca8LZM; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aoca8LZM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777551085; x=1809087085;
  h=date:from:to:cc:subject:message-id;
  bh=u3aNhPxdvd8ePVlwMRSlCAU7O/kkZizuXqhyIL6usp4=;
  b=Aoca8LZMzhKrNbNQ/przENBeSfJHJ0n6hJUzEyj9pGUdGO9pBQLbMghw
   RdrLOSnBDf0wAbNdlRpuftaUT1Yajq359e046YUKFQ+ylKmyuTsXVMuEi
   uCc6tiW9l6vBKRM2IYK+Mhi5ItN2kLZqAQQEpnVqKrMSq7PApmlqpkkPa
   fiakDsr8ZTSfS82FnZ2ohGwVszDyqeHnHxmeZ086Y3RXKKkoln1QBm3D8
   tZvFv3K73y3CjFZ35hCxqaG2dDTLe2WbnnK3q/CCtZDRXHtfrZkUtMs8U
   2rvBnTcs4s1jLyzYCxcxvQW8Lzdd27Lx1EuhxLw2hw+5neq+1e9C8bbYD
   A==;
X-CSE-ConnectionGUID: GWW1ac12SQC7NHjXof8GJw==
X-CSE-MsgGUID: gd1laQjKSZqjxAIIKDy6Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78603913"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="78603913"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 05:11:24 -0700
X-CSE-ConnectionGUID: Gi5rGoEsRZOOX9YtZO78sA==
X-CSE-MsgGUID: 3o4o5h+oQTGWdvAITobq4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="272683856"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Apr 2026 05:11:23 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIQEi-00000000CNO-34mc;
	Thu, 30 Apr 2026 12:11:20 +0000
Date: Thu, 30 Apr 2026 20:11:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [vbabka:b4/sheaf-flush 18/28] mm/slub.c:7041 slab_ksize()
 warn: bitwise AND condition is false here
Message-ID: <202604302028.X2FxBNx6-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git b4/sheaf-flush
head:   6d7014fd08919005ee3249610bafb50b315d9f05
commit: fab0694646d75d5b03e9898ffb85899fb23320ea [18/28] mm/slab: move [__]ksize and slab_ksize() to mm/slub.c
:::::: branch date: 3 months ago
:::::: commit date: 3 months ago
config: arm-randconfig-r073-20260430 (https://download.01.org/0day-ci/archive/20260430/202604302028.X2FxBNx6-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604302028.X2FxBNx6-lkp@intel.com/

smatch warnings:
mm/slub.c:7041 slab_ksize() warn: bitwise AND condition is false here

vim +7041 mm/slub.c

81819f0fc8285a Christoph Lameter 2007-05-06  7030  
fab0694646d75d Harry Yoo         2026-01-13  7031  static inline size_t slab_ksize(const struct kmem_cache *s)
fab0694646d75d Harry Yoo         2026-01-13  7032  {
fab0694646d75d Harry Yoo         2026-01-13  7033  #ifdef CONFIG_SLUB_DEBUG
fab0694646d75d Harry Yoo         2026-01-13  7034  	/*
fab0694646d75d Harry Yoo         2026-01-13  7035  	 * Debugging requires use of the padding between object
fab0694646d75d Harry Yoo         2026-01-13  7036  	 * and whatever may come after it.
fab0694646d75d Harry Yoo         2026-01-13  7037  	 */
fab0694646d75d Harry Yoo         2026-01-13  7038  	if (s->flags & (SLAB_RED_ZONE | SLAB_POISON))
fab0694646d75d Harry Yoo         2026-01-13  7039  		return s->object_size;
fab0694646d75d Harry Yoo         2026-01-13  7040  #endif
fab0694646d75d Harry Yoo         2026-01-13 @7041  	if (s->flags & SLAB_KASAN)
fab0694646d75d Harry Yoo         2026-01-13  7042  		return s->object_size;
fab0694646d75d Harry Yoo         2026-01-13  7043  	/*
fab0694646d75d Harry Yoo         2026-01-13  7044  	 * If we have the need to store the freelist pointer
fab0694646d75d Harry Yoo         2026-01-13  7045  	 * back there or track user information then we can
fab0694646d75d Harry Yoo         2026-01-13  7046  	 * only use the space before that information.
fab0694646d75d Harry Yoo         2026-01-13  7047  	 */
fab0694646d75d Harry Yoo         2026-01-13  7048  	if (s->flags & (SLAB_TYPESAFE_BY_RCU | SLAB_STORE_USER))
fab0694646d75d Harry Yoo         2026-01-13  7049  		return s->inuse;
fab0694646d75d Harry Yoo         2026-01-13  7050  	/*
fab0694646d75d Harry Yoo         2026-01-13  7051  	 * Else we can use all the padding etc for the allocation
fab0694646d75d Harry Yoo         2026-01-13  7052  	 */
fab0694646d75d Harry Yoo         2026-01-13  7053  	return s->size;
fab0694646d75d Harry Yoo         2026-01-13  7054  }
fab0694646d75d Harry Yoo         2026-01-13  7055  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
