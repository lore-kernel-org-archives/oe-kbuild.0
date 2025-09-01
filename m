Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCC82580DE
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Sep 2025 10:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756724227; cv=none; b=fHvD0L/ZoJjqFtdpsuuI5Lq2XhLINLJLNE+V3I3pDMFY7i7bCeMxygqkndjq5E66ODOluXioRNNGtJs/NhP1MI92/f6h62IKZul3iETtOlbmTHDb1m0GX5qeDH1D/ekMYGCnCZ5TlUhkkfhwjOSjAaLu6U8g4MngvxGZm98H2/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756724227; c=relaxed/simple;
	bh=wRSiENhfrzWA+pAaqLHx1eWqkBYeNuIOKOhFBAUy4rM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lZWGWbXyJwtwZDevTAuU8RVBPqmABUZV81rrj900uOn1GxaUMIutdgD/MiBl5QBFBVIzIRXg0w4iuHXWScnE+JbPho1D8cQ7plejZU3kMYAZaNC5UvfI0QOv8ncelEpCKSXeR/tI2O1TXtAlg1Be/FIOOOVrVgTpY9La4rROEzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cdhs94TG; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cdhs94TG"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45b4d89217aso25001125e9.2
        for <oe-kbuild@lists.linux.dev>; Mon, 01 Sep 2025 03:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756724224; x=1757329024; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r3JfaXSVismHLeDzpO31jS/oWc9tPZEe3raZE7nLpos=;
        b=cdhs94TGzVHBhdfKTEa6bRJ/Tu/6h0d/EgWVN1GdVYjGpw5npNI4WD7AtyiuHrnoEC
         aAmQIoyRCgJqlfklmG6CgJcB5g4tIh6kNeMfy7xo7lMkLidSE71FRL6RXGNHLhkvK/qj
         taTfvCDP6413iaJvmlYxOXkPC/lPS4qyULYdcbLyk+0zMOlOUSfjTcStq8occB93jPNc
         2yYQKn+oIjTCKMIpHsgL2Ipcltz844PQdzmQIiUOJlzhVl5mLOCtWtGENV6T+vMmhI9x
         b3+LgfXPLMXAuT9qmVADs6Js4g38PkFS4qfaYjEzGxtzFkqUwU1vKkbZBb4INSoyHeHR
         1Msw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756724224; x=1757329024;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r3JfaXSVismHLeDzpO31jS/oWc9tPZEe3raZE7nLpos=;
        b=Xf4lowPnQuPMz5QRQUD/zZMAcDfRBRy3H3++EAd1eiU35CDf+Q88eMPDafe4Y23ZXY
         YaMuPA3l7J5MGUU9QSrL0xxgHIkXkVMbX2GwTG2uX+7VX9kl+EcWm2JhHG+YbTo5aLZx
         a5T75/NeWxaoD9wHNZ4ov+KuCApzOvnGN77TSOj6RPiLWDy+qsgC1IMUgkFTQynZTEao
         Mbrck3KyPMwyah+J09v7xGj88gCD1iTDN49Dr3DnPPmAZxEAge5VfOI4EjM5yY8jIZj4
         BrM0gUsfBWg303TVgbcDvB//3dPJ9+7Vh4S87h4j2pJmpkKFNCPtZSRogNX6LwZWYi/p
         4i2g==
X-Gm-Message-State: AOJu0YzwJUsbyf5zszkTHk2mTzph04MAc3Bco3/kHjNH8fa2ky5gQ4h/
	RLA4Ptj3a2uy4d3IYjHTlqKMGhoGVMvKXZVvo0Axo0ZAGIA9dNIALhQRjzqbEaRMOoilsG7j5Cs
	ZhmBr
