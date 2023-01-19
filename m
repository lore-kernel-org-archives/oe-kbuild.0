Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33822179
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Jan 2023 00:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674086664; x=1705622664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cQt8h3duCyzvsUSf8d1eVYiOZfV3fHz4O/8oEjoq18w=;
  b=AvfZXGqepk/+Z2KSZe2DYf0LVGYdN2av4vdcNrHO8waK/LbwJReBFOdH
   xDJPgUXskPYdRCqwvxwFMTA187tW9fsAy6r3T5tOqDoVaAht5KCgVWVVM
   PzAiiFByP6qz37cPCW/nf3bqxWWvdX0U6K1M2BqnXehxPgnjcYjzQtS41
   oMlnd5HYuT+WJqyTS7iuf+Ooof9wZlt+wKL9wxGY3yfMvuenT+ODaM+MY
   jWJ7xKb6pk2HTlrlbC1+rMqISIxmQQzngiVjeLfO+Luf05TcjKKbQvhHe
   3HseQWbp+YY5zgZIvW9ZKbryd9e9ofAL1S7Ft1VjJ5NtOmkEYWnSj0fla
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="352394158"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="352394158"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 16:04:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="728439992"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="728439992"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 18 Jan 2023 16:04:21 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIIPk-0000qL-0S;
	Thu, 19 Jan 2023 00:04:20 +0000
Date: Thu, 19 Jan 2023 08:04:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-hotfixes-unstable 25/30] mm/zsmalloc.c:940:13: warning:
 unused function 'obj_allocated'
Message-ID: <202301190830.4tstTsgZ-lkp@intel.com>
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
TO: Nhat Pham <nphamcs@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-hotfixes-unstable
head:   4de77094279d6b179bab4314bdca80e6694cfcf0
commit: f950c3c5d55be15a74d250edde93e404c6ecd409 [25/30] zsmalloc: fix a race with deferred_handles storing
:::::: branch date: 20 hours ago
:::::: commit date: 7 days ago
config: hexagon-buildonly-randconfig-r001-20230118 (https://download.01.org/0day-ci/archive/20230119/202301190830.4tstTsgZ-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=f950c3c5d55be15a74d250edde93e404c6ecd409
        git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
        git fetch --no-tags akpm-mm mm-hotfixes-unstable
        git checkout f950c3c5d55be15a74d250edde93e404c6ecd409
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

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

312fcae22703761 Minchan Kim 2015-04-15  939  
f950c3c5d55be15 Nhat Pham   2023-01-10 @940  static bool obj_allocated(struct page *page, void *obj, unsigned long *phandle)
f950c3c5d55be15 Nhat Pham   2023-01-10  941  {
f950c3c5d55be15 Nhat Pham   2023-01-10  942  	return obj_tagged(page, obj, phandle, OBJ_ALLOCATED_TAG);
f950c3c5d55be15 Nhat Pham   2023-01-10  943  }
f950c3c5d55be15 Nhat Pham   2023-01-10  944  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
