Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0101B6D08
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Jul 2026 20:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784318679; cv=none; b=Q0IgwuRhtzJkRuRSqiFeuHHshoTk3wLwLruYuYMHFEJ0c6uiLZrcT9QQ7tXXLQmf0sDye0MVYvQyYYG+fPVqWectAI0qF/B6NsNXR1O0wvtKE87pmHq13r2ykvzPQ+DhWbAuS6ioudF/ve20Mg4qUe55AdrBPpWweJwln97poy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784318679; c=relaxed/simple;
	bh=WSigmXMTjLeAFmFPPdb7Kz03sSjXXR6J70Ftlj6LGhk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hhplXGP3/7RIHtL3bBNg2iDPWyKisVHzKXuD3NCADD+k87RczeGeIb7bSOa8dJ1KvnxNC8fUNUpoA+thOOYuOL9l8GSiq32Kur8v6tG8CuoFYw6ZR4Hok2quyBvE+F5cqxG2LglpTtSKbd6Yt1AWeQ3mTerSMwQ+zTfS2k+GOHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lho4ZNsQ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lho4ZNsQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784318677; x=1815854677;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=WSigmXMTjLeAFmFPPdb7Kz03sSjXXR6J70Ftlj6LGhk=;
  b=lho4ZNsQvgfrjaP2WtHZ51pAMYdkkmeROxw6GaDWqVulYi1eXR8YSm63
   QBKBu0T5GdXu2MrPTJvOSUWrVWX5NVC76OuUjPicAVsk5gwarijbH1IKw
   57FHIPtEBCbPq6MNxgD5ewzksFFUxdIUODfj0PJneMfOts+kmqPhKjPT6
   694Zt4k4yBTJWnPQuRalVuC8QFf6CelNRiF2QVyAUz9VOvIUyesHkg8Ne
   VF2AV+o1zOS4lNLxlCQhMKnGo8VtnQSXckqgL/80NsQBJq/OuJOCYnM4T
   LWNpkW/OQ3DwO+oFhOspAjk7QrdQKSSFwJGU9l4m7n3wmPrEciqkAy86p
   w==;
X-CSE-ConnectionGUID: RC8n17KaRXKJDLl7AmEyzw==
X-CSE-MsgGUID: Yd5Toq8STtepGnRtCwhigQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="84123907"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="84123907"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 13:04:36 -0700
X-CSE-ConnectionGUID: Z0vx3gT7Q+iL1rlgmia0ug==
X-CSE-MsgGUID: nhNiJNrGSm+uYSc4RIMppw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="252902234"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 17 Jul 2026 13:04:35 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkonQ-00000000T7D-3Nrz;
	Fri, 17 Jul 2026 20:04:32 +0000
Date: Sat, 18 Jul 2026 04:04:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: /bin/bash: line 1: 3134535 Segmentation fault      clang
 -Wp,-MMD,drivers/iio/humidity/.hdc3020.o.d -nostdinc -Iarch/mips/include
 -I./arch/mips/include/generated -Iinclude -I./include
 -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude...
Message-ID: <202607180303.n9dzIHSy-lkp@intel.com>
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
head:   af5e34a41cd607c00ef752e00331736570992354
commit: cb372b4f46d4285e5d2c07ba734374151b8e34e7 iio: humditiy: hdc3020: fi=
x units for thresholds and hysteresis
date:   9 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 9 months ago
config: mips-randconfig-r113-20260717 (https://download.01.org/0day-ci/arch=
ive/20260718/202607180303.n9dzIHSy-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5c0=
dfced1adc55429e32b1db08570abd3a219d85)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260718/202607180303.n9dzIHSy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: cb372b4f46d4 ("iio: humditiy: hdc3020: fix units for thresholds an=
d hysteresis")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607180303.n9dzIHSy-lkp@intel.com/

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
ffffff84000000 -DLINKER_LOAD_ADDRESS=3D0x84000000 -DDATAOFFSET=3D0 -fmacro-=
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
re -Wno-unused-parameter -gsplit-dwarf -g -gdwarf-5 -fno-var-tracking -DRAN=
DSTRUCT -frandomize-layout-seed-file=3D./scripts/basic/randstruct.seed -fno=
-crash-diagnostics -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -=
Wundef -falign-functions=3D64 -Idrivers/iio/common/hid-sensors -Idrivers/ii=
o/humidity -Idrivers/iio/humidity -ffunction-sections -fdata-sections -DKBU=
ILD_MODFILE=3D\"drivers/iio/humidity/hdc3020\" -DKBUILD_BASENAME=3D\"hdc302=
0\" -DKBUILD_MODNAME=3D\"hdc3020\" -D__KBUILD_MODNAME=3Dkmod_hdc3020 -c -o =
drivers/iio/humidity/hdc3020.o drivers/iio/humidity/hdc3020.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'drivers/iio/humidity/=
hdc3020.c'.
   4.	Running pass 'Shrink Wrapping analysis' on function '@hdc3020_write_t=
hresh'
    #0 0x00005652d197014a llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-24+0x38b514a)
    #1 0x00005652d196dd24 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
24+0x38b2d24)
    #2 0x00005652d18a3240 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007f287ba9fdf0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x00005652d0f46bce (anonymous namespace)::ShrinkWrapImpl::useOrDefCS=
