Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F9A1D9A5E
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Oct 2024 09:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728985137; cv=none; b=dJu6cdBSnTatZureq3Qn2blwOvhyLPG8qgrlbZnnUs7mqmWXRrtpnA7RBMHlEfJOO4jNwAXxv7fGaiYmqLz+obk25ykWmMVNN1dIYBwnl3tG2ogNkX8VLxLA3fw+g6X4YLKsMAAGegxcDkTJCgp31bP3neSTa9GXvUeXu5OMmVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728985137; c=relaxed/simple;
	bh=BRwLXdhHh3Vz3/DnJ8+ebKBume2ui14fXBbSklIUOeo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QASc2fq1BObMlUjhJtrc8lQ0/B9GAAm52Rvsf6yEDS2nPs8WsrI+MsTswaXAIANXkZkabOHkcYeDMkU7+L61BGOOiLMPu6Rcvgdrhzc5iUHWPrp0XtQ2kYEI3ypz2yV/d+qGVEW5MIwVrUJWcD3ONQ6lUipdf7ftkiysR7RpRAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UnDBqY49; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UnDBqY49"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c94b0b466cso4645864a12.0
        for <oe-kbuild@lists.linux.dev>; Tue, 15 Oct 2024 02:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728985133; x=1729589933; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OfCai4eYiIudEPLa8OIXuMgd/jCd/LVKOPCeL3BPO54=;
        b=UnDBqY49icisEsQ4xQm1zPAlzs/7Z++h+sQF1niXh1+GC2IaIyjZGUoDvSRxRKazoj
         nK/wDyFXbT4r2fTpSNSfar6mGt7FWB8Hgr4eKKfX5WUHHhNIEy4OOqJ4bfb2NcakwdVY
         8eOYdfCSIGV328RURnoTpBzECAJyCxpSjYB57O3gBk7K+oioqNPO7VL/ArJ9JUKrVbsw
         nj2L6p4yCoMd+7ITg0I8cYZBoYxZqmWUQQeehtJgo7pg1JvQJbMXMm0VpxShaqrRkvQ4
         38nezbf/uPhn+ZnN0uwxBBkRhEkBDPytHGwtvk8IMZGsnFFYeAt5suO+q+/rQPJN+3He
         z0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728985133; x=1729589933;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OfCai4eYiIudEPLa8OIXuMgd/jCd/LVKOPCeL3BPO54=;
        b=CTDE0mHUPi+Sj2EcEp+gfZqyMZDMQKK2f1wHaj13vp2vYOyLDXHUyH+8/P1xEK2BTT
         QwA12AXwRDZmwpk8MEAKUnoKOHVp9mViv5CIa3rqNjaC2bRXfAy8gEzPD5LfHYqeM10e
         sJFKaPKVEvSor+DCXRQEK8FrwkHDO4BEDp0E+tGJ9wZDjVyORRZ/NJ34sG8rFL/T3+ub
         UiwBT1SMmBKPCIPv7DhTc+5c8m/08R/odnfm2dzeccAV+TEjeP+iUA32T16iCkJ8q+NX
         9NU6QAbVFVDhwB+1/3zpQ/4DMnaMO80eXWbP+bEmQ5ptgZ+rcfh948UhufehOfUmFaXJ
         ls3Q==
X-Gm-Message-State: AOJu0Yy6V7zHgTYMVmU+rgIUgxhxNt7D8wUi45DAEUzuMPnyvAV3FWY3
	RLjuFU+T34EjVIRKgimFXncjqeh1qCkOlkAofurtvDr/Ocpd3v/sd4ntIJwKGE+cRaDWaFu1wXu
	8
X-Google-Smtp-Source: AGHT+IHi+UyZcvTJgtA3wJaM4UZwwbLFjmqDKXC1KoolvvarBuoRUPJxPQS0P9ols4cpyIhgleWiEQ==
X-Received: by 2002:a05:6402:909:b0:5c9:1b50:1a5c with SMTP id 4fb4d7f45d1cf-5c948c96ab6mr10078087a12.9.1728985132633;
        Tue, 15 Oct 2024 02:38:52 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c98d779ddcsm491701a12.73.2024.10.15.02.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 02:38:52 -0700 (PDT)
