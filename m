Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2008E3D0900
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Mar 2026 15:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774451524; cv=none; b=OayGDUH1ACJ4xnlSNPkFN0abH8XTBdNkhdmv5L5DuqvCsabTlLIQ3XgJ91X3L0SiTbs/rj4M4ZyWl/jmB00iG+t/ofOk/sGZjp36PoDdyVQBdp97uMuZcZgfhv7TpVFuDn2prVVC8I7Uyd6uT/jJ0DAwR2zLtLc98Df+Of6keEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774451524; c=relaxed/simple;
	bh=WHfNb3eRPNnI17BFaTDzor1rav7vk5/VMd/JuYkq6Jg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FPG8GMDchqCKLWng7bvV+ZHZmGmAvXMCfRV4R4ehVD4o7r8ZUzsa3dmnRlWJy34YUb7Vt4nzxw3W0yONrNa96l9Px8kiwe0tvEWqElYsJOslvLx4nviAPMXvnIuNHdsBPpZnaE8NzK5ehrzAc7mV7WEHv5ZCKcJFhgtwICb59/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jt9vUmpc; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jt9vUmpc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774451521; x=1805987521;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=WHfNb3eRPNnI17BFaTDzor1rav7vk5/VMd/JuYkq6Jg=;
  b=jt9vUmpcINbG8ZcfY0C4FhFiF/tIIWfEQv1ueISWBDFbDNGDVI+MqMDm
   OYlU9eApBdgdraBBmE/9IHVNtsP/jiiMUbE7aILNQMuRU9bZ18de1BUBQ
   C5VpCHDeSOktIYoMwlnLkM781DVoWdwYG7TG7iCAtzAT9FhDPohoOEPBz
   P3K9s91Ypg84hMAueYTN6l8Yy/Seq0SmPSwoNHLMakLpTApzZzDcfUWP7
   2XUb3jwi1l+7FI1OIS1kHq8OlCJNadle807zYQvCkdLO4ascAEnpO9Tj7
   L7puX8oN/egvhPQHwSUS3xZzpoxj8yN52gXxQhMl/qRi2+tD4XknILBQU
   Q==;
X-CSE-ConnectionGUID: IUzLTFqoQlyz+xl0aR7xAQ==
X-CSE-MsgGUID: M3MVPWlITpe8E61GCB8bZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="92871409"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="92871409"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 08:12:01 -0700
X-CSE-ConnectionGUID: tZDD9GrgQt+SZfJ8aj4h9g==
X-CSE-MsgGUID: 348EJyz1QROmXeXZu4FvJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="218133934"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 25 Mar 2026 08:11:58 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5Ptk-0000000077D-1s8j;
	Wed, 25 Mar 2026 15:11:56 +0000
Date: Wed, 25 Mar 2026 23:11:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: /bin/bash: line 1: 31188 Segmentation fault      clang
 -Wp,-MMD,drivers/target/.target_core_ua.o.d -nostdinc -Iarch/mips/include
 -I./arch/mips/include/generated -Iinclude -I./include
 -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/...
Message-ID: <202603252358.yh4hiOAf-lkp@intel.com>
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
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   bbeb83d3182abe0d245318e274e8531e5dd7a948
commit: b7eda5634e9b1e8bb1930c7b27511fde4ed8efa5 auxdisplay: arm-charlcd: U=
se readl_poll_timeout
date:   3 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 3 months ago
config: mips-randconfig-r072-20260301 (https://download.01.org/0day-ci/arch=
ive/20260325/202603252358.yh4hiOAf-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a1=
09fbb6e184ec9bcce10615949f598f4c974a9)
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260325/202603252358.yh4hiOAf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603252358.yh4hiOAf-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
All errors (new ones prefixed by >>):

   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,drivers/target/.target_core_ua.o.d =
-nostdinc -Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I.=
/include -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iin=
clude/uapi -I./include/generated/uapi -include include/linux/compiler-versi=
on.h -include include/linux/kconfig.h -include include/linux/compiler_types=
.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunkno=
wn-warning-option -Werror=3Dignored-optimization-argument -Werror=3Doption-=
ignored -Werror=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xf=
fffffff88002000 -DLINKER_LOAD_ADDRESS=3D0x88002000 -DDATAOFFSET=3D0 -fmacro=
-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -=
funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -mno-check-zero-di=
vision -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft=
-float -ffreestanding -EB -fno-stack-check -march=3Dmips3 -Wa,--trap -DTOOL=
CHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-ip22 -Iarch/mips/include/a=
sm/mach-generic -fno-asynchronous-unwind-tables -fno-delete-null-pointer-ch=
ecks -O2 -fno-stack-protector -pg -fstrict-flex-arrays=3D3 -fms-extensions =
-fno-strict-overflow -fno-stack-check -fno-builtin-wcslen -Wall -Wextra -Wu=
ndef -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=
=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-security -Wno-trigra=
phs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-declarations=
 -Wmissing-prototypes -Wno-gnu -Wno-microsoft-anon-tag -Wno-format-overflow=
