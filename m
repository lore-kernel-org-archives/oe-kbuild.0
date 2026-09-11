Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF4147A870
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Sep 2026 13:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789134900; cv=none; b=CCwwx2VmDDIMfauDGP0d75JKQiuWPNMZ33tBpYtWwOdOMvJigHIf21WSlxUomXIQ3Bqf/5mHrbNQaSlzusjeu9PXI7u15L2Yx/GQ95gEe5OSmbrKm8t378ZC/IukVoUVo1N+WhPIRfBGWCycUHa1Vqm0k6xcw+4hX5D+v48ZK28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789134900; c=relaxed/simple;
	bh=+hqfnpaBVh4k+lycdI46vZ1QWx3BWdi6Y+PHFKoISHA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PkvlIoZEb8tgH+ixeXSId+135kKtkuuXQT97PSuac5nTpFd9x5QGv2UuVkvwkwtxv5H2jGjfOnCmpnlETEfbdM1Pru0BU/m0d6/F8HDdhAGVsIqVxBm0KG/xN9wS2JIS+bslmrkc+Q5S4FYB0E1MZp5ZCSQhkgfFwktqFc2aQtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OtzQ8iPD; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OtzQ8iPD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789134899; x=1820670899;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+hqfnpaBVh4k+lycdI46vZ1QWx3BWdi6Y+PHFKoISHA=;
  b=OtzQ8iPDZVSNRmugBhEyszUU3n91mIgzOrQoJvKsjq0PG+uVpuzmlutm
   WexT72PoWQ3A00HsCuNuK4yJl0isU5hLD8fXTHsWUfYpRFRvV3F/ixFGJ
   12bR/ZEY1Pi32RL4K5FP+e8lD4X3NQPmhBPvOrjqWSfnT0CiWDZniyuJ3
   IH+3FsZZcsa3Gd5SDLq0iNvYgsfBks3t1e6O42wLlfCIe6t9LouFRR7+O
   2jxE/zFFGwYjo2hXeGBIuOKegMYd7C7wKBweF+Xo0Z3OZb+2wIIlxKAag
   4a2Yap6IzQiM13FyPKBRPlIq4b5aRUmCkOtaczJn9BYUdHoQr3O/2rsri
   w==;
X-CSE-ConnectionGUID: IZ8y2siAQxewfMb98Skv8g==
X-CSE-MsgGUID: D1lKJkKpTma/Y30w4VqBQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="106966250"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="106966250"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 06:54:59 -0700
X-CSE-ConnectionGUID: utNtyAY0RV24EorR/78s5Q==
X-CSE-MsgGUID: Z4XiBfm/TK+16xmMcbnGig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="265718330"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 11 Sep 2026 06:54:57 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x51iM-000000001av-15Uj;
	Fri, 11 Sep 2026 13:54:51 +0000
Date: Fri, 11 Sep 2026 21:54:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: /bin/bash: line 1: 1447177 Segmentation fault      clang
 -Wp,-MMD,drivers/iio/humidity/.hdc3020.o.d -nostdinc -Iarch/mips/include
 -I./arch/mips/include/generated -Iinclude -I./include
 -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude...
