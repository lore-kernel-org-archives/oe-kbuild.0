Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAE4BA3F
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Sep 2023 21:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693778202; x=1725314202;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yvFJvyOq4ddvmDqU4UgMswY5fZ3JaWzkyKrX/vmWbm0=;
  b=QqyLZvfsHLnodxwTDDbgZ4kV7g8FAISlxeaO+553mFTYY3IiF92mKG/Y
   5nk5WUGbpVQkOisYkx0Hrg4S9eNATX0Wc2xWMzbmMBbiehPtTYOvjVnGa
   TwG2u81+zMlqH8lmPT+M7AOPhLt5Nykx1I4vxDPTUhHmL+sCWlTBgvOP6
   foHX9td/RX+jMEEQ8ivIGVvqPpV3RgI+ERWKMHi7iXWNMNY85wkW1soGM
   rV9/s+pIHlqUO0am+NFTsqvj6d3Up79tbeHkZyOSUt3TY0Bqv0VmZ0E6/
   /nC6YQxacvwZu381M3Wk2f5t68hdHaF498QBxMJzUVH2J8ScM7LLr/+Y8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="442880717"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="442880717"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2023 14:56:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="1071373315"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="1071373315"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 03 Sep 2023 14:56:40 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcv5C-0003RR-1w;
	Sun, 03 Sep 2023 21:56:38 +0000
Date: Mon, 4 Sep 2023 05:56:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [trondmy-nfs:testing 22/52] checkpatch: WARNING: struct kobj_type
 should normally be const
Message-ID: <202309040546.dyXxfHJk-lkp@intel.com>
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

tree:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git testing
head:   0ca7005ee94124c49164f468a6a92007e796448c
commit: 1c7251187dc067a6d460cf33ca67da9c1dd87807 [22/52] NFS: add superblock sysfs entries
:::::: branch date: 6 hours ago
:::::: commit date: 3 months ago
reproduce: (https://download.01.org/0day-ci/archive/20230904/202309040546.dyXxfHJk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309040546.dyXxfHJk-lkp@intel.com/

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
