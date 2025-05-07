Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55905288C31
	for <oe-kbuild@lists.linux.dev>; Wed,  7 May 2025 13:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746624964; cv=none; b=nZY2FJpc5Ma5udV0LIoVJDgxten96o/tIoBBf8qgvHFRdZy557q+R05XZEjxph8Gg2sPAutQdn5EEkoNsjqfnUAxw2gJbs8/R+1H1+E/CS2elN5judOkP/af5/wEQNOynTKAFTIgQ2fLxuHcRB784uyjMkY1ps8as+mX1dwJ35Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746624964; c=relaxed/simple;
	bh=yYbw7TlfTY+ZVlWmzLxdHjdU3xFeHaYLxJtpY6AqjH0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y9xY5DNed1REJyIyk1TRjXNSNhc6TJdIFTAgJm/N7WfFmN6Xwt1nXIuVXoQS4ioO3L8Eq0zU4bo5TLNILNEb05dzyu717nwOpIU7PMwJdncZnSunH3t3FcngD2Wgjn+zK/32eNFgYtFLAke/1AcegDTesYFujjGLsepFJPEhobQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iV7S0v+b; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iV7S0v+b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746624960; x=1778160960;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yYbw7TlfTY+ZVlWmzLxdHjdU3xFeHaYLxJtpY6AqjH0=;
  b=iV7S0v+b9HzDJkWnBM//cjgMjWz2qe8fQaThuu2bLXjQhchLLjuL0hJW
   qN/Xy21LnaOlMc2jp5FXXxZWhvOkgQYurNiwv4V0LwbuS2x/EQwEGkGyS
   x/O3F1JYyUAyV4i0qMhTAlnc9H4AxzZWMuhKckRUoj7dsxqL84LMpwNHL
   qyhZs84EEhlBM2BZo0vBt8XV5jlzTeOHrOSvzjaZQ5cYD75WuiGE5vBTg
   BbuhTQhYQhV1ZnQZUbFfIgI8ok9QHO8FQHg7nQsJJ+dISvmboMZ7UTMyb
   wpoKf52u5sirGnBjD+Dzf37qhT3kxvDWGrO9mUp1Fh2Uv5F1v+aN92GeV
   g==;
X-CSE-ConnectionGUID: D2N2oX3cSIqpJhJsc8FV1w==
X-CSE-MsgGUID: uaVobjGwRxWDvkLVHOHu0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="47607199"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="47607199"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 06:36:00 -0700
X-CSE-ConnectionGUID: zN+2F5N4TDeDV8l2DBqg4A==
X-CSE-MsgGUID: Zb/eelQNTECeEc9X3pK8lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="140007240"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 May 2025 06:35:58 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCewF-0007tC-38;
	Wed, 07 May 2025 13:35:55 +0000
Date: Wed, 7 May 2025 21:35:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [xinli-intel-fred-public:intel-lkp 22/37] clang: error: clang
 frontend command failed with exit code 139 (use -v to see invocation)
Message-ID: <202505072111.V79AIWUx-lkp@intel.com>
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
TO: Xin3 Li <xin3.li@intel.com>

tree:   https://github.com/xinli-intel/linux-fred-public.git intel-lkp
head:   07f1fbd81034c26b74c8a6851a3570f540063255
commit: 3faa2e3aae15eee5c08c9ed81ac6d6d962346b5b [22/37] x86/msr: Utilize t=
he alternatives mechanism to read MSR
:::::: branch date: 3 days ago
:::::: commit date: 2 weeks ago
config: i386-randconfig-062-20250424 (https://download.01.org/0day-ci/archi=
ve/20250507/202505072111.V79AIWUx-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0e=
f89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250507/202505072111.V79AIWUx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505072111.V79AIWUx-lkp@intel.com/

All errors (new ones prefixed by >>):

   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,arch/x86/events/amd/.brs.o.d -nostd=
inc -Iarch/x86/include -I./arch/x86/include/generated -Iinclude -I./include=
 -Iarch/x86/include/uapi -I./arch/x86/include/generated/uapi -Iinclude/uapi=
 -I./include/generated/uapi -include include/linux/compiler-version.h -incl=
ude include/linux/kconfig.h -include include/linux/compiler_types.h -D__KER=
NEL__ --target=3Dx86_64-linux-gnu -fintegrated-as -ffile-prefix-map=3D=3D -=
Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -funsigned-char -fno=
-common -fno-PIE -fno-strict-aliasing -mno-sse -mno-mmx -mno-sse2 -mno-3dno=
w -mno-avx -fcf-protection=3Dnone -m32 -msoft-float -mregparm=3D3 -freg-str=
uct-return -fno-pic -mstack-alignment=3D4 -march=3Di686 -Wno-sign-compare -=
fno-asynchronous-unwind-tables -mretpoline-external-thunk -mindirect-branch=
-cs-prefix -fno-delete-null-pointer-checks -O2 -fno-stack-protector -fno-om=
it-frame-pointer -fno-optimize-sibling-calls -ftrivial-auto-var-init=3Dpatt=
ern -fno-stack-clash-protection -falign-functions=3D4 -fstrict-flex-arrays=
=3D3 -fno-strict-overflow -fno-stack-check -fno-builtin-wcslen -Wall -Wunde=
f -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=3D=
return-type -Werror=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs=
 -Wno-frame-address -Wno-address-of-packed-member -Wmissing-declarations -W=
missing-prototypes -Wframe-larger-than=3D8192 -Wno-gnu -Wno-format-overflow=
-non-kprintf -Wno-format-truncation-non-kprintf -Wvla -Wno-pointer-sign -Wc=
ast-function-type -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Dinco=
mpatible-pointer-types -Wenum-conversion -Wextra -Wunused -Wmissing-format-=
attribute -Wmissing-include-dirs -Wunused-const-variable -Wno-missing-field=
-initializers -Wno-type-limits -Wno-shift-negative-value -Wno-enum-enum-con=
version -Wno-sign-compare -Wno-unused-parameter -g -fno-var-tracking -DRAND=
STRUCT -frandomize-layout-seed-file=3D./scripts/basic/randstruct.seed -Wno-=
error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -fsanitize=3Darra=
y-bounds -fsanitize=3Dshift -fsanitize=3Dunreachable -Iarch/x86/events/amd =
-Iarch/x86/events/amd -DKBUILD_MODFILE=3D"arch/x86/events/amd/brs" -DKBUILD=
_BASENAME=3D"brs" -DKBUILD_MODNAME=3D"brs" -D__KBUILD_MODNAME=3Dkmod_brs -c=
 -o arch/x86/events/amd/brs.o arch/x86/events/amd/brs.c
   1.	<eof> parser at end of file
   2.	Optimizer
   3.	Running pass "require<globals-aa>,function(invalidate<aa>),require<pr=
ofile-summary>,cgscc(devirt<4>(inline,function-attrs<skip-non-recursive-fun=
ction-attrs>,openmp-opt-cgscc,function<eager-inv;no-rerun>(sroa<modify-cfg>=
,early-cse<memssa>,speculative-execution<only-if-divergent-target>,jump-thr=
eading,correlated-propagation,simplifycfg<bonus-inst-threshold=3D1;no-forwa=
rd-switch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-loops;no-hoist=
-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts=
;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,instcom=
bine<max-iterations=3D1;no-verify-fixpoint>,aggressive-instcombine,libcalls=
-shrinkwrap,tailcallelim,simplifycfg<bonus-inst-threshold=3D1;no-forward-sw=
itch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-loops;no-hoist-comm=
on-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;spec=
ulate-blocks;simplify-cond-branch;no-speculate-unpredictables>,reassociate,=
constraint-elimination,loop-mssa(loop-instsimplify,loop-simplifycfg,licm<no=
-allowspeculation>,loop-rotate<header-duplication;no-prepare-for-lto>,licm<=
allowspeculation>,simple-loop-unswitch<no-nontrivial;trivial>),simplifycfg<=
bonus-inst-threshold=3D1;no-forward-switch-cond;switch-range-to-icmp;no-swi=
tch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-c=
ond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-=
speculate-unpredictables>,instcombine<max-iterations=3D1;no-verify-fixpoint=
>,loop(loop-idiom,indvars,extra-simple-loop-unswitch-passes,loop-deletion,l=
oop-unroll-full),sroa<modify-cfg>,vector-combine,mldst-motion<no-split-foot=
er-bb>,gvn<>,sccp,bdce,instcombine<max-iterations=3D1;no-verify-fixpoint>,j=
ump-threading,correlated-propagation,adce,memcpyopt,dse,move-auto-init,loop=
-mssa(licm<allowspeculation>),coro-elide,simplifycfg<bonus-inst-threshold=
=3D1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-l=
oops;hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;sink-commo=
n-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,=
instcombine<max-iterations=3D1;no-verify-fixpoint>),function-attrs,function=
(require<should-not-run-function-passes>),coro-split,coro-annotation-elide)=
),function(invalidate<should-not-run-function-passes>),cgscc(devirt<4>())" =
on module "arch/x86/events/amd/brs.c"
   4.	Running pass "cgscc(devirt<4>(inline,function-attrs<skip-non-recursiv=
e-function-attrs>,openmp-opt-cgscc,function<eager-inv;no-rerun>(sroa<modify=
-cfg>,early-cse<memssa>,speculative-execution<only-if-divergent-target>,jum=
p-threading,correlated-propagation,simplifycfg<bonus-inst-threshold=3D1;no-=
forward-switch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-loops;no-=
hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-=
insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,in=
stcombine<max-iterations=3D1;no-verify-fixpoint>,aggressive-instcombine,lib=
calls-shrinkwrap,tailcallelim,simplifycfg<bonus-inst-threshold=3D1;no-forwa=
rd-switch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-loops;no-hoist=
-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts=
;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,reassoc=
iate,constraint-elimination,loop-mssa(loop-instsimplify,loop-simplifycfg,li=
cm<no-allowspeculation>,loop-rotate<header-duplication;no-prepare-for-lto>,=
licm<allowspeculation>,simple-loop-unswitch<no-nontrivial;trivial>),simplif=
ycfg<bonus-inst-threshold=3D1;no-forward-switch-cond;switch-range-to-icmp;n=
o-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-w=
ith-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branc=
h;no-speculate-unpredictables>,instcombine<max-iterations=3D1;no-verify-fix=
point>,loop(loop-idiom,indvars,extra-simple-loop-unswitch-passes,loop-delet=
ion,loop-unroll-full),sroa<modify-cfg>,vector-combine,mldst-motion<no-split=
-footer-bb>,gvn<>,sccp,bdce,instcombine<max-iterations=3D1;no-verify-fixpoi=
nt>,jump-threading,correlated-propagation,adce,memcpyopt,dse,move-auto-init=
,loop-mssa(licm<allowspeculation>),coro-elide,simplifycfg<bonus-inst-thresh=
old=3D1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-lookup;kee=
p-loops;hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;sink-co=
mmon-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictable=
s>,instcombine<max-iterations=3D1;no-verify-fixpoint>),function-attrs,funct=
ion(require<should-not-run-function-passes>),coro-split,coro-annotation-eli=
de))" on module "arch/x86/events/amd/brs.c"
   5.	Running pass "correlated-propagation" on function "amd_pmu_brs_sched_=
