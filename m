Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504673;
	b=GcMoNxnId/6PTTQIA8uW0Fp8Nb6j0Wz1oG+N1IWQD8BHIegIK4LPWn9hH1EnxEvuaZoe
	 /Ecz7wE8xl1KgbzlWxSLRgrntL4v5/vm7eNItVAH7U1LAPU5kiGczQUyNM2DCgwktx1sM
	 CZ5PzhO+gNNX+s2ZLiDcQbEi9NyU79K+xJu4c3PurRWGB1uthLEj3WdntF1euEOrNcj+Z
	 9QI1w1exiYFg++YMyfKfqEI/DyIsLTS2TSYVD8zBorrS654uA6hLdVyjCv501ocb3WyEB
	 SuNU5s4/coIMPv/MVvu4F7LkW26DjOYkLrixYni72VZdNLIR3wBKGezEQqmWvj+iuQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504673;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=5+58ThjVlik7hFMWOVSt4DCHUiZodPFugN7lVLcYJbY=;
	b=Qnm/k7gTp7OO7B80llv9lMZl7JOliOHx32b+Xe2ajJMIiyGjNLOTFYHk2A/jNAwq5uA6
	 kb0ritSb+j69j0KZLlXduXCFuYsBbTP8a3Po65bbt57OvbGThsOVh0aCX6ApZtqaIfTje
	 Kxy6Mn59txjJ7OmP2Gu/aQjmFLp7FdZxku3ITHnzJL2+MD2PKT+YMf3O47mWcHsmDmCdQ
	 Nw0fds97VPV2u1G3XrStuPMtqFOHKbNMLoDwQLVavTsOq9RiL/pSeWirRCP2++b6reyjs
	 XFEIBq8IvuYaIqFMjz0u3x03uiV9XEUQjqbznoFYE15SZv8PNNSf4U3ZC8e9g804vug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D6z75dQ9;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9B7606A31B
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Oct 2026 13:57:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF9B7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D6z75dQ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792504672; x=1824040672;
  h=date:from:to:cc:subject:message-id;
  bh=29wrciKb8YzpNjIOo0Fn8IfwXf3EwHu1yIgbWqQeDnw=;
  b=D6z75dQ96D2Eo+pUniTOu0AkhHP3nSAt1goiVGIb0BptTotqwSBew027
   2wk4yiAEXA13HpnJsZd+XIcPPdOdmosSf+2SI3e/t2NTdtckEHtIWzwSH
   b/QnwGIVb/hNqyIYfsGv/TmE9XHOy++n4/WwKGD+TZQ6fDFVocDVcnYRY
   sXBCau083bO9R9gysLBzqbZ7eZTEVNXIqfmZOLf/MZYIOquB93EKb52By
   z+51/kNv7K3WuPHwUK7pdQmqwiFD8b70u8oDf9AGuE+T+0z5wiTIxIZIq
   PPqVZu29zVKbwX7YLaB5pLUxhvTfkqepJBvtz+g4sITdINTpVdxc40AYg
   w==;
X-CSE-ConnectionGUID: HSdndkGgS4iV0PjYaDx9gg==
X-CSE-MsgGUID: YGdLpx/wR8GnxTQcHatk5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1214391"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1214391"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 06:57:51 -0700
X-CSE-ConnectionGUID: 2RnxaZZcTPeEsbpAVE+dPQ==
X-CSE-MsgGUID: J7uAmZZ9SB+MKIoVFW0LVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3157296"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 20 Oct 2026 06:57:50 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJALc-000000006K9-0HKa;
	Tue, 20 Oct 2026 13:57:48 +0000
Date: Tue, 20 Oct 2026 15:57:35 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [kkdwivedi:cancellations 10/40] kernel/bpf/helpers.c:3453
 bpf_throw_unwind() error: we previously assumed 'ctx.aux' could be null (see
 line 3442)
Message-ID: <202610201526.283BGu2V-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>

