Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DABA3F54AD
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Jul 2026 09:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784192421; cv=none; b=LrIJzUPsm/ZgDvC5HsN7PgQ/X8YVcYRfVTW18C6w7v/cgEBVcnL8Gyhwo+333Qe/YSRbOtd+5Y0hp1j08w6JYKteyhp/SWai/WRTmxpBgjtICNVrm3AT9k4F9akjq4UUJ9kLC3yvR+shKiqdzWv+hvzunKqkvmw0rBbc6Qmmctw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784192421; c=relaxed/simple;
	bh=psXISTMkkhPQ6Xor+moY3E3vWbXXgo6ZSzxkIJuTn8Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=D0fAGuIm6DgiNcQ4F4c2Z4xx1ZoBgi2C5gGS1o6eFymIit51vkXZmGykw8ixlty5X7xnqGSjpefu4aRTSlTHbJpkLG4gU8wAUziuIVVWYwQykyLCv7ZvCfgQTTy8+qUmyS2EvmUr+nQaJsJofPBqRoUTjixrkmojaO59hWSBQ84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MxBUqORK; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MxBUqORK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784192417; x=1815728417;
  h=date:from:to:cc:subject:message-id;
  bh=psXISTMkkhPQ6Xor+moY3E3vWbXXgo6ZSzxkIJuTn8Y=;
  b=MxBUqORK4qTdXIQRSgZ4144knbgMZqw2GoQRFXoRdBx5Po7pnsT63UPc
   ms2BudvWebhztmomwU/qnp+4qgAK8upJhbFhIfss7g/1FDv5ZPoFY1ggO
   hQ2HVqz7vw2wnaPt6XhSgfyLL8hMd123GIGb/gvxXIZUErhPtIuL9dg+I
   7o28J7SXR5KsSJGu7E+OcyTdCATp8d0lghrWUvDN3eXPCEtg/XHgD4GnS
   A67T+MGPJms4CT9GIgA8Lck9HMioM5fArpoY6EWPr7eyDMdfKp/qZgwF3
   B7CUCrnxXady0Q+q1lCElw0fRWTOuVc3NwM9snb72B+KWSl5byw2twLb7
   A==;
X-CSE-ConnectionGUID: oJhwzfRCRjK14TfznK6QkQ==
X-CSE-MsgGUID: 1EO8WYV7SNWusl3qzcZpdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="72376990"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="72376990"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 02:00:12 -0700
X-CSE-ConnectionGUID: jiNn9oZpRDePRWzKvw5SKA==
X-CSE-MsgGUID: zD7S4zk7TpSoe9PelD1Epw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="260258822"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 16 Jul 2026 02:00:10 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkHwu-00000000ObJ-1MAH;
	Thu, 16 Jul 2026 09:00:08 +0000
Date: Thu, 16 Jul 2026 16:59:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/btrfs/props.c:147:25: sparse: sparse: Variable length
 array is used.
