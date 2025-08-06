Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B111C5D44
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Aug 2025 12:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754481725; cv=none; b=TMyv8pjoJTseKouo1c/Zt/vcr8SnLlQ7gkVxRMgp2XszzHJURoEBM8PA4o2G9LQH9sS/j2hkb54WPa1+vzpsESynfjE0YVPur6ROugfGwNtphDMzy0XYtFQQ3lz0ghSh6ukATtxXNzqq1zirbrGceMvcq+uV70Ak1SJ93e+B/NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754481725; c=relaxed/simple;
	bh=UK24j3v+YmN19ROxtF7OdQ/uPmZhzGVGRyh4Irg+l5k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gs3WgLYNZuBZ8+8h1X4xUi2TE4MhrpPcdD9uON4Ca6MY1JJhcT9KK+vM80uo9NCFK8zBLFC3jv0uUPPwiuMJ//KyuZI7pgScpVfLPJwisVqiJxm/SfqDAZoR+/dg53gUxGZN6STr5KLdCziDrajWU+7Js8cbiFS5pOX1smThsQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g6G85weC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g6G85weC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754481722; x=1786017722;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=UK24j3v+YmN19ROxtF7OdQ/uPmZhzGVGRyh4Irg+l5k=;
  b=g6G85weC98FpbNshJjHA4cFmSQYVHPmCPjVYgtyo3iCF9qnX4AX6Xp+f
   GQeyIEPW2KP93ZgGJgH9o5lJIDjXHKHb9Xl4CeFGNsdAZtRrJzXwALPEj
   r1j5w3qoGQTT0zwZ6kIFcypCvEOAH3+GQpUd/Rv4Wjc4HqRaMYAKhbiAe
   Xu9qDu+PoF6Pennp1SJNPqJP2N+sFr8Cipw3PJtYYHe2EO4JxNxCbmR1W
   yWAS4tkBoTnsWGDp2fEQs0x1X+paP61Xp/U1ksM8p/PV6WMdWYEQOH6un
   PG2eygcNx1EYvVxozRHPl40Z0CFZwj5UE9W2Chp8TRyngzgkRvAskLz4+
   g==;
X-CSE-ConnectionGUID: mRnkRnWZRNq0IeNcT1iBFA==
X-CSE-MsgGUID: KS5AlJUMRwKDagTPAmbSmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="60635468"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="60635468"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 05:02:02 -0700
X-CSE-ConnectionGUID: zf7JslGoTSmgxwbHWpcsxw==
X-CSE-MsgGUID: K97ZQ737QVKxsyB18YoMPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="169206880"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 06 Aug 2025 05:02:00 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujcpv-0001cE-1N;
	Wed, 06 Aug 2025 12:01:43 +0000
Date: Wed, 6 Aug 2025 20:00:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 11376/13338] clang: error: clang frontend command
 failed with exit code 139 (use -v to see invocation)
Message-ID: <202508061925.bEevCphN-lkp@intel.com>
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
CC: llvm@lists.linux.dev
BCC: lkp@intel.com

TO: Matthew Brost <matthew.brost@intel.com>
CC: Stuart Summers <stuart.summers@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   b7d4e259682caccb51a25283655f2c8f02e32d23
commit: 535c445eb94c9abce3350aa61424fc34b8138ee8 [11376/13338] drm/xe: Add =
dependency scheduler for GT TLB invalidations to bind queues
:::::: branch date: 8 hours ago
:::::: commit date: 12 days ago
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20250806/2=
02508061925.bEevCphN-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd7080=
29e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250806/202508061925.bEevCphN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508061925.bEevCphN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xe/xe_exec_queue.c:6:
   In file included from drivers/gpu/drm/xe/xe_exec_queue.h:9:
   In file included from drivers/gpu/drm/xe/xe_exec_queue_types.h:14:
   In file included from drivers/gpu/drm/xe/xe_hw_engine_types.h:10:
   In file included from drivers/gpu/drm/xe/xe_lrc_types.h:11:
   In file included from drivers/gpu/drm/xe/xe_hw_fence_types.h:10:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + p=
ort;
         |                                                   ~~~~~~~~~~ ^
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,drivers/gpu/drm/xe/.xe_exec_queue.o=
=2Ed -nostdinc -Iarch/um/include -I./arch/um/include/generated -Iinclude -I=
=2E/include -Iarch/um/include/uapi -I./arch/um/include/generated/uapi -Iinc=
lude/uapi -I./include/generated/uapi -include include/linux/compiler-versio=
n.h -include include/linux/kconfig.h -include include/linux/compiler_types.=
h -D__KERNEL__ --target=3Dx86_64-linux-gnu -fintegrated-as -Werror=3Dunknow=
n-warning-option -Werror=3Dignored-optimization-argument -Werror=3Doption-i=
gnored -Werror=3Dunused-command-line-argument -m64 -Iarch/x86/um -Iarch/x86=
/include -Iarch/x86/include/uapi -I./arch/x86/include/generated -I./arch/x8=
6/include/generated/uapi -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WA=
RN1 -std=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-st=
rict-aliasing -mcmodel=3Dlarge -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-=
avx -fno-builtin -m64 -D__arch_um__ -Iarch/um/include/shared -Iarch/x86/um/=
shared -Iarch/um/include/shared/skas -Dvmap=3Dkernel_vmap -Dlongjmp=3Dkerne=
l_longjmp -Dsetjmp=3Dkernel_setjmp -Din6addr_loopback=3Dkernel_in6addr_loop=
back -Din6addr_any=3Dkernel_in6addr_any -Dstrrchr=3Dkernel_strrchr -D__clos=
e_range=3Dkernel__close_range -D_LARGEFILE64_SOURCE -Derrno=3Dkernel_errno =
-Dsigprocmask=3Dkernel_sigprocmask -Dmktime=3Dkernel_mktime -fno-delete-nul=
l-pointer-checks -O2 -fno-stack-protector -fno-omit-frame-pointer -fno-opti=
mize-sibling-calls -ftrivial-auto-var-init=3Dpattern -fno-stack-clash-prote=
ction -fzero-call-used-regs=3Dused-gpr -falign-functions=3D64 -fstrict-flex=
-arrays=3D3 -fno-strict-overflow -fno-stack-check -fno-builtin-wcslen -Wall=
 -Wextra -Wundef -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit=
-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-security=
 -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-=
declarations -Wmissing-prototypes -Wframe-larger-than=3D2048 -Wno-gnu -Wno-=
format-overflow-non-kprintf -Wno-format-truncation-non-kprintf -Wno-pointer=
-sign -Wcast-function-type -Wimplicit-fallthrough -Werror=3Ddate-time -Werr=
or=3Dincompatible-pointer-types -Wenum-conversion -Wunused -Wmissing-format=
-attribute -Wmissing-include-dirs -Wunused-const-variable -Wno-missing-fiel=
d-initializers -Wno-type-limits -Wno-shift-negative-value -Wno-enum-enum-co=
nversion -Wno-sign-compare -Wno-unused-parameter -DRANDSTRUCT -frandomize-l=
ayout-seed-file=3D./scripts/basic/randstruct.seed -fno-crash-diagnostics -W=
no-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -Wextra -Wunus=
ed -Wno-unused-parameter -Wmissing-format-attribute -Wold-style-definition =
-Wmissing-include-dirs -Wunused-but-set-variable -Wunused-const-variable -W=
format-overflow -Wno-missing-field-initializers -Wno-type-limits -Wno-shift=
-negative-value -Wno-sign-compare -Wformat-truncation -Idrivers/gpu/drm/xe =
-Idrivers/gpu/drm/xe -fsanitize=3Dkernel-address -mllvm -asan-mapping-offse=
t=3D0x100000000000 -mllvm -asan-instrumentation-with-call-threshold=3D10000=
 -mllvm -asan-stack=3D0 -mllvm -asan-globals=3D1 -mllvm -asan-kernel-mem-in=
