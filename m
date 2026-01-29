Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381DB2D8DDB
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Jan 2026 05:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769665393; cv=none; b=h8sLmW4D4iiBwMhuOCJztgDI3preIjbcQW4KqQXXM5F1a/VSt9N423AxrZzWt3RhQgZkqZV7Jz+ypua8QqyD3uPQOJTYgNwVS68YzrPymSoXA5FnstGfPvcZz9tgfrXJi5FW0VG5m+BKe8Ut0KO6uV9kahQ8MQmHNLSIyFHXbRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769665393; c=relaxed/simple;
	bh=VIz/4UxjlCcPE5xgOTkLwntGq3iU5FVs3GN3zTf4MBE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QmYwrbLA1R+WAA+nlrOIk2MP7deCXDujwTv5P3JEAwXdOXdip1YD2dNkD/lbCUHHbWjUvlSeZ9iZr/SSCFpOwgYkZrDq8MVkb2X1kQ3Ck09K2cmMuORm7XKRn8vqaGGp88U/LKmBydSB1VoDHQIlOX6HUrGRErE99lXK6v1w8hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UtgC9nsa; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UtgC9nsa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769665391; x=1801201391;
  h=date:from:to:cc:subject:message-id;
  bh=VIz/4UxjlCcPE5xgOTkLwntGq3iU5FVs3GN3zTf4MBE=;
  b=UtgC9nsa8pqcg6bTqNe/bX2vTwxwHeP6hNfNNWGm6GcPwf4OHCBmm8pJ
   gG2WNRXceUmRewRbm71Cvho3lz6W74QnGAt0d6v8COeMQtK9qphSoXK6w
   BXy8PUIKWGi23h52F5TkH1Ks9V8Fop+nXw+cbRD1x3qn1vGjAkfGu+W75
   n9h8GiGd0d0o1Y0zQM9bTpxoUEeRmmShbOAH/Qe80zBqq0I6AxvZLWLsg
   q0dPdkvRFYRq0zwnWXQB/95ruVcyYAJQkLsjgdhy1yqtk9sGzFEMG0GZQ
   ljk+OOqs8fR+y7wC4GdUgl64CazAqu1/JqwFiCetr+T6MqzWgj+f3ch1b
   Q==;
X-CSE-ConnectionGUID: vRAY5DlDQ9yV6LuCyWg3Cg==
X-CSE-MsgGUID: NXelncCDRMuJ+2b0RGkulw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="58472854"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="58472854"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 21:43:10 -0800
X-CSE-ConnectionGUID: NvdTzrU9Rw6keBUiDwNEQw==
X-CSE-MsgGUID: Bfj0IOPtSk+rjnucLcOw1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="207587745"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Jan 2026 21:43:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlKo6-00000000b8W-2AkV;
	Thu, 29 Jan 2026 05:43:06 +0000
Date: Thu, 29 Jan 2026 13:42:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpirko-mlxsw:combined_queue 10/10]
 drivers/net/ethernet/marvell/mvneta.c:2678:25: sparse: sparse: unsigned value
 that used to be signed checked against zero?
Message-ID: <202601291340.rvErLya3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/net/ethernet/marvell/mvneta.c:2678:25: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ido Schimmel <idosch@nvidia.com>
CC: Petr Machata <petrm@nvidia.com>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   1c9a36be08e2ec0df08adea5af77949513a5e13d
commit: 1c9a36be08e2ec0df08adea5af77949513a5e13d [10/10] TMP: Revert "module: Add compile-time check for embedded NUL characters"
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: hexagon-randconfig-r121-20260129 (https://download.01.org/0day-ci/archive/20260129/202601291340.rvErLya3-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601291340.rvErLya3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601291340.rvErLya3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/marvell/mvneta.c:2678:25: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/net/ethernet/marvell/mvneta.c:2678:48: sparse: signed value source

vim +2678 drivers/net/ethernet/marvell/mvneta.c

c5aff18204da02 Thomas Petazzoni      2012-08-17  2671  
33f4cefb26e98c Russell King (Oracle  2023-05-10  2672) static void mvneta_free_tso_hdrs(struct mvneta_port *pp,
33f4cefb26e98c Russell King (Oracle  2023-05-10  2673) 				 struct mvneta_tx_queue *txq)
33f4cefb26e98c Russell King (Oracle  2023-05-10  2674) {
33f4cefb26e98c Russell King (Oracle  2023-05-10  2675) 	struct device *dev = pp->dev->dev.parent;
33f4cefb26e98c Russell King (Oracle  2023-05-10  2676) 	int i;
33f4cefb26e98c Russell King (Oracle  2023-05-10  2677) 
33f4cefb26e98c Russell King (Oracle  2023-05-10 @2678) 	for (i = 0; i < MVNETA_MAX_TSO_PAGES; i++) {
33f4cefb26e98c Russell King (Oracle  2023-05-10  2679) 		if (txq->tso_hdrs[i]) {
33f4cefb26e98c Russell King (Oracle  2023-05-10  2680) 			dma_free_coherent(dev, MVNETA_TSO_PAGE_SIZE,
33f4cefb26e98c Russell King (Oracle  2023-05-10  2681) 					  txq->tso_hdrs[i],
33f4cefb26e98c Russell King (Oracle  2023-05-10  2682) 					  txq->tso_hdrs_phys[i]);
33f4cefb26e98c Russell King (Oracle  2023-05-10  2683) 			txq->tso_hdrs[i] = NULL;
33f4cefb26e98c Russell King (Oracle  2023-05-10  2684) 		}
33f4cefb26e98c Russell King (Oracle  2023-05-10  2685) 	}
33f4cefb26e98c Russell King (Oracle  2023-05-10  2686) }
33f4cefb26e98c Russell King (Oracle  2023-05-10  2687) 

:::::: The code at line 2678 was first introduced by commit
:::::: 33f4cefb26e98c3cfe68ee7c88b766aa786b8733 net: mvneta: allocate TSO header DMA memory in chunks

:::::: TO: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
:::::: CC: Paolo Abeni <pabeni@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
