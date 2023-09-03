Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2ADBA42
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Sep 2023 21:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693778204; x=1725314204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TNYySjK+vT3o3UnORt96t9MR1JwGtpeSuXdO6N2X2Ho=;
  b=DCE0Zg7rZcXuYHLBWVRnpvQ6dKpm9KZkIoIWkeE4jDah6g45rV6xjRlZ
   cZ5yLf6VHc2BSkLjU4gxMvuX1opeXUnDXK/j1KvljEPz9aJcI5uhLqopg
   Tme68GGcurmLxJzsHD0oQ1cJnj+n8JZJmgRqeo0H5GrS5dW1OX6FkQoV8
   9RtBom08CYo2rYveM9ypCSmcHccsX4RPJCitKhvByKaZOjOHwXMtoKH2A
   0ROgv7Cc/hdXR6EsBF1+HSirP78vXdL3Q+AVZ3q1m2XGPHDVeqlcrbVd7
   hZEkPx0V9iy7aD2cO/Uf0nUUMzlTo9axLmzRGX7m08SLdVefDg1uxUjqd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="442880718"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="442880718"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2023 14:56:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="1071373317"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="1071373317"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 03 Sep 2023 14:56:40 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcv5C-0003RX-2D;
	Sun, 03 Sep 2023 21:56:38 +0000
Date: Mon, 4 Sep 2023 05:56:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [trondmy-nfs:testing 21/52] checkpatch: WARNING: struct kobj_type
 should normally be const
Message-ID: <202309040539.UNOMkWg8-lkp@intel.com>
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
commit: e96f9268eea626126021641eefeed02f8669f584 [21/52] NFS: Make all of /sys/fs/nfs network-namespace unique
:::::: branch date: 6 hours ago
:::::: commit date: 3 months ago
reproduce: (https://download.01.org/0day-ci/archive/20230904/202309040539.UNOMkWg8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309040539.UNOMkWg8-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: struct kobj_type should normally be const
#114: fs/nfs/sysfs.c:162:
+static struct kobj_type nfs_netns_object_type = {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