tree:   https://github.com/kkdwivedi/linux cancellations
head:   8daf104a604c6f38a6e370a88f0c30654fa0a1e6
commit: 30f61739c9e86d00cf9114c53689953629d0e334 [10/40] bpf: Add bpf_throw_unwind() and a hook for a native bpf_throw() entry
:::::: branch date: 31 minutes ago
:::::: commit date: 24 hours ago
config: arm64-randconfig-r2202-20261020 (https://download.01.org/0day-ci/archive/20261020/202610201526.283BGu2V-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610201526.283BGu2V-lkp@intel.com/

smatch warnings:
kernel/bpf/helpers.c:3453 bpf_throw_unwind() error: we previously assumed 'ctx.aux' could be null (see line 3442)

vim +3453 kernel/bpf/helpers.c

f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  3429  
30f61739c9e86d Kumar Kartikeya Dwivedi 2026-10-19  3430  /*
30f61739c9e86d Kumar Kartikeya Dwivedi 2026-10-19  3431   * Unwind the stack to the exception callback of the main program. @regs is the
30f61739c9e86d Kumar Kartikeya Dwivedi 2026-10-19  3432   * BPF register file of the throw site, or NULL when the architecture has no
30f61739c9e86d Kumar Kartikeya Dwivedi 2026-10-19  3433   * native entry and the kfunc was called directly. @kind says how the throw site
30f61739c9e86d Kumar Kartikeya Dwivedi 2026-10-19  3434   * was reached.
30f61739c9e86d Kumar Kartikeya Dwivedi 2026-10-19  3435   */
30f61739c9e86d Kumar Kartikeya Dwivedi 2026-10-19  3436  void bpf_throw_unwind(struct bpf_throw_regs *regs, u64 cookie, enum bpf_throw_kind kind)
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  3437  {
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  3438  	struct bpf_throw_ctx ctx = {};
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  3439  
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  3440  	arch_bpf_stack_walk(bpf_stack_walker, &ctx);
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  3441  	WARN_ON_ONCE(!ctx.aux);
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13 @3442  	if (ctx.aux)
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  3443  		WARN_ON_ONCE(!ctx.aux->exception_boundary);
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  3444  	WARN_ON_ONCE(!ctx.bp);
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  3445  	WARN_ON_ONCE(!ctx.cnt);
b0e872a31e157d Mykyta Yatsenko         2026-08-12  3446  	/*
b0e872a31e157d Mykyta Yatsenko         2026-08-12  3447  	 * Prevent KASAN false positives for CONFIG_KASAN_STACK by unpoisoning
30f61739c9e86d Kumar Kartikeya Dwivedi 2026-10-19  3448  	 * deeper stack depths than ctx.sp as we do not return from here, which
30f61739c9e86d Kumar Kartikeya Dwivedi 2026-10-19  3449  	 * skips compiler generated instrumentation to do the same. Some
b0e872a31e157d Mykyta Yatsenko         2026-08-12  3450  	 * architectures cannot recover sp while unwinding, so fall back to bp.
ec5290a178b787 Kumar Kartikeya Dwivedi 2023-09-13  3451  	 */
b0e872a31e157d Mykyta Yatsenko         2026-08-12  3452  	kasan_unpoison_task_stack_below((void *)(long)(ctx.sp ?: ctx.bp));
18a37465b0ab52 Yonghong Song           2026-05-17 @3453  	ctx.aux->bpf_exception_cb(cookie, ctx.sp + ctx.aux->stack_arg_sp_adjust, ctx.bp, 0, 0);
fd548e1a461850 Kumar Kartikeya Dwivedi 2023-09-13  3454  	WARN(1, "A call to BPF exception callback should never return\n");
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  3455  }
f18b03fabaa9b7 Kumar Kartikeya Dwivedi 2023-09-13  3456  

:::::: The code at line 3453 was first introduced by commit
:::::: 18a37465b0ab5237a1d0ebf93a2a3b6a2da540b3 bpf,x86: Fix exception unwinding with outgoing stack arguments

:::::: TO: Yonghong Song <yonghong.song@linux.dev>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
