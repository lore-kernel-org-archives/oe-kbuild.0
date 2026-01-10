Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36583FC9
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jan 2026 10:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768041471; cv=none; b=JQhZHZI/KT7OK10WID3PPuKIqc26OpLFxzaRA65RXNDhm7eZyysANA4IQ6ym30PPF+NpoSsUl/O8UWjipPc315IY8kD45RlrRCcg82FthqLFqhZ6xpmex9vbyJJUW7dJ4YN0+rzofWGexErV+MoFl+RIYKjtBKaznxZuZ0S5gIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768041471; c=relaxed/simple;
	bh=+6ccfsjTQUeXOhp2itRvYPhosrTYnOQk3CksCY8T8Mc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F8BtVJWeDU6QRqD8hOe1veGJwKJVCn7CwHWs6M7uvZZ6V6OU+yHjf69R0744db6ktFbfgXJ2eF0+6cGv5xM8/j/tBT640slKPNEUX3sA6R7sigr38meeURAsieJx2aVQXdL3iRUAmaBeYkg6DlLDH69QumPQ1vtWueOwc696L5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eNMtc/J5; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eNMtc/J5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768041469; x=1799577469;
  h=date:from:to:cc:subject:message-id;
  bh=+6ccfsjTQUeXOhp2itRvYPhosrTYnOQk3CksCY8T8Mc=;
  b=eNMtc/J5ps4M0va3EGs7iAe/DbgRG7FwckPt1NZJv2W/F/KMGwdMj94v
   Gu3Wy4MJ7hKdg46BxWZGsSaIr9s+DUp+Y7HNv7KvSwUBrC9zrTeD5NW7f
   ebyERq5kEjDsiMZRhbEy+tdt7YG2w2TOtidOebL3OdVaGSFWJRJBuxY8W
   q4pFVmiYUKsHVDf6FYSopx+VZcXa0nkIBZ73q1DrxZ151p0kG0pQielPS
   suWeyse+S/SOOIlgFmaXbdOaMz2w9D5nOAIomEBjwCKGTd2u9c+6bRiqQ
   X5UhpxH+DKbcOG2ov5VhvgW2jb7Acmq1IXXI46FDusYV1zGbjVbW8Qk0O
   w==;
X-CSE-ConnectionGUID: 8FKJMUs9Q9+6v4gL/Immig==
X-CSE-MsgGUID: LP0W6LtXSperTxPffxj3CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="68406469"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="68406469"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 02:37:48 -0800
X-CSE-ConnectionGUID: Ua1IVltfQMCoV4ZZNmKw+A==
X-CSE-MsgGUID: HSdcRY+rQmynTrJjteSWAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="203468515"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Jan 2026 02:37:47 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veWLo-000000008Xo-3nS6;
	Sat, 10 Jan 2026 10:37:44 +0000
Date: Sat, 10 Jan 2026 18:37:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [lee-leds:for-leds-next 3/10]
 drivers/leds/rgb/leds-lp5860-spi.c:87:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601101812.j6kBBCPY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/leds/rgb/leds-lp5860-spi.c:87:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-leds@vger.kernel.org
TO: Steffen Trumtrar <s.trumtrar@pengutronix.de>
CC: Lee Jones <lee@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
head:   e257dc532c20bd93f0076c18cb5ffd739a5f0bb4
commit: 51f7560294c911e9394357a903ffa28eebe4b253 [3/10] leds: Add support for TI LP5860 LED driver chip
:::::: branch date: 19 hours ago
:::::: commit date: 2 days ago
config: sh-randconfig-r113-20260110 (https://download.01.org/0day-ci/archive/20260110/202601101812.j6kBBCPY-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601101812.j6kBBCPY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601101812.j6kBBCPY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/leds/rgb/leds-lp5860-spi.c:87:1: sparse: sparse: bad integer constant expression
   drivers/leds/rgb/leds-lp5860-spi.c:87:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/leds/rgb/leds-lp5860-spi.c:88:1: sparse: sparse: bad integer constant expression
   drivers/leds/rgb/leds-lp5860-spi.c:88:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/leds/rgb/leds-lp5860-spi.c:89:1: sparse: sparse: bad integer constant expression
   drivers/leds/rgb/leds-lp5860-spi.c:89:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +87 drivers/leds/rgb/leds-lp5860-spi.c

51f7560294c911 Steffen Trumtrar 2025-12-01  86  
51f7560294c911 Steffen Trumtrar 2025-12-01 @87  MODULE_AUTHOR("Steffen Trumtrar <kernel@pengutronix.de>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
