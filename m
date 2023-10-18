Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00653B7A3
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Oct 2023 16:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kj9HegR6"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso5807226f8f.0
        for <oe-kbuild@lists.linux.dev>; Wed, 18 Oct 2023 09:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697648227; x=1698253027; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HYmsSISabCHstva6nGawNe+Di4bmrOcot5BGgorDSxY=;
        b=kj9HegR66TMZr3X8EG8QpqlxavfryCvkC/g/JBj9F0isAGQqwHHAkk1vWBjPKJB0FG
         eBvkSeoIZzUbGyIi93n//c/llEYYqpRRuD5lKS755u2B2J1+sBtvX8XfQDDlYXhlOfLD
         AUlPwuAcOHfqsTUgzE5HYhSMacDTDHN1D0/jFezoHybCDe2XjoocUUUW0WRF4R1CoM9y
         nznW29Q21Aw3j9nV4bBowbjJtkBd5+euabf/XHN4e8CdTE/uKgK0w/UMJcd/QzTPDPy2
         S+YajvYUoH5HLD/+LYD1a0sV2e3BkAfxOVjD0pDKlUhoMuG5Ijgo3M2rCtentc5AMsdM
         v83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697648227; x=1698253027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYmsSISabCHstva6nGawNe+Di4bmrOcot5BGgorDSxY=;
        b=T0JfVhxc5QdgjIXZuyTfXdIdVomkiyVE6/HeFYTHkoub9juniAFNQOBRs+Yxn6r9Pk
         1L4f6uMrzBBQ06ggZtKPA9KN74/ZhKm9mhT2FYDKZ4khw5meE16a/qA7UqJC0BBVvHlu
         cCdTwkJDJQGVv6VA9vsz703LSwp6Z7MsOzVYbe/b/5/wuhHZj0059ynlTm502eHWebqF
         Uut9V7ev+l99UxIwTCBD0ffwn8pgGlJucEyQ14mVDkcQuoFZo2iZLYZP5Qfl5L6bL/m7
         R2pQNJTeCM5YlARJxL6vK7aGzOETEbciQcbWp0n0OYu85EL1qfHs/ufjBm4eHRIwTr+E
         XEQQ==
X-Gm-Message-State: AOJu0YxxO8AsR0HkpbFZCmDwMONz45wMvm5Xq1iG7ngxfN4q+7Z8d3PA
	CRYD84HlRx052iz8wNEiCWgPrQ==
X-Google-Smtp-Source: AGHT+IFZa2wA2CIROTWJeB6fsyTJmkUokbQ7GdV+6ursfwa9CrMwVReyAdVgxJm0LX783pQDf7YK4g==
X-Received: by 2002:a5d:55d1:0:b0:32d:a0ab:9bae with SMTP id i17-20020a5d55d1000000b0032da0ab9baemr4486184wrw.57.1697648226822;
        Wed, 18 Oct 2023 09:57:06 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l16-20020adfe590000000b0032da46648dasm2521880wrm.8.2023.10.18.09.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 09:57:06 -0700 (PDT)
Date: Wed, 18 Oct 2023 19:57:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [char-misc:char-misc-testing 21/23] drivers/parport/share.c:486
 parport_register_port() warn: '&tmp->full_list' not removed from list
Message-ID: <1eb66e9a-8c68-4a56-8239-82c74849cfc7@kadam.mountain>
References: <2171426a-1784-41e9-8614-2d3a7a602831@kadam.mountain>
 <ZS/R/H9JujiaJ0x2@smile.fi.intel.com>
 <ZS/35oVuyZxqueBH@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZS/35oVuyZxqueBH@smile.fi.intel.com>

On Wed, Oct 18, 2023 at 06:21:10PM +0300, Andy Shevchenko wrote:
> On Wed, Oct 18, 2023 at 03:39:24PM +0300, Andy Shevchenko wrote:
> > On Wed, Oct 18, 2023 at 12:57:52PM +0300, Dan Carpenter wrote:
> 
> ...
> 
> > > Old smatch warnings:
> > > drivers/parport/share.c:826 parport_register_dev_model() warn: possible memory leak of 'par_dev'
> > 
> > Means this was already be in the code?
> 
> How is it not a false positive?
> 
> devmodel is false (so kfree _is_ called) until we get device_register() called.
> After that it's done via put_device() in both possible error cases.
> 
> What did I miss?

Oh, yeah.  You're right.  (I hadn't looked at the code before, I only
see what's in the email and hit the forward button).  This check is
normally super reliable but also useless because it missing 95% of
leaks.

I suspect it will be complicated to silence this false positive.

regards,
dan carpenter