X-Gm-Gg: ASbGncshF1NHYMAMZzmGLy+MgALg1ER7cZEbFXAQU3B9EkR+oi129mmW7Fq9qv9Dctt
	p7TZfU++w38X8Dc2erXpyR9DY9OVA8JOPf7FYt19PwdgYh+/rPBhXP4wfJMjZFLW+/oiVsG/pAJ
	ybG8UOv7SwBBipalr99oJ3mZ5G5blmXy8IVUpaNBU7HGx3J2OhqyHEFeeWn4MfXg72UESlhyQWJ
	8XzbGJKhSRtHGjei9DprLbd4z3UP+QomkGvVsydRS1hSQso6B/MEb+mPZ6RU2e8uDDw5Je9fN4F
	sOBoCtAIdEFSSkA4bKDD15uh4FWdJdIiV/bMucQzlW6g8ZuMtjDE2AJgk6CbawKNrVkOgRGcjiG
	MJAhiEGCwf0WcgH8vGBZSY4BTzTHwoooYSGxYdg==
X-Google-Smtp-Source: AGHT+IE/CJtDdNxrehHlmbmBU+xgmZTeiVp3KwtACJpRbf8j4XWImHdbWkEao92fiVlMd+LO4wjFow==
X-Received: by 2002:a05:600c:4c08:b0:45b:7db5:2c7a with SMTP id 5b1f17b1804b1-45b855286b0mr38988535e9.1.1756724223954;
        Mon, 01 Sep 2025 03:57:03 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b8efb280csm11582865e9.3.2025.09.01.03.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 03:57:03 -0700 (PDT)
Date: Mon, 1 Sep 2025 13:57:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Dave Hansen <dave.hansen@linux.intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:kpte 2/6] include/asm-generic/pgalloc.h:281
 __pgd_alloc_noprof() error: uninitialized symbol 'ptdesc'.
Message-ID: <202508301127.c2I2lcpb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20250901105700.CY3ndOmb1bPLio-ip0_UWBOHDHAKyQvD6ahPrMM7l40@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git kpte
head:   d5eaa925a3150c716e8ec564c51069fbdd303fbc
commit: ccbd04de39826d130b67374e68599e128b53acab [2/6] mm: Actually mark kernel page table pages
config: hexagon-randconfig-r072-20250829 (https://download.01.org/0day-ci/archive/20250830/202508301127.c2I2lcpb-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508301127.c2I2lcpb-lkp@intel.com/

smatch warnings:
include/asm-generic/pgalloc.h:281 __pgd_alloc_noprof() error: uninitialized symbol 'ptdesc'.

vim +/ptdesc +281 include/asm-generic/pgalloc.h

a9b3c355c2e638 Kevin Brodsky 2025-01-03  274  static inline pgd_t *__pgd_alloc_noprof(struct mm_struct *mm, unsigned int order)
a9b3c355c2e638 Kevin Brodsky 2025-01-03  275  {
a9b3c355c2e638 Kevin Brodsky 2025-01-03  276  	gfp_t gfp = GFP_PGTABLE_USER;
a9b3c355c2e638 Kevin Brodsky 2025-01-03  277  	struct ptdesc *ptdesc;
a9b3c355c2e638 Kevin Brodsky 2025-01-03  278  
ccbd04de39826d Dave Hansen   2025-08-28  279  	if (mm == &init_mm) {
a9b3c355c2e638 Kevin Brodsky 2025-01-03  280  		gfp = GFP_PGTABLE_KERNEL;
ccbd04de39826d Dave Hansen   2025-08-28 @281  		ptdesc_set_kernel(ptdesc);

Not initialized until line 285.

ccbd04de39826d Dave Hansen   2025-08-28  282  	}
a9b3c355c2e638 Kevin Brodsky 2025-01-03  283  	gfp &= ~__GFP_HIGHMEM;
a9b3c355c2e638 Kevin Brodsky 2025-01-03  284  
a9b3c355c2e638 Kevin Brodsky 2025-01-03  285  	ptdesc = pagetable_alloc_noprof(gfp, order);
a9b3c355c2e638 Kevin Brodsky 2025-01-03  286  	if (!ptdesc)
a9b3c355c2e638 Kevin Brodsky 2025-01-03  287  		return NULL;
a9b3c355c2e638 Kevin Brodsky 2025-01-03  288  
d95936a2267c11 Kevin Brodsky 2025-01-03  289  	pagetable_pgd_ctor(ptdesc);
a9b3c355c2e638 Kevin Brodsky 2025-01-03  290  	return ptdesc_address(ptdesc);
a9b3c355c2e638 Kevin Brodsky 2025-01-03  291  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

