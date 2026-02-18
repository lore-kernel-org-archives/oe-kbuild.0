Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8C43451CC
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Feb 2026 18:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771438326; cv=none; b=YR/gB0ZfCZoISAEGvLgoPHFetmyeatEzsaEFzSl8+hrZvM5NIST7/Bs/Wa4KRuSSEcL37uuQVJCACJmfvnHU9L4IBT1jCphyloQr53HFEtEzheiHOmYMGdxl5tXvF86F5ArUyHfLtAjjaqj/vpJtCMVymXiFrxLeYlSAwyuRYrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771438326; c=relaxed/simple;
	bh=AXvbBTGGrer0qfSK9mLLpA19pslDD/3dV6tAeLxjV5s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U41PQ/U7AQO/a1WV7Mi6nbWiM71JEMjazK0H+y/6ZHhg+GLa28T5cUN5fwSyPQfN0tqDY1/BZGaTwunQ89eWCItma0hsBwMpWSMmmynFOzRMFC/2Hl6HOVrDSp18uAN8C9hz9xPnsDzhZrPSSKr16rdnoqnoFNYDULCYk4PRwQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GB6m/vzi; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GB6m/vzi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771438325; x=1802974325;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AXvbBTGGrer0qfSK9mLLpA19pslDD/3dV6tAeLxjV5s=;
  b=GB6m/vzitzpVKZSV/GbgH9IMvxY98s8zk8TxZsj5IcFiBoNd6UUz6p8r
   a8rdIqASH+cpnxD8IveY73zr8778Y6j38OcCJ9ilMo9BczqQh1JcTCtTm
   mECqhcXiup3C6a37r14vXaGvrXej77VGwWV+9P//glsZ6bYwcilTKEWcd
   GmvBhTduh7RlMMR6EJ7hP9vI10B2N974gc9NOnKJomfQ2cezWHLDNYGfh
   M11kaUn2xIY/mwXyOYvb+bzQrmvMJ5wvqRGGLP/Hf/qdGSK30kY9HZpc1
   oBoY5inBqHFDSEsZ7fcg90TRnExLsQTMndfdtvI7hSV+CWaY0h9nSAaUo
   A==;
X-CSE-ConnectionGUID: w6eT6weoSSKPwGWZhL7qkQ==
X-CSE-MsgGUID: 5VpWK7WqR4+a8G3g/VWeUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72433587"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="72433587"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 10:12:04 -0800
X-CSE-ConnectionGUID: DBRb32XYRg2sDZHivbuu0g==
X-CSE-MsgGUID: 4gxPKHQ5RZyly7FTBYJZxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="218100614"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Feb 2026 10:12:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsm1o-000000012bk-3RKg;
	Wed, 18 Feb 2026 18:12:00 +0000
Date: Thu, 19 Feb 2026 02:11:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 10/16] x86/msr: Use the alternatives mechanism for
 RDMSR
Message-ID: <202602190201.SiybRmvT-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260218082133.400602-11-jgross@suse.com>
References: <20260218082133.400602-11-jgross@suse.com>
TO: Juergen Gross <jgross@suse.com>
TO: linux-kernel@vger.kernel.org
TO: x86@kernel.org
CC: Juergen Gross <jgross@suse.com>
CC: Thomas Gleixner <tglx@kernel.org>
CC: Ingo Molnar <mingo@redhat.com>
CC: Borislav Petkov <bp@alien8.de>
CC: Dave Hansen <dave.hansen@linux.intel.com>
CC: "H. Peter Anvin" <hpa@zytor.com>
CC: "Xin Li (Intel)" <xin@zytor.com>

