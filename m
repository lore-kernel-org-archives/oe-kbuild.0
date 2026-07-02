Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B621FB1
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Jul 2026 00:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782953834; cv=none; b=Th+dRzjPT6qmZYK4e8FJmzCIIL3LbJGHucQWYIww3114/xqXwJ0qw36Xjtf4RlEHIhfTWbwca5rSd9vfznwFY+SoUbMtEH53IgMr+DqbVlttqsDu8R2HGMnyxT/Rmbp7O34OAXyRVTpFB/fSCthmVse7l97gNa7ziumdUoJF+Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782953834; c=relaxed/simple;
	bh=opBFUPE58nx1+byXsrzEY5J3fujd3mYlgoZZHNFourc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FvREwMBjF0xxdNBABxRMfo9Qk3hn+mWWhWz+MzYmwvGuS7ykPW/yE7GuMXotrZSmRXXvfnUBrIG4A03KWfHlIjDh1ch6kdYAGhXtUBLL8b3rSzwD48gy5FmQuZsmbD4tTQBGyZVkJLZ3vP/pcGCGDS3T1YkBuxZ4vePrWoQ2qgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BU4Uhf2s; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BU4Uhf2s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782953833; x=1814489833;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=opBFUPE58nx1+byXsrzEY5J3fujd3mYlgoZZHNFourc=;
  b=BU4Uhf2s2sBQNvmWhxsA3m7lNpY+y1LsRlu+PNTNTilFKTUU64WVl6VR
   MqXmB0xQoOt33YmmaTALQVBLjC4Ln6IwpSYL9CYz8CTA1H/GKY8xkkJYm
   BRWfyHZP8+j53auhwrw3id4O6ip2RqVkkPhKMBFX0L6ixWh5n/HS7Ve/j
   YqZiPviEq9sAoECDTsPZx+LAqhk4nHkiTLPVag3/m6151ys35bsFhqOpD
   03/12XuQXZqvQKxCPqTdydWJKnxok3B9Wva8OPtly4JslLwPu1YUd7PfQ
   9bmOt7+Kv2Xz0+ZYyS4Iv5pXMN66tEAWwBaZWFaEjgqt0hUnEouMVYLCf
   Q==;
X-CSE-ConnectionGUID: 7AmHRAhGQmikceHaclwjAA==
X-CSE-MsgGUID: JCLF8k2OS66wYf/MDb8EHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="71219982"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="71219982"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 17:57:12 -0700
X-CSE-ConnectionGUID: n7DkDsXyRDWSLiqqvPDxpg==
X-CSE-MsgGUID: OGPW9PeVTIeB9tht5KFchA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="252278347"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 01 Jul 2026 17:57:11 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf5jo-000000009o3-0fIt;
	Thu, 02 Jul 2026 00:57:08 +0000
Date: Thu, 02 Jul 2026 08:56:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: /bin/bash: line 1: 574107 Segmentation fault      clang
 -Wp,-MMD,drivers/iio/humidity/.hdc3020.o.d -nostdinc -Iarch/mips/include
 -I./arch/mips/include/generated -Iinclude -I./include
 -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/...
Message-ID: <202607020828.Co2CUHV4-lkp@intel.com>
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

