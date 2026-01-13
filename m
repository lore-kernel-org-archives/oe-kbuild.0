Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274DC38BF8F
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Jan 2026 12:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768308998; cv=none; b=hEAd477KKHMQsQShh11p0s1G+aHQMtr4WLCSSc6ynibHkFd1vuEC8ATDSVyD9D6YWVuktLV4yTqB73gt6s2iy76Hyq8D9FlUW35W1XvthE5hgSv0DB+7NrpsqPslnvfLWNqKgiaFMsfED0t/jfrxoZ7g2CxTm10q2yq9rIqUSAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768308998; c=relaxed/simple;
	bh=HfR7SYKjKMw/yEWhXP9A0b0DZoeSA7kOjP2UDNQTB5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z+giFwtX1Iud5uw7PhUYJ6u79zFwbkjFcJifQ6g8s5aen/21aMHDYCCK+5GMw+dsFWHnEV5oXMhlFId7+tvjarKEIjCasJ2pA+Asv1HkSHUrkXWwVZKBZprl+rV9EY9HpgtCo9CFdyM1oh1BbXTax6j6pCXoMzuL6aL6zxJaBNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D38Z5Iof; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D38Z5Iof"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-432d2c7a8b9so3893817f8f.2
        for <oe-kbuild@lists.linux.dev>; Tue, 13 Jan 2026 04:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768308995; x=1768913795; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wvh70Q1yDkMCMI+G/1qICpaiox12c57+ZdVdd7SsuGQ=;
        b=D38Z5IofGedY6gJ1fkFjI6WN8+frBcmYlfA9bTzMmc5ZLjcVh6eR9AiqbH66kl6qX8
         Qz3cxQw0wzxmoJ14Lci3/dFoNhp8hcqmJiP9MQpnGLGXkoNhTB33cOJvmdHxf6FZVLSe
         9p0LNtREC73O6Zk+cRz5WNrhqqZ3mpw9/zv16mj/ayb37amkJSvpbhjB3Jtuuw2M7nkt
         MkcIJfAuB9Jc1Pra9+3Cps76+JdnfRVpfHkkgskLhPX2yiiH+GcOWFg21IrcUn6toQVQ
         8ueplu6yYV/JpLErboQFkDmsevQMJop3EAEJ9AOHga38cyYS58TBf5nl3VUIpcApIsxA
         77xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768308995; x=1768913795;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wvh70Q1yDkMCMI+G/1qICpaiox12c57+ZdVdd7SsuGQ=;
        b=tABBRLjgz7hYuFNhiRgbI1xurKJHh+LOA5OaERa0OgCV8fy0QNGAhwbFMie6cnU9gQ
         N0/miFyDhiJB6/UFrkApFIJkrj8UbrqV3O3UdT6in3NK2/0RBw1/QvBRk/Nci83/twU+
         elOpcmr1Tjhe7NwvFDb6Of56yljZj0oTp5SUJ79RJV8Sn9ZAvJo+3eowN+jCLDDyq/sS
         40zzo2qtyW4x06F7p7y1pNvQKE3kWeVUnVnvrc1S1v3ARuFsH1tSAP+IE8h4zH0H4url
         8sEYpQd1oXPfeS1OR9i9IQ+TF5bNLSHQbphiawYWqgvIKbeMoD/PcCEX9nlmxrUzJENk
         OE5w==
X-Gm-Message-State: AOJu0Yy3/nbRY1tdF6x0CtXpIVSDpcvc5oKfOWoA+T/cRmHpW8UsKUQS
	vhpYTdySQeAsl2UJQD3NRqgRNx9mRGVLOXlu12+84JQqiYCYOKk0w0AunmPAJwPra7w=
