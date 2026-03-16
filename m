Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2A733A9D3
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Mar 2026 17:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773682764; cv=none; b=qAaS9Xc50QcioJ/n0l21ART6IRCIxw0dq+70i1iWJke0sl0lxHUzSMCwa+4Hj7Qfby4Piv1gRIRkPO3MubOli1heeOZ+RYAcr5aVGMZt9c8a1CDuIroav4XgSb4lRoptWXaSTVkVzd3M4MocuudJPFojSvtMnyccf1GSqDYcOjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773682764; c=relaxed/simple;
	bh=nsZCTvlMIRlUL8T+fkL2soOwNNPzPqnqzgMn4YPxgas=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sRAMuckyxUjmwRKGf/9kOOabccg/aqmhk6dndQkDdJwopXY8bNK+uZRT+aKrVaWGC2+LnDYCKXmoasHx2lQG2+CB4/3cvaZk5KFXMYEfaf2t/ErLoNtbHGA/QMKlCAAwbdSNVyyP1ygYRjelS/rBVNbCJjar5ZqUHz8xgUWEqgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Plrer0Kd; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Plrer0Kd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773682762; x=1805218762;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nsZCTvlMIRlUL8T+fkL2soOwNNPzPqnqzgMn4YPxgas=;
  b=Plrer0KdEFBtf/q8XMGCQmckLk8eeqjI+EqwjS/npNOYkBeoV0vCby/b
   XuW+ZJjqeDffcSjG6fW11cexAqCcxo+iviSk9IEX1yTDERUEgDNZbqW01
   r5N5d9GFiKwm86fDwexDKtnnl6oVz3sZtVPiclU/dGDthP4OoDHy/1Upe
   NBiO47OI6gcKhJDflCpolntC/no8nszHwl+fLPUV/1KaqN0sLGMa2mGM/
   UlW0ex9EcBQix4chw3Ul/Tgku8Wb4x/KYBjZTa135mWAuCQlRLyMTaZRc
   9W0FLNnSjtq+Tp098I/X00eXnW3SQpZ4ZHa1f2oi9+NI5Ql6Hre1jq5gG
   g==;
X-CSE-ConnectionGUID: 9Tsmf/KPRSevVKZ9qgu8aA==
X-CSE-MsgGUID: i2V4qZG2SmWdVmqZN+arEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="86061070"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="86061070"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 10:39:21 -0700
X-CSE-ConnectionGUID: oTLkl29zRzuZYNinmGHsOg==
X-CSE-MsgGUID: 5XxxmGxZRGW29ep8zuvPew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="221232134"
Received: from lkp-server01.sh.intel.com (HELO 892944969b78) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Mar 2026 10:39:20 -0700
Received: from kbuild by 892944969b78 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2BuP-0000000013q-1fcU;
	Mon, 16 Mar 2026 17:39:17 +0000
Date: Tue, 17 Mar 2026 01:38:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: /bin/bash: line 1: 2574865 Segmentation fault      clang
 -Wp,-MMD,arch/mips/math-emu/.dp_sqrt.o.d -nostdinc -Iarch/mips/include
 -I./arch/mips/include/generated -Iinclude -I./include
 -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/u...
Message-ID: <202603170154.y7QWVOwm-lkp@intel.com>
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
TO: Christian Brauner <brauner@kernel.org>
CC: Jeff Layton <jlayton@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f338e77383789c0cae23ca3d48adcc5e9e137e3c
commit: c9822fad8038870bb690543539c8e9ad5213b12f libfs: allow to specify s_=
d_flags
date:   5 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 5 months ago
config: mips-randconfig-r072-20260301 (https://download.01.org/0day-ci/arch=
ive/20260317/202603170154.y7QWVOwm-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a1=
09fbb6e184ec9bcce10615949f598f4c974a9)
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260317/202603170154.y7QWVOwm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603170154.y7QWVOwm-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
All errors (new ones prefixed by >>):

   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,arch/mips/math-emu/.dp_sqrt.o.d -no=
