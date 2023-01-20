Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50344BD26
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Jan 2023 06:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674195765; x=1705731765;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MVtNCh3Oe1xcpEeOn8RLTsPm0x9aVPmzXEkOC7+Luvc=;
  b=b08R5AQwsGO1MLVR2wdjISKAoaf0KMNd9P/HINa3fAfd4QBoVlT8gDcR
   Kpj6v8eQShx5wIxslU4dPMqzXtzVSY7xSmh3Vmm+opO0W693Ho7hFs4/g
   QLhYlOVfYpyPSNy11i78tZWSFi3x4sQ8jYGUWF1VrFvXBy6y7QBCqT/y2
   IX0nilnh+QNfPzX0L7FhfdI81qB9JOR0amLgIhx4dJjckf0fwsc3HuAeo
   zaRJZIbcrNtXJvYMXZ0FtFoxUkVpy4lWCjw6B2S9a1nYfVVKOqwk1a/lV
   IfOTDFMxzXBzUNiwQAnkj2xHRtuNOwiD3a90iCih9+hadosG3rLtP1JYr
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="411745938"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="411745938"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 22:22:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="690943136"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="690943136"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 19 Jan 2023 22:22:43 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIknS-0002Gt-2q;
	Fri, 20 Jan 2023 06:22:42 +0000
Date: Fri, 20 Jan 2023 14:22:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/clk/clk-milbeaut.c:297:13: warning: shift by negative count
 ('-1')
Message-ID: <202301201449.53BB4W41-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/clk/clk-milbeaut.c:297:13: warning: shift by negative count ('-1') [-Wanalyzer-shift-count-negative]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d368967cb1039b5c4cccb62b5a4b9468c50cd143
commit: 09f6b27d5ddd9ad0ec096d1b0f8decdacc70f0f8 ARM: dove: multiplatform support
date:   10 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20230119 (https://download.01.org/0day-ci/archive/20230120/202301201449.53BB4W41-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=09f6b27d5ddd9ad0ec096d1b0f8decdacc70f0f8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 09f6b27d5ddd9ad0ec096d1b0f8decdacc70f0f8
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error'  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error' 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   drivers/clk/clk-milbeaut.c: In function 'm10v_mux_set_parent':
>> drivers/clk/clk-milbeaut.c:297:13: warning: shift by negative count ('-1') [-Wanalyzer-shift-count-negative]
     297 |         u32 write_en = BIT(fls(mux->mask) - 1);
         |             ^~~~~~~~
     'm10v_mux_set_parent': event 1
       |
       |include/asm-generic/bitops/builtin-fls.h:14:53:
       |   14 |         return x ? sizeof(x) * 8 - __builtin_clz(x) : 0;
       |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
       |      |                                                     |
       |      |                                                     (1) following 'false' branch...
       |
     'm10v_mux_set_parent': event 2
       |
       |drivers/clk/clk-milbeaut.c:297:43:
       |  297 |         u32 write_en = BIT(fls(mux->mask) - 1);
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       |    7 | #define BIT(nr)                 (UL(1) << (nr))
       |      |                                            ^~
       |
     'm10v_mux_set_parent': event 3
       |
       |drivers/clk/clk-milbeaut.c:297:13:
       |  297 |         u32 write_en = BIT(fls(mux->mask) - 1);
       |      |             ^~~~~~~~
       |      |             |
       |      |             (3) shift by negative amount here ('-1')
       |

vim +297 drivers/clk/clk-milbeaut.c

6a6ba5b55a728d Sugaya Taichi 2019-04-25  290  
6a6ba5b55a728d Sugaya Taichi 2019-04-25  291  static int m10v_mux_set_parent(struct clk_hw *hw, u8 index)
6a6ba5b55a728d Sugaya Taichi 2019-04-25  292  {
6a6ba5b55a728d Sugaya Taichi 2019-04-25  293  	struct clk_mux *mux = to_clk_mux(hw);
6a6ba5b55a728d Sugaya Taichi 2019-04-25  294  	u32 val = clk_mux_index_to_val(mux->table, mux->flags, index);
6a6ba5b55a728d Sugaya Taichi 2019-04-25  295  	unsigned long flags = 0;
6a6ba5b55a728d Sugaya Taichi 2019-04-25  296  	u32 reg;
6a6ba5b55a728d Sugaya Taichi 2019-04-25 @297  	u32 write_en = BIT(fls(mux->mask) - 1);
6a6ba5b55a728d Sugaya Taichi 2019-04-25  298  
6a6ba5b55a728d Sugaya Taichi 2019-04-25  299  	if (mux->lock)
6a6ba5b55a728d Sugaya Taichi 2019-04-25  300  		spin_lock_irqsave(mux->lock, flags);
6a6ba5b55a728d Sugaya Taichi 2019-04-25  301  	else
6a6ba5b55a728d Sugaya Taichi 2019-04-25  302  		__acquire(mux->lock);
6a6ba5b55a728d Sugaya Taichi 2019-04-25  303  
6a6ba5b55a728d Sugaya Taichi 2019-04-25  304  	reg = readl(mux->reg);
6a6ba5b55a728d Sugaya Taichi 2019-04-25  305  	reg &= ~(mux->mask << mux->shift);
6a6ba5b55a728d Sugaya Taichi 2019-04-25  306  
6a6ba5b55a728d Sugaya Taichi 2019-04-25  307  	val = (val | write_en) << mux->shift;
6a6ba5b55a728d Sugaya Taichi 2019-04-25  308  	reg |= val;
6a6ba5b55a728d Sugaya Taichi 2019-04-25  309  	writel(reg, mux->reg);
6a6ba5b55a728d Sugaya Taichi 2019-04-25  310  
6a6ba5b55a728d Sugaya Taichi 2019-04-25  311  	if (mux->lock)
6a6ba5b55a728d Sugaya Taichi 2019-04-25  312  		spin_unlock_irqrestore(mux->lock, flags);
6a6ba5b55a728d Sugaya Taichi 2019-04-25  313  	else
6a6ba5b55a728d Sugaya Taichi 2019-04-25  314  		__release(mux->lock);
6a6ba5b55a728d Sugaya Taichi 2019-04-25  315  
6a6ba5b55a728d Sugaya Taichi 2019-04-25  316  	return 0;
6a6ba5b55a728d Sugaya Taichi 2019-04-25  317  }
6a6ba5b55a728d Sugaya Taichi 2019-04-25  318  

:::::: The code at line 297 was first introduced by commit
:::::: 6a6ba5b55a728d819bad598ef5299fa740538dcf clock: milbeaut: Add Milbeaut M10V clock controller

:::::: TO: Sugaya Taichi <sugaya.taichi@socionext.com>
:::::: CC: Stephen Boyd <sboyd@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
