Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849B886347
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Dec 2025 00:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765497781; cv=none; b=DLHh8eaDObGF5oerC7F62pDF3JAdmJuLMCWJbMPzrvnSZYqhqjytdlK5woZVKLFaF3UQ+SEuqqlDY4zTryPsyjR5lVlBYDajbTuhsxHuovBC7lktCWuJTKET4ZRc+A/3o741VC2NV+/oGrCGmxV0tcSJ7qeWj/FNpT98sGr79r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765497781; c=relaxed/simple;
	bh=sJHBzRTTTeUYdu6F75SdPDMk44ALdrs2ZK8FSBqPTYk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qDipZTREMJnpF10ZggCDV5ImHuAzpAX2AbiSH5mn7kOgjYabYzg2uRZxUoKkCsnGfKO+be2UbC3kV+7Wvod+0UiFXiDCrDCEKcQ9ugaxihlcmebAXGZRFhFOI+VbtSZ5VFsmTeDVVINr4yBwk/sB6U/6dpHulxUyakxlf1IeaLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FYvv/W2B; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FYvv/W2B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765497779; x=1797033779;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sJHBzRTTTeUYdu6F75SdPDMk44ALdrs2ZK8FSBqPTYk=;
  b=FYvv/W2BQfLTBrPTKO+jgC6JgnzY2SPsiXEeDdpzLPLrJaGydro0fJrX
   AxeOg+S2Y8GQcWM2wvwvlF7V4cSnSHkzsmdwVwaXxP0cFPis1r7I0D+SU
   CjxihIkDmo6DQAfjzBtLZg76eDrfMVm4wXa1vQOm2C27JofuH/q49fuYo
   dGXDAEuLDbFt9Qb++0c+ESECUtI4r4rJxqLxGB+QlrvOLyt060oyru9oj
   dFq8e3u8CIlb4eIX8ZdetuB8WENPbHEbhUBSWxwXRP/hKmfrD4ElnfIdL
   xUHuQqcq9rTDlBmirNe95PU7fKoOScBdK9tB5OX7AB5tfE4GslJ/+OcjG
   Q==;
X-CSE-ConnectionGUID: d/dWNjOmSzGoR6k4ukTY5A==
X-CSE-MsgGUID: itq+1tdZSnuJN6G4hAAfzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67565724"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67565724"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 16:02:56 -0800
X-CSE-ConnectionGUID: lAVa3AKKTiKakND6IFH7kQ==
X-CSE-MsgGUID: 8SWg4I6qQRKJx4fjLWsSiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="201098094"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Dec 2025 16:02:55 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTqcW-000000005DB-3Wzi;
	Fri, 12 Dec 2025 00:02:52 +0000
Date: Fri, 12 Dec 2025 08:02:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [vireshk:virtio/msg-xen 2/17] include/linux/dma-buf.h:695:52:
 warning: omitting the parameter name in a function definition is a C2x
 extension