stdinc -Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I./in=
clude -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclu=
de/uapi -I./include/generated/uapi -include include/linux/compiler-version.=
h -include include/linux/kconfig.h -include include/linux/compiler_types.h =
-D__KERNEL__ --target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknown-=
warning-option -Werror=3Dignored-optimization-argument -Werror=3Doption-ign=
ored -Werror=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xffff=
ffff88002000 -DLINKER_LOAD_ADDRESS=3D0x88002000 -DDATAOFFSET=3D0 -fmacro-pr=
efix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -fun=
signed-char -fno-common -fno-PIE -fno-strict-aliasing -mno-check-zero-divis=
ion -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-fl=
oat -ffreestanding -EB -fno-stack-check -march=3Dmips3 -Wa,--trap -DTOOLCHA=
IN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-ip22 -Iarch/mips/include/asm/=
mach-generic -fno-asynchronous-unwind-tables -fno-delete-null-pointer-check=
s -O2 -fno-stack-protector -pg -fstrict-flex-arrays=3D3 -fno-strict-overflo=
w -fno-stack-check -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=3Dimpl=
icit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Wer=
ror=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-addr=
ess -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-prototyp=
es -Wno-gnu -Wno-format-overflow-non-kprintf -Wno-format-truncation-non-kpr=
intf -Wno-default-const-init-unsafe -Wno-pointer-sign -Wcast-function-type =
-Wno-unterminated-string-initialization -Wimplicit-fallthrough -Werror=3Dda=
te-time -Werror=3Dincompatible-pointer-types -Wenum-conversion -Wunused -Wm=
issing-format-attribute -Wmissing-include-dirs -Wunused-const-variable -Wno=
-missing-field-initializers -Wno-type-limits -Wno-shift-negative-value -Wno=
-enum-enum-conversion -Wno-sign-compare -Wno-unused-parameter -DRANDSTRUCT =
-frandomize-layout-seed-file=3D./scripts/basic/randstruct.seed -fno-crash-d=
iagnostics -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -=
falign-functions=3D64 -Iarch/mips/math-emu -Iarch/mips/math-emu -DKBUILD_MO=
DFILE=3D\"arch/mips/math-emu/dp_sqrt\" -DKBUILD_BASENAME=3D\"dp_sqrt\" -DKB=
UILD_MODNAME=3D\"dp_sqrt\" -D__KBUILD_MODNAME=3Dkmod_dp_sqrt -c -o arch/mip=
s/math-emu/dp_sqrt.o arch/mips/math-emu/dp_sqrt.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'arch/mips/math-emu/dp=
_sqrt.c'.
   4.	Running pass 'Branch Probability Basic Block Placement' on function '=
@ieee754dp_sqrt'
    #0 0x000055a402ed96bb llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-23+0x41446bb)
    #1 0x000055a402ed7284 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
23+0x4142284)
    #2 0x000055a402e0b420 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007f18416cbdf0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x000055a40247ab6f llvm::TailDuplicator::shouldTailDuplicate(bool, l=
lvm::MachineBasicBlock&) (.part.0) TailDuplicator.cpp:0:0
    #5 0x000055a402187754 (anonymous namespace)::MachineBlockPlacement::bui=
ldCFGChains() MachineBlockPlacement.cpp:0:0
    #6 0x000055a40218c0b0 (anonymous namespace)::MachineBlockPlacement::run=
(llvm::MachineFunction&) MachineBlockPlacement.cpp:0:0
    #7 0x000055a40218d2e1 (anonymous namespace)::MachineBlockPlacementLegac=
y::runOnMachineFunction(llvm::MachineFunction&) (.part.0) MachineBlockPlace=
ment.cpp:0:0
    #8 0x000055a4021dd468 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-23+0x3448468)
    #9 0x000055a4027b8729 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-23+0x3a23729)
   #10 0x000055a4027b88cc llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-23+0x3a238cc)
   #11 0x000055a4027b7b38 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-23+0x3a22b38)
   #12 0x000055a4032d6aa1 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-23+0x4541aa1)
   #13 0x000055a40390ba07 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-23+0x4b76a07)
   #14 0x000055a40526875c clang::ParseAST(clang::Sema&, bool, bool) (clang-=
23+0x64d375c)
   #15 0x000055a403c571ba clang::FrontendAction::Execute() (clang-23+0x4ec2=
1ba)
   #16 0x000055a403bd2416 clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-23+0x4e3d416)
   #17 0x000055a403d3b647 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-23+0x4fa6647)
   #18 0x000055a3ffcd9bd5 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-23+0xf44bd5)
   #19 0x000055a3ffcd18e3 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #20 0x000055a3ffcd1923 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #21 0x000055a40398a989 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #22 0x000055a402e0b783 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-23+0x4076783)
   #23 0x000055a40398b0b4 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #24 0x000055a40394a468 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-23+0x4bb5468)
   #25 0x000055a40394b3c2 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-23+0x4bb63c2)
   #26 0x000055a40395c10c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-23+0x4bc710c)
   #27 0x000055a3ffcd658f clang_main(int, char**, llvm::ToolContext const&)=
 (clang-23+0xf4158f)
   #28 0x000055a3ffb6ea09 main (clang-23+0xdd9a09)
   #29 0x00007f18416b5ca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #30 0x00007f18416b5d65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #31 0x000055a3ffcd1321 _start (clang-23+0xf3c321)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 2574865 Segmentation fault      clang -Wp,-MMD,arch/m=
