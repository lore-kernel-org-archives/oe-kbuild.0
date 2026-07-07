Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709DC3909AC
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Jul 2026 09:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783416914; cv=none; b=ANtr43c6bf3Ehvtb/KBJZg8ES9pVu3MELJ6bJuPM3T84Hh2HzdSeqT4CZahpEfHphceTaAMVNXhGui8sVwq+XIPKQKJD4NOkkIlPnYrVXGUc62t+4Vnh/qiCKHv3AmHcodVWPbBrJ/srj6mKOVdEJFEJWdv7Me/4L7dkcbkUsjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783416914; c=relaxed/simple;
	bh=1Oanl51g5+Mb3IDUOGf14a27kbQb4niUBRonHh5kZho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BGXDMhdSgJ0O/pg3FLCws3bOhlPyN/9v4mNs+8f4z038mInsaZbIIU1H11MT84t9x53C/3bID68sWqT83FcB1mvdOLFWYaX/PMdmbbsbULsETKZGinfnbp4MwI5XFUus5NlcHuOUBhrM0woZWyPQkhj5qUfUkFcVusVWrf7mteY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TWE4QcfB; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TWE4QcfB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783416912; x=1814952912;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1Oanl51g5+Mb3IDUOGf14a27kbQb4niUBRonHh5kZho=;
  b=TWE4QcfBdOWp4GCCanPV+UWKHWnpvmCKUyeDhxG/JTLGtQ9fKyzsdtaM
   potZ9O48LP27v1MaECFZbMaxmoVFtw+npldFAkMXxtigm/tL2tj+f3Mmx
   YmKKhmF8xzwQ7jso4HirQiolRaBghM3mRBW6G1bWFMWaTUbL6Ei8G5LCH
   l/uSh7zlEbUhlMQmZ1wtOWWXdJWqJZg5rAPxZoakm1bcMkO0OoxQQL+PX
   jTEmtCsH1+Y97fTy8npcuc8Q139jVdsFAHdfdbvfImxOaqDmeG95gzeyn
   M1pYYQtUFAlKzBT0YYHmRULAUQMdhAd7xX7u8uvu85tQm1VbTYGASeXK6
   A==;
X-CSE-ConnectionGUID: FcOkdR0YTMWscwLTcYR5cg==
X-CSE-MsgGUID: q0x7rgz+ReOAYupe4BQqfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="94415119"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="94415119"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 02:35:12 -0700
X-CSE-ConnectionGUID: Oa9TgplzQMKKKVZyeP6A2Q==
X-CSE-MsgGUID: 6fwaChNYS9KcGVwXd8D8dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="258855307"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 07 Jul 2026 02:35:10 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wh2Cq-00000000FCZ-1FHE;
	Tue, 07 Jul 2026 09:35:08 +0000
Date: Tue, 07 Jul 2026 17:34:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: /bin/bash: line 1: 1499142 Segmentation fault      clang
 -Wp,-MMD,kernel/.ptrace.o.d -nostdinc -Iarch/mips/include
 -I./arch/mips/include/generated -Iinclude -I./include
 -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi
 -I./inclu...
