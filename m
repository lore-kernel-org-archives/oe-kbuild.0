Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF40C3C6611
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Jul 2026 18:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783448071; cv=none; b=T2WGYma+Ul/BXyRyGIFZabtFGrItqV4MTZDmVA14v9XQXnF6NEiAgYmdd5VT7DctbcBOEi82mnC8++awqD46/qYnqB/2UFwZUzRcefMSx6RzJXxhOBbNynySOWbuBmTNYQAD+0lg5J5MNY9+bcABwkfGYD0j5oFEo/BsZ+VWg6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783448071; c=relaxed/simple;
	bh=fFFEfaZnoONhk/bOSicMaoCkJyYK/IeRL8ZkitLGA0A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=m/4Mrt55YNZrLFHuGueZn43VDAHJdXk9uPbzjunCClMCUk6PpouuW0QYEkXEdGwcSl5rZhuGO17tA9/7CGBoK47kgq42/Ud8v8WkM4WFYlWtjK2QsEpDz/QTHfMxwSkkmnAKYw9S4/eP82hkDD3YfqVUSN0sDR3+pXG4uUIiwys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZgTJQ0IW; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZgTJQ0IW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783448068; x=1814984068;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fFFEfaZnoONhk/bOSicMaoCkJyYK/IeRL8ZkitLGA0A=;
  b=ZgTJQ0IW14b/XuXC50x3CuNAc7UnseQwMdMGoFNT7Ft42fMXC8SoTLDb
   hL9PbMvuvpLsD4q18u8kiLEbb5yDSVIw2hXuvq85LxcPw7l2rcyO20NYW
   0Vt+xKSjWmgZL318g07tsZFKYSJjgf3lhg8M6WAer5jIy1KWe+XMbIaL3
   4/JV9QE4qKj0/Nz2QG9xWp3BvJD5PGY17D8BMMVUDC5AEMzmFe4mmZial
   V7/598Cd5yaO28TMi95djK0+rilpnu6e7Vwt273wfhfsOTCM6sMTLhZ2e
   AnT3T+csCN4p2du4FjNmxXTJ/GsBCoCj8aX4ZwfvGKvr+JMmSYUdPBvK/
   Q==;
X-CSE-ConnectionGUID: 7lHonXZiTVK1gJM02ykA4Q==
X-CSE-MsgGUID: J2R4FFKtQgyMC7Z9RC7cpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="94458248"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="94458248"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 11:14:10 -0700
X-CSE-ConnectionGUID: Ou5IMFhZTt2EyncLbyUGNw==
X-CSE-MsgGUID: B+Id8IpxRqqaKxihfi6YKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="252977845"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 07 Jul 2026 11:14:01 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whAFu-00000000FY2-3h5r;
	Tue, 07 Jul 2026 18:12:15 +0000
Date: Wed, 08 Jul 2026 02:07:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: /bin/bash: line 1: 2230751 Segmentation fault      clang
 -Wp,-MMD,fs/notify/fanotify/.fanotify.o.d -nostdinc -Iarch/mips/include
 -I./arch/mips/include/generated -Iinclude -I./include
 -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/...
Message-ID: <202607080123.9MZfHnCz-lkp@intel.com>
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
TO: AnonymeMeow <anonymemeow@gmail.com>
CC: Jan Kara <jack@suse.cz>
CC: "Christian Brauner (Amutable)" <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
commit: 82c6dd20479bb6a9625e1d63a650c3be8865e2db fanotify: allow reporting =
pidfds for reaped tasks
date:   4 weeks ago
:::::: branch date: 16 hours ago
:::::: commit date: 4 weeks ago
config: mips-randconfig-r123-20260705 (https://download.01.org/0day-ci/arch=
ive/20260708/202607080123.9MZfHnCz-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2=
fb2a2269da0e2a3e230beb6cad39ca314db33)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260708/202607080123.9MZfHnCz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 82c6dd20479b ("fanotify: allow reporting pidfds for reaped tasks")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607080123.9MZfHnCz-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
All errors (new ones prefixed by >>):

   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace and dumped files.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,fs/notify/fanotify/.fanotify.o.d -n=