ips/math-emu/.dp_sqrt.o.d -nostdinc -Iarch/mips/include -I./arch/mips/inclu=
de/generated -Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips/i=
nclude/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include in=
clude/linux/compiler-version.h -include include/linux/kconfig.h -include in=
clude/linux/compiler_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -fint=
egrated-as -Werror=3Dunknown-warning-option -Werror=3Dignored-optimization-=
argument -Werror=3Doption-ignored -Werror=3Dunused-command-line-argument -D=
VMLINUX_LOAD_ADDRESS=3D0xffffffff88002000 -DLINKER_LOAD_ADDRESS=3D0x8800200=
0 -DDATAOFFSET=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -s=
td=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-a=
liasing -mno-check-zero-division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pi=
pe -msoft-float -Wa,-msoft-float -ffreestanding -EB -fno-stack-check -march=
=3Dmips3 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-=
ip22 -Iarch/mips/include/asm/mach-generic -fno-asynchronous-unwind-tables -=
fno-delete-null-pointer-checks -O2 -fno-stack-protector -pg -fstrict-flex-a=
rrays=3D3 -fno-strict-overflow -fno-stack-check -fno-builtin-wcslen -Wall -=
Wextra -Wundef -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-i=
nt -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-security -=
Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-de=
clarations -Wmissing-prototypes -Wno-gnu -Wno-format-overflow-non-kprintf -=
Wno-format-truncation-non-kprintf -Wno-default-const-init-unsafe -Wno-point=
er-sign -Wcast-function-type -Wno-unterminated-string-initialization -Wimpl=
icit-fallthrough -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -=
Wenum-conversion -Wunused -Wmissing-format-attribute -Wmissing-include-dirs=
 -Wunused-const-variable -Wno-missing-field-initializers -Wno-type-limits -=
Wno-shift-negative-value -Wno-enum-enum-conversion -Wno-sign-compare -Wno-u=
nused-parameter -DRANDSTRUCT -frandomize-layout-seed-file=3D./scripts/basic=
/randstruct.seed -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wreturn-t=
ype -funsigned-char -Wundef -falign-functions=3D64 -Iarch/mips/math-emu -Ia=
rch/mips/math-emu -DKBUILD_MODFILE=3D'"arch/mips/math-emu/dp_sqrt"' -DKBUIL=
D_BASENAME=3D'"dp_sqrt"' -DKBUILD_MODNAME=3D'"dp_sqrt"' -D__KBUILD_MODNAME=
=3Dkmod_dp_sqrt -c -o arch/mips/math-emu/dp_sqrt.o arch/mips/math-emu/dp_sq=
rt.c
--
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,arch/mips/math-emu/.dp_cmp.o.d -nos=
tdinc -Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I./inc=
lude -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclud=
e/uapi -I./include/generated/uapi -include include/linux/compiler-version.h=
 -include include/linux/kconfig.h -include include/linux/compiler_types.h -=
D__KERNEL__ --target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknown-w=
arning-option -Werror=3Dignored-optimization-argument -Werror=3Doption-igno=
red -Werror=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xfffff=
fff88002000 -DLINKER_LOAD_ADDRESS=3D0x88002000 -DDATAOFFSET=3D0 -fmacro-pre=
fix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -funs=
igned-char -fno-common -fno-PIE -fno-strict-aliasing -mno-check-zero-divisi=
on -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-flo=
at -ffreestanding -EB -fno-stack-check -march=3Dmips3 -Wa,--trap -DTOOLCHAI=
N_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-ip22 -Iarch/mips/include/asm/m=
ach-generic -fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks=
 -O2 -fno-stack-protector -pg -fstrict-flex-arrays=3D3 -fno-strict-overflow=
 -fno-stack-check -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=3Dimpli=
