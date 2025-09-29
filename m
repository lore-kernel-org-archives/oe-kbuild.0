Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF89277C81
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Sep 2025 08:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759135733; cv=none; b=uTWycqca6PBC/0T/QeabUB1GFO4Q+tubKvtnhxfX9uJH6W+Gz9gR/NppoVUhZGMsbYwZ/PomyaPzzeXemEfDnq3uwLCG5gmTClklmcFqhwzlU7dHIGFMa7BcieZA3pbN31Ai0wUVDCilEr3yOxhG9ZFRdGSuD/f9P0xvBvmo2Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759135733; c=relaxed/simple;
	bh=g1mm24DACTecjNAJvzrdNdg9fsLkeeEtFb5wtV+hB2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mKu9M4qZcg8645svtOYFeT/8QQmKR9eSpHlfrjTddzHyVTtn83s0QTjU7fiugDCzASLf3yLEoXV1Zp4EX8VeTZv/SgOC3VSfOEIMFSnQjAq9YIFqzi/YlmJbvAeNsorj/z2+29gjRfMQiiqpsVDnyAd1pPle8MgN1RILfPFdtjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O94xhXZQ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O94xhXZQ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3ee64bc6b85so3836459f8f.3
        for <oe-kbuild@lists.linux.dev>; Mon, 29 Sep 2025 01:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759135730; x=1759740530; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vltcl8v69f7bQvSIghkVp5oW+UsVhLKoUiMkT13h1P8=;
        b=O94xhXZQolVh59SaiDe+DP1ncS4eOTfdauPecnevzQPyS0XtVhT5EaV9igNbzzBlD8
         CMFVeLQGdTbW1AsV0yCuOYQ6voGVHgH1bttnwFS/EF5zEn3LvbDBtl1XRfiEkZZwxck7
         mepvAvux8wL4Y8hgAN6fcEgHMGZIOuUa+sICut9l+ENCeocIKa+qICFeQ1JfQKIo/8Ig
         E/xpVUClNZGbAUw2LZMfDQMo0qIsHaybXPdmgWBzZeAVYo6RA4J0xpKCXEFSVp5C1QkZ
         JZeLNW6l7fTqdWdPN+CyJ0AA1aFeFwZF5tMHKSwvOb0QgyegStky+q+8AHjibJuHQJ/d
         l30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759135730; x=1759740530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vltcl8v69f7bQvSIghkVp5oW+UsVhLKoUiMkT13h1P8=;
        b=FN0wGcVgrQRY06EIJzion4F3ByFVSkZ622nDV00dSlB07RtXh5cRA2D3+zvZnMm8NC
         /wujyRTRW8CgqHJruSiHvcGvBuKVTwWYdehT8PQttjYvVF4HUcHoax/KvEngFKgXVAxy
         CSBSS+vqVYWQYTuoFmSb4s0mtFvj1I52yqoU3oV18Eva5PFNn8S33GFNiI0fi4PPhqwP
         NLF1DdIk3NZhyA4Ile8rpz5soVzoJgViINnklYV0huuK/TIwKS0vZrmUKoHxhAtyIVDF
         JBVBVgdLbhRQ/0CsjZgOCoWW89fc4zbEsMrrkk06hhdh5WOyNe/VxbPxngyMtsHYIOwG
         IrRw==
X-Gm-Message-State: AOJu0Yw57FVPPHBnMKXWaA4yYj4aHXTJto3ZuVOcYoZoKm/tGHMSl6FK
	VZGMO468trAEFvK/1upYBovPbBtOh/hgq53S/mEamzcUhBYcyubygzw8bfvEGwNHllyBsXY3Yln
	MmHao
X-Gm-Gg: ASbGncvYoG5k9Dz8eWe2xIiO3IQMWFqAJaASdsoEmNeOuD1NQU15BswVhoJUa26VpAu
	Ly1DSoSh+hAa0ioergbiXy4QL++Hl4akPwNtX9A6iIzxXRFpUHdtNizP3f4kCNAAFqmRgElwf+3
	nBbv8ifUD6NQNgPsVvyn7T3G1TGTlsBs7BYsgQR53C2pGqOmHdDa0sknzZb1M07i4Stjt5zAsRD
	wKujndqkcJzyXtV5l+nCZhTf1v3cNXDAYJ2LOi+WTZeSKYuMSTa0aGQ7nz//6SRZ04k94rF2p8x
	3U5hxfNPVtq8jAeZYMdmmDWDgC9zV1ZnN3ylW6ObhXU849/mvNdDGv9PKXdY7jn1CTKNhisSawM
	Dd01ppQ2y21uVieDQGwPfCLUPc2qQbccnhq+pM544F127a1p+Jg==
X-Google-Smtp-Source: AGHT+IHq24YEQ+NGSgOKpmgkwFuU/SY2eluplaIZkQeebKuol6LbVx5PSlBlDAWVI5mgbmhWjPxYOw==
X-Received: by 2002:a5d:5f45:0:b0:3ea:a496:9ba8 with SMTP id ffacd0b85a97d-40e480ca410mr14224093f8f.29.1759135730161;
        Mon, 29 Sep 2025 01:48:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-40fc5602efdsm17883106f8f.34.2025.09.29.01.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 01:48:49 -0700 (PDT)
Date: Mon, 29 Sep 2025 11:48:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Mary Strodl <mstrodl@csh.rit.edu>,
	linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linus.walleij@linaro.org,
	brgl@bgdev.pl, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/3] gpio: mpsse: use rcu to ensure worker is torn down
Message-ID: <aNpH7gfhJXIBbCQZ@stanley.mountain>
References: <20250923133304.273529-2-mstrodl@csh.rit.edu>
 <202509290823.hreUi6Tp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202509290823.hreUi6Tp-lkp@intel.com>

On Mon, Sep 29, 2025 at 11:46:24AM +0300, Dan Carpenter wrote:
> a14b0c5e3b0741 Mary Strodl 2025-09-23  339  		/* Make sure list consumers are finished before we tear down */
> a14b0c5e3b0741 Mary Strodl 2025-09-23  340  		synchronize_rcu();
> a14b0c5e3b0741 Mary Strodl 2025-09-23 @341  		list_for_each_entry(worker, &destructors, destroy)
> a14b0c5e3b0741 Mary Strodl 2025-09-23 @342  			gpio_mpsse_stop(worker);
> 
> This needs to be list_for_each_entry_save() because gpio_mpsse_stop()

s/save/safe/.  #CantType

regards,
dan carpenter

> frees the worker.  Or kfree_rcu() inside an rcu lock or something.
> 
> a14b0c5e3b0741 Mary Strodl 2025-09-23  343  	}
> a14b0c5e3b0741 Mary Strodl 2025-09-23  344  
> a14b0c5e3b0741 Mary Strodl 2025-09-23  345  	while ((irq_enabled = atomic_read(&priv->irq_enabled)) &&
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
