Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3FF8466
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Jan 2023 15:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672760356; x=1704296356;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DpltPw0bDP5nT+NnmAsWAyUzabuB2uCADapmDHcypkc=;
  b=Z51m1C4BAUKizQk+A11Rxb2DbyAU953IVaHT61BQ7SRQH5xAxYvdZJge
   2S1Gst8PcSs/3sE/od4yZj1UrpS6nLt6uZYdmjiqchNQ3eSqhFr7v9xpN
   wUKhC+k7ksiNbNrM4kcweG5YK6xd9mUjCQY4uHjR+OFybQ6CEVZzBLn+4
   T4gEoHL+DCmYBG6cXvT7LqNPfYMksbpUv7r+06NBKiutAEY/rch+Pr4Rs
   vn8mya6QiUC9G3Vnbo5oIaGDSrxaUhkhmYs0l3fpq2dIpChDtoOSbDfCm
   AB0rrVbyul6aW/ycsJpXksndM+p3ebgojHIvPpIRciIHuDLTEOZ7XbLQg
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="302058992"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="302058992"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2023 07:39:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="656799947"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="656799947"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 03 Jan 2023 07:39:12 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pCjNa-000SPR-1s;
	Tue, 03 Jan 2023 15:39:06 +0000
Date: Tue, 3 Jan 2023 23:38:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/slab_common.c:446:24: warning: Uninitialized variables:
 s.object_size, s.size, s.align, s.flags, s.name, s.refcount, s.ctor, s.list
 [uninitvar]
Message-ID: <202301032318.w8tWt9o6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: mm/slab_common.c:446:24: warning: Uninitialized variables: s.object_size, s.size, s.align, s.flags, s.name, s.refcount, s.ctor, s.list [uninitvar]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Vlastimil Babka <vbabka@suse.cz>
CC: Christoph Lameter <cl@linux-foundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   69b41ac87e4a664de78a395ff97166f0b2943210
commit: 346907ceb9d11b9e22677c142b45ff50dd20a66a mm, slab: ignore hardened usercopy parameters when disabled
date:   5 weeks ago
:::::: branch date: 21 hours ago
:::::: commit date: 5 weeks ago
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 346907ceb9d11b9e22677c142b45ff50dd20a66a
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   mm/slab_common.c:161:48: warning: Parameter 'ctor' can be declared as pointer to const [constParameter]
     slab_flags_t flags, const char *name, void (*ctor)(void *))
                                                  ^
>> mm/slab_common.c:446:24: warning: Uninitialized variables: s.object_size, s.size, s.align, s.flags, s.name, s.refcount, s.ctor, s.list [uninitvar]
     debugfs_slab_release(s);
                          ^
   mm/slab_common.c:440:16: note: Assuming condition is false
    if (list_empty(&to_destroy))
                  ^
   mm/slab_common.c:446:24: note: Uninitialized variables: s.object_size, s.size, s.align, s.flags, s.name, s.refcount, s.ctor, s.list
     debugfs_slab_release(s);
                          ^

vim +446 mm/slab_common.c

0495e337b70391 Waiman Long         2022-08-12  421  
657dc2f9722092 Tejun Heo           2017-02-22  422  static void slab_caches_to_rcu_destroy_workfn(struct work_struct *work)
d5b3cf7139b877 Vladimir Davydov    2015-02-10  423  {
657dc2f9722092 Tejun Heo           2017-02-22  424  	LIST_HEAD(to_destroy);
657dc2f9722092 Tejun Heo           2017-02-22  425  	struct kmem_cache *s, *s2;
d5b3cf7139b877 Vladimir Davydov    2015-02-10  426  
657dc2f9722092 Tejun Heo           2017-02-22  427  	/*
5f0d5a3ae7cff0 Paul E. McKenney    2017-01-18  428  	 * On destruction, SLAB_TYPESAFE_BY_RCU kmem_caches are put on the
657dc2f9722092 Tejun Heo           2017-02-22  429  	 * @slab_caches_to_rcu_destroy list.  The slab pages are freed
081a06fa299066 Randy Dunlap        2020-08-11  430  	 * through RCU and the associated kmem_cache are dereferenced
657dc2f9722092 Tejun Heo           2017-02-22  431  	 * while freeing the pages, so the kmem_caches should be freed only
657dc2f9722092 Tejun Heo           2017-02-22  432  	 * after the pending RCU operations are finished.  As rcu_barrier()
657dc2f9722092 Tejun Heo           2017-02-22  433  	 * is a pretty slow operation, we batch all pending destructions
657dc2f9722092 Tejun Heo           2017-02-22  434  	 * asynchronously.
657dc2f9722092 Tejun Heo           2017-02-22  435  	 */
657dc2f9722092 Tejun Heo           2017-02-22  436  	mutex_lock(&slab_mutex);
657dc2f9722092 Tejun Heo           2017-02-22  437  	list_splice_init(&slab_caches_to_rcu_destroy, &to_destroy);
657dc2f9722092 Tejun Heo           2017-02-22  438  	mutex_unlock(&slab_mutex);
d5b3cf7139b877 Vladimir Davydov    2015-02-10  439  
657dc2f9722092 Tejun Heo           2017-02-22  440  	if (list_empty(&to_destroy))
657dc2f9722092 Tejun Heo           2017-02-22  441  		return;
657dc2f9722092 Tejun Heo           2017-02-22  442  
657dc2f9722092 Tejun Heo           2017-02-22  443  	rcu_barrier();
657dc2f9722092 Tejun Heo           2017-02-22  444  
657dc2f9722092 Tejun Heo           2017-02-22  445  	list_for_each_entry_safe(s, s2, &to_destroy, list) {
64dd68497be76a Faiyaz Mohammed     2021-06-28 @446  		debugfs_slab_release(s);
d3fb45f370d927 Alexander Potapenko 2021-02-25  447  		kfence_shutdown_cache(s);
0495e337b70391 Waiman Long         2022-08-12  448  		kmem_cache_release(s);
657dc2f9722092 Tejun Heo           2017-02-22  449  	}
d5b3cf7139b877 Vladimir Davydov    2015-02-10  450  }
d5b3cf7139b877 Vladimir Davydov    2015-02-10  451  

:::::: The code at line 446 was first introduced by commit
:::::: 64dd68497be76ab4e237cca06f5324e220d0f050 mm: slub: move sysfs slab alloc/free interfaces to debugfs

:::::: TO: Faiyaz Mohammed <faiyazm@codeaurora.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
