Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD8022689C
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Nov 2025 01:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762220088; cv=none; b=Ghm7sOiqeIbdYflFJXTikiTsJR47wNZfE8Ag3a6gtBiI2ds4G9jM6QY3VS9QkG8nIkyvu1KvyD6VVSpaRQV8ZnHvzFIBa+xS5BZ8IWtn3TgrfNvVNxUZvNdwQ/6fMYQInPi9cENs9dOhqlZOdk9e6JJHE40Qn9oOe4BzRSiOhLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762220088; c=relaxed/simple;
	bh=ITzsSNg/yDl3UTm/RfyDwSKKud4COXlgunCO0WMX8bc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m564egREfIUdA8dZ7ed4w80eZIstBg4vr20mwHm0U8OIsVGKSgYYg34EFLqnIbYw9e+qCwJCkkrmB4EEqkax59eQzy/u36k5wmnSxx2iuR+BjGc0T40hpOyijoJiRm03U0SJXdWkaN/yLCk/niyobBQiZ/u+90uCRiFp3lLnyx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PrrFYEHm; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PrrFYEHm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762220087; x=1793756087;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ITzsSNg/yDl3UTm/RfyDwSKKud4COXlgunCO0WMX8bc=;
  b=PrrFYEHmorD9tftkxdR8iPnutguiVi3MzdO8FmkgeV5Eebh/u2mtT1wb
   Dgc+4JT6aW+l8JJTyLCZnMekYiW6PN9zEjlZ7zHjmP/SJeUL9PojABYo+
   wQR78+wZodyoCYybp1RgfQGtVjhRU2Xm+AmO687sztn9I27r+/BDCxjgP
   hPB5RLKXcdQci57TH2hGGnYlN6hsS3gm7BMYafycma6XvOGxqUZHxrBRw
   7lxbXXPcACRdt9hWIERkAUsFHLCKf8AeSZGu50WD3qps9UMsqQGslQyn7
   r/OGCFXpDdfRHlCVyy//kBbyZiLw850V3qIyCrcluXZiXaoUIkMPZWkYK
   w==;
X-CSE-ConnectionGUID: BUO7VH4iQSWw9gbTrQG5tA==
X-CSE-MsgGUID: dlM2D6krRmCH4T6b1hPPKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="81713774"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="81713774"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 17:34:47 -0800
X-CSE-ConnectionGUID: j6cBXhKhTBGxW6DOTbjbEQ==
X-CSE-MsgGUID: ViQSCHtWReKreBCaxjww8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="210530961"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 03 Nov 2025 17:34:45 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vG5wO-000QjC-0z;
	Tue, 04 Nov 2025 01:34:36 +0000
Date: Tue, 4 Nov 2025 09:33:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [zab-rpdfs:rpdfs-initial 1/1] fs/rpdfs/block.c:312 put_block()
 error: uninitialized symbol 'now'.
Message-ID: <202511040921.YBdsnwZz-lkp@intel.com>
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
TO: Zach Brown <zab@zabbo.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/zab/linux-rpdfs.git rpdfs-initial
head:   e8e76da7ed715ef67ccc4436f4981a5b39983d9f
commit: e8e76da7ed715ef67ccc4436f4981a5b39983d9f [1/1] rpdfs: initial commit
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20251104 (https://download.01.org/0day-ci/archive/20251104/202511040921.YBdsnwZz-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511040921.YBdsnwZz-lkp@intel.com/

smatch warnings:
fs/rpdfs/block.c:312 put_block() error: uninitialized symbol 'now'.
fs/rpdfs/net.c:301 rpdfs_net_invalid_sizes() warn: impossible condition '(md->ctl_size > 255) => (1-255 > 255)'
fs/rpdfs/super.c:178 rpdfs_parse_param() error: uninitialized symbol 'ret'.

vim +/now +312 fs/rpdfs/block.c

e8e76da7ed715e Zach Brown 2025-08-13  304  
e8e76da7ed715e Zach Brown 2025-08-13  305  static void put_block(struct rpdfs_block *bk)
e8e76da7ed715e Zach Brown 2025-08-13  306  {
e8e76da7ed715e Zach Brown 2025-08-13  307  	s64 now;
e8e76da7ed715e Zach Brown 2025-08-13  308  
e8e76da7ed715e Zach Brown 2025-08-13  309  	if (!IS_ERR_OR_NULL(bk) && (now = atomic64_dec_return(&bk->refcount)) == 0)
e8e76da7ed715e Zach Brown 2025-08-13  310  		free_block(bk);
e8e76da7ed715e Zach Brown 2025-08-13  311  
e8e76da7ed715e Zach Brown 2025-08-13 @312  	WARN_ON_ONCE(now < 0);
e8e76da7ed715e Zach Brown 2025-08-13  313  	WARN_ON_ONCE(now == REMOVAL_REFCOUNT - 1);
e8e76da7ed715e Zach Brown 2025-08-13  314  }
e8e76da7ed715e Zach Brown 2025-08-13  315  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
