Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924910;
	b=E0oCTm3/DXUJLgDlGPIKjRM9QUwGHcsBmpMXb3nbo7R/log808BhCZ8wtf4s4o1gUPuY
	 CKLLMmZuUCdmF2bwTMWZMEvKili8Kd0GP50JHSDcSzmo4TNbSxzEUpygSjQpy4Rjfyloz
	 XBUVkdeVleJmDZP7IE2cfbzlw/vpqbkEkZEQRIaawUs+nEE2a2FT5gsrP2b4NVCc0ytuq
	 tkTq+DTeLIgEaOwHO8VvkmqvDebvaKgoMTz2aqMHwG6DnurSa+sP436nnXigCuBla9Pg5
	 Ea9TVlqmi/2xNaDp5m/+ArNx8wqV8pIwpOp6n8X0SqkBuGUBQ1VQf23x0oALgOHQdgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924910;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=9gT2CVCPHIigFPNDZ/IWWHzEywTdNmJeIASg5vCmBIg=;
	b=UxiISPhJgA+WYaQ4DmzX9X8I6XIu+pYGcyNQLfXSR2hlUIdY7kxyRI5Qee0K614KKaYW
	 DC31SHQJm/lW496utVrlOdDMBF3L1aedfyjKTSn8dBBbmQd+UK5tx+naubI5RmiTVAZXk
	 csC5asKYbQohvp53dvRc2zk6exMmpBAI3jL4USNd2xFrEDahBJ4ectpCBaWFqLnTcV22y
	 vKphyGEdxkcpnAGm7HQWNUOD6MefrPC9J6bxuWI9TY4Tu/OYyE0dD+pYuOkBOzmw6EGLV
	 RKGxlr2rSz+ZQzKCG7xOQx0hvQj53PsOJ0EoPPHz+FubjUfqqXHtSGHCydazcd41s9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hxcjoNKh;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FF8606BDBF
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Nov 2026 14:15:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89FF8606BDBF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hxcjoNKh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794924909; x=1826460909;
  h=date:from:to:cc:subject:message-id;
  bh=zIr4pv+vHsjH2iCSVp1rRsCMTC/GNNFq+yEXLkS1Sbk=;
  b=hxcjoNKhYzm8Z+zwO8DNexTtAPbwNhoabmDVeLyBIwRVVLm/0K9UZ0dx
   oU0k6v/3Wp+PyCkYpTdXEUCcXMq0YXbOpdQZyn7cpIc6NKeqyccSKgx/h
   eN5mpdGSSF0S4JfyXZDVxVofdgn03c+1OGiuR4GnKNuvzYu3CZ/Vk3dsA
   V/+ja7Fioo8xJdrIVoRSsz5cy/9YO0Ob5e3lpbxDY+VxdM86E2KWdDsSu
   gh54OEaXWzP/Ox5iiurC5E2vsRWmNubaLRZmWhImqL6AbzkhamliB7A92
   ADpiYRjfxKzPgafXvzppLy1rYav20iWz1/U2bHk+liWi/YMws23wJ6+4H
   w==;
X-CSE-ConnectionGUID: UTAFCZ7xS8ulk0Ctah4GOw==
X-CSE-MsgGUID: 4i3BxBmyQFOXf+OhmF5SwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3778916"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3778916"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 06:15:09 -0800
X-CSE-ConnectionGUID: 1J6nVtw8RqGLARwmKozl+w==
X-CSE-MsgGUID: tj0eTtEhSLu95ZvnImUG0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="11651244"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 17 Nov 2026 06:15:08 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTJxi-0000000038E-0oeS;
	Tue, 17 Nov 2026 14:15:06 +0000
Date: Tue, 17 Nov 2026 15:14:11 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ERROR: modpost: arch/sh/boards/mach-dreamcast/rtc.ko:
 missing MODULE_LICENSE()
Message-ID: <20261117151450.Sqa49A4b-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit"
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jani Nikula <jani.nikula@intel.com>
CC: Nicolas Schier <nsc@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

Hi Jani,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
commit: d900723d78adec229996aefbab0dcaa66a177b77 modpost: use mod_warn() and mod_error(), clean up logging
date:   3 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 3 months ago
config: sh-randconfig-r2109-20261117 (https://download.01.org/0day-ci/archive/20261117/20261117151450.Sqa49A4b-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/20261117151450.Sqa49A4b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d900723d78ad ("modpost: use mod_warn() and mod_error(), clean up logging")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261117151450.Sqa49A4b-lkp@intel.com/

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: arch/sh/boards/mach-dreamcast/rtc.ko: missing MODULE_LICENSE()
>> WARNING: modpost: arch/sh/boards/mach-dreamcast/rtc.ko: missing MODULE_DESCRIPTION()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
