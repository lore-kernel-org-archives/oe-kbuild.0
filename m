Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C72812CDBE
	for <oe-kbuild@lists.linux.dev>; Fri,  8 May 2026 13:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778245871; cv=none; b=q6r+YnX/weBKPR/uDIhRmS2mIL3eBQJLAJ5WWcc3+JHZCcuKF5N6BlQlhyXYwgQDjxm5uMvKJP1ouSpDpkfe4puzzDBEauZOMtEX+fjay1d+38v72KtVGNDMRb7SRgaBeVkyzBq+R4APUfuJGTr+D+mW4iGAVu0w77dE+KHGaZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778245871; c=relaxed/simple;
	bh=exYRSoYBiM8n06yW9LIl2Tmu0ia2+u5rSLnvTRt9l2o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=efYPwBp2TtRZyvdK0Ex8HoiiZUyBtmKZNdvRr1HEiKX9bYYX2A0xhqGsNprh5PQ28YFVHEN64OVENVlozd8gP5FKDsQDzYGeNU+OVJId/qI9IH5Udn//cpKPyfE1zA+RjMF0vxLePUw9F52uqq5aojNebYvsCS5DJG0i4GuQGD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DBodcVjc; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DBodcVjc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778245869; x=1809781869;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=exYRSoYBiM8n06yW9LIl2Tmu0ia2+u5rSLnvTRt9l2o=;
  b=DBodcVjc7wzjphkhrBfs/tyW9lgjjumpUQxFddHUWiUHKkdWeZPVA6Es
   tIxKPK3s6H+4YVD3nhc0ZLmLVu4CELk4Gye0GNyougWl2kD8gdz+PHmhk
   ZGyQCc1XMTMBz2kbZjIm7q/VdhnY1PjNLsjnpA0C+7pFPuFDZbxA6J8F4
   /o49NeWLgufQx/g+QqtKUhnHQvD7aN+82F1tfJ3AAMTSDOMInVxRae4/M
   eucIR7qLZqh2SpYFx8izNkiV+xt5h58V+xxoqMbJoYfZeO8fBf36wFSXc
   4nGLLdnrGzF78NZY2HrwsKiMBwtw5p5KVYzOpKxn7B1SUogC1z7OijTtl
   g==;
X-CSE-ConnectionGUID: vCan+lJiTBuqY5ptESZL9w==
X-CSE-MsgGUID: n2gwX/xVQ/yQLoD1RQ4+Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="101885619"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="101885619"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 06:11:06 -0700
X-CSE-ConnectionGUID: wDF1Oqz0SLmZPHRn/rVaYQ==
X-CSE-MsgGUID: cucvq3rkRlelAxwDLXw/yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="241761368"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 May 2026 06:11:04 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLKys-0000000009N-2kWk;
	Fri, 08 May 2026 13:11:02 +0000
Date: Fri, 08 May 2026 21:10:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2574/4176] /bin/bash: line 1: 3414820
 Segmentation fault      clang -Wp,-MMD,block/.blk-rq-qos.o.d -nostdinc
 -Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I./include
 -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi
 -I./in...
