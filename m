Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D7120299B
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Jul 2026 12:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785070416; cv=none; b=LCRwNGkJ1RGklCspALMI0jkg6y7oVDDLzR8Ru9wlCR8IXylLmXAPW6sAqgP7byVbAx56xFyfq43RDrE8TB9PcBoDky8qfpos2wmcuQY3Zu74xj7JkqZO6h6B723spH3kH+8BWH+g8EUOJWDMV1VeiNFQ4XLerFZfDeaLPnieLro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785070416; c=relaxed/simple;
	bh=wdJVC4LbRzUL4arM0gKXDqecKfeNmI8b1mvN+zdbGSU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=M0/5QX2HCyXaSgCSVVZmSf1rhb1YqW5Axwx5H2PE/0PGoudDmM3Z+d+CFD3rCKzS5dxpjMO33t+psBFhIgUE0IvO50eIKQf0xpVww3vutnEsapgtcd1f8AguNgFIsjreEU3FQThS83tyz1tcRexDO6MBvpqpAQVR8yXIXzgx1+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yh+EnpNg; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yh+EnpNg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785070414; x=1816606414;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wdJVC4LbRzUL4arM0gKXDqecKfeNmI8b1mvN+zdbGSU=;
  b=Yh+EnpNgWk9LQeKLxm+T7QryvFkbWyJtUU9awWofgRUHK3u3EaLPC6xH
   6pjW+1FNVV2y7ZHJt6CKCso11LQONUYQKtbhFLcw8C6uLli79myBUNiCc
   uiNVFAM4jZKAsAgYUbvkwZJKaYVPPCkGWMiY/YdDt7l4uEh2mXL+XLM0t
   Q7gG0Pv7I9ZgFWuj0QSQv5ikZffP3+NGktAM8Pad2C2UKHX+M6Zux6pn/
   0zAa7ZkiWDrfzDhBq1BxHUaqv0H0gXZUd+FYPcUCcTMchPE0wXV3oT1SF
   csV32iYXu1R45M+D9auYM0MBkBVBwQhIaJWwpeMSOqj41BcfMG3WJV6iQ
   A==;
X-CSE-ConnectionGUID: g7H8P1hmQwKF7sPzZ7/TvQ==
X-CSE-MsgGUID: O5RKaAtkQoO+mdtaC6lRqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="85603944"
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="85603944"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2026 05:53:33 -0700
X-CSE-ConnectionGUID: Q/Izi9/1QkepT8TeegBHAw==
X-CSE-MsgGUID: FDvAOxvmQ3WxHq2jIWDiJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="289127277"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 26 Jul 2026 05:53:32 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnyMA-00000000cWo-3cTj;
	Sun, 26 Jul 2026 12:53:27 +0000
Date: Sun, 26 Jul 2026 20:52:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: /bin/bash: line 1: 3189523 Segmentation fault      clang
 -Wp,-MMD,arch/mips/math-emu/.sp_sub.o.d -nostdinc -Iarch/mips/include
 -I./arch/mips/include/generated -Iinclude -I./include
 -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/ua...
Message-ID: <202607262019.8ot0LKPP-lkp@intel.com>
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
TO: Jeffrey Bencteux <jeff@bencteux.fr>
CC: Paul Moore <paul@paul-moore.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0ce37745d4bfbc493f718169c3974898ffec8ee7
commit: 4f493a6079b588cf1f04ce5ed6cdad45ab0d53dc audit: add fchmodat2() to =
change attributes class
date:   7 months ago
:::::: branch date: 33 hours ago
:::::: commit date: 7 months ago
config: mips-randconfig-r071-20260726 (https://download.01.org/0day-ci/arch=
ive/20260726/202607262019.8ot0LKPP-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 890=
b11e09e45e9d8b29f2f94f22052be3934e757)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260726/202607262019.8ot0LKPP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 4f493a6079b5 ("audit: add fchmodat2() to change attributes class")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607262019.8ot0LKPP-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
All errors (new ones prefixed by >>):

   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace and dumped files.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,arch/mips/math-emu/.sp_sub.o.d -nos=
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
 -Os -fstack-protector -ftrivial-auto-var-init=3Dpattern -pg -fstrict-flex-=
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
-enum-conversion -Wno-sign-compare -Wno-unused-parameter -fno-crash-diagnos=
tics -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -falign=
-functions=3D64 -fsanitize=3Darray-bounds -Iarch/mips/math-emu -Iarch/mips/=
math-emu -DKBUILD_MODFILE=3D\"arch/mips/math-emu/sp_sub\" -DKBUILD_BASENAME=
=3D\"sp_sub\" -DKBUILD_MODNAME=3D\"sp_sub\" -D__KBUILD_MODNAME=3Dsp_sub -c =
-o arch/mips/math-emu/sp_sub.o arch/mips/math-emu/sp_sub.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'arch/mips/math-emu/sp=
_sub.c'.
   4.	Running pass 'Branch Probability Basic Block Placement' on function '=
@ieee754sp_sub'
    #0 0x000055a041f7048a llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-24+0x38c748a)
    #1 0x000055a041f6e064 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
