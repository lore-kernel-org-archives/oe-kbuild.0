Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96C6224D6
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Jul 2026 19:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783797368; cv=none; b=UkPzBBDJcX/vFqW+EvlXDJD9ZmCn+7GDsQkqZePEZHoxJtzQyHVuf5ay0/lGMCe5ru8SaCckOrwFjlXY1p+zGiWsKRlMHFNoJkEWjvn3PFGWEmMK8DP9fvLmfx4NySEnTuMwRnScNd7DBqUGLAQPOczs3RlX3iX3+GieI4kncAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783797368; c=relaxed/simple;
	bh=PQoPBb/VMBRGAhqBR3TWLR34dAYS2sTyIpZ8Dk5CH18=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QMj0dvQmwvkR83s8D7k1mqyR50PNcWAy6KEqaJn4mBocvOl41KWuVMwje6fUaZK2xu3WMnLP7sR36RpAmeXloXYmdeHAR967jRKn0vOVdndd+7lVow1eg6z1O9IX+cY50nbdleZjs3dvdND+2tT+r/xunyHrBx/9rJSMSiYa0Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RpLW8DK7; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RpLW8DK7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783797365; x=1815333365;
  h=date:from:to:cc:subject:message-id;
  bh=PQoPBb/VMBRGAhqBR3TWLR34dAYS2sTyIpZ8Dk5CH18=;
  b=RpLW8DK7RD39GsMN8gM2dVjRjI0IkBJ43cpZFFqw+GfztYpsAgZfYvMS
   smrOGB+zIpiFrGdadPs45smnMENApmdTgOE68tBOSIinzYJMp3fz9mMhD
   yAsojvdmJVeRmlrNq6Gz3UrKrOEhhZgM71O046mjjVl/wBL9og74N0Q0M
   uJHagiwVfCoGtF+yVNLnUvhcB7B2Y0e5AanZZaIoOpBGzITEGRx87Ef0L
   BW1Rlq6INeQcCUV49VzQGvW9W5UxjNB0npyW8QdpuFkSfS1DDT2aQ7l+s
   pxYPwekl+slB2iel6r5vkhjrDyi/LjjjWfY8PHJ308PDBck4+EycUfIOw
   Q==;
X-CSE-ConnectionGUID: J0wI1CrlTXWAPgL5j/YxPQ==
X-CSE-MsgGUID: vlhDTBEARFyYBrl1V0pmOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95072488"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95072488"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 12:16:05 -0700
X-CSE-ConnectionGUID: Lg7Kd6e9SiGUh5XQg9a/vQ==
X-CSE-MsgGUID: 1vSn1fBHRD6xyDujbD9I3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="260058416"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 11 Jul 2026 12:16:04 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1widBC-00000000KL5-1EZc;
	Sat, 11 Jul 2026 19:16:02 +0000
Date: Sun, 12 Jul 2026 03:15:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: microblaze-linux-ld:
 drivers/pinctrl/mediatek/pinctrl-mt6858.o:undefined reference to
 `mtk_paris_pinctrl_pm_ops'
Message-ID: <202607120301.Y3bMNpgn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Nikolai-Burov-via-B4-Relay/dt-bindings-pinctrl-mediatek-Add-MT6858/20260710-230327, commit: 7ef920e9afe736dec1b7097c8f04f41404a92cca"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Nikolai Burov <nikolai.burov@jolla.com>
CC: 0day robot <lkp@intel.com>

Hi Nikolai,

First bad commit (maybe != root cause):

tree:   https://github.com/intel-lab-lkp/linux/commits/Nikolai-Burov-via-B4-Relay/dt-bindings-pinctrl-mediatek-Add-MT6858/20260710-230327
head:   32a5b7b55eec287987b177ad143cfe5431cbc08c
commit: 7ef920e9afe736dec1b7097c8f04f41404a92cca pinctrl: mediatek: Add driver for MT6858
date:   28 hours ago
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20260712/202607120301.Y3bMNpgn-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260712/202607120301.Y3bMNpgn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607120301.Y3bMNpgn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> microblaze-linux-ld: drivers/pinctrl/mediatek/pinctrl-mt6858.o:(.data+0x54): undefined reference to `mtk_paris_pinctrl_pm_ops'
   microblaze-linux-ld: drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.o: in function `dcn401_get_dp_dto_frequency_100hz':
   dce_clock_source.o:(.text+0x271c): undefined reference to `__udivdi3'
   microblaze-linux-ld: drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.o: in function `get_dp_dto_frequency_100hz':
   dce_clock_source.o:(.text+0x8a48): undefined reference to `__udivdi3'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