trinsic-prefix=3D1 -fsanitize=3Darray-bounds -fsanitize=3Dshift -fsanitize=
=3Dunreachable -fsanitize=3Dbool -fsanitize=3Denum -fsanitize-coverage=3Dtr=
ace-pc -fsanitize-coverage=3Dtrace-cmp -Idrivers/gpu/drm/xe -Idrivers/gpu/d=
rm/xe -DMODULE -DKBUILD_BASENAME=3D\"xe_exec_queue\" -DKBUILD_MODNAME=3D\"x=
e\" -D__KBUILD_MODNAME=3Dkmod_xe -c -o drivers/gpu/drm/xe/xe_exec_queue.o d=
rivers/gpu/drm/xe/xe_exec_queue.c
   1.	drivers/gpu/drm/xe/xe_exec_queue.c:355:1: current parser token 'void'
   2.	drivers/gpu/drm/xe/xe_exec_queue.c:337:6: LLVM IR generation of decla=
ration 'xe_exec_queue_fini'
   3.	drivers/gpu/drm/xe/xe_exec_queue.c:337:6: Generating code for declara=
tion 'xe_exec_queue_fini'
    #0 0x000055f750c7e59b llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-19+0x391359b)
    #1 0x000055f750c7c534 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
19+0x3911534)
    #2 0x000055f750bcce08 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007fd130318050 (/lib/x86_64-linux-gnu/libc.so.6+0x3c050)
    #4 0x000055f75415fbbb clang::ASTContext::getASTRecordLayout(clang::Reco=
rdDecl const*) const (clang-19+0x6df4bbb)
    #5 0x000055f751350ea0 getFieldOffsetInBits(clang::CodeGen::CodeGenFunct=
ion&, clang::RecordDecl const*, clang::FieldDecl const*, long&) CGExpr.cpp:=
0:0
    #6 0x000055f751350ed9 getFieldOffsetInBits(clang::CodeGen::CodeGenFunct=
ion&, clang::RecordDecl const*, clang::FieldDecl const*, long&) CGExpr.cpp:=
0:0
    #7 0x000055f751350ed9 getFieldOffsetInBits(clang::CodeGen::CodeGenFunct=
ion&, clang::RecordDecl const*, clang::FieldDecl const*, long&) CGExpr.cpp:=
0:0
    #8 0x000055f751378e24 clang::CodeGen::CodeGenFunction::EmitArraySubscri=
ptExpr(clang::ArraySubscriptExpr const*, bool) (clang-19+0x400de24)
    #9 0x000055f75137b022 clang::CodeGen::CodeGenFunction::EmitCheckedLValu=
e(clang::Expr const*, clang::CodeGen::CodeGenFunction::TypeCheckKind) (clan=
g-19+0x4010022)
   #10 0x000055f7513c6eee (anonymous namespace)::ScalarExprEmitter::EmitLoa=
dOfLValue(clang::Expr const*) CGExprScalar.cpp:0:0
   #11 0x000055f7513c383a (anonymous namespace)::ScalarExprEmitter::Visit(c=
lang::Expr*) CGExprScalar.cpp:0:0
   #12 0x000055f7513c72cb (anonymous namespace)::ScalarExprEmitter::VisitCa=
stExpr(clang::CastExpr*) CGExprScalar.cpp:0:0
   #13 0x000055f7513c691f clang::CodeGen::CodeGenFunction::EmitScalarExpr(c=
lang::Expr const*, bool) (clang-19+0x405b91f)
   #14 0x000055f751363397 clang::CodeGen::CodeGenFunction::EmitAnyExpr(clan=
g::Expr const*, clang::CodeGen::AggValueSlot, bool) (clang-19+0x3ff8397)
   #15 0x000055f751363633 clang::CodeGen::CodeGenFunction::EmitAnyExprToTem=
p(clang::Expr const*) (clang-19+0x3ff8633)
   #16 0x000055f7512e2088 clang::CodeGen::CodeGenFunction::EmitCallArg(clan=
g::CodeGen::CallArgList&, clang::Expr const*, clang::QualType) (clang-19+0x=
3f77088)
   #17 0x000055f7512e3fb4 clang::CodeGen::CodeGenFunction::EmitCallArgs(cla=
ng::CodeGen::CallArgList&, clang::CodeGen::CodeGenFunction::PrototypeWrappe=
r, llvm::iterator_range<clang::Stmt::CastIterator<clang::Expr, clang::Expr =
const* const, clang::Stmt const* const>>, clang::CodeGen::CodeGenFunction::=
AbstractCallee, unsigned int, clang::CodeGen::CodeGenFunction::EvaluationOr=
der) (clang-19+0x3f78fb4)
   #18 0x000055f75136e408 clang::CodeGen::CodeGenFunction::EmitCall(clang::=
QualType, clang::CodeGen::CGCallee const&, clang::CallExpr const*, clang::C=
odeGen::ReturnValueSlot, llvm::Value*) (clang-19+0x4003408)
   #19 0x000055f75136f516 clang::CodeGen::CodeGenFunction::EmitCallExpr(cla=
ng::CallExpr const*, clang::CodeGen::ReturnValueSlot) (clang-19+0x4004516)
   #20 0x000055f7513c98e6 (anonymous namespace)::ScalarExprEmitter::VisitCa=
llExpr(clang::CallExpr const*) CGExprScalar.cpp:0:0
   #21 0x000055f7513c691f clang::CodeGen::CodeGenFunction::EmitScalarExpr(c=
lang::Expr const*, bool) (clang-19+0x405b91f)
   #22 0x000055f751363397 clang::CodeGen::CodeGenFunction::EmitAnyExpr(clan=
g::Expr const*, clang::CodeGen::AggValueSlot, bool) (clang-19+0x3ff8397)
   #23 0x000055f75136de67 clang::CodeGen::CodeGenFunction::EmitIgnoredExpr(=
clang::Expr const*) (clang-19+0x4002e67)
   #24 0x000055f750f81c62 clang::CodeGen::CodeGenFunction::EmitStmt(clang::=
Stmt const*, llvm::ArrayRef<clang::Attr const*>) (clang-19+0x3c16c62)
   #25 0x000055f750f85b53 clang::CodeGen::CodeGenFunction::EmitForStmt(clan=
g::ForStmt const&, llvm::ArrayRef<clang::Attr const*>) (clang-19+0x3c1ab53)
   #26 0x000055f750f885f9 clang::CodeGen::CodeGenFunction::EmitCompoundStmt=
WithoutScope(clang::CompoundStmt const&, bool, clang::CodeGen::AggValueSlot=
) (clang-19+0x3c1d5f9)
   #27 0x000055f750fe5fab clang::CodeGen::CodeGenFunction::EmitFunctionBody=
(clang::Stmt const*) (clang-19+0x3c7afab)
   #28 0x000055f750ff8824 clang::CodeGen::CodeGenFunction::GenerateCode(cla=
ng::GlobalDecl, llvm::Function*, clang::CodeGen::CGFunctionInfo const&) (cl=
ang-19+0x3c8d824)
   #29 0x000055f75103c852 clang::CodeGen::CodeGenModule::EmitGlobalFunction=
Definition(clang::GlobalDecl, llvm::GlobalValue*) (clang-19+0x3cd1852)
   #30 0x000055f751037f4c clang::CodeGen::CodeGenModule::EmitGlobalDefiniti=
on(clang::GlobalDecl, llvm::GlobalValue*) (clang-19+0x3cccf4c)
   #31 0x000055f751038603 clang::CodeGen::CodeGenModule::EmitGlobal(clang::=
GlobalDecl) (clang-19+0x3ccd603)
   #32 0x000055f751040807 clang::CodeGen::CodeGenModule::EmitTopLevelDecl(c=
lang::Decl*) (.part.0) CodeGenModule.cpp:0:0
   #33 0x000055f7514e7100 (anonymous namespace)::CodeGeneratorImpl::HandleT=
opLevelDecl(clang::DeclGroupRef) ModuleBuilder.cpp:0:0
   #34 0x000055f7514d9255 clang::BackendConsumer::HandleTopLevelDecl(clang:=
:DeclGroupRef) (clang-19+0x416e255)
   #35 0x000055f752db4edc clang::ParseAST(clang::Sema&, bool, bool) (clang-=
