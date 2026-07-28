Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D3240A921
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Jul 2026 11:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785238449; cv=none; b=M1qTmYPcIcDDWi/T+xRtK5TQJxpEocqfq6/cK9XofZf1T1OhzCueWZ8o/yjGBnB4JIFlyJ1vhDZHUN1uS8rxO0DCGp/2nvDWULJqkZ0+2xZKIiCm8BQ7/a10N6z+sG/kJoKpaihC/UUA7uGHf0fIGHvCMyGA8HOuUbKhUh6wZqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785238449; c=relaxed/simple;
	bh=ACP/Z0+ROMC3GcKgGV11SrV+UFkDC4iU9s9rkkwzX68=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dKZD9GLHEqXMyJoF3YJOSC2gaxLUftaAPhrKrUE5K1kQbliNrfN+Q5nZMsjGxBh0FB6orX22LuLb233HQN4Mk82cZyzGi3WP2gjwt1CB89VfcLQhxE2MZJIZhRmljdrGWaCSP9CVwquYe0u2OzqTFfC913N8KP/mC73sa4qdPSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c/c5dspV; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c/c5dspV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785238447; x=1816774447;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ACP/Z0+ROMC3GcKgGV11SrV+UFkDC4iU9s9rkkwzX68=;
  b=c/c5dspVLfx25ko4iSGz5uD0+5sFLnjipltEPlw6PcrBPtrEFdx3MOJ8
   ItIXuKewDwjZqvI3umvogKAE0yOFrkKWBWAoAd3VECutnRdiKKZOhINP8
   cJKVHzkcs0KBV96otN7XQqWQVtEaAYBsWvRBqWmzY9A0bXxLfRKkLLZN4
   mGolJKWpwLTHsth2BvUijwqJ+dVThIWo90FTgaizGeG26V2jdwSLTrMsd
   JSMIKO5zfvSG3cyyTEr4Ik9hahgQ/t1Ng0CnP8ofl6L4Er3WyVVFJLSz1
   hkC9aNRjvX+9BKlIq5rmJgpSBSelDgkvFU3YradaIeTPpkni2kXxZyGof
   Q==;
X-CSE-ConnectionGUID: LzsINFzXT4mZmcsNUghD+A==
X-CSE-MsgGUID: fDrQ4Ty5Sty14ZYxlggM2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="96480185"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="96480185"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 04:34:07 -0700
X-CSE-ConnectionGUID: QgeLLdKQR+eJ5cDrEkzoBg==
X-CSE-MsgGUID: 1SL5BWDpT4ucLEAh9hdsKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="261651952"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 28 Jul 2026 04:34:05 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wog4R-00000000eJD-12H9;
	Tue, 28 Jul 2026 11:34:03 +0000
Date: Tue, 28 Jul 2026 19:33:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: /bin/bash: line 1: 2592679 Segmentation fault      clang
 -Wp,-MMD,kernel/.ptrace.o.d -nostdinc -Iarch/mips/include
 -I./arch/mips/include/generated -Iinclude -I./include
 -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi
 -I./inclu...
Message-ID: <202607281944.ly6heoVD-lkp@intel.com>
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

