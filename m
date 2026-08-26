Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E24288C2D
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Aug 2026 02:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787712617; cv=none; b=gGgC3EWyalWXDuprZJCSS4inpZviN5D/FihH/o+4CqLKl22T3JuIs3SHXtr01o6eJ6jFR1Sxe/0AJOcEcrtfh/xzQUDAleYkryrKmwj0MyUbfWeIVBOzkQO3sDcldH2lwiv31o063cyCFBZdOjksNboU4eHaNa61rgv5tp/Hrlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787712617; c=relaxed/simple;
	bh=4otBBA6o2dZoBh90hq/eUL2imWYCkIrtxgwmyDddCRY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PEKn+1x4SBojD8AAre2tGOl6DJDerY4k0X4IqVahI1cvgK7aR8SGFFKnfLqF3TeGyKR8P0iGiDueCLVmSp9KJQ50Jp8wFKLDzorPqpPTeBS3I1hfd99qTnydQFJlO4Abk7QG5UYYWuAVyK7AehIR+f2MN18fhJsM96SiEly/Wf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cn5lSe2j; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cn5lSe2j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787712614; x=1819248614;
  h=date:from:to:cc:subject:message-id;
  bh=4otBBA6o2dZoBh90hq/eUL2imWYCkIrtxgwmyDddCRY=;
  b=Cn5lSe2jX+Ai96ny7caDc6nvs9VVWgV+ANi/8pMJm6FeEzWkSiYnX9+U
   mj+Gfla0NW6RUlFjj6pUoAP+CXEudNC7pNMmtOqOkHvA8RCcKkxS3cx0D
   1y9+BwBomS9Qr4kQVz/ajj/q1JO9hxQqnDfVtlUPEfQMdlLaXidC54tN/
   ow5EhWwWrXmDu0exYqvP+skYn64N+LNJjV4C8bMA2DR1NFEX4miVarpDk
   4S2P7vkf3FfopRNzCEET20O/BJ4rHOM/595xOkf3WbId1T0uuy0pLKGQO
   4YaOqH8tNgiuQFzLeiget7aN9gtgK3TEU6MpNOlU0YneA+2VhO5BAt8hP
   g==;
X-CSE-ConnectionGUID: TlRXAJUSSDmMaKtOa1AoRg==
X-CSE-MsgGUID: /GEp0jvnS+qfEiYqJZ7jrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="98523627"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
   d="scan'208";a="98523627"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 19:50:14 -0700
X-CSE-ConnectionGUID: WY7O+oH/TW2nLOLVM/Ykog==
X-CSE-MsgGUID: kDOvWna/TXu+ay1aAkCbGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
   d="scan'208";a="261310328"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 25 Aug 2026 19:50:11 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wz3iK-000000000FR-0xpU;
	Wed, 26 Aug 2026 02:50:08 +0000
Date: Wed, 26 Aug 2026 04:49:39 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android14-kiwi-6.1 236/236]
 bench/find-bit-bench.c:64:22: error: variable 'old' set but not used
Message-ID: <202608260427.dMQ5hbro-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   64dbe942355cd268b97393aab21308db6d459956
commit: 7bf35a0237d04c1a7dd3dfe8dd02c9c6ce137d6e [236/236] perf build: Conditionally define NDEBUG
:::::: branch date: 12 hours ago
:::::: commit date: 10 weeks ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260826/202608260427.dMQ5hbro-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260826/202608260427.dMQ5hbro-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608260427.dMQ5hbro-lkp@intel.com/

