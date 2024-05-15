Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC8F13FD63
	for <oe-kbuild@lists.linux.dev>; Wed, 15 May 2024 14:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715783285; cv=none; b=ggALoj/olR4Fqj252QldNRS2cV2zOIaCiJaYDu0AQb073R5tbgChBEpCPkiwOuEgxnOIRy0pcvkdFIS7Vl9j4Y2J0cHCgMw57cGmued+wnbrrRo8VTNtD33A6Ivl7dHJvt5KGPMJKCXnmdemzmZy/UdVEm4zL2ABSbSaLQE8KL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715783285; c=relaxed/simple;
	bh=HG2E5ZzzY3Lbc+03GvuD+dWOrLJSMoB11TmWujlsBcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=X/VhkM6pm8aOkL3uHalvaXMC39UKWxxbp62i9KBhRA0kPPT3ZV4Qv4E6uqxo3wc4IopuURpXAfEXpBUuPI27rojEGJ6k9FO9csPjSXPf2ZYMdXCYJp11xMFIWB0KZlnE9si3s2zcqFjhX29ZGWvnJCnpZxvuL9xAQy0o5cbT55o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gZReR59d; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gZReR59d"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-420180b5898so21653405e9.2
        for <oe-kbuild@lists.linux.dev>; Wed, 15 May 2024 07:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715783282; x=1716388082; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zpkv1XFXbjz013sYUtzM2chC9OslxeXahIcL6Fre16A=;
        b=gZReR59dRcBAwqqmMEfYW85nX+dfKTtlhU9/mKdcxbnLuSJAL46xgPJD4f5XiLCFpa
         ltGeBKYwmdflB4JYWSB9cnxahv6f6hdioMlD+U8vaBE/cDdmHh5ZmS0xuR00Oy+GpQ6H
         Srl/XklP8GOhnvLorxQrRJGiorURdvLzv2Li1aiOXRM0zf3yDFwcFnAyne4kBznq7bkM
         cvx5W0iTmntITsNVhKV+kHLMmAhKX2qtk/Gcju0767BdxQFGCsu8TUc6huboa85/rE+8
         IIoCSJKaPs4jbW2AZIaCh9bcFpRQHton0AWe4vm73MaWZ2cElHDkbiOsIRwyxl8hYiTH
         00nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715783282; x=1716388082;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zpkv1XFXbjz013sYUtzM2chC9OslxeXahIcL6Fre16A=;
        b=Vd06swG5H83w6lWstTZjGWtiLdmJI/7auxJmGUO9p/tw+pVGSq5bOvTPOIL9wTWtKd
         xE3zOqdyivMjBfzkIFcncjP1TJ3O6u3o9sjTgSlfRF5KOvWj5p2jvJV8okUOnNm2ostE
         slf7SYE4qhiBUBWIx1vHNaXNUQq6RNZKe3Z7Ekz5Jofl28ZNhMrtsCMj78zVcGzgTLzs
         unrzhaYlmz4xBaux6FWEKO6e8U0UsBqL3g8xxkGHOc0E6+WRtkuyYgVbizxQkEjeUAtR
         a13gDI07aCgE6jOYzqb1V+GSHTZkLyYIVXW4N4esdHv0sr0//yPUbtI3KLy64jOlrr8+
         3oqw==
X-Gm-Message-State: AOJu0Yz6FoZI8PdvPaFp/KA/PAlG7uLcWw9LBXx3LAUQ8IQbelEa2rQk
	ag93mlLmbOPOIc9b1/uJ7h3ZrCYdRlvyz/aqkShIiNpXwYvrO91VWlSYj56x6uXObKaIb1/r9xT
	E
X-Google-Smtp-Source: AGHT+IEpa3TUE9I1rxGs398WImHaUYEZ/FcJ/c2lRyyHuQn6Pe5/4WN9tj8KS+nu2zboruPUmw5DXg==
X-Received: by 2002:a05:600c:4689:b0:420:509:714f with SMTP id 5b1f17b1804b1-4200509728bmr104553345e9.14.1715783281672;
        Wed, 15 May 2024 07:28:01 -0700 (PDT)
Received: from localhost ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42014f563adsm122363295e9.38.2024.05.15.07.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 07:28:01 -0700 (PDT)
Date: Wed, 15 May 2024 16:28:00 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, srinivas.kandagatla@linaro.org,
	broonie@kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, perex@perex.cz,
	tiwai@suse.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org,
	neil.armstrong@linaro.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: codecs: lpass-macro: add helpers to get codec
 version
Message-ID: <d77a7d51-8357-4cc0-b233-be2e18d16908@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510175835.286775-2-srinivas.kandagatla@linaro.org>

Hi,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/srinivas-kandagatla-linaro-org/ASoC-codecs-lpass-macro-add-helpers-to-get-codec-version/20240511-020042
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20240510175835.286775-2-srinivas.kandagatla%40linaro.org
patch subject: [PATCH 1/2] ASoC: codecs: lpass-macro: add helpers to get codec version
config: sparc-randconfig-r081-20240512 (https://download.01.org/0day-ci/archive/20240512/202405120735.qbbiUPaX-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202405120735.qbbiUPaX-lkp@intel.com/

smatch warnings:
sound/soc/codecs/lpass-va-macro.c:1485 va_macro_set_lpass_codec_version() error: uninitialized symbol 'version'.

vim +/version +1485 sound/soc/codecs/lpass-va-macro.c

787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1464  static void va_macro_set_lpass_codec_version(struct va_macro *va)
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1465  {
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1466  	int core_id_0 = 0, core_id_1 = 0, core_id_2 = 0, version;
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1467  
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1468  	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_0, &core_id_0);
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1469  	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_1, &core_id_1);
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1470  	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_2, &core_id_2);
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1471  
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1472  	if ((core_id_0 == 0x01) && (core_id_1 == 0x0F))
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1473  		version = LPASS_CODEC_VERSION_2_0;
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1474  	if ((core_id_0 == 0x02) && (core_id_1 == 0x0E))
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1475  		version = LPASS_CODEC_VERSION_2_1;
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1476  	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x50 || core_id_2 == 0x51))
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1477  		version = LPASS_CODEC_VERSION_2_5;
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1478  	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x60 || core_id_2 == 0x61))
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1479  		version = LPASS_CODEC_VERSION_2_6;
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1480  	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x70 || core_id_2 == 0x71))
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1481  		version = LPASS_CODEC_VERSION_2_7;
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1482  	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x80 || core_id_2 == 0x81))
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1483  		version = LPASS_CODEC_VERSION_2_8;

Uninitialized on else path.

787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1484  
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10 @1485  	lpass_macro_set_codec_version(version);
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1486  
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1487  	dev_info(va->dev, "LPASS Codec Version %s\n",
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1488  			lpass_macro_get_codec_version_string(version));
787a4e6d2bc156 Srinivas Kandagatla 2024-05-10  1489  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

