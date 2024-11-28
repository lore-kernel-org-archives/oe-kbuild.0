Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFD31C07E6
	for <oe-kbuild@lists.linux.dev>; Thu, 28 Nov 2024 17:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732815105; cv=none; b=JuXABv9R3yf0ArKOPADowdGo7wSVXHRkz06SmKCHIzT6hY98eKGUexp9p/tstNWX3bdslsuMIOIFx2PmYzRY9LkvbY/c32CSFPvU8SDwjXYzScyU99VSWoee1XnXPI4FaQW8i4ayiUKY1t0CZ/+2zRAVdgVNggHMCe/OJPNDGbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732815105; c=relaxed/simple;
	bh=9MFNWP3DQUM4wrQtBv4Kg6DxXZNNqOI5ahvLU5bOsz8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dmJ+4MuMlPd9o2kUZxbQ/INRZ/VSWuXf8Sun1Uj/MFOrt+vLj3bi6tNM9Q3LVjbsXlMGqcwUd7/3bNH0d7LIIirmgRAXA5tSp25qY0f9Bw1Sh4cSQjfseYS5yWoikNplrLuzGuATlkcXZIcoUwRPSoX93DSqzBky7MN9n9wrmSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kr60nYvw; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kr60nYvw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732815102; x=1764351102;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9MFNWP3DQUM4wrQtBv4Kg6DxXZNNqOI5ahvLU5bOsz8=;
  b=kr60nYvw6lcFTZf4/Ge1BqHJA8HPI1E85xfYnw/2aj/J5SGnsnHuINdy
   eg4yCxiy+sI3uJUiNqmBPsNvTSM+nNqZieGDPaGJ2lP1VfIWYJEq8dCkj
   0mU/7A2LEHsxrlLuapHkt4zc+C4BRZuBQ7eYr6LLyO3nCrXv9cDQGzaci
   GGlKLYQGPsI7I5YUjAZS0llFB6xc8Pvw1u8DyyQDSzthce5fzoHgUa5A5
   Mubqn1YlgjaEY/aE1dpp0ZsWo3689I2w2rVavM/cqMhCYL5Fgfi9Rr8jH
   43kRdOgoa6WQ83/PSj1qZBngJm+7hzbIDjc/lkosKpmjv3nwSEFL5W/z5
   Q==;
X-CSE-ConnectionGUID: DqwE8GzHS7q0/1Q6Zuz11g==
X-CSE-MsgGUID: ODOnEf+7TGeOKTHJCQfuIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="32991306"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="32991306"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 09:31:39 -0800
X-CSE-ConnectionGUID: royUTGCxTL+bymxmWNfSlQ==
X-CSE-MsgGUID: W/epaqkdSCuYtKwOrL2OiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="97387369"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Nov 2024 09:31:37 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGiMZ-0009rt-27;
	Thu, 28 Nov 2024 17:31:35 +0000
Date: Fri, 29 Nov 2024 01:31:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: mm/huge_memory.c:3788:6-11: ERROR: iterator variable bound on line
 3750 cannot be NULL
