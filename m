Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C433D29B200
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Apr 2026 19:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777577110; cv=none; b=qp4+CB//GOcj48w8L9t+G/IcbDRmkT2CpYLfjrmkNPcujFIk/7bh8PbRbLPw14QxuZoTHgo6CphDS04g5abtaf/2pqRyy5CbHjXdPqd567gklc9kcZbKBjAITZxhic5LSQYjRk4Amt91+xEPDNm8VKwt8KkVSZ/18y2CBnKwIhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777577110; c=relaxed/simple;
	bh=yfXs6FdQnjc/EA/urZOcntc+mZRekT8UNIf1yMmMh1I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K2xquochg6XNVGZUy5CUFIbXX7Tzp1vOQ2c11EsUpGeA1KzmXt58Usk3ovhx1aXxDO/J/QWpDw1SgX8K4ZyYqaiFGqUAOGW5qGwmyWGJMUNlXU/m/QNMSNk1ehT7OqJkpUTSG/whDvBMi+6v3KLlTRp//mYOltEdrbCr74dfGKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CYJI9rOR; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CYJI9rOR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777577108; x=1809113108;
  h=date:from:to:cc:subject:message-id;
  bh=yfXs6FdQnjc/EA/urZOcntc+mZRekT8UNIf1yMmMh1I=;
  b=CYJI9rOR62RMewPE29OhMd8grsxcGyfuXlmjvpQ+WN2nuOVWez5Y0Zv9
   aiHEQ9LmnIPEc+AjbqflP1W/nRol/3y6o0MLnoA1L/jy334XzlNh+igTK
   kt6SbD7cfKwah2FVA36Gd9dxhtVVCLlEt6GEFMDtbcbi/TC0bhwNrzC8D
   AAONvUJ4XTwRHg64F127uXk1j/PR+F+CjeWmNB4XyA9h51BN0/bgqpGvq
   5965M6+PvmkQWsueGLQZf3C6jYbGHv7VzaA3aGwLAg1Qj7WFUMHlDQ6Uo
   Fp5brWTon5ElNWLpPW84pV1VQPShqHg2bqDO9urELuPZvyq8wHcgHlvgp
   g==;
X-CSE-ConnectionGUID: kKfDxc05TN6LhGHADpm6+w==
X-CSE-MsgGUID: 37dZQ54wRZeM7mNyfjF0lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="78594499"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="78594499"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 12:25:07 -0700
X-CSE-ConnectionGUID: TgKdX+ViRxmdCjrdKz8b5Q==
X-CSE-MsgGUID: t0cw/vR1ThWmm5t3Zs+Chw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="232019748"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Apr 2026 12:25:06 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIX0R-00000000Cqh-1OaQ;
	Thu, 30 Apr 2026 19:25:03 +0000
Date: Fri, 01 May 2026 03:24:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/bpf/fixups.c:808 bpf_convert_ctx_accesses() error:
 __builtin_memcpy() 'insn_buf' too small (256 vs u32max)
Message-ID: <202605010328.WP97t2ia-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Alexei Starovoitov <ast@kernel.org>

