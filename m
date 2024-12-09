Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00201C6A3
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 04:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733719542; cv=none; b=F8/FHe2Em8HUfpT+DILk/3Reqq3m1G0LSHONyK0l2lp+uMmglbY11O5ngpCVvxGvmDRLUejMHwPN2qSF2/isyTqV1htbTK209BjCnS13WrRCT8WPwoPxbxPmEjtm8I8uu4PObZmwVkAo7PcfLfN/A49N3XSBnBODtoJLr2uKIcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733719542; c=relaxed/simple;
	bh=ZZ6gpuE5Kv6HJFnSUTCe3kzivWw9Xcrwsnw15npDbGc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ecbeRPWPMRvdopxFIxWqbl89KIkNwaKj12yBFrFibDHELaIUq1AQ9y54sY9PFCFvcA78xmbTeqMa/NxTNgeeq79JsJ/afvxhIG1m8BxSsl+fEJmNxwkNoHBCn51GnNV92FxK1wRBmPwDTSMET4z+dkhVrtkaOngkhJpc32Gl6I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C9Qm7kjv; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C9Qm7kjv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733719541; x=1765255541;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZZ6gpuE5Kv6HJFnSUTCe3kzivWw9Xcrwsnw15npDbGc=;
  b=C9Qm7kjvAmbVUXAXxi38G5SjFQJVGaS5o5zonVHeBbRK6mb8dZyBetmM
   jZvZ28JdvFOA0XDAETRm1Y2aUGgNwD7+V0fI7z3UKrHjjl8Ffv7gSBWER
   HbQI+uLwREINgH4F/uKt4Q32+Tr0j6MexA6JtI1/vFV3dlP9wgGF9V4GR
   qm7hv7J+FbC1+UWDJel91qH+0T0Tv0RolXF/W5kQNzuwufqZeZsCZvObd
   fIQ/G6ymULjc3kQFPwm5qcUTGLz1Kkew8mPhboeE+0tuOheDi6kcZhYEV
   JUiqilGonEyP0fKxZjjV/Zu+ZDEfGF2vRIv4paUoIvx0PChl78L7ErsuG
   Q==;
X-CSE-ConnectionGUID: vlKui+cYRaSUYWEH8x+Qgw==
X-CSE-MsgGUID: TFnmJk/yRb+7BKVFWtkjuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="56484232"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="56484232"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:45:40 -0800
X-CSE-ConnectionGUID: L9oGYi8xR+Wpfe0QBGbsqw==
X-CSE-MsgGUID: aMjC4GJLRwmIi/xpPWzDQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="100012726"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Dec 2024 20:45:39 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVeK-0003uf-29;
	Mon, 09 Dec 2024 04:45:36 +0000
Date: Mon, 9 Dec 2024 12:44:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: mm/huge_memory.c:3788:6-11: ERROR: iterator variable bound on line
 3750 cannot be NULL
Message-ID: <202412081636.HRRlFH6T-lkp@intel.com>
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
head:   7503345ac5f5e82fd9a36d6e6b447c016376403a
commit: e66f3185fa04ccb807c6fbf0ea066574f4308831 mm/thp: fix deferred split queue not partially_mapped
date:   5 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 5 weeks ago
config: i386-randconfig-051-20241208 (https://download.01.org/0day-ci/archive/20241208/202412081636.HRRlFH6T-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412081636.HRRlFH6T-lkp@intel.com/

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
