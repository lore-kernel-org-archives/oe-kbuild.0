Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA89E3B4E8B
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Mar 2026 08:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773910524; cv=none; b=iYxopP+LuM8EErQJdAY+WULL2e/jZVHgMAreJY6NllEz2DpeqBprYwZcg6PN369hYnIzcD0DEhJvjCyq9CfkzDGUL6yhpJDqiAGi1iHM61d5K+ZmGnK/K/yQTIj0+R5l/60vzRj5Od18Ec0MSgwIEDpi6Eb9MVs8Huo7Om3nB4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773910524; c=relaxed/simple;
	bh=+1rkSXfZoBtNynuJjaGZeSgOt0e3kXvIgDj45B/D81I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p9NLKiIY2KSNXlsYkVsqxr0XUesiXqxzU36KnwfUlrwDO9lByB0DcxjNw6tpTHCNmt2RWH0G4uPJsulk22Jg9GFK8ZJtHBz5YgEzxa5lVHJiaWTKpK6ST3Iywhy9GEhFu4t+V/WvcU/NzEuLG7xmx7ahHdm548n9ZAV22sA0hyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MB/BzhWg; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MB/BzhWg"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486507134e4so8198825e9.0
        for <oe-kbuild@lists.linux.dev>; Thu, 19 Mar 2026 01:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773910520; x=1774515320; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ux3QTUrVUljT9NRMP7Y1Tw9kvbz/wEC9s9mW2JG37y8=;
        b=MB/BzhWgbKXXqVoRb1V1L5Yei+Faq/NxBTJO8z5HNHX8fyIodCkVWjx1f1dbquK8U/
         m8udGsbPIkGuWLTdD4C2PONeT3Bejnb4MlthCEc/Tq/2gXxojxTYMwfBmduiSB66Bcm3
         e2S5tQqISg8t5J7/Dy3CcY5M5djoW/vz85MJqqpRbUHxWBVALJnWtSVnoCLjrw5HB1mt
         Q7WHPLIuFcaVv6Pb0olx9Dgb5Yg2LLa/Gf//QbOgf03YR7oMHfnITS57G7QOzK5So5+E
         4itJd0mdOkBUdmsDCf45abwrouCK0xu9gM+PIPh85b2QxwsjH+Z94UgyoOIyvubKKIqN
         AXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773910520; x=1774515320;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ux3QTUrVUljT9NRMP7Y1Tw9kvbz/wEC9s9mW2JG37y8=;
        b=NzemRZeGDYF8YTCTF5i5uhvZ8w4rGAcglLf09CgE3/xoaycl5Y60gKGkVhKjRY58s3
         Mze9EI//8jvUnQlz3cwseYdtfMkEO981ivzlWMVjfNzeofh0ntQ95EipT5EhhxgLIoNO
         EDQ9FBCH3WojSj1luF7ZNZowFRVM58CpRvQ24A5P1nWJqbx4LSDQMjd9niUc84zCVLXV
         UHVcuFtK93k9gKroduezR25uIMDZ7obPAyK2Fs7q10LQ/dxNZVLyQyio2pK6M9gGEKAU
         2oKr7AXNEjqrJSWpYMOUUHZ2KCGDNc8Ow4/2cWkTPdZ/Xp3iBF/EGsDzxcKWBKdneL8Z
         cSVQ==
X-Gm-Message-State: AOJu0Yy7GB5d98A+m9qcMqVcZmlRMJxPzbUJ4dzksXkYVCEleUvbWKQ8
	1S5vRSrRvklSxaxZalql1Eho/krxiUW9UD2T1taaCqF2flaALjB/QFxSaIc0PXdfARsv3Qeqm1/
	edPWm
