Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE505012A3
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Oct 2026 13:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982836; cv=none; b=H9aFvAHSflpLy6mx3dPwZeedk2x8fuVJ/WnBzoFk7zjYDX0fGmWspg05BFKi4uqdUQLKJJNRHICoImCBmde2Z4eapZAGicLn3C+CWmbOuFjQh4HWV+TpMN5l5QyC0gxcst26jhRmlKesFEURr0gWcykWea+qAQMICTyqGRB28yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982836; c=relaxed/simple;
	bh=pGyB7DaRN9T+V6KueibapArMJWiiUCdNqnxQ5TVj/SY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=s03S+tB24LJRXPrldGbq19mUuy1q7AxvTLedGZq8snqbw/ioMVDISF11x8LqaIGSr+9rQdmyHuoe+stQvsB82eBQ9gkxOvl8ggPjnVv0hF+XwHDPAy/LxZST66RUkJHddX9U4Z+WghedtffF6KMI+yF/aXnSIOFCVrd1St6GnxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LFEBjCQl; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LFEBjCQl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791982827; x=1823518827;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pGyB7DaRN9T+V6KueibapArMJWiiUCdNqnxQ5TVj/SY=;
  b=LFEBjCQloVkVjJMQvYAvlOfy3idPmyPn4tOJl2mrFLzYQEXN9OyfJZtF
   3raOPIG+8bwBRM4jspzhuLzxjOsB6Ly+tYlBtH4WFoYl6ZY73bKb/1BWv
   Wa328fOUg6x+07uhJk/YNk2K6Q9I5ZlgYYxmazvX2NkHM9m2jdizEZWCW
   4XhVCnVBVI2PmFPVNw+GnsqjkPY9QCxmZJ2O2mVBPvHHw4719TGK/4gjM
   EeJP36Thw35PcHo0+p6RMGWEgS/bdpLa6INbb1ydu3TDGpE3x1Ffk9tGN
   Cn6c8MtYICpHZGliQ7EriOHd+115UnhzzyzSys8dSNQ04ckWuZRY80OcN
   g==;
X-CSE-ConnectionGUID: RXpoHxOFT/ivr0Wr9lhgVg==
X-CSE-MsgGUID: S4Zcto5bTf26hj76IcA2SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="619046"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="619046"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 06:00:26 -0700
X-CSE-ConnectionGUID: El4YSW0PSWO3meB1zyjm6g==
X-CSE-MsgGUID: PhjbjJppQfaJGwmzTJhkJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1748396"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 14 Oct 2026 06:00:24 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGyak-00000000B4L-1M5s;
	Wed, 14 Oct 2026 13:00:22 +0000
Date: Wed, 14 Oct 2026 15:00:13 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: error: call to '__compiletime_assert_577' declared with
 'error' attribute: FIELD_PREP: value too large for the field
Message-ID: <202610141435.a3W7QxNU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "clang compiler bug"
:::::: Manual check reason: "__compiletime_assert_NNN"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Christian K=C3=B6nig" <ckoenig.leichtzumerken@gmail.com>
CC: Dave Airlie <airlied@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4056b3c9d3c92ea45955641dbafeb9b960e146ef
commit: 4e28aa8f7ee26d67a4addee6e3980f1cbf861b49 drm/drm_exec: avoid indire=
ct goto
date:   3 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 3 months ago
config: loongarch-randconfig-r2311-20261014 (https://download.01.org/0day-c=
i/archive/20261014/202610141435.a3W7QxNU-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 285=
b36e5f279398c8a8f6081bee88a5e105ee07f)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261014/202610141435.a3W7QxNU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 4e28aa8f7ee2 ("drm/drm_exec: avoid indirect goto")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610141435.a3W7QxNU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: call to '__compiletime_assert_577' declared with 'error' attribut=
e: FIELD_PREP: value too large for the field
   note: expanded from here
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace and dumped files.
   Stack dump:
   0.	Program arguments: clang -D__KERNEL__ --target=3Dloongarch64-linux-gn=
