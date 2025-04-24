Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB4B215173
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Apr 2025 09:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745486641; cv=none; b=cv7sMPO+KCOr2HxSE8Ut1uV9nNuK9G2l8UpGm+qS1vH/KbhkSEpbktoa+4M8H2eoTplwAAHh4Rm8MAX6A9CQPv04mgvCFGx7279sXI1Io0ewYgVysQpT39tz4FgB0DjZNFpjAd8t5JacGhs7F00cORciF+0AmNGv385RzIvDSgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745486641; c=relaxed/simple;
	bh=gludjyDwipCJoetXG35c3OKC80L2HUe7Oc3Mhn22s3M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TE9T9+nUJlLDrS6V9nPz7loDCE0rk35sgysyNBBXoeLLFuOakON8JGKvaiI/4tfDmubcNJ4ECVzH7t4JgqPuGdifj3Jjm8zXns0vCQtzCqi3rx8NYJ9qPFH+5mTogljcqqCritTRqB0U4eUsWLIW9bJbvH3HXrHjeRVBQosGZO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m1J4XG1K; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m1J4XG1K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745486639; x=1777022639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gludjyDwipCJoetXG35c3OKC80L2HUe7Oc3Mhn22s3M=;
  b=m1J4XG1KQJl88CCTFHUaDPS9MxH7U8atLQcv5pULIFovDILxpNNhL2Nr
   jtOqJ2juyFQ6du07cPigBrHxuMS3z2y/0285JAgxgScOLBRObNFfjsYt9
   YRT9sKD6ZvFJhxFua07/kU0oyb2H0r01870tXy+sevqAEtCWO6g8ddLOQ
   yaPIZ/TiSn5b/EkJ43GvFSxR5CJqHk3JMEQPjRVMK2QwBvdiWCdNQmqCA
   M6p+TcgNWI4hvhRafVP3khYwt0S5OZnKhWZkFVIwxWNuA7kIB8TP2uQvd
   auTbJj21fIjmOUP3kIbUksA0MkFsSKB/dFLCDe3GZo9xIwnzr7MQb8a6l
   A==;
X-CSE-ConnectionGUID: oXDcA8MlRMqZ2f55RwbloA==
X-CSE-MsgGUID: 60xNh/iGTGSK/uMfVuDI4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="69594772"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="69594772"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 02:23:53 -0700
X-CSE-ConnectionGUID: 2Jkw/ZI1SjuLqlae5tYaaA==
X-CSE-MsgGUID: r5UT+TwOS1GdtasL7fkj1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="133466664"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Apr 2025 02:23:52 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7so9-000425-1r;
	Thu, 24 Apr 2025 09:23:49 +0000
Date: Thu, 24 Apr 2025 17:23:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android16-6.12-desktop 6/6]
 drivers/bluetooth/btintel_pcie.c:134 btintel_pcie_setup_dbgc() warn: right
 shifting more than type allows 32 vs 32
