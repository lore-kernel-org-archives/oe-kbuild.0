Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638912AD0C
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Sep 2025 18:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757615492; cv=none; b=etrQ7b9FnWLZJ/AzQ5Bi/Ms88eCPN9YkqDPQwlAgBaS5hLmmK4tYwiFMrpR5T7ngf0Y9QiEdlc/qIx6Htzjhwtp9625bfhMjYGFXPh5DR4+IHorrwobrkGuhInlTvKm2no2TWrQjFrb53JD0GYusvorHLDhnWzWWcuaORpRkloc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757615492; c=relaxed/simple;
	bh=6zO+pjAS9TxngjnhFypZAv3lJGcVIzYIN6f52Ul+ktY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AM5GneefBcdR7e2ylYEnMhcgXXLqssuLZrp+h5YmvY0xDCBmr1Gg9MrPKPckygjIu7in7oSAZLgFruO07P/PRkF/sQiLn/gV7/tF1h4uPeaCsUHQlmfwYela9u1dKJlYt04y/lygyh9WKvQBU6USE0qtBgzZGmRbcnJjN7keUTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eWha6xP5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eWha6xP5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757615490; x=1789151490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6zO+pjAS9TxngjnhFypZAv3lJGcVIzYIN6f52Ul+ktY=;
  b=eWha6xP5ApAWvXxT8cB7cyKtj+T7YHQjE7v5gZ8+aElbtOCQj5o0422r
   M3VLN168gRgBCudmZdN0tVAXGr3NtzvqGrJSRsTB35zoShmgxHoD+5dBM
   +ZPwc6kbaJjiPuEw6r4I4vmQBUrSGlONd9i9n4fwLqXJm1AZB+XRMldQY
   jh30JdYT6R3oabEfxCPrtCfEvfpnOTJoPUQDCx9Ah2RfJLHo7U3nIWVMY
   jYNP4rrh2LY3pAIvZOGLB/xvgWllfrzRp0SvMqLuE7liZJD5VsfdJ3EEs
   igJ97229DxbuAFpiB/chMLJ5iRSZpz6imgo+xrNFWpbtYN6OGSwG3wLy5
   A==;
X-CSE-ConnectionGUID: kPvp1oxoSYK+unbIbUhPIQ==
X-CSE-MsgGUID: avDVhXQMTnCGRt9u3IR7BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="63783691"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
   d="scan'208";a="63783691"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 11:31:28 -0700
X-CSE-ConnectionGUID: hVDGt5TNRmmQDexyrEbVHg==
X-CSE-MsgGUID: eyq3KbYDR6ClYAdTlCJ5LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
   d="scan'208";a="173307280"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 11 Sep 2025 11:31:27 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwm4q-0000Z2-22;
	Thu, 11 Sep 2025 18:31:24 +0000
Date: Fri, 12 Sep 2025 02:31:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7959/8263] drivers/char/tpm/tpm_ppi.c:349
 tpm_show_ppi_tcg_operations() warn: inconsistent returns 'global
 &tpm_ppi_lock'.
