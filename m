Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DFA33F8B8
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Mar 2026 12:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772540055; cv=none; b=b227afWEPslDk2quZFAcj+q5x2jmPq24PUyu6jqyoPk6Tz9QIpVUTLaxCaotvlJDqrU1NYWkFkCBGkS5aZmVadhLASOuAGuxvzIb0X4VHWyZZqzHHQbGtemsi8MVLYt2spMsOyEcJ41BESXhKRqzYYP6D9iAdDnw2ajjT9ZXpJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772540055; c=relaxed/simple;
	bh=1zLjTHkK++fIt7SlyqmyrFuFYAPIuNsor8tgKjmj2dI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=c0vS2qvxMgaoB6WSWYLPrkyzEexDaJFD+qzbhzQWA+tuNsg/AckF2salo/OLFKNxS6I18oQHKWngrDNlbsWEPY1rrftsbN/uj53KEMBk6rolmFP8CdMMdNJRUsrzU+lo8MyH/2ygINBZCdTDDgSOf1V8UgEUIury8GCYRdQinKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ul+nMCEO; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ul+nMCEO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772540051; x=1804076051;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1zLjTHkK++fIt7SlyqmyrFuFYAPIuNsor8tgKjmj2dI=;
  b=Ul+nMCEOlVm/AD62d3wERVSNUTV+bB2NdkDGVA8fU6cQ0zrplYf+kgLL
   boSCG3tMzFeOGRKXUKf02x73S5FpaWo4T+NtV0sHvgRoUoK+DiB5rEo4T
   zXyNhYc82nCJpDKuPwRsPN/xSFgifZ5wAsehplnHOHqwxeCUy/DI7ju8z
   Tfwd27c+oOWs2CGwFCtwKcnKCHrS/cWMdPvSxJp1t7tYUt4CSKQBnwma1
   bKk2QPlznQCWNXRg9z9mz++CHv01nQgc1eVsCxVbkQdE7vmFVMK4gnTGi
   dhLTnTHge6Xs01VIuKZ5qWs8hz8QsEntoakDYh2bmgCDbVCDsG/D+sFJY
   w==;
X-CSE-ConnectionGUID: OY0Y19EpQySFb6X+dp3dZQ==
X-CSE-MsgGUID: Wh+m383HTZSa+xervQKWlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="72601097"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="72601097"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 04:14:10 -0800
X-CSE-ConnectionGUID: AO0mKBi0SXGk24Qv4bzIig==
X-CSE-MsgGUID: 8jnFAUXGRKex/IvnvJvXtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="222983022"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Mar 2026 04:14:09 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxOda-000000002CT-2LoP;
	Tue, 03 Mar 2026 12:14:06 +0000
Date: Tue, 03 Mar 2026 20:13:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: /bin/bash: line 1: 2234372 Segmentation fault      clang
 -Wp,-MMD,arch/mips/math-emu/.sp_tlong.o.d -nostdinc -Iarch/mips/include
 -I./arch/mips/include/generated -Iinclude -I./include
 -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/...
Message-ID: <202603032025.96Ws1pHR-lkp@intel.com>
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
TO: Brahmajit Das <listout@listout.xyz>
CC: Alexei Starovoitov <ast@kernel.org>

Hi Brahmajit,

