Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B731AAC9
	for <oe-kbuild@lists.linux.dev>; Tue, 31 Dec 2024 14:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735656255; cv=none; b=kEDPbEuR2pJC2zaM9nZQeNKT/WH85dQQen7PdwAAkfg01cXjOqTdhhldG5rQWQ4ZPsNB5JHg1OmvNb2PLXv1XVga4fZE1KBghD7SPKGwvIVVY9G1GvhCFHv0KgOhObKWMH/3QNC1SjK7ZhzaujUuOV9gUhzat8qK7xpIPfy2Bag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735656255; c=relaxed/simple;
	bh=sLZkOVLWLFBtDpQe/oNQDl0IroIGlwEgpd32QwuC0Ls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pmtXAA8SBL+XFRCB6CdeFwTl0gQPfCp69bCRTnIqfmRKEK54BXKT3troMPDAU6l6ovfvxivDqAdnrrrym1vBjHIXCHjwL3SnsGVYyyE0EnZ6Nztglx/kP3sRpHlprz5esfgASKaxdoxdtJzjVFr9x9kM2BHqbyFZyuI3+D58c14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J8M3liba; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J8M3liba"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735656253; x=1767192253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sLZkOVLWLFBtDpQe/oNQDl0IroIGlwEgpd32QwuC0Ls=;
  b=J8M3libaPB/djil/XbkNIg/GOu26+gYxtckmZoJqsVkRnd7CbrUQQIjh
   tjc8CsDtvY+5AoGXilz4NvDpW1DvoMkN58x8tj19UWqn8b4FcWTFv8ptk
   HZr5b8uredGPhDh4AMR9J+tRXPUqtFDAnq+fun4fdtxqlCZGrWmSRchWA
   oqMRQvwC/oD7b3/InSTjD9NprqvPP0/JSsZKKcRMqXtCyTAgX+5RD8jyh
   QJolfbmjNnntlQNbckrK19RGwsf9azw/F5hSM57WSWWumkW/E3QpIqbrv
   1ZwmL39UYiUlFflI7uIPJnBhXU4HYthevDAiYJKtGeqAL4InH/q+56Nzp
   w==;
X-CSE-ConnectionGUID: 5BQoTmDnQjy6fBkVt/F9Dw==
X-CSE-MsgGUID: Gi+P/4I2RmSlcJBgAjPWug==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="46613382"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; 
   d="scan'208";a="46613382"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 06:44:11 -0800
X-CSE-ConnectionGUID: VnPGKdV4QvixBpn+X0uZNg==
X-CSE-MsgGUID: nnFBbB5NQ1WeflCAk3RP8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; 
   d="scan'208";a="100923883"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Dec 2024 06:44:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSdTb-0007Bb-0m;
	Tue, 31 Dec 2024 14:44:07 +0000
Date: Tue, 31 Dec 2024 22:43:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 2610/2610] fs/fscache/cookie.c:239
 fscache_hash_cookie() error: uninitialized symbol 'cursor'.
