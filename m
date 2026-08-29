Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC3E3803DE
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Aug 2026 17:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788022935; cv=none; b=akgSdve83wFbQ3HgyuYkqIeoVf9EOz5ZQkI7odxCWL/Ch+KyAHdj6MTEmw70RYCz6eCToYIoZQN1PuumGV+lJyd9KbsiuGK92InmDMKJuIaGDREJ9SIiZZdc5dVBpIKmq1XB6IvwhTnrhqwwo10pC+0KXrZG0U7ccp354eBIH68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788022935; c=relaxed/simple;
	bh=DHTYF8emlwlvt+kjF+KOhS1DYFE7XSuyquMU+KvNvvk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fewG/ei/sj9ujSArBpfQKcVWDUefae2JWXQWMsttyFHI+OXoIpNtWa8Ch+vFhbqEXiJVBPHL+3RBEa5iWckYdhOB99+YPXv/hEjcxkoF9E3v+EEtPeszbvyrPPtBupeB1LFJokGWTaxGYnds7wRiePMrgqpUNyWPClCTvv47Hm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZB+NO7/Z; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZB+NO7/Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788022933; x=1819558933;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DHTYF8emlwlvt+kjF+KOhS1DYFE7XSuyquMU+KvNvvk=;
  b=ZB+NO7/ZC8Icd+UyJ6pvDtRKSv0/xEWRuoVjJynvRxzS9msLGKC7daUL
   HxcSg9m7Et6xB6ocvF+DnD+bWSD64yJo6AxJGZTGvl9zzyycn38shXD/s
   BFTow2pg1FxgAbcsSQaCQ8RMDbRIh+PP8m14kVUN4aJI1o0XjRRtXJUot
   ZFl2lCzGylYELf2LDwMEapc8e11f2L5nEMNcm1xMqi3bjp6qnkkRlztzU
   Px+lWXnmxN4WYo/5DZTB7xT4U0xaqdaiJYRz1eetBae1FaJN3zcHJ7HbD
   G1UfLjifNUhvetRDsCfNg0jrH5Yk521kCneIzSby04ubiYHxl3rRdCa54
   g==;
X-CSE-ConnectionGUID: xZAEmbhrTCSy9HpSLTX/uA==
X-CSE-MsgGUID: Ou9BYk86QsqHjb374cY+Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11890"; a="92182659"
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
   d="scan'208";a="92182659"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2026 10:02:12 -0700
X-CSE-ConnectionGUID: uRLo/rUrSgCc7pBgIo85IQ==
X-CSE-MsgGUID: qE5Wvh/KTTqFadTca5CMyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
   d="scan'208";a="272624623"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Aug 2026 10:02:12 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0MRU-00000000D3E-44wv;
	Sat, 29 Aug 2026 17:02:08 +0000
Date: Sun, 30 Aug 2026 01:01:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: /bin/bash: line 1: 2185656 Segmentation fault      clang
 -Wp,-MMD,arch/mips/math-emu/.sp_sub.o.d -nostdinc -Iarch/mips/include
 -I./arch/mips/include/generated -Iinclude -I./include
 -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/ua...
