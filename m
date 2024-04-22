Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096C614F13D
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Apr 2024 13:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713792500; cv=none; b=HBBWaMn/JRYK79r6MH/5ippbu+tC7FUq5y4i/+ijM/IRQ5zrsTMUqUw/1whHuZyn8r57IvlfPqiWpe7MnptJUENKEWVLYjo/M/fl0oaWbR8oaH9dtu8Mn5dtYxHIWfIs9yw7fBZ3jYGnHOAvrETaY9MvMaNDBFr6aHjF0VSQj8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713792500; c=relaxed/simple;
	bh=1eo0euwUGAw54iDvWE8emZ5WKjGfRGh+kSL2hoZuRt4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KMWcpd85hpuZxCd6Bc3C6paBB2Cwwccv3vd45StcezemFws2R9HIyz/xtYdU8sYsSSgkn1EKbREpWn0/Wco/xBcEHEbFWmpYbk8g8Km+VEBA/G28xKrqI2Bx3Ae9OSrQ4by5M4fQNN3tcl4YzTQ7jdgEaCoGVLHw7d5vrHCNf7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NqMsGGoB; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NqMsGGoB"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-516ef30b16eso5474425e87.3
        for <oe-kbuild@lists.linux.dev>; Mon, 22 Apr 2024 06:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713792497; x=1714397297; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GU1dJeVSS2cB7jFMgnaX8P1CNzv4uEgzerCoNC95thY=;
        b=NqMsGGoBq5KC1c3GqrSlqz+YgA0SxDFMFn/c0NC2Uwy+TFRalKK8tvIkOXNLj3aam5
         vo4B8BtQQkofBJorKE7fzSvUTtZ+NW7GAOf/LHB5vLPtRzcQL2z9qaZv7JzkAFZX6zB4
         2XoWebHaR8daJCHp9hv2PJoXwW4fC9IWlqx55PZ5ek+U2S6Lnf1qDC3MVCe/ohrTwMuV
         NrRAosq6SbT4scHhWWNUrkfxUrNXaGYDWj26yog6HGtRU9Ttgw0X1sDEuK2odJ+Mrif/
         PVoY0kXFtC2AvBT89CNXbNa/qPitd5eu+Zir17qSx7CjP8d+K0aFqxFos4obmCgqv4tX
         yLMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713792497; x=1714397297;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GU1dJeVSS2cB7jFMgnaX8P1CNzv4uEgzerCoNC95thY=;
        b=eDr6FPHI+neeq4lTqMxnLplJv3T5WS9A9fB/5tMtv4/gipLyVNe/ZmoMaN8uvc8pc+
         Jk4vtbzOxNbCiieWqsmGinrDOaCQdvLdN7rrKGANX8mZSBkFc5oBGzO6SIP7Pq9c4yu8
         UtdH+p8s8YDar4WBgPSSq9ix/WPsKyTgzglXFWxVuPYtxJ7bk3Ge7Ya8Y9Atwb7dmqb8
         pC8/VI0BgajxCTqPtLuhS3/Ir+T5St7edEYMPO5kzzBkDV/ip3tY8o3k7IqPTb635Jna
         SjolaDYxAeNrMTN/KBPIdJHLefsULyFCWXsuy2MM7FC/jcgEsurdlgt/JmA4h19IijmB
         cP7w==
X-Gm-Message-State: AOJu0YzpTPQXC4HeovkgbS0tdDuBuVxAJkc1jvxTqfAkWLyeH1xD99c9
	oiVlHBf4HS6InDWA7ybQpWX0SJSIvZkmrBThbG7fQWDEEPEIXtS+GANHTsuDk3DUct9QdfVIp1G
	t
X-Google-Smtp-Source: AGHT+IFQoGHcjYKPCePyVGrHYThWiIPQyPMGGyHacPYvNO87V1fdCNhlFnVcBG403gEJHqfpDCz8tA==
X-Received: by 2002:a05:6512:398b:b0:51b:230e:5066 with SMTP id j11-20020a056512398b00b0051b230e5066mr2377539lfu.27.1713792496427;
        Mon, 22 Apr 2024 06:28:16 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id lu10-20020a170906faca00b00a52299d8eecsm5673873ejb.135.2024.04.22.06.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 06:28:15 -0700 (PDT)
Date: Mon, 22 Apr 2024 16:28:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Sudan Landge <sudanl@amazon.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, zx2c4@kernel.org,
	Alexander Graf <graf@amazon.com>
Subject: [crng-random:vmgenid-of 3/3] drivers/virt/vmgenid.c:123
 vmgenid_add_of() warn: platform_get_irq() does not return zero
Message-ID: <4865e1ca-1be0-42d2-adcb-6418cc654745@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/crng/random.git vmgenid-of
head:   c1fa2e76c9238c014249d5ccbff366db2642de09
commit: ad0cf87856421036825ba264456005cd79e510b8 [3/3] virt: vmgenid: add support for devicetree bindings
config: mips-randconfig-r071-20240420 (https://download.01.org/0day-ci/archive/20240420/202404200545.JllWEoPv-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202404200545.JllWEoPv-lkp@intel.com/

smatch warnings:
drivers/virt/vmgenid.c:123 vmgenid_add_of() warn: platform_get_irq() does not return zero

vim +123 drivers/virt/vmgenid.c

ad0cf878564210 Sudan Landge       2024-04-17  110  static int vmgenid_add_of(struct platform_device *pdev,
ad0cf878564210 Sudan Landge       2024-04-17  111  			  struct vmgenid_state *state)
ad0cf878564210 Sudan Landge       2024-04-17  112  {
ad0cf878564210 Sudan Landge       2024-04-17  113  	void *virt_addr;
ad0cf878564210 Sudan Landge       2024-04-17  114  	int ret;
ad0cf878564210 Sudan Landge       2024-04-17  115  
ad0cf878564210 Sudan Landge       2024-04-17  116  	virt_addr = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
ad0cf878564210 Sudan Landge       2024-04-17  117  	if (IS_ERR(virt_addr))
ad0cf878564210 Sudan Landge       2024-04-17  118  		return PTR_ERR(virt_addr);
ad0cf878564210 Sudan Landge       2024-04-17  119  
ad0cf878564210 Sudan Landge       2024-04-17  120  	setup_vmgenid_state(state, virt_addr);
ad0cf878564210 Sudan Landge       2024-04-17  121  
ad0cf878564210 Sudan Landge       2024-04-17  122  	ret = platform_get_irq(pdev, 0);
ad0cf878564210 Sudan Landge       2024-04-17 @123  	if (ret)

platform_get_irq() never returns zero.  It returns negative error codes
or positive values on success.  So this driver will never probe()
successfully now.  It should be

	if (ret < 0)
		return ret;

ad0cf878564210 Sudan Landge       2024-04-17  124  		return ret;
ad0cf878564210 Sudan Landge       2024-04-17  125  
ad0cf878564210 Sudan Landge       2024-04-17  126  	ret = devm_request_irq(&pdev->dev, ret, vmgenid_of_irq_handler,
ad0cf878564210 Sudan Landge       2024-04-17  127  			       IRQF_SHARED, "vmgenid", &pdev->dev);
ad0cf878564210 Sudan Landge       2024-04-17  128  	if (ret)
ad0cf878564210 Sudan Landge       2024-04-17  129  		return ret;
ad0cf878564210 Sudan Landge       2024-04-17  130  
ad0cf878564210 Sudan Landge       2024-04-17  131  	pdev->dev.driver_data = state;
ad0cf878564210 Sudan Landge       2024-04-17  132  	return 0;
ad0cf878564210 Sudan Landge       2024-04-17  133  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

