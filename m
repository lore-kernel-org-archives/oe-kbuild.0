Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DA71B7F4
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Jan 2024 09:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706262644; cv=none; b=iOUpF8c2AR4XfmqiRd8c8UQL21AtBM2RlC7LOtihSNBJvdKDcnkvWigeiO8GmFbvYSiEpQOeolB5TmGhTYK1n0FBQdg5396NKZ0ZltongzV367F+2CHmFm351GJhjy95AntwJjwQ2aMqiSOUNEYy5nZ2JUkipuOTegwIcY0l14g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706262644; c=relaxed/simple;
	bh=1Im7QqkobZPspz7raJ/mtMCBNYt36x0+HhgD7EfeieU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XpsbJow9CYyolVr/F7bOr26rq3i7FUUxM0R8PqdUaWvuBXZA15NV3aTtW0SLT4x0aMd5LndqHIUoJjxT0F9mOBjS2rzX95H9s/9/yrIwqopke4vjuDiE8T9aeunPJoFLavbseOmk+qC43PiLN0d+WtigHaP9cIM/1ywcczHky8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bMtPkHwT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bMtPkHwT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706262643; x=1737798643;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1Im7QqkobZPspz7raJ/mtMCBNYt36x0+HhgD7EfeieU=;
  b=bMtPkHwTy1JTY950tkxSifDZ+n7XNKye37V66TH3rxDVFbA+sy8kLUOG
   GTRLTcTDd+BfvFtB4k1vzAlYtYG/vJNtzh+mFU1ACC3l1zDw6QjKlNxpV
   SzAkjqu4QUctgFAT+B0wIOuQmT4BR+ohQx1XNaGKPuN4TXKF2lhG18VAM
   ByC1tdbm818XHZGGbLpWyHDJwcXuAYmY/+KPLtQ+5Ihrkl6OlrO6gKddr
   vI45+FhHyM2+sXGoBu4xoGru1mk49fLwF5V2g5RcV3i8MTHugbdiaOPWc
   aUPBwTNb7OFrXYP+JAjmSRDHSz4R/HgxumhWorApzjETUp5OVWPISQRca
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="15957411"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="15957411"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 01:50:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="877346045"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="877346045"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Jan 2024 01:50:40 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTIr8-0000tw-2O;
	Fri, 26 Jan 2024 09:50:38 +0000
Date: Fri, 26 Jan 2024 17:49:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/hwmon/nzxt-smart2.c:461:12-13: WARNING opportunity for min()
Message-ID: <202401261737.6yWl89yE-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Aleksandr Mezin <mezin.alexander@gmail.com>
CC: Guenter Roeck <linux@roeck-us.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ecb1b8288dc7ccbdcb3b9df005fa1c0e0c0388a7
commit: 53e68c20aeb1e23419bed811aa3a309ceda200f9 hwmon: add driver for NZXT RGB&Fan Controller/Smart Device v2.
date:   2 years, 1 month ago
:::::: branch date: 15 hours ago
:::::: commit date: 2 years, 1 month ago
config: arm-randconfig-r062-20240117 (https://download.01.org/0day-ci/archive/20240126/202401261737.6yWl89yE-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 9bde5becb44ea071f5e1fa1f5d4071dc8788b18c)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401261737.6yWl89yE-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/hwmon/nzxt-smart2.c:461:12-13: WARNING opportunity for min()

vim +461 drivers/hwmon/nzxt-smart2.c

53e68c20aeb1e2 Aleksandr Mezin 2021-10-31  444  
53e68c20aeb1e2 Aleksandr Mezin 2021-10-31  445  static int send_output_report(struct drvdata *drvdata, const void *data,
53e68c20aeb1e2 Aleksandr Mezin 2021-10-31  446  			      size_t data_size)
53e68c20aeb1e2 Aleksandr Mezin 2021-10-31  447  {
53e68c20aeb1e2 Aleksandr Mezin 2021-10-31  448  	int ret;
53e68c20aeb1e2 Aleksandr Mezin 2021-10-31  449  
53e68c20aeb1e2 Aleksandr Mezin 2021-10-31  450  	if (data_size > sizeof(drvdata->output_buffer))
53e68c20aeb1e2 Aleksandr Mezin 2021-10-31  451  		return -EINVAL;
53e68c20aeb1e2 Aleksandr Mezin 2021-10-31  452  
53e68c20aeb1e2 Aleksandr Mezin 2021-10-31  453  	memcpy(drvdata->output_buffer, data, data_size);
53e68c20aeb1e2 Aleksandr Mezin 2021-10-31  454  
53e68c20aeb1e2 Aleksandr Mezin 2021-10-31  455  	if (data_size < sizeof(drvdata->output_buffer))
53e68c20aeb1e2 Aleksandr Mezin 2021-10-31  456  		memset(drvdata->output_buffer + data_size, 0,
53e68c20aeb1e2 Aleksandr Mezin 2021-10-31  457  		       sizeof(drvdata->output_buffer) - data_size);
53e68c20aeb1e2 Aleksandr Mezin 2021-10-31  458  
53e68c20aeb1e2 Aleksandr Mezin 2021-10-31  459  	ret = hid_hw_output_report(drvdata->hid, drvdata->output_buffer,
53e68c20aeb1e2 Aleksandr Mezin 2021-10-31  460  				   sizeof(drvdata->output_buffer));
53e68c20aeb1e2 Aleksandr Mezin 2021-10-31 @461  	return ret < 0 ? ret : 0;
53e68c20aeb1e2 Aleksandr Mezin 2021-10-31  462  }
53e68c20aeb1e2 Aleksandr Mezin 2021-10-31  463  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