19+0x5a49edc)
   #36 0x000055f75178fdb1 clang::FrontendAction::Execute() (clang-19+0x4424=
db1)
   #37 0x000055f751707c3b clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-19+0x439cc3b)
   #38 0x000055f751854237 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-19+0x44e9237)
   #39 0x000055f74e26faca cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-19+0xf04aca)
   #40 0x000055f74e269dca ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&) driver.cpp:0:0
   #41 0x000055f75152ea19 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #42 0x000055f750bcd1d3 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-19+0x38621d3)
   #43 0x000055f75152eda9 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #44 0x000055f7514f5e25 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-19+0x418ae25)
   #45 0x000055f7514f684d clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-19+0x418b84d)
   #46 0x000055f7515085ac clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-19+0x419d5ac)
   #47 0x000055f74e26cfbc clang_main(int, char**, llvm::ToolContext const&)=
 (clang-19+0xf01fbc)
   #48 0x000055f74e14ec93 main (clang-19+0xde3c93)
   #49 0x00007fd13030324a (/lib/x86_64-linux-gnu/libc.so.6+0x2724a)
   #50 0x00007fd130303305 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x27305)
   #51 0x000055f74e2695c1 _start (clang-19+0xefe5c1)
>> clang: error: clang frontend command failed with exit code 139 (use -v t=
o see invocation)
--
   In file included from drivers/gpu/drm/xe/xe_execlist.c:6:
   In file included from drivers/gpu/drm/xe/xe_execlist.h:9:
   In file included from drivers/gpu/drm/xe/xe_execlist_types.h:13:
   In file included from drivers/gpu/drm/xe/xe_exec_queue_types.h:14:
   In file included from drivers/gpu/drm/xe/xe_hw_engine_types.h:10:
   In file included from drivers/gpu/drm/xe/xe_lrc_types.h:11:
   In file included from drivers/gpu/drm/xe/xe_hw_fence_types.h:10:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + p=
ort;
         |                                                   ~~~~~~~~~~ ^
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,drivers/gpu/drm/xe/.xe_execlist.o.d=
 -nostdinc -Iarch/um/include -I./arch/um/include/generated -Iinclude -I./in=
clude -Iarch/um/include/uapi -I./arch/um/include/generated/uapi -Iinclude/u=
api -I./include/generated/uapi -include include/linux/compiler-version.h -i=
nclude include/linux/kconfig.h -include include/linux/compiler_types.h -D__=
KERNEL__ --target=3Dx86_64-linux-gnu -fintegrated-as -Werror=3Dunknown-warn=
ing-option -Werror=3Dignored-optimization-argument -Werror=3Doption-ignored=
 -Werror=3Dunused-command-line-argument -m64 -Iarch/x86/um -Iarch/x86/inclu=
de -Iarch/x86/include/uapi -I./arch/x86/include/generated -I./arch/x86/incl=
ude/generated/uapi -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -s=
td=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-a=
liasing -mcmodel=3Dlarge -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -f=
no-builtin -m64 -D__arch_um__ -Iarch/um/include/shared -Iarch/x86/um/shared=
 -Iarch/um/include/shared/skas -Dvmap=3Dkernel_vmap -Dlongjmp=3Dkernel_long=
jmp -Dsetjmp=3Dkernel_setjmp -Din6addr_loopback=3Dkernel_in6addr_loopback -=
Din6addr_any=3Dkernel_in6addr_any -Dstrrchr=3Dkernel_strrchr -D__close_rang=
e=3Dkernel__close_range -D_LARGEFILE64_SOURCE -Derrno=3Dkernel_errno -Dsigp=
rocmask=3Dkernel_sigprocmask -Dmktime=3Dkernel_mktime -fno-delete-null-poin=
ter-checks -O2 -fno-stack-protector -fno-omit-frame-pointer -fno-optimize-s=
ibling-calls -ftrivial-auto-var-init=3Dpattern -fno-stack-clash-protection =
-fzero-call-used-regs=3Dused-gpr -falign-functions=3D64 -fstrict-flex-array=
s=3D3 -fno-strict-overflow -fno-stack-check -fno-builtin-wcslen -Wall -Wext=
ra -Wundef -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -=
Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-security -Wno-=
trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-declar=
ations -Wmissing-prototypes -Wframe-larger-than=3D2048 -Wno-gnu -Wno-format=
-overflow-non-kprintf -Wno-format-truncation-non-kprintf -Wno-pointer-sign =
-Wcast-function-type -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Di=
ncompatible-pointer-types -Wenum-conversion -Wunused -Wmissing-format-attri=
bute -Wmissing-include-dirs -Wunused-const-variable -Wno-missing-field-init=
ializers -Wno-type-limits -Wno-shift-negative-value -Wno-enum-enum-conversi=
on -Wno-sign-compare -Wno-unused-parameter -DRANDSTRUCT -frandomize-layout-=
seed-file=3D./scripts/basic/randstruct.seed -fno-crash-diagnostics -Wno-err=
or=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -Wextra -Wunused -Wn=
o-unused-parameter -Wmissing-format-attribute -Wold-style-definition -Wmiss=
ing-include-dirs -Wunused-but-set-variable -Wunused-const-variable -Wformat=
-overflow -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-negat=
ive-value -Wno-sign-compare -Wformat-truncation -Idrivers/gpu/drm/xe -Idriv=
ers/gpu/drm/xe -fsanitize=3Dkernel-address -mllvm -asan-mapping-offset=3D0x=
100000000000 -mllvm -asan-instrumentation-with-call-threshold=3D10000 -mllv=
m -asan-stack=3D0 -mllvm -asan-globals=3D1 -mllvm -asan-kernel-mem-intrinsi=
c-prefix=3D1 -fsanitize=3Darray-bounds -fsanitize=3Dshift -fsanitize=3Dunre=
achable -fsanitize=3Dbool -fsanitize=3Denum -fsanitize-coverage=3Dtrace-pc =
-fsanitize-coverage=3Dtrace-cmp -Idrivers/gpu/drm/xe -Idrivers/gpu/drm/xe -=
DMODULE -DKBUILD_BASENAME=3D\"xe_execlist\" -DKBUILD_MODNAME=3D\"xe\" -D__K=
BUILD_MODNAME=3Dkmod_xe -c -o drivers/gpu/drm/xe/xe_execlist.o drivers/gpu/=
drm/xe/xe_execlist.c
   1.	<eof> parser at end of file
   2.	Per-file LLVM IR generation
   3.	drivers/gpu/drm/xe/xe_execlist.c:136:13: Generating code for declarat=
ion 'xe_execlist_is_idle'
    #0 0x000055d50955059b llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-19+0x391359b)
    #1 0x000055d50954e534 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
19+0x3911534)
    #2 0x000055d50949ee08 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007fdafeaae050 (/lib/x86_64-linux-gnu/libc.so.6+0x3c050)
    #4 0x000055d50ca31bbb clang::ASTContext::getASTRecordLayout(clang::Reco=
rdDecl const*) const (clang-19+0x6df4bbb)
    #5 0x000055d509c22ea0 getFieldOffsetInBits(clang::CodeGen::CodeGenFunct=
ion&, clang::RecordDecl const*, clang::FieldDecl const*, long&) CGExpr.cpp:=
0:0
    #6 0x000055d509c22ed9 getFieldOffsetInBits(clang::CodeGen::CodeGenFunct=
ion&, clang::RecordDecl const*, clang::FieldDecl const*, long&) CGExpr.cpp:=
0:0
    #7 0x000055d509c22ed9 getFieldOffsetInBits(clang::CodeGen::CodeGenFunct=
ion&, clang::RecordDecl const*, clang::FieldDecl const*, long&) CGExpr.cpp:=
0:0
    #8 0x000055d509c4ae24 clang::CodeGen::CodeGenFunction::EmitArraySubscri=
ptExpr(clang::ArraySubscriptExpr const*, bool) (clang-19+0x400de24)
    #9 0x000055d509c4d022 clang::CodeGen::CodeGenFunction::EmitCheckedLValu=
e(clang::Expr const*, clang::CodeGen::CodeGenFunction::TypeCheckKind) (clan=
g-19+0x4010022)
   #10 0x000055d509c98eee (anonymous namespace)::ScalarExprEmitter::EmitLoa=