usf -fintegrated-as -Werror=3Dunknown-warning-option -Werror=3Dignored-opti=
mization-argument -Werror=3Doption-ignored -Werror=3Dunused-command-line-ar=
gument -DVMLINUX_LOAD_ADDRESS=3D0x9000000000200000 -fmacro-prefix-map=3D=3D =
-Wundef -DKBUILD_EXTRA_WARN1 -fshort-wchar -funsigned-char -fno-common -fno=
-PIE -fno-strict-aliasing -std=3Dgnu11 -fms-anonymous-structs -Wno-gnu -Wno=
-microsoft-anon-tag -mno-relax -mannotate-tablejump -m64 -march=3Dloongarch=
64 -mabi=3Dlp64s -mcmodel=3Dnormal -pipe -msoft-float -fno-builtin-memcpy -=
fno-builtin-memmove -fno-builtin-memset -fno-asynchronous-unwind-tables -ms=
trict-align -isystem /opt/cross/clang-13bbb29ea2/lib/clang/24/include -fno-=
delete-null-pointer-checks -O2 -fstack-protector -fomit-frame-pointer -ftri=
vial-auto-var-init=3Dzero -falloc-token-max=3D16 -fexperimental-late-parse-=
attributes -fno-stack-clash-protection -fdiagnostics-show-inlining-chain -f=
no-lto -flto=3Dthin -fsplit-lto-unit -fvisibility=3Dhidden -fstrict-flex-ar=
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
meter -g -gdwarf-4 -fno-var-tracking -gz=3Dzlib -fsanitize-coverage=3Dstack=
-depth -fsanitize-coverage-stack-depth-callback-min=3D100 -fno-crash-diagno=
stics -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -falig=
n-functions=3D64 -fsanitize=3Darray-bounds -fsanitize=3Dbool -fsanitize-cov=
erage=3Dtrace-pc -fdebug-info-for-profiling -mllvm -enable-fs-discriminator=
=3Dtrue -mllvm -improved-fs-discriminator=3Dtrue -Idrivers/iio/adc -Idriver=
s/iio/adc -fdirect-access-external-data -fPIE -DKBUILD_MODFILE=3D\"drivers/=
iio/adc/ad4130\" -x ir -fno-lto -Wno-unused-command-line-argument -fthinlto=
-index=3Ddrivers/iio/adc/ad4130.o.thinlto.bc -c -o drivers/iio/adc/ad4130.t=
hinlto-native.o drivers/iio/adc/ad4130.o
   1.	Running pass 'Function Pass Manager' on module 'drivers/iio/adc/ad413=
0.o'.
   2.	Running pass 'LoongArch DAG->DAG Pattern Instruction Selection' on fu=
nction '@ad4130_setup'
    #0 0x000055dd3ae3f34a llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-24+0x3a5834a)
    #1 0x000055dd3ae3cf24 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
24+0x3a55f24)
    #2 0x000055dd3ad6bf40 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007ff077a4bdf0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x000055dd3be293e3 clang::BackendDiagnosticConsumer::DontCallDiagHan=
dler(llvm::DiagnosticInfoDontCall const&) (clang-24+0x4a423e3)
    #5 0x000055dd3be2ec6d (anonymous namespace)::BackendDiagnosticHandlerIm=
pl::handleDiagnostics(llvm::DiagnosticInfo const&) BackendDiagnosticHandler=
.cpp:0:0
    #6 0x000055dd3a708885 llvm::LLVMContext::diagnose(llvm::DiagnosticInfo =
const&) (clang-24+0x3321885)
    #7 0x000055dd3a6a37f0 llvm::diagnoseDontCall(llvm::CallInst const&) (cl=
ang-24+0x32bc7f0)
    #8 0x000055dd3c365a6b llvm::SelectionDAGBuilder::visitCall(llvm::CallIn=
st const&) (clang-24+0x4f7ea6b)
    #9 0x000055dd3c3661e9 llvm::SelectionDAGBuilder::visit(llvm::Instructio=
n const&) (clang-24+0x4f7f1e9)
   #10 0x000055dd3c3f4cac llvm::SelectionDAGISel::SelectBasicBlock(llvm::il=
ist_iterator_w_bits<llvm::ilist_detail::node_options<llvm::Instruction, fal=
se, false, void, true, llvm::BasicBlock>, false, true>, llvm::ilist_iterato=
r_w_bits<llvm::ilist_detail::node_options<llvm::Instruction, false, false, =
void, true, llvm::BasicBlock>, false, true>, bool&) (clang-24+0x500dcac)
   #11 0x000055dd3c3f5a20 llvm::SelectionDAGISel::SelectAllBasicBlocks(llvm=
