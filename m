Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D9018A92F
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Apr 2026 00:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775002563; cv=none; b=d2Q+9UvdAdXn9RTSKGCoWbQtu71MGL7B9eypy/lU47qxgn9hslbBUUVqYgvFoF/iBMTUTfF1M8ikRQeWNS4637luQ3SR3DAo7HcRfV/VdwTusuXMGlFP6nBqoaVW3uuq8HbsFkg18MWme/aec2HhmPs3iiIFRuXNdZQGi6dKQcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775002563; c=relaxed/simple;
	bh=+1RNl49FIpQ1oarwPum9kIU5VMxitagz8sww1AWU5yI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=B5ySyfGLupwEowTf3RxC/p06IumoOz+iVl+2t7ndyn2er4PytXxF5V9xRcC7KHv16nXe47HQGCMAIMX476XHNk3glPbHtUnNgyU8bD3ikhoIO7C063ijb+4AFkFqrqzAdGkKLW3+bFBnnZ6wsyKR/I91yf8WgV+dEUOE3XN2F2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K//EHygd; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K//EHygd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775002561; x=1806538561;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+1RNl49FIpQ1oarwPum9kIU5VMxitagz8sww1AWU5yI=;
  b=K//EHygdsZEutkqpWXnXwu79iJz63yGBfj6DxduqIwkl9nvjZ3FwtJM8
   wePhk23OLv1hyIGYQCdqTo0xuv8I70TIW62edhs/H3bl22jtpzSdEyWOt
   anRQAKf+Ggt6MHbwTeLCTUozyHR/9kk7sWwfxkhueWGD4l5q1BWJkuGdJ
   lWWgOEAoUEz9EQb/nLidlrvoATa975G3ddl+oKSwYbXTBM9YiDZb2JSc7
   f8gIbWt+gWlxZb+VYcPzkjHWvWnILPsbPSUJVRps2Rgzd8iBvBCbyziwP
   QfnxoCm7F4Axw5bV7+DmryXd7SOe/oGgxdARQScDaUWtdHD9BC5ED2RH1
   Q==;
X-CSE-ConnectionGUID: H10vy9sKTkizmDjn9njcZg==
X-CSE-MsgGUID: wf0dbfWcQdqCn1oVSEjZWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75069429"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="75069429"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 17:15:59 -0700
X-CSE-ConnectionGUID: jL+RIUyLTBe1dHDfWtBkjw==
X-CSE-MsgGUID: ojcHeMbTSzC+6btn0f6uZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="226388645"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 31 Mar 2026 17:15:56 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7jFQ-000000004Sr-22ji;
	Wed, 01 Apr 2026 00:15:52 +0000
Date: Wed, 01 Apr 2026 08:15:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rcu:fixes.v7.0-rc4 1/4] /bin/bash: line 1: 2002681
 Segmentation fault      clang -Wp,-MMD,net/tls/.tls_main.o.d -nostdinc
 -Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I./include
 -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi
 -I./in...
