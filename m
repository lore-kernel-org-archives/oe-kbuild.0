Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC3B2E1758
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Mar 2026 14:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773153611; cv=none; b=InPvkAYEFXTXr2HNvwv475tA7TyjfznIl6hAhCHdR0AOs8ztFthAoS/xy7Zgm1xqGKO076mHUM49DarMzXVaA/xlwAxRAOhUskYSfLkNTvd6dvp+iX4+KL66b0tzOM99m1HUhgk1K8S/EqX7E5iEs5rxtanTK2wu6LzWUQxbJmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773153611; c=relaxed/simple;
	bh=4pnzalatQSnU3vKgoTmj+419scBJXuBp5dRyfBTddH4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=H5RcE2vB3af4kaOzd2PrQuzGawK6rEc48wAHXl63an5ovPijPynp8UF+RR5uEAacX+s/XD3KMjgIUQf6n+xHwmmegGyp4Ukq0Ut7hfLMRA2Lhi4NsEWdoERvx1TkxhdCR9gTLKhPTS5Igi5SvNyi1lcjfSHNHESvQVlui2Xl4Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V1kVS1d7; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V1kVS1d7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773153610; x=1804689610;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4pnzalatQSnU3vKgoTmj+419scBJXuBp5dRyfBTddH4=;
  b=V1kVS1d7sr+cyyjXxV7O3yCJOc4GGCG8MqRA04MyWpfs0mYpXbvd5j2/
   tPtVKh/1ifRIIRZ7P8zExKBB7xSF5Wnyr8RWcgZSBlLnI6VxzL5pp+yUr
   1B3hie3eaRGN4A0tVllNrMTY8kKvRw5bupgjiW/JrZqsOKG5YmYBm/7j3
   W48KEZFd1VAXGbMrUwotD20Gmi/Oh/uDN1aoW+H9kMmUdfjYwX6kTLkNN
   7MnOwhbPBYpjcZo3uCwhzE6jgt4YuzM2z1jOFghrK9byN3Twiznmxd4Ve
   +muonqwwM5Umcs8uFcOcmWxv6SyCUQfkS/sLu6bi/W/qaBnVXS62TX1lr
   g==;
X-CSE-ConnectionGUID: QLr7At9hSdK6Oa2v0OojPA==
X-CSE-MsgGUID: 1brxv6ZDTo2VuxnPfWnKVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="85679932"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="85679932"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 07:40:09 -0700
X-CSE-ConnectionGUID: xcD3KfHsT7uFnX9I6T1dXw==
X-CSE-MsgGUID: lDlmV7gLTry6JzL3ci6w7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="218094568"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Mar 2026 07:40:07 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzyFg-0000000025E-49mM;
	Tue, 10 Mar 2026 14:40:04 +0000
Date: Tue, 10 Mar 2026 22:39:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: /bin/bash: line 1: 542036 Segmentation fault      clang
 -Wp,-MMD,arch/mips/kernel/.elf.o.d -nostdinc -Iarch/mips/include
 -I./arch/mips/include/generated -Iinclude -I./include
 -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi
 -I....
Message-ID: <202603102249.U9BG3zqZ-lkp@intel.com>
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
TO: Dmitry Baryshkov <lumag@kernel.org>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
commit: e609438851928381e39b5393f17156955a84122a regulator: dt-bindings: qc=
om,sdm845-refgen-regulator: document more platforms
date:   6 months ago
:::::: branch date: 2 days ago
:::::: commit date: 6 months ago
config: mips-randconfig-r111-20260304 (https://download.01.org/0day-ci/arch=
ive/20260310/202603102249.U9BG3zqZ-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a1=
09fbb6e184ec9bcce10615949f598f4c974a9)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260310/202603102249.U9BG3zqZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603102249.U9BG3zqZ-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
All errors (new ones prefixed by >>):

   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,arch/mips/kernel/.elf.o.d -nostdinc=
 -Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I./include =
-Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uap=
i -I./include/generated/uapi -include include/linux/compiler-version.h -inc=
lude include/linux/kconfig.h -include include/linux/compiler_types.h -D__KE=
RNEL__ --target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknown-warnin=
g-option -Werror=3Dignored-optimization-argument -Werror=3Doption-ignored -=
Werror=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xffffffff88=
002000 -DLINKER_LOAD_ADDRESS=3D0x88002000 -DDATAOFFSET=3D0 -fmacro-prefix-m=
ap=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -funsigned=
-char -fno-common -fno-PIE -fno-strict-aliasing -mno-check-zero-division -m=
abi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-float -f=
freestanding -EB -fno-stack-check -march=3Dmips3 -Wa,--trap -DTOOLCHAIN_SUP=
PORTS_VIRT -Iarch/mips/include/asm/mach-ip22 -Iarch/mips/include/asm/mach-g=
eneric -fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks -O2 =
-fno-stack-protector -pg -fstrict-flex-arrays=3D3 -fno-strict-overflow -fno=
-stack-check -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=3Dimplicit-f=
unction-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Ds=
trict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wn=
o-address-of-packed-member -Wmissing-declarations -Wmissing-prototypes -Wno=
-gnu -Wno-format-overflow-non-kprintf -Wno-format-truncation-non-kprintf -W=
no-default-const-init-unsafe -Wno-pointer-sign -Wcast-function-type -Wno-un=
terminated-string-initialization -Wimplicit-fallthrough -Werror=3Ddate-time=
 -Werror=3Dincompatible-pointer-types -Wenum-conversion -Wunused -Wmissing-=
format-attribute -Wmissing-include-dirs -Wunused-const-variable -Wno-missin=
g-field-initializers -Wno-type-limits -Wno-shift-negative-value -Wno-enum-e=
num-conversion -Wno-sign-compare -Wno-unused-parameter -fno-crash-diagnosti=
cs -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -falign-f=
unctions=3D64 -Iarch/mips/kernel -Iarch/mips/kernel -DKBUILD_MODFILE=3D\"ar=
ch/mips/kernel/elf\" -DKBUILD_BASENAME=3D\"elf\" -DKBUILD_MODNAME=3D\"elf\"=
 -D__KBUILD_MODNAME=3Dkmod_elf -c -o arch/mips/kernel/elf.o arch/mips/kerne=
l/elf.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'arch/mips/kernel/elf.=
c'.
   4.	Running pass 'Branch Probability Basic Block Placement' on function '=
@mips_set_personality_fp'
    #0 0x0000558b573645bb llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-23+0x411f5bb)
    #1 0x0000558b57362184 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
23+0x411d184)
    #2 0x0000558b57296360 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007f9783090df0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x0000558b5690a1af llvm::TailDuplicator::shouldTailDuplicate(bool, l=
lvm::MachineBasicBlock&) (.part.0) TailDuplicator.cpp:0:0
    #5 0x0000558b56617654 (anonymous namespace)::MachineBlockPlacement::bui=
ldCFGChains() MachineBlockPlacement.cpp:0:0
    #6 0x0000558b5661bfb0 (anonymous namespace)::MachineBlockPlacement::run=
(llvm::MachineFunction&) MachineBlockPlacement.cpp:0:0
    #7 0x0000558b5661d1e1 (anonymous namespace)::MachineBlockPlacementLegac=
y::runOnMachineFunction(llvm::MachineFunction&) (.part.0) MachineBlockPlace=
ment.cpp:0:0
    #8 0x0000558b5666d2e8 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-23+0x34282e8)
    #9 0x0000558b56c45ee9 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-23+0x3a00ee9)
   #10 0x0000558b56c4608c llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-23+0x3a0108c)
   #11 0x0000558b56c452f8 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-23+0x3a002f8)
   #12 0x0000558b577592b4 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-23+0x45142b4)
   #13 0x0000558b57d8f087 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-23+0x4b4a087)
   #14 0x0000558b596f091c clang::ParseAST(clang::Sema&, bool, bool) (clang-=
