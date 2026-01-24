Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D424E82866
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Jan 2026 01:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769219021; cv=none; b=OIZsl7dzR1hk1WRoCbDKig5YTJ4ingB2j/d7wAOCE8VFMixZEkZjYL+Inp4MQxGRyqdIr04QAzQay8Kf/YetX8YQS3BcnNWqAkllfOicxL03TwCq+1QJJyo+mKtFbhbSI8cettBsLbokWg5nzEfeVzLgyN3fQV3MBJH7ZzxA8A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769219021; c=relaxed/simple;
	bh=ccjREstGDM44j5yJ8idxO2aZEMIV/GhuyeVV9ZmAOHU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HoWiZnyv9tg/3zp7bjKX/OshJm6f0xK0MOa3STOw19o1OoT+Pb8qMW164IwA+J2GE2cmtZVOLQmbDFvzJhABLiAJbzo870mjShS5QDyG4saIjhzb6UwKyCR6kfidZh+7VCvk/mmiw+xX5OLc8NhmvpUmmsykN99XTww5Q7iSFl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ckWUZCYS; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ckWUZCYS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769219020; x=1800755020;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ccjREstGDM44j5yJ8idxO2aZEMIV/GhuyeVV9ZmAOHU=;
  b=ckWUZCYSrAKGGrltS3HMkSSUuqR0sLzPEG6zVkPYQErdJMyqONh9vmLJ
   QTyY+FTaSYUKkowrKlLOI2//I4l4V/MBKAJFT49iTHc/X+lEktHEf0cGv
   N6cN7sXSrzetbvo0H1JehLyyR803nisW79Cc1trw72YE9meO4WLUs8HXm
   tlgeCMFK95Scm9RBjtfvMG8D6ZAjhmJCwOPXwYQagLHRgqq/PWQz25+kT
   XpMGccn7vTsb7hcbF6TXL4TVg17+ZDxhpyCDI7zaUIm6/dB17SzkNgP1c
   988qhL2Ma89cpq7TT0IqrOlRx0T/W5Dbw38m7utvkygYVhpeBAg23rIX9
   Q==;
X-CSE-ConnectionGUID: f349koiAQqepkSx1BzFGqg==
X-CSE-MsgGUID: DDOih4hoTreihkBq7KI9Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="88049321"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="88049321"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 17:43:37 -0800
X-CSE-ConnectionGUID: gWL+wFVQS42DB4fArWhTZQ==
X-CSE-MsgGUID: XfJZj8bMTgCiiKIF5+ME5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="237822578"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Jan 2026 17:43:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjSgX-00000000Ufc-1tYu;
	Sat, 24 Jan 2026 01:43:33 +0000
Date: Sat, 24 Jan 2026 09:42:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v7 2/4] backlight: add max25014atg backlight
Message-ID: <202601240933.cKsG1DN2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/video/backlight/max25014.c:375:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260123-max25014-v7-2-15e504b9acc7@gocontroll.com>
References: <20260123-max25014-v7-2-15e504b9acc7@gocontroll.com>
TO: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
TO: Lee Jones <lee@kernel.org>
TO: Daniel Thompson <danielt@kernel.org>
TO: Jingoo Han <jingoohan1@gmail.com>
TO: Pavel Machek <pavel@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Helge Deller <deller@gmx.de>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
CC: dri-devel@lists.freedesktop.org
CC: linux-leds@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-fbdev@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: Maud Spierings <maudspierings@gocontroll.com>

Hi Maud,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d]

url:    https://github.com/intel-lab-lkp/linux/commits/Maud-Spierings-via-B4-Relay/dt-bindings-backlight-Add-max25014-support/20260123-193429
base:   a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
patch link:    https://lore.kernel.org/r/20260123-max25014-v7-2-15e504b9acc7%40gocontroll.com
patch subject: [PATCH v7 2/4] backlight: add max25014atg backlight
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: nios2-randconfig-r113-20260124 (https://download.01.org/0day-ci/archive/20260124/202601240933.cKsG1DN2-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601240933.cKsG1DN2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601240933.cKsG1DN2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/video/backlight/max25014.c:375:1: sparse: sparse: bad integer constant expression
   drivers/video/backlight/max25014.c:375:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/video/backlight/max25014.c:376:1: sparse: sparse: bad integer constant expression
   drivers/video/backlight/max25014.c:376:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/video/backlight/max25014.c:377:1: sparse: sparse: bad integer constant expression
   drivers/video/backlight/max25014.c:377:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +375 drivers/video/backlight/max25014.c

7d129add59bae00 Maud Spierings 2026-01-23  374  
7d129add59bae00 Maud Spierings 2026-01-23 @375  MODULE_DESCRIPTION("Maxim MAX25014 backlight driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
