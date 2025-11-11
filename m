Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D8035CBC6
	for <oe-kbuild@lists.linux.dev>; Tue, 11 Nov 2025 23:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762904861; cv=none; b=b7lhAe8oBmcGs1pKj39MASvFGCTeHxkZfH00bOmBm4RuyIA1rYBSNfSv5yGLiCyNqmqYxkubMzuLP6Ayo3Use6fH7aDhseW4YNwsqaHY/TlbVr2BZRAZiFW6TUX1Pj6TCb64Fhi6co5LUbnJY4Ed/UTf0DqKeACkInzIFRaBsns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762904861; c=relaxed/simple;
	bh=fHJrAe7n6nsIGmuGQJeVINuZvWwbQSYZPXUbPIBny5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uoVEBgEE1XrPawhkgfccsrnFZAGCrdb46DTuuiJQhhvydyRy+PoZNenThEFOmJ/2kzezoY/Shh3G7yvpSNdhcEab/JafAlmMqC3u58BbRpSY+c3DhXedRSLld65cFuJm2sV9XEVHqQ/n8emEuyNz4D0X5Cu6pSGsvYmCjDq74qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iay144tV; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iay144tV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762904859; x=1794440859;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fHJrAe7n6nsIGmuGQJeVINuZvWwbQSYZPXUbPIBny5Q=;
  b=Iay144tVlrKrn+W8MepVeN12PmxFfeBtFuHK/JZjy8BlYMN6sceVUN1c
   5Ila/VFzmgQhRRUJfR9P5WMyo15r1iXQ+0qEGXkwwEuuatzraoMiS/qD4
   K1VdtFeWToOasRxOEHZ69WGXTDtyfSOVOYPxV7Vk1x4wNXEbO5vV0zLjW
   PqwkcynSx+MHI+EAA3auyZwGoUCWTgPfNJFJZxZPzKYo4Ndaf5HGWRlbs
   i/53rOmNhTgeLKVZBmeBXfVevA97+4BwnMDMRk23SPGlp7lEl481Cv899
   L+e1bTGJ/HmKtK84QWNVfZQoluzz+o0R3qqatOpTT6EFXtVtJRAMBNlZm
   A==;
X-CSE-ConnectionGUID: 6XG9X95xS6yNftXlBT/jww==
X-CSE-MsgGUID: uu847tOXRjGa+QDTd7eing==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="64872610"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="64872610"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 15:47:37 -0800
X-CSE-ConnectionGUID: R7kh3V9iQrWae0GRLoQvNg==
X-CSE-MsgGUID: +wZGBqn9TcK7WOqFYjmNlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="189502813"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Nov 2025 15:47:36 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIy5G-0003fr-0B;
	Tue, 11 Nov 2025 23:47:34 +0000
Date: Wed, 12 Nov 2025 07:46:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [conor:pinctrl 16/19] drivers/pinctrl/pinctrl-mpfs-mssio.c:336:19:
 sparse: sparse: unsigned value that used to be signed checked against zero?
Message-ID: <202511120708.scyBWV4u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/pinctrl/pinctrl-mpfs-mssio.c:336:19: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Conor Dooley <conor+lkp@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl
head:   0f0b8ab0b2d5245d9b9f4d73a6d28421de5c8b7d
commit: 2778575da208c6655dba234f78b5e1085ebc835c [16/19] pinctrl: add polarfire soc mssio pinctrl driver
:::::: branch date: 7 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-r131-20251112 (https://download.01.org/0day-ci/archive/20251112/202511120708.scyBWV4u-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511120708.scyBWV4u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511120708.scyBWV4u-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/pinctrl-mpfs-mssio.c:336:19: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/pinctrl/pinctrl-mpfs-mssio.c:328:44: sparse: signed value source
   drivers/pinctrl/pinctrl-mpfs-mssio.c:336:33: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/pinctrl/pinctrl-mpfs-mssio.c:329:50: sparse: signed value source

vim +336 drivers/pinctrl/pinctrl-mpfs-mssio.c

2778575da208c6 Conor Dooley 2025-09-24  322  
2778575da208c6 Conor Dooley 2025-09-24  323  static int mpfs_pinctrl_set_pin_func(struct mpfs_pinctrl *pctrl, u8 pin, u32 config)
2778575da208c6 Conor Dooley 2025-09-24  324  {
2778575da208c6 Conor Dooley 2025-09-24  325  	struct device *dev = pctrl->dev;
2778575da208c6 Conor Dooley 2025-09-24  326  	u32 reg, func, offset;
2778575da208c6 Conor Dooley 2025-09-24  327  
2778575da208c6 Conor Dooley 2025-09-24  328  	reg = mpfs_pinctrl_pin_to_iomux_reg(pin);
2778575da208c6 Conor Dooley 2025-09-24  329  	offset = mpfs_pinctrl_pin_to_iomux_offset(pin);
2778575da208c6 Conor Dooley 2025-09-24  330  
2778575da208c6 Conor Dooley 2025-09-24  331  	func = config & MPFS_PINCTRL_DT_FUNC_MASK;
2778575da208c6 Conor Dooley 2025-09-24  332  	func <<= offset;
2778575da208c6 Conor Dooley 2025-09-24  333  
2778575da208c6 Conor Dooley 2025-09-24  334  	dev_dbg(dev, "Setting pin %u. reg: %x offset %u func %x\n", pin, reg, offset, func);
2778575da208c6 Conor Dooley 2025-09-24  335  
2778575da208c6 Conor Dooley 2025-09-24 @336  	if (reg < 0 || offset < 0)
2778575da208c6 Conor Dooley 2025-09-24  337  		return -EINVAL;
2778575da208c6 Conor Dooley 2025-09-24  338  
2778575da208c6 Conor Dooley 2025-09-24  339  	regmap_write(pctrl->regmap, reg, func);
2778575da208c6 Conor Dooley 2025-09-24  340  
2778575da208c6 Conor Dooley 2025-09-24  341  	return 0;
2778575da208c6 Conor Dooley 2025-09-24  342  }
2778575da208c6 Conor Dooley 2025-09-24  343  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
