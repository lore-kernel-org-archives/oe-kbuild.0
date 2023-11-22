Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004D324B31
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Nov 2023 16:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jx1RfbF9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700670530; x=1732206530;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NC35/ZzY2WmgiMtLg6eU4kZnH0ZOyENJRw6FkUB+56Y=;
  b=Jx1RfbF9JVryXl+tMW7UEtKWYnBSUqAbseMr3c5OTlzl+9LbZ669a+Yu
   P8bjWUXVkRAMRZMzexcZb9q6OqY1cg5GGt8XJ9qyanmjpn6s1ey7F/iYZ
   +kWt/KvPur0YK/F0bDZyBke/ZjSTege7vXYNZqUisx5A38CKqjGut3GxF
   ml+6fJVNJD22avurHboRdQ2QB4NMMEjoKhN/cwC3AU8oBPrkgh656sbyn
   ug73cplUoEe1o/6f/Uc+pB5+7HUBsmMpQgX1KPJCNkmEA+3YHgMlPYjDC
   EWXj64yr/VyrjaKrzyCnPEJ2lk3jEE9a6CgzJIVSbZPBIWJ0cqUQC3477
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="371441023"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="371441023"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 08:28:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="14992006"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Nov 2023 08:28:48 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5q5l-0000gN-2M;
	Wed, 22 Nov 2023 16:28:45 +0000
Date: Thu, 23 Nov 2023 00:27:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/android/binder_alloc.c:866: warning: No description found
 for parameter 'lru'