Hi Dimitri,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   665159e246749578d4e4bfe106ee3b74edcdab18
commit: cb372b4f46d4285e5d2c07ba734374151b8e34e7 iio: humditiy: hdc3020: fi=
x units for thresholds and hysteresis
date:   9 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 9 months ago
config: mips-randconfig-r134-20260701 (https://download.01.org/0day-ci/arch=
ive/20260702/202607020828.Co2CUHV4-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc=
609bb250b21b47fc7d394b4019101e9983597)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260702/202607020828.Co2CUHV4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: cb372b4f46d4 ("iio: humditiy: hdc3020: fix units for thresholds an=
d hysteresis")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607020828.Co2CUHV4-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
All errors (new ones prefixed by >>):

   warning: MIPS-I support is experimental
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace and dumped files.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,drivers/iio/humidity/.hdc3020.o.d -=
nostdinc -Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I./=
include -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinc=
lude/uapi -I./include/generated/uapi -include include/linux/compiler-versio=
n.h -include include/linux/kconfig.h -include include/linux/compiler_types.=
h -D__KERNEL__ --target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknow=
n-warning-option -Werror=3Dignored-optimization-argument -Werror=3Doption-i=
gnored -Werror=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xff=
ffffff80040000 -DLINKER_LOAD_ADDRESS=3D0x80040000 -DDATAOFFSET=3D0 -fmacro-=
prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -f=
unsigned-char -fno-common -fno-PIE -fno-strict-aliasing -mno-check-zero-div=
ision -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-=
float -ffreestanding -EL -fno-stack-check -march=3Dmips1 -DTOOLCHAIN_SUPPOR=
TS_VIRT -Iarch/mips/include/asm/mach-dec -Iarch/mips/include/asm/mach-gener=
ic -fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks -O2 -fno=
-stack-protector -fomit-frame-pointer -fstrict-flex-arrays=3D3 -fno-strict-=
overflow -fno-stack-check -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=
=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-ty=
pe -Werror=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -Wno-fra=
me-address -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-p=
rototypes -Wno-gnu -Wno-format-overflow-non-kprintf -Wno-format-truncation-=
non-kprintf -Wno-default-const-init-unsafe -Wno-pointer-sign -Wcast-functio=
n-type -Wno-unterminated-string-initialization -Wimplicit-fallthrough -Werr=
or=3Ddate-time -Werror=3Dincompatible-pointer-types -Wenum-conversion -Wunu=
sed -Wmissing-format-attribute -Wmissing-include-dirs -Wunused-const-variab=
le -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-negative-val=
ue -Wno-enum-enum-conversion -Wno-sign-compare -Wno-unused-parameter -gspli=
t-dwarf -g -fno-var-tracking -fno-crash-diagnostics -Wno-error=3Dreturn-typ=
e -Wreturn-type -funsigned-char -Wundef -falign-functions=3D64 -Idrivers/ii=
o/common/hid-sensors -fsanitize=3Darray-bounds -fsanitize=3Dshift -fsanitiz=
e=3Denum -Idrivers/iio/humidity -Idrivers/iio/humidity -DMODULE -mlong-call=
s -DKBUILD_BASENAME=3D\"hdc3020\" -DKBUILD_MODNAME=3D\"hdc3020\" -D__KBUILD=
_MODNAME=3Dkmod_hdc3020 -c -o drivers/iio/humidity/hdc3020.o drivers/iio/hu=
midity/hdc3020.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'drivers/iio/humidity/=
hdc3020.c'.
   4.	Running pass 'Shrink Wrapping analysis' on function '@hdc3020_write_t=
hresh'
    #0 0x00005566aad352cb llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-23+0x3ed52cb)
    #1 0x00005566aad32e84 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
23+0x3ed2e84)
    #2 0x00005566aac677a0 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007f174017adf0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x00005566aa309c8e (anonymous namespace)::ShrinkWrapImpl::useOrDefCS=
ROrFI(llvm::MachineInstr const&, llvm::RegScavenger*, bool) const ShrinkWra=
p.cpp:0:0
    #5 0x00005566aa30baac (anonymous namespace)::ShrinkWrapImpl::postShrink=
Wrapping(bool, llvm::MachineFunction&, llvm::RegScavenger*) ShrinkWrap.cpp:=
0:0
    #6 0x00005566aa30e230 (anonymous namespace)::ShrinkWrapImpl::run(llvm::=
MachineFunction&) ShrinkWrap.cpp:0:0
    #7 0x00005566aa30f698 (anonymous namespace)::ShrinkWrapLegacy::runOnMac=