Message-ID: <202607071747.cee58tUI-lkp@intel.com>
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
TO: "Christian Brauner (Amutable)" <brauner@kernel.org>
CC: Jann Horn <jannh@google.com>
CC: "David Hildenbrand (arm)" <david@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
commit: 92f829f6b2faad37a5582df73df01c93d4429821 ptrace: add ptracer_access=
_allowed()
date:   6 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 6 weeks ago
config: mips-randconfig-r123-20260705 (https://download.01.org/0day-ci/arch=
ive/20260707/202607071747.cee58tUI-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2=
fb2a2269da0e2a3e230beb6cad39ca314db33)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260707/202607071747.cee58tUI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 92f829f6b2fa ("ptrace: add ptracer_access_allowed()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607071747.cee58tUI-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
All errors (new ones prefixed by >>):

   kernel/ptrace.c:1423:1: warning: alias and aliasee have different types =
'long (long, long, unsigned long, unsigned long)' and 'long (typeof (__buil=
tin_choose_expr((__builtin_types_compatible_p(typeof ((long)0), typeof (0LL=
)) || __builtin_types_compatible_p(typeof ((long)0), typeof (0ULL))), 0LL, =
0L)), typeof (__builtin_choose_expr((__builtin_types_compatible_p(typeof ((=
long)0), typeof (0LL)) || __builtin_types_compatible_p(typeof ((long)0), ty=
peof (0ULL))), 0LL, 0L)), typeof (__builtin_choose_expr((__builtin_types_co=
mpatible_p(typeof ((unsigned long)0), typeof (0LL)) || __builtin_types_comp=
atible_p(typeof ((unsigned long)0), typeof (0ULL))), 0LL, 0L)), typeof (__b=
uiltin_choose_expr((__builtin_types_compatible_p(typeof ((unsigned long)0),=
 typeof (0LL)) || __builtin_types_compatible_p(typeof ((unsigned long)0), t=
ypeof (0ULL))), 0LL, 0L)))' (aka 'long (long, long, long, long)') [-Wattrib=
ute-alias]
    1423 | SYSCALL_DEFINE4(ptrace, long, request, long, pid, unsigned long,=
 addr,
         | ^
   include/linux/syscalls.h:228:36: note: expanded from macro 'SYSCALL_DEFI=
NE4'
     228 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, _=
_VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:251:18: note: expanded from macro '__SYSCALL_DE=
FINEx'
     251 |                 __attribute__((alias(__stringify(__se_sys##name)=
)));    \
         |                                ^
   kernel/ptrace.c:1423:1: note: aliasee is declared here
   include/linux/syscalls.h:228:36: note: expanded from macro 'SYSCALL_DEFI=
NE4'
     228 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, _=
_VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:236:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
     236 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:255:18: note: expanded from macro '__SYSCALL_DE=
FINEx'
     255 |         asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_AR=
GS__))  \
         |                         ^
   <scratch space>:21:1: note: expanded from here
      21 | __se_sys_ptrace
         | ^
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace and dumped files.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,kernel/.ptrace.o.d -nostdinc -Iarch=
/mips/include -I./arch/mips/include/generated -Iinclude -I./include -Iarch/=
mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi -I./i=
nclude/generated/uapi -include include/linux/compiler-version.h -include in=
clude/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ =
--target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknown-warning-optio=
n -Werror=3Dignored-optimization-argument -Werror=3Doption-ignored -Werror=
=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xffffffff80040000=
 -DLINKER_LOAD_ADDRESS=3D0x80040000 -DDATAOFFSET=3D0 -fmacro-prefix-map=3D=
=3D -Wundef -DKBUILD_EXTRA_WARN1 -fshort-wchar -funsigned-char -fno-common =
-fno-PIE -fno-strict-aliasing -std=3Dgnu11 -fms-anonymous-structs -Wno-gnu =
-Wno-microsoft-anon-tag -mno-check-zero-division -mabi=3D32 -G 0 -mno-abica=
lls -fno-pic -pipe -msoft-float -Wa,-msoft-float -ffreestanding -EL -fno-st=
ack-check -march=3Dmips3 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/i=
nclude/asm/mach-dec -Iarch/mips/include/asm/mach-generic -fno-asynchronous-=
unwind-tables -fno-delete-null-pointer-checks -O2 -fstack-protector-strong =
-fomit-frame-pointer -ftrivial-auto-var-init=3Dzero -fexperimental-late-par=
se-attributes -fdiagnostics-show-inlining-chain -fstrict-flex-arrays=3D3 -f=
no-strict-overflow -fno-stack-check -fno-builtin-wcslen -Wall -Wextra -Wund=
ef -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=
=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-security -Wno-trigra=
phs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-declarations=
 -Wmissing-prototypes -Wno-format-overflow-non-kprintf -Wno-format-truncati=