dOfLValue(clang::Expr const*) CGExprScalar.cpp:0:0
   #11 0x000055d509c9583a (anonymous namespace)::ScalarExprEmitter::Visit(c=
lang::Expr*) CGExprScalar.cpp:0:0
   #12 0x000055d509c992cb (anonymous namespace)::ScalarExprEmitter::VisitCa=
stExpr(clang::CastExpr*) CGExprScalar.cpp:0:0
   #13 0x000055d509c9891f clang::CodeGen::CodeGenFunction::EmitScalarExpr(c=
lang::Expr const*, bool) (clang-19+0x405b91f)
   #14 0x000055d509bf96b7 clang::CodeGen::CodeGenFunction::EmitScalarInit(c=
lang::Expr const*, clang::ValueDecl const*, clang::CodeGen::LValue, bool) (=
clang-19+0x3fbc6b7)
   #15 0x000055d509bfab7f clang::CodeGen::CodeGenFunction::EmitExprAsInit(c=
lang::Expr const*, clang::ValueDecl const*, clang::CodeGen::LValue, bool) (=
clang-19+0x3fbdb7f)
   #16 0x000055d509c05f2f clang::CodeGen::CodeGenFunction::EmitAutoVarInit(=
clang::CodeGen::CodeGenFunction::AutoVarEmission const&) (clang-19+0x3fc8f2=
f)
   #17 0x000055d509c080dc clang::CodeGen::CodeGenFunction::EmitVarDecl(clan=
g::VarDecl const&) (.part.0) CGDecl.cpp:0:0
   #18 0x000055d509c084e5 clang::CodeGen::CodeGenFunction::EmitDecl(clang::=
Decl const&) (clang-19+0x3fcb4e5)
   #19 0x000055d509847b3f clang::CodeGen::CodeGenFunction::EmitDeclStmt(cla=
ng::DeclStmt const&) (clang-19+0x3c0ab3f)
   #20 0x000055d50985abe5 clang::CodeGen::CodeGenFunction::EmitSimpleStmt(c=
lang::Stmt const*, llvm::ArrayRef<clang::Attr const*>) (clang-19+0x3c1dbe5)
   #21 0x000055d509853bd2 clang::CodeGen::CodeGenFunction::EmitStmt(clang::=
Stmt const*, llvm::ArrayRef<clang::Attr const*>) (clang-19+0x3c16bd2)
   #22 0x000055d50985a5f9 clang::CodeGen::CodeGenFunction::EmitCompoundStmt=
WithoutScope(clang::CompoundStmt const&, bool, clang::CodeGen::AggValueSlot=
) (clang-19+0x3c1d5f9)
   #23 0x000055d5098b7fab clang::CodeGen::CodeGenFunction::EmitFunctionBody=
(clang::Stmt const*) (clang-19+0x3c7afab)
   #24 0x000055d5098ca824 clang::CodeGen::CodeGenFunction::GenerateCode(cla=
ng::GlobalDecl, llvm::Function*, clang::CodeGen::CGFunctionInfo const&) (cl=
ang-19+0x3c8d824)
   #25 0x000055d50990e852 clang::CodeGen::CodeGenModule::EmitGlobalFunction=
Definition(clang::GlobalDecl, llvm::GlobalValue*) (clang-19+0x3cd1852)
   #26 0x000055d509909f4c clang::CodeGen::CodeGenModule::EmitGlobalDefiniti=
on(clang::GlobalDecl, llvm::GlobalValue*) (clang-19+0x3cccf4c)
   #27 0x000055d50991382c clang::CodeGen::CodeGenModule::EmitDeferred() (cl=
ang-19+0x3cd682c)
   #28 0x000055d509913844 clang::CodeGen::CodeGenModule::EmitDeferred() (cl=
ang-19+0x3cd6844)
   #29 0x000055d509913844 clang::CodeGen::CodeGenModule::EmitDeferred() (cl=
ang-19+0x3cd6844)
   #30 0x000055d509913844 clang::CodeGen::CodeGenModule::EmitDeferred() (cl=
ang-19+0x3cd6844)
   #31 0x000055d5099145ac clang::CodeGen::CodeGenModule::Release() (clang-1=
9+0x3cd75ac)
   #32 0x000055d509db89de (anonymous namespace)::CodeGeneratorImpl::HandleT=
ranslationUnit(clang::ASTContext&) ModuleBuilder.cpp:0:0
   #33 0x000055d509db66d5 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-19+0x41796d5)
   #34 0x000055d50b68713c clang::ParseAST(clang::Sema&, bool, bool) (clang-=
19+0x5a4a13c)
   #35 0x000055d50a061db1 clang::FrontendAction::Execute() (clang-19+0x4424=
db1)
   #36 0x000055d509fd9c3b clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-19+0x439cc3b)
   #37 0x000055d50a126237 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-19+0x44e9237)
   #38 0x000055d506b41aca cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-19+0xf04aca)
   #39 0x000055d506b3bdca ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&) driver.cpp:0:0
   #40 0x000055d509e00a19 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #41 0x000055d50949f1d3 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-19+0x38621d3)
   #42 0x000055d509e00da9 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #43 0x000055d509dc7e25 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-19+0x418ae25)
   #44 0x000055d509dc884d clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-19+0x418b84d)
   #45 0x000055d509dda5ac clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-19+0x419d5ac)
   #46 0x000055d506b3efbc clang_main(int, char**, llvm::ToolContext const&)=
 (clang-19+0xf01fbc)
   #47 0x000055d506a20c93 main (clang-19+0xde3c93)
   #48 0x00007fdafea9924a (/lib/x86_64-linux-gnu/libc.so.6+0x2724a)
   #49 0x00007fdafea99305 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x27305)
   #50 0x000055d506b3b5c1 _start (clang-19+0xefe5c1)
>> clang: error: clang frontend command failed with exit code 139 (use -v t=
o see invocation)
--
   In file included from drivers/gpu/drm/xe/xe_gt.c:6:
   In file included from drivers/gpu/drm/xe/xe_gt.h:11:
   In file included from include/drm/drm_util.h:35:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + p=
ort;
         |                                                   ~~~~~~~~~~ ^
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,drivers/gpu/drm/xe/.xe_gt.o.d -nost=
dinc -Iarch/um/include -I./arch/um/include/generated -Iinclude -I./include =
-Iarch/um/include/uapi -I./arch/um/include/generated/uapi -Iinclude/uapi -I=
=2E/include/generated/uapi -include include/linux/compiler-version.h -inclu=
de include/linux/kconfig.h -include include/linux/compiler_types.h -D__KERN=
EL__ --target=3Dx86_64-linux-gnu -fintegrated-as -Werror=3Dunknown-warning-=
option -Werror=3Dignored-optimization-argument -Werror=3Doption-ignored -We=
rror=3Dunused-command-line-argument -m64 -Iarch/x86/um -Iarch/x86/include -=
Iarch/x86/include/uapi -I./arch/x86/include/generated -I./arch/x86/include/=
generated/uapi -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=
=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-ali=
asing -mcmodel=3Dlarge -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -fno=
-builtin -m64 -D__arch_um__ -Iarch/um/include/shared -Iarch/x86/um/shared -=
Iarch/um/include/shared/skas -Dvmap=3Dkernel_vmap -Dlongjmp=3Dkernel_longjm=
p -Dsetjmp=3Dkernel_setjmp -Din6addr_loopback=3Dkernel_in6addr_loopback -Di=
n6addr_any=3Dkernel_in6addr_any -Dstrrchr=3Dkernel_strrchr -D__close_range=
=3Dkernel__close_range -D_LARGEFILE64_SOURCE -Derrno=3Dkernel_errno -Dsigpr=
ocmask=3Dkernel_sigprocmask -Dmktime=3Dkernel_mktime -fno-delete-null-point=
er-checks -O2 -fno-stack-protector -fno-omit-frame-pointer -fno-optimize-si=
bling-calls -ftrivial-auto-var-init=3Dpattern -fno-stack-clash-protection -=
fzero-call-used-regs=3Dused-gpr -falign-functions=3D64 -fstrict-flex-arrays=
=3D3 -fno-strict-overflow -fno-stack-check -fno-builtin-wcslen -Wall -Wextr=
a -Wundef -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -W=
error=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-security -Wno-t=
rigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-declara=
tions -Wmissing-prototypes -Wframe-larger-than=3D2048 -Wno-gnu -Wno-format-=
overflow-non-kprintf -Wno-format-truncation-non-kprintf -Wno-pointer-sign -=
Wcast-function-type -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Din=
compatible-pointer-types -Wenum-conversion -Wunused -Wmissing-format-attrib=
ute -Wmissing-include-dirs -Wunused-const-variable -Wno-missing-field-initi=
alizers -Wno-type-limits -Wno-shift-negative-value -Wno-enum-enum-conversio=
n -Wno-sign-compare -Wno-unused-parameter -DRANDSTRUCT -frandomize-layout-s=
eed-file=3D./scripts/basic/randstruct.seed -fno-crash-diagnostics -Wno-erro=
r=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -Wextra -Wunused -Wno=
-unused-parameter -Wmissing-format-attribute -Wold-style-definition -Wmissi=
ng-include-dirs -Wunused-but-set-variable -Wunused-const-variable -Wformat-=
overflow -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-negati=
ve-value -Wno-sign-compare -Wformat-truncation -Idrivers/gpu/drm/xe -Idrive=
rs/gpu/drm/xe -fsanitize=3Dkernel-address -mllvm -asan-mapping-offset=3D0x1=
00000000000 -mllvm -asan-instrumentation-with-call-threshold=3D10000 -mllvm=
 -asan-stack=3D0 -mllvm -asan-globals=3D1 -mllvm -asan-kernel-mem-intrinsic=
