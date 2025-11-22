Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2051B81CA
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Nov 2025 13:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763817230; cv=none; b=k56doGKtXrCD8ZYoHs2tVu1qnQHBVpw/JoM6k7bFCHyge+fXVz+E/SMrRi0XbLyioCcDJFzkMuHZUlRgLMGBr+66ab4OorELOTGOHEf3MeCLNLD08/hLc+xr83P3LvYDtsb3BbK6oKHM3hzivQxu6dufSn9Xko7sybgiKiU04vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763817230; c=relaxed/simple;
	bh=Yrr8CF67MmgzkKdMBY9zSzpiJQfTLL2GnZk0pvQAHKU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e+Gj84jUMMId6eEyg3Wq/hOHwpO0MbrwDaDiuCYQd++VPO3gPp/jTZlJkkF04/JkOL9n6+0zN2Ejp40Ab2XnHx3EIQNXGz8Zr6aMyg8Gv7wITLmWxyQ8Lq3J/h/vud16pvl/ZQZSLeY2zq7xMGLJNNzrURAXs9upnwmbH5bBeYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I7bxF0zL; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I7bxF0zL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763817229; x=1795353229;
  h=date:from:to:subject:message-id:mime-version;
  bh=Yrr8CF67MmgzkKdMBY9zSzpiJQfTLL2GnZk0pvQAHKU=;
  b=I7bxF0zLpx7iB41v3XVJ9yFgZjWQ6E7YFuIyUj/PA/y6llISIkqx+kxf
   d0ocUu1+P4eX9d+5GpT3xVqisCdSXMhpAheXBo1Z2VloGMt1UUcU7luyo
   zMWhWmWTE4doALkT4dgtOtINfMAHVR04dOdOFq2ncO+0IgBawClQbLsOr
   ajgQicof9piRuGSUwGLFuUiEDje5Z68A8zE3mpN1wK3qvDHFhnwVsOKEl
   T4bHEwrfV3BLLsTbZvYnhjzW+6dMXPJYQN8WZRXy2a53TnaVC/0zwNN6q
   cpiSw+qAOielI4wFT97oaHsvDVWUd9ssDdwWFVERn2fd6gAImGqcXCCkw
   g==;
X-CSE-ConnectionGUID: /VDIjmyoQL2a1LyQm0ktCA==
X-CSE-MsgGUID: 5OOiGH+OQimmN7bLz/oZ9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="65919540"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="65919540"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 05:13:35 -0800
X-CSE-ConnectionGUID: jw7x9VuCTkizto8gZp/upQ==
X-CSE-MsgGUID: WvCDHFFRSZiHO7F4o+GuhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="192177100"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 22 Nov 2025 05:13:34 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vMnQh-0000000028x-3s8o
	for oe-kbuild@lists.linux.dev;
	Sat, 22 Nov 2025 13:13:31 +0000
Date: Sat, 22 Nov 2025 14:13:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.18-jumbo 8/124] checkpatch: ERROR:SPACING:
 space required before the open parenthesis '('
Message-ID: <202511221454.11AAyWsD-lkp@intel.com>
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
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.18-jumbo
head:   75dad9228908d3efbf1d989ac0a93cc0a7ef84de
commit: 44ad987514ea485b110fe6b2ebc99cd3bf32785e [8/124] add regs command from mtk-sdk and add crosscompile support
:::::: branch date: 6 days ago
:::::: commit date: 11 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251122/202511221454.11AAyWsD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511221454.11AAyWsD-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open parenthesis '('
#205: FILE: utils/regs/src/regs.c:40:
+	} while(0)

ERROR:SPACING: space required before the open parenthesis '('
#213: FILE: utils/regs/src/regs.c:48:
+	while(start  < end) {

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#238: FILE: utils/regs/src/regs.c:73:
+	value |= (data << start_bit) & mask;;

ERROR:SPACING: space required before the open parenthesis '('
#311: FILE: utils/regs/src/regs.c:146:
+	if(argc < 3) {

ERROR:SPACING: space required before the open parenthesis '('
#321: FILE: utils/regs/src/regs.c:156:
+	if((fd = open(filename, O_RDWR | O_SYNC)) == -1)

ERROR:SPACING: space required before the open parenthesis '('
#329: FILE: utils/regs/src/regs.c:164:
+	if(map_base == (void *) -1)

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#335: FILE: utils/regs/src/regs.c:170:
+	switch(access_type) {
+		case 'm':
[...]
+		case 'w':
[...]
+		case 'd':
[...]
+		case 'r':
[...]
+		default:

ERROR:SPACING: space required before the open parenthesis '('
#335: FILE: utils/regs/src/regs.c:170:
+	switch(access_type) {

ERROR:SPACING: space required before the open parenthesis '('
#385: FILE: utils/regs/src/regs.c:220:
+	if(munmap(map_base, MAP_SIZE) == -1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
