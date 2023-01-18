Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7758C06
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jan 2023 22:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674080479; x=1705616479;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SVsWIQI5bH/TyFZUOjzcfHVfTusKlwMGeXb7LDiaZgk=;
  b=BqF354HfbtLy1K0gfxKfcYdZefdZESVLMZfvqEYRyRakCNmcgnEa3mYR
   mIdo11s1bchGwOKA80qV/Bt85fnaEdz90PhJ3HyWLBf4RIRBhPGkYh+Rz
   fnQW7w+4W3f149ajLA6VlGb/AtN9Hu7nKAz7amRD/nE9k3yLpOuK8C01m
   SUClW6IXqUYaXH1qww0bXRI5wMdW7tNOqAfFewOlPc6cYG7VGSeC0SP/G
   Kas0kBiFRhXIXRPPLYBzW92HDOoAvXBnXyjTIcJ0x/TYiexAiZ2j0Q0/1
   mJc4pKEZW8c6jCTT7G0IaWP3ca9ZdsKPh9XMBqfECnId2pnZlcYI4e4xi
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="308678572"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="308678572"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 14:21:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="905286396"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="905286396"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 18 Jan 2023 14:21:17 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIGo0-0000lW-2Z;
	Wed, 18 Jan 2023 22:21:16 +0000
Date: Thu, 19 Jan 2023 06:20:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/mm/nohash/tlb.c:135:19: warning: unused function
 'mmu_get_tsize'
Message-ID: <202301190622.PFMbkFGI-lkp@intel.com>
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
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Michael Ellerman <mpe@ellerman.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c1649ec55708ae42091a2f1bca1ab49ecd722d55
commit: 63f501e07a8557bc8ab79d17ef76ae21df1e395d powerpc/8xx: Simplify TLB handling
date:   1 year, 3 months ago
:::::: branch date: 29 hours ago
:::::: commit date: 1 year, 3 months ago
config: powerpc-randconfig-r022-20230119 (https://download.01.org/0day-ci/archive/20230119/202301190622.PFMbkFGI-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=63f501e07a8557bc8ab79d17ef76ae21df1e395d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 63f501e07a8557bc8ab79d17ef76ae21df1e395d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/mm/nohash/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   __do_insb
   ^
   arch/powerpc/include/asm/io.h:556:56: note: expanded from macro '__do_insb'
   #define __do_insb(p, b, n)      readsb((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/mm/nohash/tlb.c:29:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:98:1: note: expanded from here
   __do_insw
   ^
   arch/powerpc/include/asm/io.h:557:56: note: expanded from macro '__do_insw'
   #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/mm/nohash/tlb.c:29:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:100:1: note: expanded from here
   __do_insl
   ^
   arch/powerpc/include/asm/io.h:558:56: note: expanded from macro '__do_insl'
   #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/mm/nohash/tlb.c:29:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:102:1: note: expanded from here
   __do_outsb
   ^
   arch/powerpc/include/asm/io.h:559:58: note: expanded from macro '__do_outsb'
   #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/mm/nohash/tlb.c:29:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:104:1: note: expanded from here
   __do_outsw
   ^
   arch/powerpc/include/asm/io.h:560:58: note: expanded from macro '__do_outsw'
   #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/mm/nohash/tlb.c:29:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:106:1: note: expanded from here
   __do_outsl
   ^
   arch/powerpc/include/asm/io.h:561:58: note: expanded from macro '__do_outsl'
   #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
>> arch/powerpc/mm/nohash/tlb.c:135:19: warning: unused function 'mmu_get_tsize' [-Wunused-function]
   static inline int mmu_get_tsize(int psize)
                     ^
   7 warnings generated.


vim +/mmu_get_tsize +135 arch/powerpc/mm/nohash/tlb.c

41151e77a4d96e arch/powerpc/mm/tlb_nohash.c Becky Bruce            2011-06-28  134  
25d21ad6e799cc arch/powerpc/mm/tlb_nohash.c Benjamin Herrenschmidt 2009-07-23 @135  static inline int mmu_get_tsize(int psize)
25d21ad6e799cc arch/powerpc/mm/tlb_nohash.c Benjamin Herrenschmidt 2009-07-23  136  {
25d21ad6e799cc arch/powerpc/mm/tlb_nohash.c Benjamin Herrenschmidt 2009-07-23  137  	return mmu_psize_defs[psize].enc;
25d21ad6e799cc arch/powerpc/mm/tlb_nohash.c Benjamin Herrenschmidt 2009-07-23  138  }
25d21ad6e799cc arch/powerpc/mm/tlb_nohash.c Benjamin Herrenschmidt 2009-07-23  139  #else
25d21ad6e799cc arch/powerpc/mm/tlb_nohash.c Benjamin Herrenschmidt 2009-07-23  140  static inline int mmu_get_tsize(int psize)
25d21ad6e799cc arch/powerpc/mm/tlb_nohash.c Benjamin Herrenschmidt 2009-07-23  141  {
25d21ad6e799cc arch/powerpc/mm/tlb_nohash.c Benjamin Herrenschmidt 2009-07-23  142  	/* This isn't used on !Book3E for now */
25d21ad6e799cc arch/powerpc/mm/tlb_nohash.c Benjamin Herrenschmidt 2009-07-23  143  	return 0;
25d21ad6e799cc arch/powerpc/mm/tlb_nohash.c Benjamin Herrenschmidt 2009-07-23  144  }
41151e77a4d96e arch/powerpc/mm/tlb_nohash.c Becky Bruce            2011-06-28  145  #endif /* CONFIG_PPC_BOOK3E_MMU */
25d21ad6e799cc arch/powerpc/mm/tlb_nohash.c Benjamin Herrenschmidt 2009-07-23  146  

:::::: The code at line 135 was first introduced by commit
:::::: 25d21ad6e799cccd097b9df2a2fefe19a7e1dfcf powerpc: Add TLB management code for 64-bit Book3E

:::::: TO: Benjamin Herrenschmidt <benh@kernel.crashing.org>
:::::: CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