-prefix=3D1 -fsanitize=3Darray-bounds -fsanitize=3Dshift -fsanitize=3Dunrea=
chable -fsanitize=3Dbool -fsanitize=3Denum -fsanitize-coverage=3Dtrace-pc -=
fsanitize-coverage=3Dtrace-cmp -Idrivers/gpu/drm/xe -Idrivers/gpu/drm/xe -D=
MODULE -DKBUILD_BASENAME=3D\"xe_gt\" -DKBUILD_MODNAME=3D\"xe\" -D__KBUILD_M=
ODNAME=3Dkmod_xe -c -o drivers/gpu/drm/xe/xe_gt.o drivers/gpu/drm/xe/xe_gt.c
   1.	drivers/gpu/drm/xe/xe_gt.c:389:1: current parser token 'int'
   2.	drivers/gpu/drm/xe/xe_gt.c:313:5: LLVM IR generation of declaration '=
xe_gt_record_default_lrcs'
   3.	drivers/gpu/drm/xe/xe_gt.c:313:5: Generating code for declaration 'xe=
_gt_record_default_lrcs'
   4.	drivers/gpu/drm/xe/xe_gt.c:320:34: LLVM IR generation of compound sta=
tement ('{}')
    #0 0x000055da2d8fd59b llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-19+0x391359b)
    #1 0x000055da2d8fb534 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
19+0x3911534)
    #2 0x000055da2d84be08 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007f619511a050 (/lib/x86_64-linux-gnu/libc.so.6+0x3c050)
    #4 0x000055da30ddebbb clang::ASTContext::getASTRecordLayout(clang::Reco=
rdDecl const*) const (clang-19+0x6df4bbb)
    #5 0x000055da2dfcfea0 getFieldOffsetInBits(clang::CodeGen::CodeGenFunct=
ion&, clang::RecordDecl const*, clang::FieldDecl const*, long&) CGExpr.cpp:=
0:0
    #6 0x000055da2dfcfed9 getFieldOffsetInBits(clang::CodeGen::CodeGenFunct=
ion&, clang::RecordDecl const*, clang::FieldDecl const*, long&) CGExpr.cpp:=
0:0
    #7 0x000055da2dfcfed9 getFieldOffsetInBits(clang::CodeGen::CodeGenFunct=
ion&, clang::RecordDecl const*, clang::FieldDecl const*, long&) CGExpr.cpp:=
0:0
    #8 0x000055da2dff7e24 clang::CodeGen::CodeGenFunction::EmitArraySubscri=
ptExpr(clang::ArraySubscriptExpr const*, bool) (clang-19+0x400de24)
    #9 0x000055da2dffa022 clang::CodeGen::CodeGenFunction::EmitCheckedLValu=
e(clang::Expr const*, clang::CodeGen::CodeGenFunction::TypeCheckKind) (clan=
g-19+0x4010022)
   #10 0x000055da2e045eee (anonymous namespace)::ScalarExprEmitter::EmitLoa=
dOfLValue(clang::Expr const*) CGExprScalar.cpp:0:0
   #11 0x000055da2e04283a (anonymous namespace)::ScalarExprEmitter::Visit(c=
lang::Expr*) CGExprScalar.cpp:0:0
   #12 0x000055da2e0462cb (anonymous namespace)::ScalarExprEmitter::VisitCa=
stExpr(clang::CastExpr*) CGExprScalar.cpp:0:0
   #13 0x000055da2e04591f clang::CodeGen::CodeGenFunction::EmitScalarExpr(c=
lang::Expr const*, bool) (clang-19+0x405b91f)
   #14 0x000055da2dff0e25 EmitPointerWithAlignment(clang::Expr const*, clan=
g::CodeGen::LValueBaseInfo*, clang::CodeGen::TBAAAccessInfo*, clang::CodeGe=
n::KnownNonNull_t, clang::CodeGen::CodeGenFunction&) CGExpr.cpp:0:0
   #15 0x000055da2dffa0d3 clang::CodeGen::CodeGenFunction::EmitMemberExpr(c=
lang::MemberExpr const*) (.part.0) CGExpr.cpp:0:0
   #16 0x000055da2dffa79e clang::CodeGen::CodeGenFunction::EmitMemberExpr(c=
lang::MemberExpr const*) (clang-19+0x401079e)
   #17 0x000055da2dfeeb42 clang::CodeGen::CodeGenFunction::EmitLValueHelper=
(clang::Expr const*, clang::CodeGen::KnownNonNull_t) (clang-19+0x4004b42)
   #18 0x000055da2dff9e70 clang::CodeGen::CodeGenFunction::EmitCheckedLValu=
e(clang::Expr const*, clang::CodeGen::CodeGenFunction::TypeCheckKind) (clan=
g-19+0x400fe70)
   #19 0x000055da2e045eee (anonymous namespace)::ScalarExprEmitter::EmitLoa=
dOfLValue(clang::Expr const*) CGExprScalar.cpp:0:0
   #20 0x000055da2e0460e6 (anonymous namespace)::ScalarExprEmitter::VisitMe=
mberExpr(clang::MemberExpr*) CGExprScalar.cpp:0:0
   #21 0x000055da2e04283a (anonymous namespace)::ScalarExprEmitter::Visit(c=
lang::Expr*) CGExprScalar.cpp:0:0
   #22 0x000055da2e0462cb (anonymous namespace)::ScalarExprEmitter::VisitCa=
stExpr(clang::CastExpr*) CGExprScalar.cpp:0:0
   #23 0x000055da2e04591f clang::CodeGen::CodeGenFunction::EmitScalarExpr(c=
lang::Expr const*, bool) (clang-19+0x405b91f)
   #24 0x000055da2dff0e25 EmitPointerWithAlignment(clang::Expr const*, clan=
g::CodeGen::LValueBaseInfo*, clang::CodeGen::TBAAAccessInfo*, clang::CodeGe=
n::KnownNonNull_t, clang::CodeGen::CodeGenFunction&) CGExpr.cpp:0:0
   #25 0x000055da2dffa0d3 clang::CodeGen::CodeGenFunction::EmitMemberExpr(c=
lang::MemberExpr const*) (.part.0) CGExpr.cpp:0:0
   #26 0x000055da2dffa79e clang::CodeGen::CodeGenFunction::EmitMemberExpr(c=
