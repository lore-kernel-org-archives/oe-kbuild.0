Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE2F36C0AC
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Jan 2026 06:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768890126; cv=none; b=nDKB+7hjBxtJjcYA/9rLJFQJS5cjYzjzlsFStl4RScRC84J1QN1Wq2hlULRcI9dFQ9PpWS+cDEGggNqN+Epx9xVVPtzHoEpQoEKhgmcltpCqN3gvEo2ld3ofJF5FkLLXssphzkKmkPwVEsnYSHUlstWh7k1iK8qcz9ogxdXWhF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768890126; c=relaxed/simple;
	bh=1ag5yhK2pzA2YXeOLuPeEPZIPT1YwYQUzomD839uEXw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JxrlhnVCZ5IxPTmZohO5eZm6jB9PrTb/QN5tt4Q51SNL+85C5uoDQGSZh9oVNJ/s3f/4N/aLGywp85Ynxsf90HSU+l5rMabbNRYPcIyPtK/QMLJMq+U0cZ1kiGNgVmseWqwoCT8reiq2FWsuWO0X0f7KCi/xAXTays6j6giurzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lx69Vi7W; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lx69Vi7W"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4801bc32725so23691925e9.0
        for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 22:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768890123; x=1769494923; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wqcCKSyPCqADRPm0OZTWiOZxxfMu7XITKXeHqCYF8Y0=;
        b=lx69Vi7WoigvQELMcoxXd1+gagq8bblLc5Bibkctj/8bRAa4m5YVbVHbyxzVlBSQgI
         +kPDzTU1YvQb+GSHGtawN60gMdsTQghcoeelfDDzH+k2c1LL/1PF0S5LJ2/Xtb6GdUR5
         +VidkaY+aE7i2vm53qMk9ufkyh+M09ylsTtzyKFYN83RI4xqHaMpKWyjkF1ikdZb6LjI
         HisabSPfyCkCmuaycCN7oBnnZJizhc2J3cL9zmr+1r2ngXzaexCnlIptPhEN2KkOUonG
         iA3r4AwAerTemf0Wx3uxYYh4gC6boARa4xvSFHQeue0yrkuePX5cvJpEbXsMJksZcI0H
         Wk0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768890123; x=1769494923;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wqcCKSyPCqADRPm0OZTWiOZxxfMu7XITKXeHqCYF8Y0=;
        b=q1jqt3jZ+br85pw0S7yhg8fYqUYvZbB878RpaFPYUBG8Jnmq6dqgIrgwH44UBcbzky
         hobnM+3I/ofYu34u7TlqG3LJGVt5ozTpVbTsH0hUJbJIzOgmUZhzCQrgVMHmhN4bhnT0
         LToRBrY60ePteOxtmhZmO0/bWCLLLSnI6nZrw95wZ0hh2jn3wUeigV8WEnnSZpFjdkvE
         4qRAFT28s6KeT/pAQKILUxCAG+g8Y3B88jkkw4iqBIyVtbpbJMP+rWgH0S0EryJnQYsF
         +9tgyBKq91hAPfm4N6fM63veALqwYjYl5AY+YSfWMsxi1raGAaUw2Nm/+nF+C2f0iHIU
         k5ag==
X-Gm-Message-State: AOJu0Yy5krExRN9d63gQs7ySqchrYH9aZLbTbGa4QogtFppkv91zR2XY
	UfmVjvcKuuKNx6TzAtaY75zRf3l6zcLnZVVxqfHnBYNE1irKwL1904cHMjk8NOfOkHVvYowphYY
	MUiaE
X-Gm-Gg: AY/fxX74kvqM8ncmyQV3CeS+EWknZvNtoPKkMbXKk3x1kSyY0WdHhvAZ0pofEB2xsyK
	i16GGy5SL+WUbwy3nLjgCuXXW6kN6jINg/5RQxlZgybcmTthRZnNH00WGcrHwRCow9/bgxVT5BE
	N8q090J7pUOZUwgEPgreYdT9Z79EgyKLlOOwm6KNJx4CFvdzYHx/6efbr7gcVkHU8AOoijbcxVB
	NCVlVJHcFA6tuuv0nWW/Cnt0Cv013/8vtLQsfhMqE0vqcrUZwD/Ehrq8w/4iWm3qrTBO90oFDfa
	DLM2Qy1aoBoxqrr6cTqErB9d2GVrPkxvGs41Wp72eR8f8TM0oTyks9va3amZxaAsZ3rq7ychdpR
	wj/fvLZlNqHpCFQzoMRc8hQZMftWk/ybf4AfmDvrAMCk8c7koeGQAUbZcNHIP1gZi2Jz2DSskCF
	Ld+Gl+NYNKkCPUqaz7
X-Received: by 2002:a05:600c:310e:b0:47d:885d:d2ff with SMTP id 5b1f17b1804b1-4801eb11002mr159745445e9.29.1768890122511;
        Mon, 19 Jan 2026 22:22:02 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4358f12ee69sm2389711f8f.11.2026.01.19.22.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:22:02 -0800 (PST)
