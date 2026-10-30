Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793374672;
	b=N6Z+Uemcmip8NXd1yeQvSZARq3b6zkZjoNMQ1k3IV940GrwckJfzr/ld0BUb7EY16cxb
	 LiXWZyc9FdSgeR4eVp60n2vnZufqoNmgE2pHg61r0Z1bd4iSddo8hMWB1KjhzakvhFwOA
	 Y1KISFnIMsTx2Vg5ToNcsn7xgc4NF3P6UBKnKNBQZDcF0yMLH0hTtRXsmwWtcwbgOgK/T
	 mP51/Sz9Oygpgxkefwq449Jvw7YZV+bL6zo2ffXj4q/mFzwB+FxT8jF/F6YTQhsCE/Usx
	 iVBmhgEVVYWBvLyM+ZRrEX0TNpebvLGNgRFTzSLLaeKygzrpg/zNqevnpdfoAUd+S2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793374672;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=2If35BAUTZGFbSNxtNfVIoitSFVG1NEcZJvsGNUe7hs=;
	b=FkD1BtRx5sHxxwwaWgJRkXm02KPGyVArU/W0S2t1WQ8oh1jvR8OvQ6CY0IPRZ0BtPMZC
	 wp70++6+SOmwfeMttJYQ6+yzlVBWzAFUSpDk2zcAs6Aff5+quNYVyCuDCFvV0dNR0fLGN
	 wsrKFSCQ/oiHs7VgCdBpJANsxhdNmc2GLZ30NO78A2SfR6AoM3vSR0HN7Pml/KXLNLzhg
	 KegZkxfsUhGsbid1vEutookXGQgztMcb14xJJsPH9ffja/THnL90iatrOtbFek7DRwMeQ
	 WvXjbqSY8zMpGS4EGi1qitKjDOKtf6xISiIMk6o/gfd1fYYtOSRXzkhpeWSHUG6U/2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JMp8GVX0;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D311F606A324
	for <oe-kbuild@lists.linux.dev>; Fri, 30 Oct 2026 15:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D311F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JMp8GVX0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793374671; x=1824910671;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=aTfbQLJm4pM8JqwsRRM5z9X51V2F+c5J7N9Tgxb1Fpc=;
  b=JMp8GVX0bCbpzp5kO9iYYpjLtnSgiHG/DwWtKTp3F5CORBYwJUd4FJsI
   Vxz31UbwXUpH9UFOu29wh9icpzKVVxraE9Po6JEMDyt1yEbwUy7oiYFi3
   xMD0jGQgNAvJeD8OR5dYHvh+KPvPYem9pgdGYGZSzOIOIF2H1iQZGLgZ9
   YH/W9/UxZfGZDowdy5yfqGRxhf7OEIHytTZ18bqzlQJ3UU771n3pzcCNg
   jbS1s6DP7WiPrKOFsa4uOytcOStxlYNOt4EVhLpSz5JQcLLtRZwXllgLQ
   uF2dWHAD3nX7xmnXBgvAPYuSIIdDSh9nLdZ2umCPbnaN6EG+uvmnkO7jd
   g==;
X-CSE-ConnectionGUID: 1D73w7CEQT65z2DfoBoq3g==
X-CSE-MsgGUID: afB42fK+TcKXG8GIievFAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2018527"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2018527"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 08:37:50 -0700
X-CSE-ConnectionGUID: P1LeVFZbQWetA2KwUvQVaA==
X-CSE-MsgGUID: BKpQ4+V7SQSyGxSxZwQ6Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5789037"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 30 Oct 2026 08:37:49 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMofq-000000005cN-2U9o;
	Fri, 30 Oct 2026 15:37:46 +0000
Date: Fri, 30 Oct 2026 16:36:55 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: /bin/bash: line 1: 2264339 Segmentation fault      clang
 -Wp,-MMD,drivers/clk/ultrarisc/.clk-ultrarisc.o.d -nostdinc
 -Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I./include
 -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -I...
