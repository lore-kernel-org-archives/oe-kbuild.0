Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF392BEC34
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Jun 2026 20:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780431629; cv=none; b=LrlCMI3wfsOfFj3CWMFGC/ZxwCi6jGDbwlXrO9vUiUTwrTKtWTIEsjrpROOdDrbOpOxiLPK+J1gNgXrzLALC7dQKanZSV/SEMAEo1L4urSbfvBaPzhHFce7ZmxIWawazeBB6FDT724DxhRFMkLW0KdrxempYr2eIIpEfgVmHQuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780431629; c=relaxed/simple;
	bh=bcDbRSF/DRjCG5qJYXhI3INvbK2C18MNyGWv3oaozm0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pW0KUw/8NbJ1X/afxIUhaHx07SKPm84GgqkAELADqXs0RnTFBuqj1L9Cjbwt68+tOPtYUodnz0k2U8MvOa9+HNnlTrd5rLhRcgFcu5Gd3I+n/pkeFz/p9rVNHEgMsMOi8hSpN6QDqxnNnPt8cGp2ZcoXyDAhHF4LgBueJ8Aw+bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QZ72I7q6; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QZ72I7q6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780431628; x=1811967628;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bcDbRSF/DRjCG5qJYXhI3INvbK2C18MNyGWv3oaozm0=;
  b=QZ72I7q69/ePhzrZA+tKwZ2b7nZVtiU6ky+vipxsYctSv8Bv0Ek0fR3A
   fyyLz1KmvXcfuCIdDyAph1IuerTbNRaL/g2oBrLDDAaQNVM89Mbz9r8JN
   PqfZiRTzuOBsgSxFOkTv8eVbUFEtY5Not5seCdcheQ0tfUTkuL4p7F3t4
   arz4Kh/4scWwMrVANOnnvMWpDLtGc5FcrLG/xslXhcfD8U2bgzX+rFx6Z
   wZiSp4omTvEa/EbyL8tEKe1+4Za4CZ7mzSD4HxFt0TUxPUWCOmZLumaAk
   Emm1TG+Ob30Dhg4ksX1vzcviyCwbl99nX5L8TVmV/Jp6ECgUZY85ZFMQ6
   Q==;
X-CSE-ConnectionGUID: cdiDpMpPQDGl+ZYxX7WwDQ==
X-CSE-MsgGUID: j0+xBP4aS/eEDf9nR7ZzBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="80369713"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="80369713"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 13:20:27 -0700
X-CSE-ConnectionGUID: 8hMXgs2STJmmJTvPVcZQxg==
X-CSE-MsgGUID: Q2RDP4dtQi2Ec/xb5cQ2NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="244117772"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Jun 2026 13:20:26 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUVb5-00000000CUU-1EOt;
	Tue, 02 Jun 2026 20:20:23 +0000
Date: Wed, 03 Jun 2026 04:20:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [kvms390:sae 4/53] /bin/bash: line 1: 1185063 Segmentation
 fault      clang -Wp,-MMD,drivers/media/i2c/.msp3400-kthreads.o.d -nostdinc
 -Iarch/powerpc/include -I./arch/powerpc/include/generated -Iinclude
 -I./include -I./include/generated -Iarch/powerpc/include/uapi -I./arch/...
Message-ID: <202606030409.cfdfa8x6-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-s390@vger.kernel.org
TO: Steffen Eiden <seiden@linux.ibm.com>
CC: Andreas Grapentin <gra@linux.ibm.com>
CC: "Nina Schoetterl-Glausch" <nsg@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux.git s=
ae
head:   f33dbafc8623f6c22ac90428a03f29019940b157
commit: 5c76eda5cc94a62125ad018843dfa5fcd4c3a154 [4/53] uapi: KVM: Provide =
arm64 UAPI for other host architectures
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: powerpc-randconfig-001-20260602 (https://download.01.org/0day-ci/ar=
chive/20260603/202606030409.cfdfa8x6-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e5a=
b4f8a1f766febdc65ce89c00dec85393cfd68)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260603/202606030409.cfdfa8x6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606030409.cfdfa8x6-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
All errors (new ones prefixed by >>):

   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,drivers/media/i2c/.msp3400-kthreads=
