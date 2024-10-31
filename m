Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC001CDA18
	for <oe-kbuild@lists.linux.dev>; Thu, 31 Oct 2024 23:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730415660; cv=none; b=VyWmKhx6OaeKIx1cJYVE9GjakfMNQaIXnrH/rYdA2/cmzyNF1K/EdK2np+NKRTDSTJk4ICvRnG5TWms8QkASpSUFDCnnMh34ZVNSlTR5R1NLzxwXrWKk/boqmTYQrIls6v/8tSvvfjiJsmvitZ8+Z325wHyKj36V79YWhiteLEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730415660; c=relaxed/simple;
	bh=QM5zqkU4pbX9pNxInkax8jbfbZ3gudAsUj/5P5bjq7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dFo8BOuTCDq745wnpHIaPreAdNoVWZU0hOG0jBTfS25l8uoV5YIGjBErwYHm78zb7L1amoni30ALkNFIBSSmETovL++JyLnWnLvZkjXsXr3kkoMiy4pIBbJfx69Pg1aAHvcePFhjtzmqyXcGwQtaT8KNAs/Srawbokh8RvrJJTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LhNZHUwB; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LhNZHUwB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730415652; x=1761951652;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QM5zqkU4pbX9pNxInkax8jbfbZ3gudAsUj/5P5bjq7Q=;
  b=LhNZHUwBA+glWgDs5h/A/kYlmiTWtQFcQfLT6omTVYPmV9S0MpIFzl2I
   KtCgHvpxJCpxxgK+Q9VAp51I/CgSE4g+5Wxvko0DNOPIwQwWhAEqOclT6
   BBjU3qGcINpI0Zi/zyFapp6LFYHXhakj5UaVjca72WXlD6aoMv3zCESyJ
   vybd3EeF9Gu3eAMlmMrNeyjX9Wd2joVEOAiQpAtm3nY7petv8/vp+Qczh
   yxTvNxHVY0GNIzajUSjvVA+kux2bvY8IaHRrXofebhR9058Pc+czgB0gs
   dktLTmUvU5mZyT3t+xCJiYRd2N7ju42/N9eGsrLzyc29ZvDs6EHu1pMjy
   Q==;
X-CSE-ConnectionGUID: XhK5PqpKRGC5ncRiimiXsg==
X-CSE-MsgGUID: C2+Pl6jgTHyK5bFlhLaobQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40725982"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40725982"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 16:00:51 -0700
X-CSE-ConnectionGUID: V+0XvLVqRU6jBPP9sq0azw==
X-CSE-MsgGUID: jiaScfsaTwixgabG9J6Riw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="87382521"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 31 Oct 2024 16:00:50 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6e9n-000go2-2d;
	Thu, 31 Oct 2024 23:00:47 +0000
Date: Fri, 1 Nov 2024 07:00:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v7 17/17] powerpc64/bpf: Add support for bpf trampolines
Message-ID: <202411010614.i8hTr8C3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20241030070850.1361304-18-hbathini@linux.ibm.com>
References: <20241030070850.1361304-18-hbathini@linux.ibm.com>
TO: Hari Bathini <hbathini@linux.ibm.com>

