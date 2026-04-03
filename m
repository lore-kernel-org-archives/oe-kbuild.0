Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD2A37B011
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Apr 2026 08:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205783; cv=none; b=F5K13wYBii+Svt8jdQ82cKRnQi6Ug4ybtI5tdh2vq/B+JDDDuYgHJ3/JuDILp60GE9O5uv/T1u7Xer5XoEL2NC8EtN9ncrldlpCwf/9rZJH5l3hsMNdtUfSozzqU4M3wudN7pUoevYW4VWFOGzQaGRwuaQbiWj08FoxSFO7LE88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205783; c=relaxed/simple;
	bh=KV+7voobsond0I/vz+9M3UN+QTJW5EYEJfZEI68OTfA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GDPGhZm9i8t38Z8C49L8+crcncmrwCtxRGttyFC6vOxV5i+/d0/iV4hh3Zlbg1kPk1UCWt3QcyA3vjmVyDYeLFX20QD8jWesu0c1GIOca+KW+VtcbJ5A7QCJV3gQRl4epHqvKtjsvEBQszs3R4CJxOWDL7Kmb8Nrwag76P9JdTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gBPdjiTG; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gBPdjiTG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205782; x=1806741782;
  h=date:from:to:cc:subject:message-id;
  bh=KV+7voobsond0I/vz+9M3UN+QTJW5EYEJfZEI68OTfA=;
  b=gBPdjiTG5Zvrv2KRcPucaJA6ChmdDhaCyRWuC9uDF8ZW80VmJ1BbP01F
   3kFbw6L685xRV9PYeksffbItS6vM71v8Rl2MEg+Lmd/fI/PvfFot9DO0l
   F1fGwzZtA253GpFGXxkUx53TB2D13zWN2XeZ9wbu6lWOEIgBQw3EjpOT/
   CZDbDDXJAvIL/oZQiRjPeXU15IT2t4HAdn3iPDS+nrx4j8snIs0cxhZRJ
   TAiW3IC3iDVa3JamZ0i0cJ/zSy88MH1cOnlE/CI/oa6bExlHuH5VC269E
   FevVyFayA2Rvq9WxmzOWRhB+OCW3A4o/dpTmmP1LBAS3j8QrNiPkcd9TT
   w==;
X-CSE-ConnectionGUID: jQ9Q+hwsQXiQ2K3qVwVrXg==
X-CSE-MsgGUID: XD/vtHOCQ8mW8K1phsTtMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75311890"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="75311890"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:42:59 -0700
X-CSE-ConnectionGUID: y7i4KvWBTImYukv6UgRJ2w==
X-CSE-MsgGUID: gAIaxq5HR7qeRvEEXQ5R3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="250286598"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Apr 2026 01:42:57 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a7D-0000000013t-2fsD;
	Fri, 03 Apr 2026 08:42:55 +0000
Date: Fri, 03 Apr 2026 16:42:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpib/cb7210/cb7210.c:1068 cb_isa_attach() warn:
 'config->ibbase' from __request_region() not released on lines: 1064.
Message-ID: <202604030115.fEnl8eoD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Dave Penkler <dpenkler@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9147566d801602c9e7fc7f85e989735735bf38ba
commit: e6ab504633e4c06e35377ecf3c8cbc304de79858 staging: gpib: Destage gpib
date:   4 months ago
:::::: branch date: 2 days ago
:::::: commit date: 4 months ago
config: alpha-randconfig-r072-20260402 (https://download.01.org/0day-ci/archive/20260403/202604030115.fEnl8eoD-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e6ab504633e4 ("staging: gpib: Destage gpib")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604030115.fEnl8eoD-lkp@intel.com/

New smatch warnings:
drivers/gpib/cb7210/cb7210.c:1068 cb_isa_attach() warn: 'config->ibbase' from __request_region() not released on lines: 1064.

Old smatch warnings:
internal error: arch/alpha/include/asm/io_trivial.h:18 SQL error #2: near "and": syntax error
internal error: arch/alpha/include/asm/io_trivial.h:18 SQL: 'select * from return_states where  and type = 1044 and parameter = -1 and key = '$' limit 1;'

vim +1068 drivers/gpib/cb7210/cb7210.c

e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  1034  
6e95efdcd133e0 drivers/staging/gpib/cb7210/cb7210.c Michael Rubin 2025-04-08  1035  static int cb_isa_attach(struct gpib_board *board, const struct gpib_board_config *config)
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  1036  {
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  1037  	int isr_flags = 0;
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  1038  	struct cb7210_priv *cb_priv;
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  1039  	struct nec7210_priv *nec_priv;
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  1040  	unsigned int bits;
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  1041  	int retval;
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  1042  
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  1043  	retval = cb7210_generic_attach(board);
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  1044  	if (retval)
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  1045  		return retval;
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  1046  	cb_priv = board->private_data;
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  1047  	nec_priv = &cb_priv->nec7210_priv;
82e3508046f9bc drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2025-02-20  1048  	if (!request_region(config->ibbase, cb7210_iosize, DRV_NAME)) {
82e3508046f9bc drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2025-02-20  1049  		dev_err(board->gpib_dev, "ioports starting at 0x%x are already in use\n",
82e3508046f9bc drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2025-02-20  1050  			config->ibbase);
82e3508046f9bc drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2025-02-20  1051  		return -EBUSY;
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  1052  	}
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  1053  	nec_priv->iobase = config->ibbase;
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  1054  	cb_priv->fifo_iobase = nec7210_iobase(cb_priv);
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  1055  
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  1056  	bits = irq_bits(config->ibirq);
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  1057  	if (bits == 0)
82e3508046f9bc drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2025-02-20  1058  		dev_err(board->gpib_dev, "board incapable of using irq %i, try 2-5, 7, 10, or 11\n",
82e3508046f9bc drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2025-02-20  1059  			config->ibirq);
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  1060  
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  1061  	// install interrupt handler
82e3508046f9bc drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2025-02-20  1062  	if (request_irq(config->ibirq, cb7210_interrupt, isr_flags, DRV_NAME, board)) {
82e3508046f9bc drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2025-02-20  1063  		dev_err(board->gpib_dev, "failed to obtain IRQ %d\n", config->ibirq);
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  1064  		return -EBUSY;
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  1065  	}
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  1066  	cb_priv->irq = config->ibirq;
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  1067  
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18 @1068  	return cb7210_init(cb_priv, board);
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  1069  }
e9dc69956d4d9b drivers/staging/gpib/cb7210/cb7210.c Dave Penkler  2024-09-18  1070  

:::::: The code at line 1068 was first introduced by commit
:::::: e9dc69956d4d9bf4a81d35995ce9229ff5e4cad5 staging: gpib: Add Computer Boards GPIB driver

:::::: TO: Dave Penkler <dpenkler@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
