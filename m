Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4658414600A
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Apr 2024 10:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712830491; cv=none; b=Ov20yr8iBmXy1PE9MhEYKUwNJShNN77AI9sv/rfPoNdA/79fRlV49iTzOC/Ks12gvrps0rVk8TKbago/ybIzJQsSQSH51TquCR8yyL3C1KIFjjk9LRYc2Za8EEkFKDRmbI5yBNT2RT/r59C5lMnA6/AYiMvZ6hQ0qLj1HHRdDIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712830491; c=relaxed/simple;
	bh=Ro4zNuPSWHSKjEXhMBVb7OaDehxO2HvJvxpKYV/yalc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=RpLC1R8+0HNwDlc8sfwXn+R0gRLjOv2BB4Jt0fJnFAP3kKPGczJnLhApekNgOjNmbj/TnWWk345C8CqpTX/sdRMm+PSs1aom6H1nf67LSMW5Jb/oWt77DVKv1+QLPeifXeko+NPyDXlTU172EVQ/6CmiwWX5lUN+bKHi88z0pVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ch4G4BzX; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ch4G4BzX"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a52140ea1b5so180453066b.1
        for <oe-kbuild@lists.linux.dev>; Thu, 11 Apr 2024 03:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712830487; x=1713435287; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uyqVf+OpAIYpCuv7GCxTIF9Y563uamtHxxOdFear55A=;
        b=Ch4G4BzX/sUy2Uudpn1JH98D+eokXXSxpy8WFhBc/v4xCAmGMfkz10kU+1Bwj2oYi+
         C5JfvOeINdh7sksVi5VFKEY1b2YkuR4vWurCHooZl7j3Je6YV7AUPbYAUhsH3w5YdcEb
         FjLOtCclngpPrlX7vBPo4/fA4ceSFZfuePeuxoPDuRVVXJB1ZVUdJqncs+aFTxeK70/w
         7O3K5brgwrW0fEO4QjW61g13deryeRpvLQlLg8ME0BC42oe8ahOm5hJZH/C9l6kufPWL
         jEj7S4P00NNmK3rTFss0xnVDc7lfCW325GZMvCTqq5ZdA3LRnu34Pfp1ssrj9hGlZqCN
         BBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712830487; x=1713435287;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uyqVf+OpAIYpCuv7GCxTIF9Y563uamtHxxOdFear55A=;
        b=eZdwvqmkZjTAbctp5pxrkjRdUCte5ecl6JDZwfXfzLsOcQ6tdDHPrxWxmrNDl8axn3
         UU23iZoYFy6keoSWJUTIOtzNMFwDBOJJC78enOOzvp67p8mmgOqTDwCgveFFgQdyEo+z
         47wr0aJjPHQXUqzrNuXK0dOyVLsEpk8tE8my8ea1vpTODjAhyEvuJMhtI+JDYxqJSu1+
         JIvBP28H9YcsuYvqTGLWpxyJGKd/ZSiakIVHo0XrG4u9UzyykwJvRBCuUmYjheTEBqy0
         r4wLTLmJrjWZavAEJrslA0V0eJEhvFa/CDcicMr6XuWcbyZ05cU9h7NHlR31YX8oCM9m
         7IhQ==
X-Gm-Message-State: AOJu0Yx+1yofdgVsTadG38opPiQmCvPHkPGp6tu7PKT/VocbTfvVbz1n
	aFC31pZFlRl00ZOTl5oCvj3MnMInbgwhXZ2EyqeLh7iYVjYpkNhc8JPfd39c5RI/w//7JisTHN1
	x
X-Google-Smtp-Source: AGHT+IHAnUZdwvtVa8ZUuHX83NGxaIWqh40qONfeK3Tt0qZB9/nouy9O2FEbNFtC1J0M+QLiMGWZuw==
X-Received: by 2002:a17:906:c142:b0:a50:f172:6994 with SMTP id dp2-20020a170906c14200b00a50f1726994mr3789722ejc.73.1712830487188;
        Thu, 11 Apr 2024 03:14:47 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id n13-20020a170906088d00b00a52196cce80sm606310eje.121.2024.04.11.03.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 03:14:46 -0700 (PDT)
Date: Thu, 11 Apr 2024 13:14:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Thomas Haemmerle <thomas.haemmerle@leica-geosystems.com>,
	joel@jms.id.au
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	bsp-development.geo@leica-geosystems.com,
	Thomas Haemmerle <thomas.haemmerle@leica-geosystems.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] iio: pressure: dps310: introduce consistent error
 handling
Message-ID: <cbdafb33-fd3b-47ad-a678-83fa92475278@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240410103604.992989-3-thomas.haemmerle@leica-geosystems.com>

