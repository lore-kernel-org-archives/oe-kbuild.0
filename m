Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6205C199E80
	for <oe-kbuild@lists.linux.dev>; Tue, 31 Dec 2024 15:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735660163; cv=none; b=UNvSHlVw8n836SOJLRxGS7+mAwn1sNDX64b71vKigeBv0k+YSCtEVofX+u1URJOdAS4vJVAAWqtz4aFXvoSwYb0XxDF4CXrrF4t/SgLGLmKwhul7qmb3SMKpudX6j+nHm9dpcETd1O2uWKlCJPgZS8c8BkYXpDCM0Qf5s7reT6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735660163; c=relaxed/simple;
	bh=MxvQoZTN1gN65F7w1LUEpH9md8tLivQEtp1OHXGY2zA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RYCoNGoHIfOA0u2gvW4IeAQQZ0EBGQmvU+r6NCpdi/w8OzVc4BlI0NsDfhw7eCPxJmhYF1LB8P9oDGayxGq2ocTOmnyp5U1gvoGShXk5KYP6yWY1xETeqzhDg39eNWd0BPcfZyUdzUqR1UbBWHa7Dbpret0NQPBTLMV+3HZiZUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m+6padNU; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m+6padNU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735660160; x=1767196160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MxvQoZTN1gN65F7w1LUEpH9md8tLivQEtp1OHXGY2zA=;
  b=m+6padNU8dsNEK5PC1j7Yiyasa3Rz1tOJsqTi/6aEdlbKnflO44LE3Wg
   56pZGNOWNLLe+Jmwm0thk5IfqRUh0NFiVbS6Gyihv8SwZNLVAvu/bSKZ1
   xJe4eJBX92RkZ3XDIbJXAMqQhz1ECbtydDGto7kev9BhJhnWHnF52XGwz
   PobmtPw7VqoO7ILg2cLqKRkM6atb5GdjlWzXv+dbZt8u8Fo4jUeomNsMu
   3XOpZ3JYEtlXFRNk+VvvVtZ7u6CJYoVTl1PGOXvFFUpGkHRdabWRXv6gh
   SLORuN5OrDllC4SmZK9ZywE/kyenQgTx7fWkvJSqcDg3N7bSonCsTk5yD
   A==;
X-CSE-ConnectionGUID: mrY/HVjqQICRqpNYA6Vgaw==
X-CSE-MsgGUID: f4oYgXJsRcOMzcj4QNJnRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="61311394"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; 
   d="scan'208";a="61311394"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 07:49:17 -0800
X-CSE-ConnectionGUID: DTULConUS3GiaX1kzrNzsg==
X-CSE-MsgGUID: ZeUXUzGBRD6e8ZdkI+7Lhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; 
   d="scan'208";a="100934920"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Dec 2024 07:49:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSeUb-0007Dp-2Q;
	Tue, 31 Dec 2024 15:49:13 +0000
Date: Tue, 31 Dec 2024 23:48:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/scsi/fnic/fnic_main.c:777:2-36: alloc with no test, possible
 model on line 803
