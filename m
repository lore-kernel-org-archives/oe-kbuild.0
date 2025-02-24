Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AD52505DE
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Feb 2025 10:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740393519; cv=none; b=KJ5jpXudX5ZIXxy/+qt1iQAqV5bux0vz3GmjB3ehAsbD49ZjpC+3+RqZ9KtyeYQ92otrxktfdJc46VZrmaeo4WVghoXb49A3TgOGQxt4Rg7SPwuGtHXPVcXSCLGkzAqZIWtz0m43UmL/yljkj+umE2MWyOKo5fhJ5LwESj9vuok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740393519; c=relaxed/simple;
	bh=bNVKGZlAtiYs5nHLtsD+OPaJfihezxW1SEEERhzPgrU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Smxoys6wmw/bWHdQ2Hl4VrA3YxCSW7QQq2A1yS/zj+kQ5gvfUFWKf4qA4uqsTb6GKsUSV57HnunxEU5dpnoJrLgsP/OPb5fy7U/yCNrzLsOt2P7tBvODJPzolMhntNagJ99+uiXNZtkyBmGLp2ZvaMtwGdxdm0k2uD8RMUgGOdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iF4U+KJG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iF4U+KJG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740393517; x=1771929517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bNVKGZlAtiYs5nHLtsD+OPaJfihezxW1SEEERhzPgrU=;
  b=iF4U+KJGhf2HU+tZP5vZ677RUZItdH1l5wrew9tluC2/TEIbvCJiKHXy
   sFCfPXFpsUaxTVO7wEDMKfssLWNDRWHPmgTDkMuTEywc/qLubJ1vcJBga
   k2uVr28iDmEeGAR2RKSSknro0zCqOv/48Lw6JjWEhk91Lt8t/i3PfCwbJ
   ZNvTCfyFwQkR/ZXk6E7o11q0o9+vSH7czhtg2fywuWGN44bFTYZpRm0Ci
   BDHiCJGksb80eu3Pg69ls5EEID5zS7lGgqVnEWmebhb8pcPs3JVHPtAex
   eECDC6y2BpBDC8DsPQ/U2uJQVy2z9aW3XV+uBJHSXuc7y7pwMmWIFBVy5
   w==;
X-CSE-ConnectionGUID: x8AbCLEzQrKM0xm4TJfNdw==
X-CSE-MsgGUID: ZV7uXfKZRJGjS9+u3wYOFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="41018866"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="41018866"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 02:38:36 -0800
X-CSE-ConnectionGUID: LAmWnWppQz2QOrdPpyfbug==
X-CSE-MsgGUID: QDq4jZROSSWEzJUG+o6rCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120147202"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 24 Feb 2025 02:38:36 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmVr7-0008Bl-1O;
	Mon, 24 Feb 2025 10:38:33 +0000
Date: Mon, 24 Feb 2025 18:37:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwvid.c:174
 brcmf_fwvid_attach() warn: inconsistent returns 'global &fwvid_list_lock'.
Message-ID: <202502241801.kEXc4P9w-lkp@intel.com>
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
TO: Hector Martin <marcan@marcan.st>
CC: Kalle Valo <kvalo@kernel.org>
CC: Arend van Spriel <arend.vanspriel@broadcom.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d082ecbc71e9e0bf49883ee4afd435a77a5101b6
commit: 85da8f71aaa7b83ea7ef0e89182e0cd47e16d465 wifi: brcmfmac: Demote vendor-specific attach/detach messages to info
date:   1 year, 1 month ago
:::::: branch date: 14 hours ago
:::::: commit date: 1 year, 1 month ago
config: powerpc-randconfig-r071-20250224 (https://download.01.org/0day-ci/archive/20250224/202502241801.kEXc4P9w-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502241801.kEXc4P9w-lkp@intel.com/

smatch warnings:
drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwvid.c:174 brcmf_fwvid_attach() warn: inconsistent returns 'global &fwvid_list_lock'.

vim +174 drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwvid.c

d6a5c562214f26e Arend van Spriel 2022-11-29  151  
85da8f71aaa7b83 Hector Martin    2024-01-06  152  int brcmf_fwvid_attach(struct brcmf_pub *drvr)
d6a5c562214f26e Arend van Spriel 2022-11-29  153  {
d6a5c562214f26e Arend van Spriel 2022-11-29  154  	enum brcmf_fwvendor fwvid = drvr->bus_if->fwvid;
d6a5c562214f26e Arend van Spriel 2022-11-29  155  	int ret;
d6a5c562214f26e Arend van Spriel 2022-11-29  156  
d6a5c562214f26e Arend van Spriel 2022-11-29  157  	if (fwvid >= ARRAY_SIZE(fwvid_list))
d6a5c562214f26e Arend van Spriel 2022-11-29  158  		return -ERANGE;
d6a5c562214f26e Arend van Spriel 2022-11-29  159  
d6a5c562214f26e Arend van Spriel 2022-11-29  160  	brcmf_dbg(TRACE, "mod=%s: enter: dev %s\n", fwvid_list[fwvid].name,
d6a5c562214f26e Arend van Spriel 2022-11-29  161  		  dev_name(drvr->bus_if->dev));
d6a5c562214f26e Arend van Spriel 2022-11-29  162  
d6a5c562214f26e Arend van Spriel 2022-11-29  163  	mutex_lock(&fwvid_list_lock);
d6a5c562214f26e Arend van Spriel 2022-11-29  164  
d6a5c562214f26e Arend van Spriel 2022-11-29  165  	ret = brcmf_fwvid_request_module(fwvid);
d6a5c562214f26e Arend van Spriel 2022-11-29  166  	if (ret)
d6a5c562214f26e Arend van Spriel 2022-11-29  167  		return ret;
d6a5c562214f26e Arend van Spriel 2022-11-29  168  
d6a5c562214f26e Arend van Spriel 2022-11-29  169  	drvr->vops = fwvid_list[fwvid].vops;
d6a5c562214f26e Arend van Spriel 2022-11-29  170  	list_add(&drvr->bus_if->list, &fwvid_list[fwvid].drvr_list);
d6a5c562214f26e Arend van Spriel 2022-11-29  171  
d6a5c562214f26e Arend van Spriel 2022-11-29  172  	mutex_unlock(&fwvid_list_lock);
d6a5c562214f26e Arend van Spriel 2022-11-29  173  
d6a5c562214f26e Arend van Spriel 2022-11-29 @174  	return ret;
d6a5c562214f26e Arend van Spriel 2022-11-29  175  }
d6a5c562214f26e Arend van Spriel 2022-11-29  176  

:::::: The code at line 174 was first introduced by commit
:::::: d6a5c562214f26e442c8ec3ff1e28e16675d1bcf wifi: brcmfmac: add support for vendor-specific firmware api

:::::: TO: Arend van Spriel <arend.vanspriel@broadcom.com>
:::::: CC: Kalle Valo <kvalo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