23+0x64ab91c)
   #15 0x0000558b580d9c3a clang::FrontendAction::Execute() (clang-23+0x4e94=
c3a)
   #16 0x0000558b580552c6 clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-23+0x4e102c6)
   #17 0x0000558b581bce47 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-23+0x4f77e47)
   #18 0x0000558b5418ce55 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-23+0xf47e55)
   #19 0x0000558b54184b63 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #20 0x0000558b54184ba3 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #21 0x0000558b57e0df39 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #22 0x0000558b572966c3 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-23+0x40516c3)
   #23 0x0000558b57e0e664 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #24 0x0000558b57dcdfe8 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-23+0x4b88fe8)
   #25 0x0000558b57dcef42 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-23+0x4b89f42)
   #26 0x0000558b57ddfc8c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-23+0x4b9ac8c)
   #27 0x0000558b5418980f clang_main(int, char**, llvm::ToolContext const&)=
 (clang-23+0xf4480f)
   #28 0x0000558b54021cf9 main (clang-23+0xddccf9)
   #29 0x00007f978307aca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #30 0x00007f978307ad65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #31 0x0000558b541845a1 _start (clang-23+0xf3f5a1)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 542036 Segmentation fault      clang -Wp,-MMD,arch/mi=
ps/kernel/.elf.o.d -nostdinc -Iarch/mips/include -I./arch/mips/include/gene=
rated -Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips/include/=
generated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/l=
inux/compiler-version.h -include include/linux/kconfig.h -include include/l=
inux/compiler_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -fintegrated=
-as -Werror=3Dunknown-warning-option -Werror=3Dignored-optimization-argumen=
t -Werror=3Doption-ignored -Werror=3Dunused-command-line-argument -DVMLINUX=
_LOAD_ADDRESS=3D0xffffffff88002000 -DLINKER_LOAD_ADDRESS=3D0x88002000 -DDAT=
AOFFSET=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgn=
u11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing=
 -mno-check-zero-division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -mso=
ft-float -Wa,-msoft-float -ffreestanding -EB -fno-stack-check -march=3Dmips=
3 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-ip22 -I=
arch/mips/include/asm/mach-generic -fno-asynchronous-unwind-tables -fno-del=
ete-null-pointer-checks -O2 -fno-stack-protector -pg -fstrict-flex-arrays=
=3D3 -fno-strict-overflow -fno-stack-check -fno-builtin-wcslen -Wall -Wextr=
a -Wundef -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -W=
error=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-security -Wno-t=
rigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-declara=
tions -Wmissing-prototypes -Wno-gnu -Wno-format-overflow-non-kprintf -Wno-f=
ormat-truncation-non-kprintf -Wno-default-const-init-unsafe -Wno-pointer-si=
gn -Wcast-function-type -Wno-unterminated-string-initialization -Wimplicit-=
fallthrough -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wenum=
-conversion -Wunused -Wmissing-format-attribute -Wmissing-include-dirs -Wun=
used-const-variable -Wno-missing-field-initializers -Wno-type-limits -Wno-s=
hift-negative-value -Wno-enum-enum-conversion -Wno-sign-compare -Wno-unused=
-parameter -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wreturn-type -f=
unsigned-char -Wundef -falign-functions=3D64 -Iarch/mips/kernel -Iarch/mips=
/kernel -DKBUILD_MODFILE=3D'"arch/mips/kernel/elf"' -DKBUILD_BASENAME=3D'"e=
lf"' -DKBUILD_MODNAME=3D'"elf"' -D__KBUILD_MODNAME=3Dkmod_elf -c -o arch/mi=
ps/kernel/elf.o arch/mips/kernel/elf.c

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
