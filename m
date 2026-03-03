Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85732561A7
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Mar 2026 07:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772522876; cv=none; b=VHoI+tRs0kMQY+x5+mWX5akVMDy7pN/QOV7VRPCifNEJvkmY0fXycHiqn7kCM4ZTmkx4Ky5CWwqlRtdx83InvSCg9vs0X5JAqNcJ3134nye+Kv5JOct6zQ2Hpim+ndBoDWp5panLgkk/p5g9dZRwg6vDsZus3w6qz42RqXsPQLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772522876; c=relaxed/simple;
	bh=HOyS1mYeYQjjCkBR3FPXMLRZWM3fK5yJ8P91LIvNomo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=floE57QfATVgyCd06RdiP4ck/rrN3hGPrtitJenXoy607QDK/vYCyRWUXgx8z9hKKfngUtphUCKDiFnJ2s36WlkSLfITnEVdXO9UhgpnGR6GLCqPjEGk+5HVhtWfR1jHKSG6CsouB6peCPKzcsmnA8oU4ow+4/FP982ZkbIz6hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iZqZvtnh; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iZqZvtnh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772522872; x=1804058872;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HOyS1mYeYQjjCkBR3FPXMLRZWM3fK5yJ8P91LIvNomo=;
  b=iZqZvtnhvREZdxKSiX2TITq4tIfq01LDH/gJBTu+mrEwjZjHLOyn+Y8F
   Rpxv0OlVUdOgHGhDl3u8ICBpRP/BY/Njehxpe+erMrOg9299EnslMkAby
   R9Re0/NAEtzzx0Dvm59nkoYfjyt151FGrrjttpVkd6Ru5TRILhGVUhjCO
   iMjkTuDq1Krmh06UVY7eYxU8U32/pbUaKpJhXBUu5fq74Zp+KUE6b5FZ9
   WAyDtHfjftUU0LPoTevGZ7h5XxUzlb0kqq3Z1EwWmvgaqDZFYPAeJoH5t
   cs/7l34ijcLne5sj0spPUnKbP7N7j18GdsMOYp93Pysl3LoarwxRpmxTm
   A==;
X-CSE-ConnectionGUID: fQ0UJqnGTjeK/4vNFAQaUQ==
X-CSE-MsgGUID: xoBuzmneR8OwgPeEu1GDRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="84896254"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="84896254"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 23:27:51 -0800
X-CSE-ConnectionGUID: 5KZxvdKBTDaYd//OcCrjog==
X-CSE-MsgGUID: 9d5xgFoxQtSMkNcZ167NlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="255787302"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 Mar 2026 23:27:50 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxKAV-000000001pB-16PA;
	Tue, 03 Mar 2026 07:27:47 +0000
Date: Tue, 03 Mar 2026 15:27:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: /bin/bash: line 1: 427939 Segmentation fault      clang
 -Wp,-MMD,lib/.stackdepot.o.d -nostdinc -Iarch/mips/include
 -I./arch/mips/include/generated -Iinclude -I./include
 -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi
 -I./inclu...
