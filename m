Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B03A1C3C
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Mar 2023 08:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677832980; x=1709368980;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=XTP0jh9RWyBn2d5ycJlTczG7c33ApQPMnh4JQJQFRbw=;
  b=RZAnI+QRPnyB4G2Gz2cbJvckl68TdKa5WYL/n6s3h71ITQdvxSfKBIwS
   ktzTRpO6j3/PBHY6WgZtc0obpICDS2XesacNRY/eMN354pfyH16+723Tb
   JA8u6olgfr0JdYtiomZPNtGpQZ/8JIADZXWsQTEeEd+/jr271H8lnSv2k
   Tb25mY5Ci3uTnDDLqWTwyAOfcISF+amp5sgBjy9PZW/QB78X6n02bYSP7
   jNFNfqDZp4e9ZF7UusjNawstRutUYk3AP2wcK+lcAQH8A8cOwsepgA1p4
   Fxi2N77vm0R9YdQuCZA9S1o+Pi07P6dg/lmF6La6GLTOrhp2AZwAgdSx5
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="362588895"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="362588895"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 00:42:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="785193936"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="785193936"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 03 Mar 2023 00:42:09 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pY0zM-0001Ks-0l;
	Fri, 03 Mar 2023 08:42:04 +0000
Date: Fri, 3 Mar 2023 16:41:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: net/core/page_pool.c:774:7: warning: Use of memory after it is freed
 [clang-analyzer-unix.Malloc]
Message-ID: <202303031634.AJ7uuApn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: net/core/page_pool.c:774:7: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Toke Høiland-Jørgensen" <toke@redhat.com>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2eb29d59ddf02e39774abfb60b2030b0b7e27c1f
commit: b530e9e1063ed2b817eae7eec6ed2daa8be11608 bpf: Add "live packet" mode for XDP in BPF_PROG_RUN
date:   12 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 12 months ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20230303/202303031634.AJ7uuApn-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b530e9e1063ed2b817eae7eec6ed2daa8be11608
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b530e9e1063ed2b817eae7eec6ed2daa8be11608
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=i386 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=i386 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303031634.AJ7uuApn-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                                  ^ ~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   net/ipv6/netfilter.c:219:4: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                           err = PTR_ERR(skb2);
                           ^     ~~~~~~~~~~~~~
   net/ipv6/netfilter.c:219:4: note: Value stored to 'err' is never read
                           err = PTR_ERR(skb2);
                           ^     ~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/net/phy/micrel.c:1285:2: warning: Value stored to 'regval' is never read [clang-analyzer-deadcode.DeadStores]
           regval = phy_read(phydev, KSZ8873MLL_GLOBAL_CONTROL_4);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/micrel.c:1285:2: note: Value stored to 'regval' is never read
           regval = phy_read(phydev, KSZ8873MLL_GLOBAL_CONTROL_4);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/micrel.c:2727:28: warning: Value stored to 'np' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           const struct device_node *np = phydev->mdio.dev.of_node;
                                     ^~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/micrel.c:2727:28: note: Value stored to 'np' during its initialization is never read
           const struct device_node *np = phydev->mdio.dev.of_node;
                                     ^~   ~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   net/core/net-sysfs.c:1769:2: warning: Value stored to 'txq' is never read [clang-analyzer-deadcode.DeadStores]
           txq = real_tx;
           ^     ~~~~~~~
   net/core/net-sysfs.c:1769:2: note: Value stored to 'txq' is never read
           txq = real_tx;
           ^     ~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
>> net/core/page_pool.c:774:7: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
           if (!page_pool_release(pool))
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                                        ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
            ^~~~
   net/core/page_pool.c:766:6: note: Assuming 'pool' is non-null
           if (!pool)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   net/core/page_pool.c:766:2: note: '?' condition is false
           if (!pool)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                 ^
   net/core/page_pool.c:766:7: note: 'pool' is non-null
           if (!pool)
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                                        ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
            ^~~~
   net/core/page_pool.c:766:2: note: '?' condition is false
           if (!pool)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
           ^
   net/core/page_pool.c:766:2: note: Taking false branch
           if (!pool)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/core/page_pool.c:769:2: note: '?' condition is false
           if (!page_pool_put(pool))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                 ^
   net/core/page_pool.c:769:2: note: '?' condition is false
           if (!page_pool_put(pool))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
           ^
   net/core/page_pool.c:769:2: note: Taking false branch
           if (!page_pool_put(pool))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/core/page_pool.c:774:7: note: Calling 'page_pool_release'
           if (!page_pool_release(pool))
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   net/core/page_pool.c:727:6: note: Assuming 'inflight' is 0
           if (!inflight)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )

vim +774 net/core/page_pool.c

c3f812cea0d700 Jonathan Lemon         2019-11-14  763  
c3f812cea0d700 Jonathan Lemon         2019-11-14  764  void page_pool_destroy(struct page_pool *pool)
c3f812cea0d700 Jonathan Lemon         2019-11-14  765  {
c3f812cea0d700 Jonathan Lemon         2019-11-14  766  	if (!pool)
c3f812cea0d700 Jonathan Lemon         2019-11-14  767  		return;
c3f812cea0d700 Jonathan Lemon         2019-11-14  768  
c3f812cea0d700 Jonathan Lemon         2019-11-14  769  	if (!page_pool_put(pool))
c3f812cea0d700 Jonathan Lemon         2019-11-14  770  		return;
c3f812cea0d700 Jonathan Lemon         2019-11-14  771  
53e0961da1c7bb Yunsheng Lin           2021-08-06  772  	page_pool_free_frag(pool);
53e0961da1c7bb Yunsheng Lin           2021-08-06  773  
c3f812cea0d700 Jonathan Lemon         2019-11-14 @774  	if (!page_pool_release(pool))
c3f812cea0d700 Jonathan Lemon         2019-11-14  775  		return;
c3f812cea0d700 Jonathan Lemon         2019-11-14  776  
c3f812cea0d700 Jonathan Lemon         2019-11-14  777  	pool->defer_start = jiffies;
c3f812cea0d700 Jonathan Lemon         2019-11-14  778  	pool->defer_warn  = jiffies + DEFER_WARN_INTERVAL;
ff7d6b27f894f1 Jesper Dangaard Brouer 2018-04-17  779  
c3f812cea0d700 Jonathan Lemon         2019-11-14  780  	INIT_DELAYED_WORK(&pool->release_dw, page_pool_release_retry);
c3f812cea0d700 Jonathan Lemon         2019-11-14  781  	schedule_delayed_work(&pool->release_dw, DEFER_TIME);
ff7d6b27f894f1 Jesper Dangaard Brouer 2018-04-17  782  }
c3f812cea0d700 Jonathan Lemon         2019-11-14  783  EXPORT_SYMBOL(page_pool_destroy);
bc836748707cf6 Saeed Mahameed         2019-11-20  784  

:::::: The code at line 774 was first introduced by commit
:::::: c3f812cea0d7006469d1cf33a4a9f0a12bb4b3a3 page_pool: do not release pool until inflight == 0.

:::::: TO: Jonathan Lemon <jonathan.lemon@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
