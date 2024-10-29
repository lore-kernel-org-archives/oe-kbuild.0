Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C09202657
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Oct 2024 07:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730187495; cv=none; b=MXNn6MemVnffzq6LqGfA60yxNvoMwxEyLUZXtwnT1t2UTQPGod/ndMuGERgJVQuI5zDX57QUr8DrHE+Xx4L2OiLCULob54mAJYX86xKBqgkVz/lfRwc/EHPsdGaRUu8Uw85Q4cqsx3+c3/D/Q8kV+2Afpoikz4Nk1txooRiT18Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730187495; c=relaxed/simple;
	bh=8tO57yzbepSW3GqmEVB8NsDZtxXUlFlQ/nEWfs4Fl4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fI1gE8PSga4Di9hMZppzKcQP0KYmLAswKLBkMd0XVkhkTEuvWEbZwJ8v9HbWfIOBvs9ADQAdTdkNQ37yREeapjRUE/FX7X80f5XuvSc39ulvGSEuYglLLEw/o3IVyyxgVAjzdvhrKNeBKYA/J4APHCKoUAaE92WUPr7kSZ0QI/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V7t4Jynm; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V7t4Jynm"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c94861ee25so2919600a12.0
        for <oe-kbuild@lists.linux.dev>; Tue, 29 Oct 2024 00:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730187492; x=1730792292; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cV9yDfIVAjckEzAdmwXTwTo2IzjdqwOl2D1fRgidvv4=;
        b=V7t4JynmH8tyLnk/97BQ5vFMUrIqRXjA2WUwB3pTqGD3rMJlHKR4MiYHvQbPBSbE77
         aYNkep23hK6T+9UX7ZojEIJmU/BIi3yNM0R3A7Zd7uxZ/B2Ot9uKdMst/Iku+HMzNwaa
         7I2JsRzZhHabAF9M6VYCeqLPyGHWgbZnUR5YTt+9sSW5R0pO/9ZzE3vUokz/0REG7Z7X
         lrRpIgYKgckbMSAmDj4FOlsJucrQnflOvRHfCbrvtfrm0uu9vdGCAOC+wgSJRTzEgHov
         0akdvcAUD+W0ZOqG+jd6VMAhm7+q6IOgPjRPC6lT+LpUqYahqF6+QqG2204ZcCnJzkPz
         /lYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730187492; x=1730792292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cV9yDfIVAjckEzAdmwXTwTo2IzjdqwOl2D1fRgidvv4=;
        b=jJx6R1EkqI+BxNY5RxJOnAySBRYaFiQKeFxwpbG61bXSnUutD01M/LOkazzMjJQecm
         99U6Cvredi/cwXEWsvlD6/6zGSkKG41ICU46UB/LodU1cptgfT2rEmrxtjty9jkNl1mn
         WDiJ4RzmRxGFFgS9TtNuZWuxdkO42o4TsbhwZNyEnPRkrYdRtFCcAJOzULou6kdSYVR6
         ujm2ngbySf5ugLHdsJnuNLjZjc4vCFMHWmZ0YzBDteA+1OgZkUcXAPAfNzWppoeY3yv5
         y+NeEbSUO4fN2VcF530wvbMbAGBO8IXddRb5cj/7+u1Hh6DI6Tmw7U+692aDkrQu60b/
         NvuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrwK4BYoTm7UgTKk1U7lzlOUataW/BXO5zTSThurFSdtmofsODuQSuUD7dy9//Hcj2YKoiUG0ZNAY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJ37nir3gMwk9MarlKnchJWhpQb6trI8lHPYSyn+jmZSVONQyj
	72pVueQzrigD+Zbu3S2hMmU6xWz4UHTyhmsYthQNlPKxBZpxssxnUArJPxeXspVO20+f33TQDn2
	f
X-Google-Smtp-Source: AGHT+IF47bz1F7DhgPoiWr+IviDyyt9/wcQ7nPRiMlBiRDx7vWXP2gLN6e2f8LT8h/R+Iygma5dhDg==
X-Received: by 2002:a05:6402:1e93:b0:5c9:40f5:1518 with SMTP id 4fb4d7f45d1cf-5cbbfafd4d9mr12319081a12.35.1730187491686;
        Tue, 29 Oct 2024 00:38:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb62c14c4sm3706291a12.44.2024.10.29.00.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 00:38:11 -0700 (PDT)
