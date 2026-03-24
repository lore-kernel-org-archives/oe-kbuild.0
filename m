Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3982D3FA5EE
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Mar 2026 17:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774374243; cv=none; b=niE2uMTGGnQGculA26kmryyz/nnbxxRPBzDz1CLMiT/NFKY8eFmr3epDayANwbGYioEFLcnaWVIJMfgCHVRSJiE15KXjnMP462izfbiS3Mex4Vs5fx7WeKQfkduQO+MJyx/4EVrwprhOH3uNnNbXvM0ZmLAFIcus+iMwc6Guzcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774374243; c=relaxed/simple;
	bh=JroSAab5AKMnkpmWZPmJgBRz00b/mpsDH93wt7i993Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Z9iLFfTlJKBmy9G496YbtsJTYXXgc94Ummuv5o0wTKE2wEEJXVSVArKEBkAXbvwx1ALoYRmft8FcR1dyNYy8+sW3yJjHwDgGstG4YrKLQ7rIdc/nlpwQdKzL4R6T28l8zM7sb7UlGBcHnHidm1jnvGGqbsqyNnyo+RIxoViMH7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AfatjSa0; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AfatjSa0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774374241; x=1805910241;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=JroSAab5AKMnkpmWZPmJgBRz00b/mpsDH93wt7i993Q=;
  b=AfatjSa0xy34CLFmXlongAOLfv+gzkqhbj1afg37ymDo826xotTwabtw
   7Ba2tTtlc9A7kafn/8/XV9r+JuyvSzs9qCZbwvIcQQw+ELrgZxYhmJ0TQ
   i5HTlrqQHZ9qFePXr6pm/EKRFSBlZPa7wAYYBXgzIULDldgvPAwIi1Xx6
   ZckXtRutlqrEDQ0Fe6EaPhN+0XjLXAwUm++iCdz8aj8VIhYDcn6hSPr3Z
   mDmMvmY+mdAIliVTy+paWhaxh0tUlshlCHZitJYRoi5qupxliWT5bKCKu
   Ngs8oy7i6roTthAn5QqS9kkmIavH3NFLl4SwfSBtVxUdFadREl2FezqRw
   w==;
X-CSE-ConnectionGUID: YrDVyDO4RKiikiEg+B1sJw==
X-CSE-MsgGUID: We/mvHEBTCOjoS99BF+Wkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86097279"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86097279"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 10:44:00 -0700
X-CSE-ConnectionGUID: 2sb8ACgiRSmZ5eYmb1Cjfw==
X-CSE-MsgGUID: EATMF8ZUS22CxuNf5Uw0jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="229359739"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Mar 2026 10:43:59 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w55nI-0000000054h-3L9U;
	Tue, 24 Mar 2026 17:43:56 +0000
Date: Wed, 25 Mar 2026 01:43:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: /bin/bash: line 1: 3528268 Segmentation fault      clang
 -Wp,-MMD,drivers/iio/humidity/.hdc3020.o.d -nostdinc -Iarch/mips/include
 -I./arch/mips/include/generated -Iinclude -I./include
 -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude...