task"
   #0 0x000056260d0e51db llvm::sys::PrintStackTrace(llvm::raw_ostream&, int=
) (clang-20+0x3d3c1db)
   #1 0x000056260d0e3174 llvm::sys::CleanupOnSignal(unsigned long) (clang-2=
0+0x3d3a174)
   #2 0x000056260d0335b8 CrashRecoverySignalHandler(int) CrashRecoveryConte=
xt.cpp:0:0
   #3 0x00007f0999d2d050 (/lib/x86_64-linux-gnu/libc.so.6+0x3c050)
   #4 0x000056260c939ef0 llvm::AttributeList::getAttributeAtIndex(unsigned =
int, llvm::Attribute::AttrKind) const (clang-20+0x3590ef0)
   #5 0x000056260ca02cd3 llvm::Argument::getRange() const (clang-20+0x3659c=
d3)
   #6 0x000056260c1640e6 llvm::LazyValueInfoImpl::solveBlockValueNonLocal(l=
lvm::Value*, llvm::BasicBlock*) (clang-20+0x2dbb0e6)
   #7 0x000056260c164540 llvm::LazyValueInfoImpl::solveBlockValueImpl(llvm:=
:Value*, llvm::BasicBlock*) (clang-20+0x2dbb540)
   #8 0x000056260c1648cd llvm::LazyValueInfoImpl::solve() (clang-20+0x2dbb8=
cd)
   #9 0x000056260c166428 llvm::LazyValueInfoImpl::getValueOnEdge(llvm::Valu=
e*, llvm::BasicBlock*, llvm::BasicBlock*, llvm::Instruction*) (clang-20+0x2=
dbd428)
   #10 0x000056260c167158 llvm::LazyValueInfo::getConstantOnEdge(llvm::Valu=
e*, llvm::BasicBlock*, llvm::BasicBlock*, llvm::Instruction*) (clang-20+0x2=
dbe158)
   #11 0x0000562610b686d6 runImpl(llvm::Function&, llvm::LazyValueInfo*, ll=
vm::DominatorTree*, llvm::SimplifyQuery const&) CorrelatedValuePropagation.=
cpp:0:0
   #12 0x0000562610b6abaa llvm::CorrelatedValuePropagationPass::run(llvm::F=
unction&, llvm::AnalysisManager<llvm::Function>&) (clang-20+0x77c1baa)
   #13 0x000056260e50471d llvm::detail::PassModel<llvm::Function, llvm::Cor=
relatedValuePropagationPass, llvm::AnalysisManager<llvm::Function>>::run(ll=
vm::Function&, llvm::AnalysisManager<llvm::Function>&) (clang-20+0x515b71d)
   #14 0x000056260cababdb llvm::PassManager<llvm::Function, llvm::AnalysisM=
anager<llvm::Function>>::run(llvm::Function&, llvm::AnalysisManager<llvm::F=
unction>&) (clang-20+0x3711bdb)
   #15 0x000056260a7c67ed llvm::detail::PassModel<llvm::Function, llvm::Pas=
sManager<llvm::Function, llvm::AnalysisManager<llvm::Function>>, llvm::Anal=
ysisManager<llvm::Function>>::run(llvm::Function&, llvm::AnalysisManager<ll=
vm::Function>&) (clang-20+0x141d7ed)
   #16 0x000056260c0a0eca llvm::CGSCCToFunctionPassAdaptor::run(llvm::LazyC=
allGraph::SCC&, llvm::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyC=
allGraph&>&, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&) (clang-20+0x2c=
f7eca)
   #17 0x000056260a7c6c5d llvm::detail::PassModel<llvm::LazyCallGraph::SCC,=
 llvm::CGSCCToFunctionPassAdaptor, llvm::AnalysisManager<llvm::LazyCallGrap=
h::SCC, llvm::LazyCallGraph&>, llvm::LazyCallGraph&, llvm::CGSCCUpdateResul=
t&>::run(llvm::LazyCallGraph::SCC&, llvm::AnalysisManager<llvm::LazyCallGra=
ph::SCC, llvm::LazyCallGraph&>&, llvm::LazyCallGraph&, llvm::CGSCCUpdateRes=
ult&) (clang-20+0x141dc5d)
   #18 0x000056260c09ad68 llvm::PassManager<llvm::LazyCallGraph::SCC, llvm:=
:AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyCallGraph&>, llvm::Laz=
yCallGraph&, llvm::CGSCCUpdateResult&>::run(llvm::LazyCallGraph::SCC&, llvm=
::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyCallGraph&>&, llvm::L=
azyCallGraph&, llvm::CGSCCUpdateResult&) (clang-20+0x2cf1d68)
   #19 0x000056260e50379d llvm::detail::PassModel<llvm::LazyCallGraph::SCC,=
 llvm::PassManager<llvm::LazyCallGraph::SCC, llvm::AnalysisManager<llvm::La=
zyCallGraph::SCC, llvm::LazyCallGraph&>, llvm::LazyCallGraph&, llvm::CGSCCU=
pdateResult&>, llvm::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyCa=
llGraph&>, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&>::run(llvm::LazyC=
allGraph::SCC&, llvm::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyC=
allGraph&>&, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&) (clang-20+0x51=
5a79d)
   #20 0x000056260c0a1ede llvm::DevirtSCCRepeatedPass::run(llvm::LazyCallGr=
aph::SCC&, llvm::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyCallGr=
aph&>&, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&) (clang-20+0x2cf8ede)
   #21 0x000056260e5037bd llvm::detail::PassModel<llvm::LazyCallGraph::SCC,=
 llvm::DevirtSCCRepeatedPass, llvm::AnalysisManager<llvm::LazyCallGraph::SC=
C, llvm::LazyCallGraph&>, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&>::=
run(llvm::LazyCallGraph::SCC&, llvm::AnalysisManager<llvm::LazyCallGraph::S=
CC, llvm::LazyCallGraph&>&, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&)=
 (clang-20+0x515a7bd)
   #22 0x000056260c09dd43 llvm::ModuleToPostOrderCGSCCPassAdaptor::run(llvm=
::Module&, llvm::AnalysisManager<llvm::Module>&) (clang-20+0x2cf4d43)
   #23 0x000056260e50377d llvm::detail::PassModel<llvm::Module, llvm::Modul=
eToPostOrderCGSCCPassAdaptor, llvm::AnalysisManager<llvm::Module>>::run(llv=
m::Module&, llvm::AnalysisManager<llvm::Module>&) (clang-20+0x515a77d)
   #24 0x000056260cab5613 llvm::PassManager<llvm::Module, llvm::AnalysisMan=
ager<llvm::Module>>::run(llvm::Module&, llvm::AnalysisManager<llvm::Module>=
&) (clang-20+0x370c613)
   #25 0x000056260e6fff73 llvm::ModuleInlinerWrapperPass::run(llvm::Module&=
, llvm::AnalysisManager<llvm::Module>&) (clang-20+0x5356f73)
   #26 0x000056260e5032fd llvm::detail::PassModel<llvm::Module, llvm::Modul=
eInlinerWrapperPass, llvm::AnalysisManager<llvm::Module>>::run(llvm::Module=
&, llvm::AnalysisManager<llvm::Module>&) (clang-20+0x515a2fd)
   #27 0x000056260cab5613 llvm::PassManager<llvm::Module, llvm::AnalysisMan=
ager<llvm::Module>>::run(llvm::Module&, llvm::AnalysisManager<llvm::Module>=
&) (clang-20+0x370c613)
   #28 0x000056260d3798e0 (anonymous namespace)::EmitAssemblyHelper::RunOpt=
imizationPipeline(clang::BackendAction, std::unique_ptr<llvm::raw_pwrite_st=
ream, std::default_delete<llvm::raw_pwrite_stream>>&, std::unique_ptr<llvm:=
:ToolOutputFile, std::default_delete<llvm::ToolOutputFile>>&, clang::Backen=
dConsumer*) BackendUtil.cpp:0:0
   #29 0x000056260d37cae4 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-20+0x3fd3ae4)
   #30 0x000056260d9d4de0 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-20+0x462bde0)
   #31 0x000056260f3b15cc clang::ParseAST(clang::Sema&, bool, bool) (clang-=
20+0x60085cc)
   #32 0x000056260dcbb0d1 clang::FrontendAction::Execute() (clang-20+0x4912=
0d1)
   #33 0x000056260dc307cb clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-20+0x48877cb)
   #34 0x000056260dd88b97 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-20+0x49dfb97)
   #35 0x000056260a3f8040 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-20+0x104f040)
   #36 0x000056260a3f0c9a ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&) driver.cpp:0:0
   #37 0x000056260da21a79 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #38 0x000056260d033983 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-20+0x3c8a983)
   #39 0x000056260da21e09 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #40 0x000056260d9e643c clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-20+0x463d43c)
   #41 0x000056260d9e7439 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-20+0x463e439)
   #42 0x000056260d9fa15c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-20+0x465115c)
   #43 0x000056260a3f4f9e clang_main(int, char**, llvm::ToolContext const&)=
 (clang-20+0x104bf9e)
   #44 0x000056260a2c1493 main (clang-20+0xf18493)
   #45 0x00007f0999d1824a (/lib/x86_64-linux-gnu/libc.so.6+0x2724a)
   #46 0x00007f0999d18305 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x27305)
   #47 0x000056260a3f0491 _start (clang-20+0x1047491)
>> clang: error: clang frontend command failed with exit code 139 (use -v t=
o see invocation)
   clang version 20.1.2 (git://gitmirror/llvm_project 58df0ef89dd64126512e4=
ee27b4ac3fd8ddf6247)
   Target: i386-unknown-linux-gnu
   Thread model: posix
   InstalledDir: /opt/cross/clang-58df0ef89d/bin
   clang: note: diagnostic msg:
   ********************
--
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,arch/x86/kernel/cpu/.intel.o.d -nos=
tdinc -Iarch/x86/include -I./arch/x86/include/generated -Iinclude -I./inclu=
de -Iarch/x86/include/uapi -I./arch/x86/include/generated/uapi -Iinclude/ua=
pi -I./include/generated/uapi -include include/linux/compiler-version.h -in=
clude include/linux/kconfig.h -include include/linux/compiler_types.h -D__K=
ERNEL__ --target=3Dx86_64-linux-gnu -fintegrated-as -ffile-prefix-map=3D=3D=
 -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -funsigned-char -f=
no-common -fno-PIE -fno-strict-aliasing -mno-sse -mno-mmx -mno-sse2 -mno-3d=
now -mno-avx -fcf-protection=3Dnone -m32 -msoft-float -mregparm=3D3 -freg-s=
truct-return -fno-pic -mstack-alignment=3D4 -march=3Di686 -Wno-sign-compare=
 -fno-asynchronous-unwind-tables -mretpoline-external-thunk -mindirect-bran=
