Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238952C324C
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Apr 2026 09:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777110508; cv=none; b=V4GT6Cm43A7xLye6biKPccWxd/8Rwnhwvj0dZHX9KaThXoyBvDwbjOY29fMib2qGz0969bVzBaKT4MUeq1c82CGy6FRXR71XZ5W7wQNlsoN3ow8KmJfd6gV+w36NFvgr+GMxVX09w3s1K35oSM6qwoso6mfQQj0rt+bjyQ85A8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777110508; c=relaxed/simple;
	bh=ZKLWpe1SbQ6RXT8vlvBJns+jiU4NG4Zpp+h/NUyxv94=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HZ5lXxsc0aHPFmnk3YN+K7o4xSUafh0KwohbwRVci3G+i+X9m5Vm+4jsy31VJEFJzH3Zh6P+o8alRTook4rKtfQkj1jVMl1zNBF5cUj8Ou1vVjminynWRgfWtNDSa3Pf/2zcgJVBleSgi5r4mr/rIzFr4fatxG99CGkR8O31xMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OMBm+5fB; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OMBm+5fB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777110506; x=1808646506;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZKLWpe1SbQ6RXT8vlvBJns+jiU4NG4Zpp+h/NUyxv94=;
  b=OMBm+5fB87hpEZFPnqK7GeYKw+EudX3Xu9+xtrDw7jJO5zT3VNvU8Vmy
   Hkljvg+Ew4KdxrAzm2EErlIM7iYpXYge9jOm5HzyntMGg4vXtpAEgRqvR
   oSGJIXtR/sp+7fzQD+j5PSm0I3deaIzg+11n8eiCpE3emVnQP3BJY6h31
   kZ8mHDy10xjsGooFEizIn5NR65dMC8mlK5z4wqKxsZPZaOkffgXT18S5W
   2ngBOKXSCEo1TrYHNmbbx9EEr9vKCoG89oZtcpPfdd4tf3SB1EfXSEqVR
   2Ir4V69IQux2r+FT1O7dz4hV3EkIJGF+CMNy4Y9S8TCMFMxd8yz194kQ0
   w==;
X-CSE-ConnectionGUID: 5KUv+VIyTtOQ89361hqltg==
X-CSE-MsgGUID: yVEuOysGRH6LEPkKjQ3/EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="77964888"
X-IronPort-AV: E=Sophos;i="6.23,198,1770624000"; 
   d="scan'208";a="77964888"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2026 02:48:25 -0700
X-CSE-ConnectionGUID: iKPnltJPQW2jygCMsicuqg==
X-CSE-MsgGUID: FFxBF0MbTAy+JqukQFJjSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,198,1770624000"; 
   d="scan'208";a="237144321"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Apr 2026 02:48:24 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGZcb-000000006c9-1phO;
	Sat, 25 Apr 2026 09:48:21 +0000
Date: Sat, 25 Apr 2026 17:48:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thesofproject:topic/sof-dev 1/1] /bin/bash: line 1: 873940
 Segmentation fault      clang -Wp,-MMD,security/yama/.yama_lsm.o.d -nostdinc
 -Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I./include
 -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi
 -...
Message-ID: <202604251706.34rCGDgW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "clang compiler bug"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Bard Liao <yung-chuan.liao@linux.intel.com>
CC: "P=C3=A9ter Ujfalusi" <peter.ujfalusi@gmail.com>

tree:   https://github.com/thesofproject/linux topic/sof-dev
head:   7ec8ed3ae72971c783cfa3bfc14d8568b15a303d
commit: 7ec8ed3ae72971c783cfa3bfc14d8568b15a303d [1/1] Revert "soundwire: r=
ecord Peripheral scale_index"
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: mips-randconfig-r051-20260425 (https://download.01.org/0day-ci/arch=
ive/20260425/202604251706.34rCGDgW-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5ba=
c06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260425/202604251706.34rCGDgW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604251706.34rCGDgW-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
All errors (new ones prefixed by >>):

   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,security/yama/.yama_lsm.o.d -nostdi=
nc -Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I./includ=
e -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/u=
api -I./include/generated/uapi -include include/linux/compiler-version.h -i=
nclude include/linux/kconfig.h -include include/linux/compiler_types.h -D__=
KERNEL__ --target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknown-warn=
ing-option -Werror=3Dignored-optimization-argument -Werror=3Doption-ignored=
 -Werror=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xffffffff=
84000000 -DLINKER_LOAD_ADDRESS=3D0x84000000 -DDATAOFFSET=3D0 -fmacro-prefix=
-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -funsign=
ed-char -fno-common -fno-PIE -fno-strict-aliasing -mno-check-zero-division =
-mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-float =
-ffreestanding -EL -fno-stack-check -march=3Dmips4 -Wa,--trap -DTOOLCHAIN_S=
UPPORTS_VIRT -Iarch/mips/include/asm/mach-cobalt -Iarch/mips/include/asm/ma=
ch-generic -fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks =
-O2 -fstack-protector -ftrivial-auto-var-init=3Dpattern -fexperimental-late=
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
-unused-parameter -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wreturn-=
type -funsigned-char -Wundef -falign-functions=3D64 -Isecurity/yama -Isecur=
ity/yama -ffunction-sections -fdata-sections -DKBUILD_MODFILE=3D\"security/=
yama/yama\" -DKBUILD_BASENAME=3D\"yama_lsm\" -DKBUILD_MODNAME=3D\"yama\" -D=
__KBUILD_MODNAME=3Dyama -c -o security/yama/yama_lsm.o security/yama/yama_l=
sm.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'security/yama/yama_ls=
m.c'.
   4.	Running pass 'Branch Probability Basic Block Placement' on function '=
@yama_ptrace_access_check'
    #0 0x000056526f562c1b llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-23+0x413cc1b)
    #1 0x000056526f5607e4 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
23+0x413a7e4)
    #2 0x000056526f4936a0 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007fa0c9d8ddf0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x000056526eb1a52f llvm::TailDuplicator::shouldTailDuplicate(bool, l=
