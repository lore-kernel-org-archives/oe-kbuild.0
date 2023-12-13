Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BC52C846
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Dec 2023 13:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XYB6oM2N"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-336420a244dso291962f8f.0
        for <oe-kbuild@lists.linux.dev>; Wed, 13 Dec 2023 05:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702473569; x=1703078369; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EsdXhQ9stE2bZqdJRy9zMQjkiZsUKWSWLUwA06lYnkQ=;
        b=XYB6oM2NxfXABXpKl+ygAQY3rKEOK9qPeK+T/BtGfKYcd47pngBfuhCbLy073YaeW3
         H3Wseap/EJTGs/nKd79ZndFSsW3tT6S7CxlxGcnNzH2Adw00LFJYO0gtjKGzrwKLP3Ev
         yBsqCY9FBUp9Zue1R1733c6vbMXTNTcAMJdtbYOKns3/Q+vIq2/1MjtE4qqkk+OjK4/i
         skVJtE93tuoovmn5tILJcfOwhlN7Q8yPye71tNBBloE5hRQI86U4fnHO6B5CXpNcvMrS
         og67S/J6QVuRGjLiwo1wwkakBuImRQxqpx3u1dRIRLJjhtxL/JsueL1lRM4oQQXBvjZr
         WKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702473569; x=1703078369;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EsdXhQ9stE2bZqdJRy9zMQjkiZsUKWSWLUwA06lYnkQ=;
        b=OclLJtdKGspQSrfrKfYxPWwtqHPPWoa16//+L7ZxTbxtECKzHgoIo7SbwvVd9uk1bM
         09rasxrwpxvqqJXRKue2A+akozC+0VLG8t7GpIVgKsoPam6BTht25u/vii7KNUBIx7/t
         guTXqgehQdpKIIltiS7TG4jRgad+fKyriMcOWbyiXUv1dKoaO9SOzlTmUbA96mpg10y2
         yvASJL5zu191ZANaB1NbCdRVLlG/DBlhs60g/2waXPVBDk8KrlWV2MYsQetGW3xnzjKv
         aIU9j1PtACewOwVFgWGlfW7rG8e+wD3mtSriwHJr299V42f5/lrp9CaDXVWco80QjAOC
         oYyg==
X-Gm-Message-State: AOJu0YzuAucNjAELIDmBTcfnhm8g0eLK4le5OQBKOZHxo7dRJWl4gMcj
	dEs6fz3wlZufcjRzkHmri2ZAvKTi4/xXeOjrqyg=
X-Google-Smtp-Source: AGHT+IFFLrs9vM6knyPmGlPn6dej6ZlQgDhZz3Yaa7EHmjE5r/WWjNkPTiPL5gEmvXZiHuAy1OYpCQ==
X-Received: by 2002:adf:e28c:0:b0:333:4a78:c5ee with SMTP id v12-20020adfe28c000000b003334a78c5eemr4118334wri.48.1702473569381;
        Wed, 13 Dec 2023 05:19:29 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id p18-20020a5d6392000000b003333a216682sm13263376wru.97.2023.12.13.05.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 05:19:28 -0800 (PST)
Date: Wed, 13 Dec 2023 16:19:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Subject: arch/riscv/kernel/module.c:727 add_relocation_to_accumulate() error:
 dereferencing freed memory 'rel_head'