ch-cs-prefix -fno-delete-null-pointer-checks -O2 -fno-stack-protector -fno-=
omit-frame-pointer -fno-optimize-sibling-calls -ftrivial-auto-var-init=3Dpa=
ttern -fno-stack-clash-protection -falign-functions=3D4 -fstrict-flex-array=
s=3D3 -fno-strict-overflow -fno-stack-check -fno-builtin-wcslen -Wall -Wund=
ef -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=
=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-security -Wno-trigra=
phs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-declarations=
 -Wmissing-prototypes -Wframe-larger-than=3D8192 -Wno-gnu -Wno-format-overf=
low-non-kprintf -Wno-format-truncation-non-kprintf -Wvla -Wno-pointer-sign =
-Wcast-function-type -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Di=
ncompatible-pointer-types -Wenum-conversion -Wextra -Wunused -Wmissing-form=
at-attribute -Wmissing-include-dirs -Wunused-const-variable -Wno-missing-fi=
eld-initializers -Wno-type-limits -Wno-shift-negative-value -Wno-enum-enum-=
conversion -Wno-sign-compare -Wno-unused-parameter -g -fno-var-tracking -DR=
ANDSTRUCT -frandomize-layout-seed-file=3D./scripts/basic/randstruct.seed -W=
no-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -fsanitize=3Da=
rray-bounds -fsanitize=3Dshift -fsanitize=3Dunreachable -Iarch/x86/kernel/c=
pu -Iarch/x86/kernel/cpu -DKBUILD_MODFILE=3D"arch/x86/kernel/cpu/intel" -DK=
BUILD_BASENAME=3D"intel" -DKBUILD_MODNAME=3D"intel" -D__KBUILD_MODNAME=3Dkm=
od_intel -c -o arch/x86/kernel/cpu/intel.o arch/x86/kernel/cpu/intel.c
   1.	<eof> parser at end of file
   2.	Optimizer
   3.	Running pass "require<globals-aa>,function(invalidate<aa>),require<pr=
ofile-summary>,cgscc(devirt<4>(inline,function-attrs<skip-non-recursive-fun=
ction-attrs>,openmp-opt-cgscc,function<eager-inv;no-rerun>(sroa<modify-cfg>=
,early-cse<memssa>,speculative-execution<only-if-divergent-target>,jump-thr=
eading,correlated-propagation,simplifycfg<bonus-inst-threshold=3D1;no-forwa=
rd-switch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-loops;no-hoist=
-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts=
;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,instcom=
bine<max-iterations=3D1;no-verify-fixpoint>,aggressive-instcombine,libcalls=
-shrinkwrap,tailcallelim,simplifycfg<bonus-inst-threshold=3D1;no-forward-sw=
itch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-loops;no-hoist-comm=
on-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;spec=
ulate-blocks;simplify-cond-branch;no-speculate-unpredictables>,reassociate,=
constraint-elimination,loop-mssa(loop-instsimplify,loop-simplifycfg,licm<no=
-allowspeculation>,loop-rotate<header-duplication;no-prepare-for-lto>,licm<=
allowspeculation>,simple-loop-unswitch<no-nontrivial;trivial>),simplifycfg<=
bonus-inst-threshold=3D1;no-forward-switch-cond;switch-range-to-icmp;no-swi=
tch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-c=
ond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-=
speculate-unpredictables>,instcombine<max-iterations=3D1;no-verify-fixpoint=
>,loop(loop-idiom,indvars,extra-simple-loop-unswitch-passes,loop-deletion,l=
oop-unroll-full),sroa<modify-cfg>,vector-combine,mldst-motion<no-split-foot=
er-bb>,gvn<>,sccp,bdce,instcombine<max-iterations=3D1;no-verify-fixpoint>,j=
ump-threading,correlated-propagation,adce,memcpyopt,dse,move-auto-init,loop=
-mssa(licm<allowspeculation>),coro-elide,simplifycfg<bonus-inst-threshold=
=3D1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-l=
oops;hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;sink-commo=
n-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,=
instcombine<max-iterations=3D1;no-verify-fixpoint>),function-attrs,function=
(require<should-not-run-function-passes>),coro-split,coro-annotation-elide)=
),function(invalidate<should-not-run-function-passes>),cgscc(devirt<4>())" =
on module "arch/x86/kernel/cpu/intel.c"
   4.	Running pass "cgscc(devirt<4>(inline,function-attrs<skip-non-recursiv=
e-function-attrs>,openmp-opt-cgscc,function<eager-inv;no-rerun>(sroa<modify=
-cfg>,early-cse<memssa>,speculative-execution<only-if-divergent-target>,jum=
p-threading,correlated-propagation,simplifycfg<bonus-inst-threshold=3D1;no-=
forward-switch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-loops;no-=
hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-=
insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,in=
stcombine<max-iterations=3D1;no-verify-fixpoint>,aggressive-instcombine,lib=
calls-shrinkwrap,tailcallelim,simplifycfg<bonus-inst-threshold=3D1;no-forwa=
rd-switch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-loops;no-hoist=
-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts=
;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,reassoc=
iate,constraint-elimination,loop-mssa(loop-instsimplify,loop-simplifycfg,li=
cm<no-allowspeculation>,loop-rotate<header-duplication;no-prepare-for-lto>,=
licm<allowspeculation>,simple-loop-unswitch<no-nontrivial;trivial>),simplif=
ycfg<bonus-inst-threshold=3D1;no-forward-switch-cond;switch-range-to-icmp;n=
o-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-w=
ith-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branc=
h;no-speculate-unpredictables>,instcombine<max-iterations=3D1;no-verify-fix=
point>,loop(loop-idiom,indvars,extra-simple-loop-unswitch-passes,loop-delet=
ion,loop-unroll-full),sroa<modify-cfg>,vector-combine,mldst-motion<no-split=
-footer-bb>,gvn<>,sccp,bdce,instcombine<max-iterations=3D1;no-verify-fixpoi=
nt>,jump-threading,correlated-propagation,adce,memcpyopt,dse,move-auto-init=
,loop-mssa(licm<allowspeculation>),coro-elide,simplifycfg<bonus-inst-thresh=
old=3D1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-lookup;kee=
p-loops;hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;sink-co=
mmon-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictable=
s>,instcombine<max-iterations=3D1;no-verify-fixpoint>),function-attrs,funct=
ion(require<should-not-run-function-passes>),coro-split,coro-annotation-eli=
de))" on module "arch/x86/kernel/cpu/intel.c"
   5.	Running pass "early-cse<memssa>" on function "early_init_intel"
   #0 0x000055ecace761db llvm::sys::PrintStackTrace(llvm::raw_ostream&, int=
) (clang-20+0x3d3c1db)
   #1 0x000055ecace74174 llvm::sys::CleanupOnSignal(unsigned long) (clang-2=
0+0x3d3a174)
   #2 0x000055ecacdc45b8 CrashRecoverySignalHandler(int) CrashRecoveryConte=
xt.cpp:0:0
   #3 0x00007f95d448f050 (/lib/x86_64-linux-gnu/libc.so.6+0x3c050)
   #4 0x000055ecac710e74 llvm::Constant::getNullValue(llvm::Type*) (clang-2=
0+0x35d6e74)
   #5 0x000055ecac6deb8a llvm::ConstantFoldBinaryInstruction(unsigned int, =
llvm::Constant*, llvm::Constant*) (clang-20+0x35a4b8a)
   #6 0x000055ecabec13a9 simplifyShift(llvm::Instruction::BinaryOps, llvm::=
Value*, llvm::Value*, bool, llvm::SimplifyQuery const&, unsigned int) Instr=
uctionSimplify.cpp:0:0
   #7 0x000055ecabebf632 simplifyLShrInst(llvm::Value*, llvm::Value*, bool,=
 llvm::SimplifyQuery const&, unsigned int) InstructionSimplify.cpp:0:0
   #8 0x000055ecabec300d simplifyInstructionWithOperands(llvm::Instruction*=
, llvm::ArrayRef<llvm::Value*>, llvm::SimplifyQuery const&, unsigned int) I=
nstructionSimplify.cpp:0:0
   #9 0x000055ecabed0b5e llvm::simplifyInstruction(llvm::Instruction*, llvm=
::SimplifyQuery const&) (clang-20+0x2d96b5e)
   #10 0x000055ecacc56ed5 (anonymous namespace)::EarlyCSE::run() EarlyCSE.c=
pp:0:0
   #11 0x000055ecacc5935b llvm::EarlyCSEPass::run(llvm::Function&, llvm::An=
alysisManager<llvm::Function>&) (clang-20+0x3b1f35b)
   #12 0x000055ecaa55768d llvm::detail::PassModel<llvm::Function, llvm::Ear=
lyCSEPass, llvm::AnalysisManager<llvm::Function>>::run(llvm::Function&, llv=
m::AnalysisManager<llvm::Function>&) (clang-20+0x141d68d)
   #13 0x000055ecac84bbdb llvm::PassManager<llvm::Function, llvm::AnalysisM=
anager<llvm::Function>>::run(llvm::Function&, llvm::AnalysisManager<llvm::F=
unction>&) (clang-20+0x3711bdb)
   #14 0x000055ecaa5577ed llvm::detail::PassModel<llvm::Function, llvm::Pas=
sManager<llvm::Function, llvm::AnalysisManager<llvm::Function>>, llvm::Anal=
ysisManager<llvm::Function>>::run(llvm::Function&, llvm::AnalysisManager<ll=
vm::Function>&) (clang-20+0x141d7ed)
   #15 0x000055ecabe31eca llvm::CGSCCToFunctionPassAdaptor::run(llvm::LazyC=
allGraph::SCC&, llvm::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyC=
allGraph&>&, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&) (clang-20+0x2c=
f7eca)
   #16 0x000055ecaa557c5d llvm::detail::PassModel<llvm::LazyCallGraph::SCC,=
 llvm::CGSCCToFunctionPassAdaptor, llvm::AnalysisManager<llvm::LazyCallGrap=
h::SCC, llvm::LazyCallGraph&>, llvm::LazyCallGraph&, llvm::CGSCCUpdateResul=
t&>::run(llvm::LazyCallGraph::SCC&, llvm::AnalysisManager<llvm::LazyCallGra=
ph::SCC, llvm::LazyCallGraph&>&, llvm::LazyCallGraph&, llvm::CGSCCUpdateRes=
ult&) (clang-20+0x141dc5d)
   #17 0x000055ecabe2bd68 llvm::PassManager<llvm::LazyCallGraph::SCC, llvm:=
:AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyCallGraph&>, llvm::Laz=
yCallGraph&, llvm::CGSCCUpdateResult&>::run(llvm::LazyCallGraph::SCC&, llvm=
::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyCallGraph&>&, llvm::L=
azyCallGraph&, llvm::CGSCCUpdateResult&) (clang-20+0x2cf1d68)
   #18 0x000055ecae29479d llvm::detail::PassModel<llvm::LazyCallGraph::SCC,=
 llvm::PassManager<llvm::LazyCallGraph::SCC, llvm::AnalysisManager<llvm::La=