Message-ID: <202512120803.WgRV2TLs-lkp@intel.com>
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
TO: Viresh Kumar <viresh.kumar@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git v=
irtio/msg-xen
head:   6a007d44ffbf10a2ce4786c5eb4788234701929c
commit: ca1aa0331031017fff59ce426bbb667e270c6595 [2/17] dma-buf: add no-op =
stubs when CONFIG_DMA_SHARED_BUFFER is disabled
:::::: branch date: 15 hours ago
:::::: commit date: 11 days ago
config: mips-jazz_defconfig (https://download.01.org/0day-ci/archive/202512=
12/202512120803.WgRV2TLs-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 600970=
8b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20251212/202512120803.WgRV2TLs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512120803.WgRV2TLs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from io_uring/io_uring.c:101:
   In file included from io_uring/zcrx.h:6:
>> include/linux/dma-buf.h:695:52: warning: omitting the parameter name in =
a function definition is a C2x extension [-Wc2x-extensions]
     695 |                                struct vm_area_struct *vma, unsig=
ned long)
         |                                                                 =
        ^
   fatal error: error in backend: Not supported instr: <MCInst 0 <MCOperand=
 Reg:345> <MCOperand Reg:252>>
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,io_uring/.io_uring.o.d -nostdinc -I=
arch/mips/include -I./arch/mips/include/generated -Iinclude -I./include -Ia=
rch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi -=
I./include/generated/uapi -include include/linux/compiler-version.h -includ=
e include/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNE=
L__ --target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknown-warning-o=
ption -Werror=3Dignored-optimization-argument -Werror=3Doption-ignored -Wer=
ror=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xffffffff80080=
000 -DLINKER_LOAD_ADDRESS=3D0x80080000 -DDATAOFFSET=3D0 -fmacro-prefix-map=
=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -funsigned-c=
har -fno-common -fno-PIE -fno-strict-aliasing -mno-check-zero-division -mab=
i=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-float -ffr=
eestanding -EL -fno-stack-check -march=3Dmips3 -Wa,--trap -DTOOLCHAIN_SUPPO=
RTS_VIRT -Iarch/mips/include/asm/mach-jazz -Iarch/mips/include/asm/mach-gen=
eric -fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks -O2 -f=
stack-protector-strong -fomit-frame-pointer -ftrivial-auto-var-init=3Dzero =
-fstrict-flex-arrays=3D3 -fno-strict-overflow -fno-stack-check -fno-builtin=
-wcslen -Wall -Wextra -Wundef -Werror=3Dimplicit-function-declaration -Werr=
or=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-fo=
rmat-security -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-memb=
er -Wmissing-declarations -Wmissing-prototypes -Wframe-larger-than=3D1280 -=
Wno-gnu -Wno-pointer-sign -Wcast-function-type -Wimplicit-fallthrough -Werr=
or=3Ddate-time -Werror=3Dincompatible-pointer-types -Wenum-conversion -Wunu=
sed -Wmissing-format-attribute -Wmissing-include-dirs -Wunused-const-variab=
le -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-negative-val=
ue -Wno-enum-enum-conversion -Wno-sign-compare -Wno-unused-parameter -fno-c=
rash-diagnostics -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wu=
ndef -Iio_uring -Iio_uring -DKBUILD_MODFILE=3D\"io_uring/io_uring\" -DKBUIL=
D_BASENAME=3D\"io_uring\" -DKBUILD_MODNAME=3D\"io_uring\" -D__KBUILD_MODNAM=
E=3Dkmod_io_uring -c -o io_uring/io_uring.o io_uring/io_uring.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'io_uring/io_uring.c'.
   4.	Running pass 'Mips Assembly Printer' on function '@io_task_refs_refil=
l'
    #0 0x000055a779ddfabb llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-17+0x34beabb)
    #1 0x000055a779ddda34 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
17+0x34bca34)
    #2 0x000055a779d2ffc3 llvm::CrashRecoveryContext::HandleExit(int) (clan=
g-17+0x340efc3)
    #3 0x000055a779dd557e llvm::sys::Process::Exit(int, bool) (clang-17+0x3=
4b457e)
    #4 0x000055a7776cc333 (clang-17+0xdab333)
    #5 0x000055a779d39f19 llvm::report_fatal_error(llvm::Twine const&, bool=
) (clang-17+0x3418f19)
    #6 0x000055a779d3a08a (clang-17+0x341908a)
    #7 0x000055a7784fd9b0 llvm::MipsMCCodeEmitter::getBinaryCodeForInstr(ll=
vm::MCInst const&, llvm::SmallVectorImpl<llvm::MCFixup>&, llvm::MCSubtarget=
Info const&) const (clang-17+0x1bdc9b0)
    #8 0x000055a778501221 llvm::MipsMCCodeEmitter::encodeInstruction(llvm::=
MCInst const&, llvm::raw_ostream&, llvm::SmallVectorImpl<llvm::MCFixup>&, l=
lvm::MCSubtargetInfo const&) const (clang-17+0x1be0221)
    #9 0x000055a779aa8d19 llvm::MCCodeEmitter::encodeInstruction(llvm::MCIn=
st const&, llvm::SmallVectorImpl<char>&, llvm::SmallVectorImpl<llvm::MCFixu=
p>&, llvm::MCSubtargetInfo const&) const (clang-17+0x3187d19)
   #10 0x000055a779acb813 llvm::MCELFStreamer::emitInstToData(llvm::MCInst =
const&, llvm::MCSubtargetInfo const&) (clang-17+0x31aa813)
   #11 0x000055a779ae6795 llvm::MCObjectStreamer::emitInstruction(llvm::MCI=
nst const&, llvm::MCSubtargetInfo const&) (clang-17+0x31c5795)
   #12 0x000055a7784f64e7 llvm::MipsELFStreamer::emitInstruction(llvm::MCIn=
st const&, llvm::MCSubtargetInfo const&) (clang-17+0x1bd54e7)
   #13 0x000055a7783e8995 llvm::MipsAsmPrinter::emitInstruction(llvm::Machi=
neInstr const*) (clang-17+0x1ac7995)
   #14 0x000055a77ab277f7 llvm::AsmPrinter::emitFunctionBody() (clang-17+0x=
42067f7)
   #15 0x000055a7783e8fcf llvm::MipsAsmPrinter::runOnMachineFunction(llvm::=
