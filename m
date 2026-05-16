Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E851643B
	for <oe-kbuild@lists.linux.dev>; Sat, 16 May 2026 16:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778948271; cv=none; b=XQ+dj+ggB9RLDEmtr0zwN5S0xHVOOB73V6hK1fXT5lpXsGnDTS4/7H7/2l9eUzip7prDUEbAG3GN5eySO3XhHUl0kuJ8CNpOLE5LRr3bdnpBja35HIQsI5aJmS5pLQT8kr6ck+t4vY/+yet0wMjQS1diDYT8ogjCbrjS5Sv50m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778948271; c=relaxed/simple;
	bh=aB10kFTRgNCJYGBzoYCuwMrST6Ke2v3d0pwV2ceFd0g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Tju1ppQOGKc0TyTf3Pt6jTzER7T3IiIkXdmDObPCheULChv7qROy26A84LOcl9fJggns+30vrjTT8SwLMSsdlBa2ccWvLvLGP9h0KaBGyEaX5xxYLuoFW/E+xOSBFdIvtoCaUICjSVnQQi6RH1uqgBmHP75K8msviXHVSPXcgGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xk4wDibR; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xk4wDibR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778948269; x=1810484269;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=aB10kFTRgNCJYGBzoYCuwMrST6Ke2v3d0pwV2ceFd0g=;
  b=Xk4wDibRGzF3PM+RGJldCFq4zD+lH5GkGweSES+wcyQzv528oR7o9VOX
   uiz4pkDDeZbKIvZOpSBQ4G20TBjrYuWreZJ3pVIYXMJqwUnlB6cPlb8f+
   Z6lg6dayIe8dH3BUtMOHmpUFcQx5wJmX+ktiwq3beAOqAvQViS8YYm+m9
   5A206gIJTAjrmFddMaRNcXNZgcjZoNBCTHhyBMgsnP+M1KOPeb45POAWx
   hWBZKwDAfaYpQtz+6hzcFTut7U7znsAMNksCPJlKRyILwE0HfZ5xl0quv
   FVw6Xlbwh2nAs9U9sTVNdJbHTGws56PXHM2wbWeK1kHwr59SH4e41BhUF
   Q==;
X-CSE-ConnectionGUID: klJeo6YoTiiy0quLiXueMA==
X-CSE-MsgGUID: Wth9+O9LTrKptc9I7kAFGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="97443858"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="97443858"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 09:17:48 -0700
X-CSE-ConnectionGUID: XiZTuAwhQCuweDivij//OQ==
X-CSE-MsgGUID: trHQ6bJlSLejit6rZI9qDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="262522972"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 May 2026 09:17:47 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOHhx-000000000xg-0K4S;
	Sat, 16 May 2026 16:17:45 +0000
Date: Sun, 17 May 2026 00:16:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tnguy-net-queue:dev-queue 36/63] /bin/bash: line 1: 1168059
 Segmentation fault      clang -Wp,-MMD,mm/.gup.o.d -nostdinc
 -Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I./include
 -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi
 -I./include/gene...
Message-ID: <202605170032.fvmFJYya-lkp@intel.com>
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
CC: Intel Wired LAN <intel-wired-lan@lists.osuosl.org>
TO: Kohei Enju <kohei@enjuk.jp>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>
CC: Aleksandr Loktionov <aleksandr.loktionov@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/net-queue.git=
 dev-queue
head:   5d28d17068c42d74d0c8375f77c1ad42319668f3
commit: 0ff8a4f1cae158e6836717813de390f7e2068290 [36/63] igc: set tx buffer=
 type for SMD frames
