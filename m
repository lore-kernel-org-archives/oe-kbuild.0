Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6E4176FB1
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Mar 2026 05:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772775723; cv=none; b=uFZSP51aCQYSfkq8xQoatHe5xMUg5Ko/u8YQiX90ZkHPbQPAzQ6efS1mEh5nOsxahsaBO60T1Lf5puXI1exu+KEVpdwYbmT6GBs5ns5+Jltc28xI3FzcXtCY9o1sMV6s2c4qLVsm/8v1pn+tghs+wsMKXrwRsUK/Aaowu4YGNYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772775723; c=relaxed/simple;
	bh=9rqtPky6vss2xOYyZKtzEuIa4Djg2HRkyGFNa59Rf1k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qq/RuVeF2GBwHOQCujq80VAIHQLKGVUfViKTTBi5o1vsE54JOuTRBgQgrCSwSCKKLEPlQewbxzP9zjXCld/EsHjVq7RI4ZiQu2Vh7R6Rdzw3Ot203Nwdq/NpdLMBTyTG0YKCkc/+rjrhRxyD/5TgeeWrr5S8VTIQ1Nhj/TAaUZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FisogXLJ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FisogXLJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772775721; x=1804311721;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9rqtPky6vss2xOYyZKtzEuIa4Djg2HRkyGFNa59Rf1k=;
  b=FisogXLJXh29gH1jpwCD+hJytEeog/SniFmktJQVZr1PS2I7ZtMazEjG
   VIaFOL/96hh1rX5PDZ1yxwC2LqRkFbvx373gEWe8IsXUWm2rNtvs8E0v8
   zcNL1HDI56ZkvPXIVg5OC7A303eAmzneZndTOc1G0LdDVYcP2ciksLxaP
   9KAB55UqtgFuXWmV76A4UNAbdO98VZPml2KOBf7tIihjICiYTIX91l+s5
   XNSsmCM4hM/rVCo/LFXfK42AmulqCU0pYZrfOkhVWUGQp93XuvlrENLIN
   Tw8GAF2EcdW3x/he3zoVQM4VqO9LATWsLLntbXc+DP8TxCtxVmdrufcwB
   g==;
X-CSE-ConnectionGUID: Clcz16iiRBenb7z+CYVhaw==
X-CSE-MsgGUID: Ikz3tVI3Qn2IYzQJw2tS7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="84513507"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="84513507"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 21:42:00 -0800
X-CSE-ConnectionGUID: u83JApP2QcSNT7GtY7ZbvA==
X-CSE-MsgGUID: M1bVXZFsTa6A52friFNyGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="218048931"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Mar 2026 21:41:59 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyNwh-000000000PV-45W5;
	Fri, 06 Mar 2026 05:41:55 +0000
Date: Fri, 6 Mar 2026 13:41:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] staging: fbtft: replace -1 with proper error codes
Message-ID: <202603061343.SFPMOq14-lkp@intel.com>
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
In-Reply-To: <20260228202701.43337-1-officialsohamkute@gmail.com>
References: <20260228202701.43337-1-officialsohamkute@gmail.com>
TO: Soham Kute <officialsohamkute@gmail.com>
TO: andy@kernel.org
TO: gregkh@linuxfoundation.org
CC: dri-devel@lists.freedesktop.org
CC: linux-fbdev@vger.kernel.org
CC: linux-staging@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: Soham Kute <officialsohamkute@gmail.com>

Hi Soham,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Soham-Kute/staging-f=
btft-replace-1-with-proper-error-codes/20260301-043244
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260228202701.43337-1-officialsoh=
amkute%40gmail.com
patch subject: [PATCH] staging: fbtft: replace -1 with proper error codes
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: mips-randconfig-r072-20260301 (https://download.01.org/0day-ci/arch=
ive/20260306/202603061343.SFPMOq14-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a1=
09fbb6e184ec9bcce10615949f598f4c974a9)
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260306/202603061343.SFPMOq14-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603061343.SFPMOq14-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
All errors (new ones prefixed by >>):

   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,arch/mips/math-emu/.sp_fmax.o.d -no=