MachineFunction&) (clang-17+0x1ac7fcf)
   #16 0x000055a779299545 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (.part.0) MachineFunctionPass.cpp:0:0
   #17 0x000055a7797a4329 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-17+0x2e83329)
   #18 0x000055a7797a445c llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-17+0x2e8345c)
   #19 0x000055a7797a4d88 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-17+0x2e83d88)
   #20 0x000055a77a0260a8 clang::EmitBackendOutput(clang::DiagnosticsEngine=
&, clang::HeaderSearchOptions const&, clang::CodeGenOptions const&, clang::=
TargetOptions const&, clang::LangOptions const&, llvm::StringRef, llvm::Mod=
ule*, clang::BackendAction, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>=
, std::unique_ptr<llvm::raw_pwrite_stream, std::default_delete<llvm::raw_pw=
rite_stream>>) (clang-17+0x37050a8)
   #21 0x000055a77aee601c clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-17+0x45c501c)
   #22 0x000055a77bc5fce9 clang::ParseAST(clang::Sema&, bool, bool) (clang-=
17+0x533ece9)
   #23 0x000055a77a7fbed9 clang::FrontendAction::Execute() (clang-17+0x3eda=
ed9)
   #24 0x000055a77a7826eb clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-17+0x3e616eb)
   #25 0x000055a77a8b6bbb clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-17+0x3f95bbb)
   #26 0x000055a7776cd763 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-17+0xdac763)
   #27 0x000055a7776c6917 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&) driver.cpp:0:0
   #28 0x000055a77a5cd389 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #29 0x000055a779d2fec3 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-17+0x340eec3)
   #30 0x000055a77a5cd719 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #31 0x000055a77a597375 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-17+0x3c76375)
   #32 0x000055a77a597d9d clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-17+0x3c76d9d)
   #33 0x000055a77a5a8fbc clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-17+0x3c87fbc)
   #34 0x000055a7776cb365 clang_main(int, char**, llvm::ToolContext const&)=
 (clang-17+0xdaa365)
   #35 0x000055a7775ceb31 main (clang-17+0xcadb31)
   #36 0x00007f957bd0bca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #37 0x00007f957bd0bd65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #38 0x000055a7776c5e41 _start (clang-17+0xda4e41)
   clang: error: clang frontend command failed with exit code 70 (use -v to=
 see invocation)
--
   In file included from io_uring/opdef.c:40:
   In file included from io_uring/zcrx.h:6:
>> include/linux/dma-buf.h:695:52: warning: omitting the parameter name in =
a function definition is a C2x extension [-Wc2x-extensions]
     695 |                                struct vm_area_struct *vma, unsig=
ned long)
         |                                                                 =
        ^
   1 warning generated.
--
   In file included from io_uring/register.c:34:
   In file included from io_uring/zcrx.h:6:
>> include/linux/dma-buf.h:695:52: warning: omitting the parameter name in =
a function definition is a C2x extension [-Wc2x-extensions]
     695 |                                struct vm_area_struct *vma, unsig=
ned long)
         |                                                                 =
        ^
   fatal error: error in backend: Not supported instr: <MCInst 0 <MCOperand=
 Reg:1> <MCOperand Reg:252>>
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,io_uring/.register.o.d -nostdinc -I=
arch/mips/include -I./arch/mips/include/generated -Iinclude -I./include -Ia=
rch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi -=
I./include/generated/uapi -include include/linux/compiler-version.h -includ=
e include/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNE=
L__ --target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknown-warning-o=
ption -Werror=3Dignored-optimization-argument -Werror=3Doption-ignored -Wer=
ror=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xffffffff80080=
000 -DLINKER_LOAD_ADDRESS=3D0x80080000 -DDATAOFFSET=3D0 -fmacro-prefix-map=
=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -funsigned-c=
har -fno-common -fno-PIE -fno-strict-aliasing -mno-check-zero-division -mab=
i=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-float -ffr=
eestanding -EL -fno-stack-check -march=3Dmips3 -Wa,--trap -DTOOLCHAIN_SUPPO=
RTS_VIRT -Iarch/mips/include/asm/mach-jazz -Iarch/mips/include/asm/mach-gen=
eric -fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks -O2 -f=
stack-protector-strong -fomit-frame-pointer -ftrivial-auto-var-init=3Dzero =
-fstrict-flex-arrays=3D3 -fno-strict-overflow -fno-stack-check -fno-builtin=
-wcslen -Wall -Wextra -Wundef -Werror=3Dimplicit-function-declaration -Werr=
or=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-fo=
rmat-security -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-memb=
er -Wmissing-declarations -Wmissing-prototypes -Wframe-larger-than=3D1280 -=
Wno-gnu -Wno-pointer-sign -Wcast-function-type -Wimplicit-fallthrough -Werr=
or=3Ddate-time -Werror=3Dincompatible-pointer-types -Wenum-conversion -Wunu=
sed -Wmissing-format-attribute -Wmissing-include-dirs -Wunused-const-variab=
le -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-negative-val=
ue -Wno-enum-enum-conversion -Wno-sign-compare -Wno-unused-parameter -fno-c=
rash-diagnostics -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wu=
ndef -Iio_uring -Iio_uring -DKBUILD_MODFILE=3D\"io_uring/register\" -DKBUIL=
D_BASENAME=3D\"register\" -DKBUILD_MODNAME=3D\"register\" -D__KBUILD_MODNAM=
E=3Dkmod_register -c -o io_uring/register.o io_uring/register.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'io_uring/register.c'.
   4.	Running pass 'Mips Assembly Printer' on function '@io_uring_register_=
