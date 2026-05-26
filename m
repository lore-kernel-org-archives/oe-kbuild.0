Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C086B30C166
	for <oe-kbuild@lists.linux.dev>; Tue, 26 May 2026 15:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779808249; cv=none; b=F3qNpLhoqq3XHvcTHJWzjh2srLTKF7QfLGbyMC1lkCWmU/NuJEPz2ejhJw8lQ4aGPc7Z500zZat1xQzriSCpewHYFcWaPW3D0SsgEGPPuohF0Osv887/cCXDLeI0MlaHpWVggqR9jr6kC08ws+WqdCZ50Z+YsGWX2B65h0SWU94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779808249; c=relaxed/simple;
	bh=z2UpocXGVyUvZ7A6ANX2YG1fpm3GPthJcLNrLCu9VQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VmwCyTXWrfK0IssAeh/Xzl/vFsdowXc9tBOfKD0JEugKra1vBxx68UGIHXp9gzWrPY5Ilk1hERKdnfkAW9s5XG9aXTMLuBuWw22MYgAIUYVXX3+Us0mwWY3/B/5tNRhNhq6xYzItE47S9LwwIsPIi0y1YPV836wt7qYaYCnzD/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NhXefpoU; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NhXefpoU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779808247; x=1811344247;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=z2UpocXGVyUvZ7A6ANX2YG1fpm3GPthJcLNrLCu9VQI=;
  b=NhXefpoUyBPheXpegTrO4LqB6SRJRV4PPCTZd9TNnmr6pd+GTv/QsG2I
   ui21O0aPmHVM+TeuFC1zu+Lb7LIKXdArslKQOYVXBsguI7jFMcYEbouNT
   9GUxOo0Qo927Ju/dmM8f5edQpjn/0JXHNwrRGqBV8S7uNU6kKacVgia5U
   96QW9DyhVpNQQ1gsAmUsLj19LWKaQLl6fpUGbvLdIxkDBY50/eoWM17H5
   1qCK3e5ifoC4wNfQWYOtprfpEJ/UsERVJnzroygaTTdm65O07+ypogvCd
   WygsV51fU0pVMsAZrgaD8+HBvjYN8mvAjnGHw4hCkqqA4JO4PmdCr4FRy
   w==;
X-CSE-ConnectionGUID: geT2Cgc6SKmLFPRC9gxdyA==
X-CSE-MsgGUID: ubc+0bzkRhKqUsiOmEbGHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80606734"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="80606734"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 08:10:47 -0700
X-CSE-ConnectionGUID: Jsn+oON/Rri8kjffcOR+6w==
X-CSE-MsgGUID: XyhWseF3TBqnPQnnHUq3Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="247028897"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 May 2026 08:10:45 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRtQY-000000002dy-3UbC;
	Tue, 26 May 2026 15:10:42 +0000
Date: Tue, 26 May 2026 23:10:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: /bin/bash: line 1: 1198232 Segmentation fault      clang
 -Wp,-MMD,drivers/hwmon/.ltc2992.o.d -nostdinc -Iarch/mips/include
 -I./arch/mips/include/generated -Iinclude -I./include
 -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi
 -...
