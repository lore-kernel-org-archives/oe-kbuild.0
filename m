Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7BC2DC32E
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Apr 2026 11:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776769730; cv=none; b=fG1EGVsnqDnYRCNE/BROJWPekgU7Fv/p3LUpdua/zQqlCIKk469bH+zcG3T51+sRcG4n4BzTZukFc5XlqkPZw+3NSMkRcwpK9Y8HH4YhVTSPRUkJ2LSDrwNnfnDRTU5P4/0VG+IRebvCZ2G8Y7dA3fAArf7JhH5/w+h6le4mb38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776769730; c=relaxed/simple;
	bh=6oueWX+hVlec8wwT7KwynYaJZFpj4B+Xh1OXTCX/dFI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Wlb5eIj4E6sChQj5/qWubhs2InbMOC3FBY2leenMM/O09/Iit/qf2fi21feK2uxGxj4iRHq0jozCjppKyv+Za4WH2HV7qJceu5FqM9sGfM8vmm15N/ej+cW2VaXgsWc+ijnlaz94cwI9b3PVTT2lUetw/eKHSkGJtFpyi/je0a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IttNTPKV; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IttNTPKV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776769727; x=1808305727;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6oueWX+hVlec8wwT7KwynYaJZFpj4B+Xh1OXTCX/dFI=;
  b=IttNTPKV7XgQrujN+4Tp+yOCE2eiakvg2MGclYBuBECklBNhWF6P6XD6
   V9/WaatNzlciJaZHeSfNTtA4PXtE/8gzmAWIvdRoMopyl0MUhK5ZmE8n3
   0AjXdRUAH/UekdgHhM7eT2lKz/zM40VfuI32q5hfSUKqsMK/tgXRdiMID
   MPy2wcvh4E1luyU/sh6DUqdfaRXieMDby1DDrOfoitzj6bfTc25vx+Tup
   Euql1YzU53W2STaT7vl6qBYeWJ6Bhd1KIyWeKXmm7eXyryBNX1GqVXcRb
   JvDgwEdA/rUPfKdr7abGwdwGBJ+MMWjsNi9BLygF9FBxruiXQr8/s1pi7
   w==;
X-CSE-ConnectionGUID: +XI0vqHMRPmFYodpde7T7g==
X-CSE-MsgGUID: lQhH9H5ARwuJ3Fh33N73tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77677195"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="77677195"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 04:08:47 -0700
X-CSE-ConnectionGUID: ODnUowB+Rj60ISvgSYl7hQ==
X-CSE-MsgGUID: 3B5FxmlnT2eiVkvmkt9TkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="227371142"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Apr 2026 04:08:46 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wF8yB-000000003Qc-3vcg;
	Tue, 21 Apr 2026 11:08:43 +0000
Date: Tue, 21 Apr 2026 19:08:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2392/13385] /bin/bash: line 1: 2676199
 Segmentation fault      clang -Wp,-MMD,net/mac80211/.tdls.o.d -nostdinc
 -Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I./include
 -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi
 -I./i...
