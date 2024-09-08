Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34995C8D7
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Sep 2024 18:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725819574; cv=none; b=KpvoH+2faKGydC1zrf4aT0JWv+oC0mHgwC8LCxdR3SaOYod3TSQdEZsCXHrqOERyVASqYN3Kg9JwJ8s8cKf+iIIj89l4wn0tljKPuwiLIQCplYmIkSCsSd6n5te+Hb7PKGTXp4slymEOhZc3oKe9BduLkpb3e14BTCnBeKeRPrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725819574; c=relaxed/simple;
	bh=ZYliwExi1OOTvloJZGBIInVJbhn0fdXHjrjOznb9sBs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BsK5F9zOU3H+fdYrqZsJXH8hRhSIzoNiuEt8c9ifwhm5HsWUepyfTfq0sTKp3CPFdv0KvvMEjtH4Q267ARQQi+dPCnbWcgysCVXiBUj0BZrFa0XwvJWgXhKfBjV4laNQwmyt4DhPx7NBJYIjHXWb7uckY0FfUf+mmETV/ww8TNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VANWD8w0; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VANWD8w0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725819573; x=1757355573;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZYliwExi1OOTvloJZGBIInVJbhn0fdXHjrjOznb9sBs=;
  b=VANWD8w0iw0DGy6/2Tc6QCEc9/eJWJJQd9dQyZnalGmtKY/dR0mli93l
   wVo+QbxuVZta2KWUj1IyEvVfnJcWv7ixITwxY2TzClgCIRpdmNBGl64Ph
   h+G/nSiPXe1KLmezc5agRRSuLxXCwj3DfrFSxOP8g2pyck1H6Q4gcl8o+
   4YZeqgAERy2eTlmgvrtyxYd8f+WH2dCIE0JwCBi8ule187MYHv0nloPPy
   fp8bPXH0Gcn6fEe73SCnHAHy10AjmZS2ulfe44zGg3uSkX6Xy3YeMhQfe
   l6uHKgOjk+i1r1rZE45/qpAeuhLydI117+kfVB4BZfJLzrhCTWxJKEHni
   A==;
X-CSE-ConnectionGUID: 3tMBYthZTqmrgCMqCtkLcg==
X-CSE-MsgGUID: etW/m227T4yovi943P8U9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24650656"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="24650656"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 11:19:32 -0700
X-CSE-ConnectionGUID: /7TY8xVDTJOMxyulSGzPZQ==
X-CSE-MsgGUID: GEMJXw6sT2Wsu4Mtq3wEAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="66430727"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Sep 2024 11:19:31 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snMVU-000Do7-0F;
	Sun, 08 Sep 2024 18:19:28 +0000
Date: Mon, 9 Sep 2024 02:18:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>,
	Elena Reshetova <elena.reshetova@intel.com>
Subject: fs/afs/file.c:420:48-49: WARNING: atomic_add_unless
Message-ID: <202409090219.P4v29EVj-lkp@intel.com>
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
TO: Al Viro <viro@zeniv.linux.org.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d1f2d51b711a3b7f1ae1b46701c769c1d580fa7f
commit: 275655d3207b9e65d1561bf21c06a622d9ec1d43 afs: fix __afs_break_callback() / afs_drop_open_mmap() race
date:   7 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-053-20240908 (https://download.01.org/0day-ci/archive/20240909/202409090219.P4v29EVj-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202409090219.P4v29EVj-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
   fs/afs/file.c:428:5-24: WARNING: atomic_dec_and_test variation before object free at line 429.
>> fs/afs/file.c:420:48-49: WARNING: atomic_add_unless

vim +420 fs/afs/file.c

6e0e99d58a6530 David Howells 2021-09-02  417  
6e0e99d58a6530 David Howells 2021-09-02  418  static void afs_drop_open_mmap(struct afs_vnode *vnode)
6e0e99d58a6530 David Howells 2021-09-02  419  {
275655d3207b9e Al Viro       2023-09-29 @420  	if (atomic_add_unless(&vnode->cb_nr_mmap, -1, 1))
6e0e99d58a6530 David Howells 2021-09-02  421  		return;
6e0e99d58a6530 David Howells 2021-09-02  422  
453924de6212ac David Howells 2023-11-08  423  	down_write(&vnode->volume->open_mmaps_lock);
6e0e99d58a6530 David Howells 2021-09-02  424  
275655d3207b9e Al Viro       2023-09-29  425  	read_seqlock_excl(&vnode->cb_lock);
275655d3207b9e Al Viro       2023-09-29  426  	// the only place where ->cb_nr_mmap may hit 0
275655d3207b9e Al Viro       2023-09-29  427  	// see __afs_break_callback() for the other side...
275655d3207b9e Al Viro       2023-09-29  428  	if (atomic_dec_and_test(&vnode->cb_nr_mmap))
6e0e99d58a6530 David Howells 2021-09-02  429  		list_del_init(&vnode->cb_mmap_link);
275655d3207b9e Al Viro       2023-09-29  430  	read_sequnlock_excl(&vnode->cb_lock);
6e0e99d58a6530 David Howells 2021-09-02  431  
453924de6212ac David Howells 2023-11-08  432  	up_write(&vnode->volume->open_mmaps_lock);
6e0e99d58a6530 David Howells 2021-09-02  433  	flush_work(&vnode->cb_work);
6e0e99d58a6530 David Howells 2021-09-02  434  }
6e0e99d58a6530 David Howells 2021-09-02  435  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