Hi Juergen,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.19 next-20260218]
[cannot apply to tip/x86/core kvm/queue kvm/next kvm/linux-next tip/x86/tdx]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Juergen-Gross/x86-al=
ternative-Support-alt_replace_call-with-instructions-after-call/20260218-16=
3031
base:   linus/master
patch link:    https://lore.kernel.org/r/20260218082133.400602-11-jgross%40=
suse.com
patch subject: [PATCH v3 10/16] x86/msr: Use the alternatives mechanism for=
 RDMSR
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: i386-buildonly-randconfig-005-20260218 (https://download.01.org/0da=
y-ci/archive/20260219/202602190201.SiybRmvT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260219/202602190201.SiybRmvT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602190201.SiybRmvT-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
All errors (new ones prefixed by >>):

   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,drivers/cpufreq/.speedstep-lib.o.d =
-nostdinc -Iarch/x86/include -I./arch/x86/include/generated -Iinclude -I./i=
nclude -Iarch/x86/include/uapi -I./arch/x86/include/generated/uapi -Iinclud=
e/uapi -I./include/generated/uapi -include include/linux/compiler-version.h=
 -include include/linux/kconfig.h -include include/linux/compiler_types.h -=
D__KERNEL__ --target=3Dx86_64-linux-gnu -fintegrated-as -Werror=3Dunknown-w=
arning-option -Werror=3Dignored-optimization-argument -Werror=3Doption-igno=
red -Werror=3Dunused-command-line-argument -fmacro-prefix-map=3D=3D -Wundef=
 -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -funsigned-char -fno-commo=
n -fno-PIE -fno-strict-aliasing -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno=
-avx -mno-sse4a -fcf-protection=3Dnone -m32 -msoft-float -mregparm=3D3 -fre=
g-struct-return -fno-pic -mstack-alignment=3D4 -march=3Dpentium-mmx -mstack=
-protector-guard-reg=3Dfs -mstack-protector-guard-symbol=3D__ref_stack_chk_=
guard -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-po=
inter-checks -Os -fstack-protector -fno-omit-frame-pointer -fno-optimize-si=
bling-calls -ftrivial-auto-var-init=3Dpattern -fno-stack-clash-protection -=
fzero-call-used-regs=3Dused-gpr -falign-functions=3D16 -fstrict-flex-arrays=
=3D3 -fms-extensions -fno-strict-overflow -fno-stack-check -fno-builtin-wcs=
len -Wall -Wextra -Wundef -Werror=3Dimplicit-function-declaration -Werror=
=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-form=
at-security -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member=
 -Wmissing-declarations -Wmissing-prototypes -Wno-gnu -Wno-microsoft-anon-t=
ag -Wno-format-overflow-non-kprintf -Wno-format-truncation-non-kprintf -Wno=
-type-limits -Wno-pointer-sign -Wcast-function-type -Wimplicit-fallthrough =
-Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wenum-conversion =
-Wunused -Wmissing-format-attribute -Wmissing-include-dirs -Wunused-const-v=
ariable -Wno-missing-field-initializers -Wno-shift-negative-value -Wno-enum=
-enum-conversion -Wno-sign-compare -Wno-unused-parameter -fno-crash-diagnos=
tics -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -falign=
-functions=3D64 -fdebug-info-for-profiling -mllvm -enable-fs-discriminator=
=3Dtrue -mllvm -improved-fs-discriminator=3Dtrue -gmlt -Idrivers/cpufreq -I=
drivers/cpufreq -DMODULE -DKBUILD_BASENAME=3D\"speedstep_lib\" -DKBUILD_MOD=
NAME=3D\"speedstep_lib\" -D__KBUILD_MODNAME=3Dspeedstep_lib -c -o drivers/c=
pufreq/speedstep-lib.o drivers/cpufreq/speedstep-lib.c
   1.	<eof> parser at end of file
   2.	Optimizer
   3.	Running pass "require<globals-aa>,function(invalidate<aa>),require<pr=
ofile-summary>,cgscc(devirt<4>(inline,function-attrs<skip-non-recursive-fun=
ction-attrs>,function<eager-inv;no-rerun>(sroa<modify-cfg>,early-cse<memssa=
>,speculative-execution<only-if-divergent-target>,jump-threading,correlated=
-propagation,simplifycfg<bonus-inst-threshold=3D1;no-forward-switch-cond;sw=
itch-range-to-icmp;no-switch-to-lookup;keep-loops;no-hoist-common-insts;no-=
hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-blocks=
;simplify-cond-branch;no-speculate-unpredictables>,instcombine<max-iteratio=
ns=3D1;no-verify-fixpoint>,aggressive-instcombine,tailcallelim,simplifycfg<=
bonus-inst-threshold=3D1;no-forward-switch-cond;switch-range-to-icmp;no-swi=
tch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-with-c=
ond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branch;no-=
speculate-unpredictables>,reassociate,constraint-elimination,loop-mssa(loop=
-instsimplify,loop-simplifycfg,licm<no-allowspeculation>,loop-rotate<header=
-duplication;no-prepare-for-lto>,licm<allowspeculation>,simple-loop-unswitc=
h<no-nontrivial;trivial>),simplifycfg<bonus-inst-threshold=3D1;no-forward-s=
witch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-loops;no-hoist-com=
mon-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;spe=
culate-blocks;simplify-cond-branch;no-speculate-unpredictables>,instcombine=
<max-iterations=3D1;no-verify-fixpoint>,loop(loop-idiom,indvars,extra-simpl=
e-loop-unswitch-passes,loop-deletion,loop-unroll-full),sroa<modify-cfg>,vec=
tor-combine,mldst-motion<no-split-footer-bb>,gvn<>,sccp,bdce,instcombine<ma=
x-iterations=3D1;no-verify-fixpoint>,jump-threading,correlated-propagation,=
adce,memcpyopt,dse,move-auto-init,loop-mssa(licm<allowspeculation>),coro-el=
ide,simplifycfg<bonus-inst-threshold=3D1;no-forward-switch-cond;switch-rang=
e-to-icmp;no-switch-to-lookup;keep-loops;hoist-common-insts;no-hoist-loads-=
stores-with-cond-faulting;sink-common-insts;speculate-blocks;simplify-cond-=
branch;no-speculate-unpredictables>,instcombine<max-iterations=3D1;no-verif=
y-fixpoint>),function-attrs,function(require<should-not-run-function-passes=
>),coro-split,coro-annotation-elide)),function(invalidate<should-not-run-fu=
nction-passes>),cgscc(devirt<4>())" on module "drivers/cpufreq/speedstep-li=
b.c"
   4.	Running pass "cgscc(devirt<4>(inline,function-attrs<skip-non-recursiv=
e-function-attrs>,function<eager-inv;no-rerun>(sroa<modify-cfg>,early-cse<m=
emssa>,speculative-execution<only-if-divergent-target>,jump-threading,corre=
lated-propagation,simplifycfg<bonus-inst-threshold=3D1;no-forward-switch-co=
nd;switch-range-to-icmp;no-switch-to-lookup;keep-loops;no-hoist-common-inst=
s;no-hoist-loads-stores-with-cond-faulting;no-sink-common-insts;speculate-b=
locks;simplify-cond-branch;no-speculate-unpredictables>,instcombine<max-ite=
rations=3D1;no-verify-fixpoint>,aggressive-instcombine,tailcallelim,simplif=
ycfg<bonus-inst-threshold=3D1;no-forward-switch-cond;switch-range-to-icmp;n=
o-switch-to-lookup;keep-loops;no-hoist-common-insts;no-hoist-loads-stores-w=
ith-cond-faulting;no-sink-common-insts;speculate-blocks;simplify-cond-branc=
h;no-speculate-unpredictables>,reassociate,constraint-elimination,loop-mssa=
(loop-instsimplify,loop-simplifycfg,licm<no-allowspeculation>,loop-rotate<h=
eader-duplication;no-prepare-for-lto>,licm<allowspeculation>,simple-loop-un=
switch<no-nontrivial;trivial>),simplifycfg<bonus-inst-threshold=3D1;no-forw=
ard-switch-cond;switch-range-to-icmp;no-switch-to-lookup;keep-loops;no-hois=
t-common-insts;no-hoist-loads-stores-with-cond-faulting;no-sink-common-inst=
s;speculate-blocks;simplify-cond-branch;no-speculate-unpredictables>,instco=
mbine<max-iterations=3D1;no-verify-fixpoint>,loop(loop-idiom,indvars,extra-=
simple-loop-unswitch-passes,loop-deletion,loop-unroll-full),sroa<modify-cfg=
>,vector-combine,mldst-motion<no-split-footer-bb>,gvn<>,sccp,bdce,instcombi=
ne<max-iterations=3D1;no-verify-fixpoint>,jump-threading,correlated-propaga=
tion,adce,memcpyopt,dse,move-auto-init,loop-mssa(licm<allowspeculation>),co=
ro-elide,simplifycfg<bonus-inst-threshold=3D1;no-forward-switch-cond;switch=
-range-to-icmp;no-switch-to-lookup;keep-loops;hoist-common-insts;no-hoist-l=
oads-stores-with-cond-faulting;sink-common-insts;speculate-blocks;simplify-=
cond-branch;no-speculate-unpredictables>,instcombine<max-iterations=3D1;no-=
verify-fixpoint>),function-attrs,function(require<should-not-run-function-p=
asses>),coro-split,coro-annotation-elide))" on module "drivers/cpufreq/spee=
dstep-lib.c"
   5.	Running pass "early-cse<memssa>" on function "speedstep_get_frequency"
