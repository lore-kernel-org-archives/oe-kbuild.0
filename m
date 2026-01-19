Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED2A218E91
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 07:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768806821; cv=none; b=VuIsxg/RgvJMyi24fqxAs9wuR5f8oSlYvSB0g1kSfgpCx1FGOTWYkhQtlS5mz5fWPd7NPW1swSFQ1RRcfA2QB/26V9bJOYoPt/lgEgJxfIluAttl06/eECRT3omzLmgnelhQ2AzgUCXgWDH5k/CFjO14NgmQBKYE7+IyhEb2Ldc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768806821; c=relaxed/simple;
	bh=bTQYx/YLz4/cPcL1/rIaL2o0qtYeIR3c5ybdyq+Kx7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kTLHUTO298bpUgGQM6j8qKz3ytZR6EsTXJ9aW7aot4AtTllNR0UusWHdnfKfzeOk9AoZZDiplC6flJHNC+nrck5oIeGHqTM+Jjcnm8tc2454knC3OzMG8hLdBbAta00gk6hVWqdTZn0uP31MNaowsk65Vsc0uWCSgChT4TDtqOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mJW/c0o3; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mJW/c0o3"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso25333895e9.1
        for <oe-kbuild@lists.linux.dev>; Sun, 18 Jan 2026 23:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768806819; x=1769411619; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yeU3kWotHcVXlbxuhjSFGqJhq2cBlR26t3CTzB1ukaY=;
        b=mJW/c0o3fe/0SQ912JO1Z98iafmOPocAR92BSDVTKdUU8Pz02l8pVOrwFtpc6Tz1pz
         GIHDFC+kHHmKJpSVeAqSubSAE6CH05BzzozwqoJxX9YWEEUtWxcnKeCbKUQgnjacZyst
         X4mNoNPNfFfq5183RZwNAVmEE7DitkelaCQxe2OZ4s1TwqYzSMjYnkc/zNfq4q316nQn
         43iVaSy5trqwAUltI5ciEHFAW6EPV4aBPQ9GKVupKUdeQUCNM84X/hVZHP5NIcNvwZHc
         it27IJxR514T1/tJgs6cXTUZzb0y6+adqyznH9z+4yhg4FiANrF5ToN5845Z2v4EWecs
         hV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768806819; x=1769411619;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yeU3kWotHcVXlbxuhjSFGqJhq2cBlR26t3CTzB1ukaY=;
        b=ttcSfnKfse6okLtV1L6P/JvQ++z/Jz85Q7nttozdZvRhOEBwTHkSb5TDXj+B5yOOiJ
         ozeGE2mYnErQkpKxrdv/bPkQz0y1rofQuziv86YVUvfTnJPnKy2y2gi1gJ+NTrAhfNjf
         NbV/Nw+kE1cWK+eBMpZMjqNM0iWZ0EN80lC52Ai78RzpPmob4j5BXAuXvuKSGP91ma+i
         n7HEdiYRUUDqimWDYGQLmnLE1CcXLF6CoBFMqIvsjUsugKlOB+NDl8/JWw90bVZ55We0
         Sr78oyPxvduDsnMoK1I5fo4KPYGdYUGjPcMsZSyNDxWM4nd6hrYhV4DwHf3cC7P7qpmu
         mWVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJvx9ogBQzRcbgnMjkVBsGhpSeCF7MeaaUTHHAeJ3AcCg8Ga61/JWvdrZWk5EaJzNpTahb8H3/VVA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxjULiJ+G4L1VukMUAJ/NbDLZcHQHX+JD0ZMudaDuHkTEfx1iAe
	qKoPN7ITKTKZMY8/sC2UvucUSCPB2h9tGDwuDbqy0mdjt/mPLkzGLIG09TQn0GblpNfhbjfREPy
	W6AvniuM=
X-Gm-Gg: AY/fxX5I+eVFcN1MW1c0cKYf3kOI5KMqRfJBS70fGkz6om2CIcI0oVodD6uTOddg9/s
	M4oBoAPmEYMInnHOxcIwXUfmQwqlIzMTcmf0JnouQzNw5UxWh0K4c0S38qb7/yg3z+RpYaRkAgq
	5Ekz8Q1lwkmyxq59p/2MI/hYYEuRVBVGTGl2qSTGtI8tSmnj7iigPAq30VMeyXMwvzMBymyIgdz
	WlCy4/+pq2Nq7W+oZGBVXklo/8UW0jkFqFg2uXGznN+WRLl0wB/BCIrqx/T29yXR2/nwlB1IllN
	jBWcBGn+6Sj/xmFiuSNs6fbPA2gmugDg/7e+fhhlMnyAWrAejjamWEo0maz+O0Ly0MsKElIgyzA
	8F/+KY017um26e4W9fo/3W2R7njvvbt4ILm4WuVELby7U3uzzrYsERQGtuiDH1Rc6/m5z9pESkM
	qvTYbVsYftrTTWWi9n
X-Received: by 2002:a05:600c:60f:b0:47d:52ef:c572 with SMTP id 5b1f17b1804b1-47f4289abb5mr108103085e9.1.1768806818802;
        Sun, 18 Jan 2026 23:13:38 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e9fb193sm74818505e9.6.2026.01.18.23.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 23:13:38 -0800 (PST)
Date: Mon, 19 Jan 2026 10:13:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: yaxing guo <guoyaxing@bosc.ac.cn>
Cc: Greg KH <gregkh@linuxfoundation.org>, oe-kbuild@lists.linux.dev,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4] uio: Add SVA support for PCI devices via
 uio_pci_generic_sva.c
Message-ID: <aW3Znz51bTVj3oxJ@stanley.mountain>
References: <20251223045409.15700-1-guoyaxing@bosc.ac.cn>
 <2026011643-coastline-playtime-0ac5@gregkh>
 <2026011603-dorsal-unblessed-cdb2@gregkh>
 <5483bb2f-04a7-468c-923f-0a62b94fc0e6@bosc.ac.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5483bb2f-04a7-468c-923f-0a62b94fc0e6@bosc.ac.cn>

On Mon, Jan 19, 2026 at 02:16:21PM +0800, yaxing guo wrote:
> 
> 
> 在 2026/1/16 23:16, Greg KH 写道:
> > 
> > Wait, I already took this a while ago, why was this resent?
> > 
> After the v3 patch submission, I received error reports from Dan Carpenter
> dan.carpenter@linaro.org and the kernel test robot lkp@intel.com (see:
> https://lore.kernel.org/r/202511280815.WV9iCJZb-lkp@intel.com/).
> In response, I’ve submitted a new version (v4) of the same patch, which
> primarily addresses the issues highlighted in that report (as described in
> the "changes in v4" section of the cover letter).
> If there’s anything improper in this process—such as resubmitting instead of
> replying with fixes or other procedural concerns—please let me know, and
> I’ll be happy to correct it accordingly.

Since it's already merged then you will need to send the fixes as a separate
patch based on Greg's latest devel tree.  Send two patches, one that fixes
that && vs || bugs and one that fixes the devm_ double free.  Add Reported-by
tags and the Fixes tags.

regards,
dan carpenter
