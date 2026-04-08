Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3EE3815E6
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Apr 2026 13:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775653514; cv=none; b=GWsnikgEGXm0AWqIXevun9rDiU6b3DHp1PsVSMpn1t30h438rf3fkxOjBF5HVXNSn52416lyb3/jg796uY4yTIU1AlNyS0J8z5fk9Wh2pvLpZb3rym4brdof9odqrWNtITLkYDfDnpw38SJhS0IVQnPmE8JnWADy9C/HExXEcog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775653514; c=relaxed/simple;
	bh=Vtt+JyblJBup9dl4S/17pqvSQ5EfIwB10bkPujkzvIU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YlschIZbre06BVdbUI9J+vUNsCfI+OsslKrFhKwxlfr7VeCexDzOSpabo0di0IGgJMr4u2jD6wE+sEgBj6AQiUTtytdhH4Dm7hGUQJIkdbcIraX48xyaJ61UOlpWZUQy0Qbn+ezteNt+jikxopXSOOv+BGWWtvwEyf36RuY1xFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PG91pxyr; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PG91pxyr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775653511; x=1807189511;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Vtt+JyblJBup9dl4S/17pqvSQ5EfIwB10bkPujkzvIU=;
  b=PG91pxyrQPKjGIzFC+JIUssg/hHt5q1itlMLulYB04RPs890OFQlFC1h
   NkIg1TMFsluGxfIkE27C9dAUv+lvgYdhXzkwVf8MGq0eoe9Aku4jqbg4X
   OSg4B8UB5EMXTwNucpD8gOsZ+AoWTUy6KnZ4qNUoFJnN5TpTE8lv4Vo8J
   jBWdKPiobYTM/X+RJ0NhOM66Cgy5cQBly3CGojt15uJnZ5BKlR9d92Jxo
   C+g1dM6uWwn/RUUvn06CHPTmuUETrzHm7ulb/aXiUK+ddsAvgeFmwX6rO
   Jw8GteJKpF2R2fAA8KVyhzqCkzGFmPw9m8YyMgE9iqpsmNURnbXD3wzFg
   A==;
X-CSE-ConnectionGUID: XJnJ/iF1QJelDEq9a0fElw==
X-CSE-MsgGUID: ojD2uQ0MROqstR++6oB8Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="80522262"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="80522262"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 06:05:00 -0700
X-CSE-ConnectionGUID: jrgdG1O7QqSpZF8hnX4Thw==
X-CSE-MsgGUID: lpjrcc9jSVysNXsIHvC60A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="266453552"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Apr 2026 06:05:00 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wASaW-000000001qd-3qhH;
	Wed, 08 Apr 2026 13:04:56 +0000
Date: Wed, 08 Apr 2026 21:04:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: /bin/bash: line 1: 1247639 Segmentation fault      clang
 -Wp,-MMD,lib/.stackdepot.o.d -nostdinc -Iarch/mips/include
 -I./arch/mips/include/generated -Iinclude -I./include
 -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi
 -I./incl...
Message-ID: <202604082011.32WDskSw-lkp@intel.com>
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
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Vlastimil Babka <vbabka@suse.cz>
CC: Alexei Starovoitov <ast@kernel.org>
CC: Andrii Nakryiko <andrii@kernel.org>