>> /bin/bash: line 1: 1051502 Segmentation fault      clang -Wp,-MMD,driver=
s/cpufreq/.speedstep-lib.o.d -nostdinc -Iarch/x86/include -I./arch/x86/incl=
ude/generated -Iinclude -I./include -Iarch/x86/include/uapi -I./arch/x86/in=
clude/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include inc=
lude/linux/compiler-version.h -include include/linux/kconfig.h -include inc=
lude/linux/compiler_types.h -D__KERNEL__ --target=3Dx86_64-linux-gnu -finte=
grated-as -Werror=3Dunknown-warning-option -Werror=3Dignored-optimization-a=
rgument -Werror=3Doption-ignored -Werror=3Dunused-command-line-argument -fm=
acro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wch=
ar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -mno-sse -mno-=
mmx -mno-sse2 -mno-3dnow -mno-avx -mno-sse4a -fcf-protection=3Dnone -m32 -m=
soft-float -mregparm=3D3 -freg-struct-return -fno-pic -mstack-alignment=3D4=
 -march=3Dpentium-mmx -mstack-protector-guard-reg=3Dfs -mstack-protector-gu=
ard-symbol=3D__ref_stack_chk_guard -Wno-sign-compare -fno-asynchronous-unwi=
nd-tables -fno-delete-null-pointer-checks -Os -fstack-protector -fno-omit-f=
rame-pointer -fno-optimize-sibling-calls -ftrivial-auto-var-init=3Dpattern =
-fno-stack-clash-protection -fzero-call-used-regs=3Dused-gpr -falign-functi=
ons=3D16 -fstrict-flex-arrays=3D3 -fms-extensions -fno-strict-overflow -fno=
-stack-check -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=3Dimplicit-f=
unction-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3D=
strict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -W=
no-address-of-packed-member -Wmissing-declarations -Wmissing-prototypes -Wn=
o-gnu -Wno-microsoft-anon-tag -Wno-format-overflow-non-kprintf -Wno-format-=
truncation-non-kprintf -Wno-type-limits -Wno-pointer-sign -Wcast-function-t=
ype -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Dincompatible-point=
er-types -Wenum-conversion -Wunused -Wmissing-format-attribute -Wmissing-in=
clude-dirs -Wunused-const-variable -Wno-missing-field-initializers -Wno-shi=
ft-negative-value -Wno-enum-enum-conversion -Wno-sign-compare -Wno-unused-p=
arameter -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wreturn-type -fun=
signed-char -Wundef -falign-functions=3D64 -fdebug-info-for-profiling -mllv=
m -enable-fs-discriminator=3Dtrue -mllvm -improved-fs-discriminator=3Dtrue =
-gmlt -Idrivers/cpufreq -Idrivers/cpufreq -DMODULE -DKBUILD_BASENAME=3D'"sp=
eedstep_lib"' -DKBUILD_MODNAME=3D'"speedstep_lib"' -D__KBUILD_MODNAME=3Dspe=
edstep_lib -c -o drivers/cpufreq/speedstep-lib.o drivers/cpufreq/speedstep-=
lib.c

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
