Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6C417A597
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Dec 2024 05:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733290755; cv=none; b=DywaWFf93Emts0RlJBLfdWZrsvbo8ADvjt9zskDS5lJTZZNTtkBH1voyiVsgYyqCBG4Ws9TBN+tu3l/elCtXuNoYFS0T0kfFJiJMr7Sy2MpepQB4pvs7tuES1yzFUUZR0fB/Urd568ASaevVxOFrkHOv1UAi7VlH1+JTAyxhCXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733290755; c=relaxed/simple;
	bh=ZW8NJzYCneQfc2A4nOtB5xRiKqWR4sE9YgJAyCHBg9A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TYgSdMDjcKmG+cI2XxBsVfaa2U/UyQ1XLz0kvMkTSG11y1QXQQ7YjT4o+UIDrgKHTE3HwdHuY7GnJvd54RsEetdid+1s70nNqY63eGd/4NevqUIsM4XLpKZmdcgJTvrt7eyuWIi5mNvZP70YMMaZ2Ck1m+wKnlZvwGck2n70QqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=juL1mKu+; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="juL1mKu+"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-434aa222d96so77797175e9.0
        for <oe-kbuild@lists.linux.dev>; Tue, 03 Dec 2024 21:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733290751; x=1733895551; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iwnJCoNC3CCziP++riS9EGT6PkF/6lH2q86UnwQuC4w=;
        b=juL1mKu+sA3gNixaEL6/EECBoADt58EFGhYwyqOBpy0AmEZKG6ZdFO/p5QpqyO/lho
         JEmBQRihOCxCBMvjZ7hi8sWt2NxuHtM0l2sV5/4gmZ9OiEWFiSUqNjn4Q4FHaP1JYn1h
         atkZQj7FYZQP0aTTz/QS0gXAOJr+sG6YxVZv2dXdv5qNNIGUmpGa7k8S8QwU98RB4M4y
         W3CvCgqf8zjE7wlh2gLCovIiIoNMwJh0ftKz3QOBz81YuF2D99BiP3v+KNr9xzLQ0OQW
         TADoP86DnA2ADDRUjL03YzQCT8RNX0g2trENsMIDwkGa8vlRVNFXdSa8B7cvLzapMHOq
         RZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733290751; x=1733895551;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iwnJCoNC3CCziP++riS9EGT6PkF/6lH2q86UnwQuC4w=;
        b=AXUIZfSanTaRUjjVBgCRgV56paAubicBK7IgqppUcZuE//LeuinTMYC3llfKre1yGG
         UQJY/wR9KxJBK58eja0yaH/21zl3ETef8131fqGNcJSdZpFCgaBa05RJflvupvb2LaBo
         D6ZUicoqtpJRdajYMXayP3l8zPC0jMrCAeUKFbe1Vm6ez8jFkCYM8ErD8rbK+ClRcIqC
         jw7BOCjuneUdfNs1Fz7RBxv2MUKiWgwuCU+n+TKZe+tnONJcQogzI2GiMKdvzrHBhtxL
         QGm0LqyuiiY4rI+kjFZG1rVZujd50rzLpRv5cjMs/R7o+CK/JCehp0o6RzJX0o56dLvd
         xbvA==
X-Gm-Message-State: AOJu0YwoAt2LDzcoSN/G+lVeK3TauVNj9mM9hYZLZ/TyLsHEyzINBj05
	ycGo3MabNZQ6PBcPBo/wr4ylZpo4TqR2vEwo5kYobf163Bl18mnbCjJggDOvFYeFBHcMhkiriRy
	D
X-Gm-Gg: ASbGncsbc4d2Cu+D+tKy5RjpS01YNKR3eFiFZ70aF3+z3nxoHTnVFwatH22ign+8o0G
	4X/9RslwDTO+fK2HnP+NWWcphm8RiV2txEINpmS2fbW7V3VKIkbbyASg7TMcIazRIG1ItEEqFEy
	RpgHE4sHm67AeSwuQeQcmUaALpqrAPhxWLZ8Rk8NhU5XG7K6YOSwpAqFb9GJiVn5ro7bv9WdtwH
	oUxLBTaA7hbNWtG+IRguuW0V2dxK/CnGSRZevBYOruULxE0IJQXfXE=
