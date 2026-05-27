Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A1145039
	for <oe-kbuild@lists.linux.dev>; Wed, 27 May 2026 04:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779856940; cv=none; b=PEb3gacoLwJPE25XG/50EU4aXlIKdUs5jxYWL4OlXmfEHDeYNUkteePxE4WVaD4+6w0NGeTgHg+W+ppuEYGAaJBZITubOwTH8PXOrcY71gZc0y+ttagcX7bXeN1jkuP77ynfW2QIUJlqjKBO6fBrKf3BzyqXlVGsFdxPqarZAno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779856940; c=relaxed/simple;
	bh=r8QnEnA7LGvAWhgwkxbLfkqHhVN8qa+1rYSmiaDs2l4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NmRvPILFGBQVUklHTxHsbk3hr0FglC4XLPtFDUdCSLnGIX/uGPQUbwcxrEs+xhAY14cANCB/+VLNHRnf0bN96Th1fnvQIp2rn0MffC6tFOwa29o7AcI5QPoIO/EhcbAHJNIWZ2jv4mtIswK4xYGMavyJFA2jJ59xOm9vLWRfewU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FeL0kO3V; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FeL0kO3V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779856938; x=1811392938;
  h=date:from:to:cc:subject:message-id;
  bh=r8QnEnA7LGvAWhgwkxbLfkqHhVN8qa+1rYSmiaDs2l4=;
  b=FeL0kO3VzQwkfFAnrZBuQNITevYLtu5BYjCPqd3XzLMvBMlcrc71rJKn
   dY/1FylSv1I0+VEC/BIMZD5W2+tb18byym0ZzdZrZemdwiVy+clMgWT8u
   nSgPl7t6qAM2r9mhoH3tT797FK170gxmyYcrXI6emvsqtJD8YhdwOoxlC
   mtUta/gie6uiZZHElTlM5gvmgHQvIrtYbatvKumatLrWUcMDPwrDvE0DX
   uPrlc92ngeDROI7LVGhuj5Ncd3O/E7J+/t0Y+BxBttI/MLnQoGA0lDtL3
   IfyKnobdk6bQutGe67pWE5EwLvIAR8BOGFcq4a3TC3jmIcX6RLTNlnCHI
   Q==;
X-CSE-ConnectionGUID: aGQUudhUT+SyRHCymtMvlw==
X-CSE-MsgGUID: +2WfCiOhTxKLP9+pog37DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80710907"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="80710907"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 21:42:18 -0700
X-CSE-ConnectionGUID: +G87lezoRX23Jl3TeMdefA==
X-CSE-MsgGUID: sQosSWWxSduJqu78Jq3N8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="247203985"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 May 2026 21:42:17 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wS65u-000000003P8-1EWJ;
	Wed, 27 May 2026 04:42:14 +0000
Date: Wed, 27 May 2026 12:42:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpib/ines/ines_gpib.c:917 ines_isa_attach() warn:
 'config->ibbase' from __request_region() not released on lines: 913.
Message-ID: <202605271229.d8wGTffx-lkp@intel.com>
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

Hi Dave,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eb3f4b7426cfd2b79d65b7d37155480b32259a11
commit: e6ab504633e4c06e35377ecf3c8cbc304de79858 staging: gpib: Destage gpib
date:   6 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 6 months ago
config: alpha-randconfig-r071-20260527 (https://download.01.org/0day-ci/archive/20260527/202605271229.d8wGTffx-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e6ab504633e4 ("staging: gpib: Destage gpib")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605271229.d8wGTffx-lkp@intel.com/

New smatch warnings:
drivers/gpib/ines/ines_gpib.c:917 ines_isa_attach() warn: 'config->ibbase' from __request_region() not released on lines: 913.

Old smatch warnings:
internal error: arch/alpha/include/asm/io_trivial.h:12 SQL error #2: near "and": syntax error
internal error: arch/alpha/include/asm/io_trivial.h:12 SQL: 'select * from return_states where  and type = 1044 and parameter = -1 and key = '$' limit 1;'

vim +917 drivers/gpib/ines/ines_gpib.c

b8989f45d1ec0b drivers/staging/gpib/ines/ines_gpib.c Arnd Bergmann 2024-10-16  888  
cfa6673eae0281 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2025-05-02  889  static int ines_isa_attach(struct gpib_board *board, const struct gpib_board_config *config)
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  890  {
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  891  	struct ines_priv *ines_priv;
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  892  	struct nec7210_priv *nec_priv;
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  893  	int isr_flags = 0;
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  894  	int retval;
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  895  
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  896  	retval = ines_generic_attach(board);
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  897  	if (retval)
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  898  		return retval;
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  899  
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  900  	ines_priv = board->private_data;
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  901  	nec_priv = &ines_priv->nec7210_priv;
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  902  
0de51244e7b7e3 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2025-02-20  903  	if (!request_region(config->ibbase, ines_isa_iosize, DRV_NAME)) {
0de51244e7b7e3 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2025-02-20  904  		dev_err(board->gpib_dev, "ioports at 0x%x already in use\n",
0de51244e7b7e3 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2025-02-20  905  			config->ibbase);
0de51244e7b7e3 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2025-02-20  906  		return -EBUSY;
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  907  	}
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  908  	nec_priv->iobase = config->ibbase;
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  909  	nec_priv->offset = 1;
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  910  	nec7210_board_reset(nec_priv, board);
0de51244e7b7e3 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2025-02-20  911  	if (request_irq(config->ibirq, ines_pci_interrupt, isr_flags, DRV_NAME, board)) {
0de51244e7b7e3 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2025-02-20  912  		dev_err(board->gpib_dev, "failed to allocate IRQ %d\n", config->ibirq);
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  913  		return -1;
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  914  	}
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  915  	ines_priv->irq = config->ibirq;
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  916  	ines_online(ines_priv, board, 1);
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18 @917  	return 0;
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  918  }
bb1bd92fa0f2c9 drivers/staging/gpib/ines/ines_gpib.c Dave Penkler  2024-09-18  919  

:::::: The code at line 917 was first introduced by commit
:::::: bb1bd92fa0f2c9c39c5766e3ea81f26d7e8355a4 staging: gpib: Add ines GPIB driver

:::::: TO: Dave Penkler <dpenkler@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
