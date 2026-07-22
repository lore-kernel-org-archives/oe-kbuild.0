Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489A22AD2C
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Jul 2026 13:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784726612; cv=none; b=Xoc5sbnrs9mwhgAHgQp0OfPf9vsUb3holDu+/CwAARU6GFR4Jt+lvtFU0lQEDwh9s8ClflMjyKb8D/WhdP3QI+FzbqpEXwWLIB3Phnp7bA2b9h7OSgKvfDk0NzK3P2NhEnCV8ZhbZDpeXNVOm6hQ71Kf1tO7CnlqUkCrmUecblA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784726612; c=relaxed/simple;
	bh=K2QiCSrAKbs9oIsk1qsC9DeFI0nwu67Qh8RlNYVoCBU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ji6pa2X8neFqcbk22KiM9xDwalyPZ6R0tDyThjJe/nrshl646+AW1M5tAXzL33izOGL7TFtxkhGZP196gxxyKkvfw87RIPmdzGgOPtZmYPo0a8v8KbsqhebIbCObYItiW8rvayALIKpa1QNfGWNFJV0OWhU4/dP3FEBJY6T5GEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nkvauebk; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nkvauebk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784726610; x=1816262610;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=K2QiCSrAKbs9oIsk1qsC9DeFI0nwu67Qh8RlNYVoCBU=;
  b=nkvauebkos1jndBtfsXjPD9PMqrIntfMuh0juCUQObx6sjnKByq08VWr
   HQweJU45Um6AMlbOeduO9H2+ijVCjg8yMwQVrVplfSQKhJOkn5xnZnLGk
   p7mkDqG58d9pU7UlXOyElzBIs2cQhYUopsBse5ztmRFPP+ihw89pDMNW2
   iGM798Yv0M/NAHS4VNqWsbixN+Pwu5WWNzfZ9Z7KMKbBayQMhN1HkYSBl
   pyaYH9StU67lAattnE2bOHZSGolZuHi8lAyugl5br7ruf63KGz2njFCcZ
   VlgAwz1e2LNRJljLMl6dPWsUaKNYB/HMYwiDsVUUrQ9RQsuRKFVbvFhBM
   w==;
X-CSE-ConnectionGUID: Eb6m9AwhTJCcEXN5q8qFwQ==
X-CSE-MsgGUID: 3wkRmm5bTNCNUBXISEtZhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85305987"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="85305987"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 06:23:29 -0700
X-CSE-ConnectionGUID: XHhRAbP/RG+r388UHoxCOA==
X-CSE-MsgGUID: T6cM7H1bS5Gg4y/JXCD4Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="260048455"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 22 Jul 2026 06:23:28 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmWv0-00000000YlV-1kY0;
	Wed, 22 Jul 2026 13:23:26 +0000
Date: Wed, 22 Jul 2026 21:22:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1061/8209] /bin/bash: line 1: 2633471
 Segmentation fault      clang -Wp,-MMD,arch/mips/math-emu/.sp_add.o.d
 -nostdinc -Iarch/mips/include -I./arch/mips/include/generated -Iinclude
 -I./include -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi
 -Iinclude/ua...
Message-ID: <202607222037.139MU2H4-lkp@intel.com>
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
TO: Usama Arif <usama.arif@linux.dev>
CC: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   290aaf24a551d5a0dce037e3fab30820f9113a10
commit: 0baad6f9b9970c6e3f1d33dbfd17d1a77702771d [1061/8209] fs/super: skip=
 non-memcg-aware nr_cached_objects in memcg slab shrink
:::::: branch date: 21 hours ago
:::::: commit date: 3 weeks ago
config: mips-randconfig-r071-20260722 (https://download.01.org/0day-ci/arch=
ive/20260722/202607222037.139MU2H4-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5c0=
dfced1adc55429e32b1db08570abd3a219d85)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260722/202607222037.139MU2H4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607222037.139MU2H4-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
Note: the linux-next/master HEAD 290aaf24a551d5a0dce037e3fab30820f9113a10 b=
uilds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace and dumped files.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,arch/mips/math-emu/.sp_add.o.d -nos=
tdinc -Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I./inc=
lude -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclud=
e/uapi -I./include/generated/uapi -include include/linux/compiler-version.h=
 -include include/linux/kconfig.h -include include/linux/compiler_types.h -=
