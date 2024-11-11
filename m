Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54ED146A68
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Nov 2024 09:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731318239; cv=none; b=EGDx29hSTBUHNptDHS6Bl7SZHcQ7jzqoK+N42ducmykCizKnU+agrd3LF0/9FRvNCUGb04u++UJgSURoGNdSuQSOEbpw1JsuLVUHx7wPM2KHrZN5a1EuH+Bb19wJuaC8Y5KCZ6UUGo1yMCEbskGfp7MgBSSwy5xiTMJ+jdMWvCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731318239; c=relaxed/simple;
	bh=LG2oRZ80i01qs7NGC4LV+2RagFX7Y68AMcAgdb+Ah4I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d0s/nIBeLbkAB7sRVihz0lQHdymKuXYg2L21+SgPyd/+X2OwstTE1e67ODAvbi1C9TYMcfupaze/MRT4PeHnBGkY3BjmvdHrpe17F+BHxirv3IvNL6kKz7adFuut60rk0+ihlb6WpsTEfwUBu5k7ahlOzNtqTFXnl5oiqwgUhKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=poOtKBqe; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="poOtKBqe"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a99ebb390a5so989329466b.1
        for <oe-kbuild@lists.linux.dev>; Mon, 11 Nov 2024 01:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731318235; x=1731923035; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zN5u/k/hQf/EODB0Rgy/g9MqUY8TUESZQQ3pm+8evkw=;
        b=poOtKBqe14o/tKe7iT5wvY/VPSzrm22NLkQozuEmiKTpSDWr6m1YZInSU7Wn5U/Phf
         VpusBSlbnenSUVZirROsQaY4csAuFI8F8HvC//UebEPZs0BqnmlVwAEVO2rutXb4mGNj
         43iKg0ZjsVtEruEJVWHtzFJRvrJJ6Ow6qCikd8QvN2kPQJmzPpp2SXVClfMxfhwlCvLt
         V+SZmclo+Wg7VHrsQ8o+I3YEZxJVgHCE+CvquOIsMM/pYuHZP+NvOwM1LGJ5OIfq6/yp
         sozwgGV+z8PF0sWSZ//FXxOvLqOxhAv0vwmdAGY+S9t4++CERuXqrXR49GBwPkfrRvSp
         hrrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731318235; x=1731923035;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zN5u/k/hQf/EODB0Rgy/g9MqUY8TUESZQQ3pm+8evkw=;
        b=swTUzLsM2jl+ReR/FemVrInLvQjRenRM4dfFnvld0H/2mGmPs25se+UKbnB2+WU++q
         /1aR1+rGQk2mA5Dy3Vt5W7jnGtR2893tPlTTNj20ZVRswFFQQyorNlZUzLhUU5XadkfO
         ofCEYzgSAJVfTiCOKHzxHtgQr8vGKquBJnEyNAqm5Im2YHRuS1vh0Uj+y2w/DW/xp+y1
         toHtHKvRmVU55T1xNCjsAQh0bPu6eLhDIXTTLixFSfo5Q7ga7UOu3gEeMX4pvvFN3rfz
         R+pIL++gX5nvfeURspAM1PuoA5ve2EHH5cpHBdQyCxVF7trh0gNurBS6zH9cLl+7VeIH
         7BhQ==
X-Gm-Message-State: AOJu0Yw27nsM3RsOLhHpnH+s08kaC1AsrYrW5syIR4rVtO3TuDG5+N5B
	NDzUJADAGVBya+rDkFb8IQSb8F7zxWlDNNTAbYKLI0hQCOs5hhN/Lx0b7N4v2XRFiBLJL062SNL
	Vve0=