lang::MemberExpr const*) (clang-19+0x401079e)
   #27 0x000055da2dfeeb42 clang::CodeGen::CodeGenFunction::EmitLValueHelper=
(clang::Expr const*, clang::CodeGen::KnownNonNull_t) (clang-19+0x4004b42)
   #28 0x000055da2dfef4d0 clang::CodeGen::CodeGenFunction::EmitLValue(clang=
::Expr const*, clang::CodeGen::KnownNonNull_t) (clang-19+0x40054d0)
   #29 0x000055da2e040bd6 clang::StmtVisitorBase<std::add_pointer, (anonymo=
us namespace)::ScalarExprEmitter, llvm::Value*>::Visit(clang::Stmt*) CGExpr=
Scalar.cpp:0:0
   #30 0x000055da2e04283a (anonymous namespace)::ScalarExprEmitter::Visit(c=
lang::Expr*) CGExprScalar.cpp:0:0
   #31 0x000055da2e0462cb (anonymous namespace)::ScalarExprEmitter::VisitCa=
stExpr(clang::CastExpr*) CGExprScalar.cpp:0:0
   #32 0x000055da2e04591f clang::CodeGen::CodeGenFunction::EmitScalarExpr(c=
lang::Expr const*, bool) (clang-19+0x405b91f)
   #33 0x000055da2dfe2397 clang::CodeGen::CodeGenFunction::EmitAnyExpr(clan=
g::Expr const*, clang::CodeGen::AggValueSlot, bool) (clang-19+0x3ff8397)
   #34 0x000055da2dfe2633 clang::CodeGen::CodeGenFunction::EmitAnyExprToTem=
p(clang::Expr const*) (clang-19+0x3ff8633)
   #35 0x000055da2df61088 clang::CodeGen::CodeGenFunction::EmitCallArg(clan=
g::CodeGen::CallArgList&, clang::Expr const*, clang::QualType) (clang-19+0x=
3f77088)
   #36 0x000055da2df62fb4 clang::CodeGen::CodeGenFunction::EmitCallArgs(cla=
ng::CodeGen::CallArgList&, clang::CodeGen::CodeGenFunction::PrototypeWrappe=
r, llvm::iterator_range<clang::Stmt::CastIterator<clang::Expr, clang::Expr =
const* const, clang::Stmt const* const>>, clang::CodeGen::CodeGenFunction::=
AbstractCallee, unsigned int, clang::CodeGen::CodeGenFunction::EvaluationOr=
der) (clang-19+0x3f78fb4)
   #37 0x000055da2dfed408 clang::CodeGen::CodeGenFunction::EmitCall(clang::=
QualType, clang::CodeGen::CGCallee const&, clang::CallExpr const*, clang::C=
odeGen::ReturnValueSlot, llvm::Value*) (clang-19+0x4003408)
   #38 0x000055da2dfee516 clang::CodeGen::CodeGenFunction::EmitCallExpr(cla=
ng::CallExpr const*, clang::CodeGen::ReturnValueSlot) (clang-19+0x4004516)
   #39 0x000055da2e0488e6 (anonymous namespace)::ScalarExprEmitter::VisitCa=
llExpr(clang::CallExpr const*) CGExprScalar.cpp:0:0
   #40 0x000055da2e04591f clang::CodeGen::CodeGenFunction::EmitScalarExpr(c=
lang::Expr const*, bool) (clang-19+0x405b91f)
   #41 0x000055da2dfe2397 clang::CodeGen::CodeGenFunction::EmitAnyExpr(clan=
g::Expr const*, clang::CodeGen::AggValueSlot, bool) (clang-19+0x3ff8397)
   #42 0x000055da2dfece67 clang::CodeGen::CodeGenFunction::EmitIgnoredExpr(=
clang::Expr const*) (clang-19+0x4002e67)
   #43 0x000055da2dc00c62 clang::CodeGen::CodeGenFunction::EmitStmt(clang::=
Stmt const*, llvm::ArrayRef<clang::Attr const*>) (clang-19+0x3c16c62)
   #44 0x000055da2dc075f9 clang::CodeGen::CodeGenFunction::EmitCompoundStmt=
WithoutScope(clang::CompoundStmt const&, bool, clang::CodeGen::AggValueSlot=
) (clang-19+0x3c1d5f9)
   #45 0x000055da2dc0799d clang::CodeGen::CodeGenFunction::EmitCompoundStmt=
(clang::CompoundStmt const&, bool, clang::CodeGen::AggValueSlot) (clang-19+=
0x3c1d99d)
   #46 0x000055da2dc07c7d clang::CodeGen::CodeGenFunction::EmitSimpleStmt(c=
lang::Stmt const*, llvm::ArrayRef<clang::Attr const*>) (clang-19+0x3c1dc7d)
   #47 0x000055da2dc00bd2 clang::CodeGen::CodeGenFunction::EmitStmt(clang::=
Stmt const*, llvm::ArrayRef<clang::Attr const*>) (clang-19+0x3c16bd2)
   #48 0x000055da2dc07113 clang::CodeGen::CodeGenFunction::EmitIfStmt(clang=
::IfStmt const&) (clang-19+0x3c1d113)
   #49 0x000055da2dc04b53 clang::CodeGen::CodeGenFunction::EmitForStmt(clan=
g::ForStmt const&, llvm::ArrayRef<clang::Attr const*>) (clang-19+0x3c1ab53)
   #50 0x000055da2dc075f9 clang::CodeGen::CodeGenFunction::EmitCompoundStmt=
WithoutScope(clang::CompoundStmt const&, bool, clang::CodeGen::AggValueSlot=
) (clang-19+0x3c1d5f9)
   #51 0x000055da2dc64fab clang::CodeGen::CodeGenFunction::EmitFunctionBody=
(clang::Stmt const*) (clang-19+0x3c7afab)
   #52 0x000055da2dc77824 clang::CodeGen::CodeGenFunction::GenerateCode(cla=
ng::GlobalDecl, llvm::Function*, clang::CodeGen::CGFunctionInfo const&) (cl=
ang-19+0x3c8d824)
   #53 0x000055da2dcbb852 clang::CodeGen::CodeGenModule::EmitGlobalFunction=
Definition(clang::GlobalDecl, llvm::GlobalValue*) (clang-19+0x3cd1852)
   #54 0x000055da2dcb6f4c clang::CodeGen::CodeGenModule::EmitGlobalDefiniti=
on(clang::GlobalDecl, llvm::GlobalValue*) (clang-19+0x3cccf4c)
   #55 0x000055da2dcb7603 clang::CodeGen::CodeGenModule::EmitGlobal(clang::=
GlobalDecl) (clang-19+0x3ccd603)
   #56 0x000055da2dcbf807 clang::CodeGen::CodeGenModule::EmitTopLevelDecl(c=
lang::Decl*) (.part.0) CodeGenModule.cpp:0:0
   #57 0x000055da2e166100 (anonymous namespace)::CodeGeneratorImpl::HandleT=
opLevelDecl(clang::DeclGroupRef) ModuleBuilder.cpp:0:0
   #58 0x000055da2e158255 clang::BackendConsumer::HandleTopLevelDecl(clang:=
:DeclGroupRef) (clang-19+0x416e255)
   #59 0x000055da2fa33edc clang::ParseAST(clang::Sema&, bool, bool) (clang-=
19+0x5a49edc)
   #60 0x000055da2e40edb1 clang::FrontendAction::Execute() (clang-19+0x4424=
db1)
   #61 0x000055da2e386c3b clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-19+0x439cc3b)
   #62 0x000055da2e4d3237 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-19+0x44e9237)
   #63 0x000055da2aeeeaca cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-19+0xf04aca)
   #64 0x000055da2aee8dca ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&) driver.cpp:0:0
   #65 0x000055da2e1ada19 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #66 0x000055da2d84c1d3 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-19+0x38621d3)
   #67 0x000055da2e1adda9 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #68 0x000055da2e174e25 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-19+0x418ae25)
   #69 0x000055da2e17584d clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-19+0x418b84d)
   #70 0x000055da2e1875ac clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-19+0x419d5ac)
   #71 0x000055da2aeebfbc clang_main(int, char**, llvm::ToolContext const&)=
 (clang-19+0xf01fbc)
   #72 0x000055da2adcdc93 main (clang-19+0xde3c93)
   #73 0x00007f619510524a (/lib/x86_64-linux-gnu/libc.so.6+0x2724a)
   #74 0x00007f6195105305 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x27305)
   #75 0x000055da2aee85c1 _start (clang-19+0xefe5c1)
