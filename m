Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB342980A8
	for <oe-kbuild@lists.linux.dev>; Tue, 19 May 2026 02:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779156797; cv=none; b=aRySZqMvEkunTOifUj6qDWDgZCVPbvyNvmpvkoTjcMn8T3Oc4v6JiDuOPW5nZWjg16IuAtLEgEJtzAANIeSvVs7iRPMY7KG5/yFnT2wy0HivXJQ3ypOglm3XPZycEBIceAcPLrfbqfBUCmlDBhsYhBdYDLtsTMmxDFS4uWIKF2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779156797; c=relaxed/simple;
	bh=APC84dTD3ZTWIHGKa8/sGDal44yzixSnc5YXilGUxVM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IsSTpOt/29cl2Qio1yY2CRXfzUVxelXtbsXDzVaq/jqYm0ppbH7gIIVKR2f8EIA0e1wDv8Kfrfi8S+avZlaMiDur/0AEfFPwn4FMkiGD5g+SnQYZiDc499JrIb9lzn1LF8vPmKQCE7cSPZUIvDuaR/rYYCeA72yksNpOccP+tLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LgoHroFw; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LgoHroFw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779156794; x=1810692794;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=APC84dTD3ZTWIHGKa8/sGDal44yzixSnc5YXilGUxVM=;
  b=LgoHroFwZR4OhpAu37HX/t7tC0kRBPCmATc2vN9oq/2Ztzv8tJFHAORb
   LuSm4ZAJ5kohsUMZvJ6Ff2HFdI6KQZqhLgrlfcno3jqD01BOwUuuoJftY
   J+4EV4brYOBZzhfqeyGuzWZb21CztkJ6yd0J9MPxXAsK1gWZBONJrMLDF
   2MHUB8N59mlQTREaaXURFgGTuptIflJ/tvMN0zW3M51vwci2L9OXaLMUg
   +2jLbmQtDxFgRcCVFrvhaji/CDhP2EGxoLCW3hXDGzDc2KR4YD8GFQkca
   +PZNgwhA8QukFuCifZDK+DK9xJr6b139qe+tL4XO2avPvQJ2d/MzYBCm9
   Q==;
X-CSE-ConnectionGUID: cCVBvQy4S5q9hTsqiCpGYA==
X-CSE-MsgGUID: yzKRrlb/QYmFqPEYf8Ib0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="67553778"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="67553778"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 19:13:14 -0700
X-CSE-ConnectionGUID: XZy0ZULUQy+5LQhDh6rOOg==
X-CSE-MsgGUID: /XYu4+XkRqCO4O89IJQO2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="239684811"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 18 May 2026 19:13:13 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP9xG-0000000001F-0d8K;
	Tue, 19 May 2026 02:13:10 +0000
Date: Tue, 19 May 2026 09:39:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:b4/gemini-ethernet-fixes 1/6] /bin/bash:
 line 1: 395854 Segmentation fault      clang
 -Wp,-MMD,arch/mips/math-emu/.dp_sqrt.o.d -nostdinc -Iarch/mips/include
 -I./arch/mips/include/generated -Iinclude -I./include
 -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/ua...