zyCallGraph::SCC, llvm::LazyCallGraph&>, llvm::LazyCallGraph&, llvm::CGSCCU=
pdateResult&>, llvm::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyCa=
llGraph&>, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&>::run(llvm::LazyC=
allGraph::SCC&, llvm::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyC=
allGraph&>&, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&) (clang-20+0x51=
5a79d)
   #19 0x000055ecabe32ede llvm::DevirtSCCRepeatedPass::run(llvm::LazyCallGr=
aph::SCC&, llvm::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyCallGr=
aph&>&, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&) (clang-20+0x2cf8ede)
   #20 0x000055ecae2947bd llvm::detail::PassModel<llvm::LazyCallGraph::SCC,=
 llvm::DevirtSCCRepeatedPass, llvm::AnalysisManager<llvm::LazyCallGraph::SC=
C, llvm::LazyCallGraph&>, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&>::=
run(llvm::LazyCallGraph::SCC&, llvm::AnalysisManager<llvm::LazyCallGraph::S=
CC, llvm::LazyCallGraph&>&, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&)=
 (clang-20+0x515a7bd)
   #21 0x000055ecabe2ed43 llvm::ModuleToPostOrderCGSCCPassAdaptor::run(llvm=
::Module&, llvm::AnalysisManager<llvm::Module>&) (clang-20+0x2cf4d43)
   #22 0x000055ecae29477d llvm::detail::PassModel<llvm::Module, llvm::Modul=
eToPostOrderCGSCCPassAdaptor, llvm::AnalysisManager<llvm::Module>>::run(llv=
m::Module&, llvm::AnalysisManager<llvm::Module>&) (clang-20+0x515a77d)
   #23 0x000055ecac846613 llvm::PassManager<llvm::Module, llvm::AnalysisMan=
ager<llvm::Module>>::run(llvm::Module&, llvm::AnalysisManager<llvm::Module>=
&) (clang-20+0x370c613)
   #24 0x000055ecae490f73 llvm::ModuleInlinerWrapperPass::run(llvm::Module&=
, llvm::AnalysisManager<llvm::Module>&) (clang-20+0x5356f73)
   #25 0x000055ecae2942fd llvm::detail::PassModel<llvm::Module, llvm::Modul=
eInlinerWrapperPass, llvm::AnalysisManager<llvm::Module>>::run(llvm::Module=
&, llvm::AnalysisManager<llvm::Module>&) (clang-20+0x515a2fd)
   #26 0x000055ecac846613 llvm::PassManager<llvm::Module, llvm::AnalysisMan=
ager<llvm::Module>>::run(llvm::Module&, llvm::AnalysisManager<llvm::Module>=
&) (clang-20+0x370c613)
   #27 0x000055ecad10a8e0 (anonymous namespace)::EmitAssemblyHelper::RunOpt=
imizationPipeline(clang::BackendAction, std::unique_ptr<llvm::raw_pwrite_st=
ream, std::default_delete<llvm::raw_pwrite_stream>>&, std::unique_ptr<llvm:=
:ToolOutputFile, std::default_delete<llvm::ToolOutputFile>>&, clang::Backen=
dConsumer*) BackendUtil.cpp:0:0
   #28 0x000055ecad10dae4 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-20+0x3fd3ae4)
   #29 0x000055ecad765de0 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-20+0x462bde0)
   #30 0x000055ecaf1425cc clang::ParseAST(clang::Sema&, bool, bool) (clang-=
20+0x60085cc)
   #31 0x000055ecada4c0d1 clang::FrontendAction::Execute() (clang-20+0x4912=
0d1)
   #32 0x000055ecad9c17cb clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-20+0x48877cb)
   #33 0x000055ecadb19b97 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-20+0x49dfb97)
   #34 0x000055ecaa189040 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-20+0x104f040)
   #35 0x000055ecaa181c9a ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&) driver.cpp:0:0
   #36 0x000055ecad7b2a79 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #37 0x000055ecacdc4983 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-20+0x3c8a983)
   #38 0x000055ecad7b2e09 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #39 0x000055ecad77743c clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-20+0x463d43c)
   #40 0x000055ecad778439 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-20+0x463e439)
   #41 0x000055ecad78b15c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-20+0x465115c)
   #42 0x000055ecaa185f9e clang_main(int, char**, llvm::ToolContext const&)=
 (clang-20+0x104bf9e)
   #43 0x000055ecaa052493 main (clang-20+0xf18493)
   #44 0x00007f95d447a24a (/lib/x86_64-linux-gnu/libc.so.6+0x2724a)
   #45 0x00007f95d447a305 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x27305)
   #46 0x000055ecaa181491 _start (clang-20+0x1047491)
>> clang: error: clang frontend command failed with exit code 139 (use -v t=
o see invocation)
   clang version 20.1.2 (git://gitmirror/llvm_project 58df0ef89dd64126512e4=
ee27b4ac3fd8ddf6247)
   Target: i386-unknown-linux-gnu
   Thread model: posix
   InstalledDir: /opt/cross/clang-58df0ef89d/bin
   clang: note: diagnostic msg:
   ********************
--
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,arch/x86/kernel/cpu/microcode/.core=
=2Eo.d -nostdinc -Iarch/x86/include -I./arch/x86/include/generated -Iinclud=
e -I./include -Iarch/x86/include/uapi -I./arch/x86/include/generated/uapi -=
Iinclude/uapi -I./include/generated/uapi -include include/linux/compiler-ve=
rsion.h -include include/linux/kconfig.h -include include/linux/compiler_ty=
pes.h -D__KERNEL__ --target=3Dx86_64-linux-gnu -fintegrated-as -ffile-prefi=
x-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -funsig=
ned-char -fno-common -fno-PIE -fno-strict-aliasing -mno-sse -mno-mmx -mno-s=
se2 -mno-3dnow -mno-avx -fcf-protection=3Dnone -m32 -msoft-float -mregparm=
=3D3 -freg-struct-return -fno-pic -mstack-alignment=3D4 -march=3Di686 -Wno-=
sign-compare -fno-asynchronous-unwind-tables -mretpoline-external-thunk -mi=
ndirect-branch-cs-prefix -fno-delete-null-pointer-checks -O2 -fno-stack-pro=
tector -fno-omit-frame-pointer -fno-optimize-sibling-calls -ftrivial-auto-v=
ar-init=3Dpattern -fno-stack-clash-protection -falign-functions=3D4 -fstric=
t-flex-arrays=3D3 -fno-strict-overflow -fno-stack-check -fno-builtin-wcslen=
 -Wall -Wundef -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-i=
nt -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-security -=
Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-de=
clarations -Wmissing-prototypes -Wframe-larger-than=3D8192 -Wno-gnu -Wno-fo=
rmat-overflow-non-kprintf -Wno-format-truncation-non-kprintf -Wvla -Wno-poi=
nter-sign -Wcast-function-type -Wimplicit-fallthrough -Werror=3Ddate-time -=
Werror=3Dincompatible-pointer-types -Wenum-conversion -Wextra -Wunused -Wmi=
ssing-format-attribute -Wmissing-include-dirs -Wunused-const-variable -Wno-=
missing-field-initializers -Wno-type-limits -Wno-shift-negative-value -Wno-=
enum-enum-conversion -Wno-sign-compare -Wno-unused-parameter -g -fno-var-tr=
acking -DRANDSTRUCT -frandomize-layout-seed-file=3D./scripts/basic/randstru=
ct.seed -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -fsa=
nitize=3Darray-bounds -fsanitize=3Dshift -fsanitize=3Dunreachable -Iarch/x8=
6/kernel/cpu/microcode -Iarch/x86/kernel/cpu/microcode -DKBUILD_MODFILE=3D"=
arch/x86/kernel/cpu/microcode/microcode" -DKBUILD_BASENAME=3D"core" -DKBUIL=
D_MODNAME=3D"microcode" -D__KBUILD_MODNAME=3Dkmod_microcode -c -o arch/x86/=
kernel/cpu/microcode/core.o arch/x86/kernel/cpu/microcode/core.c
   1.	<eof> parser at end of file
   2.	Optimizer
   3.	Running pass "require<globals-aa>,function(invalidate<aa>),require<pr=
ofile-summary>,cgscc(devirt<4>(inline,function-attrs<skip-non-recursive-fun=
ction-attrs>,openmp-opt-cgscc,function<eager-inv;no-rerun>(sroa<modify-cfg>=
,early-cse<memssa>,speculative-execution<only-if-divergent-target>,jump-thr=
eading,correlated-propagation,simplifycfg<bonus-inst-threshold=3D1;no-forwa=
rd-switch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-loops;no-hoist=
-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts=
;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,instcom=
bine<max-iterations=3D1;no-verify-fixpoint>,aggressive-instcombine,libcalls=
-shrinkwrap,tailcallelim,simplifycfg<bonus-inst-threshold=3D1;no-forward-sw=
itch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-loops;no-hoist-comm=
on-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;spec=
ulate-blocks;simplify-cond-branch;no-speculate-unpredictables>,reassociate,=
constraint-elimination,loop-mssa(loop-instsimplify,loop-simplifycfg,licm<no=
-allowspeculation>,loop-rotate<header-duplication;no-prepare-for-lto>,licm<=
allowspeculation>,simple-loop-unswitch<no-nontrivial;trivial>),simplifycfg<=
bonus-inst-threshold=3D1;no-forward-switch-cond;switch-range-to-icmp;no-swi=
tch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-c=
ond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-=
speculate-unpredictables>,instcombine<max-iterations=3D1;no-verify-fixpoint=
>,loop(loop-idiom,indvars,extra-simple-loop-unswitch-passes,loop-deletion,l=
oop-unroll-full),sroa<modify-cfg>,vector-combine,mldst-motion<no-split-foot=
er-bb>,gvn<>,sccp,bdce,instcombine<max-iterations=3D1;no-verify-fixpoint>,j=
ump-threading,correlated-propagation,adce,memcpyopt,dse,move-auto-init,loop=
-mssa(licm<allowspeculation>),coro-elide,simplifycfg<bonus-inst-threshold=
=3D1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-l=
oops;hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;sink-commo=
n-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,=
instcombine<max-iterations=3D1;no-verify-fixpoint>),function-attrs,function=
(require<should-not-run-function-passes>),coro-split,coro-annotation-elide)=
),function(invalidate<should-not-run-function-passes>),cgscc(devirt<4>())" =
on module "arch/x86/kernel/cpu/microcode/core.c"
   4.	Running pass "cgscc(devirt<4>(inline,function-attrs<skip-non-recursiv=