>> clang: error: clang frontend command failed with exit code 139 (use -v t=
o see invocation)
--
   In file included from drivers/gpu/drm/xe/xe_guc_capture.c:19:
   In file included from drivers/gpu/drm/xe/xe_bo.h:9:
   In file included from include/drm/ttm/ttm_tt.h:30:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + p=
ort;
         |                                                   ~~~~~~~~~~ ^
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,drivers/gpu/drm/xe/.xe_guc_capture.=
o.d -nostdinc -Iarch/um/include -I./arch/um/include/generated -Iinclude -I.=
/include -Iarch/um/include/uapi -I./arch/um/include/generated/uapi -Iinclud=
e/uapi -I./include/generated/uapi -include include/linux/compiler-version.h=
 -include include/linux/kconfig.h -include include/linux/compiler_types.h -=
D__KERNEL__ --target=3Dx86_64-linux-gnu -fintegrated-as -Werror=3Dunknown-w=
arning-option -Werror=3Dignored-optimization-argument -Werror=3Doption-igno=
red -Werror=3Dunused-command-line-argument -m64 -Iarch/x86/um -Iarch/x86/in=
clude -Iarch/x86/include/uapi -I./arch/x86/include/generated -I./arch/x86/i=
nclude/generated/uapi -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1=
 -std=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-stric=
t-aliasing -mcmodel=3Dlarge -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx=
 -fno-builtin -m64 -D__arch_um__ -Iarch/um/include/shared -Iarch/x86/um/sha=
red -Iarch/um/include/shared/skas -Dvmap=3Dkernel_vmap -Dlongjmp=3Dkernel_l=
ongjmp -Dsetjmp=3Dkernel_setjmp -Din6addr_loopback=3Dkernel_in6addr_loopbac=
k -Din6addr_any=3Dkernel_in6addr_any -Dstrrchr=3Dkernel_strrchr -D__close_r=
ange=3Dkernel__close_range -D_LARGEFILE64_SOURCE -Derrno=3Dkernel_errno -Ds=
igprocmask=3Dkernel_sigprocmask -Dmktime=3Dkernel_mktime -fno-delete-null-p=
ointer-checks -O2 -fno-stack-protector -fno-omit-frame-pointer -fno-optimiz=
e-sibling-calls -ftrivial-auto-var-init=3Dpattern -fno-stack-clash-protecti=
on -fzero-call-used-regs=3Dused-gpr -falign-functions=3D64 -fstrict-flex-ar=
rays=3D3 -fno-strict-overflow -fno-stack-check -fno-builtin-wcslen -Wall -W=
extra -Wundef -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-in=
t -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-security -W=
no-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-dec=
larations -Wmissing-prototypes -Wframe-larger-than=3D2048 -Wno-gnu -Wno-for=
mat-overflow-non-kprintf -Wno-format-truncation-non-kprintf -Wno-pointer-si=
gn -Wcast-function-type -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=
=3Dincompatible-pointer-types -Wenum-conversion -Wunused -Wmissing-format-a=
ttribute -Wmissing-include-dirs -Wunused-const-variable -Wno-missing-field-=
initializers -Wno-type-limits -Wno-shift-negative-value -Wno-enum-enum-conv=
ersion -Wno-sign-compare -Wno-unused-parameter -DRANDSTRUCT -frandomize-lay=
out-seed-file=3D./scripts/basic/randstruct.seed -fno-crash-diagnostics -Wno=
-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -Wextra -Wunused=
 -Wno-unused-parameter -Wmissing-format-attribute -Wold-style-definition -W=
missing-include-dirs -Wunused-but-set-variable -Wunused-const-variable -Wfo=
rmat-overflow -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-n=
egative-value -Wno-sign-compare -Wformat-truncation -Idrivers/gpu/drm/xe -I=
drivers/gpu/drm/xe -fsanitize=3Dkernel-address -mllvm -asan-mapping-offset=
=3D0x100000000000 -mllvm -asan-instrumentation-with-call-threshold=3D10000 =
-mllvm -asan-stack=3D0 -mllvm -asan-globals=3D1 -mllvm -asan-kernel-mem-int=
rinsic-prefix=3D1 -fsanitize=3Darray-bounds -fsanitize=3Dshift -fsanitize=
=3Dunreachable -fsanitize=3Dbool -fsanitize=3Denum -fsanitize-coverage=3Dtr=
ace-pc -fsanitize-coverage=3Dtrace-cmp -Idrivers/gpu/drm/xe -Idrivers/gpu/d=
rm/xe -DMODULE -DKBUILD_BASENAME=3D\"xe_guc_capture\" -DKBUILD_MODNAME=3D\"=
xe\" -D__KBUILD_MODNAME=3Dkmod_xe -c -o drivers/gpu/drm/xe/xe_guc_capture.o=
 drivers/gpu/drm/xe/xe_guc_capture.c
   1.	drivers/gpu/drm/xe/xe_guc_capture.c:1905:1: current parser token 'voi=
d'
   2.	drivers/gpu/drm/xe/xe_guc_capture.c:1847:1: LLVM IR generation of dec=
laration 'xe_guc_capture_get_matching_and_lock'
   3.	drivers/gpu/drm/xe/xe_guc_capture.c:1847:1: Generating code for decla=
ration 'xe_guc_capture_get_matching_and_lock'
   4.	drivers/gpu/drm/xe/xe_guc_capture.c:1874:42: LLVM IR generation of co=
mpound statement ('{}')
    #0 0x000055921541d59b llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-19+0x391359b)
    #1 0x000055921541b534 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
19+0x3911534)
    #2 0x000055921536be08 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007ff305c58050 (/lib/x86_64-linux-gnu/libc.so.6+0x3c050)
    #4 0x00005592188febbb clang::ASTContext::getASTRecordLayout(clang::Reco=
rdDecl const*) const (clang-19+0x6df4bbb)
    #5 0x0000559215aefea0 getFieldOffsetInBits(clang::CodeGen::CodeGenFunct=
ion&, clang::RecordDecl const*, clang::FieldDecl const*, long&) CGExpr.cpp:=
0:0
    #6 0x0000559215aefed9 getFieldOffsetInBits(clang::CodeGen::CodeGenFunct=
ion&, clang::RecordDecl const*, clang::FieldDecl const*, long&) CGExpr.cpp:=
0:0
    #7 0x0000559215aefed9 getFieldOffsetInBits(clang::CodeGen::CodeGenFunct=
ion&, clang::RecordDecl const*, clang::FieldDecl const*, long&) CGExpr.cpp:=
0:0
    #8 0x0000559215b17e24 clang::CodeGen::CodeGenFunction::EmitArraySubscri=
ptExpr(clang::ArraySubscriptExpr const*, bool) (clang-19+0x400de24)
    #9 0x0000559215b1a022 clang::CodeGen::CodeGenFunction::EmitCheckedLValu=
e(clang::Expr const*, clang::CodeGen::CodeGenFunction::TypeCheckKind) (clan=
g-19+0x4010022)
   #10 0x0000559215b65eee (anonymous namespace)::ScalarExprEmitter::EmitLoa=
dOfLValue(clang::Expr const*) CGExprScalar.cpp:0:0
   #11 0x0000559215b6283a (anonymous namespace)::ScalarExprEmitter::Visit(c=
lang::Expr*) CGExprScalar.cpp:0:0
   #12 0x0000559215b662cb (anonymous namespace)::ScalarExprEmitter::VisitCa=
stExpr(clang::CastExpr*) CGExprScalar.cpp:0:0
   #13 0x0000559215b6591f clang::CodeGen::CodeGenFunction::EmitScalarExpr(c=
lang::Expr const*, bool) (clang-19+0x405b91f)
   #14 0x0000559215b02397 clang::CodeGen::CodeGenFunction::EmitAnyExpr(clan=
