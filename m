Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33501CFBE
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Sep 2023 09:42:48 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-404539209ffso4334375e9.0
        for <oe-kbuild@lists.linux.dev>; Thu, 14 Sep 2023 02:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694684567; x=1695289367; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e79AxxqvaKxscXpWrC8zFpV1pjtk8fd1wWMBPNImWp8=;
        b=XXXj4FzvJXCOzuQVTDyi8cHZgg3bS0MZrWJ+9xidrnyQMjJVJAlmjOXt9JxV9B/IWm
         3ejiJlCuD1vYFn8NPXeHLXAiYZpI/fehR2RIkkaWtGQ4UrpbTcN7we05lr3rMkxHh1wh
         vEyQJdumZ/WUzzSZ1XV4OGlGHGEMOxAxDp8byazDREeQc7Cnn6Zoxfaumm8ub1zH2BKo
         fXoJUQV02vPalzQ9xbxpSNZDhMVSlQqqmqLrkQE7/kKZBXfxL3uUVlZVBzRFubEMtSeZ
         JMPgeO/7qWRvIXeDkHD1S0RT0gBGYBJRVjFE4EN4lHlhgPzTEZ1LoHV2PmY0MPBjXeZ7
         vdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694684567; x=1695289367;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e79AxxqvaKxscXpWrC8zFpV1pjtk8fd1wWMBPNImWp8=;
        b=kV4C12DWmmOonS0hRy3zcJHHPKSK9z7wLmPNMNG7BgayB8NRd4B3VSxnf7waajlQi0
         NWkfSwPN9UR6R1OWChFCyi91OQXOc3Q2bnosVLvADnyFtH4fdyayr4EWwM0L5/EbZaby
         QH6HBsuX0HTYL+XbdNUv1NlZjROm8y/FTmhwzNZxPga2rpKc+qbA/gW8wDYsakscrUUN
         tt3iiu3gpVh6Vmxg5U139rhyd6tEFOwRZO6XjYXR0Ek6/UdvLWCkWkTv4YpNSM63liyE
         LprCfow+TVrL1Y3ZzinJht/pC6sN5hEhdamMIbfJIYIxxSmpSodYVR+gOndGw7YkSgvF
         ZzzQ==
X-Gm-Message-State: AOJu0Ywzm6hCrmJyRlvjHJSLZZzwUyPgqONvZAwXVHtXR0jTIpL0q7pK
	iLFVHQt/CccLDZTaMQbJLqzEXSauYerVJI7MWEI=
X-Google-Smtp-Source: AGHT+IHPg/5FSiHTkyA8sddZuzL6C1Ak5pWyICp7hrZAnPIFd0J3O5JPk3zeKZNww13xu6OmHaXKTA==
X-Received: by 2002:a7b:c012:0:b0:402:906:1e87 with SMTP id c18-20020a7bc012000000b0040209061e87mr4170200wmb.31.1694684566871;
        Thu, 14 Sep 2023 02:42:46 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n12-20020a05600c294c00b003ff3b964a9asm4343857wmd.39.2023.09.14.02.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 02:42:46 -0700 (PDT)
Date: Thu, 14 Sep 2023 12:42:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 02/54] ASoC: simple_card_utils.h: convert not to use
 asoc_xxx()
Message-ID: <3def750c-5f58-4c36-a58b-bd839a38d3a7@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87edj4s26a.wl-kuninori.morimoto.gx@renesas.com>

