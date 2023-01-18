Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B502F34
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jan 2023 22:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674081739; x=1705617739;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QfnNgvCa0JfqcIbef1vt5NCP8c+BNWog0lNQmBkFJAA=;
  b=ftFGLC84toV7jPKW0I2u6s1OLFMCUulMu47eBUlJvahWsbij6knfcXd+
   CiMQErUqJ0ER5WYLViex8RKwFYVLsbKOicJLVt+xWw2DitqwbEdSRaiEx
   WCXzk9nZ9E/WknAAU4WMQ08Xmp8B2g38/H+jtI/c9xvU7nKyY/Wr80WtL
   nHbVM4O2IuESuAwp843JWd0Lp7tT8I8bktGrWEVPydbz6olPzazC2faxY
   p87chkhkpPUTe/rCq6y90Pcl3gwQTbmHNGKLFz77EhC5iiVqSXMr8IXCc
   iMldyCPP+CuUij8kr2wRpdas1ZJflZeggYI/WwM9wtuaokGtBfhANYxrw
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="312998234"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="312998234"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 14:42:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="833766917"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="833766917"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 18 Jan 2023 14:42:18 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIH8L-0000mU-1Q;
	Wed, 18 Jan 2023 22:42:17 +0000
Date: Thu, 19 Jan 2023 06:41:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/memcontrol.c:2774:20: warning: unused function 'cancel_charge'
Message-ID: <202301190606.E1hhhDdG-lkp@intel.com>
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
TO: Shakeel Butt <shakeelb@google.com>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Muchun Song <songmuchun@bytedance.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c1649ec55708ae42091a2f1bca1ab49ecd722d55
commit: 58056f77502f3567b760c9a8fc8d2e9081515b2d memcg, kmem: further deprecate kmem.limit_in_bytes
date:   1 year, 2 months ago
:::::: branch date: 29 hours ago
:::::: commit date: 1 year, 2 months ago
config: arm-randconfig-r016-20230116 (https://download.01.org/0day-ci/archive/20230119/202301190606.E1hhhDdG-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=58056f77502f3567b760c9a8fc8d2e9081515b2d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 58056f77502f3567b760c9a8fc8d2e9081515b2d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> mm/memcontrol.c:2774:20: warning: unused function 'cancel_charge' [-Wunused-function]
   static inline void cancel_charge(struct mem_cgroup *memcg, unsigned int nr_pages)
                      ^
   mm/memcontrol.c:3339:19: warning: unused function 'mem_cgroup_move_swap_account' [-Wunused-function]
   static inline int mem_cgroup_move_swap_account(swp_entry_t entry,
                     ^
   2 warnings generated.


vim +/cancel_charge +2774 mm/memcontrol.c

c5c8b16b596e15 Muchun Song       2021-06-28  2773  
58056f77502f35 Shakeel Butt      2021-11-05 @2774  static inline void cancel_charge(struct mem_cgroup *memcg, unsigned int nr_pages)
a3032a2c15c696 Daisuke Nishimura 2009-12-15  2775  {
ce00a967377baa Johannes Weiner   2014-09-05  2776  	if (mem_cgroup_is_root(memcg))
ce00a967377baa Johannes Weiner   2014-09-05  2777  		return;
ce00a967377baa Johannes Weiner   2014-09-05  2778  
3e32cb2e0a12b6 Johannes Weiner   2014-12-10  2779  	page_counter_uncharge(&memcg->memory, nr_pages);
7941d2145abc4d Johannes Weiner   2016-01-14  2780  	if (do_memsw_account())
3e32cb2e0a12b6 Johannes Weiner   2014-12-10  2781  		page_counter_uncharge(&memcg->memsw, nr_pages);
d01dd17f1067ca KAMEZAWA Hiroyuki 2012-05-29  2782  }
d01dd17f1067ca KAMEZAWA Hiroyuki 2012-05-29  2783  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