-non-kprintf -Wno-format-truncation-non-kprintf -Wno-default-const-init-uns=
afe -Wno-pointer-sign -Wcast-function-type -Wno-unterminated-string-initial=
ization -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Dincompatible-p=
ointer-types -Wenum-conversion -Wunused -Wmissing-format-attribute -Wmissin=
g-include-dirs -Wunused-const-variable -Wno-missing-field-initializers -Wno=
-type-limits -Wno-shift-negative-value -Wno-enum-enum-conversion -Wno-sign-=
compare -Wno-unused-parameter -DRANDSTRUCT -frandomize-layout-seed-file=3D.=
/scripts/basic/randstruct.seed -fno-crash-diagnostics -Wno-error=3Dreturn-t=
ype -Wreturn-type -funsigned-char -Wundef -falign-functions=3D64 -Idrivers/=
target -Idrivers/target -DKBUILD_MODFILE=3D\"drivers/target/target_core_mod=
\" -DKBUILD_BASENAME=3D\"target_core_ua\" -DKBUILD_MODNAME=3D\"target_core_=
mod\" -D__KBUILD_MODNAME=3Dtarget_core_mod -c -o drivers/target/target_core=
_ua.o drivers/target/target_core_ua.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'drivers/target/target=
_core_ua.c'.
   4.	Running pass 'Branch Probability Basic Block Placement' on function '=
@target_scsi3_ua_check'
    #0 0x000055d53b08cf3b llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-23+0x414df3b)
    #1 0x000055d53b08ab04 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
23+0x414bb04)
    #2 0x000055d53afbec20 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007ff423f3edf0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x000055d53a62abef llvm::TailDuplicator::shouldTailDuplicate(bool, l=
lvm::MachineBasicBlock&) (.part.0) TailDuplicator.cpp:0:0
    #5 0x000055d53a33c534 (anonymous namespace)::MachineBlockPlacement::bui=
ldCFGChains() MachineBlockPlacement.cpp:0:0
    #6 0x000055d53a340e2d (anonymous namespace)::MachineBlockPlacement::run=
(llvm::MachineFunction&) MachineBlockPlacement.cpp:0:0
    #7 0x000055d53a342031 (anonymous namespace)::MachineBlockPlacementLegac=
y::runOnMachineFunction(llvm::MachineFunction&) (.part.0) MachineBlockPlace=
ment.cpp:0:0
    #8 0x000055d53a38fa28 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-23+0x3450a28)
    #9 0x000055d53a966229 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-23+0x3a27229)
   #10 0x000055d53a9663cc llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-23+0x3a273cc)
   #11 0x000055d53a965638 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-23+0x3a26638)
   #12 0x000055d53b489e21 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-23+0x454ae21)
   #13 0x000055d53bacd1c7 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-23+0x4b8e1c7)
   #14 0x000055d53d4aea1c clang::ParseAST(clang::Sema&, bool, bool) (clang-=
23+0x656fa1c)
   #15 0x000055d53be2493a clang::FrontendAction::Execute() (clang-23+0x4ee5=
93a)
   #16 0x000055d53bd9f176 clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-23+0x4e60176)
   #17 0x000055d53bf0d727 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-23+0x4fce727)
   #18 0x000055d537e84c95 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-23+0xf45c95)
   #19 0x000055d537e7c9a3 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #20 0x000055d537e7c9e3 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #21 0x000055d53bb3e849 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #22 0x000055d53afbef83 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-23+0x407ff83)
   #23 0x000055d53bb3ef74 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #24 0x000055d53bafe1a8 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-23+0x4bbf1a8)
   #25 0x000055d53baff102 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-23+0x4bc0102)
   #26 0x000055d53bb0fe4c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-23+0x4bd0e4c)
   #27 0x000055d537e8164f clang_main(int, char**, llvm::ToolContext const&)=
 (clang-23+0xf4264f)
   #28 0x000055d537d19bc9 main (clang-23+0xddabc9)
   #29 0x00007ff423f28ca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #30 0x00007ff423f28d65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #31 0x000055d537e7c3e1 _start (clang-23+0xf3d3e1)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 31188 Segmentation fault      clang -Wp,-MMD,drivers/=
target/.target_core_ua.o.d -nostdinc -Iarch/mips/include -I./arch/mips/incl=
ude/generated -Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips/=
include/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include i=
nclude/linux/compiler-version.h -include include/linux/kconfig.h -include i=
nclude/linux/compiler_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -fin=
tegrated-as -Werror=3Dunknown-warning-option -Werror=3Dignored-optimization=
-argument -Werror=3Doption-ignored -Werror=3Dunused-command-line-argument -=
DVMLINUX_LOAD_ADDRESS=3D0xffffffff88002000 -DLINKER_LOAD_ADDRESS=3D0x880020=
00 -DDATAOFFSET=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -=
std=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-=
aliasing -mno-check-zero-division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -p=
ipe -msoft-float -Wa,-msoft-float -ffreestanding -EB -fno-stack-check -marc=
h=3Dmips3 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach=
-ip22 -Iarch/mips/include/asm/mach-generic -fno-asynchronous-unwind-tables =
-fno-delete-null-pointer-checks -O2 -fno-stack-protector -pg -fstrict-flex-=
arrays=3D3 -fms-extensions -fno-strict-overflow -fno-stack-check -fno-built=
in-wcslen -Wall -Wextra -Wundef -Werror=3Dimplicit-function-declaration -We=
rror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-=
format-security -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-me=
mber -Wmissing-declarations -Wmissing-prototypes -Wno-gnu -Wno-microsoft-an=
on-tag -Wno-format-overflow-non-kprintf -Wno-format-truncation-non-kprintf =
-Wno-default-const-init-unsafe -Wno-pointer-sign -Wcast-function-type -Wno-=
unterminated-string-initialization -Wimplicit-fallthrough -Werror=3Ddate-ti=
me -Werror=3Dincompatible-pointer-types -Wenum-conversion -Wunused -Wmissin=
g-format-attribute -Wmissing-include-dirs -Wunused-const-variable -Wno-miss=
ing-field-initializers -Wno-type-limits -Wno-shift-negative-value -Wno-enum=
-enum-conversion -Wno-sign-compare -Wno-unused-parameter -DRANDSTRUCT -fran=
domize-layout-seed-file=3D./scripts/basic/randstruct.seed -fno-crash-diagno=
stics -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -falig=
n-functions=3D64 -Idrivers/target -Idrivers/target -DKBUILD_MODFILE=3D'"dri=
vers/target/target_core_mod"' -DKBUILD_BASENAME=3D'"target_core_ua"' -DKBUI=
LD_MODNAME=3D'"target_core_mod"' -D__KBUILD_MODNAME=3Dtarget_core_mod -c -o=
 drivers/target/target_core_ua.o drivers/target/target_core_ua.c
