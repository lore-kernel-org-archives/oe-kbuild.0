Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78351FCE
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Dec 2023 09:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f3GkujGQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702115942; x=1733651942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=76LgNr5+DidW7I0/FNYwhmmQxvf2PJ8Xz7e+Dg22M70=;
  b=f3GkujGQzJ/P3EhSCaGImIxNItuAiSUj0QyX0fHWOAuTJkET1NZO6HVG
   /vzF2BKrVvpFjK/6ocOWz98YKI07ehsvQTpxLtTm36yKDGFTUfy8B1PJ3
   Hy8RXEv+Oj0if7+kgBedDar6MG16zrMQ+MJTj2UumnoT+dAijrAND/NDM
   8slc/BXGJbM2RMoFLU3T/osF/1eLjcD3drvrnc1z43+t0R11FO9q3XX7b
   WzKdJpL36TGeTNMo/TKEO1Q2w27o3UAZQrvFjv8QoMY6kXDEhXEwjD7iS
   MICikPHd8XvmqBnhYOqxVb9k21NYVjiAtrnIOg83NXKl+y1SInrpOudCw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1600442"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="1600442"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 01:59:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="890443207"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="890443207"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 09 Dec 2023 01:58:58 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBu6o-000FA9-0A;
	Sat, 09 Dec 2023 09:58:55 +0000
Date: Sat, 9 Dec 2023 17:58:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/powerpc/net/bpf_jit_comp32.c:975 bpf_jit_build_body() error: we
 previously assumed 'image' could be null (see line 973)