Date: Tue, 15 Oct 2024 12:38:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Abhash Jha <abhashkumarjha123@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [jic23-iio:testing 24/26] drivers/iio/light/vl6180.c:268
 vl6180_measure() warn: inconsistent returns '&data->lock'.
Message-ID: <ad77aa66-0a9f-4d6c-be6a-7f0ebd4373b3@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   c3e9df514041ec6c46be83801b1891392f4522f7
commit: acea0e6dd7d459e267efa0c4e8fa284669762e85 [24/26] iio: light: vl6180: Added Interrupt support for single shot access
config: s390-randconfig-r073-20241014 (https://download.01.org/0day-ci/archive/20241015/202410150702.GKQ7QQ7l-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410150702.GKQ7QQ7l-lkp@intel.com/

smatch warnings:
drivers/iio/light/vl6180.c:268 vl6180_measure() warn: inconsistent returns '&data->lock'.

vim +268 drivers/iio/light/vl6180.c

5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  212  static int vl6180_measure(struct vl6180_data *data, int addr)
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  213  {
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  214  	struct i2c_client *client = data->client;
acea0e6dd7d459 Abhash Jha            2024-10-07  215  	unsigned long time_left;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  216  	int tries = 20, ret;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  217  	u16 value;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  218  
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  219  	mutex_lock(&data->lock);
acea0e6dd7d459 Abhash Jha            2024-10-07  220  	reinit_completion(&data->completion);
acea0e6dd7d459 Abhash Jha            2024-10-07  221  
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  222  	/* Start single shot measurement */
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  223  	ret = vl6180_write_byte(client,
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  224  		vl6180_chan_regs_table[addr].start_reg, VL6180_STARTSTOP);
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  225  	if (ret < 0)
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  226  		goto fail;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  227  
acea0e6dd7d459 Abhash Jha            2024-10-07  228  	if (client->irq) {
acea0e6dd7d459 Abhash Jha            2024-10-07  229  		time_left = wait_for_completion_timeout(&data->completion, HZ / 10);
acea0e6dd7d459 Abhash Jha            2024-10-07  230  		if (time_left == 0)
acea0e6dd7d459 Abhash Jha            2024-10-07  231  			return -ETIMEDOUT;

ret = -ETIMEDOUT;
goto fail;

acea0e6dd7d459 Abhash Jha            2024-10-07  232  	} else {
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  233  		while (tries--) {
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  234  			ret = vl6180_read_byte(client, VL6180_INTR_STATUS);
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  235  			if (ret < 0)
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  236  				goto fail;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  237  
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  238  			if (ret & vl6180_chan_regs_table[addr].drdy_mask)
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  239  				break;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  240  			msleep(20);
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  241  		}
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  242  
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  243  		if (tries < 0) {
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  244  			ret = -EIO;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  245  			goto fail;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  246  		}
acea0e6dd7d459 Abhash Jha            2024-10-07  247  	}
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  248  
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  249  	/* Read result value from appropriate registers */
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  250  	ret = vl6180_chan_regs_table[addr].word ?
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  251  		vl6180_read_word(client, vl6180_chan_regs_table[addr].value_reg) :
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  252  		vl6180_read_byte(client, vl6180_chan_regs_table[addr].value_reg);
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  253  	if (ret < 0)
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  254  		goto fail;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  255  	value = ret;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  256  
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  257  	/* Clear the interrupt flag after data read */
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  258  	ret = vl6180_write_byte(client, VL6180_INTR_CLEAR,
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  259  		VL6180_CLEAR_ERROR | VL6180_CLEAR_ALS | VL6180_CLEAR_RANGE);
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  260  	if (ret < 0)
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  261  		goto fail;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  262  
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  263  	ret = value;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  264  
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  265  fail:
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  266  	mutex_unlock(&data->lock);
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  267  
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19 @268  	return ret;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  269  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

