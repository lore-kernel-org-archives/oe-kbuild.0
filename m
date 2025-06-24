Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122A72E8884
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Jun 2025 19:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750792740; cv=none; b=ZlVwgHC2DuRIRUZD+R9NGGgrWMnP04IeJeJUj06T8kTIvCgULbcfxEYqBjzTG1vBhD3jIqKI3x/jVMQdRFP+tvMLeXDHsVylJOHHMD+FSQsYhKp7SDGteI0vRyygdfI+sEMtfReVD7QsoOIwa2EAhgb8L+luOhM1lanCO0aV74g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750792740; c=relaxed/simple;
	bh=V3O1PBhmEtKjmBPi7AVrAzX3diVsVQDJsJRTOmF8cNs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YX4vOvD2IoJh2UzDYFQHskreomyGkiKtIr0gBiaJLQxyr6n6OiqfKG6YAqnfcs92kSLvXBE9dRdiy7ruVvw0C/M7qD4sutZT5FoKhQIKlrnWvTf+7oi/eEYiqH18GBdjgmUJRNL8sOlK6Pzqeb4RcbNMmmlozOUWdQkhtdXJ9Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gCdGEjw9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gCdGEjw9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750792738; x=1782328738;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=V3O1PBhmEtKjmBPi7AVrAzX3diVsVQDJsJRTOmF8cNs=;
  b=gCdGEjw9IKVsVr6zbVbFQuCXRfMPtJMPEXLgXE46TMz9LwbxInnRNz1o
   B/FNQYjuCEb8qm1vuRmMQQ7ITlsxnkpHPE9PD8cG1yH5fsWpeTZawjgil
   JRMw/nImKsHb71PTh23XGNGhzXfEatzU++afWj6XocoQXP7RlkFhlY5nF
   ogcvCoK61eaTtx7CK1sAVrPaDHYQEraCn7mycecmYikZ5BEFxlVed922Q
   f025iIMuDeIS+UvlgXZqV6diECLWIGfGONdPJQKmZ3nVo/++EYdgd4dI9
   Z9v1zopVu2mVS22AkLQUzXyaDKay8xuubQQuZj/pPsEFPeRUWyLKn9oGY
   g==;
X-CSE-ConnectionGUID: Yg09W3GwS2S+1Oe6dXot4w==
X-CSE-MsgGUID: CTLz+zA8QCqVF2wcDW4NdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52277641"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="52277641"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 12:18:57 -0700
X-CSE-ConnectionGUID: o9fRG97tSKSpozNeyNxYzg==
X-CSE-MsgGUID: 5bn8lea6TE2eAG6XDqHmgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="183046785"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Jun 2025 12:18:56 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uU9AT-000SR9-2u;
	Tue, 24 Jun 2025 19:18:53 +0000
Date: Wed, 25 Jun 2025 03:18:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [xinli-intel-fred-public:intel-lkp 8/21] clang: error: clang
 frontend command failed with exit code 139 (use -v to see invocation)
Message-ID: <202506250338.dZpHanrw-lkp@intel.com>
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

TO: Xin3 Li <xin3.li@intel.com>

