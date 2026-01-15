Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BC623ABBF
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Jan 2026 04:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768452230; cv=none; b=fpkNwpAQ0A1pQEHglOUNq7C+o7uQT5ODNg2dElCnTrcv3Tk5et9vugQ2IrmoVHoulWZj4l63I7I05FhAv6P4aEKM21FYF2HXUt54lo4dMPykhYwuUVO0P5yzQ9PsTSdDQ7SnGoxtv587R/Dtprafik4w8u1uDR+JFnkkFZCsVTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768452230; c=relaxed/simple;
	bh=/AZMT2cCaraN3QZdseYptIRLZkqhGBnLH2zOXcvu7sc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XK3SAS0A9sU2cInibCWjPZNPL6+RvQFcbZXtaDvyYKpZC/DefyhdO2lqZ89DiK29VclGRyxZtmFhz1cZra+TGsfoAdsqosizmgk0Ksuw5KBARAWkf4uRnU9v7J9kkBe/32O6NJL36hd53g1SLrIV7RoyLrhkff87EuThYYN2D+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bYjpCb93; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bYjpCb93"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768452228; x=1799988228;
  h=date:from:to:cc:subject:message-id;
  bh=/AZMT2cCaraN3QZdseYptIRLZkqhGBnLH2zOXcvu7sc=;
  b=bYjpCb93Rz7OHavgFdAsflGvUjQyEjWIGW92nd9YRfF4F0Ofk+dB77Gq
   IKrJKshP34nDVYpUHlwyT4j0dozRRDoSYFB+6o63cs3WPPaPJH0GLGmjL
   DgeBm5yZVo+k5eO1BpGMSl8lAVWDEI/Gyi1EtFFQ3cfefh2mTYZn1E2xo
   pvHGYlkP2tIibwBiQL/POneHFHG2Mjiiv1jFiS8NkpTzXn8BvoOaIn3Sp
   zJRClnyKuQHamKheUB86mJLhGOlnoH+oV46JdwvMcPFkvV0CL6b4DoBf5
   jtUxKGFwqsHAWYjj5oh9iT7wRcJk9oOHGnIna9lXBq2XFQuDqSSbrUyLI
   Q==;
X-CSE-ConnectionGUID: l0fW9NsJQ7yjefN+uCYr/Q==
X-CSE-MsgGUID: qDJGfxxTTMiK+ywKBjk7EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69734325"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="69734325"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 20:43:48 -0800
X-CSE-ConnectionGUID: iWPq/HwTQ0ey0k9g9wtU8A==
X-CSE-MsgGUID: OJ+kUSzgRmmoejKy9d0fEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="204074385"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Jan 2026 20:43:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgFCx-00000000HYE-1Eu3;
	Thu, 15 Jan 2026 04:43:43 +0000
Date: Thu, 15 Jan 2026 12:43:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [vbabka-slab:slab/for-7.0/obj_metadata 10/10] mm/slub.c:2392
 alloc_slab_obj_exts_early() warn: bitwise AND condition is false here
