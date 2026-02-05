Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4ED13D638
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Feb 2026 04:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770266451; cv=none; b=R1Jrqf0HDCNaHXonbcZ0+afgG51dMQAiPSVqOZS/n9qVZZNW1SyPY2mw1zW8yBpCAM05JRhswnvbIriM3x7H2VFA6stwgTYXDl0snSSpCX8KT6eJQPmO/Wq/G7S9tn5rX+l/s5ayaMODuSDJrkCCgXxkFymrFGEn24AigqnUDrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770266451; c=relaxed/simple;
	bh=kJhZuJlRemvnxT6GzLMFCmgo1jZ/0bL6Xwynyv5EYaA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GO4JWq/vGMwxW7WT8JSbZ2rlP4K6ej70U14tefr5hQsFfKJUWRGMPIsFQtzvhGVdSUR8EH1cfa6RmoFDqaNWECV4QVl4GHjD8iLID9Efm/wfm5W2ITh2+uV9qgGqK0B+P2H7Slv38oU1h1fGwAkWMbwV4QdM7fKf7EEFVdnpytQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z0IhJYIo; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z0IhJYIo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770266450; x=1801802450;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kJhZuJlRemvnxT6GzLMFCmgo1jZ/0bL6Xwynyv5EYaA=;
  b=Z0IhJYIoO2lHRZuCpFZZZ+VDESwKS8Gb1ZbxcDQnc4v02zmStYliQpok
   G+KwgFpIBFKlbk47xvGkaFvvq/4kF3SYNG217I134W2ULJ15pHlzVCbsS
   SVRPdxt7E956yZ7ZLvgcXIejLDHvYA0gJw7VxK52uvRTahYAaU2rX5Vl9
   P061V8nNUD3Bk28PPhWDomH5ood4VQ3O6Nf3Tk8IpIQ+4RtC5QvNFfVaH
   xt+oI2pOdGUNczFgILIZ/e8Utm63WA6sDHlXUDgSFlQfoqMahtpJ3eGX6
   rH5YB/NKsBMjK8R6yACum5NHaBvYEiuSi2Q2iIvsgnqZFZjC3SKu/rXhh
   Q==;
X-CSE-ConnectionGUID: XR1W2XBuTJmwItOHEmJ2sA==
X-CSE-MsgGUID: BuluulQsSnOt0F51HH2deA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82091073"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="82091073"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 20:40:49 -0800
X-CSE-ConnectionGUID: FZc3upm0T8irchPNvmnJVw==
X-CSE-MsgGUID: UoMZuKTcTHa0Jzlv5JyNgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="209475290"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 04 Feb 2026 20:40:48 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnrAb-00000000jPo-3Q34;
	Thu, 05 Feb 2026 04:40:45 +0000
Date: Thu, 5 Feb 2026 12:40:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
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

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <9f9aedbe374461e48f1f1e64d5487b5b6c1fc992.1769889074.git.Jonathan.Santos@analog.com>
References: <9f9aedbe374461e48f1f1e64d5487b5b6c1fc992.1769889074.git.Jonathan.Santos@analog.com>
TO: Jonathan Santos <Jonathan.Santos@analog.com>
TO: linux-iio@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: Jonathan Santos <Jonathan.Santos@analog.com>
CC: Michael.Hennerich@analog.com
CC: lars@metafoo.de
CC: jic23@kernel.org
CC: dlechner@baylibre.com
CC: nuno.sa@analog.com
CC: andy@kernel.org

Hi Jonathan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d820183f371d9aa8517a1cd21fe6edacf0f94b7f]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Santos/iio-adc-ad7768-1-fix-one-shot-mode-data-acquisition/20260204-203950
base:   d820183f371d9aa8517a1cd21fe6edacf0f94b7f
patch link:    https://lore.kernel.org/r/9f9aedbe374461e48f1f1e64d5487b5b6c1fc992.1769889074.git.Jonathan.Santos%40analog.com
patch subject: [PATCH 3/3] iio: adc: ad7768-1: add support for SPI offload
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: x86_64-randconfig-161-20260205 (https://download.01.org/0day-ci/archive/20260205/202602051234.5gArzLyZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602051234.5gArzLyZ-lkp@intel.com/

New smatch warnings:
drivers/iio/adc/ad7768-1.c:1789 ad7768_spi_offload_probe() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/iio/adc/ad7768-1.c:576 ad7768_fill_scale_tbl() error: 'scan_type' dereferencing possible ERR_PTR()

vim +/PTR_ERR +1789 drivers/iio/adc/ad7768-1.c

0cac6d2893a658 Jonathan Santos 2026-01-31  1757  
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
0cac6d2893a658 Jonathan Santos 2026-01-31  1790  				     "failed to setup offload RX DMA\n");
0cac6d2893a658 Jonathan Santos 2026-01-31  1791  
0cac6d2893a658 Jonathan Santos 2026-01-31  1792  	indio_dev->setup_ops = &ad7768_offload_buffer_ops;
0cac6d2893a658 Jonathan Santos 2026-01-31  1793  	st->offload_en = true;
0cac6d2893a658 Jonathan Santos 2026-01-31  1794  
0cac6d2893a658 Jonathan Santos 2026-01-31  1795  	return 0;
0cac6d2893a658 Jonathan Santos 2026-01-31  1796  }
0cac6d2893a658 Jonathan Santos 2026-01-31  1797  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
