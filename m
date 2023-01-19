Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A89915A3
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Jan 2023 02:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674094113; x=1705630113;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P52/w+xNdrEpM9IScucWBUZ22DecWVBZZvD1vbpv4KA=;
  b=AAHa01YrXnNTreYAHsjoKNVr+LQTE9ktE1G3AWilDjriAYJlX8fUtdXu
   /5cXlsHTQC2whlast5kAKIxEFGSa2PhcuXX4ExvuiUXGmOgyLyP8cVY6C
   KnTCLCQP98y7keHNYwuA5HyWZKiTnqF8frO7+f8nYZd9TUesR43IquFX5
   ZoB7ETedBGFekpJKDjAgWJXnRgXNvf1Uz69+bkbju5QmoFC2ORL92kyIs
   jcEHXaEKDg2U0nCu5/PNj9mRbuz3fUdjz+7sOVrPNZFcVUcy/Nrb1vA3r
   Z8pY+RuU4w5HCOHq1b+Ijh2Ldf5bfYZ9Rgv6Df65Nlwe/S0JQy8NyOXOx
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="325216663"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="325216663"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 18:08:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="609898119"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="609898119"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Jan 2023 18:08:26 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIKLp-0000xS-1S;
	Thu, 19 Jan 2023 02:08:25 +0000
Date: Thu, 19 Jan 2023 10:08:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/maple_tree.c:336:20: warning: unused function 'mte_has_null'
Message-ID: <202301190933.XPcabbE7-lkp@intel.com>
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
head:   7287904c8771b77b9504f53623bb477065c19a58
commit: 6e7ba8b5e2380f941dda8a1025d70c5ce5b38982 maple_tree: mte_set_full() and mte_clear_full() clang-analyzer clean up
date:   7 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 7 weeks ago
config: x86_64-randconfig-a004-20230116 (https://download.01.org/0day-ci/archive/20230119/202301190933.XPcabbE7-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6e7ba8b5e2380f941dda8a1025d70c5ce5b38982
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 6e7ba8b5e2380f941dda8a1025d70c5ce5b38982
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   lib/maple_tree.c:326:21: warning: unused function 'mte_set_full' [-Wunused-function]
   static inline void *mte_set_full(const struct maple_enode *node)
                       ^
   lib/maple_tree.c:331:21: warning: unused function 'mte_clear_full' [-Wunused-function]
   static inline void *mte_clear_full(const struct maple_enode *node)
                       ^
>> lib/maple_tree.c:336:20: warning: unused function 'mte_has_null' [-Wunused-function]
   static inline bool mte_has_null(const struct maple_enode *node)
                      ^
   3 warnings generated.


vim +/mte_has_null +336 lib/maple_tree.c

6e7ba8b5e2380f9 Liam Howlett    2022-10-28  335  
6e7ba8b5e2380f9 Liam Howlett    2022-10-28 @336  static inline bool mte_has_null(const struct maple_enode *node)
6e7ba8b5e2380f9 Liam Howlett    2022-10-28  337  {
6e7ba8b5e2380f9 Liam Howlett    2022-10-28  338  	return (unsigned long)node & MAPLE_ENODE_NULL;
54a611b605901c7 Liam R. Howlett 2022-09-06  339  }
54a611b605901c7 Liam R. Howlett 2022-09-06  340  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
