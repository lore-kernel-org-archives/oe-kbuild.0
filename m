Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A5F1B4257
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Jun 2026 08:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781427182; cv=none; b=TqXS3brrfB3i0Qaah4shCuCyLlkpHEW0Ct2/e9w5mOn1yoKYqVBWJio7QP5OIsuIjAp6VLEfBZCtc7RoKrWedNbbPSYrLfS70al2oqHg93KUmBil7KdT3fEz/c/qLueVpiWCUHb9JzhFe5OFe4DyA1OManog2YnE20qg5Jsgfzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781427182; c=relaxed/simple;
	bh=evqXnVMrSM31ID1NGGmrjjOdRflxh42FQ4TkuyZTIIc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UVJiaeWL/vA9nhxcComHcRDDk7ytuTppJ26dxXsvocbcK3XwaacpGuyO1QhHn5cdQvAsNu3VGl34tvM5WMwzx/+1MA+eOMPpNkAVJICGziWx79z79bbQt7XsDpSJ8Kv0cXyQT5kTHxeXYtmuPUpQrtxv0L9gRIjsdlSCmYw4/AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mFkaci0C; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mFkaci0C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781427181; x=1812963181;
  h=date:from:to:cc:subject:message-id;
  bh=evqXnVMrSM31ID1NGGmrjjOdRflxh42FQ4TkuyZTIIc=;
  b=mFkaci0CowcFA+phfLYC/bpIhG4r7bZhVM2T836FmRA+9zOB1hZ/FcS0
   jnDQytrlXoEf7P2dq8/jRY6OIWOTXnk/OEtC0sUlLen83pPb/Izi3VWwg
   /JXmxqA7+ffXgypW10YaOZhOWPIjXMgp3A78/VShB2ZLnFksX8Rk1GZAG
   bzzFCI1rf4A7aSya5uhsANLQyqclXcAT6nXjdmz7qxNZEjo2s4y6jPVY7
   ByukqL93ex9WIVVm62NkRhBoi3aMfbdl8Pw/rYW/L0XOrLSzdG8Did7Rh
   rRG3tA+eYULivb5EcLIBYBANgbzpd7rDSluJttf/XgAXlG27ETM41c3P4
   w==;
X-CSE-ConnectionGUID: qcwG+Qb1Sm2EM6C/ZE4Wcg==
X-CSE-MsgGUID: Irw1cTJ3TFSRS8tY7JMVig==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="93314065"
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="93314065"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 01:53:00 -0700
X-CSE-ConnectionGUID: etI/LDftROK4ND4tnY0Q5w==
X-CSE-MsgGUID: gO/49K9vSVKmGvJmVt1u2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="240853789"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Jun 2026 01:52:59 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYgaO-00000000QhO-2xRi;
	Sun, 14 Jun 2026 08:52:56 +0000
Date: Sun, 14 Jun 2026 16:52:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [btrfs:pr/1630 40/42] fs/btrfs/props.c:147:25: sparse:
 sparse: Variable length array is used.
Message-ID: <202606141616.k7DYY7D5-lkp@intel.com>
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
TO: Filipe Manana <fdmanana@suse.com>
CC: Johannes Thumshirn <johannes.thumshirn@wdc.com>
CC: Qu Wenruo <wqu@suse.com>

tree:   https://github.com/btrfs/linux.git pr/1630
head:   c809d35eab66fba06c5695f9fd69ea20c44366d5
commit: 636ea1c476eeb2ea2a68aebdc488a93c58f6c957 [40/42] btrfs: validate properties before setting them
:::::: branch date: 2 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-122-20260614 (https://download.01.org/0day-ci/archive/20260614/202606141616.k7DYY7D5-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260614/202606141616.k7DYY7D5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606141616.k7DYY7D5-lkp@intel.com/

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
636ea1c476eeb2 Filipe Manana             2026-06-08  130  	ret = handler->validate(inode, value, value_len);
636ea1c476eeb2 Filipe Manana             2026-06-08  131  	if (ret)
636ea1c476eeb2 Filipe Manana             2026-06-08  132  		return ret;
0d9b7e166aef9f David Sterba              2022-01-31  133  	ret = btrfs_setxattr(trans, &inode->vfs_inode, handler->xattr_name, value,
04e6863b19c722 Anand Jain                2019-04-12  134  			     value_len, flags);
63541927c8d11d Filipe David Borba Manana 2014-01-07  135  	if (ret)
63541927c8d11d Filipe David Borba Manana 2014-01-07  136  		return ret;
7e027b767deb4a David Sterba              2025-02-18  137  	ret = handler->apply(inode, value, value_len);
636ea1c476eeb2 Filipe Manana             2026-06-08  138  	/* We validated before, so it should not fail here. */
636ea1c476eeb2 Filipe Manana             2026-06-08  139  	ASSERT(ret == 0);
636ea1c476eeb2 Filipe Manana             2026-06-08  140  	if (unlikely(ret)) {
636ea1c476eeb2 Filipe Manana             2026-06-08  141  		int ret2;
636ea1c476eeb2 Filipe Manana             2026-06-08  142  
636ea1c476eeb2 Filipe Manana             2026-06-08  143  		/* Try to delete xattr, if not possible abort transaction. */
636ea1c476eeb2 Filipe Manana             2026-06-08  144  		ret2 = btrfs_setxattr(trans, &inode->vfs_inode, handler->xattr_name,
636ea1c476eeb2 Filipe Manana             2026-06-08  145  				      NULL, 0, flags);
636ea1c476eeb2 Filipe Manana             2026-06-08  146  		if (unlikely(ret2))
636ea1c476eeb2 Filipe Manana             2026-06-08 @147  			btrfs_abort_transaction(trans, ret2);
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
