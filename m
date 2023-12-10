Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92886749D
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Dec 2023 10:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GNVuNWN5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702205644; x=1733741644;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7/SUatfkcfaXxvuOEX5Q8yKgsSp70NCYQvYpTek8XVw=;
  b=GNVuNWN5nAfpwYNP2xa2XjAWLPLtIZohxF2sWPyDXdjSsgaPKFYCtQ9E
   N8BE2Sr59IuFWckuvcRlmq7k+PPhjRjupnszOZO8SmlsFg3up7tBNEhT/
   rAQ4WEXoX8vaae7d3I3VAXhGaUAn2aIZPeq5YZLtQOaVqIHsPrqJOjDwk
   275KjJcarDk59uFMY71ImxpXPzbrCINVtn4ruRtmu9A4jvnrs2mk1JjeV
   AodIECIzm+8M92mzTUcv4zgaFXB38Jn84RDWgaOedJApagetgBnFlCrlG
   jWdOidMilQ0SNeCAWra9Vn9NHe8PYxuUz2EwrshEXCjtc8c6r5BHqIInp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="394284643"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="394284643"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 02:54:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="772654107"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="772654107"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 10 Dec 2023 02:54:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCHRg-000Gjf-0o;
	Sun, 10 Dec 2023 10:54:00 +0000
Date: Sun, 10 Dec 2023 18:53:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/bcachefs/buckets.c:675:61: sparse: sparse: invalid access past
 the end of 'p' (4 8)
Message-ID: <202312101846.7NKixT0C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/bcachefs/buckets.c:675:61: sparse: sparse: invalid access past the end of 'p' (4 8)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kent Overstreet <kmo@daterainc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c527f5606aa545233a4d2c6d5c636ed82b8633ef
commit: cd575ddf57af004913ff5a994aa5f3203216fa68 bcachefs: Erasure coding
date:   7 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 7 weeks ago
config: powerpc-randconfig-r113-20231106 (https://download.01.org/0day-ci/archive/20231210/202312101846.7NKixT0C-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231210/202312101846.7NKixT0C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312101846.7NKixT0C-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/bcachefs/buckets.c:675:61: sparse: sparse: invalid access past the end of 'p' (4 8)
   fs/bcachefs/buckets.c: note: in included file (through fs/bcachefs/super.h, fs/bcachefs/buckets.h):
   fs/bcachefs/extents.h:273:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:273:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:273:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:287:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:287:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:287:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/extents.h:273:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:273:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:273:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:287:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:287:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:287:44: sparse:     got unsigned long long const [usertype] csum_hi:16

vim +/p +675 fs/bcachefs/buckets.c

1c6fdbd8f2465d Kent Overstreet 2017-03-16  645  
cd575ddf57af00 Kent Overstreet 2018-11-01  646  static void bch2_mark_stripe_ptr(struct bch_fs *c,
cd575ddf57af00 Kent Overstreet 2018-11-01  647  				 struct bch_extent_stripe_ptr p,
cd575ddf57af00 Kent Overstreet 2018-11-01  648  				 s64 sectors, unsigned flags,
cd575ddf57af00 Kent Overstreet 2018-11-01  649  				 s64 *adjusted_disk_sectors,
cd575ddf57af00 Kent Overstreet 2018-11-01  650  				 unsigned *redundancy)
cd575ddf57af00 Kent Overstreet 2018-11-01  651  {
cd575ddf57af00 Kent Overstreet 2018-11-01  652  	struct ec_stripe *m;
cd575ddf57af00 Kent Overstreet 2018-11-01  653  	unsigned old, new, nr_data;
cd575ddf57af00 Kent Overstreet 2018-11-01  654  	int blocks_nonempty_delta;
cd575ddf57af00 Kent Overstreet 2018-11-01  655  	s64 parity_sectors;
cd575ddf57af00 Kent Overstreet 2018-11-01  656  
cd575ddf57af00 Kent Overstreet 2018-11-01  657  	m = genradix_ptr(&c->ec_stripes, p.idx);
cd575ddf57af00 Kent Overstreet 2018-11-01  658  	if (WARN_ON(!m))
cd575ddf57af00 Kent Overstreet 2018-11-01  659  		return;
cd575ddf57af00 Kent Overstreet 2018-11-01  660  
cd575ddf57af00 Kent Overstreet 2018-11-01  661  	if (WARN_ON(!m->alive))
cd575ddf57af00 Kent Overstreet 2018-11-01  662  		return;
cd575ddf57af00 Kent Overstreet 2018-11-01  663  
cd575ddf57af00 Kent Overstreet 2018-11-01  664  	nr_data = m->nr_blocks - m->nr_redundant;
cd575ddf57af00 Kent Overstreet 2018-11-01  665  
cd575ddf57af00 Kent Overstreet 2018-11-01  666  	parity_sectors = DIV_ROUND_UP(abs(sectors) * m->nr_redundant, nr_data);
cd575ddf57af00 Kent Overstreet 2018-11-01  667  
cd575ddf57af00 Kent Overstreet 2018-11-01  668  	if (sectors < 0)
cd575ddf57af00 Kent Overstreet 2018-11-01  669  		parity_sectors = -parity_sectors;
cd575ddf57af00 Kent Overstreet 2018-11-01  670  
cd575ddf57af00 Kent Overstreet 2018-11-01  671  	*adjusted_disk_sectors += parity_sectors;
cd575ddf57af00 Kent Overstreet 2018-11-01  672  
cd575ddf57af00 Kent Overstreet 2018-11-01  673  	*redundancy = max_t(unsigned, *redundancy, m->nr_redundant + 1);
cd575ddf57af00 Kent Overstreet 2018-11-01  674  
cd575ddf57af00 Kent Overstreet 2018-11-01 @675  	new = atomic_add_return(sectors, &m->block_sectors[p.block]);
cd575ddf57af00 Kent Overstreet 2018-11-01  676  	old = new - sectors;
cd575ddf57af00 Kent Overstreet 2018-11-01  677  
cd575ddf57af00 Kent Overstreet 2018-11-01  678  	blocks_nonempty_delta = (int) !!new - (int) !!old;
cd575ddf57af00 Kent Overstreet 2018-11-01  679  	if (!blocks_nonempty_delta)
cd575ddf57af00 Kent Overstreet 2018-11-01  680  		return;
cd575ddf57af00 Kent Overstreet 2018-11-01  681  
cd575ddf57af00 Kent Overstreet 2018-11-01  682  	atomic_add(blocks_nonempty_delta, &m->blocks_nonempty);
cd575ddf57af00 Kent Overstreet 2018-11-01  683  
cd575ddf57af00 Kent Overstreet 2018-11-01  684  	BUG_ON(atomic_read(&m->blocks_nonempty) < 0);
cd575ddf57af00 Kent Overstreet 2018-11-01  685  
cd575ddf57af00 Kent Overstreet 2018-11-01  686  	bch2_stripes_heap_update(c, m, p.idx);
cd575ddf57af00 Kent Overstreet 2018-11-01  687  }
cd575ddf57af00 Kent Overstreet 2018-11-01  688  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
