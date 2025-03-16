Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC02171E49
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Mar 2025 10:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742122694; cv=none; b=Z1cS/zoKkVyoWAgILqQIqMdNwhpDzt3Ry1ntOS9HInXj8Uaa3Lvi3jKJQL1TXI2LZWKm4dPiC0jM1p9/dq+xsKg92dBz7xIKL/3j7xkPokeq/Ya1mZlizckQBrKZ8kb0UBAVMoUR+j7l1FsH7ftsXx4/t+fKW7eYIOXkaiBCvkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742122694; c=relaxed/simple;
	bh=reS7CHZKvTXU0F3ckQlWpiQr9I4dZ7tIzrEBM9wriwc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BJCvP4HKpfI9yjI7Rai3QhP7EOo187TNc3YqyrZSuPJitLumYXHUVHa64Lr4CdcujUEdpLst3nGE7vjDi4KqLxWktylx0EaXixyjlGXB+zuWGG2/bOquEJSCFboSZ6HDeif7YG2Yo8QFmixLooKTLZOPA71EpSMYXk9vz5mG5uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D72ZrP75; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D72ZrP75"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742122693; x=1773658693;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=reS7CHZKvTXU0F3ckQlWpiQr9I4dZ7tIzrEBM9wriwc=;
  b=D72ZrP75ARn2ezupiPxbrVFnIiN696zc1unlHrks+eAEvfw/PZJ5wvi5
   QdpsdNEr7mjeckQbszpYznCPhIdZ00eV6sDJHcn6yDPaAC8TPgVFIwrEr
   wXqdPk0wEMyNN/C01dsnGL+qU5Rbq7Elq6/9eIsPhgZy39QOCA+DHTyQn
   LJ+kp8RoEmUDGdXlDQvc7VZMak75e+tj0LIKJzK5w9lbaI8hUnddEecvw
   9l3Ceh6Jw4icwlaODNnOzhUrg8pudczb5BNm7LVaQnEaOY+SvJiG3rWq2
   uz97akRMxSxlmquu7n6ceM1iWtFGIv0Uym2mJutfbriW+yBnnObLIOZMz
   g==;
X-CSE-ConnectionGUID: ovI5io9fT4m6SAzoRRVAdQ==
X-CSE-MsgGUID: k25ZpEmeQxmzBm36NDmveg==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="53887479"
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="53887479"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2025 03:58:12 -0700
X-CSE-ConnectionGUID: rVbi3TBLQK2Dyydkml5xyA==
X-CSE-MsgGUID: olNTBIpETCS1QptEeCUeaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="122169819"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 16 Mar 2025 03:58:11 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttlh2-000Bxr-0h;
	Sun, 16 Mar 2025 10:58:08 +0000
Date: Sun, 16 Mar 2025 18:57:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-kiwi-6.1 290/290]
 drivers/gpu/drm/drm_displayid.c:31 validate_displayid() warn: passing
 positive error code '(-22)' to 'PTR_ERR'
Message-ID: <202503161817.AZJv9oo9-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   d71786d14d19c4686859f15454883795f59bef15
commit: 4b17053ba268bf952c19ecb58d66d5d72e782d13 [290/290] drm/displayid: add displayid_get_header() and check bounds better
:::::: branch date: 28 hours ago
:::::: commit date: 1 year, 10 months ago
config: i386-randconfig-141-20250316 (https://download.01.org/0day-ci/archive/20250316/202503161817.AZJv9oo9-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503161817.AZJv9oo9-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/drm_displayid.c:31 validate_displayid() warn: passing positive error code '(-22)' to 'PTR_ERR'

vim +31 drivers/gpu/drm/drm_displayid.c

4b17053ba268bf9 Jani Nikula 2023-02-16  22  
4cc4f09eaa06178 Jani Nikula 2021-03-29  23  static int validate_displayid(const u8 *displayid, int length, int idx)
4cc4f09eaa06178 Jani Nikula 2021-03-29  24  {
4cc4f09eaa06178 Jani Nikula 2021-03-29  25  	int i, dispid_length;
4cc4f09eaa06178 Jani Nikula 2021-03-29  26  	u8 csum = 0;
339be1a8e9af736 Jani Nikula 2021-03-29  27  	const struct displayid_header *base;
4cc4f09eaa06178 Jani Nikula 2021-03-29  28  
4b17053ba268bf9 Jani Nikula 2023-02-16  29  	base = displayid_get_header(displayid, length, idx);
4b17053ba268bf9 Jani Nikula 2023-02-16  30  	if (IS_ERR(base))
4b17053ba268bf9 Jani Nikula 2023-02-16 @31  		return PTR_ERR(base);
4cc4f09eaa06178 Jani Nikula 2021-03-29  32  
4cc4f09eaa06178 Jani Nikula 2021-03-29  33  	DRM_DEBUG_KMS("base revision 0x%x, length %d, %d %d\n",
4cc4f09eaa06178 Jani Nikula 2021-03-29  34  		      base->rev, base->bytes, base->prod_id, base->ext_count);
4cc4f09eaa06178 Jani Nikula 2021-03-29  35  
4cc4f09eaa06178 Jani Nikula 2021-03-29  36  	/* +1 for DispID checksum */
4cc4f09eaa06178 Jani Nikula 2021-03-29  37  	dispid_length = sizeof(*base) + base->bytes + 1;
4cc4f09eaa06178 Jani Nikula 2021-03-29  38  	if (dispid_length > length - idx)
4cc4f09eaa06178 Jani Nikula 2021-03-29  39  		return -EINVAL;
4cc4f09eaa06178 Jani Nikula 2021-03-29  40  
4cc4f09eaa06178 Jani Nikula 2021-03-29  41  	for (i = 0; i < dispid_length; i++)
4cc4f09eaa06178 Jani Nikula 2021-03-29  42  		csum += displayid[idx + i];
4cc4f09eaa06178 Jani Nikula 2021-03-29  43  	if (csum) {
4cc4f09eaa06178 Jani Nikula 2021-03-29  44  		DRM_NOTE("DisplayID checksum invalid, remainder is %d\n", csum);
4cc4f09eaa06178 Jani Nikula 2021-03-29  45  		return -EINVAL;
4cc4f09eaa06178 Jani Nikula 2021-03-29  46  	}
4cc4f09eaa06178 Jani Nikula 2021-03-29  47  
4cc4f09eaa06178 Jani Nikula 2021-03-29  48  	return 0;
4cc4f09eaa06178 Jani Nikula 2021-03-29  49  }
4cc4f09eaa06178 Jani Nikula 2021-03-29  50  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