Message-ID: <202603031503.kQtpli4Q-lkp@intel.com>
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
TO: Vlastimil Babka <vbabka@suse.cz>
CC: Alexei Starovoitov <ast@kernel.org>
CC: Andrii Nakryiko <andrii@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   af4e9ef3d78420feb8fe58cd9a1ab80c501b3c08
commit: f90b474a35744b5d43009e4fab232e74a3024cae mm: Fix the flipped condit=
ion in gfpflags_allow_spinning()
date:   12 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 12 months ago
config: mips-randconfig-r053-20260303 (https://download.01.org/0day-ci/arch=
ive/20260303/202603031503.kQtpli4Q-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a1=
09fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260303/202603031503.kQtpli4Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603031503.kQtpli4Q-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
All errors (new ones prefixed by >>):

   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,lib/.stackdepot.o.d -nostdinc -Iarc=
h/mips/include -I./arch/mips/include/generated -Iinclude -I./include -Iarch=
/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi -I./=
include/generated/uapi -include include/linux/compiler-version.h -include i=
nclude/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__=
 --target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknown-warning-opti=
on -Werror=3Dignored-optimization-argument -Werror=3Doption-ignored -Werror=
=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xffffffff80101000=
 -DLINKER_LOAD_ADDRESS=3D0x80101000 -DDATAOFFSET=3D0 -fmacro-prefix-map=3D=
=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -funsigned-char=
 -fno-common -fno-PIE -fno-strict-aliasing -mno-check-zero-division -mabi=
=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-float -ffre=
estanding -EB -fno-stack-check -march=3Dmips3 -Wa,--trap -DTOOLCHAIN_SUPPOR=
TS_VIRT -Iarch/mips/include/asm/mach-n64 -Iarch/mips/include/asm/mach-gener=
ic -fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks -O2 -fno=
-stack-protector -fstrict-flex-arrays=3D3 -fno-strict-overflow -fno-stack-c=
heck -Wall -Wundef -Werror=3Dimplicit-function-declaration -Werror=3Dimplic=
it-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-securi=
ty -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissin=
g-declarations -Wmissing-prototypes -Wno-gnu -Wvla -Wno-pointer-sign -Wcast=
-function-type -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Dincompa=
tible-pointer-types -Wenum-conversion -Wextra -Wunused -Wmissing-format-att=
ribute -Wmissing-include-dirs -Wunused-const-variable -Wno-missing-field-in=
itializers -Wno-type-limits -Wno-shift-negative-value -Wno-sign-compare -Wn=
o-unused-parameter -DRANDSTRUCT -frandomize-layout-seed-file=3D./scripts/ba=
sic/randstruct.seed -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wretur=
n-type -funsigned-char -Wundef -falign-functions=3D64 -fno-builtin -Ilib -I=
lib -DKBUILD_MODFILE=3D\"lib/stackdepot\" -DKBUILD_BASENAME=3D\"stackdepot\=
" -DKBUILD_MODNAME=3D\"stackdepot\" -D__KBUILD_MODNAME=3Dkmod_stackdepot -c=
 -o lib/stackdepot.o lib/stackdepot.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'lib/stackdepot.c'.
   4.	Running pass 'Branch Probability Basic Block Placement' on function '=
@stack_depot_save_flags'
    #0 0x000055f1e07339fb llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-23+0x41019fb)
    #1 0x000055f1e07315c4 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
23+0x40ff5c4)
    #2 0x000055f1e0665a60 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007fb32ec53df0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x000055f1dfcdee4b llvm::TailDuplicator::tailDuplicate(bool, llvm::M=
achineBasicBlock*, llvm::MachineBasicBlock*, llvm::SmallVectorImpl<llvm::Ma=
chineBasicBlock*>&, llvm::SmallVectorImpl<llvm::MachineInstr*>&, llvm::Smal=
lVectorImpl<llvm::MachineBasicBlock*>*) (clang-23+0x36ace4b)
    #5 0x000055f1dfce1ca8 llvm::TailDuplicator::tailDuplicateAndUpdate(bool=
, llvm::MachineBasicBlock*, llvm::MachineBasicBlock*, llvm::SmallVectorImpl=
<llvm::MachineBasicBlock*>*, llvm::function_ref<void (llvm::MachineBasicBlo=
ck*)>*, llvm::SmallVectorImpl<llvm::MachineBasicBlock*>*) (clang-23+0x36afc=
a8)
    #6 0x000055f1df9e3168 (anonymous namespace)::MachineBlockPlacement::may=
beTailDuplicateBlock(llvm::MachineBasicBlock*, llvm::MachineBasicBlock*, (a=
nonymous namespace)::BlockChain&, llvm::SmallSetVector<llvm::MachineBasicBl=
ock const*, 16u>*, llvm::ilist_iterator<llvm::ilist_detail::node_options<ll=
vm::MachineBasicBlock, false, false, void, false, void>, false, false>&, ll=
vm::MachineBasicBlock const* const*&, bool&) MachineBlockPlacement.cpp:0:0
    #7 0x000055f1df9e3eb4 (anonymous namespace)::MachineBlockPlacement::rep=
eatedlyTailDuplicateBlock(llvm::MachineBasicBlock*, llvm::MachineBasicBlock=
*&, llvm::MachineBasicBlock const*, (anonymous namespace)::BlockChain&, llv=
m::SmallSetVector<llvm::MachineBasicBlock const*, 16u>*, llvm::ilist_iterat=
or<llvm::ilist_detail::node_options<llvm::MachineBasicBlock, false, false, =
void, false, void>, false, false>&, llvm::MachineBasicBlock const* const*&)=
 (.isra.0) MachineBlockPlacement.cpp:0:0
    #8 0x000055f1df9e9c96 (anonymous namespace)::MachineBlockPlacement::bui=
ldCFGChains() MachineBlockPlacement.cpp:0:0
    #9 0x000055f1df9ec6f9 (anonymous namespace)::MachineBlockPlacement::run=
