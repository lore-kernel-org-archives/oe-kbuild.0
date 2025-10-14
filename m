Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45C7305971
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Oct 2025 07:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760428073; cv=none; b=As5u5hUAhUmLUx6yB2/tiFytWQMriLdYDNBFjpz4CDegcmN+T++dy/skdletAXJYn7AvOqUd4l4fjNVnaiyn5zsGSx619vvyIzq2XovvDBdQrcRPQJkmjFzSuvUrUTUk1dc3zbUmkpeuBbv9ZK9l2uVrW+zVvvmcK5eYBh1n60w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760428073; c=relaxed/simple;
	bh=r6AqKWJgwKUzwfxb5aq/607KfDQIExWxJAMvO8wzI/w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EGvqSXqTbEe87M1YnDmO7TefycbRpVrteliMZIGexqDy+Uk8lbhF0GKM+6CjXdqEVPOZ3Uc5l/EYvEwgcLIu0OxNWRaRyP5ckd23ejdvhJuGDPEc0MJb/FpmFz+lHWcOLdHJ8eVGgumFrYPC7OpmIiSe6puofe57oe51d2X8+ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C5Be1vg+; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C5Be1vg+"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3ece1102998so3033259f8f.2
        for <oe-kbuild@lists.linux.dev>; Tue, 14 Oct 2025 00:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760428069; x=1761032869; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h1BrabTRml53juPP0xOi+PNWI+Y0GuTwM8Zx3IM+NBw=;
        b=C5Be1vg+FwSbmTwblnYr0giTf7agVZZNWHa8yeu/8TvktIHBmUQFP7pzMQLnu8daF8
         Oo9ytfOFR0ub8kC9P9TqNKA3YfBkVtzJU2EW5ec1ivu3YkNoVdsAKSDZylJD8YmYRXQp
         9k+ZutJW0RlHaPSBQrah8ivLCVxi/oes1yntwva64XbR6YF2Hn9kQcHSh86/nZ2ccyJJ
         MiFAp7QRCUwN/7/Bu/gQAcBbP0DzeiLSx4xAuX3D6ngCvCqY6Bz4XPCx3Q0JiamWXpq2
         yKzTGaBoYi2e9YQQ+wcn1aXP6oR07RX4e9IIAwEwOuzfOEUivf0Trgbx2HgEZpQEFwB7
         fyNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760428069; x=1761032869;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h1BrabTRml53juPP0xOi+PNWI+Y0GuTwM8Zx3IM+NBw=;
        b=ieaI1j8bu9MyAtZr6QinK2KqgOq26JBfWhbxo8dCjumBlMobII5i4c4ICoOvC6Tz2n
         1cQaCu5/CaOSPCxPjnILi4YN1iKoONdDUkpNNvh0BnB1HNXR3bQEriVBNdyIIrQZPPD8
         mYCj+jb07JtKoOxBPx4j0g1KcGWFENqdX6mOB6fHx5doiU6n7/+D2y1kAzWdER/+8C5R
         y8stQGmXK9Bi2f2+ryZdEeAFF7Bo89EsuTnbRgsUzmZGNp4W2Pi+Ssq1pQlp4fDKxeRQ
         bP7fQ4PrEAWFA8Vn4vOz8IDgfc4V63EPcGGbwkodGVQSxIQeT/PA+EGCAL2CyuP4JYdc
         X7YQ==
X-Gm-Message-State: AOJu0YzyczB6mSBJv/YIMkpEfEr0RCCSmL2P2zSA+DzS7TFRPzXdpQES
	k8RDb4XAH5/8jxobB5vWlT4QNLDBB+67BYhvidvCofDyQZjounklEKyK8ES60U0WhjqlQHVBISJ
	z9dli
