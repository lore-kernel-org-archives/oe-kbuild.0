Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB4CC2FB
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Aug 2025 02:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754705460; cv=none; b=ZNhFSBjUN77D91o1F/Jo52SZ+e3TY6W/+sf5uAHfSM0BTJhwUu76I5jrd875waPu0bgG6wQ9yt4Ey3DDEfEx7EbzAEBpSlgFtvhFWfYJzMWtWQYdvL5/o+It8L5KcYa8S383zY+zrVVk1wv0FbEaRcQbBkaEXMUk1vZJdyHOWLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754705460; c=relaxed/simple;
	bh=cQSR0ooG+e2+eLiUy2F4ff8vXfqZ7vGWbIBzekqtRrs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q7Qh669WcswucK+MIo0QaVCNDzwMv6ehqMsaGHGf9aG1qWnjsLVqrq0869r6P6RnQmXYEo5GIyHllHsJw1XKBlYU9uB+uH4DYz/7fP2u1xCAin1S1V+iGc1+2MlB6mJNPQFFm07Uc7X8NILGQ0ojs/vImmbSNChLfoAGLRm4wqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SRalsXHm; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SRalsXHm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754705458; x=1786241458;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cQSR0ooG+e2+eLiUy2F4ff8vXfqZ7vGWbIBzekqtRrs=;
  b=SRalsXHm8YaIXxe7dhnSCOU5fHE3uAkPa7eGFWpgPd/TrVsuMQHPJOBG
   AgcSmsqBiCsKM9l7R7EFb/LIHCZBk9nRkLOUsne98AWQbsYN3ftveFUEu
   jeL1et3paHDsD8YEfeUn/F8naIwGVsgOtrp7WiEOJGCJBt0SSxq+PTUTI
   Kch3boCiUGaOqMlzAZ4QWnrHZFLKAgxFqVket0u3epB9TJhT5iM8U/CgZ
   Edt8gqihpeVf6xG6LfkrxEKZHpxp98a6acN6eLMD1D2inCoiT4/MOxuRZ
   qMDQo3HxS6cCX7eDhqufvdwB5DLuEKHacZpAl4yN39zcnRdGTbymbLemv
   w==;
X-CSE-ConnectionGUID: jcvQWmwsRHeNn/2cBfSCNw==
X-CSE-MsgGUID: 8N2ZEDF9Qc6H2U6SQXZBwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="68510175"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="68510175"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 19:10:58 -0700
X-CSE-ConnectionGUID: AakBIz6xTGazPkGoSi4auQ==
X-CSE-MsgGUID: gNTpaMNwQmqenyYEWjcSIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="169575796"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 08 Aug 2025 19:10:54 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukZ2V-0004SO-0a;
	Sat, 09 Aug 2025 02:10:35 +0000
Date: Sat, 9 Aug 2025 10:10:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 3/3] iio: adc: update ad7779 to use IIO backend
Message-ID: <202508090909.tqDX7ah1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250806192502.10120-4-Ioana.Risteiu@analog.com>
References: <20250806192502.10120-4-Ioana.Risteiu@analog.com>
TO: Ioana Risteiu <Ioana.Risteiu@analog.com>
TO: "Lars-Peter Clausen" <lars@metafoo.de>
TO: Michael Hennerich <Michael.Hennerich@analog.com>
TO: Jonathan Cameron <jic23@kernel.org>
TO: David Lechner <dlechner@baylibre.com>
TO: "Nuno Sá" <nuno.sa@analog.com>
TO: Andy Shevchenko <andy@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Ramona Nechita <ramona.nechita@analog.com>
TO: linux-iio@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: Ioana Risteiu <Ioana.Risteiu@analog.com>

Hi Ioana,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on linus/master next-20250808]
[cannot apply to v6.16]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ioana-Risteiu/iio-adc-adi-axi-adc-add-axi_adc_num_lanes_set/20250807-032923
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20250806192502.10120-4-Ioana.Risteiu%40analog.com
patch subject: [PATCH v2 3/3] iio: adc: update ad7779 to use IIO backend
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20250809 (https://download.01.org/0day-ci/archive/20250809/202508090909.tqDX7ah1-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508090909.tqDX7ah1-lkp@intel.com/

smatch warnings:
drivers/iio/adc/ad7779.c:893 setup_back() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +893 drivers/iio/adc/ad7779.c

1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  878  
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  879  static int setup_back(struct ad7779_state *st, struct iio_dev *indio_dev)
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  880  {
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  881  	struct device *dev = &st->spi->dev;
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  882  	int ret = -EINVAL;
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  883  	int num_lanes;
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  884  
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  885  	indio_dev->info = &ad7779_info_data;
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  886  
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  887  	ret = ad7779_conf_channels(indio_dev, st);
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  888  	if (ret)
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  889  		return ret;
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  890  
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  891  	st->back = devm_iio_backend_get(dev, NULL);
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  892  	if (IS_ERR(st->back)) {
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06 @893  		dev_err_probe(dev, ret, "failed to get iio backend");
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  894  		return PTR_ERR(st->back);
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  895  	}
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  896  
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  897  	ret = devm_iio_backend_request_buffer(dev, st->back, indio_dev);
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  898  	if (ret)
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  899  		return ret;
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  900  
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  901  	ret = devm_iio_backend_enable(dev, st->back);
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  902  	if (ret)
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  903  		return ret;
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  904  
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  905  	ret = device_property_read_u32(dev, "adi,num-lanes", &num_lanes);
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  906  	if (ret < 0)
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  907  		return ad7779_set_data_lines(indio_dev, 4);
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  908  
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  909  	return ad7779_set_data_lines(indio_dev, num_lanes);
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  910  }
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  911  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
