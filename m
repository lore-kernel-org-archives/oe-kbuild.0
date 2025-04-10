Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9F126A0D4
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Apr 2025 09:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744279081; cv=none; b=HTkhv6E6XbMrYQOaXqswWFodi8Gj97uDyQp9vqtbMB4/7rL6OR6fX+x7wqRZ7qcx2lNKVnGmKfnsIZDX/52XpC2y9oK2iQpThey8HB+vZQY82tc7XRhyHyvdvOi6/GHAHZZ6LRPg5xw/W1ej6XYinmXBESGLdymjxQhxWvt5GtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744279081; c=relaxed/simple;
	bh=CW5g3wYp9KL1gVQvH/LT0BdadUWQJrj72wibka1rya4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eFGKOyIqlNobO/k4A0FC4UW5JDfqbJYdfOsx9g4h8+/HtODl84Oh+euNtHxtsNW0mUSIPu146Z7S/hAqdS0G7XU81WJml+snBW5GyO7wZYhfvoHG/2sAnndqxDrJxm7riMQfExZsiPjXPyxm59DAAFszIVLlJMl+gjXo1ap/THY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=do31m8n7; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="do31m8n7"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so5673455e9.1
        for <oe-kbuild@lists.linux.dev>; Thu, 10 Apr 2025 02:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744279075; x=1744883875; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z8W+GulkDGBime4ZK9OwOUCjZYgRnq/dZvJvvvfuncM=;
        b=do31m8n7M2pMEvgX4PrUMY/0o9TijlZudRtRS9wFKAgt9NEj3D36a7GAHRrCMzYd4Q
         IBnOjw2FdIYOvqihLaHW5TcLSF1xWhCaR8pXpumgUR7+XPzih+LFt/9Wts7Kt9T5uNCG
         eSPzjQj5RhZUIWk3j7awfwP2nCtAAPM9FNqEpowyNemnfyHqbQlgJdinKxKjjYsG6KcR
         fYMEAbdtOkKblI6Wg1h5OqkZdiOtTI4l5yraMudNzF9iEmv7OzFWuUpWqpy9/rjPBNGD
         7SS8tSKFmdegq2g1EEKnkuZuXVF/Jthlp4U867kreGIHbWcl2xpP5awAzx4OZcOMsobs
         oTkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744279075; x=1744883875;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z8W+GulkDGBime4ZK9OwOUCjZYgRnq/dZvJvvvfuncM=;
        b=gGdcWtCWXuMMTxYLH6AA0sjNtJzBOjl17Zu2yRGgHXVwRPYb0Pm3/RT/l/fXa3YGNg
         6+803GxDCDtlBrw/yuv+tY7TWMWkjeOIuG8H1fBX+sblc4cf09qXGraY/7Uq/9P91Vre
         rwbUZKQNGUWS1xnjeJeAbMyHvFhIaXTjpwUUXnrfpJ+6derM1vmcoGgPW4qnxdkwiJIw
         ZZv2BsJztT+Le2x8+mfBloDZSCyO7lyjc3VJpZ7CGR+OIfWi1Wtqxu5qZm44Wm6CThTd
         TSgyV8AsSXm/lR7r4LE+ORUCk2wH4d03LhpK6N7ZLu+QW/juajZQa66P5bpIqasT7kVg
         pdZw==
X-Forwarded-Encrypted: i=1; AJvYcCVUR7XGcmJL92botUeAh1Ov5FUT0+RR2Sqb7qAJNCnrLKFvCDp6LVF670fofeCfJ0209bM5Vuzt1EQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzggPTu0eK+AZJ76qkEJK2/b1eubblzCg2xbMypfBaCXmz0MqpF
	aJrDMkq88QDKL1qlhMu88LxyIhv5Pmp8uQzANa9L1acGOKIwhuBNbFmDK+VicSk=
X-Gm-Gg: ASbGncsNf8UGWXYwFz2ldpZa4UT1t7Hrjl77s9L38it9dXm30IXAKH7/XzzDr7qBvmt
	UZJ7baboWF8zYH9CZA0clfUjRu6TpRlCYV9Td39sxGzpksyZsVkYGbLQ2igi7e0bHogqrUzXiNS
	5dWgKA7lCAlPLQ5MtdMiAP0tiA0MbH2yeZiXWPYJ77jElJw9bYDixN/cjREbk9JTrsQVzgTeM5u
	YoDmKmRTO5WLSsTMt1/QXKXZiXtNLBEl11nOEescwlz/Z0tLL28qgRJ9+o6aZgffmZmkL3fEkeP
	MmA/bp2pPLAI5g+CjOWMidVIDrRxIz24ubySHgmJAdQ9MWywfxGdLJSS
X-Google-Smtp-Source: AGHT+IEI7OSG+hIdjY4nTYGxTWexSVcR9vMqNh2S58M8qMW4Ld4ib5ru6erbmUkRfTs1cPbuiU/iwA==
X-Received: by 2002:a05:600c:1d94:b0:43c:efed:733e with SMTP id 5b1f17b1804b1-43f2d7b88edmr23069305e9.14.1744279074833;
        Thu, 10 Apr 2025 02:57:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43f2338d7d8sm47906135e9.4.2025.04.10.02.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 02:57:54 -0700 (PDT)
