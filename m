Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794777594;
	b=ccjSITEpUD3CPtY7NV/2BQSpce+SgJAi+S5VE4pJ4O8fqi0Y1c6iy6CusQFDaO85ZkcL
	 omvke17x3cyD8tswdHYiKXgX1MNwQMW9jxjinilb2x//r7I7x4L1kCGjRdHi3dHkjiB0b
	 CPEQQx+sBvzLyaKZ7N802H2CI5oB9lW8brag9/JrESf2akDp8d435RYobONrybzsuySMk
	 67aHQet+UQnUQpN+zJx6nCh6LQZqk4N3hbgGAEZZtGJcBTdB/i+Tch+8/i5paQGJnfkh5
	 P/j5MKT2AggfyO1cicpOy1vVnZX/zOtmU95ipgwTc108VbfOVbZDhorgAmgjdtCJQUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794777594;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=w1QWLyFaK1YeYIK8D3eC0Pcbl1TAtZtpY8SPIeFIVLY=;
	b=F3vnPPjb9CFBMyZYr4zm54RbyMXTK4/XLJZKz3OUH09Cci34I+rYmYOOUNrvXgii3uB1
	 9kmXL1wtW3iruBowitYPdxNleDrTy9wfqzOsUFd84ml2cJegtJAV33pg8yjd8rpPX+Uh8
	 65FQajr+sGh3nczfBViR8femM6c3vAreruTt6BeWbh8UrXBI0nbFnj1KfWYTimbWqwqlY
	 9dbz8ZBS9WAmUm0jjdmdlCbmedO/d2t9qW/vh86Onavvgk4ZfwZvetFQzMwW8VHMkGdz4
	 t0/QMfiBpgNcrJLNw1eytu6CGjQlTsW6qb6bG//dgDlubOcAZma3xMBEylrpptEkoUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HcPTtsE4;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F5B606A31F
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Nov 2026 21:19:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2F5B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HcPTtsE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794777594; x=1826313594;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=belJ6XCbUQv1kS1EA3kDuchbj7Hawl1LYEcu1+JGjDM=;
  b=HcPTtsE42teKLjtJWBvrh+SU3J3RP0j2jENKxniuT/mIKXJCM2RUVJB5
   pgy+7W0exho5YjPwD1BaAGmXauMhhQ+8X8KWeC1eshGG2oV3W2E+NgSVQ
   wt75e5sfD/K9nIpbGRx6Tx6t9n8ZZGx5qwYK06BLSGKbJVN/8qlirVFdY
   wAp+MZTAKqNJ7JLIkRTFvt/7mhYc2/uP1yka5uWuxer34uVFOEIfdEseM
   EcWwhw5N0sQJQ9wez+8YIzrUZ+dSv8vbvL7x7uap1JkHtMfs4vLe3zwa5
   quj7w5pqV3BrkbqG3/cmwhOnW0VtjHQihAnhdxRA7jCdmtsbH9ytj7jAx
   A==;
X-CSE-ConnectionGUID: uU0XeYNBR9mN7KjXjDDd0w==
X-CSE-MsgGUID: 8tSQtWU6SBmHt1wBIGVVdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3403018"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3403018"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 13:19:53 -0800
X-CSE-ConnectionGUID: qng4zGIwSuyax0iUqxoymA==
X-CSE-MsgGUID: FT6lr9uaQASVJO5XZyP9kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9721487"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 15 Nov 2026 13:19:52 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xShde-000000002O3-0vTX;
	Sun, 15 Nov 2026 21:19:50 +0000
Date: Sun, 15 Nov 2026 22:19:36 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 4464/7428] clang: error: clang frontend
 command failed with exit code 139 (use -v to see invocation)