--
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,arch/mips/math-emu/.dp_cmp.o.d -nos=
tdinc -Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I./inc=
lude -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclud=
e/uapi -I./include/generated/uapi -include include/linux/compiler-version.h=
 -include include/linux/kconfig.h -include include/linux/compiler_types.h -=
D__KERNEL__ --target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknown-w=
arning-option -Werror=3Dignored-optimization-argument -Werror=3Doption-igno=
red -Werror=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xfffff=
fff88002000 -DLINKER_LOAD_ADDRESS=3D0x88002000 -DDATAOFFSET=3D0 -fmacro-pre=
fix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -funs=
igned-char -fno-common -fno-PIE -fno-strict-aliasing -mno-check-zero-divisi=
on -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-flo=
at -ffreestanding -EB -fno-stack-check -march=3Dmips3 -Wa,--trap -DTOOLCHAI=
N_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-ip22 -Iarch/mips/include/asm/m=
ach-generic -fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks=
 -O2 -fno-stack-protector -pg -fstrict-flex-arrays=3D3 -fms-extensions -fno=
-strict-overflow -fno-stack-check -fno-builtin-wcslen -Wall -Wextra -Wundef=
 -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dr=
eturn-type -Werror=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs =
-Wno-frame-address -Wno-address-of-packed-member -Wmissing-declarations -Wm=
issing-prototypes -Wno-gnu -Wno-microsoft-anon-tag -Wno-format-overflow-non=
-kprintf -Wno-format-truncation-non-kprintf -Wno-default-const-init-unsafe =
-Wno-pointer-sign -Wcast-function-type -Wno-unterminated-string-initializat=
ion -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Dincompatible-point=
er-types -Wenum-conversion -Wunused -Wmissing-format-attribute -Wmissing-in=
clude-dirs -Wunused-const-variable -Wno-missing-field-initializers -Wno-typ=
e-limits -Wno-shift-negative-value -Wno-enum-enum-conversion -Wno-sign-comp=
are -Wno-unused-parameter -DRANDSTRUCT -frandomize-layout-seed-file=3D./scr=
ipts/basic/randstruct.seed -fno-crash-diagnostics -Wno-error=3Dreturn-type =
-Wreturn-type -funsigned-char -Wundef -falign-functions=3D64 -Iarch/mips/ma=
th-emu -Iarch/mips/math-emu -DKBUILD_MODFILE=3D\"arch/mips/math-emu/dp_cmp\=
" -DKBUILD_BASENAME=3D\"dp_cmp\" -DKBUILD_MODNAME=3D\"dp_cmp\" -D__KBUILD_M=
ODNAME=3Ddp_cmp -c -o arch/mips/math-emu/dp_cmp.o arch/mips/math-emu/dp_cmp=
.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'arch/mips/math-emu/dp=
_cmp.c'.
   4.	Running pass 'Branch Probability Basic Block Placement' on function '=
@ieee754dp_cmp'
    #0 0x00005604d14a8f3b llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-23+0x414df3b)
    #1 0x00005604d14a6b04 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
23+0x414bb04)
    #2 0x00005604d13dac20 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007f2017af8df0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x00005604d0a46bef llvm::TailDuplicator::shouldTailDuplicate(bool, l=
lvm::MachineBasicBlock&) (.part.0) TailDuplicator.cpp:0:0
    #5 0x00005604d0758534 (anonymous namespace)::MachineBlockPlacement::bui=
ldCFGChains() MachineBlockPlacement.cpp:0:0
    #6 0x00005604d075ce2d (anonymous namespace)::MachineBlockPlacement::run=
(llvm::MachineFunction&) MachineBlockPlacement.cpp:0:0
    #7 0x00005604d075e031 (anonymous namespace)::MachineBlockPlacementLegac=
y::runOnMachineFunction(llvm::MachineFunction&) (.part.0) MachineBlockPlace=
ment.cpp:0:0
    #8 0x00005604d07aba28 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-23+0x3450a28)
    #9 0x00005604d0d82229 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-23+0x3a27229)
   #10 0x00005604d0d823cc llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-23+0x3a273cc)
   #11 0x00005604d0d81638 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-23+0x3a26638)
   #12 0x00005604d18a5e21 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-23+0x454ae21)
   #13 0x00005604d1ee91c7 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-23+0x4b8e1c7)
   #14 0x00005604d38caa1c clang::ParseAST(clang::Sema&, bool, bool) (clang-=
23+0x656fa1c)
   #15 0x00005604d224093a clang::FrontendAction::Execute() (clang-23+0x4ee5=
