Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C40F840CB
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Dec 2023 22:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZbRhIaNd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701987609; x=1733523609;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hZzPk+C/FLQbjdcZndgpb87mpkYJcFYmg0bMHFpZAWo=;
  b=ZbRhIaNdEbpcmdLTXE34tx0JdIqIj2iumhZrYav2tNJ+MXeJsh+O6eVP
   rTMH8j9enU45xBhgLTt1ZWrbWW31FO06NnyU0pjZQOIgGtmEacUBuk8z5
   UYUhZy4bc+T7NssFgp58hQX4hHQywbLTQgRvpmEJ0KJZkvUCKM/bjqc8S
   jEXBPtQugg37EeZm/VuPy7yEmh0Mos2n6h+taK39JLzc5Wm48O69xDsiF
   TrN0YuEC+GlDoytOS77kGniYBfDnPOhtzWJW50uUFWkUtmHfv9xvLFPXW
   LeLiCmK0/Mog6fGNSEgoPqsSt05w3Yfmu3K5RVH41jfZ0UNlnAVNqFsfM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1423709"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="1423709"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 14:19:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="748121708"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="748121708"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 07 Dec 2023 14:19:57 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBMip-000Cu1-19;
	Thu, 07 Dec 2023 22:19:55 +0000
Date: Fri, 8 Dec 2023 06:19:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/iio/frequency/adf4377.c:498:19-48: duplicated argument to &
 or |
Message-ID: <202312080606.0wEO9f5h-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Antoniu Miclaus <antoniu.miclaus@analog.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: "Nuno Sá" <nuno.sa@analog.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: eda549e2e52496d0d374ce457f514a4f14172aa5 iio: frequency: adf4377: add support for ADF4377
date:   1 year ago
:::::: branch date: 3 days ago
:::::: commit date: 1 year ago
config: x86_64-randconfig-101-20231208 (https://download.01.org/0day-ci/archive/20231208/202312080606.0wEO9f5h-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20231208/202312080606.0wEO9f5h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312080606.0wEO9f5h-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/iio/frequency/adf4377.c:498:19-48: duplicated argument to & or |

vim +498 drivers/iio/frequency/adf4377.c

eda549e2e52496 Antoniu Miclaus 2022-11-15  484  
eda549e2e52496 Antoniu Miclaus 2022-11-15  485  static int adf4377_soft_reset(struct adf4377_state *st)
eda549e2e52496 Antoniu Miclaus 2022-11-15  486  {
eda549e2e52496 Antoniu Miclaus 2022-11-15  487  	unsigned int read_val;
eda549e2e52496 Antoniu Miclaus 2022-11-15  488  	int ret;
eda549e2e52496 Antoniu Miclaus 2022-11-15  489  
eda549e2e52496 Antoniu Miclaus 2022-11-15  490  	ret = regmap_update_bits(st->regmap, 0x0, ADF4377_0000_SOFT_RESET_MSK |
eda549e2e52496 Antoniu Miclaus 2022-11-15  491  				 ADF4377_0000_SOFT_RESET_R_MSK,
eda549e2e52496 Antoniu Miclaus 2022-11-15  492  				 FIELD_PREP(ADF4377_0000_SOFT_RESET_MSK, 1) |
eda549e2e52496 Antoniu Miclaus 2022-11-15  493  				 FIELD_PREP(ADF4377_0000_SOFT_RESET_R_MSK, 1));
eda549e2e52496 Antoniu Miclaus 2022-11-15  494  	if (ret)
eda549e2e52496 Antoniu Miclaus 2022-11-15  495  		return ret;
eda549e2e52496 Antoniu Miclaus 2022-11-15  496  
eda549e2e52496 Antoniu Miclaus 2022-11-15  497  	return regmap_read_poll_timeout(st->regmap, 0x0, read_val,
eda549e2e52496 Antoniu Miclaus 2022-11-15 @498  					!(read_val & (ADF4377_0000_SOFT_RESET_R_MSK |
eda549e2e52496 Antoniu Miclaus 2022-11-15  499  					ADF4377_0000_SOFT_RESET_R_MSK)), 200, 200 * 100);
eda549e2e52496 Antoniu Miclaus 2022-11-15  500  }
eda549e2e52496 Antoniu Miclaus 2022-11-15  501  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
