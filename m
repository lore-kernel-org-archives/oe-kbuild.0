Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520F7539E
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jan 2023 18:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674066250; x=1705602250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ayxGNuhXdrR/FcsmLppXZwqn5+dIWkPGcgYkuW1ZZk4=;
  b=btmR6isN7Xp8O+VdFrm4V9w8Ij7G7Co3Q3GUtlKWEcI3cLRlsNdPMQiC
   y93C32FLyrC+M9eqc6R5PORXBChw5S10MZRysByeF7AclodMK1oV79UiT
   3COWRxTChp0saegqg55LObBKnO5Jw3w7LpRaoPAHAnQ1zOzUXZccm7gOK
   SFaFQHbg1Ta+oYdmyK2ZbdXhLHC5CMlAXBDnCVg1iGX6+bGuz4zvCqjIr
   VAVcqTzqqQavclzgSfZ07Ym7bJL5tcHBSKsilODeRKoaOgG57olsZUXvM
   iuHeAizmEW0pCg3Hqxt/UY2FLACHRaFKgVev5P1Nf4UekAUwUVoAvQ+rQ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="312939085"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="312939085"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 10:24:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="690322898"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="690322898"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 18 Jan 2023 10:24:08 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pID6V-0000cA-38;
	Wed, 18 Jan 2023 18:24:07 +0000
Date: Thu, 19 Jan 2023 02:23:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 4653/5587] mm/zsmalloc.c:940:13: warning: unused
 function 'obj_allocated'
Message-ID: <202301190220.c9AqKakw-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Nhat Pham <nphamcs@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f3381a7baf5ccbd091eb2c4fd2afd84266fcef24
commit: c8ed11162e615740a3d920e743fae3337f7d1fea [4653/5587] zsmalloc: fix a race with deferred_handles storing
:::::: branch date: 15 hours ago
:::::: commit date: 2 days ago
config: hexagon-randconfig-r041-20230117 (https://download.01.org/0day-ci/archive/20230119/202301190220.c9AqKakw-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=c8ed11162e615740a3d920e743fae3337f7d1fea
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout c8ed11162e615740a3d920e743fae3337f7d1fea
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from mm/zsmalloc.c:45:
   In file included from include/linux/highmem.h:12:
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
   In file included from mm/zsmalloc.c:45:
   In file included from include/linux/highmem.h:12:
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
   In file included from mm/zsmalloc.c:45:
   In file included from include/linux/highmem.h:12:
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
>> mm/zsmalloc.c:940:13: warning: unused function 'obj_allocated' [-Wunused-function]
   static bool obj_allocated(struct page *page, void *obj, unsigned long *phandle)
               ^
   7 warnings generated.


vim +/obj_allocated +940 mm/zsmalloc.c

312fcae2270376 Minchan Kim 2015-04-15  939  
c8ed11162e6157 Nhat Pham   2023-01-10 @940  static bool obj_allocated(struct page *page, void *obj, unsigned long *phandle)
c8ed11162e6157 Nhat Pham   2023-01-10  941  {
c8ed11162e6157 Nhat Pham   2023-01-10  942  	return obj_tagged(page, obj, phandle, OBJ_ALLOCATED_TAG);
c8ed11162e6157 Nhat Pham   2023-01-10  943  }
c8ed11162e6157 Nhat Pham   2023-01-10  944  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