Message-ID: <202609112118.WPpW09Xg-lkp@intel.com>
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
TO: Dimitri Fedrau <dimitri.fedrau@liebherr.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Hi Dimitri,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   08df884136f1c1197bab2a27814404fd329d9aac
commit: cb372b4f46d4285e5d2c07ba734374151b8e34e7 iio: humditiy: hdc3020: fi=
x units for thresholds and hysteresis
date:   11 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 11 months ago
config: mips-randconfig-r133-20260911 (https://download.01.org/0day-ci/arch=
ive/20260911/202609112118.WPpW09Xg-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 962=
95a1412f9afbee9d4a3c2701e83f5a529a9cc)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260911/202609112118.WPpW09Xg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: cb372b4f46d4 ("iio: humditiy: hdc3020: fix units for thresholds an=
d hysteresis")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609112118.WPpW09Xg-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
All errors (new ones prefixed by >>):

   warning: MIPS-I support is experimental
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace and dumped files.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,drivers/iio/humidity/.hdc3020.o.d -=
nostdinc -Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I./=
include -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinc=
lude/uapi -I./include/generated/uapi -include include/linux/compiler-versio=
n.h -include include/linux/kconfig.h -include include/linux/compiler_types.=
h -D__KERNEL__ --target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknow=
n-warning-option -Werror=3Dignored-optimization-argument -Werror=3Doption-i=
gnored -Werror=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xff=
ffffff80040000 -DLINKER_LOAD_ADDRESS=3D0x80040000 -DDATAOFFSET=3D0 -fmacro-=
prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -f=
unsigned-char -fno-common -fno-PIE -fno-strict-aliasing -mno-check-zero-div=
ision -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-=
float -ffreestanding -EL -fno-stack-check -march=3Dmips1 -DTOOLCHAIN_SUPPOR=
TS_VIRT -Iarch/mips/include/asm/mach-dec -Iarch/mips/include/asm/mach-gener=
ic -fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks -O2 -fno=
-stack-protector -fomit-frame-pointer -ftrivial-auto-var-init=3Dzero -fstri=
ct-flex-arrays=3D3 -fno-strict-overflow -fno-stack-check -fno-builtin-wcsle=
n -Wall -Wextra -Wundef -Werror=3Dimplicit-function-declaration -Werror=3Di=
mplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-s=
ecurity -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wm=
issing-declarations -Wmissing-prototypes -Wno-gnu -Wno-format-overflow-non-=
kprintf -Wno-format-truncation-non-kprintf -Wno-default-const-init-unsafe -=
Wno-pointer-sign -Wcast-function-type -Wno-unterminated-string-initializati=
on -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Dincompatible-pointe=
r-types -Wenum-conversion -Wunused -Wmissing-format-attribute -Wmissing-inc=
lude-dirs -Wunused-const-variable -Wno-missing-field-initializers -Wno-type=
-limits -Wno-shift-negative-value -Wno-enum-enum-conversion -Wno-sign-compa=
re -Wno-unused-parameter -g -gdwarf-4 -DRANDSTRUCT -frandomize-layout-seed-=
file=3D./scripts/basic/randstruct.seed -fno-crash-diagnostics -Wno-error=3Dr=
eturn-type -Wreturn-type -funsigned-char -Wundef -falign-functions=3D64 -Id=
rivers/iio/common/hid-sensors -Idrivers/iio/humidity -Idrivers/iio/humidity=
 -DKBUILD_MODFILE=3D\"drivers/iio/humidity/hdc3020\" -DKBUILD_BASENAME=3D\"=
hdc3020\" -DKBUILD_MODNAME=3D\"hdc3020\" -D__KBUILD_MODNAME=3Dkmod_hdc3020 =
-c -o drivers/iio/humidity/hdc3020.o drivers/iio/humidity/hdc3020.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'drivers/iio/humidity/=
hdc3020.c'.
   4.	Running pass 'Shrink Wrapping analysis' on function '@hdc3020_write_t=
hresh'
    #0 0x00005570da2dc30a llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-24+0x3a2530a)
    #1 0x00005570da2d9ee4 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
24+0x3a22ee4)
    #2 0x00005570da20cf40 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007f6d452e5df0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x00005570d985ba91 (anonymous namespace)::ShrinkWrapImpl::useOrDefCS=
ROrFI(llvm::MachineInstr const&, llvm::RegScavenger*, bool) const ShrinkWra=
p.cpp:0:0
    #5 0x00005570d985ed7c (anonymous namespace)::ShrinkWrapImpl::run(llvm::=
MachineFunction&) (.constprop.0) ShrinkWrap.cpp:0:0
    #6 0x00005570d9860a1d (anonymous namespace)::ShrinkWrapLegacy::runOnMac=
hineFunction(llvm::MachineFunction&) (.part.0) ShrinkWrap.cpp:0:0
    #7 0x00005570d9644a13 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-24+0x2d8da13)
    #8 0x00005570d9bca859 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-24+0x3313859)
    #9 0x00005570d9bcac4c llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-24+0x3313c4c)
   #10 0x00005570d9bcb7ea (anonymous namespace)::MPPassManager::runOnModule=
(llvm::Module&) LegacyPassManager.cpp:0:0
   #11 0x00005570d9bcbfdc llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-24+0x3314fdc)
   #12 0x00005570db4327f5 runCodeGenPipelineLegacy(llvm::TargetMachine&, ll=
vm::Module&, llvm::raw_pwrite_stream&, std::unique_ptr<llvm::ToolOutputFile=
, std::default_delete<llvm::ToolOutputFile>>&, llvm::CodeGenFileType, bool,=
 bool) (.isra.0) RunCodeGen.cpp:0:0
   #13 0x00005570db432855 llvm::runCodeGenPipeline(llvm::TargetMachine&, ll=
vm::Module&, llvm::raw_pwrite_stream&, std::unique_ptr<llvm::ToolOutputFile=
, std::default_delete<llvm::ToolOutputFile>>&, llvm::CodeGenFileType, bool,=
 bool, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>) (clang-24+0x4b7b855)
   #14 0x00005570da6ac606 (anonymous namespace)::EmitAssemblyHelper::emitAs=
