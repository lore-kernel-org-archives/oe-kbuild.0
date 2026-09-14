Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176291E1024
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Sep 2026 06:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789367584; cv=none; b=ewqTk3szCx7zIM/nEmXK18PUPYFX/GjAbKeYc4iqwKULawtiOZyXFeXeKUhR9pwpSetRm7NQq9OrRsXqQgCFRpbos/zpDR3FEO2+12oWq4ydLqYQQYQ7WP4wt/r6HHLwldhx9OlEFSUsS0v9rOAbIw0Aul/4H5PFvyc7iRLOP5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789367584; c=relaxed/simple;
	bh=o4hnq+d7fQXcHTw6EKBifzU37tKf9VR2xYiauvxltcA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U3UT461wcYhU40eQ97o8VbUMfLdWQbtC4SUCFYdstvih3Gy8lTtck/R58Zkpr2ZFrcRmU6PNctYBI6DDw823XcYperVzA/5Lzi0tBRD/OLoq/3M9X4OiOTcTsgCJGEL+j4bG2M2bC5n86y94WEh7DT1WKXub1IAutni7T+jksE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PH3v7aDU; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PH3v7aDU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789367582; x=1820903582;
  h=date:from:to:cc:subject:message-id;
  bh=o4hnq+d7fQXcHTw6EKBifzU37tKf9VR2xYiauvxltcA=;
  b=PH3v7aDUkH5P64mgzREdTq9xgqS1o+GgwVuiWGAbBHup+YZzt2w1aEfQ
   Im8gIlQvyXTEAEkTQbNWm0FH6ObA4RnVt5BaYpGQcbcl5Dw3AwFjliH5D
   X8sSkCnWs9m/koDb3uBudLkNz+tyuv5k7nTnG6+lNZ7oS+aAoTDzDmFVi
   yFuYfpNgU9ZQSnOp40adpO2WEctyjgSnMLl/i90waYz62VpL7JO5O4z8h
   emcBw+7P0ecg0J5xKeRMhxrzyen2wLzLS+Wc/HfnvReaEfrTYREwi7B4W
   fB8jFLbVZ/kAXJLheWMxNzAcuEuuJRYsregblrvq1peBf5IrMgonMwFdc
   Q==;
X-CSE-ConnectionGUID: R5u+W4VETdGrYZRL2tWmrw==
X-CSE-MsgGUID: 1xPlgGcTRzmMAFrnCj8FUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="88858018"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="88858018"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 23:33:02 -0700
X-CSE-ConnectionGUID: DtKXoJ6OTVizbQDKs3FvLA==
X-CSE-MsgGUID: WjIASl5VQsO0SwTYUTk1Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="276071053"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 13 Sep 2026 23:33:00 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x60FM-0000000006F-3r8V;
	Mon, 14 Sep 2026 06:32:56 +0000
Date: Mon, 14 Sep 2026 08:32:42 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: kernel/liveupdate/luo_file.c:607:15-23: ERROR: invalid
 reference to the index variable of the iterator on line 597
Message-ID: <202609140828.K6j759OF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Evangelos Petrongonas <epetron@amazon.de>
CC: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
CC: Michal Clapinski <mclapinski@google.com>
CC: "Pratyush Yadav (Google)" <pratyush@kernel.org>
CC: Pasha Tatashin <pasha.tatashin@soleen.com>

