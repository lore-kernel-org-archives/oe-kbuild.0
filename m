Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4309938B7D4
	for <oe-kbuild@lists.linux.dev>; Thu, 14 May 2026 11:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778759803; cv=none; b=WRkN236vmkdQVQDCHdERYo1LVhLnA3dUVqhkGmc4AsoxQLvUbt5Y4i/hq8Ryj7MXQa5Q8hzvpFPFFEO3zQmKSpuRyB8LWPvnuYLZsd0LdqFA7TjIYqAl7mQyf4bWO5R1zUVOw8gr41IRNIaFjSLbmPEyKvPuKcAs8O6wrEckTmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778759803; c=relaxed/simple;
	bh=K5MafkxV0nBiwskuqFhkPLFk2XLVSGWybj3wIUczu7s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t5l+G9BotObJWlIdxWMMAbNsps9EmvaPk49zPe81lrhAZr2D6jLtNRjrjl1mQhMk1xOerwGUo91QPSQkbLkknclILcGxiJKcpUfhZ7b7E+Cxkch7O4YkSdm77CdkcixyyZxtvcDbKiTylKKcHPfgCeOpeFE4ls3dL2N/ReJsZUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hzOPL+02; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hzOPL+02"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778759802; x=1810295802;
  h=date:from:to:cc:subject:message-id;
  bh=K5MafkxV0nBiwskuqFhkPLFk2XLVSGWybj3wIUczu7s=;
  b=hzOPL+02YRbX3GVY/Cpc9ynddUv6AuhuQp3mvkxC8sjvM0YFfRarRIqT
   nvWl3x2BEK5tA0LQ9MPlJWRjC8JiKqT6snHSD1ow5+D7NC1AvTT+ILzS0
   x03AstX+dGJ1Xz1wK7ULAvpk7p48oEVLywr69+Z405maFHDjt0ds7PFnF
   GJFVcJUqW3HP+BxRSglU7u4omYdwtWVhne5gMZPR09vepMYbH2K693ig5
   JU8L7Gwd8wM/VdezuPEQ4rY/wc+6BBmjXDT+k9OV8IF4a0LLwJNSUHN67
   ODs0tCOZhu+na2zicwSkwyLpJSEFIKS6ysAgGn4s/TtLRT2HHFrWLETjt
   A==;
X-CSE-ConnectionGUID: JW2BrNFiSBSeP8kUHjd5fA==
X-CSE-MsgGUID: n+XkrbfsTR+AaXK10dJu5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79736631"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="79736631"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 04:56:41 -0700
X-CSE-ConnectionGUID: 4V/IrN9XTQmnNf9xap4LpQ==
X-CSE-MsgGUID: w66I0d/OTK20sM4In6uDYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="238620107"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 May 2026 04:56:40 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNUg8-000000006TP-3tiT;
	Thu, 14 May 2026 11:56:36 +0000
Date: Thu, 14 May 2026 19:56:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 2714/4394]
 drivers/pci/endpoint/functions/pci-epf-test.c:769:7-27: WARNING: Threaded IRQ
 with no primary handler requested without IRQF_ONESHOT (unless it is nested
 IRQ)