e-function-attrs>,openmp-opt-cgscc,function<eager-inv;no-rerun>(sroa<modify=
-cfg>,early-cse<memssa>,speculative-execution<only-if-divergent-target>,jum=
p-threading,correlated-propagation,simplifycfg<bonus-inst-threshold=3D1;no-=
forward-switch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-loops;no-=
hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-=
insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,in=
stcombine<max-iterations=3D1;no-verify-fixpoint>,aggressive-instcombine,lib=
calls-shrinkwrap,tailcallelim,simplifycfg<bonus-inst-threshold=3D1;no-forwa=
rd-switch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-loops;no-hoist=
-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts=
;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,reassoc=
iate,constraint-elimination,loop-mssa(loop-instsimplify,loop-simplifycfg,li=
cm<no-allowspeculation>,loop-rotate<header-duplication;no-prepare-for-lto>,=
licm<allowspeculation>,simple-loop-unswitch<no-nontrivial;trivial>),simplif=
ycfg<bonus-inst-threshold=3D1;no-forward-switch-cond;switch-range-to-icmp;n=
o-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-w=
ith-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branc=
h;no-speculate-unpredictables>,instcombine<max-iterations=3D1;no-verify-fix=
point>,loop(loop-idiom,indvars,extra-simple-loop-unswitch-passes,loop-delet=
ion,loop-unroll-full),sroa<modify-cfg>,vector-combine,mldst-motion<no-split=
-footer-bb>,gvn<>,sccp,bdce,instcombine<max-iterations=3D1;no-verify-fixpoi=
nt>,jump-threading,correlated-propagation,adce,memcpyopt,dse,move-auto-init=
,loop-mssa(licm<allowspeculation>),coro-elide,simplifycfg<bonus-inst-thresh=
old=3D1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-lookup;kee=
p-loops;hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;sink-co=
mmon-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictable=
s>,instcombine<max-iterations=3D1;no-verify-fixpoint>),function-attrs,funct=
ion(require<should-not-run-function-passes>),coro-split,coro-annotation-eli=
de))" on module "arch/x86/kernel/cpu/microcode/core.c"
   5.	Running pass "correlated-propagation" on function "check_loader_disab=
led_bsp"
   #0 0x0000557e8c5d81db llvm::sys::PrintStackTrace(llvm::raw_ostream&, int=
) (clang-20+0x3d3c1db)
   #1 0x0000557e8c5d6174 llvm::sys::CleanupOnSignal(unsigned long) (clang-2=
0+0x3d3a174)
   #2 0x0000557e8c5265b8 CrashRecoverySignalHandler(int) CrashRecoveryConte=
xt.cpp:0:0
   #3 0x00007fa0bbd45050 (/lib/x86_64-linux-gnu/libc.so.6+0x3c050)
   #4 0x0000557e8be2cef0 llvm::AttributeList::getAttributeAtIndex(unsigned =
int, llvm::Attribute::AttrKind) const (clang-20+0x3590ef0)
   #5 0x0000557e8bef5cd3 llvm::Argument::getRange() const (clang-20+0x3659c=
d3)
   #6 0x0000557e8b6570e6 llvm::LazyValueInfoImpl::solveBlockValueNonLocal(l=
lvm::Value*, llvm::BasicBlock*) (clang-20+0x2dbb0e6)
   #7 0x0000557e8b657540 llvm::LazyValueInfoImpl::solveBlockValueImpl(llvm:=
:Value*, llvm::BasicBlock*) (clang-20+0x2dbb540)
   #8 0x0000557e8b6578cd llvm::LazyValueInfoImpl::solve() (clang-20+0x2dbb8=
cd)
   #9 0x0000557e8b659428 llvm::LazyValueInfoImpl::getValueOnEdge(llvm::Valu=
e*, llvm::BasicBlock*, llvm::BasicBlock*, llvm::Instruction*) (clang-20+0x2=
dbd428)
   #10 0x0000557e8b65a158 llvm::LazyValueInfo::getConstantOnEdge(llvm::Valu=
e*, llvm::BasicBlock*, llvm::BasicBlock*, llvm::Instruction*) (clang-20+0x2=
dbe158)
   #11 0x0000557e9005b6d6 runImpl(llvm::Function&, llvm::LazyValueInfo*, ll=
vm::DominatorTree*, llvm::SimplifyQuery const&) CorrelatedValuePropagation.=
cpp:0:0
   #12 0x0000557e9005dbaa llvm::CorrelatedValuePropagationPass::run(llvm::F=
unction&, llvm::AnalysisManager<llvm::Function>&) (clang-20+0x77c1baa)
   #13 0x0000557e8d9f771d llvm::detail::PassModel<llvm::Function, llvm::Cor=
relatedValuePropagationPass, llvm::AnalysisManager<llvm::Function>>::run(ll=
vm::Function&, llvm::AnalysisManager<llvm::Function>&) (clang-20+0x515b71d)
   #14 0x0000557e8bfadbdb llvm::PassManager<llvm::Function, llvm::AnalysisM=
anager<llvm::Function>>::run(llvm::Function&, llvm::AnalysisManager<llvm::F=
unction>&) (clang-20+0x3711bdb)
   #15 0x0000557e89cb97ed llvm::detail::PassModel<llvm::Function, llvm::Pas=
sManager<llvm::Function, llvm::AnalysisManager<llvm::Function>>, llvm::Anal=
ysisManager<llvm::Function>>::run(llvm::Function&, llvm::AnalysisManager<ll=
vm::Function>&) (clang-20+0x141d7ed)
   #16 0x0000557e8b593eca llvm::CGSCCToFunctionPassAdaptor::run(llvm::LazyC=
allGraph::SCC&, llvm::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyC=
allGraph&>&, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&) (clang-20+0x2c=
f7eca)
   #17 0x0000557e89cb9c5d llvm::detail::PassModel<llvm::LazyCallGraph::SCC,=
 llvm::CGSCCToFunctionPassAdaptor, llvm::AnalysisManager<llvm::LazyCallGrap=
h::SCC, llvm::LazyCallGraph&>, llvm::LazyCallGraph&, llvm::CGSCCUpdateResul=
t&>::run(llvm::LazyCallGraph::SCC&, llvm::AnalysisManager<llvm::LazyCallGra=
ph::SCC, llvm::LazyCallGraph&>&, llvm::LazyCallGraph&, llvm::CGSCCUpdateRes=
ult&) (clang-20+0x141dc5d)
   #18 0x0000557e8b58dd68 llvm::PassManager<llvm::LazyCallGraph::SCC, llvm:=
:AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyCallGraph&>, llvm::Laz=
yCallGraph&, llvm::CGSCCUpdateResult&>::run(llvm::LazyCallGraph::SCC&, llvm=
::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyCallGraph&>&, llvm::L=
azyCallGraph&, llvm::CGSCCUpdateResult&) (clang-20+0x2cf1d68)
   #19 0x0000557e8d9f679d llvm::detail::PassModel<llvm::LazyCallGraph::SCC,=
 llvm::PassManager<llvm::LazyCallGraph::SCC, llvm::AnalysisManager<llvm::La=
zyCallGraph::SCC, llvm::LazyCallGraph&>, llvm::LazyCallGraph&, llvm::CGSCCU=
pdateResult&>, llvm::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyCa=
llGraph&>, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&>::run(llvm::LazyC=
allGraph::SCC&, llvm::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyC=
allGraph&>&, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&) (clang-20+0x51=
5a79d)
   #20 0x0000557e8b594ede llvm::DevirtSCCRepeatedPass::run(llvm::LazyCallGr=
aph::SCC&, llvm::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyCallGr=
aph&>&, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&) (clang-20+0x2cf8ede)
   #21 0x0000557e8d9f67bd llvm::detail::PassModel<llvm::LazyCallGraph::SCC,=
 llvm::DevirtSCCRepeatedPass, llvm::AnalysisManager<llvm::LazyCallGraph::SC=
C, llvm::LazyCallGraph&>, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&>::=
run(llvm::LazyCallGraph::SCC&, llvm::AnalysisManager<llvm::LazyCallGraph::S=
CC, llvm::LazyCallGraph&>&, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&)=
 (clang-20+0x515a7bd)
   #22 0x0000557e8b590d43 llvm::ModuleToPostOrderCGSCCPassAdaptor::run(llvm=
::Module&, llvm::AnalysisManager<llvm::Module>&) (clang-20+0x2cf4d43)
   #23 0x0000557e8d9f677d llvm::detail::PassModel<llvm::Module, llvm::Modul=
eToPostOrderCGSCCPassAdaptor, llvm::AnalysisManager<llvm::Module>>::run(llv=
m::Module&, llvm::AnalysisManager<llvm::Module>&) (clang-20+0x515a77d)
   #24 0x0000557e8bfa8613 llvm::PassManager<llvm::Module, llvm::AnalysisMan=
ager<llvm::Module>>::run(llvm::Module&, llvm::AnalysisManager<llvm::Module>=
&) (clang-20+0x370c613)
   #25 0x0000557e8dbf2f73 llvm::ModuleInlinerWrapperPass::run(llvm::Module&=
, llvm::AnalysisManager<llvm::Module>&) (clang-20+0x5356f73)
   #26 0x0000557e8d9f62fd llvm::detail::PassModel<llvm::Module, llvm::Modul=
eInlinerWrapperPass, llvm::AnalysisManager<llvm::Module>>::run(llvm::Module=
&, llvm::AnalysisManager<llvm::Module>&) (clang-20+0x515a2fd)
   #27 0x0000557e8bfa8613 llvm::PassManager<llvm::Module, llvm::AnalysisMan=
ager<llvm::Module>>::run(llvm::Module&, llvm::AnalysisManager<llvm::Module>=
&) (clang-20+0x370c613)
   #28 0x0000557e8c86c8e0 (anonymous namespace)::EmitAssemblyHelper::RunOpt=
imizationPipeline(clang::BackendAction, std::unique_ptr<llvm::raw_pwrite_st=
ream, std::default_delete<llvm::raw_pwrite_stream>>&, std::unique_ptr<llvm:=
:ToolOutputFile, std::default_delete<llvm::ToolOutputFile>>&, clang::Backen=
dConsumer*) BackendUtil.cpp:0:0
   #29 0x0000557e8c86fae4 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-20+0x3fd3ae4)
   #30 0x0000557e8cec7de0 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-20+0x462bde0)
   #31 0x0000557e8e8a45cc clang::ParseAST(clang::Sema&, bool, bool) (clang-=
20+0x60085cc)
   #32 0x0000557e8d1ae0d1 clang::FrontendAction::Execute() (clang-20+0x4912=
0d1)
   #33 0x0000557e8d1237cb clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-20+0x48877cb)
   #34 0x0000557e8d27bb97 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-20+0x49dfb97)
   #35 0x0000557e898eb040 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-20+0x104f040)
   #36 0x0000557e898e3c9a ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&) driver.cpp:0:0
   #37 0x0000557e8cf14a79 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #38 0x0000557e8c526983 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-20+0x3c8a983)
   #39 0x0000557e8cf14e09 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #40 0x0000557e8ced943c clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-20+0x463d43c)
   #41 0x0000557e8ceda439 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-20+0x463e439)
   #42 0x0000557e8ceed15c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-20+0x465115c)
   #43 0x0000557e898e7f9e clang_main(int, char**, llvm::ToolContext const&)=
 (clang-20+0x104bf9e)
   #44 0x0000557e897b4493 main (clang-20+0xf18493)
   #45 0x00007fa0bbd3024a (/lib/x86_64-linux-gnu/libc.so.6+0x2724a)
   #46 0x00007fa0bbd30305 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x27305)
   #47 0x0000557e898e3491 _start (clang-20+0x1047491)