get_file'
    #0 0x0000559e08956abb llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-17+0x34beabb)
    #1 0x0000559e08954a34 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
17+0x34bca34)
    #2 0x0000559e088a6fc3 llvm::CrashRecoveryContext::HandleExit(int) (clan=
g-17+0x340efc3)
    #3 0x0000559e0894c57e llvm::sys::Process::Exit(int, bool) (clang-17+0x3=
4b457e)
    #4 0x0000559e06243333 (clang-17+0xdab333)
    #5 0x0000559e088b0f19 llvm::report_fatal_error(llvm::Twine const&, bool=
) (clang-17+0x3418f19)
    #6 0x0000559e088b108a (clang-17+0x341908a)
    #7 0x0000559e070749b0 llvm::MipsMCCodeEmitter::getBinaryCodeForInstr(ll=
vm::MCInst const&, llvm::SmallVectorImpl<llvm::MCFixup>&, llvm::MCSubtarget=
Info const&) const (clang-17+0x1bdc9b0)
    #8 0x0000559e07078221 llvm::MipsMCCodeEmitter::encodeInstruction(llvm::=
MCInst const&, llvm::raw_ostream&, llvm::SmallVectorImpl<llvm::MCFixup>&, l=
lvm::MCSubtargetInfo const&) const (clang-17+0x1be0221)
    #9 0x0000559e0861fd19 llvm::MCCodeEmitter::encodeInstruction(llvm::MCIn=
st const&, llvm::SmallVectorImpl<char>&, llvm::SmallVectorImpl<llvm::MCFixu=
p>&, llvm::MCSubtargetInfo const&) const (clang-17+0x3187d19)
   #10 0x0000559e08642813 llvm::MCELFStreamer::emitInstToData(llvm::MCInst =
const&, llvm::MCSubtargetInfo const&) (clang-17+0x31aa813)
   #11 0x0000559e0865d795 llvm::MCObjectStreamer::emitInstruction(llvm::MCI=
nst const&, llvm::MCSubtargetInfo const&) (clang-17+0x31c5795)
   #12 0x0000559e0706d4e7 llvm::MipsELFStreamer::emitInstruction(llvm::MCIn=
st const&, llvm::MCSubtargetInfo const&) (clang-17+0x1bd54e7)
   #13 0x0000559e06f5f995 llvm::MipsAsmPrinter::emitInstruction(llvm::Machi=
neInstr const*) (clang-17+0x1ac7995)
   #14 0x0000559e0969e7f7 llvm::AsmPrinter::emitFunctionBody() (clang-17+0x=
42067f7)
   #15 0x0000559e06f5ffcf llvm::MipsAsmPrinter::runOnMachineFunction(llvm::=
MachineFunction&) (clang-17+0x1ac7fcf)
   #16 0x0000559e07e10545 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (.part.0) MachineFunctionPass.cpp:0:0
   #17 0x0000559e0831b329 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-17+0x2e83329)
   #18 0x0000559e0831b45c llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-17+0x2e8345c)
   #19 0x0000559e0831bd88 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-17+0x2e83d88)
   #20 0x0000559e08b9d0a8 clang::EmitBackendOutput(clang::DiagnosticsEngine=
&, clang::HeaderSearchOptions const&, clang::CodeGenOptions const&, clang::=
TargetOptions const&, clang::LangOptions const&, llvm::StringRef, llvm::Mod=
ule*, clang::BackendAction, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>=
, std::unique_ptr<llvm::raw_pwrite_stream, std::default_delete<llvm::raw_pw=
rite_stream>>) (clang-17+0x37050a8)
   #21 0x0000559e09a5d01c clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-17+0x45c501c)
   #22 0x0000559e0a7d6ce9 clang::ParseAST(clang::Sema&, bool, bool) (clang-=
