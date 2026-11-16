Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794794560;
	b=Ozb1KxspfChYeMNzhmMe6RRLlueTtSyrvTLGugzLTzfroWNOhUOBnnKOH8xAja+aUhvv
	 37o/Yh4iyPjxy8Wjl/qETBpVdu8QPh6N9tyqOnJ+MeU1xy9MTg8VVh/BPHIG7ViFCnBhp
	 RikmFFpVHy12J7c1DsPQBeCA12tvHBXsBMs3upzK+m2MnFZ5JY4U8fP+z+hEomHGbN+Fq
	 ETCpArxvn4fBD5N76SP6UtQC+kmgEW8lLrScGjYlXfE7ghznJbsfulCzju+3aW26oX+2A
	 cDGx4FhoPTBJA00zkHMTHzb9W5wUFsEaW5LNEVyDF4mY1P+eiBv+qcP2pKlQ2fIqHkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794794560;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=qHhSGMMs6pPlp29CKiivy9m7l5xzXT1wzGwEXWinu8g=;
	b=VVslxRLnQV37lpnxXWyrxoOjGHKLMqTZBNtLyomyLgQ1IDW9R/pDHkHv6nsCnHwxisvN
	 x4ASLa6QX/SZImc1s86nQUvpoZ/Iip43iCMJkNkFEMDO+j4Nd43B5B0+Nik1m0Su/fpAr
	 DzcqE5h0Jh/DPP6jOOelY/oIumDEtToiMtT6jokksknZD3q0b8f5ZCFYo5NHqaPk5vCpN
	 CSY8087obKxaQ6d2HbpW83gCtuuJ+ACJfEhxju0iX28NH8dWPRLrP2Iv+b6pnvIvsE/y4
	 S+L7IOWaBYg0mzYznAWWkjUiJ7SDfiVqLZa2yu6J6nKBd218eCCWN7+Ef3/XxIkXPDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cQ8n0OUJ;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B3C606A31C
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Nov 2026 02:02:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31B3C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cQ8n0OUJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794794560; x=1826330560;
  h=date:from:to:cc:subject:message-id;
  bh=xT0LJ/gpzfygYMckt78NzJUgEDPrQ2kgueEF64gJIsU=;
  b=cQ8n0OUJL4HfcihV78NjiEm5jwyzZ9ZXX8GBb06/DZgFxmRpGw62qay4
   gqRyWXOLwjOZZJq3OrjkHVcCvuztSv8zm8Z22Dpgd8hAx0fxYASmQMTP/
   nXm8bX3iCnD+s7gZn/cEewcOP2CxgJZtkt9k1kdXBHt7qdmNjcij8Kt+S
   /C8VowX1anu1Dt1D8/uUVG/DeBLBLJ77QBLAI1WUKt2m136F/lMesKanP
   rXrzMlSNr/GUhiVhxcit167laf4u/BInX6R0RTvxTB8Upp4ChLXOG+PMG
   pjaNpwLia5EWRJMq8rh9By+n0gF6o+R6arxu+e1F+oOF3GbB4LB9pYfnA
   w==;
X-CSE-ConnectionGUID: /mYCuK9fTeaw1V40sGDh6g==
X-CSE-MsgGUID: WblBJIbnTbeiuiHoSluqXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3599882"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3599882"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 18:02:40 -0800
X-CSE-ConnectionGUID: RgIQBU2MTfKRGRKAdvB2Gg==
X-CSE-MsgGUID: pEHTr8r6QJypkbnRgU9+Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9260246"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 15 Nov 2026 18:02:38 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSm3I-000000002Yp-1Fw1;
	Mon, 16 Nov 2026 02:02:36 +0000
Date: Mon, 16 Nov 2026 03:01:57 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [kkdwivedi:cancellations-backup/20261106-fold 17/43]
 arch/powerpc/net/bpf_jit_comp.c:275:38: error: 'struct bpf_prog_aux' has no
 member named 'exception_boundary'; did you mean 'exception_cb'?