Message-ID: <202603250147.4KzKSmQV-lkp@intel.com>
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
TO: Dimitri Fedrau <dimitri.fedrau@liebherr.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Javier Carrasco <javier.carrasco.cruz@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c369299895a591d96745d6492d4888259b004a9e
commit: cb372b4f46d4285e5d2c07ba734374151b8e34e7 iio: humditiy: hdc3020: fi=
x units for thresholds and hysteresis
date:   5 months ago
:::::: branch date: 2 days ago
:::::: commit date: 5 months ago
config: mips-randconfig-r063-20260324 (https://download.01.org/0day-ci/arch=
ive/20260325/202603250147.4KzKSmQV-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054=
e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260325/202603250147.4KzKSmQV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603250147.4KzKSmQV-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
All errors (new ones prefixed by >>):

   warning: MIPS-I support is experimental
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,drivers/iio/humidity/.hdc3020.o.d -=
nostdinc -Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I./=
include -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinc=
lude/uapi -I./include/generated/uapi -include include/linux/compiler-versio=
n.h -include include/linux/kconfig.h -include include/linux/compiler_types.=
h -D__KERNEL__ --target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknow=
n-warning-option -Werror=3Dignored-optimization-argument -Werror=3Doption-i=
gnored -Werror=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xff=
ffffff84000000 -DLINKER_LOAD_ADDRESS=3D0x84000000 -DDATAOFFSET=3D0 -fmacro-=
prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -f=
unsigned-char -fno-common -fno-PIE -fno-strict-aliasing -mno-check-zero-div=
ision -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-=
float -ffreestanding -EL -fno-stack-check -march=3Dmips1 -DTOOLCHAIN_SUPPOR=
TS_VIRT -Iarch/mips/include/asm/mach-dec -Iarch/mips/include/asm/mach-gener=
ic -fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks -Os -fst=
ack-protector -fomit-frame-pointer -ftrivial-auto-var-init=3Dzero -fstrict-=
flex-arrays=3D3 -fno-strict-overflow -fno-stack-check -fno-builtin-wcslen -=
Wall -Wextra -Wundef -Werror=3Dimplicit-function-declaration -Werror=3Dimpl=
icit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-secu=
rity -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmiss=
ing-declarations -Wmissing-prototypes -Wno-gnu -Wno-format-overflow-non-kpr=
intf -Wno-format-truncation-non-kprintf -Wno-default-const-init-unsafe -Wno=
-pointer-sign -Wcast-function-type -Wno-unterminated-string-initialization =
-Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Dincompatible-pointer-t=
ypes -Wenum-conversion -Wunused -Wmissing-format-attribute -Wmissing-includ=
e-dirs -Wunused-const-variable -Wno-missing-field-initializers -Wno-type-li=
mits -Wno-shift-negative-value -Wno-enum-enum-conversion -Wno-sign-compare =
-Wno-unused-parameter -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wret=
urn-type -funsigned-char -Wundef -falign-functions=3D64 -Idrivers/iio/commo=
n/hid-sensors -fsanitize=3Darray-bounds -fsanitize=3Dbool -fsanitize=3Denum=
 -Idrivers/iio/humidity -Idrivers/iio/humidity -DMODULE -mlong-calls -DKBUI=
LD_BASENAME=3D\"hdc3020\" -DKBUILD_MODNAME=3D\"hdc3020\" -D__KBUILD_MODNAME=
=3Dkmod_hdc3020 -c -o drivers/iio/humidity/hdc3020.o drivers/iio/humidity/h=
dc3020.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'drivers/iio/humidity/=
hdc3020.c'.
   4.	Running pass 'Shrink Wrapping analysis' on function '@hdc3020_write_t=
hresh'
    #0 0x00005562df3c9f3b llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-23+0x414df3b)
    #1 0x00005562df3c7b04 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
23+0x414bb04)
    #2 0x00005562df2fbc20 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007fcd0e148df0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x00005562de912abd (anonymous namespace)::ShrinkWrapImpl::useOrDefCS=
ROrFI(llvm::MachineInstr const&, llvm::RegScavenger*, bool) const ShrinkWra=
p.cpp:0:0
    #5 0x00005562de916049 (anonymous namespace)::ShrinkWrapImpl::postShrink=
Wrapping(bool, llvm::MachineFunction&, llvm::RegScavenger*) ShrinkWrap.cpp:=
0:0
    #6 0x00005562de9199f1 (anonymous namespace)::ShrinkWrapImpl::run(llvm::=
MachineFunction&) ShrinkWrap.cpp:0:0
    #7 0x00005562de91af07 (anonymous namespace)::ShrinkWrapLegacy::runOnMac=
hineFunction(llvm::MachineFunction&) (.part.0) ShrinkWrap.cpp:0:0
    #8 0x00005562de6cca28 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-23+0x3450a28)
    #9 0x00005562deca3229 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-23+0x3a27229)
   #10 0x00005562deca33cc llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-23+0x3a273cc)
   #11 0x00005562deca2638 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-23+0x3a26638)
   #12 0x00005562df7c6e21 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-23+0x454ae21)
   #13 0x00005562dfe0a1c7 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-23+0x4b8e1c7)
   #14 0x00005562e17eba1c clang::ParseAST(clang::Sema&, bool, bool) (clang-=
