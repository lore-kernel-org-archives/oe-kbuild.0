Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720951946C8
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Nov 2025 13:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763817578; cv=none; b=lXTuV3rtAK3dqNOT+utyb8rMqpnWietnNydqaM8xhlGp9VzKeb3Nvlv85Ek7QVGs7XciSLtsS9178Z6/s1EkSV/+oHrNXYecu1kxBqJR8G3qlgDrrSQ8+OPeV/QTEL2MRhwhfY7qjtdvPo1vr4PYa7/wpsOHtgsnkoRgwGgW8zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763817578; c=relaxed/simple;
	bh=yMzJadZOKeE2ue+eOAkaWTO/Co5Q1mccHRQUpBj5WzA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VBwzWCK7mE/dqnbN9PEpurRV+qdkt7uGBlAsvrAcAtb//DTbNkESpqPZTpSoWoukLz8sWIxONPD40CNS8hCs4zWDTgKDF51JyyGWcbjpoSQs9USVjetPs0ruCpM9aVUczBAlhmKbv/kFjGR17xN62tYr4Km95TLfa3ym6Uv34T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Thnms7rD; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Thnms7rD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763817577; x=1795353577;
  h=date:from:to:subject:message-id:mime-version;
  bh=yMzJadZOKeE2ue+eOAkaWTO/Co5Q1mccHRQUpBj5WzA=;
  b=Thnms7rDXycgY5pwveuNuMhzRgbFwlMCj0Fdfcn75VB8A8+M82hc5eDh
   XQu8VeaKiVqnCib32rinz4777JLWmUqm6/1L761aYnEAG97yEm+Da+TVA
   NSPAm8lx6O1s7k8IkM8aEn84O408Mo3V1P4E0k5bE1gwT4sL7HJBudZ7W
   xrTMMd7VXFiCmNGYW9mBhDbb7VtSC2tN+1OQqMRWRWNJAs07hWIkUhITy
   G6YzsO5bD4c9f9NYSRxGZGXiznucf9DrQDIlZzMnD+ofaSmLQZ+Nq/M0V
   +3ws18mJ4lQ4Vq/k35CoGOgVBWZu9/627T0bsUypz4Rbt0EYMzdguBhYx
   g==;
X-CSE-ConnectionGUID: s1I+viYlQSSthDy4jxBo5w==
X-CSE-MsgGUID: MkSYGoLnTvmPDYIYHXLa2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="65079468"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="65079468"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 05:19:35 -0800
X-CSE-ConnectionGUID: woqD2UH1T2yXvHn14UDrTg==
X-CSE-MsgGUID: /zDkFI/7TgqrmWi7BndpQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="192700776"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 22 Nov 2025 05:19:34 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vMnWW-000000002A3-3LvH
	for oe-kbuild@lists.linux.dev;
	Sat, 22 Nov 2025 13:19:32 +0000
Date: Sat, 22 Nov 2025 14:19:30 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.18-jumbo 77/124] checkpatch: ERROR:SPACING:
 space required after that ',' (ctx:VxV)
Message-ID: <202511221421.J411o3mf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.18-jumbo
head:   75dad9228908d3efbf1d989ac0a93cc0a7ef84de
commit: e94c29213eeb438bdbfc8bea691dd928b8b261b9 [77/124] net: mtk: eth-mux: fix rcu_lock in mux
:::::: branch date: 6 days ago
:::::: commit date: 11 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251122/202511221421.J411o3mf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511221421.J411o3mf-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:SPACING: space required after that ',' (ctx:VxV)
#67: FILE: drivers/net/ethernet/mediatek/mtk_eth_soc.c:5308:
+	dev_info(eth->dev, "ethernet mux: line:%d new channel:%d,sfp:%d\n",__LINE__, new_channel,sfp_present);
 	                                                                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#67: FILE: drivers/net/ethernet/mediatek/mtk_eth_soc.c:5308:
+	dev_info(eth->dev, "ethernet mux: line:%d new channel:%d,sfp:%d\n",__LINE__, new_channel,sfp_present);
 	                                                                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#89: FILE: drivers/net/ethernet/mediatek/mtk_eth_soc.c:5328:
+	usleep_range(100000,200000);
 	                   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#132: FILE: drivers/net/ethernet/mediatek/mtk_eth_soc.c:5399:
+	dev_info(eth->dev, "ethernet mux: line:%d added new channel:%d\n",__LINE__,id);
 	                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#132: FILE: drivers/net/ethernet/mediatek/mtk_eth_soc.c:5399:
+	dev_info(eth->dev, "ethernet mux: line:%d added new channel:%d\n",__LINE__,id);
 	                                                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#157: FILE: drivers/net/ethernet/mediatek/mtk_eth_soc.c:5508:
+	dev_info(eth->dev, "ethernet mux: line:%d added new mux\n",__LINE__);
 	                                                          ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
