Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445B2C8C4
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Nov 2023 05:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WRZhq+MP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699422136; x=1730958136;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6AW1FME5zgYuuuGouI8qG5+of0CVEgsL3+OkoRNfG4w=;
  b=WRZhq+MPkRuCM2bFjDC6TyR7/9dmu918mHm9xq6NIG7hfJ7lwobjyTjV
   AHKjdIrVB93NAIQk6c0GKcbFBnQj8+ubfo5IFDNcZ1n3Q2h/2b+hoFbo0
   hL5FdYlBytdKcX7H0IgKcs/hUTQhnm70fFGjoIz9jiVP7qX02iytv2NHe
   +DITuzCulN8LJQ7Hsw/P1bywuXTPRHGsg/z6ak6XET3Dj3R8S2YFRwvYg
   QyBS1fqdqpOl5P1jUbE/36hJgYqt+PkpbiNCdkAa5rzRIg5/Qavvv/zR1
   zoZTAfG0/BSYRba2sZH4m11NrDHU6JAw9xjSH7Pm+QS5j9K2yrmBPCbX3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="8346503"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="8346503"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 21:42:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="712830652"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="712830652"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Nov 2023 21:42:14 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0bKO-0007ho-1c;
	Wed, 08 Nov 2023 05:42:12 +0000
Date: Wed, 8 Nov 2023 13:40:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/bcachefs/ec.h:107:57: sparse: sparse: invalid access past the end
 of 'p' (60 64)
Message-ID: <202311081255.mhMmNu4f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/bcachefs/ec.h:107:57: sparse: sparse: invalid access past the end of 'p' (60 64)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kent Overstreet <kmo@daterainc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   305230142ae0637213bf6e04f6d9f10bbcb74af8
commit: 2a3731e34de9365038b25d76bb6e11cf5c40ac36 bcachefs: Erasure coding fixes & refactoring
date:   2 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 2 weeks ago
config: powerpc-randconfig-r113-20231106 (https://download.01.org/0day-ci/archive/20231108/202311081255.mhMmNu4f-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231108/202311081255.mhMmNu4f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311081255.mhMmNu4f-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/buckets.c: note: in included file:
   fs/bcachefs/bcachefs.h:780:9: sparse: sparse: array of flexible structures
   fs/bcachefs/buckets.c: note: in included file (through fs/bcachefs/btree_types.h, fs/bcachefs/bcachefs.h):
   fs/bcachefs/buckets_types.h:112:34: sparse: sparse: array of flexible structures
   fs/bcachefs/buckets.c:1555:49: sparse: sparse: mixing different enum types:
   fs/bcachefs/buckets.c:1555:49: sparse:    unsigned int enum btree_id
   fs/bcachefs/buckets.c:1555:49: sparse:    unsigned int enum btree_node_type
   fs/bcachefs/buckets.c:1121:27: sparse: sparse: invalid access past the end of 'p' (4 8)
   fs/bcachefs/buckets.c: note: in included file (through fs/bcachefs/super.h, fs/bcachefs/buckets.h):
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/buckets.c: note: in included file:
>> fs/bcachefs/ec.h:107:57: sparse: sparse: invalid access past the end of 'p' (60 64)
   fs/bcachefs/buckets.c:1695:42: sparse: sparse: invalid access past the end of 'p' (60 64)
   fs/bcachefs/buckets.c: note: in included file (through fs/bcachefs/super.h, fs/bcachefs/buckets.h):
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
--
   fs/bcachefs/ec.c: note: in included file (through fs/bcachefs/bcachefs.h):
   fs/bcachefs/bcachefs_format.h:1063:45: sparse: sparse: array of flexible structures
   fs/bcachefs/bcachefs_format.h:1078:42: sparse: sparse: array of flexible structures
   fs/bcachefs/ec.c:384:26: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted blk_opf_t [usertype] opf @@     got unsigned int rw @@
   fs/bcachefs/ec.c:384:26: sparse:     expected restricted blk_opf_t [usertype] opf
   fs/bcachefs/ec.c:384:26: sparse:     got unsigned int rw
   fs/bcachefs/ec.c: note: in included file:
   fs/bcachefs/bcachefs.h:780:9: sparse: sparse: array of flexible structures
   fs/bcachefs/ec.c:384:26: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted blk_opf_t [usertype] opf @@     got unsigned int rw @@
   fs/bcachefs/ec.c:384:26: sparse:     expected restricted blk_opf_t [usertype] opf
   fs/bcachefs/ec.c:384:26: sparse:     got unsigned int rw
   fs/bcachefs/ec.c:384:26: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted blk_opf_t [usertype] opf @@     got unsigned int rw @@
   fs/bcachefs/ec.c:384:26: sparse:     expected restricted blk_opf_t [usertype] opf
   fs/bcachefs/ec.c:384:26: sparse:     got unsigned int rw
   fs/bcachefs/ec.c:482:37: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int rw @@     got restricted blk_opf_t @@
   fs/bcachefs/ec.c:482:37: sparse:     expected unsigned int rw
   fs/bcachefs/ec.c:482:37: sparse:     got restricted blk_opf_t
   fs/bcachefs/ec.c:878:48: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int rw @@     got restricted blk_opf_t @@
   fs/bcachefs/ec.c:878:48: sparse:     expected unsigned int rw
   fs/bcachefs/ec.c:878:48: sparse:     got restricted blk_opf_t
   fs/bcachefs/ec.c:1188:23: sparse: sparse: symbol '__bch2_ec_stripe_head_get' was not declared. Should it be static?
   fs/bcachefs/ec.c: note: in included file:
>> fs/bcachefs/ec.h:107:57: sparse: sparse: invalid access past the end of 'p' (60 64)
   fs/bcachefs/ec.c:756:35: sparse: sparse: invalid access past the end of '<noident>' (4 8)

vim +/p +107 fs/bcachefs/ec.h

2a3731e34de936 Kent Overstreet 2021-01-11  101  
2a3731e34de936 Kent Overstreet 2021-01-11  102  static inline bool bch2_ptr_matches_stripe(const struct bch_stripe *s,
2a3731e34de936 Kent Overstreet 2021-01-11  103  					   struct extent_ptr_decoded p)
2a3731e34de936 Kent Overstreet 2021-01-11  104  {
2a3731e34de936 Kent Overstreet 2021-01-11  105  	BUG_ON(!p.has_ec);
2a3731e34de936 Kent Overstreet 2021-01-11  106  
2a3731e34de936 Kent Overstreet 2021-01-11 @107  	return __bch2_ptr_matches_stripe(s, &p.ptr, p.ec.block);
61c8d7c8eb0e01 Kent Overstreet 2018-11-25  108  }
61c8d7c8eb0e01 Kent Overstreet 2018-11-25  109  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
