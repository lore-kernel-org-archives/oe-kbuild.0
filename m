Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35CC3EBF28
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Jan 2026 21:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769203346; cv=none; b=ePlnKM9kaa5KDo8kW2nHU2mQKweOgwpt5v+ybyfCZh69Di32S6p/6KCS2BOD9+q+UED+55UgWzlYxdlV6MweH5VZ8P3tIL5oKh8Dfr7MmvFZSlORzvYTljdoHGOosCApntRspYZsJP4Ztge3VkJ6Y6db/mthut3mrmUWkOpx3Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769203346; c=relaxed/simple;
	bh=ZMRIRHuHzt3Pkm9RLLN3+vuqmuKLSMQ1Nz5fLJAD/nw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pQ1mtTykAHzYhLlv8wtlzZEG3SoN9+XUJZzOpaPPVAN2E1Dn3IXBgd9kFfS7Wwks/jXahhDZ6Z1tGiK0r2PvQMY7kXBua/KRkgyb31/1KTqIh3BWrqs3q4GaWIv9jliyXt13uYEeEmNTDcEckm3ebrQgVx/klbuJ4Olg/0kirFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lL+HvZHP; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lL+HvZHP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769203345; x=1800739345;
  h=date:from:to:cc:subject:message-id;
  bh=ZMRIRHuHzt3Pkm9RLLN3+vuqmuKLSMQ1Nz5fLJAD/nw=;
  b=lL+HvZHPIqBpP1mcwXfO7z3zsJlho5hVYzAa8zXtB5HmMF1k1HjZBE03
   0JQhm1jXXhjUXcIidvL6bvR57WYn/a11dePbXsvds4txF8Ag1G0OLufTr
   +rRxr4pmH1eLWdqdiGAw7fVMVLy+lizheI2e6Nsu8C3erEhQQhOCSqWBs
   9wBXwjL+CSBA2R+A9ozhbOrnrHavQEkNsb1QsJbu26qHLU+9RaWLnW99N
   vzb+QRSX7JXt+Tvp/E8vMEqncAEnk0JW7WZKXg3/rldJFltFZyFHC+ozj
   ykvrcqR3abLZksneUPyrc170lRdYJCnQ8w04cEpPKh0k43F+lkAUpf0wG
   A==;
X-CSE-ConnectionGUID: sT36983CTI+EIbL9lAoKEQ==
X-CSE-MsgGUID: 722rX6chSyyXbNh31iPS3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70626427"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="70626427"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 13:22:25 -0800
X-CSE-ConnectionGUID: c8PpxDmcT+OM37t0iEkdGw==
X-CSE-MsgGUID: VjJHoBprRiuZ5bEyO6qODw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="206377417"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Jan 2026 13:22:24 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjObl-00000000UTO-0qZM;
	Fri, 23 Jan 2026 21:22:21 +0000
Date: Sat, 24 Jan 2026 05:22:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [djwong-xfs:scrub-syzbot-fixes-7.0 11/44] fs/pnode.h:41:18:
 warning: 'copy' may be used uninitialized
Message-ID: <202601240557.gowY6tFN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git scrub-syzbot-fixes-7.0
head:   2d76e519f5fa0d3323cdd2ce3404fc19e6c23f3d
commit: c45a0220071a896d5492a1b839c518327df54f9f [11/44] fs: turn on more warnings for the filesystem code we modify most
:::::: branch date: 4 hours ago
:::::: commit date: 5 days ago
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260124/202601240557.gowY6tFN-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601240557.gowY6tFN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601240557.gowY6tFN-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In file included from fs/pnode.c:14:
   In function 'peers',
       inlined from 'find_master' at fs/pnode.c:287:10,
       inlined from 'propagate_mnt' at fs/pnode.c:339:12:
>> fs/pnode.h:41:18: warning: 'copy' may be used uninitialized [-Wmaybe-uninitialized]
      41 |         return m1->mnt_group_id == m2->mnt_group_id && m1->mnt_group_id;
         |                ~~^~~~~~~~~~~~~~
   fs/pnode.c: In function 'propagate_mnt':
   fs/pnode.c:314:31: note: 'copy' was declared here
     314 |         struct mount *m, *n, *copy, *this;
         |                               ^~~~
--
   In file included from include/linux/xarray.h:21,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs/super_types.h:7,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/dax.h:5,
                    from mm/filemap.c:15:
   In function 'memalloc_flags_restore',
       inlined from 'memalloc_noio_restore' at include/linux/sched/mm.h:372:2,
       inlined from 'filemap_get_pages' at mm/filemap.c:2692:4:
>> include/linux/sched/mm.h:342:27: warning: 'flags' may be used uninitialized [-Wmaybe-uninitialized]
     342 |         current->flags &= ~flags;
         |                           ^~~~~~
   mm/filemap.c: In function 'filemap_get_pages':
   mm/filemap.c:2670:22: note: 'flags' was declared here
    2670 |         unsigned int flags;
         |                      ^~~~~
--
   mm/gup.c: In function 'fault_in_readable':
>> mm/gup.c:2164:9: warning: 'c' may be used uninitialized [-Wmaybe-uninitialized]
    2164 |         (void)c;
         |         ^~~~~~~
   mm/gup.c:2152:23: note: 'c' declared here
    2152 |         volatile char c;
         |                       ^


vim +/copy +41 fs/pnode.h

b90fa9ae8f51f0 Ram Pai 2005-11-07  38  
592238c03ef9e4 Al Viro 2025-05-08  39  static inline bool peers(const struct mount *m1, const struct mount *m2)
592238c03ef9e4 Al Viro 2025-05-08  40  {
592238c03ef9e4 Al Viro 2025-05-08 @41  	return m1->mnt_group_id == m2->mnt_group_id && m1->mnt_group_id;
592238c03ef9e4 Al Viro 2025-05-08  42  }
592238c03ef9e4 Al Viro 2025-05-08  43  

:::::: The code at line 41 was first introduced by commit
:::::: 592238c03ef9e44ad6031b671da869ebcbffa8dc pnode: lift peers() into pnode.h

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
