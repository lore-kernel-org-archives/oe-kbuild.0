Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E00E10E7
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Oct 2023 00:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f1TBvdJr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696552696; x=1728088696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DGM74tZ6WqwnlUZl9HVZYBMHr65zs5rQAQ54MFRc69E=;
  b=f1TBvdJrysGR9fQgsPiD41VH0a4Y1OYcvxcGdZRkQVbjYpaPz9kpOi7h
   5TXmFR8/bBn4mWkDeHx16PyYFYFwm4BhX6AqoVOVh0aBaNUbizGN2eARe
   sdCOlOvPySV+HORLiJvSiDEPHiQ0sBmAsUwSBypr7R8kqT54KM70StIfS
   kwO6cE85KZCT3oj0/x9mnP4pQCnfICU486yP4XfXrez5sQXmHpMn6jOJH
   yGP6fS8fbnyYphic0BdZkEQ/c3OuVkp84nU2vK5y30dyeXgOQv2XgSx9N
   ILWOcg2XsGkGwKggSO7g2Ck/Tp+y5p6+YFDqJUG7Ma599bA+newbzCvED
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="382526487"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="382526487"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 17:38:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="875759743"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="875759743"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 05 Oct 2023 17:38:13 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoYr5-000M40-0f;
	Fri, 06 Oct 2023 00:38:11 +0000
Date: Fri, 6 Oct 2023 08:37:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-6.1 4/12]
 net/netfilter/nf_conntrack_core.c:1711 nf_conntrack_free() error: double
 free of 'ct'
Message-ID: <202310060846.eU93Ao5u-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   324c8522f9cd2966429f11325d5b4f25d435d272
commit: 4ef54c6ff720c4450318962493f3ee4f7f023896 [4/12] ANDROID: GKI: net: add vendor hooks for 'struct nf_conn' lifecycle
:::::: branch date: 16 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-161-20231004 (https://download.01.org/0day-ci/archive/20231006/202310060846.eU93Ao5u-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231006/202310060846.eU93Ao5u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310060846.eU93Ao5u-lkp@intel.com/

New smatch warnings:
net/netfilter/nf_conntrack_core.c:1711 nf_conntrack_free() error: double free of 'ct'

Old smatch warnings:
net/netfilter/nf_conntrack_core.c:1437 early_drop() error: uninitialized symbol 'bucket'.

vim +/ct +1711 net/netfilter/nf_conntrack_core.c

9fb9cbb1082d6b Yasuyuki Kozakai        2005-11-09  1685  
c88130bcd546e7 Patrick McHardy         2008-01-31  1686  void nf_conntrack_free(struct nf_conn *ct)
76507f69c44ed1 Patrick McHardy         2008-01-31  1687  {
1d45209d89e647 Eric Dumazet            2009-03-24  1688  	struct net *net = nf_ct_net(ct);
c53bd0e96662c2 Florian Westphal        2021-04-12  1689  	struct nf_conntrack_net *cnet;
1d45209d89e647 Eric Dumazet            2009-03-24  1690  
e53376bef2cd97 Pablo Neira Ayuso       2014-02-03  1691  	/* A freed object has refcnt == 0, that's
5f0d5a3ae7cff0 Paul E. McKenney        2017-01-18  1692  	 * the golden rule for SLAB_TYPESAFE_BY_RCU
e53376bef2cd97 Pablo Neira Ayuso       2014-02-03  1693  	 */
719774377622bc Florian Westphal        2022-01-07  1694  	WARN_ON(refcount_read(&ct->ct_general.use) != 0);
e53376bef2cd97 Pablo Neira Ayuso       2014-02-03  1695  
1bc91a5ddf3eae Florian Westphal        2022-01-20  1696  	if (ct->status & IPS_SRC_NAT_DONE) {
1bc91a5ddf3eae Florian Westphal        2022-01-20  1697  		const struct nf_nat_hook *nat_hook;
1bc91a5ddf3eae Florian Westphal        2022-01-20  1698  
1bc91a5ddf3eae Florian Westphal        2022-01-20  1699  		rcu_read_lock();
1bc91a5ddf3eae Florian Westphal        2022-01-20  1700  		nat_hook = rcu_dereference(nf_nat_hook);
1bc91a5ddf3eae Florian Westphal        2022-01-20  1701  		if (nat_hook)
1bc91a5ddf3eae Florian Westphal        2022-01-20  1702  			nat_hook->remove_nat_bysrc(ct);
1bc91a5ddf3eae Florian Westphal        2022-01-20  1703  		rcu_read_unlock();
1bc91a5ddf3eae Florian Westphal        2022-01-20  1704  	}
1bc91a5ddf3eae Florian Westphal        2022-01-20  1705  
1bc91a5ddf3eae Florian Westphal        2022-01-20  1706  	kfree(ct->ext);
0c5366b3a8c77f Florian Westphal        2016-05-09  1707  	kmem_cache_free(nf_conntrack_cachep, ct);
0418b989a46788 Pablo Neira Ayuso       2021-06-02  1708  	cnet = nf_ct_pernet(net);
c53bd0e96662c2 Florian Westphal        2021-04-12  1709  
4e857c58efeb99 Peter Zijlstra          2014-03-17  1710  	smp_mb__before_atomic();
4ef54c6ff720c4 Vignesh Saravanaperumal 2021-07-08 @1711  	trace_android_rvh_nf_conn_free(ct);
c53bd0e96662c2 Florian Westphal        2021-04-12  1712  	atomic_dec(&cnet->count);
76507f69c44ed1 Patrick McHardy         2008-01-31  1713  }
13b18339102052 Patrick McHardy         2006-12-02  1714  EXPORT_SYMBOL_GPL(nf_conntrack_free);
9fb9cbb1082d6b Yasuyuki Kozakai        2005-11-09  1715  
c539f01717c239 Florian Westphal        2013-01-11  1716  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