Message-ID: <202311222244.3Znlb164-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "Committer is Greg Kroah-Hartman, remote is linus!"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Sherry Yang <sherryy@android.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c2d5304e6c648ebcf653bace7e51e0e6742e46c8
commit: f2517eb76f1f2f7f89761f9db2b202e89931738c android: binder: Add global lru shrinker to binder
date:   6 years ago
:::::: branch date: 19 hours ago
:::::: commit date: 6 years ago
config: x86_64-randconfig-003-20231122 (https://download.01.org/0day-ci/archive/20231122/202311222244.3Znlb164-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311222244.3Znlb164-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311222244.3Znlb164-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/android/binder_alloc.c:866: warning: No description found for parameter 'lru'


vim +/lru +866 drivers/android/binder_alloc.c

0c972a05cde66e Todd Kjos   2017-06-29  852  
f2517eb76f1f2f Sherry Yang 2017-08-23  853  /**
f2517eb76f1f2f Sherry Yang 2017-08-23  854   * binder_alloc_free_page() - shrinker callback to free pages
f2517eb76f1f2f Sherry Yang 2017-08-23  855   * @item:   item to free
f2517eb76f1f2f Sherry Yang 2017-08-23  856   * @lock:   lock protecting the item
f2517eb76f1f2f Sherry Yang 2017-08-23  857   * @cb_arg: callback argument
f2517eb76f1f2f Sherry Yang 2017-08-23  858   *
f2517eb76f1f2f Sherry Yang 2017-08-23  859   * Called from list_lru_walk() in binder_shrink_scan() to free
f2517eb76f1f2f Sherry Yang 2017-08-23  860   * up pages when the system is under memory pressure.
f2517eb76f1f2f Sherry Yang 2017-08-23  861   */
f2517eb76f1f2f Sherry Yang 2017-08-23  862  enum lru_status binder_alloc_free_page(struct list_head *item,
f2517eb76f1f2f Sherry Yang 2017-08-23  863  				       struct list_lru_one *lru,
f2517eb76f1f2f Sherry Yang 2017-08-23  864  				       spinlock_t *lock,
f2517eb76f1f2f Sherry Yang 2017-08-23  865  				       void *cb_arg)
f2517eb76f1f2f Sherry Yang 2017-08-23 @866  {
f2517eb76f1f2f Sherry Yang 2017-08-23  867  	struct mm_struct *mm = NULL;
f2517eb76f1f2f Sherry Yang 2017-08-23  868  	struct binder_lru_page *page = container_of(item,
f2517eb76f1f2f Sherry Yang 2017-08-23  869  						    struct binder_lru_page,
f2517eb76f1f2f Sherry Yang 2017-08-23  870  						    lru);
f2517eb76f1f2f Sherry Yang 2017-08-23  871  	struct binder_alloc *alloc;
f2517eb76f1f2f Sherry Yang 2017-08-23  872  	uintptr_t page_addr;
f2517eb76f1f2f Sherry Yang 2017-08-23  873  	size_t index;
f2517eb76f1f2f Sherry Yang 2017-08-23  874  
f2517eb76f1f2f Sherry Yang 2017-08-23  875  	alloc = page->alloc;
f2517eb76f1f2f Sherry Yang 2017-08-23  876  	if (!mutex_trylock(&alloc->mutex))
f2517eb76f1f2f Sherry Yang 2017-08-23  877  		goto err_get_alloc_mutex_failed;
f2517eb76f1f2f Sherry Yang 2017-08-23  878  
f2517eb76f1f2f Sherry Yang 2017-08-23  879  	if (!page->page_ptr)
f2517eb76f1f2f Sherry Yang 2017-08-23  880  		goto err_page_already_freed;
f2517eb76f1f2f Sherry Yang 2017-08-23  881  
f2517eb76f1f2f Sherry Yang 2017-08-23  882  	index = page - alloc->pages;
f2517eb76f1f2f Sherry Yang 2017-08-23  883  	page_addr = (uintptr_t)alloc->buffer + index * PAGE_SIZE;
f2517eb76f1f2f Sherry Yang 2017-08-23  884  	if (alloc->vma) {
f2517eb76f1f2f Sherry Yang 2017-08-23  885  		mm = get_task_mm(alloc->tsk);
f2517eb76f1f2f Sherry Yang 2017-08-23  886  		if (!mm)
f2517eb76f1f2f Sherry Yang 2017-08-23  887  			goto err_get_task_mm_failed;
f2517eb76f1f2f Sherry Yang 2017-08-23  888  		if (!down_write_trylock(&mm->mmap_sem))
f2517eb76f1f2f Sherry Yang 2017-08-23  889  			goto err_down_write_mmap_sem_failed;
f2517eb76f1f2f Sherry Yang 2017-08-23  890  
f2517eb76f1f2f Sherry Yang 2017-08-23  891  		zap_page_range(alloc->vma,
f2517eb76f1f2f Sherry Yang 2017-08-23  892  			       page_addr + alloc->user_buffer_offset,
f2517eb76f1f2f Sherry Yang 2017-08-23  893  			       PAGE_SIZE);
f2517eb76f1f2f Sherry Yang 2017-08-23  894  
f2517eb76f1f2f Sherry Yang 2017-08-23  895  		up_write(&mm->mmap_sem);
f2517eb76f1f2f Sherry Yang 2017-08-23  896  		mmput(mm);
f2517eb76f1f2f Sherry Yang 2017-08-23  897  	}
f2517eb76f1f2f Sherry Yang 2017-08-23  898  
f2517eb76f1f2f Sherry Yang 2017-08-23  899  	unmap_kernel_range(page_addr, PAGE_SIZE);
f2517eb76f1f2f Sherry Yang 2017-08-23  900  	__free_page(page->page_ptr);
f2517eb76f1f2f Sherry Yang 2017-08-23  901  	page->page_ptr = NULL;
f2517eb76f1f2f Sherry Yang 2017-08-23  902  
f2517eb76f1f2f Sherry Yang 2017-08-23  903  	list_lru_isolate(lru, item);
f2517eb76f1f2f Sherry Yang 2017-08-23  904  
f2517eb76f1f2f Sherry Yang 2017-08-23  905  	mutex_unlock(&alloc->mutex);
f2517eb76f1f2f Sherry Yang 2017-08-23  906  	return LRU_REMOVED;
f2517eb76f1f2f Sherry Yang 2017-08-23  907  
f2517eb76f1f2f Sherry Yang 2017-08-23  908  err_down_write_mmap_sem_failed:
f2517eb76f1f2f Sherry Yang 2017-08-23  909  	mmput(mm);
f2517eb76f1f2f Sherry Yang 2017-08-23  910  err_get_task_mm_failed:
f2517eb76f1f2f Sherry Yang 2017-08-23  911  err_page_already_freed:
f2517eb76f1f2f Sherry Yang 2017-08-23  912  	mutex_unlock(&alloc->mutex);
f2517eb76f1f2f Sherry Yang 2017-08-23  913  err_get_alloc_mutex_failed:
f2517eb76f1f2f Sherry Yang 2017-08-23  914  	return LRU_SKIP;
f2517eb76f1f2f Sherry Yang 2017-08-23  915  }
f2517eb76f1f2f Sherry Yang 2017-08-23  916  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