Date: Tue, 29 Oct 2024 10:38:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matthew Sakai <msakai@redhat.com>, oe-kbuild@lists.linux.dev,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev
Cc: Mike Snitzer <snitzer@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: drivers/md/dm-vdo/data-vio.c:976 vdo_launch_bio() warn:
 inconsistent returns '&pool->lock'.
Message-ID: <fb2df01d-07d5-482b-af6c-1ff53129f7c4@stanley.mountain>
References: <717e8949-55c4-4461-8951-3e582e9b77ef@stanley.mountain>
 <f074f848-5a26-473b-ae98-1932e9a8cbd1@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f074f848-5a26-473b-ae98-1932e9a8cbd1@redhat.com>

On Mon, Oct 28, 2024 at 07:00:40PM -0400, Matthew Sakai wrote:
> This should be addressed upstream by commit
> 872564c501b72ae0c84af51084753e8652e4a84b ("dm vdo data-vio: silence sparse
> warnings about locking context imbalances")
> 
> That commit is from February. Would it be possible for these checks to use a
> more up-to-date version of the code before warning us about things that have
> already been addressed?
> 

Sorry, these emails are auto generated by kbuild.  I don't get a lot of
context outside of what's in the email so I didn't realize it had already
been fixed. 

I looked at today's linux-next and that doesn't trigger the warning any more.

regards,
dan carpenter

> Matt
> 
> On 10/21/24 3:19 AM, Dan Carpenter wrote:
> > Hi Mike,
> > 
> > First bad commit (maybe != root cause):
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   3d5ad2d4eca337e80f38df77de89614aa5aaceb9
> > commit: f36b1d3ba533d21b5b793623f05761b0297d114e dm vdo: use a proper Makefile for dm-vdo
> > config: x86_64-randconfig-161-20241019 (https://download.01.org/0day-ci/archive/20241019/202410191209.osrd8z9H-lkp@intel.com/config)
> > compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202410191209.osrd8z9H-lkp@intel.com/
> > 
> > smatch warnings:
> > drivers/md/dm-vdo/data-vio.c:976 vdo_launch_bio() warn: inconsistent returns '&pool->lock'.
> > 
> > vim +976 drivers/md/dm-vdo/data-vio.c
> > 
> > 79535a7881c0cb Matthew Sakai 2023-11-16  958  void vdo_launch_bio(struct data_vio_pool *pool, struct bio *bio)
> > 79535a7881c0cb Matthew Sakai 2023-11-16  959  {
> > 79535a7881c0cb Matthew Sakai 2023-11-16  960  	struct data_vio *data_vio;
> > 79535a7881c0cb Matthew Sakai 2023-11-16  961
> > 79535a7881c0cb Matthew Sakai 2023-11-16  962  	ASSERT_LOG_ONLY(!vdo_is_state_quiescent(&pool->state),
> > 79535a7881c0cb Matthew Sakai 2023-11-16  963  			"data_vio_pool not quiescent on acquire");
> > 79535a7881c0cb Matthew Sakai 2023-11-16  964
> > 79535a7881c0cb Matthew Sakai 2023-11-16  965  	bio->bi_private = (void *) jiffies;
> > 79535a7881c0cb Matthew Sakai 2023-11-16  966  	spin_lock(&pool->lock);
> > 79535a7881c0cb Matthew Sakai 2023-11-16  967  	if ((bio_op(bio) == REQ_OP_DISCARD) &&
> > 79535a7881c0cb Matthew Sakai 2023-11-16  968  	    !acquire_permit(&pool->discard_limiter, bio))
> > 79535a7881c0cb Matthew Sakai 2023-11-16  969  		return;
> >                                                          ^^^^^^
> > 
> > 79535a7881c0cb Matthew Sakai 2023-11-16  970
> > 79535a7881c0cb Matthew Sakai 2023-11-16  971  	if (!acquire_permit(&pool->limiter, bio))
> > 79535a7881c0cb Matthew Sakai 2023-11-16  972  		return;
> >                                                          ^^^^^^
> > Still holding pool->lock on these paths.
> > 
> > 79535a7881c0cb Matthew Sakai 2023-11-16  973
> > 79535a7881c0cb Matthew Sakai 2023-11-16  974  	data_vio = get_available_data_vio(pool);
> > 79535a7881c0cb Matthew Sakai 2023-11-16  975  	spin_unlock(&pool->lock);
> > 79535a7881c0cb Matthew Sakai 2023-11-16 @976  	launch_bio(pool->completion.vdo, data_vio, bio);
> > 79535a7881c0cb Matthew Sakai 2023-11-16  977  }
> > 79535a7881c0cb Matthew Sakai 2023-11-16  978
> > 