g::Expr const*, clang::CodeGen::AggValueSlot, bool) (clang-19+0x3ff8397)
   #15 0x0000559215b02633 clang::CodeGen::CodeGenFunction::EmitAnyExprToTem=
p(clang::Expr const*) (clang-19+0x3ff8633)
   #16 0x0000559215a81088 clang::CodeGen::CodeGenFunction::EmitCallArg(clan=
g::CodeGen::CallArgList&, clang::Expr const*, clang::QualType) (clang-19+0x=
3f77088)
   #17 0x0000559215a82fb4 clang::CodeGen::CodeGenFunction::EmitCallArgs(cla=
ng::CodeGen::CallArgList&, clang::CodeGen::CodeGenFunction::PrototypeWrappe=
r, llvm::iterator_range<clang::Stmt::CastIterator<clang::Expr, clang::Expr =
const* const, clang::Stmt const* const>>, clang::CodeGen::CodeGenFunction::=
AbstractCallee, unsigned int, clang::CodeGen::CodeGenFunction::EvaluationOr=
der) (clang-19+0x3f78fb4)
   #18 0x0000559215b0d408 clang::CodeGen::CodeGenFunction::EmitCall(clang::=
QualType, clang::CodeGen::CGCallee const&, clang::CallExpr const*, clang::C=
odeGen::ReturnValueSlot, llvm::Value*) (clang-19+0x4003408)
   #19 0x0000559215b0e516 clang::CodeGen::CodeGenFunction::EmitCallExpr(cla=
ng::CallExpr const*, clang::CodeGen::ReturnValueSlot) (clang-19+0x4004516)
   #20 0x0000559215b688e6 (anonymous namespace)::ScalarExprEmitter::VisitCa=
llExpr(clang::CallExpr const*) CGExprScalar.cpp:0:0
   #21 0x0000559215b6591f clang::CodeGen::CodeGenFunction::EmitScalarExpr(c=
lang::Expr const*, bool) (clang-19+0x405b91f)
   #22 0x0000559215ac66b7 clang::CodeGen::CodeGenFunction::EmitScalarInit(c=
lang::Expr const*, clang::ValueDecl const*, clang::CodeGen::LValue, bool) (=
clang-19+0x3fbc6b7)
   #23 0x0000559215ac7b7f clang::CodeGen::CodeGenFunction::EmitExprAsInit(c=
lang::Expr const*, clang::ValueDecl const*, clang::CodeGen::LValue, bool) (=
clang-19+0x3fbdb7f)
   #24 0x0000559215ad2f2f clang::CodeGen::CodeGenFunction::EmitAutoVarInit(=
clang::CodeGen::CodeGenFunction::AutoVarEmission const&) (clang-19+0x3fc8f2=
f)
   #25 0x0000559215ad50dc clang::CodeGen::CodeGenFunction::EmitVarDecl(clan=
g::VarDecl const&) (.part.0) CGDecl.cpp:0:0
   #26 0x0000559215ad54e5 clang::CodeGen::CodeGenFunction::EmitDecl(clang::=
Decl const&) (clang-19+0x3fcb4e5)
   #27 0x0000559215714b3f clang::CodeGen::CodeGenFunction::EmitDeclStmt(cla=
ng::DeclStmt const&) (clang-19+0x3c0ab3f)
   #28 0x0000559215727be5 clang::CodeGen::CodeGenFunction::EmitSimpleStmt(c=
lang::Stmt const*, llvm::ArrayRef<clang::Attr const*>) (clang-19+0x3c1dbe5)
   #29 0x0000559215720bd2 clang::CodeGen::CodeGenFunction::EmitStmt(clang::=
Stmt const*, llvm::ArrayRef<clang::Attr const*>) (clang-19+0x3c16bd2)
   #30 0x00005592157275f9 clang::CodeGen::CodeGenFunction::EmitCompoundStmt=
WithoutScope(clang::CompoundStmt const&, bool, clang::CodeGen::AggValueSlot=
) (clang-19+0x3c1d5f9)
   #31 0x000055921572799d clang::CodeGen::CodeGenFunction::EmitCompoundStmt=
(clang::CompoundStmt const&, bool, clang::CodeGen::AggValueSlot) (clang-19+=
0x3c1d99d)
   #32 0x0000559215727c7d clang::CodeGen::CodeGenFunction::EmitSimpleStmt(c=
lang::Stmt const*, llvm::ArrayRef<clang::Attr const*>) (clang-19+0x3c1dc7d)
   #33 0x0000559215720bd2 clang::CodeGen::CodeGenFunction::EmitStmt(clang::=
Stmt const*, llvm::ArrayRef<clang::Attr const*>) (clang-19+0x3c16bd2)
   #34 0x0000559215727029 clang::CodeGen::CodeGenFunction::EmitIfStmt(clang=
::IfStmt const&) (clang-19+0x3c1d029)
   #35 0x00005592157275f9 clang::CodeGen::CodeGenFunction::EmitCompoundStmt=
WithoutScope(clang::CompoundStmt const&, bool, clang::CodeGen::AggValueSlot=
) (clang-19+0x3c1d5f9)
   #36 0x0000559215784fab clang::CodeGen::CodeGenFunction::EmitFunctionBody=
(clang::Stmt const*) (clang-19+0x3c7afab)
   #37 0x0000559215797824 clang::CodeGen::CodeGenFunction::GenerateCode(cla=
ng::GlobalDecl, llvm::Function*, clang::CodeGen::CGFunctionInfo const&) (cl=
ang-19+0x3c8d824)
   #38 0x00005592157db852 clang::CodeGen::CodeGenModule::EmitGlobalFunction=
Definition(clang::GlobalDecl, llvm::GlobalValue*) (clang-19+0x3cd1852)
   #39 0x00005592157d6f4c clang::CodeGen::CodeGenModule::EmitGlobalDefiniti=
on(clang::GlobalDecl, llvm::GlobalValue*) (clang-19+0x3cccf4c)
   #40 0x00005592157d7603 clang::CodeGen::CodeGenModule::EmitGlobal(clang::=
GlobalDecl) (clang-19+0x3ccd603)
   #41 0x00005592157df807 clang::CodeGen::CodeGenModule::EmitTopLevelDecl(c=
lang::Decl*) (.part.0) CodeGenModule.cpp:0:0
   #42 0x0000559215c86100 (anonymous namespace)::CodeGeneratorImpl::HandleT=
opLevelDecl(clang::DeclGroupRef) ModuleBuilder.cpp:0:0
   #43 0x0000559215c78255 clang::BackendConsumer::HandleTopLevelDecl(clang:=
:DeclGroupRef) (clang-19+0x416e255)
   #44 0x0000559217553edc clang::ParseAST(clang::Sema&, bool, bool) (clang-=
19+0x5a49edc)
   #45 0x0000559215f2edb1 clang::FrontendAction::Execute() (clang-19+0x4424=
db1)
   #46 0x0000559215ea6c3b clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-19+0x439cc3b)
   #47 0x0000559215ff3237 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-19+0x44e9237)
   #48 0x0000559212a0eaca cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-19+0xf04aca)
   #49 0x0000559212a08dca ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&) driver.cpp:0:0
   #50 0x0000559215ccda19 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #51 0x000055921536c1d3 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-19+0x38621d3)
   #52 0x0000559215ccdda9 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #53 0x0000559215c94e25 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-19+0x418ae25)
   #54 0x0000559215c9584d clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-19+0x418b84d)
   #55 0x0000559215ca75ac clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-19+0x419d5ac)
   #56 0x0000559212a0bfbc clang_main(int, char**, llvm::ToolContext const&)=
 (clang-19+0xf01fbc)
   #57 0x00005592128edc93 main (clang-19+0xde3c93)
   #58 0x00007ff305c4324a (/lib/x86_64-linux-gnu/libc.so.6+0x2724a)
   #59 0x00007ff305c43305 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x27305)
   #60 0x0000559212a085c1 _start (clang-19+0xefe5c1)
>> clang: error: clang frontend command failed with exit code 139 (use -v t=
o see invocation)
=2E.

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
