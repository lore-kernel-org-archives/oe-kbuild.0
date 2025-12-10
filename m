Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB43281368
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Dec 2025 19:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765396133; cv=none; b=TnqiKakHKEAGOObzemxdJQSaALYAz5NNY7M0Oho05pculzFa8PyuPXuD0P0tBAAMPcxmO1z2h3hT+iAH1PfAHQj1xAKaHcEpZQOa+Xsg8yBcSRjp41xPIrWesDOxkOE+3yGb+jiciMTM830h/elpmNSoyMkTTC9/KXd4FNqVrbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765396133; c=relaxed/simple;
	bh=51FQu01+5yyqVREr8QE5uqrvLLJtNL5kQOZ8bEGyBMM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DD05GP/d6/9Pki1oJ/j85HdmZfZsuzabnLnNt4CIBDoMALCjya6OUUBGHIE07L9QdeAfYos+aRqiZWiFnjD4Fw1HcFBsKImja0hGekdgcGvbCzGxioLqTHXCcLNPlXVYz2wrVHh0qhyMKUEa+yCoj/xyqmb67LVg2hKysX4TpJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cmqjU1IS; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cmqjU1IS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765396132; x=1796932132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=51FQu01+5yyqVREr8QE5uqrvLLJtNL5kQOZ8bEGyBMM=;
  b=cmqjU1ISaAbKylHNxrFlVL+Se7BsUENUvrzRJuc6TNlVzkOuzch3GqDb
   54ENp9hFYnehtLFjSbPD3/zdUsl+a+nF465dVjnM3ud9hOx/QVw95bO9p
   P+9qpoerLcCAYoXwDA7TQz/gJqR7nx8xelumCqZYifQ8+G0ZUUrRSzblV
   eDCkFPTzF2RvWFAhCZ99Zs0gy8unmET8CY3draQgImOFHh9Ln5ya5IlQa
   almuPz1O4fnCG0qlbF668u4CjwwCeEwuUO0QrKXdYdb26U7LgKSF/KGqz
   6CCuYVSwQcP92/WPRphB30ASrkoZoRWtJT3fF0seWrOaNix19inp79Snb
   Q==;
X-CSE-ConnectionGUID: SO/bOIseSYW8/42QQriqHA==
X-CSE-MsgGUID: EAdYLJ0bTnCOm4d5YXBr9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="71223579"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="71223579"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 11:48:51 -0800
X-CSE-ConnectionGUID: RqnSv+GyRAqODi2OmnyD+A==
X-CSE-MsgGUID: YbUSKt6pRie6+75PjBLBhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="219947434"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Dec 2025 11:48:50 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTQB5-000000003hj-452o;
	Wed, 10 Dec 2025 19:48:47 +0000
Date: Thu, 11 Dec 2025 03:48:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/xfs/libxfs/xfs_refcount.c:163 xfs_rtrefcount_check_irec() warn:
 impossible condition '(irec->rc_refcount > (~0)) => (1-u32max > u32max)'
Message-ID: <202512110307.zQb2RhNW-lkp@intel.com>
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
TO: "Darrick J. Wong" <djwong@kernel.org>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0048fbb4011ec55c32d3148b2cda56433f273375
commit: 01cef1db246ee8b094fca6df23ea6d4335748181 xfs: prepare refcount functions to deal with rtrefcountbt
date:   12 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 12 months ago
config: alpha-randconfig-r072-20251210 (https://download.01.org/0day-ci/archive/20251211/202512110307.zQb2RhNW-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512110307.zQb2RhNW-lkp@intel.com/

New smatch warnings:
fs/xfs/libxfs/xfs_refcount.c:163 xfs_rtrefcount_check_irec() warn: impossible condition '(irec->rc_refcount > (~0)) => (1-u32max > u32max)'

Old smatch warnings:
fs/xfs/libxfs/xfs_refcount.c:132 xfs_refcount_check_irec() warn: impossible condition '(irec->rc_blockcount > (~0)) => (1-u32max > u32max)'
fs/xfs/libxfs/xfs_refcount.c:142 xfs_refcount_check_irec() warn: impossible condition '(irec->rc_refcount > (~0)) => (1-u32max > u32max)'
fs/xfs/libxfs/xfs_refcount.c:153 xfs_rtrefcount_check_irec() warn: impossible condition '(irec->rc_blockcount > (~0)) => (1-u32max > u32max)'

vim +163 fs/xfs/libxfs/xfs_refcount.c

2b30cc0bf0589d Darrick J. Wong 2023-04-11  147  
01cef1db246ee8 Darrick J. Wong 2024-11-20  148  xfs_failaddr_t
01cef1db246ee8 Darrick J. Wong 2024-11-20  149  xfs_rtrefcount_check_irec(
01cef1db246ee8 Darrick J. Wong 2024-11-20  150  	struct xfs_rtgroup		*rtg,
01cef1db246ee8 Darrick J. Wong 2024-11-20  151  	const struct xfs_refcount_irec	*irec)
01cef1db246ee8 Darrick J. Wong 2024-11-20  152  {
01cef1db246ee8 Darrick J. Wong 2024-11-20  153  	if (irec->rc_blockcount == 0 || irec->rc_blockcount > XFS_REFC_LEN_MAX)
01cef1db246ee8 Darrick J. Wong 2024-11-20  154  		return __this_address;
01cef1db246ee8 Darrick J. Wong 2024-11-20  155  
01cef1db246ee8 Darrick J. Wong 2024-11-20  156  	if (!xfs_refcount_check_domain(irec))
01cef1db246ee8 Darrick J. Wong 2024-11-20  157  		return __this_address;
01cef1db246ee8 Darrick J. Wong 2024-11-20  158  
01cef1db246ee8 Darrick J. Wong 2024-11-20  159  	/* check for valid extent range, including overflow */
01cef1db246ee8 Darrick J. Wong 2024-11-20  160  	if (!xfs_verify_rgbext(rtg, irec->rc_startblock, irec->rc_blockcount))
01cef1db246ee8 Darrick J. Wong 2024-11-20  161  		return __this_address;
01cef1db246ee8 Darrick J. Wong 2024-11-20  162  
01cef1db246ee8 Darrick J. Wong 2024-11-20 @163  	if (irec->rc_refcount == 0 || irec->rc_refcount > XFS_REFC_REFCOUNT_MAX)
01cef1db246ee8 Darrick J. Wong 2024-11-20  164  		return __this_address;
01cef1db246ee8 Darrick J. Wong 2024-11-20  165  
01cef1db246ee8 Darrick J. Wong 2024-11-20  166  	return NULL;
01cef1db246ee8 Darrick J. Wong 2024-11-20  167  }
01cef1db246ee8 Darrick J. Wong 2024-11-20  168  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
