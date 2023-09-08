Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1288111B
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Sep 2023 23:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694215597; x=1725751597;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aUlc9AFJ8kwmDQTk5uXH/zHKdPE0Q8oovOQ4WOTP++8=;
  b=dh33y6Mtqt5mMXs7jnEIojv7mmlsYtrur57WJgiAAgRFO0Y/ZuVbUYNg
   ioiEDJgBJf0CXb/igxImo37T7Mc9sYXc+krnNIchKlp5bzJ/TEQ3exxtS
   PzlKKHy2fbsY/bojbNsfHmx0l3TqIZp7Dy49kCxe+DyezlaarsflaRWt4
   5qi1tPBPA/aPNAENyhrlEVYUdlyrUuMRYm258njYcbl07ASd8CbXBZYcG
   oohki5miAytQgmKbX5dLhmpk5iroQ24lVRaJUNQJmMWKeoh1TU3U3bIhm
   bIjadgNiP70na4+TUAv7qsT+2nMh+b7jpGHfS6O6aNPoaVgDyb6q+3bYR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="375143075"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="375143075"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 16:26:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="857583305"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="857583305"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 08 Sep 2023 16:26:35 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qekrx-0002jT-2a;
	Fri, 08 Sep 2023 23:26:33 +0000
Date: Sat, 9 Sep 2023 07:26:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pci:for-linus 1/3] checkpatch: WARNING: Reported-by: should be
 immediately followed by Closes: with a URL to the report
Message-ID: <202309090756.Iu8tQ4xQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "checkpatch"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-pci@vger.kernel.org
TO: Lizhi Hou <lizhi.hou@amd.com>
CC: Bjorn Helgaas <helgaas@kernel.org>
INFO skip CC for checkpatch warnings

Hi Lizhi,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git for-linus
head:   5260bd6d36c83c5b269c33baaaf8c78e520908b0
commit: 26641b3f22abe3f03bd8e078c116cc98de740f43 [1/3] PCI: Fix CONFIG_PCI_DYNAMIC_OF_NODES kconfig dependencies
:::::: branch date: 3 hours ago
:::::: commit date: 3 days ago
reproduce: (https://download.01.org/0day-ci/archive/20230909/202309090756.Iu8tQ4xQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309090756.Iu8tQ4xQ-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: Reported-by: should be immediately followed by Closes: with a URL to the report
#13: 
Reported-by: Guenter Roeck <groeck7@gmail.com>
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