Message-ID: <17fcf691-e184-4542-b095-bbb4084d031f@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   88035e5694a86a7167d490bb95e9df97a9bb162b
commit: d8792a5734b0f3e58b898c2e2f910bfac48e9ee3 riscv: Safely remove entries from relocation list
config: riscv-randconfig-r071-20231211 (https://download.01.org/0day-ci/archive/20231213/202312132019.iYGTwW0L-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231213/202312132019.iYGTwW0L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312132019.iYGTwW0L-lkp@intel.com/

New smatch warnings:
arch/riscv/kernel/module.c:727 add_relocation_to_accumulate() error: dereferencing freed memory 'rel_head'
arch/riscv/kernel/module.c:792 apply_relocate_add() warn: unsigned 'hashtable_bits' is never less than zero.

vim +/rel_head +727 arch/riscv/kernel/module.c

8fd6c5142395a1 Charlie Jenkins      2023-11-01  717  		INIT_LIST_HEAD(rel_head->rel_entry);
8fd6c5142395a1 Charlie Jenkins      2023-11-01  718  		rel_head->location = location;
8fd6c5142395a1 Charlie Jenkins      2023-11-01  719  		INIT_HLIST_NODE(&rel_head->node);
8fd6c5142395a1 Charlie Jenkins      2023-11-01  720  		if (!current_head->first) {
8fd6c5142395a1 Charlie Jenkins      2023-11-01  721  			bucket =
8fd6c5142395a1 Charlie Jenkins      2023-11-01  722  				kmalloc(sizeof(struct used_bucket), GFP_KERNEL);
d8792a5734b0f3 Charlie Jenkins      2023-11-27  723  
d8792a5734b0f3 Charlie Jenkins      2023-11-27  724  			if (!bucket) {
d8792a5734b0f3 Charlie Jenkins      2023-11-27  725  				kfree(entry);
d8792a5734b0f3 Charlie Jenkins      2023-11-27  726  				kfree(rel_head);
d8792a5734b0f3 Charlie Jenkins      2023-11-27 @727  				kfree(rel_head->rel_entry);

Swap these two frees to avoid a use after free.

d8792a5734b0f3 Charlie Jenkins      2023-11-27  728  				return -ENOMEM;
d8792a5734b0f3 Charlie Jenkins      2023-11-27  729  			}
d8792a5734b0f3 Charlie Jenkins      2023-11-27  730  
8fd6c5142395a1 Charlie Jenkins      2023-11-01  731  			INIT_LIST_HEAD(&bucket->head);
8fd6c5142395a1 Charlie Jenkins      2023-11-01  732  			bucket->bucket = current_head;
d8792a5734b0f3 Charlie Jenkins      2023-11-27  733  			list_add(&bucket->head, used_buckets_list);
8fd6c5142395a1 Charlie Jenkins      2023-11-01  734  		}
8fd6c5142395a1 Charlie Jenkins      2023-11-01  735  		hlist_add_head(&rel_head->node, current_head);
8fd6c5142395a1 Charlie Jenkins      2023-11-01  736  	}

[ snip ]

e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  773  int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  774  		       unsigned int symindex, unsigned int relsec,
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  775  		       struct module *me)
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  776  {
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  777  	Elf_Rela *rel = (void *) sechdrs[relsec].sh_addr;
8cbe0accc4a6ba Emil Renner Berthing 2023-11-01  778  	int (*handler)(struct module *me, void *location, Elf_Addr v);
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  779  	Elf_Sym *sym;
8cbe0accc4a6ba Emil Renner Berthing 2023-11-01  780  	void *location;
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  781  	unsigned int i, type;
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  782  	Elf_Addr v;
e2c0cdfba7f699 Palmer Dabbelt       2017-07-10  783  	int res;
8fd6c5142395a1 Charlie Jenkins      2023-11-01  784  	unsigned int num_relocations = sechdrs[relsec].sh_size / sizeof(*rel);
d8792a5734b0f3 Charlie Jenkins      2023-11-27  785  	struct hlist_head *relocation_hashtable;
d8792a5734b0f3 Charlie Jenkins      2023-11-27  786  	struct list_head used_buckets_list;
d8792a5734b0f3 Charlie Jenkins      2023-11-27  787  	unsigned int hashtable_bits;
                                                        ^^^^^^^^

d8792a5734b0f3 Charlie Jenkins      2023-11-27  788  
d8792a5734b0f3 Charlie Jenkins      2023-11-27  789  	hashtable_bits = initialize_relocation_hashtable(num_relocations,
d8792a5734b0f3 Charlie Jenkins      2023-11-27  790  							 &relocation_hashtable);
d8792a5734b0f3 Charlie Jenkins      2023-11-27  791  
d8792a5734b0f3 Charlie Jenkins      2023-11-27 @792  	if (hashtable_bits < 0)
                                                            ^^^^^^^^^^^^^^^^^^
Can't be less than zero.

d8792a5734b0f3 Charlie Jenkins      2023-11-27  793  		return hashtable_bits;
d8792a5734b0f3 Charlie Jenkins      2023-11-27  794  
d8792a5734b0f3 Charlie Jenkins      2023-11-27  795  	INIT_LIST_HEAD(&used_buckets_list);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