93a)
   #16 0x00005604d21bb176 clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-23+0x4e60176)
   #17 0x00005604d2329727 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-23+0x4fce727)
   #18 0x00005604ce2a0c95 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-23+0xf45c95)
   #19 0x00005604ce2989a3 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #20 0x00005604ce2989e3 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #21 0x00005604d1f5a849 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #22 0x00005604d13daf83 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-23+0x407ff83)
   #23 0x00005604d1f5af74 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #24 0x00005604d1f1a1a8 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-23+0x4bbf1a8)
   #25 0x00005604d1f1b102 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-23+0x4bc0102)
   #26 0x00005604d1f2be4c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-23+0x4bd0e4c)
   #27 0x00005604ce29d64f clang_main(int, char**, llvm::ToolContext const&)=
 (clang-23+0xf4264f)
   #28 0x00005604ce135bc9 main (clang-23+0xddabc9)
   #29 0x00007f2017ae2ca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #30 0x00007f2017ae2d65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #31 0x00005604ce2983e1 _start (clang-23+0xf3d3e1)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 4182121 Segmentation fault      clang -Wp,-MMD,arch/m=
ips/math-emu/.dp_cmp.o.d -nostdinc -Iarch/mips/include -I./arch/mips/includ=
e/generated -Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips/in=
clude/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include inc=
lude/linux/compiler-version.h -include include/linux/kconfig.h -include inc=
lude/linux/compiler_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -finte=
grated-as -Werror=3Dunknown-warning-option -Werror=3Dignored-optimization-a=
rgument -Werror=3Doption-ignored -Werror=3Dunused-command-line-argument -DV=
MLINUX_LOAD_ADDRESS=3D0xffffffff88002000 -DLINKER_LOAD_ADDRESS=3D0x88002000=
 -DDATAOFFSET=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -st=
d=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-al=
iasing -mno-check-zero-division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pip=
e -msoft-float -Wa,-msoft-float -ffreestanding -EB -fno-stack-check -march=
=3Dmips3 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-=
ip22 -Iarch/mips/include/asm/mach-generic -fno-asynchronous-unwind-tables -=
fno-delete-null-pointer-checks -O2 -fno-stack-protector -pg -fstrict-flex-a=
rrays=3D3 -fms-extensions -fno-strict-overflow -fno-stack-check -fno-builti=
n-wcslen -Wall -Wextra -Wundef -Werror=3Dimplicit-function-declaration -Wer=
ror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-f=
ormat-security -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-mem=
ber -Wmissing-declarations -Wmissing-prototypes -Wno-gnu -Wno-microsoft-ano=
n-tag -Wno-format-overflow-non-kprintf -Wno-format-truncation-non-kprintf -=
Wno-default-const-init-unsafe -Wno-pointer-sign -Wcast-function-type -Wno-u=
nterminated-string-initialization -Wimplicit-fallthrough -Werror=3Ddate-tim=
e -Werror=3Dincompatible-pointer-types -Wenum-conversion -Wunused -Wmissing=
-format-attribute -Wmissing-include-dirs -Wunused-const-variable -Wno-missi=
ng-field-initializers -Wno-type-limits -Wno-shift-negative-value -Wno-enum-=
enum-conversion -Wno-sign-compare -Wno-unused-parameter -DRANDSTRUCT -frand=
omize-layout-seed-file=3D./scripts/basic/randstruct.seed -fno-crash-diagnos=
tics -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -falign=
-functions=3D64 -Iarch/mips/math-emu -Iarch/mips/math-emu -DKBUILD_MODFILE=
=3D'"arch/mips/math-emu/dp_cmp"' -DKBUILD_BASENAME=3D'"dp_cmp"' -DKBUILD_MO=
DNAME=3D'"dp_cmp"' -D__KBUILD_MODNAME=3Ddp_cmp -c -o arch/mips/math-emu/dp_=
cmp.o arch/mips/math-emu/dp_cmp.c
--
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,arch/mips/math-emu/.dp_tint.o.d -no=
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
s -O2 -fno-stack-protector -pg -fstrict-flex-arrays=3D3 -fms-extensions -fn=
o-strict-overflow -fno-stack-check -fno-builtin-wcslen -Wall -Wextra -Wunde=
f -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dr=
eturn-type -Werror=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs =
-Wno-frame-address -Wno-address-of-packed-member -Wmissing-declarations -Wm=
issing-prototypes -Wno-gnu -Wno-microsoft-anon-tag -Wno-format-overflow-non=
-kprintf -Wno-format-truncation-non-kprintf -Wno-default-const-init-unsafe =
-Wno-pointer-sign -Wcast-function-type -Wno-unterminated-string-initializat=
ion -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Dincompatible-point=
er-types -Wenum-conversion -Wunused -Wmissing-format-attribute -Wmissing-in=
clude-dirs -Wunused-const-variable -Wno-missing-field-initializers -Wno-typ=
e-limits -Wno-shift-negative-value -Wno-enum-enum-conversion -Wno-sign-comp=
are -Wno-unused-parameter -DRANDSTRUCT -frandomize-layout-seed-file=3D./scr=
ipts/basic/randstruct.seed -fno-crash-diagnostics -Wno-error=3Dreturn-type =
-Wreturn-type -funsigned-char -Wundef -falign-functions=3D64 -Iarch/mips/ma=
th-emu -Iarch/mips/math-emu -DKBUILD_MODFILE=3D\"arch/mips/math-emu/dp_tint=
\" -DKBUILD_BASENAME=3D\"dp_tint\" -DKBUILD_MODNAME=3D\"dp_tint\" -D__KBUIL=
D_MODNAME=3Ddp_tint -c -o arch/mips/math-emu/dp_tint.o arch/mips/math-emu/d=
p_tint.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'arch/mips/math-emu/dp=
_tint.c'.
   4.	Running pass 'Branch Probability Basic Block Placement' on function '=