Hi Alexei,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e75a43c7cec459a07d91ed17de4de13ede2b7758
commit: 449f08fa59dda5da40317b6976604b877c4ecd63 bpf: Move fixup/post-processing logic from verifier.c into fixups.c
date:   3 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 3 weeks ago
config: sparc-randconfig-r072-20260430 (https://download.01.org/0day-ci/archive/20260501/202605010328.WP97t2ia-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 449f08fa59dd ("bpf: Move fixup/post-processing logic from verifier.c into fixups.c")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605010328.WP97t2ia-lkp@intel.com/

smatch warnings:
kernel/bpf/fixups.c:808 bpf_convert_ctx_accesses() error: __builtin_memcpy() 'insn_buf' too small (256 vs u32max)
kernel/bpf/fixups.c:808 bpf_convert_ctx_accesses() error: __builtin_memcpy() 'epilogue_buf' too small (256 vs u32max)

vim +/insn_buf +808 kernel/bpf/fixups.c

449f08fa59dda5d Alexei Starovoitov 2026-04-12  670  
449f08fa59dda5d Alexei Starovoitov 2026-04-12  671  /* convert load instructions that access fields of a context type into a
449f08fa59dda5d Alexei Starovoitov 2026-04-12  672   * sequence of instructions that access fields of the underlying structure:
449f08fa59dda5d Alexei Starovoitov 2026-04-12  673   *     struct __sk_buff    -> struct sk_buff
449f08fa59dda5d Alexei Starovoitov 2026-04-12  674   *     struct bpf_sock_ops -> struct sock
449f08fa59dda5d Alexei Starovoitov 2026-04-12  675   */
449f08fa59dda5d Alexei Starovoitov 2026-04-12  676  int bpf_convert_ctx_accesses(struct bpf_verifier_env *env)
449f08fa59dda5d Alexei Starovoitov 2026-04-12  677  {
449f08fa59dda5d Alexei Starovoitov 2026-04-12  678  	struct bpf_subprog_info *subprogs = env->subprog_info;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  679  	const struct bpf_verifier_ops *ops = env->ops;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  680  	int i, cnt, size, ctx_field_size, ret, delta = 0, epilogue_cnt = 0;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  681  	const int insn_cnt = env->prog->len;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  682  	struct bpf_insn *epilogue_buf = env->epilogue_buf;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  683  	struct bpf_insn *insn_buf = env->insn_buf;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  684  	struct bpf_insn *insn;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  685  	u32 target_size, size_default, off;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  686  	struct bpf_prog *new_prog;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  687  	enum bpf_access_type type;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  688  	bool is_narrower_load;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  689  	int epilogue_idx = 0;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  690  
449f08fa59dda5d Alexei Starovoitov 2026-04-12  691  	if (ops->gen_epilogue) {
449f08fa59dda5d Alexei Starovoitov 2026-04-12  692  		epilogue_cnt = ops->gen_epilogue(epilogue_buf, env->prog,
449f08fa59dda5d Alexei Starovoitov 2026-04-12  693  						 -(subprogs[0].stack_depth + 8));
449f08fa59dda5d Alexei Starovoitov 2026-04-12  694  		if (epilogue_cnt >= INSN_BUF_SIZE) {
449f08fa59dda5d Alexei Starovoitov 2026-04-12  695  			verifier_bug(env, "epilogue is too long");
449f08fa59dda5d Alexei Starovoitov 2026-04-12  696  			return -EFAULT;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  697  		} else if (epilogue_cnt) {
449f08fa59dda5d Alexei Starovoitov 2026-04-12  698  			/* Save the ARG_PTR_TO_CTX for the epilogue to use */
449f08fa59dda5d Alexei Starovoitov 2026-04-12  699  			cnt = 0;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  700  			subprogs[0].stack_depth += 8;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  701  			insn_buf[cnt++] = BPF_STX_MEM(BPF_DW, BPF_REG_FP, BPF_REG_1,
449f08fa59dda5d Alexei Starovoitov 2026-04-12  702  						      -subprogs[0].stack_depth);
449f08fa59dda5d Alexei Starovoitov 2026-04-12  703  			insn_buf[cnt++] = env->prog->insnsi[0];
449f08fa59dda5d Alexei Starovoitov 2026-04-12  704  			new_prog = bpf_patch_insn_data(env, 0, insn_buf, cnt);
449f08fa59dda5d Alexei Starovoitov 2026-04-12  705  			if (!new_prog)
449f08fa59dda5d Alexei Starovoitov 2026-04-12  706  				return -ENOMEM;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  707  			env->prog = new_prog;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  708  			delta += cnt - 1;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  709  
449f08fa59dda5d Alexei Starovoitov 2026-04-12  710  			ret = add_kfunc_in_insns(env, epilogue_buf, epilogue_cnt - 1);
449f08fa59dda5d Alexei Starovoitov 2026-04-12  711  			if (ret < 0)
449f08fa59dda5d Alexei Starovoitov 2026-04-12  712  				return ret;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  713  		}
449f08fa59dda5d Alexei Starovoitov 2026-04-12  714  	}
449f08fa59dda5d Alexei Starovoitov 2026-04-12  715  
449f08fa59dda5d Alexei Starovoitov 2026-04-12  716  	if (ops->gen_prologue || env->seen_direct_write) {
449f08fa59dda5d Alexei Starovoitov 2026-04-12  717  		if (!ops->gen_prologue) {
449f08fa59dda5d Alexei Starovoitov 2026-04-12  718  			verifier_bug(env, "gen_prologue is null");
449f08fa59dda5d Alexei Starovoitov 2026-04-12  719  			return -EFAULT;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  720  		}
449f08fa59dda5d Alexei Starovoitov 2026-04-12  721  		cnt = ops->gen_prologue(insn_buf, env->seen_direct_write,
449f08fa59dda5d Alexei Starovoitov 2026-04-12  722  					env->prog);
449f08fa59dda5d Alexei Starovoitov 2026-04-12  723  		if (cnt >= INSN_BUF_SIZE) {
449f08fa59dda5d Alexei Starovoitov 2026-04-12  724  			verifier_bug(env, "prologue is too long");
449f08fa59dda5d Alexei Starovoitov 2026-04-12  725  			return -EFAULT;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  726  		} else if (cnt) {
449f08fa59dda5d Alexei Starovoitov 2026-04-12  727  			new_prog = bpf_patch_insn_data(env, 0, insn_buf, cnt);
449f08fa59dda5d Alexei Starovoitov 2026-04-12  728  			if (!new_prog)
449f08fa59dda5d Alexei Starovoitov 2026-04-12  729  				return -ENOMEM;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  730  
449f08fa59dda5d Alexei Starovoitov 2026-04-12  731  			env->prog = new_prog;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  732  			delta += cnt - 1;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  733  
449f08fa59dda5d Alexei Starovoitov 2026-04-12  734  			ret = add_kfunc_in_insns(env, insn_buf, cnt - 1);
449f08fa59dda5d Alexei Starovoitov 2026-04-12  735  			if (ret < 0)
449f08fa59dda5d Alexei Starovoitov 2026-04-12  736  				return ret;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  737  		}
449f08fa59dda5d Alexei Starovoitov 2026-04-12  738  	}
449f08fa59dda5d Alexei Starovoitov 2026-04-12  739  
449f08fa59dda5d Alexei Starovoitov 2026-04-12  740  	if (delta)
449f08fa59dda5d Alexei Starovoitov 2026-04-12  741  		WARN_ON(adjust_jmp_off(env->prog, 0, delta));
449f08fa59dda5d Alexei Starovoitov 2026-04-12  742  
449f08fa59dda5d Alexei Starovoitov 2026-04-12  743  	if (bpf_prog_is_offloaded(env->prog->aux))
449f08fa59dda5d Alexei Starovoitov 2026-04-12  744  		return 0;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  745  
449f08fa59dda5d Alexei Starovoitov 2026-04-12  746  	insn = env->prog->insnsi + delta;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  747  
449f08fa59dda5d Alexei Starovoitov 2026-04-12  748  	for (i = 0; i < insn_cnt; i++, insn++) {
449f08fa59dda5d Alexei Starovoitov 2026-04-12  749  		bpf_convert_ctx_access_t convert_ctx_access;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  750  		u8 mode;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  751  
449f08fa59dda5d Alexei Starovoitov 2026-04-12  752  		if (env->insn_aux_data[i + delta].nospec) {
449f08fa59dda5d Alexei Starovoitov 2026-04-12  753  			WARN_ON_ONCE(env->insn_aux_data[i + delta].alu_state);
449f08fa59dda5d Alexei Starovoitov 2026-04-12  754  			struct bpf_insn *patch = insn_buf;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  755  
449f08fa59dda5d Alexei Starovoitov 2026-04-12  756  			*patch++ = BPF_ST_NOSPEC();
449f08fa59dda5d Alexei Starovoitov 2026-04-12  757  			*patch++ = *insn;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  758  			cnt = patch - insn_buf;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  759  			new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
449f08fa59dda5d Alexei Starovoitov 2026-04-12  760  			if (!new_prog)
449f08fa59dda5d Alexei Starovoitov 2026-04-12  761  				return -ENOMEM;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  762  
449f08fa59dda5d Alexei Starovoitov 2026-04-12  763  			delta    += cnt - 1;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  764  			env->prog = new_prog;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  765  			insn      = new_prog->insnsi + i + delta;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  766  			/* This can not be easily merged with the
449f08fa59dda5d Alexei Starovoitov 2026-04-12  767  			 * nospec_result-case, because an insn may require a
449f08fa59dda5d Alexei Starovoitov 2026-04-12  768  			 * nospec before and after itself. Therefore also do not
449f08fa59dda5d Alexei Starovoitov 2026-04-12  769  			 * 'continue' here but potentially apply further
449f08fa59dda5d Alexei Starovoitov 2026-04-12  770  			 * patching to insn. *insn should equal patch[1] now.
449f08fa59dda5d Alexei Starovoitov 2026-04-12  771  			 */
449f08fa59dda5d Alexei Starovoitov 2026-04-12  772  		}
449f08fa59dda5d Alexei Starovoitov 2026-04-12  773  
449f08fa59dda5d Alexei Starovoitov 2026-04-12  774  		if (insn->code == (BPF_LDX | BPF_MEM | BPF_B) ||
449f08fa59dda5d Alexei Starovoitov 2026-04-12  775  		    insn->code == (BPF_LDX | BPF_MEM | BPF_H) ||
449f08fa59dda5d Alexei Starovoitov 2026-04-12  776  		    insn->code == (BPF_LDX | BPF_MEM | BPF_W) ||
449f08fa59dda5d Alexei Starovoitov 2026-04-12  777  		    insn->code == (BPF_LDX | BPF_MEM | BPF_DW) ||
449f08fa59dda5d Alexei Starovoitov 2026-04-12  778  		    insn->code == (BPF_LDX | BPF_MEMSX | BPF_B) ||
449f08fa59dda5d Alexei Starovoitov 2026-04-12  779  		    insn->code == (BPF_LDX | BPF_MEMSX | BPF_H) ||
449f08fa59dda5d Alexei Starovoitov 2026-04-12  780  		    insn->code == (BPF_LDX | BPF_MEMSX | BPF_W)) {
449f08fa59dda5d Alexei Starovoitov 2026-04-12  781  			type = BPF_READ;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  782  		} else if (insn->code == (BPF_STX | BPF_MEM | BPF_B) ||
449f08fa59dda5d Alexei Starovoitov 2026-04-12  783  			   insn->code == (BPF_STX | BPF_MEM | BPF_H) ||
449f08fa59dda5d Alexei Starovoitov 2026-04-12  784  			   insn->code == (BPF_STX | BPF_MEM | BPF_W) ||
449f08fa59dda5d Alexei Starovoitov 2026-04-12  785  			   insn->code == (BPF_STX | BPF_MEM | BPF_DW) ||
449f08fa59dda5d Alexei Starovoitov 2026-04-12  786  			   insn->code == (BPF_ST | BPF_MEM | BPF_B) ||
449f08fa59dda5d Alexei Starovoitov 2026-04-12  787  			   insn->code == (BPF_ST | BPF_MEM | BPF_H) ||
449f08fa59dda5d Alexei Starovoitov 2026-04-12  788  			   insn->code == (BPF_ST | BPF_MEM | BPF_W) ||
449f08fa59dda5d Alexei Starovoitov 2026-04-12  789  			   insn->code == (BPF_ST | BPF_MEM | BPF_DW)) {
449f08fa59dda5d Alexei Starovoitov 2026-04-12  790  			type = BPF_WRITE;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  791  		} else if ((insn->code == (BPF_STX | BPF_ATOMIC | BPF_B) ||
449f08fa59dda5d Alexei Starovoitov 2026-04-12  792  			    insn->code == (BPF_STX | BPF_ATOMIC | BPF_H) ||
449f08fa59dda5d Alexei Starovoitov 2026-04-12  793  			    insn->code == (BPF_STX | BPF_ATOMIC | BPF_W) ||
449f08fa59dda5d Alexei Starovoitov 2026-04-12  794  			    insn->code == (BPF_STX | BPF_ATOMIC | BPF_DW)) &&
449f08fa59dda5d Alexei Starovoitov 2026-04-12  795  			   env->insn_aux_data[i + delta].ptr_type == PTR_TO_ARENA) {
449f08fa59dda5d Alexei Starovoitov 2026-04-12  796  			insn->code = BPF_STX | BPF_PROBE_ATOMIC | BPF_SIZE(insn->code);
449f08fa59dda5d Alexei Starovoitov 2026-04-12  797  			env->prog->aux->num_exentries++;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  798  			continue;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  799  		} else if (insn->code == (BPF_JMP | BPF_EXIT) &&
449f08fa59dda5d Alexei Starovoitov 2026-04-12  800  			   epilogue_cnt &&
449f08fa59dda5d Alexei Starovoitov 2026-04-12  801  			   i + delta < subprogs[1].start) {
449f08fa59dda5d Alexei Starovoitov 2026-04-12  802  			/* Generate epilogue for the main prog */
449f08fa59dda5d Alexei Starovoitov 2026-04-12  803  			if (epilogue_idx) {
449f08fa59dda5d Alexei Starovoitov 2026-04-12  804  				/* jump back to the earlier generated epilogue */
449f08fa59dda5d Alexei Starovoitov 2026-04-12  805  				insn_buf[0] = BPF_JMP32_A(epilogue_idx - i - delta - 1);
449f08fa59dda5d Alexei Starovoitov 2026-04-12  806  				cnt = 1;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  807  			} else {
449f08fa59dda5d Alexei Starovoitov 2026-04-12 @808  				memcpy(insn_buf, epilogue_buf,
449f08fa59dda5d Alexei Starovoitov 2026-04-12  809  				       epilogue_cnt * sizeof(*epilogue_buf));
449f08fa59dda5d Alexei Starovoitov 2026-04-12  810  				cnt = epilogue_cnt;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  811  				/* epilogue_idx cannot be 0. It must have at
449f08fa59dda5d Alexei Starovoitov 2026-04-12  812  				 * least one ctx ptr saving insn before the
449f08fa59dda5d Alexei Starovoitov 2026-04-12  813  				 * epilogue.
449f08fa59dda5d Alexei Starovoitov 2026-04-12  814  				 */
449f08fa59dda5d Alexei Starovoitov 2026-04-12  815  				epilogue_idx = i + delta;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  816  			}
449f08fa59dda5d Alexei Starovoitov 2026-04-12  817  			goto patch_insn_buf;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  818  		} else {
449f08fa59dda5d Alexei Starovoitov 2026-04-12  819  			continue;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  820  		}
449f08fa59dda5d Alexei Starovoitov 2026-04-12  821  
449f08fa59dda5d Alexei Starovoitov 2026-04-12  822  		if (type == BPF_WRITE &&
449f08fa59dda5d Alexei Starovoitov 2026-04-12  823  		    env->insn_aux_data[i + delta].nospec_result) {
449f08fa59dda5d Alexei Starovoitov 2026-04-12  824  			/* nospec_result is only used to mitigate Spectre v4 and
449f08fa59dda5d Alexei Starovoitov 2026-04-12  825  			 * to limit verification-time for Spectre v1.
449f08fa59dda5d Alexei Starovoitov 2026-04-12  826  			 */
449f08fa59dda5d Alexei Starovoitov 2026-04-12  827  			struct bpf_insn *patch = insn_buf;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  828  
449f08fa59dda5d Alexei Starovoitov 2026-04-12  829  			*patch++ = *insn;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  830  			*patch++ = BPF_ST_NOSPEC();
449f08fa59dda5d Alexei Starovoitov 2026-04-12  831  			cnt = patch - insn_buf;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  832  			new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
449f08fa59dda5d Alexei Starovoitov 2026-04-12  833  			if (!new_prog)
449f08fa59dda5d Alexei Starovoitov 2026-04-12  834  				return -ENOMEM;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  835  
449f08fa59dda5d Alexei Starovoitov 2026-04-12  836  			delta    += cnt - 1;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  837  			env->prog = new_prog;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  838  			insn      = new_prog->insnsi + i + delta;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  839  			continue;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  840  		}
449f08fa59dda5d Alexei Starovoitov 2026-04-12  841  
449f08fa59dda5d Alexei Starovoitov 2026-04-12  842  		switch ((int)env->insn_aux_data[i + delta].ptr_type) {
449f08fa59dda5d Alexei Starovoitov 2026-04-12  843  		case PTR_TO_CTX:
449f08fa59dda5d Alexei Starovoitov 2026-04-12  844  			if (!ops->convert_ctx_access)
449f08fa59dda5d Alexei Starovoitov 2026-04-12  845  				continue;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  846  			convert_ctx_access = ops->convert_ctx_access;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  847  			break;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  848  		case PTR_TO_SOCKET:
449f08fa59dda5d Alexei Starovoitov 2026-04-12  849  		case PTR_TO_SOCK_COMMON:
449f08fa59dda5d Alexei Starovoitov 2026-04-12  850  			convert_ctx_access = bpf_sock_convert_ctx_access;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  851  			break;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  852  		case PTR_TO_TCP_SOCK:
449f08fa59dda5d Alexei Starovoitov 2026-04-12  853  			convert_ctx_access = bpf_tcp_sock_convert_ctx_access;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  854  			break;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  855  		case PTR_TO_XDP_SOCK:
449f08fa59dda5d Alexei Starovoitov 2026-04-12  856  			convert_ctx_access = bpf_xdp_sock_convert_ctx_access;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  857  			break;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  858  		case PTR_TO_BTF_ID:
449f08fa59dda5d Alexei Starovoitov 2026-04-12  859  		case PTR_TO_BTF_ID | PTR_UNTRUSTED:
449f08fa59dda5d Alexei Starovoitov 2026-04-12  860  		/* PTR_TO_BTF_ID | MEM_ALLOC always has a valid lifetime, unlike
449f08fa59dda5d Alexei Starovoitov 2026-04-12  861  		 * PTR_TO_BTF_ID, and an active ref_obj_id, but the same cannot
449f08fa59dda5d Alexei Starovoitov 2026-04-12  862  		 * be said once it is marked PTR_UNTRUSTED, hence we must handle
449f08fa59dda5d Alexei Starovoitov 2026-04-12  863  		 * any faults for loads into such types. BPF_WRITE is disallowed
449f08fa59dda5d Alexei Starovoitov 2026-04-12  864  		 * for this case.
449f08fa59dda5d Alexei Starovoitov 2026-04-12  865  		 */
449f08fa59dda5d Alexei Starovoitov 2026-04-12  866  		case PTR_TO_BTF_ID | MEM_ALLOC | PTR_UNTRUSTED:
449f08fa59dda5d Alexei Starovoitov 2026-04-12  867  		case PTR_TO_MEM | MEM_RDONLY | PTR_UNTRUSTED:
449f08fa59dda5d Alexei Starovoitov 2026-04-12  868  			if (type == BPF_READ) {
449f08fa59dda5d Alexei Starovoitov 2026-04-12  869  				if (BPF_MODE(insn->code) == BPF_MEM)
449f08fa59dda5d Alexei Starovoitov 2026-04-12  870  					insn->code = BPF_LDX | BPF_PROBE_MEM |
449f08fa59dda5d Alexei Starovoitov 2026-04-12  871  						     BPF_SIZE((insn)->code);
449f08fa59dda5d Alexei Starovoitov 2026-04-12  872  				else
449f08fa59dda5d Alexei Starovoitov 2026-04-12  873  					insn->code = BPF_LDX | BPF_PROBE_MEMSX |
449f08fa59dda5d Alexei Starovoitov 2026-04-12  874  						     BPF_SIZE((insn)->code);
449f08fa59dda5d Alexei Starovoitov 2026-04-12  875  				env->prog->aux->num_exentries++;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  876  			}
449f08fa59dda5d Alexei Starovoitov 2026-04-12  877  			continue;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  878  		case PTR_TO_ARENA:
449f08fa59dda5d Alexei Starovoitov 2026-04-12  879  			if (BPF_MODE(insn->code) == BPF_MEMSX) {
449f08fa59dda5d Alexei Starovoitov 2026-04-12  880  				if (!bpf_jit_supports_insn(insn, true)) {
449f08fa59dda5d Alexei Starovoitov 2026-04-12  881  					verbose(env, "sign extending loads from arena are not supported yet\n");
449f08fa59dda5d Alexei Starovoitov 2026-04-12  882  					return -EOPNOTSUPP;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  883  				}
449f08fa59dda5d Alexei Starovoitov 2026-04-12  884  				insn->code = BPF_CLASS(insn->code) | BPF_PROBE_MEM32SX | BPF_SIZE(insn->code);
449f08fa59dda5d Alexei Starovoitov 2026-04-12  885  			} else {
449f08fa59dda5d Alexei Starovoitov 2026-04-12  886  				insn->code = BPF_CLASS(insn->code) | BPF_PROBE_MEM32 | BPF_SIZE(insn->code);
449f08fa59dda5d Alexei Starovoitov 2026-04-12  887  			}
449f08fa59dda5d Alexei Starovoitov 2026-04-12  888  			env->prog->aux->num_exentries++;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  889  			continue;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  890  		default:
449f08fa59dda5d Alexei Starovoitov 2026-04-12  891  			continue;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  892  		}
449f08fa59dda5d Alexei Starovoitov 2026-04-12  893  
449f08fa59dda5d Alexei Starovoitov 2026-04-12  894  		ctx_field_size = env->insn_aux_data[i + delta].ctx_field_size;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  895  		size = BPF_LDST_BYTES(insn);
449f08fa59dda5d Alexei Starovoitov 2026-04-12  896  		mode = BPF_MODE(insn->code);
449f08fa59dda5d Alexei Starovoitov 2026-04-12  897  
449f08fa59dda5d Alexei Starovoitov 2026-04-12  898  		/* If the read access is a narrower load of the field,
449f08fa59dda5d Alexei Starovoitov 2026-04-12  899  		 * convert to a 4/8-byte load, to minimum program type specific
449f08fa59dda5d Alexei Starovoitov 2026-04-12  900  		 * convert_ctx_access changes. If conversion is successful,
449f08fa59dda5d Alexei Starovoitov 2026-04-12  901  		 * we will apply proper mask to the result.
449f08fa59dda5d Alexei Starovoitov 2026-04-12  902  		 */
449f08fa59dda5d Alexei Starovoitov 2026-04-12  903  		is_narrower_load = size < ctx_field_size;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  904  		size_default = bpf_ctx_off_adjust_machine(ctx_field_size);
449f08fa59dda5d Alexei Starovoitov 2026-04-12  905  		off = insn->off;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  906  		if (is_narrower_load) {
449f08fa59dda5d Alexei Starovoitov 2026-04-12  907  			u8 size_code;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  908  
449f08fa59dda5d Alexei Starovoitov 2026-04-12  909  			if (type == BPF_WRITE) {
449f08fa59dda5d Alexei Starovoitov 2026-04-12  910  				verifier_bug(env, "narrow ctx access misconfigured");
449f08fa59dda5d Alexei Starovoitov 2026-04-12  911  				return -EFAULT;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  912  			}
449f08fa59dda5d Alexei Starovoitov 2026-04-12  913  
449f08fa59dda5d Alexei Starovoitov 2026-04-12  914  			size_code = BPF_H;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  915  			if (ctx_field_size == 4)
449f08fa59dda5d Alexei Starovoitov 2026-04-12  916  				size_code = BPF_W;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  917  			else if (ctx_field_size == 8)
449f08fa59dda5d Alexei Starovoitov 2026-04-12  918  				size_code = BPF_DW;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  919  
449f08fa59dda5d Alexei Starovoitov 2026-04-12  920  			insn->off = off & ~(size_default - 1);
449f08fa59dda5d Alexei Starovoitov 2026-04-12  921  			insn->code = BPF_LDX | BPF_MEM | size_code;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  922  		}
449f08fa59dda5d Alexei Starovoitov 2026-04-12  923  
449f08fa59dda5d Alexei Starovoitov 2026-04-12  924  		target_size = 0;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  925  		cnt = convert_ctx_access(type, insn, insn_buf, env->prog,
449f08fa59dda5d Alexei Starovoitov 2026-04-12  926  					 &target_size);
449f08fa59dda5d Alexei Starovoitov 2026-04-12  927  		if (cnt == 0 || cnt >= INSN_BUF_SIZE ||
449f08fa59dda5d Alexei Starovoitov 2026-04-12  928  		    (ctx_field_size && !target_size)) {
449f08fa59dda5d Alexei Starovoitov 2026-04-12  929  			verifier_bug(env, "error during ctx access conversion (%d)", cnt);
449f08fa59dda5d Alexei Starovoitov 2026-04-12  930  			return -EFAULT;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  931  		}
449f08fa59dda5d Alexei Starovoitov 2026-04-12  932  
449f08fa59dda5d Alexei Starovoitov 2026-04-12  933  		if (is_narrower_load && size < target_size) {
449f08fa59dda5d Alexei Starovoitov 2026-04-12  934  			u8 shift = bpf_ctx_narrow_access_offset(
449f08fa59dda5d Alexei Starovoitov 2026-04-12  935  				off, size, size_default) * 8;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  936  			if (shift && cnt + 1 >= INSN_BUF_SIZE) {
449f08fa59dda5d Alexei Starovoitov 2026-04-12  937  				verifier_bug(env, "narrow ctx load misconfigured");
449f08fa59dda5d Alexei Starovoitov 2026-04-12  938  				return -EFAULT;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  939  			}
449f08fa59dda5d Alexei Starovoitov 2026-04-12  940  			if (ctx_field_size <= 4) {
449f08fa59dda5d Alexei Starovoitov 2026-04-12  941  				if (shift)
449f08fa59dda5d Alexei Starovoitov 2026-04-12  942  					insn_buf[cnt++] = BPF_ALU32_IMM(BPF_RSH,
449f08fa59dda5d Alexei Starovoitov 2026-04-12  943  									insn->dst_reg,
449f08fa59dda5d Alexei Starovoitov 2026-04-12  944  									shift);
449f08fa59dda5d Alexei Starovoitov 2026-04-12  945  				insn_buf[cnt++] = BPF_ALU32_IMM(BPF_AND, insn->dst_reg,
449f08fa59dda5d Alexei Starovoitov 2026-04-12  946  								(1 << size * 8) - 1);
449f08fa59dda5d Alexei Starovoitov 2026-04-12  947  			} else {
449f08fa59dda5d Alexei Starovoitov 2026-04-12  948  				if (shift)
449f08fa59dda5d Alexei Starovoitov 2026-04-12  949  					insn_buf[cnt++] = BPF_ALU64_IMM(BPF_RSH,
449f08fa59dda5d Alexei Starovoitov 2026-04-12  950  									insn->dst_reg,
449f08fa59dda5d Alexei Starovoitov 2026-04-12  951  									shift);
449f08fa59dda5d Alexei Starovoitov 2026-04-12  952  				insn_buf[cnt++] = BPF_ALU32_IMM(BPF_AND, insn->dst_reg,
449f08fa59dda5d Alexei Starovoitov 2026-04-12  953  								(1ULL << size * 8) - 1);
449f08fa59dda5d Alexei Starovoitov 2026-04-12  954  			}
449f08fa59dda5d Alexei Starovoitov 2026-04-12  955  		}
449f08fa59dda5d Alexei Starovoitov 2026-04-12  956  		if (mode == BPF_MEMSX)
449f08fa59dda5d Alexei Starovoitov 2026-04-12  957  			insn_buf[cnt++] = BPF_RAW_INSN(BPF_ALU64 | BPF_MOV | BPF_X,
449f08fa59dda5d Alexei Starovoitov 2026-04-12  958  						       insn->dst_reg, insn->dst_reg,
449f08fa59dda5d Alexei Starovoitov 2026-04-12  959  						       size * 8, 0);
449f08fa59dda5d Alexei Starovoitov 2026-04-12  960  
449f08fa59dda5d Alexei Starovoitov 2026-04-12  961  patch_insn_buf:
449f08fa59dda5d Alexei Starovoitov 2026-04-12  962  		new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
449f08fa59dda5d Alexei Starovoitov 2026-04-12  963  		if (!new_prog)
449f08fa59dda5d Alexei Starovoitov 2026-04-12  964  			return -ENOMEM;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  965  
449f08fa59dda5d Alexei Starovoitov 2026-04-12  966  		delta += cnt - 1;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  967  
449f08fa59dda5d Alexei Starovoitov 2026-04-12  968  		/* keep walking new program and skip insns we just inserted */
449f08fa59dda5d Alexei Starovoitov 2026-04-12  969  		env->prog = new_prog;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  970  		insn      = new_prog->insnsi + i + delta;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  971  	}
449f08fa59dda5d Alexei Starovoitov 2026-04-12  972  
449f08fa59dda5d Alexei Starovoitov 2026-04-12  973  	return 0;
449f08fa59dda5d Alexei Starovoitov 2026-04-12  974  }
449f08fa59dda5d Alexei Starovoitov 2026-04-12  975  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