:::::: branch date: 22 hours ago
:::::: commit date: 24 hours ago
config: mips-randconfig-r123-20260516 (https://download.01.org/0day-ci/arch=
ive/20260517/202605170032.fvmFJYya-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5ba=
c06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260517/202605170032.fvmFJYya-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605170032.fvmFJYya-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
All errors (new ones prefixed by >>):

   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,mm/.gup.o.d -nostdinc -Iarch/mips/i=
nclude -I./arch/mips/include/generated -Iinclude -I./include -Iarch/mips/in=
clude/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi -I./include/=
generated/uapi -include include/linux/compiler-version.h -include include/l=
inux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ --targe=
t=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknown-warning-option -Werr=
or=3Dignored-optimization-argument -Werror=3Doption-ignored -Werror=3Dunuse=
d-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xffffffff84000000 -DLINKE=
R_LOAD_ADDRESS=3D0x84000000 -DDATAOFFSET=3D0 -fmacro-prefix-map=3D=3D -Wund=
ef -DKBUILD_EXTRA_WARN1 -fshort-wchar -funsigned-char -fno-common -fno-PIE =
-fno-strict-aliasing -std=3Dgnu11 -fms-anonymous-structs -Wno-gnu -Wno-micr=
osoft-anon-tag -mno-check-zero-division -mabi=3D32 -G 0 -mno-abicalls -fno-=
pic -pipe -msoft-float -Wa,-msoft-float -ffreestanding -EB -fno-stack-check=
 -march=3Dmips3 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/as=
m/mach-ip22 -Iarch/mips/include/asm/mach-generic -fno-asynchronous-unwind-t=
ables -fno-delete-null-pointer-checks -O2 -fstack-protector -fomit-frame-po=
inter -ftrivial-auto-var-init=3Dzero -fexperimental-late-parse-attributes -=
fdiagnostics-show-inlining-chain -fstrict-flex-arrays=3D3 -fno-strict-overf=
low -fno-stack-check -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=3Dim=
plicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -W=
error=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-ad=
dress -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-protot=
ypes -Wno-format-overflow-non-kprintf -Wno-format-truncation-non-kprintf -W=
no-default-const-init-unsafe -Wno-type-limits -Wno-pointer-sign -Wcast-func=
tion-type -Wno-unterminated-string-initialization -Wimplicit-fallthrough -W=
error=3Ddate-time -Werror=3Dincompatible-pointer-types -Wenum-conversion -W=
unused -Wmissing-format-attribute -Wmissing-include-dirs -Wunused-const-var=
iable -Wno-missing-field-initializers -Wno-shift-negative-value -Wno-enum-e=
num-conversion -Wno-sign-compare -Wno-unused-parameter -gsplit-dwarf -g -fn=
o-var-tracking -DRANDSTRUCT -frandomize-layout-seed-file=3D./scripts/basic/=
randstruct.seed -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wreturn-ty=
pe -funsigned-char -Wundef -falign-functions=3D64 -fsanitize=3Darray-bounds=
 -fsanitize=3Dshift -Imm -Imm -ffunction-sections -fdata-sections -DKBUILD_=
MODFILE=3D\"mm/gup\" -DKBUILD_BASENAME=3D\"gup\" -DKBUILD_MODNAME=3D\"gup\"=
 -D__KBUILD_MODNAME=3Dgup -c -o mm/gup.o mm/gup.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'mm/gup.c'.
   4.	Running pass 'Branch Probability Basic Block Placement' on function '=
@fixup_user_fault'
    #0 0x00005623dacfec1b llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-23+0x413cc1b)
    #1 0x00005623dacfc7e4 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
23+0x413a7e4)
    #2 0x00005623dac2f6a0 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007f5247820df0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x00005623da2b652f llvm::TailDuplicator::shouldTailDuplicate(bool, l=
lvm::MachineBasicBlock&) (.part.0) TailDuplicator.cpp:0:0
    #5 0x00005623d9fd1db4 (anonymous namespace)::MachineBlockPlacement::bui=
ldCFGChains() MachineBlockPlacement.cpp:0:0
    #6 0x00005623d9fd66ad (anonymous namespace)::MachineBlockPlacement::run=
(llvm::MachineFunction&) MachineBlockPlacement.cpp:0:0
    #7 0x00005623d9fd78b1 (anonymous namespace)::MachineBlockPlacementLegac=
y::runOnMachineFunction(llvm::MachineFunction&) (.part.0) MachineBlockPlace=
ment.cpp:0:0
    #8 0x00005623da025438 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-23+0x3463438)
    #9 0x00005623da5ec869 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-23+0x3a2a869)
   #10 0x00005623da5eca0c llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-23+0x3a2aa0c)
   #11 0x00005623da5ebc78 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-23+0x3a29c78)
   #12 0x00005623db0fa071 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-23+0x4538071)
   #13 0x00005623db73f6c7 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-23+0x4b7d6c7)
   #14 0x00005623dd14aadc clang::ParseAST(clang::Sema&, bool, bool) (clang-=
