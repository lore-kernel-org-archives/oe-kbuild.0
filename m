Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489F82569
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Nov 2023 22:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wia7bYr3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699225128; x=1730761128;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rFiqajhGpzUNdnaD8J8SdpWhzkhG9CMm9nE96YrzlsQ=;
  b=Wia7bYr3AYELp6xOZcC+eSM+8emmsfiSh3YyHyqrjAI9Ha/h+g9oHDVD
   xsrdzGtgvnx9BDOlvGHWSPChe3VfA9gqpsIKHqF4PURvVZVAu0FVriCjS
   DauVd8pXUccD3EBSPCYiIYJmxAryfSz9prb1E06xZYUreRKw8bjUgAGkm
   bEBJJKKoP3WLTpozA3bnbuUTUMsWgKfpS4B23nfN9+hodlqvndpsB4bqB
   u+TAHoJ3qW5q3rIz4mPvjqVb47oUxxt7StrzjxtmDx4HY/x+DZZ9wyHMQ
   cE7T0U4Pr66GRS6PTIXSsfp8y4/CcvTKaUpI2scCebKFb1BS2Pa6RbO5i
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="388064919"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="388064919"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 14:58:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="1093600485"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="1093600485"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 05 Nov 2023 14:58:48 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzm4s-0005rh-2P;
	Sun, 05 Nov 2023 22:58:46 +0000
Date: Mon, 6 Nov 2023 06:57:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [paulmck-rcu:dev.2023.11.01a 19/37]
 kernel/locking/locktorture.c:275:13: warning: no previous prototype for
 'spinlock_dump'
Message-ID: <202311060634.jnAYK0Ym-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "commit 49fa6207171484b2fcbf951213e854475e59ac49 was found in branch paulmck-rcu/dev.2023.11.01a, not in new branch paulmck-rcu/dev.2023.11.02a"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2023.11.01a
head:   20f4197bb35ccf39ddfb8563865092eb09450556
commit: 49fa6207171484b2fcbf951213e854475e59ac49 [19/37] EXP locktorture: invoke spinlock_dump() to dump lock state
:::::: branch date: 3 days ago
:::::: commit date: 3 weeks ago
config: i386-buildonly-randconfig-001-20231101 (https://download.01.org/0day-ci/archive/20231106/202311060634.jnAYK0Ym-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311060634.jnAYK0Ym-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311060634.jnAYK0Ym-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/locking/locktorture.c:275:13: warning: no previous prototype for 'spinlock_dump' [-Wmissing-prototypes]
     275 | void __weak spinlock_dump(spinlock_t *sp, bool full)
         |             ^~~~~~~~~~~~~


vim +/spinlock_dump +275 kernel/locking/locktorture.c

0af3fe1efa534a Paul E. McKenney 2014-02-04  274  
49fa6207171484 Paul E. McKenney 2023-09-05 @275  void __weak spinlock_dump(spinlock_t *sp, bool full)
49fa6207171484 Paul E. McKenney 2023-09-05  276  {
49fa6207171484 Paul E. McKenney 2023-09-05  277  	pr_alert("%s __weak stub invoked.\n", __func__);
49fa6207171484 Paul E. McKenney 2023-09-05  278  }
49fa6207171484 Paul E. McKenney 2023-09-05  279  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