on-non-kprintf -Wno-default-const-init-unsafe -Wno-type-limits -Wno-pointer=
-sign -Wcast-function-type -Wno-unterminated-string-initialization -Wimplic=
it-fallthrough -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -We=
num-conversion -Wunused -Wmissing-format-attribute -Wmissing-include-dirs -=
Wunused-const-variable -Wno-missing-field-initializers -Wno-shift-negative-=
value -Wno-enum-enum-conversion -Wno-sign-compare -Wno-unused-parameter -DR=
ANDSTRUCT -frandomize-layout-seed-file=3D./scripts/basic/randstruct.seed -f=
no-crash-diagnostics -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char=
 -Wundef -falign-functions=3D64 -fsanitize-coverage=3Dtrace-pc -fsanitize-c=
overage=3Dtrace-cmp -Ikernel -Ikernel -DKBUILD_MODFILE=3D\"kernel/ptrace\" =
-DKBUILD_BASENAME=3D\"ptrace\" -DKBUILD_MODNAME=3D\"ptrace\" -D__KBUILD_MOD=
NAME=3Dptrace -c -o kernel/ptrace.o kernel/ptrace.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'kernel/ptrace.c'.
   4.	Running pass 'Branch Probability Basic Block Placement' on function '=
@ptracer_access_allowed'
    #0 0x0000556b207a613a llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-23+0x3e6913a)
    #1 0x0000556b207a3ce4 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
23+0x3e66ce4)
    #2 0x0000556b206d8cc0 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007f8b95d33df0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x0000556b1fdd050a llvm::TailDuplicator::tailDuplicate(bool, llvm::M=
achineBasicBlock*, llvm::MachineBasicBlock*, llvm::SmallVectorImpl<llvm::Ma=
chineBasicBlock*>&, llvm::SmallVectorImpl<llvm::MachineInstr*>&, llvm::Smal=
lVectorImpl<llvm::MachineBasicBlock*>*) (clang-23+0x349350a)
    #5 0x0000556b1fdd1c15 llvm::TailDuplicator::tailDuplicateAndUpdate(bool=
, llvm::MachineBasicBlock*, llvm::MachineBasicBlock*, llvm::SmallVectorImpl=
<llvm::MachineBasicBlock*>*, llvm::function_ref<void (llvm::MachineBasicBlo=
ck*)>*, llvm::SmallVectorImpl<llvm::MachineBasicBlock*>*) (clang-23+0x3494c=
15)
    #6 0x0000556b1fb1b428 (anonymous namespace)::MachineBlockPlacement::may=
beTailDuplicateBlock(llvm::MachineBasicBlock*, llvm::MachineBasicBlock*, (a=
nonymous namespace)::BlockChain&, llvm::SmallSetVector<llvm::MachineBasicBl=
ock const*, 16u>*, llvm::ilist_iterator<llvm::ilist_detail::node_options<ll=
vm::MachineBasicBlock, false, false, void, false, void>, false, false>&, ll=
vm::MachineBasicBlock const* const*&, bool&) MachineBlockPlacement.cpp:0:0
    #7 0x0000556b1fb1c354 (anonymous namespace)::MachineBlockPlacement::rep=
eatedlyTailDuplicateBlock(llvm::MachineBasicBlock*, llvm::MachineBasicBlock=
*&, llvm::MachineBasicBlock const*, (anonymous namespace)::BlockChain&, llv=
m::SmallSetVector<llvm::MachineBasicBlock const*, 16u>*, llvm::ilist_iterat=
or<llvm::ilist_detail::node_options<llvm::MachineBasicBlock, false, false, =
void, false, void>, false, false>&, llvm::MachineBasicBlock const* const*&)=
 (.isra.0) MachineBlockPlacement.cpp:0:0
    #8 0x0000556b1fb1fc74 (anonymous namespace)::MachineBlockPlacement::bui=