X-Gm-Gg: AY/fxX7LWGDjKhVkL0htOxua8/7tGdkPRAQb3mUbVNiFDYAS2oPmkNZotkW5OqOf6D0
	+hNapWf2Ys751FR3TVWTaAmIcvn5RzcGrHIRumm+nEnZQAQdJyTSC0A5EXP1/QAAT52lyhwp2e3
	TI/INZisTeuKtWn2ahk/Bf6M3JfYE6wN/fnbHcPL4lZdbIhoydYmVTXzDyL+Jxwu8cBzEpmWf+x
	VuicOWnumVBoGLyNNi02AWzS7CMbIG9THjaOohyAIsybOu1tYRL3x+iQ8uNh6PVyoCT/Tei7mnS
	eATE51fc1pS7BV0G6MnF6zwX0wbzs7v2DMmvAQtGpkwpe8OUOsZgyD+x3vWOyj7hrltWKl0Stdy
	bNpUmGttSxWPqZshPWEJSFkqyFDl3OCSismZyOQdTcf65kQ0ukB8GDlW4Wbl7MWJYYweRNQtqY6
	AlVlGi+P1cprFB4NLd
X-Google-Smtp-Source: AGHT+IHgpWXybRkczvtnKd3NbBUIKjOlWu0IsIakI5sIPTmCI2xKZl/AEbekx6IbShd24xTNaLfCag==
X-Received: by 2002:a05:6000:4287:b0:430:f41f:bd5d with SMTP id ffacd0b85a97d-432c37a300emr23162223f8f.55.1768308995441;
        Tue, 13 Jan 2026 04:56:35 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e180csm42970728f8f.10.2026.01.13.04.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 04:56:35 -0800 (PST)
Date: Tue, 13 Jan 2026 15:56:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jan Kara <jack@suse.cz>
Cc: oe-kbuild@lists.linux.dev, Roman Gushchin <roman.gushchin@linux.dev>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Dev Jain <dev.jain@arm.com>
Subject: Re: mm/filemap.c:3307 do_sync_mmap_readahead() warn: assigning (-12)
 to unsigned variable 'ra->order'
Message-ID: <aWZA_rfBLWa9eCnr@stanley.mountain>
References: <202601131311.g3lyUAks-lkp@intel.com>
 <s47y6ysj4c2z5c5axtxbeset4divigctg4s3p7gbgmvfkoizeu@malcpodvrm46>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s47y6ysj4c2z5c5axtxbeset4divigctg4s3p7gbgmvfkoizeu@malcpodvrm46>

On Tue, Jan 13, 2026 at 01:24:20PM +0100, Jan Kara wrote:
> On Tue 13-01-26 14:12:28, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   b71e635feefc852405b14620a7fc58c4c80c0f73
> > commit: 9f1edf1aedac1b287355f63f768ba4275de72dca mm: readahead: make thp readahead conditional to mmap_miss logic
> > config: x86_64-randconfig-161-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131311.g3lyUAks-lkp@intel.com/config)
                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > smatch version: v0.5.0-8985-g2614ff1a
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202601131311.g3lyUAks-lkp@intel.com/
> > 
> > smatch warnings:
> > mm/filemap.c:3307 do_sync_mmap_readahead() warn: assigning (-12) to unsigned variable 'ra->order'
> ...
> > 9f1edf1aedac1b2 Roman Gushchin          2025-10-06  3306  		ra->async_size = HPAGE_PMD_NR;
> > 9f1edf1aedac1b2 Roman Gushchin          2025-10-06 @3307  		ra->order = HPAGE_PMD_ORDER;
> > 
> > HPAGE_PMD_SHIFT is zero in this config?
> > ra->order is a u16.
> 
> What's the config exactly? I suppose CONFIG_TRANSPARENT_HUGEPAGE is
> disabled in this case, isn't it? In that case force_thp_readahead will
> never be true and thus the branch with the assignment can never be reached
> AFAICT...
> 

Ah, yes.  You are right.  force_thp_readahead is false in this
config.

The truth is, I could easily disable these kinds of warnings in smatch
because this is marked as an impossible path.  if (is_impossible_path())
return...  I've done that on a case by case basis in the past but maybe I
should just do it globally.

regards,
dan carpenter