Message-ID: <202509120229.YpG1CcD3-lkp@intel.com>
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
TO: Denis Aleksandrov <daleksan@redhat.com>
CC: Jarkko Sakkinen <jarkko@kernel.org>
CC: Paul Menzel <pmenzel@molgen.mpg.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8f21d9da46702c4d6951ba60ca8a05f42870fe8f
commit: 18aada46edf7f79dba1ab89a100d0fc350d4a5c8 [7959/8263] tpm: Prevent local DOS via tpm/tpm0/ppi/*operations
:::::: branch date: 12 hours ago
:::::: commit date: 21 hours ago
config: x86_64-randconfig-161-20250911 (https://download.01.org/0day-ci/archive/20250912/202509120229.YpG1CcD3-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509120229.YpG1CcD3-lkp@intel.com/

smatch warnings:
drivers/char/tpm/tpm_ppi.c:349 tpm_show_ppi_tcg_operations() warn: inconsistent returns 'global &tpm_ppi_lock'.
drivers/char/tpm/tpm_ppi.c:378 tpm_show_ppi_vs_operations() warn: inconsistent returns 'global &tpm_ppi_lock'.

vim +349 drivers/char/tpm/tpm_ppi.c

f84fdff0fdcda7 Xiaoyan Zhang     2012-08-22  322  
81198078d7da42 Xiaoyan Zhang     2013-08-29  323  static ssize_t tpm_show_ppi_tcg_operations(struct device *dev,
81198078d7da42 Xiaoyan Zhang     2013-08-29  324  					   struct device_attribute *attr,
81198078d7da42 Xiaoyan Zhang     2013-08-29  325  					   char *buf)
f84fdff0fdcda7 Xiaoyan Zhang     2012-08-22  326  {
9b774d5cf2db4b Jarkko Sakkinen   2015-04-14  327  	struct tpm_chip *chip = to_tpm_chip(dev);
18aada46edf7f7 Denis Aleksandrov 2025-09-10  328  	ssize_t len = 0;
18aada46edf7f7 Denis Aleksandrov 2025-09-10  329  	u32 ret;
18aada46edf7f7 Denis Aleksandrov 2025-09-10  330  	int i;
0dc553652102c5 Jarkko Sakkinen   2014-12-12  331  
18aada46edf7f7 Denis Aleksandrov 2025-09-10  332  	spin_lock(&tpm_ppi_lock);
18aada46edf7f7 Denis Aleksandrov 2025-09-10  333  	if (!ppi_cache_populated) {
18aada46edf7f7 Denis Aleksandrov 2025-09-10  334  		len = cache_ppi_operations(chip->acpi_dev_handle, buf);
18aada46edf7f7 Denis Aleksandrov 2025-09-10  335  		if (len < 0)
18aada46edf7f7 Denis Aleksandrov 2025-09-10  336  			return len;
18aada46edf7f7 Denis Aleksandrov 2025-09-10  337  
18aada46edf7f7 Denis Aleksandrov 2025-09-10  338  		ppi_cache_populated = true;
18aada46edf7f7 Denis Aleksandrov 2025-09-10  339  	}
18aada46edf7f7 Denis Aleksandrov 2025-09-10  340  
18aada46edf7f7 Denis Aleksandrov 2025-09-10  341  	for (i = 0; i <= PPI_TPM_REQ_MAX; i++) {
18aada46edf7f7 Denis Aleksandrov 2025-09-10  342  		ret = ppi_operations_cache[i];
18aada46edf7f7 Denis Aleksandrov 2025-09-10  343  		if (ret >= 0 && ret < ARRAY_SIZE(tpm_ppi_info))
18aada46edf7f7 Denis Aleksandrov 2025-09-10  344  			len += sysfs_emit_at(buf, len, "%d %d: %s\n",
18aada46edf7f7 Denis Aleksandrov 2025-09-10  345  							i, ret, tpm_ppi_info[ret]);
18aada46edf7f7 Denis Aleksandrov 2025-09-10  346  	}
18aada46edf7f7 Denis Aleksandrov 2025-09-10  347  	spin_unlock(&tpm_ppi_lock);
18aada46edf7f7 Denis Aleksandrov 2025-09-10  348  
18aada46edf7f7 Denis Aleksandrov 2025-09-10 @349  	return len;
f84fdff0fdcda7 Xiaoyan Zhang     2012-08-22  350  }
f84fdff0fdcda7 Xiaoyan Zhang     2012-08-22  351  
81198078d7da42 Xiaoyan Zhang     2013-08-29  352  static ssize_t tpm_show_ppi_vs_operations(struct device *dev,
81198078d7da42 Xiaoyan Zhang     2013-08-29  353  					  struct device_attribute *attr,
81198078d7da42 Xiaoyan Zhang     2013-08-29  354  					  char *buf)
f84fdff0fdcda7 Xiaoyan Zhang     2012-08-22  355  {
9b774d5cf2db4b Jarkko Sakkinen   2015-04-14  356  	struct tpm_chip *chip = to_tpm_chip(dev);
18aada46edf7f7 Denis Aleksandrov 2025-09-10  357  	ssize_t len = 0;
18aada46edf7f7 Denis Aleksandrov 2025-09-10  358  	u32 ret;
18aada46edf7f7 Denis Aleksandrov 2025-09-10  359  	int i;
18aada46edf7f7 Denis Aleksandrov 2025-09-10  360  
18aada46edf7f7 Denis Aleksandrov 2025-09-10  361  	spin_lock(&tpm_ppi_lock);
18aada46edf7f7 Denis Aleksandrov 2025-09-10  362  	if (!ppi_cache_populated) {
18aada46edf7f7 Denis Aleksandrov 2025-09-10  363  		len = cache_ppi_operations(chip->acpi_dev_handle, buf);
18aada46edf7f7 Denis Aleksandrov 2025-09-10  364  		if (len < 0)
18aada46edf7f7 Denis Aleksandrov 2025-09-10  365  			return len;
18aada46edf7f7 Denis Aleksandrov 2025-09-10  366  
18aada46edf7f7 Denis Aleksandrov 2025-09-10  367  		ppi_cache_populated = true;
18aada46edf7f7 Denis Aleksandrov 2025-09-10  368  	}
0dc553652102c5 Jarkko Sakkinen   2014-12-12  369  
18aada46edf7f7 Denis Aleksandrov 2025-09-10  370  	for (i = PPI_VS_REQ_START; i <= PPI_VS_REQ_END; i++) {
18aada46edf7f7 Denis Aleksandrov 2025-09-10  371  		ret = ppi_operations_cache[i];
18aada46edf7f7 Denis Aleksandrov 2025-09-10  372  		if (ret >= 0 && ret < ARRAY_SIZE(tpm_ppi_info))
18aada46edf7f7 Denis Aleksandrov 2025-09-10  373  			len += sysfs_emit_at(buf, len, "%d %d: %s\n",
18aada46edf7f7 Denis Aleksandrov 2025-09-10  374  							i, ret, tpm_ppi_info[ret]);
18aada46edf7f7 Denis Aleksandrov 2025-09-10  375  	}
18aada46edf7f7 Denis Aleksandrov 2025-09-10  376  	spin_unlock(&tpm_ppi_lock);
18aada46edf7f7 Denis Aleksandrov 2025-09-10  377  
18aada46edf7f7 Denis Aleksandrov 2025-09-10 @378  	return len;
f84fdff0fdcda7 Xiaoyan Zhang     2012-08-22  379  }
f84fdff0fdcda7 Xiaoyan Zhang     2012-08-22  380  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