ldCFGChains() MachineBlockPlacement.cpp:0:0
    #9 0x0000556b1fb21003 (anonymous namespace)::MachineBlockPlacement::run=
(llvm::MachineFunction&) MachineBlockPlacement.cpp:0:0
   #10 0x0000556b1fb2440c (anonymous namespace)::MachineBlockPlacementLegac=
y::runOnMachineFunction(llvm::MachineFunction&) (.part.0) MachineBlockPlace=
ment.cpp:0:0
   #11 0x0000556b1fb666b3 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-23+0x32296b3)
   #12 0x0000556b200b4c79 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-23+0x3777c79)
   #13 0x0000556b200b50ac llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-23+0x37780ac)
   #14 0x0000556b200b5c4a (anonymous namespace)::MPPassManager::runOnModule=
(llvm::Module&) LegacyPassManager.cpp:0:0
   #15 0x0000556b200b631c llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-23+0x377931c)
   #16 0x0000556b20b4e1bf (anonymous namespace)::EmitAssemblyHelper::TimeCo=
degenPasses(llvm::function_ref<void ()>) BackendUtil.cpp:0:0
   #17 0x0000556b20b5f5a4 (anonymous namespace)::EmitAssemblyHelper::emitAs=
sembly(clang::BackendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::=
default_delete<llvm::raw_pwrite_stream>>, clang::BackendConsumer*) (.constp=
rop.0) BackendUtil.cpp:0:0
   #18 0x0000556b20b5f7f7 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-23+0x42227f7)
   #19 0x0000556b21194047 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-23+0x4857047)
   #20 0x0000556b22b8f99c clang::ParseAST(clang::Sema&, bool, bool) (clang-=
23+0x625299c)
   #21 0x0000556b214f781e clang::FrontendAction::Execute() (clang-23+0x4bba=
81e)
   #22 0x0000556b21480b9e clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-23+0x4b43b9e)
   #23 0x0000556b215e0dc7 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-23+0x4ca3dc7)
   #24 0x0000556b1d814738 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-23+0xed7738)
   #25 0x0000556b1d80c413 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #26 0x0000556b1d80c453 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #27 0x0000556b2120d5f9 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #28 0x0000556b206d9023 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-23+0x3d9c023)
   #29 0x0000556b2120eb4c clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #30 0x0000556b211ca228 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-23+0x488d228)
   #31 0x0000556b211cb1c2 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-23+0x488e1c2)
   #32 0x0000556b211dea0c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-23+0x48a1a0c)
   #33 0x0000556b1d8110d2 clang_main(int, char**, llvm::ToolContext const&)=
 (clang-23+0xed40d2)
   #34 0x0000556b1d725df9 main (clang-23+0xde8df9)
   #35 0x00007f8b95d1dca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #36 0x00007f8b95d1dd65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #37 0x0000556b1d80be71 _start (clang-23+0xecee71)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 1499142 Segmentation fault      clang -Wp,-MMD,kernel=
/.ptrace.o.d -nostdinc -Iarch/mips/include -I./arch/mips/include/generated =
-Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips/include/genera=
ted/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linux/c=
ompiler-version.h -include include/linux/kconfig.h -include include/linux/c=
ompiler_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -fintegrated-as -W=
error=3Dunknown-warning-option -Werror=3Dignored-optimization-argument -Wer=
ror=3Doption-ignored -Werror=3Dunused-command-line-argument -DVMLINUX_LOAD_=
ADDRESS=3D0xffffffff80040000 -DLINKER_LOAD_ADDRESS=3D0x80040000 -DDATAOFFSE=
T=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -fshort-wchar -=
funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -std=3Dgnu11 -fms-=
anonymous-structs -Wno-gnu -Wno-microsoft-anon-tag -mno-check-zero-division=
 -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-float=
 -ffreestanding -EL -fno-stack-check -march=3Dmips3 -Wa,--trap -DTOOLCHAIN_=