X-Google-Smtp-Source: AGHT+IGFaIPnZqqDAJMhMwyxIn6+GOqns9j3XX//DVN0QDrgJeJvrt3tgEqi2wiJm4jBk9jWGeE3Ug==
X-Received: by 2002:a17:907:2da5:b0:a99:fbb6:4972 with SMTP id a640c23a62f3a-a9eeff97fe5mr1165490066b.25.1731318235345;
        Mon, 11 Nov 2024 01:43:55 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0defbdcsm573018066b.159.2024.11.11.01.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 01:43:54 -0800 (PST)
Date: Mon, 11 Nov 2024 12:43:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Hector Martin <marcan@marcan.st>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/soc/apple/mailbox.c:292 apple_mbox_get() warn: passing zero
 to 'ERR_PTR'
Message-ID: <8291bb96-afb7-4703-8a72-ba764534efc9@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   906bd684e4b1e517dd424a354744c5b0aebef8af
commit: c84292d9d253706267889cf2614400712f15d689 soc: apple: mailbox: Rename config symbol to APPLE_MAILBOX
config: sparc-randconfig-r072-20241107 (https://download.01.org/0day-ci/archive/20241108/202411081103.7IiOcvUp-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411081103.7IiOcvUp-lkp@intel.com/

smatch warnings:
drivers/soc/apple/mailbox.c:292 apple_mbox_get() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +292 drivers/soc/apple/mailbox.c

6e1457fcad3ff6 Hector Martin 2023-03-14  282  struct apple_mbox *apple_mbox_get(struct device *dev, int index)
6e1457fcad3ff6 Hector Martin 2023-03-14  283  {
6e1457fcad3ff6 Hector Martin 2023-03-14  284  	struct of_phandle_args args;
6e1457fcad3ff6 Hector Martin 2023-03-14  285  	struct platform_device *pdev;
6e1457fcad3ff6 Hector Martin 2023-03-14  286  	struct apple_mbox *mbox;
6e1457fcad3ff6 Hector Martin 2023-03-14  287  	int ret;
6e1457fcad3ff6 Hector Martin 2023-03-14  288  
6e1457fcad3ff6 Hector Martin 2023-03-14  289  	ret = of_parse_phandle_with_args(dev->of_node, "mboxes", "#mbox-cells",
6e1457fcad3ff6 Hector Martin 2023-03-14  290  					 index, &args);
6e1457fcad3ff6 Hector Martin 2023-03-14  291  	if (ret || !args.np)
6e1457fcad3ff6 Hector Martin 2023-03-14 @292  		return ERR_PTR(ret);

This should be something like: return ERR_PTR(ret ?: -EINVAL);

6e1457fcad3ff6 Hector Martin 2023-03-14  293  
6e1457fcad3ff6 Hector Martin 2023-03-14  294  	pdev = of_find_device_by_node(args.np);
6e1457fcad3ff6 Hector Martin 2023-03-14  295  	of_node_put(args.np);
6e1457fcad3ff6 Hector Martin 2023-03-14  296  
6e1457fcad3ff6 Hector Martin 2023-03-14  297  	if (!pdev)
6e1457fcad3ff6 Hector Martin 2023-03-14  298  		return ERR_PTR(EPROBE_DEFER);
6e1457fcad3ff6 Hector Martin 2023-03-14  299  
6e1457fcad3ff6 Hector Martin 2023-03-14  300  	mbox = platform_get_drvdata(pdev);
6e1457fcad3ff6 Hector Martin 2023-03-14  301  	if (!mbox)
6e1457fcad3ff6 Hector Martin 2023-03-14  302  		return ERR_PTR(EPROBE_DEFER);
6e1457fcad3ff6 Hector Martin 2023-03-14  303  
6e1457fcad3ff6 Hector Martin 2023-03-14  304  	if (!device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_CONSUMER))
6e1457fcad3ff6 Hector Martin 2023-03-14  305  		return ERR_PTR(ENODEV);
6e1457fcad3ff6 Hector Martin 2023-03-14  306  
6e1457fcad3ff6 Hector Martin 2023-03-14  307  	return mbox;
6e1457fcad3ff6 Hector Martin 2023-03-14  308  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

