Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0A525A2CF
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Feb 2025 07:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740469617; cv=none; b=Hcapbg5gvNyjtWy9IhXB6pgPOnmLw/F8ARHoWgXnCkUIfwNLgTkLp4h9kEF21C8H08oBFLcio3JHqqQgZ4kKT0crFYw9y3q4O1GC91205Df/HgHJkv0j22I42o1Zjrcwy3RKj3+7Hyjcx0nqDAQcIqcFfHzHiHx2IXLrt77doH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740469617; c=relaxed/simple;
	bh=ohB7GI+rPl7u9uDQRvlELtbw1w55yBaGwNmkDJC6mAI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K+z3TYRiQjUzO/5nNjZ4zYgNBhrkTawzvsuqL+M4/6+/8vyMu87Aj6xxHrwy9sySsqw1CCrO9xQpz5nPfXvMGUzvowA0VL0dl11gWlQmO6Q9aYOVNSzEBMDamxExLFdwQbiH9fNIHil18Bqkf2cBLWYn55o1CT8EVuMZvinYge8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MYp/G9uK; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MYp/G9uK"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-abb7f539c35so1023977266b.1
        for <oe-kbuild@lists.linux.dev>; Mon, 24 Feb 2025 23:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740469613; x=1741074413; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uXCAKt95ywcXshTwhbjKc4Ucz17O/lGYiaQ4iYXom4k=;
        b=MYp/G9uK+E680qUERZzE6bylSHoOLed9Q/XfmsyARyOYcQWoNf1LFdlK6RWBOKzaLt
         pJhzD/TOJFqDWA1RXam9wwrdaVhgk5kQCLf+QHBJ9xWMPc47breOzOztWNepAaFn4cNA
         Q5951Z6fenQNP+ulvK474Dc+z39WUofTrZ7gVMJWDICwl/Q+wH6jkTEYSWnUvtPSbt/N
         u95HLg8NIiQ/kYqsIdTNKuMPibC8fxdubbi+F2KBBPQsm2y5xBFUfQGrY/yc0jGSCiKQ
         WNgQhDAinbENUd9OGw+zQzo4TJD0p0j318Mxsvuq5F63GMsdIscnz0BqP1aA6bM1yA7O
         r2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740469613; x=1741074413;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uXCAKt95ywcXshTwhbjKc4Ucz17O/lGYiaQ4iYXom4k=;
        b=JFKiCxhrYSpWPRqTA+S2QmnksVNmba+2jDzx2PEB4CWs2XsE8d/M6F4uUbeDlqXwyP
         UHobT6pLmP2n3eTaYz92tBJXiLEF4ALh5ij7yFLcaGO4dKuO+MLIx8u0C+SMWyVC6JSV
         65FygHpeE5T/y9xG6WMDlhoyQdCUih/w7iN04WUzomtGI6uKz7W90ZhBV+ID/RqWkRGo
         iC7TY5EqYPbm2hMBCumzRm/hrKl7qMcH8MQEZthFGNUSTtS7Dt7MnJ+eGEj9ddoFm7Fg
         0HeTfcVBw4UgSCknJ1z2ysc6+78E9b+oEn8iFxi+uZqUS+q3sLbW6+XtKYXh4ShVjJsa
         p4ew==
X-Gm-Message-State: AOJu0Yw3uJNBwX3pY7Hlb9Q0J2bR1Utj+eTIz4gXu97PyJhKdWxlWACL
	T+Ap2ROYw7PhhOtQi3YHEASMnZw1VjSJO2dCk/fs9ri74uxf2wE9gdbWfTW6/nyNAp7YNU3wlO0
	f
X-Gm-Gg: ASbGncu06dI3oNiLfcIgMItqU3GCkiy/SnxmPXjsNq4bHtd2Ejsdl7iigvtOOvoNfaI
	neUOQrOxlzmSmnwKMtgbiSGEbIpn37nGCR4pWpCqSXQuEFlSAw4IngNOFJa1FPo9f/gaahPQzdx
	zqAr3ABjqhY4e28fbVSjQftMMA1LMYDUBNony8WqU+TgeYNiZJJw+HBmdK6mblXiNdAUu4geMdK
	3T/H12yEdjhOVuV+sXI1G8SVWlJVHgMEYBlKslbetbFyXpgynyw1PoxQXq9R0R5kq870avbyf3k
	F06yN7YFeCO/rDznFzk6PcCUBnKrpAM=
X-Google-Smtp-Source: AGHT+IG+S2JFGDs55Sx79Yqen/ZzoJ97beQ3jhOz/EYEdXQKXs3lCZSxe94pqkWYhsKID7dYF8NaMQ==
X-Received: by 2002:a17:907:3d8f:b0:ab7:d916:4fe4 with SMTP id a640c23a62f3a-abed0d3e840mr210369966b.24.1740469613077;
        Mon, 24 Feb 2025 23:46:53 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abed205c28asm94829966b.158.2025.02.24.23.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 23:46:52 -0800 (PST)