17+0x533ece9)
   #23 0x0000559e09372ed9 clang::FrontendAction::Execute() (clang-17+0x3eda=
ed9)
   #24 0x0000559e092f96eb clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-17+0x3e616eb)
   #25 0x0000559e0942dbbb clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-17+0x3f95bbb)
   #26 0x0000559e06244763 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-17+0xdac763)
   #27 0x0000559e0623d917 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&) driver.cpp:0:0
   #28 0x0000559e09144389 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #29 0x0000559e088a6ec3 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-17+0x340eec3)
   #30 0x0000559e09144719 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #31 0x0000559e0910e375 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-17+0x3c76375)
   #32 0x0000559e0910ed9d clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-17+0x3c76d9d)
   #33 0x0000559e0911ffbc clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-17+0x3c87fbc)
   #34 0x0000559e06242365 clang_main(int, char**, llvm::ToolContext const&)=
 (clang-17+0xdaa365)
   #35 0x0000559e06145b31 main (clang-17+0xcadb31)
   #36 0x00007feff05cdca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #37 0x00007feff05cdd65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #38 0x0000559e0623ce41 _start (clang-17+0xda4e41)
   clang: error: clang frontend command failed with exit code 70 (use -v to=
 see invocation)
--
   In file included from io_uring/memmap.c:16:
   In file included from io_uring/zcrx.h:6:
>> include/linux/dma-buf.h:695:52: warning: omitting the parameter name in =
a function definition is a C2x extension [-Wc2x-extensions]
     695 |                                struct vm_area_struct *vma, unsig=
ned long)
         |                                                                 =
        ^
   fatal error: error in backend: Not supported instr: <MCInst 0 <MCOperand=
 Reg:345> <MCOperand Reg:252>>
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,io_uring/.memmap.o.d -nostdinc -Iar=
ch/mips/include -I./arch/mips/include/generated -Iinclude -I./include -Iarc=
h/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi -I.=
/include/generated/uapi -include include/linux/compiler-version.h -include =
include/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL_=
_ --target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknown-warning-opt=
ion -Werror=3Dignored-optimization-argument -Werror=3Doption-ignored -Werro=
r=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xffffffff8008000=
0 -DLINKER_LOAD_ADDRESS=3D0x80080000 -DDATAOFFSET=3D0 -fmacro-prefix-map=3D=
=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -funsigned-char=
 -fno-common -fno-PIE -fno-strict-aliasing -mno-check-zero-division -mabi=
=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-float -ffre=
estanding -EL -fno-stack-check -march=3Dmips3 -Wa,--trap -DTOOLCHAIN_SUPPOR=
TS_VIRT -Iarch/mips/include/asm/mach-jazz -Iarch/mips/include/asm/mach-gene=
ric -fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks -O2 -fs=
tack-protector-strong -fomit-frame-pointer -ftrivial-auto-var-init=3Dzero -=
fstrict-flex-arrays=3D3 -fno-strict-overflow -fno-stack-check -fno-builtin-=
wcslen -Wall -Wextra -Wundef -Werror=3Dimplicit-function-declaration -Werro=
r=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-for=
mat-security -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-membe=
r -Wmissing-declarations -Wmissing-prototypes -Wframe-larger-than=3D1280 -W=
no-gnu -Wno-pointer-sign -Wcast-function-type -Wimplicit-fallthrough -Werro=
r=3Ddate-time -Werror=3Dincompatible-pointer-types -Wenum-conversion -Wunus=
ed -Wmissing-format-attribute -Wmissing-include-dirs -Wunused-const-variabl=
e -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-negative-valu=
e -Wno-enum-enum-conversion -Wno-sign-compare -Wno-unused-parameter -fno-cr=
ash-diagnostics -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wun=
def -Iio_uring -Iio_uring -DKBUILD_MODFILE=3D\"io_uring/memmap\" -DKBUILD_B=
ASENAME=3D\"memmap\" -DKBUILD_MODNAME=3D\"memmap\" -D__KBUILD_MODNAME=3Dkmo=
d_memmap -c -o io_uring/memmap.o io_uring/memmap.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'io_uring/memmap.c'.
   4.	Running pass 'Mips Assembly Printer' on function '@io_uring_get_unmap=
ped_area'
    #0 0x000055d4f333dabb llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-17+0x34beabb)
    #1 0x000055d4f333ba34 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
17+0x34bca34)
    #2 0x000055d4f328dfc3 llvm::CrashRecoveryContext::HandleExit(int) (clan=
