Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB71307492
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Jul 2026 20:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783803175; cv=none; b=Oth0C5dbZHTi+6vuCtqowCKxHIfSlQ94Ip9T0Z0gJSTMbuKoNYZEqV2elWPLj3zGxRIg8QqCiIFiX9dmx4EcBfogRgwedbeXHcX/bOxm78/OGuj8ABCXK+LWdhHLyDklv3VNSJqoy9T7VZ5y6ygm9mTBMaYTzkyIkhgizLV9nVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783803175; c=relaxed/simple;
	bh=kmKGYBCI+s5jiECyF8RtefHLMwrEw0Z0SCQODbVXGw0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FvLGvkRi5yY7Atj1m26HfIA18sPRCWoi6P2o1wj86TTrJxFeX9J4Uw9EzIRw++kDKBNzhHB/CFZFWhmw1gVluDFcQ3+8DWMBGK8FCTysWQm7idreWM7pubiOg8+hTPqtiaiwBb/TKsFuOga9myEHJWhMqBNvFK2lpYZGq3ysIZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F8GFxcoQ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F8GFxcoQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783803172; x=1815339172;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=kmKGYBCI+s5jiECyF8RtefHLMwrEw0Z0SCQODbVXGw0=;
  b=F8GFxcoQKEmCEhClIw0jSp/CIrCTBJjUuwfOx9CkvaciEVP7iL/bGOQ8
   sW1dSCiHAGneZAG12CRNzcuFOB7upqd5RJcsxMVcgx1ECq6hlkwOyx2c8
   39PkIq+Ps2m8iHJsXL7zlnNWklMztvSdHSfmJKtyvilZVbKqq2TVRqNYO
   LFjdt/Z9ifNyVhyr7l1WgpdoUUKahucIDDmV9kySeNOaah7ElVry15aOx
   QNfI9q0D7/Dl4iLX5W8f2wZAML3hb4FnX2jYqZGBxCA4ls0ui0Cpyitdq
   M63lYDBYGySv/Ej8CEJ7YxCFBMru+zEeiNRKRQArEGwvnnRWe7lyTJDRf
   Q==;
X-CSE-ConnectionGUID: P7L5kU03TR+GSoFXXWY2mQ==
X-CSE-MsgGUID: XPo704A8RUSBqobe0SI5BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88155597"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88155597"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 13:52:50 -0700
X-CSE-ConnectionGUID: Q8FcAusKRH+sulvYjfd3QA==
X-CSE-MsgGUID: CHTnjTQvTIioOrjDn6yTvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259058007"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 11 Jul 2026 13:52:48 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiegn-00000000KO0-37NG;
	Sat, 11 Jul 2026 20:52:45 +0000
Date: Sun, 12 Jul 2026 04:52:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: /bin/bash: line 1: 1095456 Segmentation fault      clang
 -Wp,-MMD,net/ipv6/.sit.o.d -nostdinc -Iarch/mips/include
 -I./arch/mips/include/generated -Iinclude -I./include
 -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi
 -I./includ...
Message-ID: <202607120443.9PdOP0WC-lkp@intel.com>
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
TO: Mateusz Guzik <mjguzik@gmail.com>
CC: Christian Brauner <brauner@kernel.org>
CC: Jan Kara <jack@suse.cz>

Hi Mateusz,

