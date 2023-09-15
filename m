Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5852611C
	for <oe-kbuild@lists.linux.dev>; Fri, 15 Sep 2023 06:39:35 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-31c7912416bso1601591f8f.1
        for <oe-kbuild@lists.linux.dev>; Thu, 14 Sep 2023 23:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694759974; x=1695364774; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iTvz/7YrGXBBG3/XgDpueAsB2wVewc4vUbof5jngdtw=;
        b=crWNqShyWn9PcUByFUsTPNkUqy5aeYublsggP/uqBr7kipeqZl1Vr+wveUtyzxix9I
         hbLEEJh7LGbe/bzhMfSLv9LAyP/AARFqurI2/ypNMwSZih7aK9Ko9Q0G8npEj5D6SRAn
         GmHJAdZytgZ1OejTxqL+VjmFao9BbzGz0tV1McMJwLWCNF0y0qu3piY3ZVXn8y3+DkD2
         z3ljjfXstmakc8ZcwsuWJHkTFF2LGDlS1zYr8jMKT5iFvvIFkvM6ETskElRnXdX5qO2E
         p/KWBkl2d2eNjlBSFYFNq867Kx+RgH1olSrGhC007R+7Mw6mZHoI/BrgulbeRhB4meoA
         a8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694759974; x=1695364774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iTvz/7YrGXBBG3/XgDpueAsB2wVewc4vUbof5jngdtw=;
        b=oRiRFv8bLR8Vad3aVcYIixbyV27qE48cO2xr41w53WHoeiHLiuceIpVOhXTrLhiGFO
         e0WJp/yzAxWnYPqhG0TDbeDnpyuYqI0X5cROtnts6Prdu07dCKr1E2/TrY7m23YYAxUm
         HAzbDLHgCEXmjWscdiJaKtb1FmTJ7gNV/hdt8KQUvGTMX+AUHW3hq67gl1tXHC5siJfO
         V1VBXngVWmbw4YmTh/5idVhB4/3wDii8XhImC4fUce0I9ShCS748igk8oD92JskiUBGA
         H7cO+jGEJw2ldj+YTBaxpcmucNRU6Sh8CD44cxuj6CxTlMHumrNzxEdIgQBcD5QJnSYC
         k3bg==
X-Gm-Message-State: AOJu0YxqIRgKn0xaPcsXMCE2uLbDm6yHrxaPVoREbP1RYCCfFP8mDyMe
	mgBCNwtki7aAzRBC8NyVNe/kSA==
X-Google-Smtp-Source: AGHT+IEq+d+DobvWyQp3Y+xzHX1/5fJhxIphESRsiOJ85Fg497Atqyldi/+PGTfAwHwISmsSbsPArA==
X-Received: by 2002:adf:f110:0:b0:319:7c7d:8d1 with SMTP id r16-20020adff110000000b003197c7d08d1mr579352wro.44.1694759973935;
        Thu, 14 Sep 2023 23:39:33 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t18-20020a5d5352000000b0031c3ee933b5sm3562792wrv.108.2023.09.14.23.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 23:39:33 -0700 (PDT)
Date: Fri, 15 Sep 2023 09:39:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 25/54] ASoC: generic: convert not to use asoc_xxx()
Message-ID: <f8790567-237c-4424-b185-9862a168c91d@kadam.mountain>
References: <87h6o0qnho.wl-kuninori.morimoto.gx@renesas.com>
 <3a818c96-8056-44ea-bc62-7104606da2ed@kadam.mountain>
 <871qf0qrwk.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871qf0qrwk.wl-kuninori.morimoto.gx@renesas.com>

On Thu, Sep 14, 2023 at 11:03:23PM +0000, Kuninori Morimoto wrote:
> 
> Hi Dan
> 
> Thank you for the report
> 
> > fa558c2801fc17 Kuninori Morimoto   2013-11-20  753  	} else {
> > 88c819af51a9cc Kuninori Morimoto   2023-09-11  754  		struct simple_util_info *cinfo;
> > f107294c6422e7 Kuninori Morimoto   2019-06-06  755  		struct snd_soc_dai_link_component *cpus;
> > 710af9196ce614 Kuninori Morimoto   2018-08-31  756  		struct snd_soc_dai_link_component *codecs;
> > e58f41e41185c6 Kuninori Morimoto   2018-08-31  757  		struct snd_soc_dai_link_component *platform;
> > 65a5056b21202e Kuninori Morimoto   2019-03-20  758  		struct snd_soc_dai_link *dai_link = priv->dai_link;
> > 65a5056b21202e Kuninori Morimoto   2019-03-20  759  		struct simple_dai_props *dai_props = priv->dai_props;
> > 65a5056b21202e Kuninori Morimoto   2019-03-20  760  
> > ca65b492c7a265 Jean-Francois Moine 2014-01-15  761  		cinfo = dev->platform_data;
> > ca65b492c7a265 Jean-Francois Moine 2014-01-15  762  		if (!cinfo) {
> > f89983ef61677a Kuninori Morimoto   2012-12-25  763  			dev_err(dev, "no info for asoc-simple-card\n");
> > f2390880ec0264 Kuninori Morimoto   2012-04-08  764  			return -EINVAL;
> > 
> > goto err?
> > 
> > f2390880ec0264 Kuninori Morimoto   2012-04-08  765  		}
> > f2390880ec0264 Kuninori Morimoto   2012-04-08  766  
> > f2390880ec0264 Kuninori Morimoto   2012-04-08  767  		if (!cinfo->name ||
> > fa558c2801fc17 Kuninori Morimoto   2013-11-20  768  		    !cinfo->codec_dai.name ||
> > 7722f830a45f7f Jean-Francois Moine 2014-01-15  769  		    !cinfo->codec ||
> > 7722f830a45f7f Jean-Francois Moine 2014-01-15  770  		    !cinfo->platform ||
> > 7722f830a45f7f Jean-Francois Moine 2014-01-15  771  		    !cinfo->cpu_dai.name) {
> > 88c819af51a9cc Kuninori Morimoto   2023-09-11  772  			dev_err(dev, "insufficient simple_util_info settings\n");
> > f2390880ec0264 Kuninori Morimoto   2012-04-08 @773  			return -EINVAL;
> > 
> > goto err?
> 
> Thank you for pointing it, but it is correct.
> This driver is supporting both "DT sytle" and "platform data style"
> and "DT style" error only need to use "goto err".

Currently, this check looks at if there is a return surrounded by goto
cleanup.  I could silence this false positive by adding a check that
it has to be surrounded but also we have to have goto in our path
earlier.  In this case, the goto cleanup was on the if true side and
we are on the if false side.

It's a little bit of work to write this code but it's doable.  I'll add
it to my TODO list (and then probably forget about it forever honestly.
:P).

KTODO: Modifiy smatch to silence goto unwind false positive

regards,
dan carpenter