ostdinc -Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I./i=
nclude -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iincl=
ude/uapi -I./include/generated/uapi -include include/linux/compiler-version=
.h -include include/linux/kconfig.h -include include/linux/compiler_types.h=
 -D__KERNEL__ --target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknown=
-warning-option -Werror=3Dignored-optimization-argument -Werror=3Doption-ig=
nored -Werror=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xfff=
fffff80040000 -DLINKER_LOAD_ADDRESS=3D0x80040000 -DDATAOFFSET=3D0 -fmacro-p=
refix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -fshort-wchar -funsigned-char =
-fno-common -fno-PIE -fno-strict-aliasing -std=3Dgnu11 -fms-anonymous-struc=
ts -Wno-gnu -Wno-microsoft-anon-tag -mno-check-zero-division -mabi=3D32 -G =
0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-float -ffreestanding=
 -EL -fno-stack-check -march=3Dmips3 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -=
Iarch/mips/include/asm/mach-dec -Iarch/mips/include/asm/mach-generic -fno-a=
synchronous-unwind-tables -fno-delete-null-pointer-checks -O2 -fstack-prote=
ctor-strong -fomit-frame-pointer -ftrivial-auto-var-init=3Dzero -fexperimen=
tal-late-parse-attributes -fdiagnostics-show-inlining-chain -fstrict-flex-a=
rrays=3D3 -fno-strict-overflow -fno-stack-check -fno-builtin-wcslen -Wall -=
Wextra -Wundef -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-i=
nt -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-security -=
Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-de=
clarations -Wmissing-prototypes -Wno-format-overflow-non-kprintf -Wno-forma=
t-truncation-non-kprintf -Wno-default-const-init-unsafe -Wno-type-limits -W=
no-pointer-sign -Wcast-function-type -Wno-unterminated-string-initializatio=
n -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Dincompatible-pointer=
-types -Wenum-conversion -Wunused -Wmissing-format-attribute -Wmissing-incl=
ude-dirs -Wunused-const-variable -Wno-missing-field-initializers -Wno-shift=
-negative-value -Wno-enum-enum-conversion -Wno-sign-compare -Wno-unused-par=
ameter -DRANDSTRUCT -frandomize-layout-seed-file=3D./scripts/basic/randstru=
ct.seed -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wreturn-type -funs=
igned-char -Wundef -falign-functions=3D64 -fsanitize-coverage=3Dtrace-pc -f=
sanitize-coverage=3Dtrace-cmp -Ifs/notify/fanotify -Ifs/notify/fanotify -DK=
BUILD_MODFILE=3D\"fs/notify/fanotify/fanotify\" -DKBUILD_BASENAME=3D\"fanot=
ify\" -DKBUILD_MODNAME=3D\"fanotify\" -D__KBUILD_MODNAME=3Dfanotify -c -o f=
s/notify/fanotify/fanotify.o fs/notify/fanotify/fanotify.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'fs/notify/fanotify/fa=
notify.c'.
   4.	Running pass 'Branch Probability Basic Block Placement' on function '=
@fanotify_handle_event'
    #0 0x0000564f1c0c013a llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-23+0x3e6913a)
    #1 0x0000564f1c0bdce4 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
23+0x3e66ce4)
    #2 0x0000564f1bff2cc0 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007fe9fab76df0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x0000564f1b6ea50a llvm::TailDuplicator::tailDuplicate(bool, llvm::M=
achineBasicBlock*, llvm::MachineBasicBlock*, llvm::SmallVectorImpl<llvm::Ma=
chineBasicBlock*>&, llvm::SmallVectorImpl<llvm::MachineInstr*>&, llvm::Smal=
lVectorImpl<llvm::MachineBasicBlock*>*) (clang-23+0x349350a)
    #5 0x0000564f1b6ebc15 llvm::TailDuplicator::tailDuplicateAndUpdate(bool=
