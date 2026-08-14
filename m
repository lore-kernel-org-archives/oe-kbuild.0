Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B2436C0AB
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Aug 2026 18:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786733689; cv=none; b=o4zaXlCBsIvSRj27jkCdbO+c18TD6JkwwO7IV3Uic0ivXhS9+x5XxmxIY6NmGBMJFz+NG6h6bv16Ni5aPsaRwHMkdawVVOOKRK0PRMObOrjabK57qTiTEAFgqY9xM290YiHYYvX0ocGv3Zlky/LqFF5jxg3WEdzvYamXplOkkJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786733689; c=relaxed/simple;
	bh=+oZbuQ1VuqsDFSoObOyoSp59YfRNM191tOA9f318ERQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YmkB7DBwrhrcS2/WO3IdaAOEEEYiy4FC204BaTRuzPd9Xq7G0pESEJv0OImteVn69LqvP0pvtR2S9xXRg6ZoIIwd60E26I2FStsbqSvPo1JNHaA/kGvPF3Zdw20C/vTwDTZJwk2CLguAS7JgGTk+T/SMeDKDZriVjelNG9ySGEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N0I4IxGC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N0I4IxGC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786733687; x=1818269687;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+oZbuQ1VuqsDFSoObOyoSp59YfRNM191tOA9f318ERQ=;
  b=N0I4IxGC2cNmKOacLe4OXKSo5l5mbZBtTmakkz8XWmJDwus/ARqb8wt+
   K2QnEMSVL3/Sq0p/A4q1gsKPDkPY8yaxC/VyTapayClgF1FsEcwSxbO5i
   mMLQ8N9mxFOcQqvLPPcU6tr+oUOhMHQBNIDXI8JcNqUm8rrOCWKkxIj4O
   81V33q9tRQKXlQ1dCYUrV8AhH9TCGUTrhN+uRlxjC4fiHJtWDr2t27+xP
   7H3hlZ7SeAqs8wq6umph799cXXn2DldY/AbY3fZfz3vLjn7h6VvMgrSPo
   +bCnZ998DuuVYa43FbDlrejespMjNG2NGxI43BhM+jFWQsHrW28isBf3Q
   g==;
X-CSE-ConnectionGUID: clWs3mM+QEu8Q9A/ij+TnA==
X-CSE-MsgGUID: iAdWfiPuSHqKQB1BEXbFiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="74848015"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="74848015"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 11:54:46 -0700
X-CSE-ConnectionGUID: mm7i2/aVQy6+/D3ofJXhyw==
X-CSE-MsgGUID: KW9E6FiRT9q3X8EJn04ulw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="268559020"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 14 Aug 2026 11:54:46 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wux3D-000000006J3-04TJ;
	Fri, 14 Aug 2026 18:54:43 +0000
Date: Fri, 14 Aug 2026 20:53:55 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android14-kiwi-6.1 212/212] error: Command
 '['aarch64-linux-gnu-gcc', '-Wbad-function-cast',
 '-Wdeclaration-after-statement', '-Wformat-security', '-Wformat-y2k',
 '-Winit-self', '-Wmissing-declarations', '-Wmissing-prototypes',
 '-Wno-system-headers', '-Wold-style-definition', '-Wpac...
Message-ID: <202608142048.eFUmj1f7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Ian,

First bad commit (maybe !=3D root cause):

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   88ff6fc3ff2d7717a7cff52af211ca62e0985ac2
commit: c8def8cde13bfb58e4ac663dfa27713cba54c60e [212/212] tools bitmap: Ad=
d missing asm-generic/bitsperlong.h include
:::::: branch date: 2 days ago
:::::: commit date: 8 months ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/2026=
0814/202608142048.eFUmj1f7-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260814/202608142048.eFUmj1f7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608142048.eFUmj1f7-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
All errors (new ones prefixed by >>):

   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when se=
arching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.so when searchin=
g for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.a when searching=
 for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.so when searchin=
g for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.a when searching=
 for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when se=
arching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when se=
arching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.so when searchin=
g for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.a when searching=
 for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when se=