Message-ID: <202605141948.KcB1ghf2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Koichiro Den <den@valinux.co.jp>
CC: Bjorn Helgaas <helgaas@kernel.org>
CC: Manivannan Sadhasivam <mani@kernel.org>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e98d21c170b01ddef366f023bbfcf6b31509fa83
commit: 8fda2dd209d34396cf49504e2c8dd55d182b14bc [2714/4394] PCI: endpoint: pci-epf-test: Reuse pre-exposed doorbell targets
:::::: branch date: 6 days ago
:::::: commit date: 10 days ago
config: alpha-randconfig-r064-20260513 (https://download.01.org/0day-ci/archive/20260514/202605141948.KcB1ghf2-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202605141948.KcB1ghf2-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/pci/endpoint/functions/pci-epf-test.c:769:7-27: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

vim +769 drivers/pci/endpoint/functions/pci-epf-test.c

eff0c286aa91622 Frank Li                  2025-07-10  731  
eff0c286aa91622 Frank Li                  2025-07-10  732  static void pci_epf_test_enable_doorbell(struct pci_epf_test *epf_test,
eff0c286aa91622 Frank Li                  2025-07-10  733  					 struct pci_epf_test_reg *reg)
eff0c286aa91622 Frank Li                  2025-07-10  734  {
eff0c286aa91622 Frank Li                  2025-07-10  735  	u32 status = le32_to_cpu(reg->status);
eff0c286aa91622 Frank Li                  2025-07-10  736  	struct pci_epf *epf = epf_test->epf;
8fda2dd209d3439 Koichiro Den              2026-04-14  737  	struct pci_epf_doorbell_msg *db;
eff0c286aa91622 Frank Li                  2025-07-10  738  	struct pci_epc *epc = epf->epc;
8fda2dd209d3439 Koichiro Den              2026-04-14  739  	unsigned long irq_flags;
eff0c286aa91622 Frank Li                  2025-07-10  740  	struct msi_msg *msg;
eff0c286aa91622 Frank Li                  2025-07-10  741  	enum pci_barno bar;
eff0c286aa91622 Frank Li                  2025-07-10  742  	size_t offset;
eff0c286aa91622 Frank Li                  2025-07-10  743  	int ret;
eff0c286aa91622 Frank Li                  2025-07-10  744  
eff0c286aa91622 Frank Li                  2025-07-10  745  	ret = pci_epf_alloc_doorbell(epf, 1);
eff0c286aa91622 Frank Li                  2025-07-10  746  	if (ret)
eff0c286aa91622 Frank Li                  2025-07-10  747  		goto set_status_err;
eff0c286aa91622 Frank Li                  2025-07-10  748  
8fda2dd209d3439 Koichiro Den              2026-04-14  749  	db = &epf->db_msg[0];
8fda2dd209d3439 Koichiro Den              2026-04-14  750  	msg = &db->msg;
8fda2dd209d3439 Koichiro Den              2026-04-14  751  	epf_test->db_bar_programmed = false;
8fda2dd209d3439 Koichiro Den              2026-04-14  752  
8fda2dd209d3439 Koichiro Den              2026-04-14  753  	if (db->bar != NO_BAR) {
8fda2dd209d3439 Koichiro Den              2026-04-14  754  		/*
8fda2dd209d3439 Koichiro Den              2026-04-14  755  		 * The doorbell target is already exposed via a platform-owned
8fda2dd209d3439 Koichiro Den              2026-04-14  756  		 * fixed BAR
8fda2dd209d3439 Koichiro Den              2026-04-14  757  		 */
8fda2dd209d3439 Koichiro Den              2026-04-14  758  		bar = db->bar;
8fda2dd209d3439 Koichiro Den              2026-04-14  759  		offset = db->offset;
8fda2dd209d3439 Koichiro Den              2026-04-14  760  	} else {
8fda2dd209d3439 Koichiro Den              2026-04-14  761  		bar = pci_epc_get_next_free_bar(epf_test->epc_features,
8fda2dd209d3439 Koichiro Den              2026-04-14  762  						epf_test->test_reg_bar + 1);
eff0c286aa91622 Frank Li                  2025-07-10  763  		if (bar < BAR_0)
eff0c286aa91622 Frank Li                  2025-07-10  764  			goto err_doorbell_cleanup;
8fda2dd209d3439 Koichiro Den              2026-04-14  765  	}
8fda2dd209d3439 Koichiro Den              2026-04-14  766  
8fda2dd209d3439 Koichiro Den              2026-04-14  767  	irq_flags = epf->db_msg[0].irq_flags | IRQF_ONESHOT;
eff0c286aa91622 Frank Li                  2025-07-10  768  
25423cda145f9ed Bhanu Seshu Kumar Valluri 2025-10-14 @769  	ret = request_threaded_irq(epf->db_msg[0].virq, NULL,
8fda2dd209d3439 Koichiro Den              2026-04-14  770  				   pci_epf_test_doorbell_handler, irq_flags,
eff0c286aa91622 Frank Li                  2025-07-10  771  				   "pci-ep-test-doorbell", epf_test);
eff0c286aa91622 Frank Li                  2025-07-10  772  	if (ret) {
eff0c286aa91622 Frank Li                  2025-07-10  773  		dev_err(&epf->dev,
eff0c286aa91622 Frank Li                  2025-07-10  774  			"Failed to request doorbell IRQ: %d\n",
eff0c286aa91622 Frank Li                  2025-07-10  775  			epf->db_msg[0].virq);
eff0c286aa91622 Frank Li                  2025-07-10  776  		goto err_doorbell_cleanup;
eff0c286aa91622 Frank Li                  2025-07-10  777  	}
eff0c286aa91622 Frank Li                  2025-07-10  778  
eff0c286aa91622 Frank Li                  2025-07-10  779  	reg->doorbell_data = cpu_to_le32(msg->data);
eff0c286aa91622 Frank Li                  2025-07-10  780  	reg->doorbell_bar = cpu_to_le32(bar);
eff0c286aa91622 Frank Li                  2025-07-10  781  
8fda2dd209d3439 Koichiro Den              2026-04-14  782  	if (db->bar == NO_BAR) {
8fda2dd209d3439 Koichiro Den              2026-04-14  783  		ret = pci_epf_align_inbound_addr(epf, bar,
8fda2dd209d3439 Koichiro Den              2026-04-14  784  						 ((u64)msg->address_hi << 32) |
8fda2dd209d3439 Koichiro Den              2026-04-14  785  						 msg->address_lo,
8fda2dd209d3439 Koichiro Den              2026-04-14  786  						 &epf_test->db_bar.phys_addr,
8fda2dd209d3439 Koichiro Den              2026-04-14  787  						 &offset);
eff0c286aa91622 Frank Li                  2025-07-10  788  
eff0c286aa91622 Frank Li                  2025-07-10  789  		if (ret)
e81fa70179aac6a Koichiro Den              2026-02-17  790  			goto err_free_irq;
8fda2dd209d3439 Koichiro Den              2026-04-14  791  	}
eff0c286aa91622 Frank Li                  2025-07-10  792  
eff0c286aa91622 Frank Li                  2025-07-10  793  	reg->doorbell_offset = cpu_to_le32(offset);
eff0c286aa91622 Frank Li                  2025-07-10  794  
8fda2dd209d3439 Koichiro Den              2026-04-14  795  	if (db->bar == NO_BAR) {
eff0c286aa91622 Frank Li                  2025-07-10  796  		epf_test->db_bar.barno = bar;
eff0c286aa91622 Frank Li                  2025-07-10  797  		epf_test->db_bar.size = epf->bar[bar].size;
eff0c286aa91622 Frank Li                  2025-07-10  798  		epf_test->db_bar.flags = epf->bar[bar].flags;
eff0c286aa91622 Frank Li                  2025-07-10  799  
eff0c286aa91622 Frank Li                  2025-07-10  800  		ret = pci_epc_set_bar(epc, epf->func_no, epf->vfunc_no, &epf_test->db_bar);
eff0c286aa91622 Frank Li                  2025-07-10  801  		if (ret)
e81fa70179aac6a Koichiro Den              2026-02-17  802  			goto err_free_irq;
eff0c286aa91622 Frank Li                  2025-07-10  803  
8fda2dd209d3439 Koichiro Den              2026-04-14  804  		epf_test->db_bar_programmed = true;
8fda2dd209d3439 Koichiro Den              2026-04-14  805  	}
8fda2dd209d3439 Koichiro Den              2026-04-14  806  
eff0c286aa91622 Frank Li                  2025-07-10  807  	status |= STATUS_DOORBELL_ENABLE_SUCCESS;
eff0c286aa91622 Frank Li                  2025-07-10  808  	reg->status = cpu_to_le32(status);
eff0c286aa91622 Frank Li                  2025-07-10  809  	return;
eff0c286aa91622 Frank Li                  2025-07-10  810  
e81fa70179aac6a Koichiro Den              2026-02-17  811  err_free_irq:
e81fa70179aac6a Koichiro Den              2026-02-17  812  	free_irq(epf->db_msg[0].virq, epf_test);
eff0c286aa91622 Frank Li                  2025-07-10  813  err_doorbell_cleanup:
eff0c286aa91622 Frank Li                  2025-07-10  814  	pci_epf_test_doorbell_cleanup(epf_test);
eff0c286aa91622 Frank Li                  2025-07-10  815  set_status_err:
eff0c286aa91622 Frank Li                  2025-07-10  816  	status |= STATUS_DOORBELL_ENABLE_FAIL;
eff0c286aa91622 Frank Li                  2025-07-10  817  	reg->status = cpu_to_le32(status);
eff0c286aa91622 Frank Li                  2025-07-10  818  }
eff0c286aa91622 Frank Li                  2025-07-10  819  

:::::: The code at line 769 was first introduced by commit
:::::: 25423cda145f9ed6ee4a72d9f2603ac2a4685e74 PCI: endpoint: pci-epf-test: Fix sleeping function being called from atomic context

:::::: TO: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
:::::: CC: Manivannan Sadhasivam <mani@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
