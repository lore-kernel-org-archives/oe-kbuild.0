Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4146922A7E9
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Apr 2025 07:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010162; cv=none; b=T3LImhxUHQyv4JoFlPGeXK86uY440ffZax9bKjsRy6N0McD5qx4MfEQ9yHalwGY+t6KjjqsacSlhn3fJ8vZDNgqOipXSVGhPpuqtcp74je6ZWNACsZSHJEwPOs+GUyAgk/VyHZuAIkUwDUlBOq4D1dccrwLt1mE+1E3PK1JKGy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010162; c=relaxed/simple;
	bh=TFHb9jwv0UJ9scWKxpEMq9nwa38PClYIeK+KBhs32os=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tcgaRGEwcbf997qLh6UvuI1a8C+J3wn3c1ek3SdfXCQibQkwN7hz1q9lFSfu+bY1EGi/j/Fyv7oiIpjXLHRpF9q++9fuJP9ky4WDElTBvV35s5+nqq91KGX+suVJsZ0Ql10yh9tmZCs3xDu66w+Ta8KE2TObXFKCK0fhHtGQk4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=enFtYer6; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="enFtYer6"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so25602005e9.1
        for <oe-kbuild@lists.linux.dev>; Mon, 07 Apr 2025 00:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744010158; x=1744614958; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A6xaQ0k8E/GTOsok41VClhYmiK7cHYHv73jrSD8IYao=;
        b=enFtYer6cEKvbUmir6G30gVitRqJFwRRTJjjNgMfg+43u2Su9N0zX4SuGuZtCtDQ0o
         stfycz+xyDld1YFjBUpHXxNhhtaxOmfCQL3CujazQw4NNgRxHztbkWI3M032gr3V27PJ
         0br9Fp4kAtQtjBZLwXIAC+OJcCV74knhIZUSFapYmbP2Wmp6CGPLmF1giL5B0xRe3yG2
         ucekcO9vzbye0NYMwJ9wNAewoh8s0REhK9vzubfO57UngdAxvFjMTMb0QeAWwbgS5gA5
         4dGZx0eqCRamsTnDQWh2UXwOp02l9DoDYkxieK7Rv4l9wm0ua/YRJ1sX3T+85tpCX8k4
         8jIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010158; x=1744614958;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A6xaQ0k8E/GTOsok41VClhYmiK7cHYHv73jrSD8IYao=;
        b=XlY4/fZPduzs7/tGWhiLysh4t7+fW+8f5u4qOMnDI8FWvaQgrI1LriGPTtyWHBXQp8
         SEjc8hfEFtgBjtFXULVm8D7WN8l/hYMeviuTb3kJKVZkqylB1Iq6FN49Kq4Bjs7OhrzO
         +3JhR1zbN6AoJbvbJlKArgk0rAiwrq1dBltF6tIaCRdLF+cSMFSAuLTe+UvXy3wOqppF
         UH7E1VMF/1QW65bYflV9BLopp+I72Ele0K9Cbx+9WP4xY1lpAv/4bckvqacBvnsOrxHy
         zh+bat4kK4hL1+owDeQYino8Rkw95wFoAGFcAZbWR3J8je/FdBxrYrhUNTqPfDeWBm/v
         dleg==
X-Gm-Message-State: AOJu0YyPqgjB/PenE46Gq+gaD/xEiKQawWgTlaQ1ETlauLVkkmAGteLA
	naM143mOo0Gc1hZhLm/NfDDE8+oxRR2TQf5UgqMWkz+3zsWz0x4Su5vtac1hzLFABmwlBX0sN/H
	e
X-Gm-Gg: ASbGncusMS/wkmRGu55QOZneNGTX/qNaExeMMqaQf7/zkR1fSf2PgBIdVdH1Q6ZjXTs
	GiDVNaPSwNh+4fggG9tSs5cEgqjwIrEAY6SSxRc+pnx8wj0diQI0UTBiU8iFZCRZfJ4flskz327
	Hp5XD6koDNxaT8LTovVblCxOw0bVADOkRfXfgDqB6FnOfyb5BPI+vOMgJ86/EXRZfW4PJPsvrtr
	jYfQRe7dmk1IbB36j9pAqk2d7ORix+R1fEWApnbwiEfyAvoakkX4FSdDhEi7so0UWmiZzXypYMS
	8/zB/B5tdR04ahmqSEXNIYce6hM/S8XgYTBBRw8CgHE5zYpmSg==
