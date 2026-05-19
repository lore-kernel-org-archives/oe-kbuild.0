Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD682475E3
	for <oe-kbuild@lists.linux.dev>; Tue, 19 May 2026 05:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779167802; cv=none; b=CFjSJE4oVqUAuJZQKQVwW2D6E4BqfqXSWWl4/a/wjzuqUeTObFylrYhmuVEpcUr8GwgwhwUs0QhDbNfeyr+4iGpTciYxOglVS2boICm+WJH6QbubP3KaKEe7/FPzF7vSvi5458Ad7FZEMJmfNSSpF6Ni1g+9GCx33JErYU+Gwf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779167802; c=relaxed/simple;
	bh=L+DDYlvxA0BU9npb5R10UYrNZlOAXuXDsVOtU/JzPCM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZAqHS/t61xn0H/GBELDYKheNRXTuq3d1a6oANBThwF0TV7FLrbSeiXEnn1KMMcpUFDhg4SV1zPL/Fsbc6wNHe3N3eT0wBtUjEDzQyfgPicJhCAnFt9NUJj/XI2CqvR+KP7YlW4YOVS/zG16j9QqFk7qQ8W1aTaOOcNo7eTNG4f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sQCEjGXk; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sQCEjGXk"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488b0046078so27421335e9.1
        for <oe-kbuild@lists.linux.dev>; Mon, 18 May 2026 22:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779167799; x=1779772599; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xoeUm+1Wp9QTeIhq0Aa01ppZkDj0bFle06AV2NzDcz0=;
        b=sQCEjGXkRjMr1xLFUKHJCtorebsPHj4PSAPHmc+xsqTSdMTmIGOjlikokA0E604+Ny
         wCNphLtqECUxlpf6KxQgwSL612Y+oL6Jto6JMjrVtm2oP+f6rM/px8mldvbIkwxyIhIt
         V0rU2rHC5yGGK7fBbEQ9xSGqQz6ulK3K2VofmbStxJWuG1VgQ40cfjIO2HLZYrMyN/Iy
         RXIAWaFZHdN7BF+zQ5lENNEsv5ZnOJA4cZYYpw241F3YEnufxpDnzF7bLliycdzwj44E
         ssfhUYC5tX/MvZbEvKgLLSQ8nja/J6lF9jM9a80SV+ExPZEa/bP3fvRkBZeXH8s3fWZs
         r06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779167799; x=1779772599;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xoeUm+1Wp9QTeIhq0Aa01ppZkDj0bFle06AV2NzDcz0=;
        b=J9Gayua6eas76kobuYEhA9UIUokgP8bG3XmgwGVt7Bgt7nrC6rSkLKfNVRLTBj0SmM
         HT/yUjouCq/c03KJKAW0v066F0UXC639Lo3ZCkVyYj5xY73qdx9z/+BoZnQxFcpof5ff
         jtFjIuFdl1iOirpDgRnIf0gaaDihJKVDHS8cVJ1TOnS+kZTW7MLz2p03+B9n0Zqdwvpz
         S4WdoFyLjSEJ1noY8eScZ3+wWZr65d2j++jYUSGDBl22DChWpBV5U3fNUq7mcCfO8kJ0
         8MwVJ3W85kC8h0Jl50VvcVJ5xwBGm6NwHApytZ6aiXSKj2peK5d11nsx4bwVizf+MDkq
         iONw==
X-Gm-Message-State: AOJu0YyJYB3gU0WshrBu9K1AvrY3I6e0UuDplXemB3FFsXI+f/UVxK8c
	X0svikwLfcbjf54PqzeMwdLAq30UnHsga2VUhbkyh2zlYZC6qlgxzKJ3i9i4qQ==
X-Gm-Gg: Acq92OGcaJXdPqlq2LlxMHbGJlaEcQdpr2T2sNC07hvR96qpruptPMQAhnCIIQR85Si
	mReo3fKQEXt/1+Ct4/mpP05+Lafyw20nac0OhHRMTppo0AcCu4MaHHhbjiWxiLZYsluCzfJhLbr
	7j3lEfFR6S2mmjN+/VOhz/ZUBQIbUoN6ljGTFp7S8rCCBEYXizzlIBaGaaT28jxiF3EMuxDmnDQ
	J11qWk7DJn9z8NQgYGwk0tN1hC0l0E/6QPZGIW0nSAf2mA/gyLAwvOfI3qXEfBj9v4QftvVoP6W
	OAor3G9lSplCBm+KgoUsOmHLgpx/u8wQoA15C/HrWpxsXzXNK5aqa0YmKvUypFHq/2Om/xO8W74
	wdlAQ4nZNDaJO9XzN1ZsvytncjhRj22cZ7DxFPj7FMrEa70hFHz8kYAqJm1jFoUCNmeXWkPGaSM
	Uydhq16K3HOYuL/4nOrFE=
