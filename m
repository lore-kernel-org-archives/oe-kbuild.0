Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAE53C061A
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Mar 2026 08:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773219234; cv=none; b=NkMXTGgyv03jP+qJyaTE8jYzb2rUi/TRMChd9emlEIPX2/HGYlxrmTNLGvDbnv/XiBwro5lCaPdqEP4VhEQXY92mdfcH5t6KHtPaIbeuJDb9t72Hef+U6MOZH5XMfmGH6leNMZq1oO/Pnaezzp1GjOeIY3faDRa9PcZy/oCSyb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773219234; c=relaxed/simple;
	bh=7Uu7TLMlXIfDueL1wucRb3zVixAO6tkUHaMBQ/2Y6LQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Dj1FqxBsnoa3IneM79FoCADd/khrgcxxhn+FsAJIrI3ygOIAES5CjzSOwe/pk6Lfp0zus/tdcsobJfBLKUo3wHBxFBj97bbRVd8yAInuYMlmg5uJQb5VlUevvsndVGu8xXKHVtSlAQuL9Urgp6qJN5EhL9yB9XtjSs/5tDZAEV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HYDpFWoX; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HYDpFWoX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773219228; x=1804755228;
  h=date:from:to:cc:subject:message-id;
  bh=7Uu7TLMlXIfDueL1wucRb3zVixAO6tkUHaMBQ/2Y6LQ=;
  b=HYDpFWoXREakVEO5TpcG+CwHvoxC+kn0HucgZ1xsfFI4p7EEl1NsMlUa
   sXYTs3j1FF+8oxCH72aEwQhKq7PkQw5yWYjnRjVoGpsiEqSfyOsd/Hzmq
   f/gn81fJcsWlBD8NYZqTUW6ADPY3C98sp6jw1/q6CA4KWh0p4aAVRGan4
   cMViPzrJfU8x7sHdThgj/pXummyT7q4CCJduBHdwOnVAb2GhpeiW9tsQT
   efcIzGF78NL0aQRzxdYq/Bg3MMP1/GhD66nCyMEEpUZ/QICjgQy8IRgEf
   ZyMRnQZuZFbMnDjGEeqY5A3oorAmQewWXldknaYwwjzsHJEabWAHfu+t6
   Q==;
X-CSE-ConnectionGUID: dEG/9gqXSM620D93cMNQQA==
X-CSE-MsgGUID: WIl3HxvWRHeTwpv/HJfQyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="99746466"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="99746466"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 01:53:47 -0700
X-CSE-ConnectionGUID: x7wDc7V3TlaB8bj9NrJRMQ==
X-CSE-MsgGUID: TUoQDQ8zSqq2L0zOJOxYSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="246005927"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Mar 2026 01:53:46 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0FK3-000000000uF-2K6e;
	Wed, 11 Mar 2026 08:53:43 +0000
Date: Wed, 11 Mar 2026 16:53:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: kernel/liveupdate/luo_file.c:558:5-13: ERROR: invalid
 reference to the index variable of the iterator on line 553
Message-ID: <202603111600.DLzuFaV9-lkp@intel.com>
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
head:   b29fb8829bff243512bb8c8908fd39406f9fd4c3
commit: 7c722a7f44e0c1f9714084152226bc7bd644b7e3 liveupdate: luo_file: implement file systems callbacks
date:   3 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-101-20260311 (https://download.01.org/0day-ci/archive/20260311/202603111600.DLzuFaV9-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202603111600.DLzuFaV9-lkp@intel.com/

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
