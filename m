Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33BA2905
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Jan 2023 07:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674113382; x=1705649382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iJ4hfy8/jv/At80AK3EXjZsi89q+nPuDkCjcZ98oy5o=;
  b=Ma372doArrxI1Wk+QxzyjoWNMNJaT4wLIvIYUYEwk7ZPZJOEAbEAoQjb
   m2o/dmeUv3/RQd+GPCJ4EemBAXlUTHb0yKk4OLWt6HZYFPYDRHLbGTgCK
   FfgqmS6S1x6jz+xVoLWWXcRWl3TN77uddxbAkFkcJUQGIIozpgAJwqStq
   xPOgf3HQkFKsawbJ1ChjjuMdR9WTAswytv/A7X1GCVQhce6ZKmDF7OdFB
   KrqTNv0QGJElIjHLDGk9fPm9RbudtVqcjrHvb+aa7HGX4Yq796gOdxRaQ
   LVVqEjfseKEYBCd9k+0LDY1/Vg6xF16/a2P8TvplzjsXAJ5mXNgPCUbWy
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="308774903"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="308774903"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 23:29:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="748795861"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="748795861"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Jan 2023 23:29:40 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIPMi-0001Fi-0J;
	Thu, 19 Jan 2023 07:29:40 +0000
Date: Thu, 19 Jan 2023 15:29:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/slub.c:409:21: warning: unused function 'get_freepointer_safe'
Message-ID: <202301191546.UC04tF3Q-lkp@intel.com>
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
TO: Vlastimil Babka <vbabka@suse.cz>
CC: Christoph Lameter <cl@linux-foundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7287904c8771b77b9504f53623bb477065c19a58
commit: 0af8489b0216fa1dd83e264bef8063f2632633d7 mm, slub: remove percpu slabs with CONFIG_SLUB_TINY
date:   7 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 7 weeks ago
config: hexagon-randconfig-r045-20230117 (https://download.01.org/0day-ci/archive/20230119/202301191546.UC04tF3Q-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0af8489b0216fa1dd83e264bef8063f2632633d7
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 0af8489b0216fa1dd83e264bef8063f2632633d7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from mm/slub.c:14:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from mm/slub.c:14:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from mm/slub.c:14:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   mm/slub.c:2210:15: warning: variable 'partial_slabs' set but not used [-Wunused-but-set-variable]
           unsigned int partial_slabs = 0;
                        ^
   mm/slub.c:210:20: warning: unused function 'slub_debug_orig_size' [-Wunused-function]
   static inline bool slub_debug_orig_size(struct kmem_cache *s)
                      ^
>> mm/slub.c:409:21: warning: unused function 'get_freepointer_safe' [-Wunused-function]
   static inline void *get_freepointer_safe(struct kmem_cache *s, void *object)
                       ^
   mm/slub.c:484:1: warning: unused function 'slub_set_cpu_partial' [-Wunused-function]
   slub_set_cpu_partial(struct kmem_cache *s, unsigned int nr_objects)
   ^
>> mm/slub.c:1664:20: warning: unused function 'set_track' [-Wunused-function]
   static inline void set_track(struct kmem_cache *s, void *object,
                      ^
   mm/slub.c:1681:29: warning: unused function 'node_nr_slabs' [-Wunused-function]
   static inline unsigned long node_nr_slabs(struct kmem_cache_node *n)
                               ^
>> mm/slub.c:2830:19: warning: unused function 'node_match' [-Wunused-function]
   static inline int node_match(struct slab *slab, int node)
                     ^
   13 warnings generated.


vim +/get_freepointer_safe +409 mm/slub.c

0ad9500e16fe24a Eric Dumazet        2011-12-16  397  
68ef169a1dd20df Alexander Potapenko 2022-09-15  398  /*
68ef169a1dd20df Alexander Potapenko 2022-09-15  399   * When running under KMSAN, get_freepointer_safe() may return an uninitialized
68ef169a1dd20df Alexander Potapenko 2022-09-15  400   * pointer value in the case the current thread loses the race for the next
68ef169a1dd20df Alexander Potapenko 2022-09-15  401   * memory chunk in the freelist. In that case this_cpu_cmpxchg_double() in
68ef169a1dd20df Alexander Potapenko 2022-09-15  402   * slab_alloc_node() will fail, so the uninitialized value won't be used, but
68ef169a1dd20df Alexander Potapenko 2022-09-15  403   * KMSAN will still check all arguments of cmpxchg because of imperfect
68ef169a1dd20df Alexander Potapenko 2022-09-15  404   * handling of inline assembly.
68ef169a1dd20df Alexander Potapenko 2022-09-15  405   * To work around this problem, we apply __no_kmsan_checks to ensure that
68ef169a1dd20df Alexander Potapenko 2022-09-15  406   * get_freepointer_safe() returns initialized memory.
68ef169a1dd20df Alexander Potapenko 2022-09-15  407   */
68ef169a1dd20df Alexander Potapenko 2022-09-15  408  __no_kmsan_checks
1393d9a1857471f Christoph Lameter   2011-05-16 @409  static inline void *get_freepointer_safe(struct kmem_cache *s, void *object)
1393d9a1857471f Christoph Lameter   2011-05-16  410  {
2482ddec670fb83 Kees Cook           2017-09-06  411  	unsigned long freepointer_addr;
1393d9a1857471f Christoph Lameter   2011-05-16  412  	void *p;
1393d9a1857471f Christoph Lameter   2011-05-16  413  
8e57f8acbbd121e Vlastimil Babka     2020-01-13  414  	if (!debug_pagealloc_enabled_static())
922d566cdcb7166 Joonsoo Kim         2016-03-17  415  		return get_freepointer(s, object);
922d566cdcb7166 Joonsoo Kim         2016-03-17  416  
f70b00496f2a066 Alexander Potapenko 2021-05-22  417  	object = kasan_reset_tag(object);
2482ddec670fb83 Kees Cook           2017-09-06  418  	freepointer_addr = (unsigned long)object + s->offset;
fe557319aa06c23 Christoph Hellwig   2020-06-17  419  	copy_from_kernel_nofault(&p, (void **)freepointer_addr, sizeof(p));
2482ddec670fb83 Kees Cook           2017-09-06  420  	return freelist_ptr(s, p, freepointer_addr);
1393d9a1857471f Christoph Lameter   2011-05-16  421  }
1393d9a1857471f Christoph Lameter   2011-05-16  422  

:::::: The code at line 409 was first introduced by commit
:::::: 1393d9a1857471f816d0be1ccc1d6433a86050f6 slub: Make CONFIG_DEBUG_PAGE_ALLOC work with new fastpath

:::::: TO: Christoph Lameter <cl@linux.com>
:::::: CC: Pekka Enberg <penberg@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
