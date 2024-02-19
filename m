Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3829E20B00
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Feb 2024 08:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708330789; cv=none; b=SHwl2EX0wBSnGMdZ4iDF9ZUiQQhzePgW2e9C3QKfehbTF72sgE1ehX5tj1ReIwgGd72QPTWC5XOEtgV3JWuetbWOLiJmM3O0GLIOD0qGQRlMg9ayPoHcWS/6kFBfQ+2T+iuZ3Q45vDKjeBwJhcY48Px4FW2WKAwyKeaAkTPpBEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708330789; c=relaxed/simple;
	bh=mbgrIVbU9cYL+0SQeXf9vbE/uadA5/T0JmGS45eHdqY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dbaj7r9m76tQl+HqwueqDLNauHI5Vje9HSNNK5OavOjPPU8F7ZhshiNgxnijqyIrKEz+TgFFSb34VBspsqBQJvqcbRPkq7ji51Wlu2zm0p5jzfDe2kt7CdLTEREPNfvmS665kEtdQCFRrq0k6YP+6qZhP37+WV9zKXgtSt+VkM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OZaIu3oh; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OZaIu3oh"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a36126ee41eso521039766b.2
        for <oe-kbuild@lists.linux.dev>; Mon, 19 Feb 2024 00:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708330784; x=1708935584; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3lLuOmFKlDCg89YKjH51cyqmyjyjZ4BGO6vbbxm00PY=;
        b=OZaIu3oh3crAVtCxX2CeLxIhiE5sPx+skI/9dpbCockZ6jQpizygqeONHXX4zazb34
         POFJE4qBgxVrmiinxVCRky75YidWxo+zwh2IDZJfWORfXGqvmhFZiVUgA8nrAZ9yd1Ex
         0eYPktr3eVK0CzvGCemgTkBFFUuigdepOqZk+vCkOECwYxgWNll4YvHzjdakEDHlB41m
         XW6YR4wwtCGqXjCqurh9k8NcgLwHDcPHJMy0TV/eRznHw5UDwuFvUMgJQQf64gRscpJN
         EOTb8Ul1Rgl06C3rfdA/Fs2goOSvJXncyUfYrPoIFS/7tGG1+gd7NBgeVI8OODS8/dqA
         NcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708330784; x=1708935584;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3lLuOmFKlDCg89YKjH51cyqmyjyjZ4BGO6vbbxm00PY=;
        b=TWSy3iGf/NOLPYLbR4N2Pqph8FHKkfd8MiXPa16kncfM3DYkpcqU1Kc0XILmAI7mrG
         YgDs54TsiDKViEiX/LBq3JvzRAA5eQxGEkRuSVARh2h7pwOrdpio33NUMfPLWzgnXAPp
         Xp1IB46LGifd2kZ/juBGZsr3Nal2ZkxrQhtf9J4PWG1KzFztdVcj7KorIGmVY1joR7q+
         v4prqSuR8QHCT3+TL/5skdhf6BGp1Z3smSDmwpr+NBR5G7cM1IJYCIpy7trsV6Vbf3ub
         9RZTjWafaDB3FTdlyzs3ZUOfGWnbivzBjVbXkjOXtwWphOjcd9iTPcEEJAmdRN8jw/h4
         Sr8g==
X-Gm-Message-State: AOJu0Yzab8Fc0YzB8LAODHJtGdWag6KXkvuoF+X8Rj8rosizaP83uLzr
	b2PMOiIXZs4Rr9Cwjieqvv90pPYl7CWx/eqKQh7piNMFSwFsBr6rFRbYZczfOuOVozETjaOJWiU
	T
X-Google-Smtp-Source: AGHT+IFUWx7NVkVmlYv7Nx0vCgrVNZu9K0f6UDjeR093vn4GQEQ+0sEojGrmCJ1IFg1YwGbNuVdurw==
X-Received: by 2002:a17:906:6886:b0:a3e:a010:3e6e with SMTP id n6-20020a170906688600b00a3ea0103e6emr997273ejr.71.1708330784435;
        Mon, 19 Feb 2024 00:19:44 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a11-20020a170906244b00b00a3e6dc386d8sm1325258ejb.106.2024.02.19.00.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 00:19:44 -0800 (PST)
Date: Mon, 19 Feb 2024 11:19:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 11/13]
 sound/soc/codecs/hdmi-codec.c:504 hdmi_codec_hw_params() error:
 __builtin_memcpy() 'hcp->iec_status' too small (5 vs 24)
Message-ID: <3fb4e941-7d4d-4f2b-8e17-ec5fa7f4dad9@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   44817294cfe4afa710fc37d3fe6953877a4232e0
commit: 4ad97b395f94bc0f546f27bbe9b8a62321f49ad3 [11/13] UPSTREAM: ASoC: hdmi-codec: Add iec958 controls
config: i386-randconfig-141-20240214 (https://download.01.org/0day-ci/archive/20240218/202402180247.OJ2TZSS7-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202402180247.OJ2TZSS7-lkp@intel.com/

smatch warnings:
sound/soc/codecs/hdmi-codec.c:504 hdmi_codec_hw_params() error: __builtin_memcpy() 'hcp->iec_status' too small (5 vs 24)

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


hp.iec.status is 24 bytes and hcp->iec_status is 5 bytes so it reads
beyond the end of the hcp struct.

4ad97b395f94bc Maxime Ripard     2021-05-25  505  	ret = snd_pcm_fill_iec958_consumer_hw_params(params, hp.iec.status,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

