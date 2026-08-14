Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBBE254AFF
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Aug 2026 02:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786673877; cv=none; b=uDJPofhdnR4o5CQiEwng/5r2TMbh1bHYJIPuhHzUHsLmC/GowLV1M1MyD8q+X5GiJzz6VnB8cxUwvEBrxPtrHA6q890WbQWiAMGoNcDir3DJ1yV1EeBT1VU37mNXNlDLMnBoR/0ltV/s0yxDF7g2paZ+oA2Fne/AIed1Tin4Jzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786673877; c=relaxed/simple;
	bh=Om1lFYpQ5iMgrKlXriV+nJkAv9lR4E1ha2Mu48vjqOU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M8EROJKO/t1MMV3kCdf9QrAZJIq1ZqxDt0473qH3bYT+UEY0veJ30fMnycrR1R4RTXAaH9/XIhoAYeAMlNd6s5ktG7DYneQPaOM9ywfzjLi/BhluU9jYFBC20okx2jWckJwvOq9Zv3MzdkR33qjc+88D0efFbFai9fnsflP8uqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CVdTwsYi; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CVdTwsYi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786673874; x=1818209874;
  h=date:from:to:cc:subject:message-id;
  bh=Om1lFYpQ5iMgrKlXriV+nJkAv9lR4E1ha2Mu48vjqOU=;
  b=CVdTwsYiHPSN8v8KvwwLr9pvfDw11QzvSGpePioIQVB3BX2R6Ij/sjDM
   ik/lSgWvCo3qZGP5g8bGnmhDQEAqwyd5cz0km4M2KPfi209wmVZY1aHB+
   JwgauwB/SmwWmfEWHO//e8bApfJdtxNDb/G3gagrtiBKqk31ybQZ4/qK4
   4rPmscfk2q63U8BUwGfDIumF8TAdnRauHM1WqKzqfZbDkds5oxWslbH2C
   +/NVnxRydBdp4WNlLsO26Vfi2SXwsUfmOFqs0qA7rmk5c9G2fbu37I5SZ
   VFhHkGFIPelQCkHvfFZZq3QH0DcoNQwX0v3AHdmoNgGBIziv04BhKo3Iz
   w==;
X-CSE-ConnectionGUID: sIfJgbY6SAWrKUb52KV1+Q==
X-CSE-MsgGUID: It+CNGU+QnKUSY4bLJnlNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87117587"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="87117587"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 19:17:53 -0700
X-CSE-ConnectionGUID: ym4aohVtSVygzIDr1MN6eA==
X-CSE-MsgGUID: 6KDRWOFoQuuyLOP+HwvfLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="257880417"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Aug 2026 19:17:53 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuhUU-00000000XPq-26oa;
	Fri, 14 Aug 2026 02:17:50 +0000
Date: Fri, 14 Aug 2026 10:16:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/iio/health/max86150.c:304:22: error: incompatible
 function pointer types initializing 'int (*)(struct iio_dev *, struct
 iio_trigger *)' with an expression of type 'int (struct iio_trigger *, struct
 iio_dev *)'
Message-ID: <202608141020.r68VhGSG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Md-Shofiqul-Islam/dt-bindings-iio-health-add-maxim-max86150/20260812-204159, commit: 7d9142d14851b3e733c74294fe4ed3b8c0fe2714"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Md Shofiqul Islam <shofiqtest@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Md-Shofiqul-Islam/dt-bindings-iio-health-add-maxim-max86150/20260812-204159
head:   00cabb4834486f0cc65da13ea376d37ce0b55283
commit: 7d9142d14851b3e733c74294fe4ed3b8c0fe2714 iio: health: add MAX86150 ECG and PPG biosensor driver
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: sparc64-randconfig-r113-20260813 (https://download.01.org/0day-ci/archive/20260814/202608141020.r68VhGSG-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 844a18e753e822736c9805ab779144b647a2c186)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608141020.r68VhGSG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608141020.r68VhGSG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iio/health/max86150.c:304:22: error: incompatible function pointer types initializing 'int (*)(struct iio_dev *, struct iio_trigger *)' with an expression of type 'int (struct iio_trigger *, struct iio_dev *)' [-Wincompatible-function-pointer-types]
     304 |         .validate_trigger = iio_trigger_validate_own_device,
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +304 drivers/iio/health/max86150.c

7d9142d14851b3 Md Shofiqul Islam 2026-06-23  301  
7d9142d14851b3 Md Shofiqul Islam 2026-06-23  302  static const struct iio_info max86150_iio_info = {
7d9142d14851b3 Md Shofiqul Islam 2026-06-23  303  	.read_raw         = max86150_read_raw,
7d9142d14851b3 Md Shofiqul Islam 2026-06-23 @304  	.validate_trigger = iio_trigger_validate_own_device,
7d9142d14851b3 Md Shofiqul Islam 2026-06-23  305  };
7d9142d14851b3 Md Shofiqul Islam 2026-06-23  306  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
