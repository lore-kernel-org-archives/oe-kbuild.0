Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133CB12BEA6
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Mar 2024 14:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711462375; cv=none; b=kObIFl1Z2NLxeNbnLjGnnsmuddUv/9aQwF+Q5zxj1IH9ZjNgXTtzXDb9W9rcWNS8U31pzr/iuJtSuJRG3Dvyq21pe5aeJRiX5EYeG0yO383Q9GfBoVZT7h47m+hqA5edGiCKOxs2e9yqEi/I6M5iBjbJvjjl2KvMtxMexqPiRXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711462375; c=relaxed/simple;
	bh=pfEfI4pXxuRdxTlJhZJAysUgXgYSvYdBrxyxih3iqe8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OUfHruo/GVW+6YARLINg1lcYBeiK22qVFJaRb7068/bXhPARGjpBASB5g5ja5KXUzsVsCIJb2O6yvZandDCjHhQwTJWEYuZDvFsJPl1wKnhoVX1Bhqb9qU20jQjxBhwh4YoQnE6AkBRsUkrEnIo53vUjKtTUhOmW1XrS6orjQY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GSo6Rzh9; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GSo6Rzh9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711462372; x=1742998372;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pfEfI4pXxuRdxTlJhZJAysUgXgYSvYdBrxyxih3iqe8=;
  b=GSo6Rzh9W+9PCYt/GlhSZcbc3cJSPiCKbQLajS59f4B6qt3uTKxNuNa6
   W9xeq5R6FUJHx3PkC4U4f98vOedtqdTNG+wB0OnsnFWIsYwd9ke6h+lK0
   Ed9biJzFpxW6DGEs/1/wD6IlsPigxCyvB4niVf4XfN3y7b3+O1TKg0rxn
   Yioip9wbx8dPbge1LHHsgzAmZNXIXBqBzLpNk6qmDKCkCDIz6kws3FVzl
   DAvkTMyGcTK72R1fQ68c4JmzU2CyNvBwWDoXotCU/+DZUQhma/8onnpWn
   OQEtnK0PzmnHlhYvBcQxYQ2D5siPtNxK4s0IB5qzihlRZS7DPsc+rTrxi
   A==;
X-CSE-ConnectionGUID: 64LLSgD3SxufM4edumoN4Q==
X-CSE-MsgGUID: GnqvTQGPRYeTFyWYLdufrQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6620975"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="6620975"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 07:12:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="16617489"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Mar 2024 07:12:49 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rp7Xi-000079-21;
	Tue, 26 Mar 2024 14:12:46 +0000
Date: Tue, 26 Mar 2024 22:11:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>,
	Elena Reshetova <elena.reshetova@intel.com>
Subject: Re: [PATCH v2 08/28] block: Use a mempool to allocate zone write
 plugs
Message-ID: <202403262119.L0zcZoEd-lkp@intel.com>
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
In-Reply-To: <20240325044452.3125418-9-dlemoal@kernel.org>
References: <20240325044452.3125418-9-dlemoal@kernel.org>
TO: Damien Le Moal <dlemoal@kernel.org>
TO: linux-block@vger.kernel.org
TO: Jens Axboe <axboe@kernel.dk>
TO: linux-scsi@vger.kernel.org
TO: "Martin K . Petersen" <martin.petersen@oracle.com>
TO: dm-devel@lists.linux.dev
TO: Mike Snitzer <snitzer@redhat.com>
CC: Christoph Hellwig <hch@lst.de>

Hi Damien,

kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on device-mapper-dm/for-next mkp-scsi/for-next linus/master v6.9-rc1 next-20240326]
[cannot apply to jejb-scsi/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Damien-Le-Moal/block-Restore-sector-of-flush-requests/20240325-205923
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20240325044452.3125418-9-dlemoal%40kernel.org
patch subject: [PATCH v2 08/28] block: Use a mempool to allocate zone write plugs
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: x86_64-randconfig-102-20240326 (https://download.01.org/0day-ci/archive/20240326/202403262119.L0zcZoEd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202403262119.L0zcZoEd-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> block/blk-zoned.c:574:5-24: WARNING: atomic_dec_and_test variation before object free at line 578.

vim +574 block/blk-zoned.c

189624acbcfc512 Damien Le Moal 2024-03-25  570  
9678de3a47d5681 Damien Le Moal 2024-03-25  571  static inline void disk_put_zone_wplug(struct gendisk *disk,
9678de3a47d5681 Damien Le Moal 2024-03-25  572  				       struct blk_zone_wplug *zwplug)
189624acbcfc512 Damien Le Moal 2024-03-25  573  {
189624acbcfc512 Damien Le Moal 2024-03-25 @574  	if (atomic_dec_and_test(&zwplug->ref)) {
189624acbcfc512 Damien Le Moal 2024-03-25  575  		WARN_ON_ONCE(!bio_list_empty(&zwplug->bio_list));
189624acbcfc512 Damien Le Moal 2024-03-25  576  		WARN_ON_ONCE(!list_empty(&zwplug->err));
189624acbcfc512 Damien Le Moal 2024-03-25  577  
9678de3a47d5681 Damien Le Moal 2024-03-25 @578  		mempool_free(zwplug, disk->zone_wplugs_pool);
189624acbcfc512 Damien Le Moal 2024-03-25  579  	}
189624acbcfc512 Damien Le Moal 2024-03-25  580  }
189624acbcfc512 Damien Le Moal 2024-03-25  581  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