hineFunction(llvm::MachineFunction&) (.part.0) ShrinkWrap.cpp:0:0
    #8 0x00005566aa0e7933 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-23+0x3287933)
    #9 0x00005566aa63c729 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-23+0x37dc729)
   #10 0x00005566aa63cb5c llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-23+0x37dcb5c)
   #11 0x00005566aa63d6ca (anonymous namespace)::MPPassManager::runOnModule=
(llvm::Module&) LegacyPassManager.cpp:0:0
   #12 0x00005566aa63e2dc llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-23+0x37de2dc)
   #13 0x00005566ab0f66cf clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-23+0x42966cf)
   #14 0x00005566ab72bfe7 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-23+0x48cbfe7)
   #15 0x00005566ad0f5cdc clang::ParseAST(clang::Sema&, bool, bool) (clang-=
23+0x6295cdc)
   #16 0x00005566aba929de clang::FrontendAction::Execute() (clang-23+0x4c32=
9de)
   #17 0x00005566aba1927e clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-23+0x4bb927e)
   #18 0x00005566abb77b07 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-23+0x4d17b07)
   #19 0x00005566a7db2038 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-23+0xf52038)
   #20 0x00005566a7da9d03 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #21 0x00005566a7da9d43 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #22 0x00005566ab7a5a99 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #23 0x00005566aac67b03 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-23+0x3e07b03)
   #24 0x00005566ab7a61c4 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #25 0x00005566ab762d08 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-23+0x4902d08)
   #26 0x00005566ab763c62 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-23+0x4903c62)
   #27 0x00005566ab7744dc clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-23+0x49144dc)
   #28 0x00005566a7dae9f6 clang_main(int, char**, llvm::ToolContext const&)=
 (clang-23+0xf4e9f6)
   #29 0x00005566a7cada69 main (clang-23+0xe4da69)
   #30 0x00007f1740164ca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #31 0x00007f1740164d65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #32 0x00005566a7da9741 _start (clang-23+0xf49741)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 574107 Segmentation fault      clang -Wp,-MMD,drivers=
/iio/humidity/.hdc3020.o.d -nostdinc -Iarch/mips/include -I./arch/mips/incl=
ude/generated -Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips/=
include/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include i=
nclude/linux/compiler-version.h -include include/linux/kconfig.h -include i=
nclude/linux/compiler_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -fin=
tegrated-as -Werror=3Dunknown-warning-option -Werror=3Dignored-optimization=
-argument -Werror=3Doption-ignored -Werror=3Dunused-command-line-argument -=
DVMLINUX_LOAD_ADDRESS=3D0xffffffff80040000 -DLINKER_LOAD_ADDRESS=3D0x800400=
00 -DDATAOFFSET=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -=
std=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-=
aliasing -mno-check-zero-division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -p=
ipe -msoft-float -Wa,-msoft-float -ffreestanding -EL -fno-stack-check -marc=
h=3Dmips1 -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-dec -Iarch=
/mips/include/asm/mach-generic -fno-asynchronous-unwind-tables -fno-delete-=
null-pointer-checks -O2 -fno-stack-protector -fomit-frame-pointer -fstrict-=
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
-Wno-unused-parameter -gsplit-dwarf -g -fno-var-tracking -fno-crash-diagnos=
tics -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -falign=
-functions=3D64 -Idrivers/iio/common/hid-sensors -fsanitize=3Darray-bounds =
-fsanitize=3Dshift -fsanitize=3Denum -Idrivers/iio/humidity -Idrivers/iio/h=
umidity -DMODULE -mlong-calls -DKBUILD_BASENAME=3D'"hdc3020"' -DKBUILD_MODN=
AME=3D'"hdc3020"' -D__KBUILD_MODNAME=3Dkmod_hdc3020 -c -o drivers/iio/humid=
ity/hdc3020.o drivers/iio/humidity/hdc3020.c

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
