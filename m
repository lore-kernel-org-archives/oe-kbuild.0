Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9621990C4
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Nov 2024 22:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731624141; cv=none; b=qJvMyu7NFXQW0Hl455iDwNrtUD/l/9d/ZWUiNIeBRSNgTTViQlt6XGg4S4kg4EEwx7/TbM9mUGugrfKvhY9+6fHGPU1S7Fd50mpjwO69OUKqnNRykR0gq6WTQavOLAHJLdxW5ZzGyOiWXBN7J/0pz+0z8Z0WWVSIN/zT3i7Z3NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731624141; c=relaxed/simple;
	bh=6V6tHoBXzEf//GJqIFE99qcxVcepnk64neTkGI6X74A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZoUPq4JlYPt3Zk1BC0iFisGGUxvqd3RxtbFo2/oCXsqGbgMjb0NfvD+ZPdnuvbrmY2gFa+TcAbkgQXKlflOqwg+m78ibo4OMJbVE5QRsZx1Id7fdiVt6+u4Kxf9a+/2i5epxZU1Sswf/ogAvhhVsEajVyytQz0tTEbKMG2hfiMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZbAysxUf; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZbAysxUf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731624139; x=1763160139;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6V6tHoBXzEf//GJqIFE99qcxVcepnk64neTkGI6X74A=;
  b=ZbAysxUf6Y+3GfhsAwQJ1IzEkZJ+YJX0Hord0kZey5zyh2yHdedX5ZuD
   8Jz+Z3sp7Ump9lYCnu0huMc31eukzaviT1FKFVxNh17Ydy5M2LBeme51N
   K/90taJUSJOatfzXLIxEOtkFklLdXPSDBQy4QUsdZS5vtM1L+XvDWALvA
   ld86SceqiNQePxdUyHeyiIKwNTY6IsLrjZZcLp+7/FAlYSFn42m9B0dXs
   /lN9Ob2D5+Sr4mlJr97HoChwINYotw0pfjBeTE7iH95Src144ta/GYHRo
   w9iskD++IDpNZA9CO+scVsftnhbMDtIf2VwMJEJDFg6FHKDry3HUVSpuv
   g==;
X-CSE-ConnectionGUID: 31KtB7tIT4iRnCvYAU+PHw==
X-CSE-MsgGUID: 8OWc/E5cTDKBIFG6CSExhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="42991891"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; 
   d="scan'208";a="42991891"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 14:42:19 -0800
X-CSE-ConnectionGUID: H2G1ZXhiS32+8cqdrc5QkA==
X-CSE-MsgGUID: qXLMJkvCT3yUlEydaa7Rzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; 
   d="scan'208";a="88762446"
Received: from lkp-server02.sh.intel.com (HELO f5eddd9a323a) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 14 Nov 2024 14:42:17 -0800
Received: from kbuild by f5eddd9a323a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBiWs-00005B-2D;
	Thu, 14 Nov 2024 22:42:01 +0000
Date: Fri, 15 Nov 2024 06:40:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: mm/huge_memory.c:3788:6-11: ERROR: iterator variable bound on line
 3750 cannot be NULL
