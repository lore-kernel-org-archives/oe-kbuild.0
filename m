Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581D3199FBA
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Jan 2026 04:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769660348; cv=none; b=OwEzJn/dFX0Lmf7P2yrYK4JQ4uKbsQBIKiE7JhSE+OlnIBZC7PAbdVF3F09S75MpGQ5BnSs59eC24yBYOWsEhlpF5qNAWgwZimmH2Nxxx0PPDKRsVamS2f8hbNPNOvNs9+lho5CURCUkRZavE64jjzZLP0lQR5DUjJx64ibL7cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769660348; c=relaxed/simple;
	bh=4JgUWgj/S+CEW5tLFM4W2yJcgx5ZaYLz+599fUg7iqI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G259Py+Q4pu6Jlz6wc6vSPJ+IYHr/6iyq7Jz1Xt50VFuuBvUqRbB50XSiSO8VKi09ta261u4Bd60/4l+97yNSIgWS568ewgLXDcMgLVL1Dan8+fQqEforkl+Nqs8LiIgKyYCcNoWzW1wyy/ayN5doCw+HYNb5URWYbn1VvTXZQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MGyawLUp; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MGyawLUp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769660346; x=1801196346;
  h=date:from:to:cc:subject:message-id;
  bh=4JgUWgj/S+CEW5tLFM4W2yJcgx5ZaYLz+599fUg7iqI=;
  b=MGyawLUp9z59algrsecjwHUDWz5e8vs3m4J/K0X+cN9ZQ7+8v9femQky
   l6q2xI+q4khyutac+OwGyRCjadvEORaK/WGeKgEaNWfsmVnCjDHn1sJ1Y
   mPDlrmUKH1zt3DzdAaIBwxJNDPXJgkugSPSHgLakCq9RK/Yr3P2H/xutT
   q8r/Ix5VH07DsFMD9U+KsE6s+KP550wAvPSC8cLFbcurQzA7Q0F30I9+5
   VpNOzFS6PTqbNRitZropLGc/snHjsMPMaHuMtRI8CryxZr90VxuN00lF2
   RRDqwzl9djEzgonEQGtADT0C9/X35k4BEL7il8p5dbsOQ/j3CDY5KZW2a
   g==;
X-CSE-ConnectionGUID: MjQQd1uwQvu2oXkm6gM8Pw==
X-CSE-MsgGUID: ewpGWW2SRzypynMRgrDByA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="88304721"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="88304721"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 20:19:05 -0800
X-CSE-ConnectionGUID: myxHW4K3RC66RwGnccZI4A==
X-CSE-MsgGUID: 5waLlX/oRXWMc9L5mtWFMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="208555749"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 Jan 2026 20:19:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlJUi-00000000b4n-2b9n;
	Thu, 29 Jan 2026 04:19:00 +0000
Date: Thu, 29 Jan 2026 12:18:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: kernel/liveupdate/luo_file.c:558:5-13: ERROR: invalid
 reference to the index variable of the iterator on line 553
Message-ID: <202601291255.gG5uwGqX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Pasha Tatashin <pasha.tatashin@soleen.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
CC: Pratyush Yadav <pratyush@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8dfce8991b95d8625d0a1d2896e42f93b9d7f68d
commit: 7c722a7f44e0c1f9714084152226bc7bd644b7e3 liveupdate: luo_file: implement file systems callbacks
date:   9 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 9 weeks ago
config: x86_64-randconfig-r051-20260129 (https://download.01.org/0day-ci/archive/20260129/202601291255.gG5uwGqX-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202601291255.gG5uwGqX-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/liveupdate/luo_file.c:558:5-13: ERROR: invalid reference to the index variable of the iterator on line 553

vim +558 kernel/liveupdate/luo_file.c

7c722a7f44e0c1 Pasha Tatashin 2025-11-25  517  
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  518  /**
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  519   * luo_retrieve_file - Restores a preserved file from a file_set by its token.
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  520   * @file_set: The file_set from which to retrieve the file.
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  521   * @token:    The unique token identifying the file to be restored.
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  522   * @filep:    Output parameter; on success, this is populated with a pointer
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  523   *            to the newly retrieved 'struct file'.
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  524   *
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  525   * This function is the primary mechanism for recreating a file in the new
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  526   * kernel after a live update. It searches the file_set's list of deserialized
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  527   * files for an entry matching the provided @token.
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  528   *
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  529   * The operation is idempotent: if a file has already been successfully
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  530   * retrieved, this function will simply return a pointer to the existing
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  531   * 'struct file' and report success without re-executing the retrieve
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  532   * operation. This is handled by checking the 'retrieved' flag under a lock.
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  533   *
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  534   * File retrieval can happen in any order; it is not bound by the order of
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  535   * preservation.
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  536   *
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  537   * Context: Can be called from an ioctl or other in-kernel code in the new
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  538   *          kernel.
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  539   * Return: 0 on success. Returns a negative errno on failure:
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  540   *         -ENOENT if no file with the matching token is found.
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  541   *         Any error code returned by the handler's .retrieve() op.
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  542   */
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  543  int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  544  		      struct file **filep)
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  545  {
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  546  	struct liveupdate_file_op_args args = {0};
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  547  	struct luo_file *luo_file;
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  548  	int err;
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  549  
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  550  	if (list_empty(&file_set->files_list))
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  551  		return -ENOENT;
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  552  
7c722a7f44e0c1 Pasha Tatashin 2025-11-25 @553  	list_for_each_entry(luo_file, &file_set->files_list, list) {
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  554  		if (luo_file->token == token)
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  555  			break;
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  556  	}
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  557  
7c722a7f44e0c1 Pasha Tatashin 2025-11-25 @558  	if (luo_file->token != token)
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  559  		return -ENOENT;
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  560  
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  561  	guard(mutex)(&luo_file->mutex);
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  562  	if (luo_file->retrieved) {
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  563  		/*
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  564  		 * Someone is asking for this file again, so get a reference
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  565  		 * for them.
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  566  		 */
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  567  		get_file(luo_file->file);
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  568  		*filep = luo_file->file;
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  569  		return 0;
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  570  	}
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  571  
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  572  	args.handler = luo_file->fh;
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  573  	args.serialized_data = luo_file->serialized_data;
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  574  	err = luo_file->fh->ops->retrieve(&args);
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  575  	if (!err) {
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  576  		luo_file->file = args.file;
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  577  
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  578  		/* Get reference so we can keep this file in LUO until finish */
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  579  		get_file(luo_file->file);
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  580  		*filep = luo_file->file;
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  581  		luo_file->retrieved = true;
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  582  	}
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  583  
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  584  	return err;
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  585  }
7c722a7f44e0c1 Pasha Tatashin 2025-11-25  586  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
