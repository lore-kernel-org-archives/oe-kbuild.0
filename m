Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD7C7E
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Nov 2023 00:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HtLRHmUZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700095268; x=1731631268;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8OIJRaNU7CuDr+nMhQkzwVvYCTBByY5zJje5K4eNPwY=;
  b=HtLRHmUZLV4IifnBbSo3TabVuaOAHv529adI6rfzgG+KVdBa8IRPbgG5
   Kjhgs0PXIolEQLU3RoLq9BNKdYbvOatHoyg6wH47MfHSzj6ZnwThHL5Dw
   11+8DByQ0USVtChzM6DfdSrn6HTKESBVq6Ic1sImeKbj1nVZL6N5GXVd4
   b+Vvhg6HOqs+GE1C9fPVn7F/OIVlmOHjMgKj4fdGW/I+Xdiadixgl+Hen
   aZjFeL/XK0K4VspiB0jJjZzE/GjyCzfh6K/HHdkxBgNvgVPVJnlBdXoj8
   0zWVVTgDR8/p5dGJcw0aIYKUXf8hvUVXAb5bJtC3r78Or2cZErglduAoX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="393836219"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="393836219"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 16:41:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="715026420"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="715026420"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 15 Nov 2023 16:41:05 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3QRK-00013R-0T;
	Thu, 16 Nov 2023 00:41:02 +0000
Date: Thu, 16 Nov 2023 08:39:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/bcachefs/bset.h:303:9: sparse: sparse: self-comparison always
 evaluates to false
Message-ID: <202311160807.grnMbMEK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/bcachefs/bset.h:303:9: sparse: sparse: self-comparison always evaluates to false"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kent Overstreet <kmo@daterainc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: 1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a bcachefs: Initial commit
date:   3 weeks ago
:::::: branch date: 20 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-121-20231114 (https://download.01.org/0day-ci/archive/20231116/202311160807.grnMbMEK-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311160807.grnMbMEK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311160807.grnMbMEK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/bset.c: note: in included file:
>> fs/bcachefs/bset.h:303:9: sparse: sparse: self-comparison always evaluates to false
--
   fs/bcachefs/btree_io.c: note: in included file (through fs/bcachefs/bcachefs.h):
   fs/bcachefs/bcachefs_format.h:1022:42: sparse: sparse: array of flexible structures
   fs/bcachefs/btree_io.c: note: in included file (through fs/bcachefs/btree_io.h):
>> fs/bcachefs/bset.h:303:9: sparse: sparse: self-comparison always evaluates to false
>> fs/bcachefs/bset.h:303:9: sparse: sparse: self-comparison always evaluates to false
   fs/bcachefs/btree_io.c: note: in included file (through include/linux/backing-dev-defs.h, fs/bcachefs/bcachefs.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   fs/bcachefs/btree_io.c: note: in included file (through fs/bcachefs/btree_cache.h):
   fs/bcachefs/extents.h:287:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:287:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:287:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:301:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:301:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:301:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/extents.h:287:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:287:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:287:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:301:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:301:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:301:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/extents.h:287:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:287:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:287:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:301:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:301:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:301:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/extents.h:287:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:287:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:287:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:301:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:301:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:301:44: sparse:     got unsigned long long const [usertype] csum_hi:16
--
   fs/bcachefs/btree_update_interior.c: note: in included file (through fs/bcachefs/bcachefs.h):
   fs/bcachefs/bcachefs_format.h:1022:42: sparse: sparse: array of flexible structures
   fs/bcachefs/btree_update_interior.c: note: in included file (through fs/bcachefs/btree_cache.h):
   fs/bcachefs/extents.h:287:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:287:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:287:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:301:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:301:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:301:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/extents.h:287:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:287:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:287:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:301:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:301:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:301:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/btree_update_interior.c: note: in included file (through include/linux/backing-dev-defs.h, fs/bcachefs/bcachefs.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   fs/bcachefs/btree_update_interior.c: note: in included file (through fs/bcachefs/btree_io.h, fs/bcachefs/btree_locking.h, fs/bcachefs/btree_update_interior.h):
>> fs/bcachefs/bset.h:303:9: sparse: sparse: self-comparison always evaluates to false
>> fs/bcachefs/bset.h:303:9: sparse: sparse: self-comparison always evaluates to false
   fs/bcachefs/btree_update_interior.c: note: in included file (through include/linux/backing-dev-defs.h, fs/bcachefs/bcachefs.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   fs/bcachefs/btree_update_interior.c: note: in included file (through fs/bcachefs/btree_io.h, fs/bcachefs/btree_locking.h, fs/bcachefs/btree_update_interior.h):
>> fs/bcachefs/bset.h:303:9: sparse: sparse: self-comparison always evaluates to false
>> fs/bcachefs/bset.h:303:9: sparse: sparse: self-comparison always evaluates to false
   fs/bcachefs/btree_update_interior.c: note: in included file (through include/linux/backing-dev-defs.h, fs/bcachefs/bcachefs.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   fs/bcachefs/btree_update_interior.c: note: in included file (through fs/bcachefs/btree_io.h, fs/bcachefs/btree_locking.h, fs/bcachefs/btree_update_interior.h):
>> fs/bcachefs/bset.h:303:9: sparse: sparse: self-comparison always evaluates to false

vim +303 fs/bcachefs/bset.h

1c6fdbd8f2465dd Kent Overstreet 2017-03-16  299  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  300  static inline void bch2_bset_set_no_aux_tree(struct btree *b,
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  301  					    struct bset_tree *t)
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  302  {
1c6fdbd8f2465dd Kent Overstreet 2017-03-16 @303  	BUG_ON(t < b->set);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  304  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  305  	for (; t < b->set + ARRAY_SIZE(b->set); t++) {
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  306  		t->size = 0;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  307  		t->extra = BSET_NO_AUX_TREE_VAL;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  308  		t->aux_data_offset = U16_MAX;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  309  	}
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  310  }
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  311  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