@ieee754dp_tint'
    #0 0x0000561030d2ef3b llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-23+0x414df3b)
    #1 0x0000561030d2cb04 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
23+0x414bb04)
    #2 0x0000561030c60c20 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007fcaa9ca7df0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x00005610302ccbef llvm::TailDuplicator::shouldTailDuplicate(bool, l=
lvm::MachineBasicBlock&) (.part.0) TailDuplicator.cpp:0:0
    #5 0x000056102ffde534 (anonymous namespace)::MachineBlockPlacement::bui=
ldCFGChains() MachineBlockPlacement.cpp:0:0
    #6 0x000056102ffe2e2d (anonymous namespace)::MachineBlockPlacement::run=
(llvm::MachineFunction&) MachineBlockPlacement.cpp:0:0
    #7 0x000056102ffe4031 (anonymous namespace)::MachineBlockPlacementLegac=
y::runOnMachineFunction(llvm::MachineFunction&) (.part.0) MachineBlockPlace=
ment.cpp:0:0
    #8 0x0000561030031a28 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-23+0x3450a28)
    #9 0x0000561030608229 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-23+0x3a27229)
   #10 0x00005610306083cc llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-23+0x3a273cc)
   #11 0x0000561030607638 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-23+0x3a26638)
   #12 0x000056103112be21 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-23+0x454ae21)
   #13 0x000056103176f1c7 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-23+0x4b8e1c7)
   #14 0x0000561033150a1c clang::ParseAST(clang::Sema&, bool, bool) (clang-=
23+0x656fa1c)
   #15 0x0000561031ac693a clang::FrontendAction::Execute() (clang-23+0x4ee5=
93a)
   #16 0x0000561031a41176 clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-23+0x4e60176)
   #17 0x0000561031baf727 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-23+0x4fce727)
   #18 0x000056102db26c95 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-23+0xf45c95)
   #19 0x000056102db1e9a3 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #20 0x000056102db1e9e3 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #21 0x00005610317e0849 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #22 0x0000561030c60f83 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-23+0x407ff83)
   #23 0x00005610317e0f74 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #24 0x00005610317a01a8 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-23+0x4bbf1a8)
   #25 0x00005610317a1102 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-23+0x4bc0102)
   #26 0x00005610317b1e4c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-23+0x4bd0e4c)
   #27 0x000056102db2364f clang_main(int, char**, llvm::ToolContext const&)=
 (clang-23+0xf4264f)
   #28 0x000056102d9bbbc9 main (clang-23+0xddabc9)
   #29 0x00007fcaa9c91ca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #30 0x00007fcaa9c91d65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #31 0x000056102db1e3e1 _start (clang-23+0xf3d3e1)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 4182345 Segmentation fault      clang -Wp,-MMD,arch/m=
ips/math-emu/.dp_tint.o.d -nostdinc -Iarch/mips/include -I./arch/mips/inclu=
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
fno-delete-null-pointer-checks -O2 -fno-stack-protector -pg -fstrict-flex-a=
rrays=3D3 -fms-extensions -fno-strict-overflow -fno-stack-check -fno-builti=
n-wcslen -Wall -Wextra -Wundef -Werror=3Dimplicit-function-declaration -Wer=
ror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-f=
ormat-security -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-mem=
ber -Wmissing-declarations -Wmissing-prototypes -Wno-gnu -Wno-microsoft-ano=
n-tag -Wno-format-overflow-non-kprintf -Wno-format-truncation-non-kprintf -=
Wno-default-const-init-unsafe -Wno-pointer-sign -Wcast-function-type -Wno-u=
nterminated-string-initialization -Wimplicit-fallthrough -Werror=3Ddate-tim=
e -Werror=3Dincompatible-pointer-types -Wenum-conversion -Wunused -Wmissing=
-format-attribute -Wmissing-include-dirs -Wunused-const-variable -Wno-missi=
ng-field-initializers -Wno-type-limits -Wno-shift-negative-value -Wno-enum-=
enum-conversion -Wno-sign-compare -Wno-unused-parameter -DRANDSTRUCT -frand=
omize-layout-seed-file=3D./scripts/basic/randstruct.seed -fno-crash-diagnos=
tics -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -falign=
-functions=3D64 -Iarch/mips/math-emu -Iarch/mips/math-emu -DKBUILD_MODFILE=
=3D'"arch/mips/math-emu/dp_tint"' -DKBUILD_BASENAME=3D'"dp_tint"' -DKBUILD_=
MODNAME=3D'"dp_tint"' -D__KBUILD_MODNAME=3Ddp_tint -c -o arch/mips/math-emu=
/dp_tint.o arch/mips/math-emu/dp_tint.c
--
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,fs/ext4/.extents_status.o.d -nostdi=
nc -Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I./includ=
e -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/u=
api -I./include/generated/uapi -include include/linux/compiler-version.h -i=
nclude include/linux/kconfig.h -include include/linux/compiler_types.h -D__=
KERNEL__ --target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknown-warn=
ing-option -Werror=3Dignored-optimization-argument -Werror=3Doption-ignored=
 -Werror=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xffffffff=
