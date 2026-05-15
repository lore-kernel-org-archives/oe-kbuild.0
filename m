Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A69CA52
	for <oe-kbuild@lists.linux.dev>; Fri, 15 May 2026 05:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778822081; cv=none; b=GINYy3duRAtNphYaHT8kjac+gPgfJAnmieLVl+x4ZYbZjIzGI5YozkbWw4BFIgo1Ip48R4B2YKrPaQuqQJf3APA6ZGNNPndw06VlWNvhjmQLdIvaiTPx2amz4Af7DMZxiakupnZRnkEddfauhN+t+Q23c+pwkraEoLw88ManSsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778822081; c=relaxed/simple;
	bh=MSWNb7BynEPJmWG6ymjpE+NyFEUcqSwSrpUulF2umJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pth/mWNEpyY3FiftP4R3lLKmB6RQE3L7F3AvrT4RmGUtN6a6DF69Cwmrt3EKwrHWD13JidKzuiA4kxAhyUu9UHSxqHPf+dov+rzaDS7Co9CP6u396n8gSUuK6BwUYDoQK3it855vRRfLM1QNnm1qls2CesB7kWA9WNs5at6u87E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FIIDvbkV; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FIIDvbkV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778822079; x=1810358079;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MSWNb7BynEPJmWG6ymjpE+NyFEUcqSwSrpUulF2umJ4=;
  b=FIIDvbkVU3EyYLtTlrpeFKwCn5shNOVe4MKx48ZPySzEN3YXjuuoH5Hd
   Hm1QSb/AGRo9BJeFMwTvMeNc4Il34p3vrJBmMJkZp+SW3wj1BimGT2qne
   WIGhjdboN4MBtyvQ474yerouepTehLxqJdyEiA5l6BJ7Lp0fP/qQ0iL+M
   l0LI/piP29ibG7OXST+JCEocKJZJapd9Z0LTvGWLkqdvBl0nihA9suG7t
   P90xXmsZa16LzyhoYxCdDsSuHXulohXcQJHR5a37sMBKLVArtGkz5/p4o
   YlG7STn2jsDjdV7R/tHEer8c1t+CyIh8AeJF9dLJmPEzUuDKVf0+o4NeT
   Q==;
X-CSE-ConnectionGUID: R0XBwpvtRWO71PI0k3Khgg==
X-CSE-MsgGUID: ry8+F4ZDQMKMDI2FyIOTUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="83388401"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="83388401"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 22:14:39 -0700
X-CSE-ConnectionGUID: pGlNr7BiQlO5qVolB45ZKQ==
X-CSE-MsgGUID: Ec37pTaOTZ2BLQs9mIQwLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="276676889"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 14 May 2026 22:14:38 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNksd-000000000u9-2QJ3;
	Fri, 15 May 2026 05:14:35 +0000
Date: Fri, 15 May 2026 13:13:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] i2c: Consistently define pci_device_ids using named
 initializers
Message-ID: <202605151348.nuoSAx7O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "clang compiler bug"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260504142639.2119645-2-u.kleine-koenig@baylibre.com>
References: <20260504142639.2119645-2-u.kleine-koenig@baylibre.com>
TO: "Uwe Kleine-K=F6nig (The Capable Hub)" <u.kleine-koenig@baylibre.com>
TO: Andi Shyti <andi.shyti@kernel.org>
CC: Mika Westerberg <mika.westerberg@linux.intel.com>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Jan Dabros <jsd@semihalf.com>
CC: linux-i2c@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: "Markus Schneider-Pargmann" <msp@baylibre.com>
CC: Wolfram Sang <wsa-dev@sang-engineering.com>

Hi Uwe,

kernel test robot noticed the following build errors:

[auto build test ERROR on 254f49634ee16a731174d2ae34bc50bd5f45e731]

