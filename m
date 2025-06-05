Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3AC134CB
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Jun 2025 08:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749111624; cv=none; b=YatF1i56nENuJ4VXTDt+/QeZ1b1lf+0NQs7vPe0rGqgymWKTYzcNazSOgbUC+fzvlokziSCy1R3m37x+YklNMggk0eBzKBEkmH46++0dFgEQDWUYXebAtns1nYlpRPva4q8ltV5gb2rEHaoyXOt4dKoYcUdpG5CzxZZzSWYk9D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749111624; c=relaxed/simple;
	bh=SIDE3MsN1ufBbPSBu+8w2qxDc9R6MC8Wu03V7ujxFsU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JTNA+TwM6cozMwlcXEr4CZV98mgKQD/ql1islciO0W8YmBuYV9mswt7Ss7YMSUfjR/Jwf/ZS+0+PZG43hHT0w6rW5cymheW1S6sCvMPohua+KkZizhNb6Xr2hj533LaWuwCYy3WTX9uk8/OusduOEP2MEXpu0xUw+3BuIQLhlKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j9/Z6t8I; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j9/Z6t8I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749111622; x=1780647622;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SIDE3MsN1ufBbPSBu+8w2qxDc9R6MC8Wu03V7ujxFsU=;
  b=j9/Z6t8InH7CjuIKQMMNpRH3m0VPHez5b74ZKfIzZg3i3XRYzQkTz9CA
   ldHOkf8XdAqSxk1jkpZmHTclY0aADAvXOSZ+O+8ZkMn86oJnHkTN+UvlM
   adKRP7eszmpXz+9GIrhMbsVt7WouwR4vv0rY3imr2GfvjWgpiez7X92N7
   0u/EMJvdTC5+N6DZCua652lc3Ccr27MEv1c0f6zrLVBiAcHNg9v3XP1DX
   vraW2iETJtlwVz2/P8HrJZZvS630kcTyu0wJM6secfzeLkos4wyqgHrPB
   qfaB5PiZRmoJva6pUsXx2KZBdw2xtIVQ4J0g5iEyNwW64/O2ULYCN+AFW
   w==;
X-CSE-ConnectionGUID: cL/SEnJHTZinPPoh9LV2LQ==
X-CSE-MsgGUID: Iu3ZLXqlTJWqM8uZ2eZ/GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="76619068"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="76619068"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 01:20:21 -0700
X-CSE-ConnectionGUID: /fMJ3OdTQyqU+ytc71QhPg==
X-CSE-MsgGUID: 1JmLYZcOTlel7evGbS7Thw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="150590379"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Jun 2025 01:20:18 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uN5ph-0003tn-0c;
	Thu, 05 Jun 2025 08:20:17 +0000
Date: Thu, 5 Jun 2025 16:19:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 7221/14443] clang-16: error: clang frontend
 command failed with exit code 139 (use -v to see invocation)
Message-ID: <202506051617.TulfVQbT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "clang compiler bug"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: llvm@lists.linux.dev
BCC: lkp@intel.com

TO: Puranjay Mohan <puranjay12@gmail.com>
CC: Alexandre Ghiti <alexghiti@rivosinc.com>
CC: Andy Chiu <andybnac@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   911483b25612c8bc32a706ba940738cc43299496
commit: ed9db3fc7e8b9871bfaee0d891274069beff8002 [7221/14443] riscv: Implem=
ent HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS
:::::: branch date: 28 hours ago
:::::: commit date: 4 weeks ago
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/2025060=
5/202506051617.TulfVQbT-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a=
2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250605/202506051617.TulfVQbT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506051617.TulfVQbT-lkp@intel.com/

All errors (new ones prefixed by >>):

   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,init/.main.o.d -nostdinc -Iarch/ris=
cv/include -I./arch/riscv/include/generated -Iinclude -I./include -Iarch/ri=
scv/include/uapi -I./arch/riscv/include/generated/uapi -Iinclude/uapi -I./i=
nclude/generated/uapi -include include/linux/compiler-version.h -include in=
clude/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ =
--target=3Driscv64-linux-gnu -fintegrated-as -DCC_USING_PATCHABLE_FUNCTION_=
ENTRY -ffile-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fs=
hort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -fPIE =
-mabi=3Dlp64 -march=3Drv64imac -mno-save-restore -mcmodel=3Dmedany -fno-asy=
nchronous-unwind-tables -fno-unwind-tables -fno-delete-null-pointer-checks =
-O2 -fstack-protector-strong -fno-omit-frame-pointer -fno-optimize-sibling-=
calls -ftrivial-auto-var-init=3Dpattern -fpatchable-function-entry=3D8,4 -f=
sanitize=3Dkcfi -falign-functions=3D64 -fstrict-flex-arrays=3D3 -fno-strict=
-overflow -fno-stack-check -fno-builtin-wcslen -Wall -Wundef -Werror=3Dimpl=
icit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Wer=
ror=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-addr=
ess -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-prototyp=
es -Wframe-larger-than=3D2048 -Wno-gnu -Wvla -Wno-pointer-sign -Wcast-funct=
ion-type -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Dincompatible-=
pointer-types -Wenum-conversion -Wextra -Wunused -Wmissing-format-attribute=
 -Wmissing-include-dirs -Wunused-const-variable -Wno-missing-field-initiali=
zers -Wno-type-limits -Wno-shift-negative-value -Wno-enum-enum-conversion -=
Wno-sign-compare -Wno-unused-parameter -DRANDSTRUCT -frandomize-layout-seed=
-file=3D./scripts/basic/randstruct.seed -Wno-error=3Dreturn-type -Wreturn-t=
ype -funsigned-char -Wundef -fno-function-sections -fno-data-sections -fsan=
itize=3Dkernel-address -mllvm -asan-mapping-offset=3D0xdfffffff00000000 -ml=
lvm -asan-instrumentation-with-call-threshold=3D10000 -mllvm -asan-stack=3D=
0 -mllvm -asan-globals=3D1 -mllvm -asan-kernel-mem-intrinsic-prefix=3D1 -fs=
anitize=3Darray-bounds -fsanitize=3Dshift -fsanitize=3Dunreachable -fsaniti=
ze=3Dbool -fsanitize=3Denum -fsanitize-coverage=3Dtrace-pc -fsanitize-cover=
age=3Dtrace-cmp -Iinit -Iinit -DKBUILD_MODFILE=3D"init/main" -DKBUILD_BASEN=
AME=3D"main" -DKBUILD_MODNAME=3D"main" -D__KBUILD_MODNAME=3Dkmod_main -c -o=
 init/main.o init/main.c
   1.	<eof> parser at end of file
   2.	Optimizer
   #0 0x000055d06df4f2bb llvm::sys::PrintStackTrace(llvm::raw_ostream&, int=
) (clang-16+0x396a2bb)
   #1 0x000055d06df4d234 llvm::sys::CleanupOnSignal(unsigned long) (clang-1=
6+0x3968234)
   #2 0x000055d06dea4ca8 CrashRecoverySignalHandler(int) CrashRecoveryConte=
xt.cpp:0:0
   #3 0x00007f2b66f10050 (/lib/x86_64-linux-gnu/libc.so.6+0x3c050)
   #4 0x000055d06f114266 clang::BackendConsumer::DiagnosticHandlerImpl(llvm=
::DiagnosticInfo const&) (clang-16+0x4b2f266)
   #5 0x000055d06f1142bd clang::ClangDiagnosticHandler::handleDiagnostics(l=
lvm::DiagnosticInfo const&) (clang-16+0x4b2f2bd)
   #6 0x000055d06d7eb10d llvm::LLVMContext::diagnose(llvm::DiagnosticInfo c=
onst&) (clang-16+0x320610d)
   #7 0x000055d06f3b0b86 llvm::KCFIPass::run(llvm::Function&, llvm::Analysi=