88002000 -DLINKER_LOAD_ADDRESS=3D0x88002000 -DDATAOFFSET=3D0 -fmacro-prefix=
-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -funsign=
ed-char -fno-common -fno-PIE -fno-strict-aliasing -mno-check-zero-division =
-mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-float =
-ffreestanding -EB -fno-stack-check -march=3Dmips3 -Wa,--trap -DTOOLCHAIN_S=
UPPORTS_VIRT -Iarch/mips/include/asm/mach-ip22 -Iarch/mips/include/asm/mach=
-generic -fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks -O=
2 -fno-stack-protector -pg -fstrict-flex-arrays=3D3 -fms-extensions -fno-st=
rict-overflow -fno-stack-check -fno-builtin-wcslen -Wall -Wextra -Wundef -W=
error=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dretu=
rn-type -Werror=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -Wn=
o-frame-address -Wno-address-of-packed-member -Wmissing-declarations -Wmiss=
ing-prototypes -Wno-gnu -Wno-microsoft-anon-tag -Wno-format-overflow-non-kp=
rintf -Wno-format-truncation-non-kprintf -Wno-default-const-init-unsafe -Wn=
o-pointer-sign -Wcast-function-type -Wno-unterminated-string-initialization=
 -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Dincompatible-pointer-=
types -Wenum-conversion -Wunused -Wmissing-format-attribute -Wmissing-inclu=
de-dirs -Wunused-const-variable -Wno-missing-field-initializers -Wno-type-l=
imits -Wno-shift-negative-value -Wno-enum-enum-conversion -Wno-sign-compare=
 -Wno-unused-parameter -DRANDSTRUCT -frandomize-layout-seed-file=3D./script=
s/basic/randstruct.seed -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wr=
eturn-type -funsigned-char -Wundef -falign-functions=3D64 -Ifs/ext4 -Ifs/ex=
t4 -DKBUILD_MODFILE=3D\"fs/ext4/ext4\" -DKBUILD_BASENAME=3D\"extents_status=
\" -DKBUILD_MODNAME=3D\"ext4\" -D__KBUILD_MODNAME=3Dext4 -c -o fs/ext4/exte=
nts_status.o fs/ext4/extents_status.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'fs/ext4/extents_statu=
s.c'.
   4.	Running pass 'Branch Probability Basic Block Placement' on function '=
@ext4_es_insert_extent'
    #0 0x000055ced5bd4f3b llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-23+0x414df3b)
    #1 0x000055ced5bd2b04 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
23+0x414bb04)
    #2 0x000055ced5b06c20 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007f33078b4df0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x000055ced5172bef llvm::TailDuplicator::shouldTailDuplicate(bool, l=
lvm::MachineBasicBlock&) (.part.0) TailDuplicator.cpp:0:0
    #5 0x000055ced4e7f690 (anonymous namespace)::MachineBlockPlacement::bui=
ldChain(llvm::MachineBasicBlock const*, (anonymous namespace)::BlockChain&,=
 llvm::SmallSetVector<llvm::MachineBasicBlock const*, 16u>*) MachineBlockPl=
acement.cpp:0:0
    #6 0x000055ced4e80994 (anonymous namespace)::MachineBlockPlacement::bui=
ldLoopChains(llvm::MachineLoop const&) MachineBlockPlacement.cpp:0:0
    #7 0x000055ced4e83660 (anonymous namespace)::MachineBlockPlacement::bui=
ldCFGChains() MachineBlockPlacement.cpp:0:0
    #8 0x000055ced4e88e2d (anonymous namespace)::MachineBlockPlacement::run=
(llvm::MachineFunction&) MachineBlockPlacement.cpp:0:0
    #9 0x000055ced4e8a031 (anonymous namespace)::MachineBlockPlacementLegac=
y::runOnMachineFunction(llvm::MachineFunction&) (.part.0) MachineBlockPlace=
ment.cpp:0:0
   #10 0x000055ced4ed7a28 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-23+0x3450a28)
   #11 0x000055ced54ae229 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-23+0x3a27229)
   #12 0x000055ced54ae3cc llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-23+0x3a273cc)
   #13 0x000055ced54ad638 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-23+0x3a26638)
   #14 0x000055ced5fd1e21 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-23+0x454ae21)
   #15 0x000055ced66151c7 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-23+0x4b8e1c7)
   #16 0x000055ced7ff6a1c clang::ParseAST(clang::Sema&, bool, bool) (clang-=
23+0x656fa1c)
   #17 0x000055ced696c93a clang::FrontendAction::Execute() (clang-23+0x4ee5=
93a)
   #18 0x000055ced68e7176 clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-23+0x4e60176)
   #19 0x000055ced6a55727 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-23+0x4fce727)
   #20 0x000055ced29ccc95 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-23+0xf45c95)
   #21 0x000055ced29c49a3 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #22 0x000055ced29c49e3 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #23 0x000055ced6686849 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #24 0x000055ced5b06f83 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-23+0x407ff83)
   #25 0x000055ced6686f74 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #26 0x000055ced66461a8 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-23+0x4bbf1a8)
   #27 0x000055ced6647102 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-23+0x4bc0102)
   #28 0x000055ced6657e4c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-23+0x4bd0e4c)
   #29 0x000055ced29c964f clang_main(int, char**, llvm::ToolContext const&)=
 (clang-23+0xf4264f)
   #30 0x000055ced2861bc9 main (clang-23+0xddabc9)
   #31 0x00007f330789eca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #32 0x00007f330789ed65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #33 0x000055ced29c43e1 _start (clang-23+0xf3d3e1)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1:  6783 Segmentation fault      clang -Wp,-MMD,fs/ext4/=
