Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245835FEF1
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Dec 2023 12:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ia1nh6I9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701780091; x=1733316091;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BMPO5q8urIYGZXEm+tf/VRx4oJrT5m5RK2lgRWLtJPw=;
  b=Ia1nh6I9SU96LaMTiSTeexXY9vGCYO9u1sYj90RlxlCNpFRCXdRrA6Y0
   hUz1adQuLbgOVLv+oym+ILGrMomnVwvnBsO9x18nz/E3F0dJdcobsqcBj
   r4Ak/anLLBxLsteAD50fxpPBWWUImDZVk3BKIlAza6lguAwQuL0YVa1Pq
   c3rLuSD2qtSgF50kzyaKVwvdbHJKVedrff5V3BQsxD9DYjPhqejt7udNY
   lfZIGRjB5nG+hLgVPrrBcRgdH2fFLC5tZAm6kpBxz3Sn75PQZeeJ0lxXo
   iC9sKYvx2KHUMl3AEOiCAsn4OdX01aPxxCI+1OCMHPidAt5gx1QtvvX0C
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="942090"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="942090"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 04:41:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="1018210040"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="1018210040"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 05 Dec 2023 04:41:29 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAUjv-0008yl-2M;
	Tue, 05 Dec 2023 12:41:27 +0000
Date: Tue, 5 Dec 2023 20:40:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/bcachefs/btree_gc.c:1443:12-13: WARNING opportunity for min()
Message-ID: <202312052013.Vxgm6EkD-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Kent Overstreet <kmo@daterainc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: 326568f18cb57ed95a420361da9a64330e122cda bcachefs: Convert bch2_gc_done() for_each_btree_key2()
date:   6 weeks ago
:::::: branch date: 15 hours ago
:::::: commit date: 6 weeks ago
config: x86_64-randconfig-104-20231204 (https://download.01.org/0day-ci/archive/20231205/202312052013.Vxgm6EkD-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20231205/202312052013.Vxgm6EkD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312052013.Vxgm6EkD-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/btree_gc.c:1443:12-13: WARNING opportunity for min()

vim +1443 fs/bcachefs/btree_gc.c

ec061b215d63b5 Kent Overstreet 2021-12-25  1416  
78c8fe20be12d0 Kent Overstreet 2022-02-19  1417  static int bch2_gc_alloc_done(struct bch_fs *c, bool metadata_only)
ec061b215d63b5 Kent Overstreet 2021-12-25  1418  {
ec061b215d63b5 Kent Overstreet 2021-12-25  1419  	struct btree_trans trans;
ec061b215d63b5 Kent Overstreet 2021-12-25  1420  	struct btree_iter iter;
ec061b215d63b5 Kent Overstreet 2021-12-25  1421  	struct bkey_s_c k;
ec061b215d63b5 Kent Overstreet 2021-12-25  1422  	struct bch_dev *ca;
ec061b215d63b5 Kent Overstreet 2021-12-25  1423  	unsigned i;
ec061b215d63b5 Kent Overstreet 2021-12-25  1424  	int ret = 0;
ec061b215d63b5 Kent Overstreet 2021-12-25  1425  
ec061b215d63b5 Kent Overstreet 2021-12-25  1426  	bch2_trans_init(&trans, c, 0, 0);
ec061b215d63b5 Kent Overstreet 2021-12-25  1427  
ec061b215d63b5 Kent Overstreet 2021-12-25  1428  	for_each_member_device(ca, c, i) {
326568f18cb57e Kent Overstreet 2022-07-17  1429  		ret = for_each_btree_key_commit(&trans, iter, BTREE_ID_alloc,
ec061b215d63b5 Kent Overstreet 2021-12-25  1430  				POS(ca->dev_idx, ca->mi.first_bucket),
326568f18cb57e Kent Overstreet 2022-07-17  1431  				BTREE_ITER_SLOTS|BTREE_ITER_PREFETCH, k,
326568f18cb57e Kent Overstreet 2022-07-17  1432  				NULL, NULL, BTREE_INSERT_LAZY_RW,
326568f18cb57e Kent Overstreet 2022-07-17  1433  			bch2_alloc_write_key(&trans, &iter, k, metadata_only));
ec061b215d63b5 Kent Overstreet 2021-12-25  1434  
326568f18cb57e Kent Overstreet 2022-07-17  1435  		if (ret < 0) {
ec061b215d63b5 Kent Overstreet 2021-12-25  1436  			bch_err(c, "error writing alloc info: %i", ret);
ec061b215d63b5 Kent Overstreet 2021-12-25  1437  			percpu_ref_put(&ca->ref);
ec061b215d63b5 Kent Overstreet 2021-12-25  1438  			break;
ec061b215d63b5 Kent Overstreet 2021-12-25  1439  		}
28062d320bded2 Kent Overstreet 2019-02-20  1440  	}
9ca53b55f74157 Kent Overstreet 2018-07-23  1441  
ec061b215d63b5 Kent Overstreet 2021-12-25  1442  	bch2_trans_exit(&trans);
326568f18cb57e Kent Overstreet 2022-07-17 @1443  	return ret < 0 ? ret : 0;
ec061b215d63b5 Kent Overstreet 2021-12-25  1444  }
ec061b215d63b5 Kent Overstreet 2021-12-25  1445  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
