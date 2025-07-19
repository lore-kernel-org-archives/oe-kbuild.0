Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818A6147C9B
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Jul 2025 04:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752898723; cv=none; b=uAHSZ27pngpmyr7/tEtaQE6mDoPy9QBGx6DVKonBfc4ZcT7el5HLr6RTmaGXp578ncxKl3a0J39YSRIzs2Bilsu9pEv0UfSmf8gzpuKIxvNjf6PK6voFE5kU6UW6SoQO6e9xGVU9QqUa486XLatBmDczYUdWXpQxqztj9ufyMZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752898723; c=relaxed/simple;
	bh=c0Y1dBP6mbjgqGJ4uzXIvrk1OvosVS1lhNOJ42PXLTg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xc+MBaORErC7SeVnMBrmt6BfyZY68aQUbF22+uDIf3VEkzKVfRnipI1rJZhST6PGI++NUHQ1RQ/2D4OvDER7SgpGaPaEVD/ZKuGaVdJCQYfndLMT1cgvMioErOri85pD3Bi2DuwPkqY8UNGiw7SZIvyZFLDJ/Eo3vY7SsnyfKGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L4L4GAUv; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L4L4GAUv"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-41b6561d3b7so1362799b6e.1
        for <oe-kbuild@lists.linux.dev>; Fri, 18 Jul 2025 21:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752898720; x=1753503520; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N+BZHCELzgroZPkR4FxBQw6DLs08RrhPaFfaJBgCmTw=;
        b=L4L4GAUvZpD4JHLcndnFimvphVDCRMUP2Z+wPuCPM69ulsBUGxdR9+uSlI1VN5mVig
         8K62TpXp+kzLav0Nj4HCeayfnRGICjI/NiN8C/rz5qb1bK3gUL1mDnPC6fLUNdhd281z
         77W+oW6t3Fav2Mom0UD90BdgtWe22YuqMbAbMybd3O9MpLmwB58sPy5aFmhH4iUoGLjg
         LbnWqtOpn2fZZlX77mk7kuoVfLFb6ZPJO84v1cWdn9N61spkorMHlxH/ARwAWgDsUP6g
         jYc8vI04gkUJjg4LsO/0XXjFR1/ZcECF9FOqAK1HBuKSfkJUg0M5YcXM8u44Y7wkri1X
         h/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752898720; x=1753503520;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N+BZHCELzgroZPkR4FxBQw6DLs08RrhPaFfaJBgCmTw=;
        b=C7ONbeNCl7jtDJjFITi7M5KmCRvpE7+lmlGhFqdC54XzBmc+gQXP3gy/qEKvb8UaQs
         KPkA+W89fMM7ZYw4/zRvgfNkJ9ujcccn+/lE5xkpomcMHywrOJJTSTAi8UT6Z2K0nSQW
         FgslEXZlE/byATKPo/AWOjb2T5qzZmjETobGtmZDMhoBxUqDvjdJXkd1RQCQFC9brHZ7
         xkit3unBZNp2j66pO0RHeNRXkPxVr1eu2D31rxzyOWhglpBAuD1ekoIA/xIbYbvnsziL
         Zz78WHLBwJV6tos947yTZNdZgv7bjM5/9EYHW4mfKIZA2YXzQNXwJlUruuNdNHFZAIN+
         kxoA==
X-Gm-Message-State: AOJu0Yx29E40JQW6X9++5r54G4ayL8mrTmfNMUhziH61bE7XqanFusMx
	n55DaGbzV+9f3YX+hEwG+aDF0ovFy2Cjl/ej94c1ANU87kbz9bFWjbCtoC7PIGoYQCeIRFkaqSf
	L11NS
X-Gm-Gg: ASbGnctgUsfBhlOSNf1QsM9RPvRR7SFlZsTr1xXvRfBn2VXNnz/duWlXK2y69VRKUOk
	hN3DruwfZAbnKLoIcga8SZ0OUM3AVsr9pSNDHxbbx4uh+8+zDYir9mva+nXaj+qrYLuIpR74Mo3
	KdYR0PI07DCQq15mjWlNMIL4Frfh8YPSvw5i7mkxt0N0hroeBfEmZQS1ac+rWJOlspuVkrwIuq3
	cGRJP8Srqx52Qox04l23qgn1KlIvi0aObkN9VShuRQSvgk2dsJKwlOfDeRW+Ln7onBGHkdH7NSg
	xf4K4wovezq9pAMYTEYKn/VhvaZ7Sk1UycL/t7vJJI6LpdzwbhJJ238d/wmp2AmmifGOwHkmpIw
	ZvApe/Dk0FOhH6aBPC1Y11A==
X-Google-Smtp-Source: AGHT+IHE4UttwYLmhGGq1aSYcpzByA8NABM+J2odNl+m7q/H0Fuud2QipBzhprq2PRURBtpwaV4v0A==
X-Received: by 2002:a05:6808:508b:b0:40b:1588:e005 with SMTP id 5614622812f47-41d037e362bmr8968994b6e.10.1752898719958;
        Fri, 18 Jul 2025 21:18:39 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::17c0])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-41fd565d35csm945062b6e.40.2025.07.18.21.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 21:18:39 -0700 (PDT)
Date: Sat, 19 Jul 2025 07:18:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Mengyuan Lou <mengyuanlou@net-swift.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>
Subject: [linux-next:master 7606/11307]
 drivers/net/ethernet/wangxun/libwx/wx_vf_common.c:99
 wx_request_msix_irqs_vf() warn: why call request_threaded_irq() with a NULL
 thread
