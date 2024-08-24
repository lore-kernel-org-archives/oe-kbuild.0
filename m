Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0F114D702
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Aug 2024 10:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724494205; cv=none; b=Xze+z0LehKMVJLh3GXfifpCuW5ILAV68kGqZdWYlkd6mxEI0hsXyVLSnt90rI3aGmT6b4Yx9vy6AiAUIXxXUCF/TqNzTd4Xjf0EnMEuEZADC1BKrX4jp2ghg2vqjm5wMtZ0cY88ta/6xOM3xFn3pFZAvlwl2lBHx4tatDaS1drw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724494205; c=relaxed/simple;
	bh=T252jDUn0FEiOkt42So2R38BKfJzLeefq7YWKnobBc8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bfM+TGIipVI4EMSP3O1/KikKbbuNB0t9LjVGX+crt7ngm73lgX2ie1OF3pI+kdooOROicN34cCVa94WU7VhAmecEjkUdGA3D6ozGdbkkwj5ED1fDl8QE3m916Njj13BMg7icb1dg4zkr/PvZtPrI0TtMKOHEm0S/qmjIHIEFDpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RHzUeWR/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RHzUeWR/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724494204; x=1756030204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T252jDUn0FEiOkt42So2R38BKfJzLeefq7YWKnobBc8=;
  b=RHzUeWR/UBgdvb+89BjXbyCl5MCk8KQi+zTK/m6HfoxgHNFAgWC5qZnS
   7Sig4Es+euAF5s3xmaOCC9AMeFDyP2awDEu1dWDJyfetw2Rxywp02R8q0
   M+9IkMwesmjUlNHyQb6J7ZFCdQN/sBIWiZj6BFgMqNQxFN7/Dk0eC4QiZ
   29dyDPIbD4L/aHMokKinsbD/tyM1e9ItkX2I2gbWOH9V5mGYuuQCcF58x
   poTB2NJ5EXcLW8BwjMuytDp35PX4ShNKrwHWKZ5i4iCXnwC4Sgi5srh2w
   bd+8eRTmf4f05cp6SvHHYfRyn+y+fzRkFmfsZqNmQ2OgCt82es7HgnPmH
   Q==;
X-CSE-ConnectionGUID: I8FNJhGoTmm85S/7Pb/siw==
X-CSE-MsgGUID: LDXZIbvjR2yK72F9N3ACdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="26768114"
X-IronPort-AV: E=Sophos;i="6.10,173,1719903600"; 
   d="scan'208";a="26768114"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2024 03:10:01 -0700
X-CSE-ConnectionGUID: IeYeO/7/TQKdu3zem2zgNQ==
X-CSE-MsgGUID: rqlRXujsTKOKYsLHk4fw1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,173,1719903600"; 
   d="scan'208";a="61893984"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Aug 2024 03:10:00 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shniX-000EP3-1s;
	Sat, 24 Aug 2024 10:09:57 +0000
Date: Sat, 24 Aug 2024 18:08:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 5/5] debugobjects: use list_bl to save memory for hash
 slot spinlocks
Message-ID: <202408241717.jMYJtsy0-lkp@intel.com>
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
In-Reply-To: <20240821230539.168107-6-woodyzhang666@gmail.com>
References: <20240821230539.168107-6-woodyzhang666@gmail.com>
TO: Woody Zhang <woodyzhang666@gmail.com>
TO: Thomas Gleixner <tglx@linutronix.de>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: linux-kernel@vger.kernel.org
CC: Woody Zhang <woodyzhang666@gmail.com>