tree:   https://github.com/xinli-intel/linux-fred-public.git intel-lkp
head:   f5a7aa46f2de853090449e1a5bb733628907c08b
commit: 4d0dde5a278c79fea1e2d9aa4c655a2dfd68d530 [8/21] x86/msr: Utilize th=
e alternatives mechanism to read MSR
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: i386-buildonly-randconfig-005-20250625 (https://download.01.org/0da=
y-ci/archive/20250625/202506250338.dZpHanrw-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a8=
8f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250625/202506250338.dZpHanrw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506250338.dZpHanrw-lkp@intel.com/

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
NEL__ --target=3Dx86_64-linux-gnu -fintegrated-as -Werror=3Dunknown-warning=
-option -Werror=3Dignored-optimization-argument -Werror=3Doption-ignored -W=
error=3Dunused-command-line-argument -fmacro-prefix-map=3D=3D -Wundef -DKBU=
ILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno=
-PIE -fno-strict-aliasing -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -=
fcf-protection=3Dnone -m32 -msoft-float -mregparm=3D3 -freg-struct-return -=
fno-pic -mstack-alignment=3D4 -march=3Di486 -mtune=3Dgeneric -mstack-protec=
tor-guard-reg=3Dfs -mstack-protector-guard-symbol=3D__ref_stack_chk_guard -=
Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-c=
hecks -O2 -fstack-protector-strong -fno-omit-frame-pointer -fno-optimize-si=
bling-calls -ftrivial-auto-var-init=3Dzero -fno-stack-clash-protection -fze=
ro-call-used-regs=3Dused-gpr -fno-lto -flto=3Dthin -fsplit-lto-unit -fvisib=
ility=3Dhidden -falign-functions=3D16 -fstrict-flex-arrays=3D3 -fno-strict-=
overflow -fno-stack-check -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=
=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-ty=
pe -Werror=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -Wno-fra=
me-address -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-p=
rototypes -Wno-gnu -Wno-format-overflow-non-kprintf -Wno-format-truncation-=
non-kprintf -Wno-pointer-sign -Wcast-function-type -Wimplicit-fallthrough -=
Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wenum-conversion -=
Wunused -Wmissing-format-attribute -Wmissing-include-dirs -Wunused-const-va=
riable -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-negative=
-value -Wno-enum-enum-conversion -Wno-sign-compare -Wno-unused-parameter -g=
 -gdwarf-5 -gz=3Dzlib -Wno-error=3Dreturn-type -Wreturn-type -funsigned-cha=
r -Wundef -fdebug-info-for-profiling -mllvm -enable-fs-discriminator=3Dtrue=
 -mllvm -improved-fs-discriminator=3Dtrue -Iarch/x86/events/amd -Iarch/x86/=
events/amd -DKBUILD_MODFILE=3D"arch/x86/events/amd/brs" -DKBUILD_BASENAME=
=3D"brs" -DKBUILD_MODNAME=3D"brs" -D__KBUILD_MODNAME=3Dkmod_brs -c -o arch/=
x86/events/amd/brs.o arch/x86/events/amd/brs.c
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
-allowspeculation>,loop-rotate<header-duplication;prepare-for-lto>,licm<all=
owspeculation>,simple-loop-unswitch<no-nontrivial;trivial>),simplifycfg<bon=
us-inst-threshold=3D1;no-forward-switch-cond;switch-range-to-icmp;no-switch=
-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-cond=
-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-spe=
culate-unpredictables>,instcombine<max-iterations=3D1;no-verify-fixpoint>,l=
oop(loop-idiom,indvars,extra-simple-loop-unswitch-passes,loop-deletion,loop=
-unroll-full),sroa<modify-cfg>,vector-combine,mldst-motion<no-split-footer-=
bb>,gvn<>,sccp,bdce,instcombine<max-iterations=3D1;no-verify-fixpoint>,jump=
-threading,correlated-propagation,adce,memcpyopt,dse,move-auto-init,loop-ms=
sa(licm<allowspeculation>),coro-elide,simplifycfg<bonus-inst-threshold=3D1;=
no-forward-switch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-loops;=
hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;sink-common-ins=
ts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,instc=
ombine<max-iterations=3D1;no-verify-fixpoint>),function-attrs,function(requ=
ire<should-not-run-function-passes>))),function(invalidate<should-not-run-f=
unction-passes>),cgscc(devirt<4>())" on module "arch/x86/events/amd/brs.c"
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
cm<no-allowspeculation>,loop-rotate<header-duplication;prepare-for-lto>,lic=
m<allowspeculation>,simple-loop-unswitch<no-nontrivial;trivial>),simplifycf=
g<bonus-inst-threshold=3D1;no-forward-switch-cond;switch-range-to-icmp;no-s=
witch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with=
-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;n=
o-speculate-unpredictables>,instcombine<max-iterations=3D1;no-verify-fixpoi=
nt>,loop(loop-idiom,indvars,extra-simple-loop-unswitch-passes,loop-deletion=
,loop-unroll-full),sroa<modify-cfg>,vector-combine,mldst-motion<no-split-fo=
oter-bb>,gvn<>,sccp,bdce,instcombine<max-iterations=3D1;no-verify-fixpoint>=
,jump-threading,correlated-propagation,adce,memcpyopt,dse,move-auto-init,lo=
op-mssa(licm<allowspeculation>),coro-elide,simplifycfg<bonus-inst-threshold=
=3D1;no-forward-switch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-l=
oops;hoist-common-insts;no-hoist-loads-stores-with-cond-faulting;sink-commo=
n-insts;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,=
instcombine<max-iterations=3D1;no-verify-fixpoint>),function-attrs,function=
(require<should-not-run-function-passes>)))" on module "arch/x86/events/amd=
/brs.c"
   5.	Running pass "correlated-propagation" on function "amd_pmu_brs_sched_=
task"
   #0 0x0000563a0d383b4b llvm::sys::PrintStackTrace(llvm::raw_ostream&, int=
) (clang-20+0x3d3eb4b)
   #1 0x0000563a0d381ae4 llvm::sys::CleanupOnSignal(unsigned long) (clang-2=
0+0x3d3cae4)
   #2 0x0000563a0d2d1f28 CrashRecoverySignalHandler(int) CrashRecoveryConte=
xt.cpp:0:0
   #3 0x00007f6ead81d050 (/lib/x86_64-linux-gnu/libc.so.6+0x3c050)
   #4 0x0000563a0cbd8670 llvm::AttributeList::getAttributeAtIndex(unsigned =
