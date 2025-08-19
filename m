Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2973026A0AD
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Aug 2025 06:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755584018; cv=none; b=cxHU4vVgY8smcwwQmGVVrslnXwv8od6fWfnLpgmbubCOwuExDhbW/JqNxWpNi5/a/6y1EA8gU3wu1TZ1TWOWl5diAeVvFeTu0YWDPbrODQb1JJuactXR+eIaZzwdGnXob7CFmwHXczHfWSw8igcLMlTontzH9+AqzhVOG1kHXfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755584018; c=relaxed/simple;
	bh=pwnw8a9mADcH9qJIzPKa/tq1ZyVltio+a8Y2AhJ473A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GuCZKmri4Nw3KG281RbNo7+QAUZxQHdSP3K6PkLaqSgV08lCbn8UMfC5GqNd/MtySN3FaBbauHbdV1tBunzrBh6ilCgotVGjG5f8vst0F16SGrLVcExjZcDvYNI61wQuB5sVTLg/PyafM7KatUvoozMtJNTObRiZWvcVULIhXRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wrmCstxi; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wrmCstxi"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45a1b05d252so34229205e9.1
        for <oe-kbuild@lists.linux.dev>; Mon, 18 Aug 2025 23:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755584013; x=1756188813; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vR2Z/WDH6gOreEopMqHmHW9u0hd60Nj5JCbNxFQ+BRU=;
        b=wrmCstxi4TwmghairjaMRDh+W5MVex6bIzIQgZkhmEP4ScI+yCtPqCgSDE27oz2hvT
         F+X1R68dkZBoLbWCJvdt3/WDCBiA2Crt7BsDTtlCecDvUkZ+u+dCYoBaRb6N6vrn4Xu7
         awNPyOFxQy39fiomU6YS/PEVop0umbs9lJmbZrYMVI5SzO8WzwShr5idCagoDiJCCX2L
         Az6MuMdWDLBk2yYOd9kiMEzjyGzkfJCLoZ3ds+Rf/vah0TkCmpnVwRKTPZMQBp8O0skJ
         Ul4GsSaMxzkVSTvyB8Fx7XGz5R/71B0VtYSbANMBhXg38n5nLJDLwKWGaSqtCh/T0kaL
         AnSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755584013; x=1756188813;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vR2Z/WDH6gOreEopMqHmHW9u0hd60Nj5JCbNxFQ+BRU=;
        b=DQeQWFCKllemT3jzBj6YyFRlFDkdqbquPNw3q47iUuOylaE4JHXmuK6nSzyqHuEBsi
         LZOQvCYfSfeMKdLlbHWhOhXfSc/oDcoCN9Lphwb8VDkdvocubfAFCV+nSLGoOds1gZfc
         FeK+nMttEEX269crwHZ6QrBthQrQOVWGH8SDD5bn4aBSXKNaTUJjjTdTTFAwPLime8Sl
         HUsWRW587HAjHIlzgzxMOVhCpLPj5VRwXSDUTViKq75enZFVnX0vNNYzBEcSoiZOCe/c
         NjmBh7pKi6qIw+n2cv0nQagnUKxPraOhsKz0zqJjQMQQS8zIK4ocESpTT2pCjRkrK7H5
         GRRg==
X-Gm-Message-State: AOJu0YwACi7PffrUolNkpDyXACJ90ayScUNxif0KDUXqDQVwFNgMBv8e
	Je3reiSjYgkCoW1AdnYOG4BgbqgJLuPAKUFY4uRhy8nVfWBUok5S+fXQ/C6kfLVTtSQOoH7nqo6
	2kXGO
X-Gm-Gg: ASbGncsAEqREY4YrgzhN68RlUv0uM6dVze1S4DRLUJv0kIf2hiAFIFzVkth0hcx3EC1
	/7BaDSkU4jsDLI32iy7KEe9112zpg/vzZs7uRj4XVrgjMareljc1bZfqTyzzTpSpN6Zfb6HDZ1y
	vLDxk23MTlvhAqc/qdbfBjucMAyI6Vs7pnFI3hEfbm+57cr5jWoDvLqc9eNppbxQFibZ0uEoS+g
	rLuHNf6cv4TFBRrBfMZpmdRk7noTAQ7EubCEwmUCAI7gxUwydpjG3aBhbY/Sjuau2OsKpZZgxkr
	Y3JWH2FU1eOfDu7XRu+bF1G8ImfYYW2i7qNcmOLuyUxo3VNcMkKsuAcHBd/sJfE9ZoKWFAoy/sk
	UyXJdibv1o8wPbyfigJgq5uWzwQ1fhsPvi7RLh6pW/kM=