>> clang: error: clang frontend command failed with exit code 139 (use -v t=
o see invocation)
   clang version 20.1.2 (git://gitmirror/llvm_project 58df0ef89dd64126512e4=
ee27b4ac3fd8ddf6247)
   Target: i386-unknown-linux-gnu
   Thread model: posix
   InstalledDir: /opt/cross/clang-58df0ef89d/bin
   clang: note: diagnostic msg:
   ********************
--
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,arch/x86/kernel/cpu/microcode/.inte=
l.o.d -nostdinc -Iarch/x86/include -I./arch/x86/include/generated -Iinclude=
 -I./include -Iarch/x86/include/uapi -I./arch/x86/include/generated/uapi -I=
include/uapi -I./include/generated/uapi -include include/linux/compiler-ver=
sion.h -include include/linux/kconfig.h -include include/linux/compiler_typ=
es.h -D__KERNEL__ --target=3Dx86_64-linux-gnu -fintegrated-as -ffile-prefix=
-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -funsign=
ed-char -fno-common -fno-PIE -fno-strict-aliasing -mno-sse -mno-mmx -mno-ss=
e2 -mno-3dnow -mno-avx -fcf-protection=3Dnone -m32 -msoft-float -mregparm=
=3D3 -freg-struct-return -fno-pic -mstack-alignment=3D4 -march=3Di686 -Wno-=
sign-compare -fno-asynchronous-unwind-tables -mretpoline-external-thunk -mi=
ndirect-branch-cs-prefix -fno-delete-null-pointer-checks -O2 -fno-stack-pro=
tector -fno-omit-frame-pointer -fno-optimize-sibling-calls -ftrivial-auto-v=
ar-init=3Dpattern -fno-stack-clash-protection -falign-functions=3D4 -fstric=
t-flex-arrays=3D3 -fno-strict-overflow -fno-stack-check -fno-builtin-wcslen=
 -Wall -Wundef -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-i=
nt -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-security -=
Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-de=
clarations -Wmissing-prototypes -Wframe-larger-than=3D8192 -Wno-gnu -Wno-fo=
rmat-overflow-non-kprintf -Wno-format-truncation-non-kprintf -Wvla -Wno-poi=
nter-sign -Wcast-function-type -Wimplicit-fallthrough -Werror=3Ddate-time -=
Werror=3Dincompatible-pointer-types -Wenum-conversion -Wextra -Wunused -Wmi=
ssing-format-attribute -Wmissing-include-dirs -Wunused-const-variable -Wno-=
missing-field-initializers -Wno-type-limits -Wno-shift-negative-value -Wno-=
enum-enum-conversion -Wno-sign-compare -Wno-unused-parameter -g -fno-var-tr=
acking -DRANDSTRUCT -frandomize-layout-seed-file=3D./scripts/basic/randstru=
ct.seed -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -fsa=
nitize=3Darray-bounds -fsanitize=3Dshift -fsanitize=3Dunreachable -Iarch/x8=
6/kernel/cpu/microcode -Iarch/x86/kernel/cpu/microcode -DKBUILD_MODFILE=3D"=
arch/x86/kernel/cpu/microcode/microcode" -DKBUILD_BASENAME=3D"intel" -DKBUI=
LD_MODNAME=3D"microcode" -D__KBUILD_MODNAME=3Dkmod_microcode -c -o arch/x86=
/kernel/cpu/microcode/intel.o arch/x86/kernel/cpu/microcode/intel.c
   1.	<eof> parser at end of file
   2.	Optimizer
   3.	Running pass "require<globals-aa>,function(invalidate<aa>),require<pr=
ofile-summary>,cgscc(devirt<4>(inline,function-attrs<skip-non-recursive-fun=
ction-attrs>,openmp-opt-cgscc,function<eager-inv;no-rerun>(sroa<modify-cfg>=
,early-cse<memssa>,speculative-execution<only-if-divergent-target>,jump-thr=
eading,correlated-propagation,simplifycfg<bonus-inst-threshold=3D1;no-forwa=
rd-switch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-loops;no-hoist=
-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts=
;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,instcom=
bine<max-iterations=3D1;no-verify-fixpoint>,aggressive-instcombine,libcalls=
-shrinkwrap,tailcallelim,simplifycfg<bonus-inst-threshold=3D1;no-forward-sw=
itch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-loops;no-hoist-comm=
on-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;spec=
ulate-blocks;simplify-cond-branch;no-speculate-unpredictables>,reassociate,=
constraint-elimination,loop-mssa(loop-instsimplify,loop-simplifycfg,licm<no=
-allowspeculation>,loop-rotate<header-duplication;no-prepare-for-lto>,licm<=
allowspeculation>,simple-loop-unswitch<no-nontrivial;trivial>),simplifycfg<=
bonus-inst-threshold=3D1;no-forward-switch-cond;switch-range-to-icmp;no-swi=
tch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-c=
ond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-=
speculate-unpredictables>,instcombine<max-iterations=3D1;no-verify-fixpoint=
>,loop(loop-idiom,indvars,extra-simple-loop-unswitch-passes,loop-deletion,l=
oop-unroll-full),sroa<modify-cfg>,vector-combine,mldst-motion<no-split-foot=
er-bb>,gvn<>,sccp,bdce,instcombine<max-iterations=3D1;no-verify-fixpoint>,j=
ump-threading,correlated-propagation,adce,memcpyopt,dse,move-auto-init,loop=
-mssa(licm<allowspeculation>),coro-elide,simplifycfg<bonus-inst-threshold=
=3D1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-l=
oops;hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;sink-commo=
n-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,=
instcombine<max-iterations=3D1;no-verify-fixpoint>),function-attrs,function=
(require<should-not-run-function-passes>),coro-split,coro-annotation-elide)=
),function(invalidate<should-not-run-function-passes>),cgscc(devirt<4>())" =
on module "arch/x86/kernel/cpu/microcode/intel.c"
   4.	Running pass "cgscc(devirt<4>(inline,function-attrs<skip-non-recursiv=
e-function-attrs>,openmp-opt-cgscc,function<eager-inv;no-rerun>(sroa<modify=
-cfg>,early-cse<memssa>,speculative-execution<only-if-divergent-target>,jum=
p-threading,correlated-propagation,simplifycfg<bonus-inst-threshold=3D1;no-=
forward-switch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-loops;no-=
hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-=
insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,in=
stcombine<max-iterations=3D1;no-verify-fixpoint>,aggressive-instcombine,lib=
calls-shrinkwrap,tailcallelim,simplifycfg<bonus-inst-threshold=3D1;no-forwa=
rd-switch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-loops;no-hoist=
-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts=
;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,reassoc=
iate,constraint-elimination,loop-mssa(loop-instsimplify,loop-simplifycfg,li=
cm<no-allowspeculation>,loop-rotate<header-duplication;no-prepare-for-lto>,=
licm<allowspeculation>,simple-loop-unswitch<no-nontrivial;trivial>),simplif=
ycfg<bonus-inst-threshold=3D1;no-forward-switch-cond;switch-range-to-icmp;n=
o-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-w=
ith-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branc=
h;no-speculate-unpredictables>,instcombine<max-iterations=3D1;no-verify-fix=
point>,loop(loop-idiom,indvars,extra-simple-loop-unswitch-passes,loop-delet=
ion,loop-unroll-full),sroa<modify-cfg>,vector-combine,mldst-motion<no-split=
-footer-bb>,gvn<>,sccp,bdce,instcombine<max-iterations=3D1;no-verify-fixpoi=
nt>,jump-threading,correlated-propagation,adce,memcpyopt,dse,move-auto-init=
,loop-mssa(licm<allowspeculation>),coro-elide,simplifycfg<bonus-inst-thresh=
old=3D1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-lookup;kee=
p-loops;hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;sink-co=
mmon-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictable=
s>,instcombine<max-iterations=3D1;no-verify-fixpoint>),function-attrs,funct=
ion(require<should-not-run-function-passes>),coro-split,coro-annotation-eli=
de))" on module "arch/x86/kernel/cpu/microcode/intel.c"
   5.	Running pass "adce" on function "intel_collect_cpu_info"
   #0 0x000055ac2b9e91db llvm::sys::PrintStackTrace(llvm::raw_ostream&, int=
) (clang-20+0x3d3c1db)
   #1 0x000055ac2b9e7174 llvm::sys::CleanupOnSignal(unsigned long) (clang-2=
0+0x3d3a174)
   #2 0x000055ac2b9375b8 CrashRecoverySignalHandler(int) CrashRecoveryConte=
xt.cpp:0:0
   #3 0x00007f7a75b0e050 (/lib/x86_64-linux-gnu/libc.so.6+0x3c050)
   #4 0x000055ac2f43e535 (anonymous namespace)::AggressiveDeadCodeEliminati=
on::markLive(llvm::Instruction*) ADCE.cpp:0:0
   #5 0x000055ac2f447832 llvm::ADCEPass::run(llvm::Function&, llvm::Analysi=
sManager<llvm::Function>&) (clang-20+0x779a832)
   #6 0x000055ac2ce088dd llvm::detail::PassModel<llvm::Function, llvm::ADCE=
Pass, llvm::AnalysisManager<llvm::Function>>::run(llvm::Function&, llvm::An=
alysisManager<llvm::Function>&) (clang-20+0x515b8dd)
   #7 0x000055ac2b3bebdb llvm::PassManager<llvm::Function, llvm::AnalysisMa=
nager<llvm::Function>>::run(llvm::Function&, llvm::AnalysisManager<llvm::Fu=
nction>&) (clang-20+0x3711bdb)
   #8 0x000055ac290ca7ed llvm::detail::PassModel<llvm::Function, llvm::Pass=
Manager<llvm::Function, llvm::AnalysisManager<llvm::Function>>, llvm::Analy=
sisManager<llvm::Function>>::run(llvm::Function&, llvm::AnalysisManager<llv=
m::Function>&) (clang-20+0x141d7ed)
   #9 0x000055ac2a9a4eca llvm::CGSCCToFunctionPassAdaptor::run(llvm::LazyCa=
llGraph::SCC&, llvm::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyCa=
llGraph&>&, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&) (clang-20+0x2cf=
7eca)
   #10 0x000055ac290cac5d llvm::detail::PassModel<llvm::LazyCallGraph::SCC,=
 llvm::CGSCCToFunctionPassAdaptor, llvm::AnalysisManager<llvm::LazyCallGrap=
