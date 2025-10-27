Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951E428750F
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Oct 2025 01:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761528716; cv=none; b=GuwvR9fTdTSAqwJwKJTxdmsB9sJlbIxOvr+CrQ3BcMO9svNfB90Z4D8RC6vKthAKgeHy1YnOmz5KW4sarq+7RidpfZ0saQWJMlqomvcSvuipzWjEjRcSb0kVHtH+7TCiNGhkD6crfU1r3APXPxWMnebeJNSAnmBlEgQSWVOVwXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761528716; c=relaxed/simple;
	bh=NODcQ00/YtMraMEYV8FcTKrVhkpyEi+akmw+SZIwxxw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=skJC6AYSYLbq2hjljpNC+ERKAc4MGRkOZ3EWZJQ8wRyOs36zzrdb4nxzSJWaQ1R+6U33Rd8D6qgSX3GnPHLdGlg+7puzsg61PDhQEXBQabknWGMq2pZVI/Zr5n5sWpB5VLYG5MAZgPlSUfX5dNETnLmWHzphxryRs5x+qOml69A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A8BGok3G; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A8BGok3G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761528715; x=1793064715;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NODcQ00/YtMraMEYV8FcTKrVhkpyEi+akmw+SZIwxxw=;
  b=A8BGok3GUxjhkD03FqRnxG+vXzPu+D4RB3INSPPE9NwgH4PUj3+4M7hE
   ChiLiiqP7JLcTuDNgvn4dl8fFd9ZLIvj0lDOEgzLJEJd6saHKZhjtnBOg
   vHpLITqDmstEfearyLq/Ah6ZZUI9duHCqNkzHpTEQvEK0C5nrL6DPoywW
   l6JnsKLZVCUYa38o28HCEIYFI0+2VIlfay3DBcHRzNAKcPgh5yqCkTZLd
   z9IAuWczLkV8hjQe4r1SYc71QYbfSKGnHFwg/dP5/5mzYCDS4QoYEMcA2
   rfyV5HGvb1rq8YBn01udXe7wkruItHDgxUP2sjGZ1fPwEgvJNUwE+4urz
   Q==;
X-CSE-ConnectionGUID: BhYTok+BS46BFRlPKH0Wcg==
X-CSE-MsgGUID: 4JMLN+SJQUyzpy/y+MsKrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63530170"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63530170"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 18:31:54 -0700
X-CSE-ConnectionGUID: ZWyjuqUQSZOSZrPtNGWL5g==
X-CSE-MsgGUID: xZQ4hp3HRrGeHHOgb0RoOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; 
   d="scan'208";a="190131708"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 26 Oct 2025 18:31:52 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDC5O-000GRR-1s;
	Mon, 27 Oct 2025 01:31:50 +0000
Date: Mon, 27 Oct 2025 09:30:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [bcachefs:bcachefs-testing 461/694]
 fs/bcachefs/util/rcu_pending.c:183:8-10: ERROR: reference preceded by free
 on line 183
Message-ID: <202510270936.dtnEALuB-lkp@intel.com>
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
CC: Kent Overstreet <kent.overstreet@linux.dev>
TO: Kent Overstreet <kent.overstreet@linux.dev>

Hi Kent,

First bad commit (maybe != root cause):

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   c317cd269380d275b75d21210fad161750800d68
commit: a5c2f21bff6a883e2a0fc96e4f0127350186665e [461/694] bcachefs: move utility code to subdir
:::::: branch date: 2 hours ago
:::::: commit date: 23 hours ago
config: parisc-randconfig-r062-20251026 (https://download.01.org/0day-ci/archive/20251027/202510270936.dtnEALuB-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202510270936.dtnEALuB-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/util/rcu_pending.c:183:8-10: ERROR: reference preceded by free on line 183
--
>> fs/bcachefs/util/rcu_pending.c:507:1-7: preceding lock on line 435
>> fs/bcachefs/util/rcu_pending.c:507:1-7: preceding lock on line 435
   fs/bcachefs/util/rcu_pending.c:507:1-7: preceding lock on line 525

vim +183 fs/bcachefs/util/rcu_pending.c

8e973a4f3c7482 fs/bcachefs/rcu_pending.c Kent Overstreet 2024-06-10  178  
d2ed0f206a9d8b fs/bcachefs/rcu_pending.c Kent Overstreet 2024-08-23  179  #ifndef __KERNEL__
d2ed0f206a9d8b fs/bcachefs/rcu_pending.c Kent Overstreet 2024-08-23  180  static inline void kfree_bulk(size_t nr, void ** p)
d2ed0f206a9d8b fs/bcachefs/rcu_pending.c Kent Overstreet 2024-08-23  181  {
d2ed0f206a9d8b fs/bcachefs/rcu_pending.c Kent Overstreet 2024-08-23  182  	while (nr--)
d2ed0f206a9d8b fs/bcachefs/rcu_pending.c Kent Overstreet 2024-08-23 @183  		kfree(*p);
d2ed0f206a9d8b fs/bcachefs/rcu_pending.c Kent Overstreet 2024-08-23  184  }
d2ed0f206a9d8b fs/bcachefs/rcu_pending.c Kent Overstreet 2024-08-23  185  #endif
d2ed0f206a9d8b fs/bcachefs/rcu_pending.c Kent Overstreet 2024-08-23  186  

:::::: The code at line 183 was first introduced by commit
:::::: d2ed0f206a9d8b3add18879f39dd128ff55e4d77 bcachefs: rcu_pending now works in userspace

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
