Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAC37495
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Sep 2023 20:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693774396; x=1725310396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v4B8eqIVMoy1FRvoaOs934rQtyD/V4GUjJenbHdar0M=;
  b=eY/pSCAJIU5sSO1QvkS1ENlBTT9uYC/DwTclNtqE2gnTkksAc5u8H2+L
   EI3Y5SnxRO+dOxTT4I2upN7kQg9LBQkPcBusNAf6g1+Ho2C5bbqvKGCrw
   2b8kkAN1tMXIR0G4igaA4AQ/mHBPOX+iICwF7IxsCupuuguOxiXKZEWZ0
   GrAKEE+5cvEl2lH3eVyGiMbu6+dTRIGKqoMo/7rUC7sX6cOWFSYq5e5jC
   MyRnjA9DJlVPfeEQ3leyfZFC1PbZMBsj0+2f4x8lJOIBMNwens333OUFF
   hiKYXtbrIVeOgMRvpIUbXfNr0Ob7kSNDvrL3sTprCsYUWAB2BVBWK+li0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="355975772"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="355975772"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2023 13:53:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="717360774"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="717360774"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 03 Sep 2023 13:53:12 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcu5l-0003P5-2J;
	Sun, 03 Sep 2023 20:53:09 +0000
Date: Mon, 4 Sep 2023 04:52:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [trondmy-nfs-2.6:testing 21/52] checkpatch: WARNING: struct
 kobj_type should normally be const
Message-ID: <202309040430.q1rzAFma-lkp@intel.com>
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
commit: e96f9268eea626126021641eefeed02f8669f584 [21/52] NFS: Make all of /sys/fs/nfs network-namespace unique
:::::: branch date: 5 hours ago
:::::: commit date: 3 months ago
reproduce: (https://download.01.org/0day-ci/archive/20230904/202309040430.q1rzAFma-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309040430.q1rzAFma-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: struct kobj_type should normally be const
#114: fs/nfs/sysfs.c:162:
+static struct kobj_type nfs_netns_object_type = {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
