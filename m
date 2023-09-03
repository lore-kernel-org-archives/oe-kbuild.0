Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876FD3C1E
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Sep 2023 21:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693778202; x=1725314202;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uM1aTGlgIKYLHvIfDWSg5F34wIuJ5UMm2pzLs7QEY/8=;
  b=VLwXrxJL4k3ezzm6YXuqhGdSX67z/bRbfdiGF5nYVtTM1ToZKJHsVUwM
   2YIz8F5HP8e7sXj1YRLzC5Prm5pp1o5L9MtBnqG3u2kpMP7S7T0FKgmc6
   JjwqlYiP+wSgnyBRBrEpU1Hfr6S1ZQpOf1268MZ/g6a6gf8RNzHKqSv73
   xEmFk/CEwACLC+q3tmfys2PeC6vC4ayS56ur8P98Fn86Jjz+tRaScXqHP
   a5xLqPUV9kApPbSVIsc68CpWwBCrDGhJOjaYM6ShQktAz+Ta9NcQvoorw
   3I3W9JXVFzwUyA4pqhHU1CMyqYgRTWJ7+QmBo2v+U+y0dp/6D86RwqTN+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="379198376"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="379198376"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2023 14:56:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="775623315"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="775623315"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 03 Sep 2023 14:56:40 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcv5C-0003RT-23;
	Sun, 03 Sep 2023 21:56:38 +0000
Date: Mon, 4 Sep 2023 05:56:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [trondmy-nfs:testing 20/52] checkpatch: WARNING: struct kobj_type
 should normally be const
Message-ID: <202309040533.KHibWe2z-lkp@intel.com>
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
CC: linux-nfs@vger.kernel.org
TO: Benjamin Coddington <bcodding@redhat.com>
CC: Trond Myklebust <trond.myklebust@hammerspace.com>
INFO skip CC for checkpatch warnings

Hi Benjamin,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git testing
head:   0ca7005ee94124c49164f468a6a92007e796448c
commit: 943aef2dbcf75f81c4574903131bd9559cee4fd1 [20/52] NFS: Open-code the nfs_kset kset_create_and_add()
:::::: branch date: 6 hours ago
:::::: commit date: 3 months ago
reproduce: (https://download.01.org/0day-ci/archive/20230904/202309040533.KHibWe2z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309040533.KHibWe2z-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#8: 
.child_ns_type member in a following patch.  No functional change here, only

WARNING: Missing a blank line after declarations
#28: fs/nfs/sysfs.c:31:
+	struct kset *kset = container_of(kobj, struct kset, kobj);
+	kfree(kset);

WARNING: struct kobj_type should normally be const
#37: fs/nfs/sysfs.c:40:
+static struct kobj_type nfs_kset_type = {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