.extents_status.o.d -nostdinc -Iarch/mips/include -I./arch/mips/include/gen=
erated -Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips/include=
/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/=
linux/compiler-version.h -include include/linux/kconfig.h -include include/=
linux/compiler_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -fintegrate=
d-as -Werror=3Dunknown-warning-option -Werror=3Dignored-optimization-argume=
nt -Werror=3Doption-ignored -Werror=3Dunused-command-line-argument -DVMLINU=
X_LOAD_ADDRESS=3D0xffffffff88002000 -DLINKER_LOAD_ADDRESS=3D0x88002000 -DDA=
TAOFFSET=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dg=
nu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasin=
g -mno-check-zero-division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -ms=
oft-float -Wa,-msoft-float -ffreestanding -EB -fno-stack-check -march=3Dmip=
s3 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-ip22 -=
Iarch/mips/include/asm/mach-generic -fno-asynchronous-unwind-tables -fno-de=
lete-null-pointer-checks -O2 -fno-stack-protector -pg -fstrict-flex-arrays=
=3D3 -fms-extensions -fno-strict-overflow -fno-stack-check -fno-builtin-wcs=
len -Wall -Wextra -Wundef -Werror=3Dimplicit-function-declaration -Werror=
=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-form=
at-security -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member=
 -Wmissing-declarations -Wmissing-prototypes -Wno-gnu -Wno-microsoft-anon-t=
ag -Wno-format-overflow-non-kprintf -Wno-format-truncation-non-kprintf -Wno=
-default-const-init-unsafe -Wno-pointer-sign -Wcast-function-type -Wno-unte=
rminated-string-initialization -Wimplicit-fallthrough -Werror=3Ddate-time -=
Werror=3Dincompatible-pointer-types -Wenum-conversion -Wunused -Wmissing-fo=
rmat-attribute -Wmissing-include-dirs -Wunused-const-variable -Wno-missing-=
field-initializers -Wno-type-limits -Wno-shift-negative-value -Wno-enum-enu=
m-conversion -Wno-sign-compare -Wno-unused-parameter -DRANDSTRUCT -frandomi=
ze-layout-seed-file=3D./scripts/basic/randstruct.seed -fno-crash-diagnostic=
s -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -falign-fu=
nctions=3D64 -Ifs/ext4 -Ifs/ext4 -DKBUILD_MODFILE=3D'"fs/ext4/ext4"' -DKBUI=
LD_BASENAME=3D'"extents_status"' -DKBUILD_MODNAME=3D'"ext4"' -D__KBUILD_MOD=
NAME=3Dext4 -c -o fs/ext4/extents_status.o fs/ext4/extents_status.c
--
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,kernel/bpf/.offload.o.d -nostdinc -=
Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I./include -I=
arch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi =
-I./include/generated/uapi -include include/linux/compiler-version.h -inclu=
de include/linux/kconfig.h -include include/linux/compiler_types.h -D__KERN=
EL__ --target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknown-warning-=
option -Werror=3Dignored-optimization-argument -Werror=3Doption-ignored -We=
rror=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xffffffff8800=
2000 -DLINKER_LOAD_ADDRESS=3D0x88002000 -DDATAOFFSET=3D0 -fmacro-prefix-map=
=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -funsigned-c=
har -fno-common -fno-PIE -fno-strict-aliasing -mno-check-zero-division -mab=
i=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-float -ffr=
eestanding -EB -fno-stack-check -march=3Dmips3 -Wa,--trap -DTOOLCHAIN_SUPPO=
RTS_VIRT -Iarch/mips/include/asm/mach-ip22 -Iarch/mips/include/asm/mach-gen=
eric -fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks -O2 -f=
no-stack-protector -pg -fstrict-flex-arrays=3D3 -fms-extensions -fno-strict=
-overflow -fno-stack-check -fno-builtin-wcslen -Wall -Wextra -Wundef -Werro=
r=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-t=
ype -Werror=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -Wno-fr=
ame-address -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-=
prototypes -Wno-gnu -Wno-microsoft-anon-tag -Wno-format-overflow-non-kprint=
f -Wno-format-truncation-non-kprintf -Wno-default-const-init-unsafe -Wno-po=
inter-sign -Wcast-function-type -Wno-unterminated-string-initialization -Wi=
mplicit-fallthrough -Werror=3Ddate-time -Werror=3Dincompatible-pointer-type=
s -Wenum-conversion -Wunused -Wmissing-format-attribute -Wmissing-include-d=
irs -Wunused-const-variable -Wno-missing-field-initializers -Wno-type-limit=
s -Wno-shift-negative-value -Wno-enum-enum-conversion -Wno-sign-compare -Wn=
o-unused-parameter -DRANDSTRUCT -frandomize-layout-seed-file=3D./scripts/ba=
sic/randstruct.seed -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wretur=
n-type -funsigned-char -Wundef -falign-functions=3D64 -Ikernel/bpf -Ikernel=
/bpf -DKBUILD_MODFILE=3D\"kernel/bpf/offload\" -DKBUILD_BASENAME=3D\"offloa=
d\" -DKBUILD_MODNAME=3D\"offload\" -D__KBUILD_MODNAME=3Doffload -c -o kerne=
l/bpf/offload.o kernel/bpf/offload.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'kernel/bpf/offload.c'.
   4.	Running pass 'Branch Probability Basic Block Placement' on function '=
