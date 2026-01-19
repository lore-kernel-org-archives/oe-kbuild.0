Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0483938BF9A
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 18:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768848728; cv=none; b=Ij8PL0aM6lB84YAtWnLcvWYqCxkYbCdGe07upuTKpTAgBYZoFXXD4YHjr+Xm1YDbnDmdx5GPfWsj7pFGeSB2Ii7DE9iZ3PU9xco7qh0w+a81lL/usJPRTQ3epvn9zyaqDpqi1iBdLcYeypkuZMoUXgype2+fAiJwl6PTJr0VIPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768848728; c=relaxed/simple;
	bh=VtlK8z2dgWXPOzjnUa0xK9s3WHtsZoKmtbhZZ0KCnHg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AuO+lOl+46bBlII9J+VFjR9Il5xjdn3ngN0OKKr9UtM2Kgk9qmfuhBEStNfMlKJD74ezY6rnsnCOR5SAMTpPAQJTVaWi8ZxWgG1woOeZ6qIbwlGS4SfS+LapxSH5Ini5/feJ+/0eHLQbhnSMvOqZFDZ4GV/BUQGZyx37h7V7KOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DIDfWY/o; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DIDfWY/o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768848727; x=1800384727;
  h=date:from:to:cc:subject:message-id;
  bh=VtlK8z2dgWXPOzjnUa0xK9s3WHtsZoKmtbhZZ0KCnHg=;
  b=DIDfWY/ozJ4VwaJimWVnvoWV+QapDBmHqYpuyYTWnunAIar2Q1SHpvbg
   bKKZ8WYJxXT24bgYX/ovtCNfPAelP5DzW+aiGzdLBe42vHtqXq6tikNGL
   9m6AO9cygo5TcI7dAiQODOE3XsAtsrQ/XoW17bHD5nqm91haQ4hZTqgOO
   wN8tXNJbbE4uWh2Dt4uVHaeZWfbihZGFt1NTvj5f7oArRDAaUOC99oPd4
   gu07uJW/GkvTthluT6BF3UBS3x+++UYIbxpQtrJetxEnYxCvVKsWlD0Ve
   wtlMUO23sSn4CtGb74MVNbwVNWIO40bIcFo4omn85MMqA/d9+KM8OAw3t
   g==;
X-CSE-ConnectionGUID: 21LtSlTZSY20LfiKRGoLcA==
X-CSE-MsgGUID: URxRgtrOSoiSbBHvVYvrqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70035924"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="70035924"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 10:52:06 -0800
X-CSE-ConnectionGUID: WPwseNlSRKyf4wDDoCj48Q==
X-CSE-MsgGUID: qxAWUGpeSk2cW5mFcCVEZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="237197460"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Jan 2026 10:52:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhuM7-00000000OBr-1QrE;
	Mon, 19 Jan 2026 18:52:03 +0000
Date: Tue, 20 Jan 2026 02:51:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [vbabka-slab:slab/for-7.0/obj_metadata 8/10] mm/slub.c:904
 need_slab_obj_exts() warn: bitwise AND condition is false here
Message-ID: <202601200218.2dRYmU4Q-lkp@intel.com>
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
head:   6edcc2867ee1ba95ae6c7695d66124bfdf0771a1
commit: 4fad56bdb6b4c4bc0ea2d919df1ae4eef7b69919 [8/10] mm/slab: save memory by allocating slabobj_ext array from leftover
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: nios2-randconfig-r072-20260119 (https://download.01.org/0day-ci/archive/20260120/202601200218.2dRYmU4Q-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601200218.2dRYmU4Q-lkp@intel.com/

New smatch warnings:
mm/slub.c:904 need_slab_obj_exts() warn: bitwise AND condition is false here

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.

vim +904 mm/slub.c

4fad56bdb6b4c4b Harry Yoo 2026-01-13  890  
4fad56bdb6b4c4b Harry Yoo 2026-01-13  891  /*
4fad56bdb6b4c4b Harry Yoo 2026-01-13  892   * Check if memory cgroup or memory allocation profiling is enabled.
4fad56bdb6b4c4b Harry Yoo 2026-01-13  893   * If enabled, SLUB tries to reduce memory overhead of accounting
4fad56bdb6b4c4b Harry Yoo 2026-01-13  894   * slab objects. If neither is enabled when this function is called,
4fad56bdb6b4c4b Harry Yoo 2026-01-13  895   * the optimization is simply skipped to avoid affecting caches that do not
4fad56bdb6b4c4b Harry Yoo 2026-01-13  896   * need slabobj_ext metadata.
4fad56bdb6b4c4b Harry Yoo 2026-01-13  897   *
4fad56bdb6b4c4b Harry Yoo 2026-01-13  898   * However, this may disable optimization when memory cgroup or memory
4fad56bdb6b4c4b Harry Yoo 2026-01-13  899   * allocation profiling is used, but slabs are created too early
4fad56bdb6b4c4b Harry Yoo 2026-01-13  900   * even before those subsystems are initialized.
4fad56bdb6b4c4b Harry Yoo 2026-01-13  901   */
4fad56bdb6b4c4b Harry Yoo 2026-01-13  902  static inline bool need_slab_obj_exts(struct kmem_cache *s)
4fad56bdb6b4c4b Harry Yoo 2026-01-13  903  {
4fad56bdb6b4c4b Harry Yoo 2026-01-13 @904  	if (memcg_kmem_online() && (s->flags & SLAB_ACCOUNT))
4fad56bdb6b4c4b Harry Yoo 2026-01-13  905  		return true;
4fad56bdb6b4c4b Harry Yoo 2026-01-13  906  
4fad56bdb6b4c4b Harry Yoo 2026-01-13  907  	if (mem_alloc_profiling_enabled())
4fad56bdb6b4c4b Harry Yoo 2026-01-13  908  		return true;
4fad56bdb6b4c4b Harry Yoo 2026-01-13  909  
4fad56bdb6b4c4b Harry Yoo 2026-01-13  910  	return false;
4fad56bdb6b4c4b Harry Yoo 2026-01-13  911  }
4fad56bdb6b4c4b Harry Yoo 2026-01-13  912  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
