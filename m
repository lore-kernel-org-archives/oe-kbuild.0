Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B6E42A96
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Mar 2025 08:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742112861; cv=none; b=dN3P+qWLeVGLD1PaWjneWStmqmsWbLVKBS/8r7cLDZWqGhDZPuAHwiif/ZGT4TuVQdKDx2ZK6/+2gA2xFFdxTaXqRxOB6EJwGjOosI6ygvnHL7JJ2oiQYFDEWLyPReGGBydk6Kw/jALLYF4+9Loq2LO+wHtYsU7jUDfqsYYnoOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742112861; c=relaxed/simple;
	bh=c8gq69QL1W/CJykDwu+lF0pK3YoN+Xmlg8DFruxF+j4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IvWgqkOVCh3uwPxWFINz3zmPgu6S3wrLNUl5S2AXYRGAZS5wye5qqxMzOuc/SOUjNWt6WsYlfiyHlr+fx4W2yRHClMvXUqkkwEOK7ZXeQC9SKiBlX+72MCzI4XPTSSVbbFd2Y83mbdNRANcmQB6sbMtyqjme2e/k4ecWnM9yD3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lb7Tv6O5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lb7Tv6O5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742112859; x=1773648859;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c8gq69QL1W/CJykDwu+lF0pK3YoN+Xmlg8DFruxF+j4=;
  b=lb7Tv6O5ybzsd4syKnNgKosqhgYv4lm+kO3c4Z+Ofa+9q19sr5x4pWNB
   Kce7Tl1+WAieqQquBmozExrGRAfvjQxwNcaDEERvD8noEXUvTIpGCt7Cn
   IpLRQ7fSuXJw+QVJ287vx0B0HkrCJuVUAI2hRxeVLO3fgS1Ei4gk0+ek6
   dmqd4jy1bO+/MPk7+ZqZMddQBV54FqDgalnLYCeK/jU8C+3b9P2g/IgXI
   1GKovoVyQlBQ3NtsLbXJ6o13JRyc/Jyl3di2MXtsPKPSCjKxpaIbpts7x
   HsN/nEQO+0ZnR7J/8vYI+5CZT+WFgKJesWBRHxtk8OkXMMRg+inlFj7QC
   g==;
X-CSE-ConnectionGUID: wVZjsCPDQ02PnOqgfaK7Qg==
X-CSE-MsgGUID: 2OwSLvhUTnCEFl6G+RphKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="47116814"
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="47116814"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2025 01:14:19 -0700
X-CSE-ConnectionGUID: cVrwowWdSSSubqcav1RMPQ==
X-CSE-MsgGUID: dEsf3BKIQSmDNkQY3PSROw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="121858992"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 16 Mar 2025 01:14:18 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttj8S-000BuN-0C;
	Sun, 16 Mar 2025 08:14:16 +0000
Date: Sun, 16 Mar 2025 16:14:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v1 1/4] iio: adc: ad4000: Add support for SPI offload
Message-ID: <202503161513.yeRBTxjg-lkp@intel.com>
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
In-Reply-To: <301fc83a961c4a2ef2ac980d0baa83d9d89a88c5.1741970538.git.marcelo.schmitt@analog.com>
References: <301fc83a961c4a2ef2ac980d0baa83d9d89a88c5.1741970538.git.marcelo.schmitt@analog.com>
TO: Marcelo Schmitt <marcelo.schmitt@analog.com>
TO: linux-iio@vger.kernel.org
TO: linux-doc@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: jic23@kernel.org
CC: lars@metafoo.de
CC: Michael.Hennerich@analog.com
CC: corbet@lwn.net
CC: marcelo.schmitt1@gmail.com

Hi Marcelo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on af94f401e26f686f7391ce79b38a6129417c22dc]