Message-ID: <202611160249.f1GX3v48-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit | /zdci/kbuild/indicators/3d/3d11666f534d45ee54d8ace9f870533edd4c14c1-reported_build_error_fbc-error"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>

tree:   https://github.com/kkdwivedi/linux cancellations-backup/20261106-fold
head:   f7a6ac447d4ea6d82d72db9b0502902d00e5be03
commit: 3d11666f534d45ee54d8ace9f870533edd4c14c1 [17/43] bpf: Remove exception_boundary, which nothing reads any more
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: powerpc64-randconfig-2002-20261115 (https://download.01.org/0day-ci/archive/20261116/202611160249.f1GX3v48-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611160249.f1GX3v48-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611160249.f1GX3v48-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/net/bpf_jit_comp.c: In function 'bpf_int_jit_compile':
>> arch/powerpc/net/bpf_jit_comp.c:275:38: error: 'struct bpf_prog_aux' has no member named 'exception_boundary'; did you mean 'exception_cb'?
     cgctx.exception_boundary = fp->aux->exception_boundary;
                                         ^~~~~~~~~~~~~~~~~~
                                         exception_cb


vim +275 arch/powerpc/net/bpf_jit_comp.c

156d985123b6d6 Abhishek Dubey          2026-04-01  190  
d9ef13f72711f2 Xu Kuohai               2026-04-16  191  struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_prog *fp)
4ea76e90a97d22 Christophe Leroy        2021-03-22  192  {
4ea76e90a97d22 Christophe Leroy        2021-03-22  193  	u32 proglen;
4ea76e90a97d22 Christophe Leroy        2021-03-22  194  	u32 alloclen;
4ea76e90a97d22 Christophe Leroy        2021-03-22  195  	u8 *image = NULL;
156d985123b6d6 Abhishek Dubey          2026-04-01  196  	u32 *code_base = NULL;
156d985123b6d6 Abhishek Dubey          2026-04-01  197  	u32 *addrs = NULL;
156d985123b6d6 Abhishek Dubey          2026-04-01  198  	struct powerpc_jit_data *jit_data = NULL;
4ea76e90a97d22 Christophe Leroy        2021-03-22  199  	struct codegen_context cgctx;
4ea76e90a97d22 Christophe Leroy        2021-03-22  200  	int pass;
4ea76e90a97d22 Christophe Leroy        2021-03-22  201  	int flen;
156d985123b6d6 Abhishek Dubey          2026-04-01  202  	int priv_stack_alloc_size;
156d985123b6d6 Abhishek Dubey          2026-04-01  203  	void __percpu *priv_stack_ptr = NULL;
90d862f370b6e9 Hari Bathini            2023-10-20  204  	struct bpf_binary_header *fhdr = NULL;
90d862f370b6e9 Hari Bathini            2023-10-20  205  	struct bpf_binary_header *hdr = NULL;
4ea76e90a97d22 Christophe Leroy        2021-03-22  206  	bool extra_pass = false;
90d862f370b6e9 Hari Bathini            2023-10-20  207  	u8 *fimage = NULL;
156d985123b6d6 Abhishek Dubey          2026-04-01  208  	u32 *fcode_base = NULL;
983bdc0245a29c Ravi Bangoria           2021-10-12  209  	u32 extable_len;
983bdc0245a29c Ravi Bangoria           2021-10-12  210  	u32 fixup_len;
4ea76e90a97d22 Christophe Leroy        2021-03-22  211  
4ea76e90a97d22 Christophe Leroy        2021-03-22  212  	if (!fp->jit_requested)
d3e945223e0158 Xu Kuohai               2026-04-16  213  		return fp;
4ea76e90a97d22 Christophe Leroy        2021-03-22  214  
4ea76e90a97d22 Christophe Leroy        2021-03-22  215  	jit_data = fp->aux->jit_data;
4ea76e90a97d22 Christophe Leroy        2021-03-22  216  	if (!jit_data) {
bf4afc53b77aea Linus Torvalds          2026-02-21  217  		jit_data = kzalloc_obj(*jit_data);
d3e945223e0158 Xu Kuohai               2026-04-16  218  		if (!jit_data)
d3e945223e0158 Xu Kuohai               2026-04-16  219  			return fp;
4ea76e90a97d22 Christophe Leroy        2021-03-22  220  		fp->aux->jit_data = jit_data;
4ea76e90a97d22 Christophe Leroy        2021-03-22  221  	}
4ea76e90a97d22 Christophe Leroy        2021-03-22  222  
156d985123b6d6 Abhishek Dubey          2026-04-01  223  	priv_stack_ptr = fp->aux->priv_stack_ptr;
156d985123b6d6 Abhishek Dubey          2026-04-01  224  	if (!priv_stack_ptr && fp->aux->jits_use_priv_stack) {
156d985123b6d6 Abhishek Dubey          2026-04-01  225  		/*
156d985123b6d6 Abhishek Dubey          2026-04-01  226  		 * Allocate private stack of size equivalent to
156d985123b6d6 Abhishek Dubey          2026-04-01  227  		 * verifier-calculated stack size plus two memory
156d985123b6d6 Abhishek Dubey          2026-04-01  228  		 * guard regions to detect private stack overflow
156d985123b6d6 Abhishek Dubey          2026-04-01  229  		 * and underflow.
156d985123b6d6 Abhishek Dubey          2026-04-01  230  		 */
156d985123b6d6 Abhishek Dubey          2026-04-01  231  		priv_stack_alloc_size = round_up(fp->aux->stack_depth, 16) +
156d985123b6d6 Abhishek Dubey          2026-04-01  232  							2 * PRIV_STACK_GUARD_SZ;
156d985123b6d6 Abhishek Dubey          2026-04-01  233  		priv_stack_ptr = __alloc_percpu_gfp(priv_stack_alloc_size, 16, GFP_KERNEL);
d3e945223e0158 Xu Kuohai               2026-04-16  234  		if (!priv_stack_ptr)
156d985123b6d6 Abhishek Dubey          2026-04-01  235  			goto out_priv_stack;
156d985123b6d6 Abhishek Dubey          2026-04-01  236  
156d985123b6d6 Abhishek Dubey          2026-04-01  237  		priv_stack_init_guard(priv_stack_ptr, priv_stack_alloc_size);
156d985123b6d6 Abhishek Dubey          2026-04-01  238  		fp->aux->priv_stack_ptr = priv_stack_ptr;
156d985123b6d6 Abhishek Dubey          2026-04-01  239  	}
156d985123b6d6 Abhishek Dubey          2026-04-01  240  
4ea76e90a97d22 Christophe Leroy        2021-03-22  241  	flen = fp->len;
4ea76e90a97d22 Christophe Leroy        2021-03-22  242  	addrs = jit_data->addrs;
4ea76e90a97d22 Christophe Leroy        2021-03-22  243  	if (addrs) {
4ea76e90a97d22 Christophe Leroy        2021-03-22  244  		cgctx = jit_data->ctx;
90d862f370b6e9 Hari Bathini            2023-10-20  245  		/*
90d862f370b6e9 Hari Bathini            2023-10-20  246  		 * JIT compiled to a writable location (image/code_base) first.
90d862f370b6e9 Hari Bathini            2023-10-20  247  		 * It is then moved to the readonly final location (fimage/fcode_base)
90d862f370b6e9 Hari Bathini            2023-10-20  248  		 * using instruction patching.
90d862f370b6e9 Hari Bathini            2023-10-20  249  		 */
90d862f370b6e9 Hari Bathini            2023-10-20  250  		fimage = jit_data->fimage;
90d862f370b6e9 Hari Bathini            2023-10-20  251  		fhdr = jit_data->fhdr;
4ea76e90a97d22 Christophe Leroy        2021-03-22  252  		proglen = jit_data->proglen;
90d862f370b6e9 Hari Bathini            2023-10-20  253  		hdr = jit_data->hdr;
90d862f370b6e9 Hari Bathini            2023-10-20  254  		image = (void *)hdr + ((void *)fimage - (void *)fhdr);
4ea76e90a97d22 Christophe Leroy        2021-03-22  255  		extra_pass = true;
35a4b8ce4ac00e Hari Bathini            2023-04-25  256  		/* During extra pass, ensure index is reset before repopulating extable entries */
35a4b8ce4ac00e Hari Bathini            2023-04-25  257  		cgctx.exentry_idx = 0;
4ea76e90a97d22 Christophe Leroy        2021-03-22  258  		goto skip_init_ctx;
4ea76e90a97d22 Christophe Leroy        2021-03-22  259  	}
4ea76e90a97d22 Christophe Leroy        2021-03-22  260  
4ea76e90a97d22 Christophe Leroy        2021-03-22  261  	addrs = kcalloc(flen + 1, sizeof(*addrs), GFP_KERNEL);
d3e945223e0158 Xu Kuohai               2026-04-16  262  	if (addrs == NULL)
d3e945223e0158 Xu Kuohai               2026-04-16  263  		goto out_err;
4ea76e90a97d22 Christophe Leroy        2021-03-22  264  
4ea76e90a97d22 Christophe Leroy        2021-03-22  265  	memset(&cgctx, 0, sizeof(struct codegen_context));
49c3af43e65fbc Naveen N Rao            2022-02-14  266  	bpf_jit_init_reg_mapping(&cgctx);
4ea76e90a97d22 Christophe Leroy        2021-03-22  267  
4ea76e90a97d22 Christophe Leroy        2021-03-22  268  	/* Make sure that the stack is quadword aligned. */
4ea76e90a97d22 Christophe Leroy        2021-03-22  269  	cgctx.stack_size = round_up(fp->aux->stack_depth, 16);
a8471eb0747f08 Kumar Kartikeya Dwivedi 2026-10-19  270  	if (bpf_prog_uses_arena_insns(fp)) {
47c7f3b7038787 Saket Kumar Bhaskar     2025-09-04  271  		cgctx.arena_vm_start = bpf_arena_get_kern_vm_start(fp->aux->arena);
a2485d06cad374 Saket Kumar Bhaskar     2025-09-04  272  		cgctx.user_vm_start = bpf_arena_get_user_vm_start(fp->aux->arena);
a8471eb0747f08 Kumar Kartikeya Dwivedi 2026-10-19  273  	}
2ed2d8f6fb3853 Abhishek Dubey          2026-01-24  274  	cgctx.is_subprog = bpf_is_subprog(fp);
c169930292f7f3 Abhishek Dubey          2026-01-24 @275  	cgctx.exception_boundary = fp->aux->exception_boundary;
c169930292f7f3 Abhishek Dubey          2026-01-24  276  	cgctx.exception_cb = fp->aux->exception_cb;
156d985123b6d6 Abhishek Dubey          2026-04-01  277  	cgctx.priv_sp = priv_stack_ptr;
156d985123b6d6 Abhishek Dubey          2026-04-01  278  	cgctx.priv_stack_size = 0;
156d985123b6d6 Abhishek Dubey          2026-04-01  279  	if (priv_stack_ptr) {
156d985123b6d6 Abhishek Dubey          2026-04-01  280  		/*
156d985123b6d6 Abhishek Dubey          2026-04-01  281  		 * priv_stack_size required for setting bpf FP inside
156d985123b6d6 Abhishek Dubey          2026-04-01  282  		 * percpu allocation.
156d985123b6d6 Abhishek Dubey          2026-04-01  283  		 * stack_size is marked 0 to prevent allocation on
156d985123b6d6 Abhishek Dubey          2026-04-01  284  		 * general stack and offset calculation don't go for
156d985123b6d6 Abhishek Dubey          2026-04-01  285  		 * a toss in bpf_jit_stack_offsetof() & bpf_jit_stack_local()
156d985123b6d6 Abhishek Dubey          2026-04-01  286  		 */
156d985123b6d6 Abhishek Dubey          2026-04-01  287  		cgctx.priv_stack_size = cgctx.stack_size;
156d985123b6d6 Abhishek Dubey          2026-04-01  288  		cgctx.stack_size = 0;
156d985123b6d6 Abhishek Dubey          2026-04-01  289  	}
4ea76e90a97d22 Christophe Leroy        2021-03-22  290  
4ea76e90a97d22 Christophe Leroy        2021-03-22  291  	/* Scouting faux-generate pass 0 */
d3e945223e0158 Xu Kuohai               2026-04-16  292  	if (bpf_jit_build_body(fp, NULL, NULL, &cgctx, addrs, 0, false))
4ea76e90a97d22 Christophe Leroy        2021-03-22  293  		/* We hit something illegal or unsupported. */
d3e945223e0158 Xu Kuohai               2026-04-16  294  		goto out_err;
4ea76e90a97d22 Christophe Leroy        2021-03-22  295  
4ea76e90a97d22 Christophe Leroy        2021-03-22  296  	/*
4ea76e90a97d22 Christophe Leroy        2021-03-22  297  	 * If we have seen a tail call, we need a second pass.
4ea76e90a97d22 Christophe Leroy        2021-03-22  298  	 * This is because bpf_jit_emit_common_epilogue() is called
4ea76e90a97d22 Christophe Leroy        2021-03-22  299  	 * from bpf_jit_emit_tail_call() with a not yet stable ctx->seen.
0ffdbce6f4a89b Naveen N Rao            2022-02-14  300  	 * We also need a second pass if we ended up with too large
0ffdbce6f4a89b Naveen N Rao            2022-02-14  301  	 * a program so as to ensure BPF_EXIT branches are in range.
4ea76e90a97d22 Christophe Leroy        2021-03-22  302  	 */
0ffdbce6f4a89b Naveen N Rao            2022-02-14  303  	if (cgctx.seen & SEEN_TAILCALL || !is_offset_in_branch_range((long)cgctx.idx * 4)) {
4ea76e90a97d22 Christophe Leroy        2021-03-22  304  		cgctx.idx = 0;
78ce55b7913a78 Abhishek Dubey          2026-09-28  305  		cgctx.alt_exit_addr = 0;
d3e945223e0158 Xu Kuohai               2026-04-16  306  		if (bpf_jit_build_body(fp, NULL, NULL, &cgctx, addrs, 0, false))
d3e945223e0158 Xu Kuohai               2026-04-16  307  			goto out_err;
4ea76e90a97d22 Christophe Leroy        2021-03-22  308  	}
4ea76e90a97d22 Christophe Leroy        2021-03-22  309  
40272035e1d0ed Christophe Leroy        2021-03-22  310  	bpf_jit_realloc_regs(&cgctx);
4ea76e90a97d22 Christophe Leroy        2021-03-22  311  	/*
4ea76e90a97d22 Christophe Leroy        2021-03-22  312  	 * Pretend to build prologue, given the features we've seen.  This will
4ea76e90a97d22 Christophe Leroy        2021-03-22  313  	 * update ctgtx.idx as it pretends to output instructions, then we can
4ea76e90a97d22 Christophe Leroy        2021-03-22  314  	 * calculate total size from idx.
4ea76e90a97d22 Christophe Leroy        2021-03-22  315  	 */
ddfb7d9db843fd Benjamin Gray           2023-10-11  316  	bpf_jit_build_prologue(NULL, &cgctx);
0ffdbce6f4a89b Naveen N Rao            2022-02-14  317  	addrs[fp->len] = cgctx.idx * 4;
04001e8ddb979f Abhishek Dubey          2026-09-28  318  	bpf_jit_build_epilogue(NULL, NULL, &cgctx);
4ea76e90a97d22 Christophe Leroy        2021-03-22  319  
983bdc0245a29c Ravi Bangoria           2021-10-12  320  	fixup_len = fp->aux->num_exentries * BPF_FIXUP_LEN * 4;
983bdc0245a29c Ravi Bangoria           2021-10-12  321  	extable_len = fp->aux->num_exentries * sizeof(struct exception_table_entry);
983bdc0245a29c Ravi Bangoria           2021-10-12  322  
4ea76e90a97d22 Christophe Leroy        2021-03-22  323  	proglen = cgctx.idx * 4;
983bdc0245a29c Ravi Bangoria           2021-10-12  324  	alloclen = proglen + FUNCTION_DESCR_SIZE + fixup_len + extable_len;
4ea76e90a97d22 Christophe Leroy        2021-03-22  325  
90d862f370b6e9 Hari Bathini            2023-10-20  326  	fhdr = bpf_jit_binary_pack_alloc(alloclen, &fimage, 4, &hdr, &image,
0bb99f2cfaae68 Pawan Gupta             2026-06-29  327  					 bpf_jit_fill_ill_insns, bpf_prog_was_classic(fp));
d3e945223e0158 Xu Kuohai               2026-04-16  328  	if (!fhdr)
d3e945223e0158 Xu Kuohai               2026-04-16  329  		goto out_err;
4ea76e90a97d22 Christophe Leroy        2021-03-22  330  
983bdc0245a29c Ravi Bangoria           2021-10-12  331  	if (extable_len)
90d862f370b6e9 Hari Bathini            2023-10-20  332  		fp->aux->extable = (void *)fimage + FUNCTION_DESCR_SIZE + proglen + fixup_len;
983bdc0245a29c Ravi Bangoria           2021-10-12  333  
4ea76e90a97d22 Christophe Leroy        2021-03-22  334  skip_init_ctx:
4ea76e90a97d22 Christophe Leroy        2021-03-22  335  	code_base = (u32 *)(image + FUNCTION_DESCR_SIZE);
90d862f370b6e9 Hari Bathini            2023-10-20  336  	fcode_base = (u32 *)(fimage + FUNCTION_DESCR_SIZE);
4ea76e90a97d22 Christophe Leroy        2021-03-22  337  
78ce55b7913a78 Abhishek Dubey          2026-09-28  338  	/* Code generation passes 1-2+, loop until program size converges. */
78ce55b7913a78 Abhishek Dubey          2026-09-28  339  	for (pass = 1; pass <= CODEGEN_MAX_PASSES; pass++) {
78ce55b7913a78 Abhishek Dubey          2026-09-28  340  		u32 prev_proglen = proglen;
78ce55b7913a78 Abhishek Dubey          2026-09-28  341  
4ea76e90a97d22 Christophe Leroy        2021-03-22  342  		/* Now build the prologue, body code & epilogue for real. */
4ea76e90a97d22 Christophe Leroy        2021-03-22  343  		cgctx.idx = 0;
78ce55b7913a78 Abhishek Dubey          2026-09-28  344  		cgctx.exentry_idx = 0;
0ffdbce6f4a89b Naveen N Rao            2022-02-14  345  		cgctx.alt_exit_addr = 0;
4ea76e90a97d22 Christophe Leroy        2021-03-22  346  		bpf_jit_build_prologue(code_base, &cgctx);
90d862f370b6e9 Hari Bathini            2023-10-20  347  		if (bpf_jit_build_body(fp, code_base, fcode_base, &cgctx, addrs, pass,
90d862f370b6e9 Hari Bathini            2023-10-20  348  				       extra_pass)) {
90d862f370b6e9 Hari Bathini            2023-10-20  349  			bpf_arch_text_copy(&fhdr->size, &hdr->size, sizeof(hdr->size));
90d862f370b6e9 Hari Bathini            2023-10-20  350  			bpf_jit_binary_pack_free(fhdr, hdr);
d3e945223e0158 Xu Kuohai               2026-04-16  351  			goto out_err;
3832ba4e283d70 Naveen N Rao            2021-10-06  352  		}
78ce55b7913a78 Abhishek Dubey          2026-09-28  353  		addrs[fp->len] = cgctx.idx * 4;
04001e8ddb979f Abhishek Dubey          2026-09-28  354  		bpf_jit_build_epilogue(code_base, fcode_base, &cgctx);
4ea76e90a97d22 Christophe Leroy        2021-03-22  355  
78ce55b7913a78 Abhishek Dubey          2026-09-28  356  		proglen = cgctx.idx * 4;
4ea76e90a97d22 Christophe Leroy        2021-03-22  357  
4ea76e90a97d22 Christophe Leroy        2021-03-22  358  		if (bpf_jit_enable > 1)
4ea76e90a97d22 Christophe Leroy        2021-03-22  359  			pr_info("Pass %d: shrink = %d, seen = 0x%x\n", pass,
78ce55b7913a78 Abhishek Dubey          2026-09-28  360  				prev_proglen - proglen, cgctx.seen);
78ce55b7913a78 Abhishek Dubey          2026-09-28  361  
78ce55b7913a78 Abhishek Dubey          2026-09-28  362  		/* Check if program size has converged, but ensure minimum passes */
78ce55b7913a78 Abhishek Dubey          2026-09-28  363  		if (pass >= CODEGEN_MIN_PASSES && proglen == prev_proglen)
78ce55b7913a78 Abhishek Dubey          2026-09-28  364  			break;
78ce55b7913a78 Abhishek Dubey          2026-09-28  365  
78ce55b7913a78 Abhishek Dubey          2026-09-28  366  		if (pass == CODEGEN_MAX_PASSES && proglen != prev_proglen) {
78ce55b7913a78 Abhishek Dubey          2026-09-28  367  			pr_err("BPF JIT: Program did not converge after %d passes\n",
78ce55b7913a78 Abhishek Dubey          2026-09-28  368  								CODEGEN_MAX_PASSES);
78ce55b7913a78 Abhishek Dubey          2026-09-28  369  			bpf_arch_text_copy(&fhdr->size, &hdr->size, sizeof(hdr->size));
78ce55b7913a78 Abhishek Dubey          2026-09-28  370  			bpf_jit_binary_pack_free(fhdr, hdr);
78ce55b7913a78 Abhishek Dubey          2026-09-28  371  			goto out_err;
78ce55b7913a78 Abhishek Dubey          2026-09-28  372  		}
4ea76e90a97d22 Christophe Leroy        2021-03-22  373  	}
4ea76e90a97d22 Christophe Leroy        2021-03-22  374  
4ea76e90a97d22 Christophe Leroy        2021-03-22  375  	if (bpf_jit_enable > 1)
4ea76e90a97d22 Christophe Leroy        2021-03-22  376  		/*
4ea76e90a97d22 Christophe Leroy        2021-03-22  377  		 * Note that we output the base address of the code_base
4ea76e90a97d22 Christophe Leroy        2021-03-22  378  		 * rather than image, since opcodes are in code_base.
4ea76e90a97d22 Christophe Leroy        2021-03-22  379  		 */
4ea76e90a97d22 Christophe Leroy        2021-03-22  380  		bpf_jit_dump(flen, proglen, pass, code_base);
4ea76e90a97d22 Christophe Leroy        2021-03-22  381  

:::::: The code at line 275 was first introduced by commit
:::::: c169930292f7f31a6e500803e6c5ffbb9d5e6e4b powerpc64/bpf: Support exceptions

:::::: TO: Abhishek Dubey <adubey@linux.ibm.com>
:::::: CC: Madhavan Srinivasan <maddy@linux.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