Message-ID: <202611152227.45vGCKDB-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   84abb955b1015477aa11a96e2f3ac1b938b77f48
commit: 3940e466752704b504a9a543b65ab5118ba5feba [4464/7428] btrfs: change =
scrub to use stripe_len
:::::: branch date: 2 days ago
:::::: commit date: 6 days ago
config: hexagon-randconfig-r2104-20261115 (https://download.01.org/0day-ci/=
archive/20261115/202611152227.45vGCKDB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261115/202611152227.45vGCKDB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611152227.45vGCKDB-lkp@intel.com/

All errors (new ones prefixed by >>):

   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,fs/btrfs/.scrub.o.d -nostdinc -Iarc=
h/hexagon/include -I./arch/hexagon/include/generated -Iinclude -I./include =
-Iarch/hexagon/include/uapi -I./arch/hexagon/include/generated/uapi -Iinclu=
de/uapi -I./include/generated/uapi -include include/linux/compiler-version.=
h -include include/linux/kconfig.h -include include/linux/compiler_types.h =
-D__KERNEL__ --target=3Dhexagon-linux-musl -fintegrated-as -Werror=3Dunknow=
n-warning-option -Werror=3Dignored-optimization-argument -Werror=3Doption-i=
gnored -Werror=3Dunused-command-line-argument -fmacro-prefix-map=3D=3D -Wun=
def -DKBUILD_EXTRA_WARN1 -fshort-wchar -funsigned-char -fno-common -fno-PIE=
 -fno-strict-aliasing -std=3Dgnu11 -fms-extensions -Wno-gnu -Wno-microsoft-=
anon-tag -G0 -fno-short-enums -mlong-calls -ffixed-r19 -DTHREADINFO_REG=3Dr=
19 -D__linux__ -fno-delete-null-pointer-checks -O2 -fno-stack-protector -fn=
o-omit-frame-pointer -fno-optimize-sibling-calls -ftrivial-auto-var-init=3Dp=
attern -fstrict-flex-arrays=3D3 -fno-strict-overflow -fno-stack-check -fno-=
builtin-wcslen -Wall -Wextra -Wundef -Werror=3Dimplicit-function-declaratio=
n -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes =
-Wno-format-security -Wno-trigraphs -Wno-frame-address -Wno-address-of-pack=
ed-member -Wmissing-declarations -Wmissing-prototypes -Wno-format-overflow-=
non-kprintf -Wno-format-truncation-non-kprintf -Wno-type-limits -Wno-pointe=
r-sign -Wcast-function-type -Wimplicit-fallthrough -Werror=3Ddate-time -Wer=
ror=3Dincompatible-pointer-types -Wenum-conversion -Wunused -Wmissing-forma=
t-attribute -Wmissing-include-dirs -Wunused-const-variable -Wno-missing-fie=
ld-initializers -Wno-shift-negative-value -Wno-enum-enum-conversion -Wno-si=
gn-compare -Wno-unused-parameter -g -gdwarf-5 -fno-var-tracking -fno-crash-=
diagnostics -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef =
-falign-functions=3D64 -Wextra -Wunused -Wno-unused-parameter -Wmissing-dec=
larations -Wmissing-format-attribute -Wmissing-prototypes -Wold-style-defin=
ition -Wmissing-include-dirs -Wunused-but-set-variable -Wunused-const-varia=
ble -Wno-missing-field-initializers -Wno-sign-compare -Wno-shift-negative-v=
alue -fdebug-info-for-profiling -mllvm -enable-fs-discriminator=3Dtrue -mll=
vm -improved-fs-discriminator=3Dtrue -Ifs/btrfs -Ifs/btrfs -DKBUILD_MODFILE=
=3D\"fs/btrfs/btrfs\" -DKBUILD_BASENAME=3D\"scrub\" -DKBUILD_MODNAME=3D\"bt=
rfs\" -D__KBUILD_MODNAME=3Dbtrfs -c -o fs/btrfs/scrub.o fs/btrfs/scrub.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'fs/btrfs/scrub.c'.
   4.	Running pass 'Greedy Register Allocator' on function '@scrub_stripe'
    #0 0x000055c25940ddfb llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-20+0x3d3edfb)
    #1 0x000055c25940bd94 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
20+0x3d3cd94)
    #2 0x000055c25935c1d8 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007efd72e8ad70 (/lib/x86_64-linux-gnu/libc.so.6+0x3fd70)
    #4 0x000055c258b97537 (anonymous namespace)::HoistSpillHelper::getVisit=