sManager<llvm::Function>&) (clang-16+0x4dcbb86)
   #8 0x000055d06e2e755d llvm::detail::PassModel<llvm::Function, llvm::KCFI=
Pass, llvm::PreservedAnalyses, llvm::AnalysisManager<llvm::Function>>::run(=
llvm::Function&, llvm::AnalysisManager<llvm::Function>&) (clang-16+0x3d0255=
d)
   #9 0x000055d06bb65f2f llvm::detail::PassModel<llvm::Function, llvm::Pass=
Manager<llvm::Function, llvm::AnalysisManager<llvm::Function>>, llvm::Prese=
rvedAnalyses, llvm::AnalysisManager<llvm::Function>>::run(llvm::Function&, =
llvm::AnalysisManager<llvm::Function>&) (clang-16+0x1580f2f)
   #10 0x000055d06d84db90 llvm::ModuleToFunctionPassAdaptor::run(llvm::Modu=
le&, llvm::AnalysisManager<llvm::Module>&) (clang-16+0x3268b90)
   #11 0x000055d06bb5b15d llvm::detail::PassModel<llvm::Module, llvm::Modul=
eToFunctionPassAdaptor, llvm::PreservedAnalyses, llvm::AnalysisManager<llvm=
::Module>>::run(llvm::Module&, llvm::AnalysisManager<llvm::Module>&) (clang=
-16+0x157615d)
   #12 0x000055d06d846ecf llvm::PassManager<llvm::Module, llvm::AnalysisMan=
ager<llvm::Module>>::run(llvm::Module&, llvm::AnalysisManager<llvm::Module>=
&) (clang-16+0x3261ecf)
   #13 0x000055d06e2f607a (anonymous namespace)::EmitAssemblyHelper::RunOpt=
imizationPipeline(clang::BackendAction, std::unique_ptr<llvm::raw_pwrite_st=
ream, std::default_delete<llvm::raw_pwrite_stream>>&, std::unique_ptr<llvm:=
:ToolOutputFile, std::default_delete<llvm::ToolOutputFile>>&) BackendUtil.c=
pp:0:0
   #14 0x000055d06e2f96c5 clang::EmitBackendOutput(clang::DiagnosticsEngine=
&, clang::HeaderSearchOptions const&, clang::CodeGenOptions const&, clang::=
TargetOptions const&, clang::LangOptions const&, llvm::StringRef, llvm::Mod=
ule*, clang::BackendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::d=
efault_delete<llvm::raw_pwrite_stream>>) (clang-16+0x3d146c5)
   #15 0x000055d06f11728d clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-16+0x4b3228d)
   #16 0x000055d06fc8dad1 clang::ParseAST(clang::Sema&, bool, bool) (clang-=
16+0x56a8ad1)
   #17 0x000055d06ea61f79 clang::FrontendAction::Execute() (clang-16+0x447c=
f79)
   #18 0x000055d06e9ead7b clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-16+0x4405d7b)
   #19 0x000055d06eb1cc83 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-16+0x4537c83)
   #20 0x000055d06b85f2b5 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-16+0x127a2b5)
   #21 0x000055d06b85a664 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&) driver.cpp:0:0
   #22 0x000055d06e855f75 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #23 0x000055d06dea5063 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-16+0x38c0063)
   #24 0x000055d06e856309 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #25 0x000055d06e822245 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-16+0x423d245)
   #26 0x000055d06e822c8d clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-16+0x423dc8d)
   #27 0x000055d06e833a3c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-16+0x424ea3c)
   #28 0x000055d06b85d332 clang_main(int, char**) (clang-16+0x1278332)
   #29 0x00007f2b66efb24a (/lib/x86_64-linux-gnu/libc.so.6+0x2724a)
   #30 0x00007f2b66efb305 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x27305)
   #31 0x000055d06b8569a1 _start (clang-16+0x12719a1)
>> clang-16: error: clang frontend command failed with exit code 139 (use -=
v to see invocation)
   clang version 16.0.6 (git://gitmirror/llvm_project 7cbf1a2591520c2491aa3=
5339f227775f4d3adf6)
   Target: riscv64-unknown-linux-gnu
   Thread model: posix
   InstalledDir: /opt/cross/clang-16/bin
   clang-16: note: diagnostic msg:
   ********************
--
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,init/.do_mounts_rd.o.d -nostdinc -I=
arch/riscv/include -I./arch/riscv/include/generated -Iinclude -I./include -=
Iarch/riscv/include/uapi -I./arch/riscv/include/generated/uapi -Iinclude/ua=
pi -I./include/generated/uapi -include include/linux/compiler-version.h -in=
clude include/linux/kconfig.h -include include/linux/compiler_types.h -D__K=
ERNEL__ --target=3Driscv64-linux-gnu -fintegrated-as -DCC_USING_PATCHABLE_F=
UNCTION_ENTRY -ffile-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dg=
nu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasin=
g -fPIE -mabi=3Dlp64 -march=3Drv64imac -mno-save-restore -mcmodel=3Dmedany =
-fno-asynchronous-unwind-tables -fno-unwind-tables -fno-delete-null-pointer=
-checks -O2 -fstack-protector-strong -fno-omit-frame-pointer -fno-optimize-=
sibling-calls -ftrivial-auto-var-init=3Dpattern -fpatchable-function-entry=
=3D8,4 -fsanitize=3Dkcfi -falign-functions=3D64 -fstrict-flex-arrays=3D3 -f=
no-strict-overflow -fno-stack-check -fno-builtin-wcslen -Wall -Wundef -Werr=
or=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-=
type -Werror=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -Wno-f=
rame-address -Wno-address-of-packed-member -Wmissing-declarations -Wmissing=
-prototypes -Wframe-larger-than=3D2048 -Wno-gnu -Wvla -Wno-pointer-sign -Wc=
ast-function-type -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Dinco=
mpatible-pointer-types -Wenum-conversion -Wextra -Wunused -Wmissing-format-=
attribute -Wmissing-include-dirs -Wunused-const-variable -Wno-missing-field=
-initializers -Wno-type-limits -Wno-shift-negative-value -Wno-enum-enum-con=
version -Wno-sign-compare -Wno-unused-parameter -DRANDSTRUCT -frandomize-la=
yout-seed-file=3D./scripts/basic/randstruct.seed -Wno-error=3Dreturn-type -=
Wreturn-type -funsigned-char -Wundef -fno-function-sections -fno-data-secti=
ons -fsanitize=3Dkernel-address -mllvm -asan-mapping-offset=3D0xdfffffff000=
00000 -mllvm -asan-instrumentation-with-call-threshold=3D10000 -mllvm -asan=
-stack=3D0 -mllvm -asan-globals=3D1 -mllvm -asan-kernel-mem-intrinsic-prefi=
x=3D1 -fsanitize=3Darray-bounds -fsanitize=3Dshift -fsanitize=3Dunreachable=
 -fsanitize=3Dbool -fsanitize=3Denum -fsanitize-coverage=3Dtrace-pc -fsanit=
ize-coverage=3Dtrace-cmp -Iinit -Iinit -DKBUILD_MODFILE=3D"init/mounts" -DK=
BUILD_BASENAME=3D"do_mounts_rd" -DKBUILD_MODNAME=3D"mounts" -D__KBUILD_MODN=
AME=3Dkmod_mounts -c -o init/do_mounts_rd.o init/do_mounts_rd.c
   1.	<eof> parser at end of file
   2.	Optimizer
   #0 0x0000557b0e6dc2bb llvm::sys::PrintStackTrace(llvm::raw_ostream&, int=
) (clang-16+0x396a2bb)
   #1 0x0000557b0e6da234 llvm::sys::CleanupOnSignal(unsigned long) (clang-1=
6+0x3968234)
   #2 0x0000557b0e631ca8 CrashRecoverySignalHandler(int) CrashRecoveryConte=
