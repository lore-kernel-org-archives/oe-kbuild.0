Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2371EDA08;
	Tue,  1 Apr 2025 09:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743500940; cv=none; b=lanF9H2BJkdBPZlRU7mt4VO4YcRzFq2Elrpv/HVHI43Wina5N5xYjSfkl5NO2Yae3K355M4rlDi6db64OFSs1Flm1etANGcb4w9ofT2vkM03Cp/GSbhhjp6IsGA8opzHUopXnX4kcnikZjTxWnqBfZWC+g3IRIpEfDM+1VxwQQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743500940; c=relaxed/simple;
	bh=9bnqrnpwLGWSks6EY0r4FvvY1vEkPMWJJMXKZ4Duj5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RJpSpEIUIZ9vjfoGnFVVDoQNbOK2PHal5tzAqrsB/1zM6f7JaDkhrksoovIelLt4lqV3CuqrxoXb7fFiA/zFkKMD/cnwlzvh1Mrf86w+TROOKylWHLxGfNDzfBhXSLMhB/XwRcvb/YO/yeyL45OOonWwS4hZBA9GP1/RetIKYEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XjA3DkC9; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XjA3DkC9"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-47698757053so61902741cf.0;
        Tue, 01 Apr 2025 02:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743500937; x=1744105737; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j04JkGotAQcNyhSuNSCcQJ7BrnBfb5gjge3QJgcJHbs=;
        b=XjA3DkC9FIaD/FOofAIBYvmd8StQ/9rPJ8fKuggevOe6YM05NfB8COTHtbjHvs3LbP
         8Gv2I8WgK3zqKqAovv8pKbJJLMoTAtz6oNUjQUM5xvRlAvRjLrmFan+L+1/7BZyEugtx
         IBcolADP0rezgwBj9PNJ6RLf4Qsg7XKvzE26Y/hCBzxISbirLP915U03JyKV452O4IyH
         4L9jTytqCTeR8fOSgxYiAkEis8rNCsU5+Yj/nUzeUceKjeSZwlUfXpEela05hVQEOz45
         /9cKfN9UHDBFjpsWFrZCHYUkxl52QuxV83NWSffUrEhjx8YP7Bc2Pntyh5IT0Weh4T84
         b/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743500937; x=1744105737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j04JkGotAQcNyhSuNSCcQJ7BrnBfb5gjge3QJgcJHbs=;
        b=FetbAOTme0t3duxdkzaf910oemOiJMQrcfBDL0VH1AYEhgDdcrZYMVM2AzioZ9MgJw
         ZHP1NKfRZN2pRLeyoAct5+oi32Iy4Ruso3VXru+bkevEpIyh5I9dk8+1kCGkKr7Cu6BE
         bB1nozHhsia4Uuc5WRVdbWcnZqTMWYsIywlZzYpxWRigoTdpy8NC6rSb+jaZc81pYxgI
         zbFYi86vwR97OQovXrLap4e3koBED/jloSStdDuKkmHI/MVjI2g36uVUeeGQ2A4V8I7Y
         lC4NSFYbvhhzkhO+78taomIiXY3p7dvym/DmfjhQWADeUlxV/3qcoCmK65SV3zIjUN0Q
         djog==
X-Forwarded-Encrypted: i=1; AJvYcCWgpL5V5BrKbtb72+rj2S0HH6NfDWKQAI7z9L0I1/sNPVp0tBypSjjAfumfIEtViECMg6Rn1gMbObiwnHkB@lists.linux.dev
X-Gm-Message-State: AOJu0Yyxbug4jxqJgrvdfMSdgEpNzw8q+FIRgyUmUpQb418ldNyxtztw
	QYgjrbFjCPcG8ytZcUFX85t4nodl7bNNOFeGYFtCBnRgzMXwJODx
