Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D93D21577D
	for <oe-kbuild@lists.linux.dev>; Thu,  8 May 2025 05:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746682740; cv=none; b=ux2AIm5T4DPn5EDem2lR6AbH9DY0n5GJqgYZVCu1RaiZ/ituoIzvRYr3uscMlVFtxYzdaBED3A5yCUqPGmvZhw3jdm0Ys/e4sUBbP1obyXkiko86DPtra+v/h95YQxr2DqV3f4c/b5pXmlmNn/or6foRUCyDZuNRJ92/wdzmxCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746682740; c=relaxed/simple;
	bh=WPfaW0cQFoc0vUNbrk3nFmHIyx6KGVJyt8mp7eMc1eQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gZcIBkT1vUA/xWIHkVV+jHAxfELvG608IzROQ34ZcAWh1q15V225J9KRLSVw7xiKmri73IrsHeffHjQkL/kPnLhbDbsW92zwP6F/ZPgcIwFGt3/q8vphfKRPg/Iy6o6Y52dqKzR0ZXydiVVDZAntFprB3BDGMypJ/aLIk+1TtVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OHHqtlDT; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OHHqtlDT"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so12142945e9.1
        for <oe-kbuild@lists.linux.dev>; Wed, 07 May 2025 22:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746682737; x=1747287537; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U3k4PEhU6worlCKck2U3ds/0NKF9gmmTtGy9MuzRu6o=;
        b=OHHqtlDTC9h7cUaGgkgCWPndNvjxxYE4HigLYynWTxANO9YHQS+FCeC3KhHjZ186/i
         9UJVgvBlsqlKaHIF267vohAo3tsw/iQVFqU0EzmvQ+OtU9YUdH86jp5+KeaD+SYdaJE+
         iasPP/wQLl8o2F6P12k0NZCSd3vLdYTccRvN1/iNjPDfodNArTJWqozBS54PuggEftVA
         Bcmh21L5bG5XsIS3OgKcv/3sUpm5uh7+lN3TbITgdFbOu3IAAMYvixzatLkYE42auKyX
         hTCQ0jZHSR/nKq1yuot4Z8XXxhBJIF9lwFkaDeWlj2+j60UiaU21qBmEZeVHsACf1Or/
         VDjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746682737; x=1747287537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3k4PEhU6worlCKck2U3ds/0NKF9gmmTtGy9MuzRu6o=;
        b=dqJjbYM96EsCHKUeH3xHGvgoqFmip2nOq28pabELAs8W0siNTbkrJc/8brbR9wKrGY
         IfYj9PRskTif+RjcYmXgKyEcFdBOfXd/s9O8coV0Lf8eL3l21DhcG6aXP6rtENQ1g3wf
         sJGB0nKIGAmICIDsEpkoz8rSj7L0Tg7/Fa021PAj0MbSN3WYvAuXyReVumqGTmwd01kQ
         SDqs4FJAb8glE2HeY7N1eQ1M2+RU0F1tRkg/ZyArcojT20oOzAACKqz9TN35wVqczOqM
         q+H41rdMyvz3CBi9zlij82t/tybZV7J2d37bfQ5A/SvjJBu/34A0UWQdb2edznk3zvPh
         xBJw==
X-Gm-Message-State: AOJu0Yw6eYEsuknCrDMtScDNxjfecpultaCeInrIC8nYr+91FLNCe4tP
	5zUYh7MX9izl9hIqNOl8uE4/e7K6yWMmu/iW8UEepD4CA3UQUYdG9UuraiWhV2c=
X-Gm-Gg: ASbGncvj7xxZ0YvSqBlaP1T6/wBtrq5cHkRn9KcKmuZv1wimd/6qVF03tWi4IwAAkJG
	SNifeEfbZKU+ZW+V8gtHYMUX9G78tc6/CCZ9i336XKYqUerProlaW/rkeSiRx+bYIHy9mZxbPdp
	kwEkO2ma62Pj5bTo1H0sSSanjzvSKSNHAfKEnM49oKB4QBYcJTAz9Z/V2N2/9xY0tuZeGDFBcZm
	LtE0JFOBIXbZxH02U/hbt3zXruoB+gS4TMzP/BtbFFpvo5Y9Z/8sl8g0di3V/+p+BA7utcbRwbs
	HMnNxuumrnrpR25lTr7011IOKKpiS8ZepqTfHTw3hUr1mw==
X-Google-Smtp-Source: AGHT+IF7VpQhE++cMJ/0vycInQosYNQwdOLJveREj7gdb3HDRxdShvggZtkV4ZOpk2gw61u1hDiO5Q==
X-Received: by 2002:a05:6000:2dc4:b0:39f:ec:d4d with SMTP id ffacd0b85a97d-3a0b990e465mr1470004f8f.12.1746682737319;
        Wed, 07 May 2025 22:38:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099b0ff8esm19098105f8f.79.2025.05.07.22.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 22:38:56 -0700 (PDT)
Date: Thu, 8 May 2025 08:38:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shivank Garg <shivankg@amd.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 7893/8235] fs/jfs/jfs_metapage.c:245
 __metapage_migrate_folio() error: we previously assumed 'mp' could be null
 (see line 235)
Message-ID: <aBxDbdW9KNe3mBAB@stanley.mountain>
References: <202505071850.XaOkcCkX-lkp@intel.com>
 <21037c25-b85c-48fa-bdac-27cb3be2ccdb@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21037c25-b85c-48fa-bdac-27cb3be2ccdb@amd.com>

On Wed, May 07, 2025 at 05:19:52PM +0530, Shivank Garg wrote:
> 
> Hi Dan,
> 
> This is a false positive.
> 
> In metapage_migrate_folio(), it checks if (!src->private) and only calls
> __metapage_migrate_folio() if src->private is non-NULL
> 
> static int metapage_migrate_folio(struct address_space *mapping, struct folio *dst,
> 				  struct folio *src, enum migrate_mode mode)
> {
> ...
> 	if (!src->private)
> 		return filemap_migrate_folio(mapping, dst, src, mode);
> ...
> ...
> 	return __metapage_migrate_folio(mapping, dst, src, mode);
> }
> 
> Then __metapage_migrate_folio() calls mp = folio_to_mp(src, 0), which returns src->private.
> Which should not be NULL as previously checked.
> 
> I think we can skip the mp != NULL check from 
> > 39ed4d1a0e03ce Shivank Garg  2025-04-30 @235  	if (mp && metapage_locked(mp))
> It seem redundant here.

Yep.  Just delete the unnecessary NULL check.

I only consider these a false positive if the NULL check is
required but it doesn't lead to a crash.  For example, there could be
another condition which is equivalent to checking for NULL.

	if (p)
		p->foo = 100;
	...
	if (!p_valid(p))
		return;

	p->foo = 99;

In this code, if you have the cross function database then Smatch
doesn't print a warning because the NULL check is not required.  But
the cross function database is way too slow to use in the kbuild-bot.

regards,
dan carpenter
