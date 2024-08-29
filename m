Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC80918CC00
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Aug 2024 09:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724923566; cv=none; b=olwrXvf/H9UyGEXcOD6pDAD1zcXP7qd+f/FiBQaD8Zb8zw8kLklthPorHkEs7eixxX5K7h7hipSvZO1kDyaeF6z9XiS0STvwHCRIzC7m8sGmcMB9m5bfyYsKGpPzNOQdELGphNoPAGVZiqUbR1BDwhMAHxqJhDCVfLpi5oq0Tvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724923566; c=relaxed/simple;
	bh=uutYeKyO7LdsKfzYZjAxmuhW/jm/YwmRfv23rebccWo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=HmnrzuqcxIu3cnws5NacgnQQ/e55SctxAJjxeLnghFKVGYfAQmgDMS5tDAetHU2SsqxtLNI9E+L3VLiQXpJPe7wu1zJnHVOzMuxEXXKkF8cJMxto1LP9Hl5ysOthkdwuObk1JQuLgczAxU8Snqrrek/pALdFF6MOa63jmV8llx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WNbl5/q0; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WNbl5/q0"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42bb4f8a4bfso3242865e9.1
        for <oe-kbuild@lists.linux.dev>; Thu, 29 Aug 2024 02:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724923562; x=1725528362; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gAvX4nxugzvLLHwzqMBg3PEBh+8hsK2td8y9rNRJjlY=;
        b=WNbl5/q0NUsN5rmHPKXtotzD/99nZzNHQAzdPg9yOuMCEwT+LHcj4Si6GWQ/Rhev0/
         OrQKdTEwyR49V548VcHqtwDmKHDZra902TSjTIe1OEyuqWuXcMxolISmq/iex+Y9tUZ4
         IYYen2LWnXrUqcFPFGXqE8Z+iPAKrZBl+yXGqsRVwe03APaH7LVDjHqb04tRYfas7NA6
         rYikZDkYDqvg44gJyQqtiFUseRThP5stdtPUBjVz6pxjtCDwUuRayG9VW8ldieEEnmh5
         HMsyuw4Hx1kH8gvKlD0aTjetwiPY5J8BMHkKSCmYHP5LKucsSius7Va8RUkDS9T4RCkh
         1SJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724923562; x=1725528362;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gAvX4nxugzvLLHwzqMBg3PEBh+8hsK2td8y9rNRJjlY=;
        b=YvYzdoR0fRKDoI5VjiN2o8x+gOYyylCjRu+YDjxTS4FLEiYQTtj/6gw/96g6VGECxm
         ciAy4lmTTDyQ1jp6pbju08IC6nbLJwkWQpuvhhwk3NALD2MKkj8pB9X+G/ojZWxrlRxb
         RMcdV4EuZAPSs2i9TkBPuSaOhwbZkend08d2QGgBUSLcM4V87s95/i/iVOo3NeXoXxJ/
         lfQn11WZGfuqOoeNrSU4E8A2nAAkoTRRKoQbRKLFhHQMhFhBqT32KdS9NbMVi9CJqupj
         uMEp9HBCMPiPzkDmUxmhKqKDhtU7MMENrh05I4QkJ72Bu+fpx/8Yiy/G/1G0seRCqov3
         /WmQ==
X-Gm-Message-State: AOJu0Yw9ue8rvHXVsKScG8wTwG9sYm5DN52l9YDV8lUnbe81qAVPE87D
	dcVsKzyKNCl24u6uxUTYZ+Qp9yzQ9CURPF7gvnc6y7l/V1TZtkWeZsjBKevTg50faIO6BAF6ZhN
	s
X-Google-Smtp-Source: AGHT+IHS0mdsJlWj1rrvXndoz5Oe14EVmdyVaw6esL3Lk15aOpT3/U6xPInumH4Z/7S66CPs1y9WnA==
X-Received: by 2002:a05:600c:1909:b0:426:526f:4a1f with SMTP id 5b1f17b1804b1-42bb74549a5mr6726015e9.16.1724923561802;
        Thu, 29 Aug 2024 02:26:01 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba6396580sm44599855e9.9.2024.08.29.02.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 02:26:01 -0700 (PDT)