SUPPORTS_VIRT -Iarch/mips/include/asm/mach-dec -Iarch/mips/include/asm/mach=
-generic -fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks -O=
2 -fstack-protector-strong -fomit-frame-pointer -ftrivial-auto-var-init=3Dz=
ero -fexperimental-late-parse-attributes -fdiagnostics-show-inlining-chain =
-fstrict-flex-arrays=3D3 -fno-strict-overflow -fno-stack-check -fno-builtin=
-wcslen -Wall -Wextra -Wundef -Werror=3Dimplicit-function-declaration -Werr=
or=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-fo=
rmat-security -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-memb=
er -Wmissing-declarations -Wmissing-prototypes -Wno-format-overflow-non-kpr=
intf -Wno-format-truncation-non-kprintf -Wno-default-const-init-unsafe -Wno=
-type-limits -Wno-pointer-sign -Wcast-function-type -Wno-unterminated-strin=
g-initialization -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Dincom=
patible-pointer-types -Wenum-conversion -Wunused -Wmissing-format-attribute=
 -Wmissing-include-dirs -Wunused-const-variable -Wno-missing-field-initiali=
zers -Wno-shift-negative-value -Wno-enum-enum-conversion -Wno-sign-compare =
-Wno-unused-parameter -DRANDSTRUCT -frandomize-layout-seed-file=3D./scripts=
/basic/randstruct.seed -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wre=
turn-type -funsigned-char -Wundef -falign-functions=3D64 -fsanitize-coverag=
e=3Dtrace-pc -fsanitize-coverage=3Dtrace-cmp -Ikernel -Ikernel -DKBUILD_MOD=
FILE=3D'"kernel/ptrace"' -DKBUILD_BASENAME=3D'"ptrace"' -DKBUILD_MODNAME=3D'=
"ptrace"' -D__KBUILD_MODNAME=3Dptrace -c -o kernel/ptrace.o kernel/ptrace.c
--
   arch/mips/kernel/traps.c:1592:17: warning: variable 'prev_state' set but=
 not used [-Wunused-but-set-variable]
    1592 |         enum ctx_state prev_state;
         |                        ^
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace and dumped files.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,arch/mips/kernel/.traps.o.d -nostdi=
nc -Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I./includ=
e -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/u=
api -I./include/generated/uapi -include include/linux/compiler-version.h -i=
nclude include/linux/kconfig.h -include include/linux/compiler_types.h -D__=
KERNEL__ --target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknown-warn=
ing-option -Werror=3Dignored-optimization-argument -Werror=3Doption-ignored=
 -Werror=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xffffffff=
80040000 -DLINKER_LOAD_ADDRESS=3D0x80040000 -DDATAOFFSET=3D0 -fmacro-prefix=
-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -fshort-wchar -funsigned-char -fno-=
common -fno-PIE -fno-strict-aliasing -std=3Dgnu11 -fms-anonymous-structs -W=
no-gnu -Wno-microsoft-anon-tag -mno-check-zero-division -mabi=3D32 -G 0 -mn=
o-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-float -ffreestanding -EL =
-fno-stack-check -march=3Dmips3 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch=
/mips/include/asm/mach-dec -Iarch/mips/include/asm/mach-generic -fno-asynch=
ronous-unwind-tables -fno-delete-null-pointer-checks -O2 -fstack-protector-=
strong -fomit-frame-pointer -ftrivial-auto-var-init=3Dzero -fexperimental-l=
ate-parse-attributes -fdiagnostics-show-inlining-chain -fstrict-flex-arrays=
=3D3 -fno-strict-overflow -fno-stack-check -fno-builtin-wcslen -Wall -Wextr=
a -Wundef -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -W=
error=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-security -Wno-t=
rigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-declara=
tions -Wmissing-prototypes -Wno-format-overflow-non-kprintf -Wno-format-tru=
ncation-non-kprintf -Wno-default-const-init-unsafe -Wno-type-limits -Wno-po=
inter-sign -Wcast-function-type -Wno-unterminated-string-initialization -Wi=
mplicit-fallthrough -Werror=3Ddate-time -Werror=3Dincompatible-pointer-type=
s -Wenum-conversion -Wunused -Wmissing-format-attribute -Wmissing-include-d=
irs -Wunused-const-variable -Wno-missing-field-initializers -Wno-shift-nega=
tive-value -Wno-enum-enum-conversion -Wno-sign-compare -Wno-unused-paramete=
r -DRANDSTRUCT -frandomize-layout-seed-file=3D./scripts/basic/randstruct.se=
ed -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wreturn-type -funsigned=
-char -Wundef -falign-functions=3D64 -fsanitize-coverage=3Dtrace-pc -fsanit=
ize-coverage=3Dtrace-cmp -Iarch/mips/kernel -Iarch/mips/kernel -DKBUILD_MOD=
FILE=3D\"arch/mips/kernel/traps\" -DKBUILD_BASENAME=3D\"traps\" -DKBUILD_MO=
DNAME=3D\"traps\" -D__KBUILD_MODNAME=3Dtraps -c -o arch/mips/kernel/traps.o=
 arch/mips/kernel/traps.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'arch/mips/kernel/trap=