cit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werr=
or=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-addre=
ss -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-prototype=
s -Wno-gnu -Wno-format-overflow-non-kprintf -Wno-format-truncation-non-kpri=
ntf -Wno-default-const-init-unsafe -Wno-pointer-sign -Wcast-function-type -=
Wno-unterminated-string-initialization -Wimplicit-fallthrough -Werror=3Ddat=
e-time -Werror=3Dincompatible-pointer-types -Wenum-conversion -Wunused -Wmi=
ssing-format-attribute -Wmissing-include-dirs -Wunused-const-variable -Wno-=
missing-field-initializers -Wno-type-limits -Wno-shift-negative-value -Wno-=
enum-enum-conversion -Wno-sign-compare -Wno-unused-parameter -DRANDSTRUCT -=
frandomize-layout-seed-file=3D./scripts/basic/randstruct.seed -fno-crash-di=
agnostics -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -f=
align-functions=3D64 -Iarch/mips/math-emu -Iarch/mips/math-emu -DKBUILD_MOD=
FILE=3D\"arch/mips/math-emu/dp_cmp\" -DKBUILD_BASENAME=3D\"dp_cmp\" -DKBUIL=
D_MODNAME=3D\"dp_cmp\" -D__KBUILD_MODNAME=3Dkmod_dp_cmp -c -o arch/mips/mat=
h-emu/dp_cmp.o arch/mips/math-emu/dp_cmp.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'arch/mips/math-emu/dp=
_cmp.c'.
   4.	Running pass 'Branch Probability Basic Block Placement' on function '=
@ieee754dp_cmp'
    #0 0x000055c22e71f6bb llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-23+0x41446bb)
    #1 0x000055c22e71d284 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
23+0x4142284)
    #2 0x000055c22e651420 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007f714c911df0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x000055c22dcc0b6f llvm::TailDuplicator::shouldTailDuplicate(bool, l=
lvm::MachineBasicBlock&) (.part.0) TailDuplicator.cpp:0:0
    #5 0x000055c22d9cd754 (anonymous namespace)::MachineBlockPlacement::bui=
ldCFGChains() MachineBlockPlacement.cpp:0:0
    #6 0x000055c22d9d20b0 (anonymous namespace)::MachineBlockPlacement::run=
(llvm::MachineFunction&) MachineBlockPlacement.cpp:0:0
    #7 0x000055c22d9d32e1 (anonymous namespace)::MachineBlockPlacementLegac=
y::runOnMachineFunction(llvm::MachineFunction&) (.part.0) MachineBlockPlace=
ment.cpp:0:0
    #8 0x000055c22da23468 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-23+0x3448468)
    #9 0x000055c22dffe729 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-23+0x3a23729)
   #10 0x000055c22dffe8cc llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-23+0x3a238cc)
   #11 0x000055c22dffdb38 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-23+0x3a22b38)
   #12 0x000055c22eb1caa1 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-23+0x4541aa1)
   #13 0x000055c22f151a07 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-23+0x4b76a07)
   #14 0x000055c230aae75c clang::ParseAST(clang::Sema&, bool, bool) (clang-=
23+0x64d375c)
   #15 0x000055c22f49d1ba clang::FrontendAction::Execute() (clang-23+0x4ec2=
1ba)
   #16 0x000055c22f418416 clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-23+0x4e3d416)
   #17 0x000055c22f581647 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-23+0x4fa6647)
   #18 0x000055c22b51fbd5 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-23+0xf44bd5)
   #19 0x000055c22b5178e3 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #20 0x000055c22b517923 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #21 0x000055c22f1d0989 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #22 0x000055c22e651783 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-23+0x4076783)
   #23 0x000055c22f1d10b4 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #24 0x000055c22f190468 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-23+0x4bb5468)
   #25 0x000055c22f1913c2 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-23+0x4bb63c2)
   #26 0x000055c22f1a210c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-23+0x4bc710c)
   #27 0x000055c22b51c58f clang_main(int, char**, llvm::ToolContext const&)=
 (clang-23+0xf4158f)
   #28 0x000055c22b3b4a09 main (clang-23+0xdd9a09)
   #29 0x00007f714c8fbca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #30 0x00007f714c8fbd65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #31 0x000055c22b517321 _start (clang-23+0xf3c321)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 2577546 Segmentation fault      clang -Wp,-MMD,arch/m=
ips/math-emu/.dp_cmp.o.d -nostdinc -Iarch/mips/include -I./arch/mips/includ=
e/generated -Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips/in=
clude/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include inc=
lude/linux/compiler-version.h -include include/linux/kconfig.h -include inc=
lude/linux/compiler_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -finte=
grated-as -Werror=3Dunknown-warning-option -Werror=3Dignored-optimization-a=
rgument -Werror=3Doption-ignored -Werror=3Dunused-command-line-argument -DV=
MLINUX_LOAD_ADDRESS=3D0xffffffff88002000 -DLINKER_LOAD_ADDRESS=3D0x88002000=
 -DDATAOFFSET=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -st=