Date: Tue, 25 Feb 2025 10:46:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Shiju Jose <shiju.jose@huawei.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [bp:edac-cxl 2/5] drivers/edac/edac_device.c:705 edac_dev_register()
 error: uninitialized symbol 'ret'.
Message-ID: <6036787e-1322-46ae-bd56-4a1e0d9966b9@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bp/bp.git edac-cxl
head:   4fab25b62bc682c0df886d97dcb106d4989c9ff1
commit: e777719d5bec32af859990456f4b0e0e362f425a [2/5] EDAC: Add scrub control feature
config: i386-randconfig-141-20250225 (https://download.01.org/0day-ci/archive/20250225/202502251009.0sGkolEJ-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502251009.0sGkolEJ-lkp@intel.com/

smatch warnings:
drivers/edac/edac_device.c:705 edac_dev_register() error: uninitialized symbol 'ret'.

vim +/ret +705 drivers/edac/edac_device.c

9222ad0e3fd4c35 Shiju Jose 2025-02-12  609  int edac_dev_register(struct device *parent, char *name,
9222ad0e3fd4c35 Shiju Jose 2025-02-12  610  		      void *private, int num_features,
9222ad0e3fd4c35 Shiju Jose 2025-02-12  611  		      const struct edac_dev_feature *ras_features)
9222ad0e3fd4c35 Shiju Jose 2025-02-12  612  {
9222ad0e3fd4c35 Shiju Jose 2025-02-12  613  	const struct attribute_group **ras_attr_groups;
e777719d5bec32a Shiju Jose 2025-02-12  614  	struct edac_dev_data *dev_data;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  615  	struct edac_dev_feat_ctx *ctx;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  616  	int attr_gcnt = 0;
e777719d5bec32a Shiju Jose 2025-02-12  617  	int scrub_cnt = 0;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  618  	int ret, feat;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  619  
9222ad0e3fd4c35 Shiju Jose 2025-02-12  620  	if (!parent || !name || !num_features || !ras_features)
9222ad0e3fd4c35 Shiju Jose 2025-02-12  621  		return -EINVAL;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  622  
9222ad0e3fd4c35 Shiju Jose 2025-02-12  623  	/* Double parse to make space for attributes */
9222ad0e3fd4c35 Shiju Jose 2025-02-12  624  	for (feat = 0; feat < num_features; feat++) {
9222ad0e3fd4c35 Shiju Jose 2025-02-12  625  		switch (ras_features[feat].ft_type) {
e777719d5bec32a Shiju Jose 2025-02-12  626  		case RAS_FEAT_SCRUB:
e777719d5bec32a Shiju Jose 2025-02-12  627  			attr_gcnt++;
e777719d5bec32a Shiju Jose 2025-02-12  628  			scrub_cnt++;
e777719d5bec32a Shiju Jose 2025-02-12  629  			break;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  630  		default:
9222ad0e3fd4c35 Shiju Jose 2025-02-12  631  			return -EINVAL;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  632  		}
9222ad0e3fd4c35 Shiju Jose 2025-02-12  633  	}
9222ad0e3fd4c35 Shiju Jose 2025-02-12  634  
9222ad0e3fd4c35 Shiju Jose 2025-02-12  635  	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
9222ad0e3fd4c35 Shiju Jose 2025-02-12  636  	if (!ctx)
9222ad0e3fd4c35 Shiju Jose 2025-02-12  637  		return -ENOMEM;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  638  
9222ad0e3fd4c35 Shiju Jose 2025-02-12  639  	ras_attr_groups = kcalloc(attr_gcnt + 1, sizeof(*ras_attr_groups), GFP_KERNEL);
9222ad0e3fd4c35 Shiju Jose 2025-02-12  640  	if (!ras_attr_groups) {
9222ad0e3fd4c35 Shiju Jose 2025-02-12  641  		ret = -ENOMEM;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  642  		goto ctx_free;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  643  	}
9222ad0e3fd4c35 Shiju Jose 2025-02-12  644  
e777719d5bec32a Shiju Jose 2025-02-12  645  	if (scrub_cnt) {
e777719d5bec32a Shiju Jose 2025-02-12  646  		ctx->scrub = kcalloc(scrub_cnt, sizeof(*ctx->scrub), GFP_KERNEL);
e777719d5bec32a Shiju Jose 2025-02-12  647  		if (!ctx->scrub) {
e777719d5bec32a Shiju Jose 2025-02-12  648  			ret = -ENOMEM;
e777719d5bec32a Shiju Jose 2025-02-12  649  			goto groups_free;
e777719d5bec32a Shiju Jose 2025-02-12  650  		}
e777719d5bec32a Shiju Jose 2025-02-12  651  	}
e777719d5bec32a Shiju Jose 2025-02-12  652  
9222ad0e3fd4c35 Shiju Jose 2025-02-12  653  	attr_gcnt = 0;
e777719d5bec32a Shiju Jose 2025-02-12  654  	scrub_cnt = 0;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  655  	for (feat = 0; feat < num_features; feat++, ras_features++) {
9222ad0e3fd4c35 Shiju Jose 2025-02-12  656  		switch (ras_features->ft_type) {
e777719d5bec32a Shiju Jose 2025-02-12  657  		case RAS_FEAT_SCRUB:
e777719d5bec32a Shiju Jose 2025-02-12  658  			if (!ras_features->scrub_ops ||
e777719d5bec32a Shiju Jose 2025-02-12  659  			    scrub_cnt != ras_features->instance)
e777719d5bec32a Shiju Jose 2025-02-12  660  				goto data_mem_free;

ret = -EINVAL?

e777719d5bec32a Shiju Jose 2025-02-12  661  
e777719d5bec32a Shiju Jose 2025-02-12  662  			dev_data = &ctx->scrub[scrub_cnt];
e777719d5bec32a Shiju Jose 2025-02-12  663  			dev_data->instance = scrub_cnt;
e777719d5bec32a Shiju Jose 2025-02-12  664  			dev_data->scrub_ops = ras_features->scrub_ops;
e777719d5bec32a Shiju Jose 2025-02-12  665  			dev_data->private = ras_features->ctx;
e777719d5bec32a Shiju Jose 2025-02-12  666  			ret = edac_scrub_get_desc(parent, &ras_attr_groups[attr_gcnt],
e777719d5bec32a Shiju Jose 2025-02-12  667  						  ras_features->instance);
e777719d5bec32a Shiju Jose 2025-02-12  668  			if (ret)
e777719d5bec32a Shiju Jose 2025-02-12  669  				goto data_mem_free;
e777719d5bec32a Shiju Jose 2025-02-12  670  
e777719d5bec32a Shiju Jose 2025-02-12  671  			scrub_cnt++;
e777719d5bec32a Shiju Jose 2025-02-12  672  			attr_gcnt++;
e777719d5bec32a Shiju Jose 2025-02-12  673  			break;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  674  		default:
9222ad0e3fd4c35 Shiju Jose 2025-02-12  675  			ret = -EINVAL;
e777719d5bec32a Shiju Jose 2025-02-12  676  			goto data_mem_free;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  677  		}
9222ad0e3fd4c35 Shiju Jose 2025-02-12  678  	}
9222ad0e3fd4c35 Shiju Jose 2025-02-12  679  
9222ad0e3fd4c35 Shiju Jose 2025-02-12  680  	ctx->dev.parent = parent;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  681  	ctx->dev.bus = edac_get_sysfs_subsys();
9222ad0e3fd4c35 Shiju Jose 2025-02-12  682  	ctx->dev.type = &edac_dev_type;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  683  	ctx->dev.groups = ras_attr_groups;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  684  	ctx->private = private;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  685  	dev_set_drvdata(&ctx->dev, ctx);
9222ad0e3fd4c35 Shiju Jose 2025-02-12  686  
9222ad0e3fd4c35 Shiju Jose 2025-02-12  687  	ret = dev_set_name(&ctx->dev, name);
9222ad0e3fd4c35 Shiju Jose 2025-02-12  688  	if (ret)
e777719d5bec32a Shiju Jose 2025-02-12  689  		goto data_mem_free;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  690  
9222ad0e3fd4c35 Shiju Jose 2025-02-12  691  	ret = device_register(&ctx->dev);
9222ad0e3fd4c35 Shiju Jose 2025-02-12  692  	if (ret) {
9222ad0e3fd4c35 Shiju Jose 2025-02-12  693  		put_device(&ctx->dev);
9222ad0e3fd4c35 Shiju Jose 2025-02-12  694  		return ret;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  695  	}
9222ad0e3fd4c35 Shiju Jose 2025-02-12  696  
9222ad0e3fd4c35 Shiju Jose 2025-02-12  697  	return devm_add_action_or_reset(parent, edac_dev_unreg, &ctx->dev);
9222ad0e3fd4c35 Shiju Jose 2025-02-12  698  
e777719d5bec32a Shiju Jose 2025-02-12  699  data_mem_free:
e777719d5bec32a Shiju Jose 2025-02-12  700  	kfree(ctx->scrub);
9222ad0e3fd4c35 Shiju Jose 2025-02-12  701  groups_free:
9222ad0e3fd4c35 Shiju Jose 2025-02-12  702  	kfree(ras_attr_groups);
9222ad0e3fd4c35 Shiju Jose 2025-02-12  703  ctx_free:
9222ad0e3fd4c35 Shiju Jose 2025-02-12  704  	kfree(ctx);
9222ad0e3fd4c35 Shiju Jose 2025-02-12 @705  	return ret;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