X-Google-Smtp-Source: AGHT+IFf2NahY6DopTmenXeCCcDiRINlBfHfCPxPEpy5h+ISp3BJFr1CxlpB+wS3kFF53KDbbHEAvQ==
X-Received: by 2002:a05:600c:1f93:b0:456:1bca:7faf with SMTP id 5b1f17b1804b1-45b43dfe5d7mr10266725e9.16.1755584012990;
        Mon, 18 Aug 2025 23:13:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a1c6cfed5sm193702245e9.7.2025.08.18.23.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 23:13:32 -0700 (PDT)
Date: Tue, 19 Aug 2025 09:13:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Chenghao Duan <duanchenghao@kylinos.cn>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
	George Guo <guodongtai@kylinos.cn>
Subject: arch/loongarch/net/bpf_jit.c:1547 __arch_prepare_bpf_trampoline()
 error: uninitialized symbol 'retval_off'.
Message-ID: <202508191020.PBBh07cK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20250819061329.JaZyOG66xjtF89--1UQtDPvXG_mOPtRm_3gk2fNujNM@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   be48bcf004f9d0c9207ff21d0edb3b42f253829e
commit: f9b6b41f0cf31791541cea9644ddbedb46465801 LoongArch: BPF: Add basic bpf trampoline support
date:   2 weeks ago
config: loongarch-randconfig-r073-20250818 (https://download.01.org/0day-ci/archive/20250819/202508191020.PBBh07cK-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508191020.PBBh07cK-lkp@intel.com/

New smatch warnings:
arch/loongarch/net/bpf_jit.c:1547 __arch_prepare_bpf_trampoline() error: uninitialized symbol 'retval_off'.

vim +/retval_off +1547 arch/loongarch/net/bpf_jit.c

f9b6b41f0cf317 Chenghao Duan 2025-08-05  1419  static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1420  					 const struct btf_func_model *m, struct bpf_tramp_links *tlinks,
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1421  					 void *func_addr, u32 flags)
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1422  {
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1423  	int i, ret, save_ret;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1424  	int stack_size = 0, nargs = 0;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1425  	int retval_off, args_off, nargs_off, ip_off, run_ctx_off, sreg_off;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1426  	void *orig_call = func_addr;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1427  	struct bpf_tramp_links *fentry = &tlinks[BPF_TRAMP_FENTRY];
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1428  	struct bpf_tramp_links *fexit = &tlinks[BPF_TRAMP_FEXIT];
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1429  	struct bpf_tramp_links *fmod_ret = &tlinks[BPF_TRAMP_MODIFY_RETURN];
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1430  	u32 **branches = NULL;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1431  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1432  	if (flags & (BPF_TRAMP_F_ORIG_STACK | BPF_TRAMP_F_SHARE_IPMODIFY))
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1433  		return -ENOTSUPP;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1434  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1435  	/*
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1436  	 * FP + 8       [ RA to parent func ] return address to parent
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1437  	 *                    function
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1438  	 * FP + 0       [ FP of parent func ] frame pointer of parent
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1439  	 *                    function
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1440  	 * FP - 8       [ T0 to traced func ] return address of traced
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1441  	 *                    function
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1442  	 * FP - 16      [ FP of traced func ] frame pointer of traced
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1443  	 *                    function
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1444  	 *
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1445  	 * FP - retval_off  [ return value      ] BPF_TRAMP_F_CALL_ORIG or
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1446  	 *                    BPF_TRAMP_F_RET_FENTRY_RET
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1447  	 *                  [ argN              ]
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1448  	 *                  [ ...               ]
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1449  	 * FP - args_off    [ arg1              ]
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1450  	 *
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1451  	 * FP - nargs_off   [ regs count        ]
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1452  	 *
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1453  	 * FP - ip_off      [ traced func   ] BPF_TRAMP_F_IP_ARG
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1454  	 *
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1455  	 * FP - run_ctx_off [ bpf_tramp_run_ctx ]
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1456  	 *
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1457  	 * FP - sreg_off    [ callee saved reg  ]
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1458  	 *
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1459  	 */
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1460  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1461  	if (m->nr_args > LOONGARCH_MAX_REG_ARGS)
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1462  		return -ENOTSUPP;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1463  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1464  	if (flags & (BPF_TRAMP_F_ORIG_STACK | BPF_TRAMP_F_SHARE_IPMODIFY))
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1465  		return -ENOTSUPP;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1466  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1467  	stack_size = 0;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1468  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1469  	/* Room of trampoline frame to store return address and frame pointer */
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1470  	stack_size += 16;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1471  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1472  	save_ret = flags & (BPF_TRAMP_F_CALL_ORIG | BPF_TRAMP_F_RET_FENTRY_RET);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1473  	if (save_ret) {
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1474  		/* Save BPF R0 and A0 */
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1475  		stack_size += 16;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1476  		retval_off = stack_size;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1477  	}

retval_off is uninitialized on the else path.

f9b6b41f0cf317 Chenghao Duan 2025-08-05  1478  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1479  	/* Room of trampoline frame to store args */
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1480  	nargs = m->nr_args;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1481  	stack_size += nargs * 8;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1482  	args_off = stack_size;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1483  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1484  	/* Room of trampoline frame to store args number */
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1485  	stack_size += 8;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1486  	nargs_off = stack_size;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1487  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1488  	/* Room of trampoline frame to store ip address */
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1489  	if (flags & BPF_TRAMP_F_IP_ARG) {
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1490  		stack_size += 8;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1491  		ip_off = stack_size;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1492  	}
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1493  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1494  	/* Room of trampoline frame to store struct bpf_tramp_run_ctx */
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1495  	stack_size += round_up(sizeof(struct bpf_tramp_run_ctx), 8);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1496  	run_ctx_off = stack_size;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1497  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1498  	stack_size += 8;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1499  	sreg_off = stack_size;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1500  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1501  	stack_size = round_up(stack_size, 16);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1502  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1503  	/* For the trampoline called from function entry */
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1504  	/* RA and FP for parent function */
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1505  	emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP, -16);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1506  	emit_insn(ctx, std, LOONGARCH_GPR_RA, LOONGARCH_GPR_SP, 8);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1507  	emit_insn(ctx, std, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, 0);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1508  	emit_insn(ctx, addid, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, 16);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1509  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1510  	/* RA and FP for traced function */
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1511  	emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP, -stack_size);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1512  	emit_insn(ctx, std, LOONGARCH_GPR_T0, LOONGARCH_GPR_SP, stack_size - 8);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1513  	emit_insn(ctx, std, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, stack_size - 16);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1514  	emit_insn(ctx, addid, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, stack_size);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1515  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1516  	/* callee saved register S1 to pass start time */
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1517  	emit_insn(ctx, std, LOONGARCH_GPR_S1, LOONGARCH_GPR_FP, -sreg_off);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1518  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1519  	/* store ip address of the traced function */
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1520  	if (flags & BPF_TRAMP_F_IP_ARG) {
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1521  		move_imm(ctx, LOONGARCH_GPR_T1, (const s64)func_addr, false);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1522  		emit_insn(ctx, std, LOONGARCH_GPR_T1, LOONGARCH_GPR_FP, -ip_off);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1523  	}
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1524  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1525  	/* store nargs number */
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1526  	move_imm(ctx, LOONGARCH_GPR_T1, nargs, false);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1527  	emit_insn(ctx, std, LOONGARCH_GPR_T1, LOONGARCH_GPR_FP, -nargs_off);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1528  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1529  	store_args(ctx, nargs, args_off);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1530  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1531  	/* To traced function */
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1532  	/* Ftrace jump skips 2 NOP instructions */
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1533  	if (is_kernel_text((unsigned long)orig_call))
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1534  		orig_call += LOONGARCH_FENTRY_NBYTES;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1535  	/* Direct jump skips 5 NOP instructions */
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1536  	else if (is_bpf_text_address((unsigned long)orig_call))
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1537  		orig_call += LOONGARCH_BPF_FENTRY_NBYTES;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1538  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1539  	if (flags & BPF_TRAMP_F_CALL_ORIG) {
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1540  		move_imm(ctx, LOONGARCH_GPR_A0, (const s64)im, false);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1541  		ret = emit_call(ctx, (const u64)__bpf_tramp_enter);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1542  		if (ret)
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1543  			return ret;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1544  	}
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1545  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1546  	for (i = 0; i < fentry->nr_links; i++) {
f9b6b41f0cf317 Chenghao Duan 2025-08-05 @1547  		ret = invoke_bpf_prog(ctx, fentry->links[i], args_off, retval_off,
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1548  				      run_ctx_off, flags & BPF_TRAMP_F_RET_FENTRY_RET);

It's undefined behavior to pass uninitialized data to a function (unless
the function is inlined, I suppose).

