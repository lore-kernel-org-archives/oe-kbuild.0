Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983F91E9096
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Nov 2024 12:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730982916; cv=none; b=PtOIjJaExlk8NaHX0FSnkUbShI1Vq6u/tbJrGSmGZTE282HukkNgDOZZKBcnJ1Zt0VsMaNCUcVA5QRlN35rKD7TojN8VWOwfGvihLua88iZzAYaBomu/UTAySA57Ir/TFqFLEfpzVfObO1cvlNHyfqHogxrwk7hVorhvzP/wego=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730982916; c=relaxed/simple;
	bh=a9mAjk0tPtlh/fhxKic2rV+wcsjml9VKhzT5GlcDmEw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cfQKaUkGEsOf8Y1e6vFaKgmo6MqUBcOIZzwF4l11lMVDTQEdGe+TO0xc7EndL1mYfQzd35DEblbbVKfbAOSBX/ZG1NDwB/RSJuSCw0ZDgylXt/95kR/DROE0MGGW/Ciwj6Ll9r6/P5UTXxFOmzFxMjTjFqoZ13LvUfXnP2VpynQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eXk8Nj7A; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eXk8Nj7A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730982913; x=1762518913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a9mAjk0tPtlh/fhxKic2rV+wcsjml9VKhzT5GlcDmEw=;
  b=eXk8Nj7ApP2NP4dvfNMI/g78/Qc8+iSKNJFKXMibNyTO4GKLkzEjooIU
   CUvZZKXP/FOQMnpiKt5Hl3ptGKL1Zr4BYYgpISRqxO3P+8PEM6x6mwJlw
   6PfcBbi52lbqwk2HTXsyI4DEKkKhdwQ/n6SIlWYkVdwKq5NO37ELLrXP9
   DtN5ljgRyGBUToAsZ/zNeQml3UWW0hGU3ALCI+/7J6lKIWbQ7EhywkmN4
   HyTXB1jlkIURCYZPQPFvN6/rr57vF2duMj5O3SXy7igx2yVMbsxX/a/dk
   A0EVsYyjbQSW39S2I18AXgm3bmTvAXfq+FWIFLNLZw18BUrdyu1ACKK04
   Q==;
X-CSE-ConnectionGUID: 0C0jwkwrTSS0EO0Ytbqh5g==
X-CSE-MsgGUID: 4eumYgQ/SCumu5uAqurWjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="34745991"
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; 
   d="scan'208";a="34745991"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 04:35:13 -0800
X-CSE-ConnectionGUID: 4d19UeOiR3qtH5XKtFJ6bA==
X-CSE-MsgGUID: iuN7r1BeSV6OK/LZE/2MYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; 
   d="scan'208";a="90183606"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Nov 2024 04:35:11 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t91jB-000qEA-07;
	Thu, 07 Nov 2024 12:35:09 +0000
Date: Thu, 7 Nov 2024 20:34:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/loongarch/net/bpf_jit.c:915 build_insn() warn: missing unwind
 goto?