int, llvm::Attribute::AttrKind) const (clang-20+0x3593670)
   #5 0x0000563a0cca1453 llvm::Argument::getRange() const (clang-20+0x365c4=
53)
   #6 0x0000563a0c401e16 llvm::LazyValueInfoImpl::solveBlockValueNonLocal(l=
lvm::Value*, llvm::BasicBlock*) (clang-20+0x2dbce16)
   #7 0x0000563a0c402270 llvm::LazyValueInfoImpl::solveBlockValueImpl(llvm:=
:Value*, llvm::BasicBlock*) (clang-20+0x2dbd270)
   #8 0x0000563a0c4025fd llvm::LazyValueInfoImpl::solve() (clang-20+0x2dbd5=
fd)
   #9 0x0000563a0c404158 llvm::LazyValueInfoImpl::getValueOnEdge(llvm::Valu=
e*, llvm::BasicBlock*, llvm::BasicBlock*, llvm::Instruction*) (clang-20+0x2=
dbf158)
   #10 0x0000563a0c404e88 llvm::LazyValueInfo::getConstantOnEdge(llvm::Valu=
e*, llvm::BasicBlock*, llvm::BasicBlock*, llvm::Instruction*) (clang-20+0x2=
dbfe88)
   #11 0x0000563a10e08876 runImpl(llvm::Function&, llvm::LazyValueInfo*, ll=
vm::DominatorTree*, llvm::SimplifyQuery const&) CorrelatedValuePropagation.=
cpp:0:0
   #12 0x0000563a10e0ad4a llvm::CorrelatedValuePropagationPass::run(llvm::F=
unction&, llvm::AnalysisManager<llvm::Function>&) (clang-20+0x77c5d4a)
   #13 0x0000563a0e7a339d llvm::detail::PassModel<llvm::Function, llvm::Cor=
relatedValuePropagationPass, llvm::AnalysisManager<llvm::Function>>::run(ll=
vm::Function&, llvm::AnalysisManager<llvm::Function>&) (clang-20+0x515e39d)
   #14 0x0000563a0cd5935b llvm::PassManager<llvm::Function, llvm::AnalysisM=
anager<llvm::Function>>::run(llvm::Function&, llvm::AnalysisManager<llvm::F=
unction>&) (clang-20+0x371435b)
   #15 0x0000563a0aa62e1d llvm::detail::PassModel<llvm::Function, llvm::Pas=
sManager<llvm::Function, llvm::AnalysisManager<llvm::Function>>, llvm::Anal=
ysisManager<llvm::Function>>::run(llvm::Function&, llvm::AnalysisManager<ll=
vm::Function>&) (clang-20+0x141de1d)
   #16 0x0000563a0c33ebfa llvm::CGSCCToFunctionPassAdaptor::run(llvm::LazyC=
allGraph::SCC&, llvm::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyC=
allGraph&>&, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&) (clang-20+0x2c=
f9bfa)
   #17 0x0000563a0aa6328d llvm::detail::PassModel<llvm::LazyCallGraph::SCC,=
 llvm::CGSCCToFunctionPassAdaptor, llvm::AnalysisManager<llvm::LazyCallGrap=
h::SCC, llvm::LazyCallGraph&>, llvm::LazyCallGraph&, llvm::CGSCCUpdateResul=
t&>::run(llvm::LazyCallGraph::SCC&, llvm::AnalysisManager<llvm::LazyCallGra=
ph::SCC, llvm::LazyCallGraph&>&, llvm::LazyCallGraph&, llvm::CGSCCUpdateRes=
ult&) (clang-20+0x141e28d)
   #18 0x0000563a0c338a98 llvm::PassManager<llvm::LazyCallGraph::SCC, llvm:=
:AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyCallGraph&>, llvm::Laz=
yCallGraph&, llvm::CGSCCUpdateResult&>::run(llvm::LazyCallGraph::SCC&, llvm=
::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyCallGraph&>&, llvm::L=
azyCallGraph&, llvm::CGSCCUpdateResult&) (clang-20+0x2cf3a98)
   #19 0x0000563a0e7a241d llvm::detail::PassModel<llvm::LazyCallGraph::SCC,=
 llvm::PassManager<llvm::LazyCallGraph::SCC, llvm::AnalysisManager<llvm::La=
zyCallGraph::SCC, llvm::LazyCallGraph&>, llvm::LazyCallGraph&, llvm::CGSCCU=
pdateResult&>, llvm::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyCa=
llGraph&>, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&>::run(llvm::LazyC=
allGraph::SCC&, llvm::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyC=
allGraph&>&, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&) (clang-20+0x51=
5d41d)
   #20 0x0000563a0c33fc0e llvm::DevirtSCCRepeatedPass::run(llvm::LazyCallGr=
