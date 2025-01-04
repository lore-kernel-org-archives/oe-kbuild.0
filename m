Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695CF28377
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Jan 2025 06:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735970828; cv=none; b=FLjCd9XVG10dzFtwasbtxX6XaUb6S3T5+d/juX+RvCxrGN64aQw80Ivd4lTEack8yXX+vXwLhAy5BuEXW+L/KFFyY2oI8W2aZ8pT2lwRUN+d7StvAqp4NgImiVTKVnn1OkcfE5FTeMv3SVceUxq64SqfhTELGCg7pu/pF5p4FTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735970828; c=relaxed/simple;
	bh=I7/3GoKrv/KXtJTUQsVYuhYsl1xWMfrdcVrOHInJ1sM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MEuoJqE1xBjLbUpi18vQLSEpNswax3CMvilxBM967nKDTDF+dS8IO4D+6r2DDOxnOTNrJc/p3kgjhtg3wuXo0L/bXGgQ+vgPUBgxtSb4QQw40m+7EyLtiLYuR9GLfcXB0dewHjq/chuG3xwmuSEn2wuXxa/spliSdsRsjY1pAyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VksALhvA; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VksALhvA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735970826; x=1767506826;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I7/3GoKrv/KXtJTUQsVYuhYsl1xWMfrdcVrOHInJ1sM=;
  b=VksALhvA69SfUtYLBcMFMtqxEwo94dUT1LlCHP9qU0YrKqP27X/Du7Th
   Cabpy1KQ55dhcpHL2RG6rF4qbnPtTKTzOtLCB5sDbIp316OnCUsssfszw
   9L8/reJs61cpO4MeGfx7zhv51rqeBhcxHdrzGZjxGbq3/4/e8DEBri4Ls
   NprHL8pF40/UYmmQMwTHVYjp9h+F8ET6i8kuuvkDJCvi8taSEGV+ItVNZ
   RX3iRJx9dRxTcBCbFBBbubPpbnj+KEE1QjbnG938+HhIhf7qWHIVdbyGE
   L5Ep6Ko19PnbqJM9K5tb+1PiQwy1QN/19uABlw3+EuqnTz47d0/GTaqnX
   A==;
X-CSE-ConnectionGUID: sPP+s1pgSISQ8W6M5QMsVQ==
X-CSE-MsgGUID: RwySq0ilRXuOVHA5ki8j+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="47617988"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="47617988"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 22:07:05 -0800
X-CSE-ConnectionGUID: jNZOL9hGTcGtwbUr+CiWRA==
X-CSE-MsgGUID: q5PL/XtmThCycgVAVGU+Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106997485"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Jan 2025 22:07:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTxJO-000AfX-1Q;
	Sat, 04 Jan 2025 06:07:02 +0000
Date: Sat, 4 Jan 2025 14:06:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 2610/2610] fs/fscache/cookie.c:239
 fscache_hash_cookie() error: uninitialized symbol 'cursor'.
