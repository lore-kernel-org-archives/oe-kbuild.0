Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55993644A2
	for <oe-kbuild@lists.linux.dev>; Wed, 27 May 2026 19:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779908983; cv=none; b=WFVX2kEKoQ4gD/6DviTT2DnY1BR3X6hxw/mIWHXvjIalc3a747Nm/sR0y2QpqYmywMhZPoLIraHKzXG5gMo0SgvZ27XLLwsLgQdoLkkKkIU8BOsqI2QaAnU0mD6sAkBV03NnZmeCio6O9BAqt2+syVEpwQMiQAj4Rjd3hpQ/lYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779908983; c=relaxed/simple;
	bh=ENSZXXG1ZsVUwY0QSHilE2dm+7OUkOw8owfAyTo0l4E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jwuLsis8WzlW5k0T1CFpSpBlipEA0/gMoSMHYu+cjU1OSPWQZURezuNTwlXN/7InE4NSLRwbYKnWyzv2+8uDeBmzs9obgVX8MrGyWRzcmCLaVUo2HT7ErXgbtmwRMWxXd8Y14cR056oBjuiZ7v9DrSSlsFfqj1gFmVcv9PfLZ+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LrzfVI8T; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LrzfVI8T"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4903974854dso56080505e9.3
        for <oe-kbuild@lists.linux.dev>; Wed, 27 May 2026 12:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779908979; x=1780513779; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5TFmsLapNvS3e4QpeLd98HXGWYXxOCbjGHInWLNuXB0=;
        b=LrzfVI8TrUvuMw8XTHGo2px+ejCS02ymLTlVL8lLIEXoGOHF/eTaGEIefYYD6V1JO/
         qT1sbb895bqDWcHiDPcNgRCOMC2j/7MtPVnHQ2VAD/F/FwzidgKkuGWddPVnhQd2azOn
         GSltjmP4PYa3r6pxg6OIbmob/mAzD1zUBjHuJT0E6und1lhJHAcHDmOhRmmDMDJJ2cig
         MA0NpdWzbc0COK0kxEsvPC7HwbhSZ5RUjEwFasSDzTEqWSkaCOBdC8wLQo7AKj1+Viuy
         OK21SrF0a6T2dxArR7ec16l8Hj/vjvgkwyuJRLuPJR3NDgrRCPl3kYBtrDHTzJ+T7gQR
         hgkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779908979; x=1780513779;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5TFmsLapNvS3e4QpeLd98HXGWYXxOCbjGHInWLNuXB0=;
        b=eLYoik0Mmd8Z8Js459I58eXsbc+MqRE2OMKUO7BT49Hu68uUneBCp7aoE/xQmL8Rjg
         KsBOIqY/xRGWh1kZC+zoYbwaU+Ijhi5yY1Mhk7aROmhgJIRTDw/b7Yt6TvVX0FHXxsdF
         4zFTiIzlM04j8R0i33bVFvjW8ecdEmfbGehltpeVTO/w99UOe9pHynYXy1ml0VQn1MNc
         swhm2u6xd2VE2CT2C6xAScBGiERkR93U1jTOalKW0EdJoARFOfYMzYn00eJLccfJyig1
         ftwOfm7xU91D8k5hM+SO8qk5o930zV0CSbd7K5jJbPUr40ROVSdvfMQluXobgq1m0xV3
         ghgA==
X-Gm-Message-State: AOJu0Yw+8Df6Rt9QbaYI2/6WmjytbNhT/L5Z9di0MWoReWxY1Pe8WrYj
	7qBm0jAqrziWJNyYDFJTgIUiZNnaucij9bVxhLckPBP1iB9zF27TCsJ11fIA8A==
X-Gm-Gg: Acq92OE96AGXHuDpvl2smuUpHRDTWJxOOtBT0ss6otPKiic/ORzyxvOFFeNAFNWjwn1
	ksE/R0DiGd5S1rdtEMuoXi1c9B6knuX3YYgrubOnDvQ6M57wQAxIvjUJmLNDTxWGitklST2wMRr
	aRcRESYSk1XurbHtLqDWD6mX601z3nwcWBcYK6ziFLOBp7iewVmz46ze2CWdGK8QBjl0lnLiqbe
	vYjxi8nBHHPYCnzNOsAhTf6sLPOrgxlmVsH/rMKdtmhMuoQ3kg32I1sR3Dr+NeBcn5ak9yK2FpW
	cG2tw69+Wp8uYceRVrC4PnxtOZ3BZyOA4NLJN1/D3+XY+ASTZM1w/ODaepUmjYZUDdNKDsnDbx2
	Zkvy6PF0r7PzjH7W5UuqvVD8swdmwL1XWRe3kxPD6kI1R+jLYDl8Mo6FmPtPA1gqghG/fxNQIe3
	EGYUN+S0ljBBD1uF2ZezluyS9N7MuNx3ed1w==