D__KERNEL__ --target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknown-w=
arning-option -Werror=3Dignored-optimization-argument -Werror=3Doption-igno=
red -Werror=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xfffff=
fff80101000 -DLINKER_LOAD_ADDRESS=3D0x80101000 -DDATAOFFSET=3D0 -fmacro-pre=
fix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -fshort-wchar -funsigned-char -f=
no-common -fno-PIE -fno-strict-aliasing -std=3Dgnu11 -fms-anonymous-structs=
 -Wno-gnu -Wno-microsoft-anon-tag -mno-check-zero-division -mabi=3D32 -G 0 =
-mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-float -ffreestanding -=
EB -fno-stack-check -march=3Dmips3 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Ia=
rch/mips/include/asm/mach-n64 -Iarch/mips/include/asm/mach-generic -fno-asy=
nchronous-unwind-tables -fno-delete-null-pointer-checks -Os -fno-stack-prot=
ector -ftrivial-auto-var-init=3Dzero -fexperimental-late-parse-attributes -=
fdiagnostics-show-inlining-chain -pg -fstrict-flex-arrays=3D3 -fno-strict-o=
verflow -fno-stack-check -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=
=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-ty=
pe -Werror=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -Wno-fra=
me-address -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-p=
rototypes -Wno-format-overflow-non-kprintf -Wno-format-truncation-non-kprin=
tf -Wno-default-const-init-unsafe -Wno-type-limits -Wno-pointer-sign -Wcast=
-function-type -Wno-unterminated-string-initialization -Wimplicit-fallthrou=
gh -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wenum-conversi=
on -Wunused -Wmissing-format-attribute -Wmissing-include-dirs -Wunused-cons=
t-variable -Wno-missing-field-initializers -Wno-shift-negative-value -Wno-e=
num-enum-conversion -Wno-sign-compare -Wno-unused-parameter -g -DRANDSTRUCT=
 -frandomize-layout-seed-file=3D./scripts/basic/randstruct.seed -fno-crash-=
diagnostics -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef =
-falign-functions=3D64 -fdebug-info-for-profiling -mllvm -enable-fs-discrim=
inator=3Dtrue -mllvm -improved-fs-discriminator=3Dtrue -Iarch/mips/math-emu=
 -Iarch/mips/math-emu -DKBUILD_MODFILE=3D\"arch/mips/math-emu/sp_add\" -DKB=
UILD_BASENAME=3D\"sp_add\" -DKBUILD_MODNAME=3D\"sp_add\" -D__KBUILD_MODNAME=
=3Dsp_add -c -o arch/mips/math-emu/sp_add.o arch/mips/math-emu/sp_add.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'arch/mips/math-emu/sp=
_add.c'.
   4.	Running pass 'Branch Probability Basic Block Placement' on function '=
@ieee754sp_add'
    #0 0x0000559a3f5f514a llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-24+0x38b514a)
    #1 0x0000559a3f5f2d24 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
24+0x38b2d24)
    #2 0x0000559a3f528240 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007f6af293edf0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x0000559a3ec12acf llvm::TailDuplicator::shouldTailDuplicate(bool, l=
lvm::MachineBasicBlock&) (.part.0) TailDuplicator.cpp:0:0
    #5 0x0000559a3e95962b (anonymous namespace)::MachineBlockPlacement::pre=
computeTriangleChains() MachineBlockPlacement.cpp:0:0
    #6 0x0000559a3e96747b (anonymous namespace)::MachineBlockPlacement::run=
(llvm::MachineFunction&) MachineBlockPlacement.cpp:0:0
    #7 0x0000559a3e96a88c (anonymous namespace)::MachineBlockPlacementLegac=
y::runOnMachineFunction(llvm::MachineFunction&) (.part.0) MachineBlockPlace=
ment.cpp:0:0
    #8 0x0000559a3e9ab273 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-24+0x2c6b273)
    #9 0x0000559a3eeff179 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-24+0x31bf179)
   #10 0x0000559a3eeff5ac llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-24+0x31bf5ac)
   #11 0x0000559a3ef0014a (anonymous namespace)::MPPassManager::runOnModule=
(llvm::Module&) LegacyPassManager.cpp:0:0
   #12 0x0000559a3ef0081c llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-24+0x31c081c)
   #13 0x0000559a3f9a45bf (anonymous namespace)::EmitAssemblyHelper::TimeCo=
degenPasses(llvm::function_ref<void ()>) BackendUtil.cpp:0:0
   #14 0x0000559a3f9b59ba (anonymous namespace)::EmitAssemblyHelper::emitAs=