.o.d -nostdinc -Iarch/powerpc/include -I./arch/powerpc/include/generated -I=
include -I./include -I./include/generated -Iarch/powerpc/include/uapi -I./a=
rch/powerpc/include/generated/uapi -Iinclude/uapi -I./include/generated/uap=
i -include include/linux/compiler-version.h -include include/linux/kconfig.=
h -include include/linux/compiler_types.h -D__KERNEL__ --target=3Dpowerpc64=
le-linux-gnu -fintegrated-as -Werror=3Dunknown-warning-option -Werror=3Dign=
ored-optimization-argument -Werror=3Doption-ignored -Werror=3Dunused-comman=
d-line-argument -mbig-endian -m32 -I arch/powerpc -DHAVE_AS_ATHIGH=3D1 -fma=
cro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -fshort-wchar -funsigned-=
char -fno-common -fno-PIE -fno-strict-aliasing -std=3Dgnu11 -fms-anonymous-=
structs -Wno-gnu -Wno-microsoft-anon-tag -msoft-float -mcpu=3D440 -mno-pref=
ixed -mno-pcrel -mno-altivec -mno-vsx -mno-mma -mno-spe -fno-asynchronous-u=
nwind-tables -mbig-endian -fno-delete-null-pointer-checks -Os -fstack-prote=
ctor -fomit-frame-pointer -fexperimental-late-parse-attributes -fdiagnostic=
s-show-inlining-chain -falign-functions=3D64 -fstrict-flex-arrays=3D3 -fno-=
strict-overflow -fno-stack-check -fno-builtin-wcslen -Wall -Wextra -Wundef =
-Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dre=
turn-type -Werror=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -=
Wno-frame-address -Wno-address-of-packed-member -Wmissing-declarations -Wmi=
ssing-prototypes -Wframe-larger-than=3D8192 -Wno-format-overflow-non-kprint=
f -Wno-format-truncation-non-kprintf -Wno-default-const-init-unsafe -Wno-ty=
pe-limits -Wno-pointer-sign -Wcast-function-type -Wno-unterminated-string-i=
nitialization -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Dincompat=
ible-pointer-types -Wenum-conversion -Wunused -Wmissing-format-attribute -W=
missing-include-dirs -Wunused-const-variable -Wno-missing-field-initializer=
s -Wno-shift-negative-value -Wno-enum-enum-conversion -Wno-sign-compare -Wn=
o-unused-parameter -gsplit-dwarf -g -fno-var-tracking -fno-crash-diagnostic=
s -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -falign-fu=
nctions=3D64 -mstack-protector-guard=3Dtls -mstack-protector-guard-reg=3Dr2=
 -mstack-protector-guard-offset=3D1376 -fsanitize=3Dkernel-address -mllvm -=
asan-mapping-offset=3D0xe0000000 -mllvm -asan-instrumentation-with-call-thr=
eshold=3D0 -mllvm -asan-stack=3D0 -mllvm -asan-globals=3D1 -mllvm -asan-ker=
nel-mem-intrinsic-prefix=3D1 -Idrivers/media/i2c -Idrivers/media/i2c -DMODU=
LE -DKBUILD_BASENAME=3D\"msp3400_kthreads\" -DKBUILD_MODNAME=3D\"msp3400\" =
-D__KBUILD_MODNAME=3Dmsp3400 -c -o drivers/media/i2c/msp3400-kthreads.o dri=
vers/media/i2c/msp3400-kthreads.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'drivers/media/i2c/msp=
3400-kthreads.c'.
   4.	Running pass 'PowerPC DAG->DAG Pattern Instruction Selection' on func=
