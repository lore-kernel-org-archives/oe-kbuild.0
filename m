Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA9E283FD4
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Sep 2026 03:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789789311; cv=none; b=LyE+ONK9+Cc4lh3i+GN4Eo1xiIrySRgFudgoLi6mxXXtJxMll02810JRCCzlMIdeLlLaEkOwLZSxoFoscewD3j4sDoI45fU1EFAQPiQxJfVm6oEZg+q3RbZl6quWK8yx4mfPfCfkjWNIx406t+bu4jwt9hhARRJHKUHKjpT5P88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789789311; c=relaxed/simple;
	bh=I/P9BaYWQziF7EgRJxCNOV+JAVT/UEF+a68Y942cq7Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qGO3oEiIAwaIrgRoH+EfSG4C2eWIhQrA+Q1zJLISBFLxY7bBiBSuwfQ61dS/Nlw/0gyC0CSEcomCQPXcVOiXz2FF6w4ij8Oqv3zU4IbNg5CaWR8PmtirpS5YDKyJHczgT0POL5cHNxECqOFgzRx0bJFNESNgcnDCzfXcnE/AmQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g1DMaab1; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g1DMaab1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789789310; x=1821325310;
  h=date:from:to:cc:subject:message-id;
  bh=I/P9BaYWQziF7EgRJxCNOV+JAVT/UEF+a68Y942cq7Y=;
  b=g1DMaab1onqi3oSeRm+vLfVvY1oGVz4MVAbQBqNWHCR8AaCThrV39f3Z
   KKE12Wp3FDFU66si3XlmPcY3KWef2E6YHBgfZ+V3A/Xq56C+HD0Pi6/Er
   aJAP4WwCE7THbWEFWV/embqSdZmXBYduLWKRzQcY9Ksl3cGTa9GYKkm/o
   S3E7yq158TM8kJJTmhs6ztr5gzY3rgknNMcuUtoiS/1JShJVPCary56Oz
   SIcS8eOanVG6sjWs39fcc5CTvYGCpP29ujvCx7r/bViFS+EmYBxTAI986
   9pqkczJpff1BxaGtfXQE/BB9TkERQOkbrCqfiAl625FrrdJtpy8m3pGoS
   w==;
X-CSE-ConnectionGUID: 4MkQZ/e+RVq2lENG84A4jw==
X-CSE-MsgGUID: S5ilZZWoQticzPNYRSb58A==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="90193014"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="90193014"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 20:41:49 -0700
X-CSE-ConnectionGUID: ODlo2rIgSZG5pNFiRUGAbw==
X-CSE-MsgGUID: lr+UMUZ5RKaFXt/VOdWJEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="2908219"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 18 Sep 2026 20:41:48 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7lxN-000000001Iy-44ex;
	Sat, 19 Sep 2026 03:41:41 +0000
Date: Sat, 19 Sep 2026 05:40:55 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/pci/endpoint/functions/pci-epf-test.c:769:7-27:
 WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT
 (unless it is nested IRQ)