sembly(clang::BackendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::=
default_delete<llvm::raw_pwrite_stream>>, clang::BackendConsumer*) (.constp=
rop.0) BackendUtil.cpp:0:0
   #15 0x0000559a3f9b5baf clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-24+0x3c75baf)
   #16 0x0000559a3fff0587 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-24+0x42b0587)
   #17 0x0000559a419f6a8c clang::ParseAST(clang::Sema&, bool, bool) (clang-=
24+0x5cb6a8c)
   #18 0x0000559a4034f8de clang::FrontendAction::Execute() (clang-24+0x460f=
8de)
   #19 0x0000559a402dbade clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-24+0x459bade)
   #20 0x0000559a4041e407 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-24+0x46de407)
   #21 0x0000559a3c61ad88 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-24+0x8dad88)
   #22 0x0000559a3c612a53 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #23 0x0000559a3c612a93 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #24 0x0000559a4006e1c9 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #25 0x0000559a3f5285a3 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-24+0x37e85a3)
   #26 0x0000559a4006f74c clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #27 0x0000559a40027f58 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-24+0x42e7f58)
   #28 0x0000559a4002c792 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-24+0x42ec792)
   #29 0x0000559a4003e59c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-24+0x42fe59c)
   #30 0x0000559a3c617712 clang_main(int, char**, llvm::ToolContext const&)=
 (clang-24+0x8d7712)
   #31 0x0000559a3c532fd9 main (clang-24+0x7f2fd9)
   #32 0x00007f6af2928ca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #33 0x00007f6af2928d65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #34 0x0000559a3c6124b1 _start (clang-24+0x8d24b1)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 2633471 Segmentation fault      clang -Wp,-MMD,arch/m=
ips/math-emu/.sp_add.o.d -nostdinc -Iarch/mips/include -I./arch/mips/includ=
e/generated -Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips/in=
clude/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include inc=
lude/linux/compiler-version.h -include include/linux/kconfig.h -include inc=
lude/linux/compiler_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -finte=
grated-as -Werror=3Dunknown-warning-option -Werror=3Dignored-optimization-a=
rgument -Werror=3Doption-ignored -Werror=3Dunused-command-line-argument -DV=
MLINUX_LOAD_ADDRESS=3D0xffffffff80101000 -DLINKER_LOAD_ADDRESS=3D0x80101000=
 -DDATAOFFSET=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -fs=
hort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -std=
=3Dgnu11 -fms-anonymous-structs -Wno-gnu -Wno-microsoft-anon-tag -mno-check=
-zero-division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -W=
a,-msoft-float -ffreestanding -EB -fno-stack-check -march=3Dmips3 -Wa,--tra=
p -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-n64 -Iarch/mips/in=
clude/asm/mach-generic -fno-asynchronous-unwind-tables -fno-delete-null-poi=
nter-checks -Os -fno-stack-protector -ftrivial-auto-var-init=3Dzero -fexper=
imental-late-parse-attributes -fdiagnostics-show-inlining-chain -pg -fstric=
t-flex-arrays=3D3 -fno-strict-overflow -fno-stack-check -fno-builtin-wcslen=
 -Wall -Wextra -Wundef -Werror=3Dimplicit-function-declaration -Werror=3Dim=
plicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-se=
curity -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmi=
ssing-declarations -Wmissing-prototypes -Wno-format-overflow-non-kprintf -W=
no-format-truncation-non-kprintf -Wno-default-const-init-unsafe -Wno-type-l=
imits -Wno-pointer-sign -Wcast-function-type -Wno-unterminated-string-initi=
alization -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Dincompatible=
-pointer-types -Wenum-conversion -Wunused -Wmissing-format-attribute -Wmiss=
ing-include-dirs -Wunused-const-variable -Wno-missing-field-initializers -W=
no-shift-negative-value -Wno-enum-enum-conversion -Wno-sign-compare -Wno-un=
used-parameter -g -DRANDSTRUCT -frandomize-layout-seed-file=3D./scripts/bas=
ic/randstruct.seed -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wreturn=
-type -funsigned-char -Wundef -falign-functions=3D64 -fdebug-info-for-profi=
ling -mllvm -enable-fs-discriminator=3Dtrue -mllvm -improved-fs-discriminat=
or=3Dtrue -Iarch/mips/math-emu -Iarch/mips/math-emu -DKBUILD_MODFILE=3D'"ar=
ch/mips/math-emu/sp_add"' -DKBUILD_BASENAME=3D'"sp_add"' -DKBUILD_MODNAME=
=3D'"sp_add"' -D__KBUILD_MODNAME=3Dsp_add -c -o arch/mips/math-emu/sp_add.o=
 arch/mips/math-emu/sp_add.c

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
