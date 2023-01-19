Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E78415A3
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Jan 2023 02:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674094115; x=1705630115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gPPn4n1dG0yiTEn5a040TPVurQT2Fm1Pyl14gPfiaqc=;
  b=EI9DCCKuwn/lfxJqOmBChPCj9poq3CL6zX1YtQSQDEY548I9HBCGigx9
   pbVDe5ENtnqyIp56OOXxMXMIq+PeOJCtstSFtE1/VA/mXifTRjU3iHUfe
   zMj13VYj82Ou2zVJ7juGoWTlIICYzFXwTe1Bg3ZbuEnibVrfOqhlYR87v
   Eb+YJcVzR68QwYJPy4KjEfAiscnxAx/uaPggYXvezUZb4MXwIPy8Gvcxd
   MJGiw9sOZAbLWbk8CYMsrmKi7vKyIYm2hkSE73kDEbW3OuP5QxvG70CNd
   W7EE/3wz50na1gRty8lWXTZ3KMaeNEbEySbSE2jf0qSalkvHoNWUxSurn
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="325216660"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="325216660"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 18:08:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="609898116"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="609898116"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Jan 2023 18:08:26 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIKLp-0000xU-1X;
	Thu, 19 Jan 2023 02:08:25 +0000
Date: Thu, 19 Jan 2023 10:08:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/slub.c:475:1: warning: unused function 'slub_set_cpu_partial'
Message-ID: <202301190945.J7YwikXr-lkp@intel.com>
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
commit: b1a413a39a1a7694acf3636a52c109821148ecdd mm, slub: disable SYSFS support with CONFIG_SLUB_TINY
date:   7 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 7 weeks ago
config: hexagon-randconfig-r045-20230117 (https://download.01.org/0day-ci/archive/20230119/202301190945.J7YwikXr-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b1a413a39a1a7694acf3636a52c109821148ecdd
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b1a413a39a1a7694acf3636a52c109821148ecdd
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
   mm/slub.c:2199:15: warning: variable 'partial_slabs' set but not used [-Wunused-but-set-variable]
           unsigned int partial_slabs = 0;
                        ^
   mm/slub.c:210:20: warning: unused function 'slub_debug_orig_size' [-Wunused-function]
   static inline bool slub_debug_orig_size(struct kmem_cache *s)
                      ^
>> mm/slub.c:475:1: warning: unused function 'slub_set_cpu_partial' [-Wunused-function]
   slub_set_cpu_partial(struct kmem_cache *s, unsigned int nr_objects)
   ^
   mm/slub.c:1672:29: warning: unused function 'node_nr_slabs' [-Wunused-function]
   static inline unsigned long node_nr_slabs(struct kmem_cache_node *n)
                               ^
   10 warnings generated.


vim +/slub_set_cpu_partial +475 mm/slub.c

834f3d119234b3 Christoph Lameter 2008-04-14  456  
b47291ef02b0be Vlastimil Babka   2021-11-05  457  #ifdef CONFIG_SLUB_CPU_PARTIAL
b47291ef02b0be Vlastimil Babka   2021-11-05  458  static void slub_set_cpu_partial(struct kmem_cache *s, unsigned int nr_objects)
b47291ef02b0be Vlastimil Babka   2021-11-05  459  {
bb192ed9aa7191 Vlastimil Babka   2021-11-03  460  	unsigned int nr_slabs;
b47291ef02b0be Vlastimil Babka   2021-11-05  461  
b47291ef02b0be Vlastimil Babka   2021-11-05  462  	s->cpu_partial = nr_objects;
b47291ef02b0be Vlastimil Babka   2021-11-05  463  
b47291ef02b0be Vlastimil Babka   2021-11-05  464  	/*
b47291ef02b0be Vlastimil Babka   2021-11-05  465  	 * We take the number of objects but actually limit the number of
c2092c12064a97 Vlastimil Babka   2021-11-15  466  	 * slabs on the per cpu partial list, in order to limit excessive
c2092c12064a97 Vlastimil Babka   2021-11-15  467  	 * growth of the list. For simplicity we assume that the slabs will
b47291ef02b0be Vlastimil Babka   2021-11-05  468  	 * be half-full.
b47291ef02b0be Vlastimil Babka   2021-11-05  469  	 */
bb192ed9aa7191 Vlastimil Babka   2021-11-03  470  	nr_slabs = DIV_ROUND_UP(nr_objects * 2, oo_objects(s->oo));
bb192ed9aa7191 Vlastimil Babka   2021-11-03  471  	s->cpu_partial_slabs = nr_slabs;
b47291ef02b0be Vlastimil Babka   2021-11-05  472  }
b47291ef02b0be Vlastimil Babka   2021-11-05  473  #else
b47291ef02b0be Vlastimil Babka   2021-11-05  474  static inline void
b47291ef02b0be Vlastimil Babka   2021-11-05 @475  slub_set_cpu_partial(struct kmem_cache *s, unsigned int nr_objects)
b47291ef02b0be Vlastimil Babka   2021-11-05  476  {
b47291ef02b0be Vlastimil Babka   2021-11-05  477  }
b47291ef02b0be Vlastimil Babka   2021-11-05  478  #endif /* CONFIG_SLUB_CPU_PARTIAL */
b47291ef02b0be Vlastimil Babka   2021-11-05  479  

:::::: The code at line 475 was first introduced by commit
:::::: b47291ef02b0bee85ffb7efd6c336060ad1fe1a4 mm, slub: change percpu partial accounting from objects to pages

:::::: TO: Vlastimil Babka <vbabka@suse.cz>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