stdinc -Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I./in=
clude -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclu=
de/uapi -I./include/generated/uapi -include include/linux/compiler-version.=
h -include include/linux/kconfig.h -include include/linux/compiler_types.h =
-D__KERNEL__ --target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknown-=
warning-option -Werror=3Dignored-optimization-argument -Werror=3Doption-ign=
ored -Werror=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xffff=
ffff88002000 -DLINKER_LOAD_ADDRESS=3D0x88002000 -DDATAOFFSET=3D0 -fmacro-pr=
efix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -fun=
signed-char -fno-common -fno-PIE -fno-strict-aliasing -mno-check-zero-divis=
ion -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-fl=
oat -ffreestanding -EB -fno-stack-check -march=3Dmips3 -Wa,--trap -DTOOLCHA=
IN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-ip22 -Iarch/mips/include/asm/=
mach-generic -fno-asynchronous-unwind-tables -fno-delete-null-pointer-check=
s -O2 -fno-stack-protector -fexperimental-late-parse-attributes -pg -fstric=
t-flex-arrays=3D3 -fms-extensions -fno-strict-overflow -fno-stack-check -fn=
o-builtin-wcslen -Wall -Wextra -Wundef -Werror=3Dimplicit-function-declarat=
ion -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototype=
s -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wno-address-of-pa=
cked-member -Wmissing-declarations -Wmissing-prototypes -Wno-gnu -Wno-micro=
soft-anon-tag -Wno-format-overflow-non-kprintf -Wno-format-truncation-non-k=
printf -Wno-default-const-init-unsafe -Wno-type-limits -Wno-pointer-sign -W=
cast-function-type -Wno-unterminated-string-initialization -Wimplicit-fallt=
hrough -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wenum-conv=
ersion -Wunused -Wmissing-format-attribute -Wmissing-include-dirs -Wunused-=
const-variable -Wno-missing-field-initializers -Wno-shift-negative-value -W=
no-enum-enum-conversion -Wno-sign-compare -Wno-unused-parameter -DRANDSTRUC=
T -frandomize-layout-seed-file=3D./scripts/basic/randstruct.seed -fno-crash=
-diagnostics -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef=
 -falign-functions=3D64 -Iarch/mips/math-emu -Iarch/mips/math-emu -DKBUILD_=
MODFILE=3D\"arch/mips/math-emu/sp_fmax\" -DKBUILD_BASENAME=3D\"sp_fmax\" -D=
KBUILD_MODNAME=3D\"sp_fmax\" -D__KBUILD_MODNAME=3Dsp_fmax -c -o arch/mips/m=
ath-emu/sp_fmax.o arch/mips/math-emu/sp_fmax.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'arch/mips/math-emu/sp=
_fmax.c'.
   4.	Running pass 'Branch Probability Basic Block Placement' on function '=
@ieee754sp_fmax'
    #0 0x000055ea7d92a5bb llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-23+0x411f5bb)
    #1 0x000055ea7d928184 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
23+0x411d184)
    #2 0x000055ea7d85c360 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007faf56e59df0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x000055ea7ced01af llvm::TailDuplicator::shouldTailDuplicate(bool, l=
lvm::MachineBasicBlock&) (.part.0) TailDuplicator.cpp:0:0
    #5 0x000055ea7cbdce49 (anonymous namespace)::MachineBlockPlacement::bui=
ldCFGChains() MachineBlockPlacement.cpp:0:0
    #6 0x000055ea7cbe1fb0 (anonymous namespace)::MachineBlockPlacement::run=
(llvm::MachineFunction&) MachineBlockPlacement.cpp:0:0
    #7 0x000055ea7cbe31e1 (anonymous namespace)::MachineBlockPlacementLegac=
y::runOnMachineFunction(llvm::MachineFunction&) (.part.0) MachineBlockPlace=
ment.cpp:0:0
    #8 0x000055ea7cc332e8 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-23+0x34282e8)
    #9 0x000055ea7d20bee9 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-23+0x3a00ee9)
   #10 0x000055ea7d20c08c llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-23+0x3a0108c)
   #11 0x000055ea7d20b2f8 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-23+0x3a002f8)
   #12 0x000055ea7dd1f2b4 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-23+0x45142b4)
   #13 0x000055ea7e355087 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-23+0x4b4a087)
   #14 0x000055ea7fcb691c clang::ParseAST(clang::Sema&, bool, bool) (clang-=
