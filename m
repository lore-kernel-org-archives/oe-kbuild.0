Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6706C8632C
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Feb 2025 05:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738647041; cv=none; b=rQurhvG2fLgmTHbtUEM7+tu88ApvLI3F39LDsWUpybSpPFNARk1tpUJNN146BKyg+6At8ibaWi8XuvBl0L11ZGrkt0Dj3i/NmyxsW1uvMxOQp0MktI+taDSZJfTMfH7UUeM6qo8z9iWUnX6P9R5GBvgE8zlXZ3jGVTayZ4noqxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738647041; c=relaxed/simple;
	bh=jVf6rFz+4wJsovQQSeWtcCM027Tk2L0VLflRaNzXMKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V2KEGbM5KpNjc++NL2lIfnn/zBvkERilcf3qC9OKy8aYuEVW/YQmXUgjf+2mlb9BMR4MWxoSNMVJ/emCqvv7e8MTI9c3BrdzW8Hn/JOLeclVMR7LLuxmFojOCiQXJ3ndkn6zzsnlTwUUHbrL41+r1t5PnVNlKFRrd1CJiNynl3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SCGHRmqz; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SCGHRmqz"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso36424185e9.1
        for <oe-kbuild@lists.linux.dev>; Mon, 03 Feb 2025 21:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738647037; x=1739251837; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9l5BK06s55HfdfRfg+yeGfLu0Dfk6CieqLLbpj9NArI=;
        b=SCGHRmqzS/X5FeDXRFxe4jKgwPObg1kWHE/KmQPOhWFgKMALzqjRpuwXdLwJRS9a0p
         hFoMQ8CE2+czTBu8r1QnTSO4JDV9FU4jIGNNzpiBfbIhvrVIhKzgteKGc9oe0nhU2EBr
         4dYWdd5uHVFLvoQ1QwjcxYP3QfBhl9AEHzm88zWOY1C+91yYnrpukHdqri+OQpZT035U
         5/ObLa/7hq0YJ3rEHLsqPkv9Zt9SuPQAYh07UvOSW9SC9GVy/KAGNSPWrPQ1mRSZswLv
         rILx2M7yyfX2UcxC8Ro6mbVX1tbzUrlCTWEQyZq9emXfNCMo+5LQJx5+Q0ZaI+ublRqo
         ZmCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738647037; x=1739251837;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9l5BK06s55HfdfRfg+yeGfLu0Dfk6CieqLLbpj9NArI=;
        b=dr1UDtDdcunb+B4XBpeoknqnZ+ETHFWMmPr7+r/gIbFhjKRrQuTr52LSLa/NQXv7C1
         n9POqJhuuw5l5iMTNMccEWSwTkoqkk8rHo26A9yHWT+fimN6YqaLUT3D5HiY1T35IMgq
         CXRpaSRrsSJSB6uxEsAz7167ANROLvZcSgItwHWkn9LCVZpoqYKqcwus2IFY613FBdI0
         EJkzYfKCY+eFdGeyuvte8nW3uTb8FFCB0JsjRnG2ENwRR02TN+/gA3K0WS72C4GI0K/e
         +OJMDq3HQn+ki6ku9HjHM+51lnUjbB/wX9mdBDGT8mBSUXpj2/fG3ONSALrHV24opf8V
         osUQ==
X-Gm-Message-State: AOJu0Ywdeqm6qhXlApkbJhRyRY8uk7R4o9TLu7OA06txDBbFdkNHUPRR
	+1qsVWNRqehESn5rz2gCtyBr32yraRVgTjFBzvfEMMNdeaCiglcUOpU0KVyxMFC08qmLdR+RhEp
	5
X-Gm-Gg: ASbGnct/L3RH9AomJ0J7bJ0rIuV5Z3cMgAg6pE9r+8rHrw2rxeop0UGIn/Z1CXYLIv+
	JI5GH8/GW20QEjnOnFbDmlA0GoGHlF+x1qGKZ2V8X5H712vVcTyf3xeiqDYZtlPIbojSORXl+JO
	CXam5UjLzYX+MYnIC6sO3x392hoGXRsio9/TYp/PnhFj1JIgCcGVb3QIvqPpZVBYnccBoDG9CCW
	iTZVKJE18dx+tPg68vKTswye0cWKEbZRr3SoPSoy9A3kfuCvBucIa4L2YVWv+SWbD/6jTS6VIFH
	41YbrKbGNkyg4SKf2j0V
X-Google-Smtp-Source: AGHT+IFtxaHkNBSmACRD5npu5hrod1FX36ln3WWjyUEAmdq/KGt+QV9FAjFwNNJKqN2sWwnOEM1jzQ==
X-Received: by 2002:a05:600c:3d9b:b0:434:effb:9f8a with SMTP id 5b1f17b1804b1-438dc3c3554mr221613835e9.15.1738647036975;
        Mon, 03 Feb 2025 21:30:36 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-438dcc13151sm211443905e9.1.2025.02.03.21.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 21:30:36 -0800 (PST)