Message-ID: <202605262347.xFiEjuwX-lkp@intel.com>
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
TO: Sanman Pradhan <psanman@juniper.net>
CC: Guenter Roeck <linux@roeck-us.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e8c2f9fdadee7cbc75134dc463c1e0d856d6e5c7
commit: d6cc7c99bf1f73eda7d565d224d791d16239bb41 hwmon: (ltc2992) Clamp thr=
eshold writes to hardware range
date:   4 weeks ago
:::::: branch date: 19 hours ago
:::::: commit date: 4 weeks ago
config: mips-randconfig-r073-20260524 (https://download.01.org/0day-ci/arch=
ive/20260526/202605262347.xFiEjuwX-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5ba=
c06718f502014fade905512f1d26d578a18f3)
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260526/202605262347.xFiEjuwX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: d6cc7c99bf1f ("hwmon: (ltc2992) Clamp threshold writes to hardware=
 range")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605262347.xFiEjuwX-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
All errors (new ones prefixed by >>):

   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,drivers/hwmon/.ltc2992.o.d -nostdin=
c -Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I./include=
 -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/ua=
pi -I./include/generated/uapi -include include/linux/compiler-version.h -in=
clude include/linux/kconfig.h -include include/linux/compiler_types.h -D__K=
ERNEL__ --target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknown-warni=
ng-option -Werror=3Dignored-optimization-argument -Werror=3Doption-ignored =
-Werror=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xffffffff8=
0101000 -DLINKER_LOAD_ADDRESS=3D0x80101000 -DDATAOFFSET=3D0 -fmacro-prefix-=
map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -fshort-wchar -funsigned-char -fno-c=
ommon -fno-PIE -fno-strict-aliasing -std=3Dgnu11 -fms-anonymous-structs -Wn=
o-gnu -Wno-microsoft-anon-tag -mno-check-zero-division -mabi=3D32 -G 0 -mno=
-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-float -ffreestanding -EB -=
fno-stack-check -march=3Dmips3 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/=
mips/include/asm/mach-n64 -Iarch/mips/include/asm/mach-generic -fno-asynchr=
onous-unwind-tables -fno-delete-null-pointer-checks -Os -fno-stack-protecto=
r -fomit-frame-pointer -ftrivial-auto-var-init=3Dzero -fexperimental-late-p=
arse-attributes -fdiagnostics-show-inlining-chain -fstrict-flex-arrays=3D3 =
-fno-strict-overflow -fno-stack-check -fno-builtin-wcslen -Wall -Wextra -Wu=
ndef -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=
=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-security -Wno-trigra=
phs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-declarations=
 -Wmissing-prototypes -Wno-format-overflow-non-kprintf -Wno-format-truncati=
on-non-kprintf -Wno-default-const-init-unsafe -Wno-type-limits -Wno-pointer=
-sign -Wcast-function-type -Wno-unterminated-string-initialization -Wimplic=
it-fallthrough -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -We=
num-conversion -Wunused -Wmissing-format-attribute -Wmissing-include-dirs -=
Wunused-const-variable -Wno-missing-field-initializers -Wno-shift-negative-=
value -Wno-enum-enum-conversion -Wno-sign-compare -Wno-unused-parameter -fn=
o-crash-diagnostics -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char =
-Wundef -falign-functions=3D64 -Idrivers/hwmon -Idrivers/hwmon -ffunction-s=
ections -fdata-sections -DKBUILD_MODFILE=3D\"drivers/hwmon/ltc2992\" -DKBUI=
LD_BASENAME=3D\"ltc2992\" -DKBUILD_MODNAME=3D\"ltc2992\" -D__KBUILD_MODNAME=
=3Dltc2992 -c -o drivers/hwmon/ltc2992.o drivers/hwmon/ltc2992.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'drivers/hwmon/ltc2992=
.c'.
   4.	Running pass 'Shrink Wrapping analysis' on function '@ltc2992_write'
    #0 0x000055b5d1266c1b llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-23+0x413cc1b)
    #1 0x000055b5d12647e4 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
23+0x413a7e4)
    #2 0x000055b5d11976a0 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007feb66df5df0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x000055b5d07ca0bd (anonymous namespace)::ShrinkWrapImpl::useOrDefCS=
ROrFI(llvm::MachineInstr const&, llvm::RegScavenger*, bool) const ShrinkWra=
p.cpp:0:0
    #5 0x000055b5d07cd609 (anonymous namespace)::ShrinkWrapImpl::postShrink=
Wrapping(bool, llvm::MachineFunction&, llvm::RegScavenger*) ShrinkWrap.cpp:=
0:0
    #6 0x000055b5d07d0291 (anonymous namespace)::ShrinkWrapImpl::run(llvm::=
MachineFunction&) ShrinkWrap.cpp:0:0
    #7 0x000055b5d07d1957 (anonymous namespace)::ShrinkWrapLegacy::runOnMac=
hineFunction(llvm::MachineFunction&) (.part.0) ShrinkWrap.cpp:0:0
    #8 0x000055b5d058d438 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-23+0x3463438)
    #9 0x000055b5d0b54869 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-23+0x3a2a869)
   #10 0x000055b5d0b54a0c llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-23+0x3a2aa0c)
   #11 0x000055b5d0b53c78 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-23+0x3a29c78)
   #12 0x000055b5d1662071 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-23+0x4538071)
   #13 0x000055b5d1ca76c7 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-23+0x4b7d6c7)
   #14 0x000055b5d36b2adc clang::ParseAST(clang::Sema&, bool, bool) (clang-=
