Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067692F3A
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jan 2023 13:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674050151; x=1705586151;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nuw9sKgizCsxSbdU6nNJJDt+A9oTtkXyhSRjffblrp4=;
  b=GX+JlhTbmRa37Zylrv5kVeJ9eQCJkCH+rMNf2L1KfRji7DKX/sveilMb
   MLr/DinvfczJKUylQOZuF545bnZeD7/z6wy+bb9WTyX1/bAr+FO819GeF
   2xFQwD4QsTV2XrgK+1dbIr5OFItCeKUI+4fUbRarC3SMrVxA22icRA3U5
   XhvSuxgz3b1YnxcSocoMgj7UixbtvPuBHmp4cLFW4XGqnD2zzBDQFFCjv
   SPq0HNN4iLVY/+GlCcbw+wJysYeZ7K8vjV/hUtNjonEeE1N9+I4cqWddx
   pPVugO1q38aqVsToJyV6bZKWYGaM0GkhyXhhkfeIKemshcTwKa1PU5XR4
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="305358714"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="305358714"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 05:55:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="802202130"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="802202130"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 18 Jan 2023 05:55:49 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pI8uq-0000NI-2R;
	Wed, 18 Jan 2023 13:55:48 +0000
Date: Wed, 18 Jan 2023 21:55:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/test_maple_tree.c:182:19: warning: unused function 'not_empty'
Message-ID: <202301182101.7Wo96gkp-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Liam Howlett <liam.howlett@oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "Liam R. Howlett" <Liam.Howlett@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c1649ec55708ae42091a2f1bca1ab49ecd722d55
commit: 120b116208a0877227fc82e3f0df81e7a3ed4ab1 maple_tree: reorganize testing to restore module testing
date:   2 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 2 months ago
config: riscv-randconfig-r002-20230118 (https://download.01.org/0day-ci/archive/20230118/202301182101.7Wo96gkp-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=120b116208a0877227fc82e3f0df81e7a3ed4ab1
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 120b116208a0877227fc82e3f0df81e7a3ed4ab1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash lib/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> lib/test_maple_tree.c:182:19: warning: unused function 'not_empty' [-Wunused-function]
   static inline int not_empty(struct maple_node *node)
                     ^
   1 warning generated.


vim +/not_empty +182 lib/test_maple_tree.c

e15e06a8392321 Liam R. Howlett 2022-09-06  181  
e15e06a8392321 Liam R. Howlett 2022-09-06 @182  static inline int not_empty(struct maple_node *node)
e15e06a8392321 Liam R. Howlett 2022-09-06  183  {
e15e06a8392321 Liam R. Howlett 2022-09-06  184  	int i;
e15e06a8392321 Liam R. Howlett 2022-09-06  185  
e15e06a8392321 Liam R. Howlett 2022-09-06  186  	if (node->parent)
e15e06a8392321 Liam R. Howlett 2022-09-06  187  		return 1;
e15e06a8392321 Liam R. Howlett 2022-09-06  188  
e15e06a8392321 Liam R. Howlett 2022-09-06  189  	for (i = 0; i < ARRAY_SIZE(node->slot); i++)
e15e06a8392321 Liam R. Howlett 2022-09-06  190  		if (node->slot[i])
e15e06a8392321 Liam R. Howlett 2022-09-06  191  			return 1;
e15e06a8392321 Liam R. Howlett 2022-09-06  192  
e15e06a8392321 Liam R. Howlett 2022-09-06  193  	return 0;
e15e06a8392321 Liam R. Howlett 2022-09-06  194  }
e15e06a8392321 Liam R. Howlett 2022-09-06  195  

:::::: The code at line 182 was first introduced by commit
:::::: e15e06a8392321a19d8ebdbdd7643b7fa8874c17 lib/test_maple_tree: add testing for maple tree

:::::: TO: Liam R. Howlett <Liam.Howlett@Oracle.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