23+0x6588adc)
   #15 0x00005623dba9917a clang::FrontendAction::Execute() (clang-23+0x4ed7=
17a)
   #16 0x00005623dba123d6 clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-23+0x4e503d6)
   #17 0x00005623dbb82207 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-23+0x4fc0207)
   #18 0x00005623d7b1aa55 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-23+0xf58a55)
   #19 0x00005623d7b12763 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #20 0x00005623d7b127a3 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #21 0x00005623db7b0de9 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #22 0x00005623dac2fa03 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-23+0x406da03)
   #23 0x00005623db7b1514 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #24 0x00005623db770668 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-23+0x4bae668)
   #25 0x00005623db7715c2 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-23+0x4baf5c2)
   #26 0x00005623db7827bc clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-23+0x4bc07bc)
   #27 0x00005623d7b1740f clang_main(int, char**, llvm::ToolContext const&)=
 (clang-23+0xf5540f)
   #28 0x00005623d79adbb9 main (clang-23+0xdebbb9)
   #29 0x00007f524780aca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #30 0x00007f524780ad65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #31 0x00005623d7b121a1 _start (clang-23+0xf501a1)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 1168059 Segmentation fault      clang -Wp,-MMD,mm/.gu=
p.o.d -nostdinc -Iarch/mips/include -I./arch/mips/include/generated -Iinclu=
de -I./include -Iarch/mips/include/uapi -I./arch/mips/include/generated/uap=
i -Iinclude/uapi -I./include/generated/uapi -include include/linux/compiler=
-version.h -include include/linux/kconfig.h -include include/linux/compiler=
_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -fintegrated-as -Werror=
=3Dunknown-warning-option -Werror=3Dignored-optimization-argument -Werror=
=3Doption-ignored -Werror=3Dunused-command-line-argument -DVMLINUX_LOAD_ADD=
RESS=3D0xffffffff84000000 -DLINKER_LOAD_ADDRESS=3D0x84000000 -DDATAOFFSET=
=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -fshort-wchar -f=
unsigned-char -fno-common -fno-PIE -fno-strict-aliasing -std=3Dgnu11 -fms-a=
nonymous-structs -Wno-gnu -Wno-microsoft-anon-tag -mno-check-zero-division =
-mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-float =
-ffreestanding -EB -fno-stack-check -march=3Dmips3 -Wa,--trap -DTOOLCHAIN_S=
UPPORTS_VIRT -Iarch/mips/include/asm/mach-ip22 -Iarch/mips/include/asm/mach=
-generic -fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks -O=
2 -fstack-protector -fomit-frame-pointer -ftrivial-auto-var-init=3Dzero -fe=
xperimental-late-parse-attributes -fdiagnostics-show-inlining-chain -fstric=
t-flex-arrays=3D3 -fno-strict-overflow -fno-stack-check -fno-builtin-wcslen=
 -Wall -Wextra -Wundef -Werror=3Dimplicit-function-declaration -Werror=3Dim=
plicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-se=
curity -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmi=
ssing-declarations -Wmissing-prototypes -Wno-format-overflow-non-kprintf -W=
no-format-truncation-non-kprintf -Wno-default-const-init-unsafe -Wno-type-l=
imits -Wno-pointer-sign -Wcast-function-type -Wno-unterminated-string-initi=
alization -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Dincompatible=
-pointer-types -Wenum-conversion -Wunused -Wmissing-format-attribute -Wmiss=
ing-include-dirs -Wunused-const-variable -Wno-missing-field-initializers -W=
no-shift-negative-value -Wno-enum-enum-conversion -Wno-sign-compare -Wno-un=
used-parameter -gsplit-dwarf -g -fno-var-tracking -DRANDSTRUCT -frandomize-=
layout-seed-file=3D./scripts/basic/randstruct.seed -fno-crash-diagnostics -=
Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -falign-funct=
ions=3D64 -fsanitize=3Darray-bounds -fsanitize=3Dshift -Imm -Imm -ffunction=
-sections -fdata-sections -DKBUILD_MODFILE=3D'"mm/gup"' -DKBUILD_BASENAME=
=3D'"gup"' -DKBUILD_MODNAME=3D'"gup"' -D__KBUILD_MODNAME=3Dgup -c -o mm/gup=
.o mm/gup.c
--
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,io_uring/.cancel.o.d -nostdinc -Iar=
ch/mips/include -I./arch/mips/include/generated -Iinclude -I./include -Iarc=
h/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi -I.=
/include/generated/uapi -include include/linux/compiler-version.h -include =
include/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL_=
_ --target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknown-warning-opt=
ion -Werror=3Dignored-optimization-argument -Werror=3Doption-ignored -Werro=
r=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xffffffff8400000=
0 -DLINKER_LOAD_ADDRESS=3D0x84000000 -DDATAOFFSET=3D0 -fmacro-prefix-map=3D=
=3D -Wundef -DKBUILD_EXTRA_WARN1 -fshort-wchar -funsigned-char -fno-common =
-fno-PIE -fno-strict-aliasing -std=3Dgnu11 -fms-anonymous-structs -Wno-gnu =
-Wno-microsoft-anon-tag -mno-check-zero-division -mabi=3D32 -G 0 -mno-abica=
lls -fno-pic -pipe -msoft-float -Wa,-msoft-float -ffreestanding -EB -fno-st=
ack-check -march=3Dmips3 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/i=
nclude/asm/mach-ip22 -Iarch/mips/include/asm/mach-generic -fno-asynchronous=
-unwind-tables -fno-delete-null-pointer-checks -O2 -fstack-protector -fomit=
-frame-pointer -ftrivial-auto-var-init=3Dzero -fexperimental-late-parse-att=
ributes -fdiagnostics-show-inlining-chain -fstrict-flex-arrays=3D3 -fno-str=
ict-overflow -fno-stack-check -fno-builtin-wcslen -Wall -Wextra -Wundef -We=
rror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dretur=
n-type -Werror=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -Wno=
-frame-address -Wno-address-of-packed-member -Wmissing-declarations -Wmissi=
ng-prototypes -Wno-format-overflow-non-kprintf -Wno-format-truncation-non-k=
printf -Wno-default-const-init-unsafe -Wno-type-limits -Wno-pointer-sign -W=
cast-function-type -Wno-unterminated-string-initialization -Wimplicit-fallt=
hrough -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wenum-conv=
ersion -Wunused -Wmissing-format-attribute -Wmissing-include-dirs -Wunused-=
const-variable -Wno-missing-field-initializers -Wno-shift-negative-value -W=
no-enum-enum-conversion -Wno-sign-compare -Wno-unused-parameter -gsplit-dwa=
rf -g -fno-var-tracking -DRANDSTRUCT -frandomize-layout-seed-file=3D./scrip=
ts/basic/randstruct.seed -fno-crash-diagnostics -Wno-error=3Dreturn-type -W=
return-type -funsigned-char -Wundef -falign-functions=3D64 -fsanitize=3Darr=
ay-bounds -fsanitize=3Dshift -Iio_uring -Iio_uring -ffunction-sections -fda=
ta-sections -DKBUILD_MODFILE=3D\"io_uring/cancel\" -DKBUILD_BASENAME=3D\"ca=
ncel\" -DKBUILD_MODNAME=3D\"cancel\" -D__KBUILD_MODNAME=3Dcancel -c -o io_u=
ring/cancel.o io_uring/cancel.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'io_uring/cancel.c'.
   4.	Running pass 'Branch Probability Basic Block Placement' on function '=
@io_try_cancel'
    #0 0x000055d1ee505c1b llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-23+0x413cc1b)
    #1 0x000055d1ee5037e4 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
23+0x413a7e4)
    #2 0x000055d1ee4366a0 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007f5969deddf0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x000055d1edabd52f llvm::TailDuplicator::shouldTailDuplicate(bool, l=
lvm::MachineBasicBlock&) (.part.0) TailDuplicator.cpp:0:0
    #5 0x000055d1ed7d8db4 (anonymous namespace)::MachineBlockPlacement::bui=