All errors (new ones prefixed by >>):

   Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/kvm.h' differs from latest version at 'arch/x86/include/uapi/asm/kvm.h'
   Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/svm.h' differs from latest version at 'arch/x86/include/uapi/asm/svm.h'
   Warning: Kernel ABI header at 'tools/include/uapi/asm-generic/unistd.h' differs from latest version at 'include/uapi/asm-generic/unistd.h'
   Warning: Kernel ABI header at 'tools/arch/arm64/include/asm/cputype.h' differs from latest version at 'arch/arm64/include/asm/cputype.h'
   Warning: Kernel ABI header at 'tools/perf/arch/powerpc/entry/syscalls/syscall.tbl' differs from latest version at 'arch/powerpc/kernel/syscalls/syscall.tbl'
   Warning: Kernel ABI header at 'tools/perf/arch/s390/entry/syscalls/syscall.tbl' differs from latest version at 'arch/s390/kernel/syscalls/syscall.tbl'
   Warning: Kernel ABI header at 'tools/perf/trace/beauty/include/linux/socket.h' differs from latest version at 'include/linux/socket.h'
   Makefile.config:550: No elfutils/debuginfod.h found, no debuginfo server support, please install libdebuginfod-dev/elfutils-debuginfod-client-devel or equivalent
   Makefile.config:684: No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR
   Makefile.config:949: Old version of libbfd/binutils things like PE executable profiling will not be available
   tools/perf/pmu-events/jevents.py:60: SyntaxWarning: invalid escape sequence '\ '
     all \ are for escaping, it then adjusts as it will have over counted
   scripts/bpf_doc.py:62: SyntaxWarning: invalid escape sequence '\w'
     arg_re = re.compile('((\w+ )*?(\w+|...))( (\**)(\w+))?$')
   scripts/bpf_doc.py:64: SyntaxWarning: invalid escape sequence '\*'
     proto_re = re.compile('(.+) (\**)(\w+)\(((([^,]+)(, )?){1,5})\)$')
   scripts/bpf_doc.py:116: SyntaxWarning: invalid escape sequence '\*'
     p = re.compile(' \* ?(BPF\w+)$')
   scripts/bpf_doc.py:120: SyntaxWarning: invalid escape sequence '\*'
     end_re = re.compile(' \* ?NOTES$')
   scripts/bpf_doc.py:135: SyntaxWarning: invalid escape sequence '\*'
     p = re.compile(' \* ?((.+) \**\w+\((((const )?(struct )?(\w+|\.\.\.)( \**\w+)?)(, )?){1,5}\))$')
   scripts/bpf_doc.py:143: SyntaxWarning: invalid escape sequence '\*'
     p = re.compile(' \* ?(?:\t| {5,8})Description$')
   scripts/bpf_doc.py:156: SyntaxWarning: invalid escape sequence '\*'
     p = re.compile(' \* ?(?:\t| {5,8})(?:\t| {8})(.*)')
   scripts/bpf_doc.py:169: SyntaxWarning: invalid escape sequence '\*'
     p = re.compile(' \* ?(?:\t| {5,8})Return$')
   scripts/bpf_doc.py:182: SyntaxWarning: invalid escape sequence '\*'
     p = re.compile(' \* ?(?:\t| {5,8})(?:\t| {8})(.*)')
   scripts/bpf_doc.py:221: SyntaxWarning: invalid escape sequence '\s'
     bpf_p = re.compile('\s*(BPF\w+)+')
   scripts/bpf_doc.py:226: SyntaxWarning: invalid escape sequence '\s'
     assign_p = re.compile('\s*(BPF\w+)\s*=\s*(BPF\w+)')
   scripts/bpf_doc.py:241: SyntaxWarning: invalid escape sequence '\w'
     self.enum_syscalls = re.findall('(BPF\w+)+', bpf_cmd_str)
   scripts/bpf_doc.py:264: SyntaxWarning: invalid escape sequence '\s'
     p = re.compile('\s*FN\((\w+)\)|\\\\')
   scripts/bpf_doc.py:277: SyntaxWarning: invalid escape sequence '\('
     self.define_unique_helpers = re.findall('FN\(\w+\)', fn_defines_str)
   scripts/bpf_doc.py:410: SyntaxWarning: invalid escape sequence '\*'
     '/{}/,/\*\//:include/uapi/linux/bpf.h'.format(delimiter)]
   scripts/bpf_doc.py:501: SyntaxWarning: invalid escape sequence '\ '
     license string passed (via **attr**) to the **bpf**\ () system call, and this
   scripts/bpf_doc.py:583: SyntaxWarning: invalid escape sequence '\ '
     one_arg += ' {}**\ '.format(a['star'].replace('*', '\\*'))
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.so when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.a when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.so when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.so when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.a when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.a when searching for -lc
     PERF_VERSION = 6.1.175.g7bf35a0237d0
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.so when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.a when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.so when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.a when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.so when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.a when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.so when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.a when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.so when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.a when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.so when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.a when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.so when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.a when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.so when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.a when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.so when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.a when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.so when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.a when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   bench/find-bit-bench.c: In function 'do_for_each_set_bit':
>> bench/find-bit-bench.c:64:22: error: variable 'old' set but not used [-Werror=unused-but-set-variable]
      64 |         unsigned int old;
         |                      ^~~
   cc1: all warnings being treated as errors
   make[4]: *** [tools/build/Makefile.build:97: bench/find-bit-bench.o] Error 1
   make[4]: *** Waiting for unfinished jobs....
   util/block-range.c: In function 'block_range__debug':
