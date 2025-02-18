Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF22C26E141
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Feb 2025 16:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739895212; cv=none; b=Fb0HKT8mwiSl18/lniauRFgbb6S/SCtA8bCezOxz2CYF3QsDPrwvXNdU3uwp5UDui3Y8hrAuf6I5kxdgfqe2eWhDjD0lU7y7OgnI1YgPcB9XlNWTokQyWqS37dAqV/jrAeZJqU7gtvzia3i2BOn6y0foQOo8hq1hy3VO6X72S70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739895212; c=relaxed/simple;
	bh=XYDo4vCohTz1tX17mKWOE+NTRoyUwJIaRn8NildDALU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VSfKItrSmMBTlsPE+n2dmKJMih+BcslZ9V4HrlY2E6BW99Fzm0iV7dicujH9cDeagktRGXOKcQl3mSDohgnNB8U9unv1tn/6/F15Wv1x2tYOrcUdBYsSWrEZk5NMihSaSzqrLOcYRggvka3eLTyZFezpocf0bDhPZ7KIX2Oawt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OiVtljrV; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OiVtljrV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739895211; x=1771431211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XYDo4vCohTz1tX17mKWOE+NTRoyUwJIaRn8NildDALU=;
  b=OiVtljrVrxvGszc53CxZ/bJwoowzuk8xLiDdqOD7xjw1xYeP9gIUvlyf
   eRkh+Me3BxDX4G9Mz0K6fm9izxFQ5dLB4Uq6KNTUul1/WGtntZ7BR8yLP
   wKytm8395uloxU1cdH1LqQ0hbVVGM9M2xAgS5Gooh5Bf/DfYE/NwJ4VoK
   BzQMEUkeX6UrP55cFRwTnxBuIsCDIsdCJO/UrDqDmURyX+mBvsrdoVk/d
   I/JlJBt1eygZ1ySwa6yW/Q9+ea3Q0UBUciEOprhOrheFz/mg+Kkg0puHW
   XX/s7MVmmgORDwRAROGXfnmRVznwUzrFBDZR2n0VWCk4vq53Tjs9xEdzk
   Q==;
X-CSE-ConnectionGUID: wSOEAcYLTRe+0XDUl0O2og==
X-CSE-MsgGUID: zMCxxRX8TXmY38FD5LtfHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40722339"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="40722339"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 08:13:31 -0800
X-CSE-ConnectionGUID: MaQXFNaGSFuqviT+GWa30w==
X-CSE-MsgGUID: f/wDdnUOQtm+J9OtK6FNsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="114307103"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 18 Feb 2025 08:13:29 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkQDu-0000hR-2p;
	Tue, 18 Feb 2025 16:13:26 +0000
Date: Wed, 19 Feb 2025 00:13:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-lts:pr/60 1/1] cc1: error: arch/sh/include/mach-sh7763rdp: No
 such file or directory
Message-ID: <202502190050.TR1WPDvf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev

tree:   https://github.com/intel/linux-intel-lts.git pr/60
head:   9e3b33a0fe250f006a2d39da8cc8f99a0101e89b
commit: 4c8dd95a723d9cccf8810be54aa62be82885c9d8 [1/1] kbuild: add some extra warning flags unconditionally
:::::: branch date: 28 hours ago
:::::: commit date: 6 years ago
config: sh-randconfig-001-20250218 (https://download.01.org/0day-ci/archive/20250219/202502190050.TR1WPDvf-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502190050.TR1WPDvf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502190050.TR1WPDvf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> cc1: error: arch/sh/include/mach-sh7763rdp: No such file or directory [-Werror=missing-include-dirs]
>> cc1: error: arch/sh/include/mach-sh7763rdp: No such file or directory [-Werror=missing-include-dirs]
   In file included from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from arch/sh/kernel/sys_sh32.c:5:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1218:13: error: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Werror=address]
    1218 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1209:27: note: 'mem_section' declared here
    1209 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> cc1: error: arch/sh/include/mach-sh7763rdp: No such file or directory [-Werror=missing-include-dirs]