Message-ID: <202501041345.chdxFNo6-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Baokun Li <libaokun1@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   d51fb86ce6a3a3e59d7cba58738b63903b8cb37c
commit: f4b00ea196389e4fc82cda38e0d6cd3ff8947673 [2610/2610] fscache: add a waiting mechanism when duplicate cookies are detected
:::::: branch date: 22 hours ago
:::::: commit date: 10 days ago
config: x86_64-randconfig-161-20241231 (https://download.01.org/0day-ci/archive/20250104/202501041345.chdxFNo6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501041345.chdxFNo6-lkp@intel.com/

New smatch warnings:
fs/fscache/cookie.c:239 fscache_hash_cookie() error: uninitialized symbol 'cursor'.
fs/fscache/cookie.c:532 fscache_alloc_object() warn: argument 2 to %lx specifier is cast from pointer
fs/fscache/cookie.c:588 fscache_attach_object() warn: argument 2 to %lx specifier is cast from pointer

Old smatch warnings:
fs/fscache/cookie.c:532 fscache_alloc_object() warn: argument 3 to %lx specifier is cast from pointer
fs/fscache/cookie.c:588 fscache_attach_object() warn: argument 3 to %lx specifier is cast from pointer

vim +/cursor +239 fs/fscache/cookie.c

f4b00ea196389e4 Zizhi Wo      2024-12-25  200  
ec0328e46d6e5d0 David Howells 2018-04-04  201  /*
ec0328e46d6e5d0 David Howells 2018-04-04  202   * Attempt to insert the new cookie into the hash.  If there's a collision, we
ec0328e46d6e5d0 David Howells 2018-04-04  203   * return the old cookie if it's not in use and an error otherwise.
ec0328e46d6e5d0 David Howells 2018-04-04  204   */
ec0328e46d6e5d0 David Howells 2018-04-04  205  struct fscache_cookie *fscache_hash_cookie(struct fscache_cookie *candidate)
ec0328e46d6e5d0 David Howells 2018-04-04  206  {
ec0328e46d6e5d0 David Howells 2018-04-04  207  	struct fscache_cookie *cursor;
ec0328e46d6e5d0 David Howells 2018-04-04  208  	struct hlist_bl_head *h;
ec0328e46d6e5d0 David Howells 2018-04-04  209  	struct hlist_bl_node *p;
ec0328e46d6e5d0 David Howells 2018-04-04  210  	unsigned int bucket;
ec0328e46d6e5d0 David Howells 2018-04-04  211  
ec0328e46d6e5d0 David Howells 2018-04-04  212  	bucket = candidate->key_hash & (ARRAY_SIZE(fscache_cookie_hash) - 1);
ec0328e46d6e5d0 David Howells 2018-04-04  213  	h = &fscache_cookie_hash[bucket];
ec0328e46d6e5d0 David Howells 2018-04-04  214  
ec0328e46d6e5d0 David Howells 2018-04-04  215  	hlist_bl_lock(h);
ec0328e46d6e5d0 David Howells 2018-04-04  216  	hlist_bl_for_each_entry(cursor, p, h, hash_link) {
f4b00ea196389e4 Zizhi Wo      2024-12-25  217  		if (fscache_compare_cookie(candidate, cursor) == 0) {
f4b00ea196389e4 Zizhi Wo      2024-12-25  218  			if (!test_bit(FSCACHE_COOKIE_RELINQUISHED, &cursor->flags))
ec0328e46d6e5d0 David Howells 2018-04-04  219  				goto collision;
f4b00ea196389e4 Zizhi Wo      2024-12-25  220  			cursor->collision = candidate;
f4b00ea196389e4 Zizhi Wo      2024-12-25  221  			set_bit(FSCACHE_COOKIE_ACQUIRE_PENDING, &candidate->flags);
f4b00ea196389e4 Zizhi Wo      2024-12-25  222  			break;
f4b00ea196389e4 Zizhi Wo      2024-12-25  223  		}
ec0328e46d6e5d0 David Howells 2018-04-04  224  	}
ec0328e46d6e5d0 David Howells 2018-04-04  225  
ec0328e46d6e5d0 David Howells 2018-04-04  226  	__set_bit(FSCACHE_COOKIE_ACQUIRED, &candidate->flags);
ec0328e46d6e5d0 David Howells 2018-04-04  227  	fscache_cookie_get(candidate->parent, fscache_cookie_get_acquire_parent);
ec0328e46d6e5d0 David Howells 2018-04-04  228  	atomic_inc(&candidate->parent->n_children);
ec0328e46d6e5d0 David Howells 2018-04-04  229  	hlist_bl_add_head(&candidate->hash_link, h);
ec0328e46d6e5d0 David Howells 2018-04-04  230  	hlist_bl_unlock(h);
f4b00ea196389e4 Zizhi Wo      2024-12-25  231  
f4b00ea196389e4 Zizhi Wo      2024-12-25  232  	if (fscache_is_acquire_pending(candidate) &&
f4b00ea196389e4 Zizhi Wo      2024-12-25  233  	    fscache_wait_on_cookie_collision(candidate)) {
f4b00ea196389e4 Zizhi Wo      2024-12-25  234  		fscache_cookie_put(candidate->parent, fscache_cookie_put_acquire_nobufs);
f4b00ea196389e4 Zizhi Wo      2024-12-25  235  		atomic_dec(&candidate->parent->n_children);
f4b00ea196389e4 Zizhi Wo      2024-12-25  236  		hlist_bl_lock(h);
f4b00ea196389e4 Zizhi Wo      2024-12-25  237  		hlist_bl_del(&candidate->hash_link);
f4b00ea196389e4 Zizhi Wo      2024-12-25  238  		if (fscache_is_acquire_pending(candidate))
f4b00ea196389e4 Zizhi Wo      2024-12-25 @239  			cursor->collision = NULL;
f4b00ea196389e4 Zizhi Wo      2024-12-25  240  		hlist_bl_unlock(h);
f4b00ea196389e4 Zizhi Wo      2024-12-25  241  		pr_err("Wait duplicate cookie unhashed interrupted\n");
f4b00ea196389e4 Zizhi Wo      2024-12-25  242  		return NULL;
f4b00ea196389e4 Zizhi Wo      2024-12-25  243  	}
ec0328e46d6e5d0 David Howells 2018-04-04  244  	return candidate;
ec0328e46d6e5d0 David Howells 2018-04-04  245  
ec0328e46d6e5d0 David Howells 2018-04-04  246  collision:
ec0328e46d6e5d0 David Howells 2018-04-04  247  	if (test_and_set_bit(FSCACHE_COOKIE_ACQUIRED, &cursor->flags)) {
ec0328e46d6e5d0 David Howells 2018-04-04  248  		trace_fscache_cookie(cursor, fscache_cookie_collision,
ec0328e46d6e5d0 David Howells 2018-04-04  249  				     atomic_read(&cursor->usage));
ec0328e46d6e5d0 David Howells 2018-04-04  250  		fscache_print_cookie(cursor, 'O');
ec0328e46d6e5d0 David Howells 2018-04-04  251  		fscache_print_cookie(candidate, 'N');
ec0328e46d6e5d0 David Howells 2018-04-04  252  		hlist_bl_unlock(h);
f4b00ea196389e4 Zizhi Wo      2024-12-25  253  		pr_err("Duplicate cookie detected\n");
ec0328e46d6e5d0 David Howells 2018-04-04  254  		return NULL;
ec0328e46d6e5d0 David Howells 2018-04-04  255  	}
ec0328e46d6e5d0 David Howells 2018-04-04  256  
ec0328e46d6e5d0 David Howells 2018-04-04  257  	fscache_cookie_get(cursor, fscache_cookie_get_reacquire);
ec0328e46d6e5d0 David Howells 2018-04-04  258  	hlist_bl_unlock(h);
ec0328e46d6e5d0 David Howells 2018-04-04  259  	return cursor;
ec0328e46d6e5d0 David Howells 2018-04-04  260  }
ec0328e46d6e5d0 David Howells 2018-04-04  261  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