Hi Thomas,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Haemmerle/iio-pressure-dps310-support-negative-temperature-values/20240410-183937
base:   2c71fdf02a95b3dd425b42f28fd47fb2b1d22702
patch link:    https://lore.kernel.org/r/20240410103604.992989-3-thomas.haemmerle%40leica-geosystems.com
patch subject: [PATCH v2 2/4] iio: pressure: dps310: introduce consistent error handling
config: i386-randconfig-141-20240411 (https://download.01.org/0day-ci/archive/20240411/202404110708.7BQYVa7Z-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202404110708.7BQYVa7Z-lkp@intel.com/

smatch warnings:
drivers/iio/pressure/dps310.c:497 dps310_read_pres_raw() warn: inconsistent returns '&data->lock'.
drivers/iio/pressure/dps310.c:541 dps310_read_temp_raw() warn: inconsistent returns '&data->lock'.

vim +497 drivers/iio/pressure/dps310.c

d711a3c7dc829c Eddie James      2019-05-20  466  static int dps310_read_pres_raw(struct dps310_data *data)
ba6ec48e76bcd4 Joel Stanley     2019-05-20  467  {
ba6ec48e76bcd4 Joel Stanley     2019-05-20  468  	int rc;
ba6ec48e76bcd4 Joel Stanley     2019-05-20  469  	int rate;
ba6ec48e76bcd4 Joel Stanley     2019-05-20  470  	int timeout;
ba6ec48e76bcd4 Joel Stanley     2019-05-20  471  	s32 raw;
ba6ec48e76bcd4 Joel Stanley     2019-05-20  472  	u8 val[3];
ba6ec48e76bcd4 Joel Stanley     2019-05-20  473  
ba6ec48e76bcd4 Joel Stanley     2019-05-20  474  	if (mutex_lock_interruptible(&data->lock))
ba6ec48e76bcd4 Joel Stanley     2019-05-20  475  		return -EINTR;
ba6ec48e76bcd4 Joel Stanley     2019-05-20  476  
f3e28d813ae8d1 Thomas Haemmerle 2024-04-10  477  	rc = dps310_get_pres_samp_freq(data, &rate);
f3e28d813ae8d1 Thomas Haemmerle 2024-04-10  478  	if (rc)
f3e28d813ae8d1 Thomas Haemmerle 2024-04-10  479  		return rc;

goto unlock

f3e28d813ae8d1 Thomas Haemmerle 2024-04-10  480  
ba6ec48e76bcd4 Joel Stanley     2019-05-20  481  	timeout = DPS310_POLL_TIMEOUT_US(rate);
ba6ec48e76bcd4 Joel Stanley     2019-05-20  482  
ba6ec48e76bcd4 Joel Stanley     2019-05-20  483  	/* Poll for sensor readiness; base the timeout upon the sample rate. */
7b4ab4abcea4c0 Eddie James      2022-09-15  484  	rc = dps310_ready(data, DPS310_PRS_RDY, timeout);
d711a3c7dc829c Eddie James      2019-05-20  485  	if (rc)
d711a3c7dc829c Eddie James      2019-05-20  486  		goto done;
d711a3c7dc829c Eddie James      2019-05-20  487  
d711a3c7dc829c Eddie James      2019-05-20  488  	rc = regmap_bulk_read(data->regmap, DPS310_PRS_BASE, val, sizeof(val));
ba6ec48e76bcd4 Joel Stanley     2019-05-20  489  	if (rc < 0)
ba6ec48e76bcd4 Joel Stanley     2019-05-20  490  		goto done;
ba6ec48e76bcd4 Joel Stanley     2019-05-20  491  
d711a3c7dc829c Eddie James      2019-05-20  492  	raw = (val[0] << 16) | (val[1] << 8) | val[2];
d711a3c7dc829c Eddie James      2019-05-20  493  	data->pressure_raw = sign_extend32(raw, 23);
d711a3c7dc829c Eddie James      2019-05-20  494  
d711a3c7dc829c Eddie James      2019-05-20  495  done:
d711a3c7dc829c Eddie James      2019-05-20  496  	mutex_unlock(&data->lock);
d711a3c7dc829c Eddie James      2019-05-20 @497  	return rc;
d711a3c7dc829c Eddie James      2019-05-20  498  }

[ snip ]

d711a3c7dc829c Eddie James      2019-05-20  517  static int dps310_read_temp_raw(struct dps310_data *data)
d711a3c7dc829c Eddie James      2019-05-20  518  {
d711a3c7dc829c Eddie James      2019-05-20  519  	int rc;
d711a3c7dc829c Eddie James      2019-05-20  520  	int rate;
d711a3c7dc829c Eddie James      2019-05-20  521  	int timeout;
d711a3c7dc829c Eddie James      2019-05-20  522  
d711a3c7dc829c Eddie James      2019-05-20  523  	if (mutex_lock_interruptible(&data->lock))
d711a3c7dc829c Eddie James      2019-05-20  524  		return -EINTR;
d711a3c7dc829c Eddie James      2019-05-20  525  
f3e28d813ae8d1 Thomas Haemmerle 2024-04-10  526  	rc = dps310_get_temp_samp_freq(data, &rate);
f3e28d813ae8d1 Thomas Haemmerle 2024-04-10  527  	if (rc)
f3e28d813ae8d1 Thomas Haemmerle 2024-04-10  528  		return rc;

goto unlock

f3e28d813ae8d1 Thomas Haemmerle 2024-04-10  529  
d711a3c7dc829c Eddie James      2019-05-20  530  	timeout = DPS310_POLL_TIMEOUT_US(rate);
d711a3c7dc829c Eddie James      2019-05-20  531  
d711a3c7dc829c Eddie James      2019-05-20  532  	/* Poll for sensor readiness; base the timeout upon the sample rate. */
7b4ab4abcea4c0 Eddie James      2022-09-15  533  	rc = dps310_ready(data, DPS310_TMP_RDY, timeout);
7b4ab4abcea4c0 Eddie James      2022-09-15  534  	if (rc)
d711a3c7dc829c Eddie James      2019-05-20  535  		goto done;
d711a3c7dc829c Eddie James      2019-05-20  536  
d711a3c7dc829c Eddie James      2019-05-20  537  	rc = dps310_read_temp_ready(data);
d711a3c7dc829c Eddie James      2019-05-20  538  
ba6ec48e76bcd4 Joel Stanley     2019-05-20  539  done:
ba6ec48e76bcd4 Joel Stanley     2019-05-20  540  	mutex_unlock(&data->lock);
ba6ec48e76bcd4 Joel Stanley     2019-05-20 @541  	return rc;
ba6ec48e76bcd4 Joel Stanley     2019-05-20  542  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

