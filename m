Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E49713541B
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Nov 2024 04:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730869031; cv=none; b=u0Y6Y5Oklie6eeI9qUlfxgqLCRRG23IVTxuseDZ82dbNYaA9WvVxXwDuh2G02cNAGFpD4AffLm3ZMq7EQwogXMdb4iLYeExCXwhVUm5so8oGiox8+UGGaURaKxYZWctW9MU+Si5/JRajyf80MN8c4YJEZiKZd0YjoOqF/Iwrd/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730869031; c=relaxed/simple;
	bh=14L5IMkGn/mpZIICNpps7PFgUkXjTYEyD0hlLmMMkeI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uzcv0CD/fpl4tw7WcWGlZI2BVgysVZoq83Fcbh3DrCIwcsB/Xnl0aHrNvoFXMZuKCmI1QbDM6YA5oNQuZGbMxAXA9MdS0+I2bis5FrUUMR5zBxLjnRH3bcMugiSw6SmZ2Zb7t+KAI2HtQ/BTVtxPyKlOJ9S4MmlMldXS36FXhdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ifhe9YDN; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ifhe9YDN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730869029; x=1762405029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=14L5IMkGn/mpZIICNpps7PFgUkXjTYEyD0hlLmMMkeI=;
  b=ifhe9YDNVFRiTVQK29W+APmumNIHIab1mPJzpvEJKT2j5IvCocSF8zYD
   mGk71w8HE/QbgoCxuOvjJvsk2rFyN571F09ELGmmnuS5Yn4I6kccZSeWW
   cOKliOwbsrQB+KwU/jJh4kZww3q+/7p7EQpi/vf2rjWu6q1RpWJo1E/yX
   MoeDwf3lKVxHYveE22vS7d9qb2Ly67lYveeln/39Rfz9qjXiS4O5C99L5
   wIT1Al/K6X0DZNKgvuPsARUKS3TASSMXbJGAChCHcFVaqXqsQasjGRvqk
   Y1FxRyB7JCyWi6TFB1+lkwDaTcOyMCV679RVi4Q+zlZCBRiPJENebAx5O
   Q==;
X-CSE-ConnectionGUID: 2SPSeBy0RCeBqy2ylFom6Q==
X-CSE-MsgGUID: Iql+1XJdQpGAMBgZrhaI/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34344354"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34344354"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 20:57:09 -0800
X-CSE-ConnectionGUID: rAqKmkmrRZqE3BNA7QdGlA==
X-CSE-MsgGUID: QH+hSbUVQHyt8JvaaKe/uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="85145218"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Nov 2024 20:57:08 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8Y6L-000mwu-2Y;
	Wed, 06 Nov 2024 04:57:05 +0000
Date: Wed, 6 Nov 2024 12:56:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [weiny2:dcd-v4-2024-11-05 15/28] drivers/cxl/core/port.c:209
 mode_store() error: buffer overflow 'cxl_decoder_mode_names' 12 <= 12
Message-ID: <202411061211.ULVM47Ie-lkp@intel.com>
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
TO: Navneet Singh <navneet.singh@intel.com>
CC: Ira Weiny <ira.weiny@intel.com>
CC: Dave Jiang <dave.jiang@intel.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://github.com/weiny2/linux-kernel.git dcd-v4-2024-11-05
head:   dba3b28deacf7cfa58557386a37dc0aceb7dcb64
commit: d3250f65fdd004a774008ed2c989cda1053fb738 [15/28] cxl/port: Add endpoint decoder DC mode support to sysfs
:::::: branch date: 11 hours ago
:::::: commit date: 12 hours ago
config: i386-randconfig-141-20241106 (https://download.01.org/0day-ci/archive/20241106/202411061211.ULVM47Ie-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411061211.ULVM47Ie-lkp@intel.com/

New smatch warnings:
drivers/cxl/core/port.c:209 mode_store() error: buffer overflow 'cxl_decoder_mode_names' 12 <= 12
drivers/cxl/core/port.c:213 mode_store() error: testing array offset 'mode' after use.

Old smatch warnings:
drivers/cxl/core/port.c:362 cxl_root_decoder_visible() error: we previously assumed 'a' could be null (see line 358)

vim +/cxl_decoder_mode_names +209 drivers/cxl/core/port.c

cf880423b6a059 Dan Williams  2022-05-23  200  
cf880423b6a059 Dan Williams  2022-05-23  201  static ssize_t mode_store(struct device *dev, struct device_attribute *attr,
cf880423b6a059 Dan Williams  2022-05-23  202  			  const char *buf, size_t len)
cf880423b6a059 Dan Williams  2022-05-23  203  {
cf880423b6a059 Dan Williams  2022-05-23  204  	struct cxl_endpoint_decoder *cxled = to_cxl_endpoint_decoder(dev);
cf880423b6a059 Dan Williams  2022-05-23  205  	enum cxl_decoder_mode mode;
cf880423b6a059 Dan Williams  2022-05-23  206  	ssize_t rc;
cf880423b6a059 Dan Williams  2022-05-23  207  
d3250f65fdd004 Navneet Singh 2023-07-05  208  	for (mode = 0; mode < CXL_DECODER_MODE_MAX; mode++)
d3250f65fdd004 Navneet Singh 2023-07-05 @209  		if (sysfs_streq(buf, cxl_decoder_mode_names[mode]))
d3250f65fdd004 Navneet Singh 2023-07-05  210  			break;
d3250f65fdd004 Navneet Singh 2023-07-05  211  
d3250f65fdd004 Navneet Singh 2023-07-05  212  	if (mode == CXL_DECODER_NONE ||
d3250f65fdd004 Navneet Singh 2023-07-05 @213  	    mode == CXL_DECODER_DEAD ||
d3250f65fdd004 Navneet Singh 2023-07-05  214  	    mode == CXL_DECODER_MODE_MAX)
d3250f65fdd004 Navneet Singh 2023-07-05  215  		return -EINVAL;
d3250f65fdd004 Navneet Singh 2023-07-05  216  
d3250f65fdd004 Navneet Singh 2023-07-05  217  	/* Not yet supported */
d3250f65fdd004 Navneet Singh 2023-07-05  218  	if (mode >= CXL_DECODER_MIXED)
cf880423b6a059 Dan Williams  2022-05-23  219  		return -EINVAL;
cf880423b6a059 Dan Williams  2022-05-23  220  
cf880423b6a059 Dan Williams  2022-05-23  221  	rc = cxl_dpa_set_mode(cxled, mode);
cf880423b6a059 Dan Williams  2022-05-23  222  	if (rc)
cf880423b6a059 Dan Williams  2022-05-23  223  		return rc;
cf880423b6a059 Dan Williams  2022-05-23  224  
cf880423b6a059 Dan Williams  2022-05-23  225  	return len;
cf880423b6a059 Dan Williams  2022-05-23  226  }
cf880423b6a059 Dan Williams  2022-05-23  227  static DEVICE_ATTR_RW(mode);
cf880423b6a059 Dan Williams  2022-05-23  228  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