arching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.so when searchin=
g for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.a when searching=
 for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when se=
arching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.so when searchin=
g for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.a when searching=
 for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when se=
arching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when se=
arching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when se=
arching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when se=
arching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when se=
arching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when se=
arching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.so when searchin=
g for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.a when searching=
 for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when se=
arching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.so when searchin=
g for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.a when searching=
 for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when se=
arching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.so when searchin=
g for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when se=
arching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.a when searching=
 for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.so when searchin=
g for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.a when searching=
 for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when se=
arching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when se=
arching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when se=
arching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when se=
arching for libgcc_s.so.1
   In file included from tools/include/linux/bitmap.h:6,
                    from util/pmu.h:5,
                    from builtin-list.c:14:
   tools/include/asm-generic/bitsperlong.h:14:2: error: #error Inconsistent=
 word size. Check asm/bitsperlong.h
      14 | #error Inconsistent word size. Check asm/bitsperlong.h
         |  ^~~~~
   make[3]: *** [tools/build/Makefile.build:97: builtin-list.o] Error 1
   make[3]: *** Waiting for unfinished jobs....
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when se=
arching for libgcc_s.so.1
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.so when searchin=
g for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libc.a when searching=
 for -lc
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bi=
n/ld: skipping incompatible /usr/lib/x86_64-linux-gnu/libgcc_s.so.1 when se=
arching for libgcc_s.so.1
   In file included from tools/include/linux/bitmap.h:6,
                    from ../lib/bitmap.c:6:
   tools/include/asm-generic/bitsperlong.h:14:2: error: #error Inconsistent=
 word size. Check asm/bitsperlong.h
      14 | #error Inconsistent word size. Check asm/bitsperlong.h
         |  ^~~~~
   builtin-record.c: In function 'cmd_record':
   builtin-record.c:4072:62: error: 'calloc' sizes specified with 'sizeof' =