h::SCC, llvm::LazyCallGraph&>, llvm::LazyCallGraph&, llvm::CGSCCUpdateResul=
t&>::run(llvm::LazyCallGraph::SCC&, llvm::AnalysisManager<llvm::LazyCallGra=
ph::SCC, llvm::LazyCallGraph&>&, llvm::LazyCallGraph&, llvm::CGSCCUpdateRes=
ult&) (clang-20+0x141dc5d)
   #11 0x000055ac2a99ed68 llvm::PassManager<llvm::LazyCallGraph::SCC, llvm:=
:AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyCallGraph&>, llvm::Laz=
yCallGraph&, llvm::CGSCCUpdateResult&>::run(llvm::LazyCallGraph::SCC&, llvm=
::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyCallGraph&>&, llvm::L=
azyCallGraph&, llvm::CGSCCUpdateResult&) (clang-20+0x2cf1d68)
   #12 0x000055ac2ce0779d llvm::detail::PassModel<llvm::LazyCallGraph::SCC,=
 llvm::PassManager<llvm::LazyCallGraph::SCC, llvm::AnalysisManager<llvm::La=
zyCallGraph::SCC, llvm::LazyCallGraph&>, llvm::LazyCallGraph&, llvm::CGSCCU=
pdateResult&>, llvm::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyCa=
llGraph&>, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&>::run(llvm::LazyC=
allGraph::SCC&, llvm::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyC=
allGraph&>&, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&) (clang-20+0x51=
5a79d)
   #13 0x000055ac2a9a5ede llvm::DevirtSCCRepeatedPass::run(llvm::LazyCallGr=
aph::SCC&, llvm::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyCallGr=
aph&>&, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&) (clang-20+0x2cf8ede)
   #14 0x000055ac2ce077bd llvm::detail::PassModel<llvm::LazyCallGraph::SCC,=
 llvm::DevirtSCCRepeatedPass, llvm::AnalysisManager<llvm::LazyCallGraph::SC=
C, llvm::LazyCallGraph&>, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&>::=
run(llvm::LazyCallGraph::SCC&, llvm::AnalysisManager<llvm::LazyCallGraph::S=
CC, llvm::LazyCallGraph&>&, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&)=
 (clang-20+0x515a7bd)
   #15 0x000055ac2a9a1d43 llvm::ModuleToPostOrderCGSCCPassAdaptor::run(llvm=
::Module&, llvm::AnalysisManager<llvm::Module>&) (clang-20+0x2cf4d43)
   #16 0x000055ac2ce0777d llvm::detail::PassModel<llvm::Module, llvm::Modul=
eToPostOrderCGSCCPassAdaptor, llvm::AnalysisManager<llvm::Module>>::run(llv=
m::Module&, llvm::AnalysisManager<llvm::Module>&) (clang-20+0x515a77d)
   #17 0x000055ac2b3b9613 llvm::PassManager<llvm::Module, llvm::AnalysisMan=
ager<llvm::Module>>::run(llvm::Module&, llvm::AnalysisManager<llvm::Module>=
&) (clang-20+0x370c613)
   #18 0x000055ac2d003f73 llvm::ModuleInlinerWrapperPass::run(llvm::Module&=
, llvm::AnalysisManager<llvm::Module>&) (clang-20+0x5356f73)
   #19 0x000055ac2ce072fd llvm::detail::PassModel<llvm::Module, llvm::Modul=
eInlinerWrapperPass, llvm::AnalysisManager<llvm::Module>>::run(llvm::Module=
&, llvm::AnalysisManager<llvm::Module>&) (clang-20+0x515a2fd)
   #20 0x000055ac2b3b9613 llvm::PassManager<llvm::Module, llvm::AnalysisMan=
ager<llvm::Module>>::run(llvm::Module&, llvm::AnalysisManager<llvm::Module>=
&) (clang-20+0x370c613)
   #21 0x000055ac2bc7d8e0 (anonymous namespace)::EmitAssemblyHelper::RunOpt=
imizationPipeline(clang::BackendAction, std::unique_ptr<llvm::raw_pwrite_st=
ream, std::default_delete<llvm::raw_pwrite_stream>>&, std::unique_ptr<llvm:=
:ToolOutputFile, std::default_delete<llvm::ToolOutputFile>>&, clang::Backen=
dConsumer*) BackendUtil.cpp:0:0
   #22 0x000055ac2bc80ae4 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-20+0x3fd3ae4)
   #23 0x000055ac2c2d8de0 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-20+0x462bde0)
   #24 0x000055ac2dcb55cc clang::ParseAST(clang::Sema&, bool, bool) (clang-=
20+0x60085cc)
   #25 0x000055ac2c5bf0d1 clang::FrontendAction::Execute() (clang-20+0x4912=
0d1)
   #26 0x000055ac2c5347cb clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-20+0x48877cb)
   #27 0x000055ac2c68cb97 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-20+0x49dfb97)
   #28 0x000055ac28cfc040 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-20+0x104f040)
   #29 0x000055ac28cf4c9a ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&) driver.cpp:0:0
   #30 0x000055ac2c325a79 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #31 0x000055ac2b937983 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-20+0x3c8a983)
   #32 0x000055ac2c325e09 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #33 0x000055ac2c2ea43c clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-20+0x463d43c)
   #34 0x000055ac2c2eb439 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-20+0x463e439)
   #35 0x000055ac2c2fe15c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-20+0x465115c)
   #36 0x000055ac28cf8f9e clang_main(int, char**, llvm::ToolContext const&)=
 (clang-20+0x104bf9e)
   #37 0x000055ac28bc5493 main (clang-20+0xf18493)
   #38 0x00007f7a75af924a (/lib/x86_64-linux-gnu/libc.so.6+0x2724a)
   #39 0x00007f7a75af9305 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x27305)
   #40 0x000055ac28cf4491 _start (clang-20+0x1047491)
>> clang: error: clang frontend command failed with exit code 139 (use -v t=
o see invocation)
   clang version 20.1.2 (git://gitmirror/llvm_project 58df0ef89dd64126512e4=
ee27b4ac3fd8ddf6247)
   Target: i386-unknown-linux-gnu
   Thread model: posix
   InstalledDir: /opt/cross/clang-58df0ef89d/bin
   clang: note: diagnostic msg:
   ********************
--
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,arch/x86/kernel/cpu/microcode/.amd.=
o.d -nostdinc -Iarch/x86/include -I./arch/x86/include/generated -Iinclude -=
I./include -Iarch/x86/include/uapi -I./arch/x86/include/generated/uapi -Iin=
clude/uapi -I./include/generated/uapi -include include/linux/compiler-versi=
on.h -include include/linux/kconfig.h -include include/linux/compiler_types=
=2Eh -D__KERNEL__ --target=3Dx86_64-linux-gnu -fintegrated-as -ffile-prefix=
-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -funsign=
ed-char -fno-common -fno-PIE -fno-strict-aliasing -mno-sse -mno-mmx -mno-ss=
e2 -mno-3dnow -mno-avx -fcf-protection=3Dnone -m32 -msoft-float -mregparm=
=3D3 -freg-struct-return -fno-pic -mstack-alignment=3D4 -march=3Di686 -Wno-=
sign-compare -fno-asynchronous-unwind-tables -mretpoline-external-thunk -mi=
ndirect-branch-cs-prefix -fno-delete-null-pointer-checks -O2 -fno-stack-pro=
tector -fno-omit-frame-pointer -fno-optimize-sibling-calls -ftrivial-auto-v=
ar-init=3Dpattern -fno-stack-clash-protection -falign-functions=3D4 -fstric=
t-flex-arrays=3D3 -fno-strict-overflow -fno-stack-check -fno-builtin-wcslen=
 -Wall -Wundef -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-i=
nt -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-security -=
Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-de=
clarations -Wmissing-prototypes -Wframe-larger-than=3D8192 -Wno-gnu -Wno-fo=
rmat-overflow-non-kprintf -Wno-format-truncation-non-kprintf -Wvla -Wno-poi=
nter-sign -Wcast-function-type -Wimplicit-fallthrough -Werror=3Ddate-time -=
Werror=3Dincompatible-pointer-types -Wenum-conversion -Wextra -Wunused -Wmi=
ssing-format-attribute -Wmissing-include-dirs -Wunused-const-variable -Wno-=
missing-field-initializers -Wno-type-limits -Wno-shift-negative-value -Wno-=
enum-enum-conversion -Wno-sign-compare -Wno-unused-parameter -g -fno-var-tr=
acking -DRANDSTRUCT -frandomize-layout-seed-file=3D./scripts/basic/randstru=
ct.seed -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -fsa=
nitize=3Darray-bounds -fsanitize=3Dshift -fsanitize=3Dunreachable -Iarch/x8=
6/kernel/cpu/microcode -Iarch/x86/kernel/cpu/microcode -DKBUILD_MODFILE=3D"=
arch/x86/kernel/cpu/microcode/microcode" -DKBUILD_BASENAME=3D"amd" -DKBUILD=
_MODNAME=3D"microcode" -D__KBUILD_MODNAME=3Dkmod_microcode -c -o arch/x86/k=
ernel/cpu/microcode/amd.o arch/x86/kernel/cpu/microcode/amd.c
   1.	<eof> parser at end of file
   2.	Optimizer
   3.	Running pass "require<globals-aa>,function(invalidate<aa>),require<pr=
ofile-summary>,cgscc(devirt<4>(inline,function-attrs<skip-non-recursive-fun=
ction-attrs>,openmp-opt-cgscc,function<eager-inv;no-rerun>(sroa<modify-cfg>=
,early-cse<memssa>,speculative-execution<only-if-divergent-target>,jump-thr=
eading,correlated-propagation,simplifycfg<bonus-inst-threshold=3D1;no-forwa=
rd-switch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-loops;no-hoist=
-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts=
;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,instcom=
bine<max-iterations=3D1;no-verify-fixpoint>,aggressive-instcombine,libcalls=
-shrinkwrap,tailcallelim,simplifycfg<bonus-inst-threshold=3D1;no-forward-sw=
itch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-loops;no-hoist-comm=
on-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;spec=
ulate-blocks;simplify-cond-branch;no-speculate-unpredictables>,reassociate,=
constraint-elimination,loop-mssa(loop-instsimplify,loop-simplifycfg,licm<no=
-allowspeculation>,loop-rotate<header-duplication;no-prepare-for-lto>,licm<=
allowspeculation>,simple-loop-unswitch<no-nontrivial;trivial>),simplifycfg<=
bonus-inst-threshold=3D1;no-forward-switch-cond;switch-range-to-icmp;no-swi=
tch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-c=
ond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-=
speculate-unpredictables>,instcombine<max-iterations=3D1;no-verify-fixpoint=
>,loop(loop-idiom,indvars,extra-simple-loop-unswitch-passes,loop-deletion,l=
oop-unroll-full),sroa<modify-cfg>,vector-combine,mldst-motion<no-split-foot=
er-bb>,gvn<>,sccp,bdce,instcombine<max-iterations=3D1;no-verify-fixpoint>,j=
ump-threading,correlated-propagation,adce,memcpyopt,dse,move-auto-init,loop=
-mssa(licm<allowspeculation>),coro-elide,simplifycfg<bonus-inst-threshold=
=3D1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-l=
oops;hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;sink-commo=
n-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,=
instcombine<max-iterations=3D1;no-verify-fixpoint>),function-attrs,function=
(require<should-not-run-function-passes>),coro-split,coro-annotation-elide)=
),function(invalidate<should-not-run-function-passes>),cgscc(devirt<4>())" =
on module "arch/x86/kernel/cpu/microcode/amd.c"
   4.	Running pass "cgscc(devirt<4>(inline,function-attrs<skip-non-recursiv=