g-17+0x340efc3)
    #3 0x000055d4f333357e llvm::sys::Process::Exit(int, bool) (clang-17+0x3=
4b457e)
    #4 0x000055d4f0c2a333 (clang-17+0xdab333)
    #5 0x000055d4f3297f19 llvm::report_fatal_error(llvm::Twine const&, bool=
) (clang-17+0x3418f19)
    #6 0x000055d4f329808a (clang-17+0x341908a)
    #7 0x000055d4f1a5b9b0 llvm::MipsMCCodeEmitter::getBinaryCodeForInstr(ll=
vm::MCInst const&, llvm::SmallVectorImpl<llvm::MCFixup>&, llvm::MCSubtarget=
Info const&) const (clang-17+0x1bdc9b0)
    #8 0x000055d4f1a5f221 llvm::MipsMCCodeEmitter::encodeInstruction(llvm::=
MCInst const&, llvm::raw_ostream&, llvm::SmallVectorImpl<llvm::MCFixup>&, l=
lvm::MCSubtargetInfo const&) const (clang-17+0x1be0221)
    #9 0x000055d4f3006d19 llvm::MCCodeEmitter::encodeInstruction(llvm::MCIn=
st const&, llvm::SmallVectorImpl<char>&, llvm::SmallVectorImpl<llvm::MCFixu=
p>&, llvm::MCSubtargetInfo const&) const (clang-17+0x3187d19)
   #10 0x000055d4f3029813 llvm::MCELFStreamer::emitInstToData(llvm::MCInst =
const&, llvm::MCSubtargetInfo const&) (clang-17+0x31aa813)
   #11 0x000055d4f3044795 llvm::MCObjectStreamer::emitInstruction(llvm::MCI=
nst const&, llvm::MCSubtargetInfo const&) (clang-17+0x31c5795)
   #12 0x000055d4f1a544e7 llvm::MipsELFStreamer::emitInstruction(llvm::MCIn=
st const&, llvm::MCSubtargetInfo const&) (clang-17+0x1bd54e7)
   #13 0x000055d4f1946995 llvm::MipsAsmPrinter::emitInstruction(llvm::Machi=
neInstr const*) (clang-17+0x1ac7995)
   #14 0x000055d4f40857f7 llvm::AsmPrinter::emitFunctionBody() (clang-17+0x=
42067f7)
   #15 0x000055d4f1946fcf llvm::MipsAsmPrinter::runOnMachineFunction(llvm::=
MachineFunction&) (clang-17+0x1ac7fcf)
   #16 0x000055d4f27f7545 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (.part.0) MachineFunctionPass.cpp:0:0
   #17 0x000055d4f2d02329 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-17+0x2e83329)
   #18 0x000055d4f2d0245c llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-17+0x2e8345c)
   #19 0x000055d4f2d02d88 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-17+0x2e83d88)
   #20 0x000055d4f35840a8 clang::EmitBackendOutput(clang::DiagnosticsEngine=
&, clang::HeaderSearchOptions const&, clang::CodeGenOptions const&, clang::=
TargetOptions const&, clang::LangOptions const&, llvm::StringRef, llvm::Mod=
ule*, clang::BackendAction, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>=
, std::unique_ptr<llvm::raw_pwrite_stream, std::default_delete<llvm::raw_pw=
rite_stream>>) (clang-17+0x37050a8)
   #21 0x000055d4f444401c clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-17+0x45c501c)
   #22 0x000055d4f51bdce9 clang::ParseAST(clang::Sema&, bool, bool) (clang-=
17+0x533ece9)
   #23 0x000055d4f3d59ed9 clang::FrontendAction::Execute() (clang-17+0x3eda=
ed9)
   #24 0x000055d4f3ce06eb clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-17+0x3e616eb)
   #25 0x000055d4f3e14bbb clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-17+0x3f95bbb)
   #26 0x000055d4f0c2b763 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-17+0xdac763)
   #27 0x000055d4f0c24917 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&) driver.cpp:0:0
   #28 0x000055d4f3b2b389 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #29 0x000055d4f328dec3 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-17+0x340eec3)
   #30 0x000055d4f3b2b719 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #31 0x000055d4f3af5375 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-17+0x3c76375)
   #32 0x000055d4f3af5d9d clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-17+0x3c76d9d)
   #33 0x000055d4f3b06fbc clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-17+0x3c87fbc)
   #34 0x000055d4f0c29365 clang_main(int, char**, llvm::ToolContext const&)=
 (clang-17+0xdaa365)
   #35 0x000055d4f0b2cb31 main (clang-17+0xcadb31)
   #36 0x00007fbdfafebca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #37 0x00007fbdfafebd65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #38 0x000055d4f0c23e41 _start (clang-17+0xda4e41)
   clang: error: clang frontend command failed with exit code 70 (use -v to=
 see invocation)
