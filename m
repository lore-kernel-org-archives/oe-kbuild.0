Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E561A9F8C
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Mar 2026 15:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772379497; cv=none; b=FAgAZuVugdp/BI1fz+3N7mCCTZMDnjSRICVCByiB5W7g0KR7sSXDGst90taym/cPYdvTTcrlZlu06Aiyfy6A2viYDhE/BkMWZR/qDHa6C8K35SaLQ0lWusoJh4jbZmegc35YCgTh85zgJYwrYx/3/8I1irhWXrMBysuGZOhI1eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772379497; c=relaxed/simple;
	bh=dtFZ/fvk4eaMG+oC3nnUrj4JSO58eWHGlNs03jHBtRI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qKKULmSt05bUkib0nFgMlw1AckKBLO7t/Zs/9pdVfJ9Hru39RoAAtugl9+kwqTCZjp5cZbMJuIAZtq+dmCzKC8krbNNVsJ9QMvuDaxkn1S2O9bl/hJTHDYTSTHU6/zjcHwgHWF1Rq2EN5UWfFOpYB76keacBXG8nitRuQTtQJ9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YNLmTUa7; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YNLmTUa7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772379496; x=1803915496;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dtFZ/fvk4eaMG+oC3nnUrj4JSO58eWHGlNs03jHBtRI=;
  b=YNLmTUa7Ib15shYXjcwC9YJIfY/CGZ7PUFMMg7l1Wsau57beWR6uH1IS
   9vzl0Yo4kP8RpcZU021FqTdsSL+cVCwqgI+XpkmO6MwypmpXbrMiKYzDO
   JwpFYAb49TUja4SuxgTcb81O+DpaxJacf3dpo2SAdNOwvbYEbMxh9DhSg
   301Cb5vT0bLk29UScxUKkykMpZ7tSNWtm0YTITGI5COBWddterRbbdysE
   XMPXr6MrK0XcWKGNPIZIrTRCcoQeD+OZxQUEsm5ezw/fb4ily6KcupAbl
   M/DaIBzEj6yEUgnRwk2ym1htYpvtISpCJ1dVTYEmou0nYw5za/3Df75pl
   Q==;
X-CSE-ConnectionGUID: LxLv/eyTTKylaHDpq5W3gw==
X-CSE-MsgGUID: +RKkzR6/RCC62gECCQ07PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="83734349"
X-IronPort-AV: E=Sophos;i="6.21,318,1763452800"; 
   d="scan'208";a="83734349"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2026 07:38:15 -0800
X-CSE-ConnectionGUID: zDIP5nuvTJqSIGHhYVsbgA==
X-CSE-MsgGUID: O/gIOoS0RraHcNFBof07kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,318,1763452800"; 
   d="scan'208";a="240403248"
Received: from lkp-server01.sh.intel.com (HELO 59784f1c7b2a) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Mar 2026 07:38:14 -0800
Received: from kbuild by 59784f1c7b2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwis0-000000001XN-1Vd4;
	Sun, 01 Mar 2026 15:38:12 +0000
Date: Sun, 1 Mar 2026 23:38:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] staging: fbtft: replace -1 with proper error codes
Message-ID: <202603012326.D34F1IjI-lkp@intel.com>
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
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: mips-randconfig-r072-20260301 (https://download.01.org/0day-ci/arch=
ive/20260301/202603012326.D34F1IjI-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a1=
09fbb6e184ec9bcce10615949f598f4c974a9)
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260301/202603012326.D34F1IjI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603012326.D34F1IjI-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
All errors (new ones prefixed by >>):

   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,fs/.binfmt_elf.o.d -nostdinc -Iarch=
/mips/include -I./arch/mips/include/generated -Iinclude -I./include -Iarch/=
mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi -I./i=
nclude/generated/uapi -include include/linux/compiler-version.h -include in=
clude/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ =
--target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknown-warning-optio=
n -Werror=3Dignored-optimization-argument -Werror=3Doption-ignored -Werror=
=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xffffffff88002000=
 -DLINKER_LOAD_ADDRESS=3D0x88002000 -DDATAOFFSET=3D0 -fmacro-prefix-map=3D=
=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -funsigned-char=
 -fno-common -fno-PIE -fno-strict-aliasing -mno-check-zero-division -mabi=
=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-float -ffre=
estanding -EB -fno-stack-check -march=3Dmips3 -Wa,--trap -DTOOLCHAIN_SUPPOR=
TS_VIRT -Iarch/mips/include/asm/mach-ip22 -Iarch/mips/include/asm/mach-gene=
ric -fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks -O2 -fn=
o-stack-protector -fexperimental-late-parse-attributes -pg -fstrict-flex-ar=
rays=3D3 -fms-extensions -fno-strict-overflow -fno-stack-check -fno-builtin=
-wcslen -Wall -Wextra -Wundef -Werror=3Dimplicit-function-declaration -Werr=
or=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-fo=
rmat-security -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-memb=
er -Wmissing-declarations -Wmissing-prototypes -Wno-gnu -Wno-microsoft-anon=
-tag -Wno-format-overflow-non-kprintf -Wno-format-truncation-non-kprintf -W=
no-default-const-init-unsafe -Wno-type-limits -Wno-pointer-sign -Wcast-func=
tion-type -Wno-unterminated-string-initialization -Wimplicit-fallthrough -W=
error=3Ddate-time -Werror=3Dincompatible-pointer-types -Wenum-conversion -W=
unused -Wmissing-format-attribute -Wmissing-include-dirs -Wunused-const-var=
iable -Wno-missing-field-initializers -Wno-shift-negative-value -Wno-enum-e=
num-conversion -Wno-sign-compare -Wno-unused-parameter -DRANDSTRUCT -frando=
mize-layout-seed-file=3D./scripts/basic/randstruct.seed -fno-crash-diagnost=
ics -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -falign-=
functions=3D64 -Ifs -Ifs -DKBUILD_MODFILE=3D\"fs/binfmt_elf\" -DKBUILD_BASE=
NAME=3D\"binfmt_elf\" -DKBUILD_MODNAME=3D\"binfmt_elf\" -D__KBUILD_MODNAME=
=3Dbinfmt_elf -c -o fs/binfmt_elf.o fs/binfmt_elf.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'fs/binfmt_elf.c'.
   4.	Running pass 'Branch Probability Basic Block Placement' on function '=
