Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3F41B6CE9
	for <oe-kbuild@lists.linux.dev>; Fri, 31 Jan 2025 10:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738320925; cv=none; b=PvsSXFHz+SNcPAmCMOz35jpx1ZwTYzyQqQpnVis8nMDE9CwmgMTMJy9WYNVDJCQaDJ6k+wg+1BxcvAS6rJFz1uD+TyidRBX3u+jjO/tWYoE4KRw6SUKWK3X7ikvooAp6/cLmQz6gSU2LEvsjUVkAq8RAXyu7Y64CTr2n3gjCZug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738320925; c=relaxed/simple;
	bh=qzPVXtaXv0l4yzNZjBCmWiLuTZBpb7TwubEm5PiK1hU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fv8mTno58l4SvLqVXjWYQgWNiDPuH6Elk8oWmqtmS5OSxnzSqFY8uv8pEpFzcLcdhWoVYGdqatfvV3H+67ptg5BcwiCqwt38IVSSRMHllIsonnSsKJQ5sPbp0tH62N+kcsY8juGqoIBqysb9KdmA62XezrfawnZQBm8Qoilyv+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fZgZWXmx; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fZgZWXmx"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38a8b35e168so1108783f8f.1
        for <oe-kbuild@lists.linux.dev>; Fri, 31 Jan 2025 02:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738320922; x=1738925722; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=enUJ+Ly9Z6G2pU8WNfE8EhF24HPGJBNrW/zOAB2OYxs=;
        b=fZgZWXmx9/eiU/Fbcc/w4Cnt+I7APjdeyAXPS8rjPafH9LrLQy/l3lI9P0jSzrz3Oo
         qArXeYV1Oc3DMGoKQ4b0WDTI1gBGy1ABeGZa9D7nKenH0RMHZeupNT0+PDQOz9v8TytR
         jFxaYtPle/lG254QuP1MUYob/sbcMpVYsK+hoMiHx6A0hjVdYlwcJH0JQ7eUrAzwBW0d
         TfMx0+GGYCZ7rOKyZEfnaigZPHpxRn1sQdSkSESPyui2JO8Rvl26z13xUPc/wPXkxDOb
         FRMpdVUBoqFvugg3+TnjimRoNyEt5Bt/pQAmItTbrenX+th/8vnvHkm9lsCF602pheqx
         O6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738320922; x=1738925722;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=enUJ+Ly9Z6G2pU8WNfE8EhF24HPGJBNrW/zOAB2OYxs=;
        b=qZGwoqGZfAT+/+XF4buhk4pQmi6Mn5Ki8psWXS+O+skXQITYyqhwpbZJrxeXLqdgs2
         K2UAjn9apWlUbRfftvl+pYZ+CYT1Pcg6KnzcaPEHOQAFvG+n6O3fAW49owy3HHEcwwRo
         X+cYUTYhQ65c446bIW+J7REqqI5yhDT8zgC666xLEXUnlTkIzjlQ9SnB9kEY1b2PUITc
         jXYrQ/Y64VKu6Us7pmwamKkKpU6P+NeiiO9oIiiTS0IW/rFpXD4uqw3kJ53tQ0bQKzxj
         6v2KNl6kSnbKOVgLAQ9FbXBd9RL7uPZWMNnzwKqZRYEVR5Q12Pt4SEYit9sXPsLl4+2p
         tfcw==
X-Gm-Message-State: AOJu0YzDzkck2mfIUBlRgdoxqqtKrXBLn+DtdrUY7OTksPMVZ3kA7XjX
	idK/i5tOx3P9vimsGFNxsesW7lBI/uLspmUVBZEy28SesbQY3aVhw0cdqUshLpkNcwkZEjm/WrF
	H
X-Gm-Gg: ASbGncsajtdnznozrmFF7DoIP0OkNfIKXrZvPQ53eOS+b1po3jIap4yHBqilKNRje+1
	yQ7ItLr67RMOyKMD9zMoGSLH9Eb4drqmYac8ro4vc3OpDIXna/kw0c2sY3DIorJkToOavTQVA2E
	80o+T9kVv6ZbBrsUaHGGe2mYpLDPPKCpi+Me1O3PfIAdAikqCSReE5WGfkC73RSit/H9cOOhB+J
	8c3f+QrMPAZ7IeLSsKKj0kyInmaErRGOFWAc8n4v3rKU+no3Jti/uxOoEGrKNDh3TLrzgkusUK0
	5sOlc1hMgpdYqe+XXKXn
X-Google-Smtp-Source: AGHT+IH0LF4BroA9tdU0AeXWTUKya0qYqN3GYI1Cv4qbdjrJlXy7sv1Jw/iQarY+bDr7LMOoN6kR/A==
X-Received: by 2002:a5d:64ec:0:b0:385:df17:2148 with SMTP id ffacd0b85a97d-38c60f657admr2581147f8f.20.1738320921567;
        Fri, 31 Jan 2025 02:55:21 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-438dcc1315esm85422305e9.6.2025.01.31.02.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 02:55:21 -0800 (PST)
Date: Fri, 31 Jan 2025 13:55:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [vireshk-pm:cpufreq/core-attr 34/47]
 drivers/cpufreq/powernv-cpufreq.c:1130 powernv_cpufreq_init() error: buffer
 overflow 'powernv_cpu_freq_attr' 2 <= 2
