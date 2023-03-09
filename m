Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD58363D;
	Thu,  9 Mar 2023 04:35:21 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id v16so680986wrn.0;
        Wed, 08 Mar 2023 20:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678336520;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b2Xo/xHwfvK/YSqpt09zcRTWTIvjKdi+fUryvtYFyDA=;
        b=W7F+YKl5SZ+OmXzAToWTmFulNeX8DrYioVxTKcfu9zRpDimDUgIwZgDlvmnLcg4Md+
         wZuQEteq1k6uKzkesk5K0L4tiIl1wiRNGjEPjVG1l6yhOpCnj3sdw0YF8aZ2BHxGtLCv
         D7J8mkQ+8D4SzpNdNxEqxMePNK/lDlzpQklO0/0WErMTJyywL/x7nl314oBnFlWmmdFL
         jGrQetHC0HOCkVwlFEjL6+C2k1BQyjAQCUySFDE+9nu+1ZVjklnGpuEQJVXUt/1mwc7S
         fPQBDYo+4/pWdnpHt5vm0MgAbo7prJPPwFQKo0F57ALVEOXc53M0TFhoMY+rmg7Li8wf
         7MzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678336520;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b2Xo/xHwfvK/YSqpt09zcRTWTIvjKdi+fUryvtYFyDA=;
        b=6fNWqm5tdupGj9yI3GU5l06Qj0wMUUfxuL9JlEK15fqkXvzODDygXVPm9yxEvb09Ub
         HqVBT+CiRMmeSXSZ0BKyUZEtMXVnzcHKy2rGh5HlCdwAcHUBXVyic7rkKwHnJcWzNwyG
         yHW4kK4JBliyBmpeXGoVh5i4aCkwfAKvOOaOJweaRmKMPSfRf5l15QAoQlrruVGGyrVI
         hZOcZjIEpdkCuXSqlICrEF0ywAX2eu+sivRafYUId0SkdOawGskCdQmBELMwlwQmiiGO
         xMhODbBE20Rk+bRAF91AdHt9fayKHKkrbYSYA92dmhwZ3ZVdnN+bqojdVxEy+oWShorY
         5CfA==
X-Gm-Message-State: AO0yUKU9wqsM8ZJsp+t7ZrBdMqZC4lOlKeuF0Gen0GRIShzFt/h4mVT8
	8cZrd+j5Ewi7bCmN/Z7kxltW+cGdVyB4wEyo
X-Google-Smtp-Source: AK7set+8w9p9l1w+yOEp7qFdAf9LqEuXB0fQZvT2WFR+hUuvO6kKQpFCVz8biYkYYKowkY/tUKkNqA==
X-Received: by 2002:adf:e641:0:b0:2cd:e125:4559 with SMTP id b1-20020adfe641000000b002cde1254559mr14423735wrn.29.1678336519689;
        Wed, 08 Mar 2023 20:35:19 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c10-20020adffb0a000000b002ce72cff2ecsm7158846wrr.72.2023.03.08.20.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 20:35:19 -0800 (PST)
Date: Thu, 9 Mar 2023 07:35:15 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Andrii Nakryiko <andrii@kernel.org>,
	bpf@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, andrii@kernel.org,
	kernel-team@meta.com, Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH v4 bpf-next 3/8] bpf: add support for open-coded iterator
 loops
Message-ID: <1399021d-b06a-447c-94ca-6cc657c9c0b2@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230308035416.2591326-4-andrii@kernel.org>

Hi Andrii,

url:    https://github.com/intel-lab-lkp/linux/commits/Andrii-Nakryiko/bpf-factor-out-fetching-basic-kfunc-metadata/20230308-115539
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230308035416.2591326-4-andrii%40kernel.org
patch subject: [PATCH v4 bpf-next 3/8] bpf: add support for open-coded iterator loops
config: loongarch-randconfig-m041-20230305 (https://download.01.org/0day-ci/archive/20230309/202303090153.YeswNcW4-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303090153.YeswNcW4-lkp@intel.com/

smatch warnings:
kernel/bpf/verifier.c:1244 is_iter_reg_valid_uninit() error: uninitialized symbol 'j'.

vim +/j +1244 kernel/bpf/verifier.c

8f263e1296a91f Andrii Nakryiko 2023-03-07  1225  static bool is_iter_reg_valid_uninit(struct bpf_verifier_env *env,
8f263e1296a91f Andrii Nakryiko 2023-03-07  1226  				     struct bpf_reg_state *reg, int nr_slots)
8f263e1296a91f Andrii Nakryiko 2023-03-07  1227  {
8f263e1296a91f Andrii Nakryiko 2023-03-07  1228  	struct bpf_func_state *state = func(env, reg);
8f263e1296a91f Andrii Nakryiko 2023-03-07  1229  	int spi, i, j;
8f263e1296a91f Andrii Nakryiko 2023-03-07  1230  
8f263e1296a91f Andrii Nakryiko 2023-03-07  1231  	/* For -ERANGE (i.e. spi not falling into allocated stack slots), we
8f263e1296a91f Andrii Nakryiko 2023-03-07  1232  	 * will do check_mem_access to check and update stack bounds later, so
8f263e1296a91f Andrii Nakryiko 2023-03-07  1233  	 * return true for that case.
8f263e1296a91f Andrii Nakryiko 2023-03-07  1234  	 */
8f263e1296a91f Andrii Nakryiko 2023-03-07  1235  	spi = iter_get_spi(env, reg, nr_slots);
8f263e1296a91f Andrii Nakryiko 2023-03-07  1236  	if (spi == -ERANGE)
8f263e1296a91f Andrii Nakryiko 2023-03-07  1237  		return true;
8f263e1296a91f Andrii Nakryiko 2023-03-07  1238  	if (spi < 0)
8f263e1296a91f Andrii Nakryiko 2023-03-07  1239  		return spi;
8f263e1296a91f Andrii Nakryiko 2023-03-07  1240  
8f263e1296a91f Andrii Nakryiko 2023-03-07  1241  	for (i = 0; i < nr_slots; i++) {
8f263e1296a91f Andrii Nakryiko 2023-03-07  1242  		struct bpf_stack_state *slot = &state->stack[spi - i];
8f263e1296a91f Andrii Nakryiko 2023-03-07  1243  
8f263e1296a91f Andrii Nakryiko 2023-03-07 @1244  		if (slot->slot_type[j] == STACK_ITER)
                                                                                    ^
s/j/i/?

8f263e1296a91f Andrii Nakryiko 2023-03-07  1245  			return false;
8f263e1296a91f Andrii Nakryiko 2023-03-07  1246  	}
8f263e1296a91f Andrii Nakryiko 2023-03-07  1247  
8f263e1296a91f Andrii Nakryiko 2023-03-07  1248  	return true;
8f263e1296a91f Andrii Nakryiko 2023-03-07  1249  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

