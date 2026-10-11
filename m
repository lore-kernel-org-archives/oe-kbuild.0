Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C3F329E44
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Oct 2026 03:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791690714; cv=none; b=RIS+iDPwpyflhrKUzmZ2JaRW88ZD215j6JirsFiq4wlaLFwUxipy3mKr3izvb/W56ZmmpxjO5lqQUixvTIC91iO/sGdnZBuy72iCYeKo6HEKKWGer2FmAtw138xid4bgvtKGEm4MamNNmONBEhPzNplTbHRY27inUCI1v7XEgRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791690714; c=relaxed/simple;
	bh=vCCmh2gH0vUbaJTrnW95SWmYhaZfUr8OCvsY6fB0dW0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Vo7NIVK85VbKgGDXHBNQ5ohNyUbeouP9G5gyfGHsT0F4fQncMzKpdClu1OmoTtZ4DbSuMl+bZnf/6r3qvxyOLuQXXidvaBMJ/EhMgI4dzZvinTPvELcx7pELZlK1bgJSJftSX+tiTTftzQB1nFj3JI1YXZ2uXoPHHru2nJTzims=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PE78iKr8; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PE78iKr8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791690712; x=1823226712;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vCCmh2gH0vUbaJTrnW95SWmYhaZfUr8OCvsY6fB0dW0=;
  b=PE78iKr8kMtOVBexY7tglB7WMJE3UwJkAeiGad2Aj832015X2k94js2t
   j8pRtmtM1dhQ/qDd+PvzKMJu8q8CRluR1taUEdlpdm3iUTN1+A8eDXcRu
   5LMI50hTrHoSMEgukDXbyrappIy9ZXc4jUo/n3pA54TpvO10v7Z7LXHT4
   4TC+zYQJ3D9AnAwcHACfS5ToRgBJb8GNsXafdG9bMtsBjGHzazgmrL2DZ
   9puYkGXGSJnWfjHM/szcfKkLuMgP4yUGAigrlc5MAmGg7IkJQ7J2QEY4N
   2KXQxOgTm0SCkWEfQxKTJOkInP/EvKfOSRJfFgOTXgOoW+TqupFviGkIY
   g==;
X-CSE-ConnectionGUID: CbcznNtQQOyRNceDzWbGKw==
X-CSE-MsgGUID: vxCeflqqTxeO6rksYt49Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11931"; a="445955"
X-IronPort-AV: E=Sophos;i="6.27,151,1787036400"; 
   d="scan'208";a="445955"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 20:51:52 -0700
X-CSE-ConnectionGUID: Tj4lnwe8RVmOEOu0yDnGzA==
X-CSE-MsgGUID: aiNWlKwdTJqDWWp1LnfZfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,151,1787036400"; 
   d="scan'208";a="595315"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 10 Oct 2026 20:51:50 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFkbD-000000009Od-43zT;
	Sun, 11 Oct 2026 03:51:47 +0000
Date: Sun, 11 Oct 2026 05:50:50 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: /bin/bash: line 1: 1611721 Segmentation fault      clang
 -Wp,-MMD,drivers/hwmon/.ltc2992.o.d -nostdinc -Iarch/mips/include
 -I./arch/mips/include/generated -Iinclude -I./include
 -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi
 -...
Message-ID: <202610110541.QfROE72r-lkp@intel.com>
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
TO: Sanman Pradhan <psanman@juniper.net>
CC: Guenter Roeck <linux@roeck-us.net>

