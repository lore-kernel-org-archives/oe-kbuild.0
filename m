Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6CF3C0619
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Aug 2026 08:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786956574; cv=none; b=CLpMbfL7o54NSUOBtmpng2U9ZXngnbayLsjhQnQTqt/6SBBsXHlgaUnTfNFpkdzUFrAnc0lFqR3/bYL3uenOZXOGAfZDX9SN3/TIwmOAmHh6eigRiKYn/797KlKqWqusurLVC6LanY1/AP7j7n24Zn6nu78dduNi1yFMNXZqsE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786956574; c=relaxed/simple;
	bh=Vj2+825PFujgF4uq5ZuZpbtUVAQ5fCvDkGc4568SeQw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Nv/qxd/YRXiCZ1K5hxkh/haA98H8HNLxb/b72fVg2J3toiTRzcHcZPSJKJXoFHlezNj/0/rHD1KnQyJTbau7xprkJd1pd2VAbN1n9KcXYROaGeotGpPmZDgtuh7Mk/6pmj7TCM21HehZJDq0fDZsBcTxMWdttOggSE8TlqUgv1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cwyIBrMQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cwyIBrMQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786956572; x=1818492572;
  h=date:from:to:cc:subject:message-id;
  bh=Vj2+825PFujgF4uq5ZuZpbtUVAQ5fCvDkGc4568SeQw=;
  b=cwyIBrMQBmL7j5eHNnRk5hyJ1mzJPXmeA8HQSWCIq2c7SyknR5EVMUX+
   tck+frZowu+JBdNMMvGC+pmks7doDCN0yP2P/cyi0SLbwEOcgUYzCv7Ez
   +L39Ag+4Q3drLu8DWJ2ZGs1D72ZJrwV61Ywo8qWjgyDOsfd1rvQ+T4E/e
   spIaORhswGs5j+0wAdZcnKShmb0Jo3Skf8JkaeGMPO8cvzxk2vnba8BnP
   L+T6HoyCKmK5Qjwe2Hy9Z1uM/0y/OMfNoVshGWIblnPo1F8fQ5JNoI2SA
   W2j4wz7z3/MXcY+osU8wntNashgtKreqox1zxWvtVsDrJCfmOCd3+5x2b
   w==;
X-CSE-ConnectionGUID: yL83poc7QDelPCzosuQ0Kg==
X-CSE-MsgGUID: VJg6/qZuQ6mpjc5ULlVlnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="97767339"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="97767339"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 01:49:31 -0700
X-CSE-ConnectionGUID: IyCfj20cT4Gy0rceNTe0ug==
X-CSE-MsgGUID: XJSyH1w7Rwec5x9YgrxasQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="289675958"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 17 Aug 2026 01:49:30 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvt28-000000006ll-0Z2y;
	Mon, 17 Aug 2026 08:49:28 +0000
Date: Mon, 17 Aug 2026 10:48:39 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/bpf/verifier.c:14886:35: warning: unused variable
 'aux'
Message-ID: <202608171021.j6VcjzvZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Eduard Zingerman <eddyz87@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Eduard-Zingerman/bpf-do-not-print-a-newline-after-disassembly-in-bpf_verbose_insn/20260811-121559
head:   6d5f62872df513ac0000dbd9bd96b1357d6f6a99
commit: 1496bb0141a299c5e42187c784e88f62ce0fd418 bpf: infer zext_dst based on static register liveness analysis
date:   6 days ago
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260817/202608171021.j6VcjzvZ-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608171021.j6VcjzvZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608171021.j6VcjzvZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/verifier.c: In function 'check_alu_op':
>> kernel/bpf/verifier.c:14886:35: warning: unused variable 'aux' [-Wunused-variable]
   14886 |         struct bpf_insn_aux_data *aux = cur_aux(env);
         |                                   ^~~


vim +/aux +14886 kernel/bpf/verifier.c

