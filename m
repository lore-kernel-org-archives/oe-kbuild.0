Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3756431E10B
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 22:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763072658; cv=none; b=b6ryXqN80uMW+JMdIPlna4RFtqXQprnMCVORUPXSIyI82tIONXGYSSFVz46BIb4Gu9PFdnW3KASwkazkmGObXKa/pLtwYiF+AzfbFSwlzBXkRnneUnfpAb04uY8WtxHettW6SYnbJPLDPUS9nXnRFjyl0LmdwZPWO833rSIK+BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763072658; c=relaxed/simple;
	bh=zoyxlizqbS5rYGEGgFe1pCv820oRjNxU1JzaGLtxlc0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gHXGAFnbiHn5+KFrs8At6PgOVBQmIoSwibiHCgc8VTGai5m+KEE1VQy0S3tg/BU6BWrEuRLMVnYkyEVq+xesxnEeVL9ECENJmWkd9Y3w1hqMOxwESF/uzaTz8wpx+L+U59y1n+Vhc7X+Qgh6THjhXRhVXY2BUczNDzE2aIKvmXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nk/xioxO; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nk/xioxO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763072657; x=1794608657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zoyxlizqbS5rYGEGgFe1pCv820oRjNxU1JzaGLtxlc0=;
  b=Nk/xioxOVbgjaI2GvZ0K+Sdp6A6RrBBQQh6EDcohLE5R/lO3HtarXEGM
   MxzxhXomFLw8flGH8RWq6JoKoHIhlcyZ35mxTllSMYw7jSOrTO9Qk8FO/
   SLO9DWSvQqA3nuWmC4ibCHRvG5ySry7koMVDSvtQLX7XsZTcP7x6Bktt8
   oW8Vilj+lMjZ6Q6uOVf6a95k8gCxB+iyI8FHc20e+tv+Rh67+f0D0EdnL
   sFLrjfOfBh+UC5SOc+A0CNZr2As5MGJxjCC8wxuQtUXICXadr4ZsT+g7M
   VNmXpQLkrsmvFLAC/Rkk8DM2Sg1T3Sl6LlulsIg9Q5BrsSM8oN64GGe5y
   g==;
X-CSE-ConnectionGUID: RbO6yp90T9Wugp8sQB6V6g==
X-CSE-MsgGUID: iteS7P+kQOKM2WcYNZGbEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="82798563"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="82798563"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 14:24:15 -0800
X-CSE-ConnectionGUID: EATG+at9Rke69RhHLMGz4A==
X-CSE-MsgGUID: FrWYn/hOR8Oxhg3LfnDYMQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Nov 2025 14:24:14 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJfjg-0005wZ-0J;
	Thu, 13 Nov 2025 22:24:12 +0000
Date: Fri, 14 Nov 2025 06:23:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [conor:pic64gx 19/48]
 drivers/pinctrl/pinctrl-mpfs-mssio.c:354:16-22: WARNING: Unsigned expression
 compared with zero: offset < 0
Message-ID: <202511140621.rxDDG9hK-lkp@intel.com>
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
TO: Conor Dooley <conor+lkp@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pic64gx
head:   eae264d53de9c7b0228c43bcc02db4a01c931f61
commit: 6540fdcdf074a183b0cb4b7edb0df026ab1c171f [19/48] pinctrl: add polarfire soc mssio pinctrl driver
:::::: branch date: 5 hours ago
:::::: commit date: 32 hours ago
config: alpha-randconfig-r064-20251114 (https://download.01.org/0day-ci/archive/20251114/202511140621.rxDDG9hK-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202511140621.rxDDG9hK-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/pinctrl/pinctrl-mpfs-mssio.c:354:16-22: WARNING: Unsigned expression compared with zero: offset < 0
>> drivers/pinctrl/pinctrl-mpfs-mssio.c:354:5-8: WARNING: Unsigned expression compared with zero: reg < 0

vim +354 drivers/pinctrl/pinctrl-mpfs-mssio.c

6540fdcdf074a1 Conor Dooley 2025-09-24  340  
6540fdcdf074a1 Conor Dooley 2025-09-24  341  static int mpfs_pinctrl_set_pin_func(struct mpfs_pinctrl *pctrl, u8 pin, u8 function)
6540fdcdf074a1 Conor Dooley 2025-09-24  342  {
6540fdcdf074a1 Conor Dooley 2025-09-24  343  	struct device *dev = pctrl->dev;
6540fdcdf074a1 Conor Dooley 2025-09-24  344  	u32 reg, func, mask, offset;
6540fdcdf074a1 Conor Dooley 2025-09-24  345  
6540fdcdf074a1 Conor Dooley 2025-09-24  346  	reg = mpfs_pinctrl_pin_to_iomux_reg(pin);
6540fdcdf074a1 Conor Dooley 2025-09-24  347  	offset = mpfs_pinctrl_pin_to_iomux_offset(pin);
6540fdcdf074a1 Conor Dooley 2025-09-24  348  
6540fdcdf074a1 Conor Dooley 2025-09-24  349  	func = function << offset;
6540fdcdf074a1 Conor Dooley 2025-09-24  350  	mask = MPFS_PINCTRL_PAD_MUX_MASK << offset;
6540fdcdf074a1 Conor Dooley 2025-09-24  351  
6540fdcdf074a1 Conor Dooley 2025-09-24  352  	dev_dbg(dev, "Setting pin %u. reg: %x offset %u func %x\n", pin, reg, offset, func);
6540fdcdf074a1 Conor Dooley 2025-09-24  353  
6540fdcdf074a1 Conor Dooley 2025-09-24 @354  	if (reg < 0 || offset < 0)
6540fdcdf074a1 Conor Dooley 2025-09-24  355  		return -EINVAL;
6540fdcdf074a1 Conor Dooley 2025-09-24  356  
6540fdcdf074a1 Conor Dooley 2025-09-24  357  	regmap_update_bits(pctrl->regmap, reg, mask, func);
6540fdcdf074a1 Conor Dooley 2025-09-24  358  
6540fdcdf074a1 Conor Dooley 2025-09-24  359  	return 0;
6540fdcdf074a1 Conor Dooley 2025-09-24  360  }
6540fdcdf074a1 Conor Dooley 2025-09-24  361  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