Hi Christian,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   62cc90241548d5570ee68e01aaba6506964e9811
commit: 92f829f6b2faad37a5582df73df01c93d4429821 ptrace: add ptracer_access=
_allowed()
date:   9 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 9 weeks ago
config: mips-randconfig-r073-20260727 (https://download.01.org/0day-ci/arch=
ive/20260728/202607281944.ly6heoVD-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 890=
b11e09e45e9d8b29f2f94f22052be3934e757)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260728/202607281944.ly6heoVD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 92f829f6b2fa ("ptrace: add ptracer_access_allowed()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607281944.ly6heoVD-lkp@intel.com/

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
   <scratch space>:203:1: note: expanded from here
     203 | __se_sys_ptrace
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
=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xffffffff80080000=
 -DLINKER_LOAD_ADDRESS=3D0x80080000 -DDATAOFFSET=3D0 -fmacro-prefix-map=3D=
=3D -Wundef -DKBUILD_EXTRA_WARN1 -fshort-wchar -funsigned-char -fno-common =
-fno-PIE -fno-strict-aliasing -std=3Dgnu11 -fms-anonymous-structs -Wno-gnu =
-Wno-microsoft-anon-tag -mno-check-zero-division -mabi=3D32 -G 0 -mno-abica=
lls -fno-pic -pipe -msoft-float -Wa,-msoft-float -ffreestanding -EL -fno-st=
ack-check -march=3Dmips3 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/i=
nclude/asm/mach-jazz -Iarch/mips/include/asm/mach-generic -fno-asynchronous=
-unwind-tables -fno-delete-null-pointer-checks -O2 -fno-stack-protector -ft=
rivial-auto-var-init=3Dpattern -fexperimental-late-parse-attributes -fdiagn=
ostics-show-inlining-chain -pg -fstrict-flex-arrays=3D3 -fno-strict-overflo=
w -fno-stack-check -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=3Dimpl=
icit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Wer=
ror=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-addr=
ess -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-prototyp=
es -Wno-format-overflow-non-kprintf -Wno-format-truncation-non-kprintf -Wno=
-default-const-init-unsafe -Wno-type-limits -Wno-pointer-sign -Wcast-functi=
on-type -Wno-unterminated-string-initialization -Wimplicit-fallthrough -Wer=
ror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wenum-conversion -Wun=
used -Wmissing-format-attribute -Wmissing-include-dirs -Wunused-const-varia=
ble -Wno-missing-field-initializers -Wno-shift-negative-value -Wno-enum-enu=
m-conversion -Wno-sign-compare -Wno-unused-parameter -g -gdwarf-5 -DRANDSTR=
UCT -frandomize-layout-seed-file=3D./scripts/basic/randstruct.seed -fno-cra=
sh-diagnostics -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wund=
ef -falign-functions=3D64 -Ikernel -Ikernel -DKBUILD_MODFILE=3D\"kernel/ptr=
ace\" -DKBUILD_BASENAME=3D\"ptrace\" -DKBUILD_MODNAME=3D\"ptrace\" -D__KBUI=
LD_MODNAME=3Dptrace -c -o kernel/ptrace.o kernel/ptrace.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'kernel/ptrace.c'.
   4.	Running pass 'Branch Probability Basic Block Placement' on function '=
@ptracer_access_allowed'
    #0 0x000056063f68c48a llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-24+0x38c748a)
    #1 0x000056063f68a064 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
24+0x38c5064)
    #2 0x000056063f5bf8c0 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007ffa80cfadf0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x000056063ecadf0a llvm::TailDuplicator::tailDuplicate(bool, llvm::M=
achineBasicBlock*, llvm::MachineBasicBlock*, llvm::SmallVectorImpl<llvm::Ma=
chineBasicBlock*>&, llvm::SmallVectorImpl<llvm::MachineInstr*>&, llvm::Smal=
lVectorImpl<llvm::MachineBasicBlock*>*) (clang-24+0x2ee8f0a)
    #5 0x000056063ecaf615 llvm::TailDuplicator::tailDuplicateAndUpdate(bool=
, llvm::MachineBasicBlock*, llvm::MachineBasicBlock*, llvm::SmallVectorImpl=
<llvm::MachineBasicBlock*>*, llvm::function_ref<void (llvm::MachineBasicBlo=
ck*)>*, llvm::SmallVectorImpl<llvm::MachineBasicBlock*>*) (clang-24+0x2eea6=
15)
    #6 0x000056063e9f6568 (anonymous namespace)::MachineBlockPlacement::may=
beTailDuplicateBlock(llvm::MachineBasicBlock*, llvm::MachineBasicBlock*, (a=
nonymous namespace)::BlockChain&, llvm::SmallSetVector<llvm::MachineBasicBl=
ock const*, 16u>*, llvm::ilist_iterator<llvm::ilist_detail::node_options<ll=
vm::MachineBasicBlock, false, false, void, false, void>, false, false>&, ll=
vm::MachineBasicBlock const* const*&, bool&) MachineBlockPlacement.cpp:0:0
    #7 0x000056063e9f7494 (anonymous namespace)::MachineBlockPlacement::rep=
eatedlyTailDuplicateBlock(llvm::MachineBasicBlock*, llvm::MachineBasicBlock=
*&, llvm::MachineBasicBlock const*, (anonymous namespace)::BlockChain&, llv=
m::SmallSetVector<llvm::MachineBasicBlock const*, 16u>*, llvm::ilist_iterat=
or<llvm::ilist_detail::node_options<llvm::MachineBasicBlock, false, false, =
void, false, void>, false, false>&, llvm::MachineBasicBlock const* const*&)=
 (.isra.0) MachineBlockPlacement.cpp:0:0
    #8 0x000056063e9faeb2 (anonymous namespace)::MachineBlockPlacement::bui=
ldCFGChains() MachineBlockPlacement.cpp:0:0
    #9 0x000056063e9fc383 (anonymous namespace)::MachineBlockPlacement::run=
(llvm::MachineFunction&) MachineBlockPlacement.cpp:0:0
   #10 0x000056063e9ff78c (anonymous namespace)::MachineBlockPlacementLegac=
y::runOnMachineFunction(llvm::MachineFunction&) (.part.0) MachineBlockPlace=
ment.cpp:0:0
   #11 0x000056063ea3f4f3 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-24+0x2c7a4f3)
   #12 0x000056063ef95bb9 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-24+0x31d0bb9)
   #13 0x000056063ef95fec llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-24+0x31d0fec)
   #14 0x000056063ef96b8a (anonymous namespace)::MPPassManager::runOnModule=