url:    https://github.com/intel-lab-lkp/linux/commits/Marcelo-Schmitt/iio-adc-ad4000-Add-support-for-SPI-offload/20250315-012316
base:   af94f401e26f686f7391ce79b38a6129417c22dc
patch link:    https://lore.kernel.org/r/301fc83a961c4a2ef2ac980d0baa83d9d89a88c5.1741970538.git.marcelo.schmitt%40analog.com
patch subject: [PATCH v1 1/4] iio: adc: ad4000: Add support for SPI offload
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: parisc-randconfig-r072-20250316 (https://download.01.org/0day-ci/archive/20250316/202503161513.yeRBTxjg-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503161513.yeRBTxjg-lkp@intel.com/

New smatch warnings:
drivers/iio/adc/ad4000.c:862 ad4000_spi_offload_setup() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/iio/adc/ad4000.c:556 ad4000_fill_scale_tbl() warn: unsigned '__x' is never less than zero.

vim +/PTR_ERR +862 drivers/iio/adc/ad4000.c

e74205e82803041 Marcelo Schmitt 2025-03-14  845  
e74205e82803041 Marcelo Schmitt 2025-03-14  846  static int ad4000_spi_offload_setup(struct iio_dev *indio_dev,
e74205e82803041 Marcelo Schmitt 2025-03-14  847  				    struct ad4000_state *st)
e74205e82803041 Marcelo Schmitt 2025-03-14  848  {
e74205e82803041 Marcelo Schmitt 2025-03-14  849  	struct spi_device *spi = st->spi;
e74205e82803041 Marcelo Schmitt 2025-03-14  850  	struct device *dev = &spi->dev;
e74205e82803041 Marcelo Schmitt 2025-03-14  851  	struct dma_chan *rx_dma;
e74205e82803041 Marcelo Schmitt 2025-03-14  852  	int ret;
e74205e82803041 Marcelo Schmitt 2025-03-14  853  
e74205e82803041 Marcelo Schmitt 2025-03-14  854  	st->offload_trigger = devm_spi_offload_trigger_get(dev, st->offload,
e74205e82803041 Marcelo Schmitt 2025-03-14  855  							   SPI_OFFLOAD_TRIGGER_PERIODIC);
e74205e82803041 Marcelo Schmitt 2025-03-14  856  	if (IS_ERR(st->offload_trigger))
e74205e82803041 Marcelo Schmitt 2025-03-14  857  		return dev_err_probe(dev, PTR_ERR(st->offload_trigger),
e74205e82803041 Marcelo Schmitt 2025-03-14  858  				     "Failed to get offload trigger\n");
e74205e82803041 Marcelo Schmitt 2025-03-14  859  
e74205e82803041 Marcelo Schmitt 2025-03-14  860  	ret = ad4000_set_sampling_freq(st, st->max_rate_hz);
e74205e82803041 Marcelo Schmitt 2025-03-14  861  	if (ret)
e74205e82803041 Marcelo Schmitt 2025-03-14 @862  		return dev_err_probe(dev, PTR_ERR(st->offload_trigger),
e74205e82803041 Marcelo Schmitt 2025-03-14  863  				     "Failed to set sampling frequency\n");
e74205e82803041 Marcelo Schmitt 2025-03-14  864  
e74205e82803041 Marcelo Schmitt 2025-03-14  865  	rx_dma = devm_spi_offload_rx_stream_request_dma_chan(dev, st->offload);
e74205e82803041 Marcelo Schmitt 2025-03-14  866  	if (IS_ERR(rx_dma))
e74205e82803041 Marcelo Schmitt 2025-03-14  867  		return dev_err_probe(dev, PTR_ERR(rx_dma),
e74205e82803041 Marcelo Schmitt 2025-03-14  868  				     "Failed to get offload RX DMA\n");
e74205e82803041 Marcelo Schmitt 2025-03-14  869  
e74205e82803041 Marcelo Schmitt 2025-03-14  870  	ret = devm_iio_dmaengine_buffer_setup_with_handle(dev, indio_dev, rx_dma,
e74205e82803041 Marcelo Schmitt 2025-03-14  871  							  IIO_BUFFER_DIRECTION_IN);
e74205e82803041 Marcelo Schmitt 2025-03-14  872  	if (ret)
e74205e82803041 Marcelo Schmitt 2025-03-14  873  		return dev_err_probe(dev, ret, "Failed to setup DMA buffer\n");
e74205e82803041 Marcelo Schmitt 2025-03-14  874  
e74205e82803041 Marcelo Schmitt 2025-03-14  875  	return 0;
e74205e82803041 Marcelo Schmitt 2025-03-14  876  }
e74205e82803041 Marcelo Schmitt 2025-03-14  877  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
