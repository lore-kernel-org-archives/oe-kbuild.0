Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7982D0617
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 06:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770705965; cv=none; b=VAhwGFsNo4TLYj0hQ5gQx1ZGgOVtrTPV5lQGDEdyTW86/scqInC9EK7Mv+7yyZq3Ya9O15HhpzYPk2lxAuQg7IeIZDYDQLhJvFvRqVt/4Q14GFtQjjm/ifiuDt/kNLRrQIMzd+ud3OPalGZL/qCypBJE3oHnUCHV+f2L/J4R0go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770705965; c=relaxed/simple;
	bh=Gk46yP1Ng7bSxDSef4jTk/VWOwwQbnoKlObHHwVdPmY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ks+k/B2c36fL8zn8V6K6otRdg8N7ydL7rBzdWmC1zE0luEvalFZY0508Ib+JLCJdHXgawf76YCXE7RGlcBwE8h/OG0rFbz8VaZqrnzsvvBQc9klkKW85m3azTU7dsAfgKKARnRSgGlJv+3LXnw5/SODyk1U0OeMaDw2PhhP3QSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wFEA8BUd; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wFEA8BUd"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so4396045e9.1
        for <oe-kbuild@lists.linux.dev>; Mon, 09 Feb 2026 22:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770705962; x=1771310762; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BVHw7MWWuHzTYdWqZCbM8ALpbx/wpUpNQtFvzEVIIUA=;
        b=wFEA8BUd+lEqMHPcOBEcbC02PJoR+ptZA83PLAdPY38Q3qSen24AEMN3jZIBt6bExG
         4i47tiFSiMOnLkfgWM9VVkd9rffNrDr1kEQCyawpvXnhlfmyR6HSiC+KS/6ESNo1A/0v
         0clpFeJsm6pPTDask/9X7VyvaQ57R5GJuys3r0ZiByW6nruVyJntxWnHS18WoIsZLZp7
         L70bUlpG4lUdjiHbgNs2VRBCwEI3Uy3kO8BuRES50MjwYx1kB2KUFUjr9yISNYQCeiwW
         9o4jkKbMz0MLvuYXrlRiilND2bJpvE5nbLBU++VHTaA2u5TcEJOMAzCQUebgj1JHv+5n
         0wqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770705962; x=1771310762;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVHw7MWWuHzTYdWqZCbM8ALpbx/wpUpNQtFvzEVIIUA=;
        b=nYprChPEQy/nuja6fdyxDZz2srQDSe9CAb3QwLTbf5Ew8LiUnO4Xw9nwJhmNE7l1WT
         AfAiIGUtDiilu7I0XnLtuqniwBA8XMIpvLEPM9YdJNZIG28soE7ffuqOK5BsNE65XSS1
         7kn6kyo0z+O005Tjmrf5ixMs7T2IeHGFbkDiww1cZ5maQSV81gXRUTRyeeYcNhtC3747
         jZ/GBCuZeDEwlFCGunsIV8mRQFYiPZ3u+2/I9h8n3SU/k6c1/xsKsi2QjFCKqnz1Tm6k
         tFcBceZfr3oeFXI87RFY0TqefbyAKZ7Ewc4tv0Un5g5YLoLBsH07zGNgKI4+crIkvkMm
         wg+w==
X-Gm-Message-State: AOJu0Yw6IfHzkA8nRGkiddoZjrLaYonaKbYmQ3iKwaMmlp0Y5BhNVQqi
	8UbJqk81b8Twbxr7+hDFACIk1oxFCsAw/i3Kre9c53PM//IU5yYglXfAf0krYOSrIPCfCPkmXCJ
	P2QVG
X-Gm-Gg: AZuq6aLQ2nkqU8AjVvwz/KHX7loR35lse/Jf1zSMwZgs7ifLAVEINTOdGl+hYW7L6rM
	PqT/pAd4GmMETFNxFB95/FyBZtQOC6IbO84KCboES2FGZBqLfRjndJ06krw9DtEmePFJgb7EVgA
	VNrc0N67sIzCJVbxvMT1YjCx5laVCKDK/qjFPidv2sV2FDgglfoQuWG/g5ohDWE8M7cwbV7v1b0
	YVsb9nsKUxpUCFzL/QZFMp4IdcT2b4O8CicUoHT0Z51wYnsoDnuNYLuW+ea833roOY99JjWsVow
	6DH4HYv/NL3/ym13KBuRC98kVET/FEdit++9SY/X98eULFmmMr3tloaBUIOiNw1mzPB89omEQMx
	gGS0PsCQxFRsSS2w/eJQCSSQ1LPuiq2RfNB7HgV8rLc9+CyAEGFvYYF6ry2rNZL528ZUZv+dEJc
	FSIL31cJ+mnsoiDD/At2VG99m3NVam
X-Received: by 2002:a05:600c:46d2:b0:480:4a90:1b06 with SMTP id 5b1f17b1804b1-4832022c31fmr196103835e9.34.1770705961996;
        Mon, 09 Feb 2026 22:46:01 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483209af8e0sm184136425e9.5.2026.02.09.22.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 22:46:01 -0800 (PST)
