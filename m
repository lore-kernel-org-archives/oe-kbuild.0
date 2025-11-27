Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEF51F4174
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 21:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764277475; cv=none; b=HCPGB3JaS1U63+mSUdm8Q3sUygHlSElZkDb3z7wt2V8Xk4xHSHIEE9rpIkyLJLafq5u+y1/RDbfcUsO3Wd1fREfyY/T+ygihwz0PUijH0kyTaQYzX1Yk89MwWVl5M/OtyzC6ogeaSPOsQI5FVR8Lq5MqYZIMpoepznRWtQa9pJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764277475; c=relaxed/simple;
	bh=Mrf05WIpU4P3c+U2iq9PhFINIlLkLrER3vvHIc7LhT8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k8ddgfaa95BCzSH9OjfA+YyNJ0+GzUldB00X26eRi2tgQLRYgGlpql4woysYolocSXtgBrZLgVRSSbvdXrq20PamQ/zt+7UQzouSxPnZ9TETIa7pUttBIA56DC5rUzgowLgkpylFIxZAlwOrRdehUgUESQ/MwJ88HkXXrGjuzhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OtL+HqAM; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OtL+HqAM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764277474; x=1795813474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mrf05WIpU4P3c+U2iq9PhFINIlLkLrER3vvHIc7LhT8=;
  b=OtL+HqAMIW/3xRC80DIcB9j70T+CnZQ2K8dpWF0N6ZmNBN0tuAexR25D
   9lzmFbFrvdAR3jEVNuR02CICpl+1eBKus/HLJzVOggtWEolK6eKBiKNdy
   ASG5CDOnNGAMBW/marqN+eNRNGyKXf6M8jfmDoFsD09tvJ/BxqQBxXQLf
   zIWlyCYFv/v1zLTprvee2CScTiFMXeOGdwJOtNTo7Jc/YQrEmohAUJznH
   ovXY2G9LL+mDUP/8HrwYl+VwhWiyjOwZXJKY3E6rePRxExwR8mgJfhDT6
   K3eip2xjBbZrhGrbrBjyRp29jlrH4Gwil0nGK9v9wcBwseCJuQSQ4WwuQ
   Q==;
X-CSE-ConnectionGUID: qrCsoti2R5mdTbarAncIFA==
X-CSE-MsgGUID: 3NJMwTc/T+as9wq+HqPQwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="83715160"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="83715160"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 13:04:33 -0800
X-CSE-ConnectionGUID: +umppUkLTf6ym26gaewLwQ==
X-CSE-MsgGUID: m2npOa3JQp2wful5Rqn2Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="193408526"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Nov 2025 13:04:32 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOjAD-000000005gN-3K67;
	Thu, 27 Nov 2025 21:04:29 +0000
Date: Fri, 28 Nov 2025 05:03:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 12119/12398] kernel/liveupdate/luo_file.c:558
 luo_retrieve_file() warn: iterator used outside loop: 'luo_file'
