Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE9B373BF1
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Sep 2026 08:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788336887; cv=none; b=J2ByjjrgzJRbZ4UQ+tJJv9+ppKY21venkAWsjDMSCl8sDV4r7vjOIqh4GxJJcvD9QlWOvjY65N5gkZJPA+cUuvBvnfP7Z6HIhZ3PYzW+uypTpymPrrZKXqtgjxvAz9XcLf+ale9ItJSbAxl9qjAdi9v2YE8gmugVtMvpqJmRUak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788336887; c=relaxed/simple;
	bh=4N2aC62h0jwi++kXxYKFHUBfkApnuQzrwxRprF29850=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FQywrVOLH8U0u7h0Ej0vsHJRvtB6dOQwsoKSlmRpUAL9W49Z+4h6RRxQjdhdTCRIcESxjuB37KgBFWHed3hOMvTHCCbOCsTR0Df/5xVAOZwmB1SXcM+F/dlXfxnMe2RJ+z02g8cK63iJOdjZKmbsCVljF6kguyx+nxZk/Wfgz28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bgE50VTG; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bgE50VTG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788336886; x=1819872886;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4N2aC62h0jwi++kXxYKFHUBfkApnuQzrwxRprF29850=;
  b=bgE50VTGdh846XGKR6ZZgkgCXQZw0p4BT6u51E5+48wbZ9hhyaXjfLEO
   DM5UYdWOo/zo40nrtXafGHnhCFFgXMb/zHEk10luNpkanHECoyoMtECSi
   dbutdohQBHy0/reSafyY9Q6BcBS6w8D7FBcakZNhEf8CEzbtJUpylQzI6
   EgXzzDO1j0UJvYCGY6RsXytYa4kkHcJpmsgBy+4pEpecl2P/+OkEEqAdk
   dX76IC5k40ExSHX5mY8JF55Gj8StTSf4ku3lJrktqrkT1lWSJy/wm/bqd
   COxx9zZ9cYTcs7jQhbSg0wAvVxzkFG8BjpQkoA0i/J3XhTdaQp7qaPlyG
   w==;
X-CSE-ConnectionGUID: oc3u4BwUT9ui8dtaCjsbMA==
X-CSE-MsgGUID: ndnMGP9IR/OO0rLQD67OTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="111556010"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="111556010"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 01:14:45 -0700
X-CSE-ConnectionGUID: 8c1N5GbsTES2gFXasLjn6g==
X-CSE-MsgGUID: sc+6ZaVbQ8uOmxRa+Us69A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="273106387"
Received: from igk-lkp-server01.igk.intel.com (HELO 05545efcfdd3) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 02 Sep 2026 01:14:44 -0700
Received: from kbuild by 05545efcfdd3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1g7F-0000000009H-2tPS;
	Wed, 02 Sep 2026 08:14:41 +0000
Date: Wed, 02 Sep 2026 10:14:28 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android14-kiwi-6.1 245/245] error: Command
 '['gcc-14', '-Wbad-function-cast', '-Wdeclaration-after-statement',
 '-Wformat-security', '-Wformat-y2k', '-Winit-self', '-Wmissing-declarations',
 '-Wmissing-prototypes', '-Wno-system-headers', '-Wold-style-definition',
 '-Wpacked', '-Wredund...
Message-ID: <202609021031.DdKKwLBl-lkp@intel.com>
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
head:   56294339376d1c7122afb345cbc9d6148921d11c
commit: c8def8cde13bfb58e4ac663dfa27713cba54c60e [245/245] tools bitmap: Ad=
d missing asm-generic/bitsperlong.h include
:::::: branch date: 9 hours ago
:::::: commit date: 9 months ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/202=
60902/202609021031.DdKKwLBl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260902/202609021031.DdKKwLBl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609021031.DdKKwLBl-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
All errors (new ones prefixed by >>):

   Warning: Kernel ABI header at 'tools/include/uapi/linux/const.h' differs=
 from latest version at 'include/uapi/linux/const.h'
   Warning: Kernel ABI header at 'tools/include/uapi/linux/in.h' differs fr=
