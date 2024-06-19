Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38838475
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Jun 2024 19:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718825322; cv=none; b=a+8RnzcSmAUj9AnoDeGgVzebHaw0fUHNEoG9GcyzyyHoTUfL0PlXwWyAO7hrEKcYqUWqHDXh6NsUCwJ+C8ZhtDA+2D8jWc+PptxOuH11zULEkI5DcwmeKOgdZinMPTusedQlkFCGPz5zqJDkFYLhmiolLQaC9uUIxkBTMBTWHrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718825322; c=relaxed/simple;
	bh=VN8ejFDBQomNVj0EbHgNwFrsuaNiJXglQzfsJIw8EwM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l5rQ1cj611+32KEmAiox1wuWSI0x6/ImGSor+uXEaU/wXNcV7ql+xjYpXkAa4bV/CorZjQycCVSZww5oONOgUNIiRi3jX27EFZnRRcIjxjQG1D1+A4b+lgK/HrpR4ibIwAbk8NrzocpS5PSheczhrwXwqNWKoUrseAg4JYqqFv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fKLD4B0w; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fKLD4B0w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718825320; x=1750361320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VN8ejFDBQomNVj0EbHgNwFrsuaNiJXglQzfsJIw8EwM=;
  b=fKLD4B0wRBPpRG6sf1e+1mw8F3wzda/DRndtaKU9Og0ku1J5vAMm54E8
   EjzVU3BsTs7M8kI90KQfCHkm+r/DH2z5SLKeL0ZTosjJkDyVGWUuBeSUv
   WxYcmQfmhBuZjMBG7juhwSJ6evvqzf+SpW0s4rIrQv9DivnAdugrThg5i
   9XQAi7dlkugEUqPbdqABEtNeDgFu8tmDJM8PuWWa2m8EOqUxYc44XFo7b
   xZaR0rcJsMxxoNOju+s5yKJG6H5fD9gXfhC0Tfkf/0fIxY3Gyn5sBpAkJ
   zhkKoS9MRh5XLzPBftapMzAuO+rNiX2CnB4OF8xScGTkYnpZksw1dLlEW
   g==;
X-CSE-ConnectionGUID: tnozL+PkRV23QS+0NlgWTQ==
X-CSE-MsgGUID: CkNV+To6SjKitSIP35gWBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="19596277"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="19596277"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 12:28:39 -0700
X-CSE-ConnectionGUID: 4LMKgRo6Rg+NfHItkPMJ1w==
X-CSE-MsgGUID: l8eXcyssSVyyMpNwQn046w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="42672629"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 19 Jun 2024 12:28:38 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sK0yx-0006vY-32;
	Wed, 19 Jun 2024 19:28:35 +0000
Date: Thu, 20 Jun 2024 03:28:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6719/7105] mm/swapfile.c:3433 __swap_duplicate()
 error: uninitialized symbol 'err'.