ROrFI(llvm::MachineInstr const&, llvm::RegScavenger*, bool) const ShrinkWra=
p.cpp:0:0
    #5 0x00005652d0f4a02c (anonymous namespace)::ShrinkWrapImpl::run(llvm::=
MachineFunction&) ShrinkWrap.cpp:0:0
    #6 0x00005652d0f4b9e8 (anonymous namespace)::ShrinkWrapLegacy::runOnMac=
hineFunction(llvm::MachineFunction&) (.part.0) ShrinkWrap.cpp:0:0
    #7 0x00005652d0d26273 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-24+0x2c6b273)
    #8 0x00005652d127a179 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-24+0x31bf179)
    #9 0x00005652d127a5ac llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-24+0x31bf5ac)
   #10 0x00005652d127b14a (anonymous namespace)::MPPassManager::runOnModule=
(llvm::Module&) LegacyPassManager.cpp:0:0
   #11 0x00005652d127b81c llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-24+0x31c081c)
   #12 0x00005652d1d1f5bf (anonymous namespace)::EmitAssemblyHelper::TimeCo=
degenPasses(llvm::function_ref<void ()>) BackendUtil.cpp:0:0
   #13 0x00005652d1d309ba (anonymous namespace)::EmitAssemblyHelper::emitAs=
sembly(clang::BackendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::=
default_delete<llvm::raw_pwrite_stream>>, clang::BackendConsumer*) (.constp=
rop.0) BackendUtil.cpp:0:0
   #14 0x00005652d1d30baf clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-24+0x3c75baf)
   #15 0x00005652d236b587 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-24+0x42b0587)
   #16 0x00005652d3d71a8c clang::ParseAST(clang::Sema&, bool, bool) (clang-=
24+0x5cb6a8c)
   #17 0x00005652d26ca8de clang::FrontendAction::Execute() (clang-24+0x460f=
8de)
   #18 0x00005652d2656ade clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-24+0x459bade)
   #19 0x00005652d2799407 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-24+0x46de407)
   #20 0x00005652ce995d88 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-24+0x8dad88)
   #21 0x00005652ce98da53 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #22 0x00005652ce98da93 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #23 0x00005652d23e91c9 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #24 0x00005652d18a35a3 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-24+0x37e85a3)
   #25 0x00005652d23ea74c clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #26 0x00005652d23a2f58 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-24+0x42e7f58)
   #27 0x00005652d23a7792 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-24+0x42ec792)
   #28 0x00005652d23b959c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-24+0x42fe59c)
   #29 0x00005652ce992712 clang_main(int, char**, llvm::ToolContext const&)=
 (clang-24+0x8d7712)
   #30 0x00005652ce8adfd9 main (clang-24+0x7f2fd9)
   #31 0x00007f287ba89ca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #32 0x00007f287ba89d65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #33 0x00005652ce98d4b1 _start (clang-24+0x8d24b1)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 3134535 Segmentation fault      clang -Wp,-MMD,driver=
s/iio/humidity/.hdc3020.o.d -nostdinc -Iarch/mips/include -I./arch/mips/inc=
lude/generated -Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips=
/include/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include =
include/linux/compiler-version.h -include include/linux/kconfig.h -include =
include/linux/compiler_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -fi=
ntegrated-as -Werror=3Dunknown-warning-option -Werror=3Dignored-optimizatio=
n-argument -Werror=3Doption-ignored -Werror=3Dunused-command-line-argument =
-DVMLINUX_LOAD_ADDRESS=3D0xffffffff84000000 -DLINKER_LOAD_ADDRESS=3D0x84000=
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
um-conversion -Wno-sign-compare -Wno-unused-parameter -gsplit-dwarf -g -gdw=
arf-5 -fno-var-tracking -DRANDSTRUCT -frandomize-layout-seed-file=3D./scrip=
ts/basic/randstruct.seed -fno-crash-diagnostics -Wno-error=3Dreturn-type -W=
return-type -funsigned-char -Wundef -falign-functions=3D64 -Idrivers/iio/co=
mmon/hid-sensors -Idrivers/iio/humidity -Idrivers/iio/humidity -ffunction-s=
ections -fdata-sections -DKBUILD_MODFILE=3D'"drivers/iio/humidity/hdc3020"'=
 -DKBUILD_BASENAME=3D'"hdc3020"' -DKBUILD_MODNAME=3D'"hdc3020"' -D__KBUILD_=
MODNAME=3Dkmod_hdc3020 -c -o drivers/iio/humidity/hdc3020.o drivers/iio/hum=
idity/hdc3020.c

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=3Dy] && HAS_IOMEM [=3Dy] && (ARCH_SPACEMIT || COMP=
ILE_TEST [=3Dy]) && OF [=3Dn]
   Selected by [m]:
   - MFD_SPACEMIT_P1 [=3Dm] && HAS_IOMEM [=3Dy] && (ARCH_SPACEMIT || COMPIL=
E_TEST [=3Dy]) && I2C [=3Dy]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