Message-ID: <202605082118.Al0FQd0R-lkp@intel.com>
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
TO: Biju Das <biju.das.jz@bp.renesas.com>
CC: Hans Verkuil <hverkuil@kernel.org>
CC: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   17c7841d09ee7d33557fd075562d9289b6018c90
commit: b01725760314f9bb592b15cc0c692eefdb20633d [2574/4176] media: dt-bind=
ings: media: renesas,vsp1: Document RZ/G3L VSPD
:::::: branch date: 25 hours ago
:::::: commit date: 4 days ago
config: mips-randconfig-r064-20260508 (https://download.01.org/0day-ci/arch=
ive/20260508/202605082118.Al0FQd0R-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5ba=
c06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260508/202605082118.Al0FQd0R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605082118.Al0FQd0R-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
All errors (new ones prefixed by >>):

   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,block/.blk-rq-qos.o.d -nostdinc -Ia=
rch/mips/include -I./arch/mips/include/generated -Iinclude -I./include -Iar=
ch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi -I=
./include/generated/uapi -include include/linux/compiler-version.h -include=
 include/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL=
__ --target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknown-warning-op=
tion -Werror=3Dignored-optimization-argument -Werror=3Doption-ignored -Werr=
or=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xffffffff801000=
00 -DLINKER_LOAD_ADDRESS=3D0x80100000 -DDATAOFFSET=3D0 -fmacro-prefix-map=
=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -fshort-wchar -funsigned-char -fno-comm=
on -fno-PIE -fno-strict-aliasing -std=3Dgnu11 -fms-anonymous-structs -Wno-g=
nu -Wno-microsoft-anon-tag -mno-check-zero-division -mabi=3D32 -G 0 -mno-ab=
icalls -fno-pic -pipe -msoft-float -Wa,-msoft-float -ffreestanding -EB -fno=
-omit-frame-pointer -fno-stack-check -march=3Dmips64 -Wa,--trap -DTOOLCHAIN=
_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-sibyte -DSIBYTE_HDR_FEATURES=3DS=
IBYTE_HDR_FMASK_1250_112x_ALL -Iarch/mips/include/asm/mach-generic -fno-asy=
nchronous-unwind-tables -fno-delete-null-pointer-checks -Os -fstack-protect=
or-strong -fomit-frame-pointer -ftrivial-auto-var-init=3Dpattern -fexperime=
ntal-late-parse-attributes -fdiagnostics-show-inlining-chain -fstrict-flex-=
arrays=3D3 -fno-strict-overflow -fno-stack-check -fno-builtin-wcslen -Wall =
-Wextra -Wundef -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-=
int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-security =
-Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-d=
eclarations -Wmissing-prototypes -Wno-format-overflow-non-kprintf -Wno-form=
at-truncation-non-kprintf -Wno-default-const-init-unsafe -Wno-type-limits -=
Wno-pointer-sign -Wcast-function-type -Wno-unterminated-string-initializati=
on -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Dincompatible-pointe=
r-types -Wenum-conversion -Wunused -Wmissing-format-attribute -Wmissing-inc=
lude-dirs -Wunused-const-variable -Wno-missing-field-initializers -Wno-shif=
t-negative-value -Wno-enum-enum-conversion -Wno-sign-compare -Wno-unused-pa=
rameter -DRANDSTRUCT -frandomize-layout-seed-file=3D./scripts/basic/randstr=
uct.seed -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wreturn-type -fun=
signed-char -Wundef -falign-functions=3D64 -Iblock -Iblock -DKBUILD_MODFILE=
=3D\"block/blk-rq-qos\" -DKBUILD_BASENAME=3D\"blk_rq_qos\" -DKBUILD_MODNAME=
=3D\"blk_rq_qos\" -D__KBUILD_MODNAME=3Dblk_rq_qos -c -o block/blk-rq-qos.o =
block/blk-rq-qos.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'block/blk-rq-qos.c'.
   4.	Running pass 'Branch Probability Basic Block Placement' on function '=
@rq_qos_wait'
    #0 0x0000559828d3bc1b llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-23+0x413cc1b)
    #1 0x0000559828d397e4 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
23+0x413a7e4)
    #2 0x0000559828c6c6a0 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007f23eca2ddf0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x00005598282f352f llvm::TailDuplicator::shouldTailDuplicate(bool, l=
lvm::MachineBasicBlock&) (.part.0) TailDuplicator.cpp:0:0
    #5 0x000055982800e5a9 (anonymous namespace)::MachineBlockPlacement::bui=
ldCFGChains() MachineBlockPlacement.cpp:0:0
    #6 0x00005598280136ad (anonymous namespace)::MachineBlockPlacement::run=
(llvm::MachineFunction&) MachineBlockPlacement.cpp:0:0
    #7 0x00005598280148b1 (anonymous namespace)::MachineBlockPlacementLegac=
y::runOnMachineFunction(llvm::MachineFunction&) (.part.0) MachineBlockPlace=
ment.cpp:0:0
    #8 0x0000559828062438 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-23+0x3463438)
    #9 0x0000559828629869 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-23+0x3a2a869)
   #10 0x0000559828629a0c llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-23+0x3a2aa0c)
   #11 0x0000559828628c78 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-23+0x3a29c78)
   #12 0x0000559829137071 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-23+0x4538071)
   #13 0x000055982977c6c7 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-23+0x4b7d6c7)
   #14 0x000055982b187adc clang::ParseAST(clang::Sema&, bool, bool) (clang-=
23+0x6588adc)
   #15 0x0000559829ad617a clang::FrontendAction::Execute() (clang-23+0x4ed7=