Message-ID: <202601151219.2bA9Q8yQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-mm@kvack.org
TO: Harry Yoo <harry.yoo@oracle.com>
CC: Vlastimil Babka <vbabka@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git slab/for-7.0/obj_metadata
head:   25c88c5c30ebaab5eb8a9de73faf9107a99e5a43
commit: 25c88c5c30ebaab5eb8a9de73faf9107a99e5a43 [10/10] mm/slab: place slabobj_ext metadata in unused space within s->size
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: openrisc-randconfig-r071-20260115 (https://download.01.org/0day-ci/archive/20260115/202601151219.2bA9Q8yQ-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601151219.2bA9Q8yQ-lkp@intel.com/

smatch warnings:
mm/slub.c:2392 alloc_slab_obj_exts_early() warn: bitwise AND condition is false here

vim +2392 mm/slub.c

0bedcc66d2a43a Vlastimil Babka 2023-10-03  2365  
aeb88c8de36886 Harry Yoo       2026-01-13  2366  /*
aeb88c8de36886 Harry Yoo       2026-01-13  2367   * Try to allocate slabobj_ext array from unused space.
aeb88c8de36886 Harry Yoo       2026-01-13  2368   * This function must be called on a freshly allocated slab to prevent
aeb88c8de36886 Harry Yoo       2026-01-13  2369   * concurrency problems.
aeb88c8de36886 Harry Yoo       2026-01-13  2370   */
aeb88c8de36886 Harry Yoo       2026-01-13  2371  static void alloc_slab_obj_exts_early(struct kmem_cache *s, struct slab *slab)
aeb88c8de36886 Harry Yoo       2026-01-13  2372  {
aeb88c8de36886 Harry Yoo       2026-01-13  2373  	void *addr;
aeb88c8de36886 Harry Yoo       2026-01-13  2374  	unsigned long obj_exts;
aeb88c8de36886 Harry Yoo       2026-01-13  2375  
aeb88c8de36886 Harry Yoo       2026-01-13  2376  	if (!need_slab_obj_exts(s))
aeb88c8de36886 Harry Yoo       2026-01-13  2377  		return;
aeb88c8de36886 Harry Yoo       2026-01-13  2378  
aeb88c8de36886 Harry Yoo       2026-01-13  2379  	if (obj_exts_fit_within_slab_leftover(s, slab)) {
aeb88c8de36886 Harry Yoo       2026-01-13  2380  		addr = slab_address(slab) + obj_exts_offset_in_slab(s, slab);
aeb88c8de36886 Harry Yoo       2026-01-13  2381  		addr = kasan_reset_tag(addr);
aeb88c8de36886 Harry Yoo       2026-01-13  2382  		obj_exts = (unsigned long)addr;
aeb88c8de36886 Harry Yoo       2026-01-13  2383  
aeb88c8de36886 Harry Yoo       2026-01-13  2384  		get_slab_obj_exts(obj_exts);
aeb88c8de36886 Harry Yoo       2026-01-13  2385  		memset(addr, 0, obj_exts_size_in_slab(slab));
aeb88c8de36886 Harry Yoo       2026-01-13  2386  		put_slab_obj_exts(obj_exts);
aeb88c8de36886 Harry Yoo       2026-01-13  2387  
aeb88c8de36886 Harry Yoo       2026-01-13  2388  		if (IS_ENABLED(CONFIG_MEMCG))
aeb88c8de36886 Harry Yoo       2026-01-13  2389  			obj_exts |= MEMCG_DATA_OBJEXTS;
aeb88c8de36886 Harry Yoo       2026-01-13  2390  		slab->obj_exts = obj_exts;
aeb88c8de36886 Harry Yoo       2026-01-13  2391  		slab_set_stride(slab, sizeof(struct slabobj_ext));
25c88c5c30ebaa Harry Yoo       2026-01-13 @2392  	} else if (s->flags & SLAB_OBJ_EXT_IN_OBJ) {
25c88c5c30ebaa Harry Yoo       2026-01-13  2393  		unsigned int offset = obj_exts_offset_in_object(s);
25c88c5c30ebaa Harry Yoo       2026-01-13  2394  
25c88c5c30ebaa Harry Yoo       2026-01-13  2395  		obj_exts = (unsigned long)slab_address(slab);
25c88c5c30ebaa Harry Yoo       2026-01-13  2396  		obj_exts += s->red_left_pad;
25c88c5c30ebaa Harry Yoo       2026-01-13  2397  		obj_exts += offset;
25c88c5c30ebaa Harry Yoo       2026-01-13  2398  
25c88c5c30ebaa Harry Yoo       2026-01-13  2399  		get_slab_obj_exts(obj_exts);
25c88c5c30ebaa Harry Yoo       2026-01-13  2400  		for_each_object(addr, s, slab_address(slab), slab->objects)
25c88c5c30ebaa Harry Yoo       2026-01-13  2401  			memset(kasan_reset_tag(addr) + offset, 0,
25c88c5c30ebaa Harry Yoo       2026-01-13  2402  			       sizeof(struct slabobj_ext));
25c88c5c30ebaa Harry Yoo       2026-01-13  2403  		put_slab_obj_exts(obj_exts);
25c88c5c30ebaa Harry Yoo       2026-01-13  2404  
25c88c5c30ebaa Harry Yoo       2026-01-13  2405  		if (IS_ENABLED(CONFIG_MEMCG))
25c88c5c30ebaa Harry Yoo       2026-01-13  2406  			obj_exts |= MEMCG_DATA_OBJEXTS;
25c88c5c30ebaa Harry Yoo       2026-01-13  2407  		slab->obj_exts = obj_exts;
25c88c5c30ebaa Harry Yoo       2026-01-13  2408  		slab_set_stride(slab, s->size);
aeb88c8de36886 Harry Yoo       2026-01-13  2409  	}
aeb88c8de36886 Harry Yoo       2026-01-13  2410  }
aeb88c8de36886 Harry Yoo       2026-01-13  2411  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