Message-ID: <92ef7005-00aa-40db-b44e-a66c225766e3@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git cpufreq/core-attr
head:   e3129c51f8623ce847b0486105bc00cd45ca0250
commit: 8ff649df04cd3fb05febecb28114cb116f68dcad [34/47] cpufreq: powernv: Stop setting common freq attributes
config: powerpc64-randconfig-r073-20250130 (https://download.01.org/0day-ci/archive/20250131/202501310628.pgAZDRtE-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202501310628.pgAZDRtE-lkp@intel.com/

smatch warnings:
drivers/cpufreq/powernv-cpufreq.c:1130 powernv_cpufreq_init() error: buffer overflow 'powernv_cpu_freq_attr' 2 <= 2

vim +/powernv_cpu_freq_attr +1130 drivers/cpufreq/powernv-cpufreq.c

b3d627a5f2bf1a Vaidyanathan Srinivasan 2014-04-01  1109  static int __init powernv_cpufreq_init(void)
b3d627a5f2bf1a Vaidyanathan Srinivasan 2014-04-01  1110  {
b3d627a5f2bf1a Vaidyanathan Srinivasan 2014-04-01  1111  	int rc = 0;
b3d627a5f2bf1a Vaidyanathan Srinivasan 2014-04-01  1112  
6174bac8c7ff73 Vaidyanathan Srinivasan 2014-08-03  1113  	/* Don't probe on pseries (guest) platforms */
e4d54f71d29997 Stewart Smith           2015-12-09  1114  	if (!firmware_has_feature(FW_FEATURE_OPAL))
6174bac8c7ff73 Vaidyanathan Srinivasan 2014-08-03  1115  		return -ENODEV;
6174bac8c7ff73 Vaidyanathan Srinivasan 2014-08-03  1116  
b3d627a5f2bf1a Vaidyanathan Srinivasan 2014-04-01  1117  	/* Discover pstates from device tree and init */
b3d627a5f2bf1a Vaidyanathan Srinivasan 2014-04-01  1118  	rc = init_powernv_pstates();
c5e29ea7ac1441 Shilpasri G Bhat        2016-02-26  1119  	if (rc)
c5e29ea7ac1441 Shilpasri G Bhat        2016-02-26  1120  		goto out;
b3d627a5f2bf1a Vaidyanathan Srinivasan 2014-04-01  1121  
053819e0bf8407 Shilpasri G Bhat        2015-07-16  1122  	/* Populate chip info */
053819e0bf8407 Shilpasri G Bhat        2015-07-16  1123  	rc = init_chip_info();
053819e0bf8407 Shilpasri G Bhat        2015-07-16  1124  	if (rc)
c5e29ea7ac1441 Shilpasri G Bhat        2016-02-26  1125  		goto out;
053819e0bf8407 Shilpasri G Bhat        2015-07-16  1126  
b12f7a2b01f7ad Shilpasri G Bhat        2017-01-03  1127  	if (powernv_pstate_info.wof_enabled)
b12f7a2b01f7ad Shilpasri G Bhat        2017-01-03  1128  		powernv_cpufreq_driver.boost_enabled = true;
b12f7a2b01f7ad Shilpasri G Bhat        2017-01-03  1129  	else
b12f7a2b01f7ad Shilpasri G Bhat        2017-01-03 @1130  		powernv_cpu_freq_attr[SCALING_BOOST_FREQS_ATTR_INDEX] = NULL;
                                                                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
out of bounds.  ;)

c5e29ea7ac1441 Shilpasri G Bhat        2016-02-26  1131  
b12f7a2b01f7ad Shilpasri G Bhat        2017-01-03  1132  	rc = cpufreq_register_driver(&powernv_cpufreq_driver);
b12f7a2b01f7ad Shilpasri G Bhat        2017-01-03  1133  	if (rc) {
c5e29ea7ac1441 Shilpasri G Bhat        2016-02-26  1134  		pr_info("Failed to register the cpufreq driver (%d)\n", rc);
966c08de7c2c9b Oliver O'Halloran       2020-02-06  1135  		goto cleanup;
b12f7a2b01f7ad Shilpasri G Bhat        2017-01-03  1136  	}
b12f7a2b01f7ad Shilpasri G Bhat        2017-01-03  1137  
b12f7a2b01f7ad Shilpasri G Bhat        2017-01-03  1138  	if (powernv_pstate_info.wof_enabled)
b12f7a2b01f7ad Shilpasri G Bhat        2017-01-03  1139  		cpufreq_enable_boost_support();
b12f7a2b01f7ad Shilpasri G Bhat        2017-01-03  1140  
966c08de7c2c9b Oliver O'Halloran       2020-02-06  1141  	register_reboot_notifier(&powernv_cpufreq_reboot_nb);
966c08de7c2c9b Oliver O'Halloran       2020-02-06  1142  	opal_message_notifier_register(OPAL_MSG_OCC, &powernv_cpufreq_opal_nb);
966c08de7c2c9b Oliver O'Halloran       2020-02-06  1143  
b12f7a2b01f7ad Shilpasri G Bhat        2017-01-03  1144  	return 0;
966c08de7c2c9b Oliver O'Halloran       2020-02-06  1145  cleanup:
c5e29ea7ac1441 Shilpasri G Bhat        2016-02-26  1146  	clean_chip_info();
c5e29ea7ac1441 Shilpasri G Bhat        2016-02-26  1147  out:
c5e29ea7ac1441 Shilpasri G Bhat        2016-02-26  1148  	pr_info("Platform driver disabled. System does not support PState control\n");
c5e29ea7ac1441 Shilpasri G Bhat        2016-02-26  1149  	return rc;
b3d627a5f2bf1a Vaidyanathan Srinivasan 2014-04-01  1150  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