17a)
   #16 0x0000559829a4f3d6 clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-23+0x4e503d6)
   #17 0x0000559829bbf207 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-23+0x4fc0207)
   #18 0x0000559825b57a55 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-23+0xf58a55)
   #19 0x0000559825b4f763 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #20 0x0000559825b4f7a3 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #21 0x00005598297edde9 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #22 0x0000559828c6ca03 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-23+0x406da03)
   #23 0x00005598297ee514 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #24 0x00005598297ad668 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-23+0x4bae668)
   #25 0x00005598297ae5c2 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-23+0x4baf5c2)
   #26 0x00005598297bf7bc clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-23+0x4bc07bc)
   #27 0x0000559825b5440f clang_main(int, char**, llvm::ToolContext const&)=
 (clang-23+0xf5540f)
   #28 0x00005598259eabb9 main (clang-23+0xdebbb9)
   #29 0x00007f23eca17ca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #30 0x00007f23eca17d65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #31 0x0000559825b4f1a1 _start (clang-23+0xf501a1)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 3414820 Segmentation fault      clang -Wp,-MMD,block/=
.blk-rq-qos.o.d -nostdinc -Iarch/mips/include -I./arch/mips/include/generat=
ed -Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips/include/gen=
erated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linu=
x/compiler-version.h -include include/linux/kconfig.h -include include/linu=
x/compiler_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -fintegrated-as=
 -Werror=3Dunknown-warning-option -Werror=3Dignored-optimization-argument -=
Werror=3Doption-ignored -Werror=3Dunused-command-line-argument -DVMLINUX_LO=
AD_ADDRESS=3D0xffffffff80100000 -DLINKER_LOAD_ADDRESS=3D0x80100000 -DDATAOF=
FSET=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -fshort-wcha=
r -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -std=3Dgnu11 -f=
ms-anonymous-structs -Wno-gnu -Wno-microsoft-anon-tag -mno-check-zero-divis=
ion -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-fl=
oat -ffreestanding -EB -fno-omit-frame-pointer -fno-stack-check -march=3Dmi=
ps64 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-siby=
te -DSIBYTE_HDR_FEATURES=3DSIBYTE_HDR_FMASK_1250_112x_ALL -Iarch/mips/inclu=
de/asm/mach-generic -fno-asynchronous-unwind-tables -fno-delete-null-pointe=
r-checks -Os -fstack-protector-strong -fomit-frame-pointer -ftrivial-auto-v=
ar-init=3Dpattern -fexperimental-late-parse-attributes -fdiagnostics-show-i=
nlining-chain -fstrict-flex-arrays=3D3 -fno-strict-overflow -fno-stack-chec=
k -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=3Dimplicit-function-dec=
laration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prot=
otypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wno-address-=
of-packed-member -Wmissing-declarations -Wmissing-prototypes -Wno-format-ov=
erflow-non-kprintf -Wno-format-truncation-non-kprintf -Wno-default-const-in=
it-unsafe -Wno-type-limits -Wno-pointer-sign -Wcast-function-type -Wno-unte=
rminated-string-initialization -Wimplicit-fallthrough -Werror=3Ddate-time -=
Werror=3Dincompatible-pointer-types -Wenum-conversion -Wunused -Wmissing-fo=
rmat-attribute -Wmissing-include-dirs -Wunused-const-variable -Wno-missing-=
field-initializers -Wno-shift-negative-value -Wno-enum-enum-conversion -Wno=
-sign-compare -Wno-unused-parameter -DRANDSTRUCT -frandomize-layout-seed-fi=
le=3D./scripts/basic/randstruct.seed -fno-crash-diagnostics -Wno-error=3Dre=
turn-type -Wreturn-type -funsigned-char -Wundef -falign-functions=3D64 -Ibl=
ock -Iblock -DKBUILD_MODFILE=3D'"block/blk-rq-qos"' -DKBUILD_BASENAME=3D'"b=
lk_rq_qos"' -DKBUILD_MODNAME=3D'"blk_rq_qos"' -D__KBUILD_MODNAME=3Dblk_rq_q=
os -c -o block/blk-rq-qos.o block/blk-rq-qos.c
--
   drivers/md/raid5.c:4221:7: warning: variable 'qread' set but not used [-=
Wunused-but-set-variable]
    4221 |                 int qread =3D0;
         |                     ^
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,drivers/md/.raid5.o.d -nostdinc -Ia=
rch/mips/include -I./arch/mips/include/generated -Iinclude -I./include -Iar=
ch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi -I=
./include/generated/uapi -include include/linux/compiler-version.h -include=
 include/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL=