--
   In file included from io_uring/net.c:20:
   In file included from io_uring/zcrx.h:6:
>> include/linux/dma-buf.h:695:52: warning: omitting the parameter name in =
a function definition is a C2x extension [-Wc2x-extensions]
     695 |                                struct vm_area_struct *vma, unsig=
ned long)
         |                                                                 =
        ^
   fatal error: error in backend: Not supported instr: <MCInst 0 <MCOperand=
 Reg:1> <MCOperand Reg:252>>
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,io_uring/.net.o.d -nostdinc -Iarch/=
mips/include -I./arch/mips/include/generated -Iinclude -I./include -Iarch/m=
ips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi -I./in=
clude/generated/uapi -include include/linux/compiler-version.h -include inc=
lude/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -=
-target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknown-warning-option=
 -Werror=3Dignored-optimization-argument -Werror=3Doption-ignored -Werror=
=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xffffffff80080000=
 -DLINKER_LOAD_ADDRESS=3D0x80080000 -DDATAOFFSET=3D0 -fmacro-prefix-map=3D=
=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -funsigned-char=
 -fno-common -fno-PIE -fno-strict-aliasing -mno-check-zero-division -mabi=
=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-float -ffre=
estanding -EL -fno-stack-check -march=3Dmips3 -Wa,--trap -DTOOLCHAIN_SUPPOR=
TS_VIRT -Iarch/mips/include/asm/mach-jazz -Iarch/mips/include/asm/mach-gene=
ric -fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks -O2 -fs=
tack-protector-strong -fomit-frame-pointer -ftrivial-auto-var-init=3Dzero -=
fstrict-flex-arrays=3D3 -fno-strict-overflow -fno-stack-check -fno-builtin-=
wcslen -Wall -Wextra -Wundef -Werror=3Dimplicit-function-declaration -Werro=
r=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-for=
mat-security -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-membe=
r -Wmissing-declarations -Wmissing-prototypes -Wframe-larger-than=3D1280 -W=
no-gnu -Wno-pointer-sign -Wcast-function-type -Wimplicit-fallthrough -Werro=
r=3Ddate-time -Werror=3Dincompatible-pointer-types -Wenum-conversion -Wunus=
ed -Wmissing-format-attribute -Wmissing-include-dirs -Wunused-const-variabl=
e -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-negative-valu=
e -Wno-enum-enum-conversion -Wno-sign-compare -Wno-unused-parameter -fno-cr=
ash-diagnostics -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wun=
def -Iio_uring -Iio_uring -DKBUILD_MODFILE=3D\"io_uring/net\" -DKBUILD_BASE=
NAME=3D\"net\" -DKBUILD_MODNAME=3D\"net\" -D__KBUILD_MODNAME=3Dkmod_net -c =
-o io_uring/net.o io_uring/net.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'io_uring/net.c'.
   4.	Running pass 'Mips Assembly Printer' on function '@io_accept_prep'
    #0 0x000055a0105d0abb llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-17+0x34beabb)
    #1 0x000055a0105cea34 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
17+0x34bca34)
    #2 0x000055a010520fc3 llvm::CrashRecoveryContext::HandleExit(int) (clan=
g-17+0x340efc3)
    #3 0x000055a0105c657e llvm::sys::Process::Exit(int, bool) (clang-17+0x3=
4b457e)
    #4 0x000055a00debd333 (clang-17+0xdab333)
    #5 0x000055a01052af19 llvm::report_fatal_error(llvm::Twine const&, bool=
) (clang-17+0x3418f19)
    #6 0x000055a01052b08a (clang-17+0x341908a)
    #7 0x000055a00ecee9b0 llvm::MipsMCCodeEmitter::getBinaryCodeForInstr(ll=
vm::MCInst const&, llvm::SmallVectorImpl<llvm::MCFixup>&, llvm::MCSubtarget=
Info const&) const (clang-17+0x1bdc9b0)
    #8 0x000055a00ecf2221 llvm::MipsMCCodeEmitter::encodeInstruction(llvm::=
MCInst const&, llvm::raw_ostream&, llvm::SmallVectorImpl<llvm::MCFixup>&, l=
lvm::MCSubtargetInfo const&) const (clang-17+0x1be0221)
    #9 0x000055a010299d19 llvm::MCCodeEmitter::encodeInstruction(llvm::MCIn=
st const&, llvm::SmallVectorImpl<char>&, llvm::SmallVectorImpl<llvm::MCFixu=
p>&, llvm::MCSubtargetInfo const&) const (clang-17+0x3187d19)
   #10 0x000055a0102bc813 llvm::MCELFStreamer::emitInstToData(llvm::MCInst =