Date: Thu, 10 Apr 2025 12:57:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	oe-kbuild@lists.linux.dev, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Melissa Wen <mwen@igalia.com>
Subject: Re: drivers/gpu/drm/vc4/vc4_gem.c:604 vc4_lock_bo_reservations()
 error: uninitialized symbol 'ret'.
Message-ID: <6ddfc908-22a0-4ed6-b5a4-6df9be85ff4e@stanley.mountain>
References: <f5dd7fb6-6a99-407f-846f-0de2d0abe177@stanley.mountain>
 <b402252a-91de-4983-abc1-65f78e7e6ae7@igalia.com>
 <95ed4d91-85b6-4514-9d94-8324f4fcceb4@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <95ed4d91-85b6-4514-9d94-8324f4fcceb4@amd.com>

On Thu, Apr 10, 2025 at 11:27:43AM +0200, Christian König wrote:
> Hi Maira,
> 
> Am 09.04.25 um 21:49 schrieb Maíra Canal:
> > + König
> >
> > Hi Dan,
> >
> > On 02/04/25 05:43, Dan Carpenter wrote:
> >> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> >> head:   acc4d5ff0b61eb1715c498b6536c38c1feb7f3c1
> >> commit: 04630796c437a9285643097825cbd3cd06603f47 drm/vc4: Use DRM Execution Contexts
> >> date:   2 months ago
> >> config: arm64-randconfig-r073-20250402 (https://download.01.org/0day-ci/archive/20250402/202504021500.3AM1hKKS-lkp@intel.com/config)
> >> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> >>
> >> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> >> the same patch/commit), kindly add following tags
> >> | Reported-by: kernel test robot <lkp@intel.com>
> >> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> >> | Closes: https://lore.kernel.org/r/202504021500.3AM1hKKS-lkp@intel.com/
> >>
> >> smatch warnings:
> >> drivers/gpu/drm/vc4/vc4_gem.c:604 vc4_lock_bo_reservations() error: uninitialized symbol 'ret'.
> >>
> >> vim +/ret +604 drivers/gpu/drm/vc4/vc4_gem.c
> >>
> >> cdec4d3613230f Eric Anholt 2017-04-12  589  static int
> >> 04630796c437a9 Maíra Canal 2024-12-20  590  vc4_lock_bo_reservations(struct vc4_exec_info *exec,
> >> 04630796c437a9 Maíra Canal 2024-12-20  591               struct drm_exec *exec_ctx)
> >> cdec4d3613230f Eric Anholt 2017-04-12  592  {
> >> 04630796c437a9 Maíra Canal 2024-12-20  593      int ret;
> >> cdec4d3613230f Eric Anholt 2017-04-12  594
> >> cdec4d3613230f Eric Anholt 2017-04-12  595      /* Reserve space for our shared (read-only) fence references,
> >> cdec4d3613230f Eric Anholt 2017-04-12  596       * before we commit the CL to the hardware.
> >> cdec4d3613230f Eric Anholt 2017-04-12  597       */
> >> 04630796c437a9 Maíra Canal 2024-12-20  598      drm_exec_init(exec_ctx, DRM_EXEC_INTERRUPTIBLE_WAIT, exec->bo_count);
> >> 04630796c437a9 Maíra Canal 2024-12-20  599      drm_exec_until_all_locked(exec_ctx) {
> >> 04630796c437a9 Maíra Canal 2024-12-20  600          ret = drm_exec_prepare_array(exec_ctx, exec->bo,
> >> 04630796c437a9 Maíra Canal 2024-12-20  601                           exec->bo_count, 1);
> >>
> >> This is a false positive in Smatch.  I can silence the warning on my
> >> end easily enough to say that we always enter the drm_exec_until_all_locked()
> >> loop.  But the question is why do we only test the last "ret" instead of
> >> testing all of them?
> >
> > AFAIU `drm_exec_until_all_locked` will loop until all GEM objects are
> > locked and no more contention exists. As we have a single operation
> > inside the loop, we don't need to check "ret" for every iteration.
> >
> > I believe Christian will possibly give you a more precise answer as he
> > designed the API.
> 
> Yeah that explanation is absolutely correct.
> 
> The drm_exec_until_all_locked() helper loops until all contention is resolved and all buffer locked.
> 
> You could avoid the snatch warning if you move the error handling into the loop, e.g. something like this here:
> 
> drm_exec_until_all_locked(exec_ctx) {
>     ret = drm_exec_prepare_array(exec_ctx, exec->bo, exec->bo_count, 1);
>     drm_exec_continue_on_contention(exec_ctx);
>     if (ret) {
>         drm_exec_fini(exec_ctx);
>         return ret;
>     }
> }
> 

Don't worry about silencing it.  I already silenced it in Smatch a couple
days ago.

regards,
dan carpenter