24+0x38c5064)
    #2 0x000055a041ea38c0 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007f818fb62df0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x000055a04158e88f llvm::TailDuplicator::shouldTailDuplicate(bool, l=
lvm::MachineBasicBlock&) (.part.0) TailDuplicator.cpp:0:0
    #5 0x000055a0412d252b (anonymous namespace)::MachineBlockPlacement::pre=
computeTriangleChains() MachineBlockPlacement.cpp:0:0
    #6 0x000055a0412e037b (anonymous namespace)::MachineBlockPlacement::run=
(llvm::MachineFunction&) MachineBlockPlacement.cpp:0:0
    #7 0x000055a0412e378c (anonymous namespace)::MachineBlockPlacementLegac=
y::runOnMachineFunction(llvm::MachineFunction&) (.part.0) MachineBlockPlace=
ment.cpp:0:0
    #8 0x000055a0413234f3 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-24+0x2c7a4f3)
    #9 0x000055a041879bb9 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-24+0x31d0bb9)
   #10 0x000055a041879fec llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-24+0x31d0fec)
   #11 0x000055a04187ab8a (anonymous namespace)::MPPassManager::runOnModule=
(llvm::Module&) LegacyPassManager.cpp:0:0
   #12 0x000055a04187b25c llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-24+0x31d225c)
   #13 0x000055a042321a6f (anonymous namespace)::EmitAssemblyHelper::TimeCo=
degenPasses(llvm::function_ref<void ()>) BackendUtil.cpp:0:0
   #14 0x000055a042332d7a (anonymous namespace)::EmitAssemblyHelper::emitAs=
sembly(clang::BackendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::=
default_delete<llvm::raw_pwrite_stream>>, clang::BackendConsumer*) (.constp=
rop.0) BackendUtil.cpp:0:0
   #15 0x000055a042332f6f clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-24+0x3c89f6f)
   #16 0x000055a04296dec7 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-24+0x42c4ec7)
   #17 0x000055a044377fcc clang::ParseAST(clang::Sema&, bool, bool) (clang-=
24+0x5ccefcc)
   #18 0x000055a042cce41e clang::FrontendAction::Execute() (clang-24+0x4625=
41e)
   #19 0x000055a042c594ee clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-24+0x45b04ee)
   #20 0x000055a042d99247 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-24+0x46f0247)
   #21 0x000055a03ef86748 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-24+0x8dd748)
   #22 0x000055a03ef7e413 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #23 0x000055a03ef7e453 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #24 0x000055a0429ebb09 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #25 0x000055a041ea3c23 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-24+0x37fac23)
   #26 0x000055a0429ed08c clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #27 0x000055a0429a5898 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-24+0x42fc898)
   #28 0x000055a0429aa0d2 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-24+0x43010d2)
   #29 0x000055a0429bbedc clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-24+0x4312edc)
   #30 0x000055a03ef830d2 clang_main(int, char**, llvm::ToolContext const&)=
 (clang-24+0x8da0d2)
   #31 0x000055a03ee9e279 main (clang-24+0x7f5279)
   #32 0x00007f818fb4cca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #33 0x00007f818fb4cd65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #34 0x000055a03ef7de71 _start (clang-24+0x8d4e71)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 3189523 Segmentation fault      clang -Wp,-MMD,arch/m=
ips/math-emu/.sp_sub.o.d -nostdinc -Iarch/mips/include -I./arch/mips/includ=
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
fno-delete-null-pointer-checks -Os -fstack-protector -ftrivial-auto-var-ini=
t=3Dpattern -pg -fstrict-flex-arrays=3D3 -fms-extensions -fno-strict-overfl=
ow -fno-stack-check -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=3Dimp=
licit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -We=
rror=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-add=
ress -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-prototy=
pes -Wno-gnu -Wno-microsoft-anon-tag -Wno-format-overflow-non-kprintf -Wno-=
format-truncation-non-kprintf -Wno-default-const-init-unsafe -Wno-pointer-s=
ign -Wcast-function-type -Wno-unterminated-string-initialization -Wimplicit=
-fallthrough -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wenu=
m-conversion -Wunused -Wmissing-format-attribute -Wmissing-include-dirs -Wu=
nused-const-variable -Wno-missing-field-initializers -Wno-type-limits -Wno-=
shift-negative-value -Wno-enum-enum-conversion -Wno-sign-compare -Wno-unuse=
d-parameter -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wreturn-type -=
funsigned-char -Wundef -falign-functions=3D64 -fsanitize=3Darray-bounds -Ia=
rch/mips/math-emu -Iarch/mips/math-emu -DKBUILD_MODFILE=3D'"arch/mips/math-=
emu/sp_sub"' -DKBUILD_BASENAME=3D'"sp_sub"' -DKBUILD_MODNAME=3D'"sp_sub"' -=
D__KBUILD_MODNAME=3Dsp_sub -c -o arch/mips/math-emu/sp_sub.o arch/mips/math=
-emu/sp_sub.c

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
