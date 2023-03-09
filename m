Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E1563A7
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Mar 2023 10:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678356742; x=1709892742;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uvIwkVllPONhZu4Tf8G/gPAMpk35ppZoJFJMgSqRuaQ=;
  b=AKXXfdIWlg4+WpuoDxXhRn3Yn9LSyVJFeXWL5LFSWg/U86QW+d18BB0z
   nXW6MhfmAMzHgTkKnmM7anXM9ioDU0Qz6kl492/CfruKoO5FfkN/AmDVr
   ByK6VZJhgo4mL1Q6UJ9pNj82+jFB93fFuOI42kXJxiMuabRuMSexpQCQ+
   ZO+7tjq3rkvxVWBZouB8zMjNhcrgsex4Ul7s+G0nftbdoVSv94ypuy0qN
   ICZk7sMK3K+Yi4EFVl5Cq9NrUDtAOFd6q/emGhsIzoUtt4eLCeh1o5A6V
   rZ3wXbl03SK5R3ztTcHEjlBWLhdLiHrbbRTPzVmfaClGxGMC9hgegJONJ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="316802671"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="316802671"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 02:12:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="820552288"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="820552288"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Mar 2023 02:12:20 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paDG0-0002rd-0c;
	Thu, 09 Mar 2023 10:12:20 +0000
Date: Thu, 9 Mar 2023 18:12:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/block/brd.c:459:32: warning: shift by count ('32') >=
 precision of type ('32')
Message-ID: <202303091854.jfBtlkgn-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/block/brd.c:459:32: warning: shift by count ('32') >= precision of type ('32') [-Wanalyzer-shift-count-overflow]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Seung-Woo Kim" <sw0312.kim@samsung.com>
CC: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
CC: Florian Fainelli <f.fainelli@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6a98c9cae232800c319ed69e1063480d31430887
commit: d539fee9f825b0c8eac049732c83562b28a483b5 ARM: 9253/1: ubsan: select ARCH_HAS_UBSAN_SANITIZE_ALL
date:   4 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-c002-20230308 (https://download.01.org/0day-ci/archive/20230309/202303091854.jfBtlkgn-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d539fee9f825b0c8eac049732c83562b28a483b5
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d539fee9f825b0c8eac049732c83562b28a483b5
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error'  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error' 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303091854.jfBtlkgn-lkp@intel.com/

gcc_analyzer warnings: (new ones prefixed by >>)
   drivers/block/brd.c: In function 'brd_check_and_reset_par':
>> drivers/block/brd.c:459:32: warning: shift by count ('32') >= precision of type ('32') [-Wanalyzer-shift-count-overflow]
     459 |                 max_part = 1UL << fls(max_part);
         |                                ^~
     'brd_check_and_reset_par': event 1
       |
       |  458 |         if ((1U << MINORBITS) % max_part != 0)
       |      |            ^
       |      |            |
       |      |            (1) following 'true' branch...
       |
     'brd_check_and_reset_par': event 2
       |
       |include/asm-generic/bitops/builtin-fls.h:14:36:
       |   14 |         return x ? sizeof(x) * 8 - __builtin_clz(x) : 0;
       |      |                                    ^~~~~~~~~~~~~~~~
       |      |                                    |
       |      |                                    (2) ...to here
       |
     'brd_check_and_reset_par': events 3-5
       |
       |drivers/block/brd.c:459:26:
       |  459 |                 max_part = 1UL << fls(max_part);
       |      |                 ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
       |      |                          |     |
       |      |                          |     (4) ...to here
       |      |                          |     (5) shift by count '32' here
       |      |                          (3) following 'true' branch...
       |

vim +459 drivers/block/brd.c

9db5579be4bb532 Nicholas Piggin 2008-02-08  448  
c8ab422553c81a0 Zhiqiang Liu    2020-02-04  449  static inline void brd_check_and_reset_par(void)
c8ab422553c81a0 Zhiqiang Liu    2020-02-04  450  {
c8ab422553c81a0 Zhiqiang Liu    2020-02-04  451  	if (unlikely(!max_part))
c8ab422553c81a0 Zhiqiang Liu    2020-02-04  452  		max_part = 1;
c8ab422553c81a0 Zhiqiang Liu    2020-02-04  453  
c8ab422553c81a0 Zhiqiang Liu    2020-02-04  454  	/*
c8ab422553c81a0 Zhiqiang Liu    2020-02-04  455  	 * make sure 'max_part' can be divided exactly by (1U << MINORBITS),
c8ab422553c81a0 Zhiqiang Liu    2020-02-04  456  	 * otherwise, it is possiable to get same dev_t when adding partitions.
c8ab422553c81a0 Zhiqiang Liu    2020-02-04  457  	 */
c8ab422553c81a0 Zhiqiang Liu    2020-02-04  458  	if ((1U << MINORBITS) % max_part != 0)
c8ab422553c81a0 Zhiqiang Liu    2020-02-04 @459  		max_part = 1UL << fls(max_part);
c8ab422553c81a0 Zhiqiang Liu    2020-02-04  460  
c8ab422553c81a0 Zhiqiang Liu    2020-02-04  461  	if (max_part > DISK_MAX_PARTS) {
c8ab422553c81a0 Zhiqiang Liu    2020-02-04  462  		pr_info("brd: max_part can't be larger than %d, reset max_part = %d.\n",
c8ab422553c81a0 Zhiqiang Liu    2020-02-04  463  			DISK_MAX_PARTS, DISK_MAX_PARTS);
c8ab422553c81a0 Zhiqiang Liu    2020-02-04  464  		max_part = DISK_MAX_PARTS;
c8ab422553c81a0 Zhiqiang Liu    2020-02-04  465  	}
c8ab422553c81a0 Zhiqiang Liu    2020-02-04  466  }
c8ab422553c81a0 Zhiqiang Liu    2020-02-04  467  

:::::: The code at line 459 was first introduced by commit
:::::: c8ab422553c81a0eb070329c63725df1cd1425bc brd: check and limit max_part par

:::::: TO: Zhiqiang Liu <liuzhiqiang26@huawei.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
