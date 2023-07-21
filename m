Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B9820F88
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Jul 2023 19:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689966558; x=1721502558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2VaSZvmBNIrtg9O4Rk7hbYNEXzv/o5mci/lL0OYGDr4=;
  b=mQpXV0u70BzOgDubHGVjo2WYXLsuUG+pH8G/fe1twHVd02utjPiDrcec
   M8C/pPnGzVgyBM/WozvP0pDAJpEggSi5qUJl9VWcuOofcOYb+Wp/ym6PI
   82HV3/R6b/gjFvvLzg+hesmPs/hW96Tnf1AjQH8VGNTInUGhd5Jm5TjyU
   I3ufOmK71yPQwk8Hg9R4DCms8POztVg+sJ8/AT35oShtvSVif+07d55zR
   NjEQEmGBoHWeGN/WgxXvZjBh2lcs10bY11zKQ2iEmp71HDjEahqAzUHUr
   sP148hUMaacMAJ+P8t+EvJqqGiqm5UlbW3kBJa8dQswawALXZJDvB2i2w
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="430892117"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="430892117"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 12:09:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="718930508"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="718930508"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 21 Jul 2023 12:09:13 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMvUu-0007Yn-37;
	Fri, 21 Jul 2023 19:09:08 +0000
Date: Sat, 22 Jul 2023 03:08:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [RFC v6.5-rc2 2/3] fs: lockd: fix race in async lock request
 handling
Message-ID: <202307220225.DeAIaATn-lkp@intel.com>
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
In-Reply-To: <20230720125806.1385279-2-aahringo@redhat.com>
References: <20230720125806.1385279-2-aahringo@redhat.com>
TO: Alexander Aring <aahringo@redhat.com>

Hi Alexander,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.5-rc2]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Aring/fs-lockd-fix-race-in-async-lock-request-handling/20230720-210010
base:   v6.5-rc2
patch link:    https://lore.kernel.org/r/20230720125806.1385279-2-aahringo%40redhat.com
patch subject: [RFC v6.5-rc2 2/3] fs: lockd: fix race in async lock request handling
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: x86_64-randconfig-m001-20230720 (https://download.01.org/0day-ci/archive/20230722/202307220225.DeAIaATn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307220225.DeAIaATn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307220225.DeAIaATn-lkp@intel.com/

smatch warnings:
fs/lockd/svclock.c:798 nlmsvc_grant_deferred() warn: iterator used outside loop: 'block'

vim +/block +798 fs/lockd/svclock.c

385d3265c23730 Alexander Aring 2023-07-20  777  
385d3265c23730 Alexander Aring 2023-07-20  778  static int nlmsvc_grant_deferred(struct file_lock *fl, int result)
385d3265c23730 Alexander Aring 2023-07-20  779  {
385d3265c23730 Alexander Aring 2023-07-20  780  	struct nlm_block *block = NULL;
385d3265c23730 Alexander Aring 2023-07-20  781  	int rc;
385d3265c23730 Alexander Aring 2023-07-20  782  
385d3265c23730 Alexander Aring 2023-07-20  783  	spin_lock(&nlm_blocked_lock);
385d3265c23730 Alexander Aring 2023-07-20  784  	list_for_each_entry(block, &nlm_blocked, b_list) {
385d3265c23730 Alexander Aring 2023-07-20  785  		if (nlm_compare_locks(&block->b_call->a_args.lock.fl, fl)) {
385d3265c23730 Alexander Aring 2023-07-20  786  			kref_get(&block->b_count);
0e4ac9d93515b2 Marc Eshel      2006-11-28  787  			break;
0e4ac9d93515b2 Marc Eshel      2006-11-28  788  		}
0e4ac9d93515b2 Marc Eshel      2006-11-28  789  	}
f904be9cc77f36 Bryan Schumaker 2010-09-21  790  	spin_unlock(&nlm_blocked_lock);
385d3265c23730 Alexander Aring 2023-07-20  791  
385d3265c23730 Alexander Aring 2023-07-20  792  	if (!block) {
385d3265c23730 Alexander Aring 2023-07-20  793  		pr_warn("lockd: grant for unknown pending block\n");
385d3265c23730 Alexander Aring 2023-07-20  794  		return -ENOENT;
385d3265c23730 Alexander Aring 2023-07-20  795  	}
385d3265c23730 Alexander Aring 2023-07-20  796  
385d3265c23730 Alexander Aring 2023-07-20  797  	/* don't interfere with nlmsvc_lock() */
385d3265c23730 Alexander Aring 2023-07-20 @798  	mutex_lock(&block->b_file->f_mutex);
385d3265c23730 Alexander Aring 2023-07-20  799  	block->b_flags &= ~B_PENDING_CALLBACK;
385d3265c23730 Alexander Aring 2023-07-20  800  
385d3265c23730 Alexander Aring 2023-07-20  801  	spin_lock(&nlm_blocked_lock);
385d3265c23730 Alexander Aring 2023-07-20  802  	WARN_ON_ONCE(list_empty(&block->b_list));
385d3265c23730 Alexander Aring 2023-07-20  803  	rc = __nlmsvc_grant_deferred(block, fl, result);
385d3265c23730 Alexander Aring 2023-07-20  804  	spin_unlock(&nlm_blocked_lock);
385d3265c23730 Alexander Aring 2023-07-20  805  	mutex_unlock(&block->b_file->f_mutex);
385d3265c23730 Alexander Aring 2023-07-20  806  
385d3265c23730 Alexander Aring 2023-07-20  807  	nlmsvc_release_block(block);
0e4ac9d93515b2 Marc Eshel      2006-11-28  808  	return rc;
0e4ac9d93515b2 Marc Eshel      2006-11-28  809  }
0e4ac9d93515b2 Marc Eshel      2006-11-28  810  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
