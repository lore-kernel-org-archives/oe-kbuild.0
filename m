Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DB814F6D
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Dec 2023 12:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D6L0ykdx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701865178; x=1733401178;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kO8U1Ya5QRf+/pCs+uYbVD2z/BpziIqdO/BV0/a3Gqg=;
  b=D6L0ykdxOpgLdJf4s9L7mH432OAmiEhwUV2l6j26BgljFMHSa1o6zu6r
   4usTY//AW+ifiVg/KnhNL7D/rnRCRLjvwMtBNoPDEg5NFQ6gZo7aXJ3R+
   6NeF/OLGxhNvds2qh2CDDDyUnXFsvgecZTyDu6IGlIIsDX7olUH6HCI8z
   hChS4D3CW56tMRTntH3lBS0oD/6xrcVrTlOgVwA1s5nwtx4a6OfP1QeuJ
   NRQ/Tt6/gONZZ9cnUXFnu+lk9WXWsnzRMcNthyqd6gNc7cMMP/xg9AJcC
   mXtw87lxDpTs4adAPAVsVBOYPwfRTXfk8V9lKT9RH9mCPVPkNYcM0wWJB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="396840884"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="396840884"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 04:19:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="800329843"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="800329843"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 06 Dec 2023 04:19:22 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAqs3-000AmM-0z;
	Wed, 06 Dec 2023 12:19:19 +0000
Date: Wed, 6 Dec 2023 20:18:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:116:6-9:
 WARNING use flexible-array member instead
 (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
Message-ID: <202312062022.N0mzFcPn-lkp@intel.com>
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
TO: Wright Feng <wright.feng@cypress.com>
CC: Kalle Valo <kvalo@kernel.org>
CC: "Chi-hsien Lin" <chi-hsien.lin@cypress.com>
CC: Ian Lin <ian.lin@infineon.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: 6c04deae1438e5df59fc4848795248fc34961f51 brcmfmac: Add dump_survey cfg80211 ops for HostApd AutoChannelSelection
date:   1 year, 2 months ago
:::::: branch date: 2 days ago
:::::: commit date: 1 year, 2 months ago
config: csky-randconfig-r053-20231201 (https://download.01.org/0day-ci/archive/20231206/202312062022.N0mzFcPn-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312062022.N0mzFcPn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312062022.N0mzFcPn-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:116:6-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

vim +116 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c

6c04deae1438e5 Wright Feng 2022-09-28  112  
6c04deae1438e5 Wright Feng 2022-09-28  113  struct cca_stats_n_flags {
6c04deae1438e5 Wright Feng 2022-09-28  114  	u32 msrmnt_time; /* Time for Measurement (msec) */
6c04deae1438e5 Wright Feng 2022-09-28  115  	u32 msrmnt_done; /* flag set when measurement complete */
6c04deae1438e5 Wright Feng 2022-09-28 @116  	char buf[1];
6c04deae1438e5 Wright Feng 2022-09-28  117  };
6c04deae1438e5 Wright Feng 2022-09-28  118  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
