Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71B317724
	for <oe-kbuild@lists.linux.dev>; Wed, 21 Jun 2023 19:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687377263; x=1718913263;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/KqvxqIua6ykv1GjH6LzW74CPyq1YbvB+8tX8OZ9xGE=;
  b=ODnTX4LtNgd+GxWzqO9UMyIk3enitn948oBDv4DIkgVE4bjTvuUot9ho
   oO1ATUZFqLO8Ad1T4XA3TzcnEs6cvrbmESIXwaiWX080JM3Y69v5OV+27
   eLGxJ1tdsg2gig82WCu40L9sCxJ1YmFriMMLQuiNv2+uAwNYtgw6WDAKh
   i+VM3MrGLKxbryK9GDsfZpM9axzYcs7XvMZQLdL6YVlubcLZk2WDnfPPV
   mRdQ2KQ6htQtetNoEj2hGglCE7y2shKbhaXZg5Fq6AmJIkXqdEqg46OQX
   7rrwdTrJ/Hci3iBVeR5Bn17HKpqmWwPvche7b5gbhusFGQhJ9LzxoBhyj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="360302689"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="360302689"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 12:54:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="714633532"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="714633532"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 21 Jun 2023 12:54:18 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qC3uD-00073t-1R;
	Wed, 21 Jun 2023 19:54:17 +0000
Date: Thu, 22 Jun 2023 03:53:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 1/2] asm-generic: Unify uapi bitsperlong.h for arm64,
 riscv and loongarch
Message-ID: <202306220331.pXSsB98a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "um arch report"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <1687336748-4898-2-git-send-email-yangtiezhu@loongson.cn>
References: <1687336748-4898-2-git-send-email-yangtiezhu@loongson.cn>
TO: Tiezhu Yang <yangtiezhu@loongson.cn>
TO: Arnd Bergmann <arnd@arndb.de>
CC: linux-arm-kernel@lists.infradead.org
CC: linux-riscv@lists.infradead.org
CC: loongarch@lists.linux.dev
CC: linux-arch@vger.kernel.org
CC: bpf@vger.kernel.org
CC: linux-perf-users@vger.kernel.org
CC: linux-kselftest@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: loongson-kernel@lists.loongnix.cn

Hi Tiezhu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arnd-asm-generic/master]
[also build test WARNING on soc/for-next arm64/for-next/core linus/master v6.4-rc7 next-20230621]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tiezhu-Yang/asm-generic-Unify-uapi-bitsperlong-h-for-arm64-riscv-and-loongarch/20230621-172223
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git master
patch link:    https://lore.kernel.org/r/1687336748-4898-2-git-send-email-yangtiezhu%40loongson.cn
patch subject: [PATCH v2 1/2] asm-generic: Unify uapi bitsperlong.h for arm64, riscv and loongarch
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20230622/202306220331.pXSsB98a-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306220331.pXSsB98a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306220331.pXSsB98a-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from scripts/mod/devicetable-offsets.c:3:
   In file included from include/linux/mod_devicetable.h:12:
   In file included from include/uapi/linux/mei.h:10:
   In file included from include/uapi/linux/mei_uuid.h:12:
   In file included from include/linux/types.h:6:
   In file included from include/uapi/linux/types.h:5:
   In file included from ./arch/x86/include/generated/uapi/asm/types.h:1:
   In file included from include/uapi/asm-generic/types.h:7:
   In file included from include/asm-generic/int-ll64.h:11:
   In file included from include/uapi/asm-generic/int-ll64.h:12:
   In file included from arch/x86/include/uapi/asm/bitsperlong.h:11:
   In file included from include/asm-generic/bitsperlong.h:5:
>> include/uapi/asm-generic/bitsperlong.h:13:9: warning: '__BITS_PER_LONG' macro redefined [-Wmacro-redefined]
      13 | #define __BITS_PER_LONG (__CHAR_BIT__ * __SIZEOF_LONG__)
         |         ^
   arch/x86/include/uapi/asm/bitsperlong.h:6:10: note: previous definition is here
       6 | # define __BITS_PER_LONG 64
         |          ^
   1 warning generated.
--
   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:3:
   In file included from include/linux/sched.h:10:
   In file included from include/uapi/linux/sched.h:5:
   In file included from include/linux/types.h:6:
   In file included from include/uapi/linux/types.h:5:
   In file included from ./arch/x86/include/generated/uapi/asm/types.h:1:
   In file included from include/uapi/asm-generic/types.h:7:
   In file included from include/asm-generic/int-ll64.h:11:
   In file included from include/uapi/asm-generic/int-ll64.h:12:
   In file included from arch/x86/include/uapi/asm/bitsperlong.h:11:
   In file included from include/asm-generic/bitsperlong.h:5:
