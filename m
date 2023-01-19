Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6178E17D4
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Jan 2023 03:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674099632; x=1705635632;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uAiggiOmmO1P5bd5NVcVJLseE1YTM3Wj8meA+Uo2lr4=;
  b=eShSfgHRiJ66nP6mqNqi738m5Vq5FhSoWrxSkTGmoIG3lEjGlJ1t9Kn4
   k/xUAwRUXkJj7LxYHbC0up1boBP3sDaJspjGQ2R63ez1LscOK1oI+IO/n
   SAiBafARno9t0RQCvtj2iJ/5zTjg4ZNs/tAoFP6Mc13TRoGV+NH3iQPOB
   KbfkXD24MF01dpqK1wZ0NBGvv4q5pEK1Ta9qv3oOxGDr8uBOE/N5ZnbqC
   FXtIVWG/Np7WKY6HGbfiR95kC0xAlMXuLP8dMOqIVpZyMGwiax8LMRQEz
   maOflmafe6nhuPfa8giBWpwIc96ombDm8r18LgUKfpYYI+BOHfkEXxQQF
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="411422959"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="411422959"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 19:40:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="833843076"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="833843076"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 18 Jan 2023 19:40:30 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pILmv-00012X-2d;
	Thu, 19 Jan 2023 03:40:29 +0000
Date: Thu, 19 Jan 2023 11:40:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [djwong-xfs:xfile-page-caching 90/266] fs/xfs/scrub/bitmap.c:54:1:
 warning: unused function 'xbitmap_tree_iter_next'
Message-ID: <202301191159.rXhePzyX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "gcc: unused function warning for stub function"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   5ac6d5f53f18d0486ac3713be490eb8c186ff344
commit: d1b9a7a892083108c5afb4d543c86c4e1c734624 [90/266] xfs: cross-reference rmap records with ag btrees
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230119/202301191159.rXhePzyX-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?id=d1b9a7a892083108c5afb4d543c86c4e1c734624
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs xfile-page-caching
        git checkout d1b9a7a892083108c5afb4d543c86c4e1c734624
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/cifs/ fs/xfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/xfs/scrub/bitmap.c:54:1: warning: unused function 'xbitmap_tree_iter_next' [-Wunused-function]
   INTERVAL_TREE_DEFINE(struct xbitmap_node, bn_rbnode, uint64_t,
   ^
   include/linux/interval_tree_generic.h:151:33: note: expanded from macro 'INTERVAL_TREE_DEFINE'
   ITSTATIC ITSTRUCT *                                                           \
                                                                                 ^
   <scratch space>:35:1: note: expanded from here
   xbitmap_tree_iter_next
   ^
   1 warning generated.


vim +/xbitmap_tree_iter_next +54 fs/xfs/scrub/bitmap.c

54c0e470fff6cc Darrick J. Wong 2022-09-28  45  
54c0e470fff6cc Darrick J. Wong 2022-09-28  46  static inline struct xbitmap_node *
54c0e470fff6cc Darrick J. Wong 2022-09-28  47  xbitmap_tree_iter_first(struct rb_root_cached *root, uint64_t start,
54c0e470fff6cc Darrick J. Wong 2022-09-28  48  			uint64_t last);
54c0e470fff6cc Darrick J. Wong 2022-09-28  49  
54c0e470fff6cc Darrick J. Wong 2022-09-28  50  static inline struct xbitmap_node *
54c0e470fff6cc Darrick J. Wong 2022-09-28  51  xbitmap_tree_iter_next(struct xbitmap_node *node, uint64_t start,
54c0e470fff6cc Darrick J. Wong 2022-09-28  52  		       uint64_t last);
54c0e470fff6cc Darrick J. Wong 2022-09-28  53  
54c0e470fff6cc Darrick J. Wong 2022-09-28 @54  INTERVAL_TREE_DEFINE(struct xbitmap_node, bn_rbnode, uint64_t,
54c0e470fff6cc Darrick J. Wong 2022-09-28  55  		__bn_subtree_last, START, LAST, static inline, xbitmap_tree)
54c0e470fff6cc Darrick J. Wong 2022-09-28  56  

:::::: The code at line 54 was first introduced by commit
:::::: 54c0e470fff6cc86be34520d61c3b83679bcb188 xfs: convert xbitmap to interval tree

:::::: TO: Darrick J. Wong <djwong@kernel.org>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
