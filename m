Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD11D420867
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Jul 2026 20:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783455190; cv=none; b=jaHtqCX0W4gAHVFBkiqvy/ma7qRsY8RxUtBYYlaW6fWVKD0wGxX+SfQa9mw+f3f1aVAjZ+iryS5WwyNGGcnBb2iUDVziAzNT+pgoGVUHjrYFPGIOjtTDM8gox+HQciaAeKgTnTy/UrPLtuCyvnE9j3sPPG2I8ZoEpOnXLJvvd5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783455190; c=relaxed/simple;
	bh=pcDxCF1SqT7Y7hMkE3vBMbnBeYjhDZRWhNd3HwylBOg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u4ye1bBv7jS7PMxz0gwNa7XKSoCbpittV0DGghHu8D4BiIDLCiXx5ILkCyhLtpW8+jjOYNWMkJeC1md3Nes+FH41ZdkzCu6xMLRgNEWkKo3HSaEIL7xiKuo/Vqw2mXsNx+dzNe12kcO1sMIB9tEHFQHd+dT8a6gtmI7X8kCvZ/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dxe2/Bru; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dxe2/Bru"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783455187; x=1814991187;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pcDxCF1SqT7Y7hMkE3vBMbnBeYjhDZRWhNd3HwylBOg=;
  b=dxe2/BruJwJIzNOfs9EeE+N/1L0NfIDp5FZVzcV/6ffS4TypWrKBYhmo
   VWMPQEblCgl7wwrc44gy+L4Kaeg5PBAqNEhQFApFeVwJBL3zxLPQWoSXU
   R8s6PXE2OthgDUHOhjNslDwuUrelqHZBhrVhpxTP2W0D6ksFHu0rnUdI6
   CdUu6qz7bMxOPXchUK6AvcBOAFASFiGMszrlTO1TnNJ5W0UxJNEvotlZa
   RN9HAQ+SZU6X6tCtXUorupXIJVA4wjhkoDE/yEdDm0jehF8LZHy8Dzuum
   vuX2fZBmhfDk/JdijFhblFtGSy5LOZnDBPNQr1N6IyB+WiO/yyuOijucc
   Q==;
X-CSE-ConnectionGUID: Y0o9fO1sSY+JedGFlBfr8g==
X-CSE-MsgGUID: U5pPaKoUSAyzV1yS9CwqvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="106911536"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="106911536"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 13:13:07 -0700
X-CSE-ConnectionGUID: stWf1+OgR8G0dF1VWnRFyg==
X-CSE-MsgGUID: JQHyaTd6Tx2Qi7ukzEZR9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="247702259"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 07 Jul 2026 13:13:05 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whCAA-00000000FeV-2iSr;
	Tue, 07 Jul 2026 20:13:02 +0000
Date: Wed, 8 Jul 2026 04:12:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net] vxlan: vnifilter: enforce exact length of
 GROUP/GROUP6 attributes
Message-ID: <202607080424.KSXDsyz9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "clang compiler bug"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260704222254.914567-1-xmei5@asu.edu>
References: <20260704222254.914567-1-xmei5@asu.edu>
TO: Xiang Mei <xmei5@asu.edu>
TO: Andrew Lunn <andrew+netdev@lunn.ch>
TO: "David S . Miller" <davem@davemloft.net>
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Roopa Prabhu <roopa@nvidia.com>
CC: netdev@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Petr Machata <petrm@nvidia.com>
CC: Andy Roulin <aroulin@nvidia.com>
CC: David Yang <mmyangfl@gmail.com>
CC: Kees Cook <kees@kernel.org>
CC: Weiming Shi <bestswngs@gmail.com>
CC: Xiang Mei <xmei5@asu.edu>

Hi Xiang,

kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiang-Mei/vxlan-vnif=
ilter-enforce-exact-length-of-GROUP-GROUP6-attributes/20260705-062358
base:   net/main
patch link:    https://lore.kernel.org/r/20260704222254.914567-1-xmei5%40as=
u.edu
patch subject: [PATCH net] vxlan: vnifilter: enforce exact length of GROUP/=
GROUP6 attributes
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: mips-randconfig-r123-20260705 (https://download.01.org/0day-ci/arch=
ive/20260708/202607080424.KSXDsyz9-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2=
fb2a2269da0e2a3e230beb6cad39ca314db33)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260708/202607080424.KSXDsyz9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607080424.KSXDsyz9-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
All errors (new ones prefixed by >>):

   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace and dumped files.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,mm/.page_alloc.o.d -nostdinc -Iarch=