Message-ID: <202604211935.El53nP4s-lkp@intel.com>
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
TO: Luca Ceresoli <luca.ceresoli@bootlin.com>
CC: Maxime Ripard <mripard@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   97e797263a5e963da3d1e66e743fd518567dfe37
commit: 293a8fd7721a90987d9bf149feab60e756dac269 [2392/13385] drm/bridge: a=
dd of_drm_find_and_get_bridge()
:::::: branch date: 22 hours ago
:::::: commit date: 4 months ago
config: mips-randconfig-r053-20260420 (https://download.01.org/0day-ci/arch=
ive/20260421/202604211935.El53nP4s-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5ba=
c06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260421/202604211935.El53nP4s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604211935.El53nP4s-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
All errors (new ones prefixed by >>):

   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,net/mac80211/.tdls.o.d -nostdinc -I=
arch/mips/include -I./arch/mips/include/generated -Iinclude -I./include -Ia=
rch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi -=
I./include/generated/uapi -include include/linux/compiler-version.h -includ=
e include/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNE=
L__ --target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknown-warning-o=
ption -Werror=3Dignored-optimization-argument -Werror=3Doption-ignored -Wer=
ror=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xffffffff84000=
000 -DLINKER_LOAD_ADDRESS=3D0x84000000 -DDATAOFFSET=3D0 -fmacro-prefix-map=
=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -funsigned-c=
har -fno-common -fno-PIE -fno-strict-aliasing -mno-check-zero-division -mab=
i=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-float -ffr=
eestanding -EL -fno-stack-check -march=3Dmips64 -Wa,--trap -DTOOLCHAIN_SUPP=
ORTS_VIRT -Iarch/mips/include/asm/mach-sibyte -DSIBYTE_HDR_FEATURES=3DSIBYT=
E_HDR_FMASK_1250_112x_ALL -Iarch/mips/include/asm/mach-generic -fno-asynchr=
onous-unwind-tables -fno-delete-null-pointer-checks -O2 -fno-stack-protecto=
r -fomit-frame-pointer -ftrivial-auto-var-init=3Dzero -fstrict-flex-arrays=
=3D3 -fms-extensions -fno-strict-overflow -fno-stack-check -fno-builtin-wcs=
len -Wall -Wextra -Wundef -Werror=3Dimplicit-function-declaration -Werror=
=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-form=
at-security -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member=
 -Wmissing-declarations -Wmissing-prototypes -Wno-gnu -Wno-microsoft-anon-t=
ag -Wno-format-overflow-non-kprintf -Wno-format-truncation-non-kprintf -Wno=
-default-const-init-unsafe -Wno-pointer-sign -Wcast-function-type -Wno-unte=
rminated-string-initialization -Wimplicit-fallthrough -Werror=3Ddate-time -=
Werror=3Dincompatible-pointer-types -Wenum-conversion -Wunused -Wmissing-fo=
rmat-attribute -Wmissing-include-dirs -Wunused-const-variable -Wno-missing-=
field-initializers -Wno-type-limits -Wno-shift-negative-value -Wno-enum-enu=
m-conversion -Wno-sign-compare -Wno-unused-parameter -fno-crash-diagnostics=
 -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -falign-fun=
ctions=3D64 -DDEBUG -fsanitize=3Dunreachable -fsanitize=3Dbool -Inet/mac802=
11 -Inet/mac80211 -ffunction-sections -fdata-sections -DKBUILD_MODFILE=3D\"=
net/mac80211/mac80211\" -DKBUILD_BASENAME=3D\"tdls\" -DKBUILD_MODNAME=3D\"m=
ac80211\" -D__KBUILD_MODNAME=3Dmac80211 -c -o net/mac80211/tdls.o net/mac80=
211/tdls.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'net/mac80211/tdls.c'.
   4.	Running pass 'Branch Probability Basic Block Placement' on function '=
@ieee80211_tdls_mgmt'
    #0 0x0000562227d64c1b llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-23+0x413cc1b)
    #1 0x0000562227d627e4 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
23+0x413a7e4)
    #2 0x0000562227c956a0 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007f62a254adf0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x000056222731c52f llvm::TailDuplicator::shouldTailDuplicate(bool, l=
lvm::MachineBasicBlock&) (.part.0) TailDuplicator.cpp:0:0
    #5 0x00005622270375a9 (anonymous namespace)::MachineBlockPlacement::bui=
ldCFGChains() MachineBlockPlacement.cpp:0:0
    #6 0x000056222703c6ad (anonymous namespace)::MachineBlockPlacement::run=
(llvm::MachineFunction&) MachineBlockPlacement.cpp:0:0
    #7 0x000056222703d8b1 (anonymous namespace)::MachineBlockPlacementLegac=
y::runOnMachineFunction(llvm::MachineFunction&) (.part.0) MachineBlockPlace=
ment.cpp:0:0
    #8 0x000056222708b438 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-23+0x3463438)
    #9 0x0000562227652869 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-23+0x3a2a869)
   #10 0x0000562227652a0c llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-23+0x3a2aa0c)
   #11 0x0000562227651c78 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-23+0x3a29c78)
   #12 0x0000562228160071 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-23+0x4538071)
   #13 0x00005622287a56c7 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-23+0x4b7d6c7)
   #14 0x000056222a1b0adc clang::ParseAST(clang::Sema&, bool, bool) (clang-=
