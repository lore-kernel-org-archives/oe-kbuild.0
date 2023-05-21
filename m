Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995D67E9
	for <oe-kbuild@lists.linux.dev>; Sun, 21 May 2023 01:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684633029; x=1716169029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pBNcBdYCRMiNr9f6tzLmJoghA9Idlv0KZp2R5IWemso=;
  b=Naa4g2WfLmfwoRdGOEDuaPO96/Y3DWRhFimv1zW+HM0JvRsV3+gAfG4J
   8SYk/v0j+u3HjZY25k/aNgeMENAzMBHs1W5YIlzJThcJ4684b2fkRrYNx
   VliNvZnxBrhYdPe9I0mqMc7Rmqy3yYsIubHSKqEDb1e+DKngv8nFbk/EJ
   3HZA/g/lfJafhgMJiOXr8xp+pAVaOgi9A4dH560IVRmpVUNMNy8Df8Cfr
   skjahVCCWthee5JB7bExHs7vvvkvX3NKxVfwmA4SkaezGeh2QKfMLIGOa
   NdgdFA4aGogn66kBiGIJYDZesMT3azqNTHS9oQwS7YsOd24RLcJvGrv/r
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10716"; a="355005318"
X-IronPort-AV: E=Sophos;i="6.00,181,1681196400"; 
   d="scan'208";a="355005318"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2023 18:37:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10716"; a="703034439"
X-IronPort-AV: E=Sophos;i="6.00,181,1681196400"; 
   d="scan'208";a="703034439"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 20 May 2023 18:37:07 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q0Y0R-000Buw-1R;
	Sun, 21 May 2023 01:37:07 +0000
Date: Sun, 21 May 2023 09:36:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-lts:5.10/preempt-rt 5518/30000]
 drivers/misc/mei/dal/dal_class.c: linux/device.h is included more than once.
Message-ID: <202305210951.PW2i3owL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Yael Samet <yael.samet@intel.com>
CC: Zhou Furong <furong.zhou@intel.com>
CC: Tomas Winkler <tomas.winkler@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.10/preempt-rt
head:   6f211f0eec79ebd4a63616dd92fe79e50e39b81c
commit: 26329679d1a0646f9ea74c24bb4573d180e1dbd6 [5518/30000] mei: dal: dynamic application loader
:::::: branch date: 3 days ago
:::::: commit date: 2 years, 1 month ago
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202305210951.PW2i3owL-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/misc/mei/dal/dal_class.c: linux/device.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
