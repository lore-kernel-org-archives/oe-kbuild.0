Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE3513D295
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Apr 2024 12:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713356539; cv=none; b=TP19Zy9dE10InOPwgLD3MufXK/fV0/U3GENRiIjMelORf6vTPyBGVLoRkXk0hJSRSQF3MbB+UKNr0McdTA2cMgK3uZVx6DTUsBNjKfk2ZWG9b0j6D/yItiZE5QeQ099xOg6dST1E2Jq5B7YaLhenbfe3Bx+XHwOh8gZQVooWhj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713356539; c=relaxed/simple;
	bh=gAr5qfCjhCHRvjH+BSLUI2yMEry4JGpndjRYGg/Z/90=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M4elxLN913jRI8iF5Q3w4orlKDRLjruvXU8FVg40J2VgT4k3iXCxNGwQ+WAu5MKjaikSG4k/j3KmaT2xR1Y+8LF2qOeU1bPhLRUmOWsTNqGBjD81+QaypIwSsa3JbiUECGQoZyNT1gH567tFKmnn2iBVliz9/VV44vyCvha/XNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kryNQbAO; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kryNQbAO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713356537; x=1744892537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gAr5qfCjhCHRvjH+BSLUI2yMEry4JGpndjRYGg/Z/90=;
  b=kryNQbAOqXHL0Ljy3CkJPQ4nKo/wmqrZWfzkDt/vD8Ef/RAiAi98VSlo
   XX6+HJNvooIw1FKYB+6gf5inbyYQC7oL18+olNduQ31LNlq+F/oliV1Rv
   MbZfTlSRKgJbV4VFfdtP8ifZOqXl7TbkGLgL/fuWm1aDlf9hdtrZKq0/e
   LRsc6Fya7TRzMtzWdtOEfJSnKQATeuAufyiqEaS4rolx8RzrCVXqR7Byl
   ktAHrvaJvAl2Wo/YW5U3qGh26u9Mt95CFKj5Jsig03F4lT+QfRLIj9lVo
   qMXCOpZ2f3kyVxxyeAc4IiWWaFEV5m8JCXoQxmozYM7adCJ6X2AnLv+bG
   g==;
X-CSE-ConnectionGUID: 8xszl7GgTXaZAZwgyXa62w==
X-CSE-MsgGUID: I2HoQCytTGa1excxf8IwEA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="9066197"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="9066197"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 05:22:16 -0700
X-CSE-ConnectionGUID: KcIbm62oQ5W4YPCP+ofHeQ==
X-CSE-MsgGUID: vTOjEc48SVO3Er37XOhGUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="22677379"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 17 Apr 2024 05:22:15 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rx4Im-0006ZA-2z;
	Wed, 17 Apr 2024 12:22:12 +0000
Date: Wed, 17 Apr 2024 20:21:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/phy/motorcomm.c:885:12-14: WARNING opportunity for min()
Message-ID: <202404172059.wU4sM9Qi-lkp@intel.com>
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
TO: Samin Guo <samin.guo@starfivetech.com>
CC: Hal Feng <hal.feng@starfivetech.com>
CC: Andrew Lunn <andrew@lunn.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   96fca68c4fbf77a8185eb10f7557e23352732ea2
commit: 7a561e9351ae7e3fb1f08584d40b49c1e55dde60 net: phy: motorcomm: Add pad drive strength cfg support
date:   9 months ago
:::::: branch date: 2 days ago
:::::: commit date: 9 months ago
config: i386-randconfig-053-20240417 (https://download.01.org/0day-ci/archive/20240417/202404172059.wU4sM9Qi-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202404172059.wU4sM9Qi-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/phy/motorcomm.c:885:12-14: WARNING opportunity for min()

vim +885 drivers/net/phy/motorcomm.c

7a561e9351ae7e3 Samin Guo 2023-07-20  877  
7a561e9351ae7e3 Samin Guo 2023-07-20  878  static u32 yt8531_get_ldo_vol(struct phy_device *phydev)
7a561e9351ae7e3 Samin Guo 2023-07-20  879  {
7a561e9351ae7e3 Samin Guo 2023-07-20  880  	u32 val;
7a561e9351ae7e3 Samin Guo 2023-07-20  881  
7a561e9351ae7e3 Samin Guo 2023-07-20  882  	val = ytphy_read_ext_with_lock(phydev, YT8521_CHIP_CONFIG_REG);
7a561e9351ae7e3 Samin Guo 2023-07-20  883  	val = FIELD_GET(YT8531_RGMII_LDO_VOL_MASK, val);
7a561e9351ae7e3 Samin Guo 2023-07-20  884  
7a561e9351ae7e3 Samin Guo 2023-07-20 @885  	return val <= YT8531_LDO_VOL_1V8 ? val : YT8531_LDO_VOL_1V8;
7a561e9351ae7e3 Samin Guo 2023-07-20  886  }
7a561e9351ae7e3 Samin Guo 2023-07-20  887  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