X-Received: by 2002:a05:600c:34d4:b0:48f:e245:394e with SMTP id 5b1f17b1804b1-48fe631f631mr289514325e9.27.1779167798657;
        Mon, 18 May 2026 22:16:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48ff43f8799sm183427875e9.2.2026.05.18.22.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 22:16:37 -0700 (PDT)
Date: Tue, 19 May 2026 08:16:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Helge Deller <deller@gmx.de>
Subject: [deller-fbdev:fbdev-7.0-2 4/7] drivers/video/fbdev/au1100fb.c:503
 au1100fb_drv_probe() warn: missing unwind goto?
Message-ID: <202605191033.nlEuO1ea-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Message-ID: <20260519051634.LLEASaoKaSw3WJvsyfeJiwM0GfMCROJvWaxajUBAGus@z>

Hi Uwe,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git fbdev-7.0-2
head:   0f967cb8ea04486953f85b249b42dda3de842053
commit: 6f366e86481a7503a821de82930df517dddd4047 [4/7] fbdev: au1100fb: Make driver compilable on non-mips platforms
config: arc-randconfig-r073-20260519 (https://download.01.org/0day-ci/archive/20260519/202605191033.nlEuO1ea-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605191033.nlEuO1ea-lkp@intel.com/

smatch warnings:
drivers/video/fbdev/au1100fb.c:503 au1100fb_drv_probe() warn: missing unwind goto?
drivers/video/fbdev/au1100fb.c:526 au1100fb_drv_probe() warn: 'c' from clk_prepare_enable() not released on lines: 470,498,503.

vim +503 drivers/video/fbdev/au1100fb.c

48c68c4f1b5424 drivers/video/au1100fb.c       Greg Kroah-Hartman 2012-12-21  405  static int au1100fb_drv_probe(struct platform_device *dev)
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  406  {
46953e6aab262d drivers/video/fbdev/au1100fb.c Markus Elfring     2018-03-28  407  	struct au1100fb_device *fbdev;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  408  	struct resource *regs_res;
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  409  	struct clk *c;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  410  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  411  	/* Allocate new device private */
db66f0252e2f17 drivers/video/fbdev/au1100fb.c Markus Elfring     2018-03-28  412  	fbdev = devm_kzalloc(&dev->dev, sizeof(*fbdev), GFP_KERNEL);
29914badc59b23 drivers/video/fbdev/au1100fb.c Markus Elfring     2018-03-28  413  	if (!fbdev)
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  414  		return -ENOMEM;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  415  
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  416  	if (au1100fb_setup(fbdev))
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  417  		goto failed;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  418  
7a192ec334cab9 drivers/video/au1100fb.c       Ming Lei           2009-02-06  419  	platform_set_drvdata(dev, (void *)fbdev);
67f30ad19c4b32 drivers/video/fbdev/au1100fb.c Christoph Hellwig  2019-04-28  420  	fbdev->dev = &dev->dev;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  421  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  422  	/* Allocate region for our registers and map them */
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  423  	regs_res = platform_get_resource(dev, IORESOURCE_MEM, 0);
d121c3f3cedb84 drivers/video/au1100fb.c       Manuel Lauss       2011-09-30  424  	if (!regs_res) {
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  425  		print_err("fail to retrieve registers resource");
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  426  		return -EFAULT;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  427  	}
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  428  
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-16  429  	fbdev->info.fix = (struct fb_fix_screeninfo) {
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-16  430  		.mmio_start = regs_res->start,
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-16  431  		.mmio_len = resource_size(regs_res),
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-16  432  		.id = "AU1100 FB",
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-16  433  		.xpanstep = 1,
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-16  434  		.ypanstep = 1,
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-16  435  		.type = FB_TYPE_PACKED_PIXELS,
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-16  436  		.accel = FB_ACCEL_NONE,
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-16  437  	};
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  438  
93019734555f8d drivers/video/au1100fb.c       Manuel Lauss       2012-03-24  439  	if (!devm_request_mem_region(&dev->dev,
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-16  440  				     fbdev->info.fix.mmio_start,
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-16  441  				     fbdev->info.fix.mmio_len,
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  442  				     DRIVER_NAME)) {
c05b7f3d12b945 drivers/video/au1100fb.c       Rodolfo Giometti   2006-05-30  443  		print_err("fail to lock memory region at 0x%08lx",
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-16  444  			  fbdev->info.fix.mmio_start);
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  445  		return -EBUSY;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  446  	}
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  447  
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-16  448  	fbdev->regs = (struct au1100fb_regs*)KSEG1ADDR(fbdev->info.fix.mmio_start);
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  449  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  450  	print_dbg("Register memory map at %p", fbdev->regs);
13c89a37c6f6f3 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-16  451  	print_dbg("phys=0x%08x, size=%zu", fbdev->regs_phys, fbdev->regs_len);
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  452  
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  453  	c = clk_get(NULL, "lcd_intclk");
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  454  	if (!IS_ERR(c)) {
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  455  		fbdev->lcdclk = c;
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  456  		clk_set_rate(c, 48000000);
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  457  		clk_prepare_enable(c);
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  458  	}
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  459  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  460  	/* Allocate the framebuffer to the maximum screen size * nbr of video buffers */
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  461  	fbdev->fb_len = fbdev->panel->xres * fbdev->panel->yres *
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  462  		  	(fbdev->panel->bpp >> 3) * AU1100FB_NBR_VIDEO_BUFFERS;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  463  
93019734555f8d drivers/video/au1100fb.c       Manuel Lauss       2012-03-24  464  	fbdev->fb_mem = dmam_alloc_coherent(&dev->dev,
1c16697bf9d5b2 drivers/video/au1100fb.c       Julia Lawall       2012-01-21  465  					    PAGE_ALIGN(fbdev->fb_len),
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  466  					    &fbdev->fb_phys, GFP_KERNEL);
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  467  	if (!fbdev->fb_mem) {
13c89a37c6f6f3 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-16  468  		print_err("fail to allocate framebuffer (size: %zuK))",
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  469  			  fbdev->fb_len / 1024);
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  470  		return -ENOMEM;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  471  	}
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  472  
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-16  473  	fbdev->info.fix.smem_start = fbdev->fb_phys;
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-16  474  	fbdev->info.fix.smem_len = fbdev->fb_len;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  475  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  476  	print_dbg("Framebuffer memory map at %p", fbdev->fb_mem);
13c89a37c6f6f3 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-16  477  	print_dbg("phys=0x%pad, size=%zuK", &fbdev->fb_phys, fbdev->fb_len / 1024);
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  478  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  479  	/* load the panel info into the var struct */
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-16  480  	fbdev->info.var = (struct fb_var_screeninfo) {
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-16  481  		.activate = FB_ACTIVATE_NOW,
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-16  482  		.height = -1,
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-16  483  		.width = -1,
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-16  484  		.vmode = FB_VMODE_NONINTERLACED,
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-16  485  		.bits_per_pixel = fbdev->panel->bpp,
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-16  486  		.xres = fbdev->panel->xres,
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-16  487  		.xres_virtual = fbdev->panel->xres,
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-16  488  		.yres = fbdev->panel->yres,
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-16  489  		.yres_virtual = fbdev->panel->yres,
7939cecdc6fa39 drivers/video/fbdev/au1100fb.c Uwe Kleine-König   2026-02-16  490  	};
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  491  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  492  	fbdev->info.screen_base = fbdev->fb_mem;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  493  	fbdev->info.fbops = &au1100fb_ops;
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  494  
1c16697bf9d5b2 drivers/video/au1100fb.c       Julia Lawall       2012-01-21  495  	fbdev->info.pseudo_palette =
a86854d0c599b3 drivers/video/fbdev/au1100fb.c Kees Cook          2018-06-12  496  		devm_kcalloc(&dev->dev, 16, sizeof(u32), GFP_KERNEL);
1c16697bf9d5b2 drivers/video/au1100fb.c       Julia Lawall       2012-01-21  497  	if (!fbdev->info.pseudo_palette)
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  498  		return -ENOMEM;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  499  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  500  	if (fb_alloc_cmap(&fbdev->info.cmap, AU1100_LCD_NBR_PALETTE_ENTRIES, 0) < 0) {
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  501  		print_err("Fail to allocate colormap (%d entries)",
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  502  			   AU1100_LCD_NBR_PALETTE_ENTRIES);
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04 @503  		return -EFAULT;

Obviously your patch just enabled compile testing and didn't introduce
the bug.  On the other hand, probably you enabled compile testing
because you wanted to see this warning.  (Although historically that
has 100% not been the case and no one is ever happy to see these
warnings get blamed on their patch by the Intel compile test robot.
:P)

3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  504  	}
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  505  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  506  	/* Set h/w registers */
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  507  	au1100fb_setmode(fbdev);
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  508  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  509  	/* Register new framebuffer */
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  510  	if (register_framebuffer(&fbdev->info) < 0) {
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  511  		print_err("cannot register new framebuffer");
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  512  		goto failed;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  513  	}
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  514  
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  515  	return 0;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  516  
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  517  failed:
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  518  	if (fbdev->lcdclk) {
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  519  		clk_disable_unprepare(fbdev->lcdclk);
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  520  		clk_put(fbdev->lcdclk);
6b1889c14b4606 drivers/video/fbdev/au1100fb.c Manuel Lauss       2014-07-23  521  	}
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  522  	if (fbdev->info.cmap.len != 0) {
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  523  		fb_dealloc_cmap(&fbdev->info.cmap);
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  524  	}
^1da177e4c3f41 drivers/video/au1100fb.c       Linus Torvalds     2005-04-16  525  
1c16697bf9d5b2 drivers/video/au1100fb.c       Julia Lawall       2012-01-21 @526  	return -ENODEV;
3b495f2bb749b8 drivers/video/au1100fb.c       Pete Popov         2005-04-04  527  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