Hi Kuninori,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuninori-Morimoto/ASoC-simple_card_utils-h-convert-not-to-use-asoc_xxx/20230912-084751
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/87edj4s26a.wl-kuninori.morimoto.gx%40renesas.com
patch subject: [PATCH 02/54] ASoC: simple_card_utils.h: convert not to use asoc_xxx()
config: i386-randconfig-141-20230914 (https://download.01.org/0day-ci/archive/20230914/202309141205.ITZeDJxV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230914/202309141205.ITZeDJxV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202309141205.ITZeDJxV-lkp@intel.com/

smatch warnings:
sound/soc/generic/simple-card-utils.c:313 simple_util_startup() warn: missing unwind goto?

vim +313 sound/soc/generic/simple-card-utils.c

674d245538be0d Kuninori Morimoto 2023-09-11  279  int simple_util_startup(struct snd_pcm_substream *substream)
f38df5bf0c9cb9 Kuninori Morimoto 2019-03-20  280  {
9ae035e289379b Kuninori Morimoto 2020-07-20  281  	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
f38df5bf0c9cb9 Kuninori Morimoto 2019-03-20  282  	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(rtd->card);
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  283  	struct simple_dai_props *props = simple_priv_to_props(priv, rtd->num);
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  284  	struct asoc_simple_dai *dai;
5ca2ab4598179a Robert Hancock    2022-01-20  285  	unsigned int fixed_sysclk = 0;
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  286  	int i1, i2, i;
f38df5bf0c9cb9 Kuninori Morimoto 2019-03-20  287  	int ret;
f38df5bf0c9cb9 Kuninori Morimoto 2019-03-20  288  
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  289  	for_each_prop_dai_cpu(props, i1, dai) {
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  290  		ret = asoc_simple_clk_enable(dai);
f38df5bf0c9cb9 Kuninori Morimoto 2019-03-20  291  		if (ret)
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  292  			goto cpu_err;
5ca2ab4598179a Robert Hancock    2022-01-20  293  		ret = asoc_simple_check_fixed_sysclk(rtd->dev, dai, &fixed_sysclk);
5ca2ab4598179a Robert Hancock    2022-01-20  294  		if (ret)
5ca2ab4598179a Robert Hancock    2022-01-20  295  			goto cpu_err;
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  296  	}
f38df5bf0c9cb9 Kuninori Morimoto 2019-03-20  297  
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  298  	for_each_prop_dai_codec(props, i2, dai) {
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  299  		ret = asoc_simple_clk_enable(dai);
f38df5bf0c9cb9 Kuninori Morimoto 2019-03-20  300  		if (ret)
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  301  			goto codec_err;
5ca2ab4598179a Robert Hancock    2022-01-20  302  		ret = asoc_simple_check_fixed_sysclk(rtd->dev, dai, &fixed_sysclk);
5ca2ab4598179a Robert Hancock    2022-01-20  303  		if (ret)
5ca2ab4598179a Robert Hancock    2022-01-20  304  			goto codec_err;
5ca2ab4598179a Robert Hancock    2022-01-20  305  	}
5ca2ab4598179a Robert Hancock    2022-01-20  306  
5ca2ab4598179a Robert Hancock    2022-01-20  307  	if (fixed_sysclk && props->mclk_fs) {
5ca2ab4598179a Robert Hancock    2022-01-20  308  		unsigned int fixed_rate = fixed_sysclk / props->mclk_fs;
5ca2ab4598179a Robert Hancock    2022-01-20  309  
5ca2ab4598179a Robert Hancock    2022-01-20  310  		if (fixed_sysclk % props->mclk_fs) {
5ca2ab4598179a Robert Hancock    2022-01-20  311  			dev_err(rtd->dev, "fixed sysclk %u not divisible by mclk_fs %u\n",
5ca2ab4598179a Robert Hancock    2022-01-20  312  				fixed_sysclk, props->mclk_fs);
5ca2ab4598179a Robert Hancock    2022-01-20 @313  			return -EINVAL;

goto codec_err?

5ca2ab4598179a Robert Hancock    2022-01-20  314  		}
5ca2ab4598179a Robert Hancock    2022-01-20  315  		ret = snd_pcm_hw_constraint_minmax(substream->runtime, SNDRV_PCM_HW_PARAM_RATE,
5ca2ab4598179a Robert Hancock    2022-01-20  316  			fixed_rate, fixed_rate);
635071f5fee315 Robert Hancock    2023-06-01  317  		if (ret < 0)
5ca2ab4598179a Robert Hancock    2022-01-20  318  			goto codec_err;
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  319  	}
f38df5bf0c9cb9 Kuninori Morimoto 2019-03-20  320  
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  321  	return 0;
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  322  
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  323  codec_err:
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  324  	for_each_prop_dai_codec(props, i, dai) {
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  325  		if (i >= i2)
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  326  			break;
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  327  		asoc_simple_clk_disable(dai);
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  328  	}
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  329  cpu_err:
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  330  	for_each_prop_dai_cpu(props, i, dai) {
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  331  		if (i >= i1)
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  332  			break;
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  333  		asoc_simple_clk_disable(dai);
fafc05aadd4b6c Kuninori Morimoto 2021-04-12  334  	}
f38df5bf0c9cb9 Kuninori Morimoto 2019-03-20  335  	return ret;
f38df5bf0c9cb9 Kuninori Morimoto 2019-03-20  336  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

