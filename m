Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BE51BDE4
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Oct 2023 18:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y+VioduT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697222960; x=1728758960;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sFc0+kLBHALj0ccTnxRQGLkEKidT9VwRodU6WmzUjto=;
  b=Y+VioduT+nC1W+cRFRvNRiYrUtDB0qh+griDoZD4K5kZdEL/gjGhgRnI
   oRQIrbmUynQBijvK15K6oUWf/HZZQ3CYqEFGNvT1p3kr6fmSuP5zvLlED
   A7cX8gRqzlSJ9YVwm/f1pWmWznGMoS6yoDEU420jz/sdM8zZZ/PSHvavA
   j85hLxsVMX2ja8fZ3zbp2h0SWtMIPSsJNekkP1iY8SwAtGKCD9EXef/f/
   Zq9szNG0NPrKn5Bqe8W6IkxlChH3s9Ex75I4r/SJvNurdCzkad/iQII0e
   2ijghP6tE4DqQDWllntuURpRDF7VDZtCWkVFOCqv536wFDS0tLCHjGUmG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="382467907"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="382467907"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 11:49:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="748444547"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="748444547"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 13 Oct 2023 11:49:18 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrNDl-0005HQ-1q;
	Fri, 13 Oct 2023 18:49:14 +0000
Date: Sat, 14 Oct 2023 02:48:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [paulmck-rcu:dev.2023.10.11a 7/28]
 kernel/locking/locktorture.c:127:23: sparse: sparse: symbol
 'call_rcu_chain_list' was not declared. Should it be static?
Message-ID: <202310140239.v2DbvjD5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "commit 5fabbc8a9e4cdf1b4d747c24f8fb87917f8bcc0f was found in branch paulmck-rcu/dev.2023.10.11a, not in new branch paulmck-rcu/dev.2023.10.12a"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Paul E. McKenney" <paulmck@kernel.org>
CC: Davidlohr Bueso <dave@stgolabs.net>
CC: Josh Triplett <josh@joshtriplett.org>
CC: linux-kernel@vger.kernel.org

Hi Paul,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2023.10.11a
head:   e385d958216d4f45adc641f0818ac117b0fb2439
commit: 5fabbc8a9e4cdf1b4d747c24f8fb87917f8bcc0f [7/28] locktorture: Increase Hamming distance between call_rcu_chain and rcu_call_chains
:::::: branch date: 25 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-063-20231013 (https://download.01.org/0day-ci/archive/20231014/202310140239.v2DbvjD5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140239.v2DbvjD5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310140239.v2DbvjD5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/locking/locktorture.c:127:23: sparse: sparse: symbol 'call_rcu_chain_list' was not declared. Should it be static?
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