FYI, the error/warning was bisected to this commit, please ignore it if it'=
s irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   af4e9ef3d78420feb8fe58cd9a1ab80c501b3c08
commit: a1e83d4c0361f4b0e3b7ef8b603bf5e5ef60af86 selftests/bpf: Fix redefin=
ition of 'off' as different kind of symbol
date:   5 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 5 months ago
config: mips-randconfig-r053-20260303 (https://download.01.org/0day-ci/arch=
ive/20260303/202603032025.96Ws1pHR-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a1=
09fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260303/202603032025.96Ws1pHR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603032025.96Ws1pHR-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
All errors (new ones prefixed by >>):

   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,arch/mips/math-emu/.sp_tlong.o.d -n=
ostdinc -Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I./i=
nclude -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iincl=
ude/uapi -I./include/generated/uapi -include include/linux/compiler-version=
.h -include include/linux/kconfig.h -include include/linux/compiler_types.h=
 -D__KERNEL__ --target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknown=
-warning-option -Werror=3Dignored-optimization-argument -Werror=3Doption-ig=
nored -Werror=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xfff=
fffff80101000 -DLINKER_LOAD_ADDRESS=3D0x80101000 -DDATAOFFSET=3D0 -fmacro-p=
refix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -fu=
nsigned-char -fno-common -fno-PIE -fno-strict-aliasing -mno-check-zero-divi=
sion -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-f=
loat -ffreestanding -EB -fno-stack-check -march=3Dmips3 -Wa,--trap -DTOOLCH=
AIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-n64 -Iarch/mips/include/asm/=
mach-generic -fno-asynchronous-unwind-tables -fno-delete-null-pointer-check=
s -O2 -fno-stack-protector -pg -fstrict-flex-arrays=3D3 -fno-strict-overflo=
w -fno-stack-check -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=3Dimpl=
icit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Wer=
ror=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-addr=
ess -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-prototyp=
es -Wno-gnu -Wno-format-overflow-non-kprintf -Wno-format-truncation-non-kpr=
intf -Wno-default-const-init-unsafe -Wno-pointer-sign -Wcast-function-type =
-Wno-unterminated-string-initialization -Wimplicit-fallthrough -Werror=3Dda=
te-time -Werror=3Dincompatible-pointer-types -Wenum-conversion -Wunused -Wm=
issing-format-attribute -Wmissing-include-dirs -Wunused-const-variable -Wno=
-missing-field-initializers -Wno-type-limits -Wno-shift-negative-value -Wno=
-enum-enum-conversion -Wno-sign-compare -Wno-unused-parameter -DRANDSTRUCT =
-frandomize-layout-seed-file=3D./scripts/basic/randstruct.seed -fno-crash-d=
iagnostics -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -=
falign-functions=3D64 -Iarch/mips/math-emu -Iarch/mips/math-emu -DKBUILD_MO=
DFILE=3D\"arch/mips/math-emu/sp_tlong\" -DKBUILD_BASENAME=3D\"sp_tlong\" -D=
KBUILD_MODNAME=3D\"sp_tlong\" -D__KBUILD_MODNAME=3Dkmod_sp_tlong -c -o arch=
/mips/math-emu/sp_tlong.o arch/mips/math-emu/sp_tlong.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'arch/mips/math-emu/sp=
_tlong.c'.
   4.	Running pass 'Branch Probability Basic Block Placement' on function '=
@ieee754sp_tlong'
    #0 0x000055ade986d9fb llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-23+0x41019fb)
    #1 0x000055ade986b5c4 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
23+0x40ff5c4)
    #2 0x000055ade979fa60 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007fe5c593fdf0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x000055ade8e162af llvm::TailDuplicator::shouldTailDuplicate(bool, l=
lvm::MachineBasicBlock&) (.part.0) TailDuplicator.cpp:0:0
    #5 0x000055ade8b23d14 (anonymous namespace)::MachineBlockPlacement::bui=
ldCFGChains() MachineBlockPlacement.cpp:0:0
    #6 0x000055ade8b266f9 (anonymous namespace)::MachineBlockPlacement::run=
(llvm::MachineFunction&) MachineBlockPlacement.cpp:0:0
    #7 0x000055ade8b297c1 (anonymous namespace)::MachineBlockPlacementLegac=
y::runOnMachineFunction(llvm::MachineFunction&) (.part.0) MachineBlockPlace=
ment.cpp:0:0
    #8 0x000055ade8b796e8 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-23+0x340d6e8)
    #9 0x000055ade9151ea9 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-23+0x39e5ea9)
   #10 0x000055ade915204c llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-23+0x39e604c)
   #11 0x000055ade91512b8 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-23+0x39e52b8)
   #12 0x000055ade9c613d4 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-23+0x44f53d4)
   #13 0x000055adea2969d7 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-23+0x4b2a9d7)
   #14 0x000055adebbe34dc clang::ParseAST(clang::Sema&, bool, bool) (clang-=