23+0x6588adc)
   #15 0x0000562228aff17a clang::FrontendAction::Execute() (clang-23+0x4ed7=
17a)
   #16 0x0000562228a783d6 clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-23+0x4e503d6)
   #17 0x0000562228be8207 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-23+0x4fc0207)
   #18 0x0000562224b80a55 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-23+0xf58a55)
   #19 0x0000562224b78763 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #20 0x0000562224b787a3 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #21 0x0000562228816de9 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #22 0x0000562227c95a03 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-23+0x406da03)
   #23 0x0000562228817514 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #24 0x00005622287d6668 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-23+0x4bae668)
   #25 0x00005622287d75c2 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-23+0x4baf5c2)
   #26 0x00005622287e87bc clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-23+0x4bc07bc)
   #27 0x0000562224b7d40f clang_main(int, char**, llvm::ToolContext const&)=
 (clang-23+0xf5540f)
   #28 0x0000562224a13bb9 main (clang-23+0xdebbb9)
   #29 0x00007f62a2534ca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #30 0x00007f62a2534d65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #31 0x0000562224b781a1 _start (clang-23+0xf501a1)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 2676199 Segmentation fault      clang -Wp,-MMD,net/ma=
c80211/.tdls.o.d -nostdinc -Iarch/mips/include -I./arch/mips/include/genera=
ted -Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips/include/ge=
nerated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/lin=
ux/compiler-version.h -include include/linux/kconfig.h -include include/lin=
ux/compiler_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -fintegrated-a=
s -Werror=3Dunknown-warning-option -Werror=3Dignored-optimization-argument =
-Werror=3Doption-ignored -Werror=3Dunused-command-line-argument -DVMLINUX_L=
OAD_ADDRESS=3D0xffffffff84000000 -DLINKER_LOAD_ADDRESS=3D0x84000000 -DDATAO=
FFSET=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu1=
1 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -=
mno-check-zero-division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft=
-float -Wa,-msoft-float -ffreestanding -EL -fno-stack-check -march=3Dmips64=
 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-sibyte -=
DSIBYTE_HDR_FEATURES=3DSIBYTE_HDR_FMASK_1250_112x_ALL -Iarch/mips/include/a=
sm/mach-generic -fno-asynchronous-unwind-tables -fno-delete-null-pointer-ch=
ecks -O2 -fno-stack-protector -fomit-frame-pointer -ftrivial-auto-var-init=
=3Dzero -fstrict-flex-arrays=3D3 -fms-extensions -fno-strict-overflow -fno-=
stack-check -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=3Dimplicit-fu=
nction-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Ds=
trict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wn=
o-address-of-packed-member -Wmissing-declarations -Wmissing-prototypes -Wno=
-gnu -Wno-microsoft-anon-tag -Wno-format-overflow-non-kprintf -Wno-format-t=
runcation-non-kprintf -Wno-default-const-init-unsafe -Wno-pointer-sign -Wca=
st-function-type -Wno-unterminated-string-initialization -Wimplicit-fallthr=
ough -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wenum-conver=
sion -Wunused -Wmissing-format-attribute -Wmissing-include-dirs -Wunused-co=
nst-variable -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-ne=
gative-value -Wno-enum-enum-conversion -Wno-sign-compare -Wno-unused-parame=
ter -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wreturn-type -funsigne=
d-char -Wundef -falign-functions=3D64 -DDEBUG -fsanitize=3Dunreachable -fsa=
nitize=3Dbool -Inet/mac80211 -Inet/mac80211 -ffunction-sections -fdata-sect=
ions -DKBUILD_MODFILE=3D'"net/mac80211/mac80211"' -DKBUILD_BASENAME=3D'"tdl=
s"' -DKBUILD_MODNAME=3D'"mac80211"' -D__KBUILD_MODNAME=3Dmac80211 -c -o net=
/mac80211/tdls.o net/mac80211/tdls.c

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=3Dn] && CAN [=3Dy]
   Selected by [y]:
   - CAN [=3Dy] && NET [=3Dy]

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
