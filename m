Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA7D311963
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Apr 2026 08:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775550920; cv=none; b=i4N/5TSMgpvu9rjrwIugb8yMPl4eHDtVBX7r0xhLCvFgSTsBTC+4Ds6sORHQItEKjlZTNa1885PCvEi0rGXpvlCOtg6/w6BQtVvqHAWlW/2/T3n6Pmcde46m6izxtfAYRr5IOz7/Q6FuWTlMfI96X+uBudWVBea0OvDYPWDieR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775550920; c=relaxed/simple;
	bh=K3WwHJtUPfm66i3F0gPb6DNHBW7Q/RpWfQ0AoPgRO84=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V4JJUAUP8iQAP4DMb5XK1Yz1AwkgkLvZi/pnMdzoN7hO1mrGrVfLqwOlrEaSLsZMLL37+4C2xxAju2sixY1uCLCjxXX+GH9zbuMWPM25vWyDmyqYP4TwGAJRKWNz0DMzExiobTMUs6pPOnLMiwUKdXhTs5ogtYHtCq/P+VNfFVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=moiRJwwI; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="moiRJwwI"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso17073675e9.1
        for <oe-kbuild@lists.linux.dev>; Tue, 07 Apr 2026 01:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775550909; x=1776155709; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GSiA63+8lYz5lH26kAB6IVl8Sxxj8wSbU0L1qxLcLIQ=;
        b=moiRJwwINKXg/UeeFkNoSHQCippbIRqvq9Tzez1hnr6YSDGPButRC29fAEg/VsAg6W
         onT66QtVdrqQ+p9nrcDdtfluzSU5N/ZK74Ey3XiMjHsGBK1BuVLPeCQsvSgLG4N39crB
         xaOCTGmToClPFtMX1Qpjm/Ijk464VVMdSK2N/jddAJ8eKOUmjeKLVBLIQYKd7uyYYdKl
         iQYJ0xxs5IqYu3/TwYM5ja6sPFCe0G4oulJy0hsqI56L1Pyo8qJ81FgDzXKihLVa7YJW
         MtaADmRT3dJgXkhhNITl78R5cGHzxtFel2p0WGTgVYyJigNJY5br5+mKs6PxKJ2uX/T9
         yIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775550909; x=1776155709;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GSiA63+8lYz5lH26kAB6IVl8Sxxj8wSbU0L1qxLcLIQ=;
        b=FyRp6/cYK0Sy4nXpQUu0PugIA+DMu8BOIqrNdPZ2lbvSXyt1TPlBraZM71hcOWsijh
         KeqeqwxcfUZRx2Nql9qUN96SCNYDy4hptGPUTV+FcgUxToAzgO42f+nsRLzcvVOqzLb9
         JXMpyXJGTDrjRvU3IMp8KWIOTAzhXCYgmhY89yWtDwhnayeRIyMiB/B1sngu1bBx1Lzj
         CDK8V3zZUP6MpphxEEouS9qKvUSzKhZIVjEmfHjX9bipDxp2eT+AOmpmUD2PdQUhjx2K
         leTtxEoUu+cJxZqQ9i8b6HNJwoQXQs+SnCMith5KQetMIOmTSZCQ7veJMy9pIs/T8C54
         FEig==
X-Gm-Message-State: AOJu0YzcxzIATZ4JHA2QXm/Z4DADix4GDlII7pl0Q2FwgadAiP+Gfq7R
	iXVW6sMSaVBmZ5uS+grFi+fJMupZBxQVOJGTKacZ+GkguR0VMApVYQC7m0pk6w==
X-Gm-Gg: AeBDiesFkV7e6WnPsMCby4PDzHNppWJtBdtNQew/s2nfiQxH88B7t8o83mT1c7tceYk
	uJ0b3t4u2RvLZtORSba0TTSXwwzOXLt5us3O72XDstb5IpBSTM2m9ZpSwaxjPDrU0E/PJDApogu
	SQoh4aF/u2AJPcJnVzCEe8glD0s7ZnLFqdZIw9FEfUQh/HoCzyptI9I23vZFEjTT2pEZDmGV5rF
	6HKgj9c5ADTt4B+yy4qeA68sp9ox3JwDxLzyYtGjUsu9cnMk6xDZFRTkRG7AmEL3+VeOiHapGWf
	/W5hOQQbZSZs0l91yOBaoXkGSri5eTPGKEqC9KCzxmTpfExX5dK2AXfdYakur+lixugfqDnd5lM
	/EaRXYyyITVupHvFIC8F3mvmq2c/7Sl2ezVYMEBnIb2LJfj4f3OvCrLogjld4wJbPz+8lsGLPHe
	G0SmjUlggbecsOuXmzb4k=
X-Received: by 2002:a05:600c:45cf:b0:477:9890:9ab8 with SMTP id 5b1f17b1804b1-4889945f8c3mr188304265e9.3.1775550908297;
        Tue, 07 Apr 2026 01:35:08 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899ea0091sm114883225e9.28.2026.04.07.01.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 01:35:07 -0700 (PDT)
