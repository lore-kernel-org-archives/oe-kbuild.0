Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D321FE10A
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Nov 2024 12:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731502049; cv=none; b=qliv8Zv7TGZVqzDBnavmwCaWUa45bC+FYGyy3RfFL6qHYc7WN37h6qTDvcWJZmqmW3rjL+KS3enlli5mCeK2IsEF6U86hIlWcBwaCaA1IOnqbE8qzsO4bqe1BlGY/xjNMc9jlPj+mDP7koDVFF3wiTwp15aT9cGd5CjcNAkD7X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731502049; c=relaxed/simple;
	bh=IbrOu7cLj9wDp/+e2cHXQDfOhPtQM5fVS/pNjUA1Uq8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BVPFAg+cRrr4J2yte9kvoi/Cv9Ar/qGeVjolKz2ryUiNCUM9wdMmn0RtjETR+YZiehB1Ka2ZvOdwp3wV+eOvyPiJzZprtJepm6xieKn/P+DwnPQOrcf+LsRTqN7RwvKFqUBW0C5n64NJBhKT5RKUsVOpKRtl0DMaUKEFkkcaYJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ozx+BkHw; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ozx+BkHw"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-431481433bdso59927805e9.3
        for <oe-kbuild@lists.linux.dev>; Wed, 13 Nov 2024 04:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731502046; x=1732106846; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bRI/6MHh+O1V2mQ/jai9pmuLYyDdPgB/WKCT/qqEwik=;
        b=ozx+BkHw8FRp5DdwfFifZ18WqmPXJSaCU3KTtagZJ8hPncmsFB8aM2zuVj4jq+JsN0
         sYkseLh2O97Wc4k4Z5XW6Cs6ZOUhQHLbiif8xSMzVyapxQ5bSn5gVFqbw8iGy3tsES8g
         sNBkWaXoNi9fvG4Q0Qqgpkqqklw2CzXWM6ZTxLU9LHZcOWxPL+TPchyb8LDzdwIHk8/X
         /bhg95NfgpEja5IFEZ3tf4ZWMoAoqKmuwd3yn0+uv4Oh0gRhHn8UGkiPN24Ub+cwxN6c
         ezEJ8+TwrLHccs9Shm6OKEhzA9nX7FObshCEWktFZdMlyCUPYU8PKoMhv9GMepRZ6QhD
         It5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731502046; x=1732106846;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bRI/6MHh+O1V2mQ/jai9pmuLYyDdPgB/WKCT/qqEwik=;
        b=Ygx1YrxyVUEBR5DQZCH+mhk/HapAT6oZeDYMldGkxQFsYXX908ymDI2AwcyJd+8CYz
         Af+h4PvgsVnoXgN1pqvqHAvSUFTCav2J0Ju27NAoV88uwDzf7yrBJinpE+Med3tN2ng3
         B1TXx27xhdeuBejsSGK4o7pdgSdyjwylwtjHZ9pvkGGMWH+fflCIniAfHYNJeDtMb+ck
         JkR5WfIySxkhxEOIzeIErF0SGihQ6Fa124oMR5GUQpCvgqFgj3dtozUxhZBt5EbMH7UI
         JDlHzqzGL2ZOuB7pp5e01zMzcDWxpFsAOmZmkchZ5OdBlTpFwkTb+RqMuIeKG/n/oaGX
         k1fg==
X-Gm-Message-State: AOJu0Yxn83UtQhkFPL7fxOI2d3lLN23xQJv4fcnWisS0uLm8aK/XD6Q/
	Gb5XJAtG5edFkUA06xjJwVOCIYUm3PdBGraAm+9nTJtSi9oZUanMv8JaVw3LpCsjWoS6HAqjbtc
	n
X-Google-Smtp-Source: AGHT+IFi24cTgT7VBdMlL2UvxlRwlrQgbWV944mNNkKV0nYlPhVn/td2SrLqRwJ9YqHCLyugxaAgSg==
X-Received: by 2002:a05:600c:a00e:b0:431:1512:743b with SMTP id 5b1f17b1804b1-432d4acfba3mr21479255e9.21.1731502045574;
        Wed, 13 Nov 2024 04:47:25 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d54f76b9sm23265215e9.14.2024.11.13.04.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 04:47:25 -0800 (PST)
Date: Wed, 13 Nov 2024 15:47:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 11/13]
 sound/soc/codecs/hdmi-codec.c:504 hdmi_codec_hw_params() error: __memcpy()
 'hcp->iec_status' too small (5 vs 24)
