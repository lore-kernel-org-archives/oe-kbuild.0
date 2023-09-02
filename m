Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDC215A5
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Sep 2023 01:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693618504; x=1725154504;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bLhJAj/vN4E9aVIpWB6lWI6dZGKpCRgIk0xxzdWCfXY=;
  b=kFaj8/hq1I9hwGXUuq2EWEnJKz4L626YsChoNQ7l2QGMgV9zofyK/oDk
   C7/3y3ZVW7jJak6mPwHfum2f62RvSNwHC20w7CJyfRW/z3Kj9NWpgp1Br
   49bW2Szro2zYnWnEM9M1KejBEHSbFavy3cmDwP4iOF+Fn6TiO2umANUWr
   AjJ/2Qr5Dr9UjWxOkZ3opKHrxI48tG0Ubgs7Aa+OydhzHu6MgtxbTXWkC
   4sBz5bh3QHHq9GRwO2fQcqflVKREFXXM8fookHZ3MpSl0bD2ZXWxQ9NvN
   Q4q7xidnC0t9AAcQw0NvfvjXfjLrjt4W2ySuR85VePmdRpPVPDfl+JKfP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="407335535"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="407335535"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 18:35:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="913878946"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="913878946"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 01 Sep 2023 18:35:02 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcFXQ-0001pu-08;
	Sat, 02 Sep 2023 01:35:00 +0000
Date: Sat, 2 Sep 2023 09:34:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [trondmy-nfs-2.6:testing 21/46] checkpatch: WARNING: struct
 kobj_type should normally be const
Message-ID: <202309020920.JOQpypQo-lkp@intel.com>
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
head:   0703dc52ef0b099ba48929e25f373bc5ef436057
commit: e96f9268eea626126021641eefeed02f8669f584 [21/46] NFS: Make all of /sys/fs/nfs network-namespace unique
:::::: branch date: 11 hours ago
:::::: commit date: 2 months ago
reproduce: (https://download.01.org/0day-ci/archive/20230902/202309020920.JOQpypQo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309020920.JOQpypQo-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: struct kobj_type should normally be const
#114: fs/nfs/sysfs.c:162:
+static struct kobj_type nfs_netns_object_type = {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
