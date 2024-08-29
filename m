Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D3018E045
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Aug 2024 09:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724925162; cv=none; b=RW2Pn7HEE1MM5BbhDvnhEFHungYF5wiwsao49bDSrqCzVx6Axuz8Wd/lBb9/02ALrRCroNZiIqpKQuEvw4WHNwlzfPglrK4Dsk6uycR4GLa5kHncpcbTwhFj93dVyqCLcm9VgUmqdunL2HbRUfEJwISAeHnS4o0QtgIL8dBqOHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724925162; c=relaxed/simple;
	bh=Y+T6S7M+2dFa5ZRqve7yIgokdF7s8y1gsHXMRzjGSJM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ZOJ14k0U8uqEERyJmR7f8PdytsKgtU0pupd1AW8WWUL3Utq4sAGlVTzSsLvZUMt99TPa+SosMj58PUYRY4qHhNUelgDGB0AuzU/e4EGFUkcvzV6Z9ofJdiKbtI7Gn/KkkMJaN1dzN3gdkVh8wyy0x38+Tax74wH62UZlh9D1tuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XzWPgDFg; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XzWPgDFg"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4281faefea9so4030315e9.2
        for <oe-kbuild@lists.linux.dev>; Thu, 29 Aug 2024 02:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724925158; x=1725529958; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KFBRjyGV0lPvd68K8DJSA4lIXPthFsZ2ifMKGzn/V34=;
        b=XzWPgDFgdxglMQDUB5g4bk0c21sm3TWTY0w4d9WPGjfGYpQOIHgJKQyzd6iqhuWuFV
         hy+oqVsU76X2RgUias5dIRKBNIPfUr28OJobjcwsnk4VNVQtzvjRPHDWj+u7eiEN2tiV
         E8lSpkVFTEy+toqiubd2xAIRwPv3h7bkI4gntSNjaX9FO3kQIoUYxyeptKuB1wbNwRLl
         6sLX2HShrJdSWU4caWNKE7RZuog1LF6Wb+RScZI7mlyWgOA1WfXeimB+3yd/hZiXdhkR
         aCm4a5EXiNBRuqmBZ6L3mx9V8hGkWHMKHEznPsh2H4BhdsxdNrUXh/IUKgIGOLV6j51/
         /otg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724925158; x=1725529958;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KFBRjyGV0lPvd68K8DJSA4lIXPthFsZ2ifMKGzn/V34=;
        b=X7GkmK1pH3gq04dwwP0IjycYtHyYeTBOtALSmXowxRAENK9TgthEX9q2bFUt18oP07
         bInAlu32mobbxDl0vGiKsGIJoZIklk9NgGxOijLwl3u6r48MfwtsXrgvb3uW9+tJt4pj
         8V7WxLPSmZuxE53KghHCKc81lxsqA9kBth49RehvmzuHHbSlWA7tndLN4YcXOZNUTkMB
         bGpVl0fUmeUgUnAvfFNrZ+g7mE264ngxFyxfZrVxf5DvgCUX4ZE8MkR+nW/iLKZZFfrk
         gA5qmINRnKAHEC2s79gDBzxOIFh5mrd6mz0Sk6Z+UZFuRNX5O5hiJwI/+B31fiOxi+tx
         HpvQ==
X-Gm-Message-State: AOJu0YwAAYnUfOdwNvDQrZd7HHD/oiaV32seMMh7sn8wj/gBkBDjjU2B
	Ap8XTUpO7LPzaUh76XuEaM0Ysig7GR8RK52FAuf83nqUp9Nv1GwmAY/6/8DZ9uvxDv6QpZk7i3V
	e
X-Google-Smtp-Source: AGHT+IGgxS3QiSRNzgbM8LQkFm7SVy6ofM/g7P+xwxLhA/gIrbtUOt6K5JY/F7ppwOwTxNbrPyKJXg==
X-Received: by 2002:a05:600c:1387:b0:426:5269:1a50 with SMTP id 5b1f17b1804b1-42bb01b91f6mr17580115e9.11.1724925157682;
        Thu, 29 Aug 2024 02:52:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6e27467sm11766665e9.38.2024.08.29.02.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 02:52:37 -0700 (PDT)
Date: Thu, 29 Aug 2024 12:52:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, jiping huang <huangjiping95@qq.com>,
	mturquette@baylibre.com, sboyd@kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, jiping huang <huangjiping95@qq.com>
Subject: Re: [PATCH] clk: Delete redundant logic.
Message-ID: <14dc830e-eff0-4c78-a6c7-ed41c11183e0@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_713186AE6290AC7B8037FD247F5BF04C0308@qq.com>