xt.cpp:0:0
   #3 0x00007f94148e5050 (/lib/x86_64-linux-gnu/libc.so.6+0x3c050)
   #4 0x0000557b0f8a1266 clang::BackendConsumer::DiagnosticHandlerImpl(llvm=
::DiagnosticInfo const&) (clang-16+0x4b2f266)
   #5 0x0000557b0f8a12bd clang::ClangDiagnosticHandler::handleDiagnostics(l=
lvm::DiagnosticInfo const&) (clang-16+0x4b2f2bd)
   #6 0x0000557b0df7810d llvm::LLVMContext::diagnose(llvm::DiagnosticInfo c=
onst&) (clang-16+0x320610d)
   #7 0x0000557b0fb3db86 llvm::KCFIPass::run(llvm::Function&, llvm::Analysi=
sManager<llvm::Function>&) (clang-16+0x4dcbb86)
   #8 0x0000557b0ea7455d llvm::detail::PassModel<llvm::Function, llvm::KCFI=
Pass, llvm::PreservedAnalyses, llvm::AnalysisManager<llvm::Function>>::run(=
llvm::Function&, llvm::AnalysisManager<llvm::Function>&) (clang-16+0x3d0255=
d)
   #9 0x0000557b0c2f2f2f llvm::detail::PassModel<llvm::Function, llvm::Pass=
Manager<llvm::Function, llvm::AnalysisManager<llvm::Function>>, llvm::Prese=
rvedAnalyses, llvm::AnalysisManager<llvm::Function>>::run(llvm::Function&, =
llvm::AnalysisManager<llvm::Function>&) (clang-16+0x1580f2f)
   #10 0x0000557b0dfdab90 llvm::ModuleToFunctionPassAdaptor::run(llvm::Modu=
le&, llvm::AnalysisManager<llvm::Module>&) (clang-16+0x3268b90)
   #11 0x0000557b0c2e815d llvm::detail::PassModel<llvm::Module, llvm::Modul=
eToFunctionPassAdaptor, llvm::PreservedAnalyses, llvm::AnalysisManager<llvm=
::Module>>::run(llvm::Module&, llvm::AnalysisManager<llvm::Module>&) (clang=
-16+0x157615d)
   #12 0x0000557b0dfd3ecf llvm::PassManager<llvm::Module, llvm::AnalysisMan=
ager<llvm::Module>>::run(llvm::Module&, llvm::AnalysisManager<llvm::Module>=
&) (clang-16+0x3261ecf)
   #13 0x0000557b0ea8307a (anonymous namespace)::EmitAssemblyHelper::RunOpt=
imizationPipeline(clang::BackendAction, std::unique_ptr<llvm::raw_pwrite_st=
ream, std::default_delete<llvm::raw_pwrite_stream>>&, std::unique_ptr<llvm:=
:ToolOutputFile, std::default_delete<llvm::ToolOutputFile>>&) BackendUtil.c=
pp:0:0
   #14 0x0000557b0ea866c5 clang::EmitBackendOutput(clang::DiagnosticsEngine=
&, clang::HeaderSearchOptions const&, clang::CodeGenOptions const&, clang::=
TargetOptions const&, clang::LangOptions const&, llvm::StringRef, llvm::Mod=
ule*, clang::BackendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::d=
efault_delete<llvm::raw_pwrite_stream>>) (clang-16+0x3d146c5)
   #15 0x0000557b0f8a428d clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-16+0x4b3228d)
   #16 0x0000557b1041aad1 clang::ParseAST(clang::Sema&, bool, bool) (clang-=
16+0x56a8ad1)
   #17 0x0000557b0f1eef79 clang::FrontendAction::Execute() (clang-16+0x447c=
f79)
   #18 0x0000557b0f177d7b clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-16+0x4405d7b)
   #19 0x0000557b0f2a9c83 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-16+0x4537c83)
   #20 0x0000557b0bfec2b5 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-16+0x127a2b5)
   #21 0x0000557b0bfe7664 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&) driver.cpp:0:0
   #22 0x0000557b0efe2f75 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #23 0x0000557b0e632063 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-16+0x38c0063)
   #24 0x0000557b0efe3309 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #25 0x0000557b0efaf245 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-16+0x423d245)
   #26 0x0000557b0efafc8d clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-16+0x423dc8d)
   #27 0x0000557b0efc0a3c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-16+0x424ea3c)
   #28 0x0000557b0bfea332 clang_main(int, char**) (clang-16+0x1278332)
   #29 0x00007f94148d024a (/lib/x86_64-linux-gnu/libc.so.6+0x2724a)
   #30 0x00007f94148d0305 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x27305)
   #31 0x0000557b0bfe39a1 _start (clang-16+0x12719a1)
>> clang-16: error: clang frontend command failed with exit code 139 (use -=
v to see invocation)
   clang version 16.0.6 (git://gitmirror/llvm_project 7cbf1a2591520c2491aa3=
5339f227775f4d3adf6)
   Target: riscv64-unknown-linux-gnu
   Thread model: posix
   InstalledDir: /opt/cross/clang-16/bin
   clang-16: note: diagnostic msg:
   ********************
--
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,init/.initramfs.o.d -nostdinc -Iarc=
h/riscv/include -I./arch/riscv/include/generated -Iinclude -I./include -Iar=
ch/riscv/include/uapi -I./arch/riscv/include/generated/uapi -Iinclude/uapi =
-I./include/generated/uapi -include include/linux/compiler-version.h -inclu=
de include/linux/kconfig.h -include include/linux/compiler_types.h -D__KERN=
EL__ --target=3Driscv64-linux-gnu -fintegrated-as -DCC_USING_PATCHABLE_FUNC=
TION_ENTRY -ffile-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu1=
1 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -=
fPIE -mabi=3Dlp64 -march=3Drv64imac -mno-save-restore -mcmodel=3Dmedany -fn=
o-asynchronous-unwind-tables -fno-unwind-tables -fno-delete-null-pointer-ch=
ecks -O2 -fstack-protector-strong -fno-omit-frame-pointer -fno-optimize-sib=
ling-calls -ftrivial-auto-var-init=3Dpattern -fpatchable-function-entry=3D8=
,4 -fsanitize=3Dkcfi -falign-functions=3D64 -fstrict-flex-arrays=3D3 -fno-s=
trict-overflow -fno-stack-check -fno-builtin-wcslen -Wall -Wundef -Werror=
=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-ty=
pe -Werror=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -Wno-fra=
me-address -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-p=
rototypes -Wframe-larger-than=3D2048 -Wno-gnu -Wvla -Wno-pointer-sign -Wcas=
t-function-type -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Dincomp=
atible-pointer-types -Wenum-conversion -Wextra -Wunused -Wmissing-format-at=
tribute -Wmissing-include-dirs -Wunused-const-variable -Wno-missing-field-i=
nitializers -Wno-type-limits -Wno-shift-negative-value -Wno-enum-enum-conve=
rsion -Wno-sign-compare -Wno-unused-parameter -DRANDSTRUCT -frandomize-layo=
ut-seed-file=3D./scripts/basic/randstruct.seed -Wno-error=3Dreturn-type -Wr=
eturn-type -funsigned-char -Wundef -fno-function-sections -fno-data-section=
s -fsanitize=3Dkernel-address -mllvm -asan-mapping-offset=3D0xdfffffff00000=
000 -mllvm -asan-instrumentation-with-call-threshold=3D10000 -mllvm -asan-s=
tack=3D0 -mllvm -asan-globals=3D1 -mllvm -asan-kernel-mem-intrinsic-prefix=
=3D1 -fsanitize=3Darray-bounds -fsanitize=3Dshift -fsanitize=3Dunreachable =
-fsanitize=3Dbool -fsanitize=3Denum -fsanitize-coverage=3Dtrace-pc -fsaniti=
ze-coverage=3Dtrace-cmp -Iinit -Iinit -DKBUILD_MODFILE=3D"init/initramfs" -=
DKBUILD_BASENAME=3D"initramfs" -DKBUILD_MODNAME=3D"initramfs" -D__KBUILD_MO=
DNAME=3Dkmod_initramfs -c -o init/initramfs.o init/initramfs.c
   1.	<eof> parser at end of file
   2.	Optimizer
   #0 0x0000558e70b792bb llvm::sys::PrintStackTrace(llvm::raw_ostream&, int=
) (clang-16+0x396a2bb)
   #1 0x0000558e70b77234 llvm::sys::CleanupOnSignal(unsigned long) (clang-1=
