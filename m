Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DE513C9C4
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Nov 2025 13:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763817517; cv=none; b=DEb5iw340VHFQuWK1fQuVdiDiIJHb/2N/DGPlrbUWX0ljCmDnJXf0QbVcIWRhDAWQC9U0V3IPsxl3XaSJ7WrkRjwDoMUaze0VyYIEAguBzPurgUaLIsE5cuAM76gOJbO8P+basI0ov8o/l2SuctaRjSb+Acnlc59dcSKpfHpzHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763817517; c=relaxed/simple;
	bh=/i3Qcy8xyXCyHcjgx5OktTatJGrEFapHcy/ZgcvPfko=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rYXk/PghDaqg6zEq9a3W3LQAxmmNsuQYIF/IFu/PG38YLPtVvsyGZTV3pTZDy+fP1zFef+9zZzYBbgaYc+kPhNWb2yWi/MVIWVTOzG/PAB0kbocoiVKNDuXfpoWykeu35VLu3qjrL8CXZ5X5G72hum++j1gHBXQ8dKmFK5e1St0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eQdDOKwm; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eQdDOKwm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763817516; x=1795353516;
  h=date:from:to:subject:message-id:mime-version;
  bh=/i3Qcy8xyXCyHcjgx5OktTatJGrEFapHcy/ZgcvPfko=;
  b=eQdDOKwmgEmj9rFiJMkhZn1yB2lA+XUN2Vd8f0534+YJr+qUOoK3GFf3
   jP1wABrmfTKdnv4s99ThnAu612WQMbNRuP9qkLio6i/ubJ55mXcV8Thd5
   4UoBndDXfqWInsykoEmiuj6PqDrAX5IROt+RvBZoPyT7mGWOWUKNJvJNZ
   MaP4qsaYaJ6szBOzwVReJgQevX8cNABvM2uLrvVQy/x0u3qcbyU3cQZ0M
   I4BYxEBzhQspaAYPDxincaXRX23CxdkwxfO4hQ2JmX9joDAZfA+wMKcHV
   QAwYJtlcRAKqysV0U16bGRJ50eeP9e4WzTNr68kFfljMlE5mNza9sM7o8
   w==;
X-CSE-ConnectionGUID: Otj1ZWZJQcmtm+B/gvVk9A==
X-CSE-MsgGUID: FAqXScPPRVKJmELXr2Xdpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="65931835"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="65931835"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 05:18:35 -0800
X-CSE-ConnectionGUID: ZQWV36lcS72b/zTBaFXknw==
X-CSE-MsgGUID: sjldhVqzSSy8bQnIDy9Tkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="196862435"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 22 Nov 2025 05:18:34 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vMnVY-0000000029l-2DTq
	for oe-kbuild@lists.linux.dev;
	Sat, 22 Nov 2025 13:18:32 +0000
Date: Sat, 22 Nov 2025 14:17:57 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.18-jumbo 52/124] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202511221447.MVJ69XWI-lkp@intel.com>
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
commit: c5f7a68e82fe20b9b37a60afd033b2364a8763d8 [52/124] Add PCS operations for the Serdes1 combo port.
:::::: branch date: 6 days ago
:::::: commit date: 11 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251122/202511221447.MVJ69XWI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511221447.MVJ69XWI-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#262: FILE: drivers/net/dsa/mxl862xx/mxl862xx.c:3258:
+		 *	0 - 10G Quad USXGMII
+		*	1 - 1000BaseX ANeg

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