Date: Tue, 20 Jan 2026 09:21:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 196/196]
 sound/soc/codecs/hdmi-codec.c:587 hdmi_codec_prepare() error: __memcpy()
 'hcp->iec_status' too small (5 vs 24)
Message-ID: <202601192317.zYZXE5wG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260120062159.d9CLHHKMUkdIg919pLhnl_9dAWqp3-cwFB7O1-qmOk4@z>

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   625d1a188a3d8cbd1f0897f44e0984dae1711754
commit: 9eda09e511f648adf90efdb805e2429bf5bc25cb [196/196] UPSTREAM: ASoC: hdmi-codec: Add a prepare hook
config: x86_64-randconfig-161-20260114 (https://download.01.org/0day-ci/archive/20260119/202601192317.zYZXE5wG-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601192317.zYZXE5wG-lkp@intel.com/

New smatch warnings:
sound/soc/codecs/hdmi-codec.c:587 hdmi_codec_prepare() error: __memcpy() 'hcp->iec_status' too small (5 vs 24)

Old smatch warnings:
sound/soc/codecs/hdmi-codec.c:551 hdmi_codec_hw_params() error: __memcpy() 'hcp->iec_status' too small (5 vs 24)

vim +587 sound/soc/codecs/hdmi-codec.c

9eda09e511f648 Maxime Ripard    2021-05-25  565  static int hdmi_codec_prepare(struct snd_pcm_substream *substream,
9eda09e511f648 Maxime Ripard    2021-05-25  566  			      struct snd_soc_dai *dai)
9eda09e511f648 Maxime Ripard    2021-05-25  567  {
9eda09e511f648 Maxime Ripard    2021-05-25  568  	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
9eda09e511f648 Maxime Ripard    2021-05-25  569  	struct hdmi_codec_daifmt *cf = dai->playback_dma_data;
9eda09e511f648 Maxime Ripard    2021-05-25  570  	struct snd_pcm_runtime *runtime = substream->runtime;
9eda09e511f648 Maxime Ripard    2021-05-25  571  	unsigned int channels = runtime->channels;
9eda09e511f648 Maxime Ripard    2021-05-25  572  	unsigned int width = snd_pcm_format_width(runtime->format);
9eda09e511f648 Maxime Ripard    2021-05-25  573  	unsigned int rate = runtime->rate;
9eda09e511f648 Maxime Ripard    2021-05-25  574  	struct hdmi_codec_params hp;
9eda09e511f648 Maxime Ripard    2021-05-25  575  	int ret;
09184118a8abae Jyri Sarha       2016-03-31  576  
9eda09e511f648 Maxime Ripard    2021-05-25  577  	if (!hcp->hcd.ops->prepare)
9eda09e511f648 Maxime Ripard    2021-05-25  578  		return 0;
9eda09e511f648 Maxime Ripard    2021-05-25  579  
9eda09e511f648 Maxime Ripard    2021-05-25  580  	dev_dbg(dai->dev, "%s() width %d rate %d channels %d\n", __func__,
9eda09e511f648 Maxime Ripard    2021-05-25  581  		width, rate, channels);
9eda09e511f648 Maxime Ripard    2021-05-25  582  
9eda09e511f648 Maxime Ripard    2021-05-25  583  	ret = hdmi_codec_fill_codec_params(dai, width, rate, channels, &hp);
9eda09e511f648 Maxime Ripard    2021-05-25  584  	if (ret < 0)
9eda09e511f648 Maxime Ripard    2021-05-25  585  		return ret;
9eda09e511f648 Maxime Ripard    2021-05-25  586  
9eda09e511f648 Maxime Ripard    2021-05-25 @587  	memcpy(hp.iec.status, hcp->iec_status, sizeof(hp.iec.status));

Read overflow.  hp.iec.status is bigger than hcp->iec_status.

9eda09e511f648 Maxime Ripard    2021-05-25  588  	ret = snd_pcm_fill_iec958_consumer(runtime, hp.iec.status,
9eda09e511f648 Maxime Ripard    2021-05-25  589  					   sizeof(hp.iec.status));
9eda09e511f648 Maxime Ripard    2021-05-25  590  	if (ret < 0) {
9eda09e511f648 Maxime Ripard    2021-05-25  591  		dev_err(dai->dev, "Creating IEC958 channel status failed %d\n",
9eda09e511f648 Maxime Ripard    2021-05-25  592  			ret);
9eda09e511f648 Maxime Ripard    2021-05-25  593  		return ret;
9eda09e511f648 Maxime Ripard    2021-05-25  594  	}
9eda09e511f648 Maxime Ripard    2021-05-25  595  
9eda09e511f648 Maxime Ripard    2021-05-25  596  	cf->bit_fmt = runtime->format;
9eda09e511f648 Maxime Ripard    2021-05-25  597  	return hcp->hcd.ops->prepare(dai->dev->parent, hcp->hcd.data,
0cf4610b9f297e Jerome Brunet    2019-05-06  598  				     cf, &hp);
09184118a8abae Jyri Sarha       2016-03-31  599  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