X-Received: by 2002:a05:600c:37c8:b0:48f:e230:8cad with SMTP id 5b1f17b1804b1-49042ae0201mr442653505e9.33.1779908978761;
        Wed, 27 May 2026 12:09:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5b314dsm7301759f8f.30.2026.05.27.12.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 12:09:37 -0700 (PDT)
Date: Wed, 27 May 2026 22:09:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-05-22-2 254/254]
 sound/soc/generic/simple-card.c:816 simple_probe() warn: passing zero to
 'dev_err_probe'
Message-ID: <202605262057.MrYWEhEf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260527190934.o1Vl3s18NZtFwODP1Zsn0Lgc1TIbzAoZky2RTo1HH7Q@z>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-05-22-2
head:   7f5e6579901e0a1f3ff8bb45002dc226961a56ce
commit: 7ef1ca7325d4d74d6a20d348a5a8e403992964ab [254/254] ASoC: generic: use snd_soc_card_register()
config: x86_64-randconfig-161-20260525 (https://download.01.org/0day-ci/archive/20260526/202605262057.MrYWEhEf-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605262057.MrYWEhEf-lkp@intel.com/

smatch warnings:
sound/soc/generic/simple-card.c:816 simple_probe() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +816 sound/soc/generic/simple-card.c

b4b7de99c6da46 Kuninori Morimoto   2023-09-11  712  static int simple_probe(struct platform_device *pdev)
f2390880ec0264 Kuninori Morimoto   2012-04-08  713  {
b4b7de99c6da46 Kuninori Morimoto   2023-09-11  714  	struct simple_util_priv *priv;
f89983ef61677a Kuninori Morimoto   2012-12-25  715  	struct device *dev = &pdev->dev;
dcee9bfe890451 Kuninori Morimoto   2017-03-15  716  	struct device_node *np = dev->of_node;
5be509576cf634 Kuninori Morimoto   2017-03-15  717  	struct snd_soc_card *card;
7ef1ca7325d4d7 Kuninori Morimoto   2026-04-20  718  	const char *card_name = NULL;
65a5056b21202e Kuninori Morimoto   2019-03-20  719  	int ret;
f2390880ec0264 Kuninori Morimoto   2012-04-08  720  
0dd4fc3c2f663b Xiubo Li            2014-09-10  721  	/* Allocate the private data and the DAI link array */
b0133d9c4d7600 Kuninori Morimoto   2016-08-26  722  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
ca65b492c7a265 Jean-Francois Moine 2014-01-15  723  	if (!priv)
ca919fe4b972b9 Xiubo Li            2014-01-14  724  		return -ENOMEM;
ca919fe4b972b9 Xiubo Li            2014-01-14  725  
a0ef5b4b101424 Kuninori Morimoto   2025-02-05  726  	ret = -ENOMEM;
bf4afc53b77aea Linus Torvalds      2026-02-21  727  	struct link_info *li __free(kfree) = kzalloc_obj(*li);
ec1af6c64db94e Thierry Reding      2021-04-19  728  	if (!li)
a0ef5b4b101424 Kuninori Morimoto   2025-02-05  729  		goto end;
ec1af6c64db94e Thierry Reding      2021-04-19  730  
ec1af6c64db94e Thierry Reding      2021-04-19  731  	ret = simple_get_dais_count(priv, li);
0f687d826736a5 Thierry Reding      2021-04-16  732  	if (ret < 0)
a0ef5b4b101424 Kuninori Morimoto   2025-02-05  733  		goto end;
0f687d826736a5 Thierry Reding      2021-04-16  734  
a0ef5b4b101424 Kuninori Morimoto   2025-02-05  735  	ret = -EINVAL;
ec1af6c64db94e Thierry Reding      2021-04-19  736  	if (!li->link)
a0ef5b4b101424 Kuninori Morimoto   2025-02-05  737  		goto end;
da215354eb55c3 Kuninori Morimoto   2018-12-14  738  
b4b7de99c6da46 Kuninori Morimoto   2023-09-11  739  	ret = simple_util_init_priv(priv, li);
65a5056b21202e Kuninori Morimoto   2019-03-20  740  	if (ret < 0)
a0ef5b4b101424 Kuninori Morimoto   2025-02-05  741  		goto end;
201a0eac7fe5e7 Jean-Francois Moine 2014-01-15  742  
201a0eac7fe5e7 Jean-Francois Moine 2014-01-15  743  	if (np && of_device_is_available(np)) {
ca919fe4b972b9 Xiubo Li            2014-01-14  744  
ec1af6c64db94e Thierry Reding      2021-04-19  745  		ret = simple_parse_of(priv, li);
fa558c2801fc17 Kuninori Morimoto   2013-11-20  746  		if (ret < 0) {
7a0299e13bc740 Kuninori Morimoto   2021-12-14  747  			dev_err_probe(dev, ret, "parse error\n");
e512e001dafa54 Jean-Francois Moine 2014-03-11  748  			goto err;

ret is zero

fa558c2801fc17 Kuninori Morimoto   2013-11-20  749  		}
6a91a17bd7b92b Jean-Francois Moine 2014-03-20  750  
fa558c2801fc17 Kuninori Morimoto   2013-11-20  751  	} else {
b4b7de99c6da46 Kuninori Morimoto   2023-09-11  752  		struct simple_util_info *cinfo;
f107294c6422e7 Kuninori Morimoto   2019-06-06  753  		struct snd_soc_dai_link_component *cpus;
710af9196ce614 Kuninori Morimoto   2018-08-31  754  		struct snd_soc_dai_link_component *codecs;
e58f41e41185c6 Kuninori Morimoto   2018-08-31  755  		struct snd_soc_dai_link_component *platform;
65a5056b21202e Kuninori Morimoto   2019-03-20  756  		struct snd_soc_dai_link *dai_link = priv->dai_link;
65a5056b21202e Kuninori Morimoto   2019-03-20  757  		struct simple_dai_props *dai_props = priv->dai_props;
65a5056b21202e Kuninori Morimoto   2019-03-20  758  
41bae58df411f9 Kuninori Morimoto   2023-09-19  759  		ret = -EINVAL;
41bae58df411f9 Kuninori Morimoto   2023-09-19  760  
ca65b492c7a265 Jean-Francois Moine 2014-01-15  761  		cinfo = dev->platform_data;
ca65b492c7a265 Jean-Francois Moine 2014-01-15  762  		if (!cinfo) {
f89983ef61677a Kuninori Morimoto   2012-12-25  763  			dev_err(dev, "no info for asoc-simple-card\n");
41bae58df411f9 Kuninori Morimoto   2023-09-19  764  			goto err;
f2390880ec0264 Kuninori Morimoto   2012-04-08  765  		}
f2390880ec0264 Kuninori Morimoto   2012-04-08  766  
f2390880ec0264 Kuninori Morimoto   2012-04-08  767  		if (!cinfo->name ||
fa558c2801fc17 Kuninori Morimoto   2013-11-20  768  		    !cinfo->codec_dai.name ||
7722f830a45f7f Jean-Francois Moine 2014-01-15  769  		    !cinfo->codec ||
7722f830a45f7f Jean-Francois Moine 2014-01-15  770  		    !cinfo->platform ||
7722f830a45f7f Jean-Francois Moine 2014-01-15  771  		    !cinfo->cpu_dai.name) {
b4b7de99c6da46 Kuninori Morimoto   2023-09-11  772  			dev_err(dev, "insufficient simple_util_info settings\n");
41bae58df411f9 Kuninori Morimoto   2023-09-19  773  			goto err;
f2390880ec0264 Kuninori Morimoto   2012-04-08  774  		}
2bee991460a838 Jean-Francois Moine 2014-01-15  775  
f107294c6422e7 Kuninori Morimoto   2019-06-06  776  		cpus			= dai_link->cpus;
f107294c6422e7 Kuninori Morimoto   2019-06-06  777  		cpus->dai_name		= cinfo->cpu_dai.name;
f107294c6422e7 Kuninori Morimoto   2019-06-06  778  
710af9196ce614 Kuninori Morimoto   2018-08-31  779  		codecs			= dai_link->codecs;
710af9196ce614 Kuninori Morimoto   2018-08-31  780  		codecs->name		= cinfo->codec;
710af9196ce614 Kuninori Morimoto   2018-08-31  781  		codecs->dai_name	= cinfo->codec_dai.name;
710af9196ce614 Kuninori Morimoto   2018-08-31  782  
910fdcabedd235 Kuninori Morimoto   2019-01-21  783  		platform		= dai_link->platforms;
e58f41e41185c6 Kuninori Morimoto   2018-08-31  784  		platform->name		= cinfo->platform;
e58f41e41185c6 Kuninori Morimoto   2018-08-31  785  
7ef1ca7325d4d7 Kuninori Morimoto   2026-04-20  786  		card_name		= (cinfo->card) ? cinfo->card : cinfo->name;
5ca8ba4180a6f6 Jean-Francois Moine 2014-01-15  787  		dai_link->name		= cinfo->name;
5ca8ba4180a6f6 Jean-Francois Moine 2014-01-15  788  		dai_link->stream_name	= cinfo->name;
1efb53a220b78f Lars-Peter Clausen  2015-03-24  789  		dai_link->dai_fmt	= cinfo->daifmt;
b4b7de99c6da46 Kuninori Morimoto   2023-09-11  790  		dai_link->init		= simple_util_dai_init;
65a5056b21202e Kuninori Morimoto   2019-03-20  791  		memcpy(dai_props->cpu_dai, &cinfo->cpu_dai,
65a5056b21202e Kuninori Morimoto   2019-03-20  792  					sizeof(*dai_props->cpu_dai));
65a5056b21202e Kuninori Morimoto   2019-03-20  793  		memcpy(dai_props->codec_dai, &cinfo->codec_dai,
65a5056b21202e Kuninori Morimoto   2019-03-20  794  					sizeof(*dai_props->codec_dai));
7722f830a45f7f Jean-Francois Moine 2014-01-15  795  	}
f2390880ec0264 Kuninori Morimoto   2012-04-08  796  
7ef1ca7325d4d7 Kuninori Morimoto   2026-04-20  797  	card = devm_snd_soc_card_alloc(dev, THIS_MODULE, &card_driver,
7ef1ca7325d4d7 Kuninori Morimoto   2026-04-20  798  				       card_name, NULL, NULL);
7ef1ca7325d4d7 Kuninori Morimoto   2026-04-20  799  	if (!card)
7ef1ca7325d4d7 Kuninori Morimoto   2026-04-20  800  		goto err;

No error code

7ef1ca7325d4d7 Kuninori Morimoto   2026-04-20  801  
7ef1ca7325d4d7 Kuninori Morimoto   2026-04-20  802  	priv->snd_card = card;
7ef1ca7325d4d7 Kuninori Morimoto   2026-04-20  803  
5be509576cf634 Kuninori Morimoto   2017-03-15  804  	snd_soc_card_set_drvdata(card, priv);
f2390880ec0264 Kuninori Morimoto   2012-04-08  805  
b4b7de99c6da46 Kuninori Morimoto   2023-09-11  806  	simple_util_debug_info(priv);
0580dde5943868 Kuninori Morimoto   2019-03-20  807  
7ef1ca7325d4d7 Kuninori Morimoto   2026-04-20  808  	ret = devm_snd_soc_card_register(card);
c6d112e442fed7 Kuninori Morimoto   2017-05-19  809  	if (ret < 0)
c6d112e442fed7 Kuninori Morimoto   2017-05-19  810  		goto err;
c6d112e442fed7 Kuninori Morimoto   2017-05-19  811  
c6d112e442fed7 Kuninori Morimoto   2017-05-19  812  	return 0;
e512e001dafa54 Jean-Francois Moine 2014-03-11  813  err:
b4b7de99c6da46 Kuninori Morimoto   2023-09-11  814  	simple_util_clean_reference(card);
a0ef5b4b101424 Kuninori Morimoto   2025-02-05  815  end:
a0ef5b4b101424 Kuninori Morimoto   2025-02-05 @816  	return dev_err_probe(dev, ret, "parse error\n");
f2390880ec0264 Kuninori Morimoto   2012-04-08  817  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

