Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1159D21ABD0
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Nov 2025 11:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762257562; cv=none; b=fD9krOH6jC7drFcyQaqdzg/KdV4wNdKMKNHU3iNouU6UtIi3Eu5N4ru8Hl5EhTAkH0wDWDVCzuEfZDUvfQ/MIkA94ccJdmiWq8dw0/xYLwB+XZonqXixXBig3NL87RrOJczhxKYsFwmoTEzq7RbhwF1BZfMK+/oX/o/Eii//JGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762257562; c=relaxed/simple;
	bh=KFChLXnrt5u6NWlNxo8bkJNVrfi5Y6Eeq+7eXwAV678=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tn/D1imVEbNDmVnNZvF+Lphp2me0x30ioKHwgbs9fljUlrX6tE0E5jnTLLxB8w9Eev7RLk5pJo/szWHgx2hHfEBoCRpggTP+9JXRbzzPN4Gwe17z9zmQBVLn/+iJuBJ/o1EPMPusfpN6eanqaRCHapr+nG8fpOxTkUJy1lqItec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oy7prusK; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oy7prusK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762257560; x=1793793560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KFChLXnrt5u6NWlNxo8bkJNVrfi5Y6Eeq+7eXwAV678=;
  b=Oy7prusK9z1fxKhdmrvYK9S4v3/XOXO12b0pdBX/8sDWy3m8vCT5Skn3
   f0q/4SZ9ndfRGBNtAa8bb3CSh9eT5WS9ddR8SP74xERwDm82rfqRz8iHz
   h3XsHxt7s15vzeEb+Ez0tan4H/5CApXkOhouJyonOKYvtCJKtQAIrOE+R
   IdDVmtw3ByrZNRPnYwg304cqoUBff/1Vaoz5cf0XVp2glTSUIm0mIjjbo
   oyUS1Hgk1SlPInKno+0pnCrCEe4wDyuoeM/m2DRvuHTGFaFEgzBFMZsWV
   2/yLZa6+3EuqsuRnGnLtVIsu09UsFc/3jTOgGXgH9NjRyDh34qsvbZllt
   w==;
X-CSE-ConnectionGUID: 0Ay8/q4iTjOixARf/pmMkQ==
X-CSE-MsgGUID: 1gzpNuU/SPq83V+3HUUGKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="75460126"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="75460126"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 03:59:19 -0800
X-CSE-ConnectionGUID: S3G8dQddTruMAdnEkAGAnQ==
X-CSE-MsgGUID: YkSOYN15TQa/+KviQRg0yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="191447480"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 04 Nov 2025 03:59:18 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGFgy-000RMm-1X;
	Tue, 04 Nov 2025 11:59:16 +0000
Date: Tue, 4 Nov 2025 19:58:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [zab-rpdfs:rpdfs-initial 1/1] fs/rpdfs/block.c:312 put_block()
 error: uninitialized symbol 'now'.
Message-ID: <202511041957.tAwig1Yp-lkp@intel.com>
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
config: x86_64-randconfig-161-20251104 (https://download.01.org/0day-ci/archive/20251104/202511041957.tAwig1Yp-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511041957.tAwig1Yp-lkp@intel.com/

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