__ --target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknown-warning-op=
tion -Werror=3Dignored-optimization-argument -Werror=3Doption-ignored -Werr=
or=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xffffffff801000=
00 -DLINKER_LOAD_ADDRESS=3D0x80100000 -DDATAOFFSET=3D0 -fmacro-prefix-map=
=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -fshort-wchar -funsigned-char -fno-comm=
on -fno-PIE -fno-strict-aliasing -std=3Dgnu11 -fms-anonymous-structs -Wno-g=
nu -Wno-microsoft-anon-tag -mno-check-zero-division -mabi=3D32 -G 0 -mno-ab=
icalls -fno-pic -pipe -msoft-float -Wa,-msoft-float -ffreestanding -EB -fno=
-omit-frame-pointer -fno-stack-check -march=3Dmips64 -Wa,--trap -DTOOLCHAIN=
_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-sibyte -DSIBYTE_HDR_FEATURES=3DS=
IBYTE_HDR_FMASK_1250_112x_ALL -Iarch/mips/include/asm/mach-generic -fno-asy=
nchronous-unwind-tables -fno-delete-null-pointer-checks -Os -fstack-protect=
or-strong -fomit-frame-pointer -ftrivial-auto-var-init=3Dpattern -fexperime=
ntal-late-parse-attributes -fdiagnostics-show-inlining-chain -fstrict-flex-=
arrays=3D3 -fno-strict-overflow -fno-stack-check -fno-builtin-wcslen -Wall =
-Wextra -Wundef -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-=
int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-security =
-Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-d=
eclarations -Wmissing-prototypes -Wno-format-overflow-non-kprintf -Wno-form=
at-truncation-non-kprintf -Wno-default-const-init-unsafe -Wno-type-limits -=
Wno-pointer-sign -Wcast-function-type -Wno-unterminated-string-initializati=
on -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Dincompatible-pointe=
r-types -Wenum-conversion -Wunused -Wmissing-format-attribute -Wmissing-inc=
lude-dirs -Wunused-const-variable -Wno-missing-field-initializers -Wno-shif=
t-negative-value -Wno-enum-enum-conversion -Wno-sign-compare -Wno-unused-pa=
rameter -DRANDSTRUCT -frandomize-layout-seed-file=3D./scripts/basic/randstr=
uct.seed -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wreturn-type -fun=
signed-char -Wundef -falign-functions=3D64 -Idrivers/md -Idrivers/md -DMODU=
LE -mlong-calls -DKBUILD_BASENAME=3D\"raid5\" -DKBUILD_MODNAME=3D\"raid456\=
" -D__KBUILD_MODNAME=3Draid456 -c -o drivers/md/raid5.o drivers/md/raid5.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'drivers/md/raid5.c'.
   4.	Running pass 'Branch Probability Basic Block Placement' on function '=
@raid5_release_stripe'
    #0 0x000055e88d468c1b llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-23+0x413cc1b)
    #1 0x000055e88d4667e4 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
23+0x413a7e4)
    #2 0x000055e88d3996a0 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007f6bf3b0cdf0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x000055e88ca2052f llvm::TailDuplicator::shouldTailDuplicate(bool, l=
lvm::MachineBasicBlock&) (.part.0) TailDuplicator.cpp:0:0
    #5 0x000055e88c73d97f (anonymous namespace)::MachineBlockPlacement::run=
(llvm::MachineFunction&) MachineBlockPlacement.cpp:0:0
    #6 0x000055e88c7418b1 (anonymous namespace)::MachineBlockPlacementLegac=
y::runOnMachineFunction(llvm::MachineFunction&) (.part.0) MachineBlockPlace=
ment.cpp:0:0
    #7 0x000055e88c78f438 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-23+0x3463438)
    #8 0x000055e88cd56869 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-23+0x3a2a869)
    #9 0x000055e88cd56a0c llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-23+0x3a2aa0c)
   #10 0x000055e88cd55c78 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-23+0x3a29c78)
   #11 0x000055e88d864071 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-23+0x4538071)
   #12 0x000055e88dea96c7 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-23+0x4b7d6c7)
   #13 0x000055e88f8b4adc clang::ParseAST(clang::Sema&, bool, bool) (clang-=