om latest version at 'include/uapi/linux/in.h'
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/disabled-featu=
res.h' differs from latest version at 'arch/x86/include/asm/disabled-featur=
es.h'
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/required-featu=
res.h' differs from latest version at 'arch/x86/include/asm/required-featur=
es.h'
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/cpufeatures.h'=
 differs from latest version at 'arch/x86/include/asm/cpufeatures.h'
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/msr-index.h' d=
iffers from latest version at 'arch/x86/include/asm/msr-index.h'
   Warning: Kernel ABI header at 'tools/arch/arm64/include/uapi/asm/perf_re=
gs.h' differs from latest version at 'arch/arm64/include/uapi/asm/perf_regs=
.h'
   Warning: Kernel ABI header at 'tools/arch/x86/include/uapi/asm/svm.h' di=
ffers from latest version at 'arch/x86/include/uapi/asm/svm.h'
   Warning: Kernel ABI header at 'tools/include/uapi/asm-generic/unistd.h' =
differs from latest version at 'include/uapi/asm-generic/unistd.h'
   Warning: Kernel ABI header at 'tools/arch/arm64/include/asm/cputype.h' d=
iffers from latest version at 'arch/arm64/include/asm/cputype.h'
   Warning: Kernel ABI header at 'tools/perf/arch/powerpc/entry/syscalls/sy=
scall.tbl' differs from latest version at 'arch/powerpc/kernel/syscalls/sys=
call.tbl'
   Warning: Kernel ABI header at 'tools/perf/arch/s390/entry/syscalls/sysca=
ll.tbl' differs from latest version at 'arch/s390/kernel/syscalls/syscall.t=
bl'
   Warning: Kernel ABI header at 'tools/perf/trace/beauty/include/linux/soc=
ket.h' differs from latest version at 'include/linux/socket.h'
   Makefile.config:549: No elfutils/debuginfod.h found, no debuginfo server=
 support, please install libdebuginfod-dev/elfutils-debuginfod-client-devel=
 or equivalent
   Makefile.config:683: No libunwind found. Please install libunwind-dev[el=
] >=3D 1.1 and/or set LIBUNWIND_DIR
   tools/perf/pmu-events/jevents.py:60: SyntaxWarning: invalid escape seque=
nce '\ '
     all \ are for escaping, it then adjusts as it will have over counted
   scripts/bpf_doc.py:62: SyntaxWarning: invalid escape sequence '\w'
     arg_re =3D re.compile('((\w+ )*?(\w+|...))( (\**)(\w+))?$')
   scripts/bpf_doc.py:64: SyntaxWarning: invalid escape sequence '\*'
     proto_re =3D re.compile('(.+) (\**)(\w+)\(((([^,]+)(, )?){1,5})\)$')
   scripts/bpf_doc.py:116: SyntaxWarning: invalid escape sequence '\*'
     p =3D re.compile(' \* ?(BPF\w+)$')
   scripts/bpf_doc.py:120: SyntaxWarning: invalid escape sequence '\*'
     end_re =3D re.compile(' \* ?NOTES$')
   scripts/bpf_doc.py:135: SyntaxWarning: invalid escape sequence '\*'
     p =3D re.compile(' \* ?((.+) \**\w+\((((const )?(struct )?(\w+|\.\.\.)=
( \**\w+)?)(, )?){1,5}\))$')
   scripts/bpf_doc.py:143: SyntaxWarning: invalid escape sequence '\*'
     p =3D re.compile(' \* ?(?:\t| {5,8})Description$')
   scripts/bpf_doc.py:156: SyntaxWarning: invalid escape sequence '\*'
     p =3D re.compile(' \* ?(?:\t| {5,8})(?:\t| {8})(.*)')
   scripts/bpf_doc.py:169: SyntaxWarning: invalid escape sequence '\*'
     p =3D re.compile(' \* ?(?:\t| {5,8})Return$')
   scripts/bpf_doc.py:182: SyntaxWarning: invalid escape sequence '\*'
     p =3D re.compile(' \* ?(?:\t| {5,8})(?:\t| {8})(.*)')
   scripts/bpf_doc.py:221: SyntaxWarning: invalid escape sequence '\s'
     bpf_p =3D re.compile('\s*(BPF\w+)+')
   scripts/bpf_doc.py:226: SyntaxWarning: invalid escape sequence '\s'
     assign_p =3D re.compile('\s*(BPF\w+)\s*=3D\s*(BPF\w+)')
   scripts/bpf_doc.py:241: SyntaxWarning: invalid escape sequence '\w'
     self.enum_syscalls =3D re.findall('(BPF\w+)+', bpf_cmd_str)
   scripts/bpf_doc.py:264: SyntaxWarning: invalid escape sequence '\s'
     p =3D re.compile('\s*FN\((\w+)\)|\\\\')
   scripts/bpf_doc.py:277: SyntaxWarning: invalid escape sequence '\('
     self.define_unique_helpers =3D re.findall('FN\(\w+\)', fn_defines_str)
   scripts/bpf_doc.py:410: SyntaxWarning: invalid escape sequence '\*'
     '/{}/,/\*\//:include/uapi/linux/bpf.h'.format(delimiter)]
   scripts/bpf_doc.py:501: SyntaxWarning: invalid escape sequence '\ '
     license string passed (via **attr**) to the **bpf**\ () system call, a=
