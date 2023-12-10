Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6741A5B1
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Dec 2023 21:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z7QeczTh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702242787; x=1733778787;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KiEsXsthRwFPbFtd0cbECHRox18WLYf+Z9smQSAKZCs=;
  b=Z7QeczThu9dyeYSZ4D0AebU++pKTc+tVe7P+JDQbtRzCLTgsjrKV52hn
   3+QbPkO8415O+xUE1wREnrdmhKSSF/GoTK8d6iIFIkOm8Fqyl0mc2AsvR
   rxWE/5bZH8vmV9v7ULpZU9W4pqTMQgzezv+hau9tjmiXv9v1VD/0FXnQC
   xUMf1veOuB7/E4Zn1tb3M6G94fJ6TdpYaHmjPdUuGGPjm5MB+lKRwGVqt
   fqZ0tLUysTXGeHN6c+VMcTWuXa77t5K2C2iVzjM5wVTVDJLBRkDN/D/cR
   5TvnmbfcaRn/OH7eBbxdITAysJnatzpM/P0B06P+9YEeg/rWyMCcYCNXI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="458883500"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="458883500"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 13:13:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="20802521"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 10 Dec 2023 13:13:06 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCR6l-000HHC-33;
	Sun, 10 Dec 2023 21:13:03 +0000
Date: Mon, 11 Dec 2023 05:12:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/bcachefs/ec.h:107:57: sparse: sparse: invalid access past the end
 of 'p' (60 64)
Message-ID: <202312110407.bwOMVKqm-lkp@intel.com>
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
head:   3a87498869d6d1e7347cd01f337a77984604eb5e
commit: 2a3731e34de9365038b25d76bb6e11cf5c40ac36 bcachefs: Erasure coding fixes & refactoring
date:   7 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 7 weeks ago
config: powerpc-randconfig-r113-20231106 (https://download.01.org/0day-ci/archive/20231211/202312110407.bwOMVKqm-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231211/202312110407.bwOMVKqm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312110407.bwOMVKqm-lkp@intel.com/

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
   fs/bcachefs/ec.c: note: in included file (through include/linux/backing-dev-defs.h, fs/bcachefs/bcachefs.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

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