23+0x6588adc)
   #14 0x000055e88e20317a clang::FrontendAction::Execute() (clang-23+0x4ed7=
17a)
   #15 0x000055e88e17c3d6 clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-23+0x4e503d6)
   #16 0x000055e88e2ec207 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-23+0x4fc0207)
   #17 0x000055e88a284a55 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-23+0xf58a55)
   #18 0x000055e88a27c763 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #19 0x000055e88a27c7a3 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #20 0x000055e88df1ade9 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #21 0x000055e88d399a03 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-23+0x406da03)
   #22 0x000055e88df1b514 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #23 0x000055e88deda668 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-23+0x4bae668)
   #24 0x000055e88dedb5c2 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-23+0x4baf5c2)
   #25 0x000055e88deec7bc clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-23+0x4bc07bc)
   #26 0x000055e88a28140f clang_main(int, char**, llvm::ToolContext const&)=
 (clang-23+0xf5540f)
   #27 0x000055e88a117bb9 main (clang-23+0xdebbb9)
   #28 0x00007f6bf3af6ca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #29 0x00007f6bf3af6d65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #30 0x000055e88a27c1a1 _start (clang-23+0xf501a1)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 3427175 Segmentation fault      clang -Wp,-MMD,driver=
s/md/.raid5.o.d -nostdinc -Iarch/mips/include -I./arch/mips/include/generat=
ed -Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips/include/gen=
erated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linu=
x/compiler-version.h -include include/linux/kconfig.h -include include/linu=
x/compiler_types.h -D__KERNEL__ --target=3Dmipsel-linux-gnu -fintegrated-as=
 -Werror=3Dunknown-warning-option -Werror=3Dignored-optimization-argument -=
Werror=3Doption-ignored -Werror=3Dunused-command-line-argument -DVMLINUX_LO=
AD_ADDRESS=3D0xffffffff80100000 -DLINKER_LOAD_ADDRESS=3D0x80100000 -DDATAOF=
FSET=3D0 -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -fshort-wcha=
r -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -std=3Dgnu11 -f=
ms-anonymous-structs -Wno-gnu -Wno-microsoft-anon-tag -mno-check-zero-divis=
ion -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-fl=
oat -ffreestanding -EB -fno-omit-frame-pointer -fno-stack-check -march=3Dmi=
ps64 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-siby=
te -DSIBYTE_HDR_FEATURES=3DSIBYTE_HDR_FMASK_1250_112x_ALL -Iarch/mips/inclu=
de/asm/mach-generic -fno-asynchronous-unwind-tables -fno-delete-null-pointe=
r-checks -Os -fstack-protector-strong -fomit-frame-pointer -ftrivial-auto-v=
ar-init=3Dpattern -fexperimental-late-parse-attributes -fdiagnostics-show-i=
nlining-chain -fstrict-flex-arrays=3D3 -fno-strict-overflow -fno-stack-chec=
k -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=3Dimplicit-function-dec=
laration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prot=
otypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wno-address-=
of-packed-member -Wmissing-declarations -Wmissing-prototypes -Wno-format-ov=
erflow-non-kprintf -Wno-format-truncation-non-kprintf -Wno-default-const-in=
it-unsafe -Wno-type-limits -Wno-pointer-sign -Wcast-function-type -Wno-unte=
rminated-string-initialization -Wimplicit-fallthrough -Werror=3Ddate-time -=
Werror=3Dincompatible-pointer-types -Wenum-conversion -Wunused -Wmissing-fo=
rmat-attribute -Wmissing-include-dirs -Wunused-const-variable -Wno-missing-=
field-initializers -Wno-shift-negative-value -Wno-enum-enum-conversion -Wno=
-sign-compare -Wno-unused-parameter -DRANDSTRUCT -frandomize-layout-seed-fi=
le=3D./scripts/basic/randstruct.seed -fno-crash-diagnostics -Wno-error=3Dre=
turn-type -Wreturn-type -funsigned-char -Wundef -falign-functions=3D64 -Idr=
ivers/md -Idrivers/md -DMODULE -mlong-calls -DKBUILD_BASENAME=3D'"raid5"' -=
DKBUILD_MODNAME=3D'"raid456"' -D__KBUILD_MODNAME=3Draid456 -c -o drivers/md=
/raid5.o drivers/md/raid5.c

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