nd this
   scripts/bpf_doc.py:583: SyntaxWarning: invalid escape sequence '\ '
     one_arg +=3D ' {}**\ '.format(a['star'].replace('*', '\\*'))
     PERF_VERSION =3D 6.1.158.gc8def8cde13b
   In file included from tools/include/linux/bitmap.h:6,
                    from util/pmu.h:5,
                    from builtin-list.c:14:
   tools/include/asm-generic/bitsperlong.h:14:2: error: #error Inconsistent=
 word size. Check asm/bitsperlong.h
      14 | #error Inconsistent word size. Check asm/bitsperlong.h
         |  ^~~~~
   make[3]: *** [tools/build/Makefile.build:97: builtin-list.o] Error 1
   make[3]: *** Waiting for unfinished jobs....
   builtin-record.c: In function 'cmd_record':
   builtin-record.c:4072:62: error: 'calloc' sizes specified with 'sizeof' =
in the earlier argument and not in the later argument [-Werror=3Dcalloc-tra=
nsposed-args]
    4072 |                 rec->switch_output.filenames =3D calloc(sizeof(c=
har *),
         |                                                              ^~~~
   builtin-record.c:4072:62: note: earlier argument should specify number o=
f elements, later size of each element
   In file included from tools/include/linux/bitmap.h:6,
                    from tools/perf/util/pmu.h:5,
                    from arch/x86/util/topdown.c:4:
   tools/include/asm-generic/bitsperlong.h:14:2: error: #error Inconsistent=
 word size. Check asm/bitsperlong.h
      14 | #error Inconsistent word size. Check asm/bitsperlong.h
         |  ^~~~~
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
   make[6]: *** [tools/build/Makefile.build:96: arch/x86/util/topdown.o] Er=
ror 1
   make[6]: *** Waiting for unfinished jobs....
   make[5]: *** [tools/build/Makefile.build:143: util] Error 2
   make[5]: *** Waiting for unfinished jobs....
   In file included from tools/include/linux/bitmap.h:6,
                    from tools/perf/../lib/bitmap.c:6:
   tools/include/asm-generic/bitsperlong.h:14:2: error: #error Inconsistent=
 word size. Check asm/bitsperlong.h
      14 | #error Inconsistent word size. Check asm/bitsperlong.h
         |  ^~~~~
>> error: Command '['gcc-14', '-Wbad-function-cast', '-Wdeclaration-after-s=
tatement', '-Wformat-security', '-Wformat-y2k', '-Winit-self', '-Wmissing-d=
eclarations', '-Wmissing-prototypes', '-Wno-system-headers', '-Wold-style-d=
efinition', '-Wpacked', '-Wredundant-decls', '-Wstrict-prototypes', '-Wswit=
ch-default', '-Wswitch-enum', '-Wundef', '-Wwrite-strings', '-Wformat', '-W=
no-type-limits', '-Wstrict-aliasing=3D3', '-Wshadow', '-DHAVE_SYSCALL_TABLE=
_SUPPORT', '-DHAVE_ARCH_X86_64_SUPPORT', '-Iarch/x86/include/generated', '-=
DHAVE_PERF_REGS_SUPPORT', '-DHAVE_ARCH_REGS_QUERY_REGISTER_OFFSET', '-Werro=
r', '-O6', '-fno-omit-frame-pointer', '-ggdb3', '-funwind-tables', '-Wall',=
 '-Wextra', '-std=3Dgnu99', '-fstack-protector-all', '-U_FORTIFY_SOURCE', '=
-D_FORTIFY_SOURCE=3D2', '-D_LARGEFILE64_SOURCE', '-D_FILE_OFFSET_BITS=3D64'=
, '-D_GNU_SOURCE', '-Itools/lib/perf/include', '-Itools/perf/util/include',=
 '-Itools/perf/arch/x86/include', '-Itools/include/', '-Itools/arch/x86/inc=
lude/uapi', '-Itools/include/uapi', '-Itools/arch/x86/include/', '-Itools/a=
rch/x86/', '-Itools/perf/util', '-Itools/perf', '-Itools/lib/', '-DHAVE_PTH=
READ_ATTR_SETAFFINITY_NP', '-DHAVE_PTHREAD_BARRIER', '-DHAVE_EVENTFD_SUPPOR=
T', '-DHAVE_GET_CURRENT_DIR_NAME', '-DHAVE_GETTID', '-DHAVE_FILE_HANDLE', '=
-DHAVE_DWARF_GETLOCATIONS_SUPPORT', '-DHAVE_GLIBC_SUPPORT', '-DHAVE_AIO_SUP=
PORT', '-DHAVE_SCHED_GETCPU_SUPPORT', '-DHAVE_SETNS_SUPPORT', '-DHAVE_LIBEL=
F_SUPPORT', '-DHAVE_ELF_GETPHDRNUM_SUPPORT', '-DHAVE_GELF_GETNOTE_SUPPORT',=
 '-DHAVE_ELF_GETSHDRSTRNDX_SUPPORT', '-DHAVE_DWARF_SUPPORT', '-DHAVE_LIBBPF=
_SUPPORT', '-DHAVE_LIBBPF_BTF__LOAD_FROM_KERNEL_BY_ID', '-DHAVE_LIBBPF_BPF_=
PROG_LOAD', '-DHAVE_LIBBPF_BPF_OBJECT__NEXT_PROGRAM', '-DHAVE_LIBBPF_BPF_OB=
JECT__NEXT_MAP', '-DHAVE_LIBBPF_BPF_PROGRAM__SET_INSNS', '-DHAVE_LIBBPF_BTF=
__RAW_DATA', '-DHAVE_LIBBPF_BPF_MAP_CREATE', '-DHAVE_BPF_PROLOGUE', '-DHAVE=
_SDT_EVENT', '-DHAVE_JITDUMP', '-DHAVE_DWARF_UNWIND_SUPPORT', '-DHAVE_LIBCR=
YPTO_SUPPORT', '-DHAVE_SLANG_SUPPORT', '-DHAVE_LIBPERL_SUPPORT', '-DHAVE_TI=
MERFD_SUPPORT', '-DHAVE_LIBPYTHON_SUPPORT', '-DHAVE_LIBBFD_BUILDID_SUPPORT'=
, '-DHAVE_CPLUS_DEMANGLE_SUPPORT', '-DHAVE_LIBBFD_SUPPORT', '-DHAVE_ZLIB_SU=
PPORT', '-DHAVE_LZMA_SUPPORT', '-DHAVE_ZSTD_SUPPORT', '-DHAVE_LIBCAP_SUPPOR=
T', '-DHAVE_BACKTRACE_SUPPORT', '-DHAVE_LIBNUMA_SUPPORT', '-DHAVE_KVM_STAT_=
SUPPORT', '-DDISASM_FOUR_ARGS_SIGNATURE', '-DDISASM_INIT_STYLED', '-DHAVE_P=
ERF_READ_VDSO32', '-DHAVE_PERF_READ_VDSOX32', '-DHAVE_LIBBABELTRACE_SUPPORT=
', '-DHAVE_AUXTRACE_SUPPORT', '-DHAVE_JVMTI_CMLR', '-fPIC', '-Iutil/include=
', '-I/usr/include/python3.13', '-c', 'tools/perf/../lib/bitmap.c', '-o', '=
python_ext_build/tmptools/perf/../lib/bitmap.o', '-Wbad-function-cast', '-W=
declaration-after-statement', '-Wformat-security', '-Wformat-y2k', '-Winit-=
self', '-Wmissing-declarations', '-Wmissing-prototypes', '-Wno-system-heade=
rs', '-Wold-style-definition', '-Wpacked', '-Wredundant-decls', '-Wstrict-p=
rototypes', '-Wswitch-default', '-Wswitch-enum', '-Wundef', '-Wwrite-string=
s', '-Wformat', '-Wno-type-limits', '-Wstrict-aliasing=3D3', '-Wshadow', '-=
DHAVE_SYSCALL_TABLE_SUPPORT', '-DHAVE_ARCH_X86_64_SUPPORT', '-Iarch/x86/inc=
lude/generated', '-DHAVE_PERF_REGS_SUPPORT', '-DHAVE_ARCH_REGS_QUERY_REGIST=
ER_OFFSET', '-Werror', '-O6', '-fno-omit-frame-pointer', '-ggdb3', '-funwin=
d-tables', '-Wall', '-Wextra', '-std=3Dgnu99', '-fstack-protector-all', '-U=
_FORTIFY_SOURCE', '-D_FORTIFY_SOURCE=3D2', '-D_LARGEFILE64_SOURCE', '-D_FIL=
E_OFFSET_BITS=3D64', '-D_GNU_SOURCE', '-Itools/lib/perf/include', '-Itools/=
perf/util/include', '-Itools/perf/arch/x86/include', '-Itools/include/', '-=
Itools/arch/x86/include/uapi', '-Itools/include/uapi', '-Itools/arch/x86/in=
clude/', '-Itools/arch/x86/', '-Itools/perf/util', '-Itools/perf', '-Itools=
/lib/', '-DHAVE_PTHREAD_ATTR_SETAFFINITY_NP', '-DHAVE_PTHREAD_BARRIER', '-D=
HAVE_EVENTFD_SUPPORT', '-DHAVE_GET_CURRENT_DIR_NAME', '-DHAVE_GETTID', '-DH=
AVE_FILE_HANDLE', '-DHAVE_DWARF_GETLOCATIONS_SUPPORT', '-DHAVE_GLIBC_SUPPOR=
T', '-DHAVE_AIO_SUPPORT', '-DHAVE_SCHED_GETCPU_SUPPORT', '-DHAVE_SETNS_SUPP=
ORT', '-DHAVE_LIBELF_SUPPORT', '-DHAVE_ELF_GETPHDRNUM_SUPPORT', '-DHAVE_GEL=
F_GETNOTE_SUPPORT', '-DHAVE_ELF_GETSHDRSTRNDX_SUPPORT', '-DHAVE_DWARF_SUPPO=
RT', '-DHAVE_LIBBPF_SUPPORT', '-DHAVE_LIBBPF_BTF__LOAD_FROM_KERNEL_BY_ID', =
'-DHAVE_LIBBPF_BPF_PROG_LOAD', '-DHAVE_LIBBPF_BPF_OBJECT__NEXT_PROGRAM', '-=
DHAVE_LIBBPF_BPF_OBJECT__NEXT_MAP', '-DHAVE_LIBBPF_BPF_PROGRAM__SET_INSNS',=
 '-DHAVE_LIBBPF_BTF__RAW_DATA', '-DHAVE_LIBBPF_BPF_MAP_CREATE', '-DHAVE_BPF=
_PROLOGUE', '-DHAVE_SDT_EVENT', '-DHAVE_JITDUMP', '-DHAVE_DWARF_UNWIND_SUPP=
ORT', '-DHAVE_LIBCRYPTO_SUPPORT', '-DHAVE_SLANG_SUPPORT', '-DHAVE_LIBPERL_S=
UPPORT', '-DHAVE_TIMERFD_SUPPORT', '-DHAVE_LIBPYTHON_SUPPORT', '-DHAVE_LIBB=
FD_BUILDID_SUPPORT', '-DHAVE_CPLUS_DEMANGLE_SUPPORT', '-DHAVE_LIBBFD_SUPPOR=
T', '-DHAVE_ZLIB_SUPPORT', '-DHAVE_LZMA_SUPPORT', '-DHAVE_ZSTD_SUPPORT', '-=
DHAVE_LIBCAP_SUPPORT', '-DHAVE_BACKTRACE_SUPPORT', '-DHAVE_LIBNUMA_SUPPORT'=
, '-DHAVE_KVM_STAT_SUPPORT', '-DDISASM_FOUR_ARGS_SIGNATURE', '-DDISASM_INIT=
_STYLED', '-DHAVE_PERF_READ_VDSO32', '-DHAVE_PERF_READ_VDSOX32', '-DHAVE_LI=
BBABELTRACE_SUPPORT', '-DHAVE_AUXTRACE_SUPPORT', '-DHAVE_JVMTI_CMLR', '-fno=
-strict-aliasing', '-Wno-write-strings', '-Wno-unused-parameter', '-Wno-red=
undant-decls', '-DPYTHON_PERF', '-Wno-cast-function-type']' returned non-ze=
ro exit status 1.
   make[4]: *** [tools/build/Makefile.build:143: x86] Error 2
   make[3]: *** [tools/build/Makefile.build:143: arch] Error 2
   cp: cannot stat 'python_ext_build/lib/perf*.so': No such file or directo=
ry
   make[2]: *** [Makefile.perf:647: python/perf.so] Error 1
   make[2]: *** Waiting for unfinished jobs....
   In file included from tools/include/linux/bitmap.h:6,
                    from ../lib/bitmap.c:6:
   tools/include/asm-generic/bitsperlong.h:14:2: error: #error Inconsistent=
 word size. Check asm/bitsperlong.h
      14 | #error Inconsistent word size. Check asm/bitsperlong.h
         |  ^~~~~
   make[4]: *** [util/Build:313: util/bitmap.o] Error 1
   make[4]: *** Waiting for unfinished jobs....
   tests/bpf.c: In function 'epoll_pwait_loop':
   tests/bpf.c:36:17: error: argument 2 null where non-null expected [-Werr=
or=3Dnonnull]
      36 |                 epoll_pwait(-(i + 1), NULL, 0, 0, NULL);
         |                 ^~~~~~~~~~~
   In file included from tests/bpf.c:5:
   /usr/include/x86_64-linux-gnu/sys/epoll.h:148:12: note: in a call to fun=
ction 'epoll_pwait' declared 'nonnull'
     148 | extern int epoll_pwait (int __epfd, struct epoll_event *__events,
         |            ^~~~~~~~~~~
   cc1: all warnings being treated as errors
   make[3]: *** [tools/build/Makefile.build:96: builtin-top.o] Error 1
   cc1: all warnings being treated as errors
   make[4]: *** [tools/build/Makefile.build:97: tests/bpf.o] Error 1
   make[4]: *** Waiting for unfinished jobs....
   make[3]: *** [tools/build/Makefile.build:143: tests] Error 2
   cc1: all warnings being treated as errors
   make[3]: *** [tools/build/Makefile.build:96: builtin-record.o] Error 1
   make[3]: *** [tools/build/Makefile.build:143: util] Error 2
   make[2]: *** [Makefile.perf:669: perf-in.o] Error 2
   make[1]: *** [Makefile.perf:240: sub-make] Error 2

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
