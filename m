Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5451C2565;
	Mon,  7 Nov 2022 08:05:04 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id o4so14925088wrq.6;
        Mon, 07 Nov 2022 00:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZkZjLZ4NVCSaUzQCD9Dm5VlrlKAQ3pWdveGwpHNWRpE=;
        b=Gxiq6mndsfnJ1dSMe09ryK6OSUwte2tqKdG0HM9IO7WEArd3r0ZyJ4NbGL5DQgMYb2
         LFs0lPTf4NQHfYNZrtZISm4I2x4fcJno9N1nBnVlXZ+U2GU6UmwhHtX8nnp/5clevWQv
         xekwjEefknxydQNirLH6zrFF6lPTQ/RC9LOkjuHGTwfx3RSAYHgKfn/Doid2ZyF08hoh
         3yI2QrEPkKpWVSArUQOGebOF5u2yXwsXT8DPlJtWbDwpwihvU1Q4v8jvLyJnxiRQrOvY
         v8dH0GF1BJr1tyl0kSXpiC5zc7TZsMFGxaDLgR4/F38f5sAOfY3WLreoWzMyjK8jBX6k
         QkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZkZjLZ4NVCSaUzQCD9Dm5VlrlKAQ3pWdveGwpHNWRpE=;
        b=SQ4DqvYjjp9XJB2ofBFe2O1gxRKpxduxGjGs4OSxPTvNCBz2BemY+6whZW5n+ITz8f
         tKFGA2YIHiHZ5EgE+5etgzOGSJZP8hg0fG7u/+ptc73jGsgNrbWonClci4YdmLubzVPw
         6l0c9RCCoYdpUHBw4Oa/izt7mnNziEWCIaSv53pgQ3+8hBDpQp8Scgkm3P1WrNXJecJW
         MUjOLPbJabnT29JQlxjmI9AR5/pcLwKU7/0ETeHzCSuEKUkY7MBwz3VQUe6ggen8oM5Y
         JSZEMPGsJvakTKeftMWoPKEkkedBaP5xGkvOl8IepCMLcYQ32g1EjPkJW77F/zK0w2lb
         rThQ==
X-Gm-Message-State: ACrzQf3FXiqwMXQHIhW3vshMWj4+zZNgTR9+YAtLU+lUV+U72/Xte8GP
	PrkJED9uSbtSKcNeXjs7sbGuFBePsQo=
X-Google-Smtp-Source: AMsMyM4GHzZIJO99cKot54L0WbRfKWb5CrdXo/J9aWI+GlEPipp1O6sM3GTZN139uN3v+dYwuvuLyQ==
X-Received: by 2002:a5d:684a:0:b0:236:7930:a3e9 with SMTP id o10-20020a5d684a000000b002367930a3e9mr30596082wrw.27.1667808301532;
        Mon, 07 Nov 2022 00:05:01 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p15-20020adfce0f000000b0022cbf4cda62sm7871407wrn.27.2022.11.07.00.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 00:05:01 -0800 (PST)
Date: Mon, 7 Nov 2022 11:04:52 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Stanislav Fomichev <sdf@google.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next v2 02/14] bpf: Support inlined/unrolled kfuncs for
 xdp metadata
Message-ID: <202211071430.SZE7MFhi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221104032532.1615099-3-sdf@google.com>
Message-ID: <20221107080452.Bp91-eEK5-jYbnI9vG-TL7SCtrZPEQxkdK74WHABj1g@z>

Hi Stanislav,

url:    https://github.com/intel-lab-lkp/linux/commits/Stanislav-Fomichev/xdp-hints-via-kfuncs/20221104-113042
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20221104032532.1615099-3-sdf%40google.com
patch subject: [RFC bpf-next v2 02/14] bpf: Support inlined/unrolled kfuncs for xdp metadata
config: x86_64-randconfig-m001
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
kernel/bpf/verifier.c:14081 do_misc_fixups() error: uninitialized symbol 'cnt'.

vim +/cnt +14081 kernel/bpf/verifier.c