Hi Woody,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/core/debugobjects]
[also build test WARNING on akpm-mm/mm-everything linus/master v6.11-rc4 next-20240823]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Woody-Zhang/bit_spinlock-add-irq-variant-for-bit-spinlock-API/20240822-070808
base:   tip/core/debugobjects
patch link:    https://lore.kernel.org/r/20240821230539.168107-6-woodyzhang666%40gmail.com
patch subject: [PATCH 5/5] debugobjects: use list_bl to save memory for hash slot spinlocks
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arc-randconfig-r073-20240824 (https://download.01.org/0day-ci/archive/20240824/202408241717.jMYJtsy0-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408241717.jMYJtsy0-lkp@intel.com/

New smatch warnings:
lib/debugobjects.c:326 free_obj_work() warn: inconsistent returns 'flags'.

Old smatch warnings:
arch/arc/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.

vim +/flags +326 lib/debugobjects.c

3ac7fe5a4aab40 Thomas Gleixner 2008-04-30  275  
3ac7fe5a4aab40 Thomas Gleixner 2008-04-30  276  /*
337fff8b5ed057 Thomas Gleixner 2009-03-16  277   * workqueue function to free objects.
858274b6a13b4d Waiman Long     2017-01-05  278   *
858274b6a13b4d Waiman Long     2017-01-05  279   * To reduce contention on the global pool_lock, the actual freeing of
636e1970fd7dea Yang Shi        2018-02-06  280   * debug objects will be delayed if the pool_lock is busy.
337fff8b5ed057 Thomas Gleixner 2009-03-16  281   */
337fff8b5ed057 Thomas Gleixner 2009-03-16  282  static void free_obj_work(struct work_struct *work)
337fff8b5ed057 Thomas Gleixner 2009-03-16  283  {
5b4850f76f3728 Woody Zhang     2024-08-22  284  	struct hlist_bl_node *tmp, *n;
36c4ead6f6dfbb Yang Shi        2018-02-06  285  	struct debug_obj *obj;
337fff8b5ed057 Thomas Gleixner 2009-03-16  286  	unsigned long flags;
5b4850f76f3728 Woody Zhang     2024-08-22  287  	HLIST_BL_HEAD(tofree);
337fff8b5ed057 Thomas Gleixner 2009-03-16  288  
a7344a68a79ab9 Waiman Long     2019-05-20  289  	WRITE_ONCE(obj_freeing, false);
5b4850f76f3728 Woody Zhang     2024-08-22  290  	if (!hlist_bl_trylock_irqsave(&obj_pool, flags))
858274b6a13b4d Waiman Long     2017-01-05  291  		return;
36c4ead6f6dfbb Yang Shi        2018-02-06  292  
a7344a68a79ab9 Waiman Long     2019-05-20  293  	if (obj_pool_free >= debug_objects_pool_size)
a7344a68a79ab9 Waiman Long     2019-05-20  294  		goto free_objs;
a7344a68a79ab9 Waiman Long     2019-05-20  295  
36c4ead6f6dfbb Yang Shi        2018-02-06  296  	/*
36c4ead6f6dfbb Yang Shi        2018-02-06  297  	 * The objs on the pool list might be allocated before the work is
36c4ead6f6dfbb Yang Shi        2018-02-06  298  	 * run, so recheck if pool list it full or not, if not fill pool
a7344a68a79ab9 Waiman Long     2019-05-20  299  	 * list from the global free list. As it is likely that a workload
a7344a68a79ab9 Waiman Long     2019-05-20  300  	 * may be gearing up to use more and more objects, don't free any
a7344a68a79ab9 Waiman Long     2019-05-20  301  	 * of them until the next round.
36c4ead6f6dfbb Yang Shi        2018-02-06  302  	 */
36c4ead6f6dfbb Yang Shi        2018-02-06  303  	while (obj_nr_tofree && obj_pool_free < debug_objects_pool_size) {
5b4850f76f3728 Woody Zhang     2024-08-22  304  		obj = hlist_bl_entry(hlist_bl_first(&obj_to_free), typeof(*obj), node);
5b4850f76f3728 Woody Zhang     2024-08-22  305  		hlist_bl_del(&obj->node);
5b4850f76f3728 Woody Zhang     2024-08-22  306  		hlist_bl_add_head(&obj->node, &obj_pool);
35fd7a637c42bb Marco Elver     2020-01-16  307  		WRITE_ONCE(obj_pool_free, obj_pool_free + 1);
35fd7a637c42bb Marco Elver     2020-01-16  308  		WRITE_ONCE(obj_nr_tofree, obj_nr_tofree - 1);
36c4ead6f6dfbb Yang Shi        2018-02-06  309  	}
5b4850f76f3728 Woody Zhang     2024-08-22  310  	hlist_bl_unlock_irqrestore(&obj_pool, flags);
a7344a68a79ab9 Waiman Long     2019-05-20  311  	return;
36c4ead6f6dfbb Yang Shi        2018-02-06  312  
a7344a68a79ab9 Waiman Long     2019-05-20  313  free_objs:
36c4ead6f6dfbb Yang Shi        2018-02-06  314  	/*
36c4ead6f6dfbb Yang Shi        2018-02-06  315  	 * Pool list is already full and there are still objs on the free
36c4ead6f6dfbb Yang Shi        2018-02-06  316  	 * list. Move remaining free objs to a temporary list to free the
36c4ead6f6dfbb Yang Shi        2018-02-06  317  	 * memory outside the pool_lock held region.
36c4ead6f6dfbb Yang Shi        2018-02-06  318  	 */
36c4ead6f6dfbb Yang Shi        2018-02-06  319  	if (obj_nr_tofree) {
5b4850f76f3728 Woody Zhang     2024-08-22  320  		hlist_bl_move_list(&obj_to_free, &tofree);
04148187aa9df3 Arnd Bergmann   2018-02-22  321  		debug_objects_freed += obj_nr_tofree;
35fd7a637c42bb Marco Elver     2020-01-16  322  		WRITE_ONCE(obj_nr_tofree, 0);
36c4ead6f6dfbb Yang Shi        2018-02-06  323  	}
5b4850f76f3728 Woody Zhang     2024-08-22  324  	hlist_bl_unlock_irqrestore(&obj_pool, flags);
36c4ead6f6dfbb Yang Shi        2018-02-06  325  
5b4850f76f3728 Woody Zhang     2024-08-22 @326  	hlist_bl_for_each_entry_safe(obj, tmp, n, &tofree, node) {
5b4850f76f3728 Woody Zhang     2024-08-22  327  		hlist_bl_del(&obj->node);
36c4ead6f6dfbb Yang Shi        2018-02-06  328  		kmem_cache_free(obj_cache, obj);
36c4ead6f6dfbb Yang Shi        2018-02-06  329  	}
337fff8b5ed057 Thomas Gleixner 2009-03-16  330  }
337fff8b5ed057 Thomas Gleixner 2009-03-16  331  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
