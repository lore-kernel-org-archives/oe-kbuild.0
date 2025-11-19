Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55252327204
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Nov 2025 23:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763593854; cv=none; b=u/a/zOgNzXipAF8wrYc9Y2RiNhtWw2X9SX6NK+EsUGkmkB1EHKgJ2Q9P+vVZUl7/raLZwBjd1vpmfOX7AfZgeyQiKLZc4jRjjgeLAW8epUEYC8waQDdITCLRpqc+T6sn/7SAhT+NkpMVBENJNNWY7NlI+Uv8QCNIo664wIbB7x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763593854; c=relaxed/simple;
	bh=kLgPf8w9UKE29u6TxJWU8TkcOKUkSZOyVGIIN5jdseI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qPa5zjjgoYTw6IawX9ptQHsOfZ29QzC3Nl2UEguppSVUCgYH18YC22si6swyKyWkiby5WbZFLtlf08GhUa6RrQh5siYwxMtaRI5fZJTaMbDkcD6BFDiR+4CAqYJZ6sww2Ca7PAgfh8IjXEu9LUX1nGfBhoYw3ea9/w6YwVSjhyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M7mRCNPY; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M7mRCNPY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763593852; x=1795129852;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kLgPf8w9UKE29u6TxJWU8TkcOKUkSZOyVGIIN5jdseI=;
  b=M7mRCNPYU3pfHQxz97fQdO4hWh1QqCv+TtUrRN85fj4ARrfRLIngHoZG
   LjAuW3LTCEgmbvwtAJ0u8AK269sZEKIDMsU+zY+I4vAhUdmvuz4lGLRbz
   lf0R3HwZFGBCO6gWEHBAl7ZlJpskbfPLf4HPi9Kz+bnR4XeR0VnWSA0l2
   TWfnQGNJzq87UvtMRqZD3MNFkRlLyRT7N3w7aXRgVvOoJRkXJ5UaOV4Uc
   y7i2AL2T+VWx1rt9JVbensalO/49HIPu4jsn+S/qgk9GdMDtLGtKxRQSA
   00oyXkTdvuIU82GaItkddOhozodNmztti15y9gJf3TAcb+zBcfSjAdbIu
   Q==;
X-CSE-ConnectionGUID: Z1YnfuigSrWyEB8sFO799A==
X-CSE-MsgGUID: oz7C+Kn9TfqidqxNjYGJcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65354399"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="65354399"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 15:10:52 -0800
X-CSE-ConnectionGUID: 97LxC2RdQyqCJgXPUPMWKg==
X-CSE-MsgGUID: Q+wGKIvLT6CfYxTp27lIRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="191990176"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 Nov 2025 15:10:50 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLrK4-0003P7-1c;
	Wed, 19 Nov 2025 23:10:48 +0000
Date: Thu, 20 Nov 2025 07:10:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 12/24] ext4: support large block size in
 ext4_mb_get_buddy_page_lock()
Message-ID: <202511200609.Dr6Z9Oki-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251111142634.3301616-13-libaokun@huaweicloud.com>
References: <20251111142634.3301616-13-libaokun@huaweicloud.com>
TO: libaokun@huaweicloud.com
TO: linux-ext4@vger.kernel.org
CC: tytso@mit.edu
CC: adilger.kernel@dilger.ca
CC: jack@suse.cz
CC: linux-kernel@vger.kernel.org
CC: kernel@pankajraghav.com
CC: mcgrof@kernel.org
CC: ebiggers@kernel.org
CC: willy@infradead.org
CC: yi.zhang@huawei.com
CC: yangerkun@huawei.com
CC: chengzhihao1@huawei.com
CC: libaokun1@huawei.com
CC: libaokun@huaweicloud.com

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tytso-ext4/dev]
[also build test WARNING on linus/master v6.18-rc6 next-20251119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/libaokun-huaweicloud-com/ext4-remove-page-offset-calculation-in-ext4_block_zero_page_range/20251111-224944
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
patch link:    https://lore.kernel.org/r/20251111142634.3301616-13-libaokun%40huaweicloud.com
patch subject: [PATCH v3 12/24] ext4: support large block size in ext4_mb_get_buddy_page_lock()
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: loongarch-randconfig-r071-20251118 (https://download.01.org/0day-ci/archive/20251120/202511200609.Dr6Z9Oki-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511200609.Dr6Z9Oki-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511200609.Dr6Z9Oki-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/ext4/mballoc.o: warning: objtool: mb_find_order_for_block+0x7c: unreachable instruction
   fs/ext4/mballoc.o: warning: objtool: ext4_mb_good_group+0xb0: unreachable instruction
   fs/ext4/mballoc.o: warning: objtool: mb_find_extent+0x78: unreachable instruction
   fs/ext4/mballoc.o: warning: objtool: ext4_mb_use_inode_pa+0x168: unreachable instruction
   fs/ext4/mballoc.o: warning: objtool: ext4_mb_pa_adjust_overlap+0x164: unreachable instruction
   fs/ext4/mballoc.o: warning: objtool: ext4_mb_pa_free+0x1c: unreachable instruction
   fs/ext4/mballoc.o: warning: objtool: ext4_mb_normalize_request.constprop.0+0x3d8: unreachable instruction
   fs/ext4/mballoc.o: warning: objtool: ext4_mb_use_preallocated+0x234: unreachable instruction
>> fs/ext4/mballoc.o: warning: objtool: ext4_mb_get_buddy_folio_lock+0x1c0: unreachable instruction
   fs/ext4/mballoc.o: warning: objtool: ext4_mb_new_inode_pa+0x54: unreachable instruction
   fs/ext4/mballoc.o: warning: objtool: ext4_mb_free_metadata+0x58: unreachable instruction
   fs/ext4/mballoc.o: warning: objtool: ext4_mb_new_group_pa+0x44: unreachable instruction
   fs/ext4/mballoc.o: warning: objtool: ext4_mb_init_cache+0x388: unreachable instruction
   fs/ext4/mballoc.o: warning: objtool: mb_mark_used+0x70: unreachable instruction
   fs/ext4/mballoc.o: warning: objtool: ext4_mb_use_best_found+0x44: unreachable instruction
   fs/ext4/mballoc.o: warning: objtool: ext4_mb_find_by_goal+0x1d0: unreachable instruction
   fs/ext4/mballoc.o: warning: objtool: ext4_mb_simple_scan_group+0x1e8: unreachable instruction
   fs/ext4/mballoc.o: warning: objtool: ext4_mb_complex_scan_group+0x23c: unreachable instruction
   fs/ext4/mballoc.o: warning: objtool: ext4_mb_release_inode_pa+0xbc: unreachable instruction
   fs/ext4/mballoc.o: warning: objtool: ext4_mb_mark_diskspace_used+0x4c: unreachable instruction
   fs/ext4/mballoc.o: warning: objtool: ext4_discard_preallocations+0x224: unreachable instruction
   fs/ext4/mballoc.o: warning: objtool: ext4_free_blocks+0x1e8: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