X-Google-Smtp-Source: AGHT+IFLzR1mKWr/Tm2Hy+6td8IIYD9YQ0mqwNq2j2HSU2sVGb6fR/bJXh/gWiyXBJyCjZoQE8ncDA==
X-Received: by 2002:a05:6000:1886:b0:385:ed1e:20fe with SMTP id ffacd0b85a97d-385fd533d2fmr3910961f8f.59.1733290751460;
        Tue, 03 Dec 2024 21:39:11 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52c0dc8sm11206335e9.27.2024.12.03.21.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 21:39:10 -0800 (PST)
Date: Wed, 4 Dec 2024 08:39:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 11/13]
 sound/soc/codecs/hdmi-codec.c:504 hdmi_codec_hw_params() error: __memcpy()
 'hcp->iec_status' too small (5 vs 24)
Message-ID: <e2ae93d0-3ab9-43bf-b3a8-ef3ef27df23c@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   7c627b9bc8f94d32c29992d4da3aef0f04f0bb3a
commit: 4ad97b395f94bc0f546f27bbe9b8a62321f49ad3 [11/13] UPSTREAM: ASoC: hdmi-codec: Add iec958 controls
config: x86_64-randconfig-161-20241113 (https://download.01.org/0day-ci/archive/20241204/202412041032.a7oROgnh-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412041032.a7oROgnh-lkp@intel.com/

smatch warnings:
sound/soc/codecs/hdmi-codec.c:504 hdmi_codec_hw_params() error: __memcpy() 'hcp->iec_status' too small (5 vs 24)

vim +504 sound/soc/codecs/hdmi-codec.c

09184118a8abae0 Jyri Sarha        2016-03-31  484  static int hdmi_codec_hw_params(struct snd_pcm_substream *substream,
09184118a8abae0 Jyri Sarha        2016-03-31  485  				struct snd_pcm_hw_params *params,
09184118a8abae0 Jyri Sarha        2016-03-31  486  				struct snd_soc_dai *dai)
09184118a8abae0 Jyri Sarha        2016-03-31  487  {
09184118a8abae0 Jyri Sarha        2016-03-31  488  	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
0cf4610b9f297e5 Jerome Brunet     2019-05-06  489  	struct hdmi_codec_daifmt *cf = dai->playback_dma_data;
09184118a8abae0 Jyri Sarha        2016-03-31  490  	struct hdmi_codec_params hp = {
09184118a8abae0 Jyri Sarha        2016-03-31  491  		.iec = {
09184118a8abae0 Jyri Sarha        2016-03-31  492  			.status = { 0 },
09184118a8abae0 Jyri Sarha        2016-03-31  493  			.subcode = { 0 },
09184118a8abae0 Jyri Sarha        2016-03-31  494  			.pad = 0,
09184118a8abae0 Jyri Sarha        2016-03-31  495  			.dig_subframe = { 0 },
09184118a8abae0 Jyri Sarha        2016-03-31  496  		}
09184118a8abae0 Jyri Sarha        2016-03-31  497  	};
cd6111b26280a2f Arnaud Pouliquen  2017-01-03  498  	int ret, idx;
09184118a8abae0 Jyri Sarha        2016-03-31  499  
09184118a8abae0 Jyri Sarha        2016-03-31  500  	dev_dbg(dai->dev, "%s() width %d rate %d channels %d\n", __func__,
09184118a8abae0 Jyri Sarha        2016-03-31  501  		params_width(params), params_rate(params),
09184118a8abae0 Jyri Sarha        2016-03-31  502  		params_channels(params));
09184118a8abae0 Jyri Sarha        2016-03-31  503  
4ad97b395f94bc0 Maxime Ripard     2021-05-25 @504  	memcpy(hp.iec.status, hcp->iec_status, sizeof(hp.iec.status));

Read past the end of the hcp->iec_status buffer.  You need to pull in commit
06feec6005c9 ("ASoC: hdmi-codec: Fix OOB memory accesses") to fix this bug.

4ad97b395f94bc0 Maxime Ripard     2021-05-25  505  	ret = snd_pcm_fill_iec958_consumer_hw_params(params, hp.iec.status,
09184118a8abae0 Jyri Sarha        2016-03-31  506  						     sizeof(hp.iec.status));
09184118a8abae0 Jyri Sarha        2016-03-31  507  	if (ret < 0) {
09184118a8abae0 Jyri Sarha        2016-03-31  508  		dev_err(dai->dev, "Creating IEC958 channel status failed %d\n",
09184118a8abae0 Jyri Sarha        2016-03-31  509  			ret);
09184118a8abae0 Jyri Sarha        2016-03-31  510  		return ret;
09184118a8abae0 Jyri Sarha        2016-03-31  511  	}
09184118a8abae0 Jyri Sarha        2016-03-31  512  
09184118a8abae0 Jyri Sarha        2016-03-31  513  	hdmi_audio_infoframe_init(&hp.cea);
09184118a8abae0 Jyri Sarha        2016-03-31  514  	hp.cea.channels = params_channels(params);
09184118a8abae0 Jyri Sarha        2016-03-31  515  	hp.cea.coding_type = HDMI_AUDIO_CODING_TYPE_STREAM;
09184118a8abae0 Jyri Sarha        2016-03-31  516  	hp.cea.sample_size = HDMI_AUDIO_SAMPLE_SIZE_STREAM;
09184118a8abae0 Jyri Sarha        2016-03-31  517  	hp.cea.sample_frequency = HDMI_AUDIO_SAMPLE_FREQUENCY_STREAM;
09184118a8abae0 Jyri Sarha        2016-03-31  518  
cd6111b26280a2f Arnaud Pouliquen  2017-01-03  519  	/* Select a channel allocation that matches with ELD and pcm channels */
cd6111b26280a2f Arnaud Pouliquen  2017-01-03  520  	idx = hdmi_codec_get_ch_alloc_table_idx(hcp, hp.cea.channels);
cd6111b26280a2f Arnaud Pouliquen  2017-01-03  521  	if (idx < 0) {
cd6111b26280a2f Arnaud Pouliquen  2017-01-03  522  		dev_err(dai->dev, "Not able to map channels to speakers (%d)\n",
cd6111b26280a2f Arnaud Pouliquen  2017-01-03  523  			idx);
cd6111b26280a2f Arnaud Pouliquen  2017-01-03  524  		hcp->chmap_idx = HDMI_CODEC_CHMAP_IDX_UNKNOWN;
cd6111b26280a2f Arnaud Pouliquen  2017-01-03  525  		return idx;
cd6111b26280a2f Arnaud Pouliquen  2017-01-03  526  	}
cd6111b26280a2f Arnaud Pouliquen  2017-01-03  527  	hp.cea.channel_allocation = hdmi_codec_channel_alloc[idx].ca_id;
cd6111b26280a2f Arnaud Pouliquen  2017-01-03  528  	hcp->chmap_idx = hdmi_codec_channel_alloc[idx].ca_id;
cd6111b26280a2f Arnaud Pouliquen  2017-01-03  529  
09184118a8abae0 Jyri Sarha        2016-03-31  530  	hp.sample_width = params_width(params);
09184118a8abae0 Jyri Sarha        2016-03-31  531  	hp.sample_rate = params_rate(params);
09184118a8abae0 Jyri Sarha        2016-03-31  532  	hp.channels = params_channels(params);
09184118a8abae0 Jyri Sarha        2016-03-31  533  
49e502f0c0483e3 Sia Jee Heng      2021-02-04  534  	cf->bit_fmt = params_format(params);
efc9194bcff8466 Kuninori Morimoto 2016-06-24  535  	return hcp->hcd.ops->hw_params(dai->dev->parent, hcp->hcd.data,
0cf4610b9f297e5 Jerome Brunet     2019-05-06  536  				       cf, &hp);
09184118a8abae0 Jyri Sarha        2016-03-31  537  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

