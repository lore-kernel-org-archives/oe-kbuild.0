Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F40214812
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 06:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733726219; cv=none; b=J4P/Wc8B1bZ3eCMcA6kC9Kzp0ioknFEmdTPGjl7vAYta3qsmdpzvEaJ9zVrIhXHub+LzIiiMvzW5qII0mmHuNU4AliudUST6VaqOn7BWA4HB8JC5HxI0MviIRXpxWL7oDWplZt+XtquMIN5Sb1QR9jYMihno2FNr9AOj/8VztRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733726219; c=relaxed/simple;
	bh=6eqqUNJJ3vPG7vTcA2wxcPmZxdDyXarNS81G6pfi81Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jtrvZ4MimpY63eURpWLEiOqP8XFhsoCHrSTP3QVKfAuss9HonY18VCPUm967dq7zz7999egecTGhUdTlivie7OKepfDcilH9hZLlLRufzFS8btVQCWXckkMw3wc1zAaMgDZ9elqXmQrBL2Htx1bswBE3fg6s9IpDOw0lBAUTH5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P/A7pgPh; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P/A7pgPh"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-434e8aa84f7so14948835e9.0
        for <oe-kbuild@lists.linux.dev>; Sun, 08 Dec 2024 22:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733726216; x=1734331016; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0pYqNCYDwSFTStFCXhDRXkvYvPJ1uFwCy3cBb397Bbg=;
        b=P/A7pgPh317vYeERc5lY+iiXT0YcdLMxA3gcxDuOC0EI7ctqLAL9AHBFMRz/Ejs6IF
         7EBEw7wfCTLHJEvuin69NspK1vxRp1OerJK7L+g8dulHAzvv9H5cJ2YePxljmuFNDo+F
         jW4w81SC7QT/StuzWFJxqF0n8hiy6RhXUfhPBRdgQOdZbiAnKAXLz3B3ONMNDiE/vMfb
         4+4FopOCBfI7uAyjMBn5CSXFF+8ojxn1Lp4Mk1mSvtwdW6u5+2vQ89jNKOljksJoz0ri
         6ehdSg5P2gNw1TCiGRP73N89l0thzS/ERAcWUqNNRLjF5UFSkvSab3I79EgqHLqoFw64
         L/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733726216; x=1734331016;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0pYqNCYDwSFTStFCXhDRXkvYvPJ1uFwCy3cBb397Bbg=;
        b=T2q8R5x4DrtJdMNpRNYUzGL3UBMFhlmR9dIlqf6YE4yql1XHfPrQep2Vm5bQgLzQP2
         DZFZiic/WwIkr2b81e/FLQ36ZedXZmVzRsuZNYtKONmDaJrhfLwV3myY2f3vG49keCxp
         VGPeJu5NzJey4kcnV/3/GN/71LFzNfyS2IOB+e273clNyie+EUh2q2NQ+UwX2cj1DAoM
         n2MHEPL3ptQZ9IDtjAch5QsW40gUtqxbqubmCLpUlG8eJ+dSQj9Keoo/7ACcqAo8Ul57
         5T/4xk9EUnlI0dxTB989EkbTaHvp1QN0kRY+hZUR6ll1Zmjko2Ouf5ySwaV0U5lOmZ1e
         KnAg==
X-Gm-Message-State: AOJu0YzAyF7VBGGHz5aoxiLbrdGFmuoX0nREJH6dfTiuJ3GLj2ZKHUPh
	jQ3YTEr16oDyuoXeHQSv6QEfgQZRPG8NxUSwAuw9tVzOI+HWxB5XG4mEKs2+IC7MR6Xb7DsbtII
	i