Hi Hari,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes masahiroy-kbuild/for-next masahiroy-kbuild/fixes linus/master v6.12-rc5 next-20241031]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hari-Bathini/powerpc-trace-Account-for-fpatchable-function-entry-support-by-toolchain/20241030-151251
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20241030070850.1361304-18-hbathini%40linux.ibm.com
patch subject: [PATCH v7 17/17] powerpc64/bpf: Add support for bpf trampolines
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: powerpc64-randconfig-r054-20241101 (https://download.01.org/0day-ci/archive/20241101/202411010614.i8hTr8C3-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411010614.i8hTr8C3-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/powerpc/net/bpf_jit_comp.c:727:28-29: WARNING opportunity for max()

vim +727 arch/powerpc/net/bpf_jit_comp.c

a2ed686b996fe6 Naveen N Rao 2024-10-30  647  
a2ed686b996fe6 Naveen N Rao 2024-10-30  648  static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_image,
a2ed686b996fe6 Naveen N Rao 2024-10-30  649  					 void *rw_image_end, void *ro_image,
a2ed686b996fe6 Naveen N Rao 2024-10-30  650  					 const struct btf_func_model *m, u32 flags,
a2ed686b996fe6 Naveen N Rao 2024-10-30  651  					 struct bpf_tramp_links *tlinks,
a2ed686b996fe6 Naveen N Rao 2024-10-30  652  					 void *func_addr)
a2ed686b996fe6 Naveen N Rao 2024-10-30  653  {
a2ed686b996fe6 Naveen N Rao 2024-10-30  654  	int regs_off, nregs_off, ip_off, run_ctx_off, retval_off, nvr_off, alt_lr_off, r4_off = 0;
a2ed686b996fe6 Naveen N Rao 2024-10-30  655  	int i, ret, nr_regs, bpf_frame_size = 0, bpf_dummy_frame_size = 0, func_frame_offset;
a2ed686b996fe6 Naveen N Rao 2024-10-30  656  	struct bpf_tramp_links *fmod_ret = &tlinks[BPF_TRAMP_MODIFY_RETURN];
a2ed686b996fe6 Naveen N Rao 2024-10-30  657  	struct bpf_tramp_links *fentry = &tlinks[BPF_TRAMP_FENTRY];
a2ed686b996fe6 Naveen N Rao 2024-10-30  658  	struct bpf_tramp_links *fexit = &tlinks[BPF_TRAMP_FEXIT];
a2ed686b996fe6 Naveen N Rao 2024-10-30  659  	struct codegen_context codegen_ctx, *ctx;
a2ed686b996fe6 Naveen N Rao 2024-10-30  660  	u32 *image = (u32 *)rw_image;
a2ed686b996fe6 Naveen N Rao 2024-10-30  661  	ppc_inst_t branch_insn;
a2ed686b996fe6 Naveen N Rao 2024-10-30  662  	u32 *branches = NULL;
a2ed686b996fe6 Naveen N Rao 2024-10-30  663  	bool save_ret;
a2ed686b996fe6 Naveen N Rao 2024-10-30  664  
a2ed686b996fe6 Naveen N Rao 2024-10-30  665  	if (IS_ENABLED(CONFIG_PPC32))
a2ed686b996fe6 Naveen N Rao 2024-10-30  666  		return -EOPNOTSUPP;
a2ed686b996fe6 Naveen N Rao 2024-10-30  667  
a2ed686b996fe6 Naveen N Rao 2024-10-30  668  	nr_regs = m->nr_args;
a2ed686b996fe6 Naveen N Rao 2024-10-30  669  	/* Extra registers for struct arguments */
a2ed686b996fe6 Naveen N Rao 2024-10-30  670  	for (i = 0; i < m->nr_args; i++)
a2ed686b996fe6 Naveen N Rao 2024-10-30  671  		if (m->arg_size[i] > SZL)
a2ed686b996fe6 Naveen N Rao 2024-10-30  672  			nr_regs += round_up(m->arg_size[i], SZL) / SZL - 1;
a2ed686b996fe6 Naveen N Rao 2024-10-30  673  
a2ed686b996fe6 Naveen N Rao 2024-10-30  674  	if (nr_regs > MAX_BPF_FUNC_ARGS)
a2ed686b996fe6 Naveen N Rao 2024-10-30  675  		return -EOPNOTSUPP;
a2ed686b996fe6 Naveen N Rao 2024-10-30  676  
a2ed686b996fe6 Naveen N Rao 2024-10-30  677  	ctx = &codegen_ctx;
a2ed686b996fe6 Naveen N Rao 2024-10-30  678  	memset(ctx, 0, sizeof(*ctx));
a2ed686b996fe6 Naveen N Rao 2024-10-30  679  
a2ed686b996fe6 Naveen N Rao 2024-10-30  680  	/*
a2ed686b996fe6 Naveen N Rao 2024-10-30  681  	 * Generated stack layout:
a2ed686b996fe6 Naveen N Rao 2024-10-30  682  	 *
a2ed686b996fe6 Naveen N Rao 2024-10-30  683  	 * func prev back chain         [ back chain        ]
a2ed686b996fe6 Naveen N Rao 2024-10-30  684  	 *                              [                   ]
a2ed686b996fe6 Naveen N Rao 2024-10-30  685  	 * bpf prog redzone/tailcallcnt [ ...               ] 64 bytes (64-bit powerpc)
a2ed686b996fe6 Naveen N Rao 2024-10-30  686  	 *                              [                   ] --
a2ed686b996fe6 Naveen N Rao 2024-10-30  687  	 * LR save area                 [ r0 save (64-bit)  ]   | header
a2ed686b996fe6 Naveen N Rao 2024-10-30  688  	 *                              [ r0 save (32-bit)  ]   |
a2ed686b996fe6 Naveen N Rao 2024-10-30  689  	 * dummy frame for unwind       [ back chain 1      ] --
a2ed686b996fe6 Naveen N Rao 2024-10-30  690  	 *                              [ padding           ] align stack frame
a2ed686b996fe6 Naveen N Rao 2024-10-30  691  	 *       r4_off                 [ r4 (tailcallcnt)  ] optional - 32-bit powerpc
a2ed686b996fe6 Naveen N Rao 2024-10-30  692  	 *       alt_lr_off             [ real lr (ool stub)] optional - actual lr
a2ed686b996fe6 Naveen N Rao 2024-10-30  693  	 *                              [ r26               ]
a2ed686b996fe6 Naveen N Rao 2024-10-30  694  	 *       nvr_off                [ r25               ] nvr save area
a2ed686b996fe6 Naveen N Rao 2024-10-30  695  	 *       retval_off             [ return value      ]
a2ed686b996fe6 Naveen N Rao 2024-10-30  696  	 *                              [ reg argN          ]
a2ed686b996fe6 Naveen N Rao 2024-10-30  697  	 *                              [ ...               ]
a2ed686b996fe6 Naveen N Rao 2024-10-30  698  	 *       regs_off               [ reg_arg1          ] prog ctx context
a2ed686b996fe6 Naveen N Rao 2024-10-30  699  	 *       nregs_off              [ args count        ]
a2ed686b996fe6 Naveen N Rao 2024-10-30  700  	 *       ip_off                 [ traced function   ]
a2ed686b996fe6 Naveen N Rao 2024-10-30  701  	 *                              [ ...               ]
a2ed686b996fe6 Naveen N Rao 2024-10-30  702  	 *       run_ctx_off            [ bpf_tramp_run_ctx ]
a2ed686b996fe6 Naveen N Rao 2024-10-30  703  	 *                              [ reg argN          ]
a2ed686b996fe6 Naveen N Rao 2024-10-30  704  	 *                              [ ...               ]
a2ed686b996fe6 Naveen N Rao 2024-10-30  705  	 *       param_save_area        [ reg_arg1          ] min 8 doublewords, per ABI
a2ed686b996fe6 Naveen N Rao 2024-10-30  706  	 *                              [ TOC save (64-bit) ] --
a2ed686b996fe6 Naveen N Rao 2024-10-30  707  	 *                              [ LR save (64-bit)  ]   | header
a2ed686b996fe6 Naveen N Rao 2024-10-30  708  	 *                              [ LR save (32-bit)  ]   |
a2ed686b996fe6 Naveen N Rao 2024-10-30  709  	 * bpf trampoline frame	        [ back chain 2      ] --
a2ed686b996fe6 Naveen N Rao 2024-10-30  710  	 *
a2ed686b996fe6 Naveen N Rao 2024-10-30  711  	 */
a2ed686b996fe6 Naveen N Rao 2024-10-30  712  
a2ed686b996fe6 Naveen N Rao 2024-10-30  713  	/* Minimum stack frame header */
a2ed686b996fe6 Naveen N Rao 2024-10-30  714  	bpf_frame_size = STACK_FRAME_MIN_SIZE;
a2ed686b996fe6 Naveen N Rao 2024-10-30  715  
a2ed686b996fe6 Naveen N Rao 2024-10-30  716  	/*
a2ed686b996fe6 Naveen N Rao 2024-10-30  717  	 * Room for parameter save area.
a2ed686b996fe6 Naveen N Rao 2024-10-30  718  	 *
a2ed686b996fe6 Naveen N Rao 2024-10-30  719  	 * As per the ABI, this is required if we call into the traced
a2ed686b996fe6 Naveen N Rao 2024-10-30  720  	 * function (BPF_TRAMP_F_CALL_ORIG):
a2ed686b996fe6 Naveen N Rao 2024-10-30  721  	 * - if the function takes more than 8 arguments for the rest to spill onto the stack
a2ed686b996fe6 Naveen N Rao 2024-10-30  722  	 * - or, if the function has variadic arguments
a2ed686b996fe6 Naveen N Rao 2024-10-30  723  	 * - or, if this functions's prototype was not available to the caller
a2ed686b996fe6 Naveen N Rao 2024-10-30  724  	 *
a2ed686b996fe6 Naveen N Rao 2024-10-30  725  	 * Reserve space for at least 8 registers for now. This can be optimized later.
a2ed686b996fe6 Naveen N Rao 2024-10-30  726  	 */
a2ed686b996fe6 Naveen N Rao 2024-10-30 @727  	bpf_frame_size += (nr_regs > 8 ? nr_regs : 8) * SZL;
a2ed686b996fe6 Naveen N Rao 2024-10-30  728  
a2ed686b996fe6 Naveen N Rao 2024-10-30  729  	/* Room for struct bpf_tramp_run_ctx */
a2ed686b996fe6 Naveen N Rao 2024-10-30  730  	run_ctx_off = bpf_frame_size;
a2ed686b996fe6 Naveen N Rao 2024-10-30  731  	bpf_frame_size += round_up(sizeof(struct bpf_tramp_run_ctx), SZL);
a2ed686b996fe6 Naveen N Rao 2024-10-30  732  
a2ed686b996fe6 Naveen N Rao 2024-10-30  733  	/* Room for IP address argument */
a2ed686b996fe6 Naveen N Rao 2024-10-30  734  	ip_off = bpf_frame_size;
a2ed686b996fe6 Naveen N Rao 2024-10-30  735  	if (flags & BPF_TRAMP_F_IP_ARG)
a2ed686b996fe6 Naveen N Rao 2024-10-30  736  		bpf_frame_size += SZL;
a2ed686b996fe6 Naveen N Rao 2024-10-30  737  
a2ed686b996fe6 Naveen N Rao 2024-10-30  738  	/* Room for args count */
a2ed686b996fe6 Naveen N Rao 2024-10-30  739  	nregs_off = bpf_frame_size;
a2ed686b996fe6 Naveen N Rao 2024-10-30  740  	bpf_frame_size += SZL;
a2ed686b996fe6 Naveen N Rao 2024-10-30  741  
a2ed686b996fe6 Naveen N Rao 2024-10-30  742  	/* Room for args */
a2ed686b996fe6 Naveen N Rao 2024-10-30  743  	regs_off = bpf_frame_size;
a2ed686b996fe6 Naveen N Rao 2024-10-30  744  	bpf_frame_size += nr_regs * SZL;
a2ed686b996fe6 Naveen N Rao 2024-10-30  745  
a2ed686b996fe6 Naveen N Rao 2024-10-30  746  	/* Room for return value of func_addr or fentry prog */
a2ed686b996fe6 Naveen N Rao 2024-10-30  747  	retval_off = bpf_frame_size;
a2ed686b996fe6 Naveen N Rao 2024-10-30  748  	save_ret = flags & (BPF_TRAMP_F_CALL_ORIG | BPF_TRAMP_F_RET_FENTRY_RET);
a2ed686b996fe6 Naveen N Rao 2024-10-30  749  	if (save_ret)
a2ed686b996fe6 Naveen N Rao 2024-10-30  750  		bpf_frame_size += SZL;
a2ed686b996fe6 Naveen N Rao 2024-10-30  751  
a2ed686b996fe6 Naveen N Rao 2024-10-30  752  	/* Room for nvr save area */
a2ed686b996fe6 Naveen N Rao 2024-10-30  753  	nvr_off = bpf_frame_size;
a2ed686b996fe6 Naveen N Rao 2024-10-30  754  	bpf_frame_size += 2 * SZL;
a2ed686b996fe6 Naveen N Rao 2024-10-30  755  
a2ed686b996fe6 Naveen N Rao 2024-10-30  756  	/* Optional save area for actual LR in case of ool ftrace */
a2ed686b996fe6 Naveen N Rao 2024-10-30  757  	if (IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE)) {
a2ed686b996fe6 Naveen N Rao 2024-10-30  758  		alt_lr_off = bpf_frame_size;
a2ed686b996fe6 Naveen N Rao 2024-10-30  759  		bpf_frame_size += SZL;
a2ed686b996fe6 Naveen N Rao 2024-10-30  760  	}
a2ed686b996fe6 Naveen N Rao 2024-10-30  761  
a2ed686b996fe6 Naveen N Rao 2024-10-30  762  	if (IS_ENABLED(CONFIG_PPC32)) {
a2ed686b996fe6 Naveen N Rao 2024-10-30  763  		if (nr_regs < 2) {
a2ed686b996fe6 Naveen N Rao 2024-10-30  764  			r4_off = bpf_frame_size;
a2ed686b996fe6 Naveen N Rao 2024-10-30  765  			bpf_frame_size += SZL;
a2ed686b996fe6 Naveen N Rao 2024-10-30  766  		} else {
a2ed686b996fe6 Naveen N Rao 2024-10-30  767  			r4_off = regs_off + SZL;
a2ed686b996fe6 Naveen N Rao 2024-10-30  768  		}
a2ed686b996fe6 Naveen N Rao 2024-10-30  769  	}
a2ed686b996fe6 Naveen N Rao 2024-10-30  770  
a2ed686b996fe6 Naveen N Rao 2024-10-30  771  	/* Padding to align stack frame, if any */
a2ed686b996fe6 Naveen N Rao 2024-10-30  772  	bpf_frame_size = round_up(bpf_frame_size, SZL * 2);
a2ed686b996fe6 Naveen N Rao 2024-10-30  773  
a2ed686b996fe6 Naveen N Rao 2024-10-30  774  	/* Dummy frame size for proper unwind - includes 64-bytes red zone for 64-bit powerpc */
a2ed686b996fe6 Naveen N Rao 2024-10-30  775  	bpf_dummy_frame_size = STACK_FRAME_MIN_SIZE + 64;
a2ed686b996fe6 Naveen N Rao 2024-10-30  776  
a2ed686b996fe6 Naveen N Rao 2024-10-30  777  	/* Offset to the traced function's stack frame */
a2ed686b996fe6 Naveen N Rao 2024-10-30  778  	func_frame_offset = bpf_dummy_frame_size + bpf_frame_size;
a2ed686b996fe6 Naveen N Rao 2024-10-30  779  
a2ed686b996fe6 Naveen N Rao 2024-10-30  780  	/* Create dummy frame for unwind, store original return value */
a2ed686b996fe6 Naveen N Rao 2024-10-30  781  	EMIT(PPC_RAW_STL(_R0, _R1, PPC_LR_STKOFF));
a2ed686b996fe6 Naveen N Rao 2024-10-30  782  	/* Protect red zone where tail call count goes */
a2ed686b996fe6 Naveen N Rao 2024-10-30  783  	EMIT(PPC_RAW_STLU(_R1, _R1, -bpf_dummy_frame_size));
a2ed686b996fe6 Naveen N Rao 2024-10-30  784  
a2ed686b996fe6 Naveen N Rao 2024-10-30  785  	/* Create our stack frame */
a2ed686b996fe6 Naveen N Rao 2024-10-30  786  	EMIT(PPC_RAW_STLU(_R1, _R1, -bpf_frame_size));
a2ed686b996fe6 Naveen N Rao 2024-10-30  787  
a2ed686b996fe6 Naveen N Rao 2024-10-30  788  	/* 64-bit: Save TOC and load kernel TOC */
a2ed686b996fe6 Naveen N Rao 2024-10-30  789  	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2) && !IS_ENABLED(CONFIG_PPC_KERNEL_PCREL)) {
a2ed686b996fe6 Naveen N Rao 2024-10-30  790  		EMIT(PPC_RAW_STD(_R2, _R1, 24));
a2ed686b996fe6 Naveen N Rao 2024-10-30  791  		PPC64_LOAD_PACA();
a2ed686b996fe6 Naveen N Rao 2024-10-30  792  	}
a2ed686b996fe6 Naveen N Rao 2024-10-30  793  
a2ed686b996fe6 Naveen N Rao 2024-10-30  794  	/* 32-bit: save tail call count in r4 */
a2ed686b996fe6 Naveen N Rao 2024-10-30  795  	if (IS_ENABLED(CONFIG_PPC32) && nr_regs < 2)
a2ed686b996fe6 Naveen N Rao 2024-10-30  796  		EMIT(PPC_RAW_STL(_R4, _R1, r4_off));
a2ed686b996fe6 Naveen N Rao 2024-10-30  797  
a2ed686b996fe6 Naveen N Rao 2024-10-30  798  	bpf_trampoline_save_args(image, ctx, func_frame_offset, nr_regs, regs_off);
a2ed686b996fe6 Naveen N Rao 2024-10-30  799  
a2ed686b996fe6 Naveen N Rao 2024-10-30  800  	/* Save our return address */
a2ed686b996fe6 Naveen N Rao 2024-10-30  801  	EMIT(PPC_RAW_MFLR(_R3));
a2ed686b996fe6 Naveen N Rao 2024-10-30  802  	if (IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE))
a2ed686b996fe6 Naveen N Rao 2024-10-30  803  		EMIT(PPC_RAW_STL(_R3, _R1, alt_lr_off));
a2ed686b996fe6 Naveen N Rao 2024-10-30  804  	else
a2ed686b996fe6 Naveen N Rao 2024-10-30  805  		EMIT(PPC_RAW_STL(_R3, _R1, bpf_frame_size + PPC_LR_STKOFF));
a2ed686b996fe6 Naveen N Rao 2024-10-30  806  
a2ed686b996fe6 Naveen N Rao 2024-10-30  807  	/*
a2ed686b996fe6 Naveen N Rao 2024-10-30  808  	 * Save ip address of the traced function.
a2ed686b996fe6 Naveen N Rao 2024-10-30  809  	 * We could recover this from LR, but we will need to address for OOL trampoline,
a2ed686b996fe6 Naveen N Rao 2024-10-30  810  	 * and optional GEP area.
a2ed686b996fe6 Naveen N Rao 2024-10-30  811  	 */
a2ed686b996fe6 Naveen N Rao 2024-10-30  812  	if (IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE) || flags & BPF_TRAMP_F_IP_ARG) {
a2ed686b996fe6 Naveen N Rao 2024-10-30  813  		EMIT(PPC_RAW_LWZ(_R4, _R3, 4));
a2ed686b996fe6 Naveen N Rao 2024-10-30  814  		EMIT(PPC_RAW_SLWI(_R4, _R4, 6));
a2ed686b996fe6 Naveen N Rao 2024-10-30  815  		EMIT(PPC_RAW_SRAWI(_R4, _R4, 6));
a2ed686b996fe6 Naveen N Rao 2024-10-30  816  		EMIT(PPC_RAW_ADD(_R3, _R3, _R4));
a2ed686b996fe6 Naveen N Rao 2024-10-30  817  		EMIT(PPC_RAW_ADDI(_R3, _R3, 4));
a2ed686b996fe6 Naveen N Rao 2024-10-30  818  	}
a2ed686b996fe6 Naveen N Rao 2024-10-30  819  
a2ed686b996fe6 Naveen N Rao 2024-10-30  820  	if (flags & BPF_TRAMP_F_IP_ARG)
a2ed686b996fe6 Naveen N Rao 2024-10-30  821  		EMIT(PPC_RAW_STL(_R3, _R1, ip_off));
a2ed686b996fe6 Naveen N Rao 2024-10-30  822  
a2ed686b996fe6 Naveen N Rao 2024-10-30  823  	if (IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE))
a2ed686b996fe6 Naveen N Rao 2024-10-30  824  		/* Fake our LR for unwind */
a2ed686b996fe6 Naveen N Rao 2024-10-30  825  		EMIT(PPC_RAW_STL(_R3, _R1, bpf_frame_size + PPC_LR_STKOFF));
a2ed686b996fe6 Naveen N Rao 2024-10-30  826  
a2ed686b996fe6 Naveen N Rao 2024-10-30  827  	/* Save function arg count -- see bpf_get_func_arg_cnt() */
a2ed686b996fe6 Naveen N Rao 2024-10-30  828  	EMIT(PPC_RAW_LI(_R3, nr_regs));
a2ed686b996fe6 Naveen N Rao 2024-10-30  829  	EMIT(PPC_RAW_STL(_R3, _R1, nregs_off));
a2ed686b996fe6 Naveen N Rao 2024-10-30  830  
a2ed686b996fe6 Naveen N Rao 2024-10-30  831  	/* Save nv regs */
a2ed686b996fe6 Naveen N Rao 2024-10-30  832  	EMIT(PPC_RAW_STL(_R25, _R1, nvr_off));
a2ed686b996fe6 Naveen N Rao 2024-10-30  833  	EMIT(PPC_RAW_STL(_R26, _R1, nvr_off + SZL));
a2ed686b996fe6 Naveen N Rao 2024-10-30  834  
a2ed686b996fe6 Naveen N Rao 2024-10-30  835  	if (flags & BPF_TRAMP_F_CALL_ORIG) {
a2ed686b996fe6 Naveen N Rao 2024-10-30  836  		PPC_LI_ADDR(_R3, (unsigned long)im);
a2ed686b996fe6 Naveen N Rao 2024-10-30  837  		ret = bpf_jit_emit_func_call_rel(image, ro_image, ctx,
a2ed686b996fe6 Naveen N Rao 2024-10-30  838  						 (unsigned long)__bpf_tramp_enter);
a2ed686b996fe6 Naveen N Rao 2024-10-30  839  		if (ret)
a2ed686b996fe6 Naveen N Rao 2024-10-30  840  			return ret;
a2ed686b996fe6 Naveen N Rao 2024-10-30  841  	}
a2ed686b996fe6 Naveen N Rao 2024-10-30  842  
a2ed686b996fe6 Naveen N Rao 2024-10-30  843  	for (i = 0; i < fentry->nr_links; i++)
a2ed686b996fe6 Naveen N Rao 2024-10-30  844  		if (invoke_bpf_prog(image, ro_image, ctx, fentry->links[i], regs_off, retval_off,
a2ed686b996fe6 Naveen N Rao 2024-10-30  845  				    run_ctx_off, flags & BPF_TRAMP_F_RET_FENTRY_RET))
a2ed686b996fe6 Naveen N Rao 2024-10-30  846  			return -EINVAL;
a2ed686b996fe6 Naveen N Rao 2024-10-30  847  
a2ed686b996fe6 Naveen N Rao 2024-10-30  848  	if (fmod_ret->nr_links) {
a2ed686b996fe6 Naveen N Rao 2024-10-30  849  		branches = kcalloc(fmod_ret->nr_links, sizeof(u32), GFP_KERNEL);
a2ed686b996fe6 Naveen N Rao 2024-10-30  850  		if (!branches)
a2ed686b996fe6 Naveen N Rao 2024-10-30  851  			return -ENOMEM;
a2ed686b996fe6 Naveen N Rao 2024-10-30  852  
a2ed686b996fe6 Naveen N Rao 2024-10-30  853  		if (invoke_bpf_mod_ret(image, ro_image, ctx, fmod_ret, regs_off, retval_off,
a2ed686b996fe6 Naveen N Rao 2024-10-30  854  				       run_ctx_off, branches)) {
a2ed686b996fe6 Naveen N Rao 2024-10-30  855  			ret = -EINVAL;
a2ed686b996fe6 Naveen N Rao 2024-10-30  856  			goto cleanup;
a2ed686b996fe6 Naveen N Rao 2024-10-30  857  		}
a2ed686b996fe6 Naveen N Rao 2024-10-30  858  	}
a2ed686b996fe6 Naveen N Rao 2024-10-30  859  
a2ed686b996fe6 Naveen N Rao 2024-10-30  860  	/* Call the traced function */
a2ed686b996fe6 Naveen N Rao 2024-10-30  861  	if (flags & BPF_TRAMP_F_CALL_ORIG) {
a2ed686b996fe6 Naveen N Rao 2024-10-30  862  		/*
a2ed686b996fe6 Naveen N Rao 2024-10-30  863  		 * The address in LR save area points to the correct point in the original function
a2ed686b996fe6 Naveen N Rao 2024-10-30  864  		 * with both PPC_FTRACE_OUT_OF_LINE as well as with traditional ftrace instruction
a2ed686b996fe6 Naveen N Rao 2024-10-30  865  		 * sequence
a2ed686b996fe6 Naveen N Rao 2024-10-30  866  		 */
a2ed686b996fe6 Naveen N Rao 2024-10-30  867  		EMIT(PPC_RAW_LL(_R3, _R1, bpf_frame_size + PPC_LR_STKOFF));
a2ed686b996fe6 Naveen N Rao 2024-10-30  868  		EMIT(PPC_RAW_MTCTR(_R3));
a2ed686b996fe6 Naveen N Rao 2024-10-30  869  
a2ed686b996fe6 Naveen N Rao 2024-10-30  870  		/* Replicate tail_call_cnt before calling the original BPF prog */
a2ed686b996fe6 Naveen N Rao 2024-10-30  871  		if (flags & BPF_TRAMP_F_TAIL_CALL_CTX)
a2ed686b996fe6 Naveen N Rao 2024-10-30  872  			bpf_trampoline_setup_tail_call_cnt(image, ctx, func_frame_offset, r4_off);
a2ed686b996fe6 Naveen N Rao 2024-10-30  873  
a2ed686b996fe6 Naveen N Rao 2024-10-30  874  		/* Restore args */
a2ed686b996fe6 Naveen N Rao 2024-10-30  875  		bpf_trampoline_restore_args_stack(image, ctx, func_frame_offset, nr_regs, regs_off);
a2ed686b996fe6 Naveen N Rao 2024-10-30  876  
a2ed686b996fe6 Naveen N Rao 2024-10-30  877  		/* Restore TOC for 64-bit */
a2ed686b996fe6 Naveen N Rao 2024-10-30  878  		if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2) && !IS_ENABLED(CONFIG_PPC_KERNEL_PCREL))
a2ed686b996fe6 Naveen N Rao 2024-10-30  879  			EMIT(PPC_RAW_LD(_R2, _R1, 24));
a2ed686b996fe6 Naveen N Rao 2024-10-30  880  		EMIT(PPC_RAW_BCTRL());
a2ed686b996fe6 Naveen N Rao 2024-10-30  881  		if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2) && !IS_ENABLED(CONFIG_PPC_KERNEL_PCREL))
a2ed686b996fe6 Naveen N Rao 2024-10-30  882  			PPC64_LOAD_PACA();
a2ed686b996fe6 Naveen N Rao 2024-10-30  883  
a2ed686b996fe6 Naveen N Rao 2024-10-30  884  		/* Store return value for bpf prog to access */
a2ed686b996fe6 Naveen N Rao 2024-10-30  885  		EMIT(PPC_RAW_STL(_R3, _R1, retval_off));
a2ed686b996fe6 Naveen N Rao 2024-10-30  886  
a2ed686b996fe6 Naveen N Rao 2024-10-30  887  		/* Restore updated tail_call_cnt */
a2ed686b996fe6 Naveen N Rao 2024-10-30  888  		if (flags & BPF_TRAMP_F_TAIL_CALL_CTX)
a2ed686b996fe6 Naveen N Rao 2024-10-30  889  			bpf_trampoline_restore_tail_call_cnt(image, ctx, func_frame_offset, r4_off);
a2ed686b996fe6 Naveen N Rao 2024-10-30  890  
a2ed686b996fe6 Naveen N Rao 2024-10-30  891  		/* Reserve space to patch branch instruction to skip fexit progs */
a2ed686b996fe6 Naveen N Rao 2024-10-30  892  		im->ip_after_call = &((u32 *)ro_image)[ctx->idx];
a2ed686b996fe6 Naveen N Rao 2024-10-30  893  		EMIT(PPC_RAW_NOP());
a2ed686b996fe6 Naveen N Rao 2024-10-30  894  	}
a2ed686b996fe6 Naveen N Rao 2024-10-30  895  
a2ed686b996fe6 Naveen N Rao 2024-10-30  896  	/* Update branches saved in invoke_bpf_mod_ret with address of do_fexit */
a2ed686b996fe6 Naveen N Rao 2024-10-30  897  	for (i = 0; i < fmod_ret->nr_links && image; i++) {
a2ed686b996fe6 Naveen N Rao 2024-10-30  898  		if (create_cond_branch(&branch_insn, &image[branches[i]],
a2ed686b996fe6 Naveen N Rao 2024-10-30  899  				       (unsigned long)&image[ctx->idx], COND_NE << 16)) {
a2ed686b996fe6 Naveen N Rao 2024-10-30  900  			ret = -EINVAL;
a2ed686b996fe6 Naveen N Rao 2024-10-30  901  			goto cleanup;
a2ed686b996fe6 Naveen N Rao 2024-10-30  902  		}
a2ed686b996fe6 Naveen N Rao 2024-10-30  903  
a2ed686b996fe6 Naveen N Rao 2024-10-30  904  		image[branches[i]] = ppc_inst_val(branch_insn);
a2ed686b996fe6 Naveen N Rao 2024-10-30  905  	}
a2ed686b996fe6 Naveen N Rao 2024-10-30  906  
a2ed686b996fe6 Naveen N Rao 2024-10-30  907  	for (i = 0; i < fexit->nr_links; i++)
a2ed686b996fe6 Naveen N Rao 2024-10-30  908  		if (invoke_bpf_prog(image, ro_image, ctx, fexit->links[i], regs_off, retval_off,
a2ed686b996fe6 Naveen N Rao 2024-10-30  909  				    run_ctx_off, false)) {
a2ed686b996fe6 Naveen N Rao 2024-10-30  910  			ret = -EINVAL;
a2ed686b996fe6 Naveen N Rao 2024-10-30  911  			goto cleanup;
a2ed686b996fe6 Naveen N Rao 2024-10-30  912  		}
a2ed686b996fe6 Naveen N Rao 2024-10-30  913  
a2ed686b996fe6 Naveen N Rao 2024-10-30  914  	if (flags & BPF_TRAMP_F_CALL_ORIG) {
a2ed686b996fe6 Naveen N Rao 2024-10-30  915  		im->ip_epilogue = &((u32 *)ro_image)[ctx->idx];
a2ed686b996fe6 Naveen N Rao 2024-10-30  916  		PPC_LI_ADDR(_R3, im);
a2ed686b996fe6 Naveen N Rao 2024-10-30  917  		ret = bpf_jit_emit_func_call_rel(image, ro_image, ctx,
a2ed686b996fe6 Naveen N Rao 2024-10-30  918  						 (unsigned long)__bpf_tramp_exit);
a2ed686b996fe6 Naveen N Rao 2024-10-30  919  		if (ret)
a2ed686b996fe6 Naveen N Rao 2024-10-30  920  			goto cleanup;
a2ed686b996fe6 Naveen N Rao 2024-10-30  921  	}
a2ed686b996fe6 Naveen N Rao 2024-10-30  922  
a2ed686b996fe6 Naveen N Rao 2024-10-30  923  	if (flags & BPF_TRAMP_F_RESTORE_REGS)
a2ed686b996fe6 Naveen N Rao 2024-10-30  924  		bpf_trampoline_restore_args_regs(image, ctx, nr_regs, regs_off);
a2ed686b996fe6 Naveen N Rao 2024-10-30  925  
a2ed686b996fe6 Naveen N Rao 2024-10-30  926  	/* Restore return value of func_addr or fentry prog */
a2ed686b996fe6 Naveen N Rao 2024-10-30  927  	if (save_ret)
a2ed686b996fe6 Naveen N Rao 2024-10-30  928  		EMIT(PPC_RAW_LL(_R3, _R1, retval_off));
a2ed686b996fe6 Naveen N Rao 2024-10-30  929  
a2ed686b996fe6 Naveen N Rao 2024-10-30  930  	/* Restore nv regs */
a2ed686b996fe6 Naveen N Rao 2024-10-30  931  	EMIT(PPC_RAW_LL(_R26, _R1, nvr_off + SZL));
a2ed686b996fe6 Naveen N Rao 2024-10-30  932  	EMIT(PPC_RAW_LL(_R25, _R1, nvr_off));
a2ed686b996fe6 Naveen N Rao 2024-10-30  933  
a2ed686b996fe6 Naveen N Rao 2024-10-30  934  	/* Epilogue */
a2ed686b996fe6 Naveen N Rao 2024-10-30  935  	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2) && !IS_ENABLED(CONFIG_PPC_KERNEL_PCREL))
a2ed686b996fe6 Naveen N Rao 2024-10-30  936  		EMIT(PPC_RAW_LD(_R2, _R1, 24));
a2ed686b996fe6 Naveen N Rao 2024-10-30  937  	if (flags & BPF_TRAMP_F_SKIP_FRAME) {
a2ed686b996fe6 Naveen N Rao 2024-10-30  938  		/* Skip the traced function and return to parent */
a2ed686b996fe6 Naveen N Rao 2024-10-30  939  		EMIT(PPC_RAW_ADDI(_R1, _R1, func_frame_offset));
a2ed686b996fe6 Naveen N Rao 2024-10-30  940  		EMIT(PPC_RAW_LL(_R0, _R1, PPC_LR_STKOFF));
a2ed686b996fe6 Naveen N Rao 2024-10-30  941  		EMIT(PPC_RAW_MTLR(_R0));
a2ed686b996fe6 Naveen N Rao 2024-10-30  942  		EMIT(PPC_RAW_BLR());
a2ed686b996fe6 Naveen N Rao 2024-10-30  943  	} else {
a2ed686b996fe6 Naveen N Rao 2024-10-30  944  		if (IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE)) {
a2ed686b996fe6 Naveen N Rao 2024-10-30  945  			EMIT(PPC_RAW_LL(_R0, _R1, alt_lr_off));
a2ed686b996fe6 Naveen N Rao 2024-10-30  946  			EMIT(PPC_RAW_MTLR(_R0));
a2ed686b996fe6 Naveen N Rao 2024-10-30  947  			EMIT(PPC_RAW_ADDI(_R1, _R1, func_frame_offset));
a2ed686b996fe6 Naveen N Rao 2024-10-30  948  			EMIT(PPC_RAW_LL(_R0, _R1, PPC_LR_STKOFF));
a2ed686b996fe6 Naveen N Rao 2024-10-30  949  			EMIT(PPC_RAW_BLR());
a2ed686b996fe6 Naveen N Rao 2024-10-30  950  		} else {
a2ed686b996fe6 Naveen N Rao 2024-10-30  951  			EMIT(PPC_RAW_LL(_R0, _R1, bpf_frame_size + PPC_LR_STKOFF));
a2ed686b996fe6 Naveen N Rao 2024-10-30  952  			EMIT(PPC_RAW_MTCTR(_R0));
a2ed686b996fe6 Naveen N Rao 2024-10-30  953  			EMIT(PPC_RAW_ADDI(_R1, _R1, func_frame_offset));
a2ed686b996fe6 Naveen N Rao 2024-10-30  954  			EMIT(PPC_RAW_LL(_R0, _R1, PPC_LR_STKOFF));
a2ed686b996fe6 Naveen N Rao 2024-10-30  955  			EMIT(PPC_RAW_MTLR(_R0));
a2ed686b996fe6 Naveen N Rao 2024-10-30  956  			EMIT(PPC_RAW_BCTR());
a2ed686b996fe6 Naveen N Rao 2024-10-30  957  		}
a2ed686b996fe6 Naveen N Rao 2024-10-30  958  	}
a2ed686b996fe6 Naveen N Rao 2024-10-30  959  
a2ed686b996fe6 Naveen N Rao 2024-10-30  960  	/* Make sure the trampoline generation logic doesn't overflow */
a2ed686b996fe6 Naveen N Rao 2024-10-30  961  	if (image && WARN_ON_ONCE(&image[ctx->idx] > (u32 *)rw_image_end - BPF_INSN_SAFETY)) {
a2ed686b996fe6 Naveen N Rao 2024-10-30  962  		ret = -EFAULT;
a2ed686b996fe6 Naveen N Rao 2024-10-30  963  		goto cleanup;
a2ed686b996fe6 Naveen N Rao 2024-10-30  964  	}
a2ed686b996fe6 Naveen N Rao 2024-10-30  965  	ret = ctx->idx * 4 + BPF_INSN_SAFETY * 4;
a2ed686b996fe6 Naveen N Rao 2024-10-30  966  
a2ed686b996fe6 Naveen N Rao 2024-10-30  967  cleanup:
a2ed686b996fe6 Naveen N Rao 2024-10-30  968  	kfree(branches);
a2ed686b996fe6 Naveen N Rao 2024-10-30  969  	return ret;
a2ed686b996fe6 Naveen N Rao 2024-10-30  970  }
a2ed686b996fe6 Naveen N Rao 2024-10-30  971  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
