Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793574459;
	b=HwhNNC6Xj2cB+phmv9HWUoLdd6nZX0W+bSR+W0uoR3kHqRyI/DygXJeTgPMnZuq8LPrv
	 uLfJow3pa1ppiVStbHsJE/TjPbTIYj1G4LMMnDy/hdxi0vJQnwiiwjfZuUlkxX8Ag7UrJ
	 5ZO/vcnI/2B4/SALaa7bF3lIHACmJ84RYurBY5TvyPvNn+H6t2C2+ZZdFpoX5qFMwLAts
	 IEDWFKDP2r8mTp/LzmAcpbDJa1MydkaTsHykMD0PeXSEcl32dhJpZ/GPDJZ8z2LHctB16
	 QzUZ2sh5AYyzdi7PmO/HlqJe0GWvXsjdha4KweyG5vFbvWK5FRCCSbPaFSZBUEz+zMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793574459;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=k2GtQuolCMQrJq2QyYkSBR0OW1Kmx8Jnry8C2RfwBYs=;
	b=bPOqIpypafqs3SWjqiwxBUvlOObIHfM7GGYIPmeb/l4hlTvZQNWUsZM7gFSkMMhzyaQD
	 hzwqEbUEbST8rj5WbmWO+QTKvsEk9b/o0XjSbxctCujYFeFcN7wl3BqCWTaD7Sg8j8v7c
	 qvSBRHiE4Q6Iv/XtKzUmjrL1nzAPFfPoTSvWwVj9am9KmMs0oL0/UQpkK0CbsUuS5CV9S
	 mEXVCnX7q64FyVvasdM2NFVxeldbKjZUOVY0DYv+cERSK/Toui3zY/8KEhyUxaJHmh4gs
	 TE0ONZ+z0nh+2mBLBubgMczA4pKVMVbu2vtuUNBgnPdI8p7Y/kDiTuK/S+Xhfteg/cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EdZzgkMD;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDE2606A324
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Nov 2026 23:07:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EDE2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EdZzgkMD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793574457; x=1825110457;
  h=date:from:to:cc:subject:message-id;
  bh=APl/TZVNtDjjBzO4TSWbAgY5vQspuxFeTCqc2x5TSnw=;
  b=EdZzgkMDQrPo6UZCSfoexstTWZ9w6RS5CnTTmkCozCUNY4NbrUCZIhIz
   rBQ1RKd5kwccKbx098cK1znLIc2ItLBGjU4mh1VNoh8I7j/bOY2Q8Xn4p
   yYSAhOqp0IfuOxwmnu1d+t6jxWd2aty8UTVMuMudhxUXXrzru5P9Q5wto
   /EKjGbz+xF9rKbWwS9DcGo73mT5fen1vmq+izSw1pI52oSRh887Z6T97O
   DJULg1nNSCYfifoKafrTgVJNUs3MIYaiLFl0+pi7ZA22ImXjM6UJqMTs+
   1gJSf95sdf63S6Mk3b+eyfnt1Wa5I8UkjfSzcTe2HH5uuvDRJvyxzdBNi
   A==;
X-CSE-ConnectionGUID: eEkA0al2QAStdwhfLS86tQ==
X-CSE-MsgGUID: j2NKG+WrRBK8aCAWb810hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2272880"
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="2272880"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 15:07:37 -0800
X-CSE-ConnectionGUID: Z6XRnPakQqaeYkbmt8A3cA==
X-CSE-MsgGUID: Iyg701lyS1aNXYjBopAOEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="6012122"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 01 Nov 2026 15:07:35 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNeeC-0000000086x-2FJv;
	Sun, 01 Nov 2026 23:07:32 +0000
Date: Mon, 02 Nov 2026 00:06:55 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: kernel/liveupdate/luo_file.c:558:5-13: ERROR: invalid
 reference to the index variable of the iterator on line 553
Message-ID: <202611012349.RESCKElP-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Pasha Tatashin <pasha.tatashin@soleen.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
CC: Pratyush Yadav <pratyush@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
commit: 7c722a7f44e0c1f9714084152226bc7bd644b7e3 liveupdate: luo_file: implement file systems callbacks
date:   11 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-2103-20261101 (https://download.01.org/0day-ci/archive/20261101/202611012349.RESCKElP-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7c722a7f44e0 ("liveupdate: luo_file: implement file systems callbacks")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202611012349.RESCKElP-lkp@intel.com/

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