in the earlier argument and not in the later argument [-Werror=3Dcalloc-tra=
nsposed-args]
    4072 |                 rec->switch_output.filenames =3D calloc(sizeof(c=
har *),
         |                                                              ^~~~
   builtin-record.c:4072:62: note: earlier argument should specify number o=
f elements, later size of each element
   make[4]: *** [util/Build:313: util/bitmap.o] Error 1
   make[4]: *** Waiting for unfinished jobs....
   tests/bpf.c: In function 'epoll_pwait_loop':
   tests/bpf.c:36:17: error: argument 2 null where non-null expected [-Werr=
or=3Dnonnull]
      36 |                 epoll_pwait(-(i + 1), NULL, 0, 0, NULL);
         |                 ^~~~~~~~~~~
   In file included from tests/bpf.c:5:
   /usr/aarch64-linux-gnu/include/sys/epoll.h:148:12: note: in a call to fu=
nction 'epoll_pwait' declared 'nonnull'
     148 | extern int epoll_pwait (int __epfd, struct epoll_event *__events,
         |            ^~~~~~~~~~~
   In file included from tools/include/linux/bitmap.h:6,
                    from util/svghelper.c:16:
   tools/include/asm-generic/bitsperlong.h:14:2: error: #error Inconsistent=
 word size. Check asm/bitsperlong.h
      14 | #error Inconsistent word size. Check asm/bitsperlong.h
         |  ^~~~~
   util/metricgroup.c: In function 'setup_metric_events':
   util/metricgroup.c:269:39: error: 'calloc' sizes specified with 'sizeof'=
 in the earlier argument and not in the later argument [-Werror=3Dcalloc-tr=
ansposed-args]
     269 |         metric_events =3D calloc(sizeof(void *), ids_size + 1);
         |                                       ^~~~
   util/metricgroup.c:269:39: note: earlier argument should specify number =
of elements, later size of each element
   make[4]: *** [tools/build/Makefile.build:96: util/svghelper.o] Error 1
   builtin-top.c: In function 'prompt_integer':
   builtin-top.c:358:21: error: allocation of insufficient size '0' for typ=
e 'char' with size '1' [-Werror=3Dalloc-size]
     358 |         char *buf =3D malloc(0), *p;
         |                     ^~~~~~
   builtin-top.c: In function 'perf_top__prompt_symbol':
   builtin-top.c:393:21: error: allocation of insufficient size '0' for typ=
e 'char' with size '1' [-Werror=3Dalloc-size]
     393 |         char *buf =3D malloc(0), *p;
         |                     ^~~~~~
   util/hist.c: In function 'hist_entry__init':
   util/hist.c:492:49: error: 'calloc' sizes specified with 'sizeof' in the=
 earlier argument and not in the later argument [-Werror=3Dcalloc-transpose=
d-args]
     492 |                 he->res_samples =3D calloc(sizeof(struct res_sam=
ple),
         |                                                 ^~~~~~
   util/hist.c:492:49: note: earlier argument should specify number of elem=
ents, later size of each element
   cc1: all warnings being treated as errors
   In file included from tools/include/linux/bitmap.h:6,
                    from tools/perf/../lib/bitmap.c:6:
   tools/include/asm-generic/bitsperlong.h:14:2: error: #error Inconsistent=
 word size. Check asm/bitsperlong.h
      14 | #error Inconsistent word size. Check asm/bitsperlong.h
         |  ^~~~~
   make[4]: *** [tools/build/Makefile.build:96: tests/bpf.o] Error 1
   make[4]: *** Waiting for unfinished jobs....
>> error: Command '['aarch64-linux-gnu-gcc', '-Wbad-function-cast', '-Wdecl=
aration-after-statement', '-Wformat-security', '-Wformat-y2k', '-Winit-self=
', '-Wmissing-declarations', '-Wmissing-prototypes', '-Wno-system-headers',=
 '-Wold-style-definition', '-Wpacked', '-Wredundant-decls', '-Wstrict-proto=
types', '-Wswitch-default', '-Wswitch-enum', '-Wundef', '-Wwrite-strings', =
'-Wformat', '-Wno-type-limits', '-Wstrict-aliasing=3D3', '-Wshadow', '-DHAV=
E_SYSCALL_TABLE_SUPPORT', '-Iarch/arm64/include/generated', '-DHAVE_PERF_RE=
GS_SUPPORT', '-DHAVE_ARCH_REGS_QUERY_REGISTER_OFFSET', '-Werror', '-O6', '-=
fno-omit-frame-pointer', '-ggdb3', '-funwind-tables', '-Wall', '-Wextra', '=
-std=3Dgnu99', '-fstack-protector-all', '-U_FORTIFY_SOURCE', '-D_FORTIFY_SO=
URCE=3D2', '-D_LARGEFILE64_SOURCE', '-D_FILE_OFFSET_BITS=3D64', '-D_GNU_SOU=
RCE', '-Itools/lib/perf/include', '-Itools/perf/util/include', '-Itools/per=
f/arch/arm64/include', '-Itools/include/', '-Itools/arch/arm64/include/uapi=
', '-Itools/include/uapi', '-Itools/arch/arm64/include/', '-Itools/arch/arm=
64/', '-Itools/perf/util', '-Itools/perf', '-Itools/lib/', '-DHAVE_PTHREAD_=
ATTR_SETAFFINITY_NP', '-DHAVE_PTHREAD_BARRIER', '-DHAVE_EVENTFD_SUPPORT', '=
-DHAVE_GET_CURRENT_DIR_NAME', '-DHAVE_GETTID', '-DHAVE_FILE_HANDLE', '-DHAV=
E_DWARF_GETLOCATIONS_SUPPORT', '-DHAVE_GLIBC_SUPPORT', '-DHAVE_AIO_SUPPORT'=
, '-DHAVE_SCHED_GETCPU_SUPPORT', '-DHAVE_SETNS_SUPPORT', '-DHAVE_LIBELF_SUP=
PORT', '-DHAVE_ELF_GETPHDRNUM_SUPPORT', '-DHAVE_GELF_GETNOTE_SUPPORT', '-DH=
AVE_ELF_GETSHDRSTRNDX_SUPPORT', '-DHAVE_DWARF_SUPPORT', '-DHAVE_LIBBPF_SUPP=
ORT', '-DHAVE_LIBBPF_BTF__LOAD_FROM_KERNEL_BY_ID', '-DHAVE_LIBBPF_BPF_PROG_=
LOAD', '-DHAVE_LIBBPF_BPF_OBJECT__NEXT_PROGRAM', '-DHAVE_LIBBPF_BPF_OBJECT_=
_NEXT_MAP', '-DHAVE_LIBBPF_BPF_PROGRAM__SET_INSNS', '-DHAVE_LIBBPF_BTF__RAW=
_DATA', '-DHAVE_LIBBPF_BPF_MAP_CREATE', '-DHAVE_BPF_PROLOGUE', '-DHAVE_SDT_=
EVENT', '-DHAVE_JITDUMP', '-DHAVE_LIBUNWIND_AARCH64_SUPPORT', '-DHAVE_DWARF=
_UNWIND_SUPPORT', '-DHAVE_LIBUNWIND_SUPPORT', '-DHAVE_LIBCRYPTO_SUPPORT', '=
-DHAVE_SLANG_SUPPORT', '-DHAVE_LIBPERL_SUPPORT', '-DHAVE_TIMERFD_SUPPORT', =
'-DHAVE_LIBPYTHON_SUPPORT', '-DHAVE_CPLUS_DEMANGLE_SUPPORT', '-DHAVE_ZLIB_S=
UPPORT', '-DHAVE_LZMA_SUPPORT', '-DHAVE_ZSTD_SUPPORT', '-DHAVE_LIBCAP_SUPPO=
RT', '-DHAVE_BACKTRACE_SUPPORT', '-DHAVE_LIBNUMA_SUPPORT', '-DHAVE_KVM_STAT=
_SUPPORT', '-DHAVE_LIBBABELTRACE_SUPPORT', '-DHAVE_AUXTRACE_SUPPORT', '-DHA=
VE_JVMTI_CMLR', '-fPIC', '-Iutil/include', '-I/usr/include/python3.13', '-c=
', 'tools/perf/../lib/bitmap.c', '-o', 'python_ext_build/tmptools/perf/../l=
ib/bitmap.o', '-Wbad-function-cast', '-Wdeclaration-after-statement', '-Wfo=
rmat-security', '-Wformat-y2k', '-Winit-self', '-Wmissing-declarations', '-=
Wmissing-prototypes', '-Wno-system-headers', '-Wold-style-definition', '-Wp=
acked', '-Wredundant-decls', '-Wstrict-prototypes', '-Wswitch-default', '-W=
switch-enum', '-Wundef', '-Wwrite-strings', '-Wformat', '-Wno-type-limits',=
 '-Wstrict-aliasing=3D3', '-Wshadow', '-DHAVE_SYSCALL_TABLE_SUPPORT', '-Iar=
ch/arm64/include/generated', '-DHAVE_PERF_REGS_SUPPORT', '-DHAVE_ARCH_REGS_=
QUERY_REGISTER_OFFSET', '-Werror', '-O6', '-fno-omit-frame-pointer', '-ggdb=
3', '-funwind-tables', '-Wall', '-Wextra', '-std=3Dgnu99', '-fstack-protect=
or-all', '-U_FORTIFY_SOURCE', '-D_FORTIFY_SOURCE=3D2', '-D_LARGEFILE64_SOUR=
CE', '-D_FILE_OFFSET_BITS=3D64', '-D_GNU_SOURCE', '-Itools/lib/perf/include=
', '-Itools/perf/util/include', '-Itools/perf/arch/arm64/include', '-Itools=
/include/', '-Itools/arch/arm64/include/uapi', '-Itools/include/uapi', '-It=
ools/arch/arm64/include/', '-Itools/arch/arm64/', '-Itools/perf/util', '-It=
ools/perf', '-Itools/lib/', '-DHAVE_PTHREAD_ATTR_SETAFFINITY_NP', '-DHAVE_P=
THREAD_BARRIER', '-DHAVE_EVENTFD_SUPPORT', '-DHAVE_GET_CURRENT_DIR_NAME', '=
-DHAVE_GETTID', '-DHAVE_FILE_HANDLE', '-DHAVE_DWARF_GETLOCATIONS_SUPPORT', =
'-DHAVE_GLIBC_SUPPORT', '-DHAVE_AIO_SUPPORT', '-DHAVE_SCHED_GETCPU_SUPPORT'=
, '-DHAVE_SETNS_SUPPORT', '-DHAVE_LIBELF_SUPPORT', '-DHAVE_ELF_GETPHDRNUM_S=
UPPORT', '-DHAVE_GELF_GETNOTE_SUPPORT', '-DHAVE_ELF_GETSHDRSTRNDX_SUPPORT',=
 '-DHAVE_DWARF_SUPPORT', '-DHAVE_LIBBPF_SUPPORT', '-DHAVE_LIBBPF_BTF__LOAD_=
FROM_KERNEL_BY_ID', '-DHAVE_LIBBPF_BPF_PROG_LOAD', '-DHAVE_LIBBPF_BPF_OBJEC=
T__NEXT_PROGRAM', '-DHAVE_LIBBPF_BPF_OBJECT__NEXT_MAP', '-DHAVE_LIBBPF_BPF_=
PROGRAM__SET_INSNS', '-DHAVE_LIBBPF_BTF__RAW_DATA', '-DHAVE_LIBBPF_BPF_MAP_=
CREATE', '-DHAVE_BPF_PROLOGUE', '-DHAVE_SDT_EVENT', '-DHAVE_JITDUMP', '-DHA=
VE_LIBUNWIND_AARCH64_SUPPORT', '-DHAVE_DWARF_UNWIND_SUPPORT', '-DHAVE_LIBUN=
WIND_SUPPORT', '-DHAVE_LIBCRYPTO_SUPPORT', '-DHAVE_SLANG_SUPPORT', '-DHAVE_=
LIBPERL_SUPPORT', '-DHAVE_TIMERFD_SUPPORT', '-DHAVE_LIBPYTHON_SUPPORT', '-D=
HAVE_CPLUS_DEMANGLE_SUPPORT', '-DHAVE_ZLIB_SUPPORT', '-DHAVE_LZMA_SUPPORT',=
 '-DHAVE_ZSTD_SUPPORT', '-DHAVE_LIBCAP_SUPPORT', '-DHAVE_BACKTRACE_SUPPORT'=
, '-DHAVE_LIBNUMA_SUPPORT', '-DHAVE_KVM_STAT_SUPPORT', '-DHAVE_LIBBABELTRAC=
E_SUPPORT', '-DHAVE_AUXTRACE_SUPPORT', '-DHAVE_JVMTI_CMLR', '-fno-strict-al=
iasing', '-Wno-write-strings', '-Wno-unused-parameter', '-Wno-redundant-dec=
ls', '-DPYTHON_PERF', '-Wno-cast-function-type']' returned non-zero exit st=
atus 1.
   cp: cannot stat 'python_ext_build/lib/perf*.so': No such file or directo=
ry
   make[2]: *** [Makefile.perf:647: python/perf.so] Error 1
   make[2]: *** Waiting for unfinished jobs....
   cc1: all warnings being treated as errors
   make[4]: *** [tools/build/Makefile.build:96: util/metricgroup.o] Error 1
   cc1: all warnings being treated as errors
   make[3]: *** [tools/build/Makefile.build:96: builtin-top.o] Error 1
   cc1: all warnings being treated as errors
   make[3]: *** [tools/build/Makefile.build:96: builtin-record.o] Error 1
   make[3]: *** [tools/build/Makefile.build:143: tests] Error 2
   cc1: all warnings being treated as errors
   make[4]: *** [tools/build/Makefile.build:96: util/hist.o] Error 1
   make[3]: *** [tools/build/Makefile.build:143: util] Error 2
   make[2]: *** [Makefile.perf:669: perf-in.o] Error 2
   make[1]: *** [Makefile.perf:240: sub-make] Error 2

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
