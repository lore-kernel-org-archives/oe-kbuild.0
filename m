Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974BB17C8
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Sep 2023 01:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693618506; x=1725154506;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VSYtFAGlSTG6STViq7G/3iM3mz5iQfjAIxLJIDaocmo=;
  b=Qwlqd/S72hCZC++CFwF1Fqb8Pgi3LOKGDoU8sb057Qa2G+cqi335r58a
   njaGZEhFM9O2c2AXPJD2BclT6WH7TH6TW9Y1Co7UavpzlcqfhsYk39tKL
   U1ptVJpB5MxuymQqHxQ67YvSUR5JwjhYvEz0MHFKXmsBN/6NCg6+fkXU4
   I+owJF2nVQPU+CwBEWzXtih1EO0yUEqRDLDSegVRxdv1JXW5jI4xTvVK+
   sQpidKgYxXkhP7qqq31gSSYwfQFODVMHiKfNmGrpe7VNIooJZKe6KxrPM
   8NXXhOfi1eXxU7sfdwCkhUspH7JWO4kJczwm3Y9m7l+w63+QBs41Uuk7u
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="355836801"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="355836801"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 18:35:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="863738182"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="863738182"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 01 Sep 2023 18:35:02 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcFXQ-0001pr-01;
	Sat, 02 Sep 2023 01:35:00 +0000
Date: Sat, 2 Sep 2023 09:34:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [trondmy-nfs-2.6:testing 22/46] checkpatch: WARNING: struct
 kobj_type should normally be const
Message-ID: <202309020903.mDW4O9dg-lkp@intel.com>
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
commit: 1c7251187dc067a6d460cf33ca67da9c1dd87807 [22/46] NFS: add superblock sysfs entries
:::::: branch date: 12 hours ago
:::::: commit date: 2 months ago
reproduce: (https://download.01.org/0day-ci/archive/20230902/202309020903.mDW4O9dg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309020903.mDW4O9dg-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#9: 
a device_id. The rename approach allows us to populate the mount's directory

WARNING: struct kobj_type should normally be const
#164: fs/nfs/sysfs.c:229:
+static struct kobj_type nfs_sb_ktype = {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
