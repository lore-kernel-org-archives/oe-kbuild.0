Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3708C426EAE
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Jul 2026 10:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783507309; cv=none; b=otg+gSz08XX4aIXTQfMWxHzcBlWUS+tQMVCA5CdpZKu/gZG9hu3bGLXtrjNaIa4QYhFnW7r5U/K8g4gomxV396zRen8CXJv9U9Swbem3ikajFTELB1k0iD+5UFO4RlHP4IemZKGmSWIGc/zBToczyFsNX/rYx2kxuPyokRuTuiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783507309; c=relaxed/simple;
	bh=VXcaeCx3eEm5ffQRCjSEuxiOhnn351Lb6T6/vxku+8U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=eQXZuE3rQuuTiM7507eA2j7sXssFeZpEHC7acoYOmpaQiHwwi7E1CAyhE5vltnyOyw6oPB+FI60dF7Ol9eMINPQiyHlPSTlEiNfxT3BW0KBo9eUJ+t8646cNK31F274HqPbbJ3sEcEBYcKjNKbafqD1k+A2UTlyLYadZtwNfzN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nsaOp0ji; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nsaOp0ji"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783507301; x=1815043301;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=VXcaeCx3eEm5ffQRCjSEuxiOhnn351Lb6T6/vxku+8U=;
  b=nsaOp0jiYq2PpyqdlIOIGaPN5HxL+0T4za6NruFPTWEnkKgO2euTsQK6
   nueso/j64W8hZKwgpGTrxTf4ZhqT0cnuTTDEpdFXdtuArKdK7NmW06p+J
   NRo7w4ogLBZEXa2WlYCdYiw4LNxJmXjjb/9XZ3AlFe4bB91NTnx84Xli/
   FIz7sUb9HoPBGfnOanRRkvrWClYLCe/hiVB2XZGXZINGsJ3W/Tc8GY2v1
   iw7dlTCPpWONYmgoDgux1dVfVM5hGtbql2kSwqFODWUrVSiDJC/F8wF9/
   4Ng6zRFyAaP1Z/qZsU36Zmf05Ah/C8kDNiInrJxPho/L9oKvzBC7SVXV4
   w==;
X-CSE-ConnectionGUID: hFP+x8nLRB+tkKb0/zBkJA==
X-CSE-MsgGUID: xq13M2l6QveJvhhCtd+Thg==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="83944287"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="83944287"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 03:41:20 -0700
X-CSE-ConnectionGUID: Ox64InC/ROqJGCAjrB3OMw==
X-CSE-MsgGUID: Iubnpl6VQzSFi7vyuQbDCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="258560472"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 08 Jul 2026 03:41:19 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whPiG-00000000GFt-3b8o;
	Wed, 08 Jul 2026 10:41:12 +0000
Date: Wed, 08 Jul 2026 18:39:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1787/4300] /bin/bash: line 1: 3715679
 Segmentation fault      clang -Wp,-MMD,kernel/sched/.fair.o.d -nostdinc
 -Iarch/powerpc/include -I./arch/powerpc/include/generated -Iinclude
 -I./include -Iarch/powerpc/include/uapi
 -I./arch/powerpc/include/generated/uapi -Iinclud...
Message-ID: <202607081803.Q4WjbSRD-lkp@intel.com>
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
CC: oe-kbuild-all@lists.linux.dev
TO: "Peter Zijlstra (Intel)" <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   5c73cd9f0819c1c44e373e3dabb68318b1de1a12
commit: 85570f10a4c61372c1d437365b9d8dbad512ec6f [1787/4300] sched/eevdf: M=
ove to a single runqueue
:::::: branch date: 22 hours ago
:::::: commit date: 8 days ago
config: powerpc-randconfig-r134-20260708 (https://download.01.org/0day-ci/a=
rchive/20260708/202607081803.Q4WjbSRD-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2=
fb2a2269da0e2a3e230beb6cad39ca314db33)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260708/202607081803.Q4WjbSRD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607081803.Q4WjbSRD-lkp@intel.com/

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
e-null-pointer-checks -Os -fstack-protector-strong -fomit-frame-pointer -fa=
lloc-token-max=3D16 -fexperimental-late-parse-attributes -fdiagnostics-show=
-inlining-chain -falign-functions=3D4 -fstrict-flex-arrays=3D3 -fno-strict-=
overflow -fno-stack-check -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=
=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-ty=
pe -Werror=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -Wno-fra=
me-address -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-p=
rototypes -Wframe-larger-than=3D8192 -Wno-format-overflow-non-kprintf -Wno-=
format-truncation-non-kprintf -Wno-default-const-init-unsafe -Wno-type-limi=
ts -Wno-pointer-sign -Wcast-function-type -Wno-unterminated-string-initiali=
zation -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Dincompatible-po=
inter-types -Wenum-conversion -Wunused -Wmissing-format-attribute -Wmissing=
-include-dirs -Wunused-const-variable -Wno-missing-field-initializers -Wno-=
shift-negative-value -Wno-enum-enum-conversion -Wno-sign-compare -Wno-unuse=
d-parameter -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wreturn-type -=
funsigned-char -Wundef -falign-functions=3D64 -mstack-protector-guard=3Dtls=
 -mstack-protector-guard-reg=3Dr2 -mstack-protector-guard-offset=3D968 -Wno=
