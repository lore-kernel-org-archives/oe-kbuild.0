Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE5F223708
	for <oe-kbuild@lists.linux.dev>; Thu, 31 Jul 2025 15:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753977538; cv=none; b=U2m+zwcVxYPK/lo7SK8vQRRXvxaQKIg1BDGUiUISSizaLBoGXvUbAJRRNjgYRgdCXUBaDY1K0gT4Cd0/ttipS9TPPsUYmn7tULwiGMZ0dI2X1jtjjVUivJfa7+NuBKX9GaeQOXJbQp6jCQojQxugRopVl7wS693ccXipOPShlHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753977538; c=relaxed/simple;
	bh=U+uRCXeFeOvukHJjMenOn+Qvw1lqL1ftnetocaiGfq4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U5xb/QkvNbXKMvcG/cHunmm3FJberyG8fIPpSIzzXqA4jYuXb9tkIYQueCaoafGgfu8mk0ApNgnUQknLE9UtoxOvy7gNgVDVtRFxLdv5rco8+DZbP6au2RcI2Nl9NCsOtgUqfQHQ7+k9DVa60xStgnppdkIIbHqkMCTzt0KisT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HM7avQ4L; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HM7avQ4L"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7e33d36491dso52578585a.3
        for <oe-kbuild@lists.linux.dev>; Thu, 31 Jul 2025 08:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753977535; x=1754582335; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=00UuTtqGKjcbbfk42wte8axOgzJtMx+0SDjZi+MO0EA=;
        b=HM7avQ4LZ+RmBM5dK27kkL9TiMVANhF7+IGq0BinRhPS2zhP3IC9jkowBja19aBEBN
         vMGwlUWZlFEHZkZygcYAeuMi9nGD4AZbS2JCr0TlbWajaeKLUEn0fBmppwon5YZ25w7v
         MFaZCwhF8Yd2ZvCXEa4fESttW62FoSDv0WLzdwXZjuED8qsgpL7PTKuksV5RbJcVPf5z
         S4nJw+pustMvpABEf4XrS4NvXyVSEz9P5Ls80lBgPFEIPMqTcBLUP/vjWuVjVEgSbBBZ
         pL/5hMBh3oXgE9bxIAzkwz0vs3X9XtKPcOfKTMUGVehyAtyGt45PAXTxKyH8atp9LBGW
         pEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753977535; x=1754582335;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=00UuTtqGKjcbbfk42wte8axOgzJtMx+0SDjZi+MO0EA=;
        b=KM9oVQhL1TCyTNyq7nRUKeYSLGvw3H90CQBu1xhthZIFBclhzarfe9ZKsd90vWr7wn
         SmNx/uKU/LwavkLQckkq3bWPuaA2rKb1uAWQTLznXTXncR/ewLtJxiZw9TaPMOKJAOlw
         zvdEUKvGl3xdUmR8Vq0yiaPp9LtyxW1LJvUOAadWGo/El0uGo/1RHAms7wXr5tsWAm5h
         UZFTVIdu+psoPdxVZduMrRJygbezJStSCNnEOgGjHUvNZmO6LyUbJUYmTn+iRXIEuwTz
         ksjODYU9rtc4zZStlHJFzGQlnggv/uThdCrIj3jyyrNwnGdWS89XpDMJt/+zUvhAeKsS
         Dk9Q==
X-Gm-Message-State: AOJu0Yx7gC0H14M1m7YOa+8RWshlKFOGsbeBbOlnkIvO65xMz/NnpBfI
	82d64TZOxnLt1NcRNX/BxzgRdROlBCs0InQ2EOJxkUlwv4LRtbVKmt4yVPVLA8BHpcCF9VffFEc
	7BpuCb5WIgQ==
