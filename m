Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F25C70830
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Dec 2025 01:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766454054; cv=none; b=dv/j41sjLY/0hALQ5g1Qm2MqJr1Cq2lPw0GnUnh5NWqnh7WXRCBWDtnx9ZPkOIkc3xSlmfEXZkGpWsSf9ySZkkqmYR736JLmbdsL770Bnlzh0sQ8zPqNZty+95sksNrnI9kquTqz5pcAeepYmrNxx//WSnTRxYxfUiN7e9aZ6JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766454054; c=relaxed/simple;
	bh=ff4t7Wl3nXc1jPpHqgdrcqvL56wT8l2GvtpxpyYSClE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H1UsldFxoaHwgI3yjU+7bcLUt+x8UY9axpwqgJZAv+VQoz7cwSpj3KVgzuwnr9eh7rnSfnwJL6a2+zn1cqWhbTHXvf46bqoFycESxCOCKaHYmv9MnmF1QCd6COS0bQBnGHOVT2Q57IZMQP3C5GRkwN1zddOHoROnQ0aG9ke71a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nuUeUT7C; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nuUeUT7C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766454052; x=1797990052;
  h=date:from:to:cc:subject:message-id;
  bh=ff4t7Wl3nXc1jPpHqgdrcqvL56wT8l2GvtpxpyYSClE=;
  b=nuUeUT7CDz+gYD0Ul5hpYxjRs2F/FIHv2MmEorBsZ6I4cJvf/bsPoUS5
   /mCdwWF44jkxDnhzmcmmrdESbAA+uemoi8AV9Zc127V8aWwizTpUeVpOC
   W/JV+8Y7BGhyLw3yvtpJxqjmedtK3LL8fqU/7a0L7jK+tsesfXTBBNUKq
   eZ2ME9Qotj+n08BNDKlhjxoOP53IRd7nA9LSHUCU8ExikmGu5729SIvw9
   HkUOt/IwgXD2G//MtttfDkNSA8hPQTzseeYfZ4csN7NdNvBnbOWHknCkv
   DZXVFMybYLE7CaxtrRxOBqaNOaPhSfaj+NN0orMLmQvFeIWayQkfnTD4t
   A==;
X-CSE-ConnectionGUID: uaug92X6SsSkjjqzYXWrpA==
X-CSE-MsgGUID: T7i5tMjmRfuYEhJ+r7gdgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="90966460"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="90966460"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 17:40:52 -0800
X-CSE-ConnectionGUID: k//QFpzhTYS3FJ9AyW82Rw==
X-CSE-MsgGUID: 841EPBFjQnmuJCdq2Mk8PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="199966672"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 22 Dec 2025 17:40:50 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXrOK-000000001Il-2DjV;
	Tue, 23 Dec 2025 01:40:48 +0000
Date: Tue, 23 Dec 2025 09:40:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jic23-iio:testing 17/49]
 drivers/iio/adc/nxp-sar-adc.c:1014:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202512230905.TwfuG8hn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/iio/adc/nxp-sar-adc.c:1014:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Daniel Lezcano <daniel.lezcano@linaro.org>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: "Alexandru-Catalin Ionita" <alexandru-catalin.ionita@nxp.com>
CC: Ciprian Costea <ciprianmarian.costea@nxp.com>
CC: "Radu Pirea (NXP OSS)" <radu-nicolae.pirea@oss.nxp.com>
CC: Andy Shevchenko <andriy.shevchenko@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   4e44c635ba8c281f74001d47e20bbcb7f516530c
commit: 4434072a893e4864519c167947083ff3e4cc2d95 [17/49] iio: adc: Add the NXP SAR ADC support for the s32g2/3 platforms
:::::: branch date: 30 hours ago
:::::: commit date: 2 days ago
config: um-randconfig-r122-20251223 (https://download.01.org/0day-ci/archive/20251223/202512230905.TwfuG8hn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230905.TwfuG8hn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512230905.TwfuG8hn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iio/adc/nxp-sar-adc.c:1014:1: sparse: sparse: bad integer constant expression
   drivers/iio/adc/nxp-sar-adc.c:1014:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/iio/adc/nxp-sar-adc.c:1015:1: sparse: sparse: bad integer constant expression
   drivers/iio/adc/nxp-sar-adc.c:1015:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/iio/adc/nxp-sar-adc.c:1016:1: sparse: sparse: bad integer constant expression
   drivers/iio/adc/nxp-sar-adc.c:1016:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +1014 drivers/iio/adc/nxp-sar-adc.c

4434072a893e48 Daniel Lezcano 2025-12-08  1013  
4434072a893e48 Daniel Lezcano 2025-12-08 @1014  MODULE_AUTHOR("NXP");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