::Function const&) (clang-24+0x500ea20)
   #12 0x000055dd3c3f7492 llvm::SelectionDAGISel::runOnMachineFunction(llvm=
::MachineFunction&) (clang-24+0x5010492)
   #13 0x000055dd3c3e54b9 llvm::SelectionDAGISelLegacy::runOnMachineFunctio=
n(llvm::MachineFunction&) (clang-24+0x4ffe4b9)
   #14 0x000055dd3a1be453 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-24+0x2dd7453)
   #15 0x000055dd3a727281 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-24+0x3340281)
   #16 0x000055dd3a7276ec llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-24+0x33406ec)
   #17 0x000055dd3a72828e (anonymous namespace)::MPPassManager::runOnModule=
(llvm::Module&) LegacyPassManager.cpp:0:0
   #18 0x000055dd3a728bbc llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-24+0x3341bbc)
   #19 0x000055dd3be909f3 codegen(llvm::lto::Config const&, llvm::TargetMac=
hine*, std::function<llvm::Expected<std::unique_ptr<llvm::CachedFileStream,=
 std::default_delete<llvm::CachedFileStream>>> (unsigned int, llvm::Twine c=
onst&)>, unsigned int, llvm::Module&, llvm::ModuleSummaryIndex const&) LTOB=
ackend.cpp:0:0
   #20 0x000055dd3be91ff0 llvm::lto::thinBackend(llvm::lto::Config const&, =
unsigned int, std::function<llvm::Expected<std::unique_ptr<llvm::CachedFile=
Stream, std::default_delete<llvm::CachedFileStream>>> (unsigned int, llvm::=
Twine const&)>, llvm::Module&, llvm::ModuleSummaryIndex const&, llvm::Funct=
ionImporter::ImportMapTy const&, llvm::DenseMap<unsigned long, llvm::Global=
ValueSummary*, llvm::DenseMapInfo<unsigned long, void>, llvm::detail::Dense=
MapPair<unsigned long, llvm::GlobalValueSummary*>> const&, llvm::MapVector<=
llvm::StringRef, llvm::BitcodeModule, llvm::DenseMap<llvm::StringRef, unsig=
ned int, llvm::DenseMapInfo<llvm::StringRef, void>, llvm::detail::DenseMapP=
air<llvm::StringRef, unsigned int>>, llvm::SmallVector<std::pair<llvm::Stri=
ngRef, llvm::BitcodeModule>, 0u>, 0u>*, bool, llvm::ArrayRef<llvm::StringRe=
f>, std::function<llvm::Expected<std::unique_ptr<llvm::CachedFileStream, st=
d::default_delete<llvm::CachedFileStream>>> (unsigned int, llvm::Twine cons=
t&)>, std::vector<unsigned char, std::allocator<unsigned char>> const&) (cl=
ang-24+0x4aaaff0)
   #21 0x000055dd3b1ff9ba runThinLTOBackend(clang::CompilerInstance&, llvm:=
:ModuleSummaryIndex*, llvm::Module*, std::unique_ptr<llvm::raw_pwrite_strea=
m, std::default_delete<llvm::raw_pwrite_stream>>, std::__cxx11::basic_strin=
g<char, std::char_traits<char>, std::allocator<char>>, std::__cxx11::basic_=
string<char, std::char_traits<char>, std::allocator<char>>, clang::BackendA=
ction) BackendUtil.cpp:0:0
   #22 0x000055dd3b207a86 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::Module*, clang::BackendAction, llvm::Intrus=
iveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm::raw_pwrite_strea=
m, std::default_delete<llvm::raw_pwrite_stream>>, clang::BackendConsumer*) =
(clang-24+0x3e20a86)
   #23 0x000055dd3b82dba2 clang::CodeGenAction::ExecuteAction() (clang-24+0=
x4446ba2)
   #24 0x000055dd3bb7f79e clang::FrontendAction::Execute() (clang-24+0x4798=