e6ac593372aada Brendan Jackman    2021-02-17  13936  static int do_misc_fixups(struct bpf_verifier_env *env)
e245c5c6a5656e Alexei Starovoitov 2017-03-15  13937  {
79741b3bdec01a Alexei Starovoitov 2017-03-15  13938  	struct bpf_prog *prog = env->prog;
f92c1e183604c2 Jiri Olsa          2021-12-08  13939  	enum bpf_attach_type eatype = prog->expected_attach_type;
9b99edcae5c80c Jiri Olsa          2021-07-14  13940  	enum bpf_prog_type prog_type = resolve_prog_type(prog);
79741b3bdec01a Alexei Starovoitov 2017-03-15  13941  	struct bpf_insn *insn = prog->insnsi;
e245c5c6a5656e Alexei Starovoitov 2017-03-15  13942  	const struct bpf_func_proto *fn;
79741b3bdec01a Alexei Starovoitov 2017-03-15  13943  	const int insn_cnt = prog->len;
09772d92cd5ad9 Daniel Borkmann    2018-06-02  13944  	const struct bpf_map_ops *ops;
c93552c443ebc6 Daniel Borkmann    2018-05-24  13945  	struct bpf_insn_aux_data *aux;
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  13946  	struct bpf_insn insn_buf[16];
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  13947  	struct bpf_prog *new_prog;
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  13948  	struct bpf_map *map_ptr;
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  13949  	int i, ret, cnt, delta = 0;
e245c5c6a5656e Alexei Starovoitov 2017-03-15  13950  
79741b3bdec01a Alexei Starovoitov 2017-03-15  13951  	for (i = 0; i < insn_cnt; i++, insn++) {
e6ac593372aada Brendan Jackman    2021-02-17  13952  		/* Make divide-by-zero exceptions impossible. */
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  13953  		if (insn->code == (BPF_ALU64 | BPF_MOD | BPF_X) ||
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  13954  		    insn->code == (BPF_ALU64 | BPF_DIV | BPF_X) ||
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  13955  		    insn->code == (BPF_ALU | BPF_MOD | BPF_X) ||
68fda450a7df51 Alexei Starovoitov 2018-01-12  13956  		    insn->code == (BPF_ALU | BPF_DIV | BPF_X)) {
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  13957  			bool is64 = BPF_CLASS(insn->code) == BPF_ALU64;
e88b2c6e5a4d9c Daniel Borkmann    2021-02-09  13958  			bool isdiv = BPF_OP(insn->code) == BPF_DIV;
e88b2c6e5a4d9c Daniel Borkmann    2021-02-09  13959  			struct bpf_insn *patchlet;
e88b2c6e5a4d9c Daniel Borkmann    2021-02-09  13960  			struct bpf_insn chk_and_div[] = {
9b00f1b7880930 Daniel Borkmann    2021-02-10  13961  				/* [R,W]x div 0 -> 0 */
e88b2c6e5a4d9c Daniel Borkmann    2021-02-09  13962  				BPF_RAW_INSN((is64 ? BPF_JMP : BPF_JMP32) |
e88b2c6e5a4d9c Daniel Borkmann    2021-02-09  13963  					     BPF_JNE | BPF_K, insn->src_reg,
e88b2c6e5a4d9c Daniel Borkmann    2021-02-09  13964  					     0, 2, 0),
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  13965  				BPF_ALU32_REG(BPF_XOR, insn->dst_reg, insn->dst_reg),
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  13966  				BPF_JMP_IMM(BPF_JA, 0, 0, 1),
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  13967  				*insn,
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  13968  			};
e88b2c6e5a4d9c Daniel Borkmann    2021-02-09  13969  			struct bpf_insn chk_and_mod[] = {
9b00f1b7880930 Daniel Borkmann    2021-02-10  13970  				/* [R,W]x mod 0 -> [R,W]x */
e88b2c6e5a4d9c Daniel Borkmann    2021-02-09  13971  				BPF_RAW_INSN((is64 ? BPF_JMP : BPF_JMP32) |
e88b2c6e5a4d9c Daniel Borkmann    2021-02-09  13972  					     BPF_JEQ | BPF_K, insn->src_reg,
9b00f1b7880930 Daniel Borkmann    2021-02-10  13973  					     0, 1 + (is64 ? 0 : 1), 0),
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  13974  				*insn,
9b00f1b7880930 Daniel Borkmann    2021-02-10  13975  				BPF_JMP_IMM(BPF_JA, 0, 0, 1),
9b00f1b7880930 Daniel Borkmann    2021-02-10  13976  				BPF_MOV32_REG(insn->dst_reg, insn->dst_reg),
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  13977  			};
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  13978  
e88b2c6e5a4d9c Daniel Borkmann    2021-02-09  13979  			patchlet = isdiv ? chk_and_div : chk_and_mod;
e88b2c6e5a4d9c Daniel Borkmann    2021-02-09  13980  			cnt = isdiv ? ARRAY_SIZE(chk_and_div) :
9b00f1b7880930 Daniel Borkmann    2021-02-10  13981  				      ARRAY_SIZE(chk_and_mod) - (is64 ? 2 : 0);
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  13982  
f6b1b3bf0d5f68 Daniel Borkmann    2018-01-26  13983  			new_prog = bpf_patch_insn_data(env, i + delta, patchlet, cnt);
68fda450a7df51 Alexei Starovoitov 2018-01-12  13984  			if (!new_prog)
68fda450a7df51 Alexei Starovoitov 2018-01-12  13985  				return -ENOMEM;
68fda450a7df51 Alexei Starovoitov 2018-01-12  13986  
68fda450a7df51 Alexei Starovoitov 2018-01-12  13987  			delta    += cnt - 1;
68fda450a7df51 Alexei Starovoitov 2018-01-12  13988  			env->prog = prog = new_prog;
68fda450a7df51 Alexei Starovoitov 2018-01-12  13989  			insn      = new_prog->insnsi + i + delta;
68fda450a7df51 Alexei Starovoitov 2018-01-12  13990  			continue;
68fda450a7df51 Alexei Starovoitov 2018-01-12  13991  		}
68fda450a7df51 Alexei Starovoitov 2018-01-12  13992  
e6ac593372aada Brendan Jackman    2021-02-17  13993  		/* Implement LD_ABS and LD_IND with a rewrite, if supported by the program type. */
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  13994  		if (BPF_CLASS(insn->code) == BPF_LD &&
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  13995  		    (BPF_MODE(insn->code) == BPF_ABS ||
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  13996  		     BPF_MODE(insn->code) == BPF_IND)) {
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  13997  			cnt = env->ops->gen_ld_abs(insn, insn_buf);
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  13998  			if (cnt == 0 || cnt >= ARRAY_SIZE(insn_buf)) {
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  13999  				verbose(env, "bpf verifier is misconfigured\n");
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  14000  				return -EINVAL;
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  14001  			}
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  14002  
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  14003  			new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  14004  			if (!new_prog)
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  14005  				return -ENOMEM;
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  14006  
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  14007  			delta    += cnt - 1;
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  14008  			env->prog = prog = new_prog;
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  14009  			insn      = new_prog->insnsi + i + delta;
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  14010  			continue;
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  14011  		}
e0cea7ce988cf4 Daniel Borkmann    2018-05-04  14012  
e6ac593372aada Brendan Jackman    2021-02-17  14013  		/* Rewrite pointer arithmetic to mitigate speculation attacks. */
979d63d50c0c0f Daniel Borkmann    2019-01-03  14014  		if (insn->code == (BPF_ALU64 | BPF_ADD | BPF_X) ||
979d63d50c0c0f Daniel Borkmann    2019-01-03  14015  		    insn->code == (BPF_ALU64 | BPF_SUB | BPF_X)) {
979d63d50c0c0f Daniel Borkmann    2019-01-03  14016  			const u8 code_add = BPF_ALU64 | BPF_ADD | BPF_X;
979d63d50c0c0f Daniel Borkmann    2019-01-03  14017  			const u8 code_sub = BPF_ALU64 | BPF_SUB | BPF_X;
979d63d50c0c0f Daniel Borkmann    2019-01-03  14018  			struct bpf_insn *patch = &insn_buf[0];
801c6058d14a82 Daniel Borkmann    2021-04-29  14019  			bool issrc, isneg, isimm;
979d63d50c0c0f Daniel Borkmann    2019-01-03  14020  			u32 off_reg;
979d63d50c0c0f Daniel Borkmann    2019-01-03  14021  
979d63d50c0c0f Daniel Borkmann    2019-01-03  14022  			aux = &env->insn_aux_data[i + delta];
3612af783cf52c Daniel Borkmann    2019-03-01  14023  			if (!aux->alu_state ||
3612af783cf52c Daniel Borkmann    2019-03-01  14024  			    aux->alu_state == BPF_ALU_NON_POINTER)
979d63d50c0c0f Daniel Borkmann    2019-01-03  14025  				continue;
979d63d50c0c0f Daniel Borkmann    2019-01-03  14026  
979d63d50c0c0f Daniel Borkmann    2019-01-03  14027  			isneg = aux->alu_state & BPF_ALU_NEG_VALUE;
979d63d50c0c0f Daniel Borkmann    2019-01-03  14028  			issrc = (aux->alu_state & BPF_ALU_SANITIZE) ==
979d63d50c0c0f Daniel Borkmann    2019-01-03  14029  				BPF_ALU_SANITIZE_SRC;
801c6058d14a82 Daniel Borkmann    2021-04-29  14030  			isimm = aux->alu_state & BPF_ALU_IMMEDIATE;
979d63d50c0c0f Daniel Borkmann    2019-01-03  14031  
979d63d50c0c0f Daniel Borkmann    2019-01-03  14032  			off_reg = issrc ? insn->src_reg : insn->dst_reg;
801c6058d14a82 Daniel Borkmann    2021-04-29  14033  			if (isimm) {
801c6058d14a82 Daniel Borkmann    2021-04-29  14034  				*patch++ = BPF_MOV32_IMM(BPF_REG_AX, aux->alu_limit);
801c6058d14a82 Daniel Borkmann    2021-04-29  14035  			} else {
979d63d50c0c0f Daniel Borkmann    2019-01-03  14036  				if (isneg)
979d63d50c0c0f Daniel Borkmann    2019-01-03  14037  					*patch++ = BPF_ALU64_IMM(BPF_MUL, off_reg, -1);
b5871dca250cd3 Piotr Krysiuk      2021-03-16  14038  				*patch++ = BPF_MOV32_IMM(BPF_REG_AX, aux->alu_limit);
979d63d50c0c0f Daniel Borkmann    2019-01-03  14039  				*patch++ = BPF_ALU64_REG(BPF_SUB, BPF_REG_AX, off_reg);
979d63d50c0c0f Daniel Borkmann    2019-01-03  14040  				*patch++ = BPF_ALU64_REG(BPF_OR, BPF_REG_AX, off_reg);
979d63d50c0c0f Daniel Borkmann    2019-01-03  14041  				*patch++ = BPF_ALU64_IMM(BPF_NEG, BPF_REG_AX, 0);
979d63d50c0c0f Daniel Borkmann    2019-01-03  14042  				*patch++ = BPF_ALU64_IMM(BPF_ARSH, BPF_REG_AX, 63);
b9b34ddbe2076a Daniel Borkmann    2021-04-30  14043  				*patch++ = BPF_ALU64_REG(BPF_AND, BPF_REG_AX, off_reg);
801c6058d14a82 Daniel Borkmann    2021-04-29  14044  			}
b9b34ddbe2076a Daniel Borkmann    2021-04-30  14045  			if (!issrc)
b9b34ddbe2076a Daniel Borkmann    2021-04-30  14046  				*patch++ = BPF_MOV64_REG(insn->dst_reg, insn->src_reg);
979d63d50c0c0f Daniel Borkmann    2019-01-03  14047  			insn->src_reg = BPF_REG_AX;
979d63d50c0c0f Daniel Borkmann    2019-01-03  14048  			if (isneg)
979d63d50c0c0f Daniel Borkmann    2019-01-03  14049  				insn->code = insn->code == code_add ?
979d63d50c0c0f Daniel Borkmann    2019-01-03  14050  					     code_sub : code_add;
979d63d50c0c0f Daniel Borkmann    2019-01-03  14051  			*patch++ = *insn;
801c6058d14a82 Daniel Borkmann    2021-04-29  14052  			if (issrc && isneg && !isimm)
979d63d50c0c0f Daniel Borkmann    2019-01-03  14053  				*patch++ = BPF_ALU64_IMM(BPF_MUL, off_reg, -1);
979d63d50c0c0f Daniel Borkmann    2019-01-03  14054  			cnt = patch - insn_buf;
979d63d50c0c0f Daniel Borkmann    2019-01-03  14055  
979d63d50c0c0f Daniel Borkmann    2019-01-03  14056  			new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
979d63d50c0c0f Daniel Borkmann    2019-01-03  14057  			if (!new_prog)
979d63d50c0c0f Daniel Borkmann    2019-01-03  14058  				return -ENOMEM;
979d63d50c0c0f Daniel Borkmann    2019-01-03  14059  
979d63d50c0c0f Daniel Borkmann    2019-01-03  14060  			delta    += cnt - 1;
979d63d50c0c0f Daniel Borkmann    2019-01-03  14061  			env->prog = prog = new_prog;
979d63d50c0c0f Daniel Borkmann    2019-01-03  14062  			insn      = new_prog->insnsi + i + delta;
979d63d50c0c0f Daniel Borkmann    2019-01-03  14063  			continue;
979d63d50c0c0f Daniel Borkmann    2019-01-03  14064  		}
979d63d50c0c0f Daniel Borkmann    2019-01-03  14065  
79741b3bdec01a Alexei Starovoitov 2017-03-15  14066  		if (insn->code != (BPF_JMP | BPF_CALL))
79741b3bdec01a Alexei Starovoitov 2017-03-15  14067  			continue;
cc8b0b92a1699b Alexei Starovoitov 2017-12-14  14068  		if (insn->src_reg == BPF_PSEUDO_CALL)
cc8b0b92a1699b Alexei Starovoitov 2017-12-14  14069  			continue;
e6ac2450d6dee3 Martin KaFai Lau   2021-03-24  14070  		if (insn->src_reg == BPF_PSEUDO_KFUNC_CALL) {
ffb06d4d1cfc41 Stanislav Fomichev 2022-11-03  14071  			struct bpf_patch patch = {};
ffb06d4d1cfc41 Stanislav Fomichev 2022-11-03  14072  
ffb06d4d1cfc41 Stanislav Fomichev 2022-11-03  14073  			if (bpf_prog_is_dev_bound(env->prog->aux)) {
ffb06d4d1cfc41 Stanislav Fomichev 2022-11-03  14074  				verbose(env, "no metadata kfuncs offload\n");
ffb06d4d1cfc41 Stanislav Fomichev 2022-11-03  14075  				return -EINVAL;
ffb06d4d1cfc41 Stanislav Fomichev 2022-11-03  14076  			}
ffb06d4d1cfc41 Stanislav Fomichev 2022-11-03  14077  
ffb06d4d1cfc41 Stanislav Fomichev 2022-11-03  14078  			ret = unroll_kfunc_call(env, insn, &patch);
ffb06d4d1cfc41 Stanislav Fomichev 2022-11-03  14079  			if (ret < 0) {
ffb06d4d1cfc41 Stanislav Fomichev 2022-11-03  14080  				verbose(env, "failed to unroll kfunc with func_id=%d\n", insn->imm);
ffb06d4d1cfc41 Stanislav Fomichev 2022-11-03 @14081  				return cnt;

I don't know if *all* the if statements above can be true at the same
time.  Also Smatch is bad at bitfield logic.  :/

ffb06d4d1cfc41 Stanislav Fomichev 2022-11-03  14082  			}
ffb06d4d1cfc41 Stanislav Fomichev 2022-11-03  14083  			cnt = bpf_patch_len(&patch);
ffb06d4d1cfc41 Stanislav Fomichev 2022-11-03  14084  			if (cnt) {
ffb06d4d1cfc41 Stanislav Fomichev 2022-11-03  14085  				new_prog = bpf_patch_insn_data(env, i + delta,
ffb06d4d1cfc41 Stanislav Fomichev 2022-11-03  14086  							       bpf_patch_data(&patch),
ffb06d4d1cfc41 Stanislav Fomichev 2022-11-03  14087  							       bpf_patch_len(&patch));
ffb06d4d1cfc41 Stanislav Fomichev 2022-11-03  14088  				bpf_patch_free(&patch);
ffb06d4d1cfc41 Stanislav Fomichev 2022-11-03  14089  				if (!new_prog)
ffb06d4d1cfc41 Stanislav Fomichev 2022-11-03  14090  					return -ENOMEM;
ffb06d4d1cfc41 Stanislav Fomichev 2022-11-03  14091  
ffb06d4d1cfc41 Stanislav Fomichev 2022-11-03  14092  				delta    += cnt - 1;
ffb06d4d1cfc41 Stanislav Fomichev 2022-11-03  14093  				env->prog = prog = new_prog;
ffb06d4d1cfc41 Stanislav Fomichev 2022-11-03  14094  				insn      = new_prog->insnsi + i + delta;
ffb06d4d1cfc41 Stanislav Fomichev 2022-11-03  14095  				continue;
ffb06d4d1cfc41 Stanislav Fomichev 2022-11-03  14096  			}
ffb06d4d1cfc41 Stanislav Fomichev 2022-11-03  14097  
e6ac2450d6dee3 Martin KaFai Lau   2021-03-24  14098  			ret = fixup_kfunc_call(env, insn);
e6ac2450d6dee3 Martin KaFai Lau   2021-03-24  14099  			if (ret)
e6ac2450d6dee3 Martin KaFai Lau   2021-03-24  14100  				return ret;
e6ac2450d6dee3 Martin KaFai Lau   2021-03-24  14101  			continue;
e6ac2450d6dee3 Martin KaFai Lau   2021-03-24  14102  		}
e245c5c6a5656e Alexei Starovoitov 2017-03-15  14103  
e245c5c6a5656e Alexei Starovoitov 2017-03-15  14104  		if (insn->imm == BPF_FUNC_get_route_realm)
e245c5c6a5656e Alexei Starovoitov 2017-03-15  14105  			prog->dst_needed = 1;
e245c5c6a5656e Alexei Starovoitov 2017-03-15  14106  		if (insn->imm == BPF_FUNC_get_prandom_u32)
e245c5c6a5656e Alexei Starovoitov 2017-03-15  14107  			bpf_user_rnd_init_once();
9802d86585db91 Josef Bacik        2017-12-11  14108  		if (insn->imm == BPF_FUNC_override_return)
9802d86585db91 Josef Bacik        2017-12-11  14109  			prog->kprobe_override = 1;
e245c5c6a5656e Alexei Starovoitov 2017-03-15  14110  		if (insn->imm == BPF_FUNC_tail_call) {
7b9f6da175f938 David S. Miller    2017-04-20  14111  			/* If we tail call into other programs, we
7b9f6da175f938 David S. Miller    2017-04-20  14112  			 * cannot make any assumptions since they can
7b9f6da175f938 David S. Miller    2017-04-20  14113  			 * be replaced dynamically during runtime in
7b9f6da175f938 David S. Miller    2017-04-20  14114  			 * the program array.
7b9f6da175f938 David S. Miller    2017-04-20  14115  			 */
7b9f6da175f938 David S. Miller    2017-04-20  14116  			prog->cb_access = 1;
e411901c0b775a Maciej Fijalkowski 2020-09-16  14117  			if (!allow_tail_call_in_subprogs(env))
e411901c0b775a Maciej Fijalkowski 2020-09-16  14118  				prog->aux->stack_depth = MAX_BPF_STACK;
e411901c0b775a Maciej Fijalkowski 2020-09-16  14119  			prog->aux->max_pkt_offset = MAX_PACKET_OFF;
7b9f6da175f938 David S. Miller    2017-04-20  14120  
79741b3bdec01a Alexei Starovoitov 2017-03-15  14121  			/* mark bpf_tail_call as different opcode to avoid
8fb33b6055300a Zhen Lei           2021-05-25  14122  			 * conditional branch in the interpreter for every normal
79741b3bdec01a Alexei Starovoitov 2017-03-15  14123  			 * call and to prevent accidental JITing by JIT compiler
79741b3bdec01a Alexei Starovoitov 2017-03-15  14124  			 * that doesn't support bpf_tail_call yet
e245c5c6a5656e Alexei Starovoitov 2017-03-15  14125  			 */
e245c5c6a5656e Alexei Starovoitov 2017-03-15  14126  			insn->imm = 0;
71189fa9b092ef Alexei Starovoitov 2017-05-30  14127  			insn->code = BPF_JMP | BPF_TAIL_CALL;
b2157399cc9898 Alexei Starovoitov 2018-01-07  14128  
c93552c443ebc6 Daniel Borkmann    2018-05-24  14129  			aux = &env->insn_aux_data[i + delta];
d2a3b7c5becc39 Hou Tao            2022-03-09  14130  			if (env->bpf_capable && !prog->blinding_requested &&
cc52d9140aa920 Daniel Borkmann    2019-12-19  14131  			    prog->jit_requested &&
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  14132  			    !bpf_map_key_poisoned(aux) &&
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  14133  			    !bpf_map_ptr_poisoned(aux) &&
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  14134  			    !bpf_map_ptr_unpriv(aux)) {
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  14135  				struct bpf_jit_poke_descriptor desc = {
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  14136  					.reason = BPF_POKE_REASON_TAIL_CALL,
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  14137  					.tail_call.map = BPF_MAP_PTR(aux->map_ptr_state),
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  14138  					.tail_call.key = bpf_map_key_immediate(aux),
a748c6975dea32 Maciej Fijalkowski 2020-09-16  14139  					.insn_idx = i + delta,
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  14140  				};
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  14141  
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  14142  				ret = bpf_jit_add_poke_descriptor(prog, &desc);
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  14143  				if (ret < 0) {
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  14144  					verbose(env, "adding tail call poke descriptor failed\n");
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  14145  					return ret;
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  14146  				}
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  14147  
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  14148  				insn->imm = ret + 1;
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  14149  				continue;
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  14150  			}
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  14151  
c93552c443ebc6 Daniel Borkmann    2018-05-24  14152  			if (!bpf_map_ptr_unpriv(aux))
c93552c443ebc6 Daniel Borkmann    2018-05-24  14153  				continue;
c93552c443ebc6 Daniel Borkmann    2018-05-24  14154  
b2157399cc9898 Alexei Starovoitov 2018-01-07  14155  			/* instead of changing every JIT dealing with tail_call
b2157399cc9898 Alexei Starovoitov 2018-01-07  14156  			 * emit two extra insns:
b2157399cc9898 Alexei Starovoitov 2018-01-07  14157  			 * if (index >= max_entries) goto out;
b2157399cc9898 Alexei Starovoitov 2018-01-07  14158  			 * index &= array->index_mask;
b2157399cc9898 Alexei Starovoitov 2018-01-07  14159  			 * to avoid out-of-bounds cpu speculation
b2157399cc9898 Alexei Starovoitov 2018-01-07  14160  			 */
c93552c443ebc6 Daniel Borkmann    2018-05-24  14161  			if (bpf_map_ptr_poisoned(aux)) {
40950343932879 Colin Ian King     2018-01-10  14162  				verbose(env, "tail_call abusing map_ptr\n");
b2157399cc9898 Alexei Starovoitov 2018-01-07  14163  				return -EINVAL;
b2157399cc9898 Alexei Starovoitov 2018-01-07  14164  			}
c93552c443ebc6 Daniel Borkmann    2018-05-24  14165  
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  14166  			map_ptr = BPF_MAP_PTR(aux->map_ptr_state);
b2157399cc9898 Alexei Starovoitov 2018-01-07  14167  			insn_buf[0] = BPF_JMP_IMM(BPF_JGE, BPF_REG_3,
b2157399cc9898 Alexei Starovoitov 2018-01-07  14168  						  map_ptr->max_entries, 2);
b2157399cc9898 Alexei Starovoitov 2018-01-07  14169  			insn_buf[1] = BPF_ALU32_IMM(BPF_AND, BPF_REG_3,
b2157399cc9898 Alexei Starovoitov 2018-01-07  14170  						    container_of(map_ptr,
b2157399cc9898 Alexei Starovoitov 2018-01-07  14171  								 struct bpf_array,
b2157399cc9898 Alexei Starovoitov 2018-01-07  14172  								 map)->index_mask);
b2157399cc9898 Alexei Starovoitov 2018-01-07  14173  			insn_buf[2] = *insn;
b2157399cc9898 Alexei Starovoitov 2018-01-07  14174  			cnt = 3;
b2157399cc9898 Alexei Starovoitov 2018-01-07  14175  			new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
b2157399cc9898 Alexei Starovoitov 2018-01-07  14176  			if (!new_prog)
b2157399cc9898 Alexei Starovoitov 2018-01-07  14177  				return -ENOMEM;
b2157399cc9898 Alexei Starovoitov 2018-01-07  14178  
b2157399cc9898 Alexei Starovoitov 2018-01-07  14179  			delta    += cnt - 1;
b2157399cc9898 Alexei Starovoitov 2018-01-07  14180  			env->prog = prog = new_prog;
b2157399cc9898 Alexei Starovoitov 2018-01-07  14181  			insn      = new_prog->insnsi + i + delta;
e245c5c6a5656e Alexei Starovoitov 2017-03-15  14182  			continue;
e245c5c6a5656e Alexei Starovoitov 2017-03-15  14183  		}
e245c5c6a5656e Alexei Starovoitov 2017-03-15  14184  
b00628b1c7d595 Alexei Starovoitov 2021-07-14  14185  		if (insn->imm == BPF_FUNC_timer_set_callback) {
b00628b1c7d595 Alexei Starovoitov 2021-07-14  14186  			/* The verifier will process callback_fn as many times as necessary
b00628b1c7d595 Alexei Starovoitov 2021-07-14  14187  			 * with different maps and the register states prepared by
b00628b1c7d595 Alexei Starovoitov 2021-07-14  14188  			 * set_timer_callback_state will be accurate.
b00628b1c7d595 Alexei Starovoitov 2021-07-14  14189  			 *
b00628b1c7d595 Alexei Starovoitov 2021-07-14  14190  			 * The following use case is valid:
b00628b1c7d595 Alexei Starovoitov 2021-07-14  14191  			 *   map1 is shared by prog1, prog2, prog3.
b00628b1c7d595 Alexei Starovoitov 2021-07-14  14192  			 *   prog1 calls bpf_timer_init for some map1 elements
b00628b1c7d595 Alexei Starovoitov 2021-07-14  14193  			 *   prog2 calls bpf_timer_set_callback for some map1 elements.
b00628b1c7d595 Alexei Starovoitov 2021-07-14  14194  			 *     Those that were not bpf_timer_init-ed will return -EINVAL.
b00628b1c7d595 Alexei Starovoitov 2021-07-14  14195  			 *   prog3 calls bpf_timer_start for some map1 elements.
b00628b1c7d595 Alexei Starovoitov 2021-07-14  14196  			 *     Those that were not both bpf_timer_init-ed and
b00628b1c7d595 Alexei Starovoitov 2021-07-14  14197  			 *     bpf_timer_set_callback-ed will return -EINVAL.
b00628b1c7d595 Alexei Starovoitov 2021-07-14  14198  			 */
b00628b1c7d595 Alexei Starovoitov 2021-07-14  14199  			struct bpf_insn ld_addrs[2] = {
b00628b1c7d595 Alexei Starovoitov 2021-07-14  14200  				BPF_LD_IMM64(BPF_REG_3, (long)prog->aux),
b00628b1c7d595 Alexei Starovoitov 2021-07-14  14201  			};
b00628b1c7d595 Alexei Starovoitov 2021-07-14  14202  
b00628b1c7d595 Alexei Starovoitov 2021-07-14  14203  			insn_buf[0] = ld_addrs[0];
b00628b1c7d595 Alexei Starovoitov 2021-07-14  14204  			insn_buf[1] = ld_addrs[1];
b00628b1c7d595 Alexei Starovoitov 2021-07-14  14205  			insn_buf[2] = *insn;
b00628b1c7d595 Alexei Starovoitov 2021-07-14  14206  			cnt = 3;
b00628b1c7d595 Alexei Starovoitov 2021-07-14  14207  
b00628b1c7d595 Alexei Starovoitov 2021-07-14  14208  			new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
b00628b1c7d595 Alexei Starovoitov 2021-07-14  14209  			if (!new_prog)
b00628b1c7d595 Alexei Starovoitov 2021-07-14  14210  				return -ENOMEM;
b00628b1c7d595 Alexei Starovoitov 2021-07-14  14211  
b00628b1c7d595 Alexei Starovoitov 2021-07-14  14212  			delta    += cnt - 1;
b00628b1c7d595 Alexei Starovoitov 2021-07-14  14213  			env->prog = prog = new_prog;
b00628b1c7d595 Alexei Starovoitov 2021-07-14  14214  			insn      = new_prog->insnsi + i + delta;
b00628b1c7d595 Alexei Starovoitov 2021-07-14  14215  			goto patch_call_imm;
b00628b1c7d595 Alexei Starovoitov 2021-07-14  14216  		}
b00628b1c7d595 Alexei Starovoitov 2021-07-14  14217  
b00fa38a9c1cba Joanne Koong       2022-03-17  14218  		if (insn->imm == BPF_FUNC_task_storage_get ||
b00fa38a9c1cba Joanne Koong       2022-03-17  14219  		    insn->imm == BPF_FUNC_sk_storage_get ||
c4bcfb38a95edb Yonghong Song      2022-10-25  14220  		    insn->imm == BPF_FUNC_inode_storage_get ||
c4bcfb38a95edb Yonghong Song      2022-10-25  14221  		    insn->imm == BPF_FUNC_cgrp_storage_get) {
b00fa38a9c1cba Joanne Koong       2022-03-17  14222  			if (env->prog->aux->sleepable)
d56c9fe6a06820 Joanne Koong       2022-03-21  14223  				insn_buf[0] = BPF_MOV64_IMM(BPF_REG_5, (__force __s32)GFP_KERNEL);
b00fa38a9c1cba Joanne Koong       2022-03-17  14224  			else
d56c9fe6a06820 Joanne Koong       2022-03-21  14225  				insn_buf[0] = BPF_MOV64_IMM(BPF_REG_5, (__force __s32)GFP_ATOMIC);
b00fa38a9c1cba Joanne Koong       2022-03-17  14226  			insn_buf[1] = *insn;
b00fa38a9c1cba Joanne Koong       2022-03-17  14227  			cnt = 2;
b00fa38a9c1cba Joanne Koong       2022-03-17  14228  
b00fa38a9c1cba Joanne Koong       2022-03-17  14229  			new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
b00fa38a9c1cba Joanne Koong       2022-03-17  14230  			if (!new_prog)
b00fa38a9c1cba Joanne Koong       2022-03-17  14231  				return -ENOMEM;
b00fa38a9c1cba Joanne Koong       2022-03-17  14232  
b00fa38a9c1cba Joanne Koong       2022-03-17  14233  			delta += cnt - 1;
b00fa38a9c1cba Joanne Koong       2022-03-17  14234  			env->prog = prog = new_prog;
b00fa38a9c1cba Joanne Koong       2022-03-17  14235  			insn = new_prog->insnsi + i + delta;
b00fa38a9c1cba Joanne Koong       2022-03-17  14236  			goto patch_call_imm;
b00fa38a9c1cba Joanne Koong       2022-03-17  14237  		}
b00fa38a9c1cba Joanne Koong       2022-03-17  14238  
89c63074c2bc25 Daniel Borkmann    2017-08-19  14239  		/* BPF_EMIT_CALL() assumptions in some of the map_gen_lookup
09772d92cd5ad9 Daniel Borkmann    2018-06-02  14240  		 * and other inlining handlers are currently limited to 64 bit
09772d92cd5ad9 Daniel Borkmann    2018-06-02  14241  		 * only.
89c63074c2bc25 Daniel Borkmann    2017-08-19  14242  		 */
60b58afc96c9df Alexei Starovoitov 2017-12-14  14243  		if (prog->jit_requested && BITS_PER_LONG == 64 &&
09772d92cd5ad9 Daniel Borkmann    2018-06-02  14244  		    (insn->imm == BPF_FUNC_map_lookup_elem ||
09772d92cd5ad9 Daniel Borkmann    2018-06-02  14245  		     insn->imm == BPF_FUNC_map_update_elem ||
84430d4232c36c Daniel Borkmann    2018-10-21  14246  		     insn->imm == BPF_FUNC_map_delete_elem ||
84430d4232c36c Daniel Borkmann    2018-10-21  14247  		     insn->imm == BPF_FUNC_map_push_elem   ||
84430d4232c36c Daniel Borkmann    2018-10-21  14248  		     insn->imm == BPF_FUNC_map_pop_elem    ||
e6a4750ffe9d70 Björn Töpel        2021-03-08  14249  		     insn->imm == BPF_FUNC_map_peek_elem   ||
0640c77c46cb84 Andrey Ignatov     2021-10-05  14250  		     insn->imm == BPF_FUNC_redirect_map    ||
07343110b29345 Feng Zhou          2022-05-11  14251  		     insn->imm == BPF_FUNC_for_each_map_elem ||
07343110b29345 Feng Zhou          2022-05-11  14252  		     insn->imm == BPF_FUNC_map_lookup_percpu_elem)) {
c93552c443ebc6 Daniel Borkmann    2018-05-24  14253  			aux = &env->insn_aux_data[i + delta];
c93552c443ebc6 Daniel Borkmann    2018-05-24  14254  			if (bpf_map_ptr_poisoned(aux))
c93552c443ebc6 Daniel Borkmann    2018-05-24  14255  				goto patch_call_imm;
c93552c443ebc6 Daniel Borkmann    2018-05-24  14256  
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  14257  			map_ptr = BPF_MAP_PTR(aux->map_ptr_state);
09772d92cd5ad9 Daniel Borkmann    2018-06-02  14258  			ops = map_ptr->ops;
09772d92cd5ad9 Daniel Borkmann    2018-06-02  14259  			if (insn->imm == BPF_FUNC_map_lookup_elem &&
09772d92cd5ad9 Daniel Borkmann    2018-06-02  14260  			    ops->map_gen_lookup) {
09772d92cd5ad9 Daniel Borkmann    2018-06-02  14261  				cnt = ops->map_gen_lookup(map_ptr, insn_buf);
4a8f87e60f6db4 Daniel Borkmann    2020-10-11  14262  				if (cnt == -EOPNOTSUPP)
4a8f87e60f6db4 Daniel Borkmann    2020-10-11  14263  					goto patch_map_ops_generic;
4a8f87e60f6db4 Daniel Borkmann    2020-10-11  14264  				if (cnt <= 0 || cnt >= ARRAY_SIZE(insn_buf)) {
61bd5218eef349 Jakub Kicinski     2017-10-09  14265  					verbose(env, "bpf verifier is misconfigured\n");
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  14266  					return -EINVAL;
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  14267  				}
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  14268  
09772d92cd5ad9 Daniel Borkmann    2018-06-02  14269  				new_prog = bpf_patch_insn_data(env, i + delta,
09772d92cd5ad9 Daniel Borkmann    2018-06-02  14270  							       insn_buf, cnt);
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  14271  				if (!new_prog)
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  14272  					return -ENOMEM;
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  14273  
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  14274  				delta    += cnt - 1;
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  14275  				env->prog = prog = new_prog;
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  14276  				insn      = new_prog->insnsi + i + delta;
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  14277  				continue;
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  14278  			}
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  14279  
09772d92cd5ad9 Daniel Borkmann    2018-06-02  14280  			BUILD_BUG_ON(!__same_type(ops->map_lookup_elem,
09772d92cd5ad9 Daniel Borkmann    2018-06-02  14281  				     (void *(*)(struct bpf_map *map, void *key))NULL));
09772d92cd5ad9 Daniel Borkmann    2018-06-02  14282  			BUILD_BUG_ON(!__same_type(ops->map_delete_elem,
09772d92cd5ad9 Daniel Borkmann    2018-06-02  14283  				     (int (*)(struct bpf_map *map, void *key))NULL));
09772d92cd5ad9 Daniel Borkmann    2018-06-02  14284  			BUILD_BUG_ON(!__same_type(ops->map_update_elem,
09772d92cd5ad9 Daniel Borkmann    2018-06-02  14285  				     (int (*)(struct bpf_map *map, void *key, void *value,
09772d92cd5ad9 Daniel Borkmann    2018-06-02  14286  					      u64 flags))NULL));
84430d4232c36c Daniel Borkmann    2018-10-21  14287  			BUILD_BUG_ON(!__same_type(ops->map_push_elem,
84430d4232c36c Daniel Borkmann    2018-10-21  14288  				     (int (*)(struct bpf_map *map, void *value,
84430d4232c36c Daniel Borkmann    2018-10-21  14289  					      u64 flags))NULL));
84430d4232c36c Daniel Borkmann    2018-10-21  14290  			BUILD_BUG_ON(!__same_type(ops->map_pop_elem,
84430d4232c36c Daniel Borkmann    2018-10-21  14291  				     (int (*)(struct bpf_map *map, void *value))NULL));
84430d4232c36c Daniel Borkmann    2018-10-21  14292  			BUILD_BUG_ON(!__same_type(ops->map_peek_elem,
84430d4232c36c Daniel Borkmann    2018-10-21  14293  				     (int (*)(struct bpf_map *map, void *value))NULL));
e6a4750ffe9d70 Björn Töpel        2021-03-08  14294  			BUILD_BUG_ON(!__same_type(ops->map_redirect,
e6a4750ffe9d70 Björn Töpel        2021-03-08  14295  				     (int (*)(struct bpf_map *map, u32 ifindex, u64 flags))NULL));
0640c77c46cb84 Andrey Ignatov     2021-10-05  14296  			BUILD_BUG_ON(!__same_type(ops->map_for_each_callback,
0640c77c46cb84 Andrey Ignatov     2021-10-05  14297  				     (int (*)(struct bpf_map *map,
0640c77c46cb84 Andrey Ignatov     2021-10-05  14298  					      bpf_callback_t callback_fn,
0640c77c46cb84 Andrey Ignatov     2021-10-05  14299  					      void *callback_ctx,
0640c77c46cb84 Andrey Ignatov     2021-10-05  14300  					      u64 flags))NULL));
07343110b29345 Feng Zhou          2022-05-11  14301  			BUILD_BUG_ON(!__same_type(ops->map_lookup_percpu_elem,
07343110b29345 Feng Zhou          2022-05-11  14302  				     (void *(*)(struct bpf_map *map, void *key, u32 cpu))NULL));
e6a4750ffe9d70 Björn Töpel        2021-03-08  14303  
4a8f87e60f6db4 Daniel Borkmann    2020-10-11  14304  patch_map_ops_generic:
09772d92cd5ad9 Daniel Borkmann    2018-06-02  14305  			switch (insn->imm) {
09772d92cd5ad9 Daniel Borkmann    2018-06-02  14306  			case BPF_FUNC_map_lookup_elem:
3d717fad5081b8 Kees Cook          2021-09-28  14307  				insn->imm = BPF_CALL_IMM(ops->map_lookup_elem);
09772d92cd5ad9 Daniel Borkmann    2018-06-02  14308  				continue;
09772d92cd5ad9 Daniel Borkmann    2018-06-02  14309  			case BPF_FUNC_map_update_elem:
3d717fad5081b8 Kees Cook          2021-09-28  14310  				insn->imm = BPF_CALL_IMM(ops->map_update_elem);
09772d92cd5ad9 Daniel Borkmann    2018-06-02  14311  				continue;
09772d92cd5ad9 Daniel Borkmann    2018-06-02  14312  			case BPF_FUNC_map_delete_elem:
3d717fad5081b8 Kees Cook          2021-09-28  14313  				insn->imm = BPF_CALL_IMM(ops->map_delete_elem);
09772d92cd5ad9 Daniel Borkmann    2018-06-02  14314  				continue;
84430d4232c36c Daniel Borkmann    2018-10-21  14315  			case BPF_FUNC_map_push_elem:
3d717fad5081b8 Kees Cook          2021-09-28  14316  				insn->imm = BPF_CALL_IMM(ops->map_push_elem);
84430d4232c36c Daniel Borkmann    2018-10-21  14317  				continue;
84430d4232c36c Daniel Borkmann    2018-10-21  14318  			case BPF_FUNC_map_pop_elem:
3d717fad5081b8 Kees Cook          2021-09-28  14319  				insn->imm = BPF_CALL_IMM(ops->map_pop_elem);
84430d4232c36c Daniel Borkmann    2018-10-21  14320  				continue;
84430d4232c36c Daniel Borkmann    2018-10-21  14321  			case BPF_FUNC_map_peek_elem:
3d717fad5081b8 Kees Cook          2021-09-28  14322  				insn->imm = BPF_CALL_IMM(ops->map_peek_elem);
84430d4232c36c Daniel Borkmann    2018-10-21  14323  				continue;
e6a4750ffe9d70 Björn Töpel        2021-03-08  14324  			case BPF_FUNC_redirect_map:
3d717fad5081b8 Kees Cook          2021-09-28  14325  				insn->imm = BPF_CALL_IMM(ops->map_redirect);
e6a4750ffe9d70 Björn Töpel        2021-03-08  14326  				continue;
0640c77c46cb84 Andrey Ignatov     2021-10-05  14327  			case BPF_FUNC_for_each_map_elem:
0640c77c46cb84 Andrey Ignatov     2021-10-05  14328  				insn->imm = BPF_CALL_IMM(ops->map_for_each_callback);
e6a4750ffe9d70 Björn Töpel        2021-03-08  14329  				continue;
07343110b29345 Feng Zhou          2022-05-11  14330  			case BPF_FUNC_map_lookup_percpu_elem:
07343110b29345 Feng Zhou          2022-05-11  14331  				insn->imm = BPF_CALL_IMM(ops->map_lookup_percpu_elem);
07343110b29345 Feng Zhou          2022-05-11  14332  				continue;
09772d92cd5ad9 Daniel Borkmann    2018-06-02  14333  			}
09772d92cd5ad9 Daniel Borkmann    2018-06-02  14334  
09772d92cd5ad9 Daniel Borkmann    2018-06-02  14335  			goto patch_call_imm;
09772d92cd5ad9 Daniel Borkmann    2018-06-02  14336  		}
09772d92cd5ad9 Daniel Borkmann    2018-06-02  14337  
e6ac593372aada Brendan Jackman    2021-02-17  14338  		/* Implement bpf_jiffies64 inline. */
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  14339  		if (prog->jit_requested && BITS_PER_LONG == 64 &&
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  14340  		    insn->imm == BPF_FUNC_jiffies64) {
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  14341  			struct bpf_insn ld_jiffies_addr[2] = {
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  14342  				BPF_LD_IMM64(BPF_REG_0,
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  14343  					     (unsigned long)&jiffies),
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  14344  			};
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  14345  
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  14346  			insn_buf[0] = ld_jiffies_addr[0];
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  14347  			insn_buf[1] = ld_jiffies_addr[1];
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  14348  			insn_buf[2] = BPF_LDX_MEM(BPF_DW, BPF_REG_0,
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  14349  						  BPF_REG_0, 0);
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  14350  			cnt = 3;
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  14351  
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  14352  			new_prog = bpf_patch_insn_data(env, i + delta, insn_buf,
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  14353  						       cnt);
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  14354  			if (!new_prog)
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  14355  				return -ENOMEM;
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  14356  
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  14357  			delta    += cnt - 1;
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  14358  			env->prog = prog = new_prog;
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  14359  			insn      = new_prog->insnsi + i + delta;
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  14360  			continue;
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  14361  		}
5576b991e9c1a1 Martin KaFai Lau   2020-01-22  14362  
f92c1e183604c2 Jiri Olsa          2021-12-08  14363  		/* Implement bpf_get_func_arg inline. */
f92c1e183604c2 Jiri Olsa          2021-12-08  14364  		if (prog_type == BPF_PROG_TYPE_TRACING &&
f92c1e183604c2 Jiri Olsa          2021-12-08  14365  		    insn->imm == BPF_FUNC_get_func_arg) {
f92c1e183604c2 Jiri Olsa          2021-12-08  14366  			/* Load nr_args from ctx - 8 */
f92c1e183604c2 Jiri Olsa          2021-12-08  14367  			insn_buf[0] = BPF_LDX_MEM(BPF_DW, BPF_REG_0, BPF_REG_1, -8);
f92c1e183604c2 Jiri Olsa          2021-12-08  14368  			insn_buf[1] = BPF_JMP32_REG(BPF_JGE, BPF_REG_2, BPF_REG_0, 6);
f92c1e183604c2 Jiri Olsa          2021-12-08  14369  			insn_buf[2] = BPF_ALU64_IMM(BPF_LSH, BPF_REG_2, 3);
f92c1e183604c2 Jiri Olsa          2021-12-08  14370  			insn_buf[3] = BPF_ALU64_REG(BPF_ADD, BPF_REG_2, BPF_REG_1);
f92c1e183604c2 Jiri Olsa          2021-12-08  14371  			insn_buf[4] = BPF_LDX_MEM(BPF_DW, BPF_REG_0, BPF_REG_2, 0);
f92c1e183604c2 Jiri Olsa          2021-12-08  14372  			insn_buf[5] = BPF_STX_MEM(BPF_DW, BPF_REG_3, BPF_REG_0, 0);
f92c1e183604c2 Jiri Olsa          2021-12-08  14373  			insn_buf[6] = BPF_MOV64_IMM(BPF_REG_0, 0);
f92c1e183604c2 Jiri Olsa          2021-12-08  14374  			insn_buf[7] = BPF_JMP_A(1);
f92c1e183604c2 Jiri Olsa          2021-12-08  14375  			insn_buf[8] = BPF_MOV64_IMM(BPF_REG_0, -EINVAL);
f92c1e183604c2 Jiri Olsa          2021-12-08  14376  			cnt = 9;
f92c1e183604c2 Jiri Olsa          2021-12-08  14377  
f92c1e183604c2 Jiri Olsa          2021-12-08  14378  			new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
f92c1e183604c2 Jiri Olsa          2021-12-08  14379  			if (!new_prog)
f92c1e183604c2 Jiri Olsa          2021-12-08  14380  				return -ENOMEM;
f92c1e183604c2 Jiri Olsa          2021-12-08  14381  
f92c1e183604c2 Jiri Olsa          2021-12-08  14382  			delta    += cnt - 1;
f92c1e183604c2 Jiri Olsa          2021-12-08  14383  			env->prog = prog = new_prog;
f92c1e183604c2 Jiri Olsa          2021-12-08  14384  			insn      = new_prog->insnsi + i + delta;
f92c1e183604c2 Jiri Olsa          2021-12-08  14385  			continue;
f92c1e183604c2 Jiri Olsa          2021-12-08  14386  		}
f92c1e183604c2 Jiri Olsa          2021-12-08  14387  
f92c1e183604c2 Jiri Olsa          2021-12-08  14388  		/* Implement bpf_get_func_ret inline. */
f92c1e183604c2 Jiri Olsa          2021-12-08  14389  		if (prog_type == BPF_PROG_TYPE_TRACING &&
f92c1e183604c2 Jiri Olsa          2021-12-08  14390  		    insn->imm == BPF_FUNC_get_func_ret) {
f92c1e183604c2 Jiri Olsa          2021-12-08  14391  			if (eatype == BPF_TRACE_FEXIT ||
f92c1e183604c2 Jiri Olsa          2021-12-08  14392  			    eatype == BPF_MODIFY_RETURN) {
f92c1e183604c2 Jiri Olsa          2021-12-08  14393  				/* Load nr_args from ctx - 8 */
f92c1e183604c2 Jiri Olsa          2021-12-08  14394  				insn_buf[0] = BPF_LDX_MEM(BPF_DW, BPF_REG_0, BPF_REG_1, -8);
f92c1e183604c2 Jiri Olsa          2021-12-08  14395  				insn_buf[1] = BPF_ALU64_IMM(BPF_LSH, BPF_REG_0, 3);
f92c1e183604c2 Jiri Olsa          2021-12-08  14396  				insn_buf[2] = BPF_ALU64_REG(BPF_ADD, BPF_REG_0, BPF_REG_1);
f92c1e183604c2 Jiri Olsa          2021-12-08  14397  				insn_buf[3] = BPF_LDX_MEM(BPF_DW, BPF_REG_3, BPF_REG_0, 0);
f92c1e183604c2 Jiri Olsa          2021-12-08  14398  				insn_buf[4] = BPF_STX_MEM(BPF_DW, BPF_REG_2, BPF_REG_3, 0);
f92c1e183604c2 Jiri Olsa          2021-12-08  14399  				insn_buf[5] = BPF_MOV64_IMM(BPF_REG_0, 0);
f92c1e183604c2 Jiri Olsa          2021-12-08  14400  				cnt = 6;
f92c1e183604c2 Jiri Olsa          2021-12-08  14401  			} else {
f92c1e183604c2 Jiri Olsa          2021-12-08  14402  				insn_buf[0] = BPF_MOV64_IMM(BPF_REG_0, -EOPNOTSUPP);
f92c1e183604c2 Jiri Olsa          2021-12-08  14403  				cnt = 1;
f92c1e183604c2 Jiri Olsa          2021-12-08  14404  			}
f92c1e183604c2 Jiri Olsa          2021-12-08  14405  
f92c1e183604c2 Jiri Olsa          2021-12-08  14406  			new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
f92c1e183604c2 Jiri Olsa          2021-12-08  14407  			if (!new_prog)
f92c1e183604c2 Jiri Olsa          2021-12-08  14408  				return -ENOMEM;
f92c1e183604c2 Jiri Olsa          2021-12-08  14409  
f92c1e183604c2 Jiri Olsa          2021-12-08  14410  			delta    += cnt - 1;
f92c1e183604c2 Jiri Olsa          2021-12-08  14411  			env->prog = prog = new_prog;
f92c1e183604c2 Jiri Olsa          2021-12-08  14412  			insn      = new_prog->insnsi + i + delta;
f92c1e183604c2 Jiri Olsa          2021-12-08  14413  			continue;
f92c1e183604c2 Jiri Olsa          2021-12-08  14414  		}
f92c1e183604c2 Jiri Olsa          2021-12-08  14415  
f92c1e183604c2 Jiri Olsa          2021-12-08  14416  		/* Implement get_func_arg_cnt inline. */
f92c1e183604c2 Jiri Olsa          2021-12-08  14417  		if (prog_type == BPF_PROG_TYPE_TRACING &&
f92c1e183604c2 Jiri Olsa          2021-12-08  14418  		    insn->imm == BPF_FUNC_get_func_arg_cnt) {
f92c1e183604c2 Jiri Olsa          2021-12-08  14419  			/* Load nr_args from ctx - 8 */
f92c1e183604c2 Jiri Olsa          2021-12-08  14420  			insn_buf[0] = BPF_LDX_MEM(BPF_DW, BPF_REG_0, BPF_REG_1, -8);
f92c1e183604c2 Jiri Olsa          2021-12-08  14421  
f92c1e183604c2 Jiri Olsa          2021-12-08  14422  			new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, 1);
f92c1e183604c2 Jiri Olsa          2021-12-08  14423  			if (!new_prog)
f92c1e183604c2 Jiri Olsa          2021-12-08  14424  				return -ENOMEM;
f92c1e183604c2 Jiri Olsa          2021-12-08  14425  
f92c1e183604c2 Jiri Olsa          2021-12-08  14426  			env->prog = prog = new_prog;
f92c1e183604c2 Jiri Olsa          2021-12-08  14427  			insn      = new_prog->insnsi + i + delta;
f92c1e183604c2 Jiri Olsa          2021-12-08  14428  			continue;
f92c1e183604c2 Jiri Olsa          2021-12-08  14429  		}
f92c1e183604c2 Jiri Olsa          2021-12-08  14430  
f705ec764b3432 Jiri Olsa          2022-03-21  14431  		/* Implement bpf_get_func_ip inline. */
9b99edcae5c80c Jiri Olsa          2021-07-14  14432  		if (prog_type == BPF_PROG_TYPE_TRACING &&
9b99edcae5c80c Jiri Olsa          2021-07-14  14433  		    insn->imm == BPF_FUNC_get_func_ip) {
f92c1e183604c2 Jiri Olsa          2021-12-08  14434  			/* Load IP address from ctx - 16 */
f92c1e183604c2 Jiri Olsa          2021-12-08  14435  			insn_buf[0] = BPF_LDX_MEM(BPF_DW, BPF_REG_0, BPF_REG_1, -16);
9b99edcae5c80c Jiri Olsa          2021-07-14  14436  
9b99edcae5c80c Jiri Olsa          2021-07-14  14437  			new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, 1);
9b99edcae5c80c Jiri Olsa          2021-07-14  14438  			if (!new_prog)
9b99edcae5c80c Jiri Olsa          2021-07-14  14439  				return -ENOMEM;
9b99edcae5c80c Jiri Olsa          2021-07-14  14440  
9b99edcae5c80c Jiri Olsa          2021-07-14  14441  			env->prog = prog = new_prog;
9b99edcae5c80c Jiri Olsa          2021-07-14  14442  			insn      = new_prog->insnsi + i + delta;
9b99edcae5c80c Jiri Olsa          2021-07-14  14443  			continue;
9b99edcae5c80c Jiri Olsa          2021-07-14  14444  		}
9b99edcae5c80c Jiri Olsa          2021-07-14  14445  
81ed18ab3098b6 Alexei Starovoitov 2017-03-15  14446  patch_call_imm:
5e43f899b03a34 Andrey Ignatov     2018-03-30  14447  		fn = env->ops->get_func_proto(insn->imm, env->prog);
e245c5c6a5656e Alexei Starovoitov 2017-03-15  14448  		/* all functions that have prototype and verifier allowed
e245c5c6a5656e Alexei Starovoitov 2017-03-15  14449  		 * programs to call them, must be real in-kernel functions
e245c5c6a5656e Alexei Starovoitov 2017-03-15  14450  		 */
79741b3bdec01a Alexei Starovoitov 2017-03-15  14451  		if (!fn->func) {
61bd5218eef349 Jakub Kicinski     2017-10-09  14452  			verbose(env,
61bd5218eef349 Jakub Kicinski     2017-10-09  14453  				"kernel subsystem misconfigured func %s#%d\n",
79741b3bdec01a Alexei Starovoitov 2017-03-15  14454  				func_id_name(insn->imm), insn->imm);
79741b3bdec01a Alexei Starovoitov 2017-03-15  14455  			return -EFAULT;
e245c5c6a5656e Alexei Starovoitov 2017-03-15  14456  		}
79741b3bdec01a Alexei Starovoitov 2017-03-15  14457  		insn->imm = fn->func - __bpf_call_base;
e245c5c6a5656e Alexei Starovoitov 2017-03-15  14458  	}
e245c5c6a5656e Alexei Starovoitov 2017-03-15  14459  
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  14460  	/* Since poke tab is now finalized, publish aux to tracker. */
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  14461  	for (i = 0; i < prog->aux->size_poke_tab; i++) {
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  14462  		map_ptr = prog->aux->poke_tab[i].tail_call.map;
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  14463  		if (!map_ptr->ops->map_poke_track ||
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  14464  		    !map_ptr->ops->map_poke_untrack ||
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  14465  		    !map_ptr->ops->map_poke_run) {
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  14466  			verbose(env, "bpf verifier is misconfigured\n");
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  14467  			return -EINVAL;
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  14468  		}
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  14469  
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  14470  		ret = map_ptr->ops->map_poke_track(map_ptr, prog->aux);
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  14471  		if (ret < 0) {
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  14472  			verbose(env, "tracking tail call prog failed\n");
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  14473  			return ret;
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  14474  		}
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  14475  	}
d2e4c1e6c29472 Daniel Borkmann    2019-11-22  14476  
e6ac2450d6dee3 Martin KaFai Lau   2021-03-24  14477  	sort_kfunc_descs_by_imm(env->prog);
e6ac2450d6dee3 Martin KaFai Lau   2021-03-24  14478  
79741b3bdec01a Alexei Starovoitov 2017-03-15  14479  	return 0;
79741b3bdec01a Alexei Starovoitov 2017-03-15  14480  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

