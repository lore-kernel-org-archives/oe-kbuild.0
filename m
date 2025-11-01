Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244532B2DA
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Nov 2025 21:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762032026; cv=none; b=Z45qsAeSIsIlUBELt6XBL9shueyiL09fjJfPA5HxOTjtafRixMNw6l5g69WzbCG9eZH46ECuYsfoAnYarn8aU1zlzBVvAyIJD6UsjLSYnZjjItwNWV7fbaz4sA6ACGSWwXp9lyBgPbcDt88bVNNCtOfBJ4L632xqLjtQBDlOhlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762032026; c=relaxed/simple;
	bh=J4OynAphHOiji52OwmE1PGENo4eP330qJL/qc9cb0Bg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qP4Q1S6vwTPVolcc02zyUp8LwME9Eso6T/CS8DhQtNV9BH3VbjHJ+8EP2e/OcbDXF3BFXzmhedROK84cYVX2Q3Jcq/NvpxlWmudkK1CzA1rJH06L02Ii80IP5wD8q/D015PoQxgHNfKSm5n1L0zemxmxDwwbbTM6CmeDD6LBCpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lZShLD2Z; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lZShLD2Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762032024; x=1793568024;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J4OynAphHOiji52OwmE1PGENo4eP330qJL/qc9cb0Bg=;
  b=lZShLD2ZejAsdxDcj2j6dLKo9Py1AyGt1Gl4Fp0kP+f32y/CNyxU21pO
   iGyIV/R2WPqlZcE755v7IFmz4K/Zne/AqsfZeiBTvm1/KlJcu+jrLh3pY
   xKCuWG8X2BO2hJ1Lb9qz1Fafp4/zAZxEboYoXVzD8LyYIyMnJVPNAhIjb
   V8YDamHYXYgxuOLdQRjkk4FjUK/OA7l63ba4EUYGnrAX9fZzfCHAYUF2p
   wncPUDNmV5PP978CdtZyMItUphJwjT2MHlyMY5gf3Uhy/SPf/AyTExGhW
   c1uJEg7FWEwlHYEsSPDale/tCxvqxM56+jhA6seu1pU2YdJ+Y2fm2QK28
   Q==;
X-CSE-ConnectionGUID: MjU/+wp8RyCPBfHy4nMbJQ==
X-CSE-MsgGUID: gOWvjevASt6Nxl5auAAwLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64066419"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64066419"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 14:20:23 -0700
X-CSE-ConnectionGUID: 8Sj+XtR5SAm6TD4SpJzO1A==
X-CSE-MsgGUID: 1R4ZFXuiSTCEX1we/qZmug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="186476591"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 01 Nov 2025 14:20:23 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFJ1C-000Oh6-1Q;
	Sat, 01 Nov 2025 21:20:16 +0000
Date: Sun, 2 Nov 2025 05:19:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3] w1: therm: Fix off-by-one buffer overflow in
 alarms_store
