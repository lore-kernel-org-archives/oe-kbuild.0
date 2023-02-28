Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47E462A
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Feb 2023 05:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677560541; x=1709096541;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=a+ZpBQkgppVXayzt0PtNDO0QZ+4vLRrknkWGuF+d39s=;
  b=KLjO5wBk5+4f1/dpMo6XkSaS7ZUWejHAxYvHuLJkSQ5fzfISVH9RjytS
   rmp0NWhzaRZE5Geut00aIKBjYvs+5SI2oClcJX4EhM756M/i54Vm7iXhk
   qqM+tQV6BeO4dDSmnQ7iCZCYP9Z2Z0C7zSW/Sm4fjGzqdSyz7I6VhvXS4
   X6wLx87jc/kdZxneGEdEs+yV4mOpTIXvlD4oNnjOnM3xMu7qoVFan86RH
   mIhUEF9nNfWBu/b2tY3fXk0dgxjYgky7Z6n/cra3FyRb4v744lTP4CumQ
   +j5fx2PbTme4dBZGEY44Mr6g8n5fq2lqhO/K+G+8IOdpibwT0t9edHgbn
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="331526408"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="331526408"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 21:02:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="704279702"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="704279702"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 27 Feb 2023 21:02:19 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWs82-00056Z-1U;
	Tue, 28 Feb 2023 05:02:18 +0000
Date: Tue, 28 Feb 2023 13:01:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: net/core/page_pool.c:774:7: warning: Use of memory after it is freed
 [clang-analyzer-unix.Malloc]
Message-ID: <202302281227.kmFPGpwF-lkp@intel.com>
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
head:   981ee95cc1f5905ae4936b0dd501085909cdc14f
commit: b530e9e1063ed2b817eae7eec6ed2daa8be11608 bpf: Add "live packet" mode for XDP in BPF_PROG_RUN
date:   12 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 12 months ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20230228/202302281227.kmFPGpwF-lkp@intel.com/config)
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
| Link: https://lore.kernel.org/r/202302281227.kmFPGpwF-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/media/i2c/ov9650.c:606:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret = ov965x_write(ov965x, REG_COM8, reg);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov9650.c:606:3: note: Value stored to 'ret' is never read
                   ret = ov965x_write(ov965x, REG_COM8, reg);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