@elf_core_dump'
    #0 0x00005621909f09fb llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-23+0x41019fb)
    #1 0x00005621909ee5c4 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
23+0x40ff5c4)
    #2 0x0000562190922a60 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007f9ccd32ddf0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x000056218ff992af llvm::TailDuplicator::shouldTailDuplicate(bool, l=
lvm::MachineBasicBlock&) (.part.0) TailDuplicator.cpp:0:0
    #5 0x000056218fcab2b2 (anonymous namespace)::MachineBlockPlacement::run=
(llvm::MachineFunction&) MachineBlockPlacement.cpp:0:0
    #6 0x000056218fcac7c1 (anonymous namespace)::MachineBlockPlacementLegac=
y::runOnMachineFunction(llvm::MachineFunction&) (.part.0) MachineBlockPlace=
ment.cpp:0:0
    #7 0x000056218fcfc6e8 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-23+0x340d6e8)
    #8 0x00005621902d4ea9 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-23+0x39e5ea9)
    #9 0x00005621902d504c llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-23+0x39e604c)
   #10 0x00005621902d42b8 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-23+0x39e52b8)
   #11 0x0000562190de43d4 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-23+0x44f53d4)
   #12 0x00005621914199d7 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-23+0x4b2a9d7)
   #13 0x0000562192d664dc clang::ParseAST(clang::Sema&, bool, bool) (clang-=
23+0x64774dc)
   #14 0x000056219175cd7a clang::FrontendAction::Execute() (clang-23+0x4e6d=
d7a)
   #15 0x00005621916d7ce6 clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-23+0x4de8ce6)
   #16 0x000056219183fb87 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-23+0x4f50b87)
   #17 0x000056218d83a315 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-23+0xf4b315)
   #18 0x000056218d832013 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #19 0x000056218d832053 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #20 0x0000562191497e89 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #21 0x0000562190922dc3 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-23+0x4033dc3)
   #22 0x00005621914985b4 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #23 0x0000562191458928 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-23+0x4b69928)
   #24 0x0000562191459882 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-23+0x4b6a882)
   #25 0x0000562191469fcc clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-23+0x4b7afcc)
   #26 0x000056218d836ca3 clang_main(int, char**, llvm::ToolContext const&)=
 (clang-23+0xf47ca3)
   #27 0x000056218d6cfa69 main (clang-23+0xde0a69)
   #28 0x00007f9ccd317ca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #29 0x00007f9ccd317d65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #30 0x000056218d831a51 _start (clang-23+0xf42a51)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 2081907 Segmentation fault      clang -Wp,-MMD,fs/.bi=
nfmt_elf.o.d -nostdinc -Iarch/mips/include -I./arch/mips/include/generated =
-Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips/include/genera=
ted/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linux/c=
ompiler-version.h -include include/linux/kconfig.h -include include/linux/c=
ompiler_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -fintegrated-as -W=
error=3Dunknown-warning-option -Werror=3Dignored-optimization-argument -Wer=
ror=3Doption-ignored -Werror=3Dunused-command-line-argument -DVMLINUX_LOAD_=
ADDRESS=3D0xffffffff88002000 -DLINKER_LOAD_ADDRESS=3D0x88002000 -DDATAOFFSE=
T=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -f=
short-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -mno-=
check-zero-division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-flo=
at -Wa,-msoft-float -ffreestanding -EB -fno-stack-check -march=3Dmips3 -Wa,=
--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-ip22 -Iarch/m=
ips/include/asm/mach-generic -fno-asynchronous-unwind-tables -fno-delete-nu=
ll-pointer-checks -O2 -fno-stack-protector -fexperimental-late-parse-attrib=
utes -pg -fstrict-flex-arrays=3D3 -fms-extensions -fno-strict-overflow -fno=
-stack-check -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=3Dimplicit-f=
unction-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3D=
strict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -W=
no-address-of-packed-member -Wmissing-declarations -Wmissing-prototypes -Wn=
o-gnu -Wno-microsoft-anon-tag -Wno-format-overflow-non-kprintf -Wno-format-=
truncation-non-kprintf -Wno-default-const-init-unsafe -Wno-type-limits -Wno=
-pointer-sign -Wcast-function-type -Wno-unterminated-string-initialization =
-Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Dincompatible-pointer-t=
ypes -Wenum-conversion -Wunused -Wmissing-format-attribute -Wmissing-includ=
e-dirs -Wunused-const-variable -Wno-missing-field-initializers -Wno-shift-n=
egative-value -Wno-enum-enum-conversion -Wno-sign-compare -Wno-unused-param=
eter -DRANDSTRUCT -frandomize-layout-seed-file=3D./scripts/basic/randstruct=
=2Eseed -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wreturn-type -funs=
igned-char -Wundef -falign-functions=3D64 -Ifs -Ifs -DKBUILD_MODFILE=3D'"fs=
/binfmt_elf"' -DKBUILD_BASENAME=3D'"binfmt_elf"' -DKBUILD_MODNAME=3D'"binfm=
t_elf"' -D__KBUILD_MODNAME=3Dbinfmt_elf -c -o fs/binfmt_elf.o fs/binfmt_elf=
=2Ec

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
