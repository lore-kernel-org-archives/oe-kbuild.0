Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB412038A0
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Oct 2024 08:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730189973; cv=none; b=nH2gD+/vH+peABsBLG+LMtzaLj18Tg292GS81OJthSWypoZgKwdWQciyCU+XrusxzHZ/LTaMVNaFjsfN470LS32A3fG7vwF94tibSqmnEsJC1TCM1sah6maalikwcJfZSNACvCwKfvH7zzn/RhXfISMvWNWSbfiEk9eBmiIcHjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730189973; c=relaxed/simple;
	bh=tJx/bThf7RRPQy522W46SjHhmJvOpGhuopQdRLvGDtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Elcc864eP8vvqa6tTaPv8KC730f7pfVR8IL3deKj42H498EG8v9yoD9lRwXTxbd/3TFlbD9o1E+hps+vzQuUFr1ciBBGFXiWile0k+7JeT0d968Qna+Xlr1fD9jH0BE9v9W0KEir8VvOxqaQ/IxacPo2zkhrHGXh9eranzpa464=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eldNifle; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eldNifle"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539f2b95775so5962717e87.1
        for <oe-kbuild@lists.linux.dev>; Tue, 29 Oct 2024 01:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730189969; x=1730794769; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VVOexIS3SgllZm/pW9Ena+nrB8MLfcVMF764exL0AQM=;
        b=eldNifleGOE7ho1Xnd/Vor1jC9kSOSbWKRkA/HrhZaE87tC7xI9aRJzEhJ8mcpYIcw
         9MmeJ3pvDkm9m8kzhhta7KTXA2BegCQ5Q3HCZfd2PXax468hhJf9M2Z5n8bfku1uBauQ
         UbK8GGBi/TX4OwZDOXUrF+cj0CWKRcbS0AVKWN8UTaswDfNdWJVOQsrRjWQCpnaqXqTT
         S3c407wO/Ldq6jJHvMkjFwWqRtyt3zOarlt3Cc0pL9IS8aigT79Y4v9qEDwQnIl4Wzyj
         RYxiBcfdrlYvQwBTcStdWdVgDr1tst5pcO6Sn8AvWlsxtvJobCdtYIzA7xrj+8V3pC2A
         XAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730189969; x=1730794769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVOexIS3SgllZm/pW9Ena+nrB8MLfcVMF764exL0AQM=;
        b=tYe6jKK9HG+nyjn+aeM94h0y8+Vs+tdj0HHUpkYVFz2UuOS7b/Ye6FAqrSicTcQ3LM
         ClJ2ejusXYjE+6rcgtnp5zvkIr9lrME7vAIO/e8yMHP1vXAiPqTWIGq0BOopvTo1b/pS
         lG2+V+xxevDAzG/nUpWtucrleqIvrEhH1Yl/qnRtfM/R/QPTwRdK8H4/QOh/LnAWzidO
         4cxgitP4zBwcCfcKxfb1timgXsC0mkE5exGA/5M5LHRhVR33AMp62GGSXuQaFglmFwF+
         v3TbTvWovbJKDVR31XZtH/tbKMmRUCPDRytL66eaGfZd1Sos2NqRLQp754V3GqPQb2tF
         666g==
X-Forwarded-Encrypted: i=1; AJvYcCVO8ZgKjrZfsjdhtowIQ1PBCOOXdUtom1M0pbOonFRHmdO6Ew0nfr7+TOhkiCdceiw3oVE9kwarz1Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YzZPn+3brYVfZ0+INW0ThZRgEOHqWYbCHfNqF088QFcIOEz37mD
	eJF5TjTpa3d98P3atrzEP+mCkVUc/yY3lxS3jV/TMj3qn2111eBZyXgR6LOJLZs=
X-Google-Smtp-Source: AGHT+IF3Rxjs9R/r0CPhhUw5+OUfR7VXHsix8wHKnE253K7lQLZZUQcp0acowwY53IIl/tZieH5Tmg==
X-Received: by 2002:a05:6512:b8f:b0:539:8f3c:4586 with SMTP id 2adb3069b0e04-53b34a34602mr8913570e87.55.1730189969117;
        Tue, 29 Oct 2024 01:19:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f297204sm445856166b.116.2024.10.29.01.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 01:19:28 -0700 (PDT)
Date: Tue, 29 Oct 2024 11:19:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Philip Li <philip.li@intel.com>
Cc: Matthew Sakai <msakai@redhat.com>, oe-kbuild@lists.linux.dev,
	Mike Snitzer <snitzer@kernel.org>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: drivers/md/dm-vdo/data-vio.c:976 vdo_launch_bio() warn:
 inconsistent returns '&pool->lock'.
Message-ID: <68866f17-f327-4df8-ae17-dfcc50362d4a@stanley.mountain>
References: <717e8949-55c4-4461-8951-3e582e9b77ef@stanley.mountain>
 <f074f848-5a26-473b-ae98-1932e9a8cbd1@redhat.com>
 <ZyBQa45RTWXiXJke@rli9-mobl>
 <ZyCLo51ZyjxX7eQK@rli9-mobl>
 <13937d22-46ac-480a-8956-f89a0fd295ac@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13937d22-46ac-480a-8956-f89a0fd295ac@stanley.mountain>

On Tue, Oct 29, 2024 at 11:07:07AM +0300, Dan Carpenter wrote:
> 3) The kbuild bot detected the bug, but unfortunately the cross function DB
>    doesn't scale well enough for the kbuild bot to use so it didn't detect the
>    fix.

Aw crud.  It does still print a warning on linux-next actually.
Smatch says that we lock "&pool->lock" and unlocked
"&pool->discard_limiter->pool->lock".

Anyway.  Points 1 and 4 that we were running new checks on old code and that
the code in the email did have a bug are correct.

regards,
dan carpenter