Message-ID: <202504241739.dTYHMKJi-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   2702b613398960226fb5496ee2b48f631186f8f1
commit: 277a489a74a56c03863c799b2d50515d9d547b90 [6/6] FROMGIT: Bluetooth: btintel_pcie: Setup buffers for firmware traces
:::::: branch date: 25 hours ago
:::::: commit date: 6 weeks ago
config: i386-randconfig-141-20250424 (https://download.01.org/0day-ci/archive/20250424/202504241739.dTYHMKJi-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504241739.dTYHMKJi-lkp@intel.com/

smatch warnings:
drivers/bluetooth/btintel_pcie.c:134 btintel_pcie_setup_dbgc() warn: right shifting more than type allows 32 vs 32

vim +134 drivers/bluetooth/btintel_pcie.c

277a489a74a56c0 Kiran K 2025-02-25   90  
277a489a74a56c0 Kiran K 2025-02-25   91  /* This function initializes the memory for DBGC buffers and formats the
277a489a74a56c0 Kiran K 2025-02-25   92   * DBGC fragment which consists header info and DBGC buffer's LSB, MSB and
277a489a74a56c0 Kiran K 2025-02-25   93   * size as the payload
277a489a74a56c0 Kiran K 2025-02-25   94   */
277a489a74a56c0 Kiran K 2025-02-25   95  static int btintel_pcie_setup_dbgc(struct btintel_pcie_data *data)
277a489a74a56c0 Kiran K 2025-02-25   96  {
277a489a74a56c0 Kiran K 2025-02-25   97  	struct btintel_pcie_dbgc_ctxt db_frag;
277a489a74a56c0 Kiran K 2025-02-25   98  	struct data_buf *buf;
277a489a74a56c0 Kiran K 2025-02-25   99  	int i;
277a489a74a56c0 Kiran K 2025-02-25  100  
277a489a74a56c0 Kiran K 2025-02-25  101  	data->dbgc.count = BTINTEL_PCIE_DBGC_BUFFER_COUNT;
277a489a74a56c0 Kiran K 2025-02-25  102  	data->dbgc.bufs = devm_kcalloc(&data->pdev->dev, data->dbgc.count,
277a489a74a56c0 Kiran K 2025-02-25  103  				       sizeof(*buf), GFP_KERNEL);
277a489a74a56c0 Kiran K 2025-02-25  104  	if (!data->dbgc.bufs)
277a489a74a56c0 Kiran K 2025-02-25  105  		return -ENOMEM;
277a489a74a56c0 Kiran K 2025-02-25  106  
277a489a74a56c0 Kiran K 2025-02-25  107  	data->dbgc.buf_v_addr = dmam_alloc_coherent(&data->pdev->dev,
277a489a74a56c0 Kiran K 2025-02-25  108  						    data->dbgc.count *
277a489a74a56c0 Kiran K 2025-02-25  109  						    BTINTEL_PCIE_DBGC_BUFFER_SIZE,
277a489a74a56c0 Kiran K 2025-02-25  110  						    &data->dbgc.buf_p_addr,
277a489a74a56c0 Kiran K 2025-02-25  111  						    GFP_KERNEL | __GFP_NOWARN);
277a489a74a56c0 Kiran K 2025-02-25  112  	if (!data->dbgc.buf_v_addr)
277a489a74a56c0 Kiran K 2025-02-25  113  		return -ENOMEM;
277a489a74a56c0 Kiran K 2025-02-25  114  
277a489a74a56c0 Kiran K 2025-02-25  115  	data->dbgc.frag_v_addr = dmam_alloc_coherent(&data->pdev->dev,
277a489a74a56c0 Kiran K 2025-02-25  116  						     sizeof(struct btintel_pcie_dbgc_ctxt),
277a489a74a56c0 Kiran K 2025-02-25  117  						     &data->dbgc.frag_p_addr,
277a489a74a56c0 Kiran K 2025-02-25  118  						     GFP_KERNEL | __GFP_NOWARN);
277a489a74a56c0 Kiran K 2025-02-25  119  	if (!data->dbgc.frag_v_addr)
277a489a74a56c0 Kiran K 2025-02-25  120  		return -ENOMEM;
277a489a74a56c0 Kiran K 2025-02-25  121  
277a489a74a56c0 Kiran K 2025-02-25  122  	data->dbgc.frag_size = sizeof(struct btintel_pcie_dbgc_ctxt);
277a489a74a56c0 Kiran K 2025-02-25  123  
277a489a74a56c0 Kiran K 2025-02-25  124  	db_frag.magic_num = BTINTEL_PCIE_MAGIC_NUM;
277a489a74a56c0 Kiran K 2025-02-25  125  	db_frag.ver = BTINTEL_PCIE_DBGC_FRAG_VERSION;
277a489a74a56c0 Kiran K 2025-02-25  126  	db_frag.total_size = BTINTEL_PCIE_DBGC_FRAG_PAYLOAD_SIZE;
277a489a74a56c0 Kiran K 2025-02-25  127  	db_frag.num_buf = BTINTEL_PCIE_DBGC_FRAG_BUFFER_COUNT;
277a489a74a56c0 Kiran K 2025-02-25  128  
277a489a74a56c0 Kiran K 2025-02-25  129  	for (i = 0; i < data->dbgc.count; i++) {
277a489a74a56c0 Kiran K 2025-02-25  130  		buf = &data->dbgc.bufs[i];
277a489a74a56c0 Kiran K 2025-02-25  131  		buf->data_p_addr = data->dbgc.buf_p_addr + i * BTINTEL_PCIE_DBGC_BUFFER_SIZE;
277a489a74a56c0 Kiran K 2025-02-25  132  		buf->data = data->dbgc.buf_v_addr + i * BTINTEL_PCIE_DBGC_BUFFER_SIZE;
277a489a74a56c0 Kiran K 2025-02-25  133  		db_frag.bufs[i].buf_addr_lsb = (u32)(buf->data_p_addr & 0xffffffff);
277a489a74a56c0 Kiran K 2025-02-25 @134  		db_frag.bufs[i].buf_addr_msb = (u32)((buf->data_p_addr >> 32) & 0xffffffff);
277a489a74a56c0 Kiran K 2025-02-25  135  		db_frag.bufs[i].buf_size = BTINTEL_PCIE_DBGC_BUFFER_SIZE;
277a489a74a56c0 Kiran K 2025-02-25  136  	}
277a489a74a56c0 Kiran K 2025-02-25  137  
277a489a74a56c0 Kiran K 2025-02-25  138  	memcpy(data->dbgc.frag_v_addr, &db_frag, sizeof(db_frag));
277a489a74a56c0 Kiran K 2025-02-25  139  	return 0;
277a489a74a56c0 Kiran K 2025-02-25  140  }
277a489a74a56c0 Kiran K 2025-02-25  141  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