Message-ID: <202607161648.fAurQlez-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/btrfs/props.c:147:25: sparse: sparse: Variable length array is used."
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Filipe Manana <fdmanana@suse.com>
CC: David Sterba <dsterba@suse.com>
CC: Qu Wenruo <wqu@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   58717b2a1365d06c8c64b72aa948541b53fe31eb
commit: cf1afec09e9f004a62c54c471863209ed249fca7 btrfs: validate properties before setting them
date:   2 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 2 weeks ago
config: sparc64-randconfig-r121-20260716 (https://download.01.org/0day-ci/archive/20260716/202607161648.fAurQlez-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260716/202607161648.fAurQlez-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: cf1afec09e9f ("btrfs: validate properties before setting them")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607161648.fAurQlez-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/btrfs/props.c:147:25: sparse: sparse: Variable length array is used.

vim +147 fs/btrfs/props.c

4b73c55fdebd89 Filipe Manana             2022-04-21  106  
0d9b7e166aef9f David Sterba              2022-01-31  107  int btrfs_set_prop(struct btrfs_trans_handle *trans, struct btrfs_inode *inode,
7715da84f74d5d Anand Jain                2019-03-01  108  		   const char *name, const char *value, size_t value_len,
63541927c8d11d Filipe David Borba Manana 2014-01-07  109  		   int flags)
63541927c8d11d Filipe David Borba Manana 2014-01-07  110  {
63541927c8d11d Filipe David Borba Manana 2014-01-07  111  	const struct prop_handler *handler;
63541927c8d11d Filipe David Borba Manana 2014-01-07  112  	int ret;
63541927c8d11d Filipe David Borba Manana 2014-01-07  113  
63541927c8d11d Filipe David Borba Manana 2014-01-07  114  	handler = find_prop_handler(name, NULL);
63541927c8d11d Filipe David Borba Manana 2014-01-07  115  	if (!handler)
63541927c8d11d Filipe David Borba Manana 2014-01-07  116  		return -EINVAL;
63541927c8d11d Filipe David Borba Manana 2014-01-07  117  
63541927c8d11d Filipe David Borba Manana 2014-01-07  118  	if (value_len == 0) {
0d9b7e166aef9f David Sterba              2022-01-31  119  		ret = btrfs_setxattr(trans, &inode->vfs_inode, handler->xattr_name,
63541927c8d11d Filipe David Borba Manana 2014-01-07  120  				     NULL, 0, flags);
63541927c8d11d Filipe David Borba Manana 2014-01-07  121  		if (ret)
63541927c8d11d Filipe David Borba Manana 2014-01-07  122  			return ret;
63541927c8d11d Filipe David Borba Manana 2014-01-07  123  
7e027b767deb4a David Sterba              2025-02-18  124  		ret = handler->apply(inode, NULL, 0);
63541927c8d11d Filipe David Borba Manana 2014-01-07  125  		ASSERT(ret == 0);
63541927c8d11d Filipe David Borba Manana 2014-01-07  126  
63541927c8d11d Filipe David Borba Manana 2014-01-07  127  		return ret;
63541927c8d11d Filipe David Borba Manana 2014-01-07  128  	}
63541927c8d11d Filipe David Borba Manana 2014-01-07  129  
cf1afec09e9f00 Filipe Manana             2026-06-08  130  	ret = handler->validate(inode, value, value_len);
cf1afec09e9f00 Filipe Manana             2026-06-08  131  	if (ret)
cf1afec09e9f00 Filipe Manana             2026-06-08  132  		return ret;
0d9b7e166aef9f David Sterba              2022-01-31  133  	ret = btrfs_setxattr(trans, &inode->vfs_inode, handler->xattr_name, value,
04e6863b19c722 Anand Jain                2019-04-12  134  			     value_len, flags);
63541927c8d11d Filipe David Borba Manana 2014-01-07  135  	if (ret)
63541927c8d11d Filipe David Borba Manana 2014-01-07  136  		return ret;
7e027b767deb4a David Sterba              2025-02-18  137  	ret = handler->apply(inode, value, value_len);
cf1afec09e9f00 Filipe Manana             2026-06-08  138  	/* We validated before, so it should not fail here. */
cf1afec09e9f00 Filipe Manana             2026-06-08  139  	ASSERT(ret == 0);
cf1afec09e9f00 Filipe Manana             2026-06-08  140  	if (unlikely(ret)) {
cf1afec09e9f00 Filipe Manana             2026-06-08  141  		int ret2;
cf1afec09e9f00 Filipe Manana             2026-06-08  142  
cf1afec09e9f00 Filipe Manana             2026-06-08  143  		/* Try to delete xattr, if not possible abort transaction. */
cf1afec09e9f00 Filipe Manana             2026-06-08  144  		ret2 = btrfs_setxattr(trans, &inode->vfs_inode, handler->xattr_name,
cf1afec09e9f00 Filipe Manana             2026-06-08  145  				      NULL, 0, flags);
cf1afec09e9f00 Filipe Manana             2026-06-08  146  		if (unlikely(ret2))
cf1afec09e9f00 Filipe Manana             2026-06-08 @147  			btrfs_abort_transaction(trans, ret2);
63541927c8d11d Filipe David Borba Manana 2014-01-07  148  		return ret;
63541927c8d11d Filipe David Borba Manana 2014-01-07  149  	}
63541927c8d11d Filipe David Borba Manana 2014-01-07  150  
0d9b7e166aef9f David Sterba              2022-01-31  151  	set_bit(BTRFS_INODE_HAS_PROPS, &inode->runtime_flags);
63541927c8d11d Filipe David Borba Manana 2014-01-07  152  
63541927c8d11d Filipe David Borba Manana 2014-01-07  153  	return 0;
63541927c8d11d Filipe David Borba Manana 2014-01-07  154  }
63541927c8d11d Filipe David Borba Manana 2014-01-07  155  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