484611357c19f9 Josef Bacik        2016-09-28  14882  
17a5267067f3c3 Alexei Starovoitov 2014-09-26  14883  /* check validity of 32-bit and 64-bit arithmetic operations */
58e2af8b3a6b58 Jakub Kicinski     2016-09-21  14884  static int check_alu_op(struct bpf_verifier_env *env, struct bpf_insn *insn)
17a5267067f3c3 Alexei Starovoitov 2014-09-26  14885  {
1496bb0141a299 Eduard Zingerman   2026-08-02 @14886  	struct bpf_insn_aux_data *aux = cur_aux(env);
638f5b90d46016 Alexei Starovoitov 2017-10-31  14887  	struct bpf_reg_state *regs = cur_regs(env);
17a5267067f3c3 Alexei Starovoitov 2014-09-26  14888  	u8 opcode = BPF_OP(insn->code);
17a5267067f3c3 Alexei Starovoitov 2014-09-26  14889  	int err;
17a5267067f3c3 Alexei Starovoitov 2014-09-26  14890  
17a5267067f3c3 Alexei Starovoitov 2014-09-26  14891  	if (opcode == BPF_END || opcode == BPF_NEG) {
17a5267067f3c3 Alexei Starovoitov 2014-09-26  14892  		/* check src operand */
dc503a8ad98474 Edward Cree        2017-08-15  14893  		err = check_reg_arg(env, insn->dst_reg, SRC_OP);
17a5267067f3c3 Alexei Starovoitov 2014-09-26  14894  		if (err)
17a5267067f3c3 Alexei Starovoitov 2014-09-26  14895  			return err;
17a5267067f3c3 Alexei Starovoitov 2014-09-26  14896  
1be7f75d1668d6 Alexei Starovoitov 2015-10-07  14897  		if (is_pointer_value(env, insn->dst_reg)) {
61bd5218eef349 Jakub Kicinski     2017-10-09  14898  			verbose(env, "R%d pointer arithmetic prohibited\n",
1be7f75d1668d6 Alexei Starovoitov 2015-10-07  14899  				insn->dst_reg);
1be7f75d1668d6 Alexei Starovoitov 2015-10-07  14900  			return -EACCES;
1be7f75d1668d6 Alexei Starovoitov 2015-10-07  14901  		}
1be7f75d1668d6 Alexei Starovoitov 2015-10-07  14902  
17a5267067f3c3 Alexei Starovoitov 2014-09-26  14903  		/* check dest operand */
ae3f8ca2ba505d Alexei Starovoitov 2026-04-11  14904  		if (regs[insn->dst_reg].type == SCALAR_VALUE) {
aced132599b3c8 Song Liu           2025-06-25  14905  			err = check_reg_arg(env, insn->dst_reg, DST_OP_NO_MARK);
aced132599b3c8 Song Liu           2025-06-25  14906  			err = err ?: adjust_scalar_min_max_vals(env, insn,
aced132599b3c8 Song Liu           2025-06-25  14907  							 &regs[insn->dst_reg],
aced132599b3c8 Song Liu           2025-06-25  14908  							 regs[insn->dst_reg]);
aced132599b3c8 Song Liu           2025-06-25  14909  		} else {
dc503a8ad98474 Edward Cree        2017-08-15  14910  			err = check_reg_arg(env, insn->dst_reg, DST_OP);
aced132599b3c8 Song Liu           2025-06-25  14911  		}
17a5267067f3c3 Alexei Starovoitov 2014-09-26  14912  		if (err)
17a5267067f3c3 Alexei Starovoitov 2014-09-26  14913  			return err;
17a5267067f3c3 Alexei Starovoitov 2014-09-26  14914  
17a5267067f3c3 Alexei Starovoitov 2014-09-26  14915  	} else if (opcode == BPF_MOV) {
17a5267067f3c3 Alexei Starovoitov 2014-09-26  14916  
17a5267067f3c3 Alexei Starovoitov 2014-09-26  14917  		if (BPF_SRC(insn->code) == BPF_X) {
ae3f8ca2ba505d Alexei Starovoitov 2026-04-11  14918  			if (insn->off == BPF_ADDR_SPACE_CAST) {
122fdbd2a030a9 Puranjay Mohan     2024-03-22  14919  				if (!env->prog->aux->arena) {
122fdbd2a030a9 Puranjay Mohan     2024-03-22  14920  					verbose(env, "addr_space_cast insn can only be used in a program that has an associated arena\n");
122fdbd2a030a9 Puranjay Mohan     2024-03-22  14921  					return -EINVAL;
122fdbd2a030a9 Puranjay Mohan     2024-03-22  14922  				}
8100928c881482 Yonghong Song      2023-07-27  14923  			}
17a5267067f3c3 Alexei Starovoitov 2014-09-26  14924  
17a5267067f3c3 Alexei Starovoitov 2014-09-26  14925  			/* check src operand */
dc503a8ad98474 Edward Cree        2017-08-15  14926  			err = check_reg_arg(env, insn->src_reg, SRC_OP);
17a5267067f3c3 Alexei Starovoitov 2014-09-26  14927  			if (err)
17a5267067f3c3 Alexei Starovoitov 2014-09-26  14928  				return err;
17a5267067f3c3 Alexei Starovoitov 2014-09-26  14929  		}
17a5267067f3c3 Alexei Starovoitov 2014-09-26  14930  
fbeb1603bf4e9b Arthur Fabre       2018-07-31  14931  		/* check dest operand, mark as required later */
fbeb1603bf4e9b Arthur Fabre       2018-07-31  14932  		err = check_reg_arg(env, insn->dst_reg, DST_OP_NO_MARK);
17a5267067f3c3 Alexei Starovoitov 2014-09-26  14933  		if (err)
17a5267067f3c3 Alexei Starovoitov 2014-09-26  14934  			return err;
17a5267067f3c3 Alexei Starovoitov 2014-09-26  14935  
17a5267067f3c3 Alexei Starovoitov 2014-09-26  14936  		if (BPF_SRC(insn->code) == BPF_X) {
e434b8cdf78856 Jiong Wang         2018-12-07  14937  			struct bpf_reg_state *src_reg = regs + insn->src_reg;
e434b8cdf78856 Jiong Wang         2018-12-07  14938  			struct bpf_reg_state *dst_reg = regs + insn->dst_reg;
e434b8cdf78856 Jiong Wang         2018-12-07  14939  
17a5267067f3c3 Alexei Starovoitov 2014-09-26  14940  			if (BPF_CLASS(insn->code) == BPF_ALU64) {
6082b6c328b548 Alexei Starovoitov 2024-03-07  14941  				if (insn->imm) {
6082b6c328b548 Alexei Starovoitov 2024-03-07  14942  					/* off == BPF_ADDR_SPACE_CAST */
6082b6c328b548 Alexei Starovoitov 2024-03-07  14943  					mark_reg_unknown(env, regs, insn->dst_reg);
1496bb0141a299 Eduard Zingerman   2026-08-02  14944  					if (insn->imm == 1) /* cast from as(1) to as(0) */
6082b6c328b548 Alexei Starovoitov 2024-03-07  14945  						dst_reg->type = PTR_TO_ARENA;
6082b6c328b548 Alexei Starovoitov 2024-03-07  14946  				} else if (insn->off == 0) {
17a5267067f3c3 Alexei Starovoitov 2014-09-26  14947  					/* case: R1 = R2
17a5267067f3c3 Alexei Starovoitov 2014-09-26  14948  					 * copy register state to dest reg
17a5267067f3c3 Alexei Starovoitov 2014-09-26  14949  					 */
8e0e074aafb8fe Alice Mikityanska  2024-01-08  14950  					assign_scalar_id_before_mov(env, src_reg);
1cb229a54af1e3 Yonghong Song      2026-05-12  14951  					*dst_reg = *src_reg;
8100928c881482 Yonghong Song      2023-07-27  14952  				} else {
8100928c881482 Yonghong Song      2023-07-27  14953  					/* case: R1 = (s8, s16 s32)R2 */
db2baf82b098aa Yonghong Song      2023-08-07  14954  					if (is_pointer_value(env, insn->src_reg)) {
db2baf82b098aa Yonghong Song      2023-08-07  14955  						verbose(env,
db2baf82b098aa Yonghong Song      2023-08-07  14956  							"R%d sign-extension part of pointer\n",
db2baf82b098aa Yonghong Song      2023-08-07  14957  							insn->src_reg);
db2baf82b098aa Yonghong Song      2023-08-07  14958  						return -EACCES;
db2baf82b098aa Yonghong Song      2023-08-07  14959  					} else if (src_reg->type == SCALAR_VALUE) {
8100928c881482 Yonghong Song      2023-07-27  14960  						bool no_sext;
8100928c881482 Yonghong Song      2023-07-27  14961  
b93f7180f0bc37 Eduard Zingerman   2026-04-24  14962  						no_sext = reg_umax(src_reg) < (1ULL << (insn->off - 1));
8e0e074aafb8fe Alice Mikityanska  2024-01-08  14963  						if (no_sext)
8e0e074aafb8fe Alice Mikityanska  2024-01-08  14964  							assign_scalar_id_before_mov(env, src_reg);
1cb229a54af1e3 Yonghong Song      2026-05-12  14965  						*dst_reg = *src_reg;
8100928c881482 Yonghong Song      2023-07-27  14966  						if (!no_sext)
1b327732c84640 Daniel Borkmann    2026-04-07  14967  							clear_scalar_id(dst_reg);
8100928c881482 Yonghong Song      2023-07-27  14968  						coerce_reg_to_size_sx(dst_reg, insn->off >> 3);
db2baf82b098aa Yonghong Song      2023-08-07  14969  					} else {
db2baf82b098aa Yonghong Song      2023-08-07  14970  						mark_reg_unknown(env, regs, insn->dst_reg);
db2baf82b098aa Yonghong Song      2023-08-07  14971  					}
8100928c881482 Yonghong Song      2023-07-27  14972  				}
17a5267067f3c3 Alexei Starovoitov 2014-09-26  14973  			} else {
f1174f77b50c94 Edward Cree        2017-08-07  14974  				/* R1 = (u32) R2 */
1be7f75d1668d6 Alexei Starovoitov 2015-10-07  14975  				if (is_pointer_value(env, insn->src_reg)) {
61bd5218eef349 Jakub Kicinski     2017-10-09  14976  					verbose(env,
61bd5218eef349 Jakub Kicinski     2017-10-09  14977  						"R%d partial copy of pointer\n",
1be7f75d1668d6 Alexei Starovoitov 2015-10-07  14978  						insn->src_reg);
1be7f75d1668d6 Alexei Starovoitov 2015-10-07  14979  					return -EACCES;
e434b8cdf78856 Jiong Wang         2018-12-07  14980  				} else if (src_reg->type == SCALAR_VALUE) {
8100928c881482 Yonghong Song      2023-07-27  14981  					if (insn->off == 0) {
87e51ac6cb19c5 Alice Mikityanska  2024-01-08  14982  						bool is_src_reg_u32 = get_reg_width(src_reg) <= 32;
3be49f79555ee9 Yonghong Song      2023-04-17  14983  
8e0e074aafb8fe Alice Mikityanska  2024-01-08  14984  						if (is_src_reg_u32)
8e0e074aafb8fe Alice Mikityanska  2024-01-08  14985  							assign_scalar_id_before_mov(env, src_reg);
1cb229a54af1e3 Yonghong Song      2026-05-12  14986  						*dst_reg = *src_reg;
8100928c881482 Yonghong Song      2023-07-27  14987  						/* Make sure ID is cleared if src_reg is not in u32
8100928c881482 Yonghong Song      2023-07-27  14988  						 * range otherwise dst_reg min/max could be incorrectly
4bf79f9be434e0 Eduard Zingerman   2024-07-18  14989  						 * propagated into src_reg by sync_linked_regs()
75748837b7e569 Alexei Starovoitov 2020-10-08  14990  						 */
3be49f79555ee9 Yonghong Song      2023-04-17  14991  						if (!is_src_reg_u32)
1b327732c84640 Daniel Borkmann    2026-04-07  14992  							clear_scalar_id(dst_reg);
8100928c881482 Yonghong Song      2023-07-27  14993  					} else {
8100928c881482 Yonghong Song      2023-07-27  14994  						/* case: W1 = (s8, s16)W2 */
b93f7180f0bc37 Eduard Zingerman   2026-04-24  14995  						bool no_sext = reg_umax(src_reg) < (1ULL << (insn->off - 1));
8100928c881482 Yonghong Song      2023-07-27  14996  
8e0e074aafb8fe Alice Mikityanska  2024-01-08  14997  						if (no_sext)
8e0e074aafb8fe Alice Mikityanska  2024-01-08  14998  							assign_scalar_id_before_mov(env, src_reg);
1cb229a54af1e3 Yonghong Song      2026-05-12  14999  						*dst_reg = *src_reg;
8100928c881482 Yonghong Song      2023-07-27  15000  						if (!no_sext)
1b327732c84640 Daniel Borkmann    2026-04-07  15001  							clear_scalar_id(dst_reg);
8100928c881482 Yonghong Song      2023-07-27  15002  						coerce_subreg_to_size_sx(dst_reg, insn->off >> 3);
8100928c881482 Yonghong Song      2023-07-27  15003  					}
e434b8cdf78856 Jiong Wang         2018-12-07  15004  				} else {
e434b8cdf78856 Jiong Wang         2018-12-07  15005  					mark_reg_unknown(env, regs,
e434b8cdf78856 Jiong Wang         2018-12-07  15006  							 insn->dst_reg);
1be7f75d1668d6 Alexei Starovoitov 2015-10-07  15007  				}
3f50f132d8400e John Fastabend     2020-03-30  15008  				zext_32_to_64(dst_reg);
3844d153a41ade Daniel Borkmann    2022-07-01  15009  				reg_bounds_sync(dst_reg);
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15010  			}
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15011  		} else {
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15012  			/* case: R = imm
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15013  			 * remember the value we stored into this reg
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15014  			 */
fbeb1603bf4e9b Arthur Fabre       2018-07-31  15015  			/* clear any state __mark_reg_known doesn't set */
fbeb1603bf4e9b Arthur Fabre       2018-07-31  15016  			mark_reg_unknown(env, regs, insn->dst_reg);
f1174f77b50c94 Edward Cree        2017-08-07  15017  			regs[insn->dst_reg].type = SCALAR_VALUE;
95a762e2c8c942 Jann Horn          2017-12-18  15018  			if (BPF_CLASS(insn->code) == BPF_ALU64) {
95a762e2c8c942 Jann Horn          2017-12-18  15019  				__mark_reg_known(regs + insn->dst_reg,
95a762e2c8c942 Jann Horn          2017-12-18  15020  						 insn->imm);
95a762e2c8c942 Jann Horn          2017-12-18  15021  			} else {
95a762e2c8c942 Jann Horn          2017-12-18  15022  				__mark_reg_known(regs + insn->dst_reg,
95a762e2c8c942 Jann Horn          2017-12-18  15023  						 (u32)insn->imm);
95a762e2c8c942 Jann Horn          2017-12-18  15024  			}
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15025  		}
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15026  
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15027  	} else {	/* all other ALU ops: and, sub, xor, add, ... */
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15028  
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15029  		if (BPF_SRC(insn->code) == BPF_X) {
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15030  			/* check src1 operand */
dc503a8ad98474 Edward Cree        2017-08-15  15031  			err = check_reg_arg(env, insn->src_reg, SRC_OP);
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15032  			if (err)
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15033  				return err;
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15034  		}
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15035  
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15036  		/* check src2 operand */
dc503a8ad98474 Edward Cree        2017-08-15  15037  		err = check_reg_arg(env, insn->dst_reg, SRC_OP);
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15038  		if (err)
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15039  			return err;
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15040  
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15041  		if ((opcode == BPF_MOD || opcode == BPF_DIV) &&
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15042  		    BPF_SRC(insn->code) == BPF_K && insn->imm == 0) {
61bd5218eef349 Jakub Kicinski     2017-10-09  15043  			verbose(env, "div by zero\n");
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15044  			return -EINVAL;
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15045  		}
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15046  
229394e8e62a41 Rabin Vincent      2016-01-12  15047  		if ((opcode == BPF_LSH || opcode == BPF_RSH ||
229394e8e62a41 Rabin Vincent      2016-01-12  15048  		     opcode == BPF_ARSH) && BPF_SRC(insn->code) == BPF_K) {
229394e8e62a41 Rabin Vincent      2016-01-12  15049  			int size = BPF_CLASS(insn->code) == BPF_ALU64 ? 64 : 32;
229394e8e62a41 Rabin Vincent      2016-01-12  15050  
229394e8e62a41 Rabin Vincent      2016-01-12  15051  			if (insn->imm < 0 || insn->imm >= size) {
61bd5218eef349 Jakub Kicinski     2017-10-09  15052  				verbose(env, "invalid shift %d\n", insn->imm);
229394e8e62a41 Rabin Vincent      2016-01-12  15053  				return -EINVAL;
229394e8e62a41 Rabin Vincent      2016-01-12  15054  			}
229394e8e62a41 Rabin Vincent      2016-01-12  15055  		}
229394e8e62a41 Rabin Vincent      2016-01-12  15056  
1a0dc1ac1d2928 Alexei Starovoitov 2016-05-05  15057  		/* check dest operand */
dc503a8ad98474 Edward Cree        2017-08-15  15058  		err = check_reg_arg(env, insn->dst_reg, DST_OP_NO_MARK);
5f99f312bd3bed Andrii Nakryiko    2023-11-11  15059  		err = err ?: adjust_reg_min_max_vals(env, insn);
1a0dc1ac1d2928 Alexei Starovoitov 2016-05-05  15060  		if (err)
1a0dc1ac1d2928 Alexei Starovoitov 2016-05-05  15061  			return err;
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15062  	}
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15063  
5f99f312bd3bed Andrii Nakryiko    2023-11-11  15064  	return reg_bounds_sanity_check(env, &regs[insn->dst_reg], "alu");
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15065  }
17a5267067f3c3 Alexei Starovoitov 2014-09-26  15066  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
