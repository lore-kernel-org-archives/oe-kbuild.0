Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9744E9444
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Feb 2025 05:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738475523; cv=none; b=Dc+J4FoOffZMD4ecUUm5Fp8TNbMrDopnG/Qy9K76m1vfol3zc2Q6vFmNmAg0qPkV9hJBnimzuoveuonOXOZlv8pMOPhUj3AaEHuHAqHA09pusz6Ddhchuc9mE8H/cPrvXYE2ghXprE9GWgV/tH/+PHobq5+IlZ5Vud+vggdz69Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738475523; c=relaxed/simple;
	bh=RRHjWU6NGMrIJfUckgjEt4iI43o7v4HDDhOXMloeBoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mM8FIPieHa/TQaqPcNDNZX5XsuAOnHwdSpiUn6qQh9Zl2JsBhel0VArnaypiwnuFqXl95UbezWp3rAB8+3QsXbWzcgfd6P7q+DVfBNXdNnusn2LjigJsWODkFIaqg6qS5SawLi74EV0UwnfQTbb4iXUzf0YHTJq6wehJN3PaRe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fRd2fB7F; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fRd2fB7F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738475521; x=1770011521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RRHjWU6NGMrIJfUckgjEt4iI43o7v4HDDhOXMloeBoQ=;
  b=fRd2fB7FunmCVtr4wB58y+kbss5Loauv5ltfz+og3DX/Sta7749KqtgR
   +4UcJozjdv5sns+DtSOuY051gMmiuS9X5I2pFtMslfatbILn4imb39oez
   T3Liebf6+KhsFdJsRjkkM9SbrvVWqtbjGhhZA9el6YLFdFoOoE8mZ+B8f
   RzEtDNKbJBuMZxwq14Bxo9Jpu1YkuDDx/diGolRqhIa2wRLiLQswjcZJC
   ZoyDS/7wCI0tc3kdWp1+5uhkyhPJxbOpDoZxGaSzT2PJEms1IVhL5Auva
   LLuFQ5o/pmSatkc35iA+17I7gq5ElOae9+hH3kJ2eqW8g27Y62Y8w47Q6
   Q==;
X-CSE-ConnectionGUID: cywXUSHiS+KX7Aak0SEk7A==
X-CSE-MsgGUID: MnWCwBKXQh+h9dEzU/4ikw==
X-IronPort-AV: E=McAfee;i="6700,10204,11333"; a="42648976"
X-IronPort-AV: E=Sophos;i="6.13,253,1732608000"; 
   d="scan'208";a="42648976"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2025 21:52:01 -0800
X-CSE-ConnectionGUID: tyJFufRLQeq8X6uhGe2VlQ==
X-CSE-MsgGUID: Remn9eusQRu+KyPEzK/Ntg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133243726"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Feb 2025 21:52:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teSth-000pJX-2Z;
	Sun, 02 Feb 2025 05:51:57 +0000
Date: Sun, 2 Feb 2025 13:51:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [djwong-xfs:health-monitoring 121/135]
 fs/xfs/xfs_health.c:168:51-52: WARNING this kind of initialization is
 deprecated
Message-ID: <202502021313.YWieIHDA-lkp@intel.com>
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
head:   2dba69b5744651f5b55680f4c24d601dc200b498
commit: ffe91b375f8bfc17ff14e8746710a60d8bc8e16c [121/135] xfs: create hooks for monitoring health updates
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: i386-randconfig-052-20250202 (https://download.01.org/0day-ci/archive/20250202/202502021313.YWieIHDA-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202502021313.YWieIHDA-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_health.c:168:51-52: WARNING this kind of initialization is deprecated
   fs/xfs/xfs_health.c:169:51-52: WARNING this kind of initialization is deprecated
   fs/xfs/xfs_health.c:170:54-55: WARNING this kind of initialization is deprecated
   fs/xfs/xfs_health.c:171:54-55: WARNING this kind of initialization is deprecated

vim +168 fs/xfs/xfs_health.c

ffe91b375f8bfc Darrick J. Wong 2025-01-21  157  
ffe91b375f8bfc Darrick J. Wong 2025-01-21  158  /* Configure health update hook functions. */
ffe91b375f8bfc Darrick J. Wong 2025-01-21  159  void
ffe91b375f8bfc Darrick J. Wong 2025-01-21  160  xfs_health_hook_setup(
ffe91b375f8bfc Darrick J. Wong 2025-01-21  161  	struct xfs_health_hook	*hook,
ffe91b375f8bfc Darrick J. Wong 2025-01-21  162  	notifier_fn_t		mod_fn)
ffe91b375f8bfc Darrick J. Wong 2025-01-21  163  {
ffe91b375f8bfc Darrick J. Wong 2025-01-21  164  	xfs_hook_setup(&hook->health_hook, mod_fn);
ffe91b375f8bfc Darrick J. Wong 2025-01-21  165  }
ffe91b375f8bfc Darrick J. Wong 2025-01-21  166  #else
ffe91b375f8bfc Darrick J. Wong 2025-01-21  167  # define xfs_health_unmount_hook(...)			((void)0)
ffe91b375f8bfc Darrick J. Wong 2025-01-21 @168  # define xfs_fs_health_update_hook(a,b,o,n)		do {o = o;} while(0)
ffe91b375f8bfc Darrick J. Wong 2025-01-21  169  # define xfs_rt_health_update_hook(a,b,o,n)		do {o = o;} while(0)
ffe91b375f8bfc Darrick J. Wong 2025-01-21  170  # define xfs_group_health_update_hook(a,b,o,n)		do {o = o;} while(0)
ffe91b375f8bfc Darrick J. Wong 2025-01-21  171  # define xfs_inode_health_update_hook(a,b,o,n)		do {o = o;} while(0)
ffe91b375f8bfc Darrick J. Wong 2025-01-21  172  #endif /* CONFIG_XFS_LIVE_HOOKS */
ffe91b375f8bfc Darrick J. Wong 2025-01-21  173  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