Hi Vlastimil,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3036cd0d3328220a1858b1ab390be8b562774e8a
commit: f90b474a35744b5d43009e4fab232e74a3024cae mm: Fix the flipped condit=
ion in gfpflags_allow_spinning()
date:   1 year, 1 month ago
:::::: branch date: 19 hours ago
:::::: commit date: 1 year, 1 month ago
config: mips-randconfig-r131-20260408 (https://download.01.org/0day-ci/arch=
ive/20260408/202604082011.32WDskSw-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c80=
443cd37b2e2788cba67ffa180a6331e5f0791)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260408/202604082011.32WDskSw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: f90b474a3574 ("mm: Fix the flipped condition in gfpflags_allow_spi=
nning()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604082011.32WDskSw-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
All errors (new ones prefixed by >>):

   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,lib/.stackdepot.o.d -nostdinc -Iarc=
h/mips/include -I./arch/mips/include/generated -Iinclude -I./include -Iarch=
/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi -I./=
include/generated/uapi -include include/linux/compiler-version.h -include i=
nclude/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__=
 --target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknown-warning-opti=
on -Werror=3Dignored-optimization-argument -Werror=3Doption-ignored -Werror=
=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xffffffff84000000=
 -DLINKER_LOAD_ADDRESS=3D0x84000000 -DDATAOFFSET=3D0 -fmacro-prefix-map=3D=
=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -funsigned-char=
 -fno-common -fno-PIE -fno-strict-aliasing -mno-check-zero-division -mabi=
=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-float -ffre=
estanding -EB -fno-omit-frame-pointer -fno-stack-check -march=3Dmips64 -Wa,=
--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-sibyte -DSIBY=
TE_HDR_FEATURES=3DSIBYTE_HDR_FMASK_1480_ALL -Iarch/mips/include/asm/mach-ge=
neric -fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks -O2 -=
fno-stack-protector -fomit-frame-pointer -ftrivial-auto-var-init=3Dzero -fs=
trict-flex-arrays=3D3 -fno-strict-overflow -fno-stack-check -Wall -Wundef -=
Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dret=
urn-type -Werror=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -W=
no-frame-address -Wno-address-of-packed-member -Wmissing-declarations -Wmis=
sing-prototypes -Wno-gnu -Wvla -Wno-pointer-sign -Wcast-function-type -Wimp=
licit-fallthrough -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types =
-Wenum-conversion -Wextra -Wunused -Wmissing-format-attribute -Wmissing-inc=
lude-dirs -Wunused-const-variable -Wno-missing-field-initializers -Wno-type=
-limits -Wno-shift-negative-value -Wno-sign-compare -Wno-unused-parameter -=
g -gdwarf-4 -fno-var-tracking -gz=3Dzlib -fno-crash-diagnostics -Wno-error=
=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -falign-functions=3D64=
 -fno-builtin -Ilib -Ilib -DKBUILD_MODFILE=3D\"lib/stackdepot\" -DKBUILD_BA=
SENAME=3D\"stackdepot\" -DKBUILD_MODNAME=3D\"stackdepot\" -D__KBUILD_MODNAM=
E=3Dkmod_stackdepot -c -o lib/stackdepot.o lib/stackdepot.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'lib/stackdepot.c'.
   4.	Running pass 'Branch Probability Basic Block Placement' on function '=
@stack_depot_save_flags'
    #0 0x000055c88586675b llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-23+0x416f75b)
    #1 0x000055c885864324 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
23+0x416d324)
    #2 0x000055c885797520 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007f1d4944edf0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x000055c884e1020e llvm::TailDuplicator::processPHI(llvm::MachineIns=
tr*, llvm::MachineBasicBlock*, llvm::MachineBasicBlock*, llvm::DenseMap<llv=
m::Register, llvm::TargetInstrInfo::RegSubRegPair, llvm::DenseMapInfo<llvm:=
:Register, void>, llvm::detail::DenseMapPair<llvm::Register, llvm::TargetIn=
strInfo::RegSubRegPair>>&, llvm::SmallVectorImpl<std::pair<llvm::Register, =
llvm::TargetInstrInfo::RegSubRegPair>>&, llvm::DenseSet<llvm::Register, llv=
m::DenseMapInfo<llvm::Register, void>> const&, bool) (clang-23+0x371920e)
    #5 0x000055c884e1449b llvm::TailDuplicator::tailDuplicate(bool, llvm::M=
achineBasicBlock*, llvm::MachineBasicBlock*, llvm::SmallVectorImpl<llvm::Ma=
chineBasicBlock*>&, llvm::SmallVectorImpl<llvm::MachineInstr*>&, llvm::Smal=
lVectorImpl<llvm::MachineBasicBlock*>*) (clang-23+0x371d49b)
    #6 0x000055c884e16de8 llvm::TailDuplicator::tailDuplicateAndUpdate(bool=
, llvm::MachineBasicBlock*, llvm::MachineBasicBlock*, llvm::SmallVectorImpl=
<llvm::MachineBasicBlock*>*, llvm::function_ref<void (llvm::MachineBasicBlo=
ck*)>*, llvm::SmallVectorImpl<llvm::MachineBasicBlock*>*) (clang-23+0x371fd=
e8)
    #7 0x000055c884b1c888 (anonymous namespace)::MachineBlockPlacement::may=
beTailDuplicateBlock(llvm::MachineBasicBlock*, llvm::MachineBasicBlock*, (a=
nonymous namespace)::BlockChain&, llvm::SmallSetVector<llvm::MachineBasicBl=
ock const*, 16u>*, llvm::ilist_iterator<llvm::ilist_detail::node_options<ll=
vm::MachineBasicBlock, false, false, void, false, void>, false, false>&, ll=
vm::MachineBasicBlock const* const*&, bool&) MachineBlockPlacement.cpp:0:0
    #8 0x000055c884b1d5d4 (anonymous namespace)::MachineBlockPlacement::rep=
eatedlyTailDuplicateBlock(llvm::MachineBasicBlock*, llvm::MachineBasicBlock=
*&, llvm::MachineBasicBlock const*, (anonymous namespace)::BlockChain&, llv=
m::SmallSetVector<llvm::MachineBasicBlock const*, 16u>*, llvm::ilist_iterat=
or<llvm::ilist_detail::node_options<llvm::MachineBasicBlock, false, false, =
void, false, void>, false, false>&, llvm::MachineBasicBlock const* const*&)=
 (.isra.0) MachineBlockPlacement.cpp:0:0
    #9 0x000055c884b23376 (anonymous namespace)::MachineBlockPlacement::bui=