X-Gm-Gg: ASbGncsxeVIzQSDG1tWFowy+sbGEU/HNLibD2woMlEUN3mgcSISkH2+A1PBf0+H7rEK
	WbZrPfs+Ry6M+YXWc1LRXw90ZyVY+v1Hlwis1b3oZaso0EHff/egr2a4/X4wywhJl7rtZdbqIGU
	qDO0wpr0aqaI0FVNGgnWQ+I1plniwX2nhme7oJVfnHQQHYHBBFFumvVordzUFYckChMil1whgr9
	7ISA2nXGaiYIM+VxMXLqJbeTeSVY4QqtB0yZQQ/XlP6Z2M297TXEm4U3k1UF+9wfhvaa/Hyb1zQ
	l/iGxFoOudNN9VykuAsYWdffY3myUapOm3opFsqgiPgUcHO3JeBb26l8Tyn081VVAThZ6nkYtVD
	wBNfQ+CZUar/3eiSsB7gTh+bz1blleg==
X-Google-Smtp-Source: AGHT+IEG6ezGqp8kvzeb+xYmRLTIN2+0jFBjPPmOrsBKgTMxExPbmADYseQ87fRPaR1fv6LhnR871A==
X-Received: by 2002:ac8:7e95:0:b0:477:1f59:2876 with SMTP id d75a77b69052e-477e4b94f90mr203632791cf.28.1743500936758;
        Tue, 01 Apr 2025 02:48:56 -0700 (PDT)
Received: from errol.ini.cmu.edu (pool-96-235-17-192.pitbpa.fios.verizon.net. [96.235.17.192])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4778317b7dasm64030251cf.64.2025.04.01.02.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 02:48:56 -0700 (PDT)
Date: Tue, 1 Apr 2025 05:48:54 -0400
From: "Gabriel L. Somlo" <gsomlo@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev,
	Robert Winkler <rwinkler@internships.antmicro.com>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, Marek Czerski <m.czerski@ap-tech.pl>,
	Stafford Horne <shorne@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [litex-hub:litex-rebase 6/15] drivers/gpio/gpio-litex.c:228
 litex_gpio_irq_set_type() warn: inconsistent returns '&gpio_s->gpio_lock'.
Message-ID: <Z-u2hqjCjqUDA4PS@errol.ini.cmu.edu>
References: <f8480c68-70e3-478b-927f-d21f9d0cef14@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8480c68-70e3-478b-927f-d21f9d0cef14@stanley.mountain>
X-Clacks-Overhead: GNU Terry Pratchett

Thanks for the report!

I've added a fix as `28882b03f381` in the current (for now) litex-rebase
against current (for now) master `08733088b566`.

I will eventually squash it on top of the original commit, unless
anyone (Geert?) notices anything still amiss... :)

Thanks much,
--Gabriel

