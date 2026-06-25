Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A4B3812CD
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Jun 2026 10:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782382904; cv=none; b=gvWIVQRY+rwMuXdvTVFHVWUg354PC5yImyF2eTy8AC431UshcIhlPLhYEjb1pCn4+fcO2J2yIMtSMcrDCjOs5jIfi5gwgA2zX9+yKNJW8u76OZQC/L9eirMFk0MnNya9/uzHszVk4ggvISpaAALgKehOI7xPmPb4ow6+uxI4T98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782382904; c=relaxed/simple;
	bh=sHmfxoN5SMZ5HJcvduCZ6PIRu7MHVAgGKHIn5oD9p7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JonrLbH0T3hQW8n/7pHDklnEtq38Mg+tzxVErpok5yDH+FPBa2OhcUbeTOlf9xk9MfkWr6TIfawXqfrbOox1GFfpQEq0tGl5zH/8+t77mH6+htsx5DKXU6WlNlFRtbdW41GQLzLSK/+ajUs4Fck7pJdn7bnjFyWLXsLSu+8V1nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LcoQYjC2; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LcoQYjC2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782382903; x=1813918903;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sHmfxoN5SMZ5HJcvduCZ6PIRu7MHVAgGKHIn5oD9p7Y=;
  b=LcoQYjC2aFsXg/5q1CHfl1aV6ePJMA3DGobaog+kH0Qbhl+7UjUp3o5O
   uCaQOCgojtIe7+XUZFRaUTHh3jzBdbVwtachGJNWiwSfHktkdNywE78Qx
   gaMCkTVBlRXT+aSFqZyzbkDLJgLVIFeNQ7OPaK78aDxbcnU4xRsTUhKSJ
   4WK+VuILF09Y0glb3biaDA49ZVX54aT5qE8MawnaRGXqPmiM50fxE/qqj
   D+ZbH0c5+6ijMkIYlTESCUk89A1mhQPMPhHd9K94DtFe9lCjeWsiR5kb/
   KMaiO8JCwRWVv4gUGu4wAe06yGzKi65dCDq72VBtb4CAjNb9IPYE6TGLh
   w==;
X-CSE-ConnectionGUID: 0x76gGKrRfyWfmGwPoXcBQ==
X-CSE-MsgGUID: BNiQQSxfQUmbEN9N/NIYrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="83346753"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="83346753"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 03:21:42 -0700
X-CSE-ConnectionGUID: +2SSVa1ZSeeFjt9q1wCOGg==
X-CSE-MsgGUID: 3BZq3xEvSROVvCXeZwORZg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 25 Jun 2026 03:21:41 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wchDG-0000000044n-3x7k;
	Thu, 25 Jun 2026 10:21:38 +0000
Date: Thu, 25 Jun 2026 18:20:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: /bin/bash: line 1: 132482 Segmentation fault      clang
 -Wp,-MMD,drivers/media/pci/zoran/.zoran_device.o.d -nostdinc
 -Iarch/powerpc/include -I./arch/powerpc/include/generated -Iinclude
 -I./include -Iarch/powerpc/include/uapi -I./arch/powerpc/include/gener...
