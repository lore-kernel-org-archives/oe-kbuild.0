Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C24134DE
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Sep 2023 21:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694899047; x=1726435047;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XMgDbA+oeuGQzGyNMfNuH8sREjkVCX4l7bMIbtu0g3k=;
  b=eJA20MnMLdi13NE0/XvqiZZ7bKWhfGbwwVecElQnN4iAGjovDIDL5+0P
   p7s0wc5q+kycl1T43s30eZBkaW1Ilw4bkUFXHOEUSIUY6boNrDgqdalnm
   bz5hMjcuGK8maaCBlvDHEUJxZncWTEkcKh6TKJsZKVcxir9BKZpTbAoeb
   N34rkRFSVOLpvNQVaAQx2bmi4KDPComHUuSGh2M61nScKDSlrZguo8SNW
   6K0H0Phy3t+JtzTqhKZb+d6NvgQd7XOo4c5uMD42BD54tt9LZUVLtl84D
   gzTO4rQF8qfQvUHFKnWh8mFWBouq1pTzPoFdWyYGR+PNajxpdTdkgBaTu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="379369036"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="379369036"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 14:17:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="745394964"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="745394964"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 16 Sep 2023 14:17:22 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhcfI-0004em-1D;
	Sat, 16 Sep 2023 21:17:20 +0000
Date: Sun, 17 Sep 2023 05:17:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/x86/net/bpf_jit_comp.c:1457 do_jit() error: uninitialized
 symbol 'start_of_ldx'.