Message-ID: <3e6e40c1-16eb-4775-82f8-93d7f167b112@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   ee2e0e624b3958f48d3bdeabeda5396444f9e5ec
commit: 4ad97b395f94bc0f546f27bbe9b8a62321f49ad3 [11/13] UPSTREAM: ASoC: hdmi-codec: Add iec958 controls
config: x86_64-randconfig-161-20241113 (https://download.01.org/0day-ci/archive/20241113/202411132026.abNXeRjz-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411132026.abNXeRjz-lkp@intel.com/

smatch warnings:
sound/soc/codecs/hdmi-codec.c:504 hdmi_codec_hw_params() error: __memcpy() 'hcp->iec_status' too small (5 vs 24)

vim +504 sound/soc/codecs/hdmi-codec.c

09184118a8abae Jyri Sarha        2016-03-31  484  static int hdmi_codec_hw_params(struct snd_pcm_substream *substream,
09184118a8abae Jyri Sarha        2016-03-31  485  				struct snd_pcm_hw_params *params,
09184118a8abae Jyri Sarha        2016-03-31  486  				struct snd_soc_dai *dai)
09184118a8abae Jyri Sarha        2016-03-31  487  {
09184118a8abae Jyri Sarha        2016-03-31  488  	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
0cf4610b9f297e Jerome Brunet     2019-05-06  489  	struct hdmi_codec_daifmt *cf = dai->playback_dma_data;
09184118a8abae Jyri Sarha        2016-03-31  490  	struct hdmi_codec_params hp = {
09184118a8abae Jyri Sarha        2016-03-31  491  		.iec = {
09184118a8abae Jyri Sarha        2016-03-31  492  			.status = { 0 },
09184118a8abae Jyri Sarha        2016-03-31  493  			.subcode = { 0 },
09184118a8abae Jyri Sarha        2016-03-31  494  			.pad = 0,
09184118a8abae Jyri Sarha        2016-03-31  495  			.dig_subframe = { 0 },
09184118a8abae Jyri Sarha        2016-03-31  496  		}
09184118a8abae Jyri Sarha        2016-03-31  497  	};
cd6111b26280a2 Arnaud Pouliquen  2017-01-03  498  	int ret, idx;
09184118a8abae Jyri Sarha        2016-03-31  499  
09184118a8abae Jyri Sarha        2016-03-31  500  	dev_dbg(dai->dev, "%s() width %d rate %d channels %d\n", __func__,
09184118a8abae Jyri Sarha        2016-03-31  501  		params_width(params), params_rate(params),
09184118a8abae Jyri Sarha        2016-03-31  502  		params_channels(params));
09184118a8abae Jyri Sarha        2016-03-31  503  
4ad97b395f94bc Maxime Ripard     2021-05-25 @504  	memcpy(hp.iec.status, hcp->iec_status, sizeof(hp.iec.status));
                                                                              ^^^^^^^^^^^^^^^
Read overflow?

4ad97b395f94bc Maxime Ripard     2021-05-25  505  	ret = snd_pcm_fill_iec958_consumer_hw_params(params, hp.iec.status,
09184118a8abae Jyri Sarha        2016-03-31  506  						     sizeof(hp.iec.status));
09184118a8abae Jyri Sarha        2016-03-31  507  	if (ret < 0) {
09184118a8abae Jyri Sarha        2016-03-31  508  		dev_err(dai->dev, "Creating IEC958 channel status failed %d\n",
09184118a8abae Jyri Sarha        2016-03-31  509  			ret);
09184118a8abae Jyri Sarha        2016-03-31  510  		return ret;
09184118a8abae Jyri Sarha        2016-03-31  511  	}
09184118a8abae Jyri Sarha        2016-03-31  512  
09184118a8abae Jyri Sarha        2016-03-31  513  	hdmi_audio_infoframe_init(&hp.cea);
09184118a8abae Jyri Sarha        2016-03-31  514  	hp.cea.channels = params_channels(params);
09184118a8abae Jyri Sarha        2016-03-31  515  	hp.cea.coding_type = HDMI_AUDIO_CODING_TYPE_STREAM;
09184118a8abae Jyri Sarha        2016-03-31  516  	hp.cea.sample_size = HDMI_AUDIO_SAMPLE_SIZE_STREAM;
09184118a8abae Jyri Sarha        2016-03-31  517  	hp.cea.sample_frequency = HDMI_AUDIO_SAMPLE_FREQUENCY_STREAM;
09184118a8abae Jyri Sarha        2016-03-31  518  
cd6111b26280a2 Arnaud Pouliquen  2017-01-03  519  	/* Select a channel allocation that matches with ELD and pcm channels */
cd6111b26280a2 Arnaud Pouliquen  2017-01-03  520  	idx = hdmi_codec_get_ch_alloc_table_idx(hcp, hp.cea.channels);
cd6111b26280a2 Arnaud Pouliquen  2017-01-03  521  	if (idx < 0) {
cd6111b26280a2 Arnaud Pouliquen  2017-01-03  522  		dev_err(dai->dev, "Not able to map channels to speakers (%d)\n",
cd6111b26280a2 Arnaud Pouliquen  2017-01-03  523  			idx);
cd6111b26280a2 Arnaud Pouliquen  2017-01-03  524  		hcp->chmap_idx = HDMI_CODEC_CHMAP_IDX_UNKNOWN;
cd6111b26280a2 Arnaud Pouliquen  2017-01-03  525  		return idx;
cd6111b26280a2 Arnaud Pouliquen  2017-01-03  526  	}
cd6111b26280a2 Arnaud Pouliquen  2017-01-03  527  	hp.cea.channel_allocation = hdmi_codec_channel_alloc[idx].ca_id;
cd6111b26280a2 Arnaud Pouliquen  2017-01-03  528  	hcp->chmap_idx = hdmi_codec_channel_alloc[idx].ca_id;
cd6111b26280a2 Arnaud Pouliquen  2017-01-03  529  
09184118a8abae Jyri Sarha        2016-03-31  530  	hp.sample_width = params_width(params);
09184118a8abae Jyri Sarha        2016-03-31  531  	hp.sample_rate = params_rate(params);
09184118a8abae Jyri Sarha        2016-03-31  532  	hp.channels = params_channels(params);
09184118a8abae Jyri Sarha        2016-03-31  533  
49e502f0c0483e Sia Jee Heng      2021-02-04  534  	cf->bit_fmt = params_format(params);
efc9194bcff846 Kuninori Morimoto 2016-06-24  535  	return hcp->hcd.ops->hw_params(dai->dev->parent, hcp->hcd.data,
0cf4610b9f297e Jerome Brunet     2019-05-06  536  				       cf, &hp);
09184118a8abae Jyri Sarha        2016-03-31  537  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