6+0x3968234)
   #2 0x0000558e70aceca8 CrashRecoverySignalHandler(int) CrashRecoveryConte=
xt.cpp:0:0
   #3 0x00007f4b6bffe050 (/lib/x86_64-linux-gnu/libc.so.6+0x3c050)
   #4 0x0000558e71d3e266 clang::BackendConsumer::DiagnosticHandlerImpl(llvm=
::DiagnosticInfo const&) (clang-16+0x4b2f266)
   #5 0x0000558e71d3e2bd clang::ClangDiagnosticHandler::handleDiagnostics(l=
lvm::DiagnosticInfo const&) (clang-16+0x4b2f2bd)
   #6 0x0000558e7041510d llvm::LLVMContext::diagnose(llvm::DiagnosticInfo c=
onst&) (clang-16+0x320610d)
   #7 0x0000558e71fdab86 llvm::KCFIPass::run(llvm::Function&, llvm::Analysi=
sManager<llvm::Function>&) (clang-16+0x4dcbb86)
   #8 0x0000558e70f1155d llvm::detail::PassModel<llvm::Function, llvm::KCFI=
Pass, llvm::PreservedAnalyses, llvm::AnalysisManager<llvm::Function>>::run(=
llvm::Function&, llvm::AnalysisManager<llvm::Function>&) (clang-16+0x3d0255=
d)
   #9 0x0000558e6e78ff2f llvm::detail::PassModel<llvm::Function, llvm::Pass=
Manager<llvm::Function, llvm::AnalysisManager<llvm::Function>>, llvm::Prese=
rvedAnalyses, llvm::AnalysisManager<llvm::Function>>::run(llvm::Function&, =
llvm::AnalysisManager<llvm::Function>&) (clang-16+0x1580f2f)
   #10 0x0000558e70477b90 llvm::ModuleToFunctionPassAdaptor::run(llvm::Modu=
le&, llvm::AnalysisManager<llvm::Module>&) (clang-16+0x3268b90)
   #11 0x0000558e6e78515d llvm::detail::PassModel<llvm::Module, llvm::Modul=
eToFunctionPassAdaptor, llvm::PreservedAnalyses, llvm::AnalysisManager<llvm=
::Module>>::run(llvm::Module&, llvm::AnalysisManager<llvm::Module>&) (clang=
-16+0x157615d)
   #12 0x0000558e70470ecf llvm::PassManager<llvm::Module, llvm::AnalysisMan=
ager<llvm::Module>>::run(llvm::Module&, llvm::AnalysisManager<llvm::Module>=
&) (clang-16+0x3261ecf)
   #13 0x0000558e70f2007a (anonymous namespace)::EmitAssemblyHelper::RunOpt=
imizationPipeline(clang::BackendAction, std::unique_ptr<llvm::raw_pwrite_st=
ream, std::default_delete<llvm::raw_pwrite_stream>>&, std::unique_ptr<llvm:=
:ToolOutputFile, std::default_delete<llvm::ToolOutputFile>>&) BackendUtil.c=
pp:0:0
   #14 0x0000558e70f236c5 clang::EmitBackendOutput(clang::DiagnosticsEngine=
&, clang::HeaderSearchOptions const&, clang::CodeGenOptions const&, clang::=
TargetOptions const&, clang::LangOptions const&, llvm::StringRef, llvm::Mod=
ule*, clang::BackendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::d=
efault_delete<llvm::raw_pwrite_stream>>) (clang-16+0x3d146c5)
   #15 0x0000558e71d4128d clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-16+0x4b3228d)
   #16 0x0000558e728b7ad1 clang::ParseAST(clang::Sema&, bool, bool) (clang-=
16+0x56a8ad1)
   #17 0x0000558e7168bf79 clang::FrontendAction::Execute() (clang-16+0x447c=
f79)
   #18 0x0000558e71614d7b clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-16+0x4405d7b)
   #19 0x0000558e71746c83 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-16+0x4537c83)
   #20 0x0000558e6e4892b5 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-16+0x127a2b5)
   #21 0x0000558e6e484664 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&) driver.cpp:0:0
   #22 0x0000558e7147ff75 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #23 0x0000558e70acf063 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-16+0x38c0063)
   #24 0x0000558e71480309 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #25 0x0000558e7144c245 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-16+0x423d245)
   #26 0x0000558e7144cc8d clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-16+0x423dc8d)
   #27 0x0000558e7145da3c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-16+0x424ea3c)
   #28 0x0000558e6e487332 clang_main(int, char**) (clang-16+0x1278332)
   #29 0x00007f4b6bfe924a (/lib/x86_64-linux-gnu/libc.so.6+0x2724a)
   #30 0x00007f4b6bfe9305 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x27305)
   #31 0x0000558e6e4809a1 _start (clang-16+0x12719a1)
>> clang-16: error: clang frontend command failed with exit code 139 (use -=
v to see invocation)
   clang version 16.0.6 (git://gitmirror/llvm_project 7cbf1a2591520c2491aa3=
5339f227775f4d3adf6)
   Target: riscv64-unknown-linux-gnu
   Thread model: posix
   InstalledDir: /opt/cross/clang-16/bin
   clang-16: note: diagnostic msg:
   ********************
--
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,kernel/.fork.o.d -nostdinc -Iarch/r=
iscv/include -I./arch/riscv/include/generated -Iinclude -I./include -Iarch/=
riscv/include/uapi -I./arch/riscv/include/generated/uapi -Iinclude/uapi -I.=
/include/generated/uapi -include include/linux/compiler-version.h -include =
include/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL_=
_ --target=3Driscv64-linux-gnu -fintegrated-as -DCC_USING_PATCHABLE_FUNCTIO=
N_ENTRY -ffile-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -=
fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -fPI=
E -mabi=3Dlp64 -march=3Drv64imac -mno-save-restore -mcmodel=3Dmedany -fno-a=
synchronous-unwind-tables -fno-unwind-tables -fno-delete-null-pointer-check=
s -O2 -fstack-protector-strong -fno-omit-frame-pointer -fno-optimize-siblin=
g-calls -ftrivial-auto-var-init=3Dpattern -fpatchable-function-entry=3D8,4 =
-fsanitize=3Dkcfi -falign-functions=3D64 -fstrict-flex-arrays=3D3 -fno-stri=
ct-overflow -fno-stack-check -fno-builtin-wcslen -Wall -Wundef -Werror=3Dim=
plicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -W=
error=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-ad=
dress -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-protot=
ypes -Wframe-larger-than=3D2048 -Wno-gnu -Wvla -Wno-pointer-sign -Wcast-fun=
ction-type -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Dincompatibl=
e-pointer-types -Wenum-conversion -Wextra -Wunused -Wmissing-format-attribu=
te -Wmissing-include-dirs -Wunused-const-variable -Wno-missing-field-initia=
lizers -Wno-type-limits -Wno-shift-negative-value -Wno-enum-enum-conversion=
 -Wno-sign-compare -Wno-unused-parameter -DRANDSTRUCT -frandomize-layout-se=