, llvm::MachineBasicBlock*, llvm::MachineBasicBlock*, llvm::SmallVectorImpl=
<llvm::MachineBasicBlock*>*, llvm::function_ref<void (llvm::MachineBasicBlo=
ck*)>*, llvm::SmallVectorImpl<llvm::MachineBasicBlock*>*) (clang-23+0x3494c=
15)
    #6 0x0000564f1b435428 (anonymous namespace)::MachineBlockPlacement::may=
beTailDuplicateBlock(llvm::MachineBasicBlock*, llvm::MachineBasicBlock*, (a=
nonymous namespace)::BlockChain&, llvm::SmallSetVector<llvm::MachineBasicBl=
ock const*, 16u>*, llvm::ilist_iterator<llvm::ilist_detail::node_options<ll=
vm::MachineBasicBlock, false, false, void, false, void>, false, false>&, ll=
vm::MachineBasicBlock const* const*&, bool&) MachineBlockPlacement.cpp:0:0
    #7 0x0000564f1b436354 (anonymous namespace)::MachineBlockPlacement::rep=
eatedlyTailDuplicateBlock(llvm::MachineBasicBlock*, llvm::MachineBasicBlock=
*&, llvm::MachineBasicBlock const*, (anonymous namespace)::BlockChain&, llv=
m::SmallSetVector<llvm::MachineBasicBlock const*, 16u>*, llvm::ilist_iterat=
or<llvm::ilist_detail::node_options<llvm::MachineBasicBlock, false, false, =
void, false, void>, false, false>&, llvm::MachineBasicBlock const* const*&)=
 (.isra.0) MachineBlockPlacement.cpp:0:0
    #8 0x0000564f1b439c74 (anonymous namespace)::MachineBlockPlacement::bui=
ldCFGChains() MachineBlockPlacement.cpp:0:0
    #9 0x0000564f1b43b003 (anonymous namespace)::MachineBlockPlacement::run=
(llvm::MachineFunction&) MachineBlockPlacement.cpp:0:0
   #10 0x0000564f1b43e40c (anonymous namespace)::MachineBlockPlacementLegac=
y::runOnMachineFunction(llvm::MachineFunction&) (.part.0) MachineBlockPlace=
ment.cpp:0:0
   #11 0x0000564f1b4806b3 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-23+0x32296b3)
   #12 0x0000564f1b9cec79 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-23+0x3777c79)
   #13 0x0000564f1b9cf0ac llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-23+0x37780ac)
   #14 0x0000564f1b9cfc4a (anonymous namespace)::MPPassManager::runOnModule=
(llvm::Module&) LegacyPassManager.cpp:0:0
   #15 0x0000564f1b9d031c llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-23+0x377931c)
   #16 0x0000564f1c4681bf (anonymous namespace)::EmitAssemblyHelper::TimeCo=
degenPasses(llvm::function_ref<void ()>) BackendUtil.cpp:0:0
   #17 0x0000564f1c4795a4 (anonymous namespace)::EmitAssemblyHelper::emitAs=
sembly(clang::BackendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::=
default_delete<llvm::raw_pwrite_stream>>, clang::BackendConsumer*) (.constp=
rop.0) BackendUtil.cpp:0:0
   #18 0x0000564f1c4797f7 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-23+0x42227f7)
   #19 0x0000564f1caae047 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-23+0x4857047)
   #20 0x0000564f1e4a999c clang::ParseAST(clang::Sema&, bool, bool) (clang-=
23+0x625299c)
   #21 0x0000564f1ce1181e clang::FrontendAction::Execute() (clang-23+0x4bba=
