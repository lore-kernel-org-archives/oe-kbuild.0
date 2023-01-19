Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DF415A3
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Jan 2023 00:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674089785; x=1705625785;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lRTkLGG5Nyo7sE0pNu/3b8La1ukwr1j+9IZDtBLQsCs=;
  b=GAXKbX7y59YDlQZSwcST7H5NyaArm7N0JosaqlzF+DJmU4TTEPn0/7po
   obCTXiz2GD83ShtGh5QwwQJCH/jmojuXNUtCJ1o5MiCsmzNo/u4lrgx/E
   5Nuga9sSUpIj2xz20SUqR35ElkOKekXa2+gVJuvXRTp0GSWIabhIE+JBO
   fhMxz2AiqwVW7Htv9bP6c6XplTEhWD4e41THZDOtBynlHwhL4PIYftakM
   YDsb9HQ1ndLoeOmAr+Cx2jLqu6dkCgub0PZzzMrGqnPbotrIZoN0H5DS7
   u9CZrSRV2LiPcPhsLUQ/0+U3VBDjxp85V3VaT/etxzzrVw2Xh0CbyRmUB
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="323836544"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="323836544"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 16:56:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="661942540"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="661942540"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 18 Jan 2023 16:56:23 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIJE6-0000tm-2Z;
	Thu, 19 Jan 2023 00:56:22 +0000
Date: Thu, 19 Jan 2023 08:55:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/maple_tree.c:330:20: warning: unused function 'mte_set_full'
Message-ID: <202301190839.wFvjzxBp-lkp@intel.com>
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
TO: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "Matthew Wilcox (Oracle)" <willy@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7287904c8771b77b9504f53623bb477065c19a58
commit: 54a611b605901c7d5d05b6b8f5d04a6ceb0962aa Maple Tree: add new data structure
date:   4 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-k001 (https://download.01.org/0day-ci/archive/20230119/202301190839.wFvjzxBp-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=54a611b605901c7d5d05b6b8f5d04a6ceb0962aa
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 54a611b605901c7d5d05b6b8f5d04a6ceb0962aa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> lib/maple_tree.c:330:20: warning: unused function 'mte_set_full' [-Wunused-function]
   static inline void mte_set_full(const struct maple_enode *node)
                      ^
>> lib/maple_tree.c:335:20: warning: unused function 'mte_clear_full' [-Wunused-function]
   static inline void mte_clear_full(const struct maple_enode *node)
                      ^
   2 warnings generated.


vim +/mte_set_full +330 lib/maple_tree.c

54a611b605901c7 Liam R. Howlett 2022-09-06  329  
54a611b605901c7 Liam R. Howlett 2022-09-06 @330  static inline void mte_set_full(const struct maple_enode *node)
54a611b605901c7 Liam R. Howlett 2022-09-06  331  {
54a611b605901c7 Liam R. Howlett 2022-09-06  332  	node = (void *)((unsigned long)node & ~MAPLE_ENODE_NULL);
54a611b605901c7 Liam R. Howlett 2022-09-06  333  }
54a611b605901c7 Liam R. Howlett 2022-09-06  334  
54a611b605901c7 Liam R. Howlett 2022-09-06 @335  static inline void mte_clear_full(const struct maple_enode *node)
54a611b605901c7 Liam R. Howlett 2022-09-06  336  {
54a611b605901c7 Liam R. Howlett 2022-09-06  337  	node = (void *)((unsigned long)node | MAPLE_ENODE_NULL);
54a611b605901c7 Liam R. Howlett 2022-09-06  338  }
54a611b605901c7 Liam R. Howlett 2022-09-06  339  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