X-Gm-Gg: ASbGncvyHWyqz4QToao7axF3yPy7qbojJFoJ1juODQErJKHoT1BuFCNcl5T4AS5Kedx
	HXSzWFflbzRlQMB2ah+gbAorzXdOwm05fWwsVcDT05tZG+OCXVQQ+/hDfvfpMziIDr8Sr48g49S
	TO9WrEOb+E+kYY04NdMXGrLt6fnE1STLiCWQYsQcqKTlqpdwYs+hgHBuJv/kICMZe06XnrM1rZ5
	3Iv9mR0F6Bfvq9aq6FwYBO2DtMm79U8SwCwL4hPF2/YS3/gvvLg9mwrz8l3Pz9CZJTaZUbQPONC
	Ygt9UeDLoknKJ1qUwiRQPjB2V2/N76JJl0oVOQbPBOj+gLtnAwpbcR7V1G8/wpjI+IM0w5iJHH2
	hj7oT4jRsb8qa/O4Ggjd7+UEN1U/ucTOt46EMNUl9+LLXQkc2mT0l1w5KZ7sSfA==
X-Google-Smtp-Source: AGHT+IFUVMZEfYJpXScC2Iy5d5OaSQsrDfLBO3OecJ1Qe7T9+o25udt9hW35VLFmJsih7IjcCxqwnQ==
X-Received: by 2002:a05:6000:4024:b0:3f9:6657:cdd with SMTP id ffacd0b85a97d-4266e7df967mr15000391f8f.38.1760428068639;
        Tue, 14 Oct 2025 00:47:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-426ce57cc0esm22389410f8f.6.2025.10.14.00.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 00:47:48 -0700 (PDT)
Date: Tue, 14 Oct 2025 10:47:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Rex Lu <rex.lu@mediatek.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Subject: drivers/net/wireless/mediatek/mt76/mt7996/mac.c:1651
 mt7996_msdu_page_get_from_cache() warn: can 'p' even be NULL?
Message-ID: <202510100155.MS0IXhzm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251014074744.r4CzJtnsuO7nTKLVQVu2ZO9-wy1l5yswvIYmvt-neFc@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ec714e371f22f716a04e6ecb2a24988c92b26911
commit: b1e58e137b61693f12da037d2d50aca9c2140a43 wifi: mt76: mt7996: Introduce RRO MSDU callbacks
date:   3 weeks ago
config: x86_64-randconfig-161-20251009 (https://download.01.org/0day-ci/archive/20251010/202510100155.MS0IXhzm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510100155.MS0IXhzm-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/mac.c:1651 mt7996_msdu_page_get_from_cache() warn: can 'p' even be NULL?

vim +/p +1651 drivers/net/wireless/mediatek/mt76/mt7996/mac.c

b1e58e137b6169 Rex Lu      2025-09-09  1641  static struct mt7996_msdu_page *
b1e58e137b6169 Rex Lu      2025-09-09  1642  mt7996_msdu_page_get_from_cache(struct mt7996_dev *dev)
b1e58e137b6169 Rex Lu      2025-09-09  1643  {
b1e58e137b6169 Rex Lu      2025-09-09  1644  	struct mt7996_msdu_page *p = NULL;
b1e58e137b6169 Rex Lu      2025-09-09  1645  
b1e58e137b6169 Rex Lu      2025-09-09  1646  	spin_lock(&dev->wed_rro.lock);
b1e58e137b6169 Rex Lu      2025-09-09  1647  
b1e58e137b6169 Rex Lu      2025-09-09  1648  	if (!list_empty(&dev->wed_rro.page_cache)) {
b1e58e137b6169 Rex Lu      2025-09-09  1649  		p = list_first_entry(&dev->wed_rro.page_cache,
b1e58e137b6169 Rex Lu      2025-09-09  1650  				     struct mt7996_msdu_page, list);
b1e58e137b6169 Rex Lu      2025-09-09 @1651  		if (p)

This NULL check is pointless.  We already ensured that the list is not
empty.

b1e58e137b6169 Rex Lu      2025-09-09  1652  			list_del(&p->list);
b1e58e137b6169 Rex Lu      2025-09-09  1653  	}
b1e58e137b6169 Rex Lu      2025-09-09  1654  
b1e58e137b6169 Rex Lu      2025-09-09  1655  	spin_unlock(&dev->wed_rro.lock);
b1e58e137b6169 Rex Lu      2025-09-09  1656  
b1e58e137b6169 Rex Lu      2025-09-09  1657  	return p;
b1e58e137b6169 Rex Lu      2025-09-09  1658  }


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

