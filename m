Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3C318CC13
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 23:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764198701; cv=none; b=MCWQ4R6B33Q7DIsZv2c03Ng29XVI2PDUb7PcoRvsofRRo1t/p5glrUQ6rwB1/K5f0paqYBuhySCrChf5rStKWhvTih8S8sr7qdnI6ciJg3O9PZffZSTy/Zw56M0smjx5mwSXt84TO7tvdh3+i06VxeHgeTK7KyW3pb8mTslcTFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764198701; c=relaxed/simple;
	bh=UxpGmC4Tl/snU6aYF4cCC1/8jsGgIy2ly4YQ4fBEX28=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pJH/zMRbEY7P71xMw70NeveEytaZMJH2wjJXSACXjFbGJ9rSrF/GbjQ50sX5e/pmDZdka/VrHRYdVTZHU5BvZ3N6ajSFp518yxQVhHCe5at9alGewXZN7vLsKduQwClnpm97PsMWbz2cVdHHXoQfqAyCfZ4dIDXdjLrMdwVTgQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fOrz5OIe; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fOrz5OIe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764198700; x=1795734700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UxpGmC4Tl/snU6aYF4cCC1/8jsGgIy2ly4YQ4fBEX28=;
  b=fOrz5OIeX3wRwrs+DeZWLN/vS3p/gbRgotXc8ukn2ltxH0MnAtwX+Rtu
   JmYCCkPxZFN0TDcW0dDjtoxda8SQaEkOnmlIq2bl9iZ86HLbM4swTYdxw
   BZoO0vCAtUoTNKYrLTMTepfBhFw4iG2rdCvCI8cg+IBkJObkJNsiLUod2
   Rfsk1RZWZdiiIpZ3K/OvP6u8k/Z4MvW2KNBwQ55By8/gKG8WVbGPl5a/Z
   8kg9jOXUU8CkOgL5dWVV5BPYZr/OqZ5H+QoGkcpazdYpPabZ4pv8h/ggZ
   4nj59CaSymnFYLGtn7qp1YPKBE8rYX+EDqTa23FMf/6A6BzhW6+iskX41
   Q==;
X-CSE-ConnectionGUID: 0EQic94TQtaYpktQEjDzTQ==
X-CSE-MsgGUID: rK/BUIT1T5GSrSXqPshm4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66285153"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="66285153"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 15:11:39 -0800
X-CSE-ConnectionGUID: J62QlYFtS06IzKbV8xbwQA==
X-CSE-MsgGUID: 7VlSPA6vTg2y4ktuKh8RWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="224030356"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 26 Nov 2025 15:11:30 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOOfY-000000001Xl-3Ub0;
	Wed, 26 Nov 2025 23:11:28 +0000
Date: Thu, 27 Nov 2025 00:10:45 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android-mainline 7/7] Warning:
 drivers/dma-buf/dma-heap.c:45 struct member 'heap_devt' not described in
 'dma_heap'
Message-ID: <202511270020.i0hE3fN8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Carlos,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   fa069b23a1089a249dc0ef7ebdc816c7b2a41266
commit: a5f9b0171db0c1e78d2c8da744f82ee20b2064fb [7/7] Merge 3e443d167327 ("Merge tag 'docs-6.16' of git://git.lwn.net/linux") into android-mainline
:::::: branch date: 12 hours ago
:::::: commit date: 5 months ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251127/202511270020.i0hE3fN8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511270020.i0hE3fN8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511270020.i0hE3fN8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/dma-buf/dma-heap.c:45 struct member 'heap_devt' not described in 'dma_heap'
>> Warning: drivers/dma-buf/dma-heap.c:45 struct member 'list' not described in 'dma_heap'
>> Warning: drivers/dma-buf/dma-heap.c:45 struct member 'heap_cdev' not described in 'dma_heap'
>> Warning: drivers/dma-buf/dma-heap.c:45 struct member 'refcount' not described in 'dma_heap'
>> Warning: drivers/dma-buf/dma-heap.c:45 struct member 'heap_dev' not described in 'dma_heap'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
