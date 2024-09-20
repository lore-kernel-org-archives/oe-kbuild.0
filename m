Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA4C17BEC6
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Sep 2024 14:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726843019; cv=none; b=YtLw3oVtQsk2jfJScKptvkc763wtL6qxDHGBj0h0LxITlg9tIuyH05fZ8jTEcURHdixcD/vLorKCvN2Gy8djz3jxLju6BwlRpVdZImImjRG84NLT/dLXm5yxaCikmVCe3TRFU7OuCfnrZynxNoEjecrivB/W70362C0tmEg7Qz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726843019; c=relaxed/simple;
	bh=KusVhwBM3RB5lfVGXYFoPtWxa003DdXfCJig8aTm/zs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LAi716qI0o5eu+K/hHMwekODj9UuVh2gHWhvVkyUbFqfGgg+vYHvx0LUSHkebXUBsBRdB3Wmp3RXZc/J5Rkns2FrujcC4UjKVZ4sIU90ykwRuYiuMyNE5fuUqmYb9lKom7JjWPZwHvN1EMKM7uuJKW/7NPyCfgHZaZEB6KhvBwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J9Z3VDxu; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J9Z3VDxu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726843017; x=1758379017;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KusVhwBM3RB5lfVGXYFoPtWxa003DdXfCJig8aTm/zs=;
  b=J9Z3VDxu74Tf30ArMPCcRLenioeHxWOFBeN2oisozrwyA7fSgpBJdp3d
   geQ9TeprVLpcqFpyLbKBx555atSgkJ0HYadpkBrZB0RR/ylZwipV0pLJ7
   XvKBWw0bm+8hXc9O03UoJR+xUp2J+oWyGcoy+VFL4GEngKQBYn2EeKWJV
   E3y+vQVwTdmKiCcBcYk6MUmhG0y6TVz2gokfp0VzYgTxqUVEFfO75l7S0
   +bnpkPiUPQTD8c9kkIX4nV8WNDJ3POxApUaaA2d6V4Ekm1BaVndOa6yEG
   EdAnX5n2+jkkKGq8ygbelCIiwnpeg1VzISz3mNw/EqxSTYclzPlQB9wQS
   w==;
X-CSE-ConnectionGUID: eY0XjGxASK+PYOoUX+UYBQ==
X-CSE-MsgGUID: KViy43R8SSyGphmGVPOK4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="36983069"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="36983069"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 07:36:57 -0700
X-CSE-ConnectionGUID: yFxni0egQFerjloalNuyXg==
X-CSE-MsgGUID: MEwCR/NaQCKaaFvIVxviMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="75098194"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Sep 2024 07:36:55 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sreke-000EXa-2X;
	Fri, 20 Sep 2024 14:36:52 +0000
Date: Fri, 20 Sep 2024 22:35:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 12475/12481] mm/kasan/kasan_test_c.c:1029
 kmem_cache_rcu_uaf() error: dereferencing freed memory 'p'
Message-ID: <202409202246.Mx6iahIH-lkp@intel.com>
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
TO: Miguel Ojeda <ojeda@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   62f92d634458a1e308bb699986b9147a6d670457
commit: 7379c3bb3b8e758116d4f0abe54eb7d5631c699e [12475/12481] Merge branch 'rust-next' of https://github.com/Rust-for-Linux/linux.git
:::::: branch date: 10 hours ago
:::::: commit date: 11 hours ago
config: x86_64-randconfig-161-20240920 (https://download.01.org/0day-ci/archive/20240920/202409202246.Mx6iahIH-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409202246.Mx6iahIH-lkp@intel.com/

smatch warnings:
mm/kasan/kasan_test_c.c:1029 kmem_cache_rcu_uaf() error: dereferencing freed memory 'p'

vim +/p +1029 mm/kasan/kasan_test_c.c

86b15969831bde mm/kasan/kasan_test.c Andrey Konovalov 2023-12-19   998  
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09   999  static void kmem_cache_rcu_uaf(struct kunit *test)
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1000  {
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1001  	char *p;
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1002  	size_t size = 200;
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1003  	struct kmem_cache *cache;
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1004  
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1005  	KASAN_TEST_NEEDS_CONFIG_ON(test, CONFIG_SLUB_RCU_DEBUG);
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1006  
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1007  	cache = kmem_cache_create("test_cache", size, 0, SLAB_TYPESAFE_BY_RCU,
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1008  				  NULL);
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1009  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cache);
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1010  
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1011  	p = kmem_cache_alloc(cache, GFP_KERNEL);
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1012  	if (!p) {
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1013  		kunit_err(test, "Allocation failed: %s\n", __func__);
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1014  		kmem_cache_destroy(cache);
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1015  		return;
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1016  	}
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1017  	*p = 1;
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1018  
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1019  	rcu_read_lock();
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1020  
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1021  	/* Free the object - this will internally schedule an RCU callback. */
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1022  	kmem_cache_free(cache, p);
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1023  
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1024  	/*
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1025  	 * We should still be allowed to access the object at this point because
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1026  	 * the cache is SLAB_TYPESAFE_BY_RCU and we've been in an RCU read-side
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1027  	 * critical section since before the kmem_cache_free().
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1028  	 */
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09 @1029  	READ_ONCE(*p);
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1030  
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1031  	rcu_read_unlock();
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1032  
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1033  	/*
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1034  	 * Wait for the RCU callback to execute; after this, the object should
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1035  	 * have actually been freed from KASAN's perspective.
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1036  	 */
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1037  	rcu_barrier();
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1038  
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1039  	KUNIT_EXPECT_KASAN_FAIL(test, READ_ONCE(*p));
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1040  
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1041  	kmem_cache_destroy(cache);
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1042  }
b8c8ba73c68bb3 mm/kasan/kasan_test.c Jann Horn        2024-08-09  1043  

:::::: The code at line 1029 was first introduced by commit
:::::: b8c8ba73c68bb3c3e9dad22f488b86c540c839f9 slub: Introduce CONFIG_SLUB_RCU_DEBUG

:::::: TO: Jann Horn <jannh@google.com>
:::::: CC: Vlastimil Babka <vbabka@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