const&, llvm::MCSubtargetInfo const&) (clang-17+0x31aa813)
   #11 0x000055a0102d7795 llvm::MCObjectStreamer::emitInstruction(llvm::MCI=
nst const&, llvm::MCSubtargetInfo const&) (clang-17+0x31c5795)
   #12 0x000055a00ece74e7 llvm::MipsELFStreamer::emitInstruction(llvm::MCIn=
st const&, llvm::MCSubtargetInfo const&) (clang-17+0x1bd54e7)
   #13 0x000055a00ebd9995 llvm::MipsAsmPrinter::emitInstruction(llvm::Machi=
neInstr const*) (clang-17+0x1ac7995)
   #14 0x000055a0113187f7 llvm::AsmPrinter::emitFunctionBody() (clang-17+0x=
42067f7)
   #15 0x000055a00ebd9fcf llvm::MipsAsmPrinter::runOnMachineFunction(llvm::=
MachineFunction&) (clang-17+0x1ac7fcf)
   #16 0x000055a00fa8a545 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (.part.0) MachineFunctionPass.cpp:0:0
   #17 0x000055a00ff95329 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-17+0x2e83329)
   #18 0x000055a00ff9545c llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-17+0x2e8345c)
   #19 0x000055a00ff95d88 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-17+0x2e83d88)
   #20 0x000055a0108170a8 clang::EmitBackendOutput(clang::DiagnosticsEngine=
&, clang::HeaderSearchOptions const&, clang::CodeGenOptions const&, clang::=
TargetOptions const&, clang::LangOptions const&, llvm::StringRef, llvm::Mod=
ule*, clang::BackendAction, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>=
, std::unique_ptr<llvm::raw_pwrite_stream, std::default_delete<llvm::raw_pw=
rite_stream>>) (clang-17+0x37050a8)
   #21 0x000055a0116d701c clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-17+0x45c501c)
   #22 0x000055a012450ce9 clang::ParseAST(clang::Sema&, bool, bool) (clang-=
17+0x533ece9)
   #23 0x000055a010feced9 clang::FrontendAction::Execute() (clang-17+0x3eda=
ed9)
   #24 0x000055a010f736eb clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-17+0x3e616eb)
   #25 0x000055a0110a7bbb clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-17+0x3f95bbb)
   #26 0x000055a00debe763 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-17+0xdac763)
   #27 0x000055a00deb7917 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&) driver.cpp:0:0
   #28 0x000055a010dbe389 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #29 0x000055a010520ec3 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-17+0x340eec3)
   #30 0x000055a010dbe719 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #31 0x000055a010d88375 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-17+0x3c76375)
   #32 0x000055a010d88d9d clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-17+0x3c76d9d)
   #33 0x000055a010d99fbc clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-17+0x3c87fbc)
   #34 0x000055a00debc365 clang_main(int, char**, llvm::ToolContext const&)=
 (clang-17+0xdaa365)
   #35 0x000055a00ddbfb31 main (clang-17+0xcadb31)
   #36 0x00007fd8674daca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #37 0x00007fd8674dad65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #38 0x000055a00deb6e41 _start (clang-17+0xda4e41)
   clang: error: clang frontend command failed with exit code 70 (use -v to=
 see invocation)


vim +695 include/linux/dma-buf.h

ca1aa033103101 Viresh Kumar 2025-11-27  688 =20
ca1aa033103101 Viresh Kumar 2025-11-27  689  static inline void
ca1aa033103101 Viresh Kumar 2025-11-27  690  dma_buf_unmap_attachment_unloc=
ked(struct dma_buf_attachment *attach,
ca1aa033103101 Viresh Kumar 2025-11-27  691  				  struct sg_table *sg_tabl=
e,
ca1aa033103101 Viresh Kumar 2025-11-27  692  				  enum dma_data_direction =
direction) { }
ca1aa033103101 Viresh Kumar 2025-11-27  693 =20
ca1aa033103101 Viresh Kumar 2025-11-27  694  static inline int dma_buf_mmap=
(struct dma_buf *dmabuf,
ca1aa033103101 Viresh Kumar 2025-11-27 @695  			       struct vm_area_struc=
t *vma, unsigned long)
ca1aa033103101 Viresh Kumar 2025-11-27  696  {
ca1aa033103101 Viresh Kumar 2025-11-27  697  	return -EOPNOTSUPP;
ca1aa033103101 Viresh Kumar 2025-11-27  698  }
ca1aa033103101 Viresh Kumar 2025-11-27  699 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
