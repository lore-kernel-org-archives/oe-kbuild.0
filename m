Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF5E68269
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Dec 2023 19:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="FF6UptaB"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5ca0b968d8dso1726454a12.1
        for <oe-kbuild@lists.linux.dev>; Wed, 13 Dec 2023 11:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702495771; x=1703100571; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JuicOJq+0CXKSvfCBFTZjGzFOcAHcLQmjoNEHnmDvtw=;
        b=FF6UptaBlJJQtYSV1KrtGNiqI5CC81uihQHTVeeLGk4FVrWhbv9/P0fIkYhesZX8k2
         vh5vpP35pVMzwCt8ptEPADNw/bGxrusGG9QNl8Ew0Hf/3MPvz75eR4W2wAzvBBz4mE+Z
         bSH8nVG1IrwvxiXgLh5RARcDw/znSPyb6hPq7hU8Yfqs+UpdeMtUV26mgMK8RRgbZIqt
         xLzpr/HHVkYdWWFddpFA7nGngDqgn6CF1CiGcfI9D1VEuP56y0ZQqlTLRAIR/aTuZwB+
         +hXj3xnCOShIhP7uZuNXZCdaMM0xmiOt4NXTsYmroLdsSOeL2zMIhx4dxmwwwhcVPgcy
         74fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702495771; x=1703100571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JuicOJq+0CXKSvfCBFTZjGzFOcAHcLQmjoNEHnmDvtw=;
        b=ql1Z2YV/f4jA4rHttzwrI6BgpHGT0xrF3gXCRLEjVZBLK3rqenJG2oXx7Clf1zIC5r
         dQPOPBzAMnKxl6jvvVUhEINpExAP6b/ka0aMVD22EUeKizfs95gmCItoHidQ9C6vW1kn
         fv986QOdDpfqaqDNj8NMM39cVx2yJh3+9FdWHyKDc2NqG0r0RYCKpAbBus58817HuWUg
         GRVwIBkHMqsZXNKtaW5nhtzO0+oQYZePDHmgaOgA1tUAbleVfaqiRSejZ7pLwXCCb+u9
         AtoLi+EGFL56DpHzVpyhg7gFN5XnNxcur0Yp4zOBM1jG04UEwNlNsaWjv1XFNL9GYXSM
         QhDw==
X-Gm-Message-State: AOJu0YwrSGdZsANDSQgaIBrp2xVd87BoOs97+IsWgJj9gv+CBekgPl86
	jnG3mujRsRtBG2XVSI2wtic2kg==
X-Google-Smtp-Source: AGHT+IGz5OsdtCynJx1WCIqmZOcQ9Yb7PLpcW/7iy9u/CnYxi2T5L+fOPo7RTx3aq6cUMI9Sz2L8/w==
X-Received: by 2002:a05:6a20:320f:b0:18c:a983:a5f6 with SMTP id hl15-20020a056a20320f00b0018ca983a5f6mr3667843pzc.23.1702495771345;
        Wed, 13 Dec 2023 11:29:31 -0800 (PST)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id t2-20020a62d142000000b006ce538550bbsm10742898pfl.74.2023.12.13.11.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 11:29:30 -0800 (PST)
Date: Wed, 13 Dec 2023 11:29:29 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: arch/riscv/kernel/module.c:727 add_relocation_to_accumulate()
 error: dereferencing freed memory 'rel_head'
Message-ID: <ZXoGGcAFdbn+quq+@ghost>
References: <17fcf691-e184-4542-b095-bbb4084d031f@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17fcf691-e184-4542-b095-bbb4084d031f@suswa.mountain>

