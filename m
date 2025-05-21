Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89020262D0B
	for <oe-kbuild@lists.linux.dev>; Wed, 21 May 2025 11:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747826694; cv=none; b=jLBXkC2lxnLq/IOgBBGVekpfG+JlfEmZ5N+hP99HIP/H13qcHs/4e+NE0EsazyTaY/ydt8ujhASi/rAVoCEn/WT2ZiLD+lAdk20i2q6uElQ1G82JoXJRKaYkfEaBPIAYe5sNpPhAnBjvrx6sv2daudgCSYhqtdDP47xmTGBQ7Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747826694; c=relaxed/simple;
	bh=ZRbTT1fDM/o30ks2f4FKlPmcAai4ODjcpK89jSgiaf0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MxVRa4rjDqEeJcf3h3H+l+ZWSZE1oC6bupNm65Ah0aagxLBbc12feF5KuyIoiQDH7p7aytqhVFNAxVZd4ebCXUO6uPyx5gvb9NA8vC8sOneQZBVyMh9vsuoSzz9pIlSjdpaqpntaL7wnbWJeK6z/Dftco2k0UDC8IRaQ23t4kMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oAD4HTjD; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oAD4HTjD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747826692; x=1779362692;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZRbTT1fDM/o30ks2f4FKlPmcAai4ODjcpK89jSgiaf0=;
  b=oAD4HTjDg51t2oD6Gh2lch45wOYIV1OVfZpBdiPPMYpxwquyNvGEbiuA
   8Ka4/9PLs2ChipOVukuQ3Za9XjEsJFbIYlHV/q3luC6m6W3gnpIOptZ+Y
   UWkbKRUCkJZJxBedXP4ZAcn7C8Fn2m98LTt1QKbrb1Oqq8aQLu5Ig/KeR
   CZ9P0kSlXJnVrhoorAKUq/pH3u8Ajmr4JdyNlEbrq8edSCiEluuX/f4UU
   +A6PzVqhQJ9U71k57ttM85kt7TsFz00qpy/z4LrEdNUiPtxZka+K8efwN
   idVlS0WGczZuNaObXmOrKsu7eHTygeb5v8OdEzLT50t7O0b48WUgFRh2N
   g==;
X-CSE-ConnectionGUID: 2iRQHSBGSP+0Fo4GciJFNA==
X-CSE-MsgGUID: k53oYj7wSWiqlhlCl6Dbfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="60034943"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="60034943"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 04:24:52 -0700
X-CSE-ConnectionGUID: B/yJSQ5aSjqN65tNaxLCgw==
X-CSE-MsgGUID: EkXC8ItVSPC9gr7mBAWzVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="140442474"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 May 2025 04:24:51 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHhZ2-000OBQ-26;
	Wed, 21 May 2025 11:24:48 +0000
Date: Wed, 21 May 2025 19:24:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 10746/11779] fs/xfs/xfs_mru_cache.c:451
 xfs_mru_cache_insert() error: we previously assumed 'mru' could be null (see
 line 429)