url:    https://github.com/intel-lab-lkp/linux/commits/Uwe-Kleine-K-nig-The=
-Capable-Hub/i2c-Consistently-define-pci_device_ids-using-named-initializer=
s/20260514-182607
base:   254f49634ee16a731174d2ae34bc50bd5f45e731
patch link:    https://lore.kernel.org/r/20260504142639.2119645-2-u.kleine-=
koenig%40baylibre.com
patch subject: [PATCH] i2c: Consistently define pci_device_ids using named =
initializers
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: mips-randconfig-r072-20260515 (https://download.01.org/0day-ci/arch=
ive/20260515/202605151348.nuoSAx7O-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5ba=
c06718f502014fade905512f1d26d578a18f3)
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260515/202605151348.nuoSAx7O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605151348.nuoSAx7O-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
All errors (new ones prefixed by >>):

   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,net/sched/.sch_frag.o.d -nostdinc -=
Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I./include -I=
arch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi =
-I./include/generated/uapi -include include/linux/compiler-version.h -inclu=
de include/linux/kconfig.h -include include/linux/compiler_types.h -D__KERN=
EL__ --target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknown-warning-=
option -Werror=3Dignored-optimization-argument -Werror=3Doption-ignored -We=
rror=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xffffffff8003=
0000 -DLINKER_LOAD_ADDRESS=3D0x80030000 -DDATAOFFSET=3D0 -fmacro-prefix-map=
=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -fshort-wchar -funsigned-char -fno-comm=
on -fno-PIE -fno-strict-aliasing -std=3Dgnu11 -fms-anonymous-structs -Wno-g=
nu -Wno-microsoft-anon-tag -mno-check-zero-division -mabi=3D32 -G 0 -mno-ab=
icalls -fno-pic -pipe -msoft-float -Wa,-msoft-float -ffreestanding -EB -fno=
-stack-check -march=3Dmips4 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mip=
s/include/asm/mach-rm -Iarch/mips/include/asm/mach-generic -fno-asynchronou=
s-unwind-tables -fno-delete-null-pointer-checks -Os -fno-stack-protector -f=
omit-frame-pointer -fexperimental-late-parse-attributes -fdiagnostics-show-=
inlining-chain -fstrict-flex-arrays=3D3 -fno-strict-overflow -fno-stack-che=
ck -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=3Dimplicit-function-de=
claration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-pro=
totypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wno-address=
-of-packed-member -Wmissing-declarations -Wmissing-prototypes -Wno-format-o=
verflow-non-kprintf -Wno-format-truncation-non-kprintf -Wno-default-const-i=
nit-unsafe -Wno-type-limits -Wno-pointer-sign -Wcast-function-type -Wno-unt=
erminated-string-initialization -Wimplicit-fallthrough -Werror=3Ddate-time =
-Werror=3Dincompatible-pointer-types -Wenum-conversion -Wunused -Wmissing-f=
ormat-attribute -Wmissing-include-dirs -Wunused-const-variable -Wno-missing=
-field-initializers -Wno-shift-negative-value -Wno-enum-enum-conversion -Wn=
o-sign-compare -Wno-unused-parameter -g -gdwarf-4 -fno-var-tracking -gz=3Dz=
lib -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wreturn-type -funsigne=
d-char -Wundef -falign-functions=3D64 -Inet/sched -Inet/sched -DKBUILD_MODF=
ILE=3D\"net/sched/sch_frag\" -DKBUILD_BASENAME=3D\"sch_frag\" -DKBUILD_MODN=
AME=3D\"sch_frag\" -D__KBUILD_MODNAME=3Dsch_frag -c -o net/sched/sch_frag.o=
 net/sched/sch_frag.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'net/sched/sch_frag.c'.
   4.	Running pass 'Branch Probability Basic Block Placement' on function '=
@sch_frag_xmit_hook'
    #0 0x000055f2ca0dcc1b llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-23+0x413cc1b)
    #1 0x000055f2ca0da7e4 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
23+0x413a7e4)
    #2 0x000055f2ca00d6a0 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007fa537178df0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x000055f2c969452f llvm::TailDuplicator::shouldTailDuplicate(bool, l=
lvm::MachineBasicBlock&) (.part.0) TailDuplicator.cpp:0:0
    #5 0x000055f2c93b197f (anonymous namespace)::MachineBlockPlacement::run=
(llvm::MachineFunction&) MachineBlockPlacement.cpp:0:0
    #6 0x000055f2c93b58b1 (anonymous namespace)::MachineBlockPlacementLegac=
y::runOnMachineFunction(llvm::MachineFunction&) (.part.0) MachineBlockPlace=
ment.cpp:0:0
    #7 0x000055f2c9403438 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-23+0x3463438)
    #8 0x000055f2c99ca869 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-23+0x3a2a869)
    #9 0x000055f2c99caa0c llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-23+0x3a2aa0c)
   #10 0x000055f2c99c9c78 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-23+0x3a29c78)
   #11 0x000055f2ca4d8071 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-23+0x4538071)
   #12 0x000055f2cab1d6c7 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-23+0x4b7d6c7)
   #13 0x000055f2cc528adc clang::ParseAST(clang::Sema&, bool, bool) (clang-=
