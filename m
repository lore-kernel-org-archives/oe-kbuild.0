Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAEA1F5616
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Mar 2025 06:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741069372; cv=none; b=bB0vPTLY4uouZJX4fjNp1Vql93iJK6tam/UupdqchaxvvE1gxRQV0YFLzoWAVUHxPmIZcuv+UJsMxvOdAGp085hqZgrT5QZdwJlDkUVCSf4AzX7GuMZ1tF4c1W6zGB9eZtLjElestXd0kgw7QrbCIPKwqjMQ5Az1B1e69ffBMDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741069372; c=relaxed/simple;
	bh=IyhGZhnWIBn0jvruWRTAvG5NLOVYdpyDyp7GL/dmDE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OE0DhdIW8bgLg7bGcS6wLSXIK1lINbv1UFtd+VCIY9Bp5qr+mOdIFBMx3euOutK0Px/XBxv7rR9CeG+60ZkyvRCeV3Wg4SHVOmGoJlI3CcfdqZC8RmPvsaCQza4aEv776WHSP8+oLL/32rTlkILrhAlIsxqiofxXP17LAmvgJHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XYMBZ46f; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XYMBZ46f"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-abf64aa2a80so433094166b.0
        for <oe-kbuild@lists.linux.dev>; Mon, 03 Mar 2025 22:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741069368; x=1741674168; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OwWzF3qO3EeomBgOmxoSufGAVHiiyZBe/i38M0NXAc4=;
        b=XYMBZ46fbW0QhkJntf/DH+KylNyKRZXLunfVZrxbvNwEV3cPL5W9YauBsa64kocCqW
         TZTy5KDpYzOWxChq2/IzJaEwfc/mbtRYwyrkEyCmqZ3ioUcp+75iq9pEkRqy5ssnKE39
         ARzRAGt8sZAG7bMW7+4puIHg8lQbDDopBKLmKf25KSvRI2f1GVlTjsKmq0ayJcPlPzkL
         YYjUyqhkXWhhajKyW6YlZF2tuik00TPFk+M4lgXqqEb3pIFqL+e99hiNoR2b0CGuCVtV
         OcVxhLQrMocWEfojsF9JKIuz/XAaSjJYoNW8q1AkoNOrTq/L6Fwv4gXWdAEfT61NdXoZ
         8xaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741069368; x=1741674168;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OwWzF3qO3EeomBgOmxoSufGAVHiiyZBe/i38M0NXAc4=;
        b=IPNJ+7ML2lQCUaYH6iBE6quvR3e+6erpB/pEZIa4Hw5zA9PPdnEp9SKwkK9l/B0ekJ
         rELUaH3jl5OISlCejhZCULAB1hjq3D3QQFS30HurSTdjoBKhyR3JuJ63ZgSJS0SbJ9jx
         Tdm/VKBEIO3TnQnKmEABR2cMx1UmEuT+CRuLHZT8nctQ7yZf2sczZ1/lSHJ2GqST5WF0
         OsWpUOAmv2v625EJWBj+ngY9QiPABtouUigE5BDhfO46dni10ttKy9Tt4grZEGWUNgUS
         uYBwcsvZZxwDMrx0ldWyI1crWgMbnNMYAWK0qeOM8oCmbSm9TpZyOcwQjvf3XgmeldgJ
         gCmw==
X-Gm-Message-State: AOJu0Yx74KpQM799xjer0yXukYHxDoUKvTZRzqpkt2gToW0F+P9IXk+f
	LyqrTNWBcfZKvf25tcetwAqVBSwQ3LRXseIkneEvWlE9T8X6e9X/r1a3aWm9hqKQuu/PIKrrjYe
	k
X-Gm-Gg: ASbGnctGzcXoTIsgI3sQ1341M/DXTg5smaLLCugn8xHjQSMAKW9/vv8ufPT7q85YTyD
	TuifYuUOeckj6Moh81ZrtpsEuwewn4dwqo29EDFUPtMm/z2t4QtJYpmZyLHChbcqRSrxPagaAbG
	B65ByqZwWQy1WgUctxM4wZYjEAEdC5SMf9MC6fNfjdccWy/U5u1LvGoQqlLBNkcq4N1PH/8OXWi
	7ICM4OU8IRS+LoczcDK2jihOxFy57/cCNcxNT7m4DrgjyvNHOZ+mpHXjbvvzX348zHb0/CHxQIA
	rNRcrDCL9vqVPz8TkMgBZVI4I577TF5KuGLhHJ+Hp5TEUfMZFg==
