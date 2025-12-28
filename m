Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101AD1A704B
	for <oe-kbuild@lists.linux.dev>; Sun, 28 Dec 2025 00:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766882687; cv=none; b=C8XYDzx5zYcQUaLoXrhfffuAxMkQ96DS88Rd3TYgTrSl54ye/Z4ZoRN/DhsTCl4fH5UQB3WRYSXLfnVJhDbf81Yk9YDf5k4l9iErIph1/kdhapfDaGcZRV+CVAoim+FMnA/nDk1tRKX08Vn5nt87LoyZ9Wp1YnMAbP/jjY/koO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766882687; c=relaxed/simple;
	bh=Zffl366t906G6prhxuVdAfSeJZFo/oii3pkUEL/Z5kk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CjqrY3ypP0oO9MiiBWnGHkkLLVjJGddYNkYG9nYzhYJaKTT4h5ML00e4MaxPMgQ9dbfqm31KyiZIhhht/ibkNYGWQ0pTvUqEJ//LtQt2BESCzO1U6knrMowsTyKohkn7nRx3cCTp/WuSeGfaik2vZpufRzPRQBNmSSaUH69tMrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=La6ZOFLX; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="La6ZOFLX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766882686; x=1798418686;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Zffl366t906G6prhxuVdAfSeJZFo/oii3pkUEL/Z5kk=;
  b=La6ZOFLX2C7EtxNfmSxQk7YDa1UplvNcWActEiC7Zob9uSXrXu0uup+M
   emacFYVMAxxOSjwqtRCBZsglJ52JqMfUAgzIup9nkwZkZgRwXM8xU3wWJ
   Zllqtgh5XfaH2EaTqc2kcqllxnlhLNINxFH/14KpckqJ5TNFJlQT0lGLJ
   Yvdw2h8/Z0HM2nbsPUhyVxPy5SCCuNJG/PbZffnRTTRFJLxWyzMtd0BGa
   8Ya4p2HUZZCBzVfHzHizHaKJnOHGuBSU7tAEXhLKpeMm7VqYbzIVa3IYt
   RbFYrtYIrFSEDeaLJWFugbyzZ3wmrkSOOkl/yoAwDvEG8Pe/Bu5fx4PIK
   w==;
X-CSE-ConnectionGUID: u6c92ZnoTu6hxCoemkkNVg==
X-CSE-MsgGUID: jIRSUaxgSo2n3tXWIJm9wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="71142090"
X-IronPort-AV: E=Sophos;i="6.21,182,1763452800"; 
   d="scan'208";a="71142090"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 16:44:45 -0800
X-CSE-ConnectionGUID: ZWW+f/iQRE+vD1wNBZp2oA==
X-CSE-MsgGUID: y9UkZMz0RKySbeM1tWne1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,182,1763452800"; 
   d="scan'208";a="205544719"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 27 Dec 2025 16:44:45 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZetn-000000007Ki-0cZY
	for oe-kbuild@lists.linux.dev;
	Sun, 28 Dec 2025 00:44:43 +0000
Date: Sun, 28 Dec 2025 01:44:32 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH 1/3] power: supply: add battery driver for netronix ec
Message-ID: <202512280112.5tg2RyRm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251227-kobo-aura-battery-v1-1-328a90ef5122@jm0.eu>
References: <20251227-kobo-aura-battery-v1-1-328a90ef5122@jm0.eu>
TO: Josua Mayer <josua.mayer@jm0.eu>
TO: "Jonathan Neuschäfer" <j.neuschaefer@gmx.net>
TO: Lee Jones <lee@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Sebastian Reichel <sre@kernel.org>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>

Hi Josua,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Josua-Mayer/power-supply-add-battery-driver-for-netronix-ec/20251228-005512
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20251227-kobo-aura-battery-v1-1-328a90ef5122%40jm0.eu
patch subject: [PATCH 1/3] power: supply: add battery driver for netronix ec
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251228/202512280112.5tg2RyRm-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#100: FILE: drivers/power/supply/ntxec-battery.c:38:
+	switch (psp) {
+		case POWER_SUPPLY_PROP_VOLTAGE_NOW:
[...]
+		default:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