Date: Thu, 29 Aug 2024 12:25:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	kernel-dev@igalia.com, krisman@kernel.org,
	Daniel Rosenberg <drosen@google.com>, smcv@collabora.com,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Subject: Re: [PATCH 3/5] tmpfs: Create casefold mount options
Message-ID: <fc502406-af31-439c-b8fe-94518dd7c800@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240823173332.281211-4-andrealmeid@igalia.com>

Hi André,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andr-Almeida/tmpfs-Add-casefold-lookup-support/20240826-135457
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240823173332.281211-4-andrealmeid%40igalia.com
patch subject: [PATCH 3/5] tmpfs: Create casefold mount options
config: x86_64-randconfig-161-20240827 (https://download.01.org/0day-ci/archive/20240829/202408290349.lp2Eq74b-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202408290349.lp2Eq74b-lkp@intel.com/

smatch warnings:
mm/shmem.c:4307 shmem_parse_opt_casefold() error: uninitialized symbol 'maj'.
mm/shmem.c:4307 shmem_parse_opt_casefold() error: uninitialized symbol 'min'.
mm/shmem.c:4307 shmem_parse_opt_casefold() error: uninitialized symbol 'rev'.

vim +/maj +4307 mm/shmem.c

a024e87c2944676 André Almeida 2024-08-23  4291  static int shmem_parse_opt_casefold(struct fs_context *fc, struct fs_parameter *param)
a024e87c2944676 André Almeida 2024-08-23  4292  {
a024e87c2944676 André Almeida 2024-08-23  4293  	struct shmem_options *ctx = fc->fs_private;
a024e87c2944676 André Almeida 2024-08-23  4294  	unsigned int maj, min, rev, version_number;
a024e87c2944676 André Almeida 2024-08-23  4295  	char version[10];
a024e87c2944676 André Almeida 2024-08-23  4296  	int ret;
a024e87c2944676 André Almeida 2024-08-23  4297  	struct unicode_map *encoding;
a024e87c2944676 André Almeida 2024-08-23  4298  
a024e87c2944676 André Almeida 2024-08-23  4299  	if (strncmp(param->string, "utf8-", 5))
a024e87c2944676 André Almeida 2024-08-23  4300  		return invalfc(fc, "Only utf8 encondings are supported");
a024e87c2944676 André Almeida 2024-08-23  4301  	ret = strscpy(version, param->string + 5, sizeof(version));
a024e87c2944676 André Almeida 2024-08-23  4302  	if (ret < 0)
a024e87c2944676 André Almeida 2024-08-23  4303  		return invalfc(fc, "Invalid enconding argument: %s",
a024e87c2944676 André Almeida 2024-08-23  4304  			       param->string);
a024e87c2944676 André Almeida 2024-08-23  4305  
a024e87c2944676 André Almeida 2024-08-23  4306  	utf8_parse_version(version, &maj, &min, &rev);

No error checking

a024e87c2944676 André Almeida 2024-08-23 @4307  	version_number = UNICODE_AGE(maj, min, rev);
                                                                                     ^^^^^^^^^^^^^

a024e87c2944676 André Almeida 2024-08-23  4308  	encoding = utf8_load(version_number);
a024e87c2944676 André Almeida 2024-08-23  4309  	if (IS_ERR(encoding))
a024e87c2944676 André Almeida 2024-08-23  4310  		return invalfc(fc, "Invalid utf8 version: %s", version);
a024e87c2944676 André Almeida 2024-08-23  4311  	pr_info("tmpfs: Using encoding provided by mount options: %s\n",
a024e87c2944676 André Almeida 2024-08-23  4312  		param->string);
a024e87c2944676 André Almeida 2024-08-23  4313  	ctx->encoding = encoding;
a024e87c2944676 André Almeida 2024-08-23  4314  
a024e87c2944676 André Almeida 2024-08-23  4315  	return 0;
a024e87c2944676 André Almeida 2024-08-23  4316  }
a024e87c2944676 André Almeida 2024-08-23  4317  #else
a024e87c2944676 André Almeida 2024-08-23  4318  static int shmem_parse_opt_casefold(struct fs_context *fc, struct fs_parameter *param)
a024e87c2944676 André Almeida 2024-08-23  4319  {
a024e87c2944676 André Almeida 2024-08-23  4320  	return invalfc(fc, "tmpfs: No kernel support for casefold filesystems\n");
a024e87c2944676 André Almeida 2024-08-23  4321  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