Message-ID: <202312091744.CHe9hDzs-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Michael Ellerman <mpe@ellerman.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f2e8a57ee9036c7d5443382b6c3c09b51a92ec7e
commit: d3921cbb6cd663193cecf04f0b170a30c6d0e390 powerpc/bpf: Only pad length-variable code at initial pass
date:   10 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 10 months ago
config: powerpc-randconfig-r071-20231209 (https://download.01.org/0day-ci/archive/20231209/202312091744.CHe9hDzs-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231209/202312091744.CHe9hDzs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312091744.CHe9hDzs-lkp@intel.com/

smatch warnings:
arch/powerpc/net/bpf_jit_comp32.c:975 bpf_jit_build_body() error: we previously assumed 'image' could be null (see line 973)

vim +/image +975 arch/powerpc/net/bpf_jit_comp32.c

51c66ad849a703 Christophe Leroy 2021-03-22  279  
51c66ad849a703 Christophe Leroy 2021-03-22  280  /* Assemble the body code between the prologue & epilogue */
51c66ad849a703 Christophe Leroy 2021-03-22  281  int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *ctx,
85e031154c7c14 Christophe Leroy 2023-02-01  282  		       u32 *addrs, int pass, bool extra_pass)
51c66ad849a703 Christophe Leroy 2021-03-22  283  {
51c66ad849a703 Christophe Leroy 2021-03-22  284  	const struct bpf_insn *insn = fp->insnsi;
51c66ad849a703 Christophe Leroy 2021-03-22  285  	int flen = fp->len;
51c66ad849a703 Christophe Leroy 2021-03-22  286  	int i, ret;
51c66ad849a703 Christophe Leroy 2021-03-22  287  
51c66ad849a703 Christophe Leroy 2021-03-22  288  	/* Start of epilogue code - will only be valid 2nd pass onwards */
51c66ad849a703 Christophe Leroy 2021-03-22  289  	u32 exit_addr = addrs[flen];
51c66ad849a703 Christophe Leroy 2021-03-22  290  
51c66ad849a703 Christophe Leroy 2021-03-22  291  	for (i = 0; i < flen; i++) {
51c66ad849a703 Christophe Leroy 2021-03-22  292  		u32 code = insn[i].code;
49c3af43e65fbc Naveen N. Rao    2022-02-14  293  		u32 dst_reg = bpf_to_ppc(insn[i].dst_reg);
51c66ad849a703 Christophe Leroy 2021-03-22  294  		u32 dst_reg_h = dst_reg - 1;
49c3af43e65fbc Naveen N. Rao    2022-02-14  295  		u32 src_reg = bpf_to_ppc(insn[i].src_reg);
51c66ad849a703 Christophe Leroy 2021-03-22  296  		u32 src_reg_h = src_reg - 1;
aea7ef8a82c0ea Hari Bathini     2022-06-10  297  		u32 ax_reg = bpf_to_ppc(BPF_REG_AX);
49c3af43e65fbc Naveen N. Rao    2022-02-14  298  		u32 tmp_reg = bpf_to_ppc(TMP_REG);
efa95f031bf38c Hari Bathini     2021-10-12  299  		u32 size = BPF_SIZE(code);
2d9206b2274349 Hari Bathini     2022-06-10  300  		u32 save_reg, ret_reg;
51c66ad849a703 Christophe Leroy 2021-03-22  301  		s16 off = insn[i].off;
51c66ad849a703 Christophe Leroy 2021-03-22  302  		s32 imm = insn[i].imm;
51c66ad849a703 Christophe Leroy 2021-03-22  303  		bool func_addr_fixed;
51c66ad849a703 Christophe Leroy 2021-03-22  304  		u64 func_addr;
51c66ad849a703 Christophe Leroy 2021-03-22  305  		u32 true_cond;
f9320c49993ca3 Naveen N. Rao    2022-01-06  306  		u32 tmp_idx;
f9320c49993ca3 Naveen N. Rao    2022-01-06  307  		int j;
51c66ad849a703 Christophe Leroy 2021-03-22  308  
51c66ad849a703 Christophe Leroy 2021-03-22  309  		/*
51c66ad849a703 Christophe Leroy 2021-03-22  310  		 * addrs[] maps a BPF bytecode address into a real offset from
51c66ad849a703 Christophe Leroy 2021-03-22  311  		 * the start of the body code.
51c66ad849a703 Christophe Leroy 2021-03-22  312  		 */
51c66ad849a703 Christophe Leroy 2021-03-22  313  		addrs[i] = ctx->idx * 4;
51c66ad849a703 Christophe Leroy 2021-03-22  314  
51c66ad849a703 Christophe Leroy 2021-03-22  315  		/*
51c66ad849a703 Christophe Leroy 2021-03-22  316  		 * As an optimization, we note down which registers
51c66ad849a703 Christophe Leroy 2021-03-22  317  		 * are used so that we can only save/restore those in our
51c66ad849a703 Christophe Leroy 2021-03-22  318  		 * prologue and epilogue. We do this here regardless of whether
51c66ad849a703 Christophe Leroy 2021-03-22  319  		 * the actual BPF instruction uses src/dst registers or not
51c66ad849a703 Christophe Leroy 2021-03-22  320  		 * (for instance, BPF_CALL does not use them). The expectation
51c66ad849a703 Christophe Leroy 2021-03-22  321  		 * is that those instructions will have src_reg/dst_reg set to
51c66ad849a703 Christophe Leroy 2021-03-22  322  		 * 0. Even otherwise, we just lose some prologue/epilogue
51c66ad849a703 Christophe Leroy 2021-03-22  323  		 * optimization but everything else should work without
51c66ad849a703 Christophe Leroy 2021-03-22  324  		 * any issues.
51c66ad849a703 Christophe Leroy 2021-03-22  325  		 */
51c66ad849a703 Christophe Leroy 2021-03-22  326  		if (dst_reg >= 3 && dst_reg < 32) {
51c66ad849a703 Christophe Leroy 2021-03-22  327  			bpf_set_seen_register(ctx, dst_reg);
51c66ad849a703 Christophe Leroy 2021-03-22  328  			bpf_set_seen_register(ctx, dst_reg_h);
51c66ad849a703 Christophe Leroy 2021-03-22  329  		}
51c66ad849a703 Christophe Leroy 2021-03-22  330  
51c66ad849a703 Christophe Leroy 2021-03-22  331  		if (src_reg >= 3 && src_reg < 32) {
51c66ad849a703 Christophe Leroy 2021-03-22  332  			bpf_set_seen_register(ctx, src_reg);
51c66ad849a703 Christophe Leroy 2021-03-22  333  			bpf_set_seen_register(ctx, src_reg_h);
51c66ad849a703 Christophe Leroy 2021-03-22  334  		}
51c66ad849a703 Christophe Leroy 2021-03-22  335  
51c66ad849a703 Christophe Leroy 2021-03-22  336  		switch (code) {
51c66ad849a703 Christophe Leroy 2021-03-22  337  		/*
51c66ad849a703 Christophe Leroy 2021-03-22  338  		 * Arithmetic operations: ADD/SUB/MUL/DIV/MOD/NEG
51c66ad849a703 Christophe Leroy 2021-03-22  339  		 */
51c66ad849a703 Christophe Leroy 2021-03-22  340  		case BPF_ALU | BPF_ADD | BPF_X: /* (u32) dst += (u32) src */
51c66ad849a703 Christophe Leroy 2021-03-22  341  			EMIT(PPC_RAW_ADD(dst_reg, dst_reg, src_reg));
51c66ad849a703 Christophe Leroy 2021-03-22  342  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  343  		case BPF_ALU64 | BPF_ADD | BPF_X: /* dst += src */
51c66ad849a703 Christophe Leroy 2021-03-22  344  			EMIT(PPC_RAW_ADDC(dst_reg, dst_reg, src_reg));
51c66ad849a703 Christophe Leroy 2021-03-22  345  			EMIT(PPC_RAW_ADDE(dst_reg_h, dst_reg_h, src_reg_h));
51c66ad849a703 Christophe Leroy 2021-03-22  346  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  347  		case BPF_ALU | BPF_SUB | BPF_X: /* (u32) dst -= (u32) src */
51c66ad849a703 Christophe Leroy 2021-03-22  348  			EMIT(PPC_RAW_SUB(dst_reg, dst_reg, src_reg));
51c66ad849a703 Christophe Leroy 2021-03-22  349  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  350  		case BPF_ALU64 | BPF_SUB | BPF_X: /* dst -= src */
51c66ad849a703 Christophe Leroy 2021-03-22  351  			EMIT(PPC_RAW_SUBFC(dst_reg, src_reg, dst_reg));
51c66ad849a703 Christophe Leroy 2021-03-22  352  			EMIT(PPC_RAW_SUBFE(dst_reg_h, src_reg_h, dst_reg_h));
51c66ad849a703 Christophe Leroy 2021-03-22  353  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  354  		case BPF_ALU | BPF_SUB | BPF_K: /* (u32) dst -= (u32) imm */
51c66ad849a703 Christophe Leroy 2021-03-22  355  			imm = -imm;
51c66ad849a703 Christophe Leroy 2021-03-22  356  			fallthrough;
51c66ad849a703 Christophe Leroy 2021-03-22  357  		case BPF_ALU | BPF_ADD | BPF_K: /* (u32) dst += (u32) imm */
51c66ad849a703 Christophe Leroy 2021-03-22  358  			if (IMM_HA(imm) & 0xffff)
51c66ad849a703 Christophe Leroy 2021-03-22  359  				EMIT(PPC_RAW_ADDIS(dst_reg, dst_reg, IMM_HA(imm)));
51c66ad849a703 Christophe Leroy 2021-03-22  360  			if (IMM_L(imm))
51c66ad849a703 Christophe Leroy 2021-03-22  361  				EMIT(PPC_RAW_ADDI(dst_reg, dst_reg, IMM_L(imm)));
51c66ad849a703 Christophe Leroy 2021-03-22  362  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  363  		case BPF_ALU64 | BPF_SUB | BPF_K: /* dst -= imm */
51c66ad849a703 Christophe Leroy 2021-03-22  364  			imm = -imm;
51c66ad849a703 Christophe Leroy 2021-03-22  365  			fallthrough;
51c66ad849a703 Christophe Leroy 2021-03-22  366  		case BPF_ALU64 | BPF_ADD | BPF_K: /* dst += imm */
51c66ad849a703 Christophe Leroy 2021-03-22  367  			if (!imm)
51c66ad849a703 Christophe Leroy 2021-03-22  368  				break;
51c66ad849a703 Christophe Leroy 2021-03-22  369  
51c66ad849a703 Christophe Leroy 2021-03-22  370  			if (imm >= -32768 && imm < 32768) {
51c66ad849a703 Christophe Leroy 2021-03-22  371  				EMIT(PPC_RAW_ADDIC(dst_reg, dst_reg, imm));
51c66ad849a703 Christophe Leroy 2021-03-22  372  			} else {
e0ea08c0cacf93 Christophe Leroy 2021-05-20  373  				PPC_LI32(_R0, imm);
e0ea08c0cacf93 Christophe Leroy 2021-05-20  374  				EMIT(PPC_RAW_ADDC(dst_reg, dst_reg, _R0));
51c66ad849a703 Christophe Leroy 2021-03-22  375  			}
548b762763b885 Naveen N. Rao    2021-10-06  376  			if (imm >= 0 || (BPF_OP(code) == BPF_SUB && imm == 0x80000000))
51c66ad849a703 Christophe Leroy 2021-03-22  377  				EMIT(PPC_RAW_ADDZE(dst_reg_h, dst_reg_h));
51c66ad849a703 Christophe Leroy 2021-03-22  378  			else
51c66ad849a703 Christophe Leroy 2021-03-22  379  				EMIT(PPC_RAW_ADDME(dst_reg_h, dst_reg_h));
51c66ad849a703 Christophe Leroy 2021-03-22  380  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  381  		case BPF_ALU64 | BPF_MUL | BPF_X: /* dst *= src */
51c66ad849a703 Christophe Leroy 2021-03-22  382  			bpf_set_seen_register(ctx, tmp_reg);
e0ea08c0cacf93 Christophe Leroy 2021-05-20  383  			EMIT(PPC_RAW_MULW(_R0, dst_reg, src_reg_h));
51c66ad849a703 Christophe Leroy 2021-03-22  384  			EMIT(PPC_RAW_MULW(dst_reg_h, dst_reg_h, src_reg));
51c66ad849a703 Christophe Leroy 2021-03-22  385  			EMIT(PPC_RAW_MULHWU(tmp_reg, dst_reg, src_reg));
51c66ad849a703 Christophe Leroy 2021-03-22  386  			EMIT(PPC_RAW_MULW(dst_reg, dst_reg, src_reg));
e0ea08c0cacf93 Christophe Leroy 2021-05-20  387  			EMIT(PPC_RAW_ADD(dst_reg_h, dst_reg_h, _R0));
51c66ad849a703 Christophe Leroy 2021-03-22  388  			EMIT(PPC_RAW_ADD(dst_reg_h, dst_reg_h, tmp_reg));
51c66ad849a703 Christophe Leroy 2021-03-22  389  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  390  		case BPF_ALU | BPF_MUL | BPF_X: /* (u32) dst *= (u32) src */
51c66ad849a703 Christophe Leroy 2021-03-22  391  			EMIT(PPC_RAW_MULW(dst_reg, dst_reg, src_reg));
51c66ad849a703 Christophe Leroy 2021-03-22  392  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  393  		case BPF_ALU | BPF_MUL | BPF_K: /* (u32) dst *= (u32) imm */
51c66ad849a703 Christophe Leroy 2021-03-22  394  			if (imm >= -32768 && imm < 32768) {
51c66ad849a703 Christophe Leroy 2021-03-22  395  				EMIT(PPC_RAW_MULI(dst_reg, dst_reg, imm));
51c66ad849a703 Christophe Leroy 2021-03-22  396  			} else {
e0ea08c0cacf93 Christophe Leroy 2021-05-20  397  				PPC_LI32(_R0, imm);
e0ea08c0cacf93 Christophe Leroy 2021-05-20  398  				EMIT(PPC_RAW_MULW(dst_reg, dst_reg, _R0));
51c66ad849a703 Christophe Leroy 2021-03-22  399  			}
51c66ad849a703 Christophe Leroy 2021-03-22  400  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  401  		case BPF_ALU64 | BPF_MUL | BPF_K: /* dst *= imm */
51c66ad849a703 Christophe Leroy 2021-03-22  402  			if (!imm) {
51c66ad849a703 Christophe Leroy 2021-03-22  403  				PPC_LI32(dst_reg, 0);
51c66ad849a703 Christophe Leroy 2021-03-22  404  				PPC_LI32(dst_reg_h, 0);
51c66ad849a703 Christophe Leroy 2021-03-22  405  				break;
51c66ad849a703 Christophe Leroy 2021-03-22  406  			}
51c66ad849a703 Christophe Leroy 2021-03-22  407  			if (imm == 1)
51c66ad849a703 Christophe Leroy 2021-03-22  408  				break;
51c66ad849a703 Christophe Leroy 2021-03-22  409  			if (imm == -1) {
51c66ad849a703 Christophe Leroy 2021-03-22  410  				EMIT(PPC_RAW_SUBFIC(dst_reg, dst_reg, 0));
51c66ad849a703 Christophe Leroy 2021-03-22  411  				EMIT(PPC_RAW_SUBFZE(dst_reg_h, dst_reg_h));
51c66ad849a703 Christophe Leroy 2021-03-22  412  				break;
51c66ad849a703 Christophe Leroy 2021-03-22  413  			}
51c66ad849a703 Christophe Leroy 2021-03-22  414  			bpf_set_seen_register(ctx, tmp_reg);
51c66ad849a703 Christophe Leroy 2021-03-22  415  			PPC_LI32(tmp_reg, imm);
51c66ad849a703 Christophe Leroy 2021-03-22  416  			EMIT(PPC_RAW_MULW(dst_reg_h, dst_reg_h, tmp_reg));
51c66ad849a703 Christophe Leroy 2021-03-22  417  			if (imm < 0)
51c66ad849a703 Christophe Leroy 2021-03-22  418  				EMIT(PPC_RAW_SUB(dst_reg_h, dst_reg_h, dst_reg));
e0ea08c0cacf93 Christophe Leroy 2021-05-20  419  			EMIT(PPC_RAW_MULHWU(_R0, dst_reg, tmp_reg));
51c66ad849a703 Christophe Leroy 2021-03-22  420  			EMIT(PPC_RAW_MULW(dst_reg, dst_reg, tmp_reg));
e0ea08c0cacf93 Christophe Leroy 2021-05-20  421  			EMIT(PPC_RAW_ADD(dst_reg_h, dst_reg_h, _R0));
51c66ad849a703 Christophe Leroy 2021-03-22  422  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  423  		case BPF_ALU | BPF_DIV | BPF_X: /* (u32) dst /= (u32) src */
51c66ad849a703 Christophe Leroy 2021-03-22  424  			EMIT(PPC_RAW_DIVWU(dst_reg, dst_reg, src_reg));
51c66ad849a703 Christophe Leroy 2021-03-22  425  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  426  		case BPF_ALU | BPF_MOD | BPF_X: /* (u32) dst %= (u32) src */
e0ea08c0cacf93 Christophe Leroy 2021-05-20  427  			EMIT(PPC_RAW_DIVWU(_R0, dst_reg, src_reg));
e0ea08c0cacf93 Christophe Leroy 2021-05-20  428  			EMIT(PPC_RAW_MULW(_R0, src_reg, _R0));
e0ea08c0cacf93 Christophe Leroy 2021-05-20  429  			EMIT(PPC_RAW_SUB(dst_reg, dst_reg, _R0));
51c66ad849a703 Christophe Leroy 2021-03-22  430  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  431  		case BPF_ALU64 | BPF_DIV | BPF_X: /* dst /= src */
51c66ad849a703 Christophe Leroy 2021-03-22  432  			return -EOPNOTSUPP;
51c66ad849a703 Christophe Leroy 2021-03-22  433  		case BPF_ALU64 | BPF_MOD | BPF_X: /* dst %= src */
51c66ad849a703 Christophe Leroy 2021-03-22  434  			return -EOPNOTSUPP;
51c66ad849a703 Christophe Leroy 2021-03-22  435  		case BPF_ALU | BPF_DIV | BPF_K: /* (u32) dst /= (u32) imm */
51c66ad849a703 Christophe Leroy 2021-03-22  436  			if (!imm)
51c66ad849a703 Christophe Leroy 2021-03-22  437  				return -EINVAL;
51c66ad849a703 Christophe Leroy 2021-03-22  438  			if (imm == 1)
51c66ad849a703 Christophe Leroy 2021-03-22  439  				break;
51c66ad849a703 Christophe Leroy 2021-03-22  440  
e0ea08c0cacf93 Christophe Leroy 2021-05-20  441  			PPC_LI32(_R0, imm);
e0ea08c0cacf93 Christophe Leroy 2021-05-20  442  			EMIT(PPC_RAW_DIVWU(dst_reg, dst_reg, _R0));
51c66ad849a703 Christophe Leroy 2021-03-22  443  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  444  		case BPF_ALU | BPF_MOD | BPF_K: /* (u32) dst %= (u32) imm */
51c66ad849a703 Christophe Leroy 2021-03-22  445  			if (!imm)
51c66ad849a703 Christophe Leroy 2021-03-22  446  				return -EINVAL;
51c66ad849a703 Christophe Leroy 2021-03-22  447  
51c66ad849a703 Christophe Leroy 2021-03-22  448  			if (!is_power_of_2((u32)imm)) {
51c66ad849a703 Christophe Leroy 2021-03-22  449  				bpf_set_seen_register(ctx, tmp_reg);
51c66ad849a703 Christophe Leroy 2021-03-22  450  				PPC_LI32(tmp_reg, imm);
e0ea08c0cacf93 Christophe Leroy 2021-05-20  451  				EMIT(PPC_RAW_DIVWU(_R0, dst_reg, tmp_reg));
e0ea08c0cacf93 Christophe Leroy 2021-05-20  452  				EMIT(PPC_RAW_MULW(_R0, tmp_reg, _R0));
e0ea08c0cacf93 Christophe Leroy 2021-05-20  453  				EMIT(PPC_RAW_SUB(dst_reg, dst_reg, _R0));
51c66ad849a703 Christophe Leroy 2021-03-22  454  				break;
51c66ad849a703 Christophe Leroy 2021-03-22  455  			}
51c66ad849a703 Christophe Leroy 2021-03-22  456  			if (imm == 1)
51c66ad849a703 Christophe Leroy 2021-03-22  457  				EMIT(PPC_RAW_LI(dst_reg, 0));
51c66ad849a703 Christophe Leroy 2021-03-22  458  			else
51c66ad849a703 Christophe Leroy 2021-03-22  459  				EMIT(PPC_RAW_RLWINM(dst_reg, dst_reg, 0, 32 - ilog2((u32)imm), 31));
51c66ad849a703 Christophe Leroy 2021-03-22  460  
51c66ad849a703 Christophe Leroy 2021-03-22  461  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  462  		case BPF_ALU64 | BPF_MOD | BPF_K: /* dst %= imm */
51c66ad849a703 Christophe Leroy 2021-03-22  463  			if (!imm)
51c66ad849a703 Christophe Leroy 2021-03-22  464  				return -EINVAL;
51c66ad849a703 Christophe Leroy 2021-03-22  465  			if (imm < 0)
51c66ad849a703 Christophe Leroy 2021-03-22  466  				imm = -imm;
51c66ad849a703 Christophe Leroy 2021-03-22  467  			if (!is_power_of_2(imm))
51c66ad849a703 Christophe Leroy 2021-03-22  468  				return -EOPNOTSUPP;
51c66ad849a703 Christophe Leroy 2021-03-22  469  			if (imm == 1)
51c66ad849a703 Christophe Leroy 2021-03-22  470  				EMIT(PPC_RAW_LI(dst_reg, 0));
51c66ad849a703 Christophe Leroy 2021-03-22  471  			else
51c66ad849a703 Christophe Leroy 2021-03-22  472  				EMIT(PPC_RAW_RLWINM(dst_reg, dst_reg, 0, 32 - ilog2(imm), 31));
51c66ad849a703 Christophe Leroy 2021-03-22  473  			EMIT(PPC_RAW_LI(dst_reg_h, 0));
51c66ad849a703 Christophe Leroy 2021-03-22  474  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  475  		case BPF_ALU64 | BPF_DIV | BPF_K: /* dst /= imm */
51c66ad849a703 Christophe Leroy 2021-03-22  476  			if (!imm)
51c66ad849a703 Christophe Leroy 2021-03-22  477  				return -EINVAL;
51c66ad849a703 Christophe Leroy 2021-03-22  478  			if (!is_power_of_2(abs(imm)))
51c66ad849a703 Christophe Leroy 2021-03-22  479  				return -EOPNOTSUPP;
51c66ad849a703 Christophe Leroy 2021-03-22  480  
51c66ad849a703 Christophe Leroy 2021-03-22  481  			if (imm < 0) {
51c66ad849a703 Christophe Leroy 2021-03-22  482  				EMIT(PPC_RAW_SUBFIC(dst_reg, dst_reg, 0));
51c66ad849a703 Christophe Leroy 2021-03-22  483  				EMIT(PPC_RAW_SUBFZE(dst_reg_h, dst_reg_h));
51c66ad849a703 Christophe Leroy 2021-03-22  484  				imm = -imm;
51c66ad849a703 Christophe Leroy 2021-03-22  485  			}
51c66ad849a703 Christophe Leroy 2021-03-22  486  			if (imm == 1)
51c66ad849a703 Christophe Leroy 2021-03-22  487  				break;
51c66ad849a703 Christophe Leroy 2021-03-22  488  			imm = ilog2(imm);
51c66ad849a703 Christophe Leroy 2021-03-22  489  			EMIT(PPC_RAW_RLWINM(dst_reg, dst_reg, 32 - imm, imm, 31));
51c66ad849a703 Christophe Leroy 2021-03-22  490  			EMIT(PPC_RAW_RLWIMI(dst_reg, dst_reg_h, 32 - imm, 0, imm - 1));
51c66ad849a703 Christophe Leroy 2021-03-22  491  			EMIT(PPC_RAW_SRAWI(dst_reg_h, dst_reg_h, imm));
51c66ad849a703 Christophe Leroy 2021-03-22  492  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  493  		case BPF_ALU | BPF_NEG: /* (u32) dst = -dst */
51c66ad849a703 Christophe Leroy 2021-03-22  494  			EMIT(PPC_RAW_NEG(dst_reg, dst_reg));
51c66ad849a703 Christophe Leroy 2021-03-22  495  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  496  		case BPF_ALU64 | BPF_NEG: /* dst = -dst */
51c66ad849a703 Christophe Leroy 2021-03-22  497  			EMIT(PPC_RAW_SUBFIC(dst_reg, dst_reg, 0));
51c66ad849a703 Christophe Leroy 2021-03-22  498  			EMIT(PPC_RAW_SUBFZE(dst_reg_h, dst_reg_h));
51c66ad849a703 Christophe Leroy 2021-03-22  499  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  500  
51c66ad849a703 Christophe Leroy 2021-03-22  501  		/*
51c66ad849a703 Christophe Leroy 2021-03-22  502  		 * Logical operations: AND/OR/XOR/[A]LSH/[A]RSH
51c66ad849a703 Christophe Leroy 2021-03-22  503  		 */
51c66ad849a703 Christophe Leroy 2021-03-22  504  		case BPF_ALU64 | BPF_AND | BPF_X: /* dst = dst & src */
51c66ad849a703 Christophe Leroy 2021-03-22  505  			EMIT(PPC_RAW_AND(dst_reg, dst_reg, src_reg));
51c66ad849a703 Christophe Leroy 2021-03-22  506  			EMIT(PPC_RAW_AND(dst_reg_h, dst_reg_h, src_reg_h));
51c66ad849a703 Christophe Leroy 2021-03-22  507  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  508  		case BPF_ALU | BPF_AND | BPF_X: /* (u32) dst = dst & src */
51c66ad849a703 Christophe Leroy 2021-03-22  509  			EMIT(PPC_RAW_AND(dst_reg, dst_reg, src_reg));
51c66ad849a703 Christophe Leroy 2021-03-22  510  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  511  		case BPF_ALU64 | BPF_AND | BPF_K: /* dst = dst & imm */
51c66ad849a703 Christophe Leroy 2021-03-22  512  			if (imm >= 0)
51c66ad849a703 Christophe Leroy 2021-03-22  513  				EMIT(PPC_RAW_LI(dst_reg_h, 0));
51c66ad849a703 Christophe Leroy 2021-03-22  514  			fallthrough;
51c66ad849a703 Christophe Leroy 2021-03-22  515  		case BPF_ALU | BPF_AND | BPF_K: /* (u32) dst = dst & imm */
51c66ad849a703 Christophe Leroy 2021-03-22  516  			if (!IMM_H(imm)) {
51c66ad849a703 Christophe Leroy 2021-03-22  517  				EMIT(PPC_RAW_ANDI(dst_reg, dst_reg, IMM_L(imm)));
51c66ad849a703 Christophe Leroy 2021-03-22  518  			} else if (!IMM_L(imm)) {
51c66ad849a703 Christophe Leroy 2021-03-22  519  				EMIT(PPC_RAW_ANDIS(dst_reg, dst_reg, IMM_H(imm)));
51c66ad849a703 Christophe Leroy 2021-03-22  520  			} else if (imm == (((1 << fls(imm)) - 1) ^ ((1 << (ffs(i) - 1)) - 1))) {
51c66ad849a703 Christophe Leroy 2021-03-22  521  				EMIT(PPC_RAW_RLWINM(dst_reg, dst_reg, 0,
51c66ad849a703 Christophe Leroy 2021-03-22  522  						    32 - fls(imm), 32 - ffs(imm)));
51c66ad849a703 Christophe Leroy 2021-03-22  523  			} else {
e0ea08c0cacf93 Christophe Leroy 2021-05-20  524  				PPC_LI32(_R0, imm);
e0ea08c0cacf93 Christophe Leroy 2021-05-20  525  				EMIT(PPC_RAW_AND(dst_reg, dst_reg, _R0));
51c66ad849a703 Christophe Leroy 2021-03-22  526  			}
51c66ad849a703 Christophe Leroy 2021-03-22  527  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  528  		case BPF_ALU64 | BPF_OR | BPF_X: /* dst = dst | src */
51c66ad849a703 Christophe Leroy 2021-03-22  529  			EMIT(PPC_RAW_OR(dst_reg, dst_reg, src_reg));
51c66ad849a703 Christophe Leroy 2021-03-22  530  			EMIT(PPC_RAW_OR(dst_reg_h, dst_reg_h, src_reg_h));
51c66ad849a703 Christophe Leroy 2021-03-22  531  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  532  		case BPF_ALU | BPF_OR | BPF_X: /* dst = (u32) dst | (u32) src */
51c66ad849a703 Christophe Leroy 2021-03-22  533  			EMIT(PPC_RAW_OR(dst_reg, dst_reg, src_reg));
51c66ad849a703 Christophe Leroy 2021-03-22  534  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  535  		case BPF_ALU64 | BPF_OR | BPF_K:/* dst = dst | imm */
51c66ad849a703 Christophe Leroy 2021-03-22  536  			/* Sign-extended */
51c66ad849a703 Christophe Leroy 2021-03-22  537  			if (imm < 0)
51c66ad849a703 Christophe Leroy 2021-03-22  538  				EMIT(PPC_RAW_LI(dst_reg_h, -1));
51c66ad849a703 Christophe Leroy 2021-03-22  539  			fallthrough;
51c66ad849a703 Christophe Leroy 2021-03-22  540  		case BPF_ALU | BPF_OR | BPF_K:/* dst = (u32) dst | (u32) imm */
51c66ad849a703 Christophe Leroy 2021-03-22  541  			if (IMM_L(imm))
51c66ad849a703 Christophe Leroy 2021-03-22  542  				EMIT(PPC_RAW_ORI(dst_reg, dst_reg, IMM_L(imm)));
51c66ad849a703 Christophe Leroy 2021-03-22  543  			if (IMM_H(imm))
51c66ad849a703 Christophe Leroy 2021-03-22  544  				EMIT(PPC_RAW_ORIS(dst_reg, dst_reg, IMM_H(imm)));
51c66ad849a703 Christophe Leroy 2021-03-22  545  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  546  		case BPF_ALU64 | BPF_XOR | BPF_X: /* dst ^= src */
51c66ad849a703 Christophe Leroy 2021-03-22  547  			if (dst_reg == src_reg) {
51c66ad849a703 Christophe Leroy 2021-03-22  548  				EMIT(PPC_RAW_LI(dst_reg, 0));
51c66ad849a703 Christophe Leroy 2021-03-22  549  				EMIT(PPC_RAW_LI(dst_reg_h, 0));
51c66ad849a703 Christophe Leroy 2021-03-22  550  			} else {
51c66ad849a703 Christophe Leroy 2021-03-22  551  				EMIT(PPC_RAW_XOR(dst_reg, dst_reg, src_reg));
51c66ad849a703 Christophe Leroy 2021-03-22  552  				EMIT(PPC_RAW_XOR(dst_reg_h, dst_reg_h, src_reg_h));
51c66ad849a703 Christophe Leroy 2021-03-22  553  			}
51c66ad849a703 Christophe Leroy 2021-03-22  554  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  555  		case BPF_ALU | BPF_XOR | BPF_X: /* (u32) dst ^= src */
51c66ad849a703 Christophe Leroy 2021-03-22  556  			if (dst_reg == src_reg)
51c66ad849a703 Christophe Leroy 2021-03-22  557  				EMIT(PPC_RAW_LI(dst_reg, 0));
51c66ad849a703 Christophe Leroy 2021-03-22  558  			else
51c66ad849a703 Christophe Leroy 2021-03-22  559  				EMIT(PPC_RAW_XOR(dst_reg, dst_reg, src_reg));
51c66ad849a703 Christophe Leroy 2021-03-22  560  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  561  		case BPF_ALU64 | BPF_XOR | BPF_K: /* dst ^= imm */
51c66ad849a703 Christophe Leroy 2021-03-22  562  			if (imm < 0)
51c66ad849a703 Christophe Leroy 2021-03-22  563  				EMIT(PPC_RAW_NOR(dst_reg_h, dst_reg_h, dst_reg_h));
51c66ad849a703 Christophe Leroy 2021-03-22  564  			fallthrough;
51c66ad849a703 Christophe Leroy 2021-03-22  565  		case BPF_ALU | BPF_XOR | BPF_K: /* (u32) dst ^= (u32) imm */
51c66ad849a703 Christophe Leroy 2021-03-22  566  			if (IMM_L(imm))
51c66ad849a703 Christophe Leroy 2021-03-22  567  				EMIT(PPC_RAW_XORI(dst_reg, dst_reg, IMM_L(imm)));
51c66ad849a703 Christophe Leroy 2021-03-22  568  			if (IMM_H(imm))
51c66ad849a703 Christophe Leroy 2021-03-22  569  				EMIT(PPC_RAW_XORIS(dst_reg, dst_reg, IMM_H(imm)));
51c66ad849a703 Christophe Leroy 2021-03-22  570  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  571  		case BPF_ALU | BPF_LSH | BPF_X: /* (u32) dst <<= (u32) src */
51c66ad849a703 Christophe Leroy 2021-03-22  572  			EMIT(PPC_RAW_SLW(dst_reg, dst_reg, src_reg));
51c66ad849a703 Christophe Leroy 2021-03-22  573  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  574  		case BPF_ALU64 | BPF_LSH | BPF_X: /* dst <<= src; */
e7de0023e1232f Christophe Leroy 2021-04-12  575  			bpf_set_seen_register(ctx, tmp_reg);
e0ea08c0cacf93 Christophe Leroy 2021-05-20  576  			EMIT(PPC_RAW_SUBFIC(_R0, src_reg, 32));
51c66ad849a703 Christophe Leroy 2021-03-22  577  			EMIT(PPC_RAW_SLW(dst_reg_h, dst_reg_h, src_reg));
e7de0023e1232f Christophe Leroy 2021-04-12  578  			EMIT(PPC_RAW_ADDI(tmp_reg, src_reg, 32));
e0ea08c0cacf93 Christophe Leroy 2021-05-20  579  			EMIT(PPC_RAW_SRW(_R0, dst_reg, _R0));
e7de0023e1232f Christophe Leroy 2021-04-12  580  			EMIT(PPC_RAW_SLW(tmp_reg, dst_reg, tmp_reg));
e0ea08c0cacf93 Christophe Leroy 2021-05-20  581  			EMIT(PPC_RAW_OR(dst_reg_h, dst_reg_h, _R0));
e7de0023e1232f Christophe Leroy 2021-04-12  582  			EMIT(PPC_RAW_SLW(dst_reg, dst_reg, src_reg));
e7de0023e1232f Christophe Leroy 2021-04-12  583  			EMIT(PPC_RAW_OR(dst_reg_h, dst_reg_h, tmp_reg));
51c66ad849a703 Christophe Leroy 2021-03-22  584  			break;
d228cc49696636 Christophe Leroy 2021-04-12  585  		case BPF_ALU | BPF_LSH | BPF_K: /* (u32) dst <<= (u32) imm */
51c66ad849a703 Christophe Leroy 2021-03-22  586  			if (!imm)
51c66ad849a703 Christophe Leroy 2021-03-22  587  				break;
51c66ad849a703 Christophe Leroy 2021-03-22  588  			EMIT(PPC_RAW_SLWI(dst_reg, dst_reg, imm));
51c66ad849a703 Christophe Leroy 2021-03-22  589  			break;
d228cc49696636 Christophe Leroy 2021-04-12  590  		case BPF_ALU64 | BPF_LSH | BPF_K: /* dst <<= imm */
51c66ad849a703 Christophe Leroy 2021-03-22  591  			if (imm < 0)
51c66ad849a703 Christophe Leroy 2021-03-22  592  				return -EINVAL;
51c66ad849a703 Christophe Leroy 2021-03-22  593  			if (!imm)
51c66ad849a703 Christophe Leroy 2021-03-22  594  				break;
51c66ad849a703 Christophe Leroy 2021-03-22  595  			if (imm < 32) {
51c66ad849a703 Christophe Leroy 2021-03-22  596  				EMIT(PPC_RAW_RLWINM(dst_reg_h, dst_reg_h, imm, 0, 31 - imm));
51c66ad849a703 Christophe Leroy 2021-03-22  597  				EMIT(PPC_RAW_RLWIMI(dst_reg_h, dst_reg, imm, 32 - imm, 31));
51c66ad849a703 Christophe Leroy 2021-03-22  598  				EMIT(PPC_RAW_RLWINM(dst_reg, dst_reg, imm, 0, 31 - imm));
51c66ad849a703 Christophe Leroy 2021-03-22  599  				break;
51c66ad849a703 Christophe Leroy 2021-03-22  600  			}
51c66ad849a703 Christophe Leroy 2021-03-22  601  			if (imm < 64)
51c66ad849a703 Christophe Leroy 2021-03-22  602  				EMIT(PPC_RAW_RLWINM(dst_reg_h, dst_reg, imm, 0, 31 - imm));
51c66ad849a703 Christophe Leroy 2021-03-22  603  			else
51c66ad849a703 Christophe Leroy 2021-03-22  604  				EMIT(PPC_RAW_LI(dst_reg_h, 0));
51c66ad849a703 Christophe Leroy 2021-03-22  605  			EMIT(PPC_RAW_LI(dst_reg, 0));
51c66ad849a703 Christophe Leroy 2021-03-22  606  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  607  		case BPF_ALU | BPF_RSH | BPF_X: /* (u32) dst >>= (u32) src */
51c66ad849a703 Christophe Leroy 2021-03-22  608  			EMIT(PPC_RAW_SRW(dst_reg, dst_reg, src_reg));
51c66ad849a703 Christophe Leroy 2021-03-22  609  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  610  		case BPF_ALU64 | BPF_RSH | BPF_X: /* dst >>= src */
e7de0023e1232f Christophe Leroy 2021-04-12  611  			bpf_set_seen_register(ctx, tmp_reg);
e0ea08c0cacf93 Christophe Leroy 2021-05-20  612  			EMIT(PPC_RAW_SUBFIC(_R0, src_reg, 32));
51c66ad849a703 Christophe Leroy 2021-03-22  613  			EMIT(PPC_RAW_SRW(dst_reg, dst_reg, src_reg));
e7de0023e1232f Christophe Leroy 2021-04-12  614  			EMIT(PPC_RAW_ADDI(tmp_reg, src_reg, 32));
e0ea08c0cacf93 Christophe Leroy 2021-05-20  615  			EMIT(PPC_RAW_SLW(_R0, dst_reg_h, _R0));
e7de0023e1232f Christophe Leroy 2021-04-12  616  			EMIT(PPC_RAW_SRW(tmp_reg, dst_reg_h, tmp_reg));
e0ea08c0cacf93 Christophe Leroy 2021-05-20  617  			EMIT(PPC_RAW_OR(dst_reg, dst_reg, _R0));
e7de0023e1232f Christophe Leroy 2021-04-12  618  			EMIT(PPC_RAW_SRW(dst_reg_h, dst_reg_h, src_reg));
e7de0023e1232f Christophe Leroy 2021-04-12  619  			EMIT(PPC_RAW_OR(dst_reg, dst_reg, tmp_reg));
51c66ad849a703 Christophe Leroy 2021-03-22  620  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  621  		case BPF_ALU | BPF_RSH | BPF_K: /* (u32) dst >>= (u32) imm */
51c66ad849a703 Christophe Leroy 2021-03-22  622  			if (!imm)
51c66ad849a703 Christophe Leroy 2021-03-22  623  				break;
51c66ad849a703 Christophe Leroy 2021-03-22  624  			EMIT(PPC_RAW_SRWI(dst_reg, dst_reg, imm));
51c66ad849a703 Christophe Leroy 2021-03-22  625  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  626  		case BPF_ALU64 | BPF_RSH | BPF_K: /* dst >>= imm */
51c66ad849a703 Christophe Leroy 2021-03-22  627  			if (imm < 0)
51c66ad849a703 Christophe Leroy 2021-03-22  628  				return -EINVAL;
51c66ad849a703 Christophe Leroy 2021-03-22  629  			if (!imm)
51c66ad849a703 Christophe Leroy 2021-03-22  630  				break;
51c66ad849a703 Christophe Leroy 2021-03-22  631  			if (imm < 32) {
51c66ad849a703 Christophe Leroy 2021-03-22  632  				EMIT(PPC_RAW_RLWINM(dst_reg, dst_reg, 32 - imm, imm, 31));
51c66ad849a703 Christophe Leroy 2021-03-22  633  				EMIT(PPC_RAW_RLWIMI(dst_reg, dst_reg_h, 32 - imm, 0, imm - 1));
51c66ad849a703 Christophe Leroy 2021-03-22  634  				EMIT(PPC_RAW_RLWINM(dst_reg_h, dst_reg_h, 32 - imm, imm, 31));
51c66ad849a703 Christophe Leroy 2021-03-22  635  				break;
51c66ad849a703 Christophe Leroy 2021-03-22  636  			}
51c66ad849a703 Christophe Leroy 2021-03-22  637  			if (imm < 64)
51c66ad849a703 Christophe Leroy 2021-03-22  638  				EMIT(PPC_RAW_RLWINM(dst_reg, dst_reg_h, 64 - imm, imm - 32, 31));
51c66ad849a703 Christophe Leroy 2021-03-22  639  			else
51c66ad849a703 Christophe Leroy 2021-03-22  640  				EMIT(PPC_RAW_LI(dst_reg, 0));
51c66ad849a703 Christophe Leroy 2021-03-22  641  			EMIT(PPC_RAW_LI(dst_reg_h, 0));
51c66ad849a703 Christophe Leroy 2021-03-22  642  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  643  		case BPF_ALU | BPF_ARSH | BPF_X: /* (s32) dst >>= src */
c9b8da77f22d28 Naveen N. Rao    2021-10-06  644  			EMIT(PPC_RAW_SRAW(dst_reg, dst_reg, src_reg));
51c66ad849a703 Christophe Leroy 2021-03-22  645  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  646  		case BPF_ALU64 | BPF_ARSH | BPF_X: /* (s64) dst >>= src */
e7de0023e1232f Christophe Leroy 2021-04-12  647  			bpf_set_seen_register(ctx, tmp_reg);
e0ea08c0cacf93 Christophe Leroy 2021-05-20  648  			EMIT(PPC_RAW_SUBFIC(_R0, src_reg, 32));
51c66ad849a703 Christophe Leroy 2021-03-22  649  			EMIT(PPC_RAW_SRW(dst_reg, dst_reg, src_reg));
e0ea08c0cacf93 Christophe Leroy 2021-05-20  650  			EMIT(PPC_RAW_SLW(_R0, dst_reg_h, _R0));
e7de0023e1232f Christophe Leroy 2021-04-12  651  			EMIT(PPC_RAW_ADDI(tmp_reg, src_reg, 32));
e0ea08c0cacf93 Christophe Leroy 2021-05-20  652  			EMIT(PPC_RAW_OR(dst_reg, dst_reg, _R0));
e0ea08c0cacf93 Christophe Leroy 2021-05-20  653  			EMIT(PPC_RAW_RLWINM(_R0, tmp_reg, 0, 26, 26));
e7de0023e1232f Christophe Leroy 2021-04-12  654  			EMIT(PPC_RAW_SRAW(tmp_reg, dst_reg_h, tmp_reg));
e7de0023e1232f Christophe Leroy 2021-04-12  655  			EMIT(PPC_RAW_SRAW(dst_reg_h, dst_reg_h, src_reg));
e0ea08c0cacf93 Christophe Leroy 2021-05-20  656  			EMIT(PPC_RAW_SLW(tmp_reg, tmp_reg, _R0));
e7de0023e1232f Christophe Leroy 2021-04-12  657  			EMIT(PPC_RAW_OR(dst_reg, dst_reg, tmp_reg));
51c66ad849a703 Christophe Leroy 2021-03-22  658  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  659  		case BPF_ALU | BPF_ARSH | BPF_K: /* (s32) dst >>= imm */
51c66ad849a703 Christophe Leroy 2021-03-22  660  			if (!imm)
51c66ad849a703 Christophe Leroy 2021-03-22  661  				break;
51c66ad849a703 Christophe Leroy 2021-03-22  662  			EMIT(PPC_RAW_SRAWI(dst_reg, dst_reg, imm));
51c66ad849a703 Christophe Leroy 2021-03-22  663  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  664  		case BPF_ALU64 | BPF_ARSH | BPF_K: /* (s64) dst >>= imm */
51c66ad849a703 Christophe Leroy 2021-03-22  665  			if (imm < 0)
51c66ad849a703 Christophe Leroy 2021-03-22  666  				return -EINVAL;
51c66ad849a703 Christophe Leroy 2021-03-22  667  			if (!imm)
51c66ad849a703 Christophe Leroy 2021-03-22  668  				break;
51c66ad849a703 Christophe Leroy 2021-03-22  669  			if (imm < 32) {
51c66ad849a703 Christophe Leroy 2021-03-22  670  				EMIT(PPC_RAW_RLWINM(dst_reg, dst_reg, 32 - imm, imm, 31));
51c66ad849a703 Christophe Leroy 2021-03-22  671  				EMIT(PPC_RAW_RLWIMI(dst_reg, dst_reg_h, 32 - imm, 0, imm - 1));
51c66ad849a703 Christophe Leroy 2021-03-22  672  				EMIT(PPC_RAW_SRAWI(dst_reg_h, dst_reg_h, imm));
51c66ad849a703 Christophe Leroy 2021-03-22  673  				break;
51c66ad849a703 Christophe Leroy 2021-03-22  674  			}
51c66ad849a703 Christophe Leroy 2021-03-22  675  			if (imm < 64)
51c66ad849a703 Christophe Leroy 2021-03-22  676  				EMIT(PPC_RAW_SRAWI(dst_reg, dst_reg_h, imm - 32));
51c66ad849a703 Christophe Leroy 2021-03-22  677  			else
51c66ad849a703 Christophe Leroy 2021-03-22  678  				EMIT(PPC_RAW_SRAWI(dst_reg, dst_reg_h, 31));
51c66ad849a703 Christophe Leroy 2021-03-22  679  			EMIT(PPC_RAW_SRAWI(dst_reg_h, dst_reg_h, 31));
51c66ad849a703 Christophe Leroy 2021-03-22  680  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  681  
51c66ad849a703 Christophe Leroy 2021-03-22  682  		/*
51c66ad849a703 Christophe Leroy 2021-03-22  683  		 * MOV
51c66ad849a703 Christophe Leroy 2021-03-22  684  		 */
51c66ad849a703 Christophe Leroy 2021-03-22  685  		case BPF_ALU64 | BPF_MOV | BPF_X: /* dst = src */
51c66ad849a703 Christophe Leroy 2021-03-22  686  			if (dst_reg == src_reg)
51c66ad849a703 Christophe Leroy 2021-03-22  687  				break;
51c66ad849a703 Christophe Leroy 2021-03-22  688  			EMIT(PPC_RAW_MR(dst_reg, src_reg));
51c66ad849a703 Christophe Leroy 2021-03-22  689  			EMIT(PPC_RAW_MR(dst_reg_h, src_reg_h));
51c66ad849a703 Christophe Leroy 2021-03-22  690  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  691  		case BPF_ALU | BPF_MOV | BPF_X: /* (u32) dst = src */
51c66ad849a703 Christophe Leroy 2021-03-22  692  			/* special mov32 for zext */
51c66ad849a703 Christophe Leroy 2021-03-22  693  			if (imm == 1)
51c66ad849a703 Christophe Leroy 2021-03-22  694  				EMIT(PPC_RAW_LI(dst_reg_h, 0));
51c66ad849a703 Christophe Leroy 2021-03-22  695  			else if (dst_reg != src_reg)
51c66ad849a703 Christophe Leroy 2021-03-22  696  				EMIT(PPC_RAW_MR(dst_reg, src_reg));
51c66ad849a703 Christophe Leroy 2021-03-22  697  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  698  		case BPF_ALU64 | BPF_MOV | BPF_K: /* dst = (s64) imm */
51c66ad849a703 Christophe Leroy 2021-03-22  699  			PPC_LI32(dst_reg, imm);
51c66ad849a703 Christophe Leroy 2021-03-22  700  			PPC_EX32(dst_reg_h, imm);
51c66ad849a703 Christophe Leroy 2021-03-22  701  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  702  		case BPF_ALU | BPF_MOV | BPF_K: /* (u32) dst = imm */
51c66ad849a703 Christophe Leroy 2021-03-22  703  			PPC_LI32(dst_reg, imm);
51c66ad849a703 Christophe Leroy 2021-03-22  704  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  705  
51c66ad849a703 Christophe Leroy 2021-03-22  706  		/*
51c66ad849a703 Christophe Leroy 2021-03-22  707  		 * BPF_FROM_BE/LE
51c66ad849a703 Christophe Leroy 2021-03-22  708  		 */
51c66ad849a703 Christophe Leroy 2021-03-22  709  		case BPF_ALU | BPF_END | BPF_FROM_LE:
51c66ad849a703 Christophe Leroy 2021-03-22  710  			switch (imm) {
51c66ad849a703 Christophe Leroy 2021-03-22  711  			case 16:
51c66ad849a703 Christophe Leroy 2021-03-22  712  				/* Copy 16 bits to upper part */
51c66ad849a703 Christophe Leroy 2021-03-22  713  				EMIT(PPC_RAW_RLWIMI(dst_reg, dst_reg, 16, 0, 15));
51c66ad849a703 Christophe Leroy 2021-03-22  714  				/* Rotate 8 bits right & mask */
51c66ad849a703 Christophe Leroy 2021-03-22  715  				EMIT(PPC_RAW_RLWINM(dst_reg, dst_reg, 24, 16, 31));
51c66ad849a703 Christophe Leroy 2021-03-22  716  				break;
51c66ad849a703 Christophe Leroy 2021-03-22  717  			case 32:
51c66ad849a703 Christophe Leroy 2021-03-22  718  				/*
51c66ad849a703 Christophe Leroy 2021-03-22  719  				 * Rotate word left by 8 bits:
51c66ad849a703 Christophe Leroy 2021-03-22  720  				 * 2 bytes are already in their final position
51c66ad849a703 Christophe Leroy 2021-03-22  721  				 * -- byte 2 and 4 (of bytes 1, 2, 3 and 4)
51c66ad849a703 Christophe Leroy 2021-03-22  722  				 */
e0ea08c0cacf93 Christophe Leroy 2021-05-20  723  				EMIT(PPC_RAW_RLWINM(_R0, dst_reg, 8, 0, 31));
51c66ad849a703 Christophe Leroy 2021-03-22  724  				/* Rotate 24 bits and insert byte 1 */
e0ea08c0cacf93 Christophe Leroy 2021-05-20  725  				EMIT(PPC_RAW_RLWIMI(_R0, dst_reg, 24, 0, 7));
51c66ad849a703 Christophe Leroy 2021-03-22  726  				/* Rotate 24 bits and insert byte 3 */
e0ea08c0cacf93 Christophe Leroy 2021-05-20  727  				EMIT(PPC_RAW_RLWIMI(_R0, dst_reg, 24, 16, 23));
e0ea08c0cacf93 Christophe Leroy 2021-05-20  728  				EMIT(PPC_RAW_MR(dst_reg, _R0));
51c66ad849a703 Christophe Leroy 2021-03-22  729  				break;
51c66ad849a703 Christophe Leroy 2021-03-22  730  			case 64:
51c66ad849a703 Christophe Leroy 2021-03-22  731  				bpf_set_seen_register(ctx, tmp_reg);
51c66ad849a703 Christophe Leroy 2021-03-22  732  				EMIT(PPC_RAW_RLWINM(tmp_reg, dst_reg, 8, 0, 31));
e0ea08c0cacf93 Christophe Leroy 2021-05-20  733  				EMIT(PPC_RAW_RLWINM(_R0, dst_reg_h, 8, 0, 31));
51c66ad849a703 Christophe Leroy 2021-03-22  734  				/* Rotate 24 bits and insert byte 1 */
51c66ad849a703 Christophe Leroy 2021-03-22  735  				EMIT(PPC_RAW_RLWIMI(tmp_reg, dst_reg, 24, 0, 7));
e0ea08c0cacf93 Christophe Leroy 2021-05-20  736  				EMIT(PPC_RAW_RLWIMI(_R0, dst_reg_h, 24, 0, 7));
51c66ad849a703 Christophe Leroy 2021-03-22  737  				/* Rotate 24 bits and insert byte 3 */
51c66ad849a703 Christophe Leroy 2021-03-22  738  				EMIT(PPC_RAW_RLWIMI(tmp_reg, dst_reg, 24, 16, 23));
e0ea08c0cacf93 Christophe Leroy 2021-05-20  739  				EMIT(PPC_RAW_RLWIMI(_R0, dst_reg_h, 24, 16, 23));
e0ea08c0cacf93 Christophe Leroy 2021-05-20  740  				EMIT(PPC_RAW_MR(dst_reg, _R0));
51c66ad849a703 Christophe Leroy 2021-03-22  741  				EMIT(PPC_RAW_MR(dst_reg_h, tmp_reg));
51c66ad849a703 Christophe Leroy 2021-03-22  742  				break;
51c66ad849a703 Christophe Leroy 2021-03-22  743  			}
51c66ad849a703 Christophe Leroy 2021-03-22  744  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  745  		case BPF_ALU | BPF_END | BPF_FROM_BE:
51c66ad849a703 Christophe Leroy 2021-03-22  746  			switch (imm) {
51c66ad849a703 Christophe Leroy 2021-03-22  747  			case 16:
51c66ad849a703 Christophe Leroy 2021-03-22  748  				/* zero-extend 16 bits into 32 bits */
51c66ad849a703 Christophe Leroy 2021-03-22  749  				EMIT(PPC_RAW_RLWINM(dst_reg, dst_reg, 0, 16, 31));
51c66ad849a703 Christophe Leroy 2021-03-22  750  				break;
51c66ad849a703 Christophe Leroy 2021-03-22  751  			case 32:
51c66ad849a703 Christophe Leroy 2021-03-22  752  			case 64:
51c66ad849a703 Christophe Leroy 2021-03-22  753  				/* nop */
51c66ad849a703 Christophe Leroy 2021-03-22  754  				break;
51c66ad849a703 Christophe Leroy 2021-03-22  755  			}
51c66ad849a703 Christophe Leroy 2021-03-22  756  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  757  
f5e81d11175015 Daniel Borkmann  2021-07-13  758  		/*
f5e81d11175015 Daniel Borkmann  2021-07-13  759  		 * BPF_ST NOSPEC (speculation barrier)
f5e81d11175015 Daniel Borkmann  2021-07-13  760  		 */
f5e81d11175015 Daniel Borkmann  2021-07-13  761  		case BPF_ST | BPF_NOSPEC:
f5e81d11175015 Daniel Borkmann  2021-07-13  762  			break;
f5e81d11175015 Daniel Borkmann  2021-07-13  763  
51c66ad849a703 Christophe Leroy 2021-03-22  764  		/*
51c66ad849a703 Christophe Leroy 2021-03-22  765  		 * BPF_ST(X)
51c66ad849a703 Christophe Leroy 2021-03-22  766  		 */
51c66ad849a703 Christophe Leroy 2021-03-22  767  		case BPF_STX | BPF_MEM | BPF_B: /* *(u8 *)(dst + off) = src */
51c66ad849a703 Christophe Leroy 2021-03-22  768  			EMIT(PPC_RAW_STB(src_reg, dst_reg, off));
51c66ad849a703 Christophe Leroy 2021-03-22  769  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  770  		case BPF_ST | BPF_MEM | BPF_B: /* *(u8 *)(dst + off) = imm */
e0ea08c0cacf93 Christophe Leroy 2021-05-20  771  			PPC_LI32(_R0, imm);
e0ea08c0cacf93 Christophe Leroy 2021-05-20  772  			EMIT(PPC_RAW_STB(_R0, dst_reg, off));
51c66ad849a703 Christophe Leroy 2021-03-22  773  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  774  		case BPF_STX | BPF_MEM | BPF_H: /* (u16 *)(dst + off) = src */
51c66ad849a703 Christophe Leroy 2021-03-22  775  			EMIT(PPC_RAW_STH(src_reg, dst_reg, off));
51c66ad849a703 Christophe Leroy 2021-03-22  776  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  777  		case BPF_ST | BPF_MEM | BPF_H: /* (u16 *)(dst + off) = imm */
e0ea08c0cacf93 Christophe Leroy 2021-05-20  778  			PPC_LI32(_R0, imm);
e0ea08c0cacf93 Christophe Leroy 2021-05-20  779  			EMIT(PPC_RAW_STH(_R0, dst_reg, off));
51c66ad849a703 Christophe Leroy 2021-03-22  780  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  781  		case BPF_STX | BPF_MEM | BPF_W: /* *(u32 *)(dst + off) = src */
51c66ad849a703 Christophe Leroy 2021-03-22  782  			EMIT(PPC_RAW_STW(src_reg, dst_reg, off));
51c66ad849a703 Christophe Leroy 2021-03-22  783  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  784  		case BPF_ST | BPF_MEM | BPF_W: /* *(u32 *)(dst + off) = imm */
e0ea08c0cacf93 Christophe Leroy 2021-05-20  785  			PPC_LI32(_R0, imm);
e0ea08c0cacf93 Christophe Leroy 2021-05-20  786  			EMIT(PPC_RAW_STW(_R0, dst_reg, off));
51c66ad849a703 Christophe Leroy 2021-03-22  787  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  788  		case BPF_STX | BPF_MEM | BPF_DW: /* (u64 *)(dst + off) = src */
51c66ad849a703 Christophe Leroy 2021-03-22  789  			EMIT(PPC_RAW_STW(src_reg_h, dst_reg, off));
51c66ad849a703 Christophe Leroy 2021-03-22  790  			EMIT(PPC_RAW_STW(src_reg, dst_reg, off + 4));
51c66ad849a703 Christophe Leroy 2021-03-22  791  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  792  		case BPF_ST | BPF_MEM | BPF_DW: /* *(u64 *)(dst + off) = imm */
e0ea08c0cacf93 Christophe Leroy 2021-05-20  793  			PPC_LI32(_R0, imm);
e0ea08c0cacf93 Christophe Leroy 2021-05-20  794  			EMIT(PPC_RAW_STW(_R0, dst_reg, off + 4));
e0ea08c0cacf93 Christophe Leroy 2021-05-20  795  			PPC_EX32(_R0, imm);
e0ea08c0cacf93 Christophe Leroy 2021-05-20  796  			EMIT(PPC_RAW_STW(_R0, dst_reg, off));
51c66ad849a703 Christophe Leroy 2021-03-22  797  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  798  
51c66ad849a703 Christophe Leroy 2021-03-22  799  		/*
307e5042c7bdae Naveen N. Rao    2021-07-01  800  		 * BPF_STX ATOMIC (atomic ops)
51c66ad849a703 Christophe Leroy 2021-03-22  801  		 */
307e5042c7bdae Naveen N. Rao    2021-07-01  802  		case BPF_STX | BPF_ATOMIC | BPF_W:
2d9206b2274349 Hari Bathini     2022-06-10  803  			save_reg = _R0;
2d9206b2274349 Hari Bathini     2022-06-10  804  			ret_reg = src_reg;
2d9206b2274349 Hari Bathini     2022-06-10  805  
51c66ad849a703 Christophe Leroy 2021-03-22  806  			bpf_set_seen_register(ctx, tmp_reg);
aea7ef8a82c0ea Hari Bathini     2022-06-10  807  			bpf_set_seen_register(ctx, ax_reg);
aea7ef8a82c0ea Hari Bathini     2022-06-10  808  
51c66ad849a703 Christophe Leroy 2021-03-22  809  			/* Get offset into TMP_REG */
51c66ad849a703 Christophe Leroy 2021-03-22  810  			EMIT(PPC_RAW_LI(tmp_reg, off));
aea7ef8a82c0ea Hari Bathini     2022-06-10  811  			tmp_idx = ctx->idx * 4;
51c66ad849a703 Christophe Leroy 2021-03-22  812  			/* load value from memory into r0 */
e0ea08c0cacf93 Christophe Leroy 2021-05-20  813  			EMIT(PPC_RAW_LWARX(_R0, tmp_reg, dst_reg, 0));
aea7ef8a82c0ea Hari Bathini     2022-06-10  814  
aea7ef8a82c0ea Hari Bathini     2022-06-10  815  			/* Save old value in BPF_REG_AX */
aea7ef8a82c0ea Hari Bathini     2022-06-10  816  			if (imm & BPF_FETCH)
aea7ef8a82c0ea Hari Bathini     2022-06-10  817  				EMIT(PPC_RAW_MR(ax_reg, _R0));
aea7ef8a82c0ea Hari Bathini     2022-06-10  818  
aea7ef8a82c0ea Hari Bathini     2022-06-10  819  			switch (imm) {
aea7ef8a82c0ea Hari Bathini     2022-06-10  820  			case BPF_ADD:
aea7ef8a82c0ea Hari Bathini     2022-06-10  821  			case BPF_ADD | BPF_FETCH:
e0ea08c0cacf93 Christophe Leroy 2021-05-20  822  				EMIT(PPC_RAW_ADD(_R0, _R0, src_reg));
aea7ef8a82c0ea Hari Bathini     2022-06-10  823  				break;
aea7ef8a82c0ea Hari Bathini     2022-06-10  824  			case BPF_AND:
aea7ef8a82c0ea Hari Bathini     2022-06-10  825  			case BPF_AND | BPF_FETCH:
aea7ef8a82c0ea Hari Bathini     2022-06-10  826  				EMIT(PPC_RAW_AND(_R0, _R0, src_reg));
aea7ef8a82c0ea Hari Bathini     2022-06-10  827  				break;
aea7ef8a82c0ea Hari Bathini     2022-06-10  828  			case BPF_OR:
aea7ef8a82c0ea Hari Bathini     2022-06-10  829  			case BPF_OR | BPF_FETCH:
aea7ef8a82c0ea Hari Bathini     2022-06-10  830  				EMIT(PPC_RAW_OR(_R0, _R0, src_reg));
aea7ef8a82c0ea Hari Bathini     2022-06-10  831  				break;
aea7ef8a82c0ea Hari Bathini     2022-06-10  832  			case BPF_XOR:
aea7ef8a82c0ea Hari Bathini     2022-06-10  833  			case BPF_XOR | BPF_FETCH:
aea7ef8a82c0ea Hari Bathini     2022-06-10  834  				EMIT(PPC_RAW_XOR(_R0, _R0, src_reg));
aea7ef8a82c0ea Hari Bathini     2022-06-10  835  				break;
2d9206b2274349 Hari Bathini     2022-06-10  836  			case BPF_CMPXCHG:
2d9206b2274349 Hari Bathini     2022-06-10  837  				/*
2d9206b2274349 Hari Bathini     2022-06-10  838  				 * Return old value in BPF_REG_0 for BPF_CMPXCHG &
2d9206b2274349 Hari Bathini     2022-06-10  839  				 * in src_reg for other cases.
2d9206b2274349 Hari Bathini     2022-06-10  840  				 */
2d9206b2274349 Hari Bathini     2022-06-10  841  				ret_reg = bpf_to_ppc(BPF_REG_0);
2d9206b2274349 Hari Bathini     2022-06-10  842  
2d9206b2274349 Hari Bathini     2022-06-10  843  				/* Compare with old value in BPF_REG_0 */
2d9206b2274349 Hari Bathini     2022-06-10  844  				EMIT(PPC_RAW_CMPW(bpf_to_ppc(BPF_REG_0), _R0));
2d9206b2274349 Hari Bathini     2022-06-10  845  				/* Don't set if different from old value */
2d9206b2274349 Hari Bathini     2022-06-10  846  				PPC_BCC_SHORT(COND_NE, (ctx->idx + 3) * 4);
2d9206b2274349 Hari Bathini     2022-06-10  847  				fallthrough;
2d9206b2274349 Hari Bathini     2022-06-10  848  			case BPF_XCHG:
2d9206b2274349 Hari Bathini     2022-06-10  849  				save_reg = src_reg;
2d9206b2274349 Hari Bathini     2022-06-10  850  				break;
aea7ef8a82c0ea Hari Bathini     2022-06-10  851  			default:
aea7ef8a82c0ea Hari Bathini     2022-06-10  852  				pr_err_ratelimited("eBPF filter atomic op code %02x (@%d) unsupported\n",
aea7ef8a82c0ea Hari Bathini     2022-06-10  853  						   code, i);
aea7ef8a82c0ea Hari Bathini     2022-06-10  854  				return -EOPNOTSUPP;
aea7ef8a82c0ea Hari Bathini     2022-06-10  855  			}
aea7ef8a82c0ea Hari Bathini     2022-06-10  856  
aea7ef8a82c0ea Hari Bathini     2022-06-10  857  			/* store new value */
2d9206b2274349 Hari Bathini     2022-06-10  858  			EMIT(PPC_RAW_STWCX(save_reg, tmp_reg, dst_reg));
51c66ad849a703 Christophe Leroy 2021-03-22  859  			/* we're done if this succeeded */
aea7ef8a82c0ea Hari Bathini     2022-06-10  860  			PPC_BCC_SHORT(COND_NE, tmp_idx);
aea7ef8a82c0ea Hari Bathini     2022-06-10  861  
aea7ef8a82c0ea Hari Bathini     2022-06-10  862  			/* For the BPF_FETCH variant, get old data into src_reg */
aea7ef8a82c0ea Hari Bathini     2022-06-10  863  			if (imm & BPF_FETCH) {
2d9206b2274349 Hari Bathini     2022-06-10  864  				EMIT(PPC_RAW_MR(ret_reg, ax_reg));
aea7ef8a82c0ea Hari Bathini     2022-06-10  865  				if (!fp->aux->verifier_zext)
2d9206b2274349 Hari Bathini     2022-06-10  866  					EMIT(PPC_RAW_LI(ret_reg - 1, 0)); /* higher 32-bit */
aea7ef8a82c0ea Hari Bathini     2022-06-10  867  			}
51c66ad849a703 Christophe Leroy 2021-03-22  868  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  869  
307e5042c7bdae Naveen N. Rao    2021-07-01  870  		case BPF_STX | BPF_ATOMIC | BPF_DW: /* *(u64 *)(dst + off) += src */
51c66ad849a703 Christophe Leroy 2021-03-22  871  			return -EOPNOTSUPP;
51c66ad849a703 Christophe Leroy 2021-03-22  872  
51c66ad849a703 Christophe Leroy 2021-03-22  873  		/*
51c66ad849a703 Christophe Leroy 2021-03-22  874  		 * BPF_LDX
51c66ad849a703 Christophe Leroy 2021-03-22  875  		 */
51c66ad849a703 Christophe Leroy 2021-03-22  876  		case BPF_LDX | BPF_MEM | BPF_B: /* dst = *(u8 *)(ul) (src + off) */
23b51916ee1298 Hari Bathini     2021-10-12  877  		case BPF_LDX | BPF_PROBE_MEM | BPF_B:
efa95f031bf38c Hari Bathini     2021-10-12  878  		case BPF_LDX | BPF_MEM | BPF_H: /* dst = *(u16 *)(ul) (src + off) */
23b51916ee1298 Hari Bathini     2021-10-12  879  		case BPF_LDX | BPF_PROBE_MEM | BPF_H:
efa95f031bf38c Hari Bathini     2021-10-12  880  		case BPF_LDX | BPF_MEM | BPF_W: /* dst = *(u32 *)(ul) (src + off) */
23b51916ee1298 Hari Bathini     2021-10-12  881  		case BPF_LDX | BPF_PROBE_MEM | BPF_W:
efa95f031bf38c Hari Bathini     2021-10-12  882  		case BPF_LDX | BPF_MEM | BPF_DW: /* dst = *(u64 *)(ul) (src + off) */
23b51916ee1298 Hari Bathini     2021-10-12  883  		case BPF_LDX | BPF_PROBE_MEM | BPF_DW:
e919c0b2323bed Hari Bathini     2021-10-12  884  			/*
e919c0b2323bed Hari Bathini     2021-10-12  885  			 * As PTR_TO_BTF_ID that uses BPF_PROBE_MEM mode could either be a valid
e919c0b2323bed Hari Bathini     2021-10-12  886  			 * kernel pointer or NULL but not a userspace address, execute BPF_PROBE_MEM
e919c0b2323bed Hari Bathini     2021-10-12  887  			 * load only if addr is kernel address (see is_kernel_addr()), otherwise
e919c0b2323bed Hari Bathini     2021-10-12  888  			 * set dst_reg=0 and move on.
e919c0b2323bed Hari Bathini     2021-10-12  889  			 */
e919c0b2323bed Hari Bathini     2021-10-12  890  			if (BPF_MODE(code) == BPF_PROBE_MEM) {
e919c0b2323bed Hari Bathini     2021-10-12  891  				PPC_LI32(_R0, TASK_SIZE - off);
e919c0b2323bed Hari Bathini     2021-10-12  892  				EMIT(PPC_RAW_CMPLW(src_reg, _R0));
bafb5898de5d2f Naveen N. Rao    2022-02-14  893  				PPC_BCC_SHORT(COND_GT, (ctx->idx + 4) * 4);
e919c0b2323bed Hari Bathini     2021-10-12  894  				EMIT(PPC_RAW_LI(dst_reg, 0));
e919c0b2323bed Hari Bathini     2021-10-12  895  				/*
e919c0b2323bed Hari Bathini     2021-10-12  896  				 * For BPF_DW case, "li reg_h,0" would be needed when
e919c0b2323bed Hari Bathini     2021-10-12  897  				 * !fp->aux->verifier_zext. Emit NOP otherwise.
e919c0b2323bed Hari Bathini     2021-10-12  898  				 *
e919c0b2323bed Hari Bathini     2021-10-12  899  				 * Note that "li reg_h,0" is emitted for BPF_B/H/W case,
e919c0b2323bed Hari Bathini     2021-10-12  900  				 * if necessary. So, jump there insted of emitting an
e919c0b2323bed Hari Bathini     2021-10-12  901  				 * additional "li reg_h,0" instruction.
e919c0b2323bed Hari Bathini     2021-10-12  902  				 */
e919c0b2323bed Hari Bathini     2021-10-12  903  				if (size == BPF_DW && !fp->aux->verifier_zext)
51c66ad849a703 Christophe Leroy 2021-03-22  904  					EMIT(PPC_RAW_LI(dst_reg_h, 0));
e919c0b2323bed Hari Bathini     2021-10-12  905  				else
e919c0b2323bed Hari Bathini     2021-10-12  906  					EMIT(PPC_RAW_NOP());
e919c0b2323bed Hari Bathini     2021-10-12  907  				/*
e919c0b2323bed Hari Bathini     2021-10-12  908  				 * Need to jump two instructions instead of one for BPF_DW case
e919c0b2323bed Hari Bathini     2021-10-12  909  				 * as there are two load instructions for dst_reg_h & dst_reg
e919c0b2323bed Hari Bathini     2021-10-12  910  				 * respectively.
e919c0b2323bed Hari Bathini     2021-10-12  911  				 */
e919c0b2323bed Hari Bathini     2021-10-12  912  				if (size == BPF_DW)
e919c0b2323bed Hari Bathini     2021-10-12  913  					PPC_JMP((ctx->idx + 3) * 4);
e919c0b2323bed Hari Bathini     2021-10-12  914  				else
e919c0b2323bed Hari Bathini     2021-10-12  915  					PPC_JMP((ctx->idx + 2) * 4);
e919c0b2323bed Hari Bathini     2021-10-12  916  			}
e919c0b2323bed Hari Bathini     2021-10-12  917  
efa95f031bf38c Hari Bathini     2021-10-12  918  			switch (size) {
efa95f031bf38c Hari Bathini     2021-10-12  919  			case BPF_B:
51c66ad849a703 Christophe Leroy 2021-03-22  920  				EMIT(PPC_RAW_LBZ(dst_reg, src_reg, off));
51c66ad849a703 Christophe Leroy 2021-03-22  921  				break;
efa95f031bf38c Hari Bathini     2021-10-12  922  			case BPF_H:
51c66ad849a703 Christophe Leroy 2021-03-22  923  				EMIT(PPC_RAW_LHZ(dst_reg, src_reg, off));
51c66ad849a703 Christophe Leroy 2021-03-22  924  				break;
efa95f031bf38c Hari Bathini     2021-10-12  925  			case BPF_W:
51c66ad849a703 Christophe Leroy 2021-03-22  926  				EMIT(PPC_RAW_LWZ(dst_reg, src_reg, off));
51c66ad849a703 Christophe Leroy 2021-03-22  927  				break;
efa95f031bf38c Hari Bathini     2021-10-12  928  			case BPF_DW:
51c66ad849a703 Christophe Leroy 2021-03-22  929  				EMIT(PPC_RAW_LWZ(dst_reg_h, src_reg, off));
51c66ad849a703 Christophe Leroy 2021-03-22  930  				EMIT(PPC_RAW_LWZ(dst_reg, src_reg, off + 4));
51c66ad849a703 Christophe Leroy 2021-03-22  931  				break;
efa95f031bf38c Hari Bathini     2021-10-12  932  			}
efa95f031bf38c Hari Bathini     2021-10-12  933  
efa95f031bf38c Hari Bathini     2021-10-12  934  			if (size != BPF_DW && !fp->aux->verifier_zext)
efa95f031bf38c Hari Bathini     2021-10-12  935  				EMIT(PPC_RAW_LI(dst_reg_h, 0));
23b51916ee1298 Hari Bathini     2021-10-12  936  
23b51916ee1298 Hari Bathini     2021-10-12  937  			if (BPF_MODE(code) == BPF_PROBE_MEM) {
23b51916ee1298 Hari Bathini     2021-10-12  938  				int insn_idx = ctx->idx - 1;
23b51916ee1298 Hari Bathini     2021-10-12  939  				int jmp_off = 4;
23b51916ee1298 Hari Bathini     2021-10-12  940  
23b51916ee1298 Hari Bathini     2021-10-12  941  				/*
23b51916ee1298 Hari Bathini     2021-10-12  942  				 * In case of BPF_DW, two lwz instructions are emitted, one
23b51916ee1298 Hari Bathini     2021-10-12  943  				 * for higher 32-bit and another for lower 32-bit. So, set
23b51916ee1298 Hari Bathini     2021-10-12  944  				 * ex->insn to the first of the two and jump over both
23b51916ee1298 Hari Bathini     2021-10-12  945  				 * instructions in fixup.
23b51916ee1298 Hari Bathini     2021-10-12  946  				 *
23b51916ee1298 Hari Bathini     2021-10-12  947  				 * Similarly, with !verifier_zext, two instructions are
23b51916ee1298 Hari Bathini     2021-10-12  948  				 * emitted for BPF_B/H/W case. So, set ex->insn to the
23b51916ee1298 Hari Bathini     2021-10-12  949  				 * instruction that could fault and skip over both
23b51916ee1298 Hari Bathini     2021-10-12  950  				 * instructions.
23b51916ee1298 Hari Bathini     2021-10-12  951  				 */
23b51916ee1298 Hari Bathini     2021-10-12  952  				if (size == BPF_DW || !fp->aux->verifier_zext) {
23b51916ee1298 Hari Bathini     2021-10-12  953  					insn_idx -= 1;
23b51916ee1298 Hari Bathini     2021-10-12  954  					jmp_off += 4;
23b51916ee1298 Hari Bathini     2021-10-12  955  				}
23b51916ee1298 Hari Bathini     2021-10-12  956  
23b51916ee1298 Hari Bathini     2021-10-12  957  				ret = bpf_add_extable_entry(fp, image, pass, ctx, insn_idx,
23b51916ee1298 Hari Bathini     2021-10-12  958  							    jmp_off, dst_reg);
23b51916ee1298 Hari Bathini     2021-10-12  959  				if (ret)
23b51916ee1298 Hari Bathini     2021-10-12  960  					return ret;
23b51916ee1298 Hari Bathini     2021-10-12  961  			}
efa95f031bf38c Hari Bathini     2021-10-12  962  			break;
51c66ad849a703 Christophe Leroy 2021-03-22  963  
51c66ad849a703 Christophe Leroy 2021-03-22  964  		/*
51c66ad849a703 Christophe Leroy 2021-03-22  965  		 * Doubleword load
51c66ad849a703 Christophe Leroy 2021-03-22  966  		 * 16 byte instruction that uses two 'struct bpf_insn'
51c66ad849a703 Christophe Leroy 2021-03-22  967  		 */
51c66ad849a703 Christophe Leroy 2021-03-22  968  		case BPF_LD | BPF_IMM | BPF_DW: /* dst = (u64) imm */
f9320c49993ca3 Naveen N. Rao    2022-01-06  969  			tmp_idx = ctx->idx;
51c66ad849a703 Christophe Leroy 2021-03-22  970  			PPC_LI32(dst_reg_h, (u32)insn[i + 1].imm);
51c66ad849a703 Christophe Leroy 2021-03-22  971  			PPC_LI32(dst_reg, (u32)insn[i].imm);
f9320c49993ca3 Naveen N. Rao    2022-01-06  972  			/* padding to allow full 4 instructions for later patching */
d3921cbb6cd663 Christophe Leroy 2023-02-01 @973  			if (!image)
f9320c49993ca3 Naveen N. Rao    2022-01-06  974  				for (j = ctx->idx - tmp_idx; j < 4; j++)
f9320c49993ca3 Naveen N. Rao    2022-01-06 @975  					EMIT(PPC_RAW_NOP());

:::::: The code at line 975 was first introduced by commit
:::::: f9320c49993ca3c0ec0f9a7026b313735306bb8b powerpc/bpf: Update ldimm64 instructions during extra pass

:::::: TO: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
