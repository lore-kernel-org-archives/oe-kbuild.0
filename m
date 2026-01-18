Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FBF326957
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Jan 2026 12:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768738297; cv=none; b=ozLOtA5mgmgwz5RDqR84MdTI5MGm2h0pHSR5eX3I4g6Vr7o15qSa/4oAynVEN/XAQrwdvQeUyNBsNVKnCvRiwbChoj3H4VFoS9nv7PFFx/rl8z84H84rluLAam9icfHb3NGM/0kJGAbZoDdw3iyLjqqf2l+2reuFCYpirid7ThU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768738297; c=relaxed/simple;
	bh=pw8i2oTn0dUE0Vlg6iyxzQcb+00hCjeXpu2plciF3Xw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pvPiEa4/A1lCzsIfXzMBk97QK5U96+e7H3KHjg1ex0yyS5Yx4uVHwYijTq+FDuiOZ1FSmp1U3JerO5tOIvq7uBK+RejPsSjKRoOxZBLudvFZILEQILPyQ2yh5VxKisEh/3M1RrmUOBPi2rV2rKgjZBJ+Wn3iBC7nIq5pJR+6xo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XHWlVYkY; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XHWlVYkY"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4801d21c411so10169285e9.3
        for <oe-kbuild@lists.linux.dev>; Sun, 18 Jan 2026 04:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768738293; x=1769343093; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1BHQWu3bSMVGOSEGZ95xq8reqfqW8av90mqzN0pUGIc=;
        b=XHWlVYkYSjdtT9HZ1y7LrFAspYKf7k7ZNv2EmDvjdXTln+Eoq2tkn47yi9neTwTZlN
         Yh1zzA54AXeVsHkvmI+Dl/e+/2OgHFW9682pphYy5oxNyIeCmBb66syNxKgh6rxVrfa5
         GvT7or1BKn/ejy+RzNRGeNk/vxbBdV5tOe62smUygd4xrRctA+tmk68bOsmBxsypefhS
         sce0DfaYYJGyubEUKNDSgtcJ57th+m4TbCl1OBgUzlU3YQV7KvmvWMKVFHqWXa7h+hEp
         MjdCFIy8AF7qvYCajOcz2IUkaUidFi4lc2OZ9jOtxOfpZjDnf5P9kgx5XYu2GYlKjiu5
         VGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768738293; x=1769343093;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1BHQWu3bSMVGOSEGZ95xq8reqfqW8av90mqzN0pUGIc=;
        b=mIZzD6dp5WuuRzWfrL3TL7mgnfjRz+tM1cIbH6YNvOBE4z+sDKWg1rHPU/bEgz1St6
         X16HNRGp6gbEFKLVQqY6GaMYszHgwBQbJM8xQ3fuQCYrQvbROxaJnFtEcyEFts8cJtzF
         sHbMNiUijxAdXA0BgybJRG0TWN29YYzbarspgsF39PZQ1+0i4hRLn6JPnyqajBwegohY
         I93vhWNxoffGOEJ2CtxmQ10fkqtxdr78H+9jcKjKuQ6LXG+ya5jYGqEASc15QskkLWe6
         5g0wnAgrP1viMhcmigaQOcqxMlu7JkSrZIgpUr6e7xB+F4IUNF/Nj787L5Nk7X9XR9HN
         tqgw==
X-Gm-Message-State: AOJu0Yw+okSLHvMCzav/4tWPHr0pCZqc1MIe7vnVBox1+UzAixwKNCJX
	VKAZSgIEEnkrGiJ5judwSaILEug/9spyaSQR/BJbNAx57WuVwVjQbMa2wA7JfOZrw0gjjtcN9xk
	jjXPl
X-Gm-Gg: AY/fxX4s41ywyPaUZs7jTcgVt+VntxoIZWVtI+9SM1oulROBjN6oqLO5QBAYRMLGjus
	8waeOvvhPQrvSWrdlJ/7wZYmYVUSUyuG122ZbseToSz8L4yfLWtkExvqwMDXBW1Z2xMohFKiEug
	4h4JHC9kpO5UA88+Uhyn+UFPXft95LEpROvT6NXAWJWjrkRe3uLBUtuYg0AM+fN+miA2DbnlzGJ
	RH4l/zkwLqNIAhutUjhBYi9yVA+vS+mIVTMf564N5xWjjFDuGe6+Ab62jg/DHoumxah+VnWKG1a
	q7bfjhwEiC+yKTjpD6dQjmVMteF+8KKlyd+N2XGJ+pmK9NvqvwXPEk9SsXH6GxmKif4Xj4J9LPs
	/iCvGkEJjbc8AqQ/HKCGHHKx86KZE4XKsbiO5zRSRRJ+SpZtk2PME0FcfJ9yFn/M5+AHbW9k77S
	zxlNieFiUGtBjSCVqW