FYI, the error/warning was bisected to this commit, please ignore it if it'=
s irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   dd3210c47e8d3ac6b4e9141fc68acc03b38c0ba3
commit: ac8bcfc07d0ba68721a4ff750e7df12d203ae6ac fs: relocate and tidy up i=
hold()
date:   9 weeks ago
:::::: branch date: 18 hours ago
:::::: commit date: 9 weeks ago
config: mips-randconfig-r062-20260707 (https://download.01.org/0day-ci/arch=
ive/20260712/202607120443.9PdOP0WC-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2=
fb2a2269da0e2a3e230beb6cad39ca314db33)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260712/202607120443.9PdOP0WC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: ac8bcfc07d0b ("fs: relocate and tidy up ihold()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607120443.9PdOP0WC-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
All errors (new ones prefixed by >>):

   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace and dumped files.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,net/ipv6/.sit.o.d -nostdinc -Iarch/=
mips/include -I./arch/mips/include/generated -Iinclude -I./include -Iarch/m=
ips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi -I./in=
clude/generated/uapi -include include/linux/compiler-version.h -include inc=
lude/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -=
-target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknown-warning-option=
 -Werror=3Dignored-optimization-argument -Werror=3Doption-ignored -Werror=
=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xffffffff84000000=
 -DLINKER_LOAD_ADDRESS=3D0x84000000 -DDATAOFFSET=3D0 -fmacro-prefix-map=3D=
=3D -Wundef -DKBUILD_EXTRA_WARN1 -fshort-wchar -funsigned-char -fno-common =
-fno-PIE -fno-strict-aliasing -std=3Dgnu11 -fms-anonymous-structs -Wno-gnu =
-Wno-microsoft-anon-tag -mno-check-zero-division -mabi=3D32 -G 0 -mno-abica=
lls -fno-pic -pipe -msoft-float -Wa,-msoft-float -ffreestanding -EL -fno-st=
ack-check -march=3Dmips4 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/i=
nclude/asm/mach-rm -Iarch/mips/include/asm/mach-generic -fno-asynchronous-u=
nwind-tables -fno-delete-null-pointer-checks -Os -fstack-protector-strong -=
ftrivial-auto-var-init=3Dpattern -fexperimental-late-parse-attributes -fdia=
gnostics-show-inlining-chain -pg -fstrict-flex-arrays=3D3 -fno-strict-overf=
low -fno-stack-check -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=3Dim=
plicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -W=
error=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-ad=
dress -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-protot=
ypes -Wno-format-overflow-non-kprintf -Wno-format-truncation-non-kprintf -W=
no-default-const-init-unsafe -Wno-type-limits -Wno-pointer-sign -Wcast-func=
tion-type -Wno-unterminated-string-initialization -Wimplicit-fallthrough -W=
error=3Ddate-time -Werror=3Dincompatible-pointer-types -Wenum-conversion -W=
unused -Wmissing-format-attribute -Wmissing-include-dirs -Wunused-const-var=
iable -Wno-missing-field-initializers -Wno-shift-negative-value -Wno-enum-e=
num-conversion -Wno-sign-compare -Wno-unused-parameter -g -gdwarf-5 -DRANDS=
TRUCT -frandomize-layout-seed-file=3D./scripts/basic/randstruct.seed -fno-c=
rash-diagnostics -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wu=
ndef -falign-functions=3D64 -fsanitize=3Darray-bounds -fsanitize=3Dshift -f=
sanitize=3Dunreachable -fsanitize=3Dbool -Inet/ipv6 -Inet/ipv6 -DKBUILD_MOD=
FILE=3D\"net/ipv6/sit\" -DKBUILD_BASENAME=3D\"sit\" -DKBUILD_MODNAME=3D\"si=
t\" -D__KBUILD_MODNAME=3Dsit -c -o net/ipv6/sit.o net/ipv6/sit.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'net/ipv6/sit.c'.
   4.	Running pass 'Branch Probability Basic Block Placement' on function '=
@ipip6_rcv'
    #0 0x000055c1f34f76da llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-23+0x3e266da)
    #1 0x000055c1f34f52a4 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
23+0x3e242a4)
    #2 0x000055c1f342aa00 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007fc0f9d3edf0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x000055c1f2b1b24f llvm::TailDuplicator::shouldTailDuplicate(bool, l=
lvm::MachineBasicBlock&) (.part.0) TailDuplicator.cpp:0:0
    #5 0x000055c1f286228e (anonymous namespace)::MachineBlockPlacement::pre=
computeTriangleChains() MachineBlockPlacement.cpp:0:0
    #6 0x000055c1f286febb (anonymous namespace)::MachineBlockPlacement::run=
(llvm::MachineFunction&) MachineBlockPlacement.cpp:0:0
    #7 0x000055c1f28732cc (anonymous namespace)::MachineBlockPlacementLegac=
y::runOnMachineFunction(llvm::MachineFunction&) (.part.0) MachineBlockPlace=
ment.cpp:0:0
    #8 0x000055c1f28b56b3 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-23+0x31e46b3)
    #9 0x000055c1f2e04979 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-23+0x3733979)
   #10 0x000055c1f2e04dac llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-23+0x3733dac)
   #11 0x000055c1f2e0594a (anonymous namespace)::MPPassManager::runOnModule=
(llvm::Module&) LegacyPassManager.cpp:0:0
   #12 0x000055c1f2e0601c llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-23+0x373501c)
   #13 0x000055c1f38a11af (anonymous namespace)::EmitAssemblyHelper::TimeCo=
degenPasses(llvm::function_ref<void ()>) BackendUtil.cpp:0:0
   #14 0x000055c1f38b29f2 (anonymous namespace)::EmitAssemblyHelper::emitAs=
