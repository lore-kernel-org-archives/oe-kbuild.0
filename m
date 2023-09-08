Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BAA30FBA
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Sep 2023 23:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694217578; x=1725753578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p2hoxNrFF526/Ue9MHcs99glHgtoQ1662xhaAEO3J9g=;
  b=NHN8xoI9Gtx1UjaXyC3Nulwo0uK2r5fWU0vXwS9AsUfF0IMRLRjunrNP
   t8N8dKOyqi5EPN4stoUOQb0VUA7tnoCkXnK9mhk6dsgB+D8a18Q5ncWWJ
   ttA4SHPorERAlujz0UsL9j6gXjJVCsicOUDVdEkiENCJa7nPV+jji9phB
   mMGQyGOdaoY4+mkzXoJA66Kvhk/cRH6e+2LYTIDwx7b+GmUpG5rZd7piJ
   73rDWpvioQiHosjW3V1pu6OWCEXPnrIm4rEz873ZDosMHikzMKc2/nFIG
   49bYOc/7XMb1/FGAdMoyt3Y719owQ5mahJgS4BHJSnUSxuDDLHKkscWeC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="380502529"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208,217";a="380502529"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 16:59:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="885840979"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208,217";a="885840979"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 08 Sep 2023 16:59:19 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qelNu-0002kh-1t;
	Fri, 08 Sep 2023 23:59:34 +0000
Date: Sat, 9 Sep 2023 07:59:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pci:for-linus 3/3] checkpatch: ERROR: Please use git commit
 description style 'commit <12+ chars of sha1> ("<title line>")' - ie:
 'commit d5af729dc207 ("PCI: Mark NVIDIA T4 GPUs to avoid bus reset")'
Message-ID: <202309090714.bKAaUPKQ-lkp@intel.com>
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
TO: Bjorn Helgaas <helgaas@kernel.org>
INFO skip CC for checkpatch warnings

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git for-linus
head:   5260bd6d36c83c5b269c33baaaf8c78e520908b0
commit: 5260bd6d36c83c5b269c33baaaf8c78e520908b0 [3/3] Revert "PCI: Mark NVIDIA T4 GPUs to avoid bus reset"
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20230909/202309090714.bKAaUPKQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309090714.bKAaUPKQ-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit d5af729dc207 ("PCI: Mark NVIDIA T4 GPUs to avoid bus reset")'
#8: 
d5af729dc207 ("PCI: Mark NVIDIA T4 GPUs to avoid bus reset") avoided

ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit d5af729dc207 ("PCI: Mark NVIDIA T4 GPUs to avoid bus reset")'
#16: 
Revert d5af729dc207 as requested by Wu Zongyong.  This will leave SBR

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
