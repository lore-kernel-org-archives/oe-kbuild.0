Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2182921C16E
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Oct 2025 14:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760105209; cv=none; b=Mn8K0cRAnFFAgZ++WvDDFak5OeOyExfrvK1DlktUGISC4KMU5prIuc9kj7vl4cJr1tNW6EArq5LKzo12PoY7MX1e29hvg740EV2RjL7fLj0Rj3L4yQp6gzcGYfUsYN9vaxuwchVnC48ONyiLvYm3UZ4frJTavgncPwY9+Sfb224=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760105209; c=relaxed/simple;
	bh=dNWNdGjeD2TasNTn2nr5WPP6NoZJVeNE1qlaE+uAnB8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ByvbpFUvBvPcNMhe+4V8ItDCoAxGhprm0UfsrGSlAYoiLVJ1FnTAH/YPaGIPAHVSKgqXQU2YM+ttHHNRTz+EZ7yz4xj1K4WfbIXdVxOBs2iiPoQkV9ZuQpFJVTGbEftVQViYJ7gKJ47zuTF8yEXd9/5CV0kLwMyI3RAkU+fSJt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GRLvPF6A; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GRLvPF6A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760105208; x=1791641208;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dNWNdGjeD2TasNTn2nr5WPP6NoZJVeNE1qlaE+uAnB8=;
  b=GRLvPF6AnBQyf4ANpRgNsDcT2iYOqn+l3cY+eewJ0Hj5E6wibNSquqWH
   qQXOIsQdX/S309NqU+dt2bbp8uH6JCDZI4jrlvopYZqgVhhBuQX0JJBLX
   7KyLIq9wIfMCavF40U+L7eCweknBh3fQuPgdOjh476vdaQh+FQJg8Kil6
   YfYkEqriMzNTv1jZNPB64SQvsMYFgRnzHwYLVrWMXfNm45hoKMgU6Hthm
   tWpMGP6ugkj51xF6buXBaXGxA41nvnIFAsud8L+++AXquM0DQRXYrUs0Q
   x5QB+XGHxj+CtgrQRHO6b+OGGVbo5ZjhAEgiE8LtPzSUMwwTTAKikSUxf
   A==;
X-CSE-ConnectionGUID: cbPTYuWFQ4akIiJWa5Nk7g==
X-CSE-MsgGUID: 7lH02DT4RvuS2b2Wpqa5kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="61357337"
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="61357337"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 07:06:47 -0700
X-CSE-ConnectionGUID: P2XkM+1yQ12UBpF2gjJJ9A==
X-CSE-MsgGUID: 0FbwFcntTVmM8A12jGDB/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="180938522"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Oct 2025 07:06:46 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7Dlc-0002px-0m;
	Fri, 10 Oct 2025 14:06:44 +0000
Date: Fri, 10 Oct 2025 22:06:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/bridge/synopsys/dw-dp.c:1152
 dw_dp_video_need_vsc_sdp() warn: signedness bug returning '(-22)'
Message-ID: <202510102204.T8wGtJA9-lkp@intel.com>
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
TO: Andy Yan <andy.yan@rock-chips.com>
CC: Dmitry Baryshkov <lumag@kernel.org>
CC: Heiko Stuebner <heiko@sntech.de>

Hi Andy,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5472d60c129f75282d94ae5ad072ee6dfb7c7246
commit: d68ba7bac9555d05e2f5b310c898b2a5c7eff174 drm/rockchip: Add RK3588 DPTX output support
date:   6 weeks ago
:::::: branch date: 19 hours ago
:::::: commit date: 6 weeks ago
config: alpha-randconfig-r073-20251009 (https://download.01.org/0day-ci/archive/20251010/202510102204.T8wGtJA9-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510102204.T8wGtJA9-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/bridge/synopsys/dw-dp.c:1152 dw_dp_video_need_vsc_sdp() warn: signedness bug returning '(-22)'

Old smatch warnings:
drivers/gpu/drm/bridge/synopsys/dw-dp.c:2080 dw_dp_bind() warn: passing zero to 'ERR_PTR'

vim +1152 drivers/gpu/drm/bridge/synopsys/dw-dp.c

86eecc3a9c2e06 Andy Yan 2025-08-22  1144  
86eecc3a9c2e06 Andy Yan 2025-08-22  1145  static bool dw_dp_video_need_vsc_sdp(struct dw_dp *dp)
86eecc3a9c2e06 Andy Yan 2025-08-22  1146  {
86eecc3a9c2e06 Andy Yan 2025-08-22  1147  	struct dw_dp_link *link = &dp->link;
86eecc3a9c2e06 Andy Yan 2025-08-22  1148  	struct dw_dp_bridge_state *state;
86eecc3a9c2e06 Andy Yan 2025-08-22  1149  
86eecc3a9c2e06 Andy Yan 2025-08-22  1150  	state = dw_dp_get_bridge_state(dp);
86eecc3a9c2e06 Andy Yan 2025-08-22  1151  	if (!state)
86eecc3a9c2e06 Andy Yan 2025-08-22 @1152  		return -EINVAL;
86eecc3a9c2e06 Andy Yan 2025-08-22  1153  
86eecc3a9c2e06 Andy Yan 2025-08-22  1154  	if (!link->vsc_sdp_supported)
86eecc3a9c2e06 Andy Yan 2025-08-22  1155  		return false;
86eecc3a9c2e06 Andy Yan 2025-08-22  1156  
86eecc3a9c2e06 Andy Yan 2025-08-22  1157  	if (state->color_format == DRM_COLOR_FORMAT_YCBCR420)
86eecc3a9c2e06 Andy Yan 2025-08-22  1158  		return true;
86eecc3a9c2e06 Andy Yan 2025-08-22  1159  
86eecc3a9c2e06 Andy Yan 2025-08-22  1160  	return false;
86eecc3a9c2e06 Andy Yan 2025-08-22  1161  }
86eecc3a9c2e06 Andy Yan 2025-08-22  1162  

:::::: The code at line 1152 was first introduced by commit
:::::: 86eecc3a9c2e06462f6a273fcd24150b6da787de drm/bridge: synopsys: Add DW DPTX Controller support library

:::::: TO: Andy Yan <andy.yan@rock-chips.com>
:::::: CC: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