>> util/block-range.c:20:13: error: variable 'old' set but not used [-Werror=unused-but-set-variable]
      20 |         u64 old = 0; /* NULL isn't executable */
         |             ^~~
   cc1: all warnings being treated as errors
   make[4]: *** [tools/build/Makefile.build:97: util/block-range.o] Error 1
   make[4]: *** Waiting for unfinished jobs....
   builtin-top.c: In function 'prompt_integer':
   builtin-top.c:358:21: error: allocation of insufficient size '0' for type 'char' with size '1' [-Werror=alloc-size]
     358 |         char *buf = malloc(0), *p;
         |                     ^~~~~~
   builtin-top.c: In function 'perf_top__prompt_symbol':
   builtin-top.c:393:21: error: allocation of insufficient size '0' for type 'char' with size '1' [-Werror=alloc-size]
     393 |         char *buf = malloc(0), *p;
         |                     ^~~~~~
   builtin-record.c: In function 'cmd_record':
   builtin-record.c:4072:62: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
    4072 |                 rec->switch_output.filenames = calloc(sizeof(char *),
         |                                                              ^~~~
   builtin-record.c:4072:62: note: earlier argument should specify number of elements, later size of each element
   tests/bpf.c: In function 'epoll_pwait_loop':
   tests/bpf.c:36:17: error: argument 2 null where non-null expected [-Werror=nonnull]
      36 |                 epoll_pwait(-(i + 1), NULL, 0, 0, NULL);
         |                 ^~~~~~~~~~~
   In file included from tests/bpf.c:5:
   /usr/aarch64-linux-gnu/include/sys/epoll.h:148:12: note: in a call to function 'epoll_pwait' declared 'nonnull'
     148 | extern int epoll_pwait (int __epfd, struct epoll_event *__events,
         |            ^~~~~~~~~~~
   cc1: all warnings being treated as errors
   make[4]: *** [tools/build/Makefile.build:96: tests/bpf.o] Error 1
   make[4]: *** Waiting for unfinished jobs....
   cc1: all warnings being treated as errors
   make[3]: *** [tools/build/Makefile.build:96: builtin-top.o] Error 1
   make[3]: *** Waiting for unfinished jobs....
   make[3]: *** [tools/build/Makefile.build:143: bench] Error 2
   make[3]: *** [tools/build/Makefile.build:143: tests] Error 2
   cc1: all warnings being treated as errors
   make[3]: *** [tools/build/Makefile.build:96: builtin-record.o] Error 1
   make[3]: *** [tools/build/Makefile.build:143: util] Error 2
   make[2]: *** [Makefile.perf:669: perf-in.o] Error 2
   make[2]: *** Waiting for unfinished jobs....
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libnuma.so when searching for -lnuma
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libnuma.a when searching for -lnuma
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libnuma.so when searching for -lnuma
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libnuma.a when searching for -lnuma
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libcap.so when searching for -lcap
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libcap.a when searching for -lcap
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libcap.so when searching for -lcap
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libcap.a when searching for -lcap
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.so when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.a when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.so when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.a when searching for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when searching for libgcc_s.so.1
   make[1]: *** [Makefile.perf:240: sub-make] Error 2

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