23+0x6588adc)
   #14 0x000055f2cae7717a clang::FrontendAction::Execute() (clang-23+0x4ed7=
17a)
   #15 0x000055f2cadf03d6 clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-23+0x4e503d6)
   #16 0x000055f2caf60207 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-23+0x4fc0207)
   #17 0x000055f2c6ef8a55 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-23+0xf58a55)
   #18 0x000055f2c6ef0763 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #19 0x000055f2c6ef07a3 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #20 0x000055f2cab8ede9 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #21 0x000055f2ca00da03 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-23+0x406da03)
   #22 0x000055f2cab8f514 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #23 0x000055f2cab4e668 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-23+0x4bae668)
   #24 0x000055f2cab4f5c2 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-23+0x4baf5c2)
   #25 0x000055f2cab607bc clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-23+0x4bc07bc)
   #26 0x000055f2c6ef540f clang_main(int, char**, llvm::ToolContext const&)=
 (clang-23+0xf5540f)
   #27 0x000055f2c6d8bbb9 main (clang-23+0xdebbb9)
   #28 0x00007fa537162ca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #29 0x00007fa537162d65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #30 0x000055f2c6ef01a1 _start (clang-23+0xf501a1)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 2699401 Segmentation fault      clang -Wp,-MMD,net/sc=
hed/.sch_frag.o.d -nostdinc -Iarch/mips/include -I./arch/mips/include/gener=
ated -Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips/include/g=
enerated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/li=
nux/compiler-version.h -include include/linux/kconfig.h -include include/li=
nux/compiler_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -fintegrated-=
as -Werror=3Dunknown-warning-option -Werror=3Dignored-optimization-argument=
 -Werror=3Doption-ignored -Werror=3Dunused-command-line-argument -DVMLINUX_=
LOAD_ADDRESS=3D0xffffffff80030000 -DLINKER_LOAD_ADDRESS=3D0x80030000 -DDATA=
OFFSET=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -fshort-wc=
har -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -std=3Dgnu11 =
-fms-anonymous-structs -Wno-gnu -Wno-microsoft-anon-tag -mno-check-zero-div=
ision -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-=
float -ffreestanding -EB -fno-stack-check -march=3Dmips4 -Wa,--trap -DTOOLC=
HAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-rm -Iarch/mips/include/asm/=
mach-generic -fno-asynchronous-unwind-tables -fno-delete-null-pointer-check=
s -Os -fno-stack-protector -fomit-frame-pointer -fexperimental-late-parse-a=
ttributes -fdiagnostics-show-inlining-chain -fstrict-flex-arrays=3D3 -fno-s=
trict-overflow -fno-stack-check -fno-builtin-wcslen -Wall -Wextra -Wundef -=
Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dret=
urn-type -Werror=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -W=
no-frame-address -Wno-address-of-packed-member -Wmissing-declarations -Wmis=
sing-prototypes -Wno-format-overflow-non-kprintf -Wno-format-truncation-non=
-kprintf -Wno-default-const-init-unsafe -Wno-type-limits -Wno-pointer-sign =
-Wcast-function-type -Wno-unterminated-string-initialization -Wimplicit-fal=
lthrough -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wenum-co=
nversion -Wunused -Wmissing-format-attribute -Wmissing-include-dirs -Wunuse=
d-const-variable -Wno-missing-field-initializers -Wno-shift-negative-value =
-Wno-enum-enum-conversion -Wno-sign-compare -Wno-unused-parameter -g -gdwar=
f-4 -fno-var-tracking -gz=3Dzlib -fno-crash-diagnostics -Wno-error=3Dreturn=
-type -Wreturn-type -funsigned-char -Wundef -falign-functions=3D64 -Inet/sc=
hed -Inet/sched -DKBUILD_MODFILE=3D'"net/sched/sch_frag"' -DKBUILD_BASENAME=
=3D'"sch_frag"' -DKBUILD_MODNAME=3D'"sch_frag"' -D__KBUILD_MODNAME=3Dsch_fr=
ag -c -o net/sched/sch_frag.o net/sched/sch_frag.c

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
