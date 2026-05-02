Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D220740DFD8
	for <oe-kbuild@lists.linux.dev>; Sat,  2 May 2026 00:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777681688; cv=none; b=CziZ95pCvaoAdjA3DaccwumNhhcvD6AFYHIInMVcMj/sK059U8/Osbd1Cn2SSlNnOvRc7uRbk2ZkU/oKooGjHUfWhwY1dqWl4dkGF1CvEMH9s6J0pyVuq3dUlfTbZWl/QayrOSr0Aqg+PAxHY97PMufBfeF3DB7l3Qr8NPTJmZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777681688; c=relaxed/simple;
	bh=yFexxkLgODfqV0TqfqR2+B/55JMVatXwzDZN6pgpG2c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Lu37qSXAsigpb2ShhmHYQrHqrzqKGSBkRhZGHBaQhJ3AKybv8jSdWZy3tMVSk02THuZ51Qo+YAeBb78EdPIjy98v0QmmW9K6hx6diWF1yjC4ztx3c0KVe3DFIlLHPRnoJ6PN6JyEjPHRIY7zXoSLPHKFocW6rzSurBXJvfr8VLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U6Zyu5ey; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U6Zyu5ey"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777681687; x=1809217687;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yFexxkLgODfqV0TqfqR2+B/55JMVatXwzDZN6pgpG2c=;
  b=U6Zyu5ey2UVfVgMTf9QTf8dOlNJLQ9CeE0tCi69x5bzUDnoKkAZya7Mn
   /PX6NfGWG7TbUSXzRjHyHCtU6mIk8JS0PmzE1ZTmu3MS+z3eJzZtfhzbB
   SOTzebGT/2kscQu8DblkBR3twCjHg2XJ5MTyHmX4AB+8iTPyF9H61graS
   4O1aS/2hZQZuHf5eOQMliEt4KEqNVVs+ks8Mj2jvnX5SPqzAsURs9LiUo
   1FPgYdb54rhoRhaYPVRvgNXg+IeXxztoIP5I4YsMlmGbzQrKwXiboCnzA
   6rqmZWE5BdKewLv8cHyFSwKmSmYXUfDwCTHfjsWfKftAY1YMPNHRgu7io
   A==;
X-CSE-ConnectionGUID: sSVlUTOxRfem6eCqkFVcow==
X-CSE-MsgGUID: 2IdMSQ4xSvm2WIVRtCGi1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="81213062"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="81213062"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 17:28:06 -0700
X-CSE-ConnectionGUID: 0iTAxkX1TwySWNSm8Q3Flg==
X-CSE-MsgGUID: SjCv5gxqQW2tlKthhVpgWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="239973031"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 01 May 2026 17:28:05 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIyDD-0000000010Z-0Kfi;
	Sat, 02 May 2026 00:28:03 +0000
Date: Sat, 02 May 2026 08:27:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sailus-media-tree:atomisp 34/50] /bin/bash: line 1: 16921
 Segmentation fault      clang -Wp,-MMD,net/openvswitch/.flow.o.d -nostdinc
 -Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I./include
 -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi
 -I./...
Message-ID: <202605020811.va02Dw6f-lkp@intel.com>
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
CC: linux-media@vger.kernel.org
TO: "Oskar Ray-Frayssinet" <rayfraytech@gmail.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   git://linuxtv.org/sailus/media_tree.git atomisp
head:   874315b327d93d2d8208faeedfe2d1bf8b55f46c
commit: 3597a9fa54c64aaea73e4a846e80e78bf93f6ddb [34/50] staging: atomisp: =
use __func__ in debug message in atomisp_cmd.c
:::::: branch date: 8 days ago
:::::: commit date: 2 weeks ago
config: mips-randconfig-r072-20260424 (https://download.01.org/0day-ci/arch=
ive/20260502/202605020811.va02Dw6f-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5ba=
c06718f502014fade905512f1d26d578a18f3)
smatch: v0.5.0-9065-ge9cc34fd
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260502/202605020811.va02Dw6f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605020811.va02Dw6f-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
All errors (new ones prefixed by >>):

   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,net/openvswitch/.flow.o.d -nostdinc=
 -Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I./include =
-Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uap=
i -I./include/generated/uapi -include include/linux/compiler-version.h -inc=
lude include/linux/kconfig.h -include include/linux/compiler_types.h -D__KE=
RNEL__ --target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknown-warnin=
g-option -Werror=3Dignored-optimization-argument -Werror=3Doption-ignored -=
Werror=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xffffffff80=
100000 -DLINKER_LOAD_ADDRESS=3D0x80100000 -DDATAOFFSET=3D0 -fmacro-prefix-m=
ap=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -funsigned=
-char -fno-common -fno-PIE -fno-strict-aliasing -mno-check-zero-division -m=
abi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-float -f=
freestanding -EB -fno-omit-frame-pointer -fno-stack-check -march=3Dmips64 -=
Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-sibyte -DS=
IBYTE_HDR_FEATURES=3DSIBYTE_HDR_FMASK_1250_112x_ALL -Iarch/mips/include/asm=
/mach-generic -fno-asynchronous-unwind-tables -fno-delete-null-pointer-chec=
ks -O2 -fno-stack-protector -fomit-frame-pointer -fexperimental-late-parse-=
attributes -fstrict-flex-arrays=3D3 -fms-extensions -fno-strict-overflow -f=
no-stack-check -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=3Dimplicit=
-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=
=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-address=
 -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-prototypes =
-Wno-gnu -Wno-microsoft-anon-tag -Wno-format-overflow-non-kprintf -Wno-form=
at-truncation-non-kprintf -Wno-default-const-init-unsafe -Wno-type-limits -=
Wno-pointer-sign -Wcast-function-type -Wno-unterminated-string-initializati=
on -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Dincompatible-pointe=
r-types -Wenum-conversion -Wunused -Wmissing-format-attribute -Wmissing-inc=
lude-dirs -Wunused-const-variable -Wno-missing-field-initializers -Wno-shif=
t-negative-value -Wno-enum-enum-conversion -Wno-sign-compare -Wno-unused-pa=
rameter -DRANDSTRUCT -frandomize-layout-seed-file=3D./scripts/basic/randstr=
uct.seed -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wreturn-type -fun=
signed-char -Wundef -falign-functions=3D64 -Inet/openvswitch -Inet/openvswi=
tch -DMODULE -mlong-calls -DKBUILD_BASENAME=3D\"flow\" -DKBUILD_MODNAME=3D\=
"openvswitch\" -D__KBUILD_MODNAME=3Dopenvswitch -c -o net/openvswitch/flow.=
o net/openvswitch/flow.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'net/openvswitch/flow.=
c'.
   4.	Running pass 'Branch Probability Basic Block Placement' on function '=
@ovs_flow_stats_get'
    #0 0x0000556b4e345c1b llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-23+0x413cc1b)
    #1 0x0000556b4e3437e4 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
23+0x413a7e4)
    #2 0x0000556b4e2766a0 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007f2ca7e99df0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x0000556b4d8fd52f llvm::TailDuplicator::shouldTailDuplicate(bool, l=
lvm::MachineBasicBlock&) (.part.0) TailDuplicator.cpp:0:0
    #5 0x0000556b4d618db4 (anonymous namespace)::MachineBlockPlacement::bui=
ldCFGChains() MachineBlockPlacement.cpp:0:0
    #6 0x0000556b4d61d6ad (anonymous namespace)::MachineBlockPlacement::run=
(llvm::MachineFunction&) MachineBlockPlacement.cpp:0:0
    #7 0x0000556b4d61e8b1 (anonymous namespace)::MachineBlockPlacementLegac=
y::runOnMachineFunction(llvm::MachineFunction&) (.part.0) MachineBlockPlace=
ment.cpp:0:0
    #8 0x0000556b4d66c438 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-23+0x3463438)
    #9 0x0000556b4dc33869 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-23+0x3a2a869)
   #10 0x0000556b4dc33a0c llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-23+0x3a2aa0c)
   #11 0x0000556b4dc32c78 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-23+0x3a29c78)
   #12 0x0000556b4e741071 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-23+0x4538071)
   #13 0x0000556b4ed866c7 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-23+0x4b7d6c7)
   #14 0x0000556b50791adc clang::ParseAST(clang::Sema&, bool, bool) (clang-=