On Wed, Dec 13, 2023 at 04:19:26PM +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   88035e5694a86a7167d490bb95e9df97a9bb162b
> commit: d8792a5734b0f3e58b898c2e2f910bfac48e9ee3 riscv: Safely remove entries from relocation list
> config: riscv-randconfig-r071-20231211 (https://download.01.org/0day-ci/archive/20231213/202312132019.iYGTwW0L-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 13.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20231213/202312132019.iYGTwW0L-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202312132019.iYGTwW0L-lkp@intel.com/
> 
> New smatch warnings:
> arch/riscv/kernel/module.c:727 add_relocation_to_accumulate() error: dereferencing freed memory 'rel_head'
> arch/riscv/kernel/module.c:792 apply_relocate_add() warn: unsigned 'hashtable_bits' is never less than zero.
> 
> vim +/rel_head +727 arch/riscv/kernel/module.c
> 
> 8fd6c5142395a1 Charlie Jenkins      2023-11-01  717  		INIT_LIST_HEAD(rel_head->rel_entry);
> 8fd6c5142395a1 Charlie Jenkins      2023-11-01  718  		rel_head->location = location;
> 8fd6c5142395a1 Charlie Jenkins      2023-11-01  719  		INIT_HLIST_NODE(&rel_head->node);
> 8fd6c5142395a1 Charlie Jenkins      2023-11-01  720  		if (!current_head->first) {
> 8fd6c5142395a1 Charlie Jenkins      2023-11-01  721  			bucket =
> 8fd6c5142395a1 Charlie Jenkins      2023-11-01  722  				kmalloc(sizeof(struct used_bucket), GFP_KERNEL);
> d8792a5734b0f3 Charlie Jenkins      2023-11-27  723  
> d8792a5734b0f3 Charlie Jenkins      2023-11-27  724  			if (!bucket) {
> d8792a5734b0f3 Charlie Jenkins      2023-11-27  725  				kfree(entry);
> d8792a5734b0f3 Charlie Jenkins      2023-11-27  726  				kfree(rel_head);
> d8792a5734b0f3 Charlie Jenkins      2023-11-27 @727  				kfree(rel_head->rel_entry);
> 
> Swap these two frees to avoid a use after free.

Thanks for pointing this out.

> 
> d8792a5734b0f3 Charlie Jenkins      2023-11-27  728  				return -ENOMEM;
> d8792a5734b0f3 Charlie Jenkins      2023-11-27  729  			}
> d8792a5734b0f3 Charlie Jenkins      2023-11-27  730  
> 8fd6c5142395a1 Charlie Jenkins      2023-11-01  731  			INIT_LIST_HEAD(&bucket->head);
> 8fd6c5142395a1 Charlie Jenkins      2023-11-01  732  			bucket->bucket = current_head;
> d8792a5734b0f3 Charlie Jenkins      2023-11-27  733  			list_add(&bucket->head, used_buckets_list);
> 8fd6c5142395a1 Charlie Jenkins      2023-11-01  734  		}
> 8fd6c5142395a1 Charlie Jenkins      2023-11-01  735  		hlist_add_head(&rel_head->node, current_head);
> 8fd6c5142395a1 Charlie Jenkins      2023-11-01  736  	}
> 
> [ snip ]
> 
> e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  773  int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
> e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  774  		       unsigned int symindex, unsigned int relsec,
> e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  775  		       struct module *me)
> e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  776  {
> e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  777  	Elf_Rela *rel = (void *) sechdrs[relsec].sh_addr;
> 8cbe0accc4a6ba Emil Renner Berthing 2023-11-01  778  	int (*handler)(struct module *me, void *location, Elf_Addr v);
> e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  779  	Elf_Sym *sym;
> 8cbe0accc4a6ba Emil Renner Berthing 2023-11-01  780  	void *location;
> e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  781  	unsigned int i, type;
> e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  782  	Elf_Addr v;
> e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  783  	int res;
> 8fd6c5142395a1 Charlie Jenkins      2023-11-01  784  	unsigned int num_relocations = sechdrs[relsec].sh_size / sizeof(*rel);
> d8792a5734b0f3 Charlie Jenkins      2023-11-27  785  	struct hlist_head *relocation_hashtable;
> d8792a5734b0f3 Charlie Jenkins      2023-11-27  786  	struct list_head used_buckets_list;
> d8792a5734b0f3 Charlie Jenkins      2023-11-27  787  	unsigned int hashtable_bits;
>                                                         ^^^^^^^^
> 
> d8792a5734b0f3 Charlie Jenkins      2023-11-27  788  
> d8792a5734b0f3 Charlie Jenkins      2023-11-27  789  	hashtable_bits = initialize_relocation_hashtable(num_relocations,
> d8792a5734b0f3 Charlie Jenkins      2023-11-27  790  							 &relocation_hashtable);
> d8792a5734b0f3 Charlie Jenkins      2023-11-27  791  
> d8792a5734b0f3 Charlie Jenkins      2023-11-27 @792  	if (hashtable_bits < 0)
>                                                             ^^^^^^^^^^^^^^^^^^
> Can't be less than zero.

I am returning a negative number in an unsigned function, oops. Since
the only possible failure in the function is an out-of-memory error and
0 is not a valid return, I will return 0 in the out-of-memory case.

- Charlie

> 
> d8792a5734b0f3 Charlie Jenkins      2023-11-27  793  		return hashtable_bits;
> d8792a5734b0f3 Charlie Jenkins      2023-11-27  794  
> d8792a5734b0f3 Charlie Jenkins      2023-11-27  795  	INIT_LIST_HEAD(&used_buckets_list);
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