Message-ID: <202411290100.l4zmcmhE-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Hugh Dickins <hughd@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: David Hildenbrand <david@redhat.com>
CC: Baolin Wang <baolin.wang@linux.alibaba.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b86545e02e8c22fb89218f29d381fa8e8b91d815
commit: e66f3185fa04ccb807c6fbf0ea066574f4308831 mm/thp: fix deferred split queue not partially_mapped
date:   3 weeks ago
:::::: branch date: 19 hours ago
:::::: commit date: 3 weeks ago
config: i386-randconfig-052-20241114 (https://download.01.org/0day-ci/archive/20241129/202411290100.l4zmcmhE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411290100.l4zmcmhE-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/huge_memory.c:3788:6-11: ERROR: iterator variable bound on line 3750 cannot be NULL

vim +3788 mm/huge_memory.c

87eaceb3faa59b Yang Shi                2019-09-23  3728  
364c1eebe453f0 Yang Shi                2019-09-23  3729  	spin_lock_irqsave(&ds_queue->split_queue_lock, flags);
9a982250f773cc Kirill A. Shutemov      2016-01-15  3730  	/* Take pin on all head pages to avoid freeing them under us */
4375a553f46c6c Matthew Wilcox (Oracle  2023-01-11  3731) 	list_for_each_entry_safe(folio, next, &ds_queue->split_queue,
4375a553f46c6c Matthew Wilcox (Oracle  2023-01-11  3732) 							_deferred_list) {
4375a553f46c6c Matthew Wilcox (Oracle  2023-01-11  3733) 		if (folio_try_get(folio)) {
4375a553f46c6c Matthew Wilcox (Oracle  2023-01-11  3734) 			list_move(&folio->_deferred_list, &list);
e3ae19535c6657 Kirill A. Shutemov      2016-02-02  3735  		} else {
4375a553f46c6c Matthew Wilcox (Oracle  2023-01-11  3736) 			/* We lost race with folio_put() */
8422acdc97ed58 Usama Arif              2024-08-30  3737  			if (folio_test_partially_mapped(folio)) {
8422acdc97ed58 Usama Arif              2024-08-30  3738  				__folio_clear_partially_mapped(folio);
8422acdc97ed58 Usama Arif              2024-08-30  3739  				mod_mthp_stat(folio_order(folio),
8422acdc97ed58 Usama Arif              2024-08-30  3740  					      MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, -1);
8422acdc97ed58 Usama Arif              2024-08-30  3741  			}
4375a553f46c6c Matthew Wilcox (Oracle  2023-01-11  3742) 			list_del_init(&folio->_deferred_list);
364c1eebe453f0 Yang Shi                2019-09-23  3743  			ds_queue->split_queue_len--;
9a982250f773cc Kirill A. Shutemov      2016-01-15  3744  		}
e3ae19535c6657 Kirill A. Shutemov      2016-02-02  3745  		if (!--sc->nr_to_scan)
e3ae19535c6657 Kirill A. Shutemov      2016-02-02  3746  			break;
9a982250f773cc Kirill A. Shutemov      2016-01-15  3747  	}
364c1eebe453f0 Yang Shi                2019-09-23  3748  	spin_unlock_irqrestore(&ds_queue->split_queue_lock, flags);
9a982250f773cc Kirill A. Shutemov      2016-01-15  3749  
4375a553f46c6c Matthew Wilcox (Oracle  2023-01-11 @3750) 	list_for_each_entry_safe(folio, next, &list, _deferred_list) {
dafff3f4c850c9 Usama Arif              2024-08-30  3751  		bool did_split = false;
dafff3f4c850c9 Usama Arif              2024-08-30  3752  		bool underused = false;
dafff3f4c850c9 Usama Arif              2024-08-30  3753  
dafff3f4c850c9 Usama Arif              2024-08-30  3754  		if (!folio_test_partially_mapped(folio)) {
dafff3f4c850c9 Usama Arif              2024-08-30  3755  			underused = thp_underused(folio);
dafff3f4c850c9 Usama Arif              2024-08-30  3756  			if (!underused)
dafff3f4c850c9 Usama Arif              2024-08-30  3757  				goto next;
dafff3f4c850c9 Usama Arif              2024-08-30  3758  		}
4375a553f46c6c Matthew Wilcox (Oracle  2023-01-11  3759) 		if (!folio_trylock(folio))
fa41b900c30b45 Kirill A. Shutemov      2018-03-22  3760  			goto next;
dafff3f4c850c9 Usama Arif              2024-08-30  3761  		if (!split_folio(folio)) {
dafff3f4c850c9 Usama Arif              2024-08-30  3762  			did_split = true;
dafff3f4c850c9 Usama Arif              2024-08-30  3763  			if (underused)
dafff3f4c850c9 Usama Arif              2024-08-30  3764  				count_vm_event(THP_UNDERUSED_SPLIT_PAGE);
9a982250f773cc Kirill A. Shutemov      2016-01-15  3765  			split++;
dafff3f4c850c9 Usama Arif              2024-08-30  3766  		}
4375a553f46c6c Matthew Wilcox (Oracle  2023-01-11  3767) 		folio_unlock(folio);
fa41b900c30b45 Kirill A. Shutemov      2018-03-22  3768  next:
dafff3f4c850c9 Usama Arif              2024-08-30  3769  		/*
dafff3f4c850c9 Usama Arif              2024-08-30  3770  		 * split_folio() removes folio from list on success.
dafff3f4c850c9 Usama Arif              2024-08-30  3771  		 * Only add back to the queue if folio is partially mapped.
dafff3f4c850c9 Usama Arif              2024-08-30  3772  		 * If thp_underused returns false, or if split_folio fails
dafff3f4c850c9 Usama Arif              2024-08-30  3773  		 * in the case it was underused, then consider it used and
dafff3f4c850c9 Usama Arif              2024-08-30  3774  		 * don't add it back to split_queue.
dafff3f4c850c9 Usama Arif              2024-08-30  3775  		 */
dafff3f4c850c9 Usama Arif              2024-08-30  3776  		if (!did_split && !folio_test_partially_mapped(folio)) {
dafff3f4c850c9 Usama Arif              2024-08-30  3777  			list_del_init(&folio->_deferred_list);
e66f3185fa04cc Hugh Dickins            2024-10-27  3778  			removed++;
e66f3185fa04cc Hugh Dickins            2024-10-27  3779  		} else {
e66f3185fa04cc Hugh Dickins            2024-10-27  3780  			/*
e66f3185fa04cc Hugh Dickins            2024-10-27  3781  			 * That unlocked list_del_init() above would be unsafe,
e66f3185fa04cc Hugh Dickins            2024-10-27  3782  			 * unless its folio is separated from any earlier folios
e66f3185fa04cc Hugh Dickins            2024-10-27  3783  			 * left on the list (which may be concurrently unqueued)
e66f3185fa04cc Hugh Dickins            2024-10-27  3784  			 * by one safe folio with refcount still raised.
e66f3185fa04cc Hugh Dickins            2024-10-27  3785  			 */
e66f3185fa04cc Hugh Dickins            2024-10-27  3786  			swap(folio, prev);
dafff3f4c850c9 Usama Arif              2024-08-30  3787  		}
e66f3185fa04cc Hugh Dickins            2024-10-27 @3788  		if (folio)
4375a553f46c6c Matthew Wilcox (Oracle  2023-01-11  3789) 			folio_put(folio);
9a982250f773cc Kirill A. Shutemov      2016-01-15  3790  	}
9a982250f773cc Kirill A. Shutemov      2016-01-15  3791  
364c1eebe453f0 Yang Shi                2019-09-23  3792  	spin_lock_irqsave(&ds_queue->split_queue_lock, flags);
364c1eebe453f0 Yang Shi                2019-09-23  3793  	list_splice_tail(&list, &ds_queue->split_queue);
e66f3185fa04cc Hugh Dickins            2024-10-27  3794  	ds_queue->split_queue_len -= removed;
364c1eebe453f0 Yang Shi                2019-09-23  3795  	spin_unlock_irqrestore(&ds_queue->split_queue_lock, flags);
9a982250f773cc Kirill A. Shutemov      2016-01-15  3796  
e66f3185fa04cc Hugh Dickins            2024-10-27  3797  	if (prev)
e66f3185fa04cc Hugh Dickins            2024-10-27  3798  		folio_put(prev);
e66f3185fa04cc Hugh Dickins            2024-10-27  3799  
cb8d68ec16a511 Kirill A. Shutemov      2016-02-02  3800  	/*
cb8d68ec16a511 Kirill A. Shutemov      2016-02-02  3801  	 * Stop shrinker if we didn't split any page, but the queue is empty.
cb8d68ec16a511 Kirill A. Shutemov      2016-02-02  3802  	 * This can happen if pages were freed under us.
cb8d68ec16a511 Kirill A. Shutemov      2016-02-02  3803  	 */
364c1eebe453f0 Yang Shi                2019-09-23  3804  	if (!split && list_empty(&ds_queue->split_queue))
cb8d68ec16a511 Kirill A. Shutemov      2016-02-02  3805  		return SHRINK_STOP;
cb8d68ec16a511 Kirill A. Shutemov      2016-02-02  3806  	return split;
9a982250f773cc Kirill A. Shutemov      2016-01-15  3807  }
9a982250f773cc Kirill A. Shutemov      2016-01-15  3808  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