Message-ID: <202411072011.Ax5tHydu-lkp@intel.com>
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
TO: "Mike Rapoport (IBM)" <rppt@kernel.org>
CC: Luis Chamberlain <mcgrof@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ff7afaeca1a15fbeaa2c4795ee806c0667bd77b2
commit: 2c9e5d4a008293407836d29d35dfd4353615bd2f bpf: remove CONFIG_BPF_JIT dependency on CONFIG_MODULES of
date:   6 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 6 months ago
config: loongarch-randconfig-r073-20241107 (https://download.01.org/0day-ci/archive/20241107/202411072011.Ax5tHydu-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411072011.Ax5tHydu-lkp@intel.com/

smatch warnings:
arch/loongarch/net/bpf_jit.c:915 build_insn() warn: missing unwind goto?

vim +915 arch/loongarch/net/bpf_jit.c

dbcd7f5fafea64 Youling Tang 2022-12-10   457  
5dc615520c4dfb Tiezhu Yang  2022-10-12   458  static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool extra_pass)
5dc615520c4dfb Tiezhu Yang  2022-10-12   459  {
bbfddb904df6f8 Huacai Chen  2022-10-29   460  	u8 tm = -1;
bbfddb904df6f8 Huacai Chen  2022-10-29   461  	u64 func_addr;
7111afe8fb5f15 Hengqi Chen  2023-11-08   462  	bool func_addr_fixed, sign_extend;
bbfddb904df6f8 Huacai Chen  2022-10-29   463  	int i = insn - ctx->prog->insnsi;
bbfddb904df6f8 Huacai Chen  2022-10-29   464  	int ret, jmp_offset;
5dc615520c4dfb Tiezhu Yang  2022-10-12   465  	const u8 code = insn->code;
5dc615520c4dfb Tiezhu Yang  2022-10-12   466  	const u8 cond = BPF_OP(code);
5dc615520c4dfb Tiezhu Yang  2022-10-12   467  	const u8 t1 = LOONGARCH_GPR_T1;
5dc615520c4dfb Tiezhu Yang  2022-10-12   468  	const u8 t2 = LOONGARCH_GPR_T2;
5dc615520c4dfb Tiezhu Yang  2022-10-12   469  	const u8 src = regmap[insn->src_reg];
5dc615520c4dfb Tiezhu Yang  2022-10-12   470  	const u8 dst = regmap[insn->dst_reg];
5dc615520c4dfb Tiezhu Yang  2022-10-12   471  	const s16 off = insn->off;
5dc615520c4dfb Tiezhu Yang  2022-10-12   472  	const s32 imm = insn->imm;
bbfddb904df6f8 Huacai Chen  2022-10-29   473  	const bool is32 = BPF_CLASS(insn->code) == BPF_ALU || BPF_CLASS(insn->code) == BPF_JMP32;
5dc615520c4dfb Tiezhu Yang  2022-10-12   474  
5dc615520c4dfb Tiezhu Yang  2022-10-12   475  	switch (code) {
5dc615520c4dfb Tiezhu Yang  2022-10-12   476  	/* dst = src */
5dc615520c4dfb Tiezhu Yang  2022-10-12   477  	case BPF_ALU | BPF_MOV | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   478  	case BPF_ALU64 | BPF_MOV | BPF_X:
f48012f161508c Hengqi Chen  2023-11-08   479  		switch (off) {
f48012f161508c Hengqi Chen  2023-11-08   480  		case 0:
5dc615520c4dfb Tiezhu Yang  2022-10-12   481  			move_reg(ctx, dst, src);
5dc615520c4dfb Tiezhu Yang  2022-10-12   482  			emit_zext_32(ctx, dst, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   483  			break;
f48012f161508c Hengqi Chen  2023-11-08   484  		case 8:
f48012f161508c Hengqi Chen  2023-11-08   485  			move_reg(ctx, t1, src);
f48012f161508c Hengqi Chen  2023-11-08   486  			emit_insn(ctx, extwb, dst, t1);
772cbe948fb073 Tiezhu Yang  2023-12-09   487  			emit_zext_32(ctx, dst, is32);
f48012f161508c Hengqi Chen  2023-11-08   488  			break;
f48012f161508c Hengqi Chen  2023-11-08   489  		case 16:
f48012f161508c Hengqi Chen  2023-11-08   490  			move_reg(ctx, t1, src);
f48012f161508c Hengqi Chen  2023-11-08   491  			emit_insn(ctx, extwh, dst, t1);
772cbe948fb073 Tiezhu Yang  2023-12-09   492  			emit_zext_32(ctx, dst, is32);
f48012f161508c Hengqi Chen  2023-11-08   493  			break;
f48012f161508c Hengqi Chen  2023-11-08   494  		case 32:
f48012f161508c Hengqi Chen  2023-11-08   495  			emit_insn(ctx, addw, dst, src, LOONGARCH_GPR_ZERO);
f48012f161508c Hengqi Chen  2023-11-08   496  			break;
f48012f161508c Hengqi Chen  2023-11-08   497  		}
f48012f161508c Hengqi Chen  2023-11-08   498  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   499  
5dc615520c4dfb Tiezhu Yang  2022-10-12   500  	/* dst = imm */
5dc615520c4dfb Tiezhu Yang  2022-10-12   501  	case BPF_ALU | BPF_MOV | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   502  	case BPF_ALU64 | BPF_MOV | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   503  		move_imm(ctx, dst, imm, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   504  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   505  
5dc615520c4dfb Tiezhu Yang  2022-10-12   506  	/* dst = dst + src */
5dc615520c4dfb Tiezhu Yang  2022-10-12   507  	case BPF_ALU | BPF_ADD | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   508  	case BPF_ALU64 | BPF_ADD | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   509  		emit_insn(ctx, addd, dst, dst, src);
5dc615520c4dfb Tiezhu Yang  2022-10-12   510  		emit_zext_32(ctx, dst, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   511  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   512  
5dc615520c4dfb Tiezhu Yang  2022-10-12   513  	/* dst = dst + imm */
5dc615520c4dfb Tiezhu Yang  2022-10-12   514  	case BPF_ALU | BPF_ADD | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   515  	case BPF_ALU64 | BPF_ADD | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   516  		if (is_signed_imm12(imm)) {
5dc615520c4dfb Tiezhu Yang  2022-10-12   517  			emit_insn(ctx, addid, dst, dst, imm);
5dc615520c4dfb Tiezhu Yang  2022-10-12   518  		} else {
5dc615520c4dfb Tiezhu Yang  2022-10-12   519  			move_imm(ctx, t1, imm, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   520  			emit_insn(ctx, addd, dst, dst, t1);
5dc615520c4dfb Tiezhu Yang  2022-10-12   521  		}
5dc615520c4dfb Tiezhu Yang  2022-10-12   522  		emit_zext_32(ctx, dst, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   523  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   524  
5dc615520c4dfb Tiezhu Yang  2022-10-12   525  	/* dst = dst - src */
5dc615520c4dfb Tiezhu Yang  2022-10-12   526  	case BPF_ALU | BPF_SUB | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   527  	case BPF_ALU64 | BPF_SUB | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   528  		emit_insn(ctx, subd, dst, dst, src);
5dc615520c4dfb Tiezhu Yang  2022-10-12   529  		emit_zext_32(ctx, dst, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   530  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   531  
5dc615520c4dfb Tiezhu Yang  2022-10-12   532  	/* dst = dst - imm */
5dc615520c4dfb Tiezhu Yang  2022-10-12   533  	case BPF_ALU | BPF_SUB | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   534  	case BPF_ALU64 | BPF_SUB | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   535  		if (is_signed_imm12(-imm)) {
5dc615520c4dfb Tiezhu Yang  2022-10-12   536  			emit_insn(ctx, addid, dst, dst, -imm);
5dc615520c4dfb Tiezhu Yang  2022-10-12   537  		} else {
5dc615520c4dfb Tiezhu Yang  2022-10-12   538  			move_imm(ctx, t1, imm, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   539  			emit_insn(ctx, subd, dst, dst, t1);
5dc615520c4dfb Tiezhu Yang  2022-10-12   540  		}
5dc615520c4dfb Tiezhu Yang  2022-10-12   541  		emit_zext_32(ctx, dst, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   542  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   543  
5dc615520c4dfb Tiezhu Yang  2022-10-12   544  	/* dst = dst * src */
5dc615520c4dfb Tiezhu Yang  2022-10-12   545  	case BPF_ALU | BPF_MUL | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   546  	case BPF_ALU64 | BPF_MUL | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   547  		emit_insn(ctx, muld, dst, dst, src);
5dc615520c4dfb Tiezhu Yang  2022-10-12   548  		emit_zext_32(ctx, dst, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   549  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   550  
5dc615520c4dfb Tiezhu Yang  2022-10-12   551  	/* dst = dst * imm */
5dc615520c4dfb Tiezhu Yang  2022-10-12   552  	case BPF_ALU | BPF_MUL | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   553  	case BPF_ALU64 | BPF_MUL | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   554  		move_imm(ctx, t1, imm, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   555  		emit_insn(ctx, muld, dst, dst, t1);
5dc615520c4dfb Tiezhu Yang  2022-10-12   556  		emit_zext_32(ctx, dst, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   557  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   558  
5dc615520c4dfb Tiezhu Yang  2022-10-12   559  	/* dst = dst / src */
5dc615520c4dfb Tiezhu Yang  2022-10-12   560  	case BPF_ALU | BPF_DIV | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   561  	case BPF_ALU64 | BPF_DIV | BPF_X:
2425c9e002d2a1 Hengqi Chen  2023-11-08   562  		if (!off) {
5dc615520c4dfb Tiezhu Yang  2022-10-12   563  			emit_zext_32(ctx, dst, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   564  			move_reg(ctx, t1, src);
5dc615520c4dfb Tiezhu Yang  2022-10-12   565  			emit_zext_32(ctx, t1, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   566  			emit_insn(ctx, divdu, dst, dst, t1);
5dc615520c4dfb Tiezhu Yang  2022-10-12   567  			emit_zext_32(ctx, dst, is32);
2425c9e002d2a1 Hengqi Chen  2023-11-08   568  		} else {
2425c9e002d2a1 Hengqi Chen  2023-11-08   569  			emit_sext_32(ctx, dst, is32);
2425c9e002d2a1 Hengqi Chen  2023-11-08   570  			move_reg(ctx, t1, src);
2425c9e002d2a1 Hengqi Chen  2023-11-08   571  			emit_sext_32(ctx, t1, is32);
2425c9e002d2a1 Hengqi Chen  2023-11-08   572  			emit_insn(ctx, divd, dst, dst, t1);
2425c9e002d2a1 Hengqi Chen  2023-11-08   573  			emit_sext_32(ctx, dst, is32);
2425c9e002d2a1 Hengqi Chen  2023-11-08   574  		}
5dc615520c4dfb Tiezhu Yang  2022-10-12   575  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   576  
5dc615520c4dfb Tiezhu Yang  2022-10-12   577  	/* dst = dst / imm */
5dc615520c4dfb Tiezhu Yang  2022-10-12   578  	case BPF_ALU | BPF_DIV | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   579  	case BPF_ALU64 | BPF_DIV | BPF_K:
2425c9e002d2a1 Hengqi Chen  2023-11-08   580  		if (!off) {
5dc615520c4dfb Tiezhu Yang  2022-10-12   581  			move_imm(ctx, t1, imm, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   582  			emit_zext_32(ctx, dst, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   583  			emit_insn(ctx, divdu, dst, dst, t1);
5dc615520c4dfb Tiezhu Yang  2022-10-12   584  			emit_zext_32(ctx, dst, is32);
2425c9e002d2a1 Hengqi Chen  2023-11-08   585  		} else {
2425c9e002d2a1 Hengqi Chen  2023-11-08   586  			move_imm(ctx, t1, imm, false);
2425c9e002d2a1 Hengqi Chen  2023-11-08   587  			emit_sext_32(ctx, t1, is32);
2425c9e002d2a1 Hengqi Chen  2023-11-08   588  			emit_sext_32(ctx, dst, is32);
2425c9e002d2a1 Hengqi Chen  2023-11-08   589  			emit_insn(ctx, divd, dst, dst, t1);
2425c9e002d2a1 Hengqi Chen  2023-11-08   590  			emit_sext_32(ctx, dst, is32);
2425c9e002d2a1 Hengqi Chen  2023-11-08   591  		}
5dc615520c4dfb Tiezhu Yang  2022-10-12   592  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   593  
5dc615520c4dfb Tiezhu Yang  2022-10-12   594  	/* dst = dst % src */
5dc615520c4dfb Tiezhu Yang  2022-10-12   595  	case BPF_ALU | BPF_MOD | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   596  	case BPF_ALU64 | BPF_MOD | BPF_X:
7b6b13d32965ad Hengqi Chen  2023-11-08   597  		if (!off) {
5dc615520c4dfb Tiezhu Yang  2022-10-12   598  			emit_zext_32(ctx, dst, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   599  			move_reg(ctx, t1, src);
5dc615520c4dfb Tiezhu Yang  2022-10-12   600  			emit_zext_32(ctx, t1, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   601  			emit_insn(ctx, moddu, dst, dst, t1);
5dc615520c4dfb Tiezhu Yang  2022-10-12   602  			emit_zext_32(ctx, dst, is32);
7b6b13d32965ad Hengqi Chen  2023-11-08   603  		} else {
7b6b13d32965ad Hengqi Chen  2023-11-08   604  			emit_sext_32(ctx, dst, is32);
7b6b13d32965ad Hengqi Chen  2023-11-08   605  			move_reg(ctx, t1, src);
7b6b13d32965ad Hengqi Chen  2023-11-08   606  			emit_sext_32(ctx, t1, is32);
7b6b13d32965ad Hengqi Chen  2023-11-08   607  			emit_insn(ctx, modd, dst, dst, t1);
7b6b13d32965ad Hengqi Chen  2023-11-08   608  			emit_sext_32(ctx, dst, is32);
7b6b13d32965ad Hengqi Chen  2023-11-08   609  		}
5dc615520c4dfb Tiezhu Yang  2022-10-12   610  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   611  
5dc615520c4dfb Tiezhu Yang  2022-10-12   612  	/* dst = dst % imm */
5dc615520c4dfb Tiezhu Yang  2022-10-12   613  	case BPF_ALU | BPF_MOD | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   614  	case BPF_ALU64 | BPF_MOD | BPF_K:
7b6b13d32965ad Hengqi Chen  2023-11-08   615  		if (!off) {
5dc615520c4dfb Tiezhu Yang  2022-10-12   616  			move_imm(ctx, t1, imm, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   617  			emit_zext_32(ctx, dst, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   618  			emit_insn(ctx, moddu, dst, dst, t1);
5dc615520c4dfb Tiezhu Yang  2022-10-12   619  			emit_zext_32(ctx, dst, is32);
7b6b13d32965ad Hengqi Chen  2023-11-08   620  		} else {
7b6b13d32965ad Hengqi Chen  2023-11-08   621  			move_imm(ctx, t1, imm, false);
7b6b13d32965ad Hengqi Chen  2023-11-08   622  			emit_sext_32(ctx, t1, is32);
7b6b13d32965ad Hengqi Chen  2023-11-08   623  			emit_sext_32(ctx, dst, is32);
7b6b13d32965ad Hengqi Chen  2023-11-08   624  			emit_insn(ctx, modd, dst, dst, t1);
7b6b13d32965ad Hengqi Chen  2023-11-08   625  			emit_sext_32(ctx, dst, is32);
7b6b13d32965ad Hengqi Chen  2023-11-08   626  		}
5dc615520c4dfb Tiezhu Yang  2022-10-12   627  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   628  
5dc615520c4dfb Tiezhu Yang  2022-10-12   629  	/* dst = -dst */
5dc615520c4dfb Tiezhu Yang  2022-10-12   630  	case BPF_ALU | BPF_NEG:
5dc615520c4dfb Tiezhu Yang  2022-10-12   631  	case BPF_ALU64 | BPF_NEG:
5dc615520c4dfb Tiezhu Yang  2022-10-12   632  		move_imm(ctx, t1, imm, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   633  		emit_insn(ctx, subd, dst, LOONGARCH_GPR_ZERO, dst);
5dc615520c4dfb Tiezhu Yang  2022-10-12   634  		emit_zext_32(ctx, dst, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   635  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   636  
5dc615520c4dfb Tiezhu Yang  2022-10-12   637  	/* dst = dst & src */
5dc615520c4dfb Tiezhu Yang  2022-10-12   638  	case BPF_ALU | BPF_AND | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   639  	case BPF_ALU64 | BPF_AND | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   640  		emit_insn(ctx, and, dst, dst, src);
5dc615520c4dfb Tiezhu Yang  2022-10-12   641  		emit_zext_32(ctx, dst, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   642  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   643  
5dc615520c4dfb Tiezhu Yang  2022-10-12   644  	/* dst = dst & imm */
5dc615520c4dfb Tiezhu Yang  2022-10-12   645  	case BPF_ALU | BPF_AND | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   646  	case BPF_ALU64 | BPF_AND | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   647  		if (is_unsigned_imm12(imm)) {
5dc615520c4dfb Tiezhu Yang  2022-10-12   648  			emit_insn(ctx, andi, dst, dst, imm);
5dc615520c4dfb Tiezhu Yang  2022-10-12   649  		} else {
5dc615520c4dfb Tiezhu Yang  2022-10-12   650  			move_imm(ctx, t1, imm, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   651  			emit_insn(ctx, and, dst, dst, t1);
5dc615520c4dfb Tiezhu Yang  2022-10-12   652  		}
5dc615520c4dfb Tiezhu Yang  2022-10-12   653  		emit_zext_32(ctx, dst, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   654  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   655  
5dc615520c4dfb Tiezhu Yang  2022-10-12   656  	/* dst = dst | src */
5dc615520c4dfb Tiezhu Yang  2022-10-12   657  	case BPF_ALU | BPF_OR | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   658  	case BPF_ALU64 | BPF_OR | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   659  		emit_insn(ctx, or, dst, dst, src);
5dc615520c4dfb Tiezhu Yang  2022-10-12   660  		emit_zext_32(ctx, dst, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   661  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   662  
5dc615520c4dfb Tiezhu Yang  2022-10-12   663  	/* dst = dst | imm */
5dc615520c4dfb Tiezhu Yang  2022-10-12   664  	case BPF_ALU | BPF_OR | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   665  	case BPF_ALU64 | BPF_OR | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   666  		if (is_unsigned_imm12(imm)) {
5dc615520c4dfb Tiezhu Yang  2022-10-12   667  			emit_insn(ctx, ori, dst, dst, imm);
5dc615520c4dfb Tiezhu Yang  2022-10-12   668  		} else {
5dc615520c4dfb Tiezhu Yang  2022-10-12   669  			move_imm(ctx, t1, imm, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   670  			emit_insn(ctx, or, dst, dst, t1);
5dc615520c4dfb Tiezhu Yang  2022-10-12   671  		}
5dc615520c4dfb Tiezhu Yang  2022-10-12   672  		emit_zext_32(ctx, dst, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   673  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   674  
5dc615520c4dfb Tiezhu Yang  2022-10-12   675  	/* dst = dst ^ src */
5dc615520c4dfb Tiezhu Yang  2022-10-12   676  	case BPF_ALU | BPF_XOR | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   677  	case BPF_ALU64 | BPF_XOR | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   678  		emit_insn(ctx, xor, dst, dst, src);
5dc615520c4dfb Tiezhu Yang  2022-10-12   679  		emit_zext_32(ctx, dst, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   680  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   681  
5dc615520c4dfb Tiezhu Yang  2022-10-12   682  	/* dst = dst ^ imm */
5dc615520c4dfb Tiezhu Yang  2022-10-12   683  	case BPF_ALU | BPF_XOR | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   684  	case BPF_ALU64 | BPF_XOR | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   685  		if (is_unsigned_imm12(imm)) {
5dc615520c4dfb Tiezhu Yang  2022-10-12   686  			emit_insn(ctx, xori, dst, dst, imm);
5dc615520c4dfb Tiezhu Yang  2022-10-12   687  		} else {
5dc615520c4dfb Tiezhu Yang  2022-10-12   688  			move_imm(ctx, t1, imm, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   689  			emit_insn(ctx, xor, dst, dst, t1);
5dc615520c4dfb Tiezhu Yang  2022-10-12   690  		}
5dc615520c4dfb Tiezhu Yang  2022-10-12   691  		emit_zext_32(ctx, dst, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   692  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   693  
5dc615520c4dfb Tiezhu Yang  2022-10-12   694  	/* dst = dst << src (logical) */
5dc615520c4dfb Tiezhu Yang  2022-10-12   695  	case BPF_ALU | BPF_LSH | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   696  		emit_insn(ctx, sllw, dst, dst, src);
5dc615520c4dfb Tiezhu Yang  2022-10-12   697  		emit_zext_32(ctx, dst, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   698  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   699  
5dc615520c4dfb Tiezhu Yang  2022-10-12   700  	case BPF_ALU64 | BPF_LSH | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   701  		emit_insn(ctx, slld, dst, dst, src);
5dc615520c4dfb Tiezhu Yang  2022-10-12   702  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   703  
5dc615520c4dfb Tiezhu Yang  2022-10-12   704  	/* dst = dst << imm (logical) */
5dc615520c4dfb Tiezhu Yang  2022-10-12   705  	case BPF_ALU | BPF_LSH | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   706  		emit_insn(ctx, slliw, dst, dst, imm);
5dc615520c4dfb Tiezhu Yang  2022-10-12   707  		emit_zext_32(ctx, dst, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   708  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   709  
5dc615520c4dfb Tiezhu Yang  2022-10-12   710  	case BPF_ALU64 | BPF_LSH | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   711  		emit_insn(ctx, sllid, dst, dst, imm);
5dc615520c4dfb Tiezhu Yang  2022-10-12   712  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   713  
5dc615520c4dfb Tiezhu Yang  2022-10-12   714  	/* dst = dst >> src (logical) */
5dc615520c4dfb Tiezhu Yang  2022-10-12   715  	case BPF_ALU | BPF_RSH | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   716  		emit_insn(ctx, srlw, dst, dst, src);
5dc615520c4dfb Tiezhu Yang  2022-10-12   717  		emit_zext_32(ctx, dst, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   718  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   719  
5dc615520c4dfb Tiezhu Yang  2022-10-12   720  	case BPF_ALU64 | BPF_RSH | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   721  		emit_insn(ctx, srld, dst, dst, src);
5dc615520c4dfb Tiezhu Yang  2022-10-12   722  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   723  
5dc615520c4dfb Tiezhu Yang  2022-10-12   724  	/* dst = dst >> imm (logical) */
5dc615520c4dfb Tiezhu Yang  2022-10-12   725  	case BPF_ALU | BPF_RSH | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   726  		emit_insn(ctx, srliw, dst, dst, imm);
5dc615520c4dfb Tiezhu Yang  2022-10-12   727  		emit_zext_32(ctx, dst, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   728  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   729  
5dc615520c4dfb Tiezhu Yang  2022-10-12   730  	case BPF_ALU64 | BPF_RSH | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   731  		emit_insn(ctx, srlid, dst, dst, imm);
5dc615520c4dfb Tiezhu Yang  2022-10-12   732  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   733  
5dc615520c4dfb Tiezhu Yang  2022-10-12   734  	/* dst = dst >> src (arithmetic) */
5dc615520c4dfb Tiezhu Yang  2022-10-12   735  	case BPF_ALU | BPF_ARSH | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   736  		emit_insn(ctx, sraw, dst, dst, src);
5dc615520c4dfb Tiezhu Yang  2022-10-12   737  		emit_zext_32(ctx, dst, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   738  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   739  
5dc615520c4dfb Tiezhu Yang  2022-10-12   740  	case BPF_ALU64 | BPF_ARSH | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   741  		emit_insn(ctx, srad, dst, dst, src);
5dc615520c4dfb Tiezhu Yang  2022-10-12   742  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   743  
5dc615520c4dfb Tiezhu Yang  2022-10-12   744  	/* dst = dst >> imm (arithmetic) */
5dc615520c4dfb Tiezhu Yang  2022-10-12   745  	case BPF_ALU | BPF_ARSH | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   746  		emit_insn(ctx, sraiw, dst, dst, imm);
5dc615520c4dfb Tiezhu Yang  2022-10-12   747  		emit_zext_32(ctx, dst, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   748  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   749  
5dc615520c4dfb Tiezhu Yang  2022-10-12   750  	case BPF_ALU64 | BPF_ARSH | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   751  		emit_insn(ctx, sraid, dst, dst, imm);
5dc615520c4dfb Tiezhu Yang  2022-10-12   752  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   753  
5dc615520c4dfb Tiezhu Yang  2022-10-12   754  	/* dst = BSWAP##imm(dst) */
5dc615520c4dfb Tiezhu Yang  2022-10-12   755  	case BPF_ALU | BPF_END | BPF_FROM_LE:
5dc615520c4dfb Tiezhu Yang  2022-10-12   756  		switch (imm) {
5dc615520c4dfb Tiezhu Yang  2022-10-12   757  		case 16:
5dc615520c4dfb Tiezhu Yang  2022-10-12   758  			/* zero-extend 16 bits into 64 bits */
5dc615520c4dfb Tiezhu Yang  2022-10-12   759  			emit_insn(ctx, bstrpickd, dst, dst, 15, 0);
5dc615520c4dfb Tiezhu Yang  2022-10-12   760  			break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   761  		case 32:
5dc615520c4dfb Tiezhu Yang  2022-10-12   762  			/* zero-extend 32 bits into 64 bits */
5dc615520c4dfb Tiezhu Yang  2022-10-12   763  			emit_zext_32(ctx, dst, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   764  			break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   765  		case 64:
5dc615520c4dfb Tiezhu Yang  2022-10-12   766  			/* do nothing */
5dc615520c4dfb Tiezhu Yang  2022-10-12   767  			break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   768  		}
5dc615520c4dfb Tiezhu Yang  2022-10-12   769  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   770  
5dc615520c4dfb Tiezhu Yang  2022-10-12   771  	case BPF_ALU | BPF_END | BPF_FROM_BE:
4ebf9216e7dff0 Hengqi Chen  2023-11-08   772  	case BPF_ALU64 | BPF_END | BPF_FROM_LE:
5dc615520c4dfb Tiezhu Yang  2022-10-12   773  		switch (imm) {
5dc615520c4dfb Tiezhu Yang  2022-10-12   774  		case 16:
5dc615520c4dfb Tiezhu Yang  2022-10-12   775  			emit_insn(ctx, revb2h, dst, dst);
5dc615520c4dfb Tiezhu Yang  2022-10-12   776  			/* zero-extend 16 bits into 64 bits */
5dc615520c4dfb Tiezhu Yang  2022-10-12   777  			emit_insn(ctx, bstrpickd, dst, dst, 15, 0);
5dc615520c4dfb Tiezhu Yang  2022-10-12   778  			break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   779  		case 32:
5dc615520c4dfb Tiezhu Yang  2022-10-12   780  			emit_insn(ctx, revb2w, dst, dst);
e2f7b3d8b4b300 Tiezhu Yang  2023-12-09   781  			/* clear the upper 32 bits */
e2f7b3d8b4b300 Tiezhu Yang  2023-12-09   782  			emit_zext_32(ctx, dst, true);
5dc615520c4dfb Tiezhu Yang  2022-10-12   783  			break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   784  		case 64:
5dc615520c4dfb Tiezhu Yang  2022-10-12   785  			emit_insn(ctx, revbd, dst, dst);
5dc615520c4dfb Tiezhu Yang  2022-10-12   786  			break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   787  		}
5dc615520c4dfb Tiezhu Yang  2022-10-12   788  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   789  
5dc615520c4dfb Tiezhu Yang  2022-10-12   790  	/* PC += off if dst cond src */
5dc615520c4dfb Tiezhu Yang  2022-10-12   791  	case BPF_JMP | BPF_JEQ | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   792  	case BPF_JMP | BPF_JNE | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   793  	case BPF_JMP | BPF_JGT | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   794  	case BPF_JMP | BPF_JGE | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   795  	case BPF_JMP | BPF_JLT | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   796  	case BPF_JMP | BPF_JLE | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   797  	case BPF_JMP | BPF_JSGT | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   798  	case BPF_JMP | BPF_JSGE | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   799  	case BPF_JMP | BPF_JSLT | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   800  	case BPF_JMP | BPF_JSLE | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   801  	case BPF_JMP32 | BPF_JEQ | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   802  	case BPF_JMP32 | BPF_JNE | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   803  	case BPF_JMP32 | BPF_JGT | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   804  	case BPF_JMP32 | BPF_JGE | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   805  	case BPF_JMP32 | BPF_JLT | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   806  	case BPF_JMP32 | BPF_JLE | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   807  	case BPF_JMP32 | BPF_JSGT | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   808  	case BPF_JMP32 | BPF_JSGE | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   809  	case BPF_JMP32 | BPF_JSLT | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   810  	case BPF_JMP32 | BPF_JSLE | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   811  		jmp_offset = bpf2la_offset(i, off, ctx);
5dc615520c4dfb Tiezhu Yang  2022-10-12   812  		move_reg(ctx, t1, dst);
5dc615520c4dfb Tiezhu Yang  2022-10-12   813  		move_reg(ctx, t2, src);
5dc615520c4dfb Tiezhu Yang  2022-10-12   814  		if (is_signed_bpf_cond(BPF_OP(code))) {
5dc615520c4dfb Tiezhu Yang  2022-10-12   815  			emit_sext_32(ctx, t1, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   816  			emit_sext_32(ctx, t2, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   817  		} else {
5dc615520c4dfb Tiezhu Yang  2022-10-12   818  			emit_zext_32(ctx, t1, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   819  			emit_zext_32(ctx, t2, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   820  		}
5dc615520c4dfb Tiezhu Yang  2022-10-12   821  		if (emit_cond_jmp(ctx, cond, t1, t2, jmp_offset) < 0)
5dc615520c4dfb Tiezhu Yang  2022-10-12   822  			goto toofar;
5dc615520c4dfb Tiezhu Yang  2022-10-12   823  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   824  
5dc615520c4dfb Tiezhu Yang  2022-10-12   825  	/* PC += off if dst cond imm */
5dc615520c4dfb Tiezhu Yang  2022-10-12   826  	case BPF_JMP | BPF_JEQ | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   827  	case BPF_JMP | BPF_JNE | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   828  	case BPF_JMP | BPF_JGT | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   829  	case BPF_JMP | BPF_JGE | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   830  	case BPF_JMP | BPF_JLT | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   831  	case BPF_JMP | BPF_JLE | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   832  	case BPF_JMP | BPF_JSGT | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   833  	case BPF_JMP | BPF_JSGE | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   834  	case BPF_JMP | BPF_JSLT | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   835  	case BPF_JMP | BPF_JSLE | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   836  	case BPF_JMP32 | BPF_JEQ | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   837  	case BPF_JMP32 | BPF_JNE | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   838  	case BPF_JMP32 | BPF_JGT | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   839  	case BPF_JMP32 | BPF_JGE | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   840  	case BPF_JMP32 | BPF_JLT | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   841  	case BPF_JMP32 | BPF_JLE | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   842  	case BPF_JMP32 | BPF_JSGT | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   843  	case BPF_JMP32 | BPF_JSGE | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   844  	case BPF_JMP32 | BPF_JSLT | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   845  	case BPF_JMP32 | BPF_JSLE | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   846  		jmp_offset = bpf2la_offset(i, off, ctx);
5dc615520c4dfb Tiezhu Yang  2022-10-12   847  		if (imm) {
5dc615520c4dfb Tiezhu Yang  2022-10-12   848  			move_imm(ctx, t1, imm, false);
bbfddb904df6f8 Huacai Chen  2022-10-29   849  			tm = t1;
5dc615520c4dfb Tiezhu Yang  2022-10-12   850  		} else {
5dc615520c4dfb Tiezhu Yang  2022-10-12   851  			/* If imm is 0, simply use zero register. */
bbfddb904df6f8 Huacai Chen  2022-10-29   852  			tm = LOONGARCH_GPR_ZERO;
5dc615520c4dfb Tiezhu Yang  2022-10-12   853  		}
5dc615520c4dfb Tiezhu Yang  2022-10-12   854  		move_reg(ctx, t2, dst);
5dc615520c4dfb Tiezhu Yang  2022-10-12   855  		if (is_signed_bpf_cond(BPF_OP(code))) {
bbfddb904df6f8 Huacai Chen  2022-10-29   856  			emit_sext_32(ctx, tm, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   857  			emit_sext_32(ctx, t2, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   858  		} else {
bbfddb904df6f8 Huacai Chen  2022-10-29   859  			emit_zext_32(ctx, tm, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   860  			emit_zext_32(ctx, t2, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   861  		}
bbfddb904df6f8 Huacai Chen  2022-10-29   862  		if (emit_cond_jmp(ctx, cond, t2, tm, jmp_offset) < 0)
5dc615520c4dfb Tiezhu Yang  2022-10-12   863  			goto toofar;
5dc615520c4dfb Tiezhu Yang  2022-10-12   864  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   865  
5dc615520c4dfb Tiezhu Yang  2022-10-12   866  	/* PC += off if dst & src */
5dc615520c4dfb Tiezhu Yang  2022-10-12   867  	case BPF_JMP | BPF_JSET | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   868  	case BPF_JMP32 | BPF_JSET | BPF_X:
5dc615520c4dfb Tiezhu Yang  2022-10-12   869  		jmp_offset = bpf2la_offset(i, off, ctx);
5dc615520c4dfb Tiezhu Yang  2022-10-12   870  		emit_insn(ctx, and, t1, dst, src);
5dc615520c4dfb Tiezhu Yang  2022-10-12   871  		emit_zext_32(ctx, t1, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   872  		if (emit_cond_jmp(ctx, cond, t1, LOONGARCH_GPR_ZERO, jmp_offset) < 0)
5dc615520c4dfb Tiezhu Yang  2022-10-12   873  			goto toofar;
5dc615520c4dfb Tiezhu Yang  2022-10-12   874  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   875  
5dc615520c4dfb Tiezhu Yang  2022-10-12   876  	/* PC += off if dst & imm */
5dc615520c4dfb Tiezhu Yang  2022-10-12   877  	case BPF_JMP | BPF_JSET | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   878  	case BPF_JMP32 | BPF_JSET | BPF_K:
5dc615520c4dfb Tiezhu Yang  2022-10-12   879  		jmp_offset = bpf2la_offset(i, off, ctx);
5dc615520c4dfb Tiezhu Yang  2022-10-12   880  		move_imm(ctx, t1, imm, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   881  		emit_insn(ctx, and, t1, dst, t1);
5dc615520c4dfb Tiezhu Yang  2022-10-12   882  		emit_zext_32(ctx, t1, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   883  		if (emit_cond_jmp(ctx, cond, t1, LOONGARCH_GPR_ZERO, jmp_offset) < 0)
5dc615520c4dfb Tiezhu Yang  2022-10-12   884  			goto toofar;
5dc615520c4dfb Tiezhu Yang  2022-10-12   885  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   886  
5dc615520c4dfb Tiezhu Yang  2022-10-12   887  	/* PC += off */
5dc615520c4dfb Tiezhu Yang  2022-10-12   888  	case BPF_JMP | BPF_JA:
9ddd2b8d1a8b56 Hengqi Chen  2023-11-08   889  	case BPF_JMP32 | BPF_JA:
9ddd2b8d1a8b56 Hengqi Chen  2023-11-08   890  		if (BPF_CLASS(code) == BPF_JMP)
5dc615520c4dfb Tiezhu Yang  2022-10-12   891  			jmp_offset = bpf2la_offset(i, off, ctx);
9ddd2b8d1a8b56 Hengqi Chen  2023-11-08   892  		else
9ddd2b8d1a8b56 Hengqi Chen  2023-11-08   893  			jmp_offset = bpf2la_offset(i, imm, ctx);
5dc615520c4dfb Tiezhu Yang  2022-10-12   894  		if (emit_uncond_jmp(ctx, jmp_offset) < 0)
5dc615520c4dfb Tiezhu Yang  2022-10-12   895  			goto toofar;
5dc615520c4dfb Tiezhu Yang  2022-10-12   896  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   897  
5dc615520c4dfb Tiezhu Yang  2022-10-12   898  	/* function call */
5dc615520c4dfb Tiezhu Yang  2022-10-12   899  	case BPF_JMP | BPF_CALL:
5dc615520c4dfb Tiezhu Yang  2022-10-12   900  		mark_call(ctx);
5dc615520c4dfb Tiezhu Yang  2022-10-12   901  		ret = bpf_jit_get_func_addr(ctx->prog, insn, extra_pass,
5dc615520c4dfb Tiezhu Yang  2022-10-12   902  					    &func_addr, &func_addr_fixed);
5dc615520c4dfb Tiezhu Yang  2022-10-12   903  		if (ret < 0)
5dc615520c4dfb Tiezhu Yang  2022-10-12   904  			return ret;
5dc615520c4dfb Tiezhu Yang  2022-10-12   905  
64f50f6575721e Hengqi Chen  2023-02-14   906  		move_addr(ctx, t1, func_addr);
5dc615520c4dfb Tiezhu Yang  2022-10-12   907  		emit_insn(ctx, jirl, t1, LOONGARCH_GPR_RA, 0);
5dc615520c4dfb Tiezhu Yang  2022-10-12   908  		move_reg(ctx, regmap[BPF_REG_0], LOONGARCH_GPR_A0);
5dc615520c4dfb Tiezhu Yang  2022-10-12   909  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   910  
5dc615520c4dfb Tiezhu Yang  2022-10-12   911  	/* tail call */
5dc615520c4dfb Tiezhu Yang  2022-10-12   912  	case BPF_JMP | BPF_TAIL_CALL:
5dc615520c4dfb Tiezhu Yang  2022-10-12   913  		mark_tail_call(ctx);
5dc615520c4dfb Tiezhu Yang  2022-10-12   914  		if (emit_bpf_tail_call(ctx) < 0)
5dc615520c4dfb Tiezhu Yang  2022-10-12  @915  			return -EINVAL;
5dc615520c4dfb Tiezhu Yang  2022-10-12   916  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   917  
5dc615520c4dfb Tiezhu Yang  2022-10-12   918  	/* function return */
5dc615520c4dfb Tiezhu Yang  2022-10-12   919  	case BPF_JMP | BPF_EXIT:
5dc615520c4dfb Tiezhu Yang  2022-10-12   920  		if (i == ctx->prog->len - 1)
5dc615520c4dfb Tiezhu Yang  2022-10-12   921  			break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   922  
5dc615520c4dfb Tiezhu Yang  2022-10-12   923  		jmp_offset = epilogue_offset(ctx);
5dc615520c4dfb Tiezhu Yang  2022-10-12   924  		if (emit_uncond_jmp(ctx, jmp_offset) < 0)
5dc615520c4dfb Tiezhu Yang  2022-10-12   925  			goto toofar;
5dc615520c4dfb Tiezhu Yang  2022-10-12   926  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   927  
5dc615520c4dfb Tiezhu Yang  2022-10-12   928  	/* dst = imm64 */
5dc615520c4dfb Tiezhu Yang  2022-10-12   929  	case BPF_LD | BPF_IMM | BPF_DW:
36a87385e31c93 Hengqi Chen  2024-01-17   930  	{
36a87385e31c93 Hengqi Chen  2024-01-17   931  		const u64 imm64 = (u64)(insn + 1)->imm << 32 | (u32)insn->imm;
36a87385e31c93 Hengqi Chen  2024-01-17   932  
5dc615520c4dfb Tiezhu Yang  2022-10-12   933  		move_imm(ctx, dst, imm64, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12   934  		return 1;
36a87385e31c93 Hengqi Chen  2024-01-17   935  	}
5dc615520c4dfb Tiezhu Yang  2022-10-12   936  
5dc615520c4dfb Tiezhu Yang  2022-10-12   937  	/* dst = *(size *)(src + off) */
5dc615520c4dfb Tiezhu Yang  2022-10-12   938  	case BPF_LDX | BPF_MEM | BPF_B:
5dc615520c4dfb Tiezhu Yang  2022-10-12   939  	case BPF_LDX | BPF_MEM | BPF_H:
5dc615520c4dfb Tiezhu Yang  2022-10-12   940  	case BPF_LDX | BPF_MEM | BPF_W:
5dc615520c4dfb Tiezhu Yang  2022-10-12   941  	case BPF_LDX | BPF_MEM | BPF_DW:
dbcd7f5fafea64 Youling Tang 2022-12-10   942  	case BPF_LDX | BPF_PROBE_MEM | BPF_DW:
dbcd7f5fafea64 Youling Tang 2022-12-10   943  	case BPF_LDX | BPF_PROBE_MEM | BPF_W:
dbcd7f5fafea64 Youling Tang 2022-12-10   944  	case BPF_LDX | BPF_PROBE_MEM | BPF_H:
dbcd7f5fafea64 Youling Tang 2022-12-10   945  	case BPF_LDX | BPF_PROBE_MEM | BPF_B:
7111afe8fb5f15 Hengqi Chen  2023-11-08   946  	/* dst_reg = (s64)*(signed size *)(src_reg + off) */
7111afe8fb5f15 Hengqi Chen  2023-11-08   947  	case BPF_LDX | BPF_MEMSX | BPF_B:
7111afe8fb5f15 Hengqi Chen  2023-11-08   948  	case BPF_LDX | BPF_MEMSX | BPF_H:
7111afe8fb5f15 Hengqi Chen  2023-11-08   949  	case BPF_LDX | BPF_MEMSX | BPF_W:
7111afe8fb5f15 Hengqi Chen  2023-11-08   950  	case BPF_LDX | BPF_PROBE_MEMSX | BPF_B:
7111afe8fb5f15 Hengqi Chen  2023-11-08   951  	case BPF_LDX | BPF_PROBE_MEMSX | BPF_H:
7111afe8fb5f15 Hengqi Chen  2023-11-08   952  	case BPF_LDX | BPF_PROBE_MEMSX | BPF_W:
7111afe8fb5f15 Hengqi Chen  2023-11-08   953  		sign_extend = BPF_MODE(insn->code) == BPF_MEMSX ||
7111afe8fb5f15 Hengqi Chen  2023-11-08   954  			      BPF_MODE(insn->code) == BPF_PROBE_MEMSX;
5dc615520c4dfb Tiezhu Yang  2022-10-12   955  		switch (BPF_SIZE(code)) {
5dc615520c4dfb Tiezhu Yang  2022-10-12   956  		case BPF_B:
5dc615520c4dfb Tiezhu Yang  2022-10-12   957  			if (is_signed_imm12(off)) {
7111afe8fb5f15 Hengqi Chen  2023-11-08   958  				if (sign_extend)
7111afe8fb5f15 Hengqi Chen  2023-11-08   959  					emit_insn(ctx, ldb, dst, src, off);
7111afe8fb5f15 Hengqi Chen  2023-11-08   960  				else
5dc615520c4dfb Tiezhu Yang  2022-10-12   961  					emit_insn(ctx, ldbu, dst, src, off);
5dc615520c4dfb Tiezhu Yang  2022-10-12   962  			} else {
5dc615520c4dfb Tiezhu Yang  2022-10-12   963  				move_imm(ctx, t1, off, is32);
7111afe8fb5f15 Hengqi Chen  2023-11-08   964  				if (sign_extend)
7111afe8fb5f15 Hengqi Chen  2023-11-08   965  					emit_insn(ctx, ldxb, dst, src, t1);
7111afe8fb5f15 Hengqi Chen  2023-11-08   966  				else
5dc615520c4dfb Tiezhu Yang  2022-10-12   967  					emit_insn(ctx, ldxbu, dst, src, t1);
5dc615520c4dfb Tiezhu Yang  2022-10-12   968  			}
5dc615520c4dfb Tiezhu Yang  2022-10-12   969  			break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   970  		case BPF_H:
5dc615520c4dfb Tiezhu Yang  2022-10-12   971  			if (is_signed_imm12(off)) {
7111afe8fb5f15 Hengqi Chen  2023-11-08   972  				if (sign_extend)
7111afe8fb5f15 Hengqi Chen  2023-11-08   973  					emit_insn(ctx, ldh, dst, src, off);
7111afe8fb5f15 Hengqi Chen  2023-11-08   974  				else
5dc615520c4dfb Tiezhu Yang  2022-10-12   975  					emit_insn(ctx, ldhu, dst, src, off);
5dc615520c4dfb Tiezhu Yang  2022-10-12   976  			} else {
5dc615520c4dfb Tiezhu Yang  2022-10-12   977  				move_imm(ctx, t1, off, is32);
7111afe8fb5f15 Hengqi Chen  2023-11-08   978  				if (sign_extend)
7111afe8fb5f15 Hengqi Chen  2023-11-08   979  					emit_insn(ctx, ldxh, dst, src, t1);
7111afe8fb5f15 Hengqi Chen  2023-11-08   980  				else
5dc615520c4dfb Tiezhu Yang  2022-10-12   981  					emit_insn(ctx, ldxhu, dst, src, t1);
5dc615520c4dfb Tiezhu Yang  2022-10-12   982  			}
5dc615520c4dfb Tiezhu Yang  2022-10-12   983  			break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   984  		case BPF_W:
5dc615520c4dfb Tiezhu Yang  2022-10-12   985  			if (is_signed_imm12(off)) {
7111afe8fb5f15 Hengqi Chen  2023-11-08   986  				if (sign_extend)
7111afe8fb5f15 Hengqi Chen  2023-11-08   987  					emit_insn(ctx, ldw, dst, src, off);
7111afe8fb5f15 Hengqi Chen  2023-11-08   988  				else
5dc615520c4dfb Tiezhu Yang  2022-10-12   989  					emit_insn(ctx, ldwu, dst, src, off);
5dc615520c4dfb Tiezhu Yang  2022-10-12   990  			} else {
5dc615520c4dfb Tiezhu Yang  2022-10-12   991  				move_imm(ctx, t1, off, is32);
7111afe8fb5f15 Hengqi Chen  2023-11-08   992  				if (sign_extend)
7111afe8fb5f15 Hengqi Chen  2023-11-08   993  					emit_insn(ctx, ldxw, dst, src, t1);
7111afe8fb5f15 Hengqi Chen  2023-11-08   994  				else
5dc615520c4dfb Tiezhu Yang  2022-10-12   995  					emit_insn(ctx, ldxwu, dst, src, t1);
5dc615520c4dfb Tiezhu Yang  2022-10-12   996  			}
5dc615520c4dfb Tiezhu Yang  2022-10-12   997  			break;
5dc615520c4dfb Tiezhu Yang  2022-10-12   998  		case BPF_DW:
5dc615520c4dfb Tiezhu Yang  2022-10-12   999  			move_imm(ctx, t1, off, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12  1000  			emit_insn(ctx, ldxd, dst, src, t1);
5dc615520c4dfb Tiezhu Yang  2022-10-12  1001  			break;
5dc615520c4dfb Tiezhu Yang  2022-10-12  1002  		}
dbcd7f5fafea64 Youling Tang 2022-12-10  1003  
dbcd7f5fafea64 Youling Tang 2022-12-10  1004  		ret = add_exception_handler(insn, ctx, dst);
dbcd7f5fafea64 Youling Tang 2022-12-10  1005  		if (ret)
dbcd7f5fafea64 Youling Tang 2022-12-10  1006  			return ret;
5dc615520c4dfb Tiezhu Yang  2022-10-12  1007  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12  1008  
5dc615520c4dfb Tiezhu Yang  2022-10-12  1009  	/* *(size *)(dst + off) = imm */
5dc615520c4dfb Tiezhu Yang  2022-10-12  1010  	case BPF_ST | BPF_MEM | BPF_B:
5dc615520c4dfb Tiezhu Yang  2022-10-12  1011  	case BPF_ST | BPF_MEM | BPF_H:
5dc615520c4dfb Tiezhu Yang  2022-10-12  1012  	case BPF_ST | BPF_MEM | BPF_W:
5dc615520c4dfb Tiezhu Yang  2022-10-12  1013  	case BPF_ST | BPF_MEM | BPF_DW:
5dc615520c4dfb Tiezhu Yang  2022-10-12  1014  		switch (BPF_SIZE(code)) {
5dc615520c4dfb Tiezhu Yang  2022-10-12  1015  		case BPF_B:
5dc615520c4dfb Tiezhu Yang  2022-10-12  1016  			move_imm(ctx, t1, imm, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12  1017  			if (is_signed_imm12(off)) {
5dc615520c4dfb Tiezhu Yang  2022-10-12  1018  				emit_insn(ctx, stb, t1, dst, off);
5dc615520c4dfb Tiezhu Yang  2022-10-12  1019  			} else {
5dc615520c4dfb Tiezhu Yang  2022-10-12  1020  				move_imm(ctx, t2, off, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12  1021  				emit_insn(ctx, stxb, t1, dst, t2);
5dc615520c4dfb Tiezhu Yang  2022-10-12  1022  			}
5dc615520c4dfb Tiezhu Yang  2022-10-12  1023  			break;
5dc615520c4dfb Tiezhu Yang  2022-10-12  1024  		case BPF_H:
5dc615520c4dfb Tiezhu Yang  2022-10-12  1025  			move_imm(ctx, t1, imm, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12  1026  			if (is_signed_imm12(off)) {
5dc615520c4dfb Tiezhu Yang  2022-10-12  1027  				emit_insn(ctx, sth, t1, dst, off);
5dc615520c4dfb Tiezhu Yang  2022-10-12  1028  			} else {
5dc615520c4dfb Tiezhu Yang  2022-10-12  1029  				move_imm(ctx, t2, off, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12  1030  				emit_insn(ctx, stxh, t1, dst, t2);
5dc615520c4dfb Tiezhu Yang  2022-10-12  1031  			}
5dc615520c4dfb Tiezhu Yang  2022-10-12  1032  			break;
5dc615520c4dfb Tiezhu Yang  2022-10-12  1033  		case BPF_W:
5dc615520c4dfb Tiezhu Yang  2022-10-12  1034  			move_imm(ctx, t1, imm, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12  1035  			if (is_signed_imm12(off)) {
5dc615520c4dfb Tiezhu Yang  2022-10-12  1036  				emit_insn(ctx, stw, t1, dst, off);
5dc615520c4dfb Tiezhu Yang  2022-10-12  1037  			} else if (is_signed_imm14(off)) {
5dc615520c4dfb Tiezhu Yang  2022-10-12  1038  				emit_insn(ctx, stptrw, t1, dst, off);
5dc615520c4dfb Tiezhu Yang  2022-10-12  1039  			} else {
5dc615520c4dfb Tiezhu Yang  2022-10-12  1040  				move_imm(ctx, t2, off, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12  1041  				emit_insn(ctx, stxw, t1, dst, t2);
5dc615520c4dfb Tiezhu Yang  2022-10-12  1042  			}
5dc615520c4dfb Tiezhu Yang  2022-10-12  1043  			break;
5dc615520c4dfb Tiezhu Yang  2022-10-12  1044  		case BPF_DW:
5dc615520c4dfb Tiezhu Yang  2022-10-12  1045  			move_imm(ctx, t1, imm, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12  1046  			if (is_signed_imm12(off)) {
5dc615520c4dfb Tiezhu Yang  2022-10-12  1047  				emit_insn(ctx, std, t1, dst, off);
5dc615520c4dfb Tiezhu Yang  2022-10-12  1048  			} else if (is_signed_imm14(off)) {
5dc615520c4dfb Tiezhu Yang  2022-10-12  1049  				emit_insn(ctx, stptrd, t1, dst, off);
5dc615520c4dfb Tiezhu Yang  2022-10-12  1050  			} else {
5dc615520c4dfb Tiezhu Yang  2022-10-12  1051  				move_imm(ctx, t2, off, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12  1052  				emit_insn(ctx, stxd, t1, dst, t2);
5dc615520c4dfb Tiezhu Yang  2022-10-12  1053  			}
5dc615520c4dfb Tiezhu Yang  2022-10-12  1054  			break;
5dc615520c4dfb Tiezhu Yang  2022-10-12  1055  		}
5dc615520c4dfb Tiezhu Yang  2022-10-12  1056  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12  1057  
5dc615520c4dfb Tiezhu Yang  2022-10-12  1058  	/* *(size *)(dst + off) = src */
5dc615520c4dfb Tiezhu Yang  2022-10-12  1059  	case BPF_STX | BPF_MEM | BPF_B:
5dc615520c4dfb Tiezhu Yang  2022-10-12  1060  	case BPF_STX | BPF_MEM | BPF_H:
5dc615520c4dfb Tiezhu Yang  2022-10-12  1061  	case BPF_STX | BPF_MEM | BPF_W:
5dc615520c4dfb Tiezhu Yang  2022-10-12  1062  	case BPF_STX | BPF_MEM | BPF_DW:
5dc615520c4dfb Tiezhu Yang  2022-10-12  1063  		switch (BPF_SIZE(code)) {
5dc615520c4dfb Tiezhu Yang  2022-10-12  1064  		case BPF_B:
5dc615520c4dfb Tiezhu Yang  2022-10-12  1065  			if (is_signed_imm12(off)) {
5dc615520c4dfb Tiezhu Yang  2022-10-12  1066  				emit_insn(ctx, stb, src, dst, off);
5dc615520c4dfb Tiezhu Yang  2022-10-12  1067  			} else {
5dc615520c4dfb Tiezhu Yang  2022-10-12  1068  				move_imm(ctx, t1, off, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12  1069  				emit_insn(ctx, stxb, src, dst, t1);
5dc615520c4dfb Tiezhu Yang  2022-10-12  1070  			}
5dc615520c4dfb Tiezhu Yang  2022-10-12  1071  			break;
5dc615520c4dfb Tiezhu Yang  2022-10-12  1072  		case BPF_H:
5dc615520c4dfb Tiezhu Yang  2022-10-12  1073  			if (is_signed_imm12(off)) {
5dc615520c4dfb Tiezhu Yang  2022-10-12  1074  				emit_insn(ctx, sth, src, dst, off);
5dc615520c4dfb Tiezhu Yang  2022-10-12  1075  			} else {
5dc615520c4dfb Tiezhu Yang  2022-10-12  1076  				move_imm(ctx, t1, off, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12  1077  				emit_insn(ctx, stxh, src, dst, t1);
5dc615520c4dfb Tiezhu Yang  2022-10-12  1078  			}
5dc615520c4dfb Tiezhu Yang  2022-10-12  1079  			break;
5dc615520c4dfb Tiezhu Yang  2022-10-12  1080  		case BPF_W:
5dc615520c4dfb Tiezhu Yang  2022-10-12  1081  			if (is_signed_imm12(off)) {
5dc615520c4dfb Tiezhu Yang  2022-10-12  1082  				emit_insn(ctx, stw, src, dst, off);
5dc615520c4dfb Tiezhu Yang  2022-10-12  1083  			} else if (is_signed_imm14(off)) {
5dc615520c4dfb Tiezhu Yang  2022-10-12  1084  				emit_insn(ctx, stptrw, src, dst, off);
5dc615520c4dfb Tiezhu Yang  2022-10-12  1085  			} else {
5dc615520c4dfb Tiezhu Yang  2022-10-12  1086  				move_imm(ctx, t1, off, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12  1087  				emit_insn(ctx, stxw, src, dst, t1);
5dc615520c4dfb Tiezhu Yang  2022-10-12  1088  			}
5dc615520c4dfb Tiezhu Yang  2022-10-12  1089  			break;
5dc615520c4dfb Tiezhu Yang  2022-10-12  1090  		case BPF_DW:
5dc615520c4dfb Tiezhu Yang  2022-10-12  1091  			if (is_signed_imm12(off)) {
5dc615520c4dfb Tiezhu Yang  2022-10-12  1092  				emit_insn(ctx, std, src, dst, off);
5dc615520c4dfb Tiezhu Yang  2022-10-12  1093  			} else if (is_signed_imm14(off)) {
5dc615520c4dfb Tiezhu Yang  2022-10-12  1094  				emit_insn(ctx, stptrd, src, dst, off);
5dc615520c4dfb Tiezhu Yang  2022-10-12  1095  			} else {
5dc615520c4dfb Tiezhu Yang  2022-10-12  1096  				move_imm(ctx, t1, off, is32);
5dc615520c4dfb Tiezhu Yang  2022-10-12  1097  				emit_insn(ctx, stxd, src, dst, t1);
5dc615520c4dfb Tiezhu Yang  2022-10-12  1098  			}
5dc615520c4dfb Tiezhu Yang  2022-10-12  1099  			break;
5dc615520c4dfb Tiezhu Yang  2022-10-12  1100  		}
5dc615520c4dfb Tiezhu Yang  2022-10-12  1101  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12  1102  
5dc615520c4dfb Tiezhu Yang  2022-10-12  1103  	case BPF_STX | BPF_ATOMIC | BPF_W:
5dc615520c4dfb Tiezhu Yang  2022-10-12  1104  	case BPF_STX | BPF_ATOMIC | BPF_DW:
5dc615520c4dfb Tiezhu Yang  2022-10-12  1105  		emit_atomic(insn, ctx);
5dc615520c4dfb Tiezhu Yang  2022-10-12  1106  		break;
5dc615520c4dfb Tiezhu Yang  2022-10-12  1107  
a6f6a95f258035 George Guo   2023-03-28  1108  	/* Speculation barrier */
a6f6a95f258035 George Guo   2023-03-28  1109  	case BPF_ST | BPF_NOSPEC:
a6f6a95f258035 George Guo   2023-03-28  1110  		break;
a6f6a95f258035 George Guo   2023-03-28  1111  
5dc615520c4dfb Tiezhu Yang  2022-10-12  1112  	default:
5dc615520c4dfb Tiezhu Yang  2022-10-12  1113  		pr_err("bpf_jit: unknown opcode %02x\n", code);
5dc615520c4dfb Tiezhu Yang  2022-10-12  1114  		return -EINVAL;
5dc615520c4dfb Tiezhu Yang  2022-10-12  1115  	}
5dc615520c4dfb Tiezhu Yang  2022-10-12  1116  
5dc615520c4dfb Tiezhu Yang  2022-10-12  1117  	return 0;
5dc615520c4dfb Tiezhu Yang  2022-10-12  1118  
5dc615520c4dfb Tiezhu Yang  2022-10-12  1119  toofar:
5dc615520c4dfb Tiezhu Yang  2022-10-12  1120  	pr_info_once("bpf_jit: opcode %02x, jump too far\n", code);
5dc615520c4dfb Tiezhu Yang  2022-10-12  1121  	return -E2BIG;
5dc615520c4dfb Tiezhu Yang  2022-10-12  1122  }
5dc615520c4dfb Tiezhu Yang  2022-10-12  1123  

:::::: The code at line 915 was first introduced by commit
:::::: 5dc615520c4dfb358245680f1904bad61116648e LoongArch: Add BPF JIT support

:::::: TO: Tiezhu Yang <yangtiezhu@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
