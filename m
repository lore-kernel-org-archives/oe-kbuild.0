Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6917017C8
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Sep 2023 01:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693618504; x=1725154504;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VEzznmM5cQ5sYJh28QpyAeyK+Y4HMitfSr9BWo4G3b8=;
  b=XF4BK1U4dzkBHHHnZlZ1AH+Q2tOpeE92eyY2lgGNw5WWj9asr4gmMvCN
   lNsA+E0pyM6dvz3WG3V1REjcHlUWGEtZJ9cm8OGcmjDqhgw1N9Q59L5Ki
   YIofE/nvqd9/RfnWi/ixJEfgGnPgfSKZ8zz//+5pBP4f6T8JwNhqoeGK4
   45EL8pLGq7LOcTew9usBRpzMUvBioeZET3bnxWTgVrlcrdXA6avQjOoEC
   +wezEb0RmarOW7eEnQLj+8SXxNa1rE6NqazWcMPRrI7dhZD+bKa8+FbIF
   vBIrMxgyu1dizm/i9vrgsTb2LBXq0qCDXIY/xVHi6idXb5D9+JunuWmYX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="355836800"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="355836800"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 18:35:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="863738180"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="863738180"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 01 Sep 2023 18:35:02 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcFXP-0001pl-34;
	Sat, 02 Sep 2023 01:34:59 +0000
Date: Sat, 2 Sep 2023 09:34:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [trondmy-nfs-2.6:testing 20/46] checkpatch: WARNING: struct
 kobj_type should normally be const
Message-ID: <202309020937.gC6KGtdK-lkp@intel.com>
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

Hi Benjamin,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   git://git.linux-nfs.org/projects/trondmy/nfs-2.6.git testing
head:   0703dc52ef0b099ba48929e25f373bc5ef436057
commit: 943aef2dbcf75f81c4574903131bd9559cee4fd1 [20/46] NFS: Open-code the nfs_kset kset_create_and_add()
:::::: branch date: 11 hours ago
:::::: commit date: 2 months ago
reproduce: (https://download.01.org/0day-ci/archive/20230902/202309020937.gC6KGtdK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309020937.gC6KGtdK-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
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