23+0x6588adc)
   #15 0x0000556b4f0e017a clang::FrontendAction::Execute() (clang-23+0x4ed7=
17a)
   #16 0x0000556b4f0593d6 clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-23+0x4e503d6)
   #17 0x0000556b4f1c9207 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-23+0x4fc0207)
   #18 0x0000556b4b161a55 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-23+0xf58a55)
   #19 0x0000556b4b159763 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #20 0x0000556b4b1597a3 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #21 0x0000556b4edf7de9 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #22 0x0000556b4e276a03 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-23+0x406da03)
   #23 0x0000556b4edf8514 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #24 0x0000556b4edb7668 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-23+0x4bae668)
   #25 0x0000556b4edb85c2 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-23+0x4baf5c2)
   #26 0x0000556b4edc97bc clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-23+0x4bc07bc)
   #27 0x0000556b4b15e40f clang_main(int, char**, llvm::ToolContext const&)=
 (clang-23+0xf5540f)
   #28 0x0000556b4aff4bb9 main (clang-23+0xdebbb9)
   #29 0x00007f2ca7e83ca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #30 0x00007f2ca7e83d65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #31 0x0000556b4b1591a1 _start (clang-23+0xf501a1)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 16921 Segmentation fault      clang -Wp,-MMD,net/open=
vswitch/.flow.o.d -nostdinc -Iarch/mips/include -I./arch/mips/include/gener=
ated -Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips/include/g=
enerated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/li=
nux/compiler-version.h -include include/linux/kconfig.h -include include/li=
nux/compiler_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -fintegrated-=
as -Werror=3Dunknown-warning-option -Werror=3Dignored-optimization-argument=
 -Werror=3Doption-ignored -Werror=3Dunused-command-line-argument -DVMLINUX_=
LOAD_ADDRESS=3D0xffffffff80100000 -DLINKER_LOAD_ADDRESS=3D0x80100000 -DDATA=
OFFSET=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu=
11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing =
-mno-check-zero-division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msof=
t-float -Wa,-msoft-float -ffreestanding -EB -fno-omit-frame-pointer -fno-st=
ack-check -march=3Dmips64 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/=
include/asm/mach-sibyte -DSIBYTE_HDR_FEATURES=3DSIBYTE_HDR_FMASK_1250_112x_=
ALL -Iarch/mips/include/asm/mach-generic -fno-asynchronous-unwind-tables -f=
no-delete-null-pointer-checks -O2 -fno-stack-protector -fomit-frame-pointer=
 -fexperimental-late-parse-attributes -fstrict-flex-arrays=3D3 -fms-extensi=
ons -fno-strict-overflow -fno-stack-check -fno-builtin-wcslen -Wall -Wextra=
 -Wundef -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -We=
rror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-security -Wno-tr=
igraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-declarat=
ions -Wmissing-prototypes -Wno-gnu -Wno-microsoft-anon-tag -Wno-format-over=
flow-non-kprintf -Wno-format-truncation-non-kprintf -Wno-default-const-init=
-unsafe -Wno-type-limits -Wno-pointer-sign -Wcast-function-type -Wno-unterm=
inated-string-initialization -Wimplicit-fallthrough -Werror=3Ddate-time -We=
rror=3Dincompatible-pointer-types -Wenum-conversion -Wunused -Wmissing-form=
at-attribute -Wmissing-include-dirs -Wunused-const-variable -Wno-missing-fi=
eld-initializers -Wno-shift-negative-value -Wno-enum-enum-conversion -Wno-s=
ign-compare -Wno-unused-parameter -DRANDSTRUCT -frandomize-layout-seed-file=
=3D./scripts/basic/randstruct.seed -fno-crash-diagnostics -Wno-error=3Dretu=
rn-type -Wreturn-type -funsigned-char -Wundef -falign-functions=3D64 -Inet/=
openvswitch -Inet/openvswitch -DMODULE -mlong-calls -DKBUILD_BASENAME=3D'"f=
low"' -DKBUILD_MODNAME=3D'"openvswitch"' -D__KBUILD_MODNAME=3Dopenvswitch -=
c -o net/openvswitch/flow.o net/openvswitch/flow.c

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