Message-ID: <202309170557.3tEy6CUT-lkp@intel.com>
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
TO: Yonghong Song <yonghong.song@linux.dev>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ad8a69f361b9b9a0272ed66f04e6060b736d2788
commit: 1f9a1ea821ff25353a0e80d971e7958cd55b47a3 bpf: Support new sign-extension load insns
date:   7 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 7 weeks ago
config: x86_64-randconfig-161-20230917 (https://download.01.org/0day-ci/archive/20230917/202309170557.3tEy6CUT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230917/202309170557.3tEy6CUT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309170557.3tEy6CUT-lkp@intel.com/

smatch warnings:
arch/x86/net/bpf_jit_comp.c:1457 do_jit() error: uninitialized symbol 'start_of_ldx'.

vim +/start_of_ldx +1457 arch/x86/net/bpf_jit_comp.c

93c5aecc35c614 Gary Lin           2021-01-19   988  
1022a5498f6f74 Song Liu           2022-02-04   989  static int do_jit(struct bpf_prog *bpf_prog, int *addrs, u8 *image, u8 *rw_image,
93c5aecc35c614 Gary Lin           2021-01-19   990  		  int oldproglen, struct jit_context *ctx, bool jmp_padding)
b52f00e6a71543 Alexei Starovoitov 2015-05-19   991  {
ebf7d1f508a738 Maciej Fijalkowski 2020-09-16   992  	bool tail_call_reachable = bpf_prog->aux->tail_call_reachable;
b52f00e6a71543 Alexei Starovoitov 2015-05-19   993  	struct bpf_insn *insn = bpf_prog->insnsi;
ebf7d1f508a738 Maciej Fijalkowski 2020-09-16   994  	bool callee_regs_used[4] = {};
b52f00e6a71543 Alexei Starovoitov 2015-05-19   995  	int insn_cnt = bpf_prog->len;
ebf7d1f508a738 Maciej Fijalkowski 2020-09-16   996  	bool tail_call_seen = false;
b52f00e6a71543 Alexei Starovoitov 2015-05-19   997  	bool seen_exit = false;
b52f00e6a71543 Alexei Starovoitov 2015-05-19   998  	u8 temp[BPF_MAX_INSN_SIZE + BPF_INSN_SAFETY];
ced50fc49f3bde Jiri Olsa          2021-06-23   999  	int i, excnt = 0;
93c5aecc35c614 Gary Lin           2021-01-19  1000  	int ilen, proglen = 0;
b52f00e6a71543 Alexei Starovoitov 2015-05-19  1001  	u8 *prog = temp;
91c960b0056672 Brendan Jackman    2021-01-14  1002  	int err;
b52f00e6a71543 Alexei Starovoitov 2015-05-19  1003  
ebf7d1f508a738 Maciej Fijalkowski 2020-09-16  1004  	detect_reg_usage(insn, insn_cnt, callee_regs_used,
ebf7d1f508a738 Maciej Fijalkowski 2020-09-16  1005  			 &tail_call_seen);
ebf7d1f508a738 Maciej Fijalkowski 2020-09-16  1006  
ebf7d1f508a738 Maciej Fijalkowski 2020-09-16  1007  	/* tail call's presence in current prog implies it is reachable */
ebf7d1f508a738 Maciej Fijalkowski 2020-09-16  1008  	tail_call_reachable |= tail_call_seen;
ebf7d1f508a738 Maciej Fijalkowski 2020-09-16  1009  
0869175220b339 Daniel Borkmann    2018-02-24  1010  	emit_prologue(&prog, bpf_prog->aux->stack_depth,
ebf7d1f508a738 Maciej Fijalkowski 2020-09-16  1011  		      bpf_prog_was_classic(bpf_prog), tail_call_reachable,
ebf7d1f508a738 Maciej Fijalkowski 2020-09-16  1012  		      bpf_prog->aux->func_idx != 0);
ebf7d1f508a738 Maciej Fijalkowski 2020-09-16  1013  	push_callee_regs(&prog, callee_regs_used);
93c5aecc35c614 Gary Lin           2021-01-19  1014  
93c5aecc35c614 Gary Lin           2021-01-19  1015  	ilen = prog - temp;
1022a5498f6f74 Song Liu           2022-02-04  1016  	if (rw_image)
1022a5498f6f74 Song Liu           2022-02-04  1017  		memcpy(rw_image + proglen, temp, ilen);
93c5aecc35c614 Gary Lin           2021-01-19  1018  	proglen += ilen;
93c5aecc35c614 Gary Lin           2021-01-19  1019  	addrs[0] = proglen;
93c5aecc35c614 Gary Lin           2021-01-19  1020  	prog = temp;
b52f00e6a71543 Alexei Starovoitov 2015-05-19  1021  
7c2e988f400e83 Alexei Starovoitov 2019-07-30  1022  	for (i = 1; i <= insn_cnt; i++, insn++) {
e430f34ee5192c Alexei Starovoitov 2014-06-06  1023  		const s32 imm32 = insn->imm;
e430f34ee5192c Alexei Starovoitov 2014-06-06  1024  		u32 dst_reg = insn->dst_reg;
e430f34ee5192c Alexei Starovoitov 2014-06-06  1025  		u32 src_reg = insn->src_reg;
6fe8b9c1f41dfe Daniel Borkmann    2018-02-24  1026  		u8 b2 = 0, b3 = 0;
4c5de127598e1b Alexei Starovoitov 2021-02-01  1027  		u8 *start_of_ldx;
622582786c9e04 Alexei Starovoitov 2014-05-13  1028  		s64 jmp_offset;
90156f4bfa21ad Dave Marchevsky    2022-12-16  1029  		s16 insn_off;
622582786c9e04 Alexei Starovoitov 2014-05-13  1030  		u8 jmp_cond;
622582786c9e04 Alexei Starovoitov 2014-05-13  1031  		u8 *func;
93c5aecc35c614 Gary Lin           2021-01-19  1032  		int nops;
0a14842f5a3c0e Eric Dumazet       2011-04-20  1033  
622582786c9e04 Alexei Starovoitov 2014-05-13  1034  		switch (insn->code) {
622582786c9e04 Alexei Starovoitov 2014-05-13  1035  			/* ALU */
622582786c9e04 Alexei Starovoitov 2014-05-13  1036  		case BPF_ALU | BPF_ADD | BPF_X:
622582786c9e04 Alexei Starovoitov 2014-05-13  1037  		case BPF_ALU | BPF_SUB | BPF_X:
622582786c9e04 Alexei Starovoitov 2014-05-13  1038  		case BPF_ALU | BPF_AND | BPF_X:
622582786c9e04 Alexei Starovoitov 2014-05-13  1039  		case BPF_ALU | BPF_OR | BPF_X:
622582786c9e04 Alexei Starovoitov 2014-05-13  1040  		case BPF_ALU | BPF_XOR | BPF_X:
622582786c9e04 Alexei Starovoitov 2014-05-13  1041  		case BPF_ALU64 | BPF_ADD | BPF_X:
622582786c9e04 Alexei Starovoitov 2014-05-13  1042  		case BPF_ALU64 | BPF_SUB | BPF_X:
622582786c9e04 Alexei Starovoitov 2014-05-13  1043  		case BPF_ALU64 | BPF_AND | BPF_X:
622582786c9e04 Alexei Starovoitov 2014-05-13  1044  		case BPF_ALU64 | BPF_OR | BPF_X:
622582786c9e04 Alexei Starovoitov 2014-05-13  1045  		case BPF_ALU64 | BPF_XOR | BPF_X:
74007cfc1f71e4 Brendan Jackman    2021-01-14  1046  			maybe_emit_mod(&prog, dst_reg, src_reg,
74007cfc1f71e4 Brendan Jackman    2021-01-14  1047  				       BPF_CLASS(insn->code) == BPF_ALU64);
e5f02caccfae94 Brendan Jackman    2021-01-14  1048  			b2 = simple_alu_opcodes[BPF_OP(insn->code)];
e430f34ee5192c Alexei Starovoitov 2014-06-06  1049  			EMIT2(b2, add_2reg(0xC0, dst_reg, src_reg));
622582786c9e04 Alexei Starovoitov 2014-05-13  1050  			break;
622582786c9e04 Alexei Starovoitov 2014-05-13  1051  
622582786c9e04 Alexei Starovoitov 2014-05-13  1052  		case BPF_ALU64 | BPF_MOV | BPF_X:
622582786c9e04 Alexei Starovoitov 2014-05-13  1053  		case BPF_ALU | BPF_MOV | BPF_X:
4c38e2f386b4fc Daniel Borkmann    2018-02-24  1054  			emit_mov_reg(&prog,
4c38e2f386b4fc Daniel Borkmann    2018-02-24  1055  				     BPF_CLASS(insn->code) == BPF_ALU64,
4c38e2f386b4fc Daniel Borkmann    2018-02-24  1056  				     dst_reg, src_reg);
622582786c9e04 Alexei Starovoitov 2014-05-13  1057  			break;
622582786c9e04 Alexei Starovoitov 2014-05-13  1058  
e430f34ee5192c Alexei Starovoitov 2014-06-06  1059  			/* neg dst */
622582786c9e04 Alexei Starovoitov 2014-05-13  1060  		case BPF_ALU | BPF_NEG:
622582786c9e04 Alexei Starovoitov 2014-05-13  1061  		case BPF_ALU64 | BPF_NEG:
6364d7d75a0e01 Jie Meng           2021-10-06  1062  			maybe_emit_1mod(&prog, dst_reg,
6364d7d75a0e01 Jie Meng           2021-10-06  1063  					BPF_CLASS(insn->code) == BPF_ALU64);
e430f34ee5192c Alexei Starovoitov 2014-06-06  1064  			EMIT2(0xF7, add_1reg(0xD8, dst_reg));
622582786c9e04 Alexei Starovoitov 2014-05-13  1065  			break;
622582786c9e04 Alexei Starovoitov 2014-05-13  1066  
622582786c9e04 Alexei Starovoitov 2014-05-13  1067  		case BPF_ALU | BPF_ADD | BPF_K:
622582786c9e04 Alexei Starovoitov 2014-05-13  1068  		case BPF_ALU | BPF_SUB | BPF_K:
622582786c9e04 Alexei Starovoitov 2014-05-13  1069  		case BPF_ALU | BPF_AND | BPF_K:
622582786c9e04 Alexei Starovoitov 2014-05-13  1070  		case BPF_ALU | BPF_OR | BPF_K:
622582786c9e04 Alexei Starovoitov 2014-05-13  1071  		case BPF_ALU | BPF_XOR | BPF_K:
622582786c9e04 Alexei Starovoitov 2014-05-13  1072  		case BPF_ALU64 | BPF_ADD | BPF_K:
622582786c9e04 Alexei Starovoitov 2014-05-13  1073  		case BPF_ALU64 | BPF_SUB | BPF_K:
622582786c9e04 Alexei Starovoitov 2014-05-13  1074  		case BPF_ALU64 | BPF_AND | BPF_K:
622582786c9e04 Alexei Starovoitov 2014-05-13  1075  		case BPF_ALU64 | BPF_OR | BPF_K:
622582786c9e04 Alexei Starovoitov 2014-05-13  1076  		case BPF_ALU64 | BPF_XOR | BPF_K:
6364d7d75a0e01 Jie Meng           2021-10-06  1077  			maybe_emit_1mod(&prog, dst_reg,
6364d7d75a0e01 Jie Meng           2021-10-06  1078  					BPF_CLASS(insn->code) == BPF_ALU64);
622582786c9e04 Alexei Starovoitov 2014-05-13  1079  
a2c7a98301d9f9 Ingo Molnar        2018-04-27  1080  			/*
a2c7a98301d9f9 Ingo Molnar        2018-04-27  1081  			 * b3 holds 'normal' opcode, b2 short form only valid
de0a444ddae61b Daniel Borkmann    2018-01-20  1082  			 * in case dst is eax/rax.
de0a444ddae61b Daniel Borkmann    2018-01-20  1083  			 */
622582786c9e04 Alexei Starovoitov 2014-05-13  1084  			switch (BPF_OP(insn->code)) {
de0a444ddae61b Daniel Borkmann    2018-01-20  1085  			case BPF_ADD:
de0a444ddae61b Daniel Borkmann    2018-01-20  1086  				b3 = 0xC0;
de0a444ddae61b Daniel Borkmann    2018-01-20  1087  				b2 = 0x05;
de0a444ddae61b Daniel Borkmann    2018-01-20  1088  				break;
de0a444ddae61b Daniel Borkmann    2018-01-20  1089  			case BPF_SUB:
de0a444ddae61b Daniel Borkmann    2018-01-20  1090  				b3 = 0xE8;
de0a444ddae61b Daniel Borkmann    2018-01-20  1091  				b2 = 0x2D;
de0a444ddae61b Daniel Borkmann    2018-01-20  1092  				break;
de0a444ddae61b Daniel Borkmann    2018-01-20  1093  			case BPF_AND:
de0a444ddae61b Daniel Borkmann    2018-01-20  1094  				b3 = 0xE0;
de0a444ddae61b Daniel Borkmann    2018-01-20  1095  				b2 = 0x25;
de0a444ddae61b Daniel Borkmann    2018-01-20  1096  				break;
de0a444ddae61b Daniel Borkmann    2018-01-20  1097  			case BPF_OR:
de0a444ddae61b Daniel Borkmann    2018-01-20  1098  				b3 = 0xC8;
de0a444ddae61b Daniel Borkmann    2018-01-20  1099  				b2 = 0x0D;
de0a444ddae61b Daniel Borkmann    2018-01-20  1100  				break;
de0a444ddae61b Daniel Borkmann    2018-01-20  1101  			case BPF_XOR:
de0a444ddae61b Daniel Borkmann    2018-01-20  1102  				b3 = 0xF0;
de0a444ddae61b Daniel Borkmann    2018-01-20  1103  				b2 = 0x35;
de0a444ddae61b Daniel Borkmann    2018-01-20  1104  				break;
622582786c9e04 Alexei Starovoitov 2014-05-13  1105  			}
0a14842f5a3c0e Eric Dumazet       2011-04-20  1106  
e430f34ee5192c Alexei Starovoitov 2014-06-06  1107  			if (is_imm8(imm32))
e430f34ee5192c Alexei Starovoitov 2014-06-06  1108  				EMIT3(0x83, add_1reg(b3, dst_reg), imm32);
de0a444ddae61b Daniel Borkmann    2018-01-20  1109  			else if (is_axreg(dst_reg))
de0a444ddae61b Daniel Borkmann    2018-01-20  1110  				EMIT1_off32(b2, imm32);
0a14842f5a3c0e Eric Dumazet       2011-04-20  1111  			else
e430f34ee5192c Alexei Starovoitov 2014-06-06  1112  				EMIT2_off32(0x81, add_1reg(b3, dst_reg), imm32);
0a14842f5a3c0e Eric Dumazet       2011-04-20  1113  			break;
622582786c9e04 Alexei Starovoitov 2014-05-13  1114  
622582786c9e04 Alexei Starovoitov 2014-05-13  1115  		case BPF_ALU64 | BPF_MOV | BPF_K:
622582786c9e04 Alexei Starovoitov 2014-05-13  1116  		case BPF_ALU | BPF_MOV | BPF_K:
6fe8b9c1f41dfe Daniel Borkmann    2018-02-24  1117  			emit_mov_imm32(&prog, BPF_CLASS(insn->code) == BPF_ALU64,
6fe8b9c1f41dfe Daniel Borkmann    2018-02-24  1118  				       dst_reg, imm32);
622582786c9e04 Alexei Starovoitov 2014-05-13  1119  			break;
622582786c9e04 Alexei Starovoitov 2014-05-13  1120  
02ab695bb37ee9 Alexei Starovoitov 2014-09-04  1121  		case BPF_LD | BPF_IMM | BPF_DW:
6fe8b9c1f41dfe Daniel Borkmann    2018-02-24  1122  			emit_mov_imm64(&prog, dst_reg, insn[1].imm, insn[0].imm);
02ab695bb37ee9 Alexei Starovoitov 2014-09-04  1123  			insn++;
02ab695bb37ee9 Alexei Starovoitov 2014-09-04  1124  			i++;
02ab695bb37ee9 Alexei Starovoitov 2014-09-04  1125  			break;
02ab695bb37ee9 Alexei Starovoitov 2014-09-04  1126  
e430f34ee5192c Alexei Starovoitov 2014-06-06  1127  			/* dst %= src, dst /= src, dst %= imm32, dst /= imm32 */
622582786c9e04 Alexei Starovoitov 2014-05-13  1128  		case BPF_ALU | BPF_MOD | BPF_X:
622582786c9e04 Alexei Starovoitov 2014-05-13  1129  		case BPF_ALU | BPF_DIV | BPF_X:
622582786c9e04 Alexei Starovoitov 2014-05-13  1130  		case BPF_ALU | BPF_MOD | BPF_K:
622582786c9e04 Alexei Starovoitov 2014-05-13  1131  		case BPF_ALU | BPF_DIV | BPF_K:
622582786c9e04 Alexei Starovoitov 2014-05-13  1132  		case BPF_ALU64 | BPF_MOD | BPF_X:
622582786c9e04 Alexei Starovoitov 2014-05-13  1133  		case BPF_ALU64 | BPF_DIV | BPF_X:
622582786c9e04 Alexei Starovoitov 2014-05-13  1134  		case BPF_ALU64 | BPF_MOD | BPF_K:
57a610f1c58fa4 Jie Meng           2021-10-01  1135  		case BPF_ALU64 | BPF_DIV | BPF_K: {
57a610f1c58fa4 Jie Meng           2021-10-01  1136  			bool is64 = BPF_CLASS(insn->code) == BPF_ALU64;
57a610f1c58fa4 Jie Meng           2021-10-01  1137  
57a610f1c58fa4 Jie Meng           2021-10-01  1138  			if (dst_reg != BPF_REG_0)
622582786c9e04 Alexei Starovoitov 2014-05-13  1139  				EMIT1(0x50); /* push rax */
57a610f1c58fa4 Jie Meng           2021-10-01  1140  			if (dst_reg != BPF_REG_3)
622582786c9e04 Alexei Starovoitov 2014-05-13  1141  				EMIT1(0x52); /* push rdx */
622582786c9e04 Alexei Starovoitov 2014-05-13  1142  
57a610f1c58fa4 Jie Meng           2021-10-01  1143  			if (BPF_SRC(insn->code) == BPF_X) {
57a610f1c58fa4 Jie Meng           2021-10-01  1144  				if (src_reg == BPF_REG_0 ||
57a610f1c58fa4 Jie Meng           2021-10-01  1145  				    src_reg == BPF_REG_3) {
e430f34ee5192c Alexei Starovoitov 2014-06-06  1146  					/* mov r11, src_reg */
e430f34ee5192c Alexei Starovoitov 2014-06-06  1147  					EMIT_mov(AUX_REG, src_reg);
57a610f1c58fa4 Jie Meng           2021-10-01  1148  					src_reg = AUX_REG;
57a610f1c58fa4 Jie Meng           2021-10-01  1149  				}
57a610f1c58fa4 Jie Meng           2021-10-01  1150  			} else {
e430f34ee5192c Alexei Starovoitov 2014-06-06  1151  				/* mov r11, imm32 */
e430f34ee5192c Alexei Starovoitov 2014-06-06  1152  				EMIT3_off32(0x49, 0xC7, 0xC3, imm32);
57a610f1c58fa4 Jie Meng           2021-10-01  1153  				src_reg = AUX_REG;
57a610f1c58fa4 Jie Meng           2021-10-01  1154  			}
622582786c9e04 Alexei Starovoitov 2014-05-13  1155  
57a610f1c58fa4 Jie Meng           2021-10-01  1156  			if (dst_reg != BPF_REG_0)
e430f34ee5192c Alexei Starovoitov 2014-06-06  1157  				/* mov rax, dst_reg */
57a610f1c58fa4 Jie Meng           2021-10-01  1158  				emit_mov_reg(&prog, is64, BPF_REG_0, dst_reg);
622582786c9e04 Alexei Starovoitov 2014-05-13  1159  
a2c7a98301d9f9 Ingo Molnar        2018-04-27  1160  			/*
a2c7a98301d9f9 Ingo Molnar        2018-04-27  1161  			 * xor edx, edx
622582786c9e04 Alexei Starovoitov 2014-05-13  1162  			 * equivalent to 'xor rdx, rdx', but one byte less
d00a9dd21bdf79 Eric Dumazet       2012-01-18  1163  			 */
622582786c9e04 Alexei Starovoitov 2014-05-13  1164  			EMIT2(0x31, 0xd2);
622582786c9e04 Alexei Starovoitov 2014-05-13  1165  
57a610f1c58fa4 Jie Meng           2021-10-01  1166  			/* div src_reg */
6364d7d75a0e01 Jie Meng           2021-10-06  1167  			maybe_emit_1mod(&prog, src_reg, is64);
57a610f1c58fa4 Jie Meng           2021-10-01  1168  			EMIT2(0xF7, add_1reg(0xF0, src_reg));
622582786c9e04 Alexei Starovoitov 2014-05-13  1169  
57a610f1c58fa4 Jie Meng           2021-10-01  1170  			if (BPF_OP(insn->code) == BPF_MOD &&
57a610f1c58fa4 Jie Meng           2021-10-01  1171  			    dst_reg != BPF_REG_3)
57a610f1c58fa4 Jie Meng           2021-10-01  1172  				/* mov dst_reg, rdx */
57a610f1c58fa4 Jie Meng           2021-10-01  1173  				emit_mov_reg(&prog, is64, dst_reg, BPF_REG_3);
57a610f1c58fa4 Jie Meng           2021-10-01  1174  			else if (BPF_OP(insn->code) == BPF_DIV &&
57a610f1c58fa4 Jie Meng           2021-10-01  1175  				 dst_reg != BPF_REG_0)
57a610f1c58fa4 Jie Meng           2021-10-01  1176  				/* mov dst_reg, rax */
57a610f1c58fa4 Jie Meng           2021-10-01  1177  				emit_mov_reg(&prog, is64, dst_reg, BPF_REG_0);
622582786c9e04 Alexei Starovoitov 2014-05-13  1178  
57a610f1c58fa4 Jie Meng           2021-10-01  1179  			if (dst_reg != BPF_REG_3)
622582786c9e04 Alexei Starovoitov 2014-05-13  1180  				EMIT1(0x5A); /* pop rdx */
57a610f1c58fa4 Jie Meng           2021-10-01  1181  			if (dst_reg != BPF_REG_0)
622582786c9e04 Alexei Starovoitov 2014-05-13  1182  				EMIT1(0x58); /* pop rax */
aee636c4809fa5 Eric Dumazet       2014-01-15  1183  			break;
57a610f1c58fa4 Jie Meng           2021-10-01  1184  		}
622582786c9e04 Alexei Starovoitov 2014-05-13  1185  
622582786c9e04 Alexei Starovoitov 2014-05-13  1186  		case BPF_ALU | BPF_MUL | BPF_K:
622582786c9e04 Alexei Starovoitov 2014-05-13  1187  		case BPF_ALU64 | BPF_MUL | BPF_K:
6364d7d75a0e01 Jie Meng           2021-10-06  1188  			maybe_emit_mod(&prog, dst_reg, dst_reg,
6364d7d75a0e01 Jie Meng           2021-10-06  1189  				       BPF_CLASS(insn->code) == BPF_ALU64);
622582786c9e04 Alexei Starovoitov 2014-05-13  1190  
c0354077439bc9 Jie Meng           2021-09-13  1191  			if (is_imm8(imm32))
c0354077439bc9 Jie Meng           2021-09-13  1192  				/* imul dst_reg, dst_reg, imm8 */
c0354077439bc9 Jie Meng           2021-09-13  1193  				EMIT3(0x6B, add_2reg(0xC0, dst_reg, dst_reg),
c0354077439bc9 Jie Meng           2021-09-13  1194  				      imm32);
622582786c9e04 Alexei Starovoitov 2014-05-13  1195  			else
c0354077439bc9 Jie Meng           2021-09-13  1196  				/* imul dst_reg, dst_reg, imm32 */
c0354077439bc9 Jie Meng           2021-09-13  1197  				EMIT2_off32(0x69,
c0354077439bc9 Jie Meng           2021-09-13  1198  					    add_2reg(0xC0, dst_reg, dst_reg),
c0354077439bc9 Jie Meng           2021-09-13  1199  					    imm32);
c0354077439bc9 Jie Meng           2021-09-13  1200  			break;
622582786c9e04 Alexei Starovoitov 2014-05-13  1201  
c0354077439bc9 Jie Meng           2021-09-13  1202  		case BPF_ALU | BPF_MUL | BPF_X:
c0354077439bc9 Jie Meng           2021-09-13  1203  		case BPF_ALU64 | BPF_MUL | BPF_X:
6364d7d75a0e01 Jie Meng           2021-10-06  1204  			maybe_emit_mod(&prog, src_reg, dst_reg,
6364d7d75a0e01 Jie Meng           2021-10-06  1205  				       BPF_CLASS(insn->code) == BPF_ALU64);
622582786c9e04 Alexei Starovoitov 2014-05-13  1206  
c0354077439bc9 Jie Meng           2021-09-13  1207  			/* imul dst_reg, src_reg */
c0354077439bc9 Jie Meng           2021-09-13  1208  			EMIT3(0x0F, 0xAF, add_2reg(0xC0, src_reg, dst_reg));
622582786c9e04 Alexei Starovoitov 2014-05-13  1209  			break;
c0354077439bc9 Jie Meng           2021-09-13  1210  
a2c7a98301d9f9 Ingo Molnar        2018-04-27  1211  			/* Shifts */
622582786c9e04 Alexei Starovoitov 2014-05-13  1212  		case BPF_ALU | BPF_LSH | BPF_K:
622582786c9e04 Alexei Starovoitov 2014-05-13  1213  		case BPF_ALU | BPF_RSH | BPF_K:
622582786c9e04 Alexei Starovoitov 2014-05-13  1214  		case BPF_ALU | BPF_ARSH | BPF_K:
622582786c9e04 Alexei Starovoitov 2014-05-13  1215  		case BPF_ALU64 | BPF_LSH | BPF_K:
622582786c9e04 Alexei Starovoitov 2014-05-13  1216  		case BPF_ALU64 | BPF_RSH | BPF_K:
622582786c9e04 Alexei Starovoitov 2014-05-13  1217  		case BPF_ALU64 | BPF_ARSH | BPF_K:
6364d7d75a0e01 Jie Meng           2021-10-06  1218  			maybe_emit_1mod(&prog, dst_reg,
6364d7d75a0e01 Jie Meng           2021-10-06  1219  					BPF_CLASS(insn->code) == BPF_ALU64);
622582786c9e04 Alexei Starovoitov 2014-05-13  1220  
e5f02caccfae94 Brendan Jackman    2021-01-14  1221  			b3 = simple_alu_opcodes[BPF_OP(insn->code)];
88e69a1fcc1e67 Daniel Borkmann    2018-02-24  1222  			if (imm32 == 1)
88e69a1fcc1e67 Daniel Borkmann    2018-02-24  1223  				EMIT2(0xD1, add_1reg(b3, dst_reg));
88e69a1fcc1e67 Daniel Borkmann    2018-02-24  1224  			else
e430f34ee5192c Alexei Starovoitov 2014-06-06  1225  				EMIT3(0xC1, add_1reg(b3, dst_reg), imm32);
622582786c9e04 Alexei Starovoitov 2014-05-13  1226  			break;
622582786c9e04 Alexei Starovoitov 2014-05-13  1227  
72b603ee8cfc6b Alexei Starovoitov 2014-08-25  1228  		case BPF_ALU | BPF_LSH | BPF_X:
72b603ee8cfc6b Alexei Starovoitov 2014-08-25  1229  		case BPF_ALU | BPF_RSH | BPF_X:
72b603ee8cfc6b Alexei Starovoitov 2014-08-25  1230  		case BPF_ALU | BPF_ARSH | BPF_X:
72b603ee8cfc6b Alexei Starovoitov 2014-08-25  1231  		case BPF_ALU64 | BPF_LSH | BPF_X:
72b603ee8cfc6b Alexei Starovoitov 2014-08-25  1232  		case BPF_ALU64 | BPF_RSH | BPF_X:
72b603ee8cfc6b Alexei Starovoitov 2014-08-25  1233  		case BPF_ALU64 | BPF_ARSH | BPF_X:
77d8f5d47bfbb5 Jie Meng           2022-10-07  1234  			/* BMI2 shifts aren't better when shift count is already in rcx */
77d8f5d47bfbb5 Jie Meng           2022-10-07  1235  			if (boot_cpu_has(X86_FEATURE_BMI2) && src_reg != BPF_REG_4) {
77d8f5d47bfbb5 Jie Meng           2022-10-07  1236  				/* shrx/sarx/shlx dst_reg, dst_reg, src_reg */
77d8f5d47bfbb5 Jie Meng           2022-10-07  1237  				bool w = (BPF_CLASS(insn->code) == BPF_ALU64);
77d8f5d47bfbb5 Jie Meng           2022-10-07  1238  				u8 op;
72b603ee8cfc6b Alexei Starovoitov 2014-08-25  1239  
77d8f5d47bfbb5 Jie Meng           2022-10-07  1240  				switch (BPF_OP(insn->code)) {
77d8f5d47bfbb5 Jie Meng           2022-10-07  1241  				case BPF_LSH:
77d8f5d47bfbb5 Jie Meng           2022-10-07  1242  					op = 1; /* prefix 0x66 */
77d8f5d47bfbb5 Jie Meng           2022-10-07  1243  					break;
77d8f5d47bfbb5 Jie Meng           2022-10-07  1244  				case BPF_RSH:
77d8f5d47bfbb5 Jie Meng           2022-10-07  1245  					op = 3; /* prefix 0xf2 */
77d8f5d47bfbb5 Jie Meng           2022-10-07  1246  					break;
77d8f5d47bfbb5 Jie Meng           2022-10-07  1247  				case BPF_ARSH:
77d8f5d47bfbb5 Jie Meng           2022-10-07  1248  					op = 2; /* prefix 0xf3 */
77d8f5d47bfbb5 Jie Meng           2022-10-07  1249  					break;
77d8f5d47bfbb5 Jie Meng           2022-10-07  1250  				}
77d8f5d47bfbb5 Jie Meng           2022-10-07  1251  
77d8f5d47bfbb5 Jie Meng           2022-10-07  1252  				emit_shiftx(&prog, dst_reg, src_reg, w, op);
77d8f5d47bfbb5 Jie Meng           2022-10-07  1253  
77d8f5d47bfbb5 Jie Meng           2022-10-07  1254  				break;
77d8f5d47bfbb5 Jie Meng           2022-10-07  1255  			}
72b603ee8cfc6b Alexei Starovoitov 2014-08-25  1256  
81b35e7cad790e Jie Meng           2022-10-07  1257  			if (src_reg != BPF_REG_4) { /* common case */
a2c7a98301d9f9 Ingo Molnar        2018-04-27  1258  				/* Check for bad case when dst_reg == rcx */
72b603ee8cfc6b Alexei Starovoitov 2014-08-25  1259  				if (dst_reg == BPF_REG_4) {
72b603ee8cfc6b Alexei Starovoitov 2014-08-25  1260  					/* mov r11, dst_reg */
72b603ee8cfc6b Alexei Starovoitov 2014-08-25  1261  					EMIT_mov(AUX_REG, dst_reg);
72b603ee8cfc6b Alexei Starovoitov 2014-08-25  1262  					dst_reg = AUX_REG;
81b35e7cad790e Jie Meng           2022-10-07  1263  				} else {
72b603ee8cfc6b Alexei Starovoitov 2014-08-25  1264  					EMIT1(0x51); /* push rcx */
81b35e7cad790e Jie Meng           2022-10-07  1265  				}
72b603ee8cfc6b Alexei Starovoitov 2014-08-25  1266  				/* mov rcx, src_reg */
72b603ee8cfc6b Alexei Starovoitov 2014-08-25  1267  				EMIT_mov(BPF_REG_4, src_reg);
72b603ee8cfc6b Alexei Starovoitov 2014-08-25  1268  			}
72b603ee8cfc6b Alexei Starovoitov 2014-08-25  1269  
72b603ee8cfc6b Alexei Starovoitov 2014-08-25  1270  			/* shl %rax, %cl | shr %rax, %cl | sar %rax, %cl */
6364d7d75a0e01 Jie Meng           2021-10-06  1271  			maybe_emit_1mod(&prog, dst_reg,
6364d7d75a0e01 Jie Meng           2021-10-06  1272  					BPF_CLASS(insn->code) == BPF_ALU64);
72b603ee8cfc6b Alexei Starovoitov 2014-08-25  1273  
e5f02caccfae94 Brendan Jackman    2021-01-14  1274  			b3 = simple_alu_opcodes[BPF_OP(insn->code)];
72b603ee8cfc6b Alexei Starovoitov 2014-08-25  1275  			EMIT2(0xD3, add_1reg(b3, dst_reg));
72b603ee8cfc6b Alexei Starovoitov 2014-08-25  1276  
81b35e7cad790e Jie Meng           2022-10-07  1277  			if (src_reg != BPF_REG_4) {
72b603ee8cfc6b Alexei Starovoitov 2014-08-25  1278  				if (insn->dst_reg == BPF_REG_4)
72b603ee8cfc6b Alexei Starovoitov 2014-08-25  1279  					/* mov dst_reg, r11 */
72b603ee8cfc6b Alexei Starovoitov 2014-08-25  1280  					EMIT_mov(insn->dst_reg, AUX_REG);
81b35e7cad790e Jie Meng           2022-10-07  1281  				else
81b35e7cad790e Jie Meng           2022-10-07  1282  					EMIT1(0x59); /* pop rcx */
81b35e7cad790e Jie Meng           2022-10-07  1283  			}
81b35e7cad790e Jie Meng           2022-10-07  1284  
72b603ee8cfc6b Alexei Starovoitov 2014-08-25  1285  			break;
72b603ee8cfc6b Alexei Starovoitov 2014-08-25  1286  
622582786c9e04 Alexei Starovoitov 2014-05-13  1287  		case BPF_ALU | BPF_END | BPF_FROM_BE:
e430f34ee5192c Alexei Starovoitov 2014-06-06  1288  			switch (imm32) {
622582786c9e04 Alexei Starovoitov 2014-05-13  1289  			case 16:
a2c7a98301d9f9 Ingo Molnar        2018-04-27  1290  				/* Emit 'ror %ax, 8' to swap lower 2 bytes */
622582786c9e04 Alexei Starovoitov 2014-05-13  1291  				EMIT1(0x66);
e430f34ee5192c Alexei Starovoitov 2014-06-06  1292  				if (is_ereg(dst_reg))
622582786c9e04 Alexei Starovoitov 2014-05-13  1293  					EMIT1(0x41);
e430f34ee5192c Alexei Starovoitov 2014-06-06  1294  				EMIT3(0xC1, add_1reg(0xC8, dst_reg), 8);
343f845b375989 Alexei Starovoitov 2015-05-11  1295  
a2c7a98301d9f9 Ingo Molnar        2018-04-27  1296  				/* Emit 'movzwl eax, ax' */
343f845b375989 Alexei Starovoitov 2015-05-11  1297  				if (is_ereg(dst_reg))
343f845b375989 Alexei Starovoitov 2015-05-11  1298  					EMIT3(0x45, 0x0F, 0xB7);
343f845b375989 Alexei Starovoitov 2015-05-11  1299  				else
343f845b375989 Alexei Starovoitov 2015-05-11  1300  					EMIT2(0x0F, 0xB7);
343f845b375989 Alexei Starovoitov 2015-05-11  1301  				EMIT1(add_2reg(0xC0, dst_reg, dst_reg));
622582786c9e04 Alexei Starovoitov 2014-05-13  1302  				break;
622582786c9e04 Alexei Starovoitov 2014-05-13  1303  			case 32:
a2c7a98301d9f9 Ingo Molnar        2018-04-27  1304  				/* Emit 'bswap eax' to swap lower 4 bytes */
e430f34ee5192c Alexei Starovoitov 2014-06-06  1305  				if (is_ereg(dst_reg))
622582786c9e04 Alexei Starovoitov 2014-05-13  1306  					EMIT2(0x41, 0x0F);
622582786c9e04 Alexei Starovoitov 2014-05-13  1307  				else
622582786c9e04 Alexei Starovoitov 2014-05-13  1308  					EMIT1(0x0F);
e430f34ee5192c Alexei Starovoitov 2014-06-06  1309  				EMIT1(add_1reg(0xC8, dst_reg));
0a14842f5a3c0e Eric Dumazet       2011-04-20  1310  				break;
622582786c9e04 Alexei Starovoitov 2014-05-13  1311  			case 64:
a2c7a98301d9f9 Ingo Molnar        2018-04-27  1312  				/* Emit 'bswap rax' to swap 8 bytes */
e430f34ee5192c Alexei Starovoitov 2014-06-06  1313  				EMIT3(add_1mod(0x48, dst_reg), 0x0F,
e430f34ee5192c Alexei Starovoitov 2014-06-06  1314  				      add_1reg(0xC8, dst_reg));
0a14842f5a3c0e Eric Dumazet       2011-04-20  1315  				break;
0a14842f5a3c0e Eric Dumazet       2011-04-20  1316  			}
0a14842f5a3c0e Eric Dumazet       2011-04-20  1317  			break;
622582786c9e04 Alexei Starovoitov 2014-05-13  1318  
622582786c9e04 Alexei Starovoitov 2014-05-13  1319  		case BPF_ALU | BPF_END | BPF_FROM_LE:
343f845b375989 Alexei Starovoitov 2015-05-11  1320  			switch (imm32) {
343f845b375989 Alexei Starovoitov 2015-05-11  1321  			case 16:
a2c7a98301d9f9 Ingo Molnar        2018-04-27  1322  				/*
a2c7a98301d9f9 Ingo Molnar        2018-04-27  1323  				 * Emit 'movzwl eax, ax' to zero extend 16-bit
343f845b375989 Alexei Starovoitov 2015-05-11  1324  				 * into 64 bit
343f845b375989 Alexei Starovoitov 2015-05-11  1325  				 */
343f845b375989 Alexei Starovoitov 2015-05-11  1326  				if (is_ereg(dst_reg))
343f845b375989 Alexei Starovoitov 2015-05-11  1327  					EMIT3(0x45, 0x0F, 0xB7);
343f845b375989 Alexei Starovoitov 2015-05-11  1328  				else
343f845b375989 Alexei Starovoitov 2015-05-11  1329  					EMIT2(0x0F, 0xB7);
343f845b375989 Alexei Starovoitov 2015-05-11  1330  				EMIT1(add_2reg(0xC0, dst_reg, dst_reg));
343f845b375989 Alexei Starovoitov 2015-05-11  1331  				break;
343f845b375989 Alexei Starovoitov 2015-05-11  1332  			case 32:
a2c7a98301d9f9 Ingo Molnar        2018-04-27  1333  				/* Emit 'mov eax, eax' to clear upper 32-bits */
343f845b375989 Alexei Starovoitov 2015-05-11  1334  				if (is_ereg(dst_reg))
343f845b375989 Alexei Starovoitov 2015-05-11  1335  					EMIT1(0x45);
343f845b375989 Alexei Starovoitov 2015-05-11  1336  				EMIT2(0x89, add_2reg(0xC0, dst_reg, dst_reg));
343f845b375989 Alexei Starovoitov 2015-05-11  1337  				break;
343f845b375989 Alexei Starovoitov 2015-05-11  1338  			case 64:
343f845b375989 Alexei Starovoitov 2015-05-11  1339  				/* nop */
343f845b375989 Alexei Starovoitov 2015-05-11  1340  				break;
343f845b375989 Alexei Starovoitov 2015-05-11  1341  			}
0a14842f5a3c0e Eric Dumazet       2011-04-20  1342  			break;
622582786c9e04 Alexei Starovoitov 2014-05-13  1343  
f5e81d11175015 Daniel Borkmann    2021-07-13  1344  			/* speculation barrier */
f5e81d11175015 Daniel Borkmann    2021-07-13  1345  		case BPF_ST | BPF_NOSPEC:
87c87ecd00c54e Peter Zijlstra     2021-10-26  1346  			EMIT_LFENCE();
f5e81d11175015 Daniel Borkmann    2021-07-13  1347  			break;
f5e81d11175015 Daniel Borkmann    2021-07-13  1348  
e430f34ee5192c Alexei Starovoitov 2014-06-06  1349  			/* ST: *(u8*)(dst_reg + off) = imm */
622582786c9e04 Alexei Starovoitov 2014-05-13  1350  		case BPF_ST | BPF_MEM | BPF_B:
e430f34ee5192c Alexei Starovoitov 2014-06-06  1351  			if (is_ereg(dst_reg))
622582786c9e04 Alexei Starovoitov 2014-05-13  1352  				EMIT2(0x41, 0xC6);
0a14842f5a3c0e Eric Dumazet       2011-04-20  1353  			else
622582786c9e04 Alexei Starovoitov 2014-05-13  1354  				EMIT1(0xC6);
622582786c9e04 Alexei Starovoitov 2014-05-13  1355  			goto st;
622582786c9e04 Alexei Starovoitov 2014-05-13  1356  		case BPF_ST | BPF_MEM | BPF_H:
e430f34ee5192c Alexei Starovoitov 2014-06-06  1357  			if (is_ereg(dst_reg))
622582786c9e04 Alexei Starovoitov 2014-05-13  1358  				EMIT3(0x66, 0x41, 0xC7);
82c93fcc2e1737 Daniel Borkmann    2012-09-24  1359  			else
622582786c9e04 Alexei Starovoitov 2014-05-13  1360  				EMIT2(0x66, 0xC7);
622582786c9e04 Alexei Starovoitov 2014-05-13  1361  			goto st;
622582786c9e04 Alexei Starovoitov 2014-05-13  1362  		case BPF_ST | BPF_MEM | BPF_W:
e430f34ee5192c Alexei Starovoitov 2014-06-06  1363  			if (is_ereg(dst_reg))
622582786c9e04 Alexei Starovoitov 2014-05-13  1364  				EMIT2(0x41, 0xC7);
0a14842f5a3c0e Eric Dumazet       2011-04-20  1365  			else
622582786c9e04 Alexei Starovoitov 2014-05-13  1366  				EMIT1(0xC7);
622582786c9e04 Alexei Starovoitov 2014-05-13  1367  			goto st;
622582786c9e04 Alexei Starovoitov 2014-05-13  1368  		case BPF_ST | BPF_MEM | BPF_DW:
e430f34ee5192c Alexei Starovoitov 2014-06-06  1369  			EMIT2(add_1mod(0x48, dst_reg), 0xC7);
622582786c9e04 Alexei Starovoitov 2014-05-13  1370  
622582786c9e04 Alexei Starovoitov 2014-05-13  1371  st:			if (is_imm8(insn->off))
e430f34ee5192c Alexei Starovoitov 2014-06-06  1372  				EMIT2(add_1reg(0x40, dst_reg), insn->off);
0a14842f5a3c0e Eric Dumazet       2011-04-20  1373  			else
e430f34ee5192c Alexei Starovoitov 2014-06-06  1374  				EMIT1_off32(add_1reg(0x80, dst_reg), insn->off);
622582786c9e04 Alexei Starovoitov 2014-05-13  1375  
e430f34ee5192c Alexei Starovoitov 2014-06-06  1376  			EMIT(imm32, bpf_size_to_x86_bytes(BPF_SIZE(insn->code)));
0a14842f5a3c0e Eric Dumazet       2011-04-20  1377  			break;
622582786c9e04 Alexei Starovoitov 2014-05-13  1378  
e430f34ee5192c Alexei Starovoitov 2014-06-06  1379  			/* STX: *(u8*)(dst_reg + off) = src_reg */
622582786c9e04 Alexei Starovoitov 2014-05-13  1380  		case BPF_STX | BPF_MEM | BPF_B:
622582786c9e04 Alexei Starovoitov 2014-05-13  1381  		case BPF_STX | BPF_MEM | BPF_H:
622582786c9e04 Alexei Starovoitov 2014-05-13  1382  		case BPF_STX | BPF_MEM | BPF_W:
622582786c9e04 Alexei Starovoitov 2014-05-13  1383  		case BPF_STX | BPF_MEM | BPF_DW:
3b2744e665206e Alexei Starovoitov 2019-11-14  1384  			emit_stx(&prog, BPF_SIZE(insn->code), dst_reg, src_reg, insn->off);
622582786c9e04 Alexei Starovoitov 2014-05-13  1385  			break;
622582786c9e04 Alexei Starovoitov 2014-05-13  1386  
e430f34ee5192c Alexei Starovoitov 2014-06-06  1387  			/* LDX: dst_reg = *(u8*)(src_reg + off) */
622582786c9e04 Alexei Starovoitov 2014-05-13  1388  		case BPF_LDX | BPF_MEM | BPF_B:
3dec541b2e632d Alexei Starovoitov 2019-10-15  1389  		case BPF_LDX | BPF_PROBE_MEM | BPF_B:
622582786c9e04 Alexei Starovoitov 2014-05-13  1390  		case BPF_LDX | BPF_MEM | BPF_H:
3dec541b2e632d Alexei Starovoitov 2019-10-15  1391  		case BPF_LDX | BPF_PROBE_MEM | BPF_H:
622582786c9e04 Alexei Starovoitov 2014-05-13  1392  		case BPF_LDX | BPF_MEM | BPF_W:
3dec541b2e632d Alexei Starovoitov 2019-10-15  1393  		case BPF_LDX | BPF_PROBE_MEM | BPF_W:
622582786c9e04 Alexei Starovoitov 2014-05-13  1394  		case BPF_LDX | BPF_MEM | BPF_DW:
3dec541b2e632d Alexei Starovoitov 2019-10-15  1395  		case BPF_LDX | BPF_PROBE_MEM | BPF_DW:
1f9a1ea821ff25 Yonghong Song      2023-07-27  1396  			/* LDXS: dst_reg = *(s8*)(src_reg + off) */
1f9a1ea821ff25 Yonghong Song      2023-07-27  1397  		case BPF_LDX | BPF_MEMSX | BPF_B:
1f9a1ea821ff25 Yonghong Song      2023-07-27  1398  		case BPF_LDX | BPF_MEMSX | BPF_H:
1f9a1ea821ff25 Yonghong Song      2023-07-27  1399  		case BPF_LDX | BPF_MEMSX | BPF_W:
1f9a1ea821ff25 Yonghong Song      2023-07-27  1400  		case BPF_LDX | BPF_PROBE_MEMSX | BPF_B:
1f9a1ea821ff25 Yonghong Song      2023-07-27  1401  		case BPF_LDX | BPF_PROBE_MEMSX | BPF_H:
1f9a1ea821ff25 Yonghong Song      2023-07-27  1402  		case BPF_LDX | BPF_PROBE_MEMSX | BPF_W:
90156f4bfa21ad Dave Marchevsky    2022-12-16  1403  			insn_off = insn->off;
90156f4bfa21ad Dave Marchevsky    2022-12-16  1404  
1f9a1ea821ff25 Yonghong Song      2023-07-27  1405  			if (BPF_MODE(insn->code) == BPF_PROBE_MEM ||
1f9a1ea821ff25 Yonghong Song      2023-07-27  1406  			    BPF_MODE(insn->code) == BPF_PROBE_MEMSX) {
90156f4bfa21ad Dave Marchevsky    2022-12-16  1407  				/* Conservatively check that src_reg + insn->off is a kernel address:
90156f4bfa21ad Dave Marchevsky    2022-12-16  1408  				 *   src_reg + insn->off >= TASK_SIZE_MAX + PAGE_SIZE
90156f4bfa21ad Dave Marchevsky    2022-12-16  1409  				 * src_reg is used as scratch for src_reg += insn->off and restored
90156f4bfa21ad Dave Marchevsky    2022-12-16  1410  				 * after emit_ldx if necessary
588a25e92458c6 Alexei Starovoitov 2021-12-14  1411  				 */
588a25e92458c6 Alexei Starovoitov 2021-12-14  1412  
90156f4bfa21ad Dave Marchevsky    2022-12-16  1413  				u64 limit = TASK_SIZE_MAX + PAGE_SIZE;
90156f4bfa21ad Dave Marchevsky    2022-12-16  1414  				u8 *end_of_jmp;
90156f4bfa21ad Dave Marchevsky    2022-12-16  1415  
90156f4bfa21ad Dave Marchevsky    2022-12-16  1416  				/* At end of these emitted checks, insn->off will have been added
90156f4bfa21ad Dave Marchevsky    2022-12-16  1417  				 * to src_reg, so no need to do relative load with insn->off offset
588a25e92458c6 Alexei Starovoitov 2021-12-14  1418  				 */
90156f4bfa21ad Dave Marchevsky    2022-12-16  1419  				insn_off = 0;
588a25e92458c6 Alexei Starovoitov 2021-12-14  1420  
588a25e92458c6 Alexei Starovoitov 2021-12-14  1421  				/* movabsq r11, limit */
588a25e92458c6 Alexei Starovoitov 2021-12-14  1422  				EMIT2(add_1mod(0x48, AUX_REG), add_1reg(0xB8, AUX_REG));
588a25e92458c6 Alexei Starovoitov 2021-12-14  1423  				EMIT((u32)limit, 4);
588a25e92458c6 Alexei Starovoitov 2021-12-14  1424  				EMIT(limit >> 32, 4);
90156f4bfa21ad Dave Marchevsky    2022-12-16  1425  
90156f4bfa21ad Dave Marchevsky    2022-12-16  1426  				if (insn->off) {
90156f4bfa21ad Dave Marchevsky    2022-12-16  1427  					/* add src_reg, insn->off */
90156f4bfa21ad Dave Marchevsky    2022-12-16  1428  					maybe_emit_1mod(&prog, src_reg, true);
90156f4bfa21ad Dave Marchevsky    2022-12-16  1429  					EMIT2_off32(0x81, add_1reg(0xC0, src_reg), insn->off);
90156f4bfa21ad Dave Marchevsky    2022-12-16  1430  				}
90156f4bfa21ad Dave Marchevsky    2022-12-16  1431  
588a25e92458c6 Alexei Starovoitov 2021-12-14  1432  				/* cmp src_reg, r11 */
588a25e92458c6 Alexei Starovoitov 2021-12-14  1433  				maybe_emit_mod(&prog, src_reg, AUX_REG, true);
588a25e92458c6 Alexei Starovoitov 2021-12-14  1434  				EMIT2(0x39, add_2reg(0xC0, src_reg, AUX_REG));
588a25e92458c6 Alexei Starovoitov 2021-12-14  1435  
90156f4bfa21ad Dave Marchevsky    2022-12-16  1436  				/* if unsigned '>=', goto load */
90156f4bfa21ad Dave Marchevsky    2022-12-16  1437  				EMIT2(X86_JAE, 0);
90156f4bfa21ad Dave Marchevsky    2022-12-16  1438  				end_of_jmp = prog;
588a25e92458c6 Alexei Starovoitov 2021-12-14  1439  
4c5de127598e1b Alexei Starovoitov 2021-02-01  1440  				/* xor dst_reg, dst_reg */
4c5de127598e1b Alexei Starovoitov 2021-02-01  1441  				emit_mov_imm32(&prog, false, dst_reg, 0);
4c5de127598e1b Alexei Starovoitov 2021-02-01  1442  				/* jmp byte_after_ldx */
4c5de127598e1b Alexei Starovoitov 2021-02-01  1443  				EMIT2(0xEB, 0);
4c5de127598e1b Alexei Starovoitov 2021-02-01  1444  
90156f4bfa21ad Dave Marchevsky    2022-12-16  1445  				/* populate jmp_offset for JAE above to jump to start_of_ldx */
4c5de127598e1b Alexei Starovoitov 2021-02-01  1446  				start_of_ldx = prog;
90156f4bfa21ad Dave Marchevsky    2022-12-16  1447  				end_of_jmp[-1] = start_of_ldx - end_of_jmp;
4c5de127598e1b Alexei Starovoitov 2021-02-01  1448  			}
1f9a1ea821ff25 Yonghong Song      2023-07-27  1449  			if (BPF_MODE(insn->code) == BPF_PROBE_MEMSX ||
1f9a1ea821ff25 Yonghong Song      2023-07-27  1450  			    BPF_MODE(insn->code) == BPF_MEMSX)
1f9a1ea821ff25 Yonghong Song      2023-07-27  1451  				emit_ldsx(&prog, BPF_SIZE(insn->code), dst_reg, src_reg, insn_off);
1f9a1ea821ff25 Yonghong Song      2023-07-27  1452  			else
90156f4bfa21ad Dave Marchevsky    2022-12-16  1453  				emit_ldx(&prog, BPF_SIZE(insn->code), dst_reg, src_reg, insn_off);
1f9a1ea821ff25 Yonghong Song      2023-07-27  1454  			if (BPF_MODE(insn->code) == BPF_PROBE_MEM ||
1f9a1ea821ff25 Yonghong Song      2023-07-27  1455  			    BPF_MODE(insn->code) == BPF_PROBE_MEMSX) {
3dec541b2e632d Alexei Starovoitov 2019-10-15  1456  				struct exception_table_entry *ex;
328aac5ecd119e Ravi Bangoria      2021-06-22 @1457  				u8 *_insn = image + proglen + (start_of_ldx - temp);
3dec541b2e632d Alexei Starovoitov 2019-10-15  1458  				s64 delta;
3dec541b2e632d Alexei Starovoitov 2019-10-15  1459  
4c5de127598e1b Alexei Starovoitov 2021-02-01  1460  				/* populate jmp_offset for JMP above */
4c5de127598e1b Alexei Starovoitov 2021-02-01  1461  				start_of_ldx[-1] = prog - start_of_ldx;
4c5de127598e1b Alexei Starovoitov 2021-02-01  1462  
90156f4bfa21ad Dave Marchevsky    2022-12-16  1463  				if (insn->off && src_reg != dst_reg) {
90156f4bfa21ad Dave Marchevsky    2022-12-16  1464  					/* sub src_reg, insn->off
90156f4bfa21ad Dave Marchevsky    2022-12-16  1465  					 * Restore src_reg after "add src_reg, insn->off" in prev
90156f4bfa21ad Dave Marchevsky    2022-12-16  1466  					 * if statement. But if src_reg == dst_reg, emit_ldx
90156f4bfa21ad Dave Marchevsky    2022-12-16  1467  					 * above already clobbered src_reg, so no need to restore.
90156f4bfa21ad Dave Marchevsky    2022-12-16  1468  					 * If add src_reg, insn->off was unnecessary, no need to
90156f4bfa21ad Dave Marchevsky    2022-12-16  1469  					 * restore either.
90156f4bfa21ad Dave Marchevsky    2022-12-16  1470  					 */
90156f4bfa21ad Dave Marchevsky    2022-12-16  1471  					maybe_emit_1mod(&prog, src_reg, true);
90156f4bfa21ad Dave Marchevsky    2022-12-16  1472  					EMIT2_off32(0x81, add_1reg(0xE8, src_reg), insn->off);
90156f4bfa21ad Dave Marchevsky    2022-12-16  1473  				}
90156f4bfa21ad Dave Marchevsky    2022-12-16  1474  
3dec541b2e632d Alexei Starovoitov 2019-10-15  1475  				if (!bpf_prog->aux->extable)
3dec541b2e632d Alexei Starovoitov 2019-10-15  1476  					break;
3dec541b2e632d Alexei Starovoitov 2019-10-15  1477  
3dec541b2e632d Alexei Starovoitov 2019-10-15  1478  				if (excnt >= bpf_prog->aux->num_exentries) {
3dec541b2e632d Alexei Starovoitov 2019-10-15  1479  					pr_err("ex gen bug\n");
3dec541b2e632d Alexei Starovoitov 2019-10-15  1480  					return -EFAULT;
3dec541b2e632d Alexei Starovoitov 2019-10-15  1481  				}
3dec541b2e632d Alexei Starovoitov 2019-10-15  1482  				ex = &bpf_prog->aux->extable[excnt++];
3dec541b2e632d Alexei Starovoitov 2019-10-15  1483  
3dec541b2e632d Alexei Starovoitov 2019-10-15  1484  				delta = _insn - (u8 *)&ex->insn;
3dec541b2e632d Alexei Starovoitov 2019-10-15  1485  				if (!is_simm32(delta)) {
3dec541b2e632d Alexei Starovoitov 2019-10-15  1486  					pr_err("extable->insn doesn't fit into 32-bit\n");
3dec541b2e632d Alexei Starovoitov 2019-10-15  1487  					return -EFAULT;
3dec541b2e632d Alexei Starovoitov 2019-10-15  1488  				}
1022a5498f6f74 Song Liu           2022-02-04  1489  				/* switch ex to rw buffer for writes */
1022a5498f6f74 Song Liu           2022-02-04  1490  				ex = (void *)rw_image + ((void *)ex - (void *)image);
1022a5498f6f74 Song Liu           2022-02-04  1491  
3dec541b2e632d Alexei Starovoitov 2019-10-15  1492  				ex->insn = delta;
3dec541b2e632d Alexei Starovoitov 2019-10-15  1493  
4b5305decc8436 Peter Zijlstra     2021-11-10  1494  				ex->data = EX_TYPE_BPF;
3dec541b2e632d Alexei Starovoitov 2019-10-15  1495  
3dec541b2e632d Alexei Starovoitov 2019-10-15  1496  				if (dst_reg > BPF_REG_9) {
3dec541b2e632d Alexei Starovoitov 2019-10-15  1497  					pr_err("verifier error\n");
3dec541b2e632d Alexei Starovoitov 2019-10-15  1498  					return -EFAULT;
3dec541b2e632d Alexei Starovoitov 2019-10-15  1499  				}
3dec541b2e632d Alexei Starovoitov 2019-10-15  1500  				/*
3dec541b2e632d Alexei Starovoitov 2019-10-15  1501  				 * Compute size of x86 insn and its target dest x86 register.
3dec541b2e632d Alexei Starovoitov 2019-10-15  1502  				 * ex_handler_bpf() will use lower 8 bits to adjust
3dec541b2e632d Alexei Starovoitov 2019-10-15  1503  				 * pt_regs->ip to jump over this x86 instruction
3dec541b2e632d Alexei Starovoitov 2019-10-15  1504  				 * and upper bits to figure out which pt_regs to zero out.
3dec541b2e632d Alexei Starovoitov 2019-10-15  1505  				 * End result: x86 insn "mov rbx, qword ptr [rax+0x14]"
3dec541b2e632d Alexei Starovoitov 2019-10-15  1506  				 * of 4 bytes will be ignored and rbx will be zero inited.
3dec541b2e632d Alexei Starovoitov 2019-10-15  1507  				 */
433956e9120073 Alexei Starovoitov 2021-12-15  1508  				ex->fixup = (prog - start_of_ldx) | (reg2pt_regs[dst_reg] << 8);
3dec541b2e632d Alexei Starovoitov 2019-10-15  1509  			}
0a14842f5a3c0e Eric Dumazet       2011-04-20  1510  			break;
622582786c9e04 Alexei Starovoitov 2014-05-13  1511  
91c960b0056672 Brendan Jackman    2021-01-14  1512  		case BPF_STX | BPF_ATOMIC | BPF_W:
91c960b0056672 Brendan Jackman    2021-01-14  1513  		case BPF_STX | BPF_ATOMIC | BPF_DW:
981f94c3e92146 Brendan Jackman    2021-01-14  1514  			if (insn->imm == (BPF_AND | BPF_FETCH) ||
981f94c3e92146 Brendan Jackman    2021-01-14  1515  			    insn->imm == (BPF_OR | BPF_FETCH) ||
981f94c3e92146 Brendan Jackman    2021-01-14  1516  			    insn->imm == (BPF_XOR | BPF_FETCH)) {
981f94c3e92146 Brendan Jackman    2021-01-14  1517  				bool is64 = BPF_SIZE(insn->code) == BPF_DW;
b29dd96b905f3d Brendan Jackman    2021-02-16  1518  				u32 real_src_reg = src_reg;
ced185824c89b6 Johan Almbladh     2021-09-27  1519  				u32 real_dst_reg = dst_reg;
ced185824c89b6 Johan Almbladh     2021-09-27  1520  				u8 *branch_target;
981f94c3e92146 Brendan Jackman    2021-01-14  1521  
981f94c3e92146 Brendan Jackman    2021-01-14  1522  				/*
981f94c3e92146 Brendan Jackman    2021-01-14  1523  				 * Can't be implemented with a single x86 insn.
981f94c3e92146 Brendan Jackman    2021-01-14  1524  				 * Need to do a CMPXCHG loop.
981f94c3e92146 Brendan Jackman    2021-01-14  1525  				 */
981f94c3e92146 Brendan Jackman    2021-01-14  1526  
981f94c3e92146 Brendan Jackman    2021-01-14  1527  				/* Will need RAX as a CMPXCHG operand so save R0 */
981f94c3e92146 Brendan Jackman    2021-01-14  1528  				emit_mov_reg(&prog, true, BPF_REG_AX, BPF_REG_0);
b29dd96b905f3d Brendan Jackman    2021-02-16  1529  				if (src_reg == BPF_REG_0)
b29dd96b905f3d Brendan Jackman    2021-02-16  1530  					real_src_reg = BPF_REG_AX;
ced185824c89b6 Johan Almbladh     2021-09-27  1531  				if (dst_reg == BPF_REG_0)
ced185824c89b6 Johan Almbladh     2021-09-27  1532  					real_dst_reg = BPF_REG_AX;
b29dd96b905f3d Brendan Jackman    2021-02-16  1533  
981f94c3e92146 Brendan Jackman    2021-01-14  1534  				branch_target = prog;
981f94c3e92146 Brendan Jackman    2021-01-14  1535  				/* Load old value */
981f94c3e92146 Brendan Jackman    2021-01-14  1536  				emit_ldx(&prog, BPF_SIZE(insn->code),
ced185824c89b6 Johan Almbladh     2021-09-27  1537  					 BPF_REG_0, real_dst_reg, insn->off);
981f94c3e92146 Brendan Jackman    2021-01-14  1538  				/*
981f94c3e92146 Brendan Jackman    2021-01-14  1539  				 * Perform the (commutative) operation locally,
981f94c3e92146 Brendan Jackman    2021-01-14  1540  				 * put the result in the AUX_REG.
981f94c3e92146 Brendan Jackman    2021-01-14  1541  				 */
981f94c3e92146 Brendan Jackman    2021-01-14  1542  				emit_mov_reg(&prog, is64, AUX_REG, BPF_REG_0);
b29dd96b905f3d Brendan Jackman    2021-02-16  1543  				maybe_emit_mod(&prog, AUX_REG, real_src_reg, is64);
981f94c3e92146 Brendan Jackman    2021-01-14  1544  				EMIT2(simple_alu_opcodes[BPF_OP(insn->imm)],
b29dd96b905f3d Brendan Jackman    2021-02-16  1545  				      add_2reg(0xC0, AUX_REG, real_src_reg));
981f94c3e92146 Brendan Jackman    2021-01-14  1546  				/* Attempt to swap in new value */
981f94c3e92146 Brendan Jackman    2021-01-14  1547  				err = emit_atomic(&prog, BPF_CMPXCHG,
ced185824c89b6 Johan Almbladh     2021-09-27  1548  						  real_dst_reg, AUX_REG,
ced185824c89b6 Johan Almbladh     2021-09-27  1549  						  insn->off,
981f94c3e92146 Brendan Jackman    2021-01-14  1550  						  BPF_SIZE(insn->code));
981f94c3e92146 Brendan Jackman    2021-01-14  1551  				if (WARN_ON(err))
981f94c3e92146 Brendan Jackman    2021-01-14  1552  					return err;
981f94c3e92146 Brendan Jackman    2021-01-14  1553  				/*
981f94c3e92146 Brendan Jackman    2021-01-14  1554  				 * ZF tells us whether we won the race. If it's
981f94c3e92146 Brendan Jackman    2021-01-14  1555  				 * cleared we need to try again.
981f94c3e92146 Brendan Jackman    2021-01-14  1556  				 */
981f94c3e92146 Brendan Jackman    2021-01-14  1557  				EMIT2(X86_JNE, -(prog - branch_target) - 2);
981f94c3e92146 Brendan Jackman    2021-01-14  1558  				/* Return the pre-modification value */
b29dd96b905f3d Brendan Jackman    2021-02-16  1559  				emit_mov_reg(&prog, is64, real_src_reg, BPF_REG_0);
981f94c3e92146 Brendan Jackman    2021-01-14  1560  				/* Restore R0 after clobbering RAX */
981f94c3e92146 Brendan Jackman    2021-01-14  1561  				emit_mov_reg(&prog, true, BPF_REG_0, BPF_REG_AX);
981f94c3e92146 Brendan Jackman    2021-01-14  1562  				break;
981f94c3e92146 Brendan Jackman    2021-01-14  1563  			}
981f94c3e92146 Brendan Jackman    2021-01-14  1564  
91c960b0056672 Brendan Jackman    2021-01-14  1565  			err = emit_atomic(&prog, insn->imm, dst_reg, src_reg,
91c960b0056672 Brendan Jackman    2021-01-14  1566  					  insn->off, BPF_SIZE(insn->code));
91c960b0056672 Brendan Jackman    2021-01-14  1567  			if (err)
91c960b0056672 Brendan Jackman    2021-01-14  1568  				return err;
622582786c9e04 Alexei Starovoitov 2014-05-13  1569  			break;
622582786c9e04 Alexei Starovoitov 2014-05-13  1570  
622582786c9e04 Alexei Starovoitov 2014-05-13  1571  			/* call */
b2e9dfe54be4d0 Thomas Gleixner    2022-09-15  1572  		case BPF_JMP | BPF_CALL: {
b2e9dfe54be4d0 Thomas Gleixner    2022-09-15  1573  			int offs;
b2e9dfe54be4d0 Thomas Gleixner    2022-09-15  1574  
e430f34ee5192c Alexei Starovoitov 2014-06-06  1575  			func = (u8 *) __bpf_call_base + imm32;
ebf7d1f508a738 Maciej Fijalkowski 2020-09-16  1576  			if (tail_call_reachable) {
ff672c67ee7635 Jakub Sitnicki     2022-06-16  1577  				/* mov rax, qword ptr [rbp - rounded_stack_depth - 8] */
ebf7d1f508a738 Maciej Fijalkowski 2020-09-16  1578  				EMIT3_off32(0x48, 0x8B, 0x85,
ff672c67ee7635 Jakub Sitnicki     2022-06-16  1579  					    -round_up(bpf_prog->aux->stack_depth, 8) - 8);
b2e9dfe54be4d0 Thomas Gleixner    2022-09-15  1580  				if (!imm32)
ebf7d1f508a738 Maciej Fijalkowski 2020-09-16  1581  					return -EINVAL;
b2e9dfe54be4d0 Thomas Gleixner    2022-09-15  1582  				offs = 7 + x86_call_depth_emit_accounting(&prog, func);
ebf7d1f508a738 Maciej Fijalkowski 2020-09-16  1583  			} else {
b2e9dfe54be4d0 Thomas Gleixner    2022-09-15  1584  				if (!imm32)
622582786c9e04 Alexei Starovoitov 2014-05-13  1585  					return -EINVAL;
b2e9dfe54be4d0 Thomas Gleixner    2022-09-15  1586  				offs = x86_call_depth_emit_accounting(&prog, func);
ebf7d1f508a738 Maciej Fijalkowski 2020-09-16  1587  			}
b2e9dfe54be4d0 Thomas Gleixner    2022-09-15  1588  			if (emit_call(&prog, func, image + addrs[i - 1] + offs))
b2e9dfe54be4d0 Thomas Gleixner    2022-09-15  1589  				return -EINVAL;
622582786c9e04 Alexei Starovoitov 2014-05-13  1590  			break;
b2e9dfe54be4d0 Thomas Gleixner    2022-09-15  1591  		}
622582786c9e04 Alexei Starovoitov 2014-05-13  1592  
71189fa9b092ef Alexei Starovoitov 2017-05-30  1593  		case BPF_JMP | BPF_TAIL_CALL:
428d5df1fa4f28 Daniel Borkmann    2019-11-22  1594  			if (imm32)
428d5df1fa4f28 Daniel Borkmann    2019-11-22  1595  				emit_bpf_tail_call_direct(&bpf_prog->aux->poke_tab[imm32 - 1],
dceba0817ca329 Peter Zijlstra     2021-10-26  1596  							  &prog, image + addrs[i - 1],
ebf7d1f508a738 Maciej Fijalkowski 2020-09-16  1597  							  callee_regs_used,
dceba0817ca329 Peter Zijlstra     2021-10-26  1598  							  bpf_prog->aux->stack_depth,
dceba0817ca329 Peter Zijlstra     2021-10-26  1599  							  ctx);
428d5df1fa4f28 Daniel Borkmann    2019-11-22  1600  			else
ebf7d1f508a738 Maciej Fijalkowski 2020-09-16  1601  				emit_bpf_tail_call_indirect(&prog,
ebf7d1f508a738 Maciej Fijalkowski 2020-09-16  1602  							    callee_regs_used,
dceba0817ca329 Peter Zijlstra     2021-10-26  1603  							    bpf_prog->aux->stack_depth,
dceba0817ca329 Peter Zijlstra     2021-10-26  1604  							    image + addrs[i - 1],
dceba0817ca329 Peter Zijlstra     2021-10-26  1605  							    ctx);
b52f00e6a71543 Alexei Starovoitov 2015-05-19  1606  			break;
b52f00e6a71543 Alexei Starovoitov 2015-05-19  1607  
622582786c9e04 Alexei Starovoitov 2014-05-13  1608  			/* cond jump */
622582786c9e04 Alexei Starovoitov 2014-05-13  1609  		case BPF_JMP | BPF_JEQ | BPF_X:
622582786c9e04 Alexei Starovoitov 2014-05-13  1610  		case BPF_JMP | BPF_JNE | BPF_X:
622582786c9e04 Alexei Starovoitov 2014-05-13  1611  		case BPF_JMP | BPF_JGT | BPF_X:
52afc51e94b1c7 Daniel Borkmann    2017-08-10  1612  		case BPF_JMP | BPF_JLT | BPF_X:
622582786c9e04 Alexei Starovoitov 2014-05-13  1613  		case BPF_JMP | BPF_JGE | BPF_X:
52afc51e94b1c7 Daniel Borkmann    2017-08-10  1614  		case BPF_JMP | BPF_JLE | BPF_X:
622582786c9e04 Alexei Starovoitov 2014-05-13  1615  		case BPF_JMP | BPF_JSGT | BPF_X:
52afc51e94b1c7 Daniel Borkmann    2017-08-10  1616  		case BPF_JMP | BPF_JSLT | BPF_X:
622582786c9e04 Alexei Starovoitov 2014-05-13  1617  		case BPF_JMP | BPF_JSGE | BPF_X:
52afc51e94b1c7 Daniel Borkmann    2017-08-10  1618  		case BPF_JMP | BPF_JSLE | BPF_X:
3f5d6525f21990 Jiong Wang         2019-01-26  1619  		case BPF_JMP32 | BPF_JEQ | BPF_X:
3f5d6525f21990 Jiong Wang         2019-01-26  1620  		case BPF_JMP32 | BPF_JNE | BPF_X:
3f5d6525f21990 Jiong Wang         2019-01-26  1621  		case BPF_JMP32 | BPF_JGT | BPF_X:
3f5d6525f21990 Jiong Wang         2019-01-26  1622  		case BPF_JMP32 | BPF_JLT | BPF_X:
3f5d6525f21990 Jiong Wang         2019-01-26  1623  		case BPF_JMP32 | BPF_JGE | BPF_X:
3f5d6525f21990 Jiong Wang         2019-01-26  1624  		case BPF_JMP32 | BPF_JLE | BPF_X:
3f5d6525f21990 Jiong Wang         2019-01-26  1625  		case BPF_JMP32 | BPF_JSGT | BPF_X:
3f5d6525f21990 Jiong Wang         2019-01-26  1626  		case BPF_JMP32 | BPF_JSLT | BPF_X:
3f5d6525f21990 Jiong Wang         2019-01-26  1627  		case BPF_JMP32 | BPF_JSGE | BPF_X:
3f5d6525f21990 Jiong Wang         2019-01-26  1628  		case BPF_JMP32 | BPF_JSLE | BPF_X:
e430f34ee5192c Alexei Starovoitov 2014-06-06  1629  			/* cmp dst_reg, src_reg */
74007cfc1f71e4 Brendan Jackman    2021-01-14  1630  			maybe_emit_mod(&prog, dst_reg, src_reg,
74007cfc1f71e4 Brendan Jackman    2021-01-14  1631  				       BPF_CLASS(insn->code) == BPF_JMP);
3f5d6525f21990 Jiong Wang         2019-01-26  1632  			EMIT2(0x39, add_2reg(0xC0, dst_reg, src_reg));
622582786c9e04 Alexei Starovoitov 2014-05-13  1633  			goto emit_cond_jmp;
622582786c9e04 Alexei Starovoitov 2014-05-13  1634  
622582786c9e04 Alexei Starovoitov 2014-05-13  1635  		case BPF_JMP | BPF_JSET | BPF_X:
3f5d6525f21990 Jiong Wang         2019-01-26  1636  		case BPF_JMP32 | BPF_JSET | BPF_X:
e430f34ee5192c Alexei Starovoitov 2014-06-06  1637  			/* test dst_reg, src_reg */
74007cfc1f71e4 Brendan Jackman    2021-01-14  1638  			maybe_emit_mod(&prog, dst_reg, src_reg,
74007cfc1f71e4 Brendan Jackman    2021-01-14  1639  				       BPF_CLASS(insn->code) == BPF_JMP);
3f5d6525f21990 Jiong Wang         2019-01-26  1640  			EMIT2(0x85, add_2reg(0xC0, dst_reg, src_reg));
622582786c9e04 Alexei Starovoitov 2014-05-13  1641  			goto emit_cond_jmp;
622582786c9e04 Alexei Starovoitov 2014-05-13  1642  
622582786c9e04 Alexei Starovoitov 2014-05-13  1643  		case BPF_JMP | BPF_JSET | BPF_K:
3f5d6525f21990 Jiong Wang         2019-01-26  1644  		case BPF_JMP32 | BPF_JSET | BPF_K:
e430f34ee5192c Alexei Starovoitov 2014-06-06  1645  			/* test dst_reg, imm32 */
6364d7d75a0e01 Jie Meng           2021-10-06  1646  			maybe_emit_1mod(&prog, dst_reg,
6364d7d75a0e01 Jie Meng           2021-10-06  1647  					BPF_CLASS(insn->code) == BPF_JMP);
e430f34ee5192c Alexei Starovoitov 2014-06-06  1648  			EMIT2_off32(0xF7, add_1reg(0xC0, dst_reg), imm32);
622582786c9e04 Alexei Starovoitov 2014-05-13  1649  			goto emit_cond_jmp;
622582786c9e04 Alexei Starovoitov 2014-05-13  1650  
622582786c9e04 Alexei Starovoitov 2014-05-13  1651  		case BPF_JMP | BPF_JEQ | BPF_K:
622582786c9e04 Alexei Starovoitov 2014-05-13  1652  		case BPF_JMP | BPF_JNE | BPF_K:
622582786c9e04 Alexei Starovoitov 2014-05-13  1653  		case BPF_JMP | BPF_JGT | BPF_K:
52afc51e94b1c7 Daniel Borkmann    2017-08-10  1654  		case BPF_JMP | BPF_JLT | BPF_K:
622582786c9e04 Alexei Starovoitov 2014-05-13  1655  		case BPF_JMP | BPF_JGE | BPF_K:
52afc51e94b1c7 Daniel Borkmann    2017-08-10  1656  		case BPF_JMP | BPF_JLE | BPF_K:
622582786c9e04 Alexei Starovoitov 2014-05-13  1657  		case BPF_JMP | BPF_JSGT | BPF_K:
52afc51e94b1c7 Daniel Borkmann    2017-08-10  1658  		case BPF_JMP | BPF_JSLT | BPF_K:
622582786c9e04 Alexei Starovoitov 2014-05-13  1659  		case BPF_JMP | BPF_JSGE | BPF_K:
52afc51e94b1c7 Daniel Borkmann    2017-08-10  1660  		case BPF_JMP | BPF_JSLE | BPF_K:
3f5d6525f21990 Jiong Wang         2019-01-26  1661  		case BPF_JMP32 | BPF_JEQ | BPF_K:
3f5d6525f21990 Jiong Wang         2019-01-26  1662  		case BPF_JMP32 | BPF_JNE | BPF_K:
3f5d6525f21990 Jiong Wang         2019-01-26  1663  		case BPF_JMP32 | BPF_JGT | BPF_K:
3f5d6525f21990 Jiong Wang         2019-01-26  1664  		case BPF_JMP32 | BPF_JLT | BPF_K:
3f5d6525f21990 Jiong Wang         2019-01-26  1665  		case BPF_JMP32 | BPF_JGE | BPF_K:
3f5d6525f21990 Jiong Wang         2019-01-26  1666  		case BPF_JMP32 | BPF_JLE | BPF_K:
3f5d6525f21990 Jiong Wang         2019-01-26  1667  		case BPF_JMP32 | BPF_JSGT | BPF_K:
3f5d6525f21990 Jiong Wang         2019-01-26  1668  		case BPF_JMP32 | BPF_JSLT | BPF_K:
3f5d6525f21990 Jiong Wang         2019-01-26  1669  		case BPF_JMP32 | BPF_JSGE | BPF_K:
3f5d6525f21990 Jiong Wang         2019-01-26  1670  		case BPF_JMP32 | BPF_JSLE | BPF_K:
38f51c07054ff4 Daniel Borkmann    2019-10-03  1671  			/* test dst_reg, dst_reg to save one extra byte */
38f51c07054ff4 Daniel Borkmann    2019-10-03  1672  			if (imm32 == 0) {
74007cfc1f71e4 Brendan Jackman    2021-01-14  1673  				maybe_emit_mod(&prog, dst_reg, dst_reg,
74007cfc1f71e4 Brendan Jackman    2021-01-14  1674  					       BPF_CLASS(insn->code) == BPF_JMP);
38f51c07054ff4 Daniel Borkmann    2019-10-03  1675  				EMIT2(0x85, add_2reg(0xC0, dst_reg, dst_reg));
38f51c07054ff4 Daniel Borkmann    2019-10-03  1676  				goto emit_cond_jmp;
38f51c07054ff4 Daniel Borkmann    2019-10-03  1677  			}
38f51c07054ff4 Daniel Borkmann    2019-10-03  1678  
e430f34ee5192c Alexei Starovoitov 2014-06-06  1679  			/* cmp dst_reg, imm8/32 */
6364d7d75a0e01 Jie Meng           2021-10-06  1680  			maybe_emit_1mod(&prog, dst_reg,
6364d7d75a0e01 Jie Meng           2021-10-06  1681  					BPF_CLASS(insn->code) == BPF_JMP);
622582786c9e04 Alexei Starovoitov 2014-05-13  1682  
e430f34ee5192c Alexei Starovoitov 2014-06-06  1683  			if (is_imm8(imm32))
e430f34ee5192c Alexei Starovoitov 2014-06-06  1684  				EMIT3(0x83, add_1reg(0xF8, dst_reg), imm32);
0a14842f5a3c0e Eric Dumazet       2011-04-20  1685  			else
e430f34ee5192c Alexei Starovoitov 2014-06-06  1686  				EMIT2_off32(0x81, add_1reg(0xF8, dst_reg), imm32);
622582786c9e04 Alexei Starovoitov 2014-05-13  1687  

:::::: The code at line 1457 was first introduced by commit
:::::: 328aac5ecd119ede3633f7d17969b1ff34ccc784 bpf, x86: Fix extable offset calculation

:::::: TO: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