f9b6b41f0cf317 Chenghao Duan 2025-08-05  1549  		if (ret)
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1550  			return ret;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1551  	}
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1552  	if (fmod_ret->nr_links) {
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1553  		branches  = kcalloc(fmod_ret->nr_links, sizeof(u32 *), GFP_KERNEL);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1554  		if (!branches)
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1555  			return -ENOMEM;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1556  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1557  		invoke_bpf_mod_ret(ctx, fmod_ret, args_off, retval_off, run_ctx_off, branches);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1558  	}
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1559  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1560  	if (flags & BPF_TRAMP_F_CALL_ORIG) {
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1561  		restore_args(ctx, m->nr_args, args_off);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1562  		ret = emit_call(ctx, (const u64)orig_call);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1563  		if (ret)
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1564  			goto out;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1565  		emit_insn(ctx, std, LOONGARCH_GPR_A0, LOONGARCH_GPR_FP, -retval_off);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1566  		emit_insn(ctx, std, regmap[BPF_REG_0], LOONGARCH_GPR_FP, -(retval_off - 8));
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1567  		im->ip_after_call = ctx->ro_image + ctx->idx;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1568  		/* Reserve space for the move_imm + jirl instruction */
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1569  		for (i = 0; i < LOONGARCH_LONG_JUMP_NINSNS; i++)
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1570  			emit_insn(ctx, nop);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1571  	}
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1572  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1573  	for (i = 0; ctx->image && i < fmod_ret->nr_links; i++) {
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1574  		int offset = (void *)(&ctx->image[ctx->idx]) - (void *)branches[i];
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1575  		*branches[i] = larch_insn_gen_bne(LOONGARCH_GPR_T1, LOONGARCH_GPR_ZERO, offset);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1576  	}
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1577  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1578  	for (i = 0; i < fexit->nr_links; i++) {
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1579  		ret = invoke_bpf_prog(ctx, fexit->links[i], args_off, retval_off, run_ctx_off, false);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1580  		if (ret)
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1581  			goto out;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1582  	}
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1583  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1584  	if (flags & BPF_TRAMP_F_CALL_ORIG) {
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1585  		im->ip_epilogue = ctx->ro_image + ctx->idx;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1586  		move_imm(ctx, LOONGARCH_GPR_A0, (const s64)im, false);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1587  		ret = emit_call(ctx, (const u64)__bpf_tramp_exit);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1588  		if (ret)
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1589  			goto out;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1590  	}
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1591  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1592  	if (flags & BPF_TRAMP_F_RESTORE_REGS)
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1593  		restore_args(ctx, m->nr_args, args_off);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1594  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1595  	if (save_ret) {
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1596  		emit_insn(ctx, ldd, LOONGARCH_GPR_A0, LOONGARCH_GPR_FP, -retval_off);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1597  		emit_insn(ctx, ldd, regmap[BPF_REG_0], LOONGARCH_GPR_FP, -(retval_off - 8));
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1598  	}
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1599  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1600  	emit_insn(ctx, ldd, LOONGARCH_GPR_S1, LOONGARCH_GPR_FP, -sreg_off);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1601  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1602  	/* trampoline called from function entry */
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1603  	emit_insn(ctx, ldd, LOONGARCH_GPR_T0, LOONGARCH_GPR_SP, stack_size - 8);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1604  	emit_insn(ctx, ldd, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, stack_size - 16);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1605  	emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP, stack_size);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1606  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1607  	emit_insn(ctx, ldd, LOONGARCH_GPR_RA, LOONGARCH_GPR_SP, 8);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1608  	emit_insn(ctx, ldd, LOONGARCH_GPR_FP, LOONGARCH_GPR_SP, 0);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1609  	emit_insn(ctx, addid, LOONGARCH_GPR_SP, LOONGARCH_GPR_SP, 16);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1610  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1611  	if (flags & BPF_TRAMP_F_SKIP_FRAME)
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1612  		/* return to parent function */
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1613  		emit_insn(ctx, jirl, LOONGARCH_GPR_ZERO, LOONGARCH_GPR_RA, 0);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1614  	else
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1615  		/* return to traced function */
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1616  		emit_insn(ctx, jirl, LOONGARCH_GPR_ZERO, LOONGARCH_GPR_T0, 0);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1617  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1618  	ret = ctx->idx;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1619  out:
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1620  	kfree(branches);
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1621  
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1622  	return ret;
f9b6b41f0cf317 Chenghao Duan 2025-08-05  1623  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