Message-ID: <202606251849.vIdglN1u-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Hans Verkuil <hverkuil@kernel.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ab9de95c9cf952332ab79453b4b5d1bfca8e514f
commit: 2a0c28063de23646bb56152095ce73ea2284dc26 media: zoran: move to main=
line
date:   3 years, 10 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 3 years, 10 months ago
config: powerpc-randconfig-001-20260624 (https://download.01.org/0day-ci/ar=
chive/20260625/202606251849.vIdglN1u-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project a9b=
492db3d50683e446cd1a5c9ffaf4e92cb77a7)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260625/202606251849.vIdglN1u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 2a0c28063de2 ("media: zoran: move to mainline")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606251849.vIdglN1u-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
All errors (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:90:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' mac=
ro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:352:9: note: previous definition is here
     352 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace and dumped files.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,drivers/media/pci/zoran/.zoran_devi=
ce.o.d -nostdinc -Iarch/powerpc/include -I./arch/powerpc/include/generated =
-Iinclude -I./include -Iarch/powerpc/include/uapi -I./arch/powerpc/include/=
generated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/l=
inux/compiler-version.h -include include/linux/kconfig.h -include include/l=
inux/compiler_types.h -D__KERNEL__ -I arch/powerpc -DHAVE_AS_ATHIGH=3D1 -Qu=
nused-arguments -fmacro-prefix-map=3D=3D -DKBUILD_EXTRA_WARN1 -Wall -Wundef=
 -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-commo=
n -fshort-wchar -fno-PIE -Werror=3Dimplicit-function-declaration -Werror=3Di=
mplicit-int -Werror=3Dreturn-type -Wno-format-security -std=3Dgnu11 --targe=
t=3Dpowerpc-linux -fintegrated-as -Werror=3Dunknown-warning-option -Werror=
=3Dignored-optimization-argument -mbig-endian -m32 -msoft-float -pipe -mcpu=
=3Dpowerpc -mno-altivec -mno-vsx -mno-spe -fno-asynchronous-unwind-tables -=
mbig-endian -fno-delete-null-pointer-checks -Wno-frame-address -Wno-format-=
truncation -Wno-format-overflow -Wno-address-of-packed-member -Os -Wframe-l=
arger-than=3D8192 -fno-stack-protector -Wimplicit-fallthrough -Wno-gnu -Wno=
-unused-but-set-variable -Wno-unused-const-variable -fomit-frame-pointer -f=
trivial-auto-var-init=3Dpattern -fno-stack-clash-protection -Wdeclaration-a=
fter-statement -Wvla -Wno-pointer-sign -Wcast-function-type -fno-strict-ove=
rflow -fno-stack-check -Werror=3Ddate-time -Werror=3Dincompatible-pointer-t=
ypes -Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissin=
g-format-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-in=
clude-dirs -Wunused-but-set-variable -Wunused-const-variable -Wno-missing-f=
ield-initializers -Wno-sign-compare -Wno-type-limits -Wno-shift-negative-va=
lue -g -gdwarf-5 -fno-var-tracking -DRANDSTRUCT -frandomize-layout-seed-fil=
e=3D./scripts/basic/randstruct.seed -fno-crash-diagnostics -Wno-error=3Dret=
urn-type -Wreturn-type -funsigned-char -Wundef -falign-functions=3D64 -fsan=
itize=3Dkernel-address -mllvm -asan-mapping-offset=3D0xe0000000 -mllvm -asa=
n-globals=3D1 -mllvm -asan-instrumentation-with-call-threshold=3D0 --param =
asan-instrument-allocas=3D1 -mllvm -asan-stack=3D0 -fsanitize=3Dshift -fsan=
itize=3Dunreachable -fsanitize=3Denum -fsanitize-coverage=3Dtrace-pc -fsani=
tize-coverage=3Dtrace-cmp -I drivers/media/pci/zoran -I ./drivers/media/pci=
/zoran -DMODULE -DKBUILD_BASENAME=3D\"zoran_device\" -DKBUILD_MODNAME=3D\"z=
r36067\" -D__KBUILD_MODNAME=3Dkmod_zr36067 -c -o drivers/media/pci/zoran/zo=
ran_device.o drivers/media/pci/zoran/zoran_device.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'drivers/media/pci/zor=
an/zoran_device.c'.
   4.	Running pass 'PowerPC DAG->DAG Pattern Instruction Selection' on func=
tion '@post_office_wait'
    #0 0x000055bc62b1e2cb llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-23+0x3ed52cb)
    #1 0x000055bc62b1be84 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
23+0x3ed2e84)
    #2 0x000055bc62a507a0 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007f432052adf0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x000055bc60f9cae5 llvm::PPCTargetLowering::LowerFormalArguments_64S=
VR4(llvm::SDValue, unsigned int, bool, llvm::SmallVectorImpl<llvm::ISD::Inp=
utArg> const&, llvm::SDLoc const&, llvm::SelectionDAG&, llvm::SmallVectorIm=
pl<llvm::SDValue>&) const (clang-23+0x2353ae5)
    #5 0x000055bc6416aa66 llvm::DAGTypeLegalizer::SetPromotedInteger(llvm::=
SDValue, llvm::SDValue) (clang-23+0x5521a66)
    #6 0x000055bc6416d74e llvm::DAGTypeLegalizer::run() (clang-23+0x552474e)
    #7 0x000055bc6416d9c5 llvm::SelectionDAG::LegalizeTypes() (clang-23+0x5=
5249c5)
    #8 0x000055bc640cd191 llvm::SelectionDAGISel::CodeGenAndEmitDAG() (clan=
g-23+0x5484191)
    #9 0x000055bc640cf68f llvm::SelectionDAGISel::SelectAllBasicBlocks(llvm=
::Function const&) (clang-23+0x548668f)
   #10 0x000055bc640d126d llvm::SelectionDAGISel::runOnMachineFunction(llvm=
::MachineFunction&) (clang-23+0x548826d)
   #11 0x000055bc60f410a7 (anonymous namespace)::PPCDAGToDAGISel::runOnMach=
ineFunction(llvm::MachineFunction&) PPCISelDAGToDAG.cpp:0:0
   #12 0x000055bc640cc5a9 llvm::SelectionDAGISelLegacy::runOnMachineFunctio=
n(llvm::MachineFunction&) (clang-23+0x54835a9)
   #13 0x000055bc61ed0933 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-23+0x3287933)
   #14 0x000055bc62425729 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-23+0x37dc729)
   #15 0x000055bc62425b5c llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-23+0x37dcb5c)
   #16 0x000055bc624266ca (anonymous namespace)::MPPassManager::runOnModule=
