Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9878C06
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jan 2023 22:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674079218; x=1705615218;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MeKKNXgY4pj7qK9rvBnNtWYN5IYnWdy+FJv//NvU734=;
  b=OFwKmjr9hSSbp15e7TLcHo1iDbTi4uFy7EXgRd2Vq0SHwZ/ZxsfZqdH9
   7XA7MJehcqaMn1AgwWyzbiEbqs4cGJN82wZSUm9tOHd63PtcNry/sJ/kt
   mZdjqYGboYXZXZGbKK2OxKde7OUiAVZfiWXc3K9XqFGfLnrq78oPwEbqX
   IMk56Pi/1pPMVrRnFFrpknDM9eQkZZzsuSg0fGlaaW6n6exe214Bk6vZU
   6cD5znFrGyjQjBa4ALrwAavsfioAEPOgtcSoYiO4pV302ADLpKnpFITve
   waTK93WGWboxr/wWT56SvrCdQO4J0bd97Za03L6hN1PSOrf/MRp/7+B6V
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="326377370"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="326377370"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 14:00:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="637449138"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="637449138"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 18 Jan 2023 14:00:15 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIGTf-0000ka-01;
	Wed, 18 Jan 2023 22:00:15 +0000
Date: Thu, 19 Jan 2023 06:00:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android13-5.15 2/2] mm/mremap.c:245:20: warning:
 unused function 'trylock_vma_ref_count'
Message-ID: <202301190526.sXdNVLPH-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   2f40ae382fe6b1c13e02c4673f6b1880329e13f0
commit: a2593b3a744486a5b38eefdd899d460cf33ce46d [2/2] ANDROID: Re-enable fast mremap and fix UAF with SPF
:::::: branch date: 7 hours ago
:::::: commit date: 12 days ago
config: arm-randconfig-r046-20230118 (https://download.01.org/0day-ci/archive/20230119/202301190526.sXdNVLPH-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android13-5.15
        git checkout a2593b3a744486a5b38eefdd899d460cf33ce46d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   mm/mremap.c:215:20: warning: unused function 'arch_supports_page_table_move' [-Wunused-function]
   static inline bool arch_supports_page_table_move(void)
                      ^
   mm/mremap.c:214:39: note: expanded from macro 'arch_supports_page_table_move'
   #define arch_supports_page_table_move arch_supports_page_table_move
                                         ^
>> mm/mremap.c:245:20: warning: unused function 'trylock_vma_ref_count' [-Wunused-function]
   static inline bool trylock_vma_ref_count(struct vm_area_struct *vma)
                      ^
>> mm/mremap.c:249:20: warning: unused function 'unlock_vma_ref_count' [-Wunused-function]
   static inline void unlock_vma_ref_count(struct vm_area_struct *vma)
                      ^
   3 warnings generated.


vim +/trylock_vma_ref_count +245 mm/mremap.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  212  
3bbda69c48d274 Aneesh Kumar K.V   2021-07-07  213  #ifndef arch_supports_page_table_move
3bbda69c48d274 Aneesh Kumar K.V   2021-07-07  214  #define arch_supports_page_table_move arch_supports_page_table_move
3bbda69c48d274 Aneesh Kumar K.V   2021-07-07 @215  static inline bool arch_supports_page_table_move(void)
3bbda69c48d274 Aneesh Kumar K.V   2021-07-07  216  {
3bbda69c48d274 Aneesh Kumar K.V   2021-07-07  217  	return IS_ENABLED(CONFIG_HAVE_MOVE_PMD) ||
3bbda69c48d274 Aneesh Kumar K.V   2021-07-07  218  		IS_ENABLED(CONFIG_HAVE_MOVE_PUD);
3bbda69c48d274 Aneesh Kumar K.V   2021-07-07  219  }
3bbda69c48d274 Aneesh Kumar K.V   2021-07-07  220  #endif
3bbda69c48d274 Aneesh Kumar K.V   2021-07-07  221  
a2593b3a744486 Kalesh Singh       2023-01-06  222  #ifdef CONFIG_SPECULATIVE_PAGE_FAULT
a2593b3a744486 Kalesh Singh       2023-01-06  223  static inline bool trylock_vma_ref_count(struct vm_area_struct *vma)
a2593b3a744486 Kalesh Singh       2023-01-06  224  {
3e7526c6723968 Suren Baghdasaryan 2022-11-18  225  	/*
a2593b3a744486 Kalesh Singh       2023-01-06  226  	 * If we have the only reference, swap the refcount to -1. This
a2593b3a744486 Kalesh Singh       2023-01-06  227  	 * will prevent other concurrent references by get_vma() for SPFs.
3e7526c6723968 Suren Baghdasaryan 2022-11-18  228  	 */
a2593b3a744486 Kalesh Singh       2023-01-06  229  	return atomic_cmpxchg(&vma->file_ref_count, 0, -1) == 0;
a2593b3a744486 Kalesh Singh       2023-01-06  230  }
a2593b3a744486 Kalesh Singh       2023-01-06  231  
a2593b3a744486 Kalesh Singh       2023-01-06  232  /*
a2593b3a744486 Kalesh Singh       2023-01-06  233   * Restore the VMA reference count to 1 after a fast mremap.
a2593b3a744486 Kalesh Singh       2023-01-06  234   */
a2593b3a744486 Kalesh Singh       2023-01-06  235  static inline void unlock_vma_ref_count(struct vm_area_struct *vma)
a2593b3a744486 Kalesh Singh       2023-01-06  236  {
a2593b3a744486 Kalesh Singh       2023-01-06  237  	/*
a2593b3a744486 Kalesh Singh       2023-01-06  238  	 * This should only be called after a corresponding,
a2593b3a744486 Kalesh Singh       2023-01-06  239  	 * successful trylock_vma_ref_count().
a2593b3a744486 Kalesh Singh       2023-01-06  240  	 */
a2593b3a744486 Kalesh Singh       2023-01-06  241  	VM_BUG_ON_VMA(atomic_cmpxchg(&vma->file_ref_count, -1, 0) != -1,
a2593b3a744486 Kalesh Singh       2023-01-06  242  		      vma);
a2593b3a744486 Kalesh Singh       2023-01-06  243  }
a2593b3a744486 Kalesh Singh       2023-01-06  244  #else	/* !CONFIG_SPECULATIVE_PAGE_FAULT */
a2593b3a744486 Kalesh Singh       2023-01-06 @245  static inline bool trylock_vma_ref_count(struct vm_area_struct *vma)
a2593b3a744486 Kalesh Singh       2023-01-06  246  {
a2593b3a744486 Kalesh Singh       2023-01-06  247  	return true;
a2593b3a744486 Kalesh Singh       2023-01-06  248  }
a2593b3a744486 Kalesh Singh       2023-01-06 @249  static inline void unlock_vma_ref_count(struct vm_area_struct *vma)
a2593b3a744486 Kalesh Singh       2023-01-06  250  {
a2593b3a744486 Kalesh Singh       2023-01-06  251  }
a2593b3a744486 Kalesh Singh       2023-01-06  252  #endif	/* CONFIG_SPECULATIVE_PAGE_FAULT */
a2593b3a744486 Kalesh Singh       2023-01-06  253  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