Date: Tue, 10 Feb 2026 09:45:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jinjie Ruan <ruanjinjie@huawei.com>,
	corbet@lwn.net, catalin.marinas@arm.com, will@kernel.org,
	chenhuacai@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com,
	akpm@linux-foundation.org, bhe@redhat.com, vgoyal@redhat.com,
	dyoung@redhat.com, rdunlap@infradead.org, pmladek@suse.com,
	feng.tang@linux.alibaba.com, pawan.kumar.gupta@linux.intel.com,
	kees@kernel.org, elver@google.com, arnd@arndb.de,
	lirongqing@baidu.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 1/3] crash: Exclude crash kernel memory in crash core
Message-ID: <202602100901.prDQ1kLj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209095931.2813152-2-ruanjinjie@huawei.com>
Message-ID: <20260210064558.DxB9w0jFDZsOjlG7wN5WODhcLEXzCyq6SKiCoePeY94@z>

Hi Jinjie,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jinjie-Ruan/crash-Exclude-crash-kernel-memory-in-crash-core/20260209-180157
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20260209095931.2813152-2-ruanjinjie%40huawei.com
patch subject: [PATCH v4 1/3] crash: Exclude crash kernel memory in crash core
config: riscv-randconfig-r072-20260209 (https://download.01.org/0day-ci/archive/20260210/202602100901.prDQ1kLj-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202602100901.prDQ1kLj-lkp@intel.com/

smatch warnings:
kernel/crash_core.c:228 crash_prepare_elf64_headers() error: we previously assumed 'mem' could be null (see line 220)

vim +/mem +228 kernel/crash_core.c

aefb9e75df8949 Jinjie Ruan   2026-02-09  202  int crash_prepare_elf64_headers(int need_kernel_map, void **addr,
aefb9e75df8949 Jinjie Ruan   2026-02-09  203  				unsigned long *sz, unsigned long *nr_mem_ranges,
aefb9e75df8949 Jinjie Ruan   2026-02-09  204  				struct kimage *image, struct memory_notify *mn)
6f991cc363a326 Eric DeVolder 2023-08-14  205  {
6f991cc363a326 Eric DeVolder 2023-08-14  206  	unsigned long nr_cpus = num_possible_cpus(), nr_phdr, elf_sz;
6f991cc363a326 Eric DeVolder 2023-08-14  207  	unsigned long long notes_addr;
aefb9e75df8949 Jinjie Ruan   2026-02-09  208  	struct crash_mem *mem = NULL;
6f991cc363a326 Eric DeVolder 2023-08-14  209  	unsigned long mstart, mend;
aefb9e75df8949 Jinjie Ruan   2026-02-09  210  	unsigned int cpu, i;
aefb9e75df8949 Jinjie Ruan   2026-02-09  211  	unsigned char *buf;
aefb9e75df8949 Jinjie Ruan   2026-02-09  212  	Elf64_Ehdr *ehdr;
aefb9e75df8949 Jinjie Ruan   2026-02-09  213  	Elf64_Phdr *phdr;
aefb9e75df8949 Jinjie Ruan   2026-02-09  214  	int ret = 0;
aefb9e75df8949 Jinjie Ruan   2026-02-09  215  
aefb9e75df8949 Jinjie Ruan   2026-02-09  216  	ret = arch_get_crash_memory_ranges(&mem, nr_mem_ranges, image, mn);
aefb9e75df8949 Jinjie Ruan   2026-02-09  217  	if (ret)
aefb9e75df8949 Jinjie Ruan   2026-02-09  218  		return ret;
aefb9e75df8949 Jinjie Ruan   2026-02-09  219  
aefb9e75df8949 Jinjie Ruan   2026-02-09 @220  	if (mem) {
                                                    ^^^
If mem is NULL

aefb9e75df8949 Jinjie Ruan   2026-02-09  221  		ret = crash_exclude_mem_ranges(mem, nr_mem_ranges);
aefb9e75df8949 Jinjie Ruan   2026-02-09  222  		if (ret)
aefb9e75df8949 Jinjie Ruan   2026-02-09  223  			goto out;
aefb9e75df8949 Jinjie Ruan   2026-02-09  224  	}
6f991cc363a326 Eric DeVolder 2023-08-14  225  
6f991cc363a326 Eric DeVolder 2023-08-14  226  	/* extra phdr for vmcoreinfo ELF note */
6f991cc363a326 Eric DeVolder 2023-08-14  227  	nr_phdr = nr_cpus + 1;
6f991cc363a326 Eric DeVolder 2023-08-14 @228  	nr_phdr += mem->nr_ranges;
                                                           ^^^^^
This dereference will crash

6f991cc363a326 Eric DeVolder 2023-08-14  229  
6f991cc363a326 Eric DeVolder 2023-08-14  230  	/*
6f991cc363a326 Eric DeVolder 2023-08-14  231  	 * kexec-tools creates an extra PT_LOAD phdr for kernel text mapping
6f991cc363a326 Eric DeVolder 2023-08-14  232  	 * area (for example, ffffffff80000000 - ffffffffa0000000 on x86_64).
6f991cc363a326 Eric DeVolder 2023-08-14  233  	 * I think this is required by tools like gdb. So same physical
6f991cc363a326 Eric DeVolder 2023-08-14  234  	 * memory will be mapped in two ELF headers. One will contain kernel
6f991cc363a326 Eric DeVolder 2023-08-14  235  	 * text virtual addresses and other will have __va(physical) addresses.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