-unused-but-set-variable -fsanitize=3Dkernel-address -mllvm -asan-mapping-o=
ffset=3D0xe0000000 -mllvm -asan-instrumentation-with-call-threshold=3D0 -ml=
lvm -asan-stack=3D0 -mllvm -asan-globals=3D1 -mllvm -asan-kernel-mem-intrin=
sic-prefix=3D1 -fdebug-info-for-profiling -mllvm -enable-fs-discriminator=
=3Dtrue -mllvm -improved-fs-discriminator=3Dtrue -gmlt -Ikernel/sched -Iker=
nel/sched -DKBUILD_MODFILE=3D\"kernel/sched/fair\" -DKBUILD_BASENAME=3D\"fa=
ir\" -DKBUILD_MODNAME=3D\"fair\" -D__KBUILD_MODNAME=3Dfair -c -o kernel/sch=
ed/fair.o kernel/sched/fair.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'kernel/sched/fair.c'.
   4.	Running pass 'PowerPC DAG->DAG Pattern Instruction Selection' on func=
tion '@__dequeue_task'
   #0 0x000056025a05f13a llvm::sys::PrintStackTrace(llvm::raw_ostream&, int=
) (clang-23+0x3e6913a)
   #1 0x000056025a05cce4 llvm::sys::CleanupOnSignal(unsigned long) (clang-2=
3+0x3e66ce4)
   #2 0x0000560259f91cc0 CrashRecoverySignalHandler(int) CrashRecoveryConte=
xt.cpp:0:0
   #3 0x00007fb545a67df0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
   #4 0x00005602584ab382 widenVec(llvm::SelectionDAG&, llvm::SDValue, llvm:=
:SDLoc const&) PPCISelLowering.cpp:0:0
   #5 0x00005602584ecb93 llvm::PPCTargetLowering::LowerTRUNCATEVector(llvm:=
:SDValue, llvm::SelectionDAG&) const (clang-23+0x22f6b93)
   #6 0x0000560264f2b120
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 3715679 Segmentation fault      clang -Wp,-MMD,kernel=
/sched/.fair.o.d -nostdinc -Iarch/powerpc/include -I./arch/powerpc/include/=
generated -Iinclude -I./include -Iarch/powerpc/include/uapi -I./arch/powerp=
c/include/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include=
 include/linux/compiler-version.h -include include/linux/kconfig.h -include=
 include/linux/compiler_types.h -D__KERNEL__ --target=3Dpowerpc64le-linux-g=
nu -fintegrated-as -Werror=3Dunknown-warning-option -Werror=3Dignored-optim=
ization-argument -Werror=3Doption-ignored -Werror=3Dunused-command-line-arg=
ument -mbig-endian -m32 -I arch/powerpc -DHAVE_AS_ATHIGH=3D1 -fmacro-prefix=
-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -fshort-wchar -funsigned-char -fno-=
common -fno-PIE -fno-strict-aliasing -std=3Dgnu11 -fms-anonymous-structs -W=
no-gnu -Wno-microsoft-anon-tag -msoft-float -mcpu=3Dpowerpc -mno-prefixed -=
mno-pcrel -mno-altivec -mno-vsx -mno-mma -mno-spe -fno-asynchronous-unwind-=
tables -mbig-endian -fno-delete-null-pointer-checks -Os -fstack-protector-s=
trong -fomit-frame-pointer -falloc-token-max=3D16 -fexperimental-late-parse=
-attributes -fdiagnostics-show-inlining-chain -falign-functions=3D4 -fstric=
t-flex-arrays=3D3 -fno-strict-overflow -fno-stack-check -fno-builtin-wcslen=
 -Wall -Wextra -Wundef -Werror=3Dimplicit-function-declaration -Werror=3Dim=
plicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-se=
curity -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmi=
ssing-declarations -Wmissing-prototypes -Wframe-larger-than=3D8192 -Wno-for=
mat-overflow-non-kprintf -Wno-format-truncation-non-kprintf -Wno-default-co=
nst-init-unsafe -Wno-type-limits -Wno-pointer-sign -Wcast-function-type -Wn=
o-unterminated-string-initialization -Wimplicit-fallthrough -Werror=3Ddate-=
time -Werror=3Dincompatible-pointer-types -Wenum-conversion -Wunused -Wmiss=
ing-format-attribute -Wmissing-include-dirs -Wunused-const-variable -Wno-mi=
ssing-field-initializers -Wno-shift-negative-value -Wno-enum-enum-conversio=
n -Wno-sign-compare -Wno-unused-parameter -fno-crash-diagnostics -Wno-error=
=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -falign-functions=3D64=
 -mstack-protector-guard=3Dtls -mstack-protector-guard-reg=3Dr2 -mstack-pro=
tector-guard-offset=3D968 -Wno-unused-but-set-variable -fsanitize=3Dkernel-=
address -mllvm -asan-mapping-offset=3D0xe0000000 -mllvm -asan-instrumentati=
on-with-call-threshold=3D0 -mllvm -asan-stack=3D0 -mllvm -asan-globals=3D1 =
-mllvm -asan-kernel-mem-intrinsic-prefix=3D1 -fdebug-info-for-profiling -ml=
lvm -enable-fs-discriminator=3Dtrue -mllvm -improved-fs-discriminator=3Dtru=
e -gmlt -Ikernel/sched -Ikernel/sched -DKBUILD_MODFILE=3D'"kernel/sched/fai=
r"' -DKBUILD_BASENAME=3D'"fair"' -DKBUILD_MODNAME=3D'"fair"' -D__KBUILD_MOD=
NAME=3Dfair -c -o kernel/sched/fair.o kernel/sched/fair.c

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