Hi Evangelos,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   704340f1cd0dcef829eb62f5b48ae95a2ce17bdf
commit: c6073743d0c7f011461bc542c9112180471affad kho: make preserved pages compatible with deferred struct page init
date:   4 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-103-20260914 (https://download.01.org/0day-ci/archive/20260914/202609140828.K6j759OF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c6073743d0c7 ("kho: make preserved pages compatible with deferred struct page init")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202609140828.K6j759OF-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/liveupdate/luo_file.c:607:15-23: ERROR: invalid reference to the index variable of the iterator on line 597

vim +607 kernel/liveupdate/luo_file.c

7c722a7f44e0c1 Pasha Tatashin          2025-11-25  560  
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  561  /**
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  562   * luo_retrieve_file - Restores a preserved file from a file_set by its token.
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  563   * @file_set: The file_set from which to retrieve the file.
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  564   * @token:    The unique token identifying the file to be restored.
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  565   * @filep:    Output parameter; on success, this is populated with a pointer
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  566   *            to the newly retrieved 'struct file'.
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  567   *
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  568   * This function is the primary mechanism for recreating a file in the new
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  569   * kernel after a live update. It searches the file_set's list of deserialized
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  570   * files for an entry matching the provided @token.
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  571   *
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  572   * The operation is idempotent: if a file has already been successfully
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  573   * retrieved, this function will simply return a pointer to the existing
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  574   * 'struct file' and report success without re-executing the retrieve
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  575   * operation. This is handled by checking the 'retrieved' flag under a lock.
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  576   *
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  577   * File retrieval can happen in any order; it is not bound by the order of
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  578   * preservation.
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  579   *
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  580   * Context: Can be called from an ioctl or other in-kernel code in the new
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  581   *          kernel.
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  582   * Return: 0 on success. Returns a negative errno on failure:
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  583   *         -ENOENT if no file with the matching token is found.
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  584   *         Any error code returned by the handler's .retrieve() op.
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  585   */
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  586  int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  587  		      struct file **filep)
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  588  {
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  589  	struct liveupdate_file_op_args args = {0};
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  590  	struct luo_file *luo_file;
b2135d1cb0e368 Dan Carpenter           2025-11-28  591  	bool found = false;
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  592  	int err;
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  593  
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  594  	if (list_empty(&file_set->files_list))
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  595  		return -ENOENT;
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  596  
7c722a7f44e0c1 Pasha Tatashin          2025-11-25 @597  	list_for_each_entry(luo_file, &file_set->files_list, list) {
b2135d1cb0e368 Dan Carpenter           2025-11-28  598  		if (luo_file->token == token) {
b2135d1cb0e368 Dan Carpenter           2025-11-28  599  			found = true;
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  600  			break;
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  601  		}
b2135d1cb0e368 Dan Carpenter           2025-11-28  602  	}
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  603  
b2135d1cb0e368 Dan Carpenter           2025-11-28  604  	if (!found)
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  605  		return -ENOENT;
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  606  
7c722a7f44e0c1 Pasha Tatashin          2025-11-25 @607  	guard(mutex)(&luo_file->mutex);
f85b1c6af5bc38 Pratyush Yadav (Google  2026-02-16  608) 	if (luo_file->retrieve_status < 0) {
f85b1c6af5bc38 Pratyush Yadav (Google  2026-02-16  609) 		/* Retrieve was attempted and it failed. Return the error code. */
f85b1c6af5bc38 Pratyush Yadav (Google  2026-02-16  610) 		return luo_file->retrieve_status;
f85b1c6af5bc38 Pratyush Yadav (Google  2026-02-16  611) 	}
f85b1c6af5bc38 Pratyush Yadav (Google  2026-02-16  612) 
f85b1c6af5bc38 Pratyush Yadav (Google  2026-02-16  613) 	if (luo_file->retrieve_status > 0) {
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  614  		/*
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  615  		 * Someone is asking for this file again, so get a reference
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  616  		 * for them.
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  617  		 */
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  618  		get_file(luo_file->file);
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  619  		*filep = luo_file->file;
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  620  		return 0;
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  621  	}
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  622  
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  623  	args.handler = luo_file->fh;
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  624  	args.serialized_data = luo_file->serialized_data;
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  625  	err = luo_file->fh->ops->retrieve(&args);
f85b1c6af5bc38 Pratyush Yadav (Google  2026-02-16  626) 	if (err) {
f85b1c6af5bc38 Pratyush Yadav (Google  2026-02-16  627) 		/* Keep the error code for later use. */
f85b1c6af5bc38 Pratyush Yadav (Google  2026-02-16  628) 		luo_file->retrieve_status = err;
f85b1c6af5bc38 Pratyush Yadav (Google  2026-02-16  629) 		return err;
f85b1c6af5bc38 Pratyush Yadav (Google  2026-02-16  630) 	}
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  631  
f85b1c6af5bc38 Pratyush Yadav (Google  2026-02-16  632) 	luo_file->file = args.file;
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  633  	/* Get reference so we can keep this file in LUO until finish */
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  634  	get_file(luo_file->file);
00d0b372374f25 Pasha Tatashin          2026-03-26  635  
00d0b372374f25 Pasha Tatashin          2026-03-26  636  	WARN_ON(xa_insert(&luo_preserved_files,
00d0b372374f25 Pasha Tatashin          2026-03-26  637  			  luo_get_id(luo_file->fh, luo_file->file),
00d0b372374f25 Pasha Tatashin          2026-03-26  638  			  luo_file->file, GFP_KERNEL));
00d0b372374f25 Pasha Tatashin          2026-03-26  639  
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  640  	*filep = luo_file->file;
f85b1c6af5bc38 Pratyush Yadav (Google  2026-02-16  641) 	luo_file->retrieve_status = 1;
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  642  
f85b1c6af5bc38 Pratyush Yadav (Google  2026-02-16  643) 	return 0;
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  644  }
7c722a7f44e0c1 Pasha Tatashin          2025-11-25  645  

:::::: The code at line 607 was first introduced by commit
:::::: 7c722a7f44e0c1f9714084152226bc7bd644b7e3 liveupdate: luo_file: implement file systems callbacks

:::::: TO: Pasha Tatashin <pasha.tatashin@soleen.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
