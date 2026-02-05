Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE7B3033F6
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Feb 2026 06:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770271400; cv=none; b=TikiEQ4bU2EUPJNPg8aGG+2NMPTAiCk0uj2cD/u/soOMCrCs2VO/7sTegyl1RiSw0XEv3uwLSSXDFg+R8MTOyiyQx6BrjI7WHJ9gvbRY0OiC4OjwzT6zOlaTA+a0OJyaeYW8l2GPAQxqE6x4WH/DL50K9hPEKpluoKIsTfSqZxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770271400; c=relaxed/simple;
	bh=BDCUlCTUtKL1ll0q3c1AyzBpWMPkXxJEpeNBhGeoLA4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=AEUW+bS60INOkq35FV2MokvqJjLzTS8rjteLDQ9aaXfhJgxNq5XYWFm4f5WJLTX/aOf8+gNdN0r7ivOn1HtmZAtya1LQ6WnRI99T77BRrp5bOfukUpysRhmljZ21NmuutmuCRe8X4jSQSwoQBL1O5KGAdkH/pCC+Cbsm0wfg/u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wUEuIWi6; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wUEuIWi6"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa9so412412f8f.1
        for <oe-kbuild@lists.linux.dev>; Wed, 04 Feb 2026 22:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770271398; x=1770876198; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NHWx0PbMlZm2EZQ9woaRQQzqIT91zZKTnoROkZ981zY=;
        b=wUEuIWi6rc5R97fRRjAG//COghqYw2lYObXpAEd+eqVPUc5LcTpG88xiG5MXY16mCj
         rrsmscvUCc+6dyHt5ispqcFypsSADEXQiMBWMxkXliTTL2lUeGKbv7NHo02BQwOORbqM
         C49NMLpvT/MKVQm0wTqlMWhW1Iwvctt9oDSXxjuQa9S+n5Uz0fgYhZFXVj022nqspUmB
         UoeFrAPO+YLkw4iwYXQZfZoQxqvmZQYMg3LWEA73J61XmOThVut63rMUC/ihISsFYsU8
         PfGsBUh1jleJMDDGbONAbbco5zb/O8E5/CPr1ll8XyEJTGDedPGoSxFX27tCVtLhm/em
         J8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770271398; x=1770876198;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NHWx0PbMlZm2EZQ9woaRQQzqIT91zZKTnoROkZ981zY=;
        b=D3o0j3VkTa3GoEsZ7DtX7I7SWzjIs01L8vopo5p5S7Ocb6c3nWbRA12fFVRRcWuSUu
         kf8A/vBw+QU5Zk1rGzsxffb2DMQFF6uvbMTwBPHflhmd+WG9vVm9e5o8XbOla9JXv9sr
         NBhJd6cb5dZyg/lNI0cPuDzxxWvExRe7h0/EenBI9GZawD95DgGFyqNyau95Y94TFD4C
         GzzKOrTaMMIaccmP3OSKhz+ZGyd2CBE/48YCtd7zr8/zlkmQ/LgVExc5kZ+XnISnRIA1
         QzD72Q70M//hZ0er+18hSPANKLKrX1CPZikBpvSFBydCfodFhDGra0Lok/DEGYiOY6pT
         rw0g==
X-Gm-Message-State: AOJu0Yxju1IYSg1pUe4YgmJk569ZNewX5EODQu8S96FFS3OnM0UBDzdG
	AE56CL7R1jw9Swt9ICxg94WCkJc+v5U8vKaLnlc/gvBFJBMA2ys3VuVF73hvCypSDne9FxLYrD0
	0ogUBtVc=
X-Gm-Gg: AZuq6aJBDeayUOYOsYDmRXM/tOtRSWoX4/K3rA8rcN7QUVwWfUELOs9dKZVcqgKidnc
	1CgxeVKxAkrVZJ3mNQmP7lMN8sV5smVRmS1tQGIxaQiT3niOY8oE+jsNd4NSW5TrT6Y8L7eusVu
	x+LzlkCDZFq/mnwy8VN4svZQc/k8CPzokVS/2iQ/CLx8Lm5C1nc2O9kPk5sEZ+WV08hFSXET29h
	9j2ml/rzfW/B29j5lD9/rhp+e/xud39qgdGBRB1manb9hK/plqpsVK9tDsHYoMLT/hHT+cqxLry
	PZUNJosDadbOGM3Q99jAgHILitiqgjHKq/PYW6x/JXLqXTk4IM1QD7yV9wda3Gsuk+N9dhPP3fu
	Bze7AUP/P14n5YuU+FkbqKXCLW1LaVFZPmidSW+Vi/L5lydYZM4f/pHIThyYAEAlhmNiNeVuhfV
	9XBKZf1zG2bu2aEd3A2pBby0g6SC0=
X-Received: by 2002:a05:6000:25c8:b0:432:851d:23e2 with SMTP id ffacd0b85a97d-4361805bf71mr7400771f8f.49.1770271398404;
        Wed, 04 Feb 2026 22:03:18 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43617e25683sm11031108f8f.6.2026.02.04.22.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 22:03:17 -0800 (PST)
Date: Thu, 5 Feb 2026 09:03:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jonathan Santos <Jonathan.Santos@analog.com>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jonathan Santos <Jonathan.Santos@analog.com>,
	Michael.Hennerich@analog.com, lars@metafoo.de, jic23@kernel.org,
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org
Subject: Re: [PATCH 3/3] iio: adc: ad7768-1: add support for SPI offload
Message-ID: <202602051234.5gArzLyZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f9aedbe374461e48f1f1e64d5487b5b6c1fc992.1769889074.git.Jonathan.Santos@analog.com>
Message-ID: <20260205060314.BjhgIRWzaKSykooDUBsKg3UZin8oQAMLm_7C7aUVy1E@z>