d=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-al=
iasing -mno-check-zero-division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pip=
e -msoft-float -Wa,-msoft-float -ffreestanding -EB -fno-stack-check -march=
=3Dmips3 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-=
ip22 -Iarch/mips/include/asm/mach-generic -fno-asynchronous-unwind-tables -=
fno-delete-null-pointer-checks -O2 -fno-stack-protector -pg -fstrict-flex-a=
rrays=3D3 -fno-strict-overflow -fno-stack-check -fno-builtin-wcslen -Wall -=
Wextra -Wundef -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-i=
nt -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-security -=
Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-de=
clarations -Wmissing-prototypes -Wno-gnu -Wno-format-overflow-non-kprintf -=
Wno-format-truncation-non-kprintf -Wno-default-const-init-unsafe -Wno-point=
er-sign -Wcast-function-type -Wno-unterminated-string-initialization -Wimpl=
icit-fallthrough -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -=
Wenum-conversion -Wunused -Wmissing-format-attribute -Wmissing-include-dirs=
 -Wunused-const-variable -Wno-missing-field-initializers -Wno-type-limits -=
Wno-shift-negative-value -Wno-enum-enum-conversion -Wno-sign-compare -Wno-u=
nused-parameter -DRANDSTRUCT -frandomize-layout-seed-file=3D./scripts/basic=
/randstruct.seed -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wreturn-t=
ype -funsigned-char -Wundef -falign-functions=3D64 -Iarch/mips/math-emu -Ia=
rch/mips/math-emu -DKBUILD_MODFILE=3D'"arch/mips/math-emu/dp_cmp"' -DKBUILD=
_BASENAME=3D'"dp_cmp"' -DKBUILD_MODNAME=3D'"dp_cmp"' -D__KBUILD_MODNAME=3Dk=
mod_dp_cmp -c -o arch/mips/math-emu/dp_cmp.o arch/mips/math-emu/dp_cmp.c
--
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,arch/mips/math-emu/.sp_cmp.o.d -nos=
tdinc -Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I./inc=
lude -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclud=
e/uapi -I./include/generated/uapi -include include/linux/compiler-version.h=
 -include include/linux/kconfig.h -include include/linux/compiler_types.h -=
D__KERNEL__ --target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknown-w=
arning-option -Werror=3Dignored-optimization-argument -Werror=3Doption-igno=
red -Werror=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xfffff=
fff88002000 -DLINKER_LOAD_ADDRESS=3D0x88002000 -DDATAOFFSET=3D0 -fmacro-pre=
fix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -funs=
igned-char -fno-common -fno-PIE -fno-strict-aliasing -mno-check-zero-divisi=
on -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-flo=
at -ffreestanding -EB -fno-stack-check -march=3Dmips3 -Wa,--trap -DTOOLCHAI=
N_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-ip22 -Iarch/mips/include/asm/m=
ach-generic -fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks=
 -O2 -fno-stack-protector -pg -fstrict-flex-arrays=3D3 -fno-strict-overflow=
 -fno-stack-check -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=3Dimpli=
cit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werr=
or=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-addre=
ss -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-prototype=
s -Wno-gnu -Wno-format-overflow-non-kprintf -Wno-format-truncation-non-kpri=
ntf -Wno-default-const-init-unsafe -Wno-pointer-sign -Wcast-function-type -=
Wno-unterminated-string-initialization -Wimplicit-fallthrough -Werror=3Ddat=
e-time -Werror=3Dincompatible-pointer-types -Wenum-conversion -Wunused -Wmi=
ssing-format-attribute -Wmissing-include-dirs -Wunused-const-variable -Wno-=
missing-field-initializers -Wno-type-limits -Wno-shift-negative-value -Wno-=
enum-enum-conversion -Wno-sign-compare -Wno-unused-parameter -DRANDSTRUCT -=
frandomize-layout-seed-file=3D./scripts/basic/randstruct.seed -fno-crash-di=
agnostics -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -f=
align-functions=3D64 -Iarch/mips/math-emu -Iarch/mips/math-emu -DKBUILD_MOD=
FILE=3D\"arch/mips/math-emu/sp_cmp\" -DKBUILD_BASENAME=3D\"sp_cmp\" -DKBUIL=
D_MODNAME=3D\"sp_cmp\" -D__KBUILD_MODNAME=3Dkmod_sp_cmp -c -o arch/mips/mat=
h-emu/sp_cmp.o arch/mips/math-emu/sp_cmp.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'arch/mips/math-emu/sp=
_cmp.c'.
   4.	Running pass 'Branch Probability Basic Block Placement' on function '=