Message-ID: <202605190927.kf0wVvqA-lkp@intel.com>
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
TO: "Andreas Haarmann-Thiemann" <eitschman@nebelreich.de>
CC: Linus Walleij <linusw@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integr=
ator.git b4/gemini-ethernet-fixes
head:   4752b3ec0af4b87d7012b211326771cbf83b6352
commit: 18ae35be3f9ed26f9acff1dd96a9aed026421c5b [1/6] net: ethernet: corti=
na: Drop half-assembled SKB
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: mips-randconfig-r121-20260517 (https://download.01.org/0day-ci/arch=
ive/20260519/202605190927.kf0wVvqA-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5ba=
c06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260519/202605190927.kf0wVvqA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605190927.kf0wVvqA-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
All errors (new ones prefixed by >>):

   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,arch/mips/math-emu/.dp_sqrt.o.d -no=
stdinc -Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I./in=
clude -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclu=
de/uapi -I./include/generated/uapi -include include/linux/compiler-version.=
h -include include/linux/kconfig.h -include include/linux/compiler_types.h =
-D__KERNEL__ --target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknown-=
warning-option -Werror=3Dignored-optimization-argument -Werror=3Doption-ign=
ored -Werror=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xffff=
ffff84000000 -DLINKER_LOAD_ADDRESS=3D0x84000000 -DDATAOFFSET=3D0 -fmacro-pr=
efix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -fshort-wchar -funsigned-char -=
fno-common -fno-PIE -fno-strict-aliasing -std=3Dgnu11 -fms-anonymous-struct=
s -Wno-gnu -Wno-microsoft-anon-tag -mno-check-zero-division -mabi=3D32 -G 0=
 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-float -ffreestanding =
-EB -fno-stack-check -march=3Dmips3 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -I=
arch/mips/include/asm/mach-n64 -Iarch/mips/include/asm/mach-generic -fno-as=
ynchronous-unwind-tables -fno-delete-null-pointer-checks -Os -fstack-protec=
tor -fomit-frame-pointer -ftrivial-auto-var-init=3Dzero -fexperimental-late=
-parse-attributes -fdiagnostics-show-inlining-chain -fstrict-flex-arrays=3D3=
 -fno-strict-overflow -fno-stack-check -fno-builtin-wcslen -Wall -Wextra -W=
undef -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werro=
r=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-security -Wno-trigr=
aphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-declaration=
s -Wmissing-prototypes -Wno-format-overflow-non-kprintf -Wno-format-truncat=
ion-non-kprintf -Wno-default-const-init-unsafe -Wno-type-limits -Wno-pointe=
r-sign -Wcast-function-type -Wno-unterminated-string-initialization -Wimpli=
cit-fallthrough -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -W=
enum-conversion -Wunused -Wmissing-format-attribute -Wmissing-include-dirs =
-Wunused-const-variable -Wno-missing-field-initializers -Wno-shift-negative=
-value -Wno-enum-enum-conversion -Wno-sign-compare -Wno-unused-parameter -f=
no-crash-diagnostics -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char=
 -Wundef -falign-functions=3D64 -Iarch/mips/math-emu -Iarch/mips/math-emu -=
DKBUILD_MODFILE=3D\"arch/mips/math-emu/dp_sqrt\" -DKBUILD_BASENAME=3D\"dp_s=
qrt\" -DKBUILD_MODNAME=3D\"dp_sqrt\" -D__KBUILD_MODNAME=3Ddp_sqrt -c -o arc=
h/mips/math-emu/dp_sqrt.o arch/mips/math-emu/dp_sqrt.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'arch/mips/math-emu/dp=
_sqrt.c'.
   4.	Running pass 'Branch Probability Basic Block Placement' on function '=
@ieee754dp_sqrt'
    #0 0x0000558dbb4c8c1b llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-23+0x413cc1b)
    #1 0x0000558dbb4c67e4 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
23+0x413a7e4)
    #2 0x0000558dbb3f96a0 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007f23a70d6df0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x0000558dbaa8052f llvm::TailDuplicator::shouldTailDuplicate(bool, l=
lvm::MachineBasicBlock&) (.part.0) TailDuplicator.cpp:0:0
    #5 0x0000558dba79b5a9 (anonymous namespace)::MachineBlockPlacement::bui=
ldCFGChains() MachineBlockPlacement.cpp:0:0
    #6 0x0000558dba7a06ad (anonymous namespace)::MachineBlockPlacement::run=
(llvm::MachineFunction&) MachineBlockPlacement.cpp:0:0
    #7 0x0000558dba7a18b1 (anonymous namespace)::MachineBlockPlacementLegac=
y::runOnMachineFunction(llvm::MachineFunction&) (.part.0) MachineBlockPlace=
ment.cpp:0:0
    #8 0x0000558dba7ef438 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-23+0x3463438)
    #9 0x0000558dbadb6869 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-23+0x3a2a869)
   #10 0x0000558dbadb6a0c llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-23+0x3a2aa0c)
   #11 0x0000558dbadb5c78 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-23+0x3a29c78)
   #12 0x0000558dbb8c4071 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-23+0x4538071)
   #13 0x0000558dbbf096c7 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-23+0x4b7d6c7)
   #14 0x0000558dbd914adc clang::ParseAST(clang::Sema&, bool, bool) (clang-=
23+0x6588adc)
   #15 0x0000558dbc26317a clang::FrontendAction::Execute() (clang-23+0x4ed7=