Message-ID: <202604010846.etR5KmG9-lkp@intel.com>
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
TO: "Paul E. McKenney" <paulmck@kernel.org>
CC: Boqun Feng <boqun@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rcu/linux.git fixes=
.v7.0-rc4
head:   647a432b1dc4fb190d96f81c4843470a3cf80f2e
commit: f627bbab8fd04f71fb7c724adba68c06bb762dce [1/4] srcu: Use raw spinlo=
cks so call_srcu() can be used under preempt_disable()
:::::: branch date: 7 days ago
:::::: commit date: 12 days ago
config: mips-randconfig-r053-20260325 (https://download.01.org/0day-ci/arch=
ive/20260401/202604010846.etR5KmG9-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054=
e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260401/202604010846.etR5KmG9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604010846.etR5KmG9-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
All errors (new ones prefixed by >>):

   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,net/tls/.tls_main.o.d -nostdinc -Ia=
rch/mips/include -I./arch/mips/include/generated -Iinclude -I./include -Iar=
ch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi -I=
./include/generated/uapi -include include/linux/compiler-version.h -include=
 include/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL=
__ --target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknown-warning-op=
tion -Werror=3Dignored-optimization-argument -Werror=3Doption-ignored -Werr=
or=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xffffffff801000=
00 -DLINKER_LOAD_ADDRESS=3D0x80100000 -DDATAOFFSET=3D0 -fmacro-prefix-map=
=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -funsigned-c=
har -fno-common -fno-PIE -fno-strict-aliasing -mno-check-zero-division -mab=
i=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-float -ffr=
eestanding -EL -fno-stack-check -march=3Dmips3 -Wa,--trap -DTOOLCHAIN_SUPPO=
RTS_VIRT -Iarch/mips/include/asm/mach-tx49xx -Iarch/mips/include/asm/mach-g=
eneric -fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks -O2 =
-fstack-protector-strong -ftrivial-auto-var-init=3Dzero -fexperimental-late=
-parse-attributes -pg -fstrict-flex-arrays=3D3 -fms-extensions -fno-strict-=
overflow -fno-stack-check -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=
=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-ty=
pe -Werror=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -Wno-fra=
me-address -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-p=
rototypes -Wno-gnu -Wno-microsoft-anon-tag -Wno-format-overflow-non-kprintf=
 -Wno-format-truncation-non-kprintf -Wno-default-const-init-unsafe -Wno-typ=
e-limits -Wno-pointer-sign -Wcast-function-type -Wno-unterminated-string-in=
itialization -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Dincompati=
ble-pointer-types -Wenum-conversion -Wunused -Wmissing-format-attribute -Wm=
issing-include-dirs -Wunused-const-variable -Wno-missing-field-initializers=
 -Wno-shift-negative-value -Wno-enum-enum-conversion -Wno-sign-compare -Wno=
-unused-parameter -DRANDSTRUCT -frandomize-layout-seed-file=3D./scripts/bas=
ic/randstruct.seed -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wreturn=
-type -funsigned-char -Wundef -falign-functions=3D64 -fsanitize=3Darray-bou=
nds -fsanitize=3Dshift -fsanitize=3Dunreachable -fsanitize=3Dbool -Inet/tls=
 -Inet/tls -DKBUILD_MODFILE=3D\"net/tls/tls\" -DKBUILD_BASENAME=3D\"tls_mai=
n\" -DKBUILD_MODNAME=3D\"tls\" -D__KBUILD_MODNAME=3Dtls -c -o net/tls/tls_m=
ain.o net/tls/tls_main.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'net/tls/tls_main.c'.
   4.	Running pass 'Branch Probability Basic Block Placement' on function '=
@wait_on_pending_writer'
    #0 0x000055a558a4c0db llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-23+0x41670db)
    #1 0x000055a558a49ca4 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
23+0x4164ca4)
    #2 0x000055a55897dbe0 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007f25121a1df0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x000055a557fe7c2f llvm::TailDuplicator::shouldTailDuplicate(bool, l=
lvm::MachineBasicBlock&) (.part.0) TailDuplicator.cpp:0:0
    #5 0x000055a557cf99f4 (anonymous namespace)::MachineBlockPlacement::bui=
ldCFGChains() MachineBlockPlacement.cpp:0:0
    #6 0x000055a557cfe2ed (anonymous namespace)::MachineBlockPlacement::run=
(llvm::MachineFunction&) MachineBlockPlacement.cpp:0:0
    #7 0x000055a557cff4f1 (anonymous namespace)::MachineBlockPlacementLegac=
y::runOnMachineFunction(llvm::MachineFunction&) (.part.0) MachineBlockPlace=
ment.cpp:0:0
    #8 0x000055a557d4d1a8 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-23+0x34681a8)
    #9 0x000055a5583243e9 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-23+0x3a3f3e9)
   #10 0x000055a55832458c llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-23+0x3a3f58c)
   #11 0x000055a5583237f8 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-23+0x3a3e7f8)
   #12 0x000055a558e4bee1 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-23+0x4566ee1)
   #13 0x000055a559492807 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-23+0x4bad807)
   #14 0x000055a55ae7bddc clang::ParseAST(clang::Sema&, bool, bool) (clang-=