On Mon, Mar 31, 2025 at 12:38:43PM +0300, Dan Carpenter wrote:
> tree:   https://github.com/litex-hub/linux litex-rebase
> head:   896969d069ea7223671dd1aac991c551baa91bac
> commit: 3eb679a2997bf7eb6be1760544632505440a563f [6/15] LiteX: driver for LiteGPIO interface
> config: s390-randconfig-r072-20250330 (https://download.01.org/0day-ci/archive/20250330/202503301335.C7M94pcE-lkp@intel.com/config)
> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202503301335.C7M94pcE-lkp@intel.com/
> 
> smatch warnings:
> drivers/gpio/gpio-litex.c:228 litex_gpio_irq_set_type() warn: inconsistent returns '&gpio_s->gpio_lock'.
> 
> vim +228 drivers/gpio/gpio-litex.c
> 
> 3eb679a2997bf7 Robert Winkler 2020-12-22  188  static int litex_gpio_irq_set_type(struct irq_data *idata, unsigned int type)
> 3eb679a2997bf7 Robert Winkler 2020-12-22  189  {
> 3eb679a2997bf7 Robert Winkler 2020-12-22  190  	struct gpio_chip *chip = irq_data_get_irq_chip_data(idata);
> 3eb679a2997bf7 Robert Winkler 2020-12-22  191  	struct litex_gpio *gpio_s = gpiochip_get_data(chip);
> 3eb679a2997bf7 Robert Winkler 2020-12-22  192  	int offset = irqd_to_hwirq(idata) % GPIO_PINS_MAX;
> 3eb679a2997bf7 Robert Winkler 2020-12-22  193  	unsigned long flags;
> 3eb679a2997bf7 Robert Winkler 2020-12-22  194  	u32 bit = BIT(offset);
> 3eb679a2997bf7 Robert Winkler 2020-12-22  195  	u32 mode, edge;
> 3eb679a2997bf7 Robert Winkler 2020-12-22  196  
> 3eb679a2997bf7 Robert Winkler 2020-12-22  197  	spin_lock_irqsave(&gpio_s->gpio_lock, flags);
> 3eb679a2997bf7 Robert Winkler 2020-12-22  198  
> 3eb679a2997bf7 Robert Winkler 2020-12-22  199  	mode = litex_gpio_get_reg(gpio_s, LITEX_GPIO_MODE_OFFSET);
> 3eb679a2997bf7 Robert Winkler 2020-12-22  200  	edge = litex_gpio_get_reg(gpio_s, LITEX_GPIO_EDGE_OFFSET);
> 3eb679a2997bf7 Robert Winkler 2020-12-22  201  
> 3eb679a2997bf7 Robert Winkler 2020-12-22  202  	switch (type & IRQ_TYPE_SENSE_MASK) {
> 3eb679a2997bf7 Robert Winkler 2020-12-22  203  		case IRQ_TYPE_NONE:
> 3eb679a2997bf7 Robert Winkler 2020-12-22  204  			break;
> 3eb679a2997bf7 Robert Winkler 2020-12-22  205  
> 3eb679a2997bf7 Robert Winkler 2020-12-22  206  		case IRQ_TYPE_EDGE_RISING:
> 3eb679a2997bf7 Robert Winkler 2020-12-22  207              mode &= ~bit;
> 3eb679a2997bf7 Robert Winkler 2020-12-22  208  			edge &= ~bit;
> 3eb679a2997bf7 Robert Winkler 2020-12-22  209  			break;
> 3eb679a2997bf7 Robert Winkler 2020-12-22  210  
> 3eb679a2997bf7 Robert Winkler 2020-12-22  211  		case IRQ_TYPE_EDGE_FALLING:
> 3eb679a2997bf7 Robert Winkler 2020-12-22  212              mode &= ~bit;
> 3eb679a2997bf7 Robert Winkler 2020-12-22  213  			edge |= bit;
> 3eb679a2997bf7 Robert Winkler 2020-12-22  214  			break;
> 3eb679a2997bf7 Robert Winkler 2020-12-22  215  
> 3eb679a2997bf7 Robert Winkler 2020-12-22  216          case IRQ_TYPE_EDGE_BOTH:
> 3eb679a2997bf7 Robert Winkler 2020-12-22  217  			mode |= bit;
> 3eb679a2997bf7 Robert Winkler 2020-12-22  218              break;
> 3eb679a2997bf7 Robert Winkler 2020-12-22  219  
> 3eb679a2997bf7 Robert Winkler 2020-12-22  220  		default:
> 3eb679a2997bf7 Robert Winkler 2020-12-22  221  			return -EINVAL;
> 
> unlock before returning.
> 
> 3eb679a2997bf7 Robert Winkler 2020-12-22  222  	}
> 3eb679a2997bf7 Robert Winkler 2020-12-22  223  	litex_gpio_set_reg(gpio_s, LITEX_GPIO_MODE_OFFSET, mode);
> 3eb679a2997bf7 Robert Winkler 2020-12-22  224  	litex_gpio_set_reg(gpio_s, LITEX_GPIO_EDGE_OFFSET, edge);
> 3eb679a2997bf7 Robert Winkler 2020-12-22  225  
> 3eb679a2997bf7 Robert Winkler 2020-12-22  226  	spin_unlock_irqrestore(&gpio_s->gpio_lock, flags);
> 3eb679a2997bf7 Robert Winkler 2020-12-22  227  
> 3eb679a2997bf7 Robert Winkler 2020-12-22 @228  	return 0;
> 3eb679a2997bf7 Robert Winkler 2020-12-22  229  }
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
