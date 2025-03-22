Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F30622FF44
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Mar 2025 17:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742664347; cv=none; b=CbfG1FWg5GrwhcmtFhDXSog0643uQ8HTPXSfIxHDo9K8W3ZOmyaNmGKSBPRv5t/RbDwW2MInduUg4w91P+rQI6/R0xrUCyH5ZICMBHCuBTfm7wqsX5ZaXcDFX1Bw5T7CBr+t8I9EX1IMk6PNzR/GWVsA4pwGU2pH7db3QqmE3E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742664347; c=relaxed/simple;
	bh=KVVLbJ1zXJko3vgx6YQzBovfOIgGOqxXxDsSp81uYyk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=l+7A331+d73fSFXkZ8rBHSn+rHgUsUbsVsBErSHzHM0MrxoSbZq6mJ/klNPdzjPhr8fByJw1Zf0Cg1r7WhmKKSgJ55VPgSCg5rUXcBAeaSvmxh+vhn3j1xUpJxaeKZxWjVpneVQvrgeFzTwlP8M33KKSIdRWa+M+4xP+bDV5Jxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eALqMrbk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eALqMrbk"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso30233145e9.0
        for <oe-kbuild@lists.linux.dev>; Sat, 22 Mar 2025 10:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742664343; x=1743269143; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F6maXy0URBuJqvOhBuuvKx2+7wYA7mqrbNOfziAWZLY=;
        b=eALqMrbkobl7K1ekbqj5vV3cE76oD4OPWuzR9pFcpnrvNngDIxrs8XQkoRqcmIYX64
         jPBnOpYAIAf9GkPJB3Dk4ZA6Nre0qiYc2iUNVmgyPcLNdHZ9Q0kfQIUye8kUCwYhTT6S
         lFeOUDtgvzOaiKh4ic5T4pQCTrF5obCYYsXl+gIdyyCZ96h+suxmQhljByg4Lpzl95Qr
         cE+CDLHbiRtitmnNPdGHrZ1e4AahfLFxvodDRX3r/IyIHmcIHaUS3dXyPa41Un/XJCE3
         vdKxg+VIPZn28Pb+IEEjWajvXlrWj7Qzk4Aq489HAy+BKNKkiHCbyjaP/stKJU5X6TeY
         cRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742664343; x=1743269143;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F6maXy0URBuJqvOhBuuvKx2+7wYA7mqrbNOfziAWZLY=;
        b=qTMIF8lU22OrCGbtZRtpx8Pul60WqL7eXllU5WKjWC1vCuxE89qj0snDFpGiDxvMcZ
         EJoDvWLix3klwFYFkcvLVGnV9jcz/hhPaKm69BQLZjvOY//6zh+QcX56xF+S7oxYqbPT
         LmnTStBs4KiRaUi6gSxJ4Cdxv9sgMjIx57Cb1yF+j6ZGUxd9pnMIVmt3EfMU6q/5+V27
         lhxE5DZ6piX0rCcdczlMgbsMSOuAt0T2OAujgFBA2cMRmpnKGWlocKNT+HbDmoSXPewa
         GO8o7Kl0Ebw8O8JSl45xEdDRVwXo/6aeL0X9FLrZIUs4+a4vR1J1AVGid/cysCBPJLkL
         4edA==
X-Gm-Message-State: AOJu0Yzzxty6eGmDPXaU7kvTE2YYVBhGCNoQL5loZ0+pAAd0DQVa5cZ/
	GYTq6v+uMHS+s94iTkoSaCrEzN580XbH3XQt5ddsepWQKu2o4PMC59VRstfEVda3geeoJfare+M
	XAW8=
X-Gm-Gg: ASbGncuOxXfLRJOk3DKqIoWNZDSb2k/U/2IGLJDAI9iNAdWbYx8JnnJRJtcKKtAjMyD
	vxyaZJl7OQL7JDkiqIlloBX/gpv1vbucAEcBWTn1TZ7j/5WchEt50fbvDK3J1G1ohuMxVSkctaY
	ACmpNdR6bZWdYYqXTB0xXnxBPElf4I/Waadmcn7IUjeY+UFIYmNmVzXoCKyizjpPI5qlpSpRvBB
	sjAMWNmBXDlC/XotXjtutQZKtt7PMf23ChVx6C9adnudo+cbOFTFWqwo2ACytOcZesxw9uzLwkw
	9px2MTpZv5Vg+Ugq2zO5+mV/aR3rhqQfIgoHjNLJqeU7wCczLg==
X-Google-Smtp-Source: AGHT+IHwieQKergX1rC+mWOvJOQ5sn9Ft8OV5mIRdJ/Pxfgl8ge9rxEOgVtIeqtby3893whER7DmRQ==
X-Received: by 2002:a05:600c:5742:b0:43c:e70d:44f0 with SMTP id 5b1f17b1804b1-43d510fff60mr50928825e9.19.1742664342720;
        Sat, 22 Mar 2025 10:25:42 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d4fd26cecsm61977195e9.17.2025.03.22.10.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 10:25:42 -0700 (PDT)