Hi Jonathan,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Santos/iio-adc-ad7768-1-fix-one-shot-mode-data-acquisition/20260204-203950
base:   d820183f371d9aa8517a1cd21fe6edacf0f94b7f
patch link:    https://lore.kernel.org/r/9f9aedbe374461e48f1f1e64d5487b5b6c1fc992.1769889074.git.Jonathan.Santos%40analog.com
patch subject: [PATCH 3/3] iio: adc: ad7768-1: add support for SPI offload
config: x86_64-randconfig-161-20260205 (https://download.01.org/0day-ci/archive/20260205/202602051234.5gArzLyZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202602051234.5gArzLyZ-lkp@intel.com/

New smatch warnings:
drivers/iio/adc/ad7768-1.c:1789 ad7768_spi_offload_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +1789 drivers/iio/adc/ad7768-1.c

0cac6d2893a658 Jonathan Santos 2026-01-31  1758  static int ad7768_spi_offload_probe(struct iio_dev *indio_dev,
0cac6d2893a658 Jonathan Santos 2026-01-31  1759  				    struct ad7768_state *st)
0cac6d2893a658 Jonathan Santos 2026-01-31  1760  {
0cac6d2893a658 Jonathan Santos 2026-01-31  1761  	struct device *dev = &st->spi->dev;
0cac6d2893a658 Jonathan Santos 2026-01-31  1762  	struct spi_offload_trigger_info trigger_info = {
0cac6d2893a658 Jonathan Santos 2026-01-31  1763  		.fwnode = dev_fwnode(dev),
0cac6d2893a658 Jonathan Santos 2026-01-31  1764  		.ops = &ad7768_offload_trigger_ops,
0cac6d2893a658 Jonathan Santos 2026-01-31  1765  		.priv = st,
0cac6d2893a658 Jonathan Santos 2026-01-31  1766  	};
0cac6d2893a658 Jonathan Santos 2026-01-31  1767  	struct dma_chan *rx_dma;
0cac6d2893a658 Jonathan Santos 2026-01-31  1768  	int ret;
0cac6d2893a658 Jonathan Santos 2026-01-31  1769  
0cac6d2893a658 Jonathan Santos 2026-01-31  1770  	ret = devm_spi_offload_trigger_register(dev, &trigger_info);
0cac6d2893a658 Jonathan Santos 2026-01-31  1771  	if (ret)
0cac6d2893a658 Jonathan Santos 2026-01-31  1772  		return dev_err_probe(dev, ret,
0cac6d2893a658 Jonathan Santos 2026-01-31  1773  				     "failed to register offload trigger\n");
0cac6d2893a658 Jonathan Santos 2026-01-31  1774  
0cac6d2893a658 Jonathan Santos 2026-01-31  1775  	st->offload_trigger = devm_spi_offload_trigger_get(dev, st->offload,
0cac6d2893a658 Jonathan Santos 2026-01-31  1776  		SPI_OFFLOAD_TRIGGER_DATA_READY);
0cac6d2893a658 Jonathan Santos 2026-01-31  1777  	if (IS_ERR(st->offload_trigger))
0cac6d2893a658 Jonathan Santos 2026-01-31  1778  		return dev_err_probe(dev, PTR_ERR(st->offload_trigger),
0cac6d2893a658 Jonathan Santos 2026-01-31  1779  				     "failed to get offload trigger\n");
0cac6d2893a658 Jonathan Santos 2026-01-31  1780  
0cac6d2893a658 Jonathan Santos 2026-01-31  1781  	rx_dma = devm_spi_offload_rx_stream_request_dma_chan(dev, st->offload);
0cac6d2893a658 Jonathan Santos 2026-01-31  1782  	if (IS_ERR(rx_dma))
0cac6d2893a658 Jonathan Santos 2026-01-31  1783  		return dev_err_probe(dev, PTR_ERR(rx_dma),
0cac6d2893a658 Jonathan Santos 2026-01-31  1784  				     "failed to get offload RX DMA\n");
0cac6d2893a658 Jonathan Santos 2026-01-31  1785  
0cac6d2893a658 Jonathan Santos 2026-01-31  1786  	ret = devm_iio_dmaengine_buffer_setup_with_handle(dev, indio_dev,
0cac6d2893a658 Jonathan Santos 2026-01-31  1787  		rx_dma, IIO_BUFFER_DIRECTION_IN);
0cac6d2893a658 Jonathan Santos 2026-01-31  1788  	if (ret)
0cac6d2893a658 Jonathan Santos 2026-01-31 @1789  		return dev_err_probe(dev, PTR_ERR(rx_dma),

s/PTR_ERR(rx_dma)/ret/

0cac6d2893a658 Jonathan Santos 2026-01-31  1790  				     "failed to setup offload RX DMA\n");
0cac6d2893a658 Jonathan Santos 2026-01-31  1791  
0cac6d2893a658 Jonathan Santos 2026-01-31  1792  	indio_dev->setup_ops = &ad7768_offload_buffer_ops;
0cac6d2893a658 Jonathan Santos 2026-01-31  1793  	st->offload_en = true;
0cac6d2893a658 Jonathan Santos 2026-01-31  1794  
0cac6d2893a658 Jonathan Santos 2026-01-31  1795  	return 0;
0cac6d2893a658 Jonathan Santos 2026-01-31  1796  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