>> cc1: error: arch/sh/include/mach-sh7763rdp: No such file or directory [-Werror=missing-include-dirs]
   In file included from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from arch/sh/kernel/sys_sh.c:13:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1218:13: error: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Werror=address]
    1218 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1209:27: note: 'mem_section' declared here
    1209 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   arch/sh/kernel/sys_sh.c: At top level:
   arch/sh/kernel/sys_sh.c:58:16: error: no previous prototype for 'sys_cacheflush' [-Werror=missing-prototypes]
      58 | asmlinkage int sys_cacheflush(unsigned long addr, unsigned long len, int op)
         |                ^~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> cc1: error: arch/sh/include/mach-sh7763rdp: No such file or directory [-Werror=missing-include-dirs]
>> cc1: error: arch/sh/include/mach-sh7763rdp: No such file or directory [-Werror=missing-include-dirs]
   In file included from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from arch/sh/include/asm/cacheflush.h:7,
                    from arch/sh/include/asm/kgdb.h:5,
                    from include/linux/kgdb.h:20,
                    from arch/sh/kernel/kgdb.c:9:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1218:13: error: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Werror=address]
    1218 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1209:27: note: 'mem_section' declared here
    1209 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   arch/sh/kernel/kgdb.c: In function 'kgdb_arch_handle_exception':
   arch/sh/kernel/kgdb.c:267:20: error: this statement may fall through [-Werror=implicit-fallthrough=]
     267 |                 if (kgdb_hex2long(&ptr, &addr))
         |                    ^
   arch/sh/kernel/kgdb.c:269:9: note: here
     269 |         case 'D':
         |         ^~~~
   cc1: all warnings being treated as errors
--
>> cc1: error: arch/sh/include/mach-sh7763rdp: No such file or directory [-Werror=missing-include-dirs]
>> cc1: error: arch/sh/include/mach-sh7763rdp: No such file or directory [-Werror=missing-include-dirs]
   In file included from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from arch/sh/kernel/ptrace_32.c:13:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1218:13: error: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Werror=address]
    1218 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1209:27: note: 'mem_section' declared here
    1209 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   arch/sh/kernel/ptrace_32.c: In function 'arch_ptrace':
   arch/sh/kernel/ptrace_32.c:380:40: error: comparison of unsigned expression in '< 0' is always false [-Werror=type-limits]
     380 |                 if ((addr & 3) || addr < 0 ||
         |                                        ^
   arch/sh/kernel/ptrace_32.c:420:40: error: comparison of unsigned expression in '< 0' is always false [-Werror=type-limits]
     420 |                 if ((addr & 3) || addr < 0 ||
         |                                        ^
   cc1: all warnings being treated as errors
--
>> cc1: error: arch/sh/include/mach-sh7763rdp: No such file or directory [-Werror=missing-include-dirs]
>> cc1: error: arch/sh/include/mach-sh7763rdp: No such file or directory [-Werror=missing-include-dirs]
   In file included from include/linux/gfp.h:6,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:22,
                    from include/linux/module.h:13,
                    from arch/sh/kernel/return_address.c:9:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1218:13: error: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Werror=address]
    1218 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1209:27: note: 'mem_section' declared here
    1209 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   arch/sh/kernel/return_address.c: At top level:
   arch/sh/kernel/return_address.c:49:7: error: no previous prototype for 'return_address' [-Werror=missing-prototypes]
      49 | void *return_address(unsigned int depth)
         |       ^~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> cc1: error: arch/sh/include/mach-sh7763rdp: No such file or directory [-Werror=missing-include-dirs]
>> cc1: error: arch/sh/include/mach-sh7763rdp: No such file or directory [-Werror=missing-include-dirs]
   In file included from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from include/uapi/asm-generic/bpf_perf_event.h:4,
                    from ./arch/sh/include/generated/uapi/asm/bpf_perf_event.h:1,
                    from include/uapi/linux/bpf_perf_event.h:11,
                    from include/linux/perf_event.h:18,
                    from arch/sh/kernel/perf_callchain.c:9:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1218:13: error: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Werror=address]
    1218 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1209:27: note: 'mem_section' declared here
    1209 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   In function 'perf_callchain_store',
       inlined from 'callchain_address' at arch/sh/kernel/perf_callchain.c:24:3:
   include/linux/perf_event.h:1193:26: error: array subscript <unknown> is outside array bounds of '__u64[0]' {aka 'long long unsigned int[]'} [-Werror=array-bounds=]
    1193 |                 entry->ip[entry->nr++] = ip;
         |                 ~~~~~~~~~^~~~~~~~~~~~~
   include/linux/perf_event.h: In function 'callchain_address':
   include/linux/perf_event.h:63:41: note: while referencing 'ip'
      63 |         __u64                           ip[0]; /* /proc/sys/kernel/perf_event_max_stack */
         |                                         ^~
   In function 'perf_callchain_store',
       inlined from 'perf_callchain_kernel' at arch/sh/kernel/perf_callchain.c:35:2:
   include/linux/perf_event.h:1193:26: error: array subscript <unknown> is outside array bounds of '__u64[0]' {aka 'long long unsigned int[]'} [-Werror=array-bounds=]
    1193 |                 entry->ip[entry->nr++] = ip;
         |                 ~~~~~~~~~^~~~~~~~~~~~~
   include/linux/perf_event.h: In function 'perf_callchain_kernel':
   include/linux/perf_event.h:63:41: note: while referencing 'ip'
      63 |         __u64                           ip[0]; /* /proc/sys/kernel/perf_event_max_stack */
         |                                         ^~
   cc1: all warnings being treated as errors