X-Gm-Gg: ASbGncuooe+U1O9KJ4gMFO5wXccsFGrMjmO8x1AvmqnxJ3PP4sK2XScwncRAlQzENxm
	LrkMIowwC8QHUxwYwepXL62kVQFKc425thR1PKkhqhejtS5xMgn5mO9WBj0leNG/xni5YTDV7u6
	RI4t3kR5Ww7xypvDLprhMR9fdlDj8HmgPjna2HcfIBbT4sxf+e6d9mC4XsQBInQGoo69ynVqYtv
	PggrqYAhgmEEi5N7OFMYGkiWVK9g/ytowh8eRS5g4jDS0+RXCRgVuXsARVaNAbm6Fq0tUc7Tkcq
	WPi41jNbZuq6Se1W3lrUwHICI2LXQfnbtNaT727FD9kNuWD/AcGaQMGNXoqLfCNPesYWysnbCel
	ANTR8PP1hOH0bued0zT3l5G40iCM=
X-Google-Smtp-Source: AGHT+IGnVsf/6q/p/kjXrZ4NR1QJFU5WcxbxDZ7CIVKi0DNyDRrMvQHCxxpY3Fq/1N74yfc8Rfor8Q==
X-Received: by 2002:a05:620a:1918:b0:7e6:211b:217a with SMTP id af79cd13be357-7e66f353391mr1052893385a.43.1753977534616;
        Thu, 31 Jul 2025 08:58:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e67f72950csm99528985a.65.2025.07.31.08.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 08:58:54 -0700 (PDT)
Date: Thu, 31 Jul 2025 18:58:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Marc Zyngier <maz@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
Subject: drivers/irqchip/irq-riscv-imsic-platform.c:317
 imsic_irqdomain_init() warn: variable dereferenced before check 'imsic' (see
 line 311)
Message-ID: <4aee1b4f-b176-46c4-841d-6bf6c91c6799@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   260f6f4fda93c8485c8037865c941b42b9cba5d2
commit: 59422904dd9855f94d00dc66598bef1bd2663894 irqchip/riscv-imsic: Convert to msi_create_parent_irq_domain() helper
config: riscv-randconfig-r073-20250731 (https://download.01.org/0day-ci/archive/20250731/202507311953.NFVZkr0a-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202507311953.NFVZkr0a-lkp@intel.com/

smatch warnings:
drivers/irqchip/irq-riscv-imsic-platform.c:317 imsic_irqdomain_init() warn: variable dereferenced before check 'imsic' (see line 311)

vim +/imsic +317 drivers/irqchip/irq-riscv-imsic-platform.c

027e125acdbad7 Anup Patel   2024-03-07  308  int imsic_irqdomain_init(void)
027e125acdbad7 Anup Patel   2024-03-07  309  {
59422904dd9855 Marc Zyngier 2025-06-26  310  	struct irq_domain_info info = {
59422904dd9855 Marc Zyngier 2025-06-26 @311  		.fwnode		= imsic->fwnode,
                                                                          ^^^^^^^^^^^^^^
Dereference

59422904dd9855 Marc Zyngier 2025-06-26  312  		.ops		= &imsic_base_domain_ops,
59422904dd9855 Marc Zyngier 2025-06-26  313  		.host_data	= imsic,
59422904dd9855 Marc Zyngier 2025-06-26  314  	};
027e125acdbad7 Anup Patel   2024-03-07  315  	struct imsic_global_config *global;
027e125acdbad7 Anup Patel   2024-03-07  316  
027e125acdbad7 Anup Patel   2024-03-07 @317  	if (!imsic || !imsic->fwnode) {
                                                    ^^^^^^
Checked too late.

027e125acdbad7 Anup Patel   2024-03-07  318  		pr_err("early driver not probed\n");
027e125acdbad7 Anup Patel   2024-03-07  319  		return -ENODEV;
027e125acdbad7 Anup Patel   2024-03-07  320  	}
027e125acdbad7 Anup Patel   2024-03-07  321  
027e125acdbad7 Anup Patel   2024-03-07  322  	if (imsic->base_domain) {
027e125acdbad7 Anup Patel   2024-03-07  323  		pr_err("%pfwP: irq domain already created\n", imsic->fwnode);
027e125acdbad7 Anup Patel   2024-03-07  324  		return -ENODEV;
027e125acdbad7 Anup Patel   2024-03-07  325  	}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

