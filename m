Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50EC1F4FC6
	for <oe-kbuild@lists.linux.dev>; Mon, 21 Oct 2024 14:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729522307; cv=none; b=AbXbFu+Pf7lZH/IoZEH4bReFpfYYMLCGWgMeFYWOC0lw7LiP/st6PjuQ6p5ov46Avtn1MzTrTUBgY8qlxg6qMkI9NolIt8iQ23i71I6SROEuUouN2WZitD4gltevx/D9V0pjqZfbYHf972f6F35iO45I9+l7lzXOQ7m0P5+4g0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729522307; c=relaxed/simple;
	bh=ChKVZyrjxh9+XwaR7MMlEWsMEZCBxWkHjJZaioy3SEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NsBurMX45HJReCImJJiJV1QqZrB7OYGqxG4xmvX6I9BhkI4mAkl98a6SzjRVoF5tNRHJJSaxUYD1qQUt3g4QgxMGwiNlUgwql+a0QHolBe40ep+Dzhy1wS+86L2WAgTaGtLIvPUgCaRT5lCzo4la9Ajl8DqFdDYqMddjFe5+TbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RF9bJp94; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RF9bJp94"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4315839a7c9so50624235e9.3
        for <oe-kbuild@lists.linux.dev>; Mon, 21 Oct 2024 07:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729522303; x=1730127103; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Z9Q2MtCCntmVwhVYdGVAXyyp1NOdlOZp6/E1q7IeFs=;
        b=RF9bJp94MgmcpynK/KuYN+3nQorUTH3FDeNUGtLFaL3coWZmF3PPVY8Ef95qCeL8F6
         Sng5B1SDYfdBlWJOe+unkIbrUJHcMNbXM7cz8w0RaNurIYLSG4Iwo7tnoMFy4b9LS2DH
         6jCgDQBjzPT0P0YHyD+Sd7VhEcKwQkexC6Ct5La7hvT9GZqJ6wf5hSgrUco4PBmXjNPA
         ddaf5exUiuGt5pQOLLCFzRfTcyg+YkLmEhZoIWZCIeEkB8N3INQochJ6BFNRGx142c+k
         n6qCevXou847CQ1cQGcasn5naHCEUkzr+IIlxfeUIZiWBpd28+CJNL2hoiZizgtBzSu5
         viHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729522303; x=1730127103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Z9Q2MtCCntmVwhVYdGVAXyyp1NOdlOZp6/E1q7IeFs=;
        b=Ob+oES9/5WIqFaZnmXg5vLh8U61fsWYVBQ5UEfENHNgEIaIWp8lhiwdl6LhlG7s9hm
         k4UtPtULlu77YnNVfqdfx7xlI1BpLJebGs0Wfg+uEJMb55yDkKtfbKVYuJ0/6H0AWUWO
         m4mHsU9Ewx9C3SpVeFmMFhM1zPLatjU6wkDCz9y+TOzlIYOYqjikP9vHqgSkl2ZUcvnS
         5M+swGa3k+duy8/Nxqw9df45/jrjoSKk3pLaf01A5gw4ktSEMgHxaVLx8hpbwyRCfxNC
         JESHgcpjcxSh2Sic2wpRZnNgf/qocGy/kjEBjxWL9IyDEVaOA5RogFrxqUyPwVE9Wrgq
         M+4w==
X-Forwarded-Encrypted: i=1; AJvYcCXuHWiDQ8nXGRvkNAJfc1EQYBnpH5Y+auvNQf74Jr0xHZ+IDkj5k8pJyDxFn+or1bf4ucDxCcBRhFA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyK1eMk3liaiUzJ3snVYJQl4UlbqIMDtulNKY2c4tJHWzd7HYeo
	hWpfmegWjmACqjaa89+nwzXGQPe0XNxD0pHZHQAmQ/zjj1k7G8MWIRx0++LfWdg=
X-Google-Smtp-Source: AGHT+IEV0YY5RSfx6BF88VTbBqIA7D69C27MJs3jYbXvWj8aYPPWm8rw6LNfjQ4aRnr9ZXYlQd6pVA==
X-Received: by 2002:a05:600c:510f:b0:431:1868:417f with SMTP id 5b1f17b1804b1-43161667a1cmr96389285e9.17.1729522302922;
        Mon, 21 Oct 2024 07:51:42 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f5c314bsm59859515e9.32.2024.10.21.07.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 07:51:42 -0700 (PDT)
Date: Mon, 21 Oct 2024 17:51:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild@lists.linux.dev,
	Dan Carpenter <error27@gmail.com>
Subject: Re: drivers/mmc/host/atmel-mci.c:2552 atmci_probe() warn: passing
 zero to 'dev_err_probe'
Message-ID: <ba396ac9-579b-4919-82a7-4daa0d564dea@stanley.mountain>
References: <202410210023.6s07Bozp-lkp@intel.com>
 <ZxZnT6sg4H-F-MmW@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxZnT6sg4H-F-MmW@black.fi.intel.com>

