Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E05187872
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Dec 2024 11:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733915990; cv=none; b=mAEC0FmbEX4Mg/XlE+EIH/YrTRwnvhj5+ZIJGB01lBIIg8jM4q7vI46VnSc7zt+mwEuWUQpfF2gYbxGX71g8ECl1aHG2Fwzljo8YcSq0LTBmZ0Ce9NR9UYaQTEsJnp/6GuTLlq24Blm2cXmlXFPdft+QMj87c3mZ5R/HaWQgXCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733915990; c=relaxed/simple;
	bh=llL5moX2KHW/2uRXH4i/uDRDdwusbGBqMi0xZB7sRO8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jbIPkhoAlrH0MvgNQ9cLzrS4XEtHHqIFQdeehqMyV9wLxyqehLw4OsFUhiXmqZRAu4ZIwN7pl7sazogStzE5bM2Dt61wgaUTRKPwMpKj3p9fW6NT8QULyv/87sJnzCXQhsfu4VCDDQR3305YtGzMDNv52QpmbmouN1zjLlF/a8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hVYyjiOq; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hVYyjiOq"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-434a742481aso57088685e9.3
        for <oe-kbuild@lists.linux.dev>; Wed, 11 Dec 2024 03:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733915985; x=1734520785; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1A1dVjoRY77904gapHqEsiXi2lpddJRpqr9FUQAz+U=;
        b=hVYyjiOq2HRSnCy0a0x80d3zshoPg1CSYjxOB+ujL0p/Nb9uwhxvDJNeZC/PjUNaY5
         F/VLmuTMrqVRAVrSXxFL070/hMmfKN/y4EgIdzbUefCfUchTKXAT5/7dr25/5Pv5FYFf
         eif+trnbPJfYwSZuOFBC18ohm8E7iRzcForA8Vra7KXtp+1XIIz6mbkrZUDqYdOgNUyw
         S/CDPna8yvfEIEoIDXn8N/pyv1cNqxtC8/Eu2WpZze3nzPcr1q1e97FtEyHZHr8f6HaP
         rQtcoavlvmvO9DD8X0rRjxZmaj0qMFORlt9ubYWPuIETXKLxpXuZV2h1JzRf6j4fUlh4
         nJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733915985; x=1734520785;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j1A1dVjoRY77904gapHqEsiXi2lpddJRpqr9FUQAz+U=;
        b=LiRgFR3UQduzBmjPfpSuJ9ZzO/4/23U+vSXmAQLO6K0lHFHx4bXQ6Ik9irxmmbdn8T
         45l+Ss1gV9ajQnVbB3htG+dPT9d6FgbYSz08ZMdEzx6iRsSLxOd20h9i0uCVNx7rCMwi
         np34GaXQoCEGYyulEvZO6ogN7kh0A9SzlYVgFps4CV1XawqDWGojS0GqYFza9httU8nZ
         w+NePxFuq4hQG0As09jUV8oIrqgDSE1xlYEaNV6VU05DRLHl0kqXRBjZFKrSf6LxQgpT
         Pa5NP1blVl+NMN0E0Ue4Z34ro9zz/BRFUZAiF5Xf5zjeoQOgsOoBsS6xzii9RGRuhVQD
         yjHA==
X-Gm-Message-State: AOJu0Yw6EHDOL3QRKSq7JfZWQb+CW1lT0rWV+EEJ9YkuRhlk4yQU7oCo
	mbE9iCq5u+7ibY4yiGq1xkkf2kpgFl+nM9abNf6Av24HSKY8STHFQi3COPca88ki8UrYTRiI7UP
	7
X-Gm-Gg: ASbGncuDfYV10kW5mSCcup9630kW8Sbq1bTWJKLRo3YjOzHd4b9Qpee48LL7CEuqrfo
	l3TB7Nb3bh6htRxV/H54ztezLxuRHEJRw+AxCY5Jjmg2PpIMTFtYeb3SMd6gL+nRNv4hVg0vWLt
	1qEGyH+M9go/FidAMml2kXj0Li57lEi/O6ELPJVXm/sG9SfDU4WtRZtpnAQgR7qq5TOZY56TvPs
	RygpeChIPrfV8KCU7q3BQakpdGp/F+nDS6jG+g1VbtWitrZKBEV9d0rvQg=