Message-ID: <202511020405.22bJ76JV-lkp@intel.com>
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
In-Reply-To: <20251030155614.447905-1-thorsten.blum@linux.dev>
References: <20251030155614.447905-1-thorsten.blum@linux.dev>
TO: Thorsten Blum <thorsten.blum@linux.dev>
TO: David Laight <david.laight.linux@gmail.com>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Huisong Li <lihuisong@huawei.com>
TO: Akira Shimahara <akira215corp@gmail.com>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Thorsten Blum <thorsten.blum@linux.dev>
CC: stable@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Thorsten,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk-w1/for-next]
[also build test WARNING on linus/master v6.18-rc3 next-20251031]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thorsten-Blum/w1-therm-Fix-off-by-one-buffer-overflow-in-alarms_store/20251031-000306
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-w1.git for-next
patch link:    https://lore.kernel.org/r/20251030155614.447905-1-thorsten.blum%40linux.dev
patch subject: [PATCH v3] w1: therm: Fix off-by-one buffer overflow in alarms_store
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20251101 (https://download.01.org/0day-ci/archive/20251102/202511020405.22bJ76JV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511020405.22bJ76JV-lkp@intel.com/

New smatch warnings:
drivers/w1/slaves/w1_therm.c:1846 alarms_store() warn: impossible condition '(temp < (-((~0 >> 1)) - 1)) => (s32min-s32max < s32min)'
drivers/w1/slaves/w1_therm.c:1846 alarms_store() warn: impossible condition '(temp > ((~0 >> 1))) => (s32min-s32max > s32max)'

Old smatch warnings:
drivers/w1/slaves/w1_therm.c:1856 alarms_store() warn: impossible condition '(temp < (-((~0 >> 1)) - 1)) => (s32min-s32max < s32min)'
drivers/w1/slaves/w1_therm.c:1856 alarms_store() warn: impossible condition '(temp > ((~0 >> 1))) => (s32min-s32max > s32max)'

vim +1846 drivers/w1/slaves/w1_therm.c

e2c94d6f572079 Akira Shimahara 2020-05-11  1832  
e2c94d6f572079 Akira Shimahara 2020-05-11  1833  static ssize_t alarms_store(struct device *device,
e2c94d6f572079 Akira Shimahara 2020-05-11  1834  	struct device_attribute *attr, const char *buf, size_t size)
e2c94d6f572079 Akira Shimahara 2020-05-11  1835  {
e2c94d6f572079 Akira Shimahara 2020-05-11  1836  	struct w1_slave *sl = dev_to_w1_slave(device);
e2c94d6f572079 Akira Shimahara 2020-05-11  1837  	struct therm_info info;
e2c94d6f572079 Akira Shimahara 2020-05-11  1838  	u8 new_config_register[3];	/* array of data to be written */
fb05eaeed51f89 Thorsten Blum   2025-10-30  1839  	long temp;
fb05eaeed51f89 Thorsten Blum   2025-10-30  1840  	int ret;
e233897b1f7a85 Yang Guang      2021-12-21  1841  	s8 tl, th;	/* 1 byte per value + temp ring order */
fb05eaeed51f89 Thorsten Blum   2025-10-30  1842  	const char *p = buf;
fb05eaeed51f89 Thorsten Blum   2025-10-30  1843  	char *endp;
e2c94d6f572079 Akira Shimahara 2020-05-11  1844  
fb05eaeed51f89 Thorsten Blum   2025-10-30  1845  	temp = simple_strtol(p, &endp, 10);
fb05eaeed51f89 Thorsten Blum   2025-10-30 @1846  	if (temp < INT_MIN || temp > INT_MAX || p == endp || *endp != ' ') {
fb05eaeed51f89 Thorsten Blum   2025-10-30  1847  		dev_info(device, "%s: error parsing args %d\n",
fb05eaeed51f89 Thorsten Blum   2025-10-30  1848  			 __func__, -EINVAL);
fb05eaeed51f89 Thorsten Blum   2025-10-30  1849  		goto err;
e2c94d6f572079 Akira Shimahara 2020-05-11  1850  	}
fb05eaeed51f89 Thorsten Blum   2025-10-30  1851  	/* Cast to short to eliminate out of range values */
fb05eaeed51f89 Thorsten Blum   2025-10-30  1852  	tl = int_to_short((int)temp);
e2c94d6f572079 Akira Shimahara 2020-05-11  1853  
fb05eaeed51f89 Thorsten Blum   2025-10-30  1854  	p = endp + 1;
fb05eaeed51f89 Thorsten Blum   2025-10-30  1855  	temp = simple_strtol(p, &endp, 10);
fb05eaeed51f89 Thorsten Blum   2025-10-30  1856  	if (temp < INT_MIN || temp > INT_MAX || p == endp) {
fb05eaeed51f89 Thorsten Blum   2025-10-30  1857  		dev_info(device, "%s: error parsing args %d\n",
fb05eaeed51f89 Thorsten Blum   2025-10-30  1858  			 __func__, -EINVAL);
fb05eaeed51f89 Thorsten Blum   2025-10-30  1859  		goto err;
e2c94d6f572079 Akira Shimahara 2020-05-11  1860  	}
fb05eaeed51f89 Thorsten Blum   2025-10-30  1861  	/* Cast to short to eliminate out of range values */
fb05eaeed51f89 Thorsten Blum   2025-10-30  1862  	th = int_to_short((int)temp);
e2c94d6f572079 Akira Shimahara 2020-05-11  1863  
fb05eaeed51f89 Thorsten Blum   2025-10-30  1864  	/* Reorder if required */
e233897b1f7a85 Yang Guang      2021-12-21  1865  	if (tl > th)
e233897b1f7a85 Yang Guang      2021-12-21  1866  		swap(tl, th);
e2c94d6f572079 Akira Shimahara 2020-05-11  1867  
e2c94d6f572079 Akira Shimahara 2020-05-11  1868  	/*
e2c94d6f572079 Akira Shimahara 2020-05-11  1869  	 * Read the scratchpad to change only the required bits
e2c94d6f572079 Akira Shimahara 2020-05-11  1870  	 * (th : byte 2 - tl: byte 3)
e2c94d6f572079 Akira Shimahara 2020-05-11  1871  	 */
e2c94d6f572079 Akira Shimahara 2020-05-11  1872  	ret = read_scratchpad(sl, &info);
fb05eaeed51f89 Thorsten Blum   2025-10-30  1873  	if (ret) {
fb05eaeed51f89 Thorsten Blum   2025-10-30  1874  		dev_info(device, "%s: error reading from the slave device %d\n",
fb05eaeed51f89 Thorsten Blum   2025-10-30  1875  			 __func__, ret);
fb05eaeed51f89 Thorsten Blum   2025-10-30  1876  		goto err;
fb05eaeed51f89 Thorsten Blum   2025-10-30  1877  	}
e2c94d6f572079 Akira Shimahara 2020-05-11  1878  	new_config_register[0] = th;		/* Byte 2 */
e2c94d6f572079 Akira Shimahara 2020-05-11  1879  	new_config_register[1] = tl;		/* Byte 3 */
e2c94d6f572079 Akira Shimahara 2020-05-11  1880  	new_config_register[2] = info.rom[4];	/* Byte 4 */
e2c94d6f572079 Akira Shimahara 2020-05-11  1881  
e2c94d6f572079 Akira Shimahara 2020-05-11  1882  	/* Write data in the device RAM */
e2c94d6f572079 Akira Shimahara 2020-05-11  1883  	if (!SLAVE_SPECIFIC_FUNC(sl)) {
fb05eaeed51f89 Thorsten Blum   2025-10-30  1884  		dev_info(device, "%s: Device not supported by the driver %d\n",
e2c94d6f572079 Akira Shimahara 2020-05-11  1885  			 __func__, -ENODEV);
fb05eaeed51f89 Thorsten Blum   2025-10-30  1886  		goto err;
e2c94d6f572079 Akira Shimahara 2020-05-11  1887  	}
e2c94d6f572079 Akira Shimahara 2020-05-11  1888  
e2c94d6f572079 Akira Shimahara 2020-05-11  1889  	ret = SLAVE_SPECIFIC_FUNC(sl)->write_data(sl, new_config_register);
fb05eaeed51f89 Thorsten Blum   2025-10-30  1890  	if (ret) {
fb05eaeed51f89 Thorsten Blum   2025-10-30  1891  		dev_info(device, "%s: error writing to the slave device %d\n",
e2c94d6f572079 Akira Shimahara 2020-05-11  1892  			__func__, ret);
fb05eaeed51f89 Thorsten Blum   2025-10-30  1893  		goto err;
fb05eaeed51f89 Thorsten Blum   2025-10-30  1894  	}
e2c94d6f572079 Akira Shimahara 2020-05-11  1895  
fb05eaeed51f89 Thorsten Blum   2025-10-30  1896  err:
e2c94d6f572079 Akira Shimahara 2020-05-11  1897  	return size;
e2c94d6f572079 Akira Shimahara 2020-05-11  1898  }
e2c94d6f572079 Akira Shimahara 2020-05-11  1899  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