Message-ID: <202412312347.FE4ZgEoM-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Karan Tilak Kumar <kartilak@cisco.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Sesidhar Baddela <sebaddel@cisco.com>
CC: Arulprabhu Ponnusamy <arulponn@cisco.com>
CC: Hannes Reinecke <hare@suse.de>
CC: John Garry <john.g.garry@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ccb98ccef0e543c2bd4ef1a72270461957f3d8d0
commit: 52f6e196e52ef834f928aac297d895f4c32276ea scsi: fnic: Add support for multiqueue (MQ) in fnic_main.c
date:   1 year, 1 month ago
:::::: branch date: 20 hours ago
:::::: commit date: 1 year, 1 month ago
config: i386-randconfig-051-20241231 (https://download.01.org/0day-ci/archive/20241231/202412312347.FE4ZgEoM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412312347.FE4ZgEoM-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/scsi/fnic/fnic_main.c:777:2-36: alloc with no test, possible model on line 803

vim +777 drivers/scsi/fnic/fnic_main.c

52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   606  
6f039790510fd6 Greg Kroah-Hartman                  2012-12-21   607  static int fnic_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   608  {
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   609  	struct Scsi_Host *host;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   610  	struct fc_lport *lp;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   611  	struct fnic *fnic;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   612  	mempool_t *pool;
ca008aeeb02cb1 Karan Tilak Kumar                   2023-12-11   613  	int err = 0;
ca008aeeb02cb1 Karan Tilak Kumar                   2023-12-11   614  	int fnic_id = 0;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   615  	int i;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   616  	unsigned long flags;
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   617  	int hwq;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   618  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   619  	/*
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   620  	 * Allocate SCSI Host and set up association between host,
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   621  	 * local port, and fnic
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   622  	 */
86221969e20a2f Chris Leech                         2009-11-03   623  	lp = libfc_host_alloc(&fnic_host_template, sizeof(struct fnic));
86221969e20a2f Chris Leech                         2009-11-03   624  	if (!lp) {
86221969e20a2f Chris Leech                         2009-11-03   625  		printk(KERN_ERR PFX "Unable to alloc libfc local port\n");
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   626  		err = -ENOMEM;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   627  		goto err_out;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   628  	}
ca008aeeb02cb1 Karan Tilak Kumar                   2023-12-11   629  
86221969e20a2f Chris Leech                         2009-11-03   630  	host = lp->host;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   631  	fnic = lport_priv(lp);
ca008aeeb02cb1 Karan Tilak Kumar                   2023-12-11   632  
ca008aeeb02cb1 Karan Tilak Kumar                   2023-12-11   633  	fnic_id = ida_alloc(&fnic_ida, GFP_KERNEL);
ca008aeeb02cb1 Karan Tilak Kumar                   2023-12-11   634  	if (fnic_id < 0) {
ca008aeeb02cb1 Karan Tilak Kumar                   2023-12-11   635  		pr_err("Unable to alloc fnic ID\n");
ca008aeeb02cb1 Karan Tilak Kumar                   2023-12-11   636  		err = fnic_id;
ca008aeeb02cb1 Karan Tilak Kumar                   2023-12-11   637  		goto err_out_ida_alloc;
ca008aeeb02cb1 Karan Tilak Kumar                   2023-12-11   638  	}
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   639  	fnic->lport = lp;
78112e5558064c Joe Eykholt                         2009-11-03   640  	fnic->ctlr.lp = lp;
f9e2beb990f083 Karan Tilak Kumar                   2020-11-20   641  	fnic->link_events = 0;
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   642  	fnic->pdev = pdev;
f9e2beb990f083 Karan Tilak Kumar                   2020-11-20   643  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   644  	snprintf(fnic->name, sizeof(fnic->name) - 1, "%s%d", DRV_NAME,
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   645  		 host->host_no);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   646  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   647  	host->transportt = fnic_fc_transport;
ca008aeeb02cb1 Karan Tilak Kumar                   2023-12-11   648  	fnic->fnic_num = fnic_id;
1dbaa379a41934 Greg Kroah-Hartman                  2019-01-22   649  	fnic_stats_debugfs_init(fnic);
67125b0287a9e6 Hiral Patel                         2013-09-12   650  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   651  	err = pci_enable_device(pdev);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   652  	if (err) {
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   653  		shost_printk(KERN_ERR, fnic->lport->host,
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   654  			     "Cannot enable PCI device, aborting.\n");
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   655  		goto err_out_free_hba;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   656  	}
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   657  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   658  	err = pci_request_regions(pdev, DRV_NAME);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   659  	if (err) {
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   660  		shost_printk(KERN_ERR, fnic->lport->host,
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   661  			     "Cannot enable PCI resources, aborting\n");
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   662  		goto err_out_disable_device;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   663  	}
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   664  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   665  	pci_set_master(pdev);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   666  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   667  	/* Query PCI controller on system for DMA addressing
b559b99a5c0819 Karan Tilak Kumar                   2022-05-13   668  	 * limitation for the device.  Try 47-bit first, and
b559b99a5c0819 Karan Tilak Kumar                   2022-05-13   669  	 * fail to 32-bit. Cisco VIC supports 47 bits only.
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   670  	 */
b559b99a5c0819 Karan Tilak Kumar                   2022-05-13   671  	err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(47));
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   672  	if (err) {
7f9b0f774fdf26 Christoph Hellwig                   2018-10-10   673  		err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   674  		if (err) {
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   675  			shost_printk(KERN_ERR, fnic->lport->host,
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   676  				     "No usable DMA configuration "
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   677  				     "aborting\n");
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   678  			goto err_out_release_regions;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   679  		}
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   680  	}
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   681  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   682  	/* Map vNIC resources from BAR0 */
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   683  	if (!(pci_resource_flags(pdev, 0) & IORESOURCE_MEM)) {
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   684  		shost_printk(KERN_ERR, fnic->lport->host,
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   685  			     "BAR0 not memory-map'able, aborting.\n");
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   686  		err = -ENODEV;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   687  		goto err_out_release_regions;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   688  	}
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   689  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   690  	fnic->bar0.vaddr = pci_iomap(pdev, 0, 0);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   691  	fnic->bar0.bus_addr = pci_resource_start(pdev, 0);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   692  	fnic->bar0.len = pci_resource_len(pdev, 0);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   693  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   694  	if (!fnic->bar0.vaddr) {
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   695  		shost_printk(KERN_ERR, fnic->lport->host,
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   696  			     "Cannot memory-map BAR0 res hdr, "
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   697  			     "aborting.\n");
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   698  		err = -ENODEV;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   699  		goto err_out_release_regions;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   700  	}
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   701  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   702  	fnic->vdev = vnic_dev_register(NULL, fnic, pdev, &fnic->bar0);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   703  	if (!fnic->vdev) {
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   704  		shost_printk(KERN_ERR, fnic->lport->host,
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   705  			     "vNIC registration failed, "
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   706  			     "aborting.\n");
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   707  		err = -ENODEV;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   708  		goto err_out_iounmap;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   709  	}
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   710  
e119d14ca38c14 Satish Kharat                       2019-01-18   711  	err = vnic_dev_cmd_init(fnic->vdev);
e119d14ca38c14 Satish Kharat                       2019-01-18   712  	if (err) {
e119d14ca38c14 Satish Kharat                       2019-01-18   713  		shost_printk(KERN_ERR, fnic->lport->host,
e119d14ca38c14 Satish Kharat                       2019-01-18   714  				"vnic_dev_cmd_init() returns %d, aborting\n",
e119d14ca38c14 Satish Kharat                       2019-01-18   715  				err);
e119d14ca38c14 Satish Kharat                       2019-01-18   716  		goto err_out_vnic_unregister;
e119d14ca38c14 Satish Kharat                       2019-01-18   717  	}
e119d14ca38c14 Satish Kharat                       2019-01-18   718  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   719  	err = fnic_dev_wait(fnic->vdev, vnic_dev_open,
68e3cc02bcfc4f Satish Kharat                       2019-01-14   720  			    vnic_dev_open_done, CMD_OPENF_RQ_ENABLE_THEN_POST);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   721  	if (err) {
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   722  		shost_printk(KERN_ERR, fnic->lport->host,
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   723  			     "vNIC dev open failed, aborting.\n");
e119d14ca38c14 Satish Kharat                       2019-01-18   724  		goto err_out_dev_cmd_deinit;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   725  	}
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   726  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   727  	err = vnic_dev_init(fnic->vdev, 0);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   728  	if (err) {
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   729  		shost_printk(KERN_ERR, fnic->lport->host,
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   730  			     "vNIC dev init failed, aborting.\n");
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   731  		goto err_out_dev_close;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   732  	}
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   733  
78112e5558064c Joe Eykholt                         2009-11-03   734  	err = vnic_dev_mac_addr(fnic->vdev, fnic->ctlr.ctl_src_addr);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   735  	if (err) {
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   736  		shost_printk(KERN_ERR, fnic->lport->host,
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   737  			     "vNIC get MAC addr failed \n");
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   738  		goto err_out_dev_close;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   739  	}
78112e5558064c Joe Eykholt                         2009-11-03   740  	/* set data_src for point-to-point mode and to keep it non-zero */
78112e5558064c Joe Eykholt                         2009-11-03   741  	memcpy(fnic->data_src_addr, fnic->ctlr.ctl_src_addr, ETH_ALEN);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   742  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   743  	/* Get vNIC configuration */
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   744  	err = fnic_get_vnic_config(fnic);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   745  	if (err) {
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   746  		shost_printk(KERN_ERR, fnic->lport->host,
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   747  			     "Get vNIC configuration failed, "
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   748  			     "aborting.\n");
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   749  		goto err_out_dev_close;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   750  	}
fc85799ee362e3 Hiral Patel                         2013-09-09   751  
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   752  	/* Setup PCI resources */
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   753  	pci_set_drvdata(pdev, fnic);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   754  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   755  	fnic_get_res_counts(fnic);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   756  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   757  	err = fnic_set_intr_mode(fnic);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   758  	if (err) {
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   759  		shost_printk(KERN_ERR, fnic->lport->host,
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   760  			     "Failed to set intr mode, "
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   761  			     "aborting.\n");
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   762  		goto err_out_dev_close;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   763  	}
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   764  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   765  	err = fnic_alloc_vnic_resources(fnic);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   766  	if (err) {
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   767  		shost_printk(KERN_ERR, fnic->lport->host,
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   768  			     "Failed to alloc vNIC resources, "
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   769  			     "aborting.\n");
2e76f7670b33a3 Abhijeet Joglekar                   2009-11-03   770  		goto err_out_clear_intr;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   771  	}
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   772  
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   773  	fnic_scsi_drv_init(fnic);
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   774  
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   775  	for (hwq = 0; hwq < fnic->wq_copy_count; hwq++) {
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   776  		fnic->sw_copy_wq[hwq].ioreq_table_size = fnic->fnic_max_tag_id;
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11  @777  		fnic->sw_copy_wq[hwq].io_req_table =
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   778  					kzalloc((fnic->sw_copy_wq[hwq].ioreq_table_size + 1) *
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   779  					sizeof(struct fnic_io_req *), GFP_KERNEL);
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   780  	}
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   781  	shost_printk(KERN_INFO, fnic->lport->host, "fnic copy wqs: %d, Q0 ioreq table size: %d\n",
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   782  			fnic->wq_copy_count, fnic->sw_copy_wq[0].ioreq_table_size);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   783  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   784  	/* initialize all fnic locks */
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   785  	spin_lock_init(&fnic->fnic_lock);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   786  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   787  	for (i = 0; i < FNIC_WQ_MAX; i++)
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   788  		spin_lock_init(&fnic->wq_lock[i]);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   789  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   790  	for (i = 0; i < FNIC_WQ_COPY_MAX; i++) {
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   791  		spin_lock_init(&fnic->wq_copy_lock[i]);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   792  		fnic->wq_copy_desc_low[i] = DESC_CLEAN_LOW_WATERMARK;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   793  		fnic->fw_ack_recd[i] = 0;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   794  		fnic->fw_ack_index[i] = -1;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   795  	}
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   796  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   797  	for (i = 0; i < FNIC_IO_LOCKS; i++)
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   798  		spin_lock_init(&fnic->io_req_lock[i]);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   799  
514f0c400bde6b Karan Tilak Kumar                   2023-09-19   800  	spin_lock_init(&fnic->sgreset_lock);
514f0c400bde6b Karan Tilak Kumar                   2023-09-19   801  
d4fc94fe655787 Zhang Changzhong                    2020-12-04   802  	err = -ENOMEM;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17  @803  	fnic->io_req_pool = mempool_create_slab_pool(2, fnic_io_req_cache);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   804  	if (!fnic->io_req_pool)
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   805  		goto err_out_free_resources;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   806  
0c79c74272b25b Abhijeet Joglekar                   2011-06-13   807  	pool = mempool_create_slab_pool(2, fnic_sgl_cache[FNIC_SGL_CACHE_DFLT]);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   808  	if (!pool)
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   809  		goto err_out_free_ioreq_pool;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   810  	fnic->io_sgl_pool[FNIC_SGL_CACHE_DFLT] = pool;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   811  
0c79c74272b25b Abhijeet Joglekar                   2011-06-13   812  	pool = mempool_create_slab_pool(2, fnic_sgl_cache[FNIC_SGL_CACHE_MAX]);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   813  	if (!pool)
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   814  		goto err_out_free_dflt_pool;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   815  	fnic->io_sgl_pool[FNIC_SGL_CACHE_MAX] = pool;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   816  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   817  	/* setup vlan config, hw inserts vlan header */
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   818  	fnic->vlan_hw_insert = 1;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   819  	fnic->vlan_id = 0;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   820  
78112e5558064c Joe Eykholt                         2009-11-03   821  	/* Initialize the FIP fcoe_ctrl struct */
78112e5558064c Joe Eykholt                         2009-11-03   822  	fnic->ctlr.send = fnic_eth_send;
78112e5558064c Joe Eykholt                         2009-11-03   823  	fnic->ctlr.update_mac = fnic_update_mac;
78112e5558064c Joe Eykholt                         2009-11-03   824  	fnic->ctlr.get_src_addr = fnic_get_mac;
78112e5558064c Joe Eykholt                         2009-11-03   825  	if (fnic->config.flags & VFCF_FIP_CAPABLE) {
78112e5558064c Joe Eykholt                         2009-11-03   826  		shost_printk(KERN_INFO, fnic->lport->host,
78112e5558064c Joe Eykholt                         2009-11-03   827  			     "firmware supports FIP\n");
aaa5e569ca96f5 Venkata Siva Vijayendra Bhamidipati 2010-02-16   828  		/* enable directed and multicast */
aaa5e569ca96f5 Venkata Siva Vijayendra Bhamidipati 2010-02-16   829  		vnic_dev_packet_filter(fnic->vdev, 1, 1, 0, 0, 0);
78112e5558064c Joe Eykholt                         2009-11-03   830  		vnic_dev_add_addr(fnic->vdev, FIP_ALL_ENODE_MACS);
78112e5558064c Joe Eykholt                         2009-11-03   831  		vnic_dev_add_addr(fnic->vdev, fnic->ctlr.ctl_src_addr);
d3c995f1dcf938 Hiral Patel                         2013-02-25   832  		fnic->set_vlan = fnic_set_vlan;
3d902ac09a2812 Joe Eykholt                         2010-07-20   833  		fcoe_ctlr_init(&fnic->ctlr, FIP_MODE_AUTO);
e99e88a9d2b067 Kees Cook                           2017-10-16   834  		timer_setup(&fnic->fip_timer, fnic_fip_notify_timer, 0);
d3c995f1dcf938 Hiral Patel                         2013-02-25   835  		spin_lock_init(&fnic->vlans_lock);
d3c995f1dcf938 Hiral Patel                         2013-02-25   836  		INIT_WORK(&fnic->fip_frame_work, fnic_handle_fip_frame);
d3c995f1dcf938 Hiral Patel                         2013-02-25   837  		INIT_WORK(&fnic->event_work, fnic_handle_event);
d3c995f1dcf938 Hiral Patel                         2013-02-25   838  		skb_queue_head_init(&fnic->fip_frame_queue);
d3c995f1dcf938 Hiral Patel                         2013-02-25   839  		INIT_LIST_HEAD(&fnic->evlist);
d3c995f1dcf938 Hiral Patel                         2013-02-25   840  		INIT_LIST_HEAD(&fnic->vlans);
78112e5558064c Joe Eykholt                         2009-11-03   841  	} else {
78112e5558064c Joe Eykholt                         2009-11-03   842  		shost_printk(KERN_INFO, fnic->lport->host,
78112e5558064c Joe Eykholt                         2009-11-03   843  			     "firmware uses non-FIP mode\n");
3d902ac09a2812 Joe Eykholt                         2010-07-20   844  		fcoe_ctlr_init(&fnic->ctlr, FIP_MODE_NON_FIP);
c8ff03c6da9685 Hiral Shah                          2014-04-18   845  		fnic->ctlr.state = FIP_ST_NON_FIP;
78112e5558064c Joe Eykholt                         2009-11-03   846  	}
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   847  	fnic->state = FNIC_IN_FC_MODE;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   848  
03298552cba38f Hiral Patel                         2013-02-12   849  	atomic_set(&fnic->in_flight, 0);
03298552cba38f Hiral Patel                         2013-02-12   850  	fnic->state_flags = FNIC_FLAGS_NONE;
03298552cba38f Hiral Patel                         2013-02-12   851  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   852  	/* Enable hardware stripping of vlan header on ingress */
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   853  	fnic_set_nic_config(fnic, 0, 0, 0, 0, 0, 0, 1);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   854  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   855  	/* Setup notification buffer area */
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   856  	err = fnic_notify_set(fnic);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   857  	if (err) {
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   858  		shost_printk(KERN_ERR, fnic->lport->host,
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   859  			     "Failed to alloc notify buffer, aborting.\n");
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   860  		goto err_out_free_max_pool;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   861  	}
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   862  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   863  	/* Setup notify timer when using MSI interrupts */
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   864  	if (vnic_dev_get_intr_mode(fnic->vdev) == VNIC_DEV_INTR_MODE_MSI)
e99e88a9d2b067 Kees Cook                           2017-10-16   865  		timer_setup(&fnic->notify_timer, fnic_notify_timer, 0);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   866  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   867  	/* allocate RQ buffers and post them to RQ*/
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   868  	for (i = 0; i < fnic->rq_count; i++) {
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   869  		err = vnic_rq_fill(&fnic->rq[i], fnic_alloc_rq_frame);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   870  		if (err) {
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   871  			shost_printk(KERN_ERR, fnic->lport->host,
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   872  				     "fnic_alloc_rq_frame can't alloc "
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   873  				     "frame\n");
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   874  			goto err_out_rq_buf;
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   875  		}
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   876  	}
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   877  
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   878  	/* Enable all queues */
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   879  	for (i = 0; i < fnic->raw_wq_count; i++)
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   880  		vnic_wq_enable(&fnic->wq[i]);
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   881  	for (i = 0; i < fnic->rq_count; i++) {
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   882  		if (!ioread32(&fnic->rq[i].ctrl->enable))
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   883  			vnic_rq_enable(&fnic->rq[i]);
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   884  	}
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   885  	for (i = 0; i < fnic->wq_copy_count; i++)
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   886  		vnic_wq_copy_enable(&fnic->hw_copy_wq[i]);
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   887  
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   888  	err = fnic_request_intr(fnic);
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   889  	if (err) {
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   890  		shost_printk(KERN_ERR, fnic->lport->host,
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   891  			     "Unable to request irq.\n");
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   892  		goto err_out_request_intr;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   893  	}
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   894  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   895  	/*
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   896  	 * Initialization done with PCI system, hardware, firmware.
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   897  	 * Add host to SCSI
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   898  	 */
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   899  	err = scsi_add_host(lp->host, &pdev->dev);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   900  	if (err) {
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   901  		shost_printk(KERN_ERR, fnic->lport->host,
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   902  			     "fnic: scsi_add_host failed...exiting\n");
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   903  		goto err_out_scsi_add_host;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   904  	}
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   905  
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   906  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   907  	/* Start local port initiatialization */
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   908  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   909  	lp->link_up = 0;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   910  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   911  	lp->max_retry_count = fnic->config.flogi_retries;
a366695592ebc9 Abhijeet Joglekar                   2009-05-01   912  	lp->max_rport_retry_count = fnic->config.plogi_retries;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   913  	lp->service_params = (FCP_SPPF_INIT_FCN | FCP_SPPF_RD_XRDY_DIS |
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   914  			      FCP_SPPF_CONF_COMPL);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   915  	if (fnic->config.flags & VFCF_FCP_SEQ_LVL_ERR)
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   916  		lp->service_params |= FCP_SPPF_RETRY;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   917  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   918  	lp->boot_time = jiffies;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   919  	lp->e_d_tov = fnic->config.ed_tov;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   920  	lp->r_a_tov = fnic->config.ra_tov;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   921  	lp->link_supported_speeds = FC_PORTSPEED_10GBIT;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   922  	fc_set_wwnn(lp, fnic->config.node_wwn);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   923  	fc_set_wwpn(lp, fnic->config.port_wwn);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   924  
e10f8c667b874a Joe Eykholt                         2010-07-20   925  	fcoe_libfc_config(lp, &fnic->ctlr, &fnic_transport_template, 0);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   926  
52ff878c912215 Vasu Dev                            2009-07-29   927  	if (!fc_exch_mgr_alloc(lp, FC_CLASS_3, FCPIO_HOST_EXCH_RANGE_START,
52ff878c912215 Vasu Dev                            2009-07-29   928  			       FCPIO_HOST_EXCH_RANGE_END, NULL)) {
52ff878c912215 Vasu Dev                            2009-07-29   929  		err = -ENOMEM;
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   930  		goto err_out_fc_exch_mgr_alloc;
52ff878c912215 Vasu Dev                            2009-07-29   931  	}
52ff878c912215 Vasu Dev                            2009-07-29   932  
c693a71d255612 Venkata Siva Vijayendra Bhamidipati 2010-02-16   933  	fc_lport_init_stats(lp);
1adee040114461 Narsimhulu Musini                   2013-09-09   934  	fnic->stats_reset_time = jiffies;
c693a71d255612 Venkata Siva Vijayendra Bhamidipati 2010-02-16   935  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   936  	fc_lport_config(lp);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   937  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   938  	if (fc_set_mfs(lp, fnic->config.maxdatafieldsize +
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   939  		       sizeof(struct fc_frame_header))) {
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   940  		err = -EINVAL;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   941  		goto err_out_free_exch_mgr;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   942  	}
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   943  	fc_host_maxframe_size(lp->host) = lp->mfs;
485868208ee833 Mike Christie                       2010-09-15   944  	fc_host_dev_loss_tmo(lp->host) = fnic->config.port_down_timeout / 1000;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   945  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   946  	sprintf(fc_host_symbolic_name(lp->host),
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   947  		DRV_NAME " v" DRV_VERSION " over %s", fnic->name);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   948  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   949  	spin_lock_irqsave(&fnic_list_lock, flags);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   950  	list_add_tail(&fnic->list, &fnic_list);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   951  	spin_unlock_irqrestore(&fnic_list_lock, flags);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   952  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   953  	INIT_WORK(&fnic->link_work, fnic_handle_link);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   954  	INIT_WORK(&fnic->frame_work, fnic_handle_frame);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   955  	skb_queue_head_init(&fnic->frame_queue);
78112e5558064c Joe Eykholt                         2009-11-03   956  	skb_queue_head_init(&fnic->tx_queue);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   957  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   958  	fc_fabric_login(lp);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   959  
120dbfd94c4d5c Satish Kharat                       2019-01-14   960  	vnic_dev_enable(fnic->vdev);
120dbfd94c4d5c Satish Kharat                       2019-01-14   961  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   962  	for (i = 0; i < fnic->intr_count; i++)
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   963  		vnic_intr_unmask(&fnic->intr[i]);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   964  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   965  	fnic_notify_timer_start(fnic);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   966  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   967  	return 0;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   968  
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   969  err_out_free_exch_mgr:
52ff878c912215 Vasu Dev                            2009-07-29   970  	fc_exch_mgr_free(lp);
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   971  err_out_fc_exch_mgr_alloc:
78112e5558064c Joe Eykholt                         2009-11-03   972  	fc_remove_host(lp->host);
78112e5558064c Joe Eykholt                         2009-11-03   973  	scsi_remove_host(lp->host);
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   974  err_out_scsi_add_host:
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   975  	fnic_free_intr(fnic);
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   976  err_out_request_intr:
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   977  	for (i = 0; i < fnic->rq_count; i++)
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   978  		vnic_rq_clean(&fnic->rq[i], fnic_free_rq_buf);
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   979  err_out_rq_buf:
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   980  	vnic_dev_notify_unset(fnic->vdev);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   981  err_out_free_max_pool:
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   982  	mempool_destroy(fnic->io_sgl_pool[FNIC_SGL_CACHE_MAX]);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   983  err_out_free_dflt_pool:
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   984  	mempool_destroy(fnic->io_sgl_pool[FNIC_SGL_CACHE_DFLT]);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   985  err_out_free_ioreq_pool:
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   986  	mempool_destroy(fnic->io_req_pool);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   987  err_out_free_resources:
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   988  	for (hwq = 0; hwq < fnic->wq_copy_count; hwq++)
52f6e196e52ef8 Karan Tilak Kumar                   2023-12-11   989  		kfree(fnic->sw_copy_wq[hwq].io_req_table);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   990  	fnic_free_vnic_resources(fnic);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   991  err_out_clear_intr:
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   992  	fnic_clear_intr_mode(fnic);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   993  err_out_dev_close:
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   994  	vnic_dev_close(fnic->vdev);
e119d14ca38c14 Satish Kharat                       2019-01-18   995  err_out_dev_cmd_deinit:
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   996  err_out_vnic_unregister:
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   997  	vnic_dev_unregister(fnic->vdev);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   998  err_out_iounmap:
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17   999  	fnic_iounmap(fnic);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17  1000  err_out_release_regions:
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17  1001  	pci_release_regions(pdev);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17  1002  err_out_disable_device:
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17  1003  	pci_disable_device(pdev);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17  1004  err_out_free_hba:
67125b0287a9e6 Hiral Patel                         2013-09-12  1005  	fnic_stats_debugfs_remove(fnic);
ca008aeeb02cb1 Karan Tilak Kumar                   2023-12-11  1006  	ida_free(&fnic_ida, fnic->fnic_num);
ca008aeeb02cb1 Karan Tilak Kumar                   2023-12-11  1007  err_out_ida_alloc:
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17  1008  	scsi_host_put(lp->host);
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17  1009  err_out:
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17  1010  	return err;
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17  1011  }
5df6d737dd4b0f Abhijeet Joglekar                   2009-04-17  1012  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