@ieee754sp_cmp'
    #0 0x000055b861bc66bb llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-23+0x41446bb)
    #1 0x000055b861bc4284 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
23+0x4142284)
    #2 0x000055b861af8420 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007f7c4ef95df0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x000055b861167b6f llvm::TailDuplicator::shouldTailDuplicate(bool, l=
lvm::MachineBasicBlock&) (.part.0) TailDuplicator.cpp:0:0
    #5 0x000055b860e73f49 (anonymous namespace)::MachineBlockPlacement::bui=
ldCFGChains() MachineBlockPlacement.cpp:0:0
    #6 0x000055b860e790b0 (anonymous namespace)::MachineBlockPlacement::run=
(llvm::MachineFunction&) MachineBlockPlacement.cpp:0:0
    #7 0x000055b860e7a2e1 (anonymous namespace)::MachineBlockPlacementLegac=
y::runOnMachineFunction(llvm::MachineFunction&) (.part.0) MachineBlockPlace=
ment.cpp:0:0
    #8 0x000055b860eca468 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-23+0x3448468)
    #9 0x000055b8614a5729 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-23+0x3a23729)
   #10 0x000055b8614a58cc llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-23+0x3a238cc)
   #11 0x000055b8614a4b38 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-23+0x3a22b38)
   #12 0x000055b861fc3aa1 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-23+0x4541aa1)
   #13 0x000055b8625f8a07 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-23+0x4b76a07)
   #14 0x000055b863f5575c clang::ParseAST(clang::Sema&, bool, bool) (clang-=
23+0x64d375c)
   #15 0x000055b8629441ba clang::FrontendAction::Execute() (clang-23+0x4ec2=
1ba)
   #16 0x000055b8628bf416 clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-23+0x4e3d416)
   #17 0x000055b862a28647 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-23+0x4fa6647)
   #18 0x000055b85e9c6bd5 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-23+0xf44bd5)
   #19 0x000055b85e9be8e3 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #20 0x000055b85e9be923 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #21 0x000055b862677989 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #22 0x000055b861af8783 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-23+0x4076783)
   #23 0x000055b8626780b4 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #24 0x000055b862637468 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-23+0x4bb5468)
   #25 0x000055b8626383c2 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-23+0x4bb63c2)
   #26 0x000055b86264910c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-23+0x4bc710c)
   #27 0x000055b85e9c358f clang_main(int, char**, llvm::ToolContext const&)=
 (clang-23+0xf4158f)
   #28 0x000055b85e85ba09 main (clang-23+0xdd9a09)
   #29 0x00007f7c4ef7fca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #30 0x00007f7c4ef7fd65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #31 0x000055b85e9be321 _start (clang-23+0xf3c321)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 2579683 Segmentation fault      clang -Wp,-MMD,arch/m=
ips/math-emu/.sp_cmp.o.d -nostdinc -Iarch/mips/include -I./arch/mips/includ=
e/generated -Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips/in=
clude/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include inc=
lude/linux/compiler-version.h -include include/linux/kconfig.h -include inc=
lude/linux/compiler_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -finte=
grated-as -Werror=3Dunknown-warning-option -Werror=3Dignored-optimization-a=
rgument -Werror=3Doption-ignored -Werror=3Dunused-command-line-argument -DV=
MLINUX_LOAD_ADDRESS=3D0xffffffff88002000 -DLINKER_LOAD_ADDRESS=3D0x88002000=
 -DDATAOFFSET=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -st=
d=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-al=
iasing -mno-check-zero-division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pip=
e -msoft-float -Wa,-msoft-float -ffreestanding -EB -fno-stack-check -march=
=3Dmips3 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-=
ip22 -Iarch/mips/include/asm/mach-generic -fno-asynchronous-unwind-tables -=
fno-delete-null-pointer-checks -O2 -fno-stack-protector -pg -fstrict-flex-a=
rrays=3D3 -fno-strict-overflow -fno-stack-check -fno-builtin-wcslen -Wall -=
Wextra -Wundef -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-i=
nt -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-security -=
Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-de=
clarations -Wmissing-prototypes -Wno-gnu -Wno-format-overflow-non-kprintf -=
Wno-format-truncation-non-kprintf -Wno-default-const-init-unsafe -Wno-point=
er-sign -Wcast-function-type -Wno-unterminated-string-initialization -Wimpl=
icit-fallthrough -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -=
Wenum-conversion -Wunused -Wmissing-format-attribute -Wmissing-include-dirs=
 -Wunused-const-variable -Wno-missing-field-initializers -Wno-type-limits -=
