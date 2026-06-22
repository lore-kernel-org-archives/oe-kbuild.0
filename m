Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A87A18C02E
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Jun 2026 23:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782171378; cv=none; b=hr0Q4+dDU2QAtMRWJn1ardVuPomwfLMwjdN5fae/vCY7eq58Qw3YjDgGzFfcNR4D2e1RALiyFi4vzaciQwiGMPJqbisMA7q5o4ZgE+/i7V0arso5Fw9+kGybRDwthBCECS4x6Ut5ws2wePzMy4+9MeffN4XLdkqeRYcAWeCUliM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782171378; c=relaxed/simple;
	bh=IB3SmoReOAzv7e/Nexr2uohSHJhB5ahPSN7UhS4AaLA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TrVxP64nOVOqyR0kyvNC7+clP7Bb04m6suZt7bD0UcQ9QV4OKZGyVbwc3u6GNmNxfOoizdxXtqdeAROhVlV2iLcyjhDKisoMMGpzPrr7vUTGgIAFJuuWp1FcrF4oGYA7OGypAYakF/dcicgQkmuyU7oJjyEwkgFNYi8MBiK3e9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fR6K2MtY; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fR6K2MtY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782171376; x=1813707376;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=IB3SmoReOAzv7e/Nexr2uohSHJhB5ahPSN7UhS4AaLA=;
  b=fR6K2MtYsDmrbY/s4QSsVGRq6/XW4mzy6y64Qny2oxHs0Wv6JbAiftRO
   9RqUT9g7CoCzeyWJEcdoOtUnFu0nqKP/DcKDJVqRrlqT0d8kU/joblebr
   dq7ESrS8p8FHNyyWfnnih8v5ssP0KCXwdBq2psi41T8Qv2ElRKNYsUcvX
   lZaMezVj8y9OnzD31d254Hqj403MjkVTMzHxMV1rzW4umx2g/DspUZokH
   ZExmzh9+tWWWhGWbQJE8OVcQJ2fn52+642Cw2J8ce9D0gDLqiCf3hGNHv
   rvD7tl/7vnisswMR3C2RMsw6DsXV6ey56P7eKZ2raK+4h1rHkwu9EK19M
   g==;
X-CSE-ConnectionGUID: tCGyJJ+lSIq4JwLG3JGykQ==
X-CSE-MsgGUID: gUtJdqL+R76NHOFw2rljLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="83100293"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="83100293"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 16:36:15 -0700
X-CSE-ConnectionGUID: mUp6uJD7TYm1RdVrv5tfUQ==
X-CSE-MsgGUID: TfiRaoOQRC2gQI8mDuNOSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="273422270"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 22 Jun 2026 16:36:14 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wboBU-0000000023t-3O4t;
	Mon, 22 Jun 2026 23:36:09 +0000
Date: Tue, 23 Jun 2026 07:35:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [peterz-queue:sched/flat 63/63] /bin/bash: line 1: 843205
 Segmentation fault      clang -Wp,-MMD,kernel/sched/.fair.o.d -nostdinc
 -Iarch/powerpc/include -I./arch/powerpc/include/generated -Iinclude
 -I./include -Iarch/powerpc/include/uapi
 -I./arch/powerpc/include/generated/uapi -Iinclude...
Message-ID: <202606230703.mrw8qC37-lkp@intel.com>
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
:::::: Manual check reason: "clang compiler bug"
:::::: Manual check reason: "extra build warning to Peter Zijlstra"
::::::=20

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: "Peter Zijlstra (Intel)" <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sc=
hed/flat
head:   7eb85c33dd206641f641e4d229bf3089cf3b6f72
commit: 7eb85c33dd206641f641e4d229bf3089cf3b6f72 [63/63] sched/eevdf: Move =
to a single runqueue
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: powerpc-randconfig-002-20260623 (https://download.01.org/0day-ci/ar=
chive/20260623/202606230703.mrw8qC37-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project a9b=
492db3d50683e446cd1a5c9ffaf4e92cb77a7)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260623/202606230703.mrw8qC37-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606230703.mrw8qC37-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
All errors (new ones prefixed by >>):

   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace and dumped files.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,kernel/sched/.fair.o.d -nostdinc -I=
arch/powerpc/include -I./arch/powerpc/include/generated -Iinclude -I./inclu=
de -Iarch/powerpc/include/uapi -I./arch/powerpc/include/generated/uapi -Iin=
clude/uapi -I./include/generated/uapi -include include/linux/compiler-versi=
on.h -include include/linux/kconfig.h -include include/linux/compiler_types=
.h -D__KERNEL__ --target=3Dpowerpc64le-linux-gnu -fintegrated-as -Werror=3Du=
nknown-warning-option -Werror=3Dignored-optimization-argument -Werror=3Dopt=
ion-ignored -Werror=3Dunused-command-line-argument -mbig-endian -m32 -I arc=
h/powerpc -DHAVE_AS_ATHIGH=3D1 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EX=
TRA_WARN1 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-al=
iasing -std=3Dgnu11 -fms-anonymous-structs -Wno-gnu -Wno-microsoft-anon-tag=
 -msoft-float -mcpu=3Dpowerpc -mno-prefixed -mno-pcrel -mno-altivec -mno-vs=
