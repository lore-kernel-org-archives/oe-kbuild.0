Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6420B28C866
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Jan 2026 13:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769174583; cv=none; b=iky+tZ6T6Ka3RyHSsEv92A6b6gDlrletp+3i3hgQnGzbPNkCLfX+ohPQOF8AM24MCTbotOYuH8iWGBdiCXdx/Kkw76OhrWNl2B3NUXcKGif5vASflVEekoDGIy9q+zLSps/hUAp+Yo9G62fF1vHe5wJg1ts0UfzwYoj42to+fyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769174583; c=relaxed/simple;
	bh=AClbHWawN7d0R+T8Fs1SQqTcRtmh1w3Poqmw4+CC61c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PHJqoMezXK4gU/o/tl8BI+0QGpWtRKNBc+pltCc9zN7iK1yb0imgrTEIAUinNx1Vq68TGWs5Kk8QhYLgD6lYdX1lgdr9QoRwNNdD23CRjxNyB4dI388AR1WF4eU1Axo6cRxtBp9boqnX9AAIZiVW8FPkllS8x+ZztMoi44ebc3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CZBdh1Ga; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CZBdh1Ga"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769174582; x=1800710582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AClbHWawN7d0R+T8Fs1SQqTcRtmh1w3Poqmw4+CC61c=;
  b=CZBdh1Gad+z1osdVX7UsfOwnyheXzEBTVi6gWbvrx8lxQkwherRifVVn
   9aspCUpQ2KgDxOk1fKs5RqeMaKtZVtYG+NkgWA2vM/LuX/9OXReBUQWDl
   Iz0sQF2xAs2dZRSzD55M4LYqHFpl2DG6Q1XbPqjhkXDYbyzKZiTatWJ5t
   OmWiumhkWlG6rJo+DBGp3bg1AYLpjVhpprzBCMBPysieCgdWbB21G/Ath
   1AJFwmtMMi0H+zo0DCBah2Rz0RMBf3zF0spfabQReN3KFJ6mP59eTr8PL
   E6rIKPkup+NJ7d1n25wBwTSBqbLNh1jofWMcdVqkC9wp4aVovzG0QrHBU
   Q==;
X-CSE-ConnectionGUID: HoR5R2MdTKaMxrraTX6DTA==
X-CSE-MsgGUID: MIMtijr/Sj2v8KFYcZLYnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70477603"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="70477603"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 05:22:58 -0800
X-CSE-ConnectionGUID: /tDrdhazR6G/Bdvgi5WMoQ==
X-CSE-MsgGUID: FQF42m2oS1uY3WAP5yM8jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="244635326"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 Jan 2026 05:22:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjH7m-00000000Tyi-0pla;
	Fri, 23 Jan 2026 13:22:54 +0000
Date: Fri, 23 Jan 2026 21:22:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v8 2/2] phy: eswin: Create eswin directory and add
 EIC7700 SATA PHY driver
Message-ID: <202601232108.K5gv4OLc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/phy/eswin/phy-eic7700-sata.c:271:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260123030933.987-1-luyulin@eswincomputing.com>
References: <20260123030933.987-1-luyulin@eswincomputing.com>
TO: Yulin Lu <luyulin@eswincomputing.com>
TO: vkoul@kernel.org
TO: neil.armstrong@linaro.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: p.zabel@pengutronix.de
TO: linux-phy@lists.infradead.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: ningyu@eswincomputing.com
CC: linmin@eswincomputing.com
CC: fenglin@eswincomputing.com
CC: Yulin Lu <luyulin@eswincomputing.com>

Hi Yulin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.19-rc6 next-20260122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yulin-Lu/dt-bindings-phy-eswin-Document-the-EIC7700-SoC-SATA-PHY/20260123-111201
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260123030933.987-1-luyulin%40eswincomputing.com
patch subject: [PATCH v8 2/2] phy: eswin: Create eswin directory and add EIC7700 SATA PHY driver
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: openrisc-randconfig-r111-20260123 (https://download.01.org/0day-ci/archive/20260123/202601232108.K5gv4OLc-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601232108.K5gv4OLc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601232108.K5gv4OLc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/phy/eswin/phy-eic7700-sata.c:271:1: sparse: sparse: bad integer constant expression
   drivers/phy/eswin/phy-eic7700-sata.c:271:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/phy/eswin/phy-eic7700-sata.c:272:1: sparse: sparse: bad integer constant expression
   drivers/phy/eswin/phy-eic7700-sata.c:272:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/phy/eswin/phy-eic7700-sata.c:273:1: sparse: sparse: bad integer constant expression
   drivers/phy/eswin/phy-eic7700-sata.c:273:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +271 drivers/phy/eswin/phy-eic7700-sata.c

1e9a7ab83d6c55 Yulin Lu 2026-01-23  270  
1e9a7ab83d6c55 Yulin Lu 2026-01-23 @271  MODULE_DESCRIPTION("SATA PHY driver for the ESWIN EIC7700 SoC");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
