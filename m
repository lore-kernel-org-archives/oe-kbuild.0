Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C33F198A01
	for <oe-kbuild@lists.linux.dev>; Thu, 31 Oct 2024 04:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730347915; cv=none; b=Lb0IMdk2wSivcJcHut2M2oYCNEPzZRkAVXcXYL/2kTaM8bHt+HpFGJliVhbqlVcCM8clJ5jT0clHZPrv/cfnVwIiuwVha+3pQEORRZfJIZRbdOVvRFxd7zAUL9orCDcuRkHWp4cwLSdzxMN/XfutxsTxN9E2fgGplqaq9spJ778=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730347915; c=relaxed/simple;
	bh=DG0eJN/aAaYX742uShGOyxes+uWprPlXJW97Wuml+Go=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f4n646wzHMJlUZ5BkGfaqb1PAsgzYBP5rta7n4GuO8QymAallEA6cWjeCnIfC5Fvevo2StFL7VkWlh6hIV+0gVx2kXbGY3WKG4k54OJfc+7M1mQZ1EkA4Z83xmsU8eg8RQvdFcqBFt8uaT8UsVZjHdXAItai99b74qnfRcRETu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BLh9dHsw; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BLh9dHsw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730347913; x=1761883913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DG0eJN/aAaYX742uShGOyxes+uWprPlXJW97Wuml+Go=;
  b=BLh9dHswwqiGJwm7iZ1ckGMiw+n/JjKMpA+yassJDMEndrLnWUqQUYmu
   1lHtzyZlTsLBgNSCyX5px8BP5vKEwBUcYU/SS4x1iHAT3jKOBVQPjwk8x
   +5fGRoQS5K5dDXpCw/OO4EzH9ALXht27IEsmK4DAuekeJ5FLWoCMRN/IJ
   y5eCjVU+ym1JzkNfPOn93+rQl+hx6rFyA/wB7McXbOyshctYLgp8XKHno
   K3xlOkCtnL6k1q8Bc4ykzp+bIUDIhbdJXbxZwi5SIYY/7OW2qowm6gnc1
   7onhc6r/TURC/schwscdItoxShbuhtxQNXIBsycwO0PSHnzLBJdQ8nbQK
   Q==;
X-CSE-ConnectionGUID: XSLNEwU9RwenEPmiM4T6/g==
X-CSE-MsgGUID: N6ziCHgwSVOQTASRnghhAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52630845"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52630845"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 21:11:52 -0700
X-CSE-ConnectionGUID: OGhdL/zqSz2buwiXlH2qVw==
X-CSE-MsgGUID: tRiAmcKRTPi13hVOOf7oHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="82163073"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Oct 2024 21:11:50 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6MXE-000fe0-1t;
	Thu, 31 Oct 2024 04:11:48 +0000
Date: Thu, 31 Oct 2024 12:11:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [djwong-xfs:health-monitoring 258/271]
 fs/xfs/xfs_health.c:168:51-52: WARNING this kind of initialization is
 deprecated
Message-ID: <202410311214.30s5awds-lkp@intel.com>
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
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git health-monitoring
head:   ab0339aa32f49d7cce50abab1e0e3e4d648d787c
commit: c836a098a382b14a015d93bd58131f91b243ffe0 [258/271] xfs: create hooks for monitoring health updates
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: x86_64-randconfig-104-20241031 (https://download.01.org/0day-ci/archive/20241031/202410311214.30s5awds-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410311214.30s5awds-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_health.c:168:51-52: WARNING this kind of initialization is deprecated
   fs/xfs/xfs_health.c:169:51-52: WARNING this kind of initialization is deprecated
   fs/xfs/xfs_health.c:170:54-55: WARNING this kind of initialization is deprecated
   fs/xfs/xfs_health.c:171:54-55: WARNING this kind of initialization is deprecated

vim +168 fs/xfs/xfs_health.c

c836a098a382b14 Darrick J. Wong 2024-10-15  157  
c836a098a382b14 Darrick J. Wong 2024-10-15  158  /* Configure health update hook functions. */
c836a098a382b14 Darrick J. Wong 2024-10-15  159  void
c836a098a382b14 Darrick J. Wong 2024-10-15  160  xfs_health_hook_setup(
c836a098a382b14 Darrick J. Wong 2024-10-15  161  	struct xfs_health_hook	*hook,
c836a098a382b14 Darrick J. Wong 2024-10-15  162  	notifier_fn_t		mod_fn)
c836a098a382b14 Darrick J. Wong 2024-10-15  163  {
c836a098a382b14 Darrick J. Wong 2024-10-15  164  	xfs_hook_setup(&hook->health_hook, mod_fn);
c836a098a382b14 Darrick J. Wong 2024-10-15  165  }
c836a098a382b14 Darrick J. Wong 2024-10-15  166  #else
c836a098a382b14 Darrick J. Wong 2024-10-15  167  # define xfs_health_unmount_hook(...)			((void)0)
c836a098a382b14 Darrick J. Wong 2024-10-15 @168  # define xfs_fs_health_update_hook(a,b,o,n)		do {o = o;} while(0)
c836a098a382b14 Darrick J. Wong 2024-10-15  169  # define xfs_rt_health_update_hook(a,b,o,n)		do {o = o;} while(0)
c836a098a382b14 Darrick J. Wong 2024-10-15  170  # define xfs_group_health_update_hook(a,b,o,n)		do {o = o;} while(0)
c836a098a382b14 Darrick J. Wong 2024-10-15  171  # define xfs_inode_health_update_hook(a,b,o,n)		do {o = o;} while(0)
c836a098a382b14 Darrick J. Wong 2024-10-15  172  #endif /* CONFIG_XFS_LIVE_HOOKS */
c836a098a382b14 Darrick J. Wong 2024-10-15  173  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