Message-ID: <202411150635.qhXtEgJU-lkp@intel.com>
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
head:   cfaaa7d010d1fc58f9717fcc8591201e741d2d49
commit: e66f3185fa04ccb807c6fbf0ea066574f4308831 mm/thp: fix deferred split queue not partially_mapped
date:   9 days ago
:::::: branch date: 5 hours ago
:::::: commit date: 9 days ago
config: i386-randconfig-052-20241114 (https://download.01.org/0day-ci/archive/20241115/202411150635.qhXtEgJU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411150635.qhXtEgJU-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/huge_memory.c:3788:6-11: ERROR: iterator variable bound on line 3750 cannot be NULL

vim +3788 mm/huge_memory.c

87eaceb3faa59b9 Yang Shi                2019-09-23  3728  
364c1eebe453f06 Yang Shi                2019-09-23  3729  	spin_lock_irqsave(&ds_queue->split_queue_lock, flags);
9a982250f773cc8 Kirill A. Shutemov      2016-01-15  3730  	/* Take pin on all head pages to avoid freeing them under us */
4375a553f46c6cb Matthew Wilcox (Oracle  2023-01-11  3731) 	list_for_each_entry_safe(folio, next, &ds_queue->split_queue,
4375a553f46c6cb Matthew Wilcox (Oracle  2023-01-11  3732) 							_deferred_list) {
4375a553f46c6cb Matthew Wilcox (Oracle  2023-01-11  3733) 		if (folio_try_get(folio)) {
4375a553f46c6cb Matthew Wilcox (Oracle  2023-01-11  3734) 			list_move(&folio->_deferred_list, &list);
e3ae19535c66577 Kirill A. Shutemov      2016-02-02  3735  		} else {
4375a553f46c6cb Matthew Wilcox (Oracle  2023-01-11  3736) 			/* We lost race with folio_put() */
8422acdc97ed583 Usama Arif              2024-08-30  3737  			if (folio_test_partially_mapped(folio)) {
8422acdc97ed583 Usama Arif              2024-08-30  3738  				__folio_clear_partially_mapped(folio);
8422acdc97ed583 Usama Arif              2024-08-30  3739  				mod_mthp_stat(folio_order(folio),
8422acdc97ed583 Usama Arif              2024-08-30  3740  					      MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, -1);
8422acdc97ed583 Usama Arif              2024-08-30  3741  			}
4375a553f46c6cb Matthew Wilcox (Oracle  2023-01-11  3742) 			list_del_init(&folio->_deferred_list);
364c1eebe453f06 Yang Shi                2019-09-23  3743  			ds_queue->split_queue_len--;
9a982250f773cc8 Kirill A. Shutemov      2016-01-15  3744  		}
e3ae19535c66577 Kirill A. Shutemov      2016-02-02  3745  		if (!--sc->nr_to_scan)
e3ae19535c66577 Kirill A. Shutemov      2016-02-02  3746  			break;
9a982250f773cc8 Kirill A. Shutemov      2016-01-15  3747  	}
364c1eebe453f06 Yang Shi                2019-09-23  3748  	spin_unlock_irqrestore(&ds_queue->split_queue_lock, flags);
9a982250f773cc8 Kirill A. Shutemov      2016-01-15  3749  
4375a553f46c6cb Matthew Wilcox (Oracle  2023-01-11 @3750) 	list_for_each_entry_safe(folio, next, &list, _deferred_list) {
dafff3f4c850c98 Usama Arif              2024-08-30  3751  		bool did_split = false;
dafff3f4c850c98 Usama Arif              2024-08-30  3752  		bool underused = false;
dafff3f4c850c98 Usama Arif              2024-08-30  3753  
dafff3f4c850c98 Usama Arif              2024-08-30  3754  		if (!folio_test_partially_mapped(folio)) {
dafff3f4c850c98 Usama Arif              2024-08-30  3755  			underused = thp_underused(folio);
dafff3f4c850c98 Usama Arif              2024-08-30  3756  			if (!underused)
dafff3f4c850c98 Usama Arif              2024-08-30  3757  				goto next;
dafff3f4c850c98 Usama Arif              2024-08-30  3758  		}
4375a553f46c6cb Matthew Wilcox (Oracle  2023-01-11  3759) 		if (!folio_trylock(folio))
fa41b900c30b45f Kirill A. Shutemov      2018-03-22  3760  			goto next;
dafff3f4c850c98 Usama Arif              2024-08-30  3761  		if (!split_folio(folio)) {
dafff3f4c850c98 Usama Arif              2024-08-30  3762  			did_split = true;
dafff3f4c850c98 Usama Arif              2024-08-30  3763  			if (underused)
dafff3f4c850c98 Usama Arif              2024-08-30  3764  				count_vm_event(THP_UNDERUSED_SPLIT_PAGE);
9a982250f773cc8 Kirill A. Shutemov      2016-01-15  3765  			split++;
dafff3f4c850c98 Usama Arif              2024-08-30  3766  		}
4375a553f46c6cb Matthew Wilcox (Oracle  2023-01-11  3767) 		folio_unlock(folio);
fa41b900c30b45f Kirill A. Shutemov      2018-03-22  3768  next:
dafff3f4c850c98 Usama Arif              2024-08-30  3769  		/*
dafff3f4c850c98 Usama Arif              2024-08-30  3770  		 * split_folio() removes folio from list on success.
dafff3f4c850c98 Usama Arif              2024-08-30  3771  		 * Only add back to the queue if folio is partially mapped.
dafff3f4c850c98 Usama Arif              2024-08-30  3772  		 * If thp_underused returns false, or if split_folio fails
dafff3f4c850c98 Usama Arif              2024-08-30  3773  		 * in the case it was underused, then consider it used and
dafff3f4c850c98 Usama Arif              2024-08-30  3774  		 * don't add it back to split_queue.
dafff3f4c850c98 Usama Arif              2024-08-30  3775  		 */
dafff3f4c850c98 Usama Arif              2024-08-30  3776  		if (!did_split && !folio_test_partially_mapped(folio)) {
dafff3f4c850c98 Usama Arif              2024-08-30  3777  			list_del_init(&folio->_deferred_list);
e66f3185fa04ccb Hugh Dickins            2024-10-27  3778  			removed++;
e66f3185fa04ccb Hugh Dickins            2024-10-27  3779  		} else {
e66f3185fa04ccb Hugh Dickins            2024-10-27  3780  			/*
e66f3185fa04ccb Hugh Dickins            2024-10-27  3781  			 * That unlocked list_del_init() above would be unsafe,
e66f3185fa04ccb Hugh Dickins            2024-10-27  3782  			 * unless its folio is separated from any earlier folios
e66f3185fa04ccb Hugh Dickins            2024-10-27  3783  			 * left on the list (which may be concurrently unqueued)
e66f3185fa04ccb Hugh Dickins            2024-10-27  3784  			 * by one safe folio with refcount still raised.
e66f3185fa04ccb Hugh Dickins            2024-10-27  3785  			 */
e66f3185fa04ccb Hugh Dickins            2024-10-27  3786  			swap(folio, prev);
dafff3f4c850c98 Usama Arif              2024-08-30  3787  		}
e66f3185fa04ccb Hugh Dickins            2024-10-27 @3788  		if (folio)
4375a553f46c6cb Matthew Wilcox (Oracle  2023-01-11  3789) 			folio_put(folio);
9a982250f773cc8 Kirill A. Shutemov      2016-01-15  3790  	}
9a982250f773cc8 Kirill A. Shutemov      2016-01-15  3791  
364c1eebe453f06 Yang Shi                2019-09-23  3792  	spin_lock_irqsave(&ds_queue->split_queue_lock, flags);
364c1eebe453f06 Yang Shi                2019-09-23  3793  	list_splice_tail(&list, &ds_queue->split_queue);
e66f3185fa04ccb Hugh Dickins            2024-10-27  3794  	ds_queue->split_queue_len -= removed;
364c1eebe453f06 Yang Shi                2019-09-23  3795  	spin_unlock_irqrestore(&ds_queue->split_queue_lock, flags);
9a982250f773cc8 Kirill A. Shutemov      2016-01-15  3796  
e66f3185fa04ccb Hugh Dickins            2024-10-27  3797  	if (prev)
e66f3185fa04ccb Hugh Dickins            2024-10-27  3798  		folio_put(prev);
e66f3185fa04ccb Hugh Dickins            2024-10-27  3799  
cb8d68ec16a511f Kirill A. Shutemov      2016-02-02  3800  	/*
cb8d68ec16a511f Kirill A. Shutemov      2016-02-02  3801  	 * Stop shrinker if we didn't split any page, but the queue is empty.
cb8d68ec16a511f Kirill A. Shutemov      2016-02-02  3802  	 * This can happen if pages were freed under us.
cb8d68ec16a511f Kirill A. Shutemov      2016-02-02  3803  	 */
364c1eebe453f06 Yang Shi                2019-09-23  3804  	if (!split && list_empty(&ds_queue->split_queue))
cb8d68ec16a511f Kirill A. Shutemov      2016-02-02  3805  		return SHRINK_STOP;
cb8d68ec16a511f Kirill A. Shutemov      2016-02-02  3806  	return split;
9a982250f773cc8 Kirill A. Shutemov      2016-01-15  3807  }
9a982250f773cc8 Kirill A. Shutemov      2016-01-15  3808  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
