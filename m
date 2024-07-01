Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A119416E865;
	Mon,  1 Jul 2024 17:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719854046; cv=none; b=Ypety9BOaYG7v57c7Eqp/h5JrRiLbm8r9ds0w6Q4wQCCi+qSeREU29gaFDvUtbgtz1EtZ0qeZscSLwILHBF3172TNnDWdfxrQ5ZeZKIkBKqB0DqHez7HFEzqNtzdz4oguRKlzpx0uFvZ1axzxwtPdrhNra7SBqZ3RyI7YWuwa0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719854046; c=relaxed/simple;
	bh=soNFMTXqvnJ/skLf4fDt+FvRIDE9YVypE1A1VixjJLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A29XynAYxrLqLqIGGjmC/UoaWeSlLTONkUidqiOOEFnijZV1o3SU8zmbAO+Pet6nIi9/rKpfgo1oDAUK4EHUBrx4AnFqO+mXtgImb25245GRaaw4RaR3L1WhDg4Nc7RwnB5+d9uLUx3NSoj8j83b9eh0XR7ld9PffokwtbaEyHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=maxE2JhY; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="maxE2JhY"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1f6a837e9a3so12827695ad.1;
        Mon, 01 Jul 2024 10:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719854044; x=1720458844; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9y9HtobYTsL9lsUARztMYt+IEviuG8O5D8y/lX2WyK0=;
        b=maxE2JhYEJ7lq46aQVa9WWTCK9xHwegcg6TAbA1f7HXg4VrgLDk0O8x23JaZ3pI1Hv
         WaRhuSCKVQtQi2nD+ZOtU7Emxyf3nixJN60lLEaps1BS393kE5QgzNAP1VrDIPv2k8ws
         t8LpH+ueKiyY0xKX0thIUYEC2cwy8OKMv/KDf1QdR7pQPDQZYVcvTmLlfNFjtquVx4XV
         SNoR/0qtShDSmcVA/KQU70wVo3UVyQL8tbGRlt+Aw3C4EQlyUnNFliVJu+OqhnDkFvV5
         fxRJeN2Q/EP+4MpEFcPnGwbp7zkJ1JQQz34X4hoMDga8DiWrj5JP4xRxbkFzU3csa3O0
         0KGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719854044; x=1720458844;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9y9HtobYTsL9lsUARztMYt+IEviuG8O5D8y/lX2WyK0=;
        b=b3PH33Iln1FQ0kT7AZcOJymW3lhaXQ7LmKYqp2X7/2WJ27P5r+aIbrN/va9m8Ry3aP
         e6Ps3VodgDh0reOmUqWOEZiHNgxsOZdmaSzt6GihGXruSaY21OJwt1knp0FBBukSYPD1
         oBmVY6QIJJKjU4Ov0Xsk2fdMJyQfJ1HNtKbL9zeZHYT+qMLIpEHYmcUF9BbezZD42Q31
         cxNe+e2Irf9U3vqk/w4jOPSEN7qmiQJXAa3WQRNqwNkiD2eba1C5MOMq51mOaxebNrES
         FtnZ2fHmdHkdRNiMAXCUTWTjzzNCUyyw/V0Qz80EM7U4ajkw58mtxGv4ZJUMpU7ueuSL
         HY/A==
X-Forwarded-Encrypted: i=1; AJvYcCXZQF1akVje4mcFBhz5fcK8nn3yppghPdrTMCUIlRPwK+UOzm9q44R9gjnS+nZ7Mhxp02n3Ji/4Q4eBR2Aj5vflR+wyjBBA9tpMnjP1xQ==
X-Gm-Message-State: AOJu0YxKafx7v6yoJLNUR2XNRf13jwYl7A+pxUKGyjwaCliJ4PmQzbMc
	12sKam06Ez0KY7MK225yti2Ha1P7rwNFMfxwizk6W9E9hCeiF8eJ
X-Google-Smtp-Source: AGHT+IFCXZh7IojJbcFrrRy6loF6IABawUbnmNcbJQxAKGFxrA/osfAYya6mGAyr6FZiC0gkQ7xT2w==
X-Received: by 2002:a17:902:a3ce:b0:1fa:221e:aaad with SMTP id d9443c01a7336-1fadbc8ebb7mr34095015ad.29.1719854043753;
        Mon, 01 Jul 2024 10:14:03 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:7783:69e6:8487:f6ab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac1538dc2sm67613675ad.170.2024.07.01.10.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 10:14:03 -0700 (PDT)
Date: Mon, 1 Jul 2024 10:14:00 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev,
	Ronald =?iso-8859-1?Q?Tschal=E4r?= <ronald@innovation.ch>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: drivers/input/keyboard/applespi.c:1833 applespi_drain_writes()
 warn: mixing irqsave and irq
Message-ID: <ZoLj2LL0NzdS1gZL@google.com>
References: <3e789ab9-ebfc-40a2-b90d-b8b55e0cfaac@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e789ab9-ebfc-40a2-b90d-b8b55e0cfaac@suswa.mountain>

Hi Dan,

On Mon, Jul 01, 2024 at 06:30:38PM +0200, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   6d6444ba82053c716fb5ac83346202659023044e
> commit: 038b1a05eae6666b731920e46f47d8e2332e07ff Input: add Apple SPI keyboard and trackpad driver
> config: x86_64-randconfig-161-20240628 (https://download.01.org/0day-ci/archive/20240628/202406280337.1Av9qm8V-lkp@intel.com/config)
> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202406280337.1Av9qm8V-lkp@intel.com/
> 
> smatch warnings:
> drivers/input/keyboard/applespi.c:1833 applespi_drain_writes() warn: mixing irqsave and irq
> drivers/input/keyboard/applespi.c:1845 applespi_drain_reads() warn: mixing irqsave and irq
> 
> vim +1833 drivers/input/keyboard/applespi.c
> 
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1826  static void applespi_drain_writes(struct applespi_data *applespi)
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1827  {
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1828  	unsigned long flags;
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1829  
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1830  	spin_lock_irqsave(&applespi->cmd_msg_lock, flags);
> 
> _irqsave() sort of implies that potentially the caller has disabled IRQs,
> otherwise we would use spin_lock_irq() if we knew they hadn't disabled
> IRQs.
> 
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1831  
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1832  	applespi->drain = true;
> 038b1a05eae666 Ronald Tschalär 2019-07-15 @1833  	wait_event_lock_irq(applespi->drain_complete, !applespi->write_active,
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1834  			    applespi->cmd_msg_lock);
> 
> This will renable IRQs briefly and then disable them again.
> 
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1835  
> 038b1a05eae666 Ronald Tschalär 2019-07-15  1836  	spin_unlock_irqrestore(&applespi->cmd_msg_lock, flags);
> 
> This will set them back to how they were at the start of the function.
> 
> The issue is that if the caller really wanted IRQs disabled, then it's
> not necessarilly a good idea to enable them at all in the
> wait_event_lock_irq() macro.  I suspect that in real life no callers
> disable IRQs so it's not an issue.  But anyway, that's what the warning
> is about.

applespi_drain_writes() and applespi_drain_reads() are only called from
the process context with interrupts enabled, so it looks like we should
simply change spin_lock_irqsave() to spin_lock_irq().

I am taking patches ;)

Thanks.

-- 
Dmitry
