Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C255F284B2F
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Nov 2025 08:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762330874; cv=none; b=kUn5azq/U/kizUJUq2tf0j25naQD+0ROHID6HaV17eVbcv1dtQBgot4u4jDiTjzgwxTbcq/ZcF/k6tupQuKnpBbTIKv+t3StY79nKAXWQpIXdnkRtfRAwHzYvxlgTYGVEqpd0W/VwGIfFmUA96FvRoWZhKz6OfQXFDBwoxgQM/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762330874; c=relaxed/simple;
	bh=ezooTASRf2VNvVseYkaX5dHdpB1W1mt6tAwaoFhIrbw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LSCBrvrDHgYLdo0V+IJt9KWlE/WCsiW/E9pZJ6XsrAMeB9hHQKuMo5X3Q4AudJjuVxgTlBRjl/25oNjjG2C/6Amf+E3bCX39DRKMiUPgmeJXM4Wchawl3kM09mdL39CJTsyqkrPX8GeVo79yZVKWpJ4Ueusi9axw1pxbzeATqZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n0UlEITy; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n0UlEITy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762330873; x=1793866873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ezooTASRf2VNvVseYkaX5dHdpB1W1mt6tAwaoFhIrbw=;
  b=n0UlEITynKd/vwYT3hHSQOa3iNOL7kaB0hQNKdukf9Xd0UmvMOnbsH7q
   RW1Ks/exvqbV74Pg/r8qTyyUZ49FrfechL2hFrrvGoFbq90pKgsOH0lBW
   Q84SK8/FqMEqFXEYuPclrp+OYzvb8teAx6Gd+hmDiO0bS9Exh9ShsEQGd
   mF7mTlcV0wN/X0pVY9a4vhpF0nnjPEFu9Le99dpf0uFsJE8vDBndMrlgJ
   2iHk+dCFOsOhKD6tug1C1ZaSYjWpNsH8OlmtIr6fhAkedAzUVivdJ5LBL
   U3MlOzMqiOfNcF+mE0GrOich185Q1vmQ10rU/jBxbwLOd/m8/tf9k+HMQ
   g==;
X-CSE-ConnectionGUID: DGhlUOLWR/2PVyEe2Vih4g==
X-CSE-MsgGUID: iJVU5ZO1QzqpuEM4OEP84g==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="68091558"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="68091558"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 00:21:12 -0800
X-CSE-ConnectionGUID: UxbfMBISSyiti4i+yq50sg==
X-CSE-MsgGUID: cFkDp6VySBmAVJ81F9h1xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="192554705"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 05 Nov 2025 00:21:11 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGYlQ-000SJI-1A;
	Wed, 05 Nov 2025 08:21:08 +0000
Date: Wed, 5 Nov 2025 16:20:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [zab-rpdfs:rpdfs-initial 1/1] fs/rpdfs/block.c:312 put_block()
 error: uninitialized symbol 'now'.
Message-ID: <202511051628.ygCCwqFw-lkp@intel.com>
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
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20251104 (https://download.01.org/0day-ci/archive/20251105/202511051628.ygCCwqFw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511051628.ygCCwqFw-lkp@intel.com/

smatch warnings:
fs/rpdfs/block.c:312 put_block() error: uninitialized symbol 'now'.
fs/rpdfs/net.c:301 rpdfs_net_invalid_sizes() warn: impossible condition '(md->ctl_size > 255) => (1-255 > 255)'
fs/rpdfs/super.c:178 rpdfs_parse_param() error: uninitialized symbol 'ret'.

vim +/now +312 fs/rpdfs/block.c

e8e76da7ed715ef Zach Brown 2025-08-13  304  
e8e76da7ed715ef Zach Brown 2025-08-13  305  static void put_block(struct rpdfs_block *bk)
e8e76da7ed715ef Zach Brown 2025-08-13  306  {
e8e76da7ed715ef Zach Brown 2025-08-13  307  	s64 now;
e8e76da7ed715ef Zach Brown 2025-08-13  308  
e8e76da7ed715ef Zach Brown 2025-08-13  309  	if (!IS_ERR_OR_NULL(bk) && (now = atomic64_dec_return(&bk->refcount)) == 0)
e8e76da7ed715ef Zach Brown 2025-08-13  310  		free_block(bk);
e8e76da7ed715ef Zach Brown 2025-08-13  311  
e8e76da7ed715ef Zach Brown 2025-08-13 @312  	WARN_ON_ONCE(now < 0);
e8e76da7ed715ef Zach Brown 2025-08-13  313  	WARN_ON_ONCE(now == REMOVAL_REFCOUNT - 1);
e8e76da7ed715ef Zach Brown 2025-08-13  314  }
e8e76da7ed715ef Zach Brown 2025-08-13  315  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
