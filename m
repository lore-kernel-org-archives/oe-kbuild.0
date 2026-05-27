Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8041C34CFA7
	for <oe-kbuild@lists.linux.dev>; Wed, 27 May 2026 19:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779909508; cv=none; b=YsbLQLR2Jxmcm/3HnMca9g8XOpdqHghoQHVTJ/c0h7EmtWdNvnaWYvNTIZgaICYzgUM+X6iIxmgvmc1KkqJ1PKdn6q1mTv2jWQcQqdigK2xJTQJA95z47J88u/Mrg+5pN73kcRlb3CUctNFZt5dWHOqYcxnWgiOiyE2WoK+epp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779909508; c=relaxed/simple;
	bh=5EH1mNglS63unxFL6AsWqUJ48KrEXv+b9WWyEFILe/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tEMEYXR1THSsxvM1JuuWpZOIQ4FlB6z3HwCWh/mHW8K9rAPGSJB0nyBWUb4rP8jWjcBp36ZHm9l0R0OwxwHcZAkcNDKTj/yirmh2e5I14o2LnYhtw1rpoS+jJlAW/jQY62ZslxfEsP6rFKbTtBWdABeWHou8tasOsGqk5wgiR7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kA2W+uiM; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kA2W+uiM"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490426d72f7so54082705e9.3
        for <oe-kbuild@lists.linux.dev>; Wed, 27 May 2026 12:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779909506; x=1780514306; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UwjnU4U43V3LtGVrQg6DwBlgdYG1OSICBCjTEY60hGM=;
        b=kA2W+uiMKGWWLn8jqdcfB6r1Lxk52g8MThAYz6qVz3HbGaroFrkUU9OFwU3oxESWp4
         cQ4DS3BzqZnzUCsvZGFbMxMOVBGCahl/AeQa9fvmQemRHzEkM0wyF0dtXBSvzJHBkd7V
         wTybzYSHQPUJpY0MoeXAVqZp5L9ZDhKn7kPSgiWLRRPgaU/YxK2MDyMu0Dr2JQxEIUOj
         vzkhQCpb0+F/W2H1olnGCbWReKPhtbNnMr1ZeNnXZHL53f4mtBfPiTi2ofhJd79Edc2Z
         zxKptL/jRuuZbOX8je2nJ1MUBLSMz9NgeSQEMzII/kbs/WBBmeH/8EUWBWq78r5t3fxk
         qRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779909506; x=1780514306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UwjnU4U43V3LtGVrQg6DwBlgdYG1OSICBCjTEY60hGM=;
        b=J90HF/rlCPwyPjvAWbmGDQFPGcarnXeLXw7FEeFQSwnWj7NLziiF3pM7DmgalVzdyj
         tFSQAeGF9+OxLLAYCCiv9pSW+/P9hRGZok8eIGfaZegu9oyWW3DsURropaZgqoVivHOX
         XSx7ULraawvkaOwSU3L7y3h+ATSeWGCl1IK3/hbgntVdHR7tFmpmbOHYXVcyZorL/uG0
         rueSeqEt2vLUS/5RcqZVNem4owcSlOndikJvg3MhFRatKNGlXA7BZgxdUiP3mvrVam+D
         E4OY0/seLHLSlJ5jQlF8r4SPhPwcprY20F+Out/Tm2jAp4CnBaQ9XtNbO/aFC+37fg77
         kPHw==
X-Gm-Message-State: AOJu0YyCWlerVcJWJLjIWLaiBB8HIOqMNa3lijiBqoEoyGkc+eAmqd9R
	CksQ1UBSbDVyeqhZ2yv5B4GYWLReDo7B+GRwk1nybTBccfw0vC3GzOZa9O2YWQ==
X-Gm-Gg: Acq92OFT7xson8P3fEO9M2bZd9fy0G6+ULk5aDiLlZOYbT8menGLaH70b9wchXiapk3
	07vdB44oAN07Fck80F/aPJTDX+gKhWPDeb9Q3vi5YvMER+UW5iiOqgzJP30dIM/8GheK/z883d4
	oX2v02heaVi1IJnO31M5G/ZapVaqLcbSmqWj4oCxacPpRDgEI/J4pn7MDgjNWqiev+qCCOkPviC
	3izhOPEXiXjnCs8oS1fjYpcyyWNw/AGsPGTdkg3puuLdul/FkjmgkMmwYhJYEbGKEiJWnLrIiq5
	zjEDsFcgq5DEzecGEEc565fhtmzWzL0pxlW/bi4qOTDcW7nc8sBmjdOsyZUiruxyexyqR62h2Sq
	05LMr3t/1gWIU5RAuwHQmH9pqUDI0dL9UhHPUl2yj2+Og54xN/OPMxk0mjBezw+9cFM4NV9c8DR
	ywTN/nJX4C08RPJJnJsoaRCJlAKOoGxGnEFg==
X-Received: by 2002:a05:600c:4510:b0:48a:58ae:9938 with SMTP id 5b1f17b1804b1-490426c53d8mr370565445e9.19.1779909505811;
        Wed, 27 May 2026 12:18:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4908b583032sm1583215e9.18.2026.05.27.12.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 12:18:24 -0700 (PDT)
Date: Wed, 27 May 2026 22:18:21 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Dave Penkler <dpenkler@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: drivers/gpib/ines/ines_gpib.c:917 ines_isa_attach() warn:
 'config->ibbase' from __request_region() not released on lines: 913.
Message-ID: <ahdDfc7QdDYAXbf9@stanley.mountain>
References: <202605271229.d8wGTffx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202605271229.d8wGTffx-lkp@intel.com>

Huh, Tony Btw fixed this before I reported it...  No
ines_generic_attach() cleanup, though?

I still got a Reported-by tag so that's what counts.

regards,
dan carpenter