Message-ID: <202406200353.3HLZ0mmi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Baolin Wang <baolin.wang@linux.alibaba.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2102cb0d050d34d50b9642a3a50861787527e922
commit: 63919ec4aaef2ec6eb9c8d6923276040b3a38964 [6719/7105] mm: swap: extend swap_shmem_alloc() to support batch SWAP_MAP_SHMEM flag setting
:::::: branch date: 4 hours ago
:::::: commit date: 21 hours ago
config: sparc-randconfig-r071-20240619 (https://download.01.org/0day-ci/archive/20240620/202406200353.3HLZ0mmi-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406200353.3HLZ0mmi-lkp@intel.com/

smatch warnings:
mm/swapfile.c:3433 __swap_duplicate() error: uninitialized symbol 'err'.

vim +/err +3433 mm/swapfile.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  3368  
^1da177e4c3f41 Linus Torvalds    2005-04-16  3369  /*
^1da177e4c3f41 Linus Torvalds    2005-04-16  3370   * Verify that a swap entry is valid and increment its swap map count.
^1da177e4c3f41 Linus Torvalds    2005-04-16  3371   *
355cfa73ddff2f KAMEZAWA Hiroyuki 2009-06-16  3372   * Returns error code in following case.
355cfa73ddff2f KAMEZAWA Hiroyuki 2009-06-16  3373   * - success -> 0
355cfa73ddff2f KAMEZAWA Hiroyuki 2009-06-16  3374   * - swp_entry is invalid -> EINVAL
355cfa73ddff2f KAMEZAWA Hiroyuki 2009-06-16  3375   * - swp_entry is migration entry -> EINVAL
355cfa73ddff2f KAMEZAWA Hiroyuki 2009-06-16  3376   * - swap-cache reference is requested but there is already one. -> EEXIST
355cfa73ddff2f KAMEZAWA Hiroyuki 2009-06-16  3377   * - swap-cache reference is requested but the entry is not used. -> ENOENT
570a335b8e2257 Hugh Dickins      2009-12-14  3378   * - swap-mapped reference requested but needs continued swap count. -> ENOMEM
^1da177e4c3f41 Linus Torvalds    2005-04-16  3379   */
63919ec4aaef2e Baolin Wang       2024-06-18  3380  static int __swap_duplicate(struct swap_info_struct *p, unsigned long offset,
63919ec4aaef2e Baolin Wang       2024-06-18  3381  			    int nr, unsigned char usage)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3382  {
235b62176712b9 Huang, Ying       2017-02-22  3383  	struct swap_cluster_info *ci;
8d69aaee80c123 Hugh Dickins      2009-12-14  3384  	unsigned char count;
8d69aaee80c123 Hugh Dickins      2009-12-14  3385  	unsigned char has_cache;
63919ec4aaef2e Baolin Wang       2024-06-18  3386  	int err, i;
235b62176712b9 Huang, Ying       2017-02-22  3387  
235b62176712b9 Huang, Ying       2017-02-22  3388  	ci = lock_cluster_or_swap_info(p, offset);
355cfa73ddff2f KAMEZAWA Hiroyuki 2009-06-16  3389  
63919ec4aaef2e Baolin Wang       2024-06-18  3390  	for (i = 0; i < nr; i++) {
63919ec4aaef2e Baolin Wang       2024-06-18  3391  		count = p->swap_map[offset + i];
edfe23dac3e298 Shaohua Li        2013-09-11  3392  
edfe23dac3e298 Shaohua Li        2013-09-11  3393  		/*
edfe23dac3e298 Shaohua Li        2013-09-11  3394  		 * swapin_readahead() doesn't check if a swap entry is valid, so the
edfe23dac3e298 Shaohua Li        2013-09-11  3395  		 * swap entry could be SWAP_MAP_BAD. Check here with lock held.
edfe23dac3e298 Shaohua Li        2013-09-11  3396  		 */
edfe23dac3e298 Shaohua Li        2013-09-11  3397  		if (unlikely(swap_count(count) == SWAP_MAP_BAD)) {
edfe23dac3e298 Shaohua Li        2013-09-11  3398  			err = -ENOENT;
63919ec4aaef2e Baolin Wang       2024-06-18  3399  			break;
edfe23dac3e298 Shaohua Li        2013-09-11  3400  		}
edfe23dac3e298 Shaohua Li        2013-09-11  3401  
253d553ba75ab2 Hugh Dickins      2009-12-14  3402  		has_cache = count & SWAP_HAS_CACHE;
253d553ba75ab2 Hugh Dickins      2009-12-14  3403  		count &= ~SWAP_HAS_CACHE;
253d553ba75ab2 Hugh Dickins      2009-12-14  3404  		err = 0;
355cfa73ddff2f KAMEZAWA Hiroyuki 2009-06-16  3405  
253d553ba75ab2 Hugh Dickins      2009-12-14  3406  		if (usage == SWAP_HAS_CACHE) {
355cfa73ddff2f KAMEZAWA Hiroyuki 2009-06-16  3407  			/* set SWAP_HAS_CACHE if there is no cache and entry is used */
253d553ba75ab2 Hugh Dickins      2009-12-14  3408  			if (!has_cache && count)
253d553ba75ab2 Hugh Dickins      2009-12-14  3409  				has_cache = SWAP_HAS_CACHE;
253d553ba75ab2 Hugh Dickins      2009-12-14  3410  			else if (has_cache)		/* someone else added cache */
253d553ba75ab2 Hugh Dickins      2009-12-14  3411  				err = -EEXIST;
253d553ba75ab2 Hugh Dickins      2009-12-14  3412  			else				/* no users remaining */
253d553ba75ab2 Hugh Dickins      2009-12-14  3413  				err = -ENOENT;
355cfa73ddff2f KAMEZAWA Hiroyuki 2009-06-16  3414  		} else if (count || has_cache) {
570a335b8e2257 Hugh Dickins      2009-12-14  3415  			if ((count & ~COUNT_CONTINUED) < SWAP_MAP_MAX)
570a335b8e2257 Hugh Dickins      2009-12-14  3416  				count += usage;
570a335b8e2257 Hugh Dickins      2009-12-14  3417  			else if ((count & ~COUNT_CONTINUED) > SWAP_MAP_MAX)
253d553ba75ab2 Hugh Dickins      2009-12-14  3418  				err = -EINVAL;
63919ec4aaef2e Baolin Wang       2024-06-18  3419  			else if (swap_count_continued(p, offset + i, count))
570a335b8e2257 Hugh Dickins      2009-12-14  3420  				count = COUNT_CONTINUED;
570a335b8e2257 Hugh Dickins      2009-12-14  3421  			else
570a335b8e2257 Hugh Dickins      2009-12-14  3422  				err = -ENOMEM;
355cfa73ddff2f KAMEZAWA Hiroyuki 2009-06-16  3423  		} else
253d553ba75ab2 Hugh Dickins      2009-12-14  3424  			err = -ENOENT;			/* unused swap entry */
253d553ba75ab2 Hugh Dickins      2009-12-14  3425  
63919ec4aaef2e Baolin Wang       2024-06-18  3426  		if (err)
63919ec4aaef2e Baolin Wang       2024-06-18  3427  			break;
63919ec4aaef2e Baolin Wang       2024-06-18  3428  
63919ec4aaef2e Baolin Wang       2024-06-18  3429  		WRITE_ONCE(p->swap_map[offset + i], count | has_cache);
63919ec4aaef2e Baolin Wang       2024-06-18  3430  	}
253d553ba75ab2 Hugh Dickins      2009-12-14  3431  
235b62176712b9 Huang, Ying       2017-02-22  3432  	unlock_cluster_or_swap_info(p, ci);
253d553ba75ab2 Hugh Dickins      2009-12-14 @3433  	return err;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3434  }
253d553ba75ab2 Hugh Dickins      2009-12-14  3435  

:::::: The code at line 3433 was first introduced by commit
:::::: 253d553ba75ab26b3e9e2f70cbf6fbf0813f7e86 swap_info: SWAP_HAS_CACHE cleanups

:::::: TO: Hugh Dickins <hugh.dickins@tiscali.co.uk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