Orders(llvm::MachineBasicBlock*, llvm::SmallPtrSet<llvm::MachineInstr*, 16u=
>&, llvm::SmallVectorImpl<llvm::DomTreeNodeBase<llvm::MachineBasicBlock>*>&=
, llvm::SmallVectorImpl<llvm::MachineInstr*>&, llvm::DenseMap<llvm::DomTree=
NodeBase<llvm::MachineBasicBlock>*, unsigned int, llvm::DenseMapInfo<llvm::=
DomTreeNodeBase<llvm::MachineBasicBlock>*, void>, llvm::detail::DenseMapPai=
r<llvm::DomTreeNodeBase<llvm::MachineBasicBlock>*, unsigned int>>&, llvm::D=
enseMap<llvm::DomTreeNodeBase<llvm::MachineBasicBlock>*, llvm::MachineInstr=
*, llvm::DenseMapInfo<llvm::DomTreeNodeBase<llvm::MachineBasicBlock>*, void=
>, llvm::detail::DenseMapPair<llvm::DomTreeNodeBase<llvm::MachineBasicBlock=
>*, llvm::MachineInstr*>>&) InlineSpiller.cpp:0:0
    #5 0x000055c258b983bd (anonymous namespace)::HoistSpillHelper::runHoist=
Spills(llvm::LiveInterval&, llvm::VNInfo&, llvm::SmallPtrSet<llvm::MachineI=
nstr*, 16u>&, llvm::SmallVectorImpl<llvm::MachineInstr*>&, llvm::DenseMap<l=
lvm::MachineBasicBlock*, unsigned int, llvm::DenseMapInfo<llvm::MachineBasi=
cBlock*, void>, llvm::detail::DenseMapPair<llvm::MachineBasicBlock*, unsign=
ed int>>&) InlineSpiller.cpp:0:0
    #6 0x000055c258ba0271 (anonymous namespace)::HoistSpillHelper::hoistAll=
Spills() InlineSpiller.cpp:0:0
    #7 0x000055c258bfa0dc llvm::RegAllocBase::postOptimization() (clang-20+=
0x352b0dc)
    #8 0x000055c2589d5495 llvm::RAGreedy::runOnMachineFunction(llvm::Machin=
eFunction&) (clang-20+0x3306495)
    #9 0x000055c25883ab06 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (.part.0) MachineFunctionPass.cpp:0:0
   #10 0x000055c258d903c9 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-20+0x36c13c9)
   #11 0x000055c258d9057c llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-20+0x36c157c)
   #12 0x000055c258d8f78c llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-20+0x36c078c)
   #13 0x000055c2596a621f clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-20+0x3fd721f)
   #14 0x000055c259cfdcc0 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-20+0x462ecc0)
   #15 0x000055c25b6da8ec clang::ParseAST(clang::Sema&, bool, bool) (clang-=
20+0x600b8ec)
   #16 0x000055c259fe3fd1 clang::FrontendAction::Execute() (clang-20+0x4914=
fd1)
   #17 0x000055c259f5962b clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-20+0x488a62b)
   #18 0x000055c25a0b1ae7 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-20+0x49e2ae7)
   #19 0x000055c25671e0c0 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-20+0x104f0c0)
   #20 0x000055c256716d1a ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&) driver.cpp:0:0
   #21 0x000055c259d4a959 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #22 0x000055c25935c5a3 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-20+0x3c8d5a3)
   #23 0x000055c259d4ace9 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #24 0x000055c259d0f31c clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-20+0x464031c)
   #25 0x000055c259d10319 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-20+0x4641319)
   #26 0x000055c259d2303c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-20+0x465403c)
   #27 0x000055c25671b01e clang_main(int, char**, llvm::ToolContext const&)=
 (clang-20+0x104c01e)
   #28 0x000055c2565e7503 main (clang-20+0xf18503)
   #29 0x00007efd72e74ca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #30 0x00007efd72e74d65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #31 0x000055c256716511 _start (clang-20+0x1047511)
>> clang: error: clang frontend command failed with exit code 139 (use -v t=
o see invocation)

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
