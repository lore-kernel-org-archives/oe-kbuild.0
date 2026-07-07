Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516ED3E7BD2
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Jul 2026 16:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783440946; cv=none; b=LN5LRaud6d8zR5X6WA59A6qMhn4/Ul+F3+BM7Jwh5Hz/J9r3/YTT9VWDmT+gDXEwGW+EL5HN7M2m0Hub+HtHcZzzskHIwIolzqGToridjz30SoRWwu18c4KhyfBiF1UXW7Q8RmJDXaZbTFhMJOk7u1ssna8OPHKNHjlgWUMr47Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783440946; c=relaxed/simple;
	bh=+uhtOLXuqO48qvLY41hwGHozsnAF+kSV9bISdzcRg5Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oiSJivx0bULkP3IxKHIowGaeoSNuo0xnupj2j8qGAPjfA7J6DqIeCB03PMIhI6CE5X3RQ1mgHRKg33ImpV+29VLAN5BAbq6YTmOd94l/yiutrx9yO1GKIgdI7xC2UItX4SypDovc9FAa6W3RJcZ17JATNdBi94dnvA1RetQ+5Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kL0JgsiQ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kL0JgsiQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783440945; x=1814976945;
  h=date:from:to:cc:subject:message-id;
  bh=+uhtOLXuqO48qvLY41hwGHozsnAF+kSV9bISdzcRg5Y=;
  b=kL0JgsiQeYUs8BsUXN8wALysY67pA9U6hDxm9YsTD3KIDY1i2caR0jqF
   x+s0NWh6PkVvM6jmf+Zh5l5D83LK01uQ57FLQ8I2gz3L7u6c+lGkBl3/0
   xAgAn3sG1N/h3A/Wc94C0W8P7n1WLlUXq6/KbycUet7s9pLnf6f8b2Iji
   uAQfS6UHCzbrebOr+GkBjaEI9abx8gPTZcbVXjem7Am5yrMnBe4W/XifS
   PoVtNpTC9hfsEtTc1rGPxKJ7SpEcm31oMd4F+bC0wlXosgB9rspfhhGai
   ZscO8++f7xM6aUUv7zjrd67u7LqmYLbbp4LPlYX4yyT64Xokx1sUiYTc9
   g==;
X-CSE-ConnectionGUID: FANSitpLRi+Jx5MwxiXoRQ==
X-CSE-MsgGUID: G/XTGUGlQTaZGenK+Odn/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="86641237"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="86641237"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 09:15:45 -0700
X-CSE-ConnectionGUID: MGPj2qLAS8yxT4gFJUj0Nw==
X-CSE-MsgGUID: pKxiivn7QYe9TBm2Me4m6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="247656324"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 07 Jul 2026 09:15:44 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wh8ST-000000002Zl-3Kis;
	Tue, 07 Jul 2026 16:15:41 +0000
Date: Tue, 07 Jul 2026 18:15:31 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/rmap.c:1161:32: warning: unused variable 'leaf_vma'
Message-ID: <202607071848.QRHwmAJ2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: tao <tao.wangtao@honor.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/tao/mm-add-CONFIG_ANON_VMA_FRACTAL/20260707-144132
head:   e64b011bc52253c6d4c18b85147ef435b008c2c8
commit: f2fd5350eb8cc3bbf1b7be2dece44d930994ae21 mm: optimize rmap for ANON_VMA_FRACTAL with PVL
date:   9 hours ago
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260707/202607071848.QRHwmAJ2-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260707/202607071848.QRHwmAJ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607071848.QRHwmAJ2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/rmap.c: In function 'folio_lock_anon_vma_read':
>> mm/rmap.c:1161:32: warning: unused variable 'leaf_vma' [-Wunused-variable]
    1161 |         struct vm_area_struct *leaf_vma = NULL;
         |                                ^~~~~~~~


vim +/leaf_vma +1161 mm/rmap.c