23+0x64774dc)
   #15 0x000055adea5d9d7a clang::FrontendAction::Execute() (clang-23+0x4e6d=
d7a)
   #16 0x000055adea554ce6 clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-23+0x4de8ce6)
   #17 0x000055adea6bcb87 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-23+0x4f50b87)
   #18 0x000055ade66b7315 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-23+0xf4b315)
   #19 0x000055ade66af013 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #20 0x000055ade66af053 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #21 0x000055adea314e89 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #22 0x000055ade979fdc3 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-23+0x4033dc3)
   #23 0x000055adea3155b4 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #24 0x000055adea2d5928 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-23+0x4b69928)
   #25 0x000055adea2d6882 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-23+0x4b6a882)
   #26 0x000055adea2e6fcc clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-23+0x4b7afcc)
   #27 0x000055ade66b3ca3 clang_main(int, char**, llvm::ToolContext const&)=
 (clang-23+0xf47ca3)
   #28 0x000055ade654ca69 main (clang-23+0xde0a69)
   #29 0x00007fe5c5929ca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #30 0x00007fe5c5929d65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #31 0x000055ade66aea51 _start (clang-23+0xf42a51)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 2234372 Segmentation fault      clang -Wp,-MMD,arch/m=
ips/math-emu/.sp_tlong.o.d -nostdinc -Iarch/mips/include -I./arch/mips/incl=
ude/generated -Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips/=
include/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include i=
nclude/linux/compiler-version.h -include include/linux/kconfig.h -include i=
nclude/linux/compiler_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -fin=
tegrated-as -Werror=3Dunknown-warning-option -Werror=3Dignored-optimization=
-argument -Werror=3Doption-ignored -Werror=3Dunused-command-line-argument -=
DVMLINUX_LOAD_ADDRESS=3D0xffffffff80101000 -DLINKER_LOAD_ADDRESS=3D0x801010=
00 -DDATAOFFSET=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -=
std=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-=
aliasing -mno-check-zero-division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -p=
ipe -msoft-float -Wa,-msoft-float -ffreestanding -EB -fno-stack-check -marc=
h=3Dmips3 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach=
-n64 -Iarch/mips/include/asm/mach-generic -fno-asynchronous-unwind-tables -=
fno-delete-null-pointer-checks -O2 -fno-stack-protector -pg -fstrict-flex-a=
rrays=3D3 -fno-strict-overflow -fno-stack-check -fno-builtin-wcslen -Wall -=
Wextra -Wundef -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-i=
nt -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-security -=
Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-de=
clarations -Wmissing-prototypes -Wno-gnu -Wno-format-overflow-non-kprintf -=
Wno-format-truncation-non-kprintf -Wno-default-const-init-unsafe -Wno-point=
er-sign -Wcast-function-type -Wno-unterminated-string-initialization -Wimpl=
icit-fallthrough -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -=
Wenum-conversion -Wunused -Wmissing-format-attribute -Wmissing-include-dirs=
 -Wunused-const-variable -Wno-missing-field-initializers -Wno-type-limits -=
Wno-shift-negative-value -Wno-enum-enum-conversion -Wno-sign-compare -Wno-u=
nused-parameter -DRANDSTRUCT -frandomize-layout-seed-file=3D./scripts/basic=
/randstruct.seed -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wreturn-t=
ype -funsigned-char -Wundef -falign-functions=3D64 -Iarch/mips/math-emu -Ia=
rch/mips/math-emu -DKBUILD_MODFILE=3D'"arch/mips/math-emu/sp_tlong"' -DKBUI=
LD_BASENAME=3D'"sp_tlong"' -DKBUILD_MODNAME=3D'"sp_tlong"' -D__KBUILD_MODNA=
ME=3Dkmod_sp_tlong -c -o arch/mips/math-emu/sp_tlong.o arch/mips/math-emu/s=
p_tlong.c

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