23+0x6596ddc)
   #15 0x000055a5597ec0fa clang::FrontendAction::Execute() (clang-23+0x4f07=
0fa)
   #16 0x000055a559765ed6 clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-23+0x4e80ed6)
   #17 0x000055a5598d5567 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-23+0x4ff0567)
   #18 0x000055a555832895 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-23+0xf4d895)
   #19 0x000055a55582a5a3 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #20 0x000055a55582a5e3 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #21 0x000055a559504849 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #22 0x000055a55897df43 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-23+0x4098f43)
   #23 0x000055a559504f74 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #24 0x000055a5594c37a8 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-23+0x4bde7a8)
   #25 0x000055a5594c4702 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-23+0x4bdf702)
   #26 0x000055a5594d59fc clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-23+0x4bf09fc)
   #27 0x000055a55582f24f clang_main(int, char**, llvm::ToolContext const&)=
 (clang-23+0xf4a24f)
   #28 0x000055a5556c6bc9 main (clang-23+0xde1bc9)
   #29 0x00007f251218bca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #30 0x00007f251218bd65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #31 0x000055a555829fe1 _start (clang-23+0xf44fe1)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 2002681 Segmentation fault      clang -Wp,-MMD,net/tl=
s/.tls_main.o.d -nostdinc -Iarch/mips/include -I./arch/mips/include/generat=
ed -Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips/include/gen=
erated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linu=
x/compiler-version.h -include include/linux/kconfig.h -include include/linu=
x/compiler_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -fintegrated-as=
 -Werror=3Dunknown-warning-option -Werror=3Dignored-optimization-argument -=
Werror=3Doption-ignored -Werror=3Dunused-command-line-argument -DVMLINUX_LO=
AD_ADDRESS=3D0xffffffff80100000 -DLINKER_LOAD_ADDRESS=3D0x80100000 -DDATAOF=
FSET=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11=
 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -m=
no-check-zero-division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-=
float -Wa,-msoft-float -ffreestanding -EL -fno-stack-check -march=3Dmips3 -=
Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-tx49xx -Ia=
rch/mips/include/asm/mach-generic -fno-asynchronous-unwind-tables -fno-dele=
te-null-pointer-checks -O2 -fstack-protector-strong -ftrivial-auto-var-init=
=3Dzero -fexperimental-late-parse-attributes -pg -fstrict-flex-arrays=3D3 -=
fms-extensions -fno-strict-overflow -fno-stack-check -fno-builtin-wcslen -W=
all -Wextra -Wundef -Werror=3Dimplicit-function-declaration -Werror=3Dimpli=
cit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-secur=
ity -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissi=
ng-declarations -Wmissing-prototypes -Wno-gnu -Wno-microsoft-anon-tag -Wno-=
format-overflow-non-kprintf -Wno-format-truncation-non-kprintf -Wno-default=
-const-init-unsafe -Wno-type-limits -Wno-pointer-sign -Wcast-function-type =
-Wno-unterminated-string-initialization -Wimplicit-fallthrough -Werror=3Dda=
te-time -Werror=3Dincompatible-pointer-types -Wenum-conversion -Wunused -Wm=
issing-format-attribute -Wmissing-include-dirs -Wunused-const-variable -Wno=
-missing-field-initializers -Wno-shift-negative-value -Wno-enum-enum-conver=
sion -Wno-sign-compare -Wno-unused-parameter -DRANDSTRUCT -frandomize-layou=
t-seed-file=3D./scripts/basic/randstruct.seed -fno-crash-diagnostics -Wno-e=
rror=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -falign-functions=
=3D64 -fsanitize=3Darray-bounds -fsanitize=3Dshift -fsanitize=3Dunreachable=
 -fsanitize=3Dbool -Inet/tls -Inet/tls -DKBUILD_MODFILE=3D'"net/tls/tls"' -=
DKBUILD_BASENAME=3D'"tls_main"' -DKBUILD_MODNAME=3D'"tls"' -D__KBUILD_MODNA=
ME=3Dtls -c -o net/tls/tls_main.o net/tls/tls_main.c

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