746b18d421da7f Peter Zijlstra          2011-05-24  1147  
88c22088bf235f Peter Zijlstra          2011-05-24  1148  /*
29eea9b5a9c9ec Matthew Wilcox (Oracle  2022-09-02  1149)  * Similar to folio_get_anon_vma() except it locks the anon_vma.
88c22088bf235f Peter Zijlstra          2011-05-24  1150   *
88c22088bf235f Peter Zijlstra          2011-05-24  1151   * Its a little more complex as it tries to keep the fast path to a single
88c22088bf235f Peter Zijlstra          2011-05-24  1152   * atomic op -- the trylock. If we fail the trylock, we fall back to getting a
29eea9b5a9c9ec Matthew Wilcox (Oracle  2022-09-02  1153)  * reference like with folio_get_anon_vma() and then block on the mutex
6d4675e6013578 Minchan Kim             2022-05-19  1154   * on !rwc->try_lock case.
88c22088bf235f Peter Zijlstra          2011-05-24  1155   */
68158bfa3dbd4a Matthew Wilcox (Oracle  2024-10-05  1156) struct anon_vma *folio_lock_anon_vma_read(const struct folio *folio,
6d4675e6013578 Minchan Kim             2022-05-19  1157  					  struct rmap_walk_control *rwc)
746b18d421da7f Peter Zijlstra          2011-05-24  1158  {
88c22088bf235f Peter Zijlstra          2011-05-24  1159  	struct anon_vma *anon_vma = NULL;
eee0f252c6537d Hugh Dickins            2011-05-28  1160  	struct anon_vma *root_anon_vma;
f2fd5350eb8cc3 tao                     2026-07-07 @1161  	struct vm_area_struct *leaf_vma = NULL;
f2fd5350eb8cc3 tao                     2026-07-07  1162  	struct mm_struct *other_mm = NULL;
88c22088bf235f Peter Zijlstra          2011-05-24  1163  	unsigned long anon_mapping;
88c22088bf235f Peter Zijlstra          2011-05-24  1164  
95b34d66480bbc Lokesh Gidra            2025-09-23  1165  	VM_WARN_ON_FOLIO(!folio_test_locked(folio), folio);
95b34d66480bbc Lokesh Gidra            2025-09-23  1166  
88c22088bf235f Peter Zijlstra          2011-05-24  1167  	rcu_read_lock();
9595d76942b871 Matthew Wilcox (Oracle  2022-02-01  1168) 	anon_mapping = (unsigned long)READ_ONCE(folio->mapping);
df25569d401e36 David Hildenbrand       2025-07-04  1169  	if ((anon_mapping & FOLIO_MAPPING_FLAGS) != FOLIO_MAPPING_ANON)
88c22088bf235f Peter Zijlstra          2011-05-24  1170  		goto out;
9595d76942b871 Matthew Wilcox (Oracle  2022-02-01  1171) 	if (!folio_mapped(folio))
88c22088bf235f Peter Zijlstra          2011-05-24  1172  		goto out;
88c22088bf235f Peter Zijlstra          2011-05-24  1173  
df25569d401e36 David Hildenbrand       2025-07-04  1174  	anon_vma = (struct anon_vma *) (anon_mapping - FOLIO_MAPPING_ANON);
4db0c3c2983cc6 Jason Low               2015-04-15  1175  	root_anon_vma = READ_ONCE(anon_vma->root);
f2fd5350eb8cc3 tao                     2026-07-07  1176  #if defined(CONFIG_PER_VMA_LOCK) && defined(CONFIG_ANON_VMA_FRACTAL)
f2fd5350eb8cc3 tao                     2026-07-07  1177  	leaf_vma = trylock_leaf_vma_rmap(anon_vma, folio, &other_mm);
f2fd5350eb8cc3 tao                     2026-07-07  1178  	if (leaf_vma && !other_mm && folio_mapped(folio)) {
f2fd5350eb8cc3 tao                     2026-07-07  1179  		rcu_read_unlock();
f2fd5350eb8cc3 tao                     2026-07-07  1180  		return (void *)leaf_vma + ANON_RMAP_LEAF_VMA;
f2fd5350eb8cc3 tao                     2026-07-07  1181  	}
f2fd5350eb8cc3 tao                     2026-07-07  1182  	if (unlikely(other_mm))
f2fd5350eb8cc3 tao                     2026-07-07  1183  		mmgrab(other_mm); /* put vma after unlock. */
f2fd5350eb8cc3 tao                     2026-07-07  1184  #endif
4fc3f1d66b1ef0 Ingo Molnar             2012-12-02  1185  	if (down_read_trylock(&root_anon_vma->rwsem)) {
88c22088bf235f Peter Zijlstra          2011-05-24  1186  		/*
9595d76942b871 Matthew Wilcox (Oracle  2022-02-01  1187) 		 * If the folio is still mapped, then this anon_vma is still
eee0f252c6537d Hugh Dickins            2011-05-28  1188  		 * its anon_vma, and holding the mutex ensures that it will
bc658c96037fc8 Peter Zijlstra          2011-05-29  1189  		 * not go away, see anon_vma_free().
88c22088bf235f Peter Zijlstra          2011-05-24  1190  		 */
9595d76942b871 Matthew Wilcox (Oracle  2022-02-01  1191) 		if (!folio_mapped(folio)) {
4fc3f1d66b1ef0 Ingo Molnar             2012-12-02  1192  			up_read(&root_anon_vma->rwsem);
88c22088bf235f Peter Zijlstra          2011-05-24  1193  			anon_vma = NULL;
88c22088bf235f Peter Zijlstra          2011-05-24  1194  		}
88c22088bf235f Peter Zijlstra          2011-05-24  1195  		goto out;
88c22088bf235f Peter Zijlstra          2011-05-24  1196  	}
88c22088bf235f Peter Zijlstra          2011-05-24  1197  
6d4675e6013578 Minchan Kim             2022-05-19  1198  	if (rwc && rwc->try_lock) {
6d4675e6013578 Minchan Kim             2022-05-19  1199  		anon_vma = NULL;
6d4675e6013578 Minchan Kim             2022-05-19  1200  		rwc->contended = true;
6d4675e6013578 Minchan Kim             2022-05-19  1201  		goto out;
6d4675e6013578 Minchan Kim             2022-05-19  1202  	}
6d4675e6013578 Minchan Kim             2022-05-19  1203  
88c22088bf235f Peter Zijlstra          2011-05-24  1204  	/* trylock failed, we got to sleep */
88c22088bf235f Peter Zijlstra          2011-05-24  1205  	if (!atomic_inc_not_zero(&anon_vma->refcount)) {
88c22088bf235f Peter Zijlstra          2011-05-24  1206  		anon_vma = NULL;
88c22088bf235f Peter Zijlstra          2011-05-24  1207  		goto out;
88c22088bf235f Peter Zijlstra          2011-05-24  1208  	}
746b18d421da7f Peter Zijlstra          2011-05-24  1209  
9595d76942b871 Matthew Wilcox (Oracle  2022-02-01  1210) 	if (!folio_mapped(folio)) {
88c22088bf235f Peter Zijlstra          2011-05-24  1211  		put_anon_vma(anon_vma);
f2fd5350eb8cc3 tao                     2026-07-07  1212  		goto out;
88c22088bf235f Peter Zijlstra          2011-05-24  1213  	}
88c22088bf235f Peter Zijlstra          2011-05-24  1214  
88c22088bf235f Peter Zijlstra          2011-05-24  1215  	/* we pinned the anon_vma, its safe to sleep */
88c22088bf235f Peter Zijlstra          2011-05-24  1216  	rcu_read_unlock();
4fc3f1d66b1ef0 Ingo Molnar             2012-12-02  1217  	anon_vma_lock_read(anon_vma);
746b18d421da7f Peter Zijlstra          2011-05-24  1218  
88c22088bf235f Peter Zijlstra          2011-05-24  1219  	if (atomic_dec_and_test(&anon_vma->refcount)) {
88c22088bf235f Peter Zijlstra          2011-05-24  1220  		/*
88c22088bf235f Peter Zijlstra          2011-05-24  1221  		 * Oops, we held the last refcount, release the lock
88c22088bf235f Peter Zijlstra          2011-05-24  1222  		 * and bail -- can't simply use put_anon_vma() because
4fc3f1d66b1ef0 Ingo Molnar             2012-12-02  1223  		 * we'll deadlock on the anon_vma_lock_write() recursion.
88c22088bf235f Peter Zijlstra          2011-05-24  1224  		 */
4fc3f1d66b1ef0 Ingo Molnar             2012-12-02  1225  		anon_vma_unlock_read(anon_vma);
88c22088bf235f Peter Zijlstra          2011-05-24  1226  		__put_anon_vma(anon_vma);
88c22088bf235f Peter Zijlstra          2011-05-24  1227  		anon_vma = NULL;
88c22088bf235f Peter Zijlstra          2011-05-24  1228  	}
88c22088bf235f Peter Zijlstra          2011-05-24  1229  
f2fd5350eb8cc3 tao                     2026-07-07  1230  	goto out_unlocked;
88c22088bf235f Peter Zijlstra          2011-05-24  1231  
88c22088bf235f Peter Zijlstra          2011-05-24  1232  out:
88c22088bf235f Peter Zijlstra          2011-05-24  1233  	rcu_read_unlock();
f2fd5350eb8cc3 tao                     2026-07-07  1234  out_unlocked:
f2fd5350eb8cc3 tao                     2026-07-07  1235  #ifdef CONFIG_PER_VMA_LOCK
f2fd5350eb8cc3 tao                     2026-07-07  1236  	if (leaf_vma)
f2fd5350eb8cc3 tao                     2026-07-07  1237  		vma_refcount_put(leaf_vma);
f2fd5350eb8cc3 tao                     2026-07-07  1238  #endif
f2fd5350eb8cc3 tao                     2026-07-07  1239  	if (other_mm)
f2fd5350eb8cc3 tao                     2026-07-07  1240  		mmdrop(other_mm);
746b18d421da7f Peter Zijlstra          2011-05-24  1241  	return anon_vma;
34bbd704051c9d Oleg Nesterov           2007-02-28  1242  }
34bbd704051c9d Oleg Nesterov           2007-02-28  1243  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
