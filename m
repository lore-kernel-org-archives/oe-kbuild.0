Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF3E7495
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Sep 2023 20:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693774394; x=1725310394;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cqrPo1XpLEpHqO49CyDpgpvB+ONVmmyYsVq+sSwSY6c=;
  b=NWaZDxwClJujzdQvzOO5a9+6Do5kQdwCYW2nBLFjp/mCAvjsf/NMx6d2
   ZtcRwrYavslOf5rc1NAYH22R43H8WSe4TbFtPwaPAUkoHUQJxw/7bWVQI
   KgaFvqN9M78WDal4vYL/BPcQGppDx8YqPMGZz8GwfOQb1f4POIwTqaj/V
   pGxrRQ/l8S04Fv0V2x07DCJwL48mSMEGpQ72ZX3KF9IyqOpKxcT+n1tlF
   jCT9eBwqgQcfthiR4ML2dk+YMI03BkMHCUh7hLzo+b34ZHqIyw+MGD0LL
   y9G0hiYD4T03ph0qjpmsUIBJuPAz7OHDcZL8kM/iaOqJPfzQ28Gxs3poN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="355975771"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="355975771"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2023 13:53:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="717360772"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="717360772"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 03 Sep 2023 13:53:12 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcu5l-0003P9-2R;
	Sun, 03 Sep 2023 20:53:09 +0000
Date: Mon, 4 Sep 2023 04:52:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [trondmy-nfs-2.6:testing 22/52] checkpatch: WARNING: struct
 kobj_type should normally be const
Message-ID: <202309040435.Sc2C1e1H-lkp@intel.com>
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
TO: Benjamin Coddington <bcodding@redhat.com>
CC: Trond Myklebust <trond.myklebust@hammerspace.com>
INFO skip CC for checkpatch warnings

tree:   git://git.linux-nfs.org/projects/trondmy/nfs-2.6.git testing
head:   0ca7005ee94124c49164f468a6a92007e796448c
commit: 1c7251187dc067a6d460cf33ca67da9c1dd87807 [22/52] NFS: add superblock sysfs entries
:::::: branch date: 5 hours ago
:::::: commit date: 3 months ago
reproduce: (https://download.01.org/0day-ci/archive/20230904/202309040435.Sc2C1e1H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309040435.Sc2C1e1H-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
a device_id. The rename approach allows us to populate the mount's directory

WARNING: struct kobj_type should normally be const
#164: fs/nfs/sysfs.c:229:
+static struct kobj_type nfs_sb_ktype = {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
