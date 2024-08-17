Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47211EEE4
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Aug 2024 06:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723876490; cv=none; b=ZXrLDI+27JEydE1qo7VaR3d8xzF9O36t7pgCajgvIkAN/MGsB4tuGhPV1pO/TYbKIpAB8N6Ff6gRcxuY//cBwmsmtlkPsAz5ZeYPUtPHe/SBv8ZI0MkV47hheUwbWl1uxEBRqBjqj8tUdpjXvUc+GA0JF35HuuAu8EfurCYYly8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723876490; c=relaxed/simple;
	bh=K5G55BV4sxAcskeARpnd0D7sUngy4m6JzQxvc1RuAQc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=rImSMN2tX9oUrMHP6VNby9y8FpkjQLyKeZvkNYBS8XwoQN2Ny3PvqMeyUYm9EbfFimtqkNvCdMSvNGdF7TH9LG6KV37Ku0wB6waFW+8E1MV6AuG9Z+i2uE/9mEbLTVklWtJ1DYi4wAUSmMu4wV1hgYVyqx9b1Saa0m3d5Gt1MdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uoQEK/xF; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uoQEK/xF"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4280ee5f1e3so19425485e9.0
        for <oe-kbuild@lists.linux.dev>; Fri, 16 Aug 2024 23:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723876487; x=1724481287; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/4kJ+SDL4q2IZOSHPWYNi2T2AC3GCwL1SGtPY9SE9gY=;
        b=uoQEK/xF2NjL2PVPIfgQDPJHD7je/GadE0spByQHs/SYaJkp0ybGnW3JUH28Ur3RsA
         puW3qQXJ7QSkJkzk/Oh+ElhJGxXsAsdjjryRsfaGlZZXXNpQ2Yed9ncIw3C3iaaehBaU
         d9fYID4U2ujaaTPmTR756LJWCRMTW/QWrI4tCv84F94ht0/Mya1kS35C4MXNe1xOC8gH
         Ug5nbOxsBvLwDhvgYK9DhZzPXuOfd2v4S4sK1Rj04khLLug/ZB2XE0jiNps9FYY9TfdQ
         qehLU16Xsn9bPWbwv0IHTtzSH1YCoG+vSc5RuOGl4xQMSr9Hrqlyk6toIFUmUi6VMUFb
         tYCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723876487; x=1724481287;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/4kJ+SDL4q2IZOSHPWYNi2T2AC3GCwL1SGtPY9SE9gY=;
        b=mslnGNNspVas2i3ydEi6lMGuNRSFMAKlklnrgE9MjSpLZwCzDQWiRe38MwxcxPWuDy
         gwHJyD5/aR4U0Kr9GL1PP1+psHTZFXHspVs6P6Z4CV4Ygw++CtPdBTC+cih71D13ajYM
         t+TI7NBFDeKgBlMdiW9t8waN2mgGKErAhIq+Mms5yrSqDc37jwDCsw7CUCli5K9vNYtq
         /2mkkmWhTq6QycQN0m2nJHhOgLbFADDdH8e4XuCU8sKBE2gxBJhC7BvU9UXoBhgY8poq
         9O+z48/Kyc3EoD3nwovXeN5iC9rxzBRPRA1FGZlQfm+UoyE65urOCTyRveS/lRlEOE1r
         o+iQ==
X-Gm-Message-State: AOJu0YxlhKCgIktccWqLS1P4a4dtsMko4RCBfcuf6GMxML7J+VyAxbhL
	W+1Kz37vnABxLAP2EG0WpBb0YBUKmFDGupj8L2oZLMGhvKJBsAUbyNQACBXZGeOe30KDyg4zhOd
	T
X-Google-Smtp-Source: AGHT+IG6a1iyvKAKQRdZur0+EH3efshftmEDmK2z3J2W/cLM81IDeRZ6iqYcy4OjrShZjHeeZbn4EQ==
X-Received: by 2002:a05:600c:1f83:b0:428:fb7f:c831 with SMTP id 5b1f17b1804b1-429ed7e23eamr34604555e9.32.1723876486574;
        Fri, 16 Aug 2024 23:34:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429d877e066sm137607075e9.1.2024.08.16.23.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 23:34:45 -0700 (PDT)
Date: Sat, 17 Aug 2024 09:34:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Nitin Gote <nitin.r.gote@intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	venkata.ramana.nayana@intel.com, john.c.harrison@intel.com,
	chris.p.wilson@intel.com, tejas.upadhyay@intel.com,
	andi.shyti@intel.com, nitin.r.gote@intel.com
Subject: Re: [PATCH v10] drm/i915: WA context support for L3flush
Message-ID: <9c2fdce8-2f27-4307-ad68-036d7e32854e@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813061657.925443-1-nitin.r.gote@intel.com>

Hi Nitin,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nitin-Gote/drm-i915-WA-context-support-for-L3flush/20240814-231915
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240813061657.925443-1-nitin.r.gote%40intel.com
patch subject: [PATCH v10] drm/i915: WA context support for L3flush
config: i386-randconfig-141-20240816 (https://download.01.org/0day-ci/archive/20240817/202408170547.2jcHHUAr-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202408170547.2jcHHUAr-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4415 guc_kernel_context_pin() error: uninitialized symbol 'ret'.

vim +/ret +4415 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c

cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2023-02-17  4387  static inline int guc_kernel_context_pin(struct intel_guc *guc,
3a4cdf1982f05d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c Matthew Brost         2021-07-21  4388  					 struct intel_context *ce)
3a4cdf1982f05d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c Matthew Brost         2021-07-21  4389  {
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2023-02-17  4390  	int ret;
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2023-02-17  4391  
58ea7d620c5ebc drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2022-03-01  4392  	/*
58ea7d620c5ebc drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2022-03-01  4393  	 * Note: we purposefully do not check the returns below because
58ea7d620c5ebc drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2022-03-01  4394  	 * the registration can only fail if a reset is just starting.

Is this comment out of date?  Which returns aren't checked?

58ea7d620c5ebc drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2022-03-01  4395  	 * This is called at the end of reset so presumably another reset
58ea7d620c5ebc drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2022-03-01  4396  	 * isn't happening and even it did this code would be run again.
58ea7d620c5ebc drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2022-03-01  4397  	 */
58ea7d620c5ebc drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2022-03-01  4398  
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2023-02-17  4399  	if (context_guc_id_invalid(ce)) {
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2023-02-17  4400  		ret = pin_guc_id(guc, ce);
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2023-02-17  4401  
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2023-02-17  4402  		if (ret < 0)
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2023-02-17  4403  			return ret;
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2023-02-17  4404  	}
58ea7d620c5ebc drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2022-03-01  4405  
de51de9672a17e drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2022-11-02  4406  	if (!test_bit(CONTEXT_GUC_INIT, &ce->flags))
de51de9672a17e drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2022-11-02  4407  		guc_context_init(ce);
de51de9672a17e drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2022-11-02  4408  
078a89e7d6f60a drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c Venkata Ramana Nayana 2024-08-13  4409  	if (!intel_context_is_hidden(ce)) {
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2023-02-17  4410  		ret = try_context_registration(ce, true);
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2023-02-17  4411  		if (ret)
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2023-02-17  4412  			unpin_guc_id(guc, ce);
078a89e7d6f60a drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c Venkata Ramana Nayana 2024-08-13  4413  	}

ret is uninitialized of context_guc_id_invalid() is false and
intel_context_is_hidden() is true.

cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2023-02-17  4414  
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2023-02-17 @4415  	return ret;
3a4cdf1982f05d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c Matthew Brost         2021-07-21  4416  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