X-Google-Smtp-Source: AGHT+IFP+aS2ClpF97EDzKTojdZ/hl9L3cPsB1kFHpBoO+gM/gTEXUGkcMGYBlD5G06OE1m/VfsNvw==
X-Received: by 2002:a05:600c:3108:b0:434:f953:eed with SMTP id 5b1f17b1804b1-4361c4406bdmr20145565e9.30.1733915985287;
        Wed, 11 Dec 2024 03:19:45 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38782527520sm1035110f8f.109.2024.12.11.03.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 03:19:44 -0800 (PST)
Date: Wed, 11 Dec 2024 14:19:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Eduard Zingerman <eddyz87@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Alexei Starovoitov <ast@kernel.org>
Subject: [linux-next:master 2974/3192] kernel/bpf/verifier.c:22231
 bpf_check_attach_target() error: we previously assumed 'aux->func' could be
 null (see line 22212)
Message-ID: <7de4b716-f0de-4cad-8cd9-3d6b0862644b@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   91e71d606356e50f238d7a87aacdee4abc427f07
commit: 81f6d0530ba031b5f038a091619bf2ff29568852 [2974/3192] bpf: check changes_pkt_data property for extension programs
config: i386-randconfig-141-20241211 (https://download.01.org/0day-ci/archive/20241211/202412111822.qGw6tOyB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412111822.qGw6tOyB-lkp@intel.com/

smatch warnings:
kernel/bpf/verifier.c:22231 bpf_check_attach_target() error: we previously assumed 'aux->func' could be null (see line 22212)

vim +22231 kernel/bpf/verifier.c

f7b12b6fea00988 Toke Høiland-Jørgensen  2020-09-25  22155  int bpf_check_attach_target(struct bpf_verifier_log *log,
f7b12b6fea00988 Toke Høiland-Jørgensen  2020-09-25  22156  			    const struct bpf_prog *prog,
f7b12b6fea00988 Toke Høiland-Jørgensen  2020-09-25  22157  			    const struct bpf_prog *tgt_prog,
f7b12b6fea00988 Toke Høiland-Jørgensen  2020-09-25  22158  			    u32 btf_id,
f7b12b6fea00988 Toke Høiland-Jørgensen  2020-09-25  22159  			    struct bpf_attach_target_info *tgt_info)
382072916044015 Martin KaFai Lau        2019-10-24  22160  {
be8704ff07d2374 Alexei Starovoitov      2020-01-20  22161  	bool prog_extension = prog->type == BPF_PROG_TYPE_EXT;
19bfcdf9498aa96 Dmitrii Dolgov          2024-01-03  22162  	bool prog_tracing = prog->type == BPF_PROG_TYPE_TRACING;
8aeaed21befc90f Philo Lu                2024-09-11  22163  	char trace_symbol[KSYM_SYMBOL_LEN];
f1b9509c2fb0ef4 Alexei Starovoitov      2019-10-30  22164  	const char prefix[] = "btf_trace_";
8aeaed21befc90f Philo Lu                2024-09-11  22165  	struct bpf_raw_event_map *btp;
5b92a28aae4dd0f Alexei Starovoitov      2019-11-14  22166  	int ret = 0, subprog = -1, i;
382072916044015 Martin KaFai Lau        2019-10-24  22167  	const struct btf_type *t;
5b92a28aae4dd0f Alexei Starovoitov      2019-11-14  22168  	bool conservative = true;
8aeaed21befc90f Philo Lu                2024-09-11  22169  	const char *tname, *fname;
5b92a28aae4dd0f Alexei Starovoitov      2019-11-14  22170  	struct btf *btf;
f7b12b6fea00988 Toke Høiland-Jørgensen  2020-09-25  22171  	long addr = 0;
31bf1dbccfb0a98 Viktor Malik            2023-03-10  22172  	struct module *mod = NULL;
382072916044015 Martin KaFai Lau        2019-10-24  22173  
f1b9509c2fb0ef4 Alexei Starovoitov      2019-10-30  22174  	if (!btf_id) {
efc68158c429f37 Toke Høiland-Jørgensen  2020-09-25  22175  		bpf_log(log, "Tracing programs must provide btf_id\n");
f1b9509c2fb0ef4 Alexei Starovoitov      2019-10-30  22176  		return -EINVAL;
f1b9509c2fb0ef4 Alexei Starovoitov      2019-10-30  22177  	}
22dc4a0f5ed11b6 Andrii Nakryiko         2020-12-03  22178  	btf = tgt_prog ? tgt_prog->aux->btf : prog->aux->attach_btf;
5b92a28aae4dd0f Alexei Starovoitov      2019-11-14  22179  	if (!btf) {
efc68158c429f37 Toke Høiland-Jørgensen  2020-09-25  22180  		bpf_log(log,
5b92a28aae4dd0f Alexei Starovoitov      2019-11-14  22181  			"FENTRY/FEXIT program can only be attached to another program annotated with BTF\n");
5b92a28aae4dd0f Alexei Starovoitov      2019-11-14  22182  		return -EINVAL;
5b92a28aae4dd0f Alexei Starovoitov      2019-11-14  22183  	}
5b92a28aae4dd0f Alexei Starovoitov      2019-11-14  22184  	t = btf_type_by_id(btf, btf_id);
382072916044015 Martin KaFai Lau        2019-10-24  22185  	if (!t) {
efc68158c429f37 Toke Høiland-Jørgensen  2020-09-25  22186  		bpf_log(log, "attach_btf_id %u is invalid\n", btf_id);
382072916044015 Martin KaFai Lau        2019-10-24  22187  		return -EINVAL;
382072916044015 Martin KaFai Lau        2019-10-24  22188  	}
5b92a28aae4dd0f Alexei Starovoitov      2019-11-14  22189  	tname = btf_name_by_offset(btf, t->name_off);
f1b9509c2fb0ef4 Alexei Starovoitov      2019-10-30  22190  	if (!tname) {
efc68158c429f37 Toke Høiland-Jørgensen  2020-09-25  22191  		bpf_log(log, "attach_btf_id %u doesn't have a name\n", btf_id);
f1b9509c2fb0ef4 Alexei Starovoitov      2019-10-30  22192  		return -EINVAL;
f1b9509c2fb0ef4 Alexei Starovoitov      2019-10-30  22193  	}
5b92a28aae4dd0f Alexei Starovoitov      2019-11-14  22194  	if (tgt_prog) {
5b92a28aae4dd0f Alexei Starovoitov      2019-11-14  22195  		struct bpf_prog_aux *aux = tgt_prog->aux;
5b92a28aae4dd0f Alexei Starovoitov      2019-11-14  22196  
fd7c211d6875013 Toke Høiland-Jørgensen  2023-01-19  22197  		if (bpf_prog_is_dev_bound(prog->aux) &&
fd7c211d6875013 Toke Høiland-Jørgensen  2023-01-19  22198  		    !bpf_prog_dev_bound_match(prog, tgt_prog)) {
fd7c211d6875013 Toke Høiland-Jørgensen  2023-01-19  22199  			bpf_log(log, "Target program bound device mismatch");
3d76a4d3d4e591a Stanislav Fomichev      2023-01-19  22200  			return -EINVAL;
3d76a4d3d4e591a Stanislav Fomichev      2023-01-19  22201  		}
3d76a4d3d4e591a Stanislav Fomichev      2023-01-19  22202  
5b92a28aae4dd0f Alexei Starovoitov      2019-11-14  22203  		for (i = 0; i < aux->func_info_cnt; i++)
5b92a28aae4dd0f Alexei Starovoitov      2019-11-14  22204  			if (aux->func_info[i].type_id == btf_id) {
5b92a28aae4dd0f Alexei Starovoitov      2019-11-14  22205  				subprog = i;
5b92a28aae4dd0f Alexei Starovoitov      2019-11-14  22206  				break;
5b92a28aae4dd0f Alexei Starovoitov      2019-11-14  22207  			}
5b92a28aae4dd0f Alexei Starovoitov      2019-11-14  22208  		if (subprog == -1) {
efc68158c429f37 Toke Høiland-Jørgensen  2020-09-25  22209  			bpf_log(log, "Subprog %s doesn't exist\n", tname);
5b92a28aae4dd0f Alexei Starovoitov      2019-11-14  22210  			return -EINVAL;
5b92a28aae4dd0f Alexei Starovoitov      2019-11-14  22211  		}
fd548e1a4618500 Kumar Kartikeya Dwivedi 2023-09-13 @22212  		if (aux->func && aux->func[subprog]->aux->exception_cb) {
                                                                            ^^^^^^^^^
This code assumes "aux->func" can be NULL

fd548e1a4618500 Kumar Kartikeya Dwivedi 2023-09-13  22213  			bpf_log(log,
fd548e1a4618500 Kumar Kartikeya Dwivedi 2023-09-13  22214  				"%s programs cannot attach to exception callback\n",
fd548e1a4618500 Kumar Kartikeya Dwivedi 2023-09-13  22215  				prog_extension ? "Extension" : "FENTRY/FEXIT");
fd548e1a4618500 Kumar Kartikeya Dwivedi 2023-09-13  22216  			return -EINVAL;
fd548e1a4618500 Kumar Kartikeya Dwivedi 2023-09-13  22217  		}
5b92a28aae4dd0f Alexei Starovoitov      2019-11-14  22218  		conservative = aux->func_info_aux[subprog].unreliable;
be8704ff07d2374 Alexei Starovoitov      2020-01-20  22219  		if (prog_extension) {
be8704ff07d2374 Alexei Starovoitov      2020-01-20  22220  			if (conservative) {
efc68158c429f37 Toke Høiland-Jørgensen  2020-09-25  22221  				bpf_log(log,
be8704ff07d2374 Alexei Starovoitov      2020-01-20  22222  					"Cannot replace static functions\n");
be8704ff07d2374 Alexei Starovoitov      2020-01-20  22223  				return -EINVAL;
be8704ff07d2374 Alexei Starovoitov      2020-01-20  22224  			}
be8704ff07d2374 Alexei Starovoitov      2020-01-20  22225  			if (!prog->jit_requested) {
efc68158c429f37 Toke Høiland-Jørgensen  2020-09-25  22226  				bpf_log(log,
be8704ff07d2374 Alexei Starovoitov      2020-01-20  22227  					"Extension programs should be JITed\n");
be8704ff07d2374 Alexei Starovoitov      2020-01-20  22228  				return -EINVAL;
be8704ff07d2374 Alexei Starovoitov      2020-01-20  22229  			}
81f6d0530ba031b Eduard Zingerman        2024-12-09  22230  			if (prog->aux->changes_pkt_data &&
81f6d0530ba031b Eduard Zingerman        2024-12-09 @22231  			    !aux->func[subprog]->aux->changes_pkt_data) {
                                                                                     ^^^^^^^^^
But this code does an unchecked dereference

81f6d0530ba031b Eduard Zingerman        2024-12-09  22232  				bpf_log(log,
81f6d0530ba031b Eduard Zingerman        2024-12-09  22233  					"Extension program changes packet data, while original does not\n");
81f6d0530ba031b Eduard Zingerman        2024-12-09  22234  				return -EINVAL;
81f6d0530ba031b Eduard Zingerman        2024-12-09  22235  			}
be8704ff07d2374 Alexei Starovoitov      2020-01-20  22236  		}
be8704ff07d2374 Alexei Starovoitov      2020-01-20  22237  		if (!tgt_prog->jited) {
efc68158c429f37 Toke Høiland-Jørgensen  2020-09-25  22238  			bpf_log(log, "Can attach to only JITed progs\n");
be8704ff07d2374 Alexei Starovoitov      2020-01-20  22239  			return -EINVAL;
be8704ff07d2374 Alexei Starovoitov      2020-01-20  22240  		}
19bfcdf9498aa96 Dmitrii Dolgov          2024-01-03  22241  		if (prog_tracing) {
19bfcdf9498aa96 Dmitrii Dolgov          2024-01-03  22242  			if (aux->attach_tracing_prog) {
19bfcdf9498aa96 Dmitrii Dolgov          2024-01-03  22243  				/*
19bfcdf9498aa96 Dmitrii Dolgov          2024-01-03  22244  				 * Target program is an fentry/fexit which is already attached
19bfcdf9498aa96 Dmitrii Dolgov          2024-01-03  22245  				 * to another tracing program. More levels of nesting
19bfcdf9498aa96 Dmitrii Dolgov          2024-01-03  22246  				 * attachment are not allowed.
19bfcdf9498aa96 Dmitrii Dolgov          2024-01-03  22247  				 */
19bfcdf9498aa96 Dmitrii Dolgov          2024-01-03  22248  				bpf_log(log, "Cannot nest tracing program attach more than once\n");
19bfcdf9498aa96 Dmitrii Dolgov          2024-01-03  22249  				return -EINVAL;
19bfcdf9498aa96 Dmitrii Dolgov          2024-01-03  22250  			}
19bfcdf9498aa96 Dmitrii Dolgov          2024-01-03  22251  		} else if (tgt_prog->type == prog->type) {
19bfcdf9498aa96 Dmitrii Dolgov          2024-01-03  22252  			/*
19bfcdf9498aa96 Dmitrii Dolgov          2024-01-03  22253  			 * To avoid potential call chain cycles, prevent attaching of a
19bfcdf9498aa96 Dmitrii Dolgov          2024-01-03  22254  			 * program extension to another extension. It's ok to attach
19bfcdf9498aa96 Dmitrii Dolgov          2024-01-03  22255  			 * fentry/fexit to extension program.
be8704ff07d2374 Alexei Starovoitov      2020-01-20  22256  			 */
efc68158c429f37 Toke Høiland-Jørgensen  2020-09-25  22257  			bpf_log(log, "Cannot recursively attach\n");
be8704ff07d2374 Alexei Starovoitov      2020-01-20  22258  			return -EINVAL;
be8704ff07d2374 Alexei Starovoitov      2020-01-20  22259  		}
be8704ff07d2374 Alexei Starovoitov      2020-01-20  22260  		if (tgt_prog->type == BPF_PROG_TYPE_TRACING &&
be8704ff07d2374 Alexei Starovoitov      2020-01-20  22261  		    prog_extension &&
be8704ff07d2374 Alexei Starovoitov      2020-01-20  22262  		    (tgt_prog->expected_attach_type == BPF_TRACE_FENTRY ||
be8704ff07d2374 Alexei Starovoitov      2020-01-20  22263  		     tgt_prog->expected_attach_type == BPF_TRACE_FEXIT)) {
be8704ff07d2374 Alexei Starovoitov      2020-01-20  22264  			/* Program extensions can extend all program types
be8704ff07d2374 Alexei Starovoitov      2020-01-20  22265  			 * except fentry/fexit. The reason is the following.
be8704ff07d2374 Alexei Starovoitov      2020-01-20  22266  			 * The fentry/fexit programs are used for performance
be8704ff07d2374 Alexei Starovoitov      2020-01-20  22267  			 * analysis, stats and can be attached to any program
19bfcdf9498aa96 Dmitrii Dolgov          2024-01-03  22268  			 * type. When extension program is replacing XDP function
19bfcdf9498aa96 Dmitrii Dolgov          2024-01-03  22269  			 * it is necessary to allow performance analysis of all
19bfcdf9498aa96 Dmitrii Dolgov          2024-01-03  22270  			 * functions. Both original XDP program and its program
19bfcdf9498aa96 Dmitrii Dolgov          2024-01-03  22271  			 * extension. Hence attaching fentry/fexit to
19bfcdf9498aa96 Dmitrii Dolgov          2024-01-03  22272  			 * BPF_PROG_TYPE_EXT is allowed. If extending of
19bfcdf9498aa96 Dmitrii Dolgov          2024-01-03  22273  			 * fentry/fexit was allowed it would be possible to create
19bfcdf9498aa96 Dmitrii Dolgov          2024-01-03  22274  			 * long call chain fentry->extension->fentry->extension
19bfcdf9498aa96 Dmitrii Dolgov          2024-01-03  22275  			 * beyond reasonable stack size. Hence extending fentry
19bfcdf9498aa96 Dmitrii Dolgov          2024-01-03  22276  			 * is not allowed.
be8704ff07d2374 Alexei Starovoitov      2020-01-20  22277  			 */
efc68158c429f37 Toke Høiland-Jørgensen  2020-09-25  22278  			bpf_log(log, "Cannot extend fentry/fexit\n");
be8704ff07d2374 Alexei Starovoitov      2020-01-20  22279  			return -EINVAL;
be8704ff07d2374 Alexei Starovoitov      2020-01-20  22280  		}
5b92a28aae4dd0f Alexei Starovoitov      2019-11-14  22281  	} else {
be8704ff07d2374 Alexei Starovoitov      2020-01-20  22282  		if (prog_extension) {
efc68158c429f37 Toke Høiland-Jørgensen  2020-09-25  22283  			bpf_log(log, "Cannot replace kernel functions\n");
be8704ff07d2374 Alexei Starovoitov      2020-01-20  22284  			return -EINVAL;
be8704ff07d2374 Alexei Starovoitov      2020-01-20  22285  		}
5b92a28aae4dd0f Alexei Starovoitov      2019-11-14  22286  	}
f1b9509c2fb0ef4 Alexei Starovoitov      2019-10-30  22287  
f1b9509c2fb0ef4 Alexei Starovoitov      2019-10-30  22288  	switch (prog->expected_attach_type) {
f1b9509c2fb0ef4 Alexei Starovoitov      2019-10-30  22289  	case BPF_TRACE_RAW_TP:
5b92a28aae4dd0f Alexei Starovoitov      2019-11-14  22290  		if (tgt_prog) {
efc68158c429f37 Toke Høiland-Jørgensen  2020-09-25  22291  			bpf_log(log,
5b92a28aae4dd0f Alexei Starovoitov      2019-11-14  22292  				"Only FENTRY/FEXIT progs are attachable to another BPF prog\n");
5b92a28aae4dd0f Alexei Starovoitov      2019-11-14  22293  			return -EINVAL;
5b92a28aae4dd0f Alexei Starovoitov      2019-11-14  22294  		}
382072916044015 Martin KaFai Lau        2019-10-24  22295  		if (!btf_type_is_typedef(t)) {
efc68158c429f37 Toke Høiland-Jørgensen  2020-09-25  22296  			bpf_log(log, "attach_btf_id %u is not a typedef\n",
382072916044015 Martin KaFai Lau        2019-10-24  22297  				btf_id);
382072916044015 Martin KaFai Lau        2019-10-24  22298  			return -EINVAL;
382072916044015 Martin KaFai Lau        2019-10-24  22299  		}
f1b9509c2fb0ef4 Alexei Starovoitov      2019-10-30  22300  		if (strncmp(prefix, tname, sizeof(prefix) - 1)) {
efc68158c429f37 Toke Høiland-Jørgensen  2020-09-25  22301  			bpf_log(log, "attach_btf_id %u points to wrong type name %s\n",
382072916044015 Martin KaFai Lau        2019-10-24  22302  				btf_id, tname);
382072916044015 Martin KaFai Lau        2019-10-24  22303  			return -EINVAL;
382072916044015 Martin KaFai Lau        2019-10-24  22304  		}
382072916044015 Martin KaFai Lau        2019-10-24  22305  		tname += sizeof(prefix) - 1;
8aeaed21befc90f Philo Lu                2024-09-11  22306  
8aeaed21befc90f Philo Lu                2024-09-11  22307  		/* The func_proto of "btf_trace_##tname" is generated from typedef without argument
8aeaed21befc90f Philo Lu                2024-09-11  22308  		 * names. Thus using bpf_raw_event_map to get argument names.
8aeaed21befc90f Philo Lu                2024-09-11  22309  		 */
8aeaed21befc90f Philo Lu                2024-09-11  22310  		btp = bpf_get_raw_tracepoint(tname);
8aeaed21befc90f Philo Lu                2024-09-11  22311  		if (!btp)
8aeaed21befc90f Philo Lu                2024-09-11  22312  			return -EINVAL;
8aeaed21befc90f Philo Lu                2024-09-11  22313  		fname = kallsyms_lookup((unsigned long)btp->bpf_func, NULL, NULL, NULL,
8aeaed21befc90f Philo Lu                2024-09-11  22314  					trace_symbol);
8aeaed21befc90f Philo Lu                2024-09-11  22315  		bpf_put_raw_tracepoint(btp);
8aeaed21befc90f Philo Lu                2024-09-11  22316  
8aeaed21befc90f Philo Lu                2024-09-11  22317  		if (fname)
8aeaed21befc90f Philo Lu                2024-09-11  22318  			ret = btf_find_by_name_kind(btf, fname, BTF_KIND_FUNC);
8aeaed21befc90f Philo Lu                2024-09-11  22319  
8aeaed21befc90f Philo Lu                2024-09-11  22320  		if (!fname || ret < 0) {
8aeaed21befc90f Philo Lu                2024-09-11  22321  			bpf_log(log, "Cannot find btf of tracepoint template, fall back to %s%s.\n",
8aeaed21befc90f Philo Lu                2024-09-11  22322  				prefix, tname);
5b92a28aae4dd0f Alexei Starovoitov      2019-11-14  22323  			t = btf_type_by_id(btf, t->type);
382072916044015 Martin KaFai Lau        2019-10-24  22324  			if (!btf_type_is_ptr(t))
382072916044015 Martin KaFai Lau        2019-10-24  22325  				/* should never happen in valid vmlinux build */
382072916044015 Martin KaFai Lau        2019-10-24  22326  				return -EINVAL;
8aeaed21befc90f Philo Lu                2024-09-11  22327  		} else {
8aeaed21befc90f Philo Lu                2024-09-11  22328  			t = btf_type_by_id(btf, ret);
8aeaed21befc90f Philo Lu                2024-09-11  22329  			if (!btf_type_is_func(t))
8aeaed21befc90f Philo Lu                2024-09-11  22330  				/* should never happen in valid vmlinux build */
8aeaed21befc90f Philo Lu                2024-09-11  22331  				return -EINVAL;
8aeaed21befc90f Philo Lu                2024-09-11  22332  		}
8aeaed21befc90f Philo Lu                2024-09-11  22333  
5b92a28aae4dd0f Alexei Starovoitov      2019-11-14  22334  		t = btf_type_by_id(btf, t->type);
382072916044015 Martin KaFai Lau        2019-10-24  22335  		if (!btf_type_is_func_proto(t))
382072916044015 Martin KaFai Lau        2019-10-24  22336  			/* should never happen in valid vmlinux build */
382072916044015 Martin KaFai Lau        2019-10-24  22337  			return -EINVAL;
382072916044015 Martin KaFai Lau        2019-10-24  22338  
f7b12b6fea00988 Toke Høiland-Jørgensen  2020-09-25  22339  		break;
15d83c4d7cef5c0 Yonghong Song           2020-05-09  22340  	case BPF_TRACE_ITER:
15d83c4d7cef5c0 Yonghong Song           2020-05-09  22341  		if (!btf_type_is_func(t)) {
efc68158c429f37 Toke Høiland-Jørgensen  2020-09-25  22342  			bpf_log(log, "attach_btf_id %u is not a function\n",
15d83c4d7cef5c0 Yonghong Song           2020-05-09  22343  				btf_id);
15d83c4d7cef5c0 Yonghong Song           2020-05-09  22344  			return -EINVAL;
15d83c4d7cef5c0 Yonghong Song           2020-05-09  22345  		}
15d83c4d7cef5c0 Yonghong Song           2020-05-09  22346  		t = btf_type_by_id(btf, t->type);
15d83c4d7cef5c0 Yonghong Song           2020-05-09  22347  		if (!btf_type_is_func_proto(t))
15d83c4d7cef5c0 Yonghong Song           2020-05-09  22348  			return -EINVAL;
f7b12b6fea00988 Toke Høiland-Jørgensen  2020-09-25  22349  		ret = btf_distill_func_proto(log, btf, t, tname, &tgt_info->fmodel);
f7b12b6fea00988 Toke Høiland-Jørgensen  2020-09-25  22350  		if (ret)
15d83c4d7cef5c0 Yonghong Song           2020-05-09  22351  			return ret;
f7b12b6fea00988 Toke Høiland-Jørgensen  2020-09-25  22352  		break;
be8704ff07d2374 Alexei Starovoitov      2020-01-20  22353  	default:
be8704ff07d2374 Alexei Starovoitov      2020-01-20  22354  		if (!prog_extension)
be8704ff07d2374 Alexei Starovoitov      2020-01-20  22355  			return -EINVAL;
df561f6688fef77 Gustavo A. R. Silva     2020-08-23  22356  		fallthrough;
ae24082331d9bba KP Singh                2020-03-04  22357  	case BPF_MODIFY_RETURN:
9e4e01dfd3254c7 KP Singh                2020-03-29  22358  	case BPF_LSM_MAC:
69fd337a975c7e6 Stanislav Fomichev      2022-06-28  22359  	case BPF_LSM_CGROUP:
fec56f5890d93fc Alexei Starovoitov      2019-11-14  22360  	case BPF_TRACE_FENTRY:
fec56f5890d93fc Alexei Starovoitov      2019-11-14  22361  	case BPF_TRACE_FEXIT:
fec56f5890d93fc Alexei Starovoitov      2019-11-14  22362  		if (!btf_type_is_func(t)) {
efc68158c429f37 Toke Høiland-Jørgensen  2020-09-25  22363  			bpf_log(log, "attach_btf_id %u is not a function\n",
fec56f5890d93fc Alexei Starovoitov      2019-11-14  22364  				btf_id);
fec56f5890d93fc Alexei Starovoitov      2019-11-14  22365  			return -EINVAL;
fec56f5890d93fc Alexei Starovoitov      2019-11-14  22366  		}
be8704ff07d2374 Alexei Starovoitov      2020-01-20  22367  		if (prog_extension &&
efc68158c429f37 Toke Høiland-Jørgensen  2020-09-25  22368  		    btf_check_type_match(log, prog, btf, t))
be8704ff07d2374 Alexei Starovoitov      2020-01-20  22369  			return -EINVAL;
5b92a28aae4dd0f Alexei Starovoitov      2019-11-14  22370  		t = btf_type_by_id(btf, t->type);
fec56f5890d93fc Alexei Starovoitov      2019-11-14  22371  		if (!btf_type_is_func_proto(t))
fec56f5890d93fc Alexei Starovoitov      2019-11-14  22372  			return -EINVAL;
f7b12b6fea00988 Toke Høiland-Jørgensen  2020-09-25  22373  
4a1e7c0c63e02da Toke Høiland-Jørgensen  2020-09-29  22374  		if ((prog->aux->saved_dst_prog_type || prog->aux->saved_dst_attach_type) &&
4a1e7c0c63e02da Toke Høiland-Jørgensen  2020-09-29  22375  		    (!tgt_prog || prog->aux->saved_dst_prog_type != tgt_prog->type ||
4a1e7c0c63e02da Toke Høiland-Jørgensen  2020-09-29  22376  		     prog->aux->saved_dst_attach_type != tgt_prog->expected_attach_type))
4a1e7c0c63e02da Toke Høiland-Jørgensen  2020-09-29  22377  			return -EINVAL;
4a1e7c0c63e02da Toke Høiland-Jørgensen  2020-09-29  22378  
f7b12b6fea00988 Toke Høiland-Jørgensen  2020-09-25  22379  		if (tgt_prog && conservative)
5b92a28aae4dd0f Alexei Starovoitov      2019-11-14  22380  			t = NULL;
f7b12b6fea00988 Toke Høiland-Jørgensen  2020-09-25  22381  
f7b12b6fea00988 Toke Høiland-Jørgensen  2020-09-25  22382  		ret = btf_distill_func_proto(log, btf, t, tname, &tgt_info->fmodel);
fec56f5890d93fc Alexei Starovoitov      2019-11-14  22383  		if (ret < 0)
f7b12b6fea00988 Toke Høiland-Jørgensen  2020-09-25  22384  			return ret;
f7b12b6fea00988 Toke Høiland-Jørgensen  2020-09-25  22385  
5b92a28aae4dd0f Alexei Starovoitov      2019-11-14  22386  		if (tgt_prog) {
e9eeec58c992c47 Yonghong Song           2019-12-04  22387  			if (subprog == 0)
e9eeec58c992c47 Yonghong Song           2019-12-04  22388  				addr = (long) tgt_prog->bpf_func;
e9eeec58c992c47 Yonghong Song           2019-12-04  22389  			else
5b92a28aae4dd0f Alexei Starovoitov      2019-11-14  22390  				addr = (long) tgt_prog->aux->func[subprog]->bpf_func;
                                                                                                      ^^^^^^^^^^^^^^
There is another unchecked dereference here so perhaps the NULL check
is unnecessary.  Or possibly there are some other rules outside this
email with determine when the NULL check is needed.

31bf1dbccfb0a98 Viktor Malik            2023-03-10  22391  		} else {
31bf1dbccfb0a98 Viktor Malik            2023-03-10  22392  			if (btf_is_module(btf)) {
31bf1dbccfb0a98 Viktor Malik            2023-03-10  22393  				mod = btf_try_get_module(btf);
31bf1dbccfb0a98 Viktor Malik            2023-03-10  22394  				if (mod)
31bf1dbccfb0a98 Viktor Malik            2023-03-10  22395  					addr = find_kallsyms_symbol_value(mod, tname);
31bf1dbccfb0a98 Viktor Malik            2023-03-10  22396  				else
31bf1dbccfb0a98 Viktor Malik            2023-03-10  22397  					addr = 0;
5b92a28aae4dd0f Alexei Starovoitov      2019-11-14  22398  			} else {
fec56f5890d93fc Alexei Starovoitov      2019-11-14  22399  				addr = kallsyms_lookup_name(tname);
31bf1dbccfb0a98 Viktor Malik            2023-03-10  22400  			}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

