Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617063;
	b=rJXzOuC9E+zcRgZHg0Ps2V6At+pZLmmcRkJvzoNj1nwzt6NWn4CNH7EynPNCRVL7R9lp
	 4SeEf3KFwfHrT5JRs2qUUV/3AImW88wVXG6vSH6xCTs9yAM+0HTiSynkswckZDUoix2FR
	 D6Gt/CtGkb2rtmzjM5qy7+CYNsLSrm4B2sSDr+LWUJyL8yHnpn03EZ2yBEb0obQvHhRRb
	 bicYgBj+uc1fb30xmazFpQma/oy+NTZ4WOaU+LPns+/N/VtfgpLQSnxLsW2mKLc1X9mRG
	 hL98IeZGo6SjwhUEmk8L8HWgp/cGtx5MsmJiaVfY0ISHZ5yvmNt1OWIEvT/Yq0j8z8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617063;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=BbcLSTpAqHH+PL5mCxR3NtQkheP8RaOxpUJtpueEge0=;
	b=LxipU2c4x3BPVd3lmJ+LT6VXlXuc5vg3CnbVFcxYlfaQfNU1c9ftcS3Hi6V01IjH4ENc
	 CcS29GoiZfs/Dr93evSB4aqAFPBRrZdNQnF8m7MTdbx5wZYiMuopvbzZL8ikEVYsbsqm/
	 6tsNitKut6/Uz15P5aUSsV3fjZLGfH9b/0e9YKMbLIbzY1KTXZUMI/JWA9QUVDvFoVLYp
	 7ZDmXxT+pfEokM8On6P28Xd5eK9StTSj9SLQhDafCxSOFHIw4Sp0MtlgJQVPMqhYO1j4I
	 vnIunVxN+qEsyzoF0Jkt6QpO8VpQ0EDonoa5Ddeb2ucinrgi0vAIIQRbkC4UaHy3DLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DuS4KaWJ;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F61B606A336
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Nov 2026 10:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F61B606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DuS4KaWJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793617061; x=1825153061;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hBuJMagQEKOtXdJTKX9mQwrUIS0U9KSGod18Y7hK8qE=;
  b=DuS4KaWJxm0TqOgHKWNy8tImNaRWrG1DoqLvE3oNhyj+PibmTWQoxFX9
   YiM3gl4OsG/ff//iCAbo1lniq5NGipGTUgpxQnQdfN3tnHlO7Vya4Xfry
   6JY8L/wUzVfWcY+7h9GL+mzuBN7/4uImEreLe/XeY94r77HCXc0vpeiLy
   iIomKwxzcHt9AGkaadaG8TufDTHXBdrhSt3liPPeTvT+LVq5nv9oEE2F9
   5o47rIy2L6hxLKOts8vYklpncyQs2XsEsnlfT+JyYFvv5tbLhylwxmwh7
   K7H+J7aqStLTGqod/3QlklApfrbFnjp6gomuXCvPTOZ7I6T94pCAdf5lv
   A==;
X-CSE-ConnectionGUID: zZvYCA4hRH2CX7uBtsJckg==
X-CSE-MsgGUID: 2rWoNT3ESrS+cVYZ71jDfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2330452"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2330452"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 02:57:41 -0800
X-CSE-ConnectionGUID: HkDFipMYT7SKVAckDQVVpA==
X-CSE-MsgGUID: oPMx6bWGRcK4OR09mZL3WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6641228"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 02 Nov 2026 02:57:40 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNpjN-000000008TL-3bku;
	Mon, 02 Nov 2026 10:57:37 +0000
Date: Mon, 02 Nov 2026 11:56:52 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [btrfs:pr/1630 36/56] /bin/bash: line 1: 3325180
 Segmentation fault      clang -Wp,-MMD,fs/btrfs/.zoned.o.d -nostdinc
 -Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I./include
 -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi
 -I./incl...
Message-ID: <202611021105.6InKBOKj-lkp@intel.com>
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
TO: Qu Wenruo <wqu@suse.com>
CC: David Sterba <dsterba@suse.com>
CC: Johannes Thumshirn <johannes.thumshirn@wdc.com>

tree:   https://github.com/btrfs/linux.git pr/1630
head:   a919d4a3e8312a6081beddada0cb2dfc91fa7c66
commit: 2187ec9166ea7441f551337b91802d65b2283972 [36/56] btrfs: convert zon=
ed.c to use map->stripe_len
:::::: branch date: 26 hours ago
:::::: commit date: 3 days ago
config: mips-randconfig-r2104-20261102 (https://download.01.org/0day-ci/arc=
hive/20261102/202611021105.6InKBOKj-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 3e5=
b45eed6c3ec25f4f1cc81ce0be10106a8f31f)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261102/202611021105.6InKBOKj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611021105.6InKBOKj-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
All errors (new ones prefixed by >>):

   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace and dumped files.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,fs/btrfs/.zoned.o.d -nostdinc -Iarc=