ed-file=3D./scripts/basic/randstruct.seed -Wno-error=3Dreturn-type -Wreturn=
-type -funsigned-char -Wundef -fsanitize=3Dkernel-address -mllvm -asan-mapp=
ing-offset=3D0xdfffffff00000000 -mllvm -asan-instrumentation-with-call-thre=
shold=3D10000 -mllvm -asan-stack=3D0 -mllvm -asan-globals=3D1 -mllvm -asan-=
kernel-mem-intrinsic-prefix=3D1 -fsanitize=3Darray-bounds -fsanitize=3Dshif=
t -fsanitize=3Dunreachable -fsanitize=3Dbool -fsanitize=3Denum -fsanitize-c=
overage=3Dtrace-pc -fsanitize-coverage=3Dtrace-cmp -Ikernel -Ikernel -DKBUI=
LD_MODFILE=3D"kernel/fork" -DKBUILD_BASENAME=3D"fork" -DKBUILD_MODNAME=3D"f=
ork" -D__KBUILD_MODNAME=3Dkmod_fork -c -o kernel/fork.o kernel/fork.c
   1.	<eof> parser at end of file
   2.	Optimizer
   #0 0x000055b3e90ab2bb llvm::sys::PrintStackTrace(llvm::raw_ostream&, int=
) (clang-16+0x396a2bb)
   #1 0x000055b3e90a9234 llvm::sys::CleanupOnSignal(unsigned long) (clang-1=
6+0x3968234)
   #2 0x000055b3e9000ca8 CrashRecoverySignalHandler(int) CrashRecoveryConte=
xt.cpp:0:0
   #3 0x00007fc9578c5050 (/lib/x86_64-linux-gnu/libc.so.6+0x3c050)
   #4 0x000055b3ea270266 clang::BackendConsumer::DiagnosticHandlerImpl(llvm=
::DiagnosticInfo const&) (clang-16+0x4b2f266)
   #5 0x000055b3ea2702bd clang::ClangDiagnosticHandler::handleDiagnostics(l=
lvm::DiagnosticInfo const&) (clang-16+0x4b2f2bd)
   #6 0x000055b3e894710d llvm::LLVMContext::diagnose(llvm::DiagnosticInfo c=
onst&) (clang-16+0x320610d)
   #7 0x000055b3ea50cb86 llvm::KCFIPass::run(llvm::Function&, llvm::Analysi=
sManager<llvm::Function>&) (clang-16+0x4dcbb86)
   #8 0x000055b3e944355d llvm::detail::PassModel<llvm::Function, llvm::KCFI=
Pass, llvm::PreservedAnalyses, llvm::AnalysisManager<llvm::Function>>::run(=
llvm::Function&, llvm::AnalysisManager<llvm::Function>&) (clang-16+0x3d0255=
d)
   #9 0x000055b3e6cc1f2f llvm::detail::PassModel<llvm::Function, llvm::Pass=
Manager<llvm::Function, llvm::AnalysisManager<llvm::Function>>, llvm::Prese=
rvedAnalyses, llvm::AnalysisManager<llvm::Function>>::run(llvm::Function&, =
llvm::AnalysisManager<llvm::Function>&) (clang-16+0x1580f2f)
   #10 0x000055b3e89a9b90 llvm::ModuleToFunctionPassAdaptor::run(llvm::Modu=
le&, llvm::AnalysisManager<llvm::Module>&) (clang-16+0x3268b90)
   #11 0x000055b3e6cb715d llvm::detail::PassModel<llvm::Module, llvm::Modul=
eToFunctionPassAdaptor, llvm::PreservedAnalyses, llvm::AnalysisManager<llvm=
::Module>>::run(llvm::Module&, llvm::AnalysisManager<llvm::Module>&) (clang=
-16+0x157615d)
   #12 0x000055b3e89a2ecf llvm::PassManager<llvm::Module, llvm::AnalysisMan=
ager<llvm::Module>>::run(llvm::Module&, llvm::AnalysisManager<llvm::Module>=
&) (clang-16+0x3261ecf)
   #13 0x000055b3e945207a (anonymous namespace)::EmitAssemblyHelper::RunOpt=
imizationPipeline(clang::BackendAction, std::unique_ptr<llvm::raw_pwrite_st=
ream, std::default_delete<llvm::raw_pwrite_stream>>&, std::unique_ptr<llvm:=
:ToolOutputFile, std::default_delete<llvm::ToolOutputFile>>&) BackendUtil.c=
pp:0:0
   #14 0x000055b3e94556c5 clang::EmitBackendOutput(clang::DiagnosticsEngine=
&, clang::HeaderSearchOptions const&, clang::CodeGenOptions const&, clang::=
TargetOptions const&, clang::LangOptions const&, llvm::StringRef, llvm::Mod=
ule*, clang::BackendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::d=
efault_delete<llvm::raw_pwrite_stream>>) (clang-16+0x3d146c5)
   #15 0x000055b3ea27328d clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-16+0x4b3228d)
   #16 0x000055b3eade9ad1 clang::ParseAST(clang::Sema&, bool, bool) (clang-=
16+0x56a8ad1)
   #17 0x000055b3e9bbdf79 clang::FrontendAction::Execute() (clang-16+0x447c=
f79)
   #18 0x000055b3e9b46d7b clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-16+0x4405d7b)
   #19 0x000055b3e9c78c83 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-16+0x4537c83)
   #20 0x000055b3e69bb2b5 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-16+0x127a2b5)
   #21 0x000055b3e69b6664 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&) driver.cpp:0:0
   #22 0x000055b3e99b1f75 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #23 0x000055b3e9001063 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-16+0x38c0063)
   #24 0x000055b3e99b2309 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #25 0x000055b3e997e245 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-16+0x423d245)
   #26 0x000055b3e997ec8d clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-16+0x423dc8d)
   #27 0x000055b3e998fa3c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-16+0x424ea3c)
   #28 0x000055b3e69b9332 clang_main(int, char**) (clang-16+0x1278332)
   #29 0x00007fc9578b024a (/lib/x86_64-linux-gnu/libc.so.6+0x2724a)
   #30 0x00007fc9578b0305 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x27305)
   #31 0x000055b3e69b29a1 _start (clang-16+0x12719a1)
>> clang-16: error: clang frontend command failed with exit code 139 (use -=
v to see invocation)
   clang version 16.0.6 (git://gitmirror/llvm_project 7cbf1a2591520c2491aa3=
5339f227775f4d3adf6)
   Target: riscv64-unknown-linux-gnu
   Thread model: posix
   InstalledDir: /opt/cross/clang-16/bin
   clang-16: note: diagnostic msg:
   ********************
--
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,kernel/.panic.o.d -nostdinc -Iarch/=
riscv/include -I./arch/riscv/include/generated -Iinclude -I./include -Iarch=
/riscv/include/uapi -I./arch/riscv/include/generated/uapi -Iinclude/uapi -I=
=2E/include/generated/uapi -include include/linux/compiler-version.h -inclu=
de include/linux/kconfig.h -include include/linux/compiler_types.h -D__KERN=
EL__ --target=3Driscv64-linux-gnu -fintegrated-as -DCC_USING_PATCHABLE_FUNC=
TION_ENTRY -ffile-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu1=
1 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -=
fPIE -mabi=3Dlp64 -march=3Drv64imac -mno-save-restore -mcmodel=3Dmedany -fn=
o-asynchronous-unwind-tables -fno-unwind-tables -fno-delete-null-pointer-ch=
ecks -O2 -fstack-protector-strong -fno-omit-frame-pointer -fno-optimize-sib=
ling-calls -ftrivial-auto-var-init=3Dpattern -fpatchable-function-entry=3D8=
,4 -fsanitize=3Dkcfi -falign-functions=3D64 -fstrict-flex-arrays=3D3 -fno-s=
trict-overflow -fno-stack-check -fno-builtin-wcslen -Wall -Wundef -Werror=
=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-ty=
pe -Werror=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -Wno-fra=
me-address -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-p=
rototypes -Wframe-larger-than=3D2048 -Wno-gnu -Wvla -Wno-pointer-sign -Wcas=
t-function-type -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Dincomp=
atible-pointer-types -Wenum-conversion -Wextra -Wunused -Wmissing-format-at=
tribute -Wmissing-include-dirs -Wunused-const-variable -Wno-missing-field-i=
nitializers -Wno-type-limits -Wno-shift-negative-value -Wno-enum-enum-conve=
rsion -Wno-sign-compare -Wno-unused-parameter -DRANDSTRUCT -frandomize-layo=
ut-seed-file=3D./scripts/basic/randstruct.seed -Wno-error=3Dreturn-type -Wr=
eturn-type -funsigned-char -Wundef -fsanitize=3Dkernel-address -mllvm -asan=
-mapping-offset=3D0xdfffffff00000000 -mllvm -asan-instrumentation-with-call=
-threshold=3D10000 -mllvm -asan-stack=3D0 -mllvm -asan-globals=3D1 -mllvm -=
asan-kernel-mem-intrinsic-prefix=3D1 -fsanitize=3Darray-bounds -fsanitize=
=3Dshift -fsanitize=3Dunreachable -fsanitize=3Dbool -fsanitize=3Denum -fsan=
itize-coverage=3Dtrace-pc -fsanitize-coverage=3Dtrace-cmp -Ikernel -Ikernel=
 -DKBUILD_MODFILE=3D"kernel/panic" -DKBUILD_BASENAME=3D"panic" -DKBUILD_MOD=