X-Google-Smtp-Source: AGHT+IE0yvUp003v7ANegxVMAf+lXFywEGIzWlDTx8NnJOOMHWUiiwpPL+cDtZZw/dVy3RRRVB84Iw==
X-Received: by 2002:a05:600c:3484:b0:43e:afca:808f with SMTP id 5b1f17b1804b1-43ed0db4006mr113880375e9.31.1744010157861;
        Mon, 07 Apr 2025 00:15:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ec366a699sm119704075e9.38.2025.04.07.00.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:15:57 -0700 (PDT)
Date: Mon, 7 Apr 2025 10:15:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-msiof-2025-03-26 21/24]
 sound/soc/renesas/rcar/msiof.c:367 msiof_open() warn: passing zero to
 'PTR_ERR'
Message-ID: <42101bfa-e3e7-4ae0-9c9e-c37593b8ece9@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-msiof-2025-03-26
head:   ba9316799e85a9ef14dd8a3e5580be4c97149576
commit: adf5f819442084ec2b0ea13a5834b05d10750e24 [21/24] ASoC: renesas: add MSIOF sound support
config: openrisc-randconfig-r071-20250407 (https://download.01.org/0day-ci/archive/20250407/202504070441.9TXJ68nR-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202504070441.9TXJ68nR-lkp@intel.com/

smatch warnings:
sound/soc/renesas/rcar/msiof.c:367 msiof_open() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +367 sound/soc/renesas/rcar/msiof.c

adf5f819442084e Kuninori Morimoto 2025-03-24  356  static int msiof_open(struct snd_soc_component *component,
adf5f819442084e Kuninori Morimoto 2025-03-24  357  		      struct snd_pcm_substream *substream)
adf5f819442084e Kuninori Morimoto 2025-03-24  358  {
adf5f819442084e Kuninori Morimoto 2025-03-24  359  	struct device *dev = component->dev;
adf5f819442084e Kuninori Morimoto 2025-03-24  360  	struct dma_chan *chan;
adf5f819442084e Kuninori Morimoto 2025-03-24  361  	static const char *dma_names[] = {"rx", "tx"};
adf5f819442084e Kuninori Morimoto 2025-03-24  362  	int is_play = msiof_is_play(substream);
adf5f819442084e Kuninori Morimoto 2025-03-24  363  	int ret;
adf5f819442084e Kuninori Morimoto 2025-03-24  364  
adf5f819442084e Kuninori Morimoto 2025-03-24  365  	chan = of_dma_request_slave_channel(dev->of_node, dma_names[is_play]);
adf5f819442084e Kuninori Morimoto 2025-03-24  366  	if (IS_ERR_OR_NULL(chan))

of_dma_request_slave_channel() can't return NULL, but the zero-day bot
doesn't do cross function analysis and the IS_ERR_OR_NULL() check tricks
Smatch into thinking "chan" can be NULL.

adf5f819442084e Kuninori Morimoto 2025-03-24 @367  		return PTR_ERR(chan);
adf5f819442084e Kuninori Morimoto 2025-03-24  368  
adf5f819442084e Kuninori Morimoto 2025-03-24  369  	ret = snd_dmaengine_pcm_open(substream, chan);
adf5f819442084e Kuninori Morimoto 2025-03-24  370  	if (ret < 0)
adf5f819442084e Kuninori Morimoto 2025-03-24  371  		goto open_err_dma;
adf5f819442084e Kuninori Morimoto 2025-03-24  372  
adf5f819442084e Kuninori Morimoto 2025-03-24  373  	snd_soc_set_runtime_hwparams(substream, &msiof_pcm_hardware);
adf5f819442084e Kuninori Morimoto 2025-03-24  374  
adf5f819442084e Kuninori Morimoto 2025-03-24  375  	ret = snd_pcm_hw_constraint_integer(substream->runtime, SNDRV_PCM_HW_PARAM_PERIODS);
adf5f819442084e Kuninori Morimoto 2025-03-24  376  
adf5f819442084e Kuninori Morimoto 2025-03-24  377  open_err_dma:
adf5f819442084e Kuninori Morimoto 2025-03-24  378  	if (ret < 0)
adf5f819442084e Kuninori Morimoto 2025-03-24  379  		dma_release_channel(chan);
adf5f819442084e Kuninori Morimoto 2025-03-24  380  
adf5f819442084e Kuninori Morimoto 2025-03-24  381  	return ret;
adf5f819442084e Kuninori Morimoto 2025-03-24  382  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

