Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AF72374D
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Jan 2024 09:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ffs+Db97"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704447155; x=1735983155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SqUysGxHHHL51ddn1Cg5NRUBqrN04S8wxcuF5U2h4h0=;
  b=Ffs+Db97a94wgWvEgj6DuHVAjXNXrlR5uzprJ7OeFGDGtxMUvk3tUNws
   3BNtZJCRfMXaqlhWXmk+7M4l5EUH3+AI/VFqtxsON7kgDdR2g4M7BYF8y
   FKqjw2Ri9W2jP++KO1dmRJO/nOwnqsNz9jqlM71+KRx0jfpOLBPh2giNk
   McDH0zC+5bgzmyS9tBY8JbPYC8yI1+AzL42u/t46e2BMrQQelQleD6rkY
   Otk3neithOfOG1oCU4TO3ZYlsChaerU4Q9N9lK4qv1bg12593td/e+gR5
   tVC35XBSbt8xc39O3FBxSvL3XvCZpw4ZZ0BwmQ1mnS4zBW+gOHBZRzMCH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="16091055"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="16091055"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 01:32:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="846529975"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="846529975"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 05 Jan 2024 01:32:33 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLgZ3-00013K-30;
	Fri, 05 Jan 2024 09:32:30 +0000
Date: Fri, 5 Jan 2024 17:32:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 3806/12662]
 drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c:6147:9-13: ERROR:
 invalid reference to the index variable of the iterator on line 6138
Message-ID: <202401051712.OFEzsF3k-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Suman Ghosh <sumang@marvell.com>
CC: Wojciech Drewek <wojciech.drewek@intel.com>
CC: Simon Horman <horms@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e2425464bc87159274879ab30f9d4fe624b9fcd2
commit: 51b2804c19cd79e9e4ee384a37796a1d243b8f3d [3806/12662] octeontx2-af: Add new mbox to support multicast/mirror offload
:::::: branch date: 3 hours ago
:::::: commit date: 5 weeks ago
config: arm64-randconfig-r053-20240104 (https://download.01.org/0day-ci/archive/20240105/202401051712.OFEzsF3k-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401051712.OFEzsF3k-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c:6147:9-13: ERROR: invalid reference to the index variable of the iterator on line 6138

vim +6147 drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c

51b2804c19cd79 Suman Ghosh 2023-11-30  6130  
51b2804c19cd79 Suman Ghosh 2023-11-30  6131  static struct nix_mcast_grp_elem *rvu_nix_mcast_find_grp_elem(struct nix_mcast_grp *mcast_grp,
51b2804c19cd79 Suman Ghosh 2023-11-30  6132  							      u32 mcast_grp_idx)
51b2804c19cd79 Suman Ghosh 2023-11-30  6133  {
51b2804c19cd79 Suman Ghosh 2023-11-30  6134  	struct nix_mcast_grp_elem *iter;
51b2804c19cd79 Suman Ghosh 2023-11-30  6135  	bool is_found = false;
51b2804c19cd79 Suman Ghosh 2023-11-30  6136  
51b2804c19cd79 Suman Ghosh 2023-11-30  6137  	mutex_lock(&mcast_grp->mcast_grp_lock);
51b2804c19cd79 Suman Ghosh 2023-11-30 @6138  	list_for_each_entry(iter, &mcast_grp->mcast_grp_head, list) {
51b2804c19cd79 Suman Ghosh 2023-11-30  6139  		if (iter->mcast_grp_idx == mcast_grp_idx) {
51b2804c19cd79 Suman Ghosh 2023-11-30  6140  			is_found = true;
51b2804c19cd79 Suman Ghosh 2023-11-30  6141  			break;
51b2804c19cd79 Suman Ghosh 2023-11-30  6142  		}
51b2804c19cd79 Suman Ghosh 2023-11-30  6143  	}
51b2804c19cd79 Suman Ghosh 2023-11-30  6144  	mutex_unlock(&mcast_grp->mcast_grp_lock);
51b2804c19cd79 Suman Ghosh 2023-11-30  6145  
51b2804c19cd79 Suman Ghosh 2023-11-30  6146  	if (is_found)
51b2804c19cd79 Suman Ghosh 2023-11-30 @6147  		return iter;
51b2804c19cd79 Suman Ghosh 2023-11-30  6148  
51b2804c19cd79 Suman Ghosh 2023-11-30  6149  	return NULL;
51b2804c19cd79 Suman Ghosh 2023-11-30  6150  }
51b2804c19cd79 Suman Ghosh 2023-11-30  6151  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