h/mips/include -I./arch/mips/include/generated -Iinclude -I./include -Iarch=
/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi -I./=
include/generated/uapi -include include/linux/compiler-version.h -include i=
nclude/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__=
 --target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknown-warning-opti=
on -Werror=3Dignored-optimization-argument -Werror=3Doption-ignored -Werror=
=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xffffffff84000000=
 -DLINKER_LOAD_ADDRESS=3D0x84000000 -DDATAOFFSET=3D0 -fmacro-prefix-map=3D=
=3D -Wundef -DKBUILD_EXTRA_WARN1 -fshort-wchar -funsigned-char -fno-common =
-fno-PIE -fno-strict-aliasing -std=3Dgnu11 -fms-anonymous-structs -Wno-gnu =
-Wno-microsoft-anon-tag -mno-check-zero-division -mabi=3D32 -G 0 -mno-abica=
lls -fno-pic -pipe -msoft-float -Wa,-msoft-float -ffreestanding -EB -fno-st=
ack-check -march=3Dmips3 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/i=
nclude/asm/mach-jazz -Iarch/mips/include/asm/mach-generic -fno-asynchronous=
-unwind-tables -fno-delete-null-pointer-checks -O2 -fstack-protector-strong=
 -ftrivial-auto-var-init=3Dpattern -fexperimental-late-parse-attributes -fd=
iagnostics-show-inlining-chain -pg -fstrict-flex-arrays=3D3 -fno-strict-ove=
rflow -fno-stack-check -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=3Di=
mplicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -=
Werror=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-a=
ddress -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-proto=
types -Wno-format-overflow-non-kprintf -Wno-format-truncation-non-kprintf -=
Wno-default-const-init-unsafe -Wno-type-limits -Wno-pointer-sign -Wcast-fun=
ction-type -Wno-unterminated-string-initialization -Wimplicit-fallthrough -=
Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wenum-conversion -=
Wunused -Wmissing-format-attribute -Wmissing-include-dirs -Wunused-const-va=
riable -Wno-missing-field-initializers -Wno-shift-negative-value -Wno-enum-=
enum-conversion -Wno-sign-compare -Wno-unused-parameter -fno-crash-diagnost=
ics -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -falign-=
functions=3D64 -Wextra -Wunused -Wno-unused-parameter -Wmissing-declaration=
s -Wmissing-format-attribute -Wmissing-prototypes -Wold-style-definition -W=
missing-include-dirs -Wunused-but-set-variable -Wunused-const-variable -Wno=
-missing-field-initializers -Wno-sign-compare -Wno-shift-negative-value -If=
s/btrfs -Ifs/btrfs -DMODULE -mlong-calls -DKBUILD_BASENAME=3D\"zoned\" -DKB=
UILD_MODNAME=3D\"btrfs\" -D__KBUILD_MODNAME=3Dbtrfs -c -o fs/btrfs/zoned.o =
fs/btrfs/zoned.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'fs/btrfs/zoned.c'.
   4.	Running pass 'Shrink Wrapping analysis' on function '@btrfs_load_bloc=
k_group_by_raid_type'
    #0 0x00005644db7fa94a llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-24+0x417094a)
    #1 0x00005644db7f8524 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
24+0x416e524)
    #2 0x00005644db728bc0 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007f52af23ad70 (/lib/x86_64-linux-gnu/libc.so.6+0x3fd70)
    #4 0x00005644dad30192 (anonymous namespace)::ShrinkWrapImpl::useOrDefCS=
ROrFI(llvm::MachineInstr const&, llvm::RegScavenger*, bool) const ShrinkWra=
p.cpp:0:0
    #5 0x00005644dad335bc (anonymous namespace)::ShrinkWrapImpl::run(llvm::=
MachineFunction&) (.constprop.0) ShrinkWrap.cpp:0:0
    #6 0x00005644dad3524d (anonymous namespace)::ShrinkWrapLegacy::runOnMac=
hineFunction(llvm::MachineFunction&) (.part.0) ShrinkWrap.cpp:0:0
    #7 0x00005644dab5d6b3 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-24+0x34d36b3)
    #8 0x00005644db0d56e9 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-24+0x3a4b6e9)
    #9 0x00005644db0d5b3c llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-24+0x3a4bb3c)
   #10 0x00005644db0d66ce (anonymous namespace)::MPPassManager::runOnModule=
