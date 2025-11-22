Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B74156678
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Nov 2025 13:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763817577; cv=none; b=ocifgl/gyErV5yP1mfQ0vEw4+FOV/ya1xPs1/Ji2VdHYCF16eloJrMV7u7sk5HQxXqvZuzjcyCgJSg4P5JZ5wM5C6QRnBU5366O8VRYo7SsOCMYYedrXiJR0UNd2+R6aCvzsMNKbxy4s6LH5fTrY96BfV1h0W4jkpbDBjWBsGgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763817577; c=relaxed/simple;
	bh=bZNut/Zq7M6qPqsWZhqCc4p/6tHWPNr7ai9c303YVBQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q/Aw8UqjXd8MV4qC4Ml3UCAmGlIcpHZ/se+My1si0ICAoE96zakQRxNW0lOh3ByCzcCaFjoufUiRfXGepqBOPGGu7pXCVKkFQZZJGNs0SQShSgcAkrr30xSJZZdSqtbFog/buh82ag375c0cWsGDTWk3Z/t+8i3hmIjFjs31blY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iyiWEd8V; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iyiWEd8V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763817576; x=1795353576;
  h=date:from:to:subject:message-id:mime-version;
  bh=bZNut/Zq7M6qPqsWZhqCc4p/6tHWPNr7ai9c303YVBQ=;
  b=iyiWEd8V1iddBtLOU6DQOXmwGN+VY8f67SNKcWFSbxK5Bn8DkDp2FnSm
   dJOaICsPFCtVWQjxB86fujJ7IhKry/7EPLMg6zE0RZiNEN654rNJfvlPw
   9wagj9gd7KR6d3rT6JeD4NXkA/ARrCMaaqyJdN6iVuqZft+gQQzxbLwPM
   lKaDloemjqA8y/5DH7sGzJP7EUidlXlQl1EGg5UiL54TI7GPF/6gz90WT
   BNkWLv5VeiLiGVCHyngZQtO+D+uDHCPvYCYP7XpQ51I7oTvbGz/wBI3id
   5oiywOMbEg4Y0xNzVCutEnwb3qCb8GOtfSRe1dJVRDxpB/t179bkBGeqf
   Q==;
X-CSE-ConnectionGUID: v5fwK/q2TPCBuQtKPiqG1w==
X-CSE-MsgGUID: HflhhftkQD2mcHk12CoTQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="65079467"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="65079467"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 05:19:35 -0800
X-CSE-ConnectionGUID: cG/m4U8rT2akzmLnT5p6Jg==
X-CSE-MsgGUID: A2SIuAgaQY2UkFRuWPJ27w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="192700774"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 22 Nov 2025 05:19:34 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vMnWW-000000002A1-39qC
	for oe-kbuild@lists.linux.dev;
	Sat, 22 Nov 2025 13:19:32 +0000
Date: Sat, 22 Nov 2025 14:19:19 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.18-jumbo 75/124] checkpatch: ERROR:SPACING:
 space required after that ',' (ctx:VxV)
Message-ID: <202511221410.B3X3U7g4-lkp@intel.com>
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
commit: a5fefd5a31b19b7294d6f5f24398a0a9deba80b0 [75/124] dbg: mxl: extend information on write error
:::::: branch date: 6 days ago
:::::: commit date: 11 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251122/202511221410.B3X3U7g4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511221410.B3X3U7g4-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:SPACING: space required after that ',' (ctx:VxV)
#19: FILE: drivers/net/dsa/mxl862xx/mxl862xx.c:3297:
+			dev_err(dp->ds->dev, "failed to set intf on port %d (hw:%d,ser_port_id:%d) to %d (ret:%d)\n", dp->index,hw_port,ser_intf.port_id,ser_intf.speed,ret);
 			                                                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#19: FILE: drivers/net/dsa/mxl862xx/mxl862xx.c:3297:
+			dev_err(dp->ds->dev, "failed to set intf on port %d (hw:%d,ser_port_id:%d) to %d (ret:%d)\n", dp->index,hw_port,ser_intf.port_id,ser_intf.speed,ret);
 			                                                                                                               ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#19: FILE: drivers/net/dsa/mxl862xx/mxl862xx.c:3297:
+			dev_err(dp->ds->dev, "failed to set intf on port %d (hw:%d,ser_port_id:%d) to %d (ret:%d)\n", dp->index,hw_port,ser_intf.port_id,ser_intf.speed,ret);
 			                                                                                                                                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#19: FILE: drivers/net/dsa/mxl862xx/mxl862xx.c:3297:
+			dev_err(dp->ds->dev, "failed to set intf on port %d (hw:%d,ser_port_id:%d) to %d (ret:%d)\n", dp->index,hw_port,ser_intf.port_id,ser_intf.speed,ret);
 			                                                                                                                                               ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