>> include/uapi/asm-generic/bitsperlong.h:13:9: warning: '__BITS_PER_LONG' macro redefined [-Wmacro-redefined]
      13 | #define __BITS_PER_LONG (__CHAR_BIT__ * __SIZEOF_LONG__)
         |         ^
   arch/x86/include/uapi/asm/bitsperlong.h:6:10: note: previous definition is here
       6 | # define __BITS_PER_LONG 64
         |          ^
   In file included from arch/um/kernel/asm-offsets.c:1:
   arch/x86/um/shared/sysdep/kernel-offsets.h:9:6: warning: no previous prototype for function 'foo' [-Wmissing-prototypes]
       9 | void foo(void)
         |      ^
   arch/x86/um/shared/sysdep/kernel-offsets.h:9:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
       9 | void foo(void)
         | ^
         | static 
   2 warnings generated.
--
   In file included from kernel/fork.c:16:
   In file included from include/linux/slab.h:15:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:8:
   In file included from include/linux/spinlock.h:56:
   In file included from include/linux/preempt.h:10:
   In file included from include/linux/linkage.h:8:
   In file included from arch/x86/include/asm/linkage.h:6:
   In file included from arch/x86/include/asm/ibt.h:5:
   In file included from include/linux/types.h:6:
   In file included from include/uapi/linux/types.h:5:
   In file included from ./arch/x86/include/generated/uapi/asm/types.h:1:
   In file included from include/uapi/asm-generic/types.h:7:
   In file included from include/asm-generic/int-ll64.h:11:
   In file included from include/uapi/asm-generic/int-ll64.h:12:
   In file included from arch/x86/include/uapi/asm/bitsperlong.h:11:
   In file included from include/asm-generic/bitsperlong.h:5:
>> include/uapi/asm-generic/bitsperlong.h:13:9: warning: '__BITS_PER_LONG' macro redefined [-Wmacro-redefined]
      13 | #define __BITS_PER_LONG (__CHAR_BIT__ * __SIZEOF_LONG__)
         |         ^
   arch/x86/include/uapi/asm/bitsperlong.h:6:10: note: previous definition is here
       6 | # define __BITS_PER_LONG 64
         |          ^
   In file included from kernel/fork.c:34:
   In file included from include/linux/mempolicy.h:15:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from kernel/fork.c:34:
   In file included from include/linux/mempolicy.h:15:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from kernel/fork.c:34:
   In file included from include/linux/mempolicy.h:15:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   kernel/fork.c:164:13: warning: no previous prototype for function 'arch_release_task_struct' [-Wmissing-prototypes]
     164 | void __weak arch_release_task_struct(struct task_struct *tsk)
         |             ^
   kernel/fork.c:164:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     164 | void __weak arch_release_task_struct(struct task_struct *tsk)
         | ^
         | static 
   kernel/fork.c:991:20: warning: no previous prototype for function 'arch_task_cache_init' [-Wmissing-prototypes]
     991 | void __init __weak arch_task_cache_init(void) { }
         |                    ^
   kernel/fork.c:991:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     991 | void __init __weak arch_task_cache_init(void) { }
         | ^
         | static 
   kernel/fork.c:1086:12: warning: no previous prototype for function 'arch_dup_task_struct' [-Wmissing-prototypes]
    1086 | int __weak arch_dup_task_struct(struct task_struct *dst,
         |            ^
   kernel/fork.c:1086:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1086 | int __weak arch_dup_task_struct(struct task_struct *dst,
         | ^
         | static 
   16 warnings generated.
--
   In file included from kernel/exec_domain.c:11:
   In file included from include/linux/init.h:5:
   In file included from include/linux/build_bug.h:5:
   In file included from include/linux/compiler.h:246:
   In file included from ./arch/x86/include/generated/asm/rwonce.h:1:
   In file included from include/asm-generic/rwonce.h:26:
   In file included from include/linux/kasan-checks.h:5:
   In file included from include/linux/types.h:6:
   In file included from include/uapi/linux/types.h:5:
   In file included from ./arch/x86/include/generated/uapi/asm/types.h:1:
   In file included from include/uapi/asm-generic/types.h:7:
   In file included from include/asm-generic/int-ll64.h:11:
   In file included from include/uapi/asm-generic/int-ll64.h:12:
   In file included from arch/x86/include/uapi/asm/bitsperlong.h:11:
   In file included from include/asm-generic/bitsperlong.h:5:
>> include/uapi/asm-generic/bitsperlong.h:13:9: warning: '__BITS_PER_LONG' macro redefined [-Wmacro-redefined]
      13 | #define __BITS_PER_LONG (__CHAR_BIT__ * __SIZEOF_LONG__)
         |         ^
   arch/x86/include/uapi/asm/bitsperlong.h:6:10: note: previous definition is here
       6 | # define __BITS_PER_LONG 64
         |          ^
   In file included from kernel/exec_domain.c:19:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from kernel/exec_domain.c:19:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from kernel/exec_domain.c:19:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   13 warnings generated.
--
   In file included from kernel/cpu.c:6:
   In file included from include/linux/sched/mm.h:5:
   In file included from include/linux/kernel.h:16:
   In file included from include/linux/limits.h:6:
   In file included from include/linux/types.h:6:
   In file included from include/uapi/linux/types.h:5:
   In file included from ./arch/x86/include/generated/uapi/asm/types.h:1:
   In file included from include/uapi/asm-generic/types.h:7:
   In file included from include/asm-generic/int-ll64.h:11:
   In file included from include/uapi/asm-generic/int-ll64.h:12:
   In file included from arch/x86/include/uapi/asm/bitsperlong.h:11:
   In file included from include/asm-generic/bitsperlong.h:5:
>> include/uapi/asm-generic/bitsperlong.h:13:9: warning: '__BITS_PER_LONG' macro redefined [-Wmacro-redefined]
      13 | #define __BITS_PER_LONG (__CHAR_BIT__ * __SIZEOF_LONG__)
         |         ^
   arch/x86/include/uapi/asm/bitsperlong.h:6:10: note: previous definition is here
       6 | # define __BITS_PER_LONG 64
         |          ^
   In file included from kernel/cpu.c:13:
   In file included from include/linux/sched/isolation.h:6:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from kernel/cpu.c:13:
   In file included from include/linux/sched/isolation.h:6:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from kernel/cpu.c:13:
   In file included from include/linux/sched/isolation.h:6:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   kernel/cpu.c:110:20: warning: unused function 'cpuhp_lock_acquire' [-Wunused-function]
     110 | static inline void cpuhp_lock_acquire(bool bringup) { }
         |                    ^
   kernel/cpu.c:111:20: warning: unused function 'cpuhp_lock_release' [-Wunused-function]
     111 | static inline void cpuhp_lock_release(bool bringup) { }
         |                    ^
   15 warnings generated.
..


vim +/__BITS_PER_LONG +13 include/uapi/asm-generic/bitsperlong.h

8a1ab3155c2ac7 David Howells 2012-10-04   4  
cc0fac0eed820e Tiezhu Yang   2023-06-21   5  /*
cc0fac0eed820e Tiezhu Yang   2023-06-21   6   * In order to keep safe and avoid regression, only unify uapi
cc0fac0eed820e Tiezhu Yang   2023-06-21   7   * bitsperlong.h for some archs which are using newer toolchains
cc0fac0eed820e Tiezhu Yang   2023-06-21   8   * that have the definitions of __CHAR_BIT__ and __SIZEOF_LONG__.
cc0fac0eed820e Tiezhu Yang   2023-06-21   9   * See the following link for more info:
cc0fac0eed820e Tiezhu Yang   2023-06-21  10   * https://lore.kernel.org/linux-arch/b9624545-2c80-49a1-ac3c-39264a591f7b@app.fastmail.com/
cc0fac0eed820e Tiezhu Yang   2023-06-21  11   */
cc0fac0eed820e Tiezhu Yang   2023-06-21  12  #if defined(__CHAR_BIT__) && defined(__SIZEOF_LONG__)
cc0fac0eed820e Tiezhu Yang   2023-06-21 @13  #define __BITS_PER_LONG (__CHAR_BIT__ * __SIZEOF_LONG__)
cc0fac0eed820e Tiezhu Yang   2023-06-21  14  #else
8a1ab3155c2ac7 David Howells 2012-10-04  15  /*
8a1ab3155c2ac7 David Howells 2012-10-04  16   * There seems to be no way of detecting this automatically from user
8a1ab3155c2ac7 David Howells 2012-10-04  17   * space, so 64 bit architectures should override this in their
8a1ab3155c2ac7 David Howells 2012-10-04  18   * bitsperlong.h. In particular, an architecture that supports
8a1ab3155c2ac7 David Howells 2012-10-04  19   * both 32 and 64 bit user space must not rely on CONFIG_64BIT
8a1ab3155c2ac7 David Howells 2012-10-04  20   * to decide it, but rather check a compiler provided macro.
8a1ab3155c2ac7 David Howells 2012-10-04  21   */
8a1ab3155c2ac7 David Howells 2012-10-04  22  #ifndef __BITS_PER_LONG
8a1ab3155c2ac7 David Howells 2012-10-04  23  #define __BITS_PER_LONG 32
8a1ab3155c2ac7 David Howells 2012-10-04  24  #endif
cc0fac0eed820e Tiezhu Yang   2023-06-21  25  #endif
8a1ab3155c2ac7 David Howells 2012-10-04  26  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