(llvm::Module&) LegacyPassManager.cpp:0:0
   #11 0x00005644db0d6ffc llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-24+0x3a4cffc)
   #12 0x00005644dc9d5545 runCodeGenPipelineLegacy(llvm::TargetMachine&, ll=
vm::Module&, llvm::raw_pwrite_stream&, llvm::raw_pwrite_stream*, llvm::Code=
GenFileType, bool, bool) RunCodeGen.cpp:0:0
   #13 0x00005644dc9d5630 llvm::runCodeGenPipeline(llvm::TargetMachine&, ll=
vm::Module&, llvm::raw_pwrite_stream&, llvm::raw_pwrite_stream*, llvm::Code=
GenFileType, bool, bool, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>) (=
clang-24+0x534b630)
   #14 0x00005644dbbc260d (anonymous namespace)::EmitAssemblyHelper::emitAs=
sembly(clang::BackendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::=
default_delete<llvm::raw_pwrite_stream>>, clang::BackendConsumer*) BackendU=
til.cpp:0:0
   #15 0x00005644dbbc2c8a clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::Module*, clang::BackendAction, llvm::Intrus=
iveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm::raw_pwrite_strea=
m, std::default_delete<llvm::raw_pwrite_stream>>, clang::BackendConsumer*) =
(clang-24+0x4538c8a)
   #16 0x00005644dc1ed26f clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-24+0x4b6326f)
   #17 0x00005644df09a54c clang::ParseAST(clang::Sema&, bool, bool) (clang-=
24+0x7a1054c)
   #18 0x00005644dc543cde clang::FrontendAction::Execute() (clang-24+0x4eb9=
cde)
   #19 0x00005644dc4d1fae clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-24+0x4e47fae)
   #20 0x00005644dc60d8df clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-24+0x4f838df)
   #21 0x00005644d858c788 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-24+0xf02788)
   #22 0x00005644d85844e3 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #23 0x00005644d8584527 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #24 0x00005644dc26ba19 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #25 0x00005644db728ef3 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-24+0x409eef3)
   #26 0x00005644dc26ce4c clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #27 0x00005644dc229fc8 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-24+0x4b9ffc8)
   #28 0x00005644dc22ca16 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-24+0x4ba2a16)
   #29 0x00005644dc23f57c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-24+0x4bb557c)
   #30 0x00005644d8589172 clang_main(int, char**, llvm::ToolContext const&)=
 (clang-24+0xeff172)
   #31 0x00005644d8500b02 main (clang-24+0xe76b02)
   #32 0x00007f52af224ca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #33 0x00007f52af224d65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #34 0x00005644d8583f41 _start (clang-24+0xef9f41)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 3325180 Segmentation fault      clang -Wp,-MMD,fs/btr=
fs/.zoned.o.d -nostdinc -Iarch/mips/include -I./arch/mips/include/generated=
 -Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips/include/gener=
ated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linux/=
compiler-version.h -include include/linux/kconfig.h -include include/linux/=
compiler_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -fintegrated-as -=
Werror=3Dunknown-warning-option -Werror=3Dignored-optimization-argument -We=
rror=3Doption-ignored -Werror=3Dunused-command-line-argument -DVMLINUX_LOAD=
_ADDRESS=3D0xffffffff84000000 -DLINKER_LOAD_ADDRESS=3D0x84000000 -DDATAOFFS=
ET=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -fshort-wchar =
-funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -std=3Dgnu11 -fms=
-anonymous-structs -Wno-gnu -Wno-microsoft-anon-tag -mno-check-zero-divisio=
n -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-floa=
t -ffreestanding -EB -fno-stack-check -march=3Dmips3 -Wa,--trap -DTOOLCHAIN=
_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-jazz -Iarch/mips/include/asm/ma=
ch-generic -fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks =
-O2 -fstack-protector-strong -ftrivial-auto-var-init=3Dpattern -fexperiment=
al-late-parse-attributes -fdiagnostics-show-inlining-chain -pg -fstrict-fle=
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
parameter -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wreturn-type -fu=
nsigned-char -Wundef -falign-functions=3D64 -Wextra -Wunused -Wno-unused-pa=
rameter -Wmissing-declarations -Wmissing-format-attribute -Wmissing-prototy=
pes -Wold-style-definition -Wmissing-include-dirs -Wunused-but-set-variable=
 -Wunused-const-variable -Wno-missing-field-initializers -Wno-sign-compare =
-Wno-shift-negative-value -Ifs/btrfs -Ifs/btrfs -DMODULE -mlong-calls -DKBU=
ILD_BASENAME=3D'"zoned"' -DKBUILD_MODNAME=3D'"btrfs"' -D__KBUILD_MODNAME=3Db=
trfs -c -o fs/btrfs/zoned.o fs/btrfs/zoned.c

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