sembly(clang::BackendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::=
default_delete<llvm::raw_pwrite_stream>>, clang::BackendConsumer*) BackendU=
til.cpp:0:0
   #15 0x00005570da6acb4c clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-24+0x3df5b4c)
   #16 0x00005570dace6f17 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-24+0x442ff17)
   #17 0x00005570dc76d4fc clang::ParseAST(clang::Sema&, bool, bool) (clang-=
24+0x5eb64fc)
   #18 0x00005570db03731e clang::FrontendAction::Execute() (clang-24+0x4780=
31e)
   #19 0x00005570dafc321e clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-24+0x470c21e)
   #20 0x00005570db101e27 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-24+0x484ae27)
   #21 0x00005570d717ae78 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-24+0x8c3e78)
   #22 0x00005570d7172b03 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #23 0x00005570d7172b43 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #24 0x00005570dad613c9 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #25 0x00005570da20d273 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-24+0x3956273)
   #26 0x00005570dad6294c clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #27 0x00005570dad20358 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-24+0x4469358)
   #28 0x00005570dad24ab2 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-24+0x446dab2)
   #29 0x00005570dad352dc clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-24+0x447e2dc)
   #30 0x00005570d71777f2 clang_main(int, char**, llvm::ToolContext const&)=
 (clang-24+0x8c07f2)
   #31 0x00005570d70b2d89 main (clang-24+0x7fbd89)
   #32 0x00007f6d452cfca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #33 0x00007f6d452cfd65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #34 0x00005570d7172561 _start (clang-24+0x8bb561)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 1447177 Segmentation fault      clang -Wp,-MMD,driver=
s/iio/humidity/.hdc3020.o.d -nostdinc -Iarch/mips/include -I./arch/mips/inc=
lude/generated -Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips=
/include/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include =
include/linux/compiler-version.h -include include/linux/kconfig.h -include =
include/linux/compiler_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -fi=
ntegrated-as -Werror=3Dunknown-warning-option -Werror=3Dignored-optimizatio=
n-argument -Werror=3Doption-ignored -Werror=3Dunused-command-line-argument =
-DVMLINUX_LOAD_ADDRESS=3D0xffffffff80040000 -DLINKER_LOAD_ADDRESS=3D0x80040=
000 -DDATAOFFSET=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 =
-std=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict=
-aliasing -mno-check-zero-division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -=
pipe -msoft-float -Wa,-msoft-float -ffreestanding -EL -fno-stack-check -mar=
ch=3Dmips1 -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-dec -Iarc=
h/mips/include/asm/mach-generic -fno-asynchronous-unwind-tables -fno-delete=
-null-pointer-checks -O2 -fno-stack-protector -fomit-frame-pointer -ftrivia=
l-auto-var-init=3Dzero -fstrict-flex-arrays=3D3 -fno-strict-overflow -fno-s=
tack-check -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=3Dimplicit-fun=
ction-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dst=
rict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wno=
-address-of-packed-member -Wmissing-declarations -Wmissing-prototypes -Wno-=
gnu -Wno-format-overflow-non-kprintf -Wno-format-truncation-non-kprintf -Wn=
o-default-const-init-unsafe -Wno-pointer-sign -Wcast-function-type -Wno-unt=
erminated-string-initialization -Wimplicit-fallthrough -Werror=3Ddate-time =
-Werror=3Dincompatible-pointer-types -Wenum-conversion -Wunused -Wmissing-f=
ormat-attribute -Wmissing-include-dirs -Wunused-const-variable -Wno-missing=
-field-initializers -Wno-type-limits -Wno-shift-negative-value -Wno-enum-en=
um-conversion -Wno-sign-compare -Wno-unused-parameter -g -gdwarf-4 -DRANDST=
RUCT -frandomize-layout-seed-file=3D./scripts/basic/randstruct.seed -fno-cr=
ash-diagnostics -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wun=
def -falign-functions=3D64 -Idrivers/iio/common/hid-sensors -Idrivers/iio/h=
umidity -Idrivers/iio/humidity -DKBUILD_MODFILE=3D'"drivers/iio/humidity/hd=
c3020"' -DKBUILD_BASENAME=3D'"hdc3020"' -DKBUILD_MODNAME=3D'"hdc3020"' -D__=
KBUILD_MODNAME=3Dkmod_hdc3020 -c -o drivers/iio/humidity/hdc3020.o drivers/=
iio/humidity/hdc3020.c

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