X-Received: by 2002:a05:600c:1d15:b0:47d:403c:e5a0 with SMTP id 5b1f17b1804b1-4801e30b9b3mr99848655e9.12.1768738292639;
        Sun, 18 Jan 2026 04:11:32 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b267661sm196690915e9.13.2026.01.18.04.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 04:11:32 -0800 (PST)
Date: Sun, 18 Jan 2026 15:11:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Conor Dooley <conor+lkp@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [conor:pinctrl 7/14] drivers/pinctrl/pinconf-generic.c:268
 parse_dt_cfg() error: uninitialized symbol 'val'.
Message-ID: <202601161219.t7K6GhHj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260118121129.zlZiFgWG-dMXmDNXGFVcrrzDsLugl1KF9B-K0-UWFsw@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl
head:   8a26d7f359a1052acb67617f632364d0527d9498
commit: cda61ccb5e996faddddd3668b288b5ae30814e02 [7/14] pinctrl: pinconf-generic: perform basic checks on pincfg properties
config: arm64-randconfig-r071-20260116 (https://download.01.org/0day-ci/archive/20260116/202601161219.t7K6GhHj-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601161219.t7K6GhHj-lkp@intel.com/

smatch warnings:
drivers/pinctrl/pinconf-generic.c:268 parse_dt_cfg() error: uninitialized symbol 'val'.

vim +/val +268 drivers/pinctrl/pinconf-generic.c

90a18c512884ad Antonio Borneo  2025-10-23  220  static int parse_dt_cfg(struct device_node *np,
f684e4ac9f4bae Linus Walleij   2015-01-12  221  			const struct pinconf_generic_params *params,
dd4d01f7bad886 Soren Brinkmann 2015-01-09  222  			unsigned int count, unsigned long *cfg,
dd4d01f7bad886 Soren Brinkmann 2015-01-09  223  			unsigned int *ncfg)
dd4d01f7bad886 Soren Brinkmann 2015-01-09  224  {
cda61ccb5e996f Conor Dooley    2025-11-28  225  	unsigned long *properties;
cda61ccb5e996f Conor Dooley    2025-11-28  226  	int i, test;
cda61ccb5e996f Conor Dooley    2025-11-28  227  
cda61ccb5e996f Conor Dooley    2025-11-28  228  	properties = bitmap_zalloc(count, GFP_KERNEL);
dd4d01f7bad886 Soren Brinkmann 2015-01-09  229  
dd4d01f7bad886 Soren Brinkmann 2015-01-09  230  	for (i = 0; i < count; i++) {
dd4d01f7bad886 Soren Brinkmann 2015-01-09  231  		u32 val;
dd4d01f7bad886 Soren Brinkmann 2015-01-09  232  		int ret;
f684e4ac9f4bae Linus Walleij   2015-01-12  233  		const struct pinconf_generic_params *par = &params[i];
dd4d01f7bad886 Soren Brinkmann 2015-01-09  234  
90a18c512884ad Antonio Borneo  2025-10-23  235  		if (par->values && par->num_values) {
90a18c512884ad Antonio Borneo  2025-10-23  236  			ret = fwnode_property_match_property_string(of_fwnode_handle(np),
90a18c512884ad Antonio Borneo  2025-10-23  237  								    par->property,
90a18c512884ad Antonio Borneo  2025-10-23  238  								    par->values, par->num_values);
90a18c512884ad Antonio Borneo  2025-10-23  239  			if (ret == -ENOENT)
90a18c512884ad Antonio Borneo  2025-10-23  240  				return ret;
90a18c512884ad Antonio Borneo  2025-10-23  241  			if (ret >= 0) {
90a18c512884ad Antonio Borneo  2025-10-23  242  				val = ret;
90a18c512884ad Antonio Borneo  2025-10-23  243  				ret = 0;
90a18c512884ad Antonio Borneo  2025-10-23  244  			}
90a18c512884ad Antonio Borneo  2025-10-23  245  		} else {
dd4d01f7bad886 Soren Brinkmann 2015-01-09  246  			ret = of_property_read_u32(np, par->property, &val);
90a18c512884ad Antonio Borneo  2025-10-23  247  		}
dd4d01f7bad886 Soren Brinkmann 2015-01-09  248  
dd4d01f7bad886 Soren Brinkmann 2015-01-09  249  		/* property not found */
dd4d01f7bad886 Soren Brinkmann 2015-01-09  250  		if (ret == -EINVAL)
dd4d01f7bad886 Soren Brinkmann 2015-01-09  251  			continue;
dd4d01f7bad886 Soren Brinkmann 2015-01-09  252  
cda61ccb5e996f Conor Dooley    2025-11-28  253  		/* if param is greater than count, these are custom properties */
cda61ccb5e996f Conor Dooley    2025-11-28  254  		if (par->param <= count) {
cda61ccb5e996f Conor Dooley    2025-11-28  255  			ret = test_and_set_bit(par->param, properties);

This ret = should be after this:

cda61ccb5e996f Conor Dooley    2025-11-28  256  			if (ret) {
cda61ccb5e996f Conor Dooley    2025-11-28  257  				pr_err("%s: conflicting setting detected for %s\n",
cda61ccb5e996f Conor Dooley    2025-11-28  258  				       np->name, par->property);
cda61ccb5e996f Conor Dooley    2025-11-28  259  				bitmap_free(properties);
cda61ccb5e996f Conor Dooley    2025-11-28  260  				return -EINVAL;
cda61ccb5e996f Conor Dooley    2025-11-28  261  			}
cda61ccb5e996f Conor Dooley    2025-11-28  262  		}
cda61ccb5e996f Conor Dooley    2025-11-28  263  
dd4d01f7bad886 Soren Brinkmann 2015-01-09  264  		/* use default value, when no value is specified */
dd4d01f7bad886 Soren Brinkmann 2015-01-09  265  		if (ret)
dd4d01f7bad886 Soren Brinkmann 2015-01-09  266  			val = par->default_value;

Use default value for "val"

dd4d01f7bad886 Soren Brinkmann 2015-01-09  267  
dd4d01f7bad886 Soren Brinkmann 2015-01-09 @268  		pr_debug("found %s with value %u\n", par->property, val);
dd4d01f7bad886 Soren Brinkmann 2015-01-09  269  		cfg[*ncfg] = pinconf_to_config_packed(par->param, val);

otherwise val could be uninitialized here.

dd4d01f7bad886 Soren Brinkmann 2015-01-09  270  		(*ncfg)++;
dd4d01f7bad886 Soren Brinkmann 2015-01-09  271  	}
90a18c512884ad Antonio Borneo  2025-10-23  272  
cda61ccb5e996f Conor Dooley    2025-11-28  273  	if (test_bit(PIN_CONFIG_DRIVE_STRENGTH, properties) &&
cda61ccb5e996f Conor Dooley    2025-11-28  274  			test_bit(PIN_CONFIG_DRIVE_STRENGTH_UA, properties))
cda61ccb5e996f Conor Dooley    2025-11-28  275  		pr_err("%s: cannot have multiple drive strength properties\n",
cda61ccb5e996f Conor Dooley    2025-11-28  276  		       np->name);
cda61ccb5e996f Conor Dooley    2025-11-28  277  
cda61ccb5e996f Conor Dooley    2025-11-28  278  	test = test_bit(PIN_CONFIG_BIAS_BUS_HOLD, properties) +
cda61ccb5e996f Conor Dooley    2025-11-28  279  		test_bit(PIN_CONFIG_BIAS_DISABLE, properties) +
cda61ccb5e996f Conor Dooley    2025-11-28  280  		test_bit(PIN_CONFIG_BIAS_HIGH_IMPEDANCE, properties) +
cda61ccb5e996f Conor Dooley    2025-11-28  281  		test_bit(PIN_CONFIG_BIAS_PULL_UP, properties) +
cda61ccb5e996f Conor Dooley    2025-11-28  282  		test_bit(PIN_CONFIG_BIAS_PULL_PIN_DEFAULT, properties) +
cda61ccb5e996f Conor Dooley    2025-11-28  283  		test_bit(PIN_CONFIG_BIAS_PULL_DOWN, properties);
cda61ccb5e996f Conor Dooley    2025-11-28  284  	if (test > 1)
cda61ccb5e996f Conor Dooley    2025-11-28  285  		pr_err("%s: cannot have multiple bias configurations\n",
cda61ccb5e996f Conor Dooley    2025-11-28  286  		       np->name);
cda61ccb5e996f Conor Dooley    2025-11-28  287  
cda61ccb5e996f Conor Dooley    2025-11-28  288  	test = test_bit(PIN_CONFIG_DRIVE_OPEN_DRAIN, properties) +
cda61ccb5e996f Conor Dooley    2025-11-28  289  		test_bit(PIN_CONFIG_DRIVE_OPEN_SOURCE, properties) +
cda61ccb5e996f Conor Dooley    2025-11-28  290  		test_bit(PIN_CONFIG_DRIVE_PUSH_PULL, properties);
cda61ccb5e996f Conor Dooley    2025-11-28  291  	if (test > 1)
cda61ccb5e996f Conor Dooley    2025-11-28  292  		pr_err("%s: cannot have multiple drive configurations\n",
cda61ccb5e996f Conor Dooley    2025-11-28  293  		       np->name);
cda61ccb5e996f Conor Dooley    2025-11-28  294  
cda61ccb5e996f Conor Dooley    2025-11-28  295  	bitmap_free(properties);
90a18c512884ad Antonio Borneo  2025-10-23  296  	return 0;
dd4d01f7bad886 Soren Brinkmann 2015-01-09  297  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