Wno-shift-negative-value -Wno-enum-enum-conversion -Wno-sign-compare -Wno-u=
nused-parameter -DRANDSTRUCT -frandomize-layout-seed-file=3D./scripts/basic=
/randstruct.seed -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wreturn-t=
ype -funsigned-char -Wundef -falign-functions=3D64 -Iarch/mips/math-emu -Ia=
rch/mips/math-emu -DKBUILD_MODFILE=3D'"arch/mips/math-emu/sp_cmp"' -DKBUILD=
_BASENAME=3D'"sp_cmp"' -DKBUILD_MODNAME=3D'"sp_cmp"' -D__KBUILD_MODNAME=3Dk=
mod_sp_cmp -c -o arch/mips/math-emu/sp_cmp.o arch/mips/math-emu/sp_cmp.c
--
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,drivers/target/.target_core_ua.o.d =
-nostdinc -Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I.=
/include -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iin=
clude/uapi -I./include/generated/uapi -include include/linux/compiler-versi=
on.h -include include/linux/kconfig.h -include include/linux/compiler_types=
.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunkno=
wn-warning-option -Werror=3Dignored-optimization-argument -Werror=3Doption-=
ignored -Werror=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xf=
fffffff88002000 -DLINKER_LOAD_ADDRESS=3D0x88002000 -DDATAOFFSET=3D0 -fmacro=
-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -=
funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -mno-check-zero-di=
vision -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft=
-float -ffreestanding -EB -fno-stack-check -march=3Dmips3 -Wa,--trap -DTOOL=
CHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-ip22 -Iarch/mips/include/a=
sm/mach-generic -fno-asynchronous-unwind-tables -fno-delete-null-pointer-ch=
ecks -O2 -fno-stack-protector -pg -fstrict-flex-arrays=3D3 -fno-strict-over=
flow -fno-stack-check -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=3Di=
mplicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -=
Werror=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-a=
ddress -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-proto=
types -Wno-gnu -Wno-format-overflow-non-kprintf -Wno-format-truncation-non-=
kprintf -Wno-default-const-init-unsafe -Wno-pointer-sign -Wcast-function-ty=
pe -Wno-unterminated-string-initialization -Wimplicit-fallthrough -Werror=
=3Ddate-time -Werror=3Dincompatible-pointer-types -Wenum-conversion -Wunuse=
d -Wmissing-format-attribute -Wmissing-include-dirs -Wunused-const-variable=
 -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-negative-value=
 -Wno-enum-enum-conversion -Wno-sign-compare -Wno-unused-parameter -DRANDST=
RUCT -frandomize-layout-seed-file=3D./scripts/basic/randstruct.seed -fno-cr=
ash-diagnostics -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wun=
def -falign-functions=3D64 -Idrivers/target -Idrivers/target -DKBUILD_MODFI=
LE=3D\"drivers/target/target_core_mod\" -DKBUILD_BASENAME=3D\"target_core_u=
a\" -DKBUILD_MODNAME=3D\"target_core_mod\" -D__KBUILD_MODNAME=3Dkmod_target=
_core_mod -c -o drivers/target/target_core_ua.o drivers/target/target_core_=
ua.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'drivers/target/target=
_core_ua.c'.
   4.	Running pass 'Branch Probability Basic Block Placement' on function '=
@target_scsi3_ua_check'
    #0 0x000055876cb3f6bb llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-23+0x41446bb)
    #1 0x000055876cb3d284 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
23+0x4142284)
    #2 0x000055876ca71420 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007f57b2cfadf0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x000055876c0e0b6f llvm::TailDuplicator::shouldTailDuplicate(bool, l=
lvm::MachineBasicBlock&) (.part.0) TailDuplicator.cpp:0:0
    #5 0x000055876bded754 (anonymous namespace)::MachineBlockPlacement::bui=
ldCFGChains() MachineBlockPlacement.cpp:0:0
    #6 0x000055876bdf20b0 (anonymous namespace)::MachineBlockPlacement::run=
(llvm::MachineFunction&) MachineBlockPlacement.cpp:0:0
    #7 0x000055876bdf32e1 (anonymous namespace)::MachineBlockPlacementLegac=