Date: Tue, 7 Apr 2026 11:35:04 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: sound/arm/pxa2xx-ac97-lib.c:334 pxa2xx_ac97_hw_probe() warn: passing
 zero to 'PTR_ERR'
Message-ID: <202604041426.i2C1xqHk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260407083504.XuPurHo7sAew1Nw_owuH7frw6zgJQNVf3-Tux1aRFsk@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7ca6d1cfec80ebe46cc063f3284c5896c344d9a1
commit: c76d50b71e898694c946993eb3c77f50efa97254 ASoC: ac97: Convert to GPIO descriptors
config: microblaze-randconfig-r072-20260404 (https://download.01.org/0day-ci/archive/20260404/202604041426.i2C1xqHk-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c76d50b71e89 ("ASoC: ac97: Convert to GPIO descriptors")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604041426.i2C1xqHk-lkp@intel.com/

smatch warnings:
sound/arm/pxa2xx-ac97-lib.c:334 pxa2xx_ac97_hw_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +334 sound/arm/pxa2xx-ac97-lib.c

e21596bba143563 Bill Pemberton   2012-12-06  320  int pxa2xx_ac97_hw_probe(struct platform_device *dev)
9c63634221f6745 Dmitry Baryshkov 2008-09-10  321  {
9c63634221f6745 Dmitry Baryshkov 2008-09-10  322  	int ret;
2548e6c76ebfae0 Arnd Bergmann    2019-09-10  323  	int irq;
26ade896b6ba3fd Robert Jarzmik   2009-03-15  324  
8ff064521f97554 Arnd Bergmann    2019-09-18  325  	ac97_reg_base = devm_platform_ioremap_resource(dev, 0);
8ff064521f97554 Arnd Bergmann    2019-09-18  326  	if (IS_ERR(ac97_reg_base)) {
8ff064521f97554 Arnd Bergmann    2019-09-18  327  		dev_err(&dev->dev, "Missing MMIO resource\n");
8ff064521f97554 Arnd Bergmann    2019-09-18  328  		return PTR_ERR(ac97_reg_base);
8ff064521f97554 Arnd Bergmann    2019-09-18  329  	}
8ff064521f97554 Arnd Bergmann    2019-09-18  330  
be829277ef79aa6 Peng Fan         2026-01-22  331  	if (dev->dev.of_node) {
c76d50b71e89869 Peng Fan         2026-01-22  332  		/* Assert reset using GPIOD_OUT_HIGH, because reset is GPIO_ACTIVE_LOW */
c76d50b71e89869 Peng Fan         2026-01-22  333  		rst_gpio = devm_gpiod_get(&dev->dev, "reset", GPIOD_OUT_HIGH);
c76d50b71e89869 Peng Fan         2026-01-22 @334  		ret = PTR_ERR(rst_gpio);

This was intended to be PTR_ERR_OR_ZERO(rst_gpio)

c76d50b71e89869 Peng Fan         2026-01-22  335  		if (ret == -ENOENT)
be829277ef79aa6 Peng Fan         2026-01-22  336  			reset_gpio = -1;
c76d50b71e89869 Peng Fan         2026-01-22  337  		else if (ret)
c76d50b71e89869 Peng Fan         2026-01-22  338  			return ret;

Otherwise we always return here.

c76d50b71e89869 Peng Fan         2026-01-22  339  		reset_gpio = desc_to_gpio(rst_gpio);
26ade896b6ba3fd Robert Jarzmik   2009-03-15  340  	} else {
26ade896b6ba3fd Robert Jarzmik   2009-03-15  341  		if (cpu_is_pxa27x())
26ade896b6ba3fd Robert Jarzmik   2009-03-15  342  			reset_gpio = 113;
26ade896b6ba3fd Robert Jarzmik   2009-03-15  343  	}
9c63634221f6745 Dmitry Baryshkov 2008-09-10  344  
9d1cf39be670976 Dmitry Baryshkov 2008-09-10  345  	if (cpu_is_pxa27x()) {
3b4bc7bccc78572 Mike Dunn        2013-01-07  346  		/*
3b4bc7bccc78572 Mike Dunn        2013-01-07  347  		 * This gpio is needed for a work-around to a bug in the ac97
3b4bc7bccc78572 Mike Dunn        2013-01-07  348  		 * controller during warm reset.  The direction and level is set
3b4bc7bccc78572 Mike Dunn        2013-01-07  349  		 * here so that it is an output driven high when switching from
3b4bc7bccc78572 Mike Dunn        2013-01-07  350  		 * AC97_nRESET alt function to generic gpio.
3b4bc7bccc78572 Mike Dunn        2013-01-07  351  		 */
c76d50b71e89869 Peng Fan         2026-01-22  352  		gpiod_set_consumer_name(rst_gpio, "pxa27x ac97 reset");
053fe0f166e540a Mike Dunn        2013-01-07  353  		pxa27x_configure_ac97reset(reset_gpio, false);
3b4bc7bccc78572 Mike Dunn        2013-01-07  354  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

