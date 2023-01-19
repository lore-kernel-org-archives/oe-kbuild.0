Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B83D15A3
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Jan 2023 00:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674089134; x=1705625134;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WVwN7WMJ73r9wju8Z2/pCUecWtOtHXcFbgRoTMFdpBU=;
  b=E/6LLVV7zSoZtRTYeY2Z/ypWJy0AQMQyiCdsLJwZ4yllQlO1MXtmI836
   I9L8GgsFeL4aCI1ADgxmLyFIBuIu218sBqFIBPjMdCL+DSYvUjrkbu2J+
   zEVP8loM7rPWsfeW0v8yfH4YUpzLLFoE95eav9kUhWMiKfYkSUusPI+zb
   ieVc/IpNbqmTWhu6qi6ZHwEUx96/aahKIP4OZrO6SLBLtU6Kk9dNIpcP9
   fjhBtQSQfSI6bqe0fK4Q6w+6jESnKBfqkOoiMtUYTkkikMiRFZbuXdaU4
   7FhTeZOUdxM93wzRNMEFugGheBGGhQopuCfUPKjOeqIDklzcRzzJrGGeO
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="308710656"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="308710656"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 16:45:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="609873404"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="609873404"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Jan 2023 16:45:22 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIJ3S-0000sy-08;
	Thu, 19 Jan 2023 00:45:22 +0000
Date: Thu, 19 Jan 2023 08:45:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/list_lru.c:98:20: warning: unused function 'list_lru_memcg_aware'
Message-ID: <202301190807.m1GEaW3N-lkp@intel.com>
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
TO: Muchun Song <songmuchun@bytedance.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7287904c8771b77b9504f53623bb477065c19a58
commit: bbca91cca9a902de2e9907370e9c1e0a3d1aab0f mm: list_lru: replace linear array with xarray
date:   10 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 10 months ago
config: i386-randconfig-a002-20230116 (https://download.01.org/0day-ci/archive/20230119/202301190807.m1GEaW3N-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bbca91cca9a902de2e9907370e9c1e0a3d1aab0f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout bbca91cca9a902de2e9907370e9c1e0a3d1aab0f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> mm/list_lru.c:98:20: warning: unused function 'list_lru_memcg_aware' [-Wunused-function]
   static inline bool list_lru_memcg_aware(struct list_lru *lru)
                      ^
   1 warning generated.


vim +/list_lru_memcg_aware +98 mm/list_lru.c

fae91d6d8be5e20 Kirill Tkhai     2018-08-17   97  
60d3fd32a7a9da4 Vladimir Davydov 2015-02-12  @98  static inline bool list_lru_memcg_aware(struct list_lru *lru)
60d3fd32a7a9da4 Vladimir Davydov 2015-02-12   99  {
60d3fd32a7a9da4 Vladimir Davydov 2015-02-12  100  	return false;
60d3fd32a7a9da4 Vladimir Davydov 2015-02-12  101  }
60d3fd32a7a9da4 Vladimir Davydov 2015-02-12  102  

:::::: The code at line 98 was first introduced by commit
:::::: 60d3fd32a7a9da4c8c93a9f89cfda22a0b4c65ce list_lru: introduce per-memcg lists

:::::: TO: Vladimir Davydov <vdavydov@parallels.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