@bpf_prog_dev_bound_init'
    #0 0x0000556ece817f3b llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-23+0x414df3b)
    #1 0x0000556ece815b04 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
23+0x414bb04)
    #2 0x0000556ece749c20 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007f05b15ccdf0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x0000556ecddb5bef llvm::TailDuplicator::shouldTailDuplicate(bool, l=
lvm::MachineBasicBlock&) (.part.0) TailDuplicator.cpp:0:0
    #5 0x0000556ecdac7534 (anonymous namespace)::MachineBlockPlacement::bui=
ldCFGChains() MachineBlockPlacement.cpp:0:0
    #6 0x0000556ecdacbe2d (anonymous namespace)::MachineBlockPlacement::run=
(llvm::MachineFunction&) MachineBlockPlacement.cpp:0:0
    #7 0x0000556ecdacd031 (anonymous namespace)::MachineBlockPlacementLegac=
y::runOnMachineFunction(llvm::MachineFunction&) (.part.0) MachineBlockPlace=
ment.cpp:0:0
    #8 0x0000556ecdb1aa28 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-23+0x3450a28)
    #9 0x0000556ece0f1229 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-23+0x3a27229)
   #10 0x0000556ece0f13cc llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-23+0x3a273cc)
   #11 0x0000556ece0f0638 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-23+0x3a26638)
   #12 0x0000556ecec14e21 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-23+0x454ae21)
   #13 0x0000556ecf2581c7 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-23+0x4b8e1c7)
   #14 0x0000556ed0c39a1c clang::ParseAST(clang::Sema&, bool, bool) (clang-=
23+0x656fa1c)
   #15 0x0000556ecf5af93a clang::FrontendAction::Execute() (clang-23+0x4ee5=
93a)
   #16 0x0000556ecf52a176 clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-23+0x4e60176)
   #17 0x0000556ecf698727 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-23+0x4fce727)
   #18 0x0000556ecb60fc95 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-23+0xf45c95)
   #19 0x0000556ecb6079a3 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #20 0x0000556ecb6079e3 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #21 0x0000556ecf2c9849 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #22 0x0000556ece749f83 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-23+0x407ff83)
   #23 0x0000556ecf2c9f74 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #24 0x0000556ecf2891a8 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-23+0x4bbf1a8)
   #25 0x0000556ecf28a102 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-23+0x4bc0102)
   #26 0x0000556ecf29ae4c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-23+0x4bd0e4c)
   #27 0x0000556ecb60c64f clang_main(int, char**, llvm::ToolContext const&)=
 (clang-23+0xf4264f)
   #28 0x0000556ecb4a4bc9 main (clang-23+0xddabc9)
   #29 0x00007f05b15b6ca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #30 0x00007f05b15b6d65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #31 0x0000556ecb6073e1 _start (clang-23+0xf3d3e1)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 18105 Segmentation fault      clang -Wp,-MMD,kernel/b=
pf/.offload.o.d -nostdinc -Iarch/mips/include -I./arch/mips/include/generat=
ed -Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips/include/gen=
erated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linu=
x/compiler-version.h -include include/linux/kconfig.h -include include/linu=
x/compiler_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -fintegrated-as=
 -Werror=3Dunknown-warning-option -Werror=3Dignored-optimization-argument -=
Werror=3Doption-ignored -Werror=3Dunused-command-line-argument -DVMLINUX_LO=
AD_ADDRESS=3D0xffffffff88002000 -DLINKER_LOAD_ADDRESS=3D0x88002000 -DDATAOF=
FSET=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11=
 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -m=
no-check-zero-division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-=
float -Wa,-msoft-float -ffreestanding -EB -fno-stack-check -march=3Dmips3 -=
Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-ip22 -Iarc=
h/mips/include/asm/mach-generic -fno-asynchronous-unwind-tables -fno-delete=
-null-pointer-checks -O2 -fno-stack-protector -pg -fstrict-flex-arrays=3D3 =
-fms-extensions -fno-strict-overflow -fno-stack-check -fno-builtin-wcslen -=
Wall -Wextra -Wundef -Werror=3Dimplicit-function-declaration -Werror=3Dimpl=
icit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-secu=
rity -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmiss=
ing-declarations -Wmissing-prototypes -Wno-gnu -Wno-microsoft-anon-tag -Wno=
-format-overflow-non-kprintf -Wno-format-truncation-non-kprintf -Wno-defaul=
t-const-init-unsafe -Wno-pointer-sign -Wcast-function-type -Wno-unterminate=
d-string-initialization -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=
=3Dincompatible-pointer-types -Wenum-conversion -Wunused -Wmissing-format-a=
ttribute -Wmissing-include-dirs -Wunused-const-variable -Wno-missing-field-=
initializers -Wno-type-limits -Wno-shift-negative-value -Wno-enum-enum-conv=
ersion -Wno-sign-compare -Wno-unused-parameter -DRANDSTRUCT -frandomize-lay=
out-seed-file=3D./scripts/basic/randstruct.seed -fno-crash-diagnostics -Wno=
-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -falign-function=
s=3D64 -Ikernel/bpf -Ikernel/bpf -DKBUILD_MODFILE=3D'"kernel/bpf/offload"' =
-DKBUILD_BASENAME=3D'"offload"' -DKBUILD_MODNAME=3D'"offload"' -D__KBUILD_M=
ODNAME=3Doffload -c -o kernel/bpf/offload.o kernel/bpf/offload.c

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=3Dn] && CAN [=3Dy]
   Selected by [y]:
   - CAN [=3Dy] && NET [=3Dy]

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