s.c'.
   4.	Running pass 'Branch Probability Basic Block Placement' on function '=
@show_stack'
    #0 0x000055c7a66b413a llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-23+0x3e6913a)
    #1 0x000055c7a66b1ce4 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
23+0x3e66ce4)
    #2 0x000055c7a65e6cc0 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007fe94d52cdf0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x000055c7a5cdae8f llvm::TailDuplicator::shouldTailDuplicate(bool, l=
lvm::MachineBasicBlock&) (.part.0) TailDuplicator.cpp:0:0
    #5 0x000055c7a5a2dbfa (anonymous namespace)::MachineBlockPlacement::bui=
ldCFGChains() MachineBlockPlacement.cpp:0:0
    #6 0x000055c7a5a2f003 (anonymous namespace)::MachineBlockPlacement::run=
(llvm::MachineFunction&) MachineBlockPlacement.cpp:0:0
    #7 0x000055c7a5a3240c (anonymous namespace)::MachineBlockPlacementLegac=
y::runOnMachineFunction(llvm::MachineFunction&) (.part.0) MachineBlockPlace=
ment.cpp:0:0
    #8 0x000055c7a5a746b3 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-23+0x32296b3)
    #9 0x000055c7a5fc2c79 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-23+0x3777c79)
   #10 0x000055c7a5fc30ac llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-23+0x37780ac)
   #11 0x000055c7a5fc3c4a (anonymous namespace)::MPPassManager::runOnModule=
(llvm::Module&) LegacyPassManager.cpp:0:0
   #12 0x000055c7a5fc431c llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-23+0x377931c)
   #13 0x000055c7a6a5c1bf (anonymous namespace)::EmitAssemblyHelper::TimeCo=
degenPasses(llvm::function_ref<void ()>) BackendUtil.cpp:0:0
   #14 0x000055c7a6a6d5a4 (anonymous namespace)::EmitAssemblyHelper::emitAs=
sembly(clang::BackendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::=
default_delete<llvm::raw_pwrite_stream>>, clang::BackendConsumer*) (.constp=
rop.0) BackendUtil.cpp:0:0
   #15 0x000055c7a6a6d7f7 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-23+0x42227f7)
   #16 0x000055c7a70a2047 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-23+0x4857047)
   #17 0x000055c7a8a9d99c clang::ParseAST(clang::Sema&, bool, bool) (clang-=
23+0x625299c)
   #18 0x000055c7a740581e clang::FrontendAction::Execute() (clang-23+0x4bba=
