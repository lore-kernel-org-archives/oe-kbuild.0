Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F8E10E5
	for <oe-kbuild@lists.linux.dev>; Thu, 15 May 2025 04:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747283518; cv=none; b=cLhqEgN7lPj/3sElxcZqXr7mj9gMB0JxJ/C2kGgWKI28H9vbeRvn1p2Uh0S4OJf3pkd93zX2rR85vbaYLK94k7YgrkDyOXYPXaTCG0OkxxJOeEwDc5KrK9viArlrl5OiE9/x2NuXRkgUgVusMCwSaYU5kx5nIAo5u2QgNk0jo8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747283518; c=relaxed/simple;
	bh=UV+mjOOiuqbcBg8pWFyNvnuKB9cv+ZY05gaCWO/4yVg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fy9GwRmAduHnoHY/bCdtfP1T7AXJBTr789lY4a4LAPFX6NTaVMCZpp1SMrpwzBUb75BRBIkLd3ogpk0UDlKD9bIX0Ud8THMQlZoGLMJp3Q0He5GMGH7TV6cUmZHfxih5R76XLupi33nJeJOyLwSnJYgZMaPUYBBm6TjMSnobtBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iIJN60zw; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iIJN60zw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747283515; x=1778819515;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UV+mjOOiuqbcBg8pWFyNvnuKB9cv+ZY05gaCWO/4yVg=;
  b=iIJN60zw5BndXtZGflAEeyac9p/T4p0NM/MjofzOw3mS7IAxVk+sMlN1
   6zsFdMTIbM0+UmptETZABoU1RsHw+0OAd1KOnX5FBvPSicuTiVE4ZBQYJ
   K2+MqLQD8J9It52f4v8G24gKDEVzaGzt0Ot0UafeTFvzsONEw7RnUf4Nx
   bUTrIgHHDGJlCt4BBZ6Gg1Q3mXuCM7tgALkl06DzAZDowakUNkcK9/4+9
   l/U2y5i9IE6yhFPP82MsZHaLYHWDmmNNa/gdp7a78gkKIG0sztceC+uRW
   KEDAOKUokNWzXWZxzt1TOO/Pneeq/1ZYv7yS/9kTXmeLDRQuObyy0kUYq
   A==;
X-CSE-ConnectionGUID: qhcGjhWmQNGcx1UE8fBW3Q==
X-CSE-MsgGUID: Sraf1NJ+Sb2aaZ18yRCWzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="59836485"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="59836485"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 21:31:55 -0700
X-CSE-ConnectionGUID: L/8AG1X2Tpq1rNfQ/7r1eQ==
X-CSE-MsgGUID: rTexKP+FTSi0Phtl3kSIyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="138114783"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 May 2025 21:31:54 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFQG8-000HvB-0t;
	Thu, 15 May 2025 04:31:52 +0000
Date: Thu, 15 May 2025 12:31:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] erofs: support deflate decompress by using Intel QAT
Message-ID: <202505151214.Jj7IHygl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/erofs/decompressor_crypto.c:211:10: sparse: sparse: bogus scalar initializer"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250514121709.2557-1-liubo03@inspur.com>
References: <20250514121709.2557-1-liubo03@inspur.com>
TO: Bo Liu <liubo03@inspur.com>
TO: xiang@kernel.org
TO: chao@kernel.org
CC: linux-erofs@lists.ozlabs.org
CC: linux-kernel@vger.kernel.org
CC: Bo Liu <liubo03@inspur.com>

Hi Bo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on xiang-erofs/dev-test]
[also build test WARNING on xiang-erofs/dev xiang-erofs/fixes linus/master v6.15-rc6 next-20250514]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bo-Liu/erofs-support-deflate-decompress-by-using-Intel-QAT/20250514-202351
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
patch link:    https://lore.kernel.org/r/20250514121709.2557-1-liubo03%40inspur.com
patch subject: [PATCH v2] erofs: support deflate decompress by using Intel QAT
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: x86_64-randconfig-r131-20250515 (https://download.01.org/0day-ci/archive/20250515/202505151214.Jj7IHygl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505151214.Jj7IHygl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505151214.Jj7IHygl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/erofs/decompressor_crypto.c:211:10: sparse: sparse: bogus scalar initializer

vim +211 fs/erofs/decompressor_crypto.c

5cf7d8744a0a86 Bo Liu 2025-05-14  207  
5cf7d8744a0a86 Bo Liu 2025-05-14  208  struct z_erofs_crypto_engine *z_erofs_crypto[] = {
5cf7d8744a0a86 Bo Liu 2025-05-14  209  	[Z_EROFS_COMPRESSION_LZ4] = &(struct z_erofs_crypto_engine) {NULL},
5cf7d8744a0a86 Bo Liu 2025-05-14  210  	[Z_EROFS_COMPRESSION_LZMA] = &(struct z_erofs_crypto_engine) {NULL},
5cf7d8744a0a86 Bo Liu 2025-05-14 @211  	[Z_EROFS_COMPRESSION_DEFLATE] = {&(struct z_erofs_crypto_engine) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
