Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AE31CA0D
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Jul 2023 21:07:23 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3fe104df822so9294995e9.1
        for <oe-kbuild@lists.linux.dev>; Fri, 28 Jul 2023 14:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690578442; x=1691183242;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+tc5WwtQqVsq4j0Ng1nFQLroD3hTGoZzgxCO5bF57RU=;
        b=hgfb1j8+G7jM0SKIFxCQ4YMrmQcm37/bIgbz+iH9Xr5WgM+IzWMQ0uuCEZR2J80atC
         UvIWv9wpE/+L+bFrOXCQZi0RIz/B0CGjvhF5wiu6LnjVlYi+SkRzVMeH/LDbwU2fZ33D
         w/iKZkQIDWfC1sYoNaBhcjyTcbzxs9W3eGqZxlRltsX05/WXniJyQhrxDrCsoTwD32n+
         r6N8MWthvCiNPuV1wS7MiQb+SW0x/Jy14c2F4hq+9zqebL9r3cx6Sl26BbpH/6j5jNQd
         h60Nbi+PxGBFk2HIE+Ont/euLFzhy0Mth2z7rdK181b7hLbZ63vWaWRbDxseNCWTVhNO
         ug5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690578442; x=1691183242;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+tc5WwtQqVsq4j0Ng1nFQLroD3hTGoZzgxCO5bF57RU=;
        b=ahanUilnZfNLNNX/HlHfUj8RUkhmlU1Hz3ZsYPOGsNwyn9m3INLNku7qE4wVQkwRJl
         XPejnNOyTGX6FzEnflw9M/t24sC+E9x6oXnVHrx1TZ3Yn0wqEKBpNy0P3h+eU5ZNR9MG
         DLp2End5DT/PIaUJt9FqWxYVGeXlQPgmUOtHUgAP50imSK90NlDhHD09cXbTVhP0g15s
         UZUW3+TidK2ZWGpFQyQleHXbQYc/YekJaChVDwLDL/VHwbl7H4m9EQ9BlSODFPJGDMYh
         iBrJnA1hHPhc1C69nRDNzR0e0FI7WF+KSxAImQBiKX6ZA2H47W8kCkmK2JECblYiiGtl
         Km0g==
X-Gm-Message-State: ABy/qLZD1c0/e3lSEHSI8c6AXF2ysAuqp0G3dcMFYeBDHUBkZI72MCAr
	zFdXaKiIg8OxfkdXdu8f+OA0tnlFFENt1JD4LRs=
X-Google-Smtp-Source: APBJJlGs4F53MvZH94sNJVHkiwHSOMqi3atyD92zQwepoMb1wRHIcQFnsQuzBmz0B+w9U13MXQRZIA==
X-Received: by 2002:a05:600c:214d:b0:3fd:4880:2aa5 with SMTP id v13-20020a05600c214d00b003fd48802aa5mr2968219wml.28.1690578441761;
        Fri, 28 Jul 2023 14:07:21 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y17-20020a05600c20d100b003fba6709c68sm4996962wmm.47.2023.07.28.14.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 14:07:21 -0700 (PDT)
Date: Sat, 29 Jul 2023 00:07:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Simon Horman <horms@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/remoteproc/pru_rproc.c:341 pru_rproc_set_ctable() warn:
 variable dereferenced before IS_ERR check 'rproc' (see line 335)
Message-ID: <ecf8338f-53dd-4de2-b5a1-e7c6f9229edc@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Simon,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f837f0a3c94882a29e38ff211a36c1c8a0f07804
commit: e752f9b924a1fd1afcf36e51b03dfa9c3096a3bd soc: ti: pruss: Allow compile-testing
config: csky-randconfig-m041-20230727 (https://download.01.org/0day-ci/archive/20230729/202307290417.hrgfPCcg-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307290417.hrgfPCcg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202307290417.hrgfPCcg-lkp@intel.com/

smatch warnings:
drivers/remoteproc/pru_rproc.c:341 pru_rproc_set_ctable() warn: variable dereferenced before IS_ERR check 'rproc' (see line 335)

vim +/rproc +341 drivers/remoteproc/pru_rproc.c

102853400321bae Roger Quadros   2023-01-06  333  int pru_rproc_set_ctable(struct rproc *rproc, enum pru_ctable_idx c, u32 addr)
102853400321bae Roger Quadros   2023-01-06  334  {
102853400321bae Roger Quadros   2023-01-06 @335  	struct pru_rproc *pru = rproc->priv;
                                                                                ^^^^^^^^^^^^
Dereference

102853400321bae Roger Quadros   2023-01-06  336  	unsigned int reg;
102853400321bae Roger Quadros   2023-01-06  337  	u32 mask, set;
102853400321bae Roger Quadros   2023-01-06  338  	u16 idx;
102853400321bae Roger Quadros   2023-01-06  339  	u16 idx_mask;
102853400321bae Roger Quadros   2023-01-06  340  
102853400321bae Roger Quadros   2023-01-06 @341  	if (IS_ERR_OR_NULL(rproc))
102853400321bae Roger Quadros   2023-01-06  342  		return -EINVAL;

Checked too late.  Also ideally it would be:

	if (IS_ERR_OR_NULL(rproc))
		return PTR_ERR(rproc);

If a pointer can be both error and NULL then generally the NULL is a
special kind of success.  It means the option is turned off so there
is nothing to do, so an early return is success.

https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/


102853400321bae Roger Quadros   2023-01-06  343  
102853400321bae Roger Quadros   2023-01-06  344  	if (!rproc->dev.parent || !is_pru_rproc(rproc->dev.parent))
102853400321bae Roger Quadros   2023-01-06  345  		return -ENODEV;
102853400321bae Roger Quadros   2023-01-06  346  
102853400321bae Roger Quadros   2023-01-06  347  	/* pointer is 16 bit and index is 8-bit so mask out the rest */
102853400321bae Roger Quadros   2023-01-06  348  	idx_mask = (c >= PRU_C28) ? 0xFFFF : 0xFF;
102853400321bae Roger Quadros   2023-01-06  349  
102853400321bae Roger Quadros   2023-01-06  350  	/* ctable uses bit 8 and upwards only */
102853400321bae Roger Quadros   2023-01-06  351  	idx = (addr >> 8) & idx_mask;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

