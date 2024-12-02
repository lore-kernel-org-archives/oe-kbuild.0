Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2097B1FBC9B
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Dec 2024 10:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733134830; cv=none; b=TyV/PPNwQjCI7Uu1wKDTNtg6NW8LpX274nrKpvEOcP9FyP2zCK6HElTcjTrmY0x9BoMMXqdXURw6utbdrx/2bHsx/cfUnJbNg7IH+GMv5NbQ9HyG8tOxgr8+axZU9purJFHlAcXZVHdDxAAjaty753Xi/wg5N8wmvu4TZWlcUD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733134830; c=relaxed/simple;
	bh=mo3kBeYVUpoLchjlQM9z2FM+eiXPzkWdegm4XU+ulPg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tGr+EU96O8AN6AO524DIAzVc1Vd9UJjZTUZHt6caOHGApc/RnNfLdRaZQP1/slW7e70P/9HrQwZr1c7UruPfab865OU64W5ZpXbWwPPE9nfN51gdRA3vRQm6hnavc1DbUE5CcklcM+bQpIBrJ18tSwZxloTA0C5JBnyuPRVwhHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=amDsrXvx; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="amDsrXvx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733134828; x=1764670828;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mo3kBeYVUpoLchjlQM9z2FM+eiXPzkWdegm4XU+ulPg=;
  b=amDsrXvxt0rjFlzfQlhfWfsVXxKf9iZQDZsN1xhAYzRS6IXm1cAM7//U
   TRsnUoN9HC5tS4Abt92dSa9EsVcwfIGIZi22ur0vh7E2UCiNnsic568p6
   t+Xlbn3FS4KgIMcgu1QWXYdaAedzUjUH9J3k6zQt7ZimuykuoL5kSkT01
   M4OsGtIgPSvUKrTmlDqwGcgnIcYGfrRh3z+KQp+s6HgQO0bOLAqaBpkRx
   8ae5YnnqiRAyS9oWKrvCyPc5SlCRkH1+BnTGpkqS4MgUiHyBBdG1VUNGm
   T4HFCObpMnhsDTG9ab+A4N6e7eFnkKxwAvXpbxQzTbN4B9iBx5ZDA7X7u
   w==;
X-CSE-ConnectionGUID: 02PA3ffOSpKF4wewrU6uLA==
X-CSE-MsgGUID: uJGwBrXgSoy5vdAYuyysTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="33354051"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="33354051"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 02:20:27 -0800
X-CSE-ConnectionGUID: zk52duvHSjqXbhie/XOjYw==
X-CSE-MsgGUID: Z/gU9sG7TRCUS6sbl2Sviw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="92967907"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 02 Dec 2024 02:20:26 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tI3Vm-0002Jf-3B;
	Mon, 02 Dec 2024 10:18:54 +0000
Date: Mon, 2 Dec 2024 18:17:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>,
	Elena Reshetova <elena.reshetova@intel.com>
Subject: fs/afs/file.c:420:48-49: WARNING: atomic_add_unless
Message-ID: <202412021834.7Wk2UvKE-lkp@intel.com>
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
head:   e70140ba0d2b1a30467d4af6bcfe761327b9ec95
commit: 275655d3207b9e65d1561bf21c06a622d9ec1d43 afs: fix __afs_break_callback() / afs_drop_open_mmap() race
date:   9 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 9 months ago
config: sh-randconfig-r051-20241202 (https://download.01.org/0day-ci/archive/20241202/202412021834.7Wk2UvKE-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412021834.7Wk2UvKE-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
   fs/afs/file.c:428:5-24: WARNING: atomic_dec_and_test variation before object free at line 429.
>> fs/afs/file.c:420:48-49: WARNING: atomic_add_unless

vim +420 fs/afs/file.c

6e0e99d58a6530c David Howells 2021-09-02  417  
6e0e99d58a6530c David Howells 2021-09-02  418  static void afs_drop_open_mmap(struct afs_vnode *vnode)
6e0e99d58a6530c David Howells 2021-09-02  419  {
275655d3207b9e6 Al Viro       2023-09-29 @420  	if (atomic_add_unless(&vnode->cb_nr_mmap, -1, 1))
6e0e99d58a6530c David Howells 2021-09-02  421  		return;
6e0e99d58a6530c David Howells 2021-09-02  422  
453924de6212ac1 David Howells 2023-11-08  423  	down_write(&vnode->volume->open_mmaps_lock);
6e0e99d58a6530c David Howells 2021-09-02  424  
275655d3207b9e6 Al Viro       2023-09-29  425  	read_seqlock_excl(&vnode->cb_lock);
275655d3207b9e6 Al Viro       2023-09-29  426  	// the only place where ->cb_nr_mmap may hit 0
275655d3207b9e6 Al Viro       2023-09-29  427  	// see __afs_break_callback() for the other side...
275655d3207b9e6 Al Viro       2023-09-29  428  	if (atomic_dec_and_test(&vnode->cb_nr_mmap))
6e0e99d58a6530c David Howells 2021-09-02  429  		list_del_init(&vnode->cb_mmap_link);
275655d3207b9e6 Al Viro       2023-09-29  430  	read_sequnlock_excl(&vnode->cb_lock);
6e0e99d58a6530c David Howells 2021-09-02  431  
453924de6212ac1 David Howells 2023-11-08  432  	up_write(&vnode->volume->open_mmaps_lock);
6e0e99d58a6530c David Howells 2021-09-02  433  	flush_work(&vnode->cb_work);
6e0e99d58a6530c David Howells 2021-09-02  434  }
6e0e99d58a6530c David Howells 2021-09-02  435  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