X-Gm-Gg: ASbGncso6vqQ+8mMgMujPcevsB72u5tbEu8KdRoczWMBfO5MhhiGamLwka9s0479z8e
	byxdjKDm7nFpXEWiDymOrXWPwyLUZ+6u5P0jNGJsTdoq9Ay+gS7Lyz4eDO+kntXXCbaJYrfC/+u
	SiBXdnEA9j1f9bkztZzYJg+Wop0SzxasSG0Kl0L+vKar++YDioWECTihXGmnnBftgu4hEW1MBt6
	wuUA+v2mDJLDXK+F7ACxeE0Gb8Rh4Clkw54D4xEpKlvmzt4WBstJTI=
X-Google-Smtp-Source: AGHT+IES6dTJEaTnkmfHwTMG6jKosfbiP4CkXOOfgsEOmy/HB5R1ohvJm3vAtgSwl3yD4VVxuh+kKg==
X-Received: by 2002:a05:600c:19d3:b0:434:fa73:a907 with SMTP id 5b1f17b1804b1-434fa73ad6fmr9293965e9.13.1733726216159;
        Sun, 08 Dec 2024 22:36:56 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434f39653c6sm48575895e9.7.2024.12.08.22.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 22:36:55 -0800 (PST)
Date: Mon, 9 Dec 2024 09:36:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: sound/soc/renesas/rcar/adg.c:416 rsnd_adg_create_null_clk() warn:
 passing zero to 'ERR_CAST'
Message-ID: <dd683985-6aac-43e0-8116-92f2c587874d@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lad,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b5f217084ab3ddd4bdd03cd437f8e3b7e2d1f5b6
commit: c087a94bea49acf34d651f7308506fe462a937b3 ASoC: Rename "sh" to "renesas"
config: openrisc-randconfig-r071-20241206 (https://download.01.org/0day-ci/archive/20241207/202412071740.OKhNHftG-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412071740.OKhNHftG-lkp@intel.com/

smatch warnings:
sound/soc/renesas/rcar/adg.c:416 rsnd_adg_create_null_clk() warn: passing zero to 'ERR_CAST'
sound/soc/renesas/rcar/dma.c:840 rsnd_dma_attach() error: we previously assumed '*dma_mod' could be null (see line 833)

vim +/ERR_CAST +416 sound/soc/renesas/rcar/adg.c

cb2f97d89f383da sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-06-02  406  static struct clk *rsnd_adg_create_null_clk(struct rsnd_priv *priv,
cb2f97d89f383da sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-06-02  407  					    const char * const name,
cb2f97d89f383da sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-06-02  408  					    const char *parent)
d6956a7dde6fbf8 sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-05-24  409  {
d6956a7dde6fbf8 sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-05-24  410  	struct device *dev = rsnd_priv_to_dev(priv);
cb2f97d89f383da sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-06-02  411  	struct clk *clk;
d6956a7dde6fbf8 sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-05-24  412  
cb2f97d89f383da sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-06-02  413  	clk = clk_register_fixed_rate(dev, name, parent, 0, 0);
cc64c390b215b40 sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-08-20  414  	if (IS_ERR_OR_NULL(clk)) {
cb2f97d89f383da sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-06-02  415  		dev_err(dev, "create null clk error\n");
cc64c390b215b40 sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-08-20 @416  		return ERR_CAST(clk);

This driver doesn't check for error pointers in the right way.
https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/

If a function returns NULL and error pointers the NULL generally means
it's an optional feature.  For example, an ethernet card can transmit
packets just fine without blinking LEDs.  The driver has to be written
to handle the NULL pointer.

Here I guess clk_register_fixed_rate() is optional and has been
deliberately turned off but we're printing an error and then returning
NULL back to the caller.  The callers check for NULL and change it to
an -EIO.  It's shouldn't print an error if it's deliberate.  Or if the
driver can't operate without the feature then that dependency should be
enforced in the Kconfig.

cb2f97d89f383da sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-06-02  417  	}
d6956a7dde6fbf8 sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-05-24  418  
cb2f97d89f383da sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-06-02  419  	return clk;
cb2f97d89f383da sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-06-02  420  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

