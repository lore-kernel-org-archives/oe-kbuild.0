Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1952520468E
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Oct 2025 10:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761818654; cv=none; b=cT2Ruu+2AlF8v+VNEaItoFbnbDXSN/iIeJB8jTjqRggjD8HRNk8WuZTY0s98INq0ukSfYEkAwiOFosj6ewyjiAfqyaqdIt+J88AJkfDHy9yrc21U4VUaw7vpMSNriRugOROaVHDaWmNWFvElCnx6MTe/EQ6/jHL7BcHgbebpnwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761818654; c=relaxed/simple;
	bh=OT/lqBnE08eEm2R74OSYFZ1RrJI+d14QT7jXo4U13cc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dhUKchYYQrv+AmueDiu2c0pD/ibDswQtO0YQ6TOpMrW4OV6ta+OrTUTDzF8U9qBeZ2QQ3jjoUNi+Bax80y3sy18gv3Slrj85HAwzLCOo2jJyTQsdZWNBtHRz32MK4KXUBG6csNVAUi6+xCXAMereb7xy0wBlblpCMMsQYiVrXfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AhoUwzjE; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AhoUwzjE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761818652; x=1793354652;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OT/lqBnE08eEm2R74OSYFZ1RrJI+d14QT7jXo4U13cc=;
  b=AhoUwzjEDNehNO9Odz1mZhuj9Uoxyj1ATHmKwTL8fwrIxlTc0Hasw6gD
   FnAWhEPjYxSXRZXajYnAKW/Ycsf/kSD4OyubQK4CYQohkSI2BkfCnkgaZ
   ACQxmoeD/sHfdDIQi5SRngN38dO0fSi7Uu3Hfe2bc+pi0JOrcJne0+jPw
   ol/azgZ/uDskA7BtVRbU+PTFoRavejb47EmHrxqHZV0s+OowQd7qVtwG8
   npkzcGyrNP9qMLaunlndXDQe4vvVxyy3x1YUEgMnDmL63wt/bEdBUegtr
   SJvtK4dA5VCVJ8XAkf+V0vIDjsVEc7dxGir3h67MiEeCZrl8Bsbjwlo0h
   A==;
X-CSE-ConnectionGUID: DDmdBkX2SdyZQ/2vD3ZPpA==
X-CSE-MsgGUID: fCR5Jq7oRVGI3bJssV/8Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67790318"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67790318"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 03:04:11 -0700
X-CSE-ConnectionGUID: ttOnyG0cT8a4uuxCvcvBOA==
X-CSE-MsgGUID: ylEOryJSTpmYTT8cfI+jew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="216768022"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 30 Oct 2025 03:04:09 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEPVn-000Lo8-19;
	Thu, 30 Oct 2025 10:04:07 +0000
Date: Thu, 30 Oct 2025 18:03:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] modpost: drop '*_probe' from section check whitelist
Message-ID: <202510301718.aYPBxGbE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251020091613.22562-1-johan@kernel.org>
References: <20251020091613.22562-1-johan@kernel.org>
TO: Johan Hovold <johan@kernel.org>
TO: Nathan Chancellor <nathan@kernel.org>
TO: Nicolas Schier <nicolas.schier@linux.dev>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: linux-kbuild@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Johan Hovold <johan@kernel.org>

Hi Johan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.18-rc3 next-20251029]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johan-Hovold/modpost-drop-_probe-from-section-check-whitelist/20251020-171732
base:   linus/master
patch link:    https://lore.kernel.org/r/20251020091613.22562-1-johan%40kernel.org
patch subject: [PATCH] modpost: drop '*_probe' from section check whitelist
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: xtensa-randconfig-001-20251027 (https://download.01.org/0day-ci/archive/20251030/202510301718.aYPBxGbE-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510301718.aYPBxGbE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510301718.aYPBxGbE-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: nxp_stm_probe+0x0 (section: .data) -> set_reset_devices (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