Message-ID: <202610301603.RCR2VsoM-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "clang compiler bug"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jia Wang <wangjia@ultrarisc.com>
CC: Brian Masney <bmasney@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d89e1d186ec9271bf78e62771779e9fc03bf0fc3
commit: 3948a36be42b67f43f1d3f113dad4c8b347efb9b clk: ultrarisc: Add DP1000=
 clock driver
date:   3 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 3 months ago
config: mips-randconfig-r2310-20261030 (https://download.01.org/0day-ci/arc=
hive/20261030/202610301603.RCR2VsoM-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8f6=
b51ca8bab1d49006ddaa042bc7e4e7306975d)
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261030/202610301603.RCR2VsoM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 3948a36be42b ("clk: ultrarisc: Add DP1000 clock driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610301603.RCR2VsoM-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
All errors (new ones prefixed by >>):

   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace and dumped files.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,drivers/clk/ultrarisc/.clk-ultraris=
c.o.d -nostdinc -Iarch/mips/include -I./arch/mips/include/generated -Iinclu=
de -I./include -Iarch/mips/include/uapi -I./arch/mips/include/generated/uap=
i -Iinclude/uapi -I./include/generated/uapi -include include/linux/compiler=
-version.h -include include/linux/kconfig.h -include include/linux/compiler=
_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -fintegrated-as -Werror=
=3Dunknown-warning-option -Werror=3Dignored-optimization-argument -Werror=
=3Doption-ignored -Werror=3Dunused-command-line-argument -DVMLINUX_LOAD_ADD=
RESS=3D0xffffffff80080000 -DLINKER_LOAD_ADDRESS=3D0x80080000 -DDATAOFFSET=
=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -fshort-wchar -f=
unsigned-char -fno-common -fno-PIE -fno-strict-aliasing -std=3Dgnu11 -fms-a=
nonymous-structs -Wno-gnu -Wno-microsoft-anon-tag -mno-check-zero-division =
-mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-float =
-ffreestanding -EL -fno-stack-check -march=3Dmips3 -Wa,--trap -DTOOLCHAIN_S=
UPPORTS_VIRT -Iarch/mips/include/asm/mach-jazz -Iarch/mips/include/asm/mach=
-generic -fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks -O=
2 -fno-stack-protector -fomit-frame-pointer -falloc-token-max=3D16 -fexperi=
mental-late-parse-attributes -fdiagnostics-show-inlining-chain -fstrict-fle=
x-arrays=3D3 -fno-strict-overflow -fno-stack-check -fno-builtin-wcslen -Wal=
l -Wextra -Wundef -Werror=3Dimplicit-function-declaration -Werror=3Dimplici=
t-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-securit=
y -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing=
-declarations -Wmissing-prototypes -Wno-format-overflow-non-kprintf -Wno-fo=
rmat-truncation-non-kprintf -Wno-default-const-init-unsafe -Wno-type-limits=
 -Wno-pointer-sign -Wcast-function-type -Wno-unterminated-string-initializa=
tion -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Dincompatible-poin=
ter-types -Wenum-conversion -Wunused -Wmissing-format-attribute -Wmissing-i=
nclude-dirs -Wunused-const-variable -Wno-missing-field-initializers -Wno-sh=
ift-negative-value -Wno-enum-enum-conversion -Wno-sign-compare -Wno-unused-=
parameter -DRANDSTRUCT -frandomize-layout-seed-file=3D./scripts/basic/rands=
truct.seed -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wreturn-type -f=
unsigned-char -Wundef -falign-functions=3D64 -Idrivers/clk/ultrarisc -Idriv=
ers/clk/ultrarisc -DKBUILD_MODFILE=3D\"drivers/clk/ultrarisc/clk-ultrarisc\=
" -DKBUILD_BASENAME=3D\"clk_ultrarisc\" -DKBUILD_MODNAME=3D\"clk_ultrarisc\=
" -D__KBUILD_MODNAME=3Dclk_ultrarisc -c -o drivers/clk/ultrarisc/clk-ultrar=
isc.o drivers/clk/ultrarisc/clk-ultrarisc.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'drivers/clk/ultrarisc=
/clk-ultrarisc.c'.
   4.	Running pass 'Shrink Wrapping analysis' on function '@ultrarisc_pll_r=
ecalc_rate'
    #0 0x000055930c18ddca llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-24+0x4162dca)
    #1 0x000055930c18b9a4 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
24+0x41609a4)
    #2 0x000055930c0b7580 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007f21462ccdf0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x000055930b6c2b52 (anonymous namespace)::ShrinkWrapImpl::useOrDefCS=