x -mno-mma -mno-spe -fno-asynchronous-unwind-tables -mbig-endian -fno-delet=
e-null-pointer-checks -O2 -fno-stack-protector -fomit-frame-pointer -ftrivi=
al-auto-var-init=3Dzero -fexperimental-late-parse-attributes -fdiagnostics-=
show-inlining-chain -falign-functions=3D4 -fstrict-flex-arrays=3D3 -fno-str=
ict-overflow -fno-stack-check -fno-builtin-wcslen -Wall -Wextra -Wundef -We=
rror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dretur=
n-type -Werror=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -Wno=
-frame-address -Wno-address-of-packed-member -Wmissing-declarations -Wmissi=
ng-prototypes -Wno-format-overflow-non-kprintf -Wno-format-truncation-non-k=
printf -Wno-default-const-init-unsafe -Wno-type-limits -Wno-pointer-sign -W=
cast-function-type -Wno-unterminated-string-initialization -Wimplicit-fallt=
hrough -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wenum-conv=
ersion -Wunused -Wmissing-format-attribute -Wmissing-include-dirs -Wunused-=
const-variable -Wno-missing-field-initializers -Wno-shift-negative-value -W=
no-enum-enum-conversion -Wno-sign-compare -Wno-unused-parameter -g -fno-var=
-tracking -gz=3Dzlib -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wretu=
rn-type -funsigned-char -Wundef -falign-functions=3D64 -Wno-unused-but-set-=
variable -fsanitize=3Darray-bounds -fsanitize=3Dshift -fsanitize=3Dunreacha=
ble -fsanitize=3Dbool -Ikernel/sched -Ikernel/sched -ffunction-sections -fd=
ata-sections -DKBUILD_MODFILE=3D\"kernel/sched/fair\" -DKBUILD_BASENAME=3D\=
"fair\" -DKBUILD_MODNAME=3D\"fair\" -D__KBUILD_MODNAME=3Dfair -c -o kernel/=
sched/fair.o kernel/sched/fair.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'kernel/sched/fair.c'.
   4.	Running pass 'PowerPC DAG->DAG Pattern Instruction Selection' on func=
tion '@__dequeue_task'
   #0 0x000055f5ac0752db llvm::sys::PrintStackTrace(llvm::raw_ostream&, int=
) (clang-23+0x3ed22db)
   #1 0x000055f5ac072ea4 llvm::sys::CleanupOnSignal(unsigned long) (clang-2=
3+0x3ecfea4)
   #2 0x000055f5abfa79e0 CrashRecoverySignalHandler(int) CrashRecoveryConte=
xt.cpp:0:0
   #3 0x00007f8f707bbdf0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
   #4 0x000055f5aa4e798e CC_AIX(unsigned int, llvm::MVT, llvm::MVT, llvm::C=
CValAssign::LocInfo, llvm::ISD::ArgFlagsTy, llvm::Type*, llvm::CCState&) PP=
CISelLowering.cpp:0:0
   #5 0x000055f5b7e35870
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 843205 Segmentation fault      clang -Wp,-MMD,kernel/=
sched/.fair.o.d -nostdinc -Iarch/powerpc/include -I./arch/powerpc/include/g=
enerated -Iinclude -I./include -Iarch/powerpc/include/uapi -I./arch/powerpc=
/include/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include =
include/linux/compiler-version.h -include include/linux/kconfig.h -include =
include/linux/compiler_types.h -D__KERNEL__ --target=3Dpowerpc64le-linux-gn=
u -fintegrated-as -Werror=3Dunknown-warning-option -Werror=3Dignored-optimi=
zation-argument -Werror=3Doption-ignored -Werror=3Dunused-command-line-argu=
ment -mbig-endian -m32 -I arch/powerpc -DHAVE_AS_ATHIGH=3D1 -fmacro-prefix-=
map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -fshort-wchar -funsigned-char -fno-c=
ommon -fno-PIE -fno-strict-aliasing -std=3Dgnu11 -fms-anonymous-structs -Wn=
o-gnu -Wno-microsoft-anon-tag -msoft-float -mcpu=3Dpowerpc -mno-prefixed -m=
no-pcrel -mno-altivec -mno-vsx -mno-mma -mno-spe -fno-asynchronous-unwind-t=
ables -mbig-endian -fno-delete-null-pointer-checks -O2 -fno-stack-protector=
 -fomit-frame-pointer -ftrivial-auto-var-init=3Dzero -fexperimental-late-pa=
rse-attributes -fdiagnostics-show-inlining-chain -falign-functions=3D4 -fst=
rict-flex-arrays=3D3 -fno-strict-overflow -fno-stack-check -fno-builtin-wcs=
len -Wall -Wextra -Wundef -Werror=3Dimplicit-function-declaration -Werror=
=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-form=
at-security -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member=
 -Wmissing-declarations -Wmissing-prototypes -Wno-format-overflow-non-kprin=
tf -Wno-format-truncation-non-kprintf -Wno-default-const-init-unsafe -Wno-t=
ype-limits -Wno-pointer-sign -Wcast-function-type -Wno-unterminated-string-=
initialization -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Dincompa=
tible-pointer-types -Wenum-conversion -Wunused -Wmissing-format-attribute -=
Wmissing-include-dirs -Wunused-const-variable -Wno-missing-field-initialize=
rs -Wno-shift-negative-value -Wno-enum-enum-conversion -Wno-sign-compare -W=
no-unused-parameter -g -fno-var-tracking -gz=3Dzlib -fno-crash-diagnostics =
-Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -falign-func=
tions=3D64 -Wno-unused-but-set-variable -fsanitize=3Darray-bounds -fsanitiz=
e=3Dshift -fsanitize=3Dunreachable -fsanitize=3Dbool -Ikernel/sched -Ikerne=
l/sched -ffunction-sections -fdata-sections -DKBUILD_MODFILE=3D'"kernel/sch=
ed/fair"' -DKBUILD_BASENAME=3D'"fair"' -DKBUILD_MODNAME=3D'"fair"' -D__KBUI=
LD_MODNAME=3Dfair -c -o kernel/sched/fair.o kernel/sched/fair.c

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