Message-ID: <202412312254.AFHU6TIA-lkp@intel.com>
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
head:   55bf638d3d29c53ddd64ed89efda8b70b47ccbbc
commit: f4b00ea196389e4fc82cda38e0d6cd3ff8947673 [2610/2610] fscache: add a waiting mechanism when duplicate cookies are detected
:::::: branch date: 6 hours ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-161-20241231 (https://download.01.org/0day-ci/archive/20241231/202412312254.AFHU6TIA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412312254.AFHU6TIA-lkp@intel.com/

New smatch warnings:
fs/fscache/cookie.c:239 fscache_hash_cookie() error: uninitialized symbol 'cursor'.
fs/fscache/cookie.c:532 fscache_alloc_object() warn: argument 2 to %lx specifier is cast from pointer
fs/fscache/cookie.c:588 fscache_attach_object() warn: argument 2 to %lx specifier is cast from pointer

Old smatch warnings:
fs/fscache/cookie.c:532 fscache_alloc_object() warn: argument 3 to %lx specifier is cast from pointer
fs/fscache/cookie.c:588 fscache_attach_object() warn: argument 3 to %lx specifier is cast from pointer

vim +/cursor +239 fs/fscache/cookie.c

f4b00ea196389e Zizhi Wo      2024-12-25  200  
ec0328e46d6e5d David Howells 2018-04-04  201  /*
ec0328e46d6e5d David Howells 2018-04-04  202   * Attempt to insert the new cookie into the hash.  If there's a collision, we
ec0328e46d6e5d David Howells 2018-04-04  203   * return the old cookie if it's not in use and an error otherwise.
ec0328e46d6e5d David Howells 2018-04-04  204   */
ec0328e46d6e5d David Howells 2018-04-04  205  struct fscache_cookie *fscache_hash_cookie(struct fscache_cookie *candidate)
ec0328e46d6e5d David Howells 2018-04-04  206  {
ec0328e46d6e5d David Howells 2018-04-04  207  	struct fscache_cookie *cursor;
ec0328e46d6e5d David Howells 2018-04-04  208  	struct hlist_bl_head *h;
ec0328e46d6e5d David Howells 2018-04-04  209  	struct hlist_bl_node *p;
ec0328e46d6e5d David Howells 2018-04-04  210  	unsigned int bucket;
ec0328e46d6e5d David Howells 2018-04-04  211  
ec0328e46d6e5d David Howells 2018-04-04  212  	bucket = candidate->key_hash & (ARRAY_SIZE(fscache_cookie_hash) - 1);
ec0328e46d6e5d David Howells 2018-04-04  213  	h = &fscache_cookie_hash[bucket];
ec0328e46d6e5d David Howells 2018-04-04  214  
ec0328e46d6e5d David Howells 2018-04-04  215  	hlist_bl_lock(h);
ec0328e46d6e5d David Howells 2018-04-04  216  	hlist_bl_for_each_entry(cursor, p, h, hash_link) {
f4b00ea196389e Zizhi Wo      2024-12-25  217  		if (fscache_compare_cookie(candidate, cursor) == 0) {
f4b00ea196389e Zizhi Wo      2024-12-25  218  			if (!test_bit(FSCACHE_COOKIE_RELINQUISHED, &cursor->flags))
ec0328e46d6e5d David Howells 2018-04-04  219  				goto collision;
f4b00ea196389e Zizhi Wo      2024-12-25  220  			cursor->collision = candidate;
f4b00ea196389e Zizhi Wo      2024-12-25  221  			set_bit(FSCACHE_COOKIE_ACQUIRE_PENDING, &candidate->flags);
f4b00ea196389e Zizhi Wo      2024-12-25  222  			break;
f4b00ea196389e Zizhi Wo      2024-12-25  223  		}
ec0328e46d6e5d David Howells 2018-04-04  224  	}
ec0328e46d6e5d David Howells 2018-04-04  225  
ec0328e46d6e5d David Howells 2018-04-04  226  	__set_bit(FSCACHE_COOKIE_ACQUIRED, &candidate->flags);
ec0328e46d6e5d David Howells 2018-04-04  227  	fscache_cookie_get(candidate->parent, fscache_cookie_get_acquire_parent);
ec0328e46d6e5d David Howells 2018-04-04  228  	atomic_inc(&candidate->parent->n_children);
ec0328e46d6e5d David Howells 2018-04-04  229  	hlist_bl_add_head(&candidate->hash_link, h);
ec0328e46d6e5d David Howells 2018-04-04  230  	hlist_bl_unlock(h);
f4b00ea196389e Zizhi Wo      2024-12-25  231  
f4b00ea196389e Zizhi Wo      2024-12-25  232  	if (fscache_is_acquire_pending(candidate) &&
f4b00ea196389e Zizhi Wo      2024-12-25  233  	    fscache_wait_on_cookie_collision(candidate)) {
f4b00ea196389e Zizhi Wo      2024-12-25  234  		fscache_cookie_put(candidate->parent, fscache_cookie_put_acquire_nobufs);
f4b00ea196389e Zizhi Wo      2024-12-25  235  		atomic_dec(&candidate->parent->n_children);
f4b00ea196389e Zizhi Wo      2024-12-25  236  		hlist_bl_lock(h);
f4b00ea196389e Zizhi Wo      2024-12-25  237  		hlist_bl_del(&candidate->hash_link);
f4b00ea196389e Zizhi Wo      2024-12-25  238  		if (fscache_is_acquire_pending(candidate))
f4b00ea196389e Zizhi Wo      2024-12-25 @239  			cursor->collision = NULL;
f4b00ea196389e Zizhi Wo      2024-12-25  240  		hlist_bl_unlock(h);
f4b00ea196389e Zizhi Wo      2024-12-25  241  		pr_err("Wait duplicate cookie unhashed interrupted\n");
f4b00ea196389e Zizhi Wo      2024-12-25  242  		return NULL;
f4b00ea196389e Zizhi Wo      2024-12-25  243  	}
ec0328e46d6e5d David Howells 2018-04-04  244  	return candidate;
ec0328e46d6e5d David Howells 2018-04-04  245  
ec0328e46d6e5d David Howells 2018-04-04  246  collision:
ec0328e46d6e5d David Howells 2018-04-04  247  	if (test_and_set_bit(FSCACHE_COOKIE_ACQUIRED, &cursor->flags)) {
ec0328e46d6e5d David Howells 2018-04-04  248  		trace_fscache_cookie(cursor, fscache_cookie_collision,
ec0328e46d6e5d David Howells 2018-04-04  249  				     atomic_read(&cursor->usage));
ec0328e46d6e5d David Howells 2018-04-04  250  		fscache_print_cookie(cursor, 'O');
ec0328e46d6e5d David Howells 2018-04-04  251  		fscache_print_cookie(candidate, 'N');
ec0328e46d6e5d David Howells 2018-04-04  252  		hlist_bl_unlock(h);
f4b00ea196389e Zizhi Wo      2024-12-25  253  		pr_err("Duplicate cookie detected\n");
ec0328e46d6e5d David Howells 2018-04-04  254  		return NULL;
ec0328e46d6e5d David Howells 2018-04-04  255  	}
ec0328e46d6e5d David Howells 2018-04-04  256  
ec0328e46d6e5d David Howells 2018-04-04  257  	fscache_cookie_get(cursor, fscache_cookie_get_reacquire);
ec0328e46d6e5d David Howells 2018-04-04  258  	hlist_bl_unlock(h);
ec0328e46d6e5d David Howells 2018-04-04  259  	return cursor;
ec0328e46d6e5d David Howells 2018-04-04  260  }
ec0328e46d6e5d David Howells 2018-04-04  261  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
