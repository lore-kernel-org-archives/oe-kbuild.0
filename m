Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FB22EAB61
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Oct 2025 10:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759488834; cv=none; b=PS3kiYE/gyUvrDwZy1iGNdqbwCimwVO5eJ/yxZBvo/+Z+8qskjm98fBNcV9nBFl5t6oobORimLmrMnlAyJj4kiH0erNx7TcXQu8CanmajZW2s73vyoxprONr5uHTLM6hJRLi65TxxgCOZ+Zi63dFu63JRRezgvqH7jr6q5X5Nhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759488834; c=relaxed/simple;
	bh=UFcz23HgBO5hzJco7gPQTmR+kMORHGddodDKDlaocds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zp5JIskGHo7H99UDiImnGan127tTw935ID7ZvwO76dDHUu5rg2iK/R7eULAThtY/pDxjgjVGoO8IP1eMAsYLqOa396fPbfchKkKuJnB3fG7BL2e2vOSk1D5wHRGur8u3/Dk3tdJ0ab0ik69mcHv/9ZlP6+0Brxy8qvL5AgEzNRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z9At0WK1; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z9At0WK1"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46e491a5b96so13111845e9.2
        for <oe-kbuild@lists.linux.dev>; Fri, 03 Oct 2025 03:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759488830; x=1760093630; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Jq1nFX8ssmKPjRdYEcACdaY/2lxp/Z6xx9OphjWlEk=;
        b=Z9At0WK1wCT8qJr22rt6ZWXeAvmZ4t1mKL4rfI3MqQAdEB5dlgv71XHIrJZ9eXwLSX
         NjafD1mhi0rCnsqYMZfGcFoBf7fWrBgTZc0EXxYoXnu54ewCbNQ/zpwa3atR8rKKbVE2
         OIBLQ9qeh3Re9pqKDFJNekqtQWaUTT//mESCN5ZNnjCvYYl1KUPPr1tzOTVV537WTQEE
         KL719a6n5QOTwvgKzs7x6mapbLnbrIB1odmrsOFuxwTp6OskONQTIhSWPDA4Aa/7oUbx
         okGFNDKTXlF/4e5z7sk9GBbK2ry15MshtoTO7pSeDbt44ZZjZ04QoxgLc1Sdea0Fsp99
         /kUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759488830; x=1760093630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Jq1nFX8ssmKPjRdYEcACdaY/2lxp/Z6xx9OphjWlEk=;
        b=CTWo63H75ZApM0CzMqMBj2HV0qym1Cm3Jr+BSTDqmXfUEVeQvxi8o3oHLY0MkiI2As
         5ZgvJw8mNQCpv3aIQXW7JMbe6l5i4FwYdA+fvf+V49UjFFEhVpxSgs4Z8HeZCGMBQJyk
         NAcUsr5SRwOcmxaKQcaXLwHYX/vEGvNEdZf3/kWqYfF8SpJwdPrgLCUOOvOTGKkbreLy
         XHrDAkIxfoyp6FmKE82uOyoADKXlDfSimS0MI+vs3ObwKnQDI/2R+/2P0KPkznj/+tL8
         hg/NFc7p3LWUUs6VGI0UWI21narRVbK3BJUEORmDoYGuMGOgmBpmCw/HrHtxbFG6N+uu
         u/ZQ==
X-Gm-Message-State: AOJu0Yw8ZXGwZxj5knSdv3V2j0fcRWAPe9oQ/EVYs17pM5OEKZQiJexM
	WuIf0QPKEGNV9rn0x8FLSizsvfxk+uvIB/ENwFzTzYgD/0vFu54KHF4LYBbbX4tuEsg=
X-Gm-Gg: ASbGncvLEBh/S4MM33nWYB605/9iQ/AosbAHbR4vYQL7q47N6ZdaYGAWy8xShaP4SFY
	1aTXxzNGI3ciPHjzb785Gcv/7qedRc9AQbNSmYCpsaXGsfbaiqeyeSm/wOeYAJNHLT7vXKddwX3
	n8rqpP2jw4wRkyozeHOGRcKzzkGWURkwdivmkw8jpB7TwziVB8eK7y+PaDIIf8/4bEZRHzkzzyF
	16POg3fOs6ncOdUB7bj+516BgPC7QY+0vaN+aLOYDg1zkC9IFFBU8rT/nMNO2TY6esBBslDc5Nv
	sZEKyKjK2dumAAZn9ptMcSE7FLRe5tfh1WN6UZPh7UpGuBwCE8LCwoMcmGsJFs1DMGZJ5aIZU+u
	gfd5WroCjvQkFZVP5VSmieRRsUYWXTFr12DBcDnVWWrDGgBnORJ7ghVQhCfxcMD5K3vQ=
X-Google-Smtp-Source: AGHT+IFKI8vo6YXEW6ISLFO/Qw8pm8IzIzu23bQ7h92y6EJ7m/68WLpBHtBfd+86xhRULF05lq2UJA==
X-Received: by 2002:a05:600c:4f08:b0:46d:d949:daba with SMTP id 5b1f17b1804b1-46e7608b683mr4836045e9.4.1759488829930;
        Fri, 03 Oct 2025 03:53:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4255d8f017esm7511774f8f.47.2025.10.03.03.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 03:53:49 -0700 (PDT)
Date: Fri, 3 Oct 2025 13:53:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: oe-kbuild@lists.linux.dev, Qu Wenruo <wqu@suse.com>,
	linux-btrfs@vger.kernel.org, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/4] btrfs: make btrfs_repair_io_failure() handle bs > ps
 cases without large folios
Message-ID: <aN-rOq9boL0hXZ3R@stanley.mountain>
References: <202510030550.mqFoO0Dw-lkp@intel.com>
 <234df03b-e6fc-44c8-a28f-aa51305d87a0@gmx.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <234df03b-e6fc-44c8-a28f-aa51305d87a0@gmx.com>

On Fri, Oct 03, 2025 at 06:47:11PM +0930, Qu Wenruo wrote:
> > cc53bd2085c8fa David Sterba      2025-09-17  885  	if (unlikely(!smap.dev->bdev ||
> > cc53bd2085c8fa David Sterba      2025-09-17  886  		     !test_bit(BTRFS_DEV_STATE_WRITEABLE, &smap.dev->dev_state))) {
> > bacf60e5158629 Christoph Hellwig 2022-11-15  887  		ret = -EIO;
> > bacf60e5158629 Christoph Hellwig 2022-11-15  888  		goto out_counter_dec;
> > bacf60e5158629 Christoph Hellwig 2022-11-15  889  	}
> > bacf60e5158629 Christoph Hellwig 2022-11-15  890
> > 2d65a91734a195 Qu Wenruo         2025-10-01  891  	bio = bio_alloc(smap.dev->bdev, nr_steps, REQ_OP_WRITE | REQ_SYNC, GFP_NOFS);
> > 2d65a91734a195 Qu Wenruo         2025-10-01  892  	/* Backed by fs_bio_set, shouldn't fail. */
> > 2d65a91734a195 Qu Wenruo         2025-10-01  893  	ASSERT(bio);
> > 2d65a91734a195 Qu Wenruo         2025-10-01 @894  	bio->bi_iter.bi_sector = smap.physical >> SECTOR_SHIFT;
> 
> I have no idea how to make smatch happy.

I would just delete the unnecessary NULL check, but an equally valid
thing is to just ignore the warning.  In the kernel, all old warnings
are false positives.  I'm never aiming for being completely free from
static checker warnings because that means we have to be less ambitious
about what we check for.

regards,
dan carpenter