17a)
   #16 0x0000558dbc1dc3d6 clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-23+0x4e503d6)
   #17 0x0000558dbc34c207 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-23+0x4fc0207)
   #18 0x0000558db82e4a55 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-23+0xf58a55)
   #19 0x0000558db82dc763 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #20 0x0000558db82dc7a3 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #21 0x0000558dbbf7ade9 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #22 0x0000558dbb3f9a03 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-23+0x406da03)
   #23 0x0000558dbbf7b514 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #24 0x0000558dbbf3a668 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-23+0x4bae668)
   #25 0x0000558dbbf3b5c2 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-23+0x4baf5c2)
   #26 0x0000558dbbf4c7bc clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-23+0x4bc07bc)
   #27 0x0000558db82e140f clang_main(int, char**, llvm::ToolContext const&)=
 (clang-23+0xf5540f)
   #28 0x0000558db8177bb9 main (clang-23+0xdebbb9)
   #29 0x00007f23a70c0ca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #30 0x00007f23a70c0d65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #31 0x0000558db82dc1a1 _start (clang-23+0xf501a1)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 395854 Segmentation fault      clang -Wp,-MMD,arch/mi=
ps/math-emu/.dp_sqrt.o.d -nostdinc -Iarch/mips/include -I./arch/mips/includ=
e/generated -Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips/in=
clude/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include inc=
lude/linux/compiler-version.h -include include/linux/kconfig.h -include inc=
lude/linux/compiler_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -finte=
grated-as -Werror=3Dunknown-warning-option -Werror=3Dignored-optimization-a=
rgument -Werror=3Doption-ignored -Werror=3Dunused-command-line-argument -DV=
MLINUX_LOAD_ADDRESS=3D0xffffffff84000000 -DLINKER_LOAD_ADDRESS=3D0x84000000=
 -DDATAOFFSET=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -fs=
hort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -std=
=3Dgnu11 -fms-anonymous-structs -Wno-gnu -Wno-microsoft-anon-tag -mno-check=
-zero-division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -W=
a,-msoft-float -ffreestanding -EB -fno-stack-check -march=3Dmips3 -Wa,--tra=
p -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-n64 -Iarch/mips/in=
clude/asm/mach-generic -fno-asynchronous-unwind-tables -fno-delete-null-poi=
nter-checks -Os -fstack-protector -fomit-frame-pointer -ftrivial-auto-var-i=
nit=3Dzero -fexperimental-late-parse-attributes -fdiagnostics-show-inlining=
-chain -fstrict-flex-arrays=3D3 -fno-strict-overflow -fno-stack-check -fno-=
builtin-wcslen -Wall -Wextra -Wundef -Werror=3Dimplicit-function-declaratio=
n -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes =
-Wno-format-security -Wno-trigraphs -Wno-frame-address -Wno-address-of-pack=
ed-member -Wmissing-declarations -Wmissing-prototypes -Wno-format-overflow-=
non-kprintf -Wno-format-truncation-non-kprintf -Wno-default-const-init-unsa=
fe -Wno-type-limits -Wno-pointer-sign -Wcast-function-type -Wno-unterminate=
d-string-initialization -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=
=3Dincompatible-pointer-types -Wenum-conversion -Wunused -Wmissing-format-a=
ttribute -Wmissing-include-dirs -Wunused-const-variable -Wno-missing-field-=
initializers -Wno-shift-negative-value -Wno-enum-enum-conversion -Wno-sign-=
compare -Wno-unused-parameter -fno-crash-diagnostics -Wno-error=3Dreturn-ty=
pe -Wreturn-type -funsigned-char -Wundef -falign-functions=3D64 -Iarch/mips=
/math-emu -Iarch/mips/math-emu -DKBUILD_MODFILE=3D'"arch/mips/math-emu/dp_s=
qrt"' -DKBUILD_BASENAME=3D'"dp_sqrt"' -DKBUILD_MODNAME=3D'"dp_sqrt"' -D__KB=
UILD_MODNAME=3Ddp_sqrt -c -o arch/mips/math-emu/dp_sqrt.o arch/mips/math-em=
u/dp_sqrt.c

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=3Dy] && I2C [=3Dy] && OF [=3Dn]
   Selected by [y]:
   - PINCTRL_STMFX [=3Dy] && PINCTRL [=3Dy] && I2C [=3Dy] && HAS_IOMEM [=3Dy]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