Message-ID: <202609190509.163Y39lZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Koichiro Den <den@valinux.co.jp>
CC: Bjorn Helgaas <helgaas@kernel.org>
CC: Manivannan Sadhasivam <mani@kernel.org>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   40288c9206c17eb66a603262e06a58d300d0f279
commit: 8fda2dd209d34396cf49504e2c8dd55d182b14bc PCI: endpoint: pci-epf-test: Reuse pre-exposed doorbell targets
date:   5 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-103-20260911 (https://download.01.org/0day-ci/archive/20260919/202609190509.163Y39lZ-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 8fda2dd209d3 ("PCI: endpoint: pci-epf-test: Reuse pre-exposed doorbell targets")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202609190509.163Y39lZ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/pci/endpoint/functions/pci-epf-test.c:769:7-27: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

vim +769 drivers/pci/endpoint/functions/pci-epf-test.c

eff0c286aa9162 Frank Li                  2025-07-10  731  
eff0c286aa9162 Frank Li                  2025-07-10  732  static void pci_epf_test_enable_doorbell(struct pci_epf_test *epf_test,
eff0c286aa9162 Frank Li                  2025-07-10  733  					 struct pci_epf_test_reg *reg)
eff0c286aa9162 Frank Li                  2025-07-10  734  {
eff0c286aa9162 Frank Li                  2025-07-10  735  	u32 status = le32_to_cpu(reg->status);
eff0c286aa9162 Frank Li                  2025-07-10  736  	struct pci_epf *epf = epf_test->epf;
8fda2dd209d343 Koichiro Den              2026-04-14  737  	struct pci_epf_doorbell_msg *db;
eff0c286aa9162 Frank Li                  2025-07-10  738  	struct pci_epc *epc = epf->epc;
8fda2dd209d343 Koichiro Den              2026-04-14  739  	unsigned long irq_flags;
eff0c286aa9162 Frank Li                  2025-07-10  740  	struct msi_msg *msg;
eff0c286aa9162 Frank Li                  2025-07-10  741  	enum pci_barno bar;
eff0c286aa9162 Frank Li                  2025-07-10  742  	size_t offset;
eff0c286aa9162 Frank Li                  2025-07-10  743  	int ret;
eff0c286aa9162 Frank Li                  2025-07-10  744  
eff0c286aa9162 Frank Li                  2025-07-10  745  	ret = pci_epf_alloc_doorbell(epf, 1);
eff0c286aa9162 Frank Li                  2025-07-10  746  	if (ret)
eff0c286aa9162 Frank Li                  2025-07-10  747  		goto set_status_err;
eff0c286aa9162 Frank Li                  2025-07-10  748  
8fda2dd209d343 Koichiro Den              2026-04-14  749  	db = &epf->db_msg[0];
8fda2dd209d343 Koichiro Den              2026-04-14  750  	msg = &db->msg;
8fda2dd209d343 Koichiro Den              2026-04-14  751  	epf_test->db_bar_programmed = false;
8fda2dd209d343 Koichiro Den              2026-04-14  752  
8fda2dd209d343 Koichiro Den              2026-04-14  753  	if (db->bar != NO_BAR) {
8fda2dd209d343 Koichiro Den              2026-04-14  754  		/*
8fda2dd209d343 Koichiro Den              2026-04-14  755  		 * The doorbell target is already exposed via a platform-owned
8fda2dd209d343 Koichiro Den              2026-04-14  756  		 * fixed BAR
8fda2dd209d343 Koichiro Den              2026-04-14  757  		 */
8fda2dd209d343 Koichiro Den              2026-04-14  758  		bar = db->bar;
8fda2dd209d343 Koichiro Den              2026-04-14  759  		offset = db->offset;
8fda2dd209d343 Koichiro Den              2026-04-14  760  	} else {
8fda2dd209d343 Koichiro Den              2026-04-14  761  		bar = pci_epc_get_next_free_bar(epf_test->epc_features,
8fda2dd209d343 Koichiro Den              2026-04-14  762  						epf_test->test_reg_bar + 1);
eff0c286aa9162 Frank Li                  2025-07-10  763  		if (bar < BAR_0)
eff0c286aa9162 Frank Li                  2025-07-10  764  			goto err_doorbell_cleanup;
8fda2dd209d343 Koichiro Den              2026-04-14  765  	}
8fda2dd209d343 Koichiro Den              2026-04-14  766  
8fda2dd209d343 Koichiro Den              2026-04-14  767  	irq_flags = epf->db_msg[0].irq_flags | IRQF_ONESHOT;
eff0c286aa9162 Frank Li                  2025-07-10  768  
25423cda145f9e Bhanu Seshu Kumar Valluri 2025-10-14 @769  	ret = request_threaded_irq(epf->db_msg[0].virq, NULL,
8fda2dd209d343 Koichiro Den              2026-04-14  770  				   pci_epf_test_doorbell_handler, irq_flags,
eff0c286aa9162 Frank Li                  2025-07-10  771  				   "pci-ep-test-doorbell", epf_test);
eff0c286aa9162 Frank Li                  2025-07-10  772  	if (ret) {
eff0c286aa9162 Frank Li                  2025-07-10  773  		dev_err(&epf->dev,
eff0c286aa9162 Frank Li                  2025-07-10  774  			"Failed to request doorbell IRQ: %d\n",
eff0c286aa9162 Frank Li                  2025-07-10  775  			epf->db_msg[0].virq);
eff0c286aa9162 Frank Li                  2025-07-10  776  		goto err_doorbell_cleanup;
eff0c286aa9162 Frank Li                  2025-07-10  777  	}
eff0c286aa9162 Frank Li                  2025-07-10  778  
eff0c286aa9162 Frank Li                  2025-07-10  779  	reg->doorbell_data = cpu_to_le32(msg->data);
eff0c286aa9162 Frank Li                  2025-07-10  780  	reg->doorbell_bar = cpu_to_le32(bar);
eff0c286aa9162 Frank Li                  2025-07-10  781  
8fda2dd209d343 Koichiro Den              2026-04-14  782  	if (db->bar == NO_BAR) {
8fda2dd209d343 Koichiro Den              2026-04-14  783  		ret = pci_epf_align_inbound_addr(epf, bar,
8fda2dd209d343 Koichiro Den              2026-04-14  784  						 ((u64)msg->address_hi << 32) |
8fda2dd209d343 Koichiro Den              2026-04-14  785  						 msg->address_lo,
8fda2dd209d343 Koichiro Den              2026-04-14  786  						 &epf_test->db_bar.phys_addr,
8fda2dd209d343 Koichiro Den              2026-04-14  787  						 &offset);
eff0c286aa9162 Frank Li                  2025-07-10  788  
eff0c286aa9162 Frank Li                  2025-07-10  789  		if (ret)
e81fa70179aac6 Koichiro Den              2026-02-17  790  			goto err_free_irq;
8fda2dd209d343 Koichiro Den              2026-04-14  791  	}
eff0c286aa9162 Frank Li                  2025-07-10  792  
eff0c286aa9162 Frank Li                  2025-07-10  793  	reg->doorbell_offset = cpu_to_le32(offset);
eff0c286aa9162 Frank Li                  2025-07-10  794  
8fda2dd209d343 Koichiro Den              2026-04-14  795  	if (db->bar == NO_BAR) {
eff0c286aa9162 Frank Li                  2025-07-10  796  		epf_test->db_bar.barno = bar;
eff0c286aa9162 Frank Li                  2025-07-10  797  		epf_test->db_bar.size = epf->bar[bar].size;
eff0c286aa9162 Frank Li                  2025-07-10  798  		epf_test->db_bar.flags = epf->bar[bar].flags;
eff0c286aa9162 Frank Li                  2025-07-10  799  
eff0c286aa9162 Frank Li                  2025-07-10  800  		ret = pci_epc_set_bar(epc, epf->func_no, epf->vfunc_no, &epf_test->db_bar);
eff0c286aa9162 Frank Li                  2025-07-10  801  		if (ret)
e81fa70179aac6 Koichiro Den              2026-02-17  802  			goto err_free_irq;
eff0c286aa9162 Frank Li                  2025-07-10  803  
8fda2dd209d343 Koichiro Den              2026-04-14  804  		epf_test->db_bar_programmed = true;
8fda2dd209d343 Koichiro Den              2026-04-14  805  	}
8fda2dd209d343 Koichiro Den              2026-04-14  806  
eff0c286aa9162 Frank Li                  2025-07-10  807  	status |= STATUS_DOORBELL_ENABLE_SUCCESS;
eff0c286aa9162 Frank Li                  2025-07-10  808  	reg->status = cpu_to_le32(status);
eff0c286aa9162 Frank Li                  2025-07-10  809  	return;
eff0c286aa9162 Frank Li                  2025-07-10  810  
e81fa70179aac6 Koichiro Den              2026-02-17  811  err_free_irq:
e81fa70179aac6 Koichiro Den              2026-02-17  812  	free_irq(epf->db_msg[0].virq, epf_test);
eff0c286aa9162 Frank Li                  2025-07-10  813  err_doorbell_cleanup:
eff0c286aa9162 Frank Li                  2025-07-10  814  	pci_epf_test_doorbell_cleanup(epf_test);
eff0c286aa9162 Frank Li                  2025-07-10  815  set_status_err:
eff0c286aa9162 Frank Li                  2025-07-10  816  	status |= STATUS_DOORBELL_ENABLE_FAIL;
eff0c286aa9162 Frank Li                  2025-07-10  817  	reg->status = cpu_to_le32(status);
eff0c286aa9162 Frank Li                  2025-07-10  818  }
eff0c286aa9162 Frank Li                  2025-07-10  819  

:::::: The code at line 769 was first introduced by commit
:::::: 25423cda145f9ed6ee4a72d9f2603ac2a4685e74 PCI: endpoint: pci-epf-test: Fix sleeping function being called from atomic context

:::::: TO: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
:::::: CC: Manivannan Sadhasivam <mani@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