ldCFGChains() MachineBlockPlacement.cpp:0:0
    #6 0x000055d1ed7dd6ad (anonymous namespace)::MachineBlockPlacement::run=
(llvm::MachineFunction&) MachineBlockPlacement.cpp:0:0
    #7 0x000055d1ed7de8b1 (anonymous namespace)::MachineBlockPlacementLegac=
y::runOnMachineFunction(llvm::MachineFunction&) (.part.0) MachineBlockPlace=
ment.cpp:0:0
    #8 0x000055d1ed82c438 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-23+0x3463438)
    #9 0x000055d1eddf3869 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-23+0x3a2a869)
   #10 0x000055d1eddf3a0c llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-23+0x3a2aa0c)
   #11 0x000055d1eddf2c78 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-23+0x3a29c78)
   #12 0x000055d1ee901071 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-23+0x4538071)
   #13 0x000055d1eef466c7 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-23+0x4b7d6c7)
   #14 0x000055d1f0951adc clang::ParseAST(clang::Sema&, bool, bool) (clang-=
23+0x6588adc)
   #15 0x000055d1ef2a017a clang::FrontendAction::Execute() (clang-23+0x4ed7=
17a)
   #16 0x000055d1ef2193d6 clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-23+0x4e503d6)
   #17 0x000055d1ef389207 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-23+0x4fc0207)
   #18 0x000055d1eb321a55 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-23+0xf58a55)
   #19 0x000055d1eb319763 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #20 0x000055d1eb3197a3 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #21 0x000055d1eefb7de9 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #22 0x000055d1ee436a03 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-23+0x406da03)
   #23 0x000055d1eefb8514 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #24 0x000055d1eef77668 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-23+0x4bae668)
   #25 0x000055d1eef785c2 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-23+0x4baf5c2)
   #26 0x000055d1eef897bc clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-23+0x4bc07bc)
   #27 0x000055d1eb31e40f clang_main(int, char**, llvm::ToolContext const&)=
 (clang-23+0xf5540f)
   #28 0x000055d1eb1b4bb9 main (clang-23+0xdebbb9)
   #29 0x00007f5969dd7ca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #30 0x00007f5969dd7d65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #31 0x000055d1eb3191a1 _start (clang-23+0xf501a1)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 1163418 Segmentation fault      clang -Wp,-MMD,io_uri=
ng/.cancel.o.d -nostdinc -Iarch/mips/include -I./arch/mips/include/generate=
d -Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips/include/gene=
rated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linux=
/compiler-version.h -include include/linux/kconfig.h -include include/linux=
/compiler_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -fintegrated-as =
-Werror=3Dunknown-warning-option -Werror=3Dignored-optimization-argument -W=
error=3Doption-ignored -Werror=3Dunused-command-line-argument -DVMLINUX_LOA=
D_ADDRESS=3D0xffffffff84000000 -DLINKER_LOAD_ADDRESS=3D0x84000000 -DDATAOFF=
SET=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -fshort-wchar=
 -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -std=3Dgnu11 -fm=
s-anonymous-structs -Wno-gnu -Wno-microsoft-anon-tag -mno-check-zero-divisi=
on -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-flo=
at -ffreestanding -EB -fno-stack-check -march=3Dmips3 -Wa,--trap -DTOOLCHAI=
N_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-ip22 -Iarch/mips/include/asm/m=
ach-generic -fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks=
 -O2 -fstack-protector -fomit-frame-pointer -ftrivial-auto-var-init=3Dzero =
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
no-unused-parameter -gsplit-dwarf -g -fno-var-tracking -DRANDSTRUCT -frando=
mize-layout-seed-file=3D./scripts/basic/randstruct.seed -fno-crash-diagnost=
ics -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -falign-=
functions=3D64 -fsanitize=3Darray-bounds -fsanitize=3Dshift -Iio_uring -Iio=
_uring -ffunction-sections -fdata-sections -DKBUILD_MODFILE=3D'"io_uring/ca=
ncel"' -DKBUILD_BASENAME=3D'"cancel"' -DKBUILD_MODNAME=3D'"cancel"' -D__KBU=
ILD_MODNAME=3Dcancel -c -o io_uring/cancel.o io_uring/cancel.c

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