(llvm::Module&) LegacyPassManager.cpp:0:0
   #15 0x000056063ef9725c llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-24+0x31d225c)
   #16 0x000056063fa3da6f (anonymous namespace)::EmitAssemblyHelper::TimeCo=
degenPasses(llvm::function_ref<void ()>) BackendUtil.cpp:0:0
   #17 0x000056063fa4ed7a (anonymous namespace)::EmitAssemblyHelper::emitAs=
sembly(clang::BackendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::=
default_delete<llvm::raw_pwrite_stream>>, clang::BackendConsumer*) (.constp=
rop.0) BackendUtil.cpp:0:0
   #18 0x000056063fa4ef6f clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-24+0x3c89f6f)
   #19 0x0000560640089ec7 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-24+0x42c4ec7)
   #20 0x0000560641a93fcc clang::ParseAST(clang::Sema&, bool, bool) (clang-=
24+0x5ccefcc)
   #21 0x00005606403ea41e clang::FrontendAction::Execute() (clang-24+0x4625=
41e)
   #22 0x00005606403754ee clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-24+0x45b04ee)
   #23 0x00005606404b5247 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-24+0x46f0247)
   #24 0x000056063c6a2748 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-24+0x8dd748)
   #25 0x000056063c69a413 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #26 0x000056063c69a453 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #27 0x0000560640107b09 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #28 0x000056063f5bfc23 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-24+0x37fac23)
   #29 0x000056064010908c clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #30 0x00005606400c1898 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-24+0x42fc898)
   #31 0x00005606400c60d2 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-24+0x43010d2)
   #32 0x00005606400d7edc clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-24+0x4312edc)
   #33 0x000056063c69f0d2 clang_main(int, char**, llvm::ToolContext const&)=
 (clang-24+0x8da0d2)
   #34 0x000056063c5ba279 main (clang-24+0x7f5279)
   #35 0x00007ffa80ce4ca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #36 0x00007ffa80ce4d65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #37 0x000056063c699e71 _start (clang-24+0x8d4e71)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 2592679 Segmentation fault      clang -Wp,-MMD,kernel=
/.ptrace.o.d -nostdinc -Iarch/mips/include -I./arch/mips/include/generated =
-Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips/include/genera=
ted/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linux/c=
ompiler-version.h -include include/linux/kconfig.h -include include/linux/c=
ompiler_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -fintegrated-as -W=
error=3Dunknown-warning-option -Werror=3Dignored-optimization-argument -Wer=
ror=3Doption-ignored -Werror=3Dunused-command-line-argument -DVMLINUX_LOAD_=
ADDRESS=3D0xffffffff80080000 -DLINKER_LOAD_ADDRESS=3D0x80080000 -DDATAOFFSE=
T=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -fshort-wchar -=
funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -std=3Dgnu11 -fms-=
anonymous-structs -Wno-gnu -Wno-microsoft-anon-tag -mno-check-zero-division=
 -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-float=
 -ffreestanding -EL -fno-stack-check -march=3Dmips3 -Wa,--trap -DTOOLCHAIN_=
SUPPORTS_VIRT -Iarch/mips/include/asm/mach-jazz -Iarch/mips/include/asm/mac=
h-generic -fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks -=
O2 -fno-stack-protector -ftrivial-auto-var-init=3Dpattern -fexperimental-la=
te-parse-attributes -fdiagnostics-show-inlining-chain -pg -fstrict-flex-arr=
ays=3D3 -fno-strict-overflow -fno-stack-check -fno-builtin-wcslen -Wall -We=
xtra -Wundef -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-int=
 -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-security -Wn=
o-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-decl=
arations -Wmissing-prototypes -Wno-format-overflow-non-kprintf -Wno-format-=
truncation-non-kprintf -Wno-default-const-init-unsafe -Wno-type-limits -Wno=
-pointer-sign -Wcast-function-type -Wno-unterminated-string-initialization =
-Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Dincompatible-pointer-t=
ypes -Wenum-conversion -Wunused -Wmissing-format-attribute -Wmissing-includ=
e-dirs -Wunused-const-variable -Wno-missing-field-initializers -Wno-shift-n=
egative-value -Wno-enum-enum-conversion -Wno-sign-compare -Wno-unused-param=
eter -g -gdwarf-5 -DRANDSTRUCT -frandomize-layout-seed-file=3D./scripts/bas=
ic/randstruct.seed -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wreturn=
-type -funsigned-char -Wundef -falign-functions=3D64 -Ikernel -Ikernel -DKB=
UILD_MODFILE=3D'"kernel/ptrace"' -DKBUILD_BASENAME=3D'"ptrace"' -DKBUILD_MO=
DNAME=3D'"ptrace"' -D__KBUILD_MODNAME=3Dptrace -c -o kernel/ptrace.o kernel=
/ptrace.c

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