NAME=3D"panic" -D__KBUILD_MODNAME=3Dkmod_panic -c -o kernel/panic.o kernel/=
panic.c
   1.	<eof> parser at end of file
   2.	Optimizer
   #0 0x0000558cecf512bb llvm::sys::PrintStackTrace(llvm::raw_ostream&, int=
) (clang-16+0x396a2bb)
   #1 0x0000558cecf4f234 llvm::sys::CleanupOnSignal(unsigned long) (clang-1=
6+0x3968234)
   #2 0x0000558cecea6ca8 CrashRecoverySignalHandler(int) CrashRecoveryConte=
xt.cpp:0:0
   #3 0x00007fc4278b7050 (/lib/x86_64-linux-gnu/libc.so.6+0x3c050)
   #4 0x0000558cee116266 clang::BackendConsumer::DiagnosticHandlerImpl(llvm=
::DiagnosticInfo const&) (clang-16+0x4b2f266)
   #5 0x0000558cee1162bd clang::ClangDiagnosticHandler::handleDiagnostics(l=
lvm::DiagnosticInfo const&) (clang-16+0x4b2f2bd)
   #6 0x0000558cec7ed10d llvm::LLVMContext::diagnose(llvm::DiagnosticInfo c=
onst&) (clang-16+0x320610d)
   #7 0x0000558cee3b2b86 llvm::KCFIPass::run(llvm::Function&, llvm::Analysi=
sManager<llvm::Function>&) (clang-16+0x4dcbb86)
   #8 0x0000558ced2e955d llvm::detail::PassModel<llvm::Function, llvm::KCFI=
Pass, llvm::PreservedAnalyses, llvm::AnalysisManager<llvm::Function>>::run(=
llvm::Function&, llvm::AnalysisManager<llvm::Function>&) (clang-16+0x3d0255=
d)
   #9 0x0000558ceab67f2f llvm::detail::PassModel<llvm::Function, llvm::Pass=
Manager<llvm::Function, llvm::AnalysisManager<llvm::Function>>, llvm::Prese=
rvedAnalyses, llvm::AnalysisManager<llvm::Function>>::run(llvm::Function&, =
llvm::AnalysisManager<llvm::Function>&) (clang-16+0x1580f2f)
   #10 0x0000558cec84fb90 llvm::ModuleToFunctionPassAdaptor::run(llvm::Modu=
le&, llvm::AnalysisManager<llvm::Module>&) (clang-16+0x3268b90)
   #11 0x0000558ceab5d15d llvm::detail::PassModel<llvm::Module, llvm::Modul=
eToFunctionPassAdaptor, llvm::PreservedAnalyses, llvm::AnalysisManager<llvm=
::Module>>::run(llvm::Module&, llvm::AnalysisManager<llvm::Module>&) (clang=
-16+0x157615d)
   #12 0x0000558cec848ecf llvm::PassManager<llvm::Module, llvm::AnalysisMan=
ager<llvm::Module>>::run(llvm::Module&, llvm::AnalysisManager<llvm::Module>=
&) (clang-16+0x3261ecf)
   #13 0x0000558ced2f807a (anonymous namespace)::EmitAssemblyHelper::RunOpt=
imizationPipeline(clang::BackendAction, std::unique_ptr<llvm::raw_pwrite_st=
ream, std::default_delete<llvm::raw_pwrite_stream>>&, std::unique_ptr<llvm:=
:ToolOutputFile, std::default_delete<llvm::ToolOutputFile>>&) BackendUtil.c=
pp:0:0
   #14 0x0000558ced2fb6c5 clang::EmitBackendOutput(clang::DiagnosticsEngine=
&, clang::HeaderSearchOptions const&, clang::CodeGenOptions const&, clang::=
TargetOptions const&, clang::LangOptions const&, llvm::StringRef, llvm::Mod=
ule*, clang::BackendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::d=
efault_delete<llvm::raw_pwrite_stream>>) (clang-16+0x3d146c5)
   #15 0x0000558cee11928d clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-16+0x4b3228d)
   #16 0x0000558ceec8fad1 clang::ParseAST(clang::Sema&, bool, bool) (clang-=
16+0x56a8ad1)
   #17 0x0000558ceda63f79 clang::FrontendAction::Execute() (clang-16+0x447c=
f79)
   #18 0x0000558ced9ecd7b clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-16+0x4405d7b)
   #19 0x0000558cedb1ec83 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-16+0x4537c83)
   #20 0x0000558cea8612b5 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-16+0x127a2b5)
   #21 0x0000558cea85c664 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&) driver.cpp:0:0
   #22 0x0000558ced857f75 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #23 0x0000558cecea7063 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-16+0x38c0063)
   #24 0x0000558ced858309 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #25 0x0000558ced824245 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-16+0x423d245)
   #26 0x0000558ced824c8d clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-16+0x423dc8d)
   #27 0x0000558ced835a3c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-16+0x424ea3c)
   #28 0x0000558cea85f332 clang_main(int, char**) (clang-16+0x1278332)
   #29 0x00007fc4278a224a (/lib/x86_64-linux-gnu/libc.so.6+0x2724a)
   #30 0x00007fc4278a2305 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x27305)
   #31 0x0000558cea8589a1 _start (clang-16+0x12719a1)
>> clang-16: error: clang frontend command failed with exit code 139 (use -=
v to see invocation)
   clang version 16.0.6 (git://gitmirror/llvm_project 7cbf1a2591520c2491aa3=
5339f227775f4d3adf6)
   Target: riscv64-unknown-linux-gnu
   Thread model: posix
   InstalledDir: /opt/cross/clang-16/bin
   clang-16: note: diagnostic msg:
   ********************
--
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,kernel/.cpu.o.d -nostdinc -Iarch/ri=
scv/include -I./arch/riscv/include/generated -Iinclude -I./include -Iarch/r=
iscv/include/uapi -I./arch/riscv/include/generated/uapi -Iinclude/uapi -I./=
include/generated/uapi -include include/linux/compiler-version.h -include i=
nclude/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__=
 --target=3Driscv64-linux-gnu -fintegrated-as -DCC_USING_PATCHABLE_FUNCTION=
_ENTRY -ffile-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -f=
short-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -fPIE=
 -mabi=3Dlp64 -march=3Drv64imac -mno-save-restore -mcmodel=3Dmedany -fno-as=
ynchronous-unwind-tables -fno-unwind-tables -fno-delete-null-pointer-checks=
 -O2 -fstack-protector-strong -fno-omit-frame-pointer -fno-optimize-sibling=