tion '@msp3400c_thread'
    #0 0x0000558846ee2b3b llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-23+0x40fab3b)
    #1 0x0000558846ee0704 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
23+0x40f8704)
    #2 0x0000558846e147a0 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007fe16102adf0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x0000558845291615 llvm::PPCTargetLowering::DAGCombineExtBoolTrunc(l=
lvm::SDNode*, llvm::TargetLowering::DAGCombinerInfo&) const (clang-23+0x24a=
9615)
    #5 0x00005588485859f5 llvm::DAGTypeLegalizer::AnalyzeNewValue(llvm::SDV=
alue&) (clang-23+0x579d9f5)
    #6 0x0000558848585b4b llvm::DAGTypeLegalizer::AnalyzeNewNode(llvm::SDNo=
de*) (.part.0) LegalizeTypes.cpp:0:0
    #7 0x000055884858792e llvm::DAGTypeLegalizer::run() (clang-23+0x579f92e)
    #8 0x000055884858bb04 llvm::SelectionDAG::LegalizeTypes() (clang-23+0x5=
7a3b04)
    #9 0x00005588484eb431 llvm::SelectionDAGISel::CodeGenAndEmitDAG() (clan=
g-23+0x5703431)
   #10 0x00005588484eda8f llvm::SelectionDAGISel::SelectAllBasicBlocks(llvm=
::Function const&) (clang-23+0x5705a8f)
   #11 0x00005588484ef84e llvm::SelectionDAGISel::runOnMachineFunction(llvm=
::MachineFunction&) (clang-23+0x570784e)
   #12 0x000055884522b127 (anonymous namespace)::PPCDAGToDAGISel::runOnMach=
ineFunction(llvm::MachineFunction&) PPCISelDAGToDAG.cpp:0:0
   #13 0x00005588484de029 llvm::SelectionDAGISelLegacy::runOnMachineFunctio=
n(llvm::MachineFunction&) (clang-23+0x56f6029)
   #14 0x00005588462641e8 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-23+0x347c1e8)
   #15 0x00005588467de039 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-23+0x39f6039)
   #16 0x00005588467de3ec llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-23+0x39f63ec)
   #17 0x00005588467dca48 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-23+0x39f4a48)
   #18 0x00005588472c3c62 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-23+0x44dbc62)
   #19 0x0000558847904fc7 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-23+0x4b1cfc7)
   #20 0x00005588493121bc clang::ParseAST(clang::Sema&, bool, bool) (clang-=
23+0x652a1bc)
   #21 0x0000558847c717de clang::FrontendAction::Execute() (clang-23+0x4e89=
7de)
   #22 0x0000558847beba0d clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-23+0x4e03a0d)
   #23 0x0000558847d55127 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-23+0x4f6d127)
   #24 0x0000558843d7d568 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-23+0xf95568)
   #25 0x0000558843d75293 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #26 0x0000558843d752d3 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #27 0x000055884797d709 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #28 0x0000558846e14b03 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-23+0x402cb03)
   #29 0x000055884797de34 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #30 0x000055884793c688 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-23+0x4b54688)
   #31 0x000055884793d5e2 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-23+0x4b555e2)
   #32 0x000055884794dffc clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-23+0x4b65ffc)
   #33 0x0000558843d79f4f clang_main(int, char**, llvm::ToolContext const&)=
 (clang-23+0xf91f4f)
   #34 0x0000558843c0d1b9 main (clang-23+0xe251b9)
   #35 0x00007fe161014ca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #36 0x00007fe161014d65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #37 0x0000558843d74cd1 _start (clang-23+0xf8ccd1)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 1185063 Segmentation fault      clang -Wp,-MMD,driver=