Date: Tue, 4 Feb 2025 08:30:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [jic23-iio:sparse-friendly-direct-mode 90/166]
 drivers/iio/adc/stm32-dfsdm-adc.c:1320 __stm32_dfsdm_read_info_raw() error:
 uninitialized symbol 'ret'.
Message-ID: <08a7a56e-c4ed-41ed-92af-6cd8091777de@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git sparse-friendly-direct-mode
head:   2d042931355bda7a2fd9e7f81d0be99c3669af4f
commit: 92540659cab57f14a1fc6615b93e4adb97b51acd [90/166] iio: adc: stm32-dfsdm: Factor out core of reading INFO_RAW
config: m68k-randconfig-r071-20250204 (https://download.01.org/0day-ci/archive/20250204/202502040918.N96TGHTV-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502040918.N96TGHTV-lkp@intel.com/

smatch warnings:
drivers/iio/adc/stm32-dfsdm-adc.c:1320 __stm32_dfsdm_read_info_raw() error: uninitialized symbol 'ret'.

vim +/ret +1320 drivers/iio/adc/stm32-dfsdm-adc.c

92540659cab57f Jonathan Cameron 2025-01-19  1309  static int __stm32_dfsdm_read_info_raw(struct iio_dev *indio_dev,
92540659cab57f Jonathan Cameron 2025-01-19  1310  				       struct iio_chan_spec const *chan,
92540659cab57f Jonathan Cameron 2025-01-19  1311  				       int *val)
e2e6771c646251 Arnaud Pouliquen 2018-01-10  1312  {
e2e6771c646251 Arnaud Pouliquen 2018-01-10  1313  	struct stm32_dfsdm_adc *adc = iio_priv(indio_dev);
e2e6771c646251 Arnaud Pouliquen 2018-01-10  1314  	int ret;
e2e6771c646251 Arnaud Pouliquen 2018-01-10  1315  
3208fa0cd91914 Olivier Moysan   2024-07-30  1316  	if (adc->hwc)
e2e6771c646251 Arnaud Pouliquen 2018-01-10  1317  		ret = iio_hw_consumer_enable(adc->hwc);
6fc839dc320cd6 Olivier Moysan   2024-07-30  1318  	if (adc->backend)
92540659cab57f Jonathan Cameron 2025-01-19  1319  		ret = iio_backend_enable(adc->backend[chan->scan_index]);

Could both adc->hwc and adc->backend be false?

e2e6771c646251 Arnaud Pouliquen 2018-01-10 @1320  	if (ret < 0) {
                                                            ^^^
Uninitialized warning

e2e6771c646251 Arnaud Pouliquen 2018-01-10  1321  		dev_err(&indio_dev->dev,
e2e6771c646251 Arnaud Pouliquen 2018-01-10  1322  			"%s: IIO enable failed (channel %d)\n",
e2e6771c646251 Arnaud Pouliquen 2018-01-10  1323  			__func__, chan->channel);
e2e6771c646251 Arnaud Pouliquen 2018-01-10  1324  		return ret;
e2e6771c646251 Arnaud Pouliquen 2018-01-10  1325  	}
e2e6771c646251 Arnaud Pouliquen 2018-01-10  1326  	ret = stm32_dfsdm_single_conv(indio_dev, chan, val);
3208fa0cd91914 Olivier Moysan   2024-07-30  1327  	if (adc->hwc)
e2e6771c646251 Arnaud Pouliquen 2018-01-10  1328  		iio_hw_consumer_disable(adc->hwc);
6fc839dc320cd6 Olivier Moysan   2024-07-30  1329  	if (adc->backend)
92540659cab57f Jonathan Cameron 2025-01-19  1330  		iio_backend_disable(adc->backend[chan->scan_index]);
e2e6771c646251 Arnaud Pouliquen 2018-01-10  1331  	if (ret < 0) {
e2e6771c646251 Arnaud Pouliquen 2018-01-10  1332  		dev_err(&indio_dev->dev,
e2e6771c646251 Arnaud Pouliquen 2018-01-10  1333  			"%s: Conversion failed (channel %d)\n",
e2e6771c646251 Arnaud Pouliquen 2018-01-10  1334  			__func__, chan->channel);
e2e6771c646251 Arnaud Pouliquen 2018-01-10  1335  		return ret;
e2e6771c646251 Arnaud Pouliquen 2018-01-10  1336  	}
92540659cab57f Jonathan Cameron 2025-01-19  1337  
92540659cab57f Jonathan Cameron 2025-01-19  1338  	return 0;
92540659cab57f Jonathan Cameron 2025-01-19  1339  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