81e)
   #19 0x000055c7a738eb9e clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-23+0x4b43b9e)
   #20 0x000055c7a74eedc7 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-23+0x4ca3dc7)
   #21 0x000055c7a3722738 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-23+0xed7738)
   #22 0x000055c7a371a413 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #23 0x000055c7a371a453 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #24 0x000055c7a711b5f9 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #25 0x000055c7a65e7023 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-23+0x3d9c023)
   #26 0x000055c7a711cb4c clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #27 0x000055c7a70d8228 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-23+0x488d228)
   #28 0x000055c7a70d91c2 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-23+0x488e1c2)
   #29 0x000055c7a70eca0c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-23+0x48a1a0c)
   #30 0x000055c7a371f0d2 clang_main(int, char**, llvm::ToolContext const&)=
 (clang-23+0xed40d2)
   #31 0x000055c7a3633df9 main (clang-23+0xde8df9)
   #32 0x00007fe94d516ca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #33 0x00007fe94d516d65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #34 0x000055c7a3719e71 _start (clang-23+0xecee71)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 1499145 Segmentation fault      clang -Wp,-MMD,arch/m=
ips/kernel/.traps.o.d -nostdinc -Iarch/mips/include -I./arch/mips/include/g=
enerated -Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips/inclu=
de/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include includ=
e/linux/compiler-version.h -include include/linux/kconfig.h -include includ=
e/linux/compiler_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -fintegra=
ted-as -Werror=3Dunknown-warning-option -Werror=3Dignored-optimization-argu=
ment -Werror=3Doption-ignored -Werror=3Dunused-command-line-argument -DVMLI=
NUX_LOAD_ADDRESS=3D0xffffffff80040000 -DLINKER_LOAD_ADDRESS=3D0x80040000 -D=
DATAOFFSET=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -fshor=
t-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -std=3Dgn=
u11 -fms-anonymous-structs -Wno-gnu -Wno-microsoft-anon-tag -mno-check-zero=
-division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-ms=
oft-float -ffreestanding -EL -fno-stack-check -march=3Dmips3 -Wa,--trap -DT=
OOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-dec -Iarch/mips/include=
/asm/mach-generic -fno-asynchronous-unwind-tables -fno-delete-null-pointer-=
checks -O2 -fstack-protector-strong -fomit-frame-pointer -ftrivial-auto-var=
-init=3Dzero -fexperimental-late-parse-attributes -fdiagnostics-show-inlini=
ng-chain -fstrict-flex-arrays=3D3 -fno-strict-overflow -fno-stack-check -fn=
o-builtin-wcslen -Wall -Wextra -Wundef -Werror=3Dimplicit-function-declarat=
ion -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototype=
s -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wno-address-of-pa=
cked-member -Wmissing-declarations -Wmissing-prototypes -Wno-format-overflo=
w-non-kprintf -Wno-format-truncation-non-kprintf -Wno-default-const-init-un=
safe -Wno-type-limits -Wno-pointer-sign -Wcast-function-type -Wno-untermina=
ted-string-initialization -Wimplicit-fallthrough -Werror=3Ddate-time -Werro=
r=3Dincompatible-pointer-types -Wenum-conversion -Wunused -Wmissing-format-=
attribute -Wmissing-include-dirs -Wunused-const-variable -Wno-missing-field=
-initializers -Wno-shift-negative-value -Wno-enum-enum-conversion -Wno-sign=
-compare -Wno-unused-parameter -DRANDSTRUCT -frandomize-layout-seed-file=3D.=
/scripts/basic/randstruct.seed -fno-crash-diagnostics -Wno-error=3Dreturn-t=
ype -Wreturn-type -funsigned-char -Wundef -falign-functions=3D64 -fsanitize=
-coverage=3Dtrace-pc -fsanitize-coverage=3Dtrace-cmp -Iarch/mips/kernel -Ia=
rch/mips/kernel -DKBUILD_MODFILE=3D'"arch/mips/kernel/traps"' -DKBUILD_BASE=
NAME=3D'"traps"' -DKBUILD_MODNAME=3D'"traps"' -D__KBUILD_MODNAME=3Dtraps -c=
 -o arch/mips/kernel/traps.o arch/mips/kernel/traps.c

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