e-function-attrs>,openmp-opt-cgscc,function<eager-inv;no-rerun>(sroa<modify=
-cfg>,early-cse<memssa>,speculative-execution<only-if-divergent-target>,jum=
p-threading,correlated-propagation,simplifycfg<bonus-inst-threshold=3D1;no-=
forward-switch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-loops;no-=
hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-=
insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,in=
stcombine<max-iterations=3D1;no-verify-fixpoint>,aggressive-instcombine,lib=
calls-shrinkwrap,tailcallelim,simplifycfg<bonus-inst-threshold=3D1;no-forwa=
rd-switch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-loops;no-hoist=
-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts=
;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,reassoc=
iate,constraint-elimination,loop-mssa(loop-instsimplify,loop-simplifycfg,li=
cm<no-allowspeculation>,loop-rotate<header-duplication;no-prepare-for-lto>,=
licm<allowspeculation>,simple-loop-unswitch<no-nontrivial;trivial>),simplif=
ycfg<bonus-inst-threshold=3D1;no-forward-switch-cond;switch-range-to-icmp;n=
o-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-w=
ith-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branc=
h;no-speculate-unpredictables>,instcombine<max-iterations=3D1;no-verify-fix=
point>,loop(loop-idiom,indvars,extra-simple-loop-unswitch-passes,loop-delet=
ion,loop-unroll-full),sroa<modify-cfg>,vector-combine,mldst-motion<no-split=
-footer-bb>,gvn<>,sccp,bdce,instcombine<max-iterations=3D1;no-verify-fixpoi=
nt>,jump-threading,correlated-propagation,adce,memcpyopt,dse,move-auto-init=
,loop-mssa(licm<allowspeculation>),coro-elide,simplifycfg<bonus-inst-thresh=
old=3D1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-lookup;kee=
p-loops;hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;sink-co=
mmon-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictable=
s>,instcombine<max-iterations=3D1;no-verify-fixpoint>),function-attrs,funct=
ion(require<should-not-run-function-passes>),coro-split,coro-annotation-eli=
de))" on module "arch/x86/kernel/cpu/microcode/amd.c"
   5.	Running pass "adce" on function "__apply_microcode_amd"
   #0 0x000056324a5581db llvm::sys::PrintStackTrace(llvm::raw_ostream&, int=
) (clang-20+0x3d3c1db)
   #1 0x000056324a556174 llvm::sys::CleanupOnSignal(unsigned long) (clang-2=
0+0x3d3a174)
   #2 0x000056324a4a65b8 CrashRecoverySignalHandler(int) CrashRecoveryConte=
xt.cpp:0:0
   #3 0x00007f950247c050 (/lib/x86_64-linux-gnu/libc.so.6+0x3c050)
   #4 0x000056324dfad535 (anonymous namespace)::AggressiveDeadCodeEliminati=
on::markLive(llvm::Instruction*) ADCE.cpp:0:0
   #5 0x000056324dfb6832 llvm::ADCEPass::run(llvm::Function&, llvm::Analysi=
sManager<llvm::Function>&) (clang-20+0x779a832)
   #6 0x000056324b9778dd llvm::detail::PassModel<llvm::Function, llvm::ADCE=
Pass, llvm::AnalysisManager<llvm::Function>>::run(llvm::Function&, llvm::An=
alysisManager<llvm::Function>&) (clang-20+0x515b8dd)
   #7 0x0000563249f2dbdb llvm::PassManager<llvm::Function, llvm::AnalysisMa=
nager<llvm::Function>>::run(llvm::Function&, llvm::AnalysisManager<llvm::Fu=
nction>&) (clang-20+0x3711bdb)
   #8 0x0000563247c397ed llvm::detail::PassModel<llvm::Function, llvm::Pass=
Manager<llvm::Function, llvm::AnalysisManager<llvm::Function>>, llvm::Analy=
sisManager<llvm::Function>>::run(llvm::Function&, llvm::AnalysisManager<llv=
m::Function>&) (clang-20+0x141d7ed)
   #9 0x0000563249513eca llvm::CGSCCToFunctionPassAdaptor::run(llvm::LazyCa=
llGraph::SCC&, llvm::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyCa=
llGraph&>&, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&) (clang-20+0x2cf=
7eca)
   #10 0x0000563247c39c5d llvm::detail::PassModel<llvm::LazyCallGraph::SCC,=
 llvm::CGSCCToFunctionPassAdaptor, llvm::AnalysisManager<llvm::LazyCallGrap=
h::SCC, llvm::LazyCallGraph&>, llvm::LazyCallGraph&, llvm::CGSCCUpdateResul=
t&>::run(llvm::LazyCallGraph::SCC&, llvm::AnalysisManager<llvm::LazyCallGra=
ph::SCC, llvm::LazyCallGraph&>&, llvm::LazyCallGraph&, llvm::CGSCCUpdateRes=
ult&) (clang-20+0x141dc5d)
   #11 0x000056324950dd68 llvm::PassManager<llvm::LazyCallGraph::SCC, llvm:=
:AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyCallGraph&>, llvm::Laz=
yCallGraph&, llvm::CGSCCUpdateResult&>::run(llvm::LazyCallGraph::SCC&, llvm=
::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyCallGraph&>&, llvm::L=
azyCallGraph&, llvm::CGSCCUpdateResult&) (clang-20+0x2cf1d68)
   #12 0x000056324b97679d llvm::detail::PassModel<llvm::LazyCallGraph::SCC,=
 llvm::PassManager<llvm::LazyCallGraph::SCC, llvm::AnalysisManager<llvm::La=
zyCallGraph::SCC, llvm::LazyCallGraph&>, llvm::LazyCallGraph&, llvm::CGSCCU=
pdateResult&>, llvm::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyCa=
llGraph&>, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&>::run(llvm::LazyC=
allGraph::SCC&, llvm::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyC=
allGraph&>&, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&) (clang-20+0x51=
5a79d)
   #13 0x0000563249514ede llvm::DevirtSCCRepeatedPass::run(llvm::LazyCallGr=
aph::SCC&, llvm::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyCallGr=
aph&>&, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&) (clang-20+0x2cf8ede)
   #14 0x000056324b9767bd llvm::detail::PassModel<llvm::LazyCallGraph::SCC,=
 llvm::DevirtSCCRepeatedPass, llvm::AnalysisManager<llvm::LazyCallGraph::SC=
C, llvm::LazyCallGraph&>, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&>::=
run(llvm::LazyCallGraph::SCC&, llvm::AnalysisManager<llvm::LazyCallGraph::S=
CC, llvm::LazyCallGraph&>&, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&)=
 (clang-20+0x515a7bd)
   #15 0x0000563249510d43 llvm::ModuleToPostOrderCGSCCPassAdaptor::run(llvm=
::Module&, llvm::AnalysisManager<llvm::Module>&) (clang-20+0x2cf4d43)
   #16 0x000056324b97677d llvm::detail::PassModel<llvm::Module, llvm::Modul=
eToPostOrderCGSCCPassAdaptor, llvm::AnalysisManager<llvm::Module>>::run(llv=
m::Module&, llvm::AnalysisManager<llvm::Module>&) (clang-20+0x515a77d)
   #17 0x0000563249f28613 llvm::PassManager<llvm::Module, llvm::AnalysisMan=
ager<llvm::Module>>::run(llvm::Module&, llvm::AnalysisManager<llvm::Module>=
&) (clang-20+0x370c613)
   #18 0x000056324bb72f73 llvm::ModuleInlinerWrapperPass::run(llvm::Module&=
, llvm::AnalysisManager<llvm::Module>&) (clang-20+0x5356f73)
   #19 0x000056324b9762fd llvm::detail::PassModel<llvm::Module, llvm::Modul=
eInlinerWrapperPass, llvm::AnalysisManager<llvm::Module>>::run(llvm::Module=
&, llvm::AnalysisManager<llvm::Module>&) (clang-20+0x515a2fd)
   #20 0x0000563249f28613 llvm::PassManager<llvm::Module, llvm::AnalysisMan=
ager<llvm::Module>>::run(llvm::Module&, llvm::AnalysisManager<llvm::Module>=
&) (clang-20+0x370c613)
   #21 0x000056324a7ec8e0 (anonymous namespace)::EmitAssemblyHelper::RunOpt=
imizationPipeline(clang::BackendAction, std::unique_ptr<llvm::raw_pwrite_st=
ream, std::default_delete<llvm::raw_pwrite_stream>>&, std::unique_ptr<llvm:=
:ToolOutputFile, std::default_delete<llvm::ToolOutputFile>>&, clang::Backen=
dConsumer*) BackendUtil.cpp:0:0
   #22 0x000056324a7efae4 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-20+0x3fd3ae4)
   #23 0x000056324ae47de0 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-20+0x462bde0)
   #24 0x000056324c8245cc clang::ParseAST(clang::Sema&, bool, bool) (clang-=
20+0x60085cc)
   #25 0x000056324b12e0d1 clang::FrontendAction::Execute() (clang-20+0x4912=
0d1)
   #26 0x000056324b0a37cb clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-20+0x48877cb)
   #27 0x000056324b1fbb97 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-20+0x49dfb97)
   #28 0x000056324786b040 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-20+0x104f040)
   #29 0x0000563247863c9a ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&) driver.cpp:0:0
   #30 0x000056324ae94a79 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #31 0x000056324a4a6983 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-20+0x3c8a983)
   #32 0x000056324ae94e09 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #33 0x000056324ae5943c clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-20+0x463d43c)
   #34 0x000056324ae5a439 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-20+0x463e439)
   #35 0x000056324ae6d15c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-20+0x465115c)
   #36 0x0000563247867f9e clang_main(int, char**, llvm::ToolContext const&)=
 (clang-20+0x104bf9e)
   #37 0x0000563247734493 main (clang-20+0xf18493)
   #38 0x00007f950246724a (/lib/x86_64-linux-gnu/libc.so.6+0x2724a)
   #39 0x00007f9502467305 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x27305)
   #40 0x0000563247863491 _start (clang-20+0x1047491)
>> clang: error: clang frontend command failed with exit code 139 (use -v t=
o see invocation)
   clang version 20.1.2 (git://gitmirror/llvm_project 58df0ef89dd64126512e4=
ee27b4ac3fd8ddf6247)
   Target: i386-unknown-linux-gnu
   Thread model: posix
   InstalledDir: /opt/cross/clang-58df0ef89d/bin
   clang: note: diagnostic msg:
   ********************

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