ROrFI(llvm::MachineInstr const&, llvm::RegScavenger*, bool) const ShrinkWra=
p.cpp:0:0
    #5 0x000055930b6c5f7c (anonymous namespace)::ShrinkWrapImpl::run(llvm::=
MachineFunction&) (.constprop.0) ShrinkWrap.cpp:0:0
    #6 0x000055930b6c7c0d (anonymous namespace)::ShrinkWrapLegacy::runOnMac=
hineFunction(llvm::MachineFunction&) (.part.0) ShrinkWrap.cpp:0:0
    #7 0x000055930b4f04b3 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-24+0x34c54b3)
    #8 0x000055930ba67a29 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-24+0x3a3ca29)
    #9 0x000055930ba67e7c llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-24+0x3a3ce7c)
   #10 0x000055930ba68a0e (anonymous namespace)::MPPassManager::runOnModule=
(llvm::Module&) LegacyPassManager.cpp:0:0
   #11 0x000055930ba6933c llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-24+0x3a3e33c)
   #12 0x000055930d3686b5 runCodeGenPipelineLegacy(llvm::TargetMachine&, ll=
vm::Module&, llvm::raw_pwrite_stream&, llvm::raw_pwrite_stream*, llvm::Code=
GenFileType, bool, bool) RunCodeGen.cpp:0:0
   #13 0x000055930d3687a0 llvm::runCodeGenPipeline(llvm::TargetMachine&, ll=
vm::Module&, llvm::raw_pwrite_stream&, llvm::raw_pwrite_stream*, llvm::Code=
GenFileType, bool, bool, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>) (=
clang-24+0x533d7a0)
   #14 0x000055930c555e8d (anonymous namespace)::EmitAssemblyHelper::emitAs=
sembly(clang::BackendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::=
default_delete<llvm::raw_pwrite_stream>>, clang::BackendConsumer*) BackendU=
til.cpp:0:0
   #15 0x000055930c55650a clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::Module*, clang::BackendAction, llvm::Intrus=
iveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm::raw_pwrite_strea=
m, std::default_delete<llvm::raw_pwrite_stream>>, clang::BackendConsumer*) =
(clang-24+0x452b50a)
   #16 0x000055930cb7f56f clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-24+0x4b5456f)
   #17 0x000055930f9b3a4c clang::ParseAST(clang::Sema&, bool, bool) (clang-=
24+0x7988a4c)
   #18 0x000055930ced681e clang::FrontendAction::Execute() (clang-24+0x4eab=
81e)
   #19 0x000055930ce649ae clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-24+0x4e399ae)
   #20 0x000055930cfa035f clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-24+0x4f7535f)
   #21 0x0000559308f33188 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-24+0xf08188)
   #22 0x0000559308f2aee3 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #23 0x0000559308f2af27 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #24 0x000055930cbfdcd9 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #25 0x000055930c0b78b3 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-24+0x408c8b3)
   #26 0x000055930cbff10c clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #27 0x000055930cbbc208 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-24+0x4b91208)
   #28 0x000055930cbbec56 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-24+0x4b93c56)
   #29 0x000055930cbd177c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-24+0x4ba677c)
   #30 0x0000559308f2fb72 clang_main(int, char**, llvm::ToolContext const&)=
 (clang-24+0xf04b72)
   #31 0x0000559308e9e222 main (clang-24+0xe73222)
   #32 0x00007f21462b6ca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #33 0x00007f21462b6d65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #34 0x0000559308f2a941 _start (clang-24+0xeff941)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 2264339 Segmentation fault      clang -Wp,-MMD,driver=
