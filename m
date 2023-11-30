Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C228E51C2E
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Nov 2023 14:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UaJAuMfR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701356364; x=1732892364;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UFlFsqWuiHra6yNao3Y7lDmTMnBx+3pGx+9I/uhQalY=;
  b=UaJAuMfRMOzouy4FvuW79DZBIrNBxE5fxlfaJHmKrYUcRZnDT0UEAr10
   4FF3ADOtL5VjxFi5Gl+YiJGEqUpY1ttf2BS27YAj8pm+V2Lc86bJ0RZ1F
   Xk+fZ275pcKPhzih60ScE/PQ2mQWqYCvlDY3T928+ZXFGQj0YkBYOQ4wI
   67E9GslBuFOgS2vdROrydFQSGEebLYalDxIhlZM4iANskanT2oOC4Laol
   tGM0zApJxeWiyrHlpzeHVF6TO7A1YphBQOzzoREH+8TvCPy7hWWJZXk5A
   Jl+Sp6mTcVASySp8aY9fNN54j3sOe0ckdzV2dZhFiobP07zA35k8iKpX5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="393075927"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="393075927"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 06:59:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="769337104"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="769337104"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 30 Nov 2023 06:59:22 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8iVa-000295-2T;
	Thu, 30 Nov 2023 14:59:19 +0000
Date: Thu, 30 Nov 2023 22:58:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [paulmck-rcu:dev.2023.10.11a 7/28]
 kernel/locking/locktorture.c:127:23: sparse: sparse: symbol
 'call_rcu_chain_list' was not declared. Should it be static?
Message-ID: <202311302248.667zLxFb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "commit 5fabbc8a9e4cdf1b4d747c24f8fb87917f8bcc0f was found in branch paulmck-rcu/dev.2023.10.11a, not in new branch paulmck-rcu/dev.2023.11.03a"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Paul E. McKenney" <paulmck@kernel.org>

Hi Paul,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2023.10.11a
head:   e8cc1332908682b309968c50157c6b272a0cafae
commit: 5fabbc8a9e4cdf1b4d747c24f8fb87917f8bcc0f [7/28] locktorture: Increase Hamming distance between call_rcu_chain and rcu_call_chains
:::::: branch date: 3 weeks ago
:::::: commit date: 7 weeks ago
config: i386-randconfig-063-20231013 (https://download.01.org/0day-ci/archive/20231130/202311302248.667zLxFb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311302248.667zLxFb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311302248.667zLxFb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/locking/locktorture.c:127:23: sparse: sparse: symbol 'call_rcu_chain_list' was not declared. Should it be static?
   kernel/locking/locktorture.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   kernel/locking/locktorture.c:496:12: sparse: sparse: context imbalance in 'torture_mutex_lock' - wrong count at exit
   kernel/locking/locktorture.c:512:13: sparse: sparse: context imbalance in 'torture_mutex_unlock' - wrong count at exit
   kernel/locking/locktorture.c:570:12: sparse: sparse: context imbalance in 'torture_ww_mutex_lock' - wrong count at exit
   kernel/locking/locktorture.c: note: in included file:
   include/linux/ww_mutex.h:191:9: sparse: sparse: context imbalance in 'torture_ww_mutex_unlock' - wrong count at exit
   kernel/locking/locktorture.c:665:12: sparse: sparse: context imbalance in 'torture_rtmutex_lock' - wrong count at exit
   kernel/locking/locktorture.c:689:13: sparse: sparse: context imbalance in 'torture_rtmutex_unlock' - wrong count at exit
   kernel/locking/locktorture.c:729:12: sparse: sparse: context imbalance in 'torture_rwsem_down_write' - wrong count at exit
   kernel/locking/locktorture.c:745:13: sparse: sparse: context imbalance in 'torture_rwsem_up_write' - wrong count at exit
   kernel/locking/locktorture.c:751:12: sparse: sparse: context imbalance in 'torture_rwsem_down_read' - wrong count at exit
   kernel/locking/locktorture.c:769:13: sparse: sparse: context imbalance in 'torture_rwsem_up_read' - wrong count at exit
   kernel/locking/locktorture.c:799:12: sparse: sparse: context imbalance in 'torture_percpu_rwsem_down_write' - wrong count at exit
   kernel/locking/locktorture.c:806:13: sparse: sparse: context imbalance in 'torture_percpu_rwsem_up_write' - wrong count at exit
   kernel/locking/locktorture.c: note: in included file:
   include/linux/percpu-rwsem.h:70:9: sparse: sparse: context imbalance in 'torture_percpu_rwsem_down_read' - wrong count at exit
   include/linux/percpu-rwsem.h:121:9: sparse: sparse: context imbalance in 'torture_percpu_rwsem_up_read' - wrong count at exit

vim +/call_rcu_chain_list +127 kernel/locking/locktorture.c

0af3fe1efa534a4 Paul E. McKenney 2014-02-04  122  
7f993623e9ebcd6 Paul E. McKenney 2023-08-21  123  struct call_rcu_chain {
7f993623e9ebcd6 Paul E. McKenney 2023-08-21  124  	struct rcu_head crc_rh;
7f993623e9ebcd6 Paul E. McKenney 2023-08-21  125  	bool crc_stop;
7f993623e9ebcd6 Paul E. McKenney 2023-08-21  126  };
5fabbc8a9e4cdf1 Paul E. McKenney 2023-10-10 @127  struct call_rcu_chain *call_rcu_chain_list;
7f993623e9ebcd6 Paul E. McKenney 2023-08-21  128  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