Message-ID: <202511280420.y9O4fyhX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Pasha Tatashin <pasha.tatashin@soleen.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
CC: Pratyush Yadav <pratyush@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ef68bf704646690aba5e81c2f7be8d6ef13d7ad8
commit: 3ee1d673194e5cb8955d700a6ac8e950a89cef13 [12119/12398] liveupdate: luo_file: implement file systems callbacks
:::::: branch date: 18 hours ago
:::::: commit date: 25 hours ago
config: x86_64-randconfig-161-20251127 (https://download.01.org/0day-ci/archive/20251128/202511280420.y9O4fyhX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511280420.y9O4fyhX-lkp@intel.com/

smatch warnings:
kernel/liveupdate/luo_file.c:558 luo_retrieve_file() warn: iterator used outside loop: 'luo_file'

vim +/luo_file +558 kernel/liveupdate/luo_file.c

3ee1d673194e5c Pasha Tatashin 2025-11-25  517  
3ee1d673194e5c Pasha Tatashin 2025-11-25  518  /**
3ee1d673194e5c Pasha Tatashin 2025-11-25  519   * luo_retrieve_file - Restores a preserved file from a file_set by its token.
3ee1d673194e5c Pasha Tatashin 2025-11-25  520   * @file_set: The file_set from which to retrieve the file.
3ee1d673194e5c Pasha Tatashin 2025-11-25  521   * @token:    The unique token identifying the file to be restored.
3ee1d673194e5c Pasha Tatashin 2025-11-25  522   * @filep:    Output parameter; on success, this is populated with a pointer
3ee1d673194e5c Pasha Tatashin 2025-11-25  523   *            to the newly retrieved 'struct file'.
3ee1d673194e5c Pasha Tatashin 2025-11-25  524   *
3ee1d673194e5c Pasha Tatashin 2025-11-25  525   * This function is the primary mechanism for recreating a file in the new
3ee1d673194e5c Pasha Tatashin 2025-11-25  526   * kernel after a live update. It searches the file_set's list of deserialized
3ee1d673194e5c Pasha Tatashin 2025-11-25  527   * files for an entry matching the provided @token.
3ee1d673194e5c Pasha Tatashin 2025-11-25  528   *
3ee1d673194e5c Pasha Tatashin 2025-11-25  529   * The operation is idempotent: if a file has already been successfully
3ee1d673194e5c Pasha Tatashin 2025-11-25  530   * retrieved, this function will simply return a pointer to the existing
3ee1d673194e5c Pasha Tatashin 2025-11-25  531   * 'struct file' and report success without re-executing the retrieve
3ee1d673194e5c Pasha Tatashin 2025-11-25  532   * operation. This is handled by checking the 'retrieved' flag under a lock.
3ee1d673194e5c Pasha Tatashin 2025-11-25  533   *
3ee1d673194e5c Pasha Tatashin 2025-11-25  534   * File retrieval can happen in any order; it is not bound by the order of
3ee1d673194e5c Pasha Tatashin 2025-11-25  535   * preservation.
3ee1d673194e5c Pasha Tatashin 2025-11-25  536   *
3ee1d673194e5c Pasha Tatashin 2025-11-25  537   * Context: Can be called from an ioctl or other in-kernel code in the new
3ee1d673194e5c Pasha Tatashin 2025-11-25  538   *          kernel.
3ee1d673194e5c Pasha Tatashin 2025-11-25  539   * Return: 0 on success. Returns a negative errno on failure:
3ee1d673194e5c Pasha Tatashin 2025-11-25  540   *         -ENOENT if no file with the matching token is found.
3ee1d673194e5c Pasha Tatashin 2025-11-25  541   *         Any error code returned by the handler's .retrieve() op.
3ee1d673194e5c Pasha Tatashin 2025-11-25  542   */
3ee1d673194e5c Pasha Tatashin 2025-11-25  543  int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
3ee1d673194e5c Pasha Tatashin 2025-11-25  544  		      struct file **filep)
3ee1d673194e5c Pasha Tatashin 2025-11-25  545  {
3ee1d673194e5c Pasha Tatashin 2025-11-25  546  	struct liveupdate_file_op_args args = {0};
3ee1d673194e5c Pasha Tatashin 2025-11-25  547  	struct luo_file *luo_file;
3ee1d673194e5c Pasha Tatashin 2025-11-25  548  	int err;
3ee1d673194e5c Pasha Tatashin 2025-11-25  549  
3ee1d673194e5c Pasha Tatashin 2025-11-25  550  	if (list_empty(&file_set->files_list))
3ee1d673194e5c Pasha Tatashin 2025-11-25  551  		return -ENOENT;
3ee1d673194e5c Pasha Tatashin 2025-11-25  552  
3ee1d673194e5c Pasha Tatashin 2025-11-25  553  	list_for_each_entry(luo_file, &file_set->files_list, list) {
3ee1d673194e5c Pasha Tatashin 2025-11-25  554  		if (luo_file->token == token)
3ee1d673194e5c Pasha Tatashin 2025-11-25  555  			break;
3ee1d673194e5c Pasha Tatashin 2025-11-25  556  	}
3ee1d673194e5c Pasha Tatashin 2025-11-25  557  
3ee1d673194e5c Pasha Tatashin 2025-11-25 @558  	if (luo_file->token != token)
3ee1d673194e5c Pasha Tatashin 2025-11-25  559  		return -ENOENT;
3ee1d673194e5c Pasha Tatashin 2025-11-25  560  
3ee1d673194e5c Pasha Tatashin 2025-11-25  561  	guard(mutex)(&luo_file->mutex);
3ee1d673194e5c Pasha Tatashin 2025-11-25  562  	if (luo_file->retrieved) {
3ee1d673194e5c Pasha Tatashin 2025-11-25  563  		/*
3ee1d673194e5c Pasha Tatashin 2025-11-25  564  		 * Someone is asking for this file again, so get a reference
3ee1d673194e5c Pasha Tatashin 2025-11-25  565  		 * for them.
3ee1d673194e5c Pasha Tatashin 2025-11-25  566  		 */
3ee1d673194e5c Pasha Tatashin 2025-11-25  567  		get_file(luo_file->file);
3ee1d673194e5c Pasha Tatashin 2025-11-25  568  		*filep = luo_file->file;
3ee1d673194e5c Pasha Tatashin 2025-11-25  569  		return 0;
3ee1d673194e5c Pasha Tatashin 2025-11-25  570  	}
3ee1d673194e5c Pasha Tatashin 2025-11-25  571  
3ee1d673194e5c Pasha Tatashin 2025-11-25  572  	args.handler = luo_file->fh;
3ee1d673194e5c Pasha Tatashin 2025-11-25  573  	args.serialized_data = luo_file->serialized_data;
3ee1d673194e5c Pasha Tatashin 2025-11-25  574  	err = luo_file->fh->ops->retrieve(&args);
3ee1d673194e5c Pasha Tatashin 2025-11-25  575  	if (!err) {
3ee1d673194e5c Pasha Tatashin 2025-11-25  576  		luo_file->file = args.file;
3ee1d673194e5c Pasha Tatashin 2025-11-25  577  
3ee1d673194e5c Pasha Tatashin 2025-11-25  578  		/* Get reference so we can keep this file in LUO until finish */
3ee1d673194e5c Pasha Tatashin 2025-11-25  579  		get_file(luo_file->file);
3ee1d673194e5c Pasha Tatashin 2025-11-25  580  		*filep = luo_file->file;
3ee1d673194e5c Pasha Tatashin 2025-11-25  581  		luo_file->retrieved = true;
3ee1d673194e5c Pasha Tatashin 2025-11-25  582  	}
3ee1d673194e5c Pasha Tatashin 2025-11-25  583  
3ee1d673194e5c Pasha Tatashin 2025-11-25  584  	return err;
3ee1d673194e5c Pasha Tatashin 2025-11-25  585  }
3ee1d673194e5c Pasha Tatashin 2025-11-25  586  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