23+0x6588adc)
   #15 0x000055b5d200117a clang::FrontendAction::Execute() (clang-23+0x4ed7=
17a)
   #16 0x000055b5d1f7a3d6 clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-23+0x4e503d6)
   #17 0x000055b5d20ea207 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-23+0x4fc0207)
   #18 0x000055b5ce082a55 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-23+0xf58a55)
   #19 0x000055b5ce07a763 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #20 0x000055b5ce07a7a3 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #21 0x000055b5d1d18de9 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #22 0x000055b5d1197a03 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-23+0x406da03)
   #23 0x000055b5d1d19514 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #24 0x000055b5d1cd8668 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-23+0x4bae668)
   #25 0x000055b5d1cd95c2 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-23+0x4baf5c2)
   #26 0x000055b5d1cea7bc clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-23+0x4bc07bc)
   #27 0x000055b5ce07f40f clang_main(int, char**, llvm::ToolContext const&)=
 (clang-23+0xf5540f)
   #28 0x000055b5cdf15bb9 main (clang-23+0xdebbb9)
   #29 0x00007feb66ddfca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #30 0x00007feb66ddfd65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #31 0x000055b5ce07a1a1 _start (clang-23+0xf501a1)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 1198232 Segmentation fault      clang -Wp,-MMD,driver=
s/hwmon/.ltc2992.o.d -nostdinc -Iarch/mips/include -I./arch/mips/include/ge=
nerated -Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips/includ=
e/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include include=
/linux/compiler-version.h -include include/linux/kconfig.h -include include=
/linux/compiler_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -fintegrat=
ed-as -Werror=3Dunknown-warning-option -Werror=3Dignored-optimization-argum=
ent -Werror=3Doption-ignored -Werror=3Dunused-command-line-argument -DVMLIN=
UX_LOAD_ADDRESS=3D0xffffffff80101000 -DLINKER_LOAD_ADDRESS=3D0x80101000 -DD=
ATAOFFSET=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -fshort=
-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -std=3Dgnu=
11 -fms-anonymous-structs -Wno-gnu -Wno-microsoft-anon-tag -mno-check-zero-=
division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-mso=
ft-float -ffreestanding -EB -fno-stack-check -march=3Dmips3 -Wa,--trap -DTO=
OLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-n64 -Iarch/mips/include/=
asm/mach-generic -fno-asynchronous-unwind-tables -fno-delete-null-pointer-c=
hecks -Os -fno-stack-protector -fomit-frame-pointer -ftrivial-auto-var-init=
=3Dzero -fexperimental-late-parse-attributes -fdiagnostics-show-inlining-ch=
ain -fstrict-flex-arrays=3D3 -fno-strict-overflow -fno-stack-check -fno-bui=
ltin-wcslen -Wall -Wextra -Wundef -Werror=3Dimplicit-function-declaration -=
Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wn=
o-format-security -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-=
member -Wmissing-declarations -Wmissing-prototypes -Wno-format-overflow-non=
-kprintf -Wno-format-truncation-non-kprintf -Wno-default-const-init-unsafe =
-Wno-type-limits -Wno-pointer-sign -Wcast-function-type -Wno-unterminated-s=
tring-initialization -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Di=
ncompatible-pointer-types -Wenum-conversion -Wunused -Wmissing-format-attri=
bute -Wmissing-include-dirs -Wunused-const-variable -Wno-missing-field-init=
ializers -Wno-shift-negative-value -Wno-enum-enum-conversion -Wno-sign-comp=
are -Wno-unused-parameter -fno-crash-diagnostics -Wno-error=3Dreturn-type -=
Wreturn-type -funsigned-char -Wundef -falign-functions=3D64 -Idrivers/hwmon=
 -Idrivers/hwmon -ffunction-sections -fdata-sections -DKBUILD_MODFILE=3D'"d=
rivers/hwmon/ltc2992"' -DKBUILD_BASENAME=3D'"ltc2992"' -DKBUILD_MODNAME=3D'=
"ltc2992"' -D__KBUILD_MODNAME=3Dltc2992 -c -o drivers/hwmon/ltc2992.o drive=
rs/hwmon/ltc2992.c

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