s/clk/ultrarisc/.clk-ultrarisc.o.d -nostdinc -Iarch/mips/include -I./arch/m=
ips/include/generated -Iinclude -I./include -Iarch/mips/include/uapi -I./ar=
ch/mips/include/generated/uapi -Iinclude/uapi -I./include/generated/uapi -i=
nclude include/linux/compiler-version.h -include include/linux/kconfig.h -i=
nclude include/linux/compiler_types.h -D__KERNEL__ --target=3Dmipsel-linux-=
gnu -fintegrated-as -Werror=3Dunknown-warning-option -Werror=3Dignored-opti=
mization-argument -Werror=3Doption-ignored -Werror=3Dunused-command-line-ar=
gument -DVMLINUX_LOAD_ADDRESS=3D0xffffffff80080000 -DLINKER_LOAD_ADDRESS=3D0=
x80080000 -DDATAOFFSET=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_=
WARN1 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasi=
ng -std=3Dgnu11 -fms-anonymous-structs -Wno-gnu -Wno-microsoft-anon-tag -mn=
o-check-zero-division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-f=
loat -Wa,-msoft-float -ffreestanding -EL -fno-stack-check -march=3Dmips3 -W=
a,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-jazz -Iarch=
/mips/include/asm/mach-generic -fno-asynchronous-unwind-tables -fno-delete-=
null-pointer-checks -O2 -fno-stack-protector -fomit-frame-pointer -falloc-t=
oken-max=3D16 -fexperimental-late-parse-attributes -fdiagnostics-show-inlin=
ing-chain -fstrict-flex-arrays=3D3 -fno-strict-overflow -fno-stack-check -f=
no-builtin-wcslen -Wall -Wextra -Wundef -Werror=3Dimplicit-function-declara=
tion -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototyp=
es -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wno-address-of-p=
acked-member -Wmissing-declarations -Wmissing-prototypes -Wno-format-overfl=
ow-non-kprintf -Wno-format-truncation-non-kprintf -Wno-default-const-init-u=
nsafe -Wno-type-limits -Wno-pointer-sign -Wcast-function-type -Wno-untermin=
ated-string-initialization -Wimplicit-fallthrough -Werror=3Ddate-time -Werr=
or=3Dincompatible-pointer-types -Wenum-conversion -Wunused -Wmissing-format=
-attribute -Wmissing-include-dirs -Wunused-const-variable -Wno-missing-fiel=
d-initializers -Wno-shift-negative-value -Wno-enum-enum-conversion -Wno-sig=
n-compare -Wno-unused-parameter -DRANDSTRUCT -frandomize-layout-seed-file=
=3D./scripts/basic/randstruct.seed -fno-crash-diagnostics -Wno-error=3Dretu=
rn-type -Wreturn-type -funsigned-char -Wundef -falign-functions=3D64 -Idriv=
ers/clk/ultrarisc -Idrivers/clk/ultrarisc -DKBUILD_MODFILE=3D'"drivers/clk/=
ultrarisc/clk-ultrarisc"' -DKBUILD_BASENAME=3D'"clk_ultrarisc"' -DKBUILD_MO=
DNAME=3D'"clk_ultrarisc"' -D__KBUILD_MODNAME=3Dclk_ultrarisc -c -o drivers/=
clk/ultrarisc/clk-ultrarisc.o drivers/clk/ultrarisc/clk-ultrarisc.c

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