/mips/include -I./arch/mips/include/generated -Iinclude -I./include -Iarch/=
mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi -I./i=
nclude/generated/uapi -include include/linux/compiler-version.h -include in=
clude/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ =
--target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknown-warning-optio=
n -Werror=3Dignored-optimization-argument -Werror=3Doption-ignored -Werror=
=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xffffffff80040000=
 -DLINKER_LOAD_ADDRESS=3D0x80040000 -DDATAOFFSET=3D0 -fmacro-prefix-map=3D=
=3D -Wundef -DKBUILD_EXTRA_WARN1 -fshort-wchar -funsigned-char -fno-common =
-fno-PIE -fno-strict-aliasing -std=3Dgnu11 -fms-anonymous-structs -Wno-gnu =
-Wno-microsoft-anon-tag -mno-check-zero-division -mabi=3D32 -G 0 -mno-abica=
lls -fno-pic -pipe -msoft-float -Wa,-msoft-float -ffreestanding -EL -fno-st=
ack-check -march=3Dmips3 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/i=
nclude/asm/mach-dec -Iarch/mips/include/asm/mach-generic -fno-asynchronous-=
unwind-tables -fno-delete-null-pointer-checks -O2 -fstack-protector-strong =
-fomit-frame-pointer -ftrivial-auto-var-init=3Dzero -falloc-token-max=3D16 =
-fexperimental-late-parse-attributes -fdiagnostics-show-inlining-chain -fst=
rict-flex-arrays=3D3 -fno-strict-overflow -fno-stack-check -fno-builtin-wcs=
len -Wall -Wextra -Wundef -Werror=3Dimplicit-function-declaration -Werror=
=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-form=
at-security -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member=
 -Wmissing-declarations -Wmissing-prototypes -Wno-format-overflow-non-kprin=
tf -Wno-format-truncation-non-kprintf -Wno-default-const-init-unsafe -Wno-t=
ype-limits -Wno-pointer-sign -Wcast-function-type -Wno-unterminated-string-=
initialization -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Dincompa=
tible-pointer-types -Wenum-conversion -Wunused -Wmissing-format-attribute -=
Wmissing-include-dirs -Wunused-const-variable -Wno-missing-field-initialize=
rs -Wno-shift-negative-value -Wno-enum-enum-conversion -Wno-sign-compare -W=
no-unused-parameter -DRANDSTRUCT -frandomize-layout-seed-file=3D./scripts/b=
asic/randstruct.seed -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wretu=
rn-type -funsigned-char -Wundef -falign-functions=3D64 -Imm -Imm -DKBUILD_M=
ODFILE=3D\"mm/page-alloc\" -DKBUILD_BASENAME=3D\"page_alloc\" -DKBUILD_MODN=
AME=3D\"page_alloc\" -D__KBUILD_MODNAME=3Dpage_alloc -c -o mm/page_alloc.o =
mm/page_alloc.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'mm/page_alloc.c'.
   4.	Running pass 'Branch Probability Basic Block Placement' on function '=
@post_alloc_hook'
    #0 0x000055c02e08613a llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-23+0x3e6913a)
    #1 0x000055c02e083ce4 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
23+0x3e66ce4)
    #2 0x000055c02dfb8cc0 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007f746a3cddf0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x000055c02d6ace8f llvm::TailDuplicator::shouldTailDuplicate(bool, l=
lvm::MachineBasicBlock&) (.part.0) TailDuplicator.cpp:0:0
    #5 0x000055c02d3f33ce (anonymous namespace)::MachineBlockPlacement::pre=
computeTriangleChains() MachineBlockPlacement.cpp:0:0
    #6 0x000055c02d400ffb (anonymous namespace)::MachineBlockPlacement::run=
(llvm::MachineFunction&) MachineBlockPlacement.cpp:0:0
    #7 0x000055c02d40440c (anonymous namespace)::MachineBlockPlacementLegac=
y::runOnMachineFunction(llvm::MachineFunction&) (.part.0) MachineBlockPlace=
ment.cpp:0:0
    #8 0x000055c02d4466b3 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-23+0x32296b3)
    #9 0x000055c02d994c79 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-23+0x3777c79)
   #10 0x000055c02d9950ac llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-23+0x37780ac)
   #11 0x000055c02d995c4a (anonymous namespace)::MPPassManager::runOnModule=
(llvm::Module&) LegacyPassManager.cpp:0:0
   #12 0x000055c02d99631c llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-23+0x377931c)
   #13 0x000055c02e42e1bf (anonymous namespace)::EmitAssemblyHelper::TimeCo=
degenPasses(llvm::function_ref<void ()>) BackendUtil.cpp:0:0
   #14 0x000055c02e43f5a4 (anonymous namespace)::EmitAssemblyHelper::emitAs=