-calls -ftrivial-auto-var-init=3Dpattern -fpatchable-function-entry=3D8,4 -=
fsanitize=3Dkcfi -falign-functions=3D64 -fstrict-flex-arrays=3D3 -fno-stric=
t-overflow -fno-stack-check -fno-builtin-wcslen -Wall -Wundef -Werror=3Dimp=
licit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -We=
rror=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-add=
ress -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-prototy=
pes -Wframe-larger-than=3D2048 -Wno-gnu -Wvla -Wno-pointer-sign -Wcast-func=
tion-type -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Dincompatible=
-pointer-types -Wenum-conversion -Wextra -Wunused -Wmissing-format-attribut=
e -Wmissing-include-dirs -Wunused-const-variable -Wno-missing-field-initial=
izers -Wno-type-limits -Wno-shift-negative-value -Wno-enum-enum-conversion =
-Wno-sign-compare -Wno-unused-parameter -DRANDSTRUCT -frandomize-layout-see=
d-file=3D./scripts/basic/randstruct.seed -Wno-error=3Dreturn-type -Wreturn-=
type -funsigned-char -Wundef -fsanitize=3Dkernel-address -mllvm -asan-mappi=
ng-offset=3D0xdfffffff00000000 -mllvm -asan-instrumentation-with-call-thres=
hold=3D10000 -mllvm -asan-stack=3D0 -mllvm -asan-globals=3D1 -mllvm -asan-k=
ernel-mem-intrinsic-prefix=3D1 -fsanitize=3Darray-bounds -fsanitize=3Dshift=
 -fsanitize=3Dunreachable -fsanitize=3Dbool -fsanitize=3Denum -fsanitize-co=
verage=3Dtrace-pc -fsanitize-coverage=3Dtrace-cmp -Ikernel -Ikernel -DKBUIL=
D_MODFILE=3D"kernel/cpu" -DKBUILD_BASENAME=3D"cpu" -DKBUILD_MODNAME=3D"cpu"=
 -D__KBUILD_MODNAME=3Dkmod_cpu -c -o kernel/cpu.o kernel/cpu.c
   1.	<eof> parser at end of file
   2.	Optimizer
   #0 0x000055fbf506c2bb llvm::sys::PrintStackTrace(llvm::raw_ostream&, int=
) (clang-16+0x396a2bb)
   #1 0x000055fbf506a234 llvm::sys::CleanupOnSignal(unsigned long) (clang-1=
6+0x3968234)
   #2 0x000055fbf4fc1ca8 CrashRecoverySignalHandler(int) CrashRecoveryConte=
xt.cpp:0:0
   #3 0x00007fd2f0bf0050 (/lib/x86_64-linux-gnu/libc.so.6+0x3c050)
   #4 0x000055fbf6231266 clang::BackendConsumer::DiagnosticHandlerImpl(llvm=
::DiagnosticInfo const&) (clang-16+0x4b2f266)
   #5 0x000055fbf62312bd clang::ClangDiagnosticHandler::handleDiagnostics(l=
lvm::DiagnosticInfo const&) (clang-16+0x4b2f2bd)
   #6 0x000055fbf490810d llvm::LLVMContext::diagnose(llvm::DiagnosticInfo c=
onst&) (clang-16+0x320610d)
   #7 0x000055fbf64cdb86 llvm::KCFIPass::run(llvm::Function&, llvm::Analysi=
sManager<llvm::Function>&) (clang-16+0x4dcbb86)
   #8 0x000055fbf540455d llvm::detail::PassModel<llvm::Function, llvm::KCFI=
Pass, llvm::PreservedAnalyses, llvm::AnalysisManager<llvm::Function>>::run(=
llvm::Function&, llvm::AnalysisManager<llvm::Function>&) (clang-16+0x3d0255=
d)
   #9 0x000055fbf2c82f2f llvm::detail::PassModel<llvm::Function, llvm::Pass=
Manager<llvm::Function, llvm::AnalysisManager<llvm::Function>>, llvm::Prese=
rvedAnalyses, llvm::AnalysisManager<llvm::Function>>::run(llvm::Function&, =
llvm::AnalysisManager<llvm::Function>&) (clang-16+0x1580f2f)
   #10 0x000055fbf496ab90 llvm::ModuleToFunctionPassAdaptor::run(llvm::Modu=
le&, llvm::AnalysisManager<llvm::Module>&) (clang-16+0x3268b90)
   #11 0x000055fbf2c7815d llvm::detail::PassModel<llvm::Module, llvm::Modul=
eToFunctionPassAdaptor, llvm::PreservedAnalyses, llvm::AnalysisManager<llvm=
::Module>>::run(llvm::Module&, llvm::AnalysisManager<llvm::Module>&) (clang=
-16+0x157615d)
   #12 0x000055fbf4963ecf llvm::PassManager<llvm::Module, llvm::AnalysisMan=
ager<llvm::Module>>::run(llvm::Module&, llvm::AnalysisManager<llvm::Module>=
&) (clang-16+0x3261ecf)
   #13 0x000055fbf541307a (anonymous namespace)::EmitAssemblyHelper::RunOpt=
imizationPipeline(clang::BackendAction, std::unique_ptr<llvm::raw_pwrite_st=
ream, std::default_delete<llvm::raw_pwrite_stream>>&, std::unique_ptr<llvm:=
:ToolOutputFile, std::default_delete<llvm::ToolOutputFile>>&) BackendUtil.c=
pp:0:0
   #14 0x000055fbf54166c5 clang::EmitBackendOutput(clang::DiagnosticsEngine=
&, clang::HeaderSearchOptions const&, clang::CodeGenOptions const&, clang::=
TargetOptions const&, clang::LangOptions const&, llvm::StringRef, llvm::Mod=
ule*, clang::BackendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::d=
efault_delete<llvm::raw_pwrite_stream>>) (clang-16+0x3d146c5)
   #15 0x000055fbf623428d clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-16+0x4b3228d)
   #16 0x000055fbf6daaad1 clang::ParseAST(clang::Sema&, bool, bool) (clang-=
16+0x56a8ad1)
   #17 0x000055fbf5b7ef79 clang::FrontendAction::Execute() (clang-16+0x447c=
f79)
   #18 0x000055fbf5b07d7b clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-16+0x4405d7b)
   #19 0x000055fbf5c39c83 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-16+0x4537c83)
   #20 0x000055fbf297c2b5 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-16+0x127a2b5)
   #21 0x000055fbf2977664 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&) driver.cpp:0:0
   #22 0x000055fbf5972f75 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #23 0x000055fbf4fc2063 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-16+0x38c0063)
   #24 0x000055fbf5973309 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #25 0x000055fbf593f245 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-16+0x423d245)
   #26 0x000055fbf593fc8d clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-16+0x423dc8d)
   #27 0x000055fbf5950a3c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-16+0x424ea3c)
   #28 0x000055fbf297a332 clang_main(int, char**) (clang-16+0x1278332)
   #29 0x00007fd2f0bdb24a (/lib/x86_64-linux-gnu/libc.so.6+0x2724a)
   #30 0x00007fd2f0bdb305 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x27305)
   #31 0x000055fbf29739a1 _start (clang-16+0x12719a1)
>> clang-16: error: clang frontend command failed with exit code 139 (use -=
v to see invocation)
   clang version 16.0.6 (git://gitmirror/llvm_project 7cbf1a2591520c2491aa3=
5339f227775f4d3adf6)
   Target: riscv64-unknown-linux-gnu
   Thread model: posix
   InstalledDir: /opt/cross/clang-16/bin
   clang-16: note: diagnostic msg:
   ********************