lvm::MachineBasicBlock&) (.part.0) TailDuplicator.cpp:0:0
    #5 0x000056526e835db4 (anonymous namespace)::MachineBlockPlacement::bui=
ldCFGChains() MachineBlockPlacement.cpp:0:0
    #6 0x000056526e83a6ad (anonymous namespace)::MachineBlockPlacement::run=
(llvm::MachineFunction&) MachineBlockPlacement.cpp:0:0
    #7 0x000056526e83b8b1 (anonymous namespace)::MachineBlockPlacementLegac=
y::runOnMachineFunction(llvm::MachineFunction&) (.part.0) MachineBlockPlace=
ment.cpp:0:0
    #8 0x000056526e889438 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-23+0x3463438)
    #9 0x000056526ee50869 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-23+0x3a2a869)
   #10 0x000056526ee50a0c llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-23+0x3a2aa0c)
   #11 0x000056526ee4fc78 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-23+0x3a29c78)
   #12 0x000056526f95e071 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-23+0x4538071)
   #13 0x000056526ffa36c7 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-23+0x4b7d6c7)
   #14 0x00005652719aeadc clang::ParseAST(clang::Sema&, bool, bool) (clang-=
23+0x6588adc)
   #15 0x00005652702fd17a clang::FrontendAction::Execute() (clang-23+0x4ed7=
17a)
   #16 0x00005652702763d6 clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-23+0x4e503d6)
   #17 0x00005652703e6207 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-23+0x4fc0207)
   #18 0x000056526c37ea55 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-23+0xf58a55)
   #19 0x000056526c376763 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #20 0x000056526c3767a3 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #21 0x0000565270014de9 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #22 0x000056526f493a03 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-23+0x406da03)
   #23 0x0000565270015514 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #24 0x000056526ffd4668 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-23+0x4bae668)
   #25 0x000056526ffd55c2 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-23+0x4baf5c2)
   #26 0x000056526ffe67bc clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-23+0x4bc07bc)
   #27 0x000056526c37b40f clang_main(int, char**, llvm::ToolContext const&)=
 (clang-23+0xf5540f)
   #28 0x000056526c211bb9 main (clang-23+0xdebbb9)
   #29 0x00007fa0c9d77ca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #30 0x00007fa0c9d77d65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #31 0x000056526c3761a1 _start (clang-23+0xf501a1)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 873940 Segmentation fault      clang -Wp,-MMD,securit=
y/yama/.yama_lsm.o.d -nostdinc -Iarch/mips/include -I./arch/mips/include/ge=
nerated -Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips/includ=
e/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include include=
/linux/compiler-version.h -include include/linux/kconfig.h -include include=
/linux/compiler_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -fintegrat=
ed-as -Werror=3Dunknown-warning-option -Werror=3Dignored-optimization-argum=
ent -Werror=3Doption-ignored -Werror=3Dunused-command-line-argument -DVMLIN=
UX_LOAD_ADDRESS=3D0xffffffff84000000 -DLINKER_LOAD_ADDRESS=3D0x84000000 -DD=
ATAOFFSET=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dg=
nu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasin=
g -mno-check-zero-division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -ms=
oft-float -Wa,-msoft-float -ffreestanding -EL -fno-stack-check -march=3Dmip=
s4 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-cobalt=
 -Iarch/mips/include/asm/mach-generic -fno-asynchronous-unwind-tables -fno-=
delete-null-pointer-checks -O2 -fstack-protector -ftrivial-auto-var-init=3Dp=
attern -fexperimental-late-parse-attributes -pg -fstrict-flex-arrays=3D3 -f=
ms-extensions -fno-strict-overflow -fno-stack-check -fno-builtin-wcslen -Wa=
ll -Wextra -Wundef -Werror=3Dimplicit-function-declaration -Werror=3Dimplic=
it-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-securi=
ty -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissin=
g-declarations -Wmissing-prototypes -Wno-gnu -Wno-microsoft-anon-tag -Wno-f=
ormat-overflow-non-kprintf -Wno-format-truncation-non-kprintf -Wno-default-=
const-init-unsafe -Wno-type-limits -Wno-pointer-sign -Wcast-function-type -=
Wno-unterminated-string-initialization -Wimplicit-fallthrough -Werror=3Ddat=
e-time -Werror=3Dincompatible-pointer-types -Wenum-conversion -Wunused -Wmi=
ssing-format-attribute -Wmissing-include-dirs -Wunused-const-variable -Wno-=
missing-field-initializers -Wno-shift-negative-value -Wno-enum-enum-convers=
ion -Wno-sign-compare -Wno-unused-parameter -fno-crash-diagnostics -Wno-err=
or=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -falign-functions=3D6=
4 -Isecurity/yama -Isecurity/yama -ffunction-sections -fdata-sections -DKBU=
ILD_MODFILE=3D'"security/yama/yama"' -DKBUILD_BASENAME=3D'"yama_lsm"' -DKBU=
ILD_MODNAME=3D'"yama"' -D__KBUILD_MODNAME=3Dyama -c -o security/yama/yama_l=
sm.o security/yama/yama_lsm.c

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