y::runOnMachineFunction(llvm::MachineFunction&) (.part.0) MachineBlockPlace=
ment.cpp:0:0
    #8 0x000055876be43468 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-23+0x3448468)
    #9 0x000055876c41e729 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-23+0x3a23729)
   #10 0x000055876c41e8cc llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-23+0x3a238cc)
   #11 0x000055876c41db38 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-23+0x3a22b38)
   #12 0x000055876cf3caa1 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-23+0x4541aa1)
   #13 0x000055876d571a07 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-23+0x4b76a07)
   #14 0x000055876eece75c clang::ParseAST(clang::Sema&, bool, bool) (clang-=
23+0x64d375c)
   #15 0x000055876d8bd1ba clang::FrontendAction::Execute() (clang-23+0x4ec2=
1ba)
   #16 0x000055876d838416 clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-23+0x4e3d416)
   #17 0x000055876d9a1647 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-23+0x4fa6647)
   #18 0x000055876993fbd5 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-23+0xf44bd5)
   #19 0x00005587699378e3 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #20 0x0000558769937923 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #21 0x000055876d5f0989 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #22 0x000055876ca71783 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-23+0x4076783)
   #23 0x000055876d5f10b4 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #24 0x000055876d5b0468 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-23+0x4bb5468)
   #25 0x000055876d5b13c2 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-23+0x4bb63c2)
   #26 0x000055876d5c210c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-23+0x4bc710c)
   #27 0x000055876993c58f clang_main(int, char**, llvm::ToolContext const&)=
 (clang-23+0xf4158f)
   #28 0x00005587697d4a09 main (clang-23+0xdd9a09)
   #29 0x00007f57b2ce4ca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #30 0x00007f57b2ce4d65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #31 0x0000558769937321 _start (clang-23+0xf3c321)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 2604332 Segmentation fault      clang -Wp,-MMD,driver=
s/target/.target_core_ua.o.d -nostdinc -Iarch/mips/include -I./arch/mips/in=
clude/generated -Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mip=
s/include/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include=
 include/linux/compiler-version.h -include include/linux/kconfig.h -include=
 include/linux/compiler_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -f=
integrated-as -Werror=3Dunknown-warning-option -Werror=3Dignored-optimizati=
on-argument -Werror=3Doption-ignored -Werror=3Dunused-command-line-argument=
 -DVMLINUX_LOAD_ADDRESS=3D0xffffffff88002000 -DLINKER_LOAD_ADDRESS=3D0x8800=
2000 -DDATAOFFSET=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1=
 -std=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-stric=
t-aliasing -mno-check-zero-division -mabi=3D32 -G 0 -mno-abicalls -fno-pic =
-pipe -msoft-float -Wa,-msoft-float -ffreestanding -EB -fno-stack-check -ma=
rch=3Dmips3 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/ma=
ch-ip22 -Iarch/mips/include/asm/mach-generic -fno-asynchronous-unwind-table=
s -fno-delete-null-pointer-checks -O2 -fno-stack-protector -pg -fstrict-fle=
x-arrays=3D3 -fno-strict-overflow -fno-stack-check -fno-builtin-wcslen -Wal=
l -Wextra -Wundef -Werror=3Dimplicit-function-declaration -Werror=3Dimplici=
t-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-securit=
y -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing=
-declarations -Wmissing-prototypes -Wno-gnu -Wno-format-overflow-non-kprint=
f -Wno-format-truncation-non-kprintf -Wno-default-const-init-unsafe -Wno-po=
inter-sign -Wcast-function-type -Wno-unterminated-string-initialization -Wi=
mplicit-fallthrough -Werror=3Ddate-time -Werror=3Dincompatible-pointer-type=
s -Wenum-conversion -Wunused -Wmissing-format-attribute -Wmissing-include-d=
irs -Wunused-const-variable -Wno-missing-field-initializers -Wno-type-limit=
s -Wno-shift-negative-value -Wno-enum-enum-conversion -Wno-sign-compare -Wn=
o-unused-parameter -DRANDSTRUCT -frandomize-layout-seed-file=3D./scripts/ba=
sic/randstruct.seed -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wretur=
n-type -funsigned-char -Wundef -falign-functions=3D64 -Idrivers/target -Idr=
ivers/target -DKBUILD_MODFILE=3D'"drivers/target/target_core_mod"' -DKBUILD=
_BASENAME=3D'"target_core_ua"' -DKBUILD_MODNAME=3D'"target_core_mod"' -D__K=
BUILD_MODNAME=3Dkmod_target_core_mod -c -o drivers/target/target_core_ua.o =
drivers/target/target_core_ua.c

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
