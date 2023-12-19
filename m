Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A9338FA8
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Dec 2023 19:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AYlQlPM9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703013752; x=1734549752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0nqEaf6kggiHCJcrCl27fsB9TXKBZTk2BKsvcgtgMCU=;
  b=AYlQlPM9iEnrQpOKcZXI6IJB8Mv+6n3tEiAY7TAGDRqmbXIAT40YD4K0
   sBrzmih7rxlH7AeVtqxlbddbUoFgaNX/kKkLpGBZjgLbRUkDhPyK6JIgD
   WnggT009zzbcNTftMNyvNMEXets/K0OXCcKBg09DaTap9svHpAAzOPQsW
   0xG0uZp1icU7ViThuOvkLS9p3kbnovNYY8IMk5fl9WcyiTHuvW4wB/fyp
   9y/tGTMcslDYpmCapgI1xd9R6VHhRgYo2SgcKxCHtRdV9F3uV+F5Ff5md
   uovux/rd+040cG35WHNZLrfV3o655E0KDHuCl5Y+UUHZbyNLNPOY2gUx4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="2942713"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; 
   d="scan'208";a="2942713"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 11:22:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="1107460394"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; 
   d="scan'208";a="1107460394"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 19 Dec 2023 11:22:29 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFfff-0005qp-0g;
	Tue, 19 Dec 2023 19:22:27 +0000
Date: Wed, 20 Dec 2023 03:21:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 11/11] mm/mempolicy: extend set_mempolicy2 and mbind2
 to support weighted interleave
Message-ID: <202312200223.7X9rUFgu-lkp@intel.com>
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
In-Reply-To: <20231218194631.21667-12-gregory.price@memverge.com>
References: <20231218194631.21667-12-gregory.price@memverge.com>
TO: Gregory Price <gourry.memverge@gmail.com>
TO: linux-mm@kvack.org
CC: linux-doc@vger.kernel.org
CC: linux-fsdevel@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-api@vger.kernel.org
CC: x86@kernel.org
CC: akpm@linux-foundation.org
CC: arnd@arndb.de
CC: tglx@linutronix.de
CC: luto@kernel.org
CC: mingo@redhat.com
CC: bp@alien8.de
CC: dave.hansen@linux.intel.com
CC: hpa@zytor.com
CC: mhocko@kernel.org
CC: tj@kernel.org
CC: ying.huang@intel.com
CC: gregory.price@memverge.com
CC: corbet@lwn.net
CC: rakie.kim@sk.com
CC: hyeongtak.ji@sk.com
CC: honggyu.kim@sk.com
CC: vtavarespetr@micron.com
CC: peterz@infradead.org
CC: jgroves@micron.com
CC: ravis.opensrc@micron.com
CC: sthanneeru@micron.com
CC: emirakhur@micron.com
CC: Hasan.Maruf@amd.com
CC: seungjun.ha@samsung.com

Hi Gregory,

kernel test robot noticed the following build warnings:

[auto build test WARNING on perf-tools/perf-tools]
[also build test WARNING on linus/master v6.7-rc6]
[cannot apply to perf-tools-next/perf-tools-next tip/perf/core acme/perf/core next-20231219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-Price/mm-mempolicy-implement-the-sysfs-based-weighted_interleave-interface/20231219-074837
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools.git perf-tools
patch link:    https://lore.kernel.org/r/20231218194631.21667-12-gregory.price%40memverge.com
patch subject: [PATCH v4 11/11] mm/mempolicy: extend set_mempolicy2 and mbind2 to support weighted interleave
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: x86_64-randconfig-161-20231219 (https://download.01.org/0day-ci/archive/20231220/202312200223.7X9rUFgu-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312200223.7X9rUFgu-lkp@intel.com/

smatch warnings:
mm/mempolicy.c:2044 __do_sys_get_mempolicy2() warn: maybe return -EFAULT instead of the bytes remaining?
mm/mempolicy.c:2044 __do_sys_get_mempolicy2() warn: maybe return -EFAULT instead of the bytes remaining?

vim +2044 mm/mempolicy.c

af03c4acb728dd Dominik Brodowski 2018-03-17  1991  
a2af87404eb73e Gregory Price     2023-12-18  1992  SYSCALL_DEFINE4(get_mempolicy2, struct mpol_args __user *, uargs, size_t, usize,
a2af87404eb73e Gregory Price     2023-12-18  1993  		unsigned long, addr, unsigned long, flags)
a2af87404eb73e Gregory Price     2023-12-18  1994  {
a2af87404eb73e Gregory Price     2023-12-18  1995  	struct mpol_args kargs;
a2af87404eb73e Gregory Price     2023-12-18  1996  	struct mempolicy_args margs;
a2af87404eb73e Gregory Price     2023-12-18  1997  	int err;
a2af87404eb73e Gregory Price     2023-12-18  1998  	nodemask_t policy_nodemask;
a2af87404eb73e Gregory Price     2023-12-18  1999  	unsigned long __user *nodes_ptr;
8bfd7ddc0dd439 Gregory Price     2023-12-18  2000  	unsigned char __user *weights_ptr;
8bfd7ddc0dd439 Gregory Price     2023-12-18  2001  	unsigned char weights[MAX_NUMNODES];
a2af87404eb73e Gregory Price     2023-12-18  2002  
a2af87404eb73e Gregory Price     2023-12-18  2003  	if (flags & ~(MPOL_F_ADDR))
a2af87404eb73e Gregory Price     2023-12-18  2004  		return -EINVAL;
a2af87404eb73e Gregory Price     2023-12-18  2005  
a2af87404eb73e Gregory Price     2023-12-18  2006  	/* initialize any memory liable to be copied to userland */
a2af87404eb73e Gregory Price     2023-12-18  2007  	memset(&margs, 0, sizeof(margs));
8bfd7ddc0dd439 Gregory Price     2023-12-18  2008  	memset(weights, 0, sizeof(weights));
a2af87404eb73e Gregory Price     2023-12-18  2009  
a2af87404eb73e Gregory Price     2023-12-18  2010  	err = copy_struct_from_user(&kargs, sizeof(kargs), uargs, usize);
a2af87404eb73e Gregory Price     2023-12-18  2011  	if (err)
a2af87404eb73e Gregory Price     2023-12-18  2012  		return -EINVAL;
a2af87404eb73e Gregory Price     2023-12-18  2013  
8bfd7ddc0dd439 Gregory Price     2023-12-18  2014  	if (kargs.il_weights)
8bfd7ddc0dd439 Gregory Price     2023-12-18  2015  		margs.il_weights = weights;
8bfd7ddc0dd439 Gregory Price     2023-12-18  2016  	else
8bfd7ddc0dd439 Gregory Price     2023-12-18  2017  		margs.il_weights = NULL;
8bfd7ddc0dd439 Gregory Price     2023-12-18  2018  
a2af87404eb73e Gregory Price     2023-12-18  2019  	margs.policy_nodes = kargs.pol_nodes ? &policy_nodemask : NULL;
a2af87404eb73e Gregory Price     2023-12-18  2020  	if (flags & MPOL_F_ADDR)
a2af87404eb73e Gregory Price     2023-12-18  2021  		err = do_get_vma_mempolicy(untagged_addr(addr), NULL, &margs);
a2af87404eb73e Gregory Price     2023-12-18  2022  	else
a2af87404eb73e Gregory Price     2023-12-18  2023  		err = do_get_task_mempolicy(&margs);
a2af87404eb73e Gregory Price     2023-12-18  2024  
a2af87404eb73e Gregory Price     2023-12-18  2025  	if (err)
a2af87404eb73e Gregory Price     2023-12-18  2026  		return err;
a2af87404eb73e Gregory Price     2023-12-18  2027  
a2af87404eb73e Gregory Price     2023-12-18  2028  	kargs.mode = margs.mode;
a2af87404eb73e Gregory Price     2023-12-18  2029  	kargs.mode_flags = margs.mode_flags;
a2af87404eb73e Gregory Price     2023-12-18  2030  	kargs.policy_node = margs.policy_node;
a2af87404eb73e Gregory Price     2023-12-18  2031  	kargs.home_node = margs.home_node;
a2af87404eb73e Gregory Price     2023-12-18  2032  	if (kargs.pol_nodes) {
a2af87404eb73e Gregory Price     2023-12-18  2033  		nodes_ptr = u64_to_user_ptr(kargs.pol_nodes);
a2af87404eb73e Gregory Price     2023-12-18  2034  		err = copy_nodes_to_user(nodes_ptr, kargs.pol_maxnodes,
a2af87404eb73e Gregory Price     2023-12-18  2035  					 margs.policy_nodes);
a2af87404eb73e Gregory Price     2023-12-18  2036  		if (err)
a2af87404eb73e Gregory Price     2023-12-18  2037  			return err;
a2af87404eb73e Gregory Price     2023-12-18  2038  	}
a2af87404eb73e Gregory Price     2023-12-18  2039  
8bfd7ddc0dd439 Gregory Price     2023-12-18  2040  	if (kargs.mode == MPOL_WEIGHTED_INTERLEAVE && kargs.il_weights) {
8bfd7ddc0dd439 Gregory Price     2023-12-18  2041  		weights_ptr = u64_to_user_ptr(kargs.il_weights);
8bfd7ddc0dd439 Gregory Price     2023-12-18  2042  		err = copy_to_user(weights_ptr, weights, kargs.pol_maxnodes);
8bfd7ddc0dd439 Gregory Price     2023-12-18  2043  		if (err)
8bfd7ddc0dd439 Gregory Price     2023-12-18 @2044  			return err;
8bfd7ddc0dd439 Gregory Price     2023-12-18  2045  	}
8bfd7ddc0dd439 Gregory Price     2023-12-18  2046  
a2af87404eb73e Gregory Price     2023-12-18  2047  	return copy_to_user(uargs, &kargs, usize) ? -EFAULT : 0;
a2af87404eb73e Gregory Price     2023-12-18  2048  }
a2af87404eb73e Gregory Price     2023-12-18  2049  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
