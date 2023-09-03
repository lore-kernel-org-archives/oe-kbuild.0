Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A91CBA30
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Sep 2023 20:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693774397; x=1725310397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XKPwX09loxhVUr3v2E9tRGzVZTImpRlWKtc3xsEmO+Y=;
  b=kLQExeZbw+NIPWKrV4+lRgwb/mNQfHGtP/JQdfqcv9Q6Iu5gqE4Ez+ly
   G7NS8rryrJlqBuC1WNNGGpw7ixhXeBqVmeqiYQS2dskTKOw2QW3EKNAmS
   Ah52v06F9lucE5x23zYSyX0Z3YFMPo4NbFpaoizJqSaF9i5rdXzqf86ie
   RNqSHvsJlZMHv5PdleAp09ZLfNXlppD20CaOdxELhcy39enYIlpDOqcfH
   mtyPS8p1zNlLChCCbctaQ7F5nQKUhxBo4kldj/wPUMM0TxtPBq7we4NZU
   XSAkgY803mfYTaWQaDU6xUDWdxvomTKLsUk0VQlp5Nw45mjDMLSBNipRO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="355975773"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="355975773"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2023 13:53:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="717360776"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="717360776"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 03 Sep 2023 13:53:12 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcu5l-0003P7-2N;
	Sun, 03 Sep 2023 20:53:09 +0000
Date: Mon, 4 Sep 2023 04:52:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [trondmy-nfs-2.6:testing 20/52] checkpatch: WARNING: struct
 kobj_type should normally be const
Message-ID: <202309040425.U5xIMjCx-lkp@intel.com>
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
head:   0ca7005ee94124c49164f468a6a92007e796448c
commit: 943aef2dbcf75f81c4574903131bd9559cee4fd1 [20/52] NFS: Open-code the nfs_kset kset_create_and_add()
:::::: branch date: 5 hours ago
:::::: commit date: 3 months ago
reproduce: (https://download.01.org/0day-ci/archive/20230904/202309040425.U5xIMjCx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309040425.U5xIMjCx-lkp@intel.com/

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