X-Google-Smtp-Source: AGHT+IGmS6khoJfOiH1EroTIAz5bnSkgVeVoLNfoxOdsN9TdIb6gPZqUccje67WKTprI5c+bCLOSCg==
X-Received: by 2002:a17:907:da9:b0:ac1:dc35:8337 with SMTP id a640c23a62f3a-ac1dc358524mr503133966b.38.1741069368037;
        Mon, 03 Mar 2025 22:22:48 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac1e09a9fbesm184617766b.19.2025.03.03.22.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 22:22:47 -0800 (PST)
Date: Tue, 4 Mar 2025 09:22:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Esteban Blanc <eblanc@baylibre.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [linux-next:master 3206/7719] drivers/iio/adc/ad4030.c:378
 ad4030_get_chan_scale() error: 'scan_type' dereferencing possible ERR_PTR()
Message-ID: <03ab29ed-f96f-467e-b5bd-4ccfea780191@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   cd3215bbcb9d4321def93fea6cfad4d5b42b9d1d
commit: 949abd1ca5a4342d9fb8c774035222e65dd1cfe4 [3206/7719] iio: adc: ad4030: add averaging support
config: openrisc-randconfig-r071-20250304 (https://download.01.org/0day-ci/archive/20250304/202503040954.n6MhjSsV-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503040954.n6MhjSsV-lkp@intel.com/

smatch warnings:
drivers/iio/adc/ad4030.c:378 ad4030_get_chan_scale() error: 'scan_type' dereferencing possible ERR_PTR()

vim +/scan_type +378 drivers/iio/adc/ad4030.c

0cb8b324852f3e3 Esteban Blanc 2025-02-14  366  static int ad4030_get_chan_scale(struct iio_dev *indio_dev,
0cb8b324852f3e3 Esteban Blanc 2025-02-14  367  				 struct iio_chan_spec const *chan,
0cb8b324852f3e3 Esteban Blanc 2025-02-14  368  				 int *val,
0cb8b324852f3e3 Esteban Blanc 2025-02-14  369  				 int *val2)
0cb8b324852f3e3 Esteban Blanc 2025-02-14  370  {
0cb8b324852f3e3 Esteban Blanc 2025-02-14  371  	struct ad4030_state *st = iio_priv(indio_dev);
949abd1ca5a4342 Esteban Blanc 2025-02-14  372  	const struct iio_scan_type *scan_type;
0cb8b324852f3e3 Esteban Blanc 2025-02-14  373  
0cb8b324852f3e3 Esteban Blanc 2025-02-14  374  	if (chan->differential) {
949abd1ca5a4342 Esteban Blanc 2025-02-14  375  		scan_type = iio_get_current_scan_type(indio_dev,
949abd1ca5a4342 Esteban Blanc 2025-02-14  376  						      st->chip->channels);


Do we need an if (IS_ERR(scan_type)) return;?

0cb8b324852f3e3 Esteban Blanc 2025-02-14  377  		*val = (st->vref_uv * 2) / MILLI;
949abd1ca5a4342 Esteban Blanc 2025-02-14 @378  		*val2 = scan_type->realbits;
0cb8b324852f3e3 Esteban Blanc 2025-02-14  379  		return IIO_VAL_FRACTIONAL_LOG2;
0cb8b324852f3e3 Esteban Blanc 2025-02-14  380  	}
0cb8b324852f3e3 Esteban Blanc 2025-02-14  381  
0cb8b324852f3e3 Esteban Blanc 2025-02-14  382  	*val = st->vref_uv / MILLI;
0cb8b324852f3e3 Esteban Blanc 2025-02-14  383  	*val2 = chan->scan_type.realbits;
0cb8b324852f3e3 Esteban Blanc 2025-02-14  384  	return IIO_VAL_FRACTIONAL_LOG2;
0cb8b324852f3e3 Esteban Blanc 2025-02-14  385  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