s/media/i2c/.msp3400-kthreads.o.d -nostdinc -Iarch/powerpc/include -I./arch=
/powerpc/include/generated -Iinclude -I./include -I./include/generated -Iar=
ch/powerpc/include/uapi -I./arch/powerpc/include/generated/uapi -Iinclude/u=
api -I./include/generated/uapi -include include/linux/compiler-version.h -i=
nclude include/linux/kconfig.h -include include/linux/compiler_types.h -D__=
KERNEL__ --target=3Dpowerpc64le-linux-gnu -fintegrated-as -Werror=3Dunknown=
-warning-option -Werror=3Dignored-optimization-argument -Werror=3Doption-ig=
nored -Werror=3Dunused-command-line-argument -mbig-endian -m32 -I arch/powe=
rpc -DHAVE_AS_ATHIGH=3D1 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WA=
RN1 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing=
 -std=3Dgnu11 -fms-anonymous-structs -Wno-gnu -Wno-microsoft-anon-tag -msof=
t-float -mcpu=3D440 -mno-prefixed -mno-pcrel -mno-altivec -mno-vsx -mno-mma=
 -mno-spe -fno-asynchronous-unwind-tables -mbig-endian -fno-delete-null-poi=
nter-checks -Os -fstack-protector -fomit-frame-pointer -fexperimental-late-=
parse-attributes -fdiagnostics-show-inlining-chain -falign-functions=3D64 -=
fstrict-flex-arrays=3D3 -fno-strict-overflow -fno-stack-check -fno-builtin-=
wcslen -Wall -Wextra -Wundef -Werror=3Dimplicit-function-declaration -Werro=
r=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-for=
mat-security -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-membe=
r -Wmissing-declarations -Wmissing-prototypes -Wframe-larger-than=3D8192 -W=
no-format-overflow-non-kprintf -Wno-format-truncation-non-kprintf -Wno-defa=
ult-const-init-unsafe -Wno-type-limits -Wno-pointer-sign -Wcast-function-ty=
pe -Wno-unterminated-string-initialization -Wimplicit-fallthrough -Werror=
=3Ddate-time -Werror=3Dincompatible-pointer-types -Wenum-conversion -Wunuse=
d -Wmissing-format-attribute -Wmissing-include-dirs -Wunused-const-variable=
 -Wno-missing-field-initializers -Wno-shift-negative-value -Wno-enum-enum-c=
onversion -Wno-sign-compare -Wno-unused-parameter -gsplit-dwarf -g -fno-var=
-tracking -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wreturn-type -fu=
nsigned-char -Wundef -falign-functions=3D64 -mstack-protector-guard=3Dtls -=
mstack-protector-guard-reg=3Dr2 -mstack-protector-guard-offset=3D1376 -fsan=
itize=3Dkernel-address -mllvm -asan-mapping-offset=3D0xe0000000 -mllvm -asa=
n-instrumentation-with-call-threshold=3D0 -mllvm -asan-stack=3D0 -mllvm -as=
an-globals=3D1 -mllvm -asan-kernel-mem-intrinsic-prefix=3D1 -Idrivers/media=
/i2c -Idrivers/media/i2c -DMODULE -DKBUILD_BASENAME=3D'"msp3400_kthreads"' =
-DKBUILD_MODNAME=3D'"msp3400"' -D__KBUILD_MODNAME=3Dmsp3400 -c -o drivers/m=
edia/i2c/msp3400-kthreads.o drivers/media/i2c/msp3400-kthreads.c

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=3Dy] && (PPC_PSERIES [=3Dn] || PPC_PMAC [=3Dn] || =
PPC_POWERNV [=3Dn] || FSL_SOC_BOOKE [=3Dn])
   Selected by [y]:
   - PM_SLEEP_SMP [=3Dy] && SMP [=3Dy] && (ARCH_SUSPEND_POSSIBLE [=3Dy] || =
ARCH_HIBERNATION_POSSIBLE [=3Dy]) && PM_SLEEP [=3Dy]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
