Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C8C3236
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Jul 2024 15:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719848725; cv=none; b=Go24zMfv+VmaauN7x68deNdnABjglcGPv1Qcz0pvQZwLsWTVBc29FPa8yv7Tw9ts57p4S7horfDVwV0KabTIoE+ysUB0a/L5GLNMdhamI1fITVJkmN3l6uXn44yTpIPVD6Sh53VhvJe4S99qZgtT7mt9j6iA69EK4TubCNBTy3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719848725; c=relaxed/simple;
	bh=yPg/iXfbwZJKkUNorum+VvbCsW/tMI0z3Ub8f3vV8Rw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SiGHQXBD48YDPUdCy+1yza+MLyKjhb1d2ckBYnKo4lfd04Xvvldg1jMRfcggKO7ZHGalBTshdjSwhCjr5o5NoXhzOsubcVjt+0yB/evaKz0OaE74IfaRJQ1dpUQI2gNzSCb+oApZ3uJ1sH/ZxWmQWcOqxD3cjzjtWtHtJcuHSEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XNlchOvD; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XNlchOvD"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5c410776a80so1678495eaf.1
        for <oe-kbuild@lists.linux.dev>; Mon, 01 Jul 2024 08:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719848723; x=1720453523; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3mn2SgEd1SHNfki55DRmCY4W2PPNDhVcT389zvDHxE=;
        b=XNlchOvD3QvVMgm51Yk4pjWnbicoW3xVA+IQozrjAq5dvnaRVPp3fWV1v4kDRR+ZIw
         AtV4zPz7UHlfi1egnzHXGjsG4jETpPOgVljrdYciT7+pVIaLiZy8BVy59NeGR+qdnWbU
         2+BGzRXw6oDEVJ1UQXyXlL4t3eASN6811TPfElvzRfqsWr8A5xfVV5xI2aHzPbp29BAi
         2wUFHQ8WIKmBSIfC6B1Ez1Yb0y4fSnSwtRsX9Iyn40uzyq39CHGsG+EzL1w/yFMl1+Mu
         Et6XXZ8sRfD1jAuKWjT/zIM819ESA1nCsHv0KgT6HOwDMeZ8QjUlvkyw2db2HC0a90Zq
         hg7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719848723; x=1720453523;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z3mn2SgEd1SHNfki55DRmCY4W2PPNDhVcT389zvDHxE=;
        b=eok9iykmhcYL6Z+ROwE5Xgda52+JiFR197MVI4t+Dh5RrThYpCIvw0U6T/XRFSyPvy
         /eMMuoZU6PDzToNhWzNZYQDizJa3Zj25zI5LBb2wt0fkRDV4VybmPRkgf6RWEsoSYW/J
         ias0DD0hnLVNnAozqp/gxg2+PK/zEh9KwHQKJGloQsUFng06txJk8Umj5FJi/0cL8Svm
         SJkCefGqAFCj7qkRe6xAusS0P6uTHDIO+j7cg5NHm2pNlU8+gqdR7oDqOAoItrb2VbYY
         a3zImpsbo09yAbR6aJHpaPNUmJ5znV+7JicyWIMD1bkNXhNEONagMFHKL0AnyGK+bQ1q
         KJ7Q==
X-Gm-Message-State: AOJu0Yy8vKXLDl+XJgNF/46kHgk01Hz+fHDbCtzvzSTozL13DH0l/KS2
	CTrJDC1gNUh5twGNcMbisbGGVW2XwAwf5oCi72UYFDSISHWmZsPOvgZYy4S5hVH81yBfC0KhgQb
	J
X-Google-Smtp-Source: AGHT+IHGULiyCHW9a5AKMWusmEJbqhC8E1tMCAmuOlwRTzFE8WCXNmWnjokoqHmZiiE8XRsBz4zHTw==
X-Received: by 2002:a4a:4884:0:b0:5c2:23ee:bc33 with SMTP id 006d021491bc7-5c439051779mr5299762eaf.5.1719848722976;
        Mon, 01 Jul 2024 08:45:22 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:e8c6:2364:637f:c70e])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5c430aa1cf0sm720654eaf.23.2024.07.01.08.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 08:45:21 -0700 (PDT)
Date: Mon, 1 Jul 2024 17:45:20 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Douglas Anderson <dianders@chromium.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [linux-next:master 4298/8232]
 drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c:366 sharp_panel_remove()
 error: we previously assumed 'sharp' could be null (see line 365)
Message-ID: <137ec596-b946-4076-a0c4-30f3b3285e36@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0fc4bfab2cd45f9acb86c4f04b5191e114e901ed
commit: d7d473d8464e7b9931c0b19f68ea0df807e01b4c [4298/8232] drm/panel: sharp-lq101r1sx01: Don't call disable at shutdown/remove
config: x86_64-randconfig-161-20240626 (https://download.01.org/0day-ci/archive/20240626/202406261525.SkhtM3ZV-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406261525.SkhtM3ZV-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c:366 sharp_panel_remove() error: we previously assumed 'sharp' could be null (see line 365)

vim +/sharp +366 drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c

79abca2b399009 Uwe Kleine-König 2022-07-08  355  static void sharp_panel_remove(struct mipi_dsi_device *dsi)
1976dbca047ed7 Thierry Reding   2014-08-01  356  {
1976dbca047ed7 Thierry Reding   2014-08-01  357  	struct sharp_panel *sharp = mipi_dsi_get_drvdata(dsi);
1976dbca047ed7 Thierry Reding   2014-08-01  358  	int err;
1976dbca047ed7 Thierry Reding   2014-08-01  359  
1976dbca047ed7 Thierry Reding   2014-08-01  360  	err = mipi_dsi_detach(dsi);
1976dbca047ed7 Thierry Reding   2014-08-01  361  	if (err < 0)
1976dbca047ed7 Thierry Reding   2014-08-01  362  		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", err);
1976dbca047ed7 Thierry Reding   2014-08-01  363  
d7d473d8464e7b Douglas Anderson 2024-06-04  364  	/* only detach from host for the DSI-LINK2 interface */
1976dbca047ed7 Thierry Reding   2014-08-01 @365  	if (!sharp)

Reversed if statement?

d7d473d8464e7b Douglas Anderson 2024-06-04 @366  		sharp_panel_del(sharp);
1976dbca047ed7 Thierry Reding   2014-08-01  367  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