On Mon, Oct 21, 2024 at 05:38:07PM +0300, Andy Shevchenko wrote:
> On Sun, Oct 20, 2024 at 10:42:52PM +0800, kernel test robot wrote:
> > BCC: lkp@intel.com
> > CC: oe-kbuild-all@lists.linux.dev
> > CC: linux-kernel@vger.kernel.org
> > TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > CC: Ulf Hansson <ulf.hansson@linaro.org>
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   715ca9dd687f89ddaac8ec8ccb3b5e5a30311a99
> > commit: e38063b94324bc1409a29d699c73938c3d008126 mmc: atmel-mci: Switch to use dev_err_probe()
> > date:   6 months ago
> > :::::: branch date: 17 hours ago
> > :::::: commit date: 6 months ago
> > config: arm-randconfig-r072-20241016 (https://download.01.org/0day-ci/archive/20241021/202410210023.6s07Bozp-lkp@intel.com/config)
> > compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > | Closes: https://lore.kernel.org/r/202410210023.6s07Bozp-lkp@intel.com/
> > 
> > New smatch warnings:
> > drivers/mmc/host/atmel-mci.c:2552 atmci_probe() warn: passing zero to 'dev_err_probe'
> 
> ...
> 
> > 965ebf33ea5afb Haavard Skinnemoen          2008-09-17  2529  	/* We need at least one slot to succeed */
> > 965ebf33ea5afb Haavard Skinnemoen          2008-09-17  2530  	nr_slots = 0;
> > 965ebf33ea5afb Haavard Skinnemoen          2008-09-17  2531  	ret = -ENODEV;
> > 0a454e95230886 Andy Shevchenko             2024-04-25  2532  	if (host->pdata[0].bus_width) {
> > 0a454e95230886 Andy Shevchenko             2024-04-25  2533  		ret = atmci_init_slot(host, &host->pdata[0],
> > 2c96a293bbd6b3 Ludovic Desroches           2011-08-11  2534  				0, ATMCI_SDCSEL_SLOT_A, ATMCI_SDIOIRQA);
> > 7a90dcc2d7ceb6 Ludovic Desroches           2012-05-16  2535  		if (!ret) {
> > 965ebf33ea5afb Haavard Skinnemoen          2008-09-17  2536  			nr_slots++;
> > 7a90dcc2d7ceb6 Ludovic Desroches           2012-05-16  2537  			host->buf_size = host->slot[0]->mmc->max_req_size;
> > 7a90dcc2d7ceb6 Ludovic Desroches           2012-05-16  2538  		}
> > 7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2539  	}
> > 0a454e95230886 Andy Shevchenko             2024-04-25  2540  	if (host->pdata[1].bus_width) {
> > 0a454e95230886 Andy Shevchenko             2024-04-25  2541  		ret = atmci_init_slot(host, &host->pdata[1],
> > 2c96a293bbd6b3 Ludovic Desroches           2011-08-11  2542  				1, ATMCI_SDCSEL_SLOT_B, ATMCI_SDIOIRQB);
> > 7a90dcc2d7ceb6 Ludovic Desroches           2012-05-16  2543  		if (!ret) {
> > 965ebf33ea5afb Haavard Skinnemoen          2008-09-17  2544  			nr_slots++;
> > 7a90dcc2d7ceb6 Ludovic Desroches           2012-05-16  2545  			if (host->slot[1]->mmc->max_req_size > host->buf_size)
> > 7a90dcc2d7ceb6 Ludovic Desroches           2012-05-16  2546  				host->buf_size =
> > 7a90dcc2d7ceb6 Ludovic Desroches           2012-05-16  2547  					host->slot[1]->mmc->max_req_size;
> > 7a90dcc2d7ceb6 Ludovic Desroches           2012-05-16  2548  		}
> > 7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2549  	}
> > 7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2550  
> > 04d699c3643fbf Rob Emanuele                2009-09-22  2551  	if (!nr_slots) {
> > e38063b94324bc Andy Shevchenko             2024-04-25 @2552  		dev_err_probe(dev, ret, "init failed: no slot defined\n");
> > 965ebf33ea5afb Haavard Skinnemoen          2008-09-17  2553  		goto err_init_slot;
> > 04d699c3643fbf Rob Emanuele                2009-09-22  2554  	}
> 
> Smatch is wrong. When nr_slots == 0, ret is guaranteed to be defined
> either with -ENODEV, or with the returned (non-zero!) code from atmci_init_slot().
> Did I miss anything?
> 

Yeah.  I look over these results and filter out the false positives.  You're
reading emails I didn't filter.  We set this up a long time ago before lei was
around, but now that people are using lei maybe we should re-think the system.
I also filter out duplicates.


Smatch doesn't handle loops correctly so it just marks nr_slots++ as unknown.
So then it doesn't parse if (!nr_slots) { correctly.

regards,
dan carpenter
