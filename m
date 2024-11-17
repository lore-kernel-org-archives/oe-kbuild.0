Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F325B674
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Nov 2024 02:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731810757; cv=none; b=WZw02YxFHAcwKkwzhV82MulS9UISxFtB81YQCMHQla+8d2oNqtghdY1qVRgmA5Y28CdJuv0mKSpfXeycJyejO4xxR+/D7+56SEUs9SGaeUtX2UXwyr5aWqlVN+CmJ4HQJdT2FSVn1marX1xY/sMYiU1RiDyU8OHiWGWIym3a6Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731810757; c=relaxed/simple;
	bh=mGM8S9CzNHbodrcrnfm4TWuPX+s45WMpMM6ve+w6YF8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hzSUa9A7qzMU1ANBGsO9xG2ymvoxzzKtldRK6CpOJrvg61krIi8Fzew0l9B6kF1DDyeqVEfVIKJTFgureMSes1T1R6Hok7JtPP+8iYVFJlB3SDoKvbPlobjjxDzB0S1t9zFsfMX7np+8y4AD1J0A5rspvCE8devFAn2cfWyin9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jeMY+oat; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jeMY+oat"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731810756; x=1763346756;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mGM8S9CzNHbodrcrnfm4TWuPX+s45WMpMM6ve+w6YF8=;
  b=jeMY+oatgHuug6OabTyWQiV6+2BaMwoyukq3cSNvBP7GSVnc7FKDrp6v
   /jQspR0srEFaAXUqyKNtuU1lc3VaGmkDO2c2+f9gNGbXdWOmx2Jl1Psd0
   iAgqE9kNc0boyPxS/ihIKXwYL2h2Z5EruA52U9IDKMibceAGRadbFhWzB
   AZ3odrracdRD9hCDPG7BMIb6ETW/A5St+7Dkq1Um6xDU4yRT7JnP2bbR+
   XlNXzBb2eNooPr+cdHiqe8OVmcslxe6DrPkjZ4+tjKtuaN2KP8tABXH/K
   jocUEj/vJrKmPpIpXCVeFaD+MIRPPoTsGroI2QvdgLJrGN4AkT4c8hpN4
   g==;
X-CSE-ConnectionGUID: tkqIhPIIQUei/LAtkX8R9w==
X-CSE-MsgGUID: cMwuB6pwSdursTaPzlYVEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="42433849"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="42433849"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 18:32:35 -0800
X-CSE-ConnectionGUID: UHQTeJCGSYONc/fGc1Hi0A==
X-CSE-MsgGUID: OX1/Kc46Q6CXPUetA15OSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="93361126"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 Nov 2024 18:32:34 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCV5T-0001Ee-2T;
	Sun, 17 Nov 2024 02:32:31 +0000
Date: Sun, 17 Nov 2024 10:32:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: ('Error:', ValueError("invalid literal for int() with base 0:
 'pre_div_sel * post_div_se'",))
Message-ID: <202411171011.IKTb9odB-lkp@intel.com>
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
TO: Inochi Amaoto <inochiama@outlook.com>
CC: Stephen Boyd <sboyd@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a5df37964673effcd9f84041f7423206a5ae5f2
commit: 80fd61ec46124eb83b29de3647a565f69979e753 clk: sophgo: Add clock support for CV1800 SoC
date:   7 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 7 months ago
config: xtensa-randconfig-r063-20241117 (https://download.01.org/0day-ci/archive/20241117/202411171011.IKTb9odB-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411171011.IKTb9odB-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> ('Error:', ValueError("invalid literal for int() with base 0: 'pre_div_sel * post_div_se'",))
>> ('Error:', ValueError("invalid literal for int() with base 0: 'pre_div_sel * post_div_se'",))
>> drivers/clk/sophgo/clk-cv18xx-pll.c:28:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
