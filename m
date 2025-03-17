Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD71B1A5BB4
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Mar 2025 23:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742255384; cv=none; b=MGCB6zKGn/UnCmGD0FuKbGYmMu7BiH4nd/e4XqN8WX/pxKdaDDOvsUdJTdm7jSLr5v9WUqrvqQGniR7YoMseY9kxxJglI4Gh9t2m72IRJ9Ko8TUyYVw/rGBfdCN440FQeReK0pBuO5J3iDpDrSNfSB3GCff3r8PJf/P1LopFdVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742255384; c=relaxed/simple;
	bh=OHroz9VCU7vIO5wmgvmZV3pWniuRkkb8exgnW4LGzWk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ELGrInZaGTUFPEWVqXL++2uyBa29u2w/2W9otlj/K75Qovb/9T67lIbE6Cb18uaB2bTRzn8kwh6v7fwaRS/D5Gm1Y0xbyg+eopIy5pACw/dCdr3UbroF/2fwIdn7nIV8X0aohP3TTN87DFpBEN2nHvwTaN+A6VkuX5lXyOeukPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OwhtSwaz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OwhtSwaz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742255383; x=1773791383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OHroz9VCU7vIO5wmgvmZV3pWniuRkkb8exgnW4LGzWk=;
  b=OwhtSwazLhL59z75pjtO/+Cu3pAAIegseCOylnIVkPc/6Ag+bxvAjoq6
   Mf/85WT2FtgPuyQPSGfrJ1A9vEvnWl/uo/bYX7dYL/qvpcPLoX+l3ciI5
   1uRL/aLrsriiv6MQQCxS1E98ApV+1mldNnesM8buFm3cRX9guulTX4N1Z
   p9w2YliLjF7Hegj7SBHQl0CtyFbi8lgxcEYmwzAZ187tKnIkecpgxuIsJ
   FU3FgSQ9BMkTZb4+VTTmoGaI+WbkiKoFnj9vM21jc4O+RLtZBkN9zAPLS
   5TMRiXQhRnCghXbJ4DEAg6BHLZhidi3V6f4wt/Es/47nTW9/VJb/o8+dc
   g==;
X-CSE-ConnectionGUID: lIW63jUdQq6huuZCjgcqqQ==
X-CSE-MsgGUID: Vtoy0GTNR/Sg1CW/2cHS8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="42620902"
X-IronPort-AV: E=Sophos;i="6.14,255,1736841600"; 
   d="scan'208";a="42620902"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 16:49:41 -0700
X-CSE-ConnectionGUID: VyahonntQ56s0THCe3T9mw==
X-CSE-MsgGUID: 4WFAmR86SVuOgfQDPsZD9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,255,1736841600"; 
   d="scan'208";a="152939455"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 17 Mar 2025 16:49:39 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuKDB-000DEV-0d;
	Mon, 17 Mar 2025 23:49:37 +0000
Date: Tue, 18 Mar 2025 07:48:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1973/11415]
 drivers/iio/buffer/industrialio-buffer-dmaengine.c:340
 iio_dmaengine_buffer_setup_ext() warn: passing positive error code '(-19)'
 to 'ERR_CAST'