23+0x64ab91c)
   #15 0x000055ea7e69fc3a clang::FrontendAction::Execute() (clang-23+0x4e94=
c3a)
   #16 0x000055ea7e61b2c6 clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-23+0x4e102c6)
   #17 0x000055ea7e782e47 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-23+0x4f77e47)
   #18 0x000055ea7a752e55 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-23+0xf47e55)
   #19 0x000055ea7a74ab63 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #20 0x000055ea7a74aba3 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #21 0x000055ea7e3d3f39 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #22 0x000055ea7d85c6c3 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-23+0x40516c3)
   #23 0x000055ea7e3d4664 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #24 0x000055ea7e393fe8 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-23+0x4b88fe8)
   #25 0x000055ea7e394f42 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-23+0x4b89f42)
   #26 0x000055ea7e3a5c8c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-23+0x4b9ac8c)
   #27 0x000055ea7a74f80f clang_main(int, char**, llvm::ToolContext const&)=
 (clang-23+0xf4480f)
   #28 0x000055ea7a5e7cf9 main (clang-23+0xddccf9)
   #29 0x00007faf56e43ca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #30 0x00007faf56e43d65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #31 0x000055ea7a74a5a1 _start (clang-23+0xf3f5a1)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 2432055 Segmentation fault      clang -Wp,-MMD,arch/m=
ips/math-emu/.sp_fmax.o.d -nostdinc -Iarch/mips/include -I./arch/mips/inclu=
de/generated -Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips/i=
nclude/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include in=
clude/linux/compiler-version.h -include include/linux/kconfig.h -include in=
clude/linux/compiler_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -fint=
egrated-as -Werror=3Dunknown-warning-option -Werror=3Dignored-optimization-=
argument -Werror=3Doption-ignored -Werror=3Dunused-command-line-argument -D=
VMLINUX_LOAD_ADDRESS=3D0xffffffff88002000 -DLINKER_LOAD_ADDRESS=3D0x8800200=
0 -DDATAOFFSET=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -s=
td=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-a=
liasing -mno-check-zero-division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pi=
pe -msoft-float -Wa,-msoft-float -ffreestanding -EB -fno-stack-check -march=
=3Dmips3 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-=
ip22 -Iarch/mips/include/asm/mach-generic -fno-asynchronous-unwind-tables -=
fno-delete-null-pointer-checks -O2 -fno-stack-protector -fexperimental-late=
-parse-attributes -pg -fstrict-flex-arrays=3D3 -fms-extensions -fno-strict-=
overflow -fno-stack-check -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=
=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-ty=
pe -Werror=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -Wno-fra=
me-address -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-p=
rototypes -Wno-gnu -Wno-microsoft-anon-tag -Wno-format-overflow-non-kprintf=
 -Wno-format-truncation-non-kprintf -Wno-default-const-init-unsafe -Wno-typ=
e-limits -Wno-pointer-sign -Wcast-function-type -Wno-unterminated-string-in=
itialization -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Dincompati=
ble-pointer-types -Wenum-conversion -Wunused -Wmissing-format-attribute -Wm=
issing-include-dirs -Wunused-const-variable -Wno-missing-field-initializers=
 -Wno-shift-negative-value -Wno-enum-enum-conversion -Wno-sign-compare -Wno=
-unused-parameter -DRANDSTRUCT -frandomize-layout-seed-file=3D./scripts/bas=
ic/randstruct.seed -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wreturn=
-type -funsigned-char -Wundef -falign-functions=3D64 -Iarch/mips/math-emu -=
Iarch/mips/math-emu -DKBUILD_MODFILE=3D'"arch/mips/math-emu/sp_fmax"' -DKBU=
ILD_BASENAME=3D'"sp_fmax"' -DKBUILD_MODNAME=3D'"sp_fmax"' -D__KBUILD_MODNAM=
E=3Dsp_fmax -c -o arch/mips/math-emu/sp_fmax.o arch/mips/math-emu/sp_fmax.c

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