Message-ID: <ada3c3a9-556f-4860-bff0-af0364a984b8@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
commit: fd0a2e03bf6083354994c2efe2bd12e369c0c830 [7606/11307] net: txgbevf: init interrupts and request irqs
config: parisc-randconfig-r071-20250719 (https://download.01.org/0day-ci/archive/20250719/202507191110.FWkwuVJQ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202507191110.FWkwuVJQ-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/wangxun/libwx/wx_vf_common.c:99 wx_request_msix_irqs_vf() warn: why call request_threaded_irq() with a NULL thread

vim +99 drivers/net/ethernet/wangxun/libwx/wx_vf_common.c

eb4898fde1de8c Mengyuan Lou 2025-07-04   74  int wx_request_msix_irqs_vf(struct wx *wx)
eb4898fde1de8c Mengyuan Lou 2025-07-04   75  {
eb4898fde1de8c Mengyuan Lou 2025-07-04   76  	struct net_device *netdev = wx->netdev;
eb4898fde1de8c Mengyuan Lou 2025-07-04   77  	int vector, err;
eb4898fde1de8c Mengyuan Lou 2025-07-04   78  
eb4898fde1de8c Mengyuan Lou 2025-07-04   79  	for (vector = 0; vector < wx->num_q_vectors; vector++) {
eb4898fde1de8c Mengyuan Lou 2025-07-04   80  		struct wx_q_vector *q_vector = wx->q_vector[vector];
eb4898fde1de8c Mengyuan Lou 2025-07-04   81  		struct msix_entry *entry = &wx->msix_q_entries[vector];
eb4898fde1de8c Mengyuan Lou 2025-07-04   82  
eb4898fde1de8c Mengyuan Lou 2025-07-04   83  		if (q_vector->tx.ring && q_vector->rx.ring)
eb4898fde1de8c Mengyuan Lou 2025-07-04   84  			snprintf(q_vector->name, sizeof(q_vector->name) - 1,
eb4898fde1de8c Mengyuan Lou 2025-07-04   85  				 "%s-TxRx-%d", netdev->name, entry->entry);
eb4898fde1de8c Mengyuan Lou 2025-07-04   86  		else
eb4898fde1de8c Mengyuan Lou 2025-07-04   87  			/* skip this unused q_vector */
eb4898fde1de8c Mengyuan Lou 2025-07-04   88  			continue;
eb4898fde1de8c Mengyuan Lou 2025-07-04   89  
eb4898fde1de8c Mengyuan Lou 2025-07-04   90  		err = request_irq(entry->vector, wx_msix_clean_rings, 0,
eb4898fde1de8c Mengyuan Lou 2025-07-04   91  				  q_vector->name, q_vector);
eb4898fde1de8c Mengyuan Lou 2025-07-04   92  		if (err) {
eb4898fde1de8c Mengyuan Lou 2025-07-04   93  			wx_err(wx, "request_irq failed for MSIX interrupt %s Error: %d\n",
eb4898fde1de8c Mengyuan Lou 2025-07-04   94  			       q_vector->name, err);
eb4898fde1de8c Mengyuan Lou 2025-07-04   95  			goto free_queue_irqs;
eb4898fde1de8c Mengyuan Lou 2025-07-04   96  		}
eb4898fde1de8c Mengyuan Lou 2025-07-04   97  	}
eb4898fde1de8c Mengyuan Lou 2025-07-04   98  
fd0a2e03bf6083 Mengyuan Lou 2025-07-04  @99  	err = request_threaded_irq(wx->msix_entry->vector, wx_msix_misc_vf,
fd0a2e03bf6083 Mengyuan Lou 2025-07-04  100  				   NULL, IRQF_ONESHOT, netdev->name, wx);
                                                                           ^^^^
It's not a threaded IRQ if the thread is NULL.  You could just
use request_irq().

eb4898fde1de8c Mengyuan Lou 2025-07-04  101  	if (err) {
eb4898fde1de8c Mengyuan Lou 2025-07-04  102  		wx_err(wx, "request_irq for msix_other failed: %d\n", err);
eb4898fde1de8c Mengyuan Lou 2025-07-04  103  		goto free_queue_irqs;
eb4898fde1de8c Mengyuan Lou 2025-07-04  104  	}
eb4898fde1de8c Mengyuan Lou 2025-07-04  105  
eb4898fde1de8c Mengyuan Lou 2025-07-04  106  	return 0;
eb4898fde1de8c Mengyuan Lou 2025-07-04  107  
eb4898fde1de8c Mengyuan Lou 2025-07-04  108  free_queue_irqs:
eb4898fde1de8c Mengyuan Lou 2025-07-04  109  	while (vector) {
eb4898fde1de8c Mengyuan Lou 2025-07-04  110  		vector--;
eb4898fde1de8c Mengyuan Lou 2025-07-04  111  		free_irq(wx->msix_q_entries[vector].vector,
eb4898fde1de8c Mengyuan Lou 2025-07-04  112  			 wx->q_vector[vector]);
eb4898fde1de8c Mengyuan Lou 2025-07-04  113  	}
eb4898fde1de8c Mengyuan Lou 2025-07-04  114  	wx_reset_interrupt_capability(wx);
eb4898fde1de8c Mengyuan Lou 2025-07-04  115  	return err;
eb4898fde1de8c Mengyuan Lou 2025-07-04  116  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

