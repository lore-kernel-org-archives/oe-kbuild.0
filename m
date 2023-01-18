Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0D72F21
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jan 2023 17:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674062580; x=1705598580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FXRE9sPqUEO1IVFEvxfgFEvJXUDo9Q44XA986/4TqTg=;
  b=T0l827wjuYp1sfBR5O4x6JQtw0ZR7KFvyFAa9xaEHRRLHtSHgC4nQWrT
   uWY7ayzWBK3fSsGgI6DXCjtIvIy2740DdAM7aGSnEn4Ro3OIw4JnxCCK5
   JY8F4ePtJ2kZdvnF6UZqUhYtk05rQK699Tq2gLRbAyy7D76V6AgemA0LJ
   RqBK96lqgcAxadLPguPyb8ZFkTr5cweGISQG5+tYfA3HlT6RKF7BJ/gU5
   Xuq9xwpu1rIw8cp5j2TOI2c6MFzGyoQSFb5ZzgGNMcd4FKaNX0G2WV0vT
   3HeuHikzeal4LGuZSbZ5LnMzGc5oGbIUZCMgUwcNXc2pWB8EW1SEbv40m
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="326306170"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="326306170"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 09:23:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="690293676"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="690293676"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 18 Jan 2023 09:22:59 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIC9K-0000ZM-1h;
	Wed, 18 Jan 2023 17:22:58 +0000
Date: Thu, 19 Jan 2023 01:22:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [djwong-xfs:xfile-page-caching 181/266] fs/xfs/scrub/trace.c:48:1:
 warning: unused function 'xfbtree_ino'
Message-ID: <202301190144.4A9aWMCj-lkp@intel.com>
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
commit: 5e5403fd13b9e84e08d6f3e7da7c3bc489b63eab [181/266] xfs: connect in-memory btrees to xfiles
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: riscv-randconfig-r036-20230118 (https://download.01.org/0day-ci/archive/20230119/202301190144.4A9aWMCj-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?id=5e5403fd13b9e84e08d6f3e7da7c3bc489b63eab
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs xfile-page-caching
        git checkout 5e5403fd13b9e84e08d6f3e7da7c3bc489b63eab
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash fs/xfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from fs/xfs/scrub/trace.c:6:
   In file included from fs/xfs/xfs.h:22:
   In file included from fs/xfs/xfs_linux.h:83:
   fs/xfs/xfs_hooks.h:63:27: warning: cast from 'xfs_hook_fn_t' (aka 'int (*)(struct xfs_hook *, unsigned long, void *)') to 'notifier_fn_t' (aka 'int (*)(struct notifier_block *, unsigned long, void *)') converts to incompatible function type [-Wcast-function-type-strict]
           hook->nb.notifier_call = (notifier_fn_t)fn;
                                    ^~~~~~~~~~~~~~~~~
   fs/xfs/scrub/trace.c:31:1: warning: unused function 'xchk_btree_cur_fsbno' [-Wunused-function]
   xchk_btree_cur_fsbno(
   ^
>> fs/xfs/scrub/trace.c:48:1: warning: unused function 'xfbtree_ino' [-Wunused-function]
   xfbtree_ino(
   ^
   3 warnings generated.


vim +/xfbtree_ino +48 fs/xfs/scrub/trace.c

537964bceb9a4c Darrick J. Wong 2017-10-17  45  
5e5403fd13b9e8 Darrick J. Wong 2022-07-14  46  #ifdef CONFIG_XFS_IN_MEMORY_BTREE
5e5403fd13b9e8 Darrick J. Wong 2022-07-14  47  static inline unsigned long
5e5403fd13b9e8 Darrick J. Wong 2022-07-14 @48  xfbtree_ino(
5e5403fd13b9e8 Darrick J. Wong 2022-07-14  49  	struct xfbtree		*xfbt)
5e5403fd13b9e8 Darrick J. Wong 2022-07-14  50  {
5e5403fd13b9e8 Darrick J. Wong 2022-07-14  51  	return file_inode(xfbt->target->bt_xfile->file)->i_ino;
5e5403fd13b9e8 Darrick J. Wong 2022-07-14  52  }
5e5403fd13b9e8 Darrick J. Wong 2022-07-14  53  #endif /* CONFIG_XFS_IN_MEMORY_BTREE */
5e5403fd13b9e8 Darrick J. Wong 2022-07-14  54  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
