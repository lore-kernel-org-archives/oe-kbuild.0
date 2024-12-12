Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59F110F2
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Dec 2024 10:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734000102; cv=none; b=USIrsyTtiJ2c9NEvktzW2OpISLgD2kxoegBFYs15PpLmjUbf5laS+oWnv0imM8gPBokPsKtWrY95rthUC+9FNgYKSl7CXUcVyGttj8mw8ySNV74ZnH80GTYgZe18QpHMN8tB1sh9Fe/QsnZVK/WPaMih06pmkExaxKhPtU/Nrj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734000102; c=relaxed/simple;
	bh=mPB2OIrnKKece21zjEpgyuvMBeCMg6y1+42GZ7+bxHE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rISFL81Uzwwbn1RJSWNgPDCbC7yl25+at4yw5GSQFZ0iVRFdkqUjgDWqiyUYIJiLQmgnCxKAJ+XNqR2w7dtCUK7B+5PPhGnMwvovxUwbWtmCo7vSbGzsznlbOxgnwWM0kf7NtwOS6FCt6ZYgzYg3gIXiLAmAUIGo6vXLAA6UfRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gbz4kMFA; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gbz4kMFA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734000101; x=1765536101;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mPB2OIrnKKece21zjEpgyuvMBeCMg6y1+42GZ7+bxHE=;
  b=Gbz4kMFAeBuhTSCpce41LoZqN7261DL6FRlGFvwIBMCll65Vgt3t9BRA
   DXM2R8JF/BfL9jxZlrTjrGqyt482SotpAk2/J08Y55BXhnQetGoKraIHV
   8RGYETGBOso/O03/tGE8kif9rQqPkhGQtOGuqSUlqBOS8JdqgyilE3xEy
   dUHiB6AkP/9ptoEkwi1Hdbi7KYdgVDIC9D1LOSYthdF6WJHKXIHj7CdIa
   V7k1njbh2tcn6gq2nXkI2n36RwSUGxxiApKoLOGlqlqxU58R/bJ2TihiX
   9k/AUNVpTAc2ZBqQwi+wQIeUBuetdJc4xrKgnISdcAO/xAHdS9Fs412Ln
   Q==;
X-CSE-ConnectionGUID: o67PTW4UQOSuXBUYYcNFSQ==
X-CSE-MsgGUID: vekI20afQNG3WCeP24dV4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="51939216"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="51939216"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 02:41:40 -0800
X-CSE-ConnectionGUID: payYAclySrqGKFtDZ41ZXw==
X-CSE-MsgGUID: NvGCPLItRiyGZ4lzN8qyHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="101046871"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Dec 2024 02:41:39 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLgdV-0007jj-04;
	Thu, 12 Dec 2024 10:41:37 +0000
Date: Thu, 12 Dec 2024 18:41:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bytedance:6.6-velinux 1425/8656] WARNING: modpost: vmlinux: section
 mismatch in reference: _sub_D_65535_0+0x2c (section: .text.exit) ->
 populate_kernel_pte (section: .init.text)
Message-ID: <202412121820.j6ZWFAfw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only scripts/mod/modpost.c file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: jason.zeng@intel.com
TO: lin.x.wang@intel.com
TO: pei.p.jia@intel.com

tree:   https://github.com/bytedance/kernel.git 6.6-velinux
head:   65674ccd09d044c63c8fc2c305f155b8376e0632
commit: 88bb8f5cf88161aabcb97ddd06b1a1c50a9a9768 [1425/8656] modpost: fix section mismatch message for RELA
:::::: branch date: 26 hours ago
:::::: commit date: 4 months ago
config: loongarch-randconfig-002-20241212 (https://download.01.org/0day-ci/archive/20241212/202412121820.j6ZWFAfw-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412121820.j6ZWFAfw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412121820.j6ZWFAfw-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
WARNING: modpost: vmlinux: section mismatch in reference: arch_jump_label_transform+0xb4 (section: .text) -> populate_kernel_pte (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: _sub_D_65535_0+0x2c (section: .text.exit) -> populate_kernel_pte (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: _sub_D_65535_0+0x2c (section: .text.exit) -> xbc_node_get_subkey (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: _sub_I_65535_1+0x2c (section: .text.startup) -> populate_kernel_pte (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: _sub_I_65535_1+0x2c (section: .text.startup) -> xbc_node_get_subkey (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
