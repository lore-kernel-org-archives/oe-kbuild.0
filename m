Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403A68494
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Dec 2023 16:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ddsdpC9m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702224457; x=1733760457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7SVbAkV3JIDe9A3Grtn4tcDIPb9O+XQ6E7rIqu0unMQ=;
  b=ddsdpC9mh+pEi2AyV286PzDwVbanHvc0SnaUyAPA0QDmVEvfffaUQ1qx
   vIb6hykjvgHlptzSvJ/clW1kaqmSk5DbyXMuiTzPxVlX+IndnbAlP75sF
   t5VkG7Gm8XfkSnPegL8/Qp96TMwcUKThVHW4Llh3vPpPZmOlMM2k0CjDz
   B7wV13Q9DxbGMByd+nXKF19uZKKviTlb82gR7nFR82a1kbLbPAXN6fRb8
   nLxYxyv98iWmK9wAdYiKqrpJVzjJsIsIEmCRkj35+o1SzoumbeGY5Cvib
   B0xFmD9Fm+9gM4Kr7KsNldIURAQRBj4JYaMx98sYA7gBmQ2VdNidvVP3X
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="397353367"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="397353367"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 08:07:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="843209426"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="843209426"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 10 Dec 2023 08:07:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCML7-000H0U-1D;
	Sun, 10 Dec 2023 16:07:33 +0000
Date: Mon, 11 Dec 2023 00:06:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/bcachefs/ec.c:726:35: sparse: sparse: invalid access past the end
 of '<noident>' (4 8)
Message-ID: <202312110021.3CmpbZpQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/bcachefs/ec.c:726:35: sparse: sparse: invalid access past the end of '<noident>' (4 8)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kent Overstreet <kmo@daterainc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c527f5606aa545233a4d2c6d5c636ed82b8633ef
commit: 0564b16782b39d6f59e06f427f32826db69e75a2 bcachefs: convert bch2_btree_insert_at() usage to bch2_trans_commit()
date:   7 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 7 weeks ago
config: powerpc-randconfig-r113-20231106 (https://download.01.org/0day-ci/archive/20231211/202312110021.3CmpbZpQ-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231211/202312110021.3CmpbZpQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312110021.3CmpbZpQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/ec.c: note: in included file (through fs/bcachefs/bcachefs.h):
   fs/bcachefs/bcachefs_format.h:1046:45: sparse: sparse: array of flexible structures
   fs/bcachefs/bcachefs_format.h:1058:42: sparse: sparse: array of flexible structures
   fs/bcachefs/ec.c:369:26: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted blk_opf_t [usertype] opf @@     got unsigned int rw @@
   fs/bcachefs/ec.c:369:26: sparse:     expected restricted blk_opf_t [usertype] opf
   fs/bcachefs/ec.c:369:26: sparse:     got unsigned int rw
   fs/bcachefs/ec.c: note: in included file:
   fs/bcachefs/bcachefs.h:712:9: sparse: sparse: array of flexible structures
   fs/bcachefs/ec.c:369:26: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted blk_opf_t [usertype] opf @@     got unsigned int rw @@
   fs/bcachefs/ec.c:369:26: sparse:     expected restricted blk_opf_t [usertype] opf
   fs/bcachefs/ec.c:369:26: sparse:     got unsigned int rw
   fs/bcachefs/ec.c:369:26: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted blk_opf_t [usertype] opf @@     got unsigned int rw @@
   fs/bcachefs/ec.c:369:26: sparse:     expected restricted blk_opf_t [usertype] opf
   fs/bcachefs/ec.c:369:26: sparse:     got unsigned int rw
   fs/bcachefs/ec.c:475:37: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int rw @@     got restricted blk_opf_t @@
   fs/bcachefs/ec.c:475:37: sparse:     expected unsigned int rw
   fs/bcachefs/ec.c:475:37: sparse:     got restricted blk_opf_t
   fs/bcachefs/ec.c:823:44: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int rw @@     got restricted blk_opf_t @@
   fs/bcachefs/ec.c:823:44: sparse:     expected unsigned int rw
   fs/bcachefs/ec.c:823:44: sparse:     got restricted blk_opf_t
>> fs/bcachefs/ec.c:726:35: sparse: sparse: invalid access past the end of '<noident>' (4 8)
   fs/bcachefs/ec.c: note: in included file (through include/linux/backing-dev-defs.h, fs/bcachefs/bcachefs.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +726 fs/bcachefs/ec.c

cd575ddf57af00 Kent Overstreet 2018-11-01  712  
cd575ddf57af00 Kent Overstreet 2018-11-01  713  static void extent_stripe_ptr_add(struct bkey_s_extent e,
cd575ddf57af00 Kent Overstreet 2018-11-01  714  				  struct ec_stripe_buf *s,
cd575ddf57af00 Kent Overstreet 2018-11-01  715  				  struct bch_extent_ptr *ptr,
cd575ddf57af00 Kent Overstreet 2018-11-01  716  				  unsigned block)
cd575ddf57af00 Kent Overstreet 2018-11-01  717  {
cd575ddf57af00 Kent Overstreet 2018-11-01  718  	struct bch_extent_stripe_ptr *dst = (void *) ptr;
cd575ddf57af00 Kent Overstreet 2018-11-01  719  	union bch_extent_entry *end = extent_entry_last(e);
cd575ddf57af00 Kent Overstreet 2018-11-01  720  
cd575ddf57af00 Kent Overstreet 2018-11-01  721  	memmove_u64s_up(dst + 1, dst, (u64 *) end - (u64 *) dst);
cd575ddf57af00 Kent Overstreet 2018-11-01  722  	e.k->u64s += sizeof(*dst) / sizeof(u64);
cd575ddf57af00 Kent Overstreet 2018-11-01  723  
cd575ddf57af00 Kent Overstreet 2018-11-01  724  	*dst = (struct bch_extent_stripe_ptr) {
cd575ddf57af00 Kent Overstreet 2018-11-01  725  		.type = 1 << BCH_EXTENT_ENTRY_stripe_ptr,
cd575ddf57af00 Kent Overstreet 2018-11-01 @726  		.block		= block,
cd575ddf57af00 Kent Overstreet 2018-11-01  727  		.idx		= s->key.k.p.offset,
cd575ddf57af00 Kent Overstreet 2018-11-01  728  	};
cd575ddf57af00 Kent Overstreet 2018-11-01  729  }
cd575ddf57af00 Kent Overstreet 2018-11-01  730  

:::::: The code at line 726 was first introduced by commit
:::::: cd575ddf57af004913ff5a994aa5f3203216fa68 bcachefs: Erasure coding

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