79e)
   #25 0x000055dd3bb0de6e clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-24+0x4726e6e)
   #26 0x000055dd3bc48e57 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-24+0x4861e57)
   #27 0x000055dd37c91998 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-24+0x8aa998)
   #28 0x000055dd37c89683 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #29 0x000055dd37c896c7 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #30 0x000055dd3b8a9b89 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #31 0x000055dd3ad6c273 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-24+0x3985273)
   #32 0x000055dd3b8ab10c clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #33 0x000055dd3b869188 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-24+0x4482188)
   #34 0x000055dd3b86d8f2 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-24+0x44868f2)
   #35 0x000055dd3b87dadc clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-24+0x4496adc)
   #36 0x000055dd37c8e332 clang_main(int, char**, llvm::ToolContext const&)=
 (clang-24+0x8a7332)
   #37 0x000055dd37bfac32 main (clang-24+0x813c32)
   #38 0x00007ff077a35ca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #39 0x00007ff077a35d65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #40 0x000055dd37c890e1 _start (clang-24+0x8a20e1)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 3815411 Segmentation fault      clang -D__KERNEL__ --=
target=3Dloongarch64-linux-gnusf -fintegrated-as -Werror=3Dunknown-warning-=
option -Werror=3Dignored-optimization-argument -Werror=3Doption-ignored -We=
rror=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0x900000000020=
0000 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -fshort-wchar -f=
unsigned-char -fno-common -fno-PIE -fno-strict-aliasing -std=3Dgnu11 -fms-a=
nonymous-structs -Wno-gnu -Wno-microsoft-anon-tag -mno-relax -mannotate-tab=
lejump -m64 -march=3Dloongarch64 -mabi=3Dlp64s -mcmodel=3Dnormal -pipe -mso=
ft-float -fno-builtin-memcpy -fno-builtin-memmove -fno-builtin-memset -fno-=
asynchronous-unwind-tables -mstrict-align -isystem /opt/cross/clang-13bbb29=
ea2/lib/clang/24/include -fno-delete-null-pointer-checks -O2 -fstack-protec=
tor -fomit-frame-pointer -ftrivial-auto-var-init=3Dzero -falloc-token-max=
=3D16 -fexperimental-late-parse-attributes -fno-stack-clash-protection -fdi=
agnostics-show-inlining-chain -fno-lto -flto=3Dthin -fsplit-lto-unit -fvisi=
bility=3Dhidden -fstrict-flex-arrays=3D3 -fno-strict-overflow -fno-stack-ch=
eck -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=3Dimplicit-function-d=
eclaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-pr=
ototypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wno-addres=
s-of-packed-member -Wmissing-declarations -Wmissing-prototypes -Wno-format-=
overflow-non-kprintf -Wno-format-truncation-non-kprintf -Wno-default-const-=
init-unsafe -Wno-type-limits -Wno-pointer-sign -Wcast-function-type -Wno-un=
terminated-string-initialization -Wimplicit-fallthrough -Werror=3Ddate-time=
 -Werror=3Dincompatible-pointer-types -Wenum-conversion -Wunused -Wmissing-=
format-attribute -Wmissing-include-dirs -Wunused-const-variable -Wno-missin=
g-field-initializers -Wno-shift-negative-value -Wno-enum-enum-conversion -W=
no-sign-compare -Wno-unused-parameter -g -gdwarf-4 -fno-var-tracking -gz=3Dz=
lib -fsanitize-coverage=3Dstack-depth -fsanitize-coverage-stack-depth-callb=
ack-min=3D100 -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wreturn-type=
 -funsigned-char -Wundef -falign-functions=3D64 -fsanitize=3Darray-bounds -=
fsanitize=3Dbool -fsanitize-coverage=3Dtrace-pc -fdebug-info-for-profiling =
-mllvm -enable-fs-discriminator=3Dtrue -mllvm -improved-fs-discriminator=3Dt=
rue -Idrivers/iio/adc -Idrivers/iio/adc -fdirect-access-external-data -fPIE=
 -DKBUILD_MODFILE=3D'"drivers/iio/adc/ad4130"' -x ir -fno-lto -Wno-unused-c=
ommand-line-argument -fthinlto-index=3Ddrivers/iio/adc/ad4130.o.thinlto.bc =
-c -o drivers/iio/adc/ad4130.thinlto-native.o drivers/iio/adc/ad4130.o

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