--
>> cc1: error: arch/sh/include/mach-sh7763rdp: No such file or directory [-Werror=missing-include-dirs]
>> cc1: error: arch/sh/include/mach-sh7763rdp: No such file or directory [-Werror=missing-include-dirs]
   In file included from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/sh/kernel/traps_32.c:12:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1218:13: error: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Werror=address]
    1218 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1209:27: note: 'mem_section' declared here
    1209 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   arch/sh/kernel/traps_32.c: At top level:
   arch/sh/kernel/traps_32.c:731:6: error: no previous prototype for 'per_cpu_trap_init' [-Werror=missing-prototypes]
     731 | void per_cpu_trap_init(void)
         |      ^~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> cc1: error: arch/sh/include/mach-sh7763rdp: No such file or directory [-Werror=missing-include-dirs]
>> cc1: error: arch/sh/include/mach-sh7763rdp: No such file or directory [-Werror=missing-include-dirs]
   In file included from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from include/uapi/asm-generic/bpf_perf_event.h:4,
                    from ./arch/sh/include/generated/uapi/asm/bpf_perf_event.h:1,
                    from include/uapi/linux/bpf_perf_event.h:11,
                    from include/linux/perf_event.h:18,
                    from arch/sh/kernel/hw_breakpoint.c:10:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1218:13: error: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Werror=address]
    1218 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1209:27: note: 'mem_section' declared here
    1209 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   arch/sh/kernel/hw_breakpoint.c: At top level:
   arch/sh/kernel/hw_breakpoint.c:135:5: error: no previous prototype for 'arch_bp_generic_fields' [-Werror=missing-prototypes]
     135 | int arch_bp_generic_fields(int sh_len, int sh_type,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   arch/sh/kernel/hw_breakpoint.c: In function 'arch_bp_generic_fields':
   arch/sh/kernel/hw_breakpoint.c:159:27: error: this statement may fall through [-Werror=implicit-fallthrough=]
     159 |                 *gen_type = HW_BREAKPOINT_R;
         |                 ~~~~~~~~~~^~~~~~~~~~~~~~~~~
   arch/sh/kernel/hw_breakpoint.c:160:9: note: here
     160 |         case SH_BREAKPOINT_WRITE:
         |         ^~~~
   cc1: all warnings being treated as errors
--
>> cc1: error: arch/sh/include/mach-sh7763rdp: No such file or directory [-Werror=missing-include-dirs]
>> cc1: error: arch/sh/include/mach-sh7763rdp: No such file or directory [-Werror=missing-include-dirs]
   In file included from include/linux/gfp.h:6,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:22,
                    from include/linux/module.h:13,
                    from arch/sh/kernel/idle.c:7:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1218:13: error: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Werror=address]
    1218 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1209:27: note: 'mem_section' declared here
    1209 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   arch/sh/kernel/idle.c: At top level:
   arch/sh/kernel/idle.c:32:6: error: no previous prototype for 'arch_cpu_idle_dead' [-Werror=missing-prototypes]
      32 | void arch_cpu_idle_dead(void)
         |      ^~~~~~~~~~~~~~~~~~
   arch/sh/kernel/idle.c:37:6: error: no previous prototype for 'arch_cpu_idle' [-Werror=missing-prototypes]
      37 | void arch_cpu_idle(void)
         |      ^~~~~~~~~~~~~
   arch/sh/kernel/idle.c:42:13: error: no previous prototype for 'select_idle_routine' [-Werror=missing-prototypes]
      42 | void __init select_idle_routine(void)
         |             ^~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> cc1: error: arch/sh/include/mach-sh7763rdp: No such file or directory [-Werror=missing-include-dirs]
