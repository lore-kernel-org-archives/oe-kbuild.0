Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07EC17990
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Nov 2023 08:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p/AFOldZ"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50baa3e5c00so2159932e87.1
        for <oe-kbuild@lists.linux.dev>; Mon, 27 Nov 2023 00:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701074333; x=1701679133; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9+3L96NjIz2RWvf2gmLIvMPT1EB5fPTxOYm9b8qLDp0=;
        b=p/AFOldZe+487Dtk61DqLj99JTsyrzMstwIELXYXpNc6FPWdUgGU8R9ehN6d6y3Wlg
         2xoykrWKC/s9mCStT0gF0JRYrcSkz1Cktfnm8jJPEs3sDOs8hC5QQnI3a5DoL3SCz19c
         bHOGfTEUacG5ei4u+nL/aTLNN38TnGplnB3CpVJCAJQpvRab7OruXownjjTonk2ALXP2
         X2QJn2LVryzG104l9b+CyXa4mqIK2eu11kdXbm0t+9Y5/O+1SwdmjiptBedyZc4zsq9z
         +fIemouIbgx1fEJ795eGTosbyGFxg2Kz7mkt6cVlkvWtq/eZJO7/w7s4Zk8E/vnasNiD
         8Mgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701074333; x=1701679133;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9+3L96NjIz2RWvf2gmLIvMPT1EB5fPTxOYm9b8qLDp0=;
        b=VrMYd0T3YR5r3jCuER3iUBHfw6hGlTWjsTGmcRNFeQa1gBpEJnj/6iuV0JvbX5NLPg
         YtRmfuLtZasjd8liSYNEZV4EZ7D+caO1aOZSJQRk8F8myK+2pEEzbDbDUQImIFgudgJW
         JAw6hLIw06bgm4uVxl1xPx+kJ5Lu9jil7L5GnXGK6gEfql+hxJ3PfZFY11X9JwIS+9xC
         RdAjiwms6IYP7o4iE+CSkOYthEeFtKBD8LYAYOEUV5avjxNxjx3BjCt2JxySEZ224aKH
         J3SJbV6TidYHQiAXkRZb3rKP8h93M3JV6A+SO0xmCP3opIsx+rroMT2BhmFAtoW/33ng
         ugCg==
X-Gm-Message-State: AOJu0YyXj1N8Vl1FKjEsNXCIEPpHQBcna9n56lLwr7XijYBtZWOPbXmj
	lB84zmm06pyL7GkVHvd+qczWd3oPrImrXeDrAiA=
X-Google-Smtp-Source: AGHT+IH1lV7fJUCBtxnjaOz/DUnKc8vizm037rCEh5sYL2qpZN9rN2jJ82wkap3SnCOBneVERtKuAA==
X-Received: by 2002:a05:6512:2350:b0:507:9fc1:ca7a with SMTP id p16-20020a056512235000b005079fc1ca7amr5307062lfu.9.1701074333070;
        Mon, 27 Nov 2023 00:38:53 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i2-20020adffc02000000b00327de0173f6sm11370105wrr.115.2023.11.27.00.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 00:38:52 -0800 (PST)
From: Dan Carpenter <dan.carpenter@linaro.org>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 27 Nov 2023 11:38:49 +0300
To: oe-kbuild@lists.linux.dev, Qi Hu <huqi@loongson.cn>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>
Subject: arch/loongarch/kernel/traps.c:407 die() warn: variable dereferenced
 before check 'regs' (see line 401)
Message-ID: <90f50994-3cc7-4f35-9fab-a62ac129a93d@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Qi,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2da77f431ac49b5763b88751a75f70daa46296c
commit: 346dc929623cef70ff7832a4fa0ffd1b696e312a LoongArch: Fix the write_fcsr() macro
config: loongarch-randconfig-r071-20231126 (https://download.01.org/0day-ci/archive/20231127/202311270400.2cHw6Jsv-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231127/202311270400.2cHw6Jsv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311270400.2cHw6Jsv-lkp@intel.com/

New smatch warnings:
arch/loongarch/kernel/traps.c:407 die() warn: variable dereferenced before check 'regs' (see line 401)

vim +/regs +407 arch/loongarch/kernel/traps.c

0603839b18f4fb Huacai Chen  2022-05-31  385  void __noreturn die(const char *str, struct pt_regs *regs)
0603839b18f4fb Huacai Chen  2022-05-31  386  {
0603839b18f4fb Huacai Chen  2022-05-31  387  	static int die_counter;
0603839b18f4fb Huacai Chen  2022-05-31  388  	int sig = SIGSEGV;
0603839b18f4fb Huacai Chen  2022-05-31  389  
0603839b18f4fb Huacai Chen  2022-05-31  390  	oops_enter();
0603839b18f4fb Huacai Chen  2022-05-31  391  
0603839b18f4fb Huacai Chen  2022-05-31  392  	if (notify_die(DIE_OOPS, str, regs, 0, current->thread.trap_nr,
0603839b18f4fb Huacai Chen  2022-05-31  393  		       SIGSEGV) == NOTIFY_STOP)
0603839b18f4fb Huacai Chen  2022-05-31  394  		sig = 0;
0603839b18f4fb Huacai Chen  2022-05-31  395  
0603839b18f4fb Huacai Chen  2022-05-31  396  	console_verbose();
0603839b18f4fb Huacai Chen  2022-05-31  397  	raw_spin_lock_irq(&die_lock);
0603839b18f4fb Huacai Chen  2022-05-31  398  	bust_spinlocks(1);
0603839b18f4fb Huacai Chen  2022-05-31  399  
0603839b18f4fb Huacai Chen  2022-05-31  400  	printk("%s[#%d]:\n", str, ++die_counter);
0603839b18f4fb Huacai Chen  2022-05-31 @401  	show_registers(regs);
                                                               ^^^^
Dereferenced

0603839b18f4fb Huacai Chen  2022-05-31  402  	add_taint(TAINT_DIE, LOCKDEP_NOW_UNRELIABLE);
0603839b18f4fb Huacai Chen  2022-05-31  403  	raw_spin_unlock_irq(&die_lock);
0603839b18f4fb Huacai Chen  2022-05-31  404  
0603839b18f4fb Huacai Chen  2022-05-31  405  	oops_exit();
0603839b18f4fb Huacai Chen  2022-05-31  406  
4e62d1d86585e1 Youling Tang 2022-10-12 @407  	if (regs && kexec_should_crash(current))
                                                    ^^^^
Checked too late

4e62d1d86585e1 Youling Tang 2022-10-12  408  		crash_kexec(regs);
4e62d1d86585e1 Youling Tang 2022-10-12  409  
0603839b18f4fb Huacai Chen  2022-05-31  410  	if (in_interrupt())
0603839b18f4fb Huacai Chen  2022-05-31  411  		panic("Fatal exception in interrupt");
0603839b18f4fb Huacai Chen  2022-05-31  412  
0603839b18f4fb Huacai Chen  2022-05-31  413  	if (panic_on_oops)
0603839b18f4fb Huacai Chen  2022-05-31  414  		panic("Fatal exception");
0603839b18f4fb Huacai Chen  2022-05-31  415  
0603839b18f4fb Huacai Chen  2022-05-31  416  	make_task_dead(sig);
0603839b18f4fb Huacai Chen  2022-05-31  417  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