(llvm::MachineFunction&) MachineBlockPlacement.cpp:0:0
   #10 0x000055f1df9ef7c1 (anonymous namespace)::MachineBlockPlacementLegac=
y::runOnMachineFunction(llvm::MachineFunction&) (.part.0) MachineBlockPlace=
ment.cpp:0:0
   #11 0x000055f1dfa3f6e8 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-23+0x340d6e8)
   #12 0x000055f1e0017ea9 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-23+0x39e5ea9)
   #13 0x000055f1e001804c llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-23+0x39e604c)
   #14 0x000055f1e00172b8 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-23+0x39e52b8)
   #15 0x000055f1e0b273d4 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-23+0x44f53d4)
   #16 0x000055f1e115c9d7 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-23+0x4b2a9d7)
   #17 0x000055f1e2aa94dc clang::ParseAST(clang::Sema&, bool, bool) (clang-=
23+0x64774dc)
   #18 0x000055f1e149fd7a clang::FrontendAction::Execute() (clang-23+0x4e6d=
d7a)
   #19 0x000055f1e141ace6 clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-23+0x4de8ce6)
   #20 0x000055f1e1582b87 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-23+0x4f50b87)
   #21 0x000055f1dd57d315 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-23+0xf4b315)
   #22 0x000055f1dd575013 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #23 0x000055f1dd575053 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #24 0x000055f1e11dae89 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #25 0x000055f1e0665dc3 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-23+0x4033dc3)
   #26 0x000055f1e11db5b4 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #27 0x000055f1e119b928 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-23+0x4b69928)
   #28 0x000055f1e119c882 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-23+0x4b6a882)
   #29 0x000055f1e11acfcc clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-23+0x4b7afcc)
   #30 0x000055f1dd579ca3 clang_main(int, char**, llvm::ToolContext const&)=
 (clang-23+0xf47ca3)
   #31 0x000055f1dd412a69 main (clang-23+0xde0a69)
   #32 0x00007fb32ec3dca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #33 0x00007fb32ec3dd65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #34 0x000055f1dd574a51 _start (clang-23+0xf42a51)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 427939 Segmentation fault      clang -Wp,-MMD,lib/.st=
ackdepot.o.d -nostdinc -Iarch/mips/include -I./arch/mips/include/generated =
-Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips/include/genera=
ted/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linux/c=
ompiler-version.h -include include/linux/kconfig.h -include include/linux/c=
ompiler_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -fintegrated-as -W=
error=3Dunknown-warning-option -Werror=3Dignored-optimization-argument -Wer=
ror=3Doption-ignored -Werror=3Dunused-command-line-argument -DVMLINUX_LOAD_=
ADDRESS=3D0xffffffff80101000 -DLINKER_LOAD_ADDRESS=3D0x80101000 -DDATAOFFSE=
T=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -f=
short-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -mno-=
check-zero-division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-flo=
at -Wa,-msoft-float -ffreestanding -EB -fno-stack-check -march=3Dmips3 -Wa,=
--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-n64 -Iarch/mi=
ps/include/asm/mach-generic -fno-asynchronous-unwind-tables -fno-delete-nul=
l-pointer-checks -O2 -fno-stack-protector -fstrict-flex-arrays=3D3 -fno-str=
ict-overflow -fno-stack-check -Wall -Wundef -Werror=3Dimplicit-function-dec=
laration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prot=
otypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wno-address-=
of-packed-member -Wmissing-declarations -Wmissing-prototypes -Wno-gnu -Wvla=
 -Wno-pointer-sign -Wcast-function-type -Wimplicit-fallthrough -Werror=3Dda=
te-time -Werror=3Dincompatible-pointer-types -Wenum-conversion -Wextra -Wun=
used -Wmissing-format-attribute -Wmissing-include-dirs -Wunused-const-varia=
ble -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-negative-va=
lue -Wno-sign-compare -Wno-unused-parameter -DRANDSTRUCT -frandomize-layout=
-seed-file=3D./scripts/basic/randstruct.seed -fno-crash-diagnostics -Wno-er=
ror=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -falign-functions=
=3D64 -fno-builtin -Ilib -Ilib -DKBUILD_MODFILE=3D'"lib/stackdepot"' -DKBUI=
LD_BASENAME=3D'"stackdepot"' -DKBUILD_MODNAME=3D'"stackdepot"' -D__KBUILD_M=
ODNAME=3Dkmod_stackdepot -c -o lib/stackdepot.o lib/stackdepot.c

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