Message-ID: <202608300019.cw1x13FW-lkp@intel.com>
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
TO: Namjae Jeon <linkinjeon@kernel.org>
CC: Steve French <stfrench@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1b78070aaef63512688aebfbc82365ef9d6660f1
commit: f6bd41280a44dcc2e0a25ed72617d25f586974a7 ksmbd: override fsids for =
smb2_query_info()
date:   2 years, 1 month ago
:::::: branch date: 2 days ago
:::::: commit date: 2 years, 1 month ago
config: mips-randconfig-r051-20260823 (https://download.01.org/0day-ci/arch=
ive/20260830/202608300019.cw1x13FW-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935=
bfc708590c60147a79c7df145bb6e68b1d388)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260830/202608300019.cw1x13FW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: f6bd41280a44 ("ksmbd: override fsids for smb2_query_info()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608300019.cw1x13FW-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
All errors (new ones prefixed by >>):

   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace and dumped files.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,arch/mips/math-emu/.sp_sub.o.d -nos=
tdinc -Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I./inc=
lude -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclud=
e/uapi -I./include/generated/uapi -include include/linux/compiler-version.h=
 -include include/linux/kconfig.h -include include/linux/compiler_types.h -=
D__KERNEL__ --target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknown-w=
arning-option -Werror=3Dignored-optimization-argument -Werror=3Doption-igno=
red -Werror=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xfffff=
fff80100000 -DLINKER_LOAD_ADDRESS=3D0x80100000 -DDATAOFFSET=3D0 -fmacro-pre=
fix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -funs=
igned-char -fno-common -fno-PIE -fno-strict-aliasing -mno-check-zero-divisi=
on -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-flo=
at -ffreestanding -EB -fno-stack-check -march=3Dmips3 -Wa,--trap -DTOOLCHAI=
N_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-tx49xx -Iarch/mips/include/asm=
/mach-generic -fno-asynchronous-unwind-tables -fno-delete-null-pointer-chec=
ks -Os -fno-stack-protector -ftrivial-auto-var-init=3Dzero -pg -fstrict-fle=
x-arrays=3D3 -fno-strict-overflow -fno-stack-check -Wall -Wundef -Werror=3Di=
mplicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -=
Werror=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-a=
ddress -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-proto=
types -Wno-gnu -Wvla -Wno-pointer-sign -Wcast-function-type -Wimplicit-fall=
through -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wenum-con=
version -Wextra -Wunused -Wmissing-format-attribute -Wmissing-include-dirs =
-Wunused-const-variable -Wno-missing-field-initializers -Wno-type-limits -W=
no-shift-negative-value -Wno-sign-compare -Wno-unused-parameter -fno-crash-=
diagnostics -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef =
-falign-functions=3D64 -fsanitize=3Dunreachable -fsanitize=3Denum -Iarch/mi=
ps/math-emu -Iarch/mips/math-emu -DKBUILD_MODFILE=3D\"arch/mips/math-emu/sp=
_sub\" -DKBUILD_BASENAME=3D\"sp_sub\" -DKBUILD_MODNAME=3D\"sp_sub\" -D__KBU=
ILD_MODNAME=3Dkmod_sp_sub -c -o arch/mips/math-emu/sp_sub.o arch/mips/math-=
emu/sp_sub.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'arch/mips/math-emu/sp=
_sub.c'.
   4.	Running pass 'Branch Probability Basic Block Placement' on function '=
@ieee754sp_sub'
    #0 0x00005636eb04200a llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-24+0x38db00a)
    #1 0x00005636eb03fbe4 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
24+0x38d8be4)
    #2 0x00005636eaf73d00 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007f45f0f21df0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x00005636ea610a2f llvm::TailDuplicator::shouldTailDuplicate(bool, l=
lvm::MachineBasicBlock&) (.part.0) TailDuplicator.cpp:0:0
    #5 0x00005636ea3781ab (anonymous namespace)::MachineBlockPlacement::pre=
computeTriangleChains() MachineBlockPlacement.cpp:0:0
    #6 0x00005636ea38633b (anonymous namespace)::MachineBlockPlacement::run=
(llvm::MachineFunction&) MachineBlockPlacement.cpp:0:0
    #7 0x00005636ea38974c (anonymous namespace)::MachineBlockPlacementLegac=
y::runOnMachineFunction(llvm::MachineFunction&) (.part.0) MachineBlockPlace=
ment.cpp:0:0
    #8 0x00005636ea3c9ca3 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-24+0x2c62ca3)
    #9 0x00005636ea9422b9 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-24+0x31db2b9)
   #10 0x00005636ea9426ec llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-24+0x31db6ec)
   #11 0x00005636ea94328a (anonymous namespace)::MPPassManager::runOnModule=
(llvm::Module&) LegacyPassManager.cpp:0:0
   #12 0x00005636ea94395c llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-24+0x31dc95c)
   #13 0x00005636eb3f8d1f (anonymous namespace)::EmitAssemblyHelper::TimeCo=
degenPasses(llvm::function_ref<void ()>) BackendUtil.cpp:0:0
   #14 0x00005636eb40b6fc (anonymous namespace)::EmitAssemblyHelper::emitAs=