sembly(clang::BackendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::=
default_delete<llvm::raw_pwrite_stream>>, clang::BackendConsumer*) (.constp=
rop.0) BackendUtil.cpp:0:0
   #15 0x000055c02e43f7f7 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-23+0x42227f7)
   #16 0x000055c02ea74047 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-23+0x4857047)
   #17 0x000055c03046f99c clang::ParseAST(clang::Sema&, bool, bool) (clang-=
23+0x625299c)
   #18 0x000055c02edd781e clang::FrontendAction::Execute() (clang-23+0x4bba=
81e)
   #19 0x000055c02ed60b9e clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-23+0x4b43b9e)
   #20 0x000055c02eec0dc7 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-23+0x4ca3dc7)
   #21 0x000055c02b0f4738 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-23+0xed7738)
   #22 0x000055c02b0ec413 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #23 0x000055c02b0ec453 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #24 0x000055c02eaed5f9 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #25 0x000055c02dfb9023 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-23+0x3d9c023)
   #26 0x000055c02eaeeb4c clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #27 0x000055c02eaaa228 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-23+0x488d228)
   #28 0x000055c02eaab1c2 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-23+0x488e1c2)
   #29 0x000055c02eabea0c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-23+0x48a1a0c)
   #30 0x000055c02b0f10d2 clang_main(int, char**, llvm::ToolContext const&)=
 (clang-23+0xed40d2)
   #31 0x000055c02b005df9 main (clang-23+0xde8df9)
   #32 0x00007f746a3b7ca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #33 0x00007f746a3b7d65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #34 0x000055c02b0ebe71 _start (clang-23+0xecee71)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 2718805 Segmentation fault      clang -Wp,-MMD,mm/.pa=
ge_alloc.o.d -nostdinc -Iarch/mips/include -I./arch/mips/include/generated =
-Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips/include/genera=
ted/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linux/c=
ompiler-version.h -include include/linux/kconfig.h -include include/linux/c=
ompiler_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -fintegrated-as -W=
error=3Dunknown-warning-option -Werror=3Dignored-optimization-argument -Wer=
ror=3Doption-ignored -Werror=3Dunused-command-line-argument -DVMLINUX_LOAD_=
ADDRESS=3D0xffffffff80040000 -DLINKER_LOAD_ADDRESS=3D0x80040000 -DDATAOFFSE=
T=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -fshort-wchar -=
funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -std=3Dgnu11 -fms-=
anonymous-structs -Wno-gnu -Wno-microsoft-anon-tag -mno-check-zero-division=
 -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-float=
 -ffreestanding -EL -fno-stack-check -march=3Dmips3 -Wa,--trap -DTOOLCHAIN_=
SUPPORTS_VIRT -Iarch/mips/include/asm/mach-dec -Iarch/mips/include/asm/mach=
-generic -fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks -O=
2 -fstack-protector-strong -fomit-frame-pointer -ftrivial-auto-var-init=3Dz=
ero -falloc-token-max=3D16 -fexperimental-late-parse-attributes -fdiagnosti=
cs-show-inlining-chain -fstrict-flex-arrays=3D3 -fno-strict-overflow -fno-s=
tack-check -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=3Dimplicit-fun=
ction-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dst=
rict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wno=
-address-of-packed-member -Wmissing-declarations -Wmissing-prototypes -Wno-=
format-overflow-non-kprintf -Wno-format-truncation-non-kprintf -Wno-default=
-const-init-unsafe -Wno-type-limits -Wno-pointer-sign -Wcast-function-type =
-Wno-unterminated-string-initialization -Wimplicit-fallthrough -Werror=3Dda=
te-time -Werror=3Dincompatible-pointer-types -Wenum-conversion -Wunused -Wm=
issing-format-attribute -Wmissing-include-dirs -Wunused-const-variable -Wno=
-missing-field-initializers -Wno-shift-negative-value -Wno-enum-enum-conver=
sion -Wno-sign-compare -Wno-unused-parameter -DRANDSTRUCT -frandomize-layou=
t-seed-file=3D./scripts/basic/randstruct.seed -fno-crash-diagnostics -Wno-e=
rror=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -falign-functions=
=3D64 -Imm -Imm -DKBUILD_MODFILE=3D'"mm/page-alloc"' -DKBUILD_BASENAME=3D'"=
page_alloc"' -DKBUILD_MODNAME=3D'"page_alloc"' -D__KBUILD_MODNAME=3Dpage_al=
loc -c -o mm/page_alloc.o mm/page_alloc.c

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