Message-ID: <202505211940.jjLX0rQI-lkp@intel.com>
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
TO: Christoph Hellwig <hch@lst.de>
CC: Carlos Maiolino <cem@kernel.org>
CC: Hans Holmberg <hans.holmberg@wdc.com>
CC: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8566fc3b96539e3235909d6bdda198e1282beaed
commit: 70b95cb86513d7f6d084ddc8e961a1cab9022e14 [10746/11779] xfs: free the item in xfs_mru_cache_insert on failure
:::::: branch date: 5 days ago
:::::: commit date: 7 days ago
config: i386-randconfig-141-20250521 (https://download.01.org/0day-ci/archive/20250521/202505211940.jjLX0rQI-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505211940.jjLX0rQI-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_mru_cache.c:451 xfs_mru_cache_insert() error: we previously assumed 'mru' could be null (see line 429)

Old smatch warnings:
fs/xfs/xfs_mru_cache.c:272 _xfs_mru_cache_reap() warn: can 'mru' even be NULL?

vim +/mru +451 fs/xfs/xfs_mru_cache.c

2a82b8be8a8dac David Chinner     2007-07-11  412  
2a82b8be8a8dac David Chinner     2007-07-11  413  /*
2a82b8be8a8dac David Chinner     2007-07-11  414   * To insert an element, call xfs_mru_cache_insert() with the data store, the
2a82b8be8a8dac David Chinner     2007-07-11  415   * element's key and the client data pointer.  This function returns 0 on
2a82b8be8a8dac David Chinner     2007-07-11  416   * success or ENOMEM if memory for the data element couldn't be allocated.
70b95cb86513d7 Christoph Hellwig 2025-05-14  417   *
70b95cb86513d7 Christoph Hellwig 2025-05-14  418   * The passed in elem is freed through the per-cache free_func on failure.
2a82b8be8a8dac David Chinner     2007-07-11  419   */
2a82b8be8a8dac David Chinner     2007-07-11  420  int
2a82b8be8a8dac David Chinner     2007-07-11  421  xfs_mru_cache_insert(
22328d712dd7fd Christoph Hellwig 2014-04-23  422  	struct xfs_mru_cache	*mru,
2a82b8be8a8dac David Chinner     2007-07-11  423  	unsigned long		key,
22328d712dd7fd Christoph Hellwig 2014-04-23  424  	struct xfs_mru_cache_elem *elem)
2a82b8be8a8dac David Chinner     2007-07-11  425  {
70b95cb86513d7 Christoph Hellwig 2025-05-14  426  	int			error = -EINVAL;
2a82b8be8a8dac David Chinner     2007-07-11  427  
2a82b8be8a8dac David Chinner     2007-07-11  428  	ASSERT(mru && mru->lists);
2a82b8be8a8dac David Chinner     2007-07-11 @429  	if (!mru || !mru->lists)
70b95cb86513d7 Christoph Hellwig 2025-05-14  430  		goto out_free;
2a82b8be8a8dac David Chinner     2007-07-11  431  
70b95cb86513d7 Christoph Hellwig 2025-05-14  432  	error = -ENOMEM;
0b3a76e955ebe3 Dave Chinner      2024-01-16  433  	if (radix_tree_preload(GFP_KERNEL))
70b95cb86513d7 Christoph Hellwig 2025-05-14  434  		goto out_free;
2a82b8be8a8dac David Chinner     2007-07-11  435  
2a82b8be8a8dac David Chinner     2007-07-11  436  	INIT_LIST_HEAD(&elem->list_node);
2a82b8be8a8dac David Chinner     2007-07-11  437  	elem->key = key;
2a82b8be8a8dac David Chinner     2007-07-11  438  
ba74d0cba51dca Eric Sandeen      2007-10-11  439  	spin_lock(&mru->lock);
2451337dd04390 Dave Chinner      2014-06-25  440  	error = radix_tree_insert(&mru->store, key, elem);
2a82b8be8a8dac David Chinner     2007-07-11  441  	radix_tree_preload_end();
22328d712dd7fd Christoph Hellwig 2014-04-23  442  	if (!error)
2a82b8be8a8dac David Chinner     2007-07-11  443  		_xfs_mru_cache_list_insert(mru, elem);
ba74d0cba51dca Eric Sandeen      2007-10-11  444  	spin_unlock(&mru->lock);
2a82b8be8a8dac David Chinner     2007-07-11  445  
70b95cb86513d7 Christoph Hellwig 2025-05-14  446  	if (error)
70b95cb86513d7 Christoph Hellwig 2025-05-14  447  		goto out_free;
70b95cb86513d7 Christoph Hellwig 2025-05-14  448  	return 0;
70b95cb86513d7 Christoph Hellwig 2025-05-14  449  
70b95cb86513d7 Christoph Hellwig 2025-05-14  450  out_free:
70b95cb86513d7 Christoph Hellwig 2025-05-14 @451  	mru->free_func(mru->data, elem);
ce695c6551f948 Christoph Hellwig 2014-04-23  452  	return error;
2a82b8be8a8dac David Chinner     2007-07-11  453  }
2a82b8be8a8dac David Chinner     2007-07-11  454  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