sembly(clang::BackendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::=
default_delete<llvm::raw_pwrite_stream>>, clang::BackendConsumer*) BackendU=
til.cpp:0:0
   #15 0x00005636eb40b964 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-24+0x3ca4964)
   #16 0x00005636eba4ec97 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-24+0x42e7c97)
   #17 0x00005636ed49dcfc clang::ParseAST(clang::Sema&, bool, bool) (clang-=
24+0x5d36cfc)
   #18 0x00005636ebdaf2de clang::FrontendAction::Execute() (clang-24+0x4648=
2de)
   #19 0x00005636ebd3b45e clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-24+0x45d445e)
   #20 0x00005636ebe7a727 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-24+0x4713727)
   #21 0x00005636e801ffc8 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-24+0x8b8fc8)
   #22 0x00005636e8017c83 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #23 0x00005636e8017cc3 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #24 0x00005636ebacd289 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #25 0x00005636eaf74063 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-24+0x380d063)
   #26 0x00005636ebace80c clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #27 0x00005636eba86598 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-24+0x431f598)
   #28 0x00005636eba8acf2 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-24+0x4323cf2)
   #29 0x00005636eba9cb1c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-24+0x4335b1c)
   #30 0x00005636e801c952 clang_main(int, char**, llvm::ToolContext const&)=
 (clang-24+0x8b5952)
   #31 0x00005636e7f58969 main (clang-24+0x7f1969)
   #32 0x00007f45f0f0bca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #33 0x00007f45f0f0bd65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #34 0x00005636e80176e1 _start (clang-24+0x8b06e1)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 2185656 Segmentation fault      clang -Wp,-MMD,arch/m=
ips/math-emu/.sp_sub.o.d -nostdinc -Iarch/mips/include -I./arch/mips/includ=
e/generated -Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips/in=
clude/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include inc=
lude/linux/compiler-version.h -include include/linux/kconfig.h -include inc=
lude/linux/compiler_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -finte=
grated-as -Werror=3Dunknown-warning-option -Werror=3Dignored-optimization-a=
rgument -Werror=3Doption-ignored -Werror=3Dunused-command-line-argument -DV=
MLINUX_LOAD_ADDRESS=3D0xffffffff80100000 -DLINKER_LOAD_ADDRESS=3D0x80100000=
 -DDATAOFFSET=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -st=
d=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-al=
iasing -mno-check-zero-division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pip=
e -msoft-float -Wa,-msoft-float -ffreestanding -EB -fno-stack-check -march=
=3Dmips3 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-=
tx49xx -Iarch/mips/include/asm/mach-generic -fno-asynchronous-unwind-tables=
 -fno-delete-null-pointer-checks -Os -fno-stack-protector -ftrivial-auto-va=
r-init=3Dzero -pg -fstrict-flex-arrays=3D3 -fno-strict-overflow -fno-stack-=
check -Wall -Wundef -Werror=3Dimplicit-function-declaration -Werror=3Dimpli=
cit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-secur=
ity -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissi=
ng-declarations -Wmissing-prototypes -Wno-gnu -Wvla -Wno-pointer-sign -Wcas=
t-function-type -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Dincomp=
atible-pointer-types -Wenum-conversion -Wextra -Wunused -Wmissing-format-at=
tribute -Wmissing-include-dirs -Wunused-const-variable -Wno-missing-field-i=
nitializers -Wno-type-limits -Wno-shift-negative-value -Wno-sign-compare -W=
no-unused-parameter -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wretur=
n-type -funsigned-char -Wundef -falign-functions=3D64 -fsanitize=3Dunreacha=
ble -fsanitize=3Denum -Iarch/mips/math-emu -Iarch/mips/math-emu -DKBUILD_MO=
DFILE=3D'"arch/mips/math-emu/sp_sub"' -DKBUILD_BASENAME=3D'"sp_sub"' -DKBUI=
LD_MODNAME=3D'"sp_sub"' -D__KBUILD_MODNAME=3Dkmod_sp_sub -c -o arch/mips/ma=
th-emu/sp_sub.o arch/mips/math-emu/sp_sub.c

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