23+0x656fa1c)
   #15 0x00005562e016193a clang::FrontendAction::Execute() (clang-23+0x4ee5=
93a)
   #16 0x00005562e00dc176 clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-23+0x4e60176)
   #17 0x00005562e024a727 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-23+0x4fce727)
   #18 0x00005562dc1c1c95 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-23+0xf45c95)
   #19 0x00005562dc1b99a3 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #20 0x00005562dc1b99e3 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #21 0x00005562dfe7b849 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #22 0x00005562df2fbf83 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-23+0x407ff83)
   #23 0x00005562dfe7bf74 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #24 0x00005562dfe3b1a8 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-23+0x4bbf1a8)
   #25 0x00005562dfe3c102 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-23+0x4bc0102)
   #26 0x00005562dfe4ce4c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-23+0x4bd0e4c)
   #27 0x00005562dc1be64f clang_main(int, char**, llvm::ToolContext const&)=
 (clang-23+0xf4264f)
   #28 0x00005562dc056bc9 main (clang-23+0xddabc9)
   #29 0x00007fcd0e132ca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #30 0x00007fcd0e132d65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #31 0x00005562dc1b93e1 _start (clang-23+0xf3d3e1)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 3528268 Segmentation fault      clang -Wp,-MMD,driver=
s/iio/humidity/.hdc3020.o.d -nostdinc -Iarch/mips/include -I./arch/mips/inc=
lude/generated -Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips=
/include/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include =
include/linux/compiler-version.h -include include/linux/kconfig.h -include =
include/linux/compiler_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -fi=
ntegrated-as -Werror=3Dunknown-warning-option -Werror=3Dignored-optimizatio=
n-argument -Werror=3Doption-ignored -Werror=3Dunused-command-line-argument =
-DVMLINUX_LOAD_ADDRESS=3D0xffffffff84000000 -DLINKER_LOAD_ADDRESS=3D0x84000=
000 -DDATAOFFSET=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 =
-std=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict=
-aliasing -mno-check-zero-division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -=
pipe -msoft-float -Wa,-msoft-float -ffreestanding -EL -fno-stack-check -mar=
ch=3Dmips1 -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-dec -Iarc=
h/mips/include/asm/mach-generic -fno-asynchronous-unwind-tables -fno-delete=
-null-pointer-checks -Os -fstack-protector -fomit-frame-pointer -ftrivial-a=
uto-var-init=3Dzero -fstrict-flex-arrays=3D3 -fno-strict-overflow -fno-stac=
k-check -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=3Dimplicit-functi=
on-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstric=
t-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wno-ad=
dress-of-packed-member -Wmissing-declarations -Wmissing-prototypes -Wno-gnu=
 -Wno-format-overflow-non-kprintf -Wno-format-truncation-non-kprintf -Wno-d=
efault-const-init-unsafe -Wno-pointer-sign -Wcast-function-type -Wno-unterm=
inated-string-initialization -Wimplicit-fallthrough -Werror=3Ddate-time -We=
rror=3Dincompatible-pointer-types -Wenum-conversion -Wunused -Wmissing-form=
at-attribute -Wmissing-include-dirs -Wunused-const-variable -Wno-missing-fi=
eld-initializers -Wno-type-limits -Wno-shift-negative-value -Wno-enum-enum-=
conversion -Wno-sign-compare -Wno-unused-parameter -fno-crash-diagnostics -=
Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -falign-funct=
ions=3D64 -Idrivers/iio/common/hid-sensors -fsanitize=3Darray-bounds -fsani=
tize=3Dbool -fsanitize=3Denum -Idrivers/iio/humidity -Idrivers/iio/humidity=
 -DMODULE -mlong-calls -DKBUILD_BASENAME=3D'"hdc3020"' -DKBUILD_MODNAME=3D'=
"hdc3020"' -D__KBUILD_MODNAME=3Dkmod_hdc3020 -c -o drivers/iio/humidity/hdc=
3020.o drivers/iio/humidity/hdc3020.c

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