sembly(clang::BackendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::=
default_delete<llvm::raw_pwrite_stream>>, clang::BackendConsumer*) (.constp=
rop.0) BackendUtil.cpp:0:0
   #15 0x000055c1f38b2c2f clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-23+0x41e1c2f)
   #16 0x000055c1f3ee8907 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-23+0x4817907)
   #17 0x000055c1f58f2a8c clang::ParseAST(clang::Sema&, bool, bool) (clang-=
23+0x6221a8c)
   #18 0x000055c1f424b35e clang::FrontendAction::Execute() (clang-23+0x4b7a=
35e)
   #19 0x000055c1f41d675e clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-23+0x4b0575e)
   #20 0x000055c1f4334a07 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-23+0x4c63a07)
   #21 0x000055c1f053f4c8 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-23+0xe6e4c8)
   #22 0x000055c1f0537193 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #23 0x000055c1f05371d3 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #24 0x000055c1f3f61ff9 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #25 0x000055c1f342ad63 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-23+0x3d59d63)
   #26 0x000055c1f3f6354c clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #27 0x000055c1f3f1e848 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-23+0x484d848)
   #28 0x000055c1f3f1f7e2 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-23+0x484e7e2)
   #29 0x000055c1f3f3303c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-23+0x486203c)
   #30 0x000055c1f053be52 clang_main(int, char**, llvm::ToolContext const&)=
 (clang-23+0xe6ae52)
   #31 0x000055c1f04573f9 main (clang-23+0xd863f9)
   #32 0x00007fc0f9d28ca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #33 0x00007fc0f9d28d65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #34 0x000055c1f0536bf1 _start (clang-23+0xe65bf1)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 1095456 Segmentation fault      clang -Wp,-MMD,net/ip=
v6/.sit.o.d -nostdinc -Iarch/mips/include -I./arch/mips/include/generated -=
Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips/include/generat=
ed/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linux/co=
mpiler-version.h -include include/linux/kconfig.h -include include/linux/co=
mpiler_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -fintegrated-as -We=
rror=3Dunknown-warning-option -Werror=3Dignored-optimization-argument -Werr=
or=3Doption-ignored -Werror=3Dunused-command-line-argument -DVMLINUX_LOAD_A=
DDRESS=3D0xffffffff84000000 -DLINKER_LOAD_ADDRESS=3D0x84000000 -DDATAOFFSET=
=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -fshort-wchar -f=
unsigned-char -fno-common -fno-PIE -fno-strict-aliasing -std=3Dgnu11 -fms-a=
nonymous-structs -Wno-gnu -Wno-microsoft-anon-tag -mno-check-zero-division =
-mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-float =
-ffreestanding -EL -fno-stack-check -march=3Dmips4 -Wa,--trap -DTOOLCHAIN_S=
UPPORTS_VIRT -Iarch/mips/include/asm/mach-rm -Iarch/mips/include/asm/mach-g=
eneric -fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks -Os =
-fstack-protector-strong -ftrivial-auto-var-init=3Dpattern -fexperimental-l=
ate-parse-attributes -fdiagnostics-show-inlining-chain -pg -fstrict-flex-ar=
rays=3D3 -fno-strict-overflow -fno-stack-check -fno-builtin-wcslen -Wall -W=
extra -Wundef -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-in=
t -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-security -W=
no-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-dec=
larations -Wmissing-prototypes -Wno-format-overflow-non-kprintf -Wno-format=
-truncation-non-kprintf -Wno-default-const-init-unsafe -Wno-type-limits -Wn=
o-pointer-sign -Wcast-function-type -Wno-unterminated-string-initialization=
 -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Dincompatible-pointer-=
types -Wenum-conversion -Wunused -Wmissing-format-attribute -Wmissing-inclu=
de-dirs -Wunused-const-variable -Wno-missing-field-initializers -Wno-shift-=
negative-value -Wno-enum-enum-conversion -Wno-sign-compare -Wno-unused-para=
meter -g -gdwarf-5 -DRANDSTRUCT -frandomize-layout-seed-file=3D./scripts/ba=
sic/randstruct.seed -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wretur=
n-type -funsigned-char -Wundef -falign-functions=3D64 -fsanitize=3Darray-bo=
unds -fsanitize=3Dshift -fsanitize=3Dunreachable -fsanitize=3Dbool -Inet/ip=
v6 -Inet/ipv6 -DKBUILD_MODFILE=3D'"net/ipv6/sit"' -DKBUILD_BASENAME=3D'"sit=
"' -DKBUILD_MODNAME=3D'"sit"' -D__KBUILD_MODNAME=3Dsit -c -o net/ipv6/sit.o=
 net/ipv6/sit.c

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