Message-ID: <202503180711.1ulywogS-lkp@intel.com>
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
TO: David Lechner <dlechner@baylibre.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Nuno Sa <nuno.sa@analog.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e94bd4ec45ac156616da285a0bf03056cd7430fc
commit: 4fe7fd17fe66a5e243c1de7ff32c29fac7039b8d [1973/11415] iio: buffer-dmaengine: split requesting DMA channel from allocating buffer
:::::: branch date: 11 hours ago
:::::: commit date: 5 weeks ago
config: m68k-randconfig-r073-20250314 (https://download.01.org/0day-ci/archive/20250318/202503180711.1ulywogS-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503180711.1ulywogS-lkp@intel.com/

smatch warnings:
drivers/iio/buffer/industrialio-buffer-dmaengine.c:340 iio_dmaengine_buffer_setup_ext() warn: passing positive error code '(-19)' to 'ERR_CAST'

vim +340 drivers/iio/buffer/industrialio-buffer-dmaengine.c

0c040d1ddce1d5 Lars-Peter Clausen 2019-12-11  314  
a05dc8b4d4aa3b David Lechner      2024-11-15  315  /**
a05dc8b4d4aa3b David Lechner      2024-11-15  316   * iio_dmaengine_buffer_setup_ext() - Setup a DMA buffer for an IIO device
a05dc8b4d4aa3b David Lechner      2024-11-15  317   * @dev: DMA channel consumer device
a05dc8b4d4aa3b David Lechner      2024-11-15  318   * @indio_dev: IIO device to which to attach this buffer.
a05dc8b4d4aa3b David Lechner      2024-11-15  319   * @channel: DMA channel name, typically "rx".
a05dc8b4d4aa3b David Lechner      2024-11-15  320   * @dir: Direction of buffer (in or out)
a05dc8b4d4aa3b David Lechner      2024-11-15  321   *
a05dc8b4d4aa3b David Lechner      2024-11-15  322   * This allocates a new IIO buffer with devm_iio_dmaengine_buffer_alloc()
a05dc8b4d4aa3b David Lechner      2024-11-15  323   * and attaches it to an IIO device with iio_device_attach_buffer().
a05dc8b4d4aa3b David Lechner      2024-11-15  324   * It also appends the INDIO_BUFFER_HARDWARE mode to the supported modes of the
a05dc8b4d4aa3b David Lechner      2024-11-15  325   * IIO device.
a05dc8b4d4aa3b David Lechner      2024-11-15  326   *
4fe7fd17fe66a5 David Lechner      2025-02-07  327   * Once done using the buffer iio_dmaengine_buffer_teardown() should be used to
a05dc8b4d4aa3b David Lechner      2024-11-15  328   * release it.
a05dc8b4d4aa3b David Lechner      2024-11-15  329   */
c1b91566580c24 Paul Cercueil      2024-04-19  330  struct iio_buffer *iio_dmaengine_buffer_setup_ext(struct device *dev,
a094de22e2efc2 Nuno Sa            2024-04-19  331  						  struct iio_dev *indio_dev,
c1b91566580c24 Paul Cercueil      2024-04-19  332  						  const char *channel,
c1b91566580c24 Paul Cercueil      2024-04-19  333  						  enum iio_buffer_direction dir)
e0fcca9fbd99e9 Alexandru Ardelean 2020-03-24  334  {
4fe7fd17fe66a5 David Lechner      2025-02-07  335  	struct dma_chan *chan;
2c6a958789f79d Yicong Yang        2021-04-08  336  	struct iio_buffer *buffer;
e0fcca9fbd99e9 Alexandru Ardelean 2020-03-24  337  
4fe7fd17fe66a5 David Lechner      2025-02-07  338  	chan = dma_request_chan(dev, channel);
4fe7fd17fe66a5 David Lechner      2025-02-07  339  	if (IS_ERR(chan))
4fe7fd17fe66a5 David Lechner      2025-02-07 @340  		return ERR_CAST(chan);
c1b91566580c24 Paul Cercueil      2024-04-19  341  
4fe7fd17fe66a5 David Lechner      2025-02-07  342  	buffer = __iio_dmaengine_buffer_setup_ext(indio_dev, chan, dir);
4fe7fd17fe66a5 David Lechner      2025-02-07  343  	if (IS_ERR(buffer))
4fe7fd17fe66a5 David Lechner      2025-02-07  344  		dma_release_channel(chan);
e0fcca9fbd99e9 Alexandru Ardelean 2020-03-24  345  
e0fcca9fbd99e9 Alexandru Ardelean 2020-03-24  346  	return buffer;
e0fcca9fbd99e9 Alexandru Ardelean 2020-03-24  347  }
cdd30ebb1b9f36 Peter Zijlstra     2024-12-02  348  EXPORT_SYMBOL_NS_GPL(iio_dmaengine_buffer_setup_ext, "IIO_DMAENGINE_BUFFER");
a094de22e2efc2 Nuno Sa            2024-04-19  349  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