ldCFGChains() MachineBlockPlacement.cpp:0:0
   #10 0x000055c884b27ced (anonymous namespace)::MachineBlockPlacement::run=
(llvm::MachineFunction&) MachineBlockPlacement.cpp:0:0
   #11 0x000055c884b28ef1 (anonymous namespace)::MachineBlockPlacementLegac=
y::runOnMachineFunction(llvm::MachineFunction&) (.part.0) MachineBlockPlace=
ment.cpp:0:0
   #12 0x000055c884b76ab8 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-23+0x347fab8)
   #13 0x000055c88514daa9 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-23+0x3a56aa9)
   #14 0x000055c88514dc4c llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-23+0x3a56c4c)
   #15 0x000055c88514ceb8 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-23+0x3a55eb8)
   #16 0x000055c885c67761 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-23+0x4570761)
   #17 0x000055c8862adb07 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-23+0x4bb6b07)
   #18 0x000055c887ca82bc clang::ParseAST(clang::Sema&, bool, bool) (clang-=
23+0x65b12bc)
   #19 0x000055c886604aba clang::FrontendAction::Execute() (clang-23+0x4f0d=
aba)
   #20 0x000055c88657dd16 clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-23+0x4e86d16)
   #21 0x000055c8866edf87 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-23+0x4ff6f87)
   #22 0x000055c88264d955 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-23+0xf56955)
   #23 0x000055c882645663 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #24 0x000055c8826456a3 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #25 0x000055c88631ee69 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #26 0x000055c885797883 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-23+0x40a0883)
   #27 0x000055c88631f594 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #28 0x000055c8862deae8 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-23+0x4be7ae8)
   #29 0x000055c8862dfa42 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-23+0x4be8a42)
   #30 0x000055c8862f0a3c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-23+0x4bf9a3c)
   #31 0x000055c88264a30f clang_main(int, char**, llvm::ToolContext const&)=
 (clang-23+0xf5330f)
   #32 0x000055c8824e1799 main (clang-23+0xdea799)
   #33 0x00007f1d49438ca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #34 0x00007f1d49438d65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #35 0x000055c8826450a1 _start (clang-23+0xf4e0a1)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 1247639 Segmentation fault      clang -Wp,-MMD,lib/.s=
tackdepot.o.d -nostdinc -Iarch/mips/include -I./arch/mips/include/generated=
 -Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips/include/gener=
ated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linux/=
compiler-version.h -include include/linux/kconfig.h -include include/linux/=
compiler_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -fintegrated-as -=
Werror=3Dunknown-warning-option -Werror=3Dignored-optimization-argument -We=
rror=3Doption-ignored -Werror=3Dunused-command-line-argument -DVMLINUX_LOAD=
_ADDRESS=3D0xffffffff84000000 -DLINKER_LOAD_ADDRESS=3D0x84000000 -DDATAOFFS=
ET=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -=
fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -mno=
-check-zero-division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-fl=
oat -Wa,-msoft-float -ffreestanding -EB -fno-omit-frame-pointer -fno-stack-=
check -march=3Dmips64 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/incl=
ude/asm/mach-sibyte -DSIBYTE_HDR_FEATURES=3DSIBYTE_HDR_FMASK_1480_ALL -Iarc=
h/mips/include/asm/mach-generic -fno-asynchronous-unwind-tables -fno-delete=
-null-pointer-checks -O2 -fno-stack-protector -fomit-frame-pointer -ftrivia=
l-auto-var-init=3Dzero -fstrict-flex-arrays=3D3 -fno-strict-overflow -fno-s=
tack-check -Wall -Wundef -Werror=3Dimplicit-function-declaration -Werror=3Di=
mplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-s=
ecurity -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wm=
issing-declarations -Wmissing-prototypes -Wno-gnu -Wvla -Wno-pointer-sign -=
Wcast-function-type -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Din=
compatible-pointer-types -Wenum-conversion -Wextra -Wunused -Wmissing-forma=
t-attribute -Wmissing-include-dirs -Wunused-const-variable -Wno-missing-fie=
ld-initializers -Wno-type-limits -Wno-shift-negative-value -Wno-sign-compar=
e -Wno-unused-parameter -g -gdwarf-4 -fno-var-tracking -gz=3Dzlib -fno-cras=
h-diagnostics -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wunde=
f -falign-functions=3D64 -fno-builtin -Ilib -Ilib -DKBUILD_MODFILE=3D'"lib/=
stackdepot"' -DKBUILD_BASENAME=3D'"stackdepot"' -DKBUILD_MODNAME=3D'"stackd=
epot"' -D__KBUILD_MODNAME=3Dkmod_stackdepot -c -o lib/stackdepot.o lib/stac=
kdepot.c

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