--
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,kernel/.softirq.o.d -nostdinc -Iarc=
h/riscv/include -I./arch/riscv/include/generated -Iinclude -I./include -Iar=
ch/riscv/include/uapi -I./arch/riscv/include/generated/uapi -Iinclude/uapi =
-I./include/generated/uapi -include include/linux/compiler-version.h -inclu=
de include/linux/kconfig.h -include include/linux/compiler_types.h -D__KERN=
EL__ --target=3Driscv64-linux-gnu -fintegrated-as -DCC_USING_PATCHABLE_FUNC=
TION_ENTRY -ffile-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu1=
1 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -=
fPIE -mabi=3Dlp64 -march=3Drv64imac -mno-save-restore -mcmodel=3Dmedany -fn=
o-asynchronous-unwind-tables -fno-unwind-tables -fno-delete-null-pointer-ch=
ecks -O2 -fstack-protector-strong -fno-omit-frame-pointer -fno-optimize-sib=
ling-calls -ftrivial-auto-var-init=3Dpattern -fpatchable-function-entry=3D8=
,4 -fsanitize=3Dkcfi -falign-functions=3D64 -fstrict-flex-arrays=3D3 -fno-s=
trict-overflow -fno-stack-check -fno-builtin-wcslen -Wall -Wundef -Werror=
=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-ty=
pe -Werror=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -Wno-fra=
me-address -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-p=
rototypes -Wframe-larger-than=3D2048 -Wno-gnu -Wvla -Wno-pointer-sign -Wcas=
t-function-type -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Dincomp=
atible-pointer-types -Wenum-conversion -Wextra -Wunused -Wmissing-format-at=
tribute -Wmissing-include-dirs -Wunused-const-variable -Wno-missing-field-i=
nitializers -Wno-type-limits -Wno-shift-negative-value -Wno-enum-enum-conve=
rsion -Wno-sign-compare -Wno-unused-parameter -DRANDSTRUCT -frandomize-layo=
ut-seed-file=3D./scripts/basic/randstruct.seed -Wno-error=3Dreturn-type -Wr=
eturn-type -funsigned-char -Wundef -fsanitize=3Dkernel-address -mllvm -asan=
-mapping-offset=3D0xdfffffff00000000 -mllvm -asan-instrumentation-with-call=
-threshold=3D10000 -mllvm -asan-stack=3D0 -mllvm -asan-globals=3D1 -mllvm -=
asan-kernel-mem-intrinsic-prefix=3D1 -fsanitize=3Darray-bounds -fsanitize=
=3Dshift -fsanitize=3Dunreachable -fsanitize=3Dbool -fsanitize=3Denum -Iker=
nel -Ikernel -DKBUILD_MODFILE=3D"kernel/softirq" -DKBUILD_BASENAME=3D"softi=
rq" -DKBUILD_MODNAME=3D"softirq" -D__KBUILD_MODNAME=3Dkmod_softirq -c -o ke=
rnel/softirq.o kernel/softirq.c
   1.	<eof> parser at end of file
   2.	Optimizer
   #0 0x000055db66a272bb llvm::sys::PrintStackTrace(llvm::raw_ostream&, int=
) (clang-16+0x396a2bb)
   #1 0x000055db66a25234 llvm::sys::CleanupOnSignal(unsigned long) (clang-1=
6+0x3968234)
   #2 0x000055db6697cca8 CrashRecoverySignalHandler(int) CrashRecoveryConte=
xt.cpp:0:0
   #3 0x00007f9298c97050 (/lib/x86_64-linux-gnu/libc.so.6+0x3c050)
   #4 0x000055db67bec266 clang::BackendConsumer::DiagnosticHandlerImpl(llvm=
::DiagnosticInfo const&) (clang-16+0x4b2f266)
   #5 0x000055db67bec2bd clang::ClangDiagnosticHandler::handleDiagnostics(l=
lvm::DiagnosticInfo const&) (clang-16+0x4b2f2bd)
   #6 0x000055db662c310d llvm::LLVMContext::diagnose(llvm::DiagnosticInfo c=
onst&) (clang-16+0x320610d)
   #7 0x000055db67e88b86 llvm::KCFIPass::run(llvm::Function&, llvm::Analysi=
sManager<llvm::Function>&) (clang-16+0x4dcbb86)
   #8 0x000055db66dbf55d llvm::detail::PassModel<llvm::Function, llvm::KCFI=
Pass, llvm::PreservedAnalyses, llvm::AnalysisManager<llvm::Function>>::run(=
llvm::Function&, llvm::AnalysisManager<llvm::Function>&) (clang-16+0x3d0255=
d)
   #9 0x000055db6463df2f llvm::detail::PassModel<llvm::Function, llvm::Pass=
Manager<llvm::Function, llvm::AnalysisManager<llvm::Function>>, llvm::Prese=
rvedAnalyses, llvm::AnalysisManager<llvm::Function>>::run(llvm::Function&, =
llvm::AnalysisManager<llvm::Function>&) (clang-16+0x1580f2f)
   #10 0x000055db66325b90 llvm::ModuleToFunctionPassAdaptor::run(llvm::Modu=
le&, llvm::AnalysisManager<llvm::Module>&) (clang-16+0x3268b90)
   #11 0x000055db6463315d llvm::detail::PassModel<llvm::Module, llvm::Modul=
eToFunctionPassAdaptor, llvm::PreservedAnalyses, llvm::AnalysisManager<llvm=
::Module>>::run(llvm::Module&, llvm::AnalysisManager<llvm::Module>&) (clang=
-16+0x157615d)
   #12 0x000055db6631eecf llvm::PassManager<llvm::Module, llvm::AnalysisMan=
ager<llvm::Module>>::run(llvm::Module&, llvm::AnalysisManager<llvm::Module>=
&) (clang-16+0x3261ecf)
   #13 0x000055db66dce07a (anonymous namespace)::EmitAssemblyHelper::RunOpt=
imizationPipeline(clang::BackendAction, std::unique_ptr<llvm::raw_pwrite_st=
ream, std::default_delete<llvm::raw_pwrite_stream>>&, std::unique_ptr<llvm:=
:ToolOutputFile, std::default_delete<llvm::ToolOutputFile>>&) BackendUtil.c=
pp:0:0
   #14 0x000055db66dd16c5 clang::EmitBackendOutput(clang::DiagnosticsEngine=
&, clang::HeaderSearchOptions const&, clang::CodeGenOptions const&, clang::=
TargetOptions const&, clang::LangOptions const&, llvm::StringRef, llvm::Mod=
ule*, clang::BackendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::d=
efault_delete<llvm::raw_pwrite_stream>>) (clang-16+0x3d146c5)
   #15 0x000055db67bef28d clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-16+0x4b3228d)
   #16 0x000055db68765ad1 clang::ParseAST(clang::Sema&, bool, bool) (clang-=
16+0x56a8ad1)
   #17 0x000055db67539f79 clang::FrontendAction::Execute() (clang-16+0x447c=
f79)
   #18 0x000055db674c2d7b clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-16+0x4405d7b)
   #19 0x000055db675f4c83 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-16+0x4537c83)
   #20 0x000055db643372b5 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-16+0x127a2b5)
   #21 0x000055db64332664 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&) driver.cpp:0:0
   #22 0x000055db6732df75 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #23 0x000055db6697d063 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-16+0x38c0063)
   #24 0x000055db6732e309 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #25 0x000055db672fa245 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-16+0x423d245)
   #26 0x000055db672fac8d clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-16+0x423dc8d)
   #27 0x000055db6730ba3c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-16+0x424ea3c)
   #28 0x000055db64335332 clang_main(int, char**) (clang-16+0x1278332)
   #29 0x00007f9298c8224a (/lib/x86_64-linux-gnu/libc.so.6+0x2724a)
   #30 0x00007f9298c82305 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x27305)
   #31 0x000055db6432e9a1 _start (clang-16+0x12719a1)
>> clang-16: error: clang frontend command failed with exit code 139 (use -=
v to see invocation)
   clang version 16.0.6 (git://gitmirror/llvm_project 7cbf1a2591520c2491aa3=
5339f227775f4d3adf6)
   Target: riscv64-unknown-linux-gnu
   Thread model: posix
   InstalledDir: /opt/cross/clang-16/bin
   clang-16: note: diagnostic msg:
   ********************
=2E.

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