X-Gm-Gg: ATEYQzwwTzUzst70feuNyneXZqhO3vAQs8qB0yyOKDy7xs7r8cw3oOb2vBjDjXtsWnj
	xFvy3VPkNXuPcA6l5v2PKpgkvufuXsgR054esH6fqULmZXfo4YEJ4rJdSyHdnqfZKAXks0v7MO4
	URbLwAX2ih4IRQnwycIFFTrgW3UmT2Z+i5SvfdsHCO0cpZqN71XmIALzHNLWyXpfBnZAqo8je40
	MaVrP+UsS0er7ypL8+B6Ph/5ZwlfQG7E+xQ7v7DzqD1C1hDAzfmg+sjUwMWOrLsoE4hIy9P85HI
	vxRStoyn4Djijj57WsZeyux4GRmOHykPqCTyOEMY2hYpaW42o9O3lzvp5UHsV0gtLEDmiG8NEyt
	WG+n2jiGcyvhij/9ggvVWXVYtOixL/FPZhXFM/g5zCKpJLOWSvL7pJENC3t2+PnM1BrinVuGCTH
	Wz7Hg8ibD/XGPMNE2fz4VMhFBUT97jdb0tlJ5eu4k=
X-Received: by 2002:a05:600c:3b28:b0:485:3aa1:a7f1 with SMTP id 5b1f17b1804b1-486f441bc51mr106526795e9.7.1773910520220;
        Thu, 19 Mar 2026 01:55:20 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8ba4baesm74549945e9.13.2026.03.19.01.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 01:55:19 -0700 (PDT)
Date: Thu, 19 Mar 2026 11:55:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Biju Das <biju.das.jz@bp.renesas.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Vinod Koul <vkoul@kernel.org>, Long Luu <long.luu.ur@renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [linux-next:master 6296/7246] drivers/dma/sh/rz-dmac.c:726
 rz_dmac_chan_get_residue() warn: can 'current_desc' even be NULL?
Message-ID: <202603190250.VAmYUWk2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260319085515.aRRhzWxA5nPDBpqn4ECjsjkiJ2rR89zgw61JIlJL21I@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8e42d2514a7e8eb8d740d0ba82339dd6c0b6463f
commit: 21323b118c16d287355e6497e1098ce1ca348bd6 [6296/7246] dmaengine: sh: rz-dmac: Add device_tx_status() callback
config: m68k-randconfig-r073-20260318 (https://download.01.org/0day-ci/archive/20260319/202603190250.VAmYUWk2-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603190250.VAmYUWk2-lkp@intel.com/

smatch warnings:
drivers/dma/sh/rz-dmac.c:726 rz_dmac_chan_get_residue() warn: can 'current_desc' even be NULL?

vim +/current_desc +726 drivers/dma/sh/rz-dmac.c

21323b118c16d2 Biju Das 2026-03-16  716  static u32 rz_dmac_chan_get_residue(struct rz_dmac_chan *channel,
21323b118c16d2 Biju Das 2026-03-16  717  				    dma_cookie_t cookie)
21323b118c16d2 Biju Das 2026-03-16  718  {
21323b118c16d2 Biju Das 2026-03-16  719  	struct rz_dmac_desc *current_desc, *desc;
21323b118c16d2 Biju Das 2026-03-16  720  	enum dma_status status;
21323b118c16d2 Biju Das 2026-03-16  721  	u32 crla, crtb, i;
21323b118c16d2 Biju Das 2026-03-16  722  
21323b118c16d2 Biju Das 2026-03-16  723  	/* Get current processing virtual descriptor */
21323b118c16d2 Biju Das 2026-03-16  724  	current_desc = list_first_entry(&channel->ld_active,
21323b118c16d2 Biju Das 2026-03-16  725  					struct rz_dmac_desc, node);
21323b118c16d2 Biju Das 2026-03-16 @726  	if (!current_desc)
21323b118c16d2 Biju Das 2026-03-16  727  		return 0;

Use list_first_entry_or_null() if you're not sure whether
the list is empty.  list_first_entry() never returns NULL.

21323b118c16d2 Biju Das 2026-03-16  728  
21323b118c16d2 Biju Das 2026-03-16  729  	/*
21323b118c16d2 Biju Das 2026-03-16  730  	 * If the cookie corresponds to a descriptor that has been completed
21323b118c16d2 Biju Das 2026-03-16  731  	 * there is no residue. The same check has already been performed by the
21323b118c16d2 Biju Das 2026-03-16  732  	 * caller but without holding the channel lock, so the descriptor could
21323b118c16d2 Biju Das 2026-03-16  733  	 * now be complete.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

