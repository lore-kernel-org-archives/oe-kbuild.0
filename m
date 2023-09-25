Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A77224D8
	for <oe-kbuild@lists.linux.dev>; Mon, 25 Sep 2023 18:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695666284; x=1727202284;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=kORMIdSRhhxxWSLgkuBuj+5rmJU3InxP7iIC3T48h7M=;
  b=RyHlwIYtn3AwAb7DuDEwJktqmaSUAFRf2KJF9fSIWDRdGanLS69V6L+K
   7E3WnWd2fDmWSCbdu/FBWHwzHIYwnI7A93cdzB08i0vQ867MrnYlopCLB
   Tiuj59nCyqXFDh2a1XW5G7+ccNVNokfDHCtG82XimoAcuU9Xem21mlYfS
   5ujZFDMgOkhTcTIwAQcE5AjZMPOFWK2lryGP8ji/2optt8QrbMCDvjdfZ
   4TsidjVjZOOIvHwX+Oxtq/w4l0e3I+OUHUdSAGvwV66zY9KeKAg2GUdXi
   Ih7lR6+haxp/mKsWcJMI1qiF8SMHExgnYrf2CDc7GwVMYpm+CEQs/uSoc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="378610614"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="378610614"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 11:24:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="748431345"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="748431345"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 25 Sep 2023 11:24:40 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkqG5-0001uM-0A;
	Mon, 25 Sep 2023 18:24:37 +0000
Date: Tue, 26 Sep 2023 02:24:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [chrome-os:chromeos-5.4 32/34]
 drivers/iio/industrialio-core.c:1851:2-8: preceding lock on line 1848
Message-ID: <202309260246.FFJPzbf1-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.4
head:   47a5bab6041a6e6381156a2dfe5781ded89ffa63
commit: 16382e4ab8163f25b527ef0982887c66a9042a42 [32/34] BACKPORT: iio: core: introduce iio_device_{claim|release}_buffer_mode() APIs
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-101-20230925 (https://download.01.org/0day-ci/archive/20230926/202309260246.FFJPzbf1-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230926/202309260246.FFJPzbf1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202309260246.FFJPzbf1-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/iio/industrialio-core.c:1851:2-8: preceding lock on line 1848

vim +1851 drivers/iio/industrialio-core.c

08a33805518e784 Alison Schofield 2016-03-09  1834  
16382e4ab8163f2 Nuno Sá          2022-10-12  1835  /**
16382e4ab8163f2 Nuno Sá          2022-10-12  1836   * iio_device_claim_buffer_mode - Keep device in buffer mode
16382e4ab8163f2 Nuno Sá          2022-10-12  1837   * @indio_dev:	the iio_dev associated with the device
16382e4ab8163f2 Nuno Sá          2022-10-12  1838   *
16382e4ab8163f2 Nuno Sá          2022-10-12  1839   * If the device is in buffer mode it is guaranteed to stay
16382e4ab8163f2 Nuno Sá          2022-10-12  1840   * that way until iio_device_release_buffer_mode() is called.
16382e4ab8163f2 Nuno Sá          2022-10-12  1841   *
16382e4ab8163f2 Nuno Sá          2022-10-12  1842   * Use with iio_device_release_buffer_mode().
16382e4ab8163f2 Nuno Sá          2022-10-12  1843   *
16382e4ab8163f2 Nuno Sá          2022-10-12  1844   * Returns: 0 on success, -EBUSY on failure.
16382e4ab8163f2 Nuno Sá          2022-10-12  1845   */
16382e4ab8163f2 Nuno Sá          2022-10-12  1846  int iio_device_claim_buffer_mode(struct iio_dev *indio_dev)
16382e4ab8163f2 Nuno Sá          2022-10-12  1847  {
16382e4ab8163f2 Nuno Sá          2022-10-12 @1848  	mutex_lock(&indio_dev->mlock);
16382e4ab8163f2 Nuno Sá          2022-10-12  1849  
16382e4ab8163f2 Nuno Sá          2022-10-12  1850  	if (iio_buffer_enabled(indio_dev))
16382e4ab8163f2 Nuno Sá          2022-10-12 @1851  		return 0;
16382e4ab8163f2 Nuno Sá          2022-10-12  1852  
16382e4ab8163f2 Nuno Sá          2022-10-12  1853  	mutex_unlock(&indio_dev->mlock);
16382e4ab8163f2 Nuno Sá          2022-10-12  1854  	return -EBUSY;
16382e4ab8163f2 Nuno Sá          2022-10-12  1855  }
16382e4ab8163f2 Nuno Sá          2022-10-12  1856  EXPORT_SYMBOL_GPL(iio_device_claim_buffer_mode);
16382e4ab8163f2 Nuno Sá          2022-10-12  1857  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