Hi Sanman,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a5ebb76233b79db01e82e061173cb73c6d2b5c6b
commit: d6cc7c99bf1f73eda7d565d224d791d16239bb41 hwmon: (ltc2992) Clamp thr=
eshold writes to hardware range
date:   5 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 5 months ago
config: mips-randconfig-r2100-20261011 (https://download.01.org/0day-ci/arc=
hive/20261011/202610110541.QfROE72r-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 762=
316e293d1db4f495bdbb545c31d588a1a2d62)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261011/202610110541.QfROE72r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: d6cc7c99bf1f ("hwmon: (ltc2992) Clamp threshold writes to hardware=
 range")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610110541.QfROE72r-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
All errors (new ones prefixed by >>):

   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace and dumped files.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,drivers/hwmon/.ltc2992.o.d -nostdin=
c -Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I./include=
 -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/ua=
pi -I./include/generated/uapi -include include/linux/compiler-version.h -in=
clude include/linux/kconfig.h -include include/linux/compiler_types.h -D__K=
ERNEL__ --target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknown-warni=
ng-option -Werror=3Dignored-optimization-argument -Werror=3Doption-ignored =
-Werror=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xffffffff8=
4000000 -DLINKER_LOAD_ADDRESS=3D0x84000000 -DDATAOFFSET=3D0 -fmacro-prefix-=
map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -fshort-wchar -funsigned-char -fno-c=
ommon -fno-PIE -fno-strict-aliasing -std=3Dgnu11 -fms-anonymous-structs -Wn=
o-gnu -Wno-microsoft-anon-tag -mno-check-zero-division -mabi=3D32 -G 0 -mno=
-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-float -ffreestanding -EB -=
fno-stack-check -march=3Dmips3 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/=
mips/include/asm/mach-n64 -Iarch/mips/include/asm/mach-generic -fno-asynchr=
onous-unwind-tables -fno-delete-null-pointer-checks -Os -fstack-protector-s=
trong -ftrivial-auto-var-init=3Dzero -fexperimental-late-parse-attributes -=
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
num-enum-conversion -Wno-sign-compare -Wno-unused-parameter -gsplit-dwarf -=
g -DRANDSTRUCT -frandomize-layout-seed-file=3D./scripts/basic/randstruct.se=
ed -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wreturn-type -funsigned=
-char -Wundef -falign-functions=3D64 -Idrivers/hwmon -Idrivers/hwmon -DMODU=
LE -mlong-calls -DKBUILD_BASENAME=3D\"ltc2992\" -DKBUILD_MODNAME=3D\"ltc299=
2\" -D__KBUILD_MODNAME=3Dltc2992 -c -o drivers/hwmon/ltc2992.o drivers/hwmo=
n/ltc2992.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'drivers/hwmon/ltc2992=
.c'.
   4.	Running pass 'Shrink Wrapping analysis' on function '@ltc2992_write'
    #0 0x00005601a7e370ca llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-24+0x3a560ca)
    #1 0x00005601a7e34ca4 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
24+0x3a53ca4)
    #2 0x00005601a7d65680 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007f48574c3df0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x00005601a73cde91 (anonymous namespace)::ShrinkWrapImpl::useOrDefCS=
ROrFI(llvm::MachineInstr const&, llvm::RegScavenger*, bool) const ShrinkWra=
p.cpp:0:0
    #5 0x00005601a73d119c (anonymous namespace)::ShrinkWrapImpl::run(llvm::=
MachineFunction&) (.constprop.0) ShrinkWrap.cpp:0:0
    #6 0x00005601a73d2e3d (anonymous namespace)::ShrinkWrapLegacy::runOnMac=
hineFunction(llvm::MachineFunction&) (.part.0) ShrinkWrap.cpp:0:0
    #7 0x00005601a71bf8a3 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-24+0x2dde8a3)
    #8 0x00005601a7728301 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-24+0x3347301)
    #9 0x00005601a772876c llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-24+0x334776c)
   #10 0x00005601a772930e (anonymous namespace)::MPPassManager::runOnModule=
(llvm::Module&) LegacyPassManager.cpp:0:0
   #11 0x00005601a7729c3c llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-24+0x3348c3c)
   #12 0x00005601a8f7df22 runCodeGenPipelineLegacy(llvm::TargetMachine&, ll=
vm::Module&, llvm::raw_pwrite_stream&, std::unique_ptr<llvm::ToolOutputFile=
, std::default_delete<llvm::ToolOutputFile>>&, llvm::CodeGenFileType, bool,=
 bool) RunCodeGen.cpp:0:0
   #13 0x00005601a8f7dfa9 llvm::runCodeGenPipeline(llvm::TargetMachine&, ll=
vm::Module&, llvm::raw_pwrite_stream&, std::unique_ptr<llvm::ToolOutputFile=
, std::default_delete<llvm::ToolOutputFile>>&, llvm::CodeGenFileType, bool,=
 bool, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>) (clang-24+0x4b9cfa9)
   #14 0x00005601a81fdf82 (anonymous namespace)::EmitAssemblyHelper::emitAs=
sembly(clang::BackendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::=
default_delete<llvm::raw_pwrite_stream>>, clang::BackendConsumer*) BackendU=
til.cpp:0:0
   #15 0x00005601a81fe4de clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::Module*, clang::BackendAction, llvm::Intrus=
iveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm::raw_pwrite_strea=
m, std::default_delete<llvm::raw_pwrite_stream>>, clang::BackendConsumer*) =
(clang-24+0x3e1d4de)
   #16 0x00005601a882195b clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-24+0x444095b)
   #17 0x00005601aa2c33cc clang::ParseAST(clang::Sema&, bool, bool) (clang-=
24+0x5ee23cc)
   #18 0x00005601a8b73bde clang::FrontendAction::Execute() (clang-24+0x4792=
bde)
   #19 0x00005601a8b0252e clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-24+0x472152e)
   #20 0x00005601a8c3d217 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-24+0x485c217)
   #21 0x00005601a4ca0cd8 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-24+0x8bfcd8)
   #22 0x00005601a4c989c3 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #23 0x00005601a4c98a07 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #24 0x00005601a889e889 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #25 0x00005601a7d659b3 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-24+0x39849b3)
   #26 0x00005601a889fe0c clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #27 0x00005601a885dea8 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-24+0x447cea8)
   #28 0x00005601a8862612 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-24+0x4481612)
   #29 0x00005601a88727dc clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-24+0x44917dc)
   #30 0x00005601a4c9d672 clang_main(int, char**, llvm::ToolContext const&)=
 (clang-24+0x8bc672)
   #31 0x00005601a4bf49e2 main (clang-24+0x8139e2)
   #32 0x00007f48574adca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #33 0x00007f48574add65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #34 0x00005601a4c98421 _start (clang-24+0x8b7421)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 1611721 Segmentation fault      clang -Wp,-MMD,driver=
s/hwmon/.ltc2992.o.d -nostdinc -Iarch/mips/include -I./arch/mips/include/ge=
nerated -Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips/includ=
e/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include include=
/linux/compiler-version.h -include include/linux/kconfig.h -include include=
/linux/compiler_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -fintegrat=
ed-as -Werror=3Dunknown-warning-option -Werror=3Dignored-optimization-argum=
ent -Werror=3Doption-ignored -Werror=3Dunused-command-line-argument -DVMLIN=
UX_LOAD_ADDRESS=3D0xffffffff84000000 -DLINKER_LOAD_ADDRESS=3D0x84000000 -DD=
ATAOFFSET=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -fshort=
-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -std=3Dgnu=
11 -fms-anonymous-structs -Wno-gnu -Wno-microsoft-anon-tag -mno-check-zero-=
division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-mso=
ft-float -ffreestanding -EB -fno-stack-check -march=3Dmips3 -Wa,--trap -DTO=
OLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-n64 -Iarch/mips/include/=
asm/mach-generic -fno-asynchronous-unwind-tables -fno-delete-null-pointer-c=
hecks -Os -fstack-protector-strong -ftrivial-auto-var-init=3Dzero -fexperim=
ental-late-parse-attributes -fdiagnostics-show-inlining-chain -pg -fstrict-=
flex-arrays=3D3 -fno-strict-overflow -fno-stack-check -fno-builtin-wcslen -=
Wall -Wextra -Wundef -Werror=3Dimplicit-function-declaration -Werror=3Dimpl=
icit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-secu=
rity -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmiss=
ing-declarations -Wmissing-prototypes -Wno-format-overflow-non-kprintf -Wno=
-format-truncation-non-kprintf -Wno-default-const-init-unsafe -Wno-type-lim=
its -Wno-pointer-sign -Wcast-function-type -Wno-unterminated-string-initial=
ization -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Dincompatible-p=
ointer-types -Wenum-conversion -Wunused -Wmissing-format-attribute -Wmissin=
g-include-dirs -Wunused-const-variable -Wno-missing-field-initializers -Wno=
-shift-negative-value -Wno-enum-enum-conversion -Wno-sign-compare -Wno-unus=
ed-parameter -gsplit-dwarf -g -DRANDSTRUCT -frandomize-layout-seed-file=3D.=
/scripts/basic/randstruct.seed -fno-crash-diagnostics -Wno-error=3Dreturn-t=
ype -Wreturn-type -funsigned-char -Wundef -falign-functions=3D64 -Idrivers/=
hwmon -Idrivers/hwmon -DMODULE -mlong-calls -DKBUILD_BASENAME=3D'"ltc2992"'=
 -DKBUILD_MODNAME=3D'"ltc2992"' -D__KBUILD_MODNAME=3Dltc2992 -c -o drivers/=
hwmon/ltc2992.o drivers/hwmon/ltc2992.c

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