Hi jiping,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/jiping-huang/clk-Delete-redundant-logic/20240826-170900
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/tencent_713186AE6290AC7B8037FD247F5BF04C0308%40qq.com
patch subject: [PATCH] clk: Delete redundant logic.
config: x86_64-randconfig-161-20240827 (https://download.01.org/0day-ci/archive/20240829/202408291052.4ngp4ieh-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202408291052.4ngp4ieh-lkp@intel.com/

New smatch warnings:
drivers/clk/clk.c:2320 clk_calc_new_rates() error: uninitialized symbol 'parent'.
drivers/clk/clk.c:2332 clk_calc_new_rates() error: uninitialized symbol 'old_parent'.

vim +/parent +2320 drivers/clk/clk.c

4dff95dc9477a34 Stephen Boyd    2015-04-30  2282  static struct clk_core *clk_calc_new_rates(struct clk_core *core,
4dff95dc9477a34 Stephen Boyd    2015-04-30  2283  					   unsigned long rate)
4dff95dc9477a34 Stephen Boyd    2015-04-30  2284  {
4dff95dc9477a34 Stephen Boyd    2015-04-30  2285  	struct clk_core *top = core;
4dff95dc9477a34 Stephen Boyd    2015-04-30  2286  	struct clk_core *old_parent, *parent;
4dff95dc9477a34 Stephen Boyd    2015-04-30  2287  	unsigned long best_parent_rate = 0;
4dff95dc9477a34 Stephen Boyd    2015-04-30  2288  	unsigned long new_rate;
4dff95dc9477a34 Stephen Boyd    2015-04-30  2289  	unsigned long min_rate;
4dff95dc9477a34 Stephen Boyd    2015-04-30  2290  	unsigned long max_rate;
4dff95dc9477a34 Stephen Boyd    2015-04-30  2291  	int p_index = 0;
4dff95dc9477a34 Stephen Boyd    2015-04-30  2292  	long ret;
4dff95dc9477a34 Stephen Boyd    2015-04-30  2293  
4dff95dc9477a34 Stephen Boyd    2015-04-30  2294  	/* sanity */
4dff95dc9477a34 Stephen Boyd    2015-04-30  2295  	if (IS_ERR_OR_NULL(core))
4dff95dc9477a34 Stephen Boyd    2015-04-30  2296  		return NULL;
4dff95dc9477a34 Stephen Boyd    2015-04-30  2297  
4dff95dc9477a34 Stephen Boyd    2015-04-30  2298  	clk_core_get_boundaries(core, &min_rate, &max_rate);
71472c0c06cf9a3 James Hogan     2013-07-29  2299  
4dff95dc9477a34 Stephen Boyd    2015-04-30  2300  	/* find the closest rate and parent clk/rate */
0f6cc2b8e94da54 Jerome Brunet   2017-12-01  2301  	if (clk_core_can_round(core)) {
0817b62cc037a56 Boris Brezillon 2015-07-07  2302  		struct clk_rate_request req;
0817b62cc037a56 Boris Brezillon 2015-07-07  2303  
718af795d3fd786 Maxime Ripard   2022-08-16  2304  		clk_core_init_rate_req(core, &req, rate);
0f6cc2b8e94da54 Jerome Brunet   2017-12-01  2305  
49e62e0d96baf72 Maxime Ripard   2022-10-26  2306  		trace_clk_rate_request_start(&req);
49e62e0d96baf72 Maxime Ripard   2022-10-26  2307  
0f6cc2b8e94da54 Jerome Brunet   2017-12-01  2308  		ret = clk_core_determine_round_nolock(core, &req);
4dff95dc9477a34 Stephen Boyd    2015-04-30  2309  		if (ret < 0)
4dff95dc9477a34 Stephen Boyd    2015-04-30  2310  			return NULL;
035a61c314eb3da Tomeu Vizoso    2015-01-23  2311  
49e62e0d96baf72 Maxime Ripard   2022-10-26  2312  		trace_clk_rate_request_done(&req);
49e62e0d96baf72 Maxime Ripard   2022-10-26  2313  
0817b62cc037a56 Boris Brezillon 2015-07-07  2314  		best_parent_rate = req.best_parent_rate;
0817b62cc037a56 Boris Brezillon 2015-07-07  2315  		new_rate = req.rate;
0817b62cc037a56 Boris Brezillon 2015-07-07  2316  		parent = req.best_parent_hw ? req.best_parent_hw->core : NULL;
1c8e600440c7f50 Tomeu Vizoso    2015-01-23  2317  
4dff95dc9477a34 Stephen Boyd    2015-04-30  2318  		if (new_rate < min_rate || new_rate > max_rate)
4dff95dc9477a34 Stephen Boyd    2015-04-30  2319  			return NULL;
4dff95dc9477a34 Stephen Boyd    2015-04-30 @2320  	} else if (!parent || !(core->flags & CLK_SET_RATE_PARENT)) {
                                                                    ^^^^^^
parent isn't initialized.

4dff95dc9477a34 Stephen Boyd    2015-04-30  2321  		/* pass-through clock without adjustable parent */
4dff95dc9477a34 Stephen Boyd    2015-04-30  2322  		core->new_rate = core->rate;
4dff95dc9477a34 Stephen Boyd    2015-04-30  2323  		return NULL;
4dff95dc9477a34 Stephen Boyd    2015-04-30  2324  	} else {
4dff95dc9477a34 Stephen Boyd    2015-04-30  2325  		/* pass-through clock with adjustable parent */
4dff95dc9477a34 Stephen Boyd    2015-04-30  2326  		top = clk_calc_new_rates(parent, rate);
4dff95dc9477a34 Stephen Boyd    2015-04-30  2327  		new_rate = parent->new_rate;
4dff95dc9477a34 Stephen Boyd    2015-04-30  2328  		goto out;
1c8e600440c7f50 Tomeu Vizoso    2015-01-23  2329  	}
035a61c314eb3da Tomeu Vizoso    2015-01-23  2330  
4dff95dc9477a34 Stephen Boyd    2015-04-30  2331  	/* some clocks must be gated to change parent */
4dff95dc9477a34 Stephen Boyd    2015-04-30 @2332  	if (parent != old_parent &&
                                                                      ^^^^^^^^^^
old_parent is never set.

4dff95dc9477a34 Stephen Boyd    2015-04-30  2333  	    (core->flags & CLK_SET_PARENT_GATE) && core->prepare_count) {
4dff95dc9477a34 Stephen Boyd    2015-04-30  2334  		pr_debug("%s: %s not gated but wants to reparent\n",
4dff95dc9477a34 Stephen Boyd    2015-04-30  2335  			 __func__, core->name);
4dff95dc9477a34 Stephen Boyd    2015-04-30  2336  		return NULL;
035a61c314eb3da Tomeu Vizoso    2015-01-23  2337  	}
b2476490ef11134 Mike Turquette  2012-03-15  2338  
4dff95dc9477a34 Stephen Boyd    2015-04-30  2339  	/* try finding the new parent index */
4dff95dc9477a34 Stephen Boyd    2015-04-30  2340  	if (parent && core->num_parents > 1) {
4dff95dc9477a34 Stephen Boyd    2015-04-30  2341  		p_index = clk_fetch_parent_index(core, parent);
4dff95dc9477a34 Stephen Boyd    2015-04-30  2342  		if (p_index < 0) {
4dff95dc9477a34 Stephen Boyd    2015-04-30  2343  			pr_debug("%s: clk %s can not be parent of clk %s\n",
4dff95dc9477a34 Stephen Boyd    2015-04-30  2344  				 __func__, parent->name, core->name);
4dff95dc9477a34 Stephen Boyd    2015-04-30  2345  			return NULL;
4dff95dc9477a34 Stephen Boyd    2015-04-30  2346  		}
4dff95dc9477a34 Stephen Boyd    2015-04-30  2347  	}
b2476490ef11134 Mike Turquette  2012-03-15  2348  
4dff95dc9477a34 Stephen Boyd    2015-04-30  2349  	if ((core->flags & CLK_SET_RATE_PARENT) && parent &&
4dff95dc9477a34 Stephen Boyd    2015-04-30  2350  	    best_parent_rate != parent->rate)
4dff95dc9477a34 Stephen Boyd    2015-04-30  2351  		top = clk_calc_new_rates(parent, best_parent_rate);
035a61c314eb3da Tomeu Vizoso    2015-01-23  2352  
4dff95dc9477a34 Stephen Boyd    2015-04-30  2353  out:
4dff95dc9477a34 Stephen Boyd    2015-04-30  2354  	clk_calc_subtree(core, new_rate, parent, p_index);
b2476490ef11134 Mike Turquette  2012-03-15  2355  
4dff95dc9477a34 Stephen Boyd    2015-04-30  2356  	return top;
b2476490ef11134 Mike Turquette  2012-03-15  2357  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