(llvm::Module&) LegacyPassManager.cpp:0:0
   #17 0x000055bc624272dc llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-23+0x37de2dc)
   #18 0x000055bc62edf6cf clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-23+0x42966cf)
   #19 0x000055bc63514fe7 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-23+0x48cbfe7)
   #20 0x000055bc64edecdc clang::ParseAST(clang::Sema&, bool, bool) (clang-=
23+0x6295cdc)
   #21 0x000055bc6387b9de clang::FrontendAction::Execute() (clang-23+0x4c32=
9de)
   #22 0x000055bc6380227e clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-23+0x4bb927e)
   #23 0x000055bc63960b07 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-23+0x4d17b07)
   #24 0x000055bc5fb9b038 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-23+0xf52038)
   #25 0x000055bc5fb92d03 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #26 0x000055bc5fb92d43 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #27 0x000055bc6358ea99 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #28 0x000055bc62a50b03 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-23+0x3e07b03)
   #29 0x000055bc6358f1c4 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #30 0x000055bc6354bd08 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-23+0x4902d08)
   #31 0x000055bc6354cc62 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-23+0x4903c62)
   #32 0x000055bc6355d4dc clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-23+0x49144dc)
   #33 0x000055bc5fb979f6 clang_main(int, char**, llvm::ToolContext const&)=
 (clang-23+0xf4e9f6)
   #34 0x000055bc5fa96a69 main (clang-23+0xe4da69)
   #35 0x00007f4320514ca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #36 0x00007f4320514d65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #37 0x000055bc5fb92741 _start (clang-23+0xf49741)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 132482 Segmentation fault      clang -Wp,-MMD,drivers=
/media/pci/zoran/.zoran_device.o.d -nostdinc -Iarch/powerpc/include -I./arc=
h/powerpc/include/generated -Iinclude -I./include -Iarch/powerpc/include/ua=
pi -I./arch/powerpc/include/generated/uapi -Iinclude/uapi -I./include/gener=
ated/uapi -include include/linux/compiler-version.h -include include/linux/=
kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ -I arch/powe=
rpc -DHAVE_AS_ATHIGH=3D1 -Qunused-arguments -fmacro-prefix-map=3D=3D -DKBUI=
LD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fn=
o-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-fun=
ction-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Wno-format-=
security -std=3Dgnu11 --target=3Dpowerpc-linux -fintegrated-as -Werror=3Dun=
known-warning-option -Werror=3Dignored-optimization-argument -mbig-endian -=
m32 -msoft-float -pipe -mcpu=3Dpowerpc -mno-altivec -mno-vsx -mno-spe -fno-=
asynchronous-unwind-tables -mbig-endian -fno-delete-null-pointer-checks -Wn=
o-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-address-of=
-packed-member -Os -Wframe-larger-than=3D8192 -fno-stack-protector -Wimplic=
it-fallthrough -Wno-gnu -Wno-unused-but-set-variable -Wno-unused-const-vari=
able -fomit-frame-pointer -ftrivial-auto-var-init=3Dpattern -fno-stack-clas=
h-protection -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wcast-f=
unction-type -fno-strict-overflow -fno-stack-check -Werror=3Ddate-time -Wer=
ror=3Dincompatible-pointer-types -Wextra -Wunused -Wno-unused-parameter -Wm=
issing-declarations -Wmissing-format-attribute -Wmissing-prototypes -Wold-s=
tyle-definition -Wmissing-include-dirs -Wunused-but-set-variable -Wunused-c=
onst-variable -Wno-missing-field-initializers -Wno-sign-compare -Wno-type-l=
imits -Wno-shift-negative-value -g -gdwarf-5 -fno-var-tracking -DRANDSTRUCT=
 -frandomize-layout-seed-file=3D./scripts/basic/randstruct.seed -fno-crash-=
diagnostics -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef =
-falign-functions=3D64 -fsanitize=3Dkernel-address -mllvm -asan-mapping-off=
set=3D0xe0000000 -mllvm -asan-globals=3D1 -mllvm -asan-instrumentation-with=
-call-threshold=3D0 --param asan-instrument-allocas=3D1 -mllvm -asan-stack=
=3D0 -fsanitize=3Dshift -fsanitize=3Dunreachable -fsanitize=3Denum -fsaniti=
ze-coverage=3Dtrace-pc -fsanitize-coverage=3Dtrace-cmp -I drivers/media/pci=
/zoran -I ./drivers/media/pci/zoran -DMODULE -DKBUILD_BASENAME=3D'"zoran_de=
vice"' -DKBUILD_MODNAME=3D'"zr36067"' -D__KBUILD_MODNAME=3Dkmod_zr36067 -c =
-o drivers/media/pci/zoran/zoran_device.o drivers/media/pci/zoran/zoran_dev=
ice.c

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