aph::SCC&, llvm::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyCallGr=
aph&>&, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&) (clang-20+0x2cfac0e)
   #21 0x0000563a0e7a243d llvm::detail::PassModel<llvm::LazyCallGraph::SCC,=
 llvm::DevirtSCCRepeatedPass, llvm::AnalysisManager<llvm::LazyCallGraph::SC=
C, llvm::LazyCallGraph&>, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&>::=
run(llvm::LazyCallGraph::SCC&, llvm::AnalysisManager<llvm::LazyCallGraph::S=
CC, llvm::LazyCallGraph&>&, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&)=
 (clang-20+0x515d43d)
   #22 0x0000563a0c33ba73 llvm::ModuleToPostOrderCGSCCPassAdaptor::run(llvm=
::Module&, llvm::AnalysisManager<llvm::Module>&) (clang-20+0x2cf6a73)
   #23 0x0000563a0e7a23fd llvm::detail::PassModel<llvm::Module, llvm::Modul=
eToPostOrderCGSCCPassAdaptor, llvm::AnalysisManager<llvm::Module>>::run(llv=
m::Module&, llvm::AnalysisManager<llvm::Module>&) (clang-20+0x515d3fd)
   #24 0x0000563a0cd53d93 llvm::PassManager<llvm::Module, llvm::AnalysisMan=
ager<llvm::Module>>::run(llvm::Module&, llvm::AnalysisManager<llvm::Module>=
&) (clang-20+0x370ed93)
   #25 0x0000563a0e99edb3 llvm::ModuleInlinerWrapperPass::run(llvm::Module&=
, llvm::AnalysisManager<llvm::Module>&) (clang-20+0x5359db3)
   #26 0x0000563a0e7a1f7d llvm::detail::PassModel<llvm::Module, llvm::Modul=
eInlinerWrapperPass, llvm::AnalysisManager<llvm::Module>>::run(llvm::Module=
&, llvm::AnalysisManager<llvm::Module>&) (clang-20+0x515cf7d)
   #27 0x0000563a0cd53d93 llvm::PassManager<llvm::Module, llvm::AnalysisMan=
ager<llvm::Module>>::run(llvm::Module&, llvm::AnalysisManager<llvm::Module>=
&) (clang-20+0x370ed93)
   #28 0x0000563a0d618500 (anonymous namespace)::EmitAssemblyHelper::RunOpt=
imizationPipeline(clang::BackendAction, std::unique_ptr<llvm::raw_pwrite_st=
ream, std::default_delete<llvm::raw_pwrite_stream>>&, std::unique_ptr<llvm:=
:ToolOutputFile, std::default_delete<llvm::ToolOutputFile>>&, clang::Backen=
dConsumer*) BackendUtil.cpp:0:0
   #29 0x0000563a0d61b704 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-20+0x3fd6704)
   #30 0x0000563a0dc73a10 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-20+0x462ea10)
   #31 0x0000563a0f65057c clang::ParseAST(clang::Sema&, bool, bool) (clang-=
20+0x600b57c)
   #32 0x0000563a0df59d21 clang::FrontendAction::Execute() (clang-20+0x4914=
d21)
   #33 0x0000563a0decf37b clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-20+0x488a37b)
   #34 0x0000563a0e027837 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-20+0x49e2837)
   #35 0x0000563a0a6940b0 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-20+0x104f0b0)
   #36 0x0000563a0a68cd0a ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&) driver.cpp:0:0
   #37 0x0000563a0dcc06a9 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #38 0x0000563a0d2d22f3 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-20+0x3c8d2f3)
   #39 0x0000563a0dcc0a39 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #40 0x0000563a0dc8506c clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-20+0x464006c)
   #41 0x0000563a0dc86069 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-20+0x4641069)
   #42 0x0000563a0dc98d8c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-20+0x4653d8c)
   #43 0x0000563a0a69100e clang_main(int, char**, llvm::ToolContext const&)=
 (clang-20+0x104c00e)
   #44 0x0000563a0a55d4f3 main (clang-20+0xf184f3)
   #45 0x00007f6ead80824a (/lib/x86_64-linux-gnu/libc.so.6+0x2724a)
   #46 0x00007f6ead808305 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x27305)
   #47 0x0000563a0a68c501 _start (clang-20+0x1047501)
>> clang: error: clang frontend command failed with exit code 139 (use -v t=
o see invocation)
   clang version 20.1.7 (git://gitmirror/llvm_project 6146a88f60492b520a36f=
8f8f3231e15f3cc6082)
   Target: i386-unknown-linux-gnu
   Thread model: posix
   InstalledDir: /opt/cross/clang-6146a88f60/bin
   clang: note: diagnostic msg:
   ********************

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
