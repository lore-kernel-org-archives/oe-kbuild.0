Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAA5101C7
	for <oe-kbuild@lists.linux.dev>; Fri, 15 Sep 2023 11:09:38 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-31ff1f3cde5so513705f8f.2
        for <oe-kbuild@lists.linux.dev>; Fri, 15 Sep 2023 04:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694776176; x=1695380976; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9OIL8kgYAMfq0IMmuWMsYcVKfDNOQ2RMSRiPs/DxG1c=;
        b=bTeXhoUcc7bam6fM7prGgE0/8pcn4iQoEVXcUABgDqXq+yPyMubQFFN/kD/U5U2wEq
         TrMDjHIOBRWRxcwYfARW0l7S6wXNOynk0cGmy0vKx/ZAePb+mZeebonCd4Y9zHilWVMS
         fY0XaJOyi70t7MAHMzqTTiJngZLx6TlDnuSXnJMpKXUji8KW5/5183E/w1wqZIeErhwh
         3Ay79Q2MuStS7EB9Fib1HeSzP7NZQUVzeM/GwEsikxrJdfAnZF9/3Mimp2P5xSMWR7n/
         oeSL95owGss9dx7ZBR1m4FkgzUBL9OAGJJPJAwwhOvqK6/7UdUTqkxQ3xAoBhznxNYDc
         Ssug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694776176; x=1695380976;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9OIL8kgYAMfq0IMmuWMsYcVKfDNOQ2RMSRiPs/DxG1c=;
        b=e8gBLeTKipIXdTcUb93VCNfuiSJLQbdJV5eXjOKkTXaKEASbYBqRAHdyoqQv5ZRiGC
         9EkW+Ay0zAA28pN7bSRnOCVBllPITXGDYa/6wo0mDClYlTjZktfcb8LYdCzfnxdGms0P
         XWzdwnhgdzL+LVlUFY0UQCY09QF+I94nRRH3XSOwS71Y33EjWweQONIUOm+aVyB/OI53
         LymecLPnGNWffkn1pKg8rj9flvvlHIv7I/to4QrG27DBrse5EICp+6aRuMdPW8aURogc
         IrwocRPnjFF+MIMEGSUl9/UNLtnX854O/wmqeUOs+19wz/Jay6B2dTjJEtS9Mq7YZ+Ew
         4eUw==
X-Gm-Message-State: AOJu0YxXiBDpwPMbwRClTOIrmJFelbCEBtVvP6uvPWsa9Zo1hnjuUMIr
	4ytatEExiyvbDsqFe1YRBD84/rFabUX5L+64wEw=
X-Google-Smtp-Source: AGHT+IFWqXSEBtAjtwZTwHrGfjiAaO3XLBvj9oZD7BkcgWwCkBqMUsXUJ6PIdIqFxspMg0Vne4EfBQ==
X-Received: by 2002:a5d:5149:0:b0:319:62e0:f2fe with SMTP id u9-20020a5d5149000000b0031962e0f2femr1209037wrt.36.1694776176449;
        Fri, 15 Sep 2023 04:09:36 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y14-20020a5d4ace000000b003176eab8868sm4221771wrs.82.2023.09.15.04.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 04:09:36 -0700 (PDT)
Date: Fri, 15 Sep 2023 14:09:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Robert Hancock <robert.hancock@calian.com>
Subject: Re: [PATCH] ASoC: simple-card-utils: fixup simple_util_startup()
 error handling
Message-ID: <6dcf84d9-aff9-406e-95b6-2ab217d3003e@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zg1opcwt.wl-kuninori.morimoto.gx@renesas.com>

Hi Kuninori,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuninori-Morimoto/ASoC-simple-card-utils-fixup-simple_util_startup-error-handling/20230915-071518
base:   linus/master
patch link:    https://lore.kernel.org/r/87zg1opcwt.wl-kuninori.morimoto.gx%40renesas.com
patch subject: [PATCH] ASoC: simple-card-utils: fixup simple_util_startup() error handling
config: x86_64-randconfig-161-20230915 (https://download.01.org/0day-ci/archive/20230915/202309151840.au9Aa2W4-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230915/202309151840.au9Aa2W4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202309151840.au9Aa2W4-lkp@intel.com/

smatch warnings:
sound/soc/generic/simple-card-utils.c:313 asoc_simple_startup() warn: missing error code 'ret'

vim +/ret +313 sound/soc/generic/simple-card-utils.c

f38df5bf0c9cb9 Kuninori Morimoto 2019-03-20  279  int asoc_simple_startup(struct snd_pcm_substream *substream)
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
2f7ac863515034 Kuninori Morimoto 2023-09-14 @313  			goto codec_err;

error code?

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

