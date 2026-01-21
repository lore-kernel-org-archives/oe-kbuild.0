Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD423A7E12
	for <oe-kbuild@lists.linux.dev>; Wed, 21 Jan 2026 21:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769029340; cv=none; b=SV4+e2qTsvGLPxRDFLVLzD8NQgnEKQ4CPemHceFOLm0o+6dRpT1vhkURDwxVdG9KApz/EpmtzX5kajLr/7DUTLeITRN3wAAg6tJtVyFfHcIEVRMyJuAq67TLLBTfIxLcACVkAgUDkph5nLB/KzbG6ptlt9ji7E1Ln0k9UCDnAgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769029340; c=relaxed/simple;
	bh=IiDX9/q3KlYqecDh7dIb3DijbaNkL03ilfAa3KtT6Mo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W4nTnehCCOZFPu2sltqRR3+88ksuk5RfSNx27jVs7riHQOLDPfRRdNMKB0ITNu8b2saQRrLcPjpaLnoIx6GUmpPntvg9yNEQsfCsYiMBg9BU5wYX50JaP2zxMrdhN7Nrxu0rTvh3XSAoYcwRtTPYT9l32LO+tIWbyuD+dSbnUxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=baEXQSIK; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="baEXQSIK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769029339; x=1800565339;
  h=date:from:to:cc:subject:message-id;
  bh=IiDX9/q3KlYqecDh7dIb3DijbaNkL03ilfAa3KtT6Mo=;
  b=baEXQSIKTYUlRKT/fDD0AwZuQfCy76dX+s7Z4MiUBKzlIBYLBooCUbQt
   DNcXnMepztnsZ8BGm/KgjqX6LRQ8lA3B9yFJsM1EQfyh+e8cQLYVW7Jj9
   /81YNRm6ZQ4grBF0YQtxBdWL0LWrKrLWMHs5tgq3iRY6elqH3mitcyab7
   s3TqVoZ1dwt8r6LUpcEbWLT9OKy3YrkT7KSzeiAqa5r9Eoi3H2Hz2GPxF
   SuastSvSvVYmGEf+0npP9tzIwpKmJd6ujlTezIfX3p48cPqScK7dD2tsL
   TFRWQegJVZ5KAzm3fQG8JF8V3tPqdmdD2GiwMwks1vyscFcsIvXfKKz1S
   g==;
X-CSE-ConnectionGUID: PADgKnrxRjyA8Ynf4LUA4Q==
X-CSE-MsgGUID: YrVPjxTYRvWWJpzfgZO0yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70359318"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="70359318"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 13:02:14 -0800
X-CSE-ConnectionGUID: pQJsDoSkQyKRp3qjjdp/Iw==
X-CSE-MsgGUID: RzdUmWpCShq5Jxprsi3MYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="206862976"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 Jan 2026 13:02:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vifL8-00000000S0g-3nFD;
	Wed, 21 Jan 2026 21:02:10 +0000
Date: Thu, 22 Jan 2026 05:01:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/bridge/synopsys/dw-dp.c:1152
 dw_dp_video_need_vsc_sdp() warn: signedness bug returning '(-22)'
Message-ID: <202601220445.k865xJA4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Andy Yan <andy.yan@rock-chips.com>
CC: Dmitry Baryshkov <lumag@kernel.org>
CC: Heiko Stuebner <heiko@sntech.de>

Hi Andy,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cf38b2340c0e60ef695b7137440a4d187ed49c88
commit: d68ba7bac9555d05e2f5b310c898b2a5c7eff174 drm/rockchip: Add RK3588 DPTX output support
date:   5 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 5 months ago
config: loongarch-randconfig-r072-20260121 (https://download.01.org/0day-ci/archive/20260122/202601220445.k865xJA4-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601220445.k865xJA4-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/bridge/synopsys/dw-dp.c:1152 dw_dp_video_need_vsc_sdp() warn: signedness bug returning '(-22)'

Old smatch warnings:
drivers/gpu/drm/bridge/synopsys/dw-dp.c:2080 dw_dp_bind() warn: passing zero to 'ERR_PTR'

vim +1152 drivers/gpu/drm/bridge/synopsys/dw-dp.c

86eecc3a9c2e064 Andy Yan 2025-08-22  1144  
86eecc3a9c2e064 Andy Yan 2025-08-22  1145  static bool dw_dp_video_need_vsc_sdp(struct dw_dp *dp)
86eecc3a9c2e064 Andy Yan 2025-08-22  1146  {
86eecc3a9c2e064 Andy Yan 2025-08-22  1147  	struct dw_dp_link *link = &dp->link;
86eecc3a9c2e064 Andy Yan 2025-08-22  1148  	struct dw_dp_bridge_state *state;
86eecc3a9c2e064 Andy Yan 2025-08-22  1149  
86eecc3a9c2e064 Andy Yan 2025-08-22  1150  	state = dw_dp_get_bridge_state(dp);
86eecc3a9c2e064 Andy Yan 2025-08-22  1151  	if (!state)
86eecc3a9c2e064 Andy Yan 2025-08-22 @1152  		return -EINVAL;
86eecc3a9c2e064 Andy Yan 2025-08-22  1153  
86eecc3a9c2e064 Andy Yan 2025-08-22  1154  	if (!link->vsc_sdp_supported)
86eecc3a9c2e064 Andy Yan 2025-08-22  1155  		return false;
86eecc3a9c2e064 Andy Yan 2025-08-22  1156  
86eecc3a9c2e064 Andy Yan 2025-08-22  1157  	if (state->color_format == DRM_COLOR_FORMAT_YCBCR420)
86eecc3a9c2e064 Andy Yan 2025-08-22  1158  		return true;
86eecc3a9c2e064 Andy Yan 2025-08-22  1159  
86eecc3a9c2e064 Andy Yan 2025-08-22  1160  	return false;
86eecc3a9c2e064 Andy Yan 2025-08-22  1161  }
86eecc3a9c2e064 Andy Yan 2025-08-22  1162  

:::::: The code at line 1152 was first introduced by commit
:::::: 86eecc3a9c2e06462f6a273fcd24150b6da787de drm/bridge: synopsys: Add DW DPTX Controller support library

:::::: TO: Andy Yan <andy.yan@rock-chips.com>
:::::: CC: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