>> cc1: error: arch/sh/include/mach-sh7763rdp: No such file or directory [-Werror=missing-include-dirs]
   arch/sh/kernel/machvec.c: In function 'early_parse_mv':
   arch/sh/kernel/machvec.c:43:15: error: variable 'mv_comma' set but not used [-Werror=unused-but-set-variable]
      43 |         char *mv_comma;
         |               ^~~~~~~~
   arch/sh/kernel/machvec.c: In function 'sh_mv_setup':
   arch/sh/kernel/machvec.c:104:33: error: array subscript 'struct sh_machine_vector[0]' is partly outside array bounds of 'long int[1]' [-Werror=array-bounds=]
     104 |                         sh_mv = *(struct sh_machine_vector *)&__machvec_start;
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/sh/kernel/machvec.c:13:
   arch/sh/include/asm/sections.h:7:13: note: object '__machvec_start' of size 4
       7 | extern long __machvec_start, __machvec_end;
         |             ^~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> cc1: error: arch/sh/include/mach-sh7763rdp: No such file or directory [-Werror=missing-include-dirs]
>> cc1: error: arch/sh/include/mach-sh7763rdp: No such file or directory [-Werror=missing-include-dirs]
   In file included from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from arch/sh/mm/cache-sh4.c:14:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1218:13: error: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Werror=address]
    1218 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1209:27: note: 'mem_section' declared here
    1209 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   arch/sh/mm/cache-sh4.c: In function 'flush_cache_one':
   arch/sh/mm/cache-sh4.c:99:31: error: 'cached_to_uncached' undeclared (first use in this function); did you mean 'jump_to_uncached'?
      99 |                 exec_offset = cached_to_uncached;
         |                               ^~~~~~~~~~~~~~~~~~
         |                               jump_to_uncached
   arch/sh/mm/cache-sh4.c:99:31: note: each undeclared identifier is reported only once for each function it appears in
   arch/sh/mm/cache-sh4.c: In function 'sh4_flush_cache_mm':
   arch/sh/mm/cache-sh4.c:192:13: error: implicit declaration of function 'cpu_context'; did you mean 'put_io_context'? [-Werror=implicit-function-declaration]
     192 |         if (cpu_context(smp_processor_id(), mm) == NO_CONTEXT)
         |             ^~~~~~~~~~~
         |             put_io_context
   arch/sh/mm/cache-sh4.c: In function 'sh4_flush_cache_range':
   arch/sh/mm/cache-sh4.c:280:30: error: variable 'end' set but not used [-Werror=unused-but-set-variable]
     280 |         unsigned long start, end;
         |                              ^~~
   arch/sh/mm/cache-sh4.c:280:23: error: variable 'start' set but not used [-Werror=unused-but-set-variable]
     280 |         unsigned long start, end;
         |                       ^~~~~
   arch/sh/mm/cache-sh4.c: At top level:
   arch/sh/mm/cache-sh4.c:378:13: error: no previous prototype for 'sh4_cache_init' [-Werror=missing-prototypes]
     378 | void __init sh4_cache_init(void)
         |             ^~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