Date: Sat, 22 Mar 2025 20:25:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, David Lechner <dlechner@baylibre.com>,
	Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Angelo Dureghello <adureghello@baylibre.com>,
	Alexandru Ardelean <aardelean@baylibre.com>,
	Beniamin Bia <beniamin.bia@analog.com>,
	Stefan Popa <stefan.popa@analog.com>, linux-kernel@vger.kernel.org,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Subject: Re: [PATCH v2 09/10] iio: adc: ad7606: dynamically allocate channel
 info
Message-ID: <72d776ae-4373-4a78-ba00-fa809478b453@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-iio-adc-ad7606-improvements-v2-9-4b605427774c@baylibre.com>

Hi David,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/David-Lechner/iio-adc-ad7606-check-for-NULL-before-calling-sw_mode_config/20250319-065737
base:   9f36acefb2621d980734a5bb7d74e0e24e0af166
patch link:    https://lore.kernel.org/r/20250318-iio-adc-ad7606-improvements-v2-9-4b605427774c%40baylibre.com
patch subject: [PATCH v2 09/10] iio: adc: ad7606: dynamically allocate channel info
config: arm64-randconfig-r071-20250322 (https://download.01.org/0day-ci/archive/20250322/202503222246.RafigmhQ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503222246.RafigmhQ-lkp@intel.com/

smatch warnings:
drivers/iio/adc/ad7606.c:1270 ad7606_probe_channels() warn: potentially one past the end of array 'channels[i]'

vim +1270 drivers/iio/adc/ad7606.c

87cf5705725eeb David Lechner      2025-03-18  1196  static int ad7606_probe_channels(struct iio_dev *indio_dev)
e571c1902116a3 Alexandru Ardelean 2024-09-19  1197  {
e571c1902116a3 Alexandru Ardelean 2024-09-19  1198  	struct ad7606_state *st = iio_priv(indio_dev);
87cf5705725eeb David Lechner      2025-03-18  1199  	struct device *dev = indio_dev->dev.parent;
87cf5705725eeb David Lechner      2025-03-18  1200  	struct iio_chan_spec *channels;
87cf5705725eeb David Lechner      2025-03-18  1201  	bool slow_bus;
87cf5705725eeb David Lechner      2025-03-18  1202  	int ret, i;
87cf5705725eeb David Lechner      2025-03-18  1203  
87cf5705725eeb David Lechner      2025-03-18  1204  	slow_bus = !st->bops->iio_backend_config;
87cf5705725eeb David Lechner      2025-03-18  1205  	indio_dev->num_channels = st->chip_info->num_adc_channels;
87cf5705725eeb David Lechner      2025-03-18  1206  
87cf5705725eeb David Lechner      2025-03-18  1207  	/* Slow buses also get 1 more channel for soft timestamp */
87cf5705725eeb David Lechner      2025-03-18  1208  	if (slow_bus)
87cf5705725eeb David Lechner      2025-03-18  1209  		indio_dev->num_channels++;
87cf5705725eeb David Lechner      2025-03-18  1210  
87cf5705725eeb David Lechner      2025-03-18  1211  	channels = devm_kcalloc(dev, indio_dev->num_channels, sizeof(*channels),
87cf5705725eeb David Lechner      2025-03-18  1212  				GFP_KERNEL);
87cf5705725eeb David Lechner      2025-03-18  1213  	if (!channels)
f3838e934dfff2 Alexandru Ardelean 2024-09-19  1214  		return -ENOMEM;
f3838e934dfff2 Alexandru Ardelean 2024-09-19  1215  
87cf5705725eeb David Lechner      2025-03-18  1216  	for (i = 0; i < indio_dev->num_channels; i++) {
87cf5705725eeb David Lechner      2025-03-18  1217  		struct iio_chan_spec *chan = &channels[i];
87cf5705725eeb David Lechner      2025-03-18  1218  
87cf5705725eeb David Lechner      2025-03-18  1219  		chan->type = IIO_VOLTAGE;
87cf5705725eeb David Lechner      2025-03-18  1220  		chan->indexed = 1;
87cf5705725eeb David Lechner      2025-03-18  1221  		chan->channel = i;
87cf5705725eeb David Lechner      2025-03-18  1222  		chan->scan_index = i;
87cf5705725eeb David Lechner      2025-03-18  1223  		chan->scan_type.sign = 's';
87cf5705725eeb David Lechner      2025-03-18  1224  		chan->scan_type.realbits = st->chip_info->bits;
87cf5705725eeb David Lechner      2025-03-18  1225  		chan->scan_type.storagebits = st->chip_info->bits > 16 ? 32 : 16;
87cf5705725eeb David Lechner      2025-03-18  1226  		chan->scan_type.endianness = IIO_CPU;
f3838e934dfff2 Alexandru Ardelean 2024-09-19  1227  
87cf5705725eeb David Lechner      2025-03-18  1228  		if (indio_dev->modes & INDIO_DIRECT_MODE)
87cf5705725eeb David Lechner      2025-03-18  1229  			chan->info_mask_separate |= BIT(IIO_CHAN_INFO_RAW);
87cf5705725eeb David Lechner      2025-03-18  1230  
87cf5705725eeb David Lechner      2025-03-18  1231  		if (st->sw_mode_en) {
87cf5705725eeb David Lechner      2025-03-18  1232  			chan->info_mask_separate |= BIT(IIO_CHAN_INFO_SCALE);
87cf5705725eeb David Lechner      2025-03-18  1233  			chan->info_mask_separate_available |=
87cf5705725eeb David Lechner      2025-03-18  1234  				BIT(IIO_CHAN_INFO_SCALE);
87cf5705725eeb David Lechner      2025-03-18  1235  
87cf5705725eeb David Lechner      2025-03-18  1236  			/*
87cf5705725eeb David Lechner      2025-03-18  1237  			 * All chips with software mode support oversampling,
87cf5705725eeb David Lechner      2025-03-18  1238  			 * so we skip the oversampling_available check. And the
87cf5705725eeb David Lechner      2025-03-18  1239  			 * shared_by_type instead of shared_by_all on slow
87cf5705725eeb David Lechner      2025-03-18  1240  			 * buses is for backward compatibility.
87cf5705725eeb David Lechner      2025-03-18  1241  			 */
87cf5705725eeb David Lechner      2025-03-18  1242  			if (slow_bus)
87cf5705725eeb David Lechner      2025-03-18  1243  				chan->info_mask_shared_by_type |=
87cf5705725eeb David Lechner      2025-03-18  1244  					BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO);
87cf5705725eeb David Lechner      2025-03-18  1245  			else
87cf5705725eeb David Lechner      2025-03-18  1246  				chan->info_mask_shared_by_all |=
87cf5705725eeb David Lechner      2025-03-18  1247  					BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO);
87cf5705725eeb David Lechner      2025-03-18  1248  
87cf5705725eeb David Lechner      2025-03-18  1249  			chan->info_mask_shared_by_all_available |=
87cf5705725eeb David Lechner      2025-03-18  1250  				BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO);
87cf5705725eeb David Lechner      2025-03-18  1251  		} else {
87cf5705725eeb David Lechner      2025-03-18  1252  			chan->info_mask_shared_by_type |=
87cf5705725eeb David Lechner      2025-03-18  1253  				BIT(IIO_CHAN_INFO_SCALE);
87cf5705725eeb David Lechner      2025-03-18  1254  
87cf5705725eeb David Lechner      2025-03-18  1255  			if (st->chip_info->oversampling_avail)
87cf5705725eeb David Lechner      2025-03-18  1256  				chan->info_mask_shared_by_all |=
87cf5705725eeb David Lechner      2025-03-18  1257  					BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO);
87cf5705725eeb David Lechner      2025-03-18  1258  		}
87cf5705725eeb David Lechner      2025-03-18  1259  
87cf5705725eeb David Lechner      2025-03-18  1260  		if (!slow_bus)
87cf5705725eeb David Lechner      2025-03-18  1261  			chan->info_mask_shared_by_all |=
87cf5705725eeb David Lechner      2025-03-18  1262  				BIT(IIO_CHAN_INFO_SAMP_FREQ);
87cf5705725eeb David Lechner      2025-03-18  1263  
87cf5705725eeb David Lechner      2025-03-18  1264  		ret = st->chip_info->scale_setup_cb(indio_dev, chan);
e571c1902116a3 Alexandru Ardelean 2024-09-19  1265  		if (ret)
e571c1902116a3 Alexandru Ardelean 2024-09-19  1266  			return ret;
e571c1902116a3 Alexandru Ardelean 2024-09-19  1267  	}
e571c1902116a3 Alexandru Ardelean 2024-09-19  1268  
87cf5705725eeb David Lechner      2025-03-18  1269  	if (slow_bus)
87cf5705725eeb David Lechner      2025-03-18 @1270  		channels[i] = (struct iio_chan_spec)IIO_CHAN_SOFT_TIMESTAMP(i);
                                                                ^^^^^^^^^^^
i is == indio_dev->num_channels so this is out of bounds by one element.

87cf5705725eeb David Lechner      2025-03-18  1271  
87cf5705725eeb David Lechner      2025-03-18  1272  	indio_dev->channels = channels;
87cf5705725eeb David Lechner      2025-03-18  1273  
e571c1902116a3 Alexandru Ardelean 2024-09-19  1274  	return 0;
e571c1902116a3 Alexandru Ardelean 2024-09-19  1275  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