81e)
   #22 0x0000564f1cd9ab9e clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-23+0x4b43b9e)
   #23 0x0000564f1cefadc7 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-23+0x4ca3dc7)
   #24 0x0000564f1912e738 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-23+0xed7738)
   #25 0x0000564f19126413 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #26 0x0000564f19126453 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #27 0x0000564f1cb275f9 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #28 0x0000564f1bff3023 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-23+0x3d9c023)
   #29 0x0000564f1cb28b4c clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #30 0x0000564f1cae4228 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-23+0x488d228)
   #31 0x0000564f1cae51c2 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-23+0x488e1c2)
   #32 0x0000564f1caf8a0c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-23+0x48a1a0c)
   #33 0x0000564f1912b0d2 clang_main(int, char**, llvm::ToolContext const&)=
 (clang-23+0xed40d2)
   #34 0x0000564f1903fdf9 main (clang-23+0xde8df9)
   #35 0x00007fe9fab60ca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #36 0x00007fe9fab60d65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #37 0x0000564f19125e71 _start (clang-23+0xecee71)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 2230751 Segmentation fault      clang -Wp,-MMD,fs/not=
ify/fanotify/.fanotify.o.d -nostdinc -Iarch/mips/include -I./arch/mips/incl=
ude/generated -Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips/=
include/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include i=
nclude/linux/compiler-version.h -include include/linux/kconfig.h -include i=
nclude/linux/compiler_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -fin=
tegrated-as -Werror=3Dunknown-warning-option -Werror=3Dignored-optimization=
-argument -Werror=3Doption-ignored -Werror=3Dunused-command-line-argument -=
DVMLINUX_LOAD_ADDRESS=3D0xffffffff80040000 -DLINKER_LOAD_ADDRESS=3D0x800400=
00 -DDATAOFFSET=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -=
fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -std=
=3Dgnu11 -fms-anonymous-structs -Wno-gnu -Wno-microsoft-anon-tag -mno-check=
-zero-division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -W=
a,-msoft-float -ffreestanding -EL -fno-stack-check -march=3Dmips3 -Wa,--tra=
p -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-dec -Iarch/mips/in=
clude/asm/mach-generic -fno-asynchronous-unwind-tables -fno-delete-null-poi=
nter-checks -O2 -fstack-protector-strong -fomit-frame-pointer -ftrivial-aut=
o-var-init=3Dzero -fexperimental-late-parse-attributes -fdiagnostics-show-i=
nlining-chain -fstrict-flex-arrays=3D3 -fno-strict-overflow -fno-stack-chec=
k -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=3Dimplicit-function-dec=
laration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prot=
otypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wno-address-=
of-packed-member -Wmissing-declarations -Wmissing-prototypes -Wno-format-ov=
erflow-non-kprintf -Wno-format-truncation-non-kprintf -Wno-default-const-in=
it-unsafe -Wno-type-limits -Wno-pointer-sign -Wcast-function-type -Wno-unte=
rminated-string-initialization -Wimplicit-fallthrough -Werror=3Ddate-time -=
Werror=3Dincompatible-pointer-types -Wenum-conversion -Wunused -Wmissing-fo=
rmat-attribute -Wmissing-include-dirs -Wunused-const-variable -Wno-missing-=
field-initializers -Wno-shift-negative-value -Wno-enum-enum-conversion -Wno=
-sign-compare -Wno-unused-parameter -DRANDSTRUCT -frandomize-layout-seed-fi=
le=3D./scripts/basic/randstruct.seed -fno-crash-diagnostics -Wno-error=3Dre=
turn-type -Wreturn-type -funsigned-char -Wundef -falign-functions=3D64 -fsa=
nitize-coverage=3Dtrace-pc -fsanitize-coverage=3Dtrace-cmp -Ifs/notify/fano=
tify -Ifs/notify/fanotify -DKBUILD_MODFILE=3D'"fs/notify/fanotify/fanotify"=
' -DKBUILD_BASENAME=3D'"fanotify"' -DKBUILD_MODNAME=3D'"fanotify"' -D__KBUI=
LD_MODNAME=3Dfanotify -c -o fs/notify/fanotify/fanotify.o fs/notify/fanotif=
y/fanotify.c

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
