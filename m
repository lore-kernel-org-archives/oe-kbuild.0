Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B26C1C3B
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Mar 2023 15:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679327930; x=1710863930;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X+PkqEe8eQE1iLwRBc7QwINGv/fn9jC1BbisVZPvZ1s=;
  b=cn1kIhqPnhgJXXrhxr9kL+Zf3weUpfH8ZLBnLZYlvRYwWGqstjJyQjvC
   rzJwMQ83yBbbYQEDnu01YIQj9EyYjpucfGXxapycKwlpgCtdjFwvCGeLF
   LktvkP6hxLg3afVONHHogOCF58Ir0NgmBZ4Hlm0zuh5d+a6ulciJlJQ4u
   j8GfGc2L7M4T0JNyvqIs3ycfmIsuFTzyZSKrM+gW4QRFj7FZStTF/DkQo
   lSWle1dNo5bJ+HllHteweST5On42KPDBiqkbHMAmleCbcMAV1UBaQmm4s
   6Tg9rdV9Uf4XzcI9xuyRzvMqT2UPWMoSAyLQ7TlWiiZ9u0LWZUpw/LlN4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="424974861"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="424974861"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 08:58:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="631175601"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; 
   d="scan'208";a="631175601"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 20 Mar 2023 08:58:47 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peHuJ-000B7q-0U;
	Mon, 20 Mar 2023 15:58:47 +0000
Date: Mon, 20 Mar 2023 23:57:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/scsi/lpfc/lpfc_nvmet.c:1692 lpfc_nvmet_create_targetport()
 error: we previously assumed 'phba->targetport' could be null (see line
 1650)
Message-ID: <202303202339.qAbD5lYu-lkp@intel.com>
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
TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Palmer Dabbelt <palmer@rivosinc.com>
CC: Conor Dooley <conor.dooley@microchip.com>

Hi Lad,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e8d018dd0257f744ca50a729e3d042cf2ec9da65
commit: effae0e3d9e1139d583e9b5d050f4f948825b8a3 riscv: Kconfig: Enable cpufreq kconfig menu
date:   4 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 4 months ago
config: riscv-randconfig-m031-20230319 (https://download.01.org/0day-ci/archive/20230320/202303202339.qAbD5lYu-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303202339.qAbD5lYu-lkp@intel.com/

smatch warnings:
drivers/scsi/lpfc/lpfc_nvmet.c:1692 lpfc_nvmet_create_targetport() error: we previously assumed 'phba->targetport' could be null (see line 1650)

vim +1692 drivers/scsi/lpfc/lpfc_nvmet.c

6c621a2229b084 James Smart  2017-05-15  1641  
d613b6a7aa9226 James Smart  2017-02-12  1642  int
d613b6a7aa9226 James Smart  2017-02-12  1643  lpfc_nvmet_create_targetport(struct lpfc_hba *phba)
d613b6a7aa9226 James Smart  2017-02-12  1644  {
d613b6a7aa9226 James Smart  2017-02-12  1645  	struct lpfc_vport  *vport = phba->pport;
d613b6a7aa9226 James Smart  2017-02-12  1646  	struct lpfc_nvmet_tgtport *tgtp;
d613b6a7aa9226 James Smart  2017-02-12  1647  	struct nvmet_fc_port_info pinfo;
6c621a2229b084 James Smart  2017-05-15  1648  	int error;
d613b6a7aa9226 James Smart  2017-02-12  1649  
d613b6a7aa9226 James Smart  2017-02-12 @1650  	if (phba->targetport)
d613b6a7aa9226 James Smart  2017-02-12  1651  		return 0;
d613b6a7aa9226 James Smart  2017-02-12  1652  
6c621a2229b084 James Smart  2017-05-15  1653  	error = lpfc_nvmet_setup_io_context(phba);
6c621a2229b084 James Smart  2017-05-15  1654  	if (error)
6c621a2229b084 James Smart  2017-05-15  1655  		return error;
6c621a2229b084 James Smart  2017-05-15  1656  
d613b6a7aa9226 James Smart  2017-02-12  1657  	memset(&pinfo, 0, sizeof(struct nvmet_fc_port_info));
d613b6a7aa9226 James Smart  2017-02-12  1658  	pinfo.node_name = wwn_to_u64(vport->fc_nodename.u.wwn);
d613b6a7aa9226 James Smart  2017-02-12  1659  	pinfo.port_name = wwn_to_u64(vport->fc_portname.u.wwn);
d613b6a7aa9226 James Smart  2017-02-12  1660  	pinfo.port_id = vport->fc_myDID;
d613b6a7aa9226 James Smart  2017-02-12  1661  
5b9e70b22cc592 James Smart  2018-09-10  1662  	/* We need to tell the transport layer + 1 because it takes page
5b9e70b22cc592 James Smart  2018-09-10  1663  	 * alignment into account. When space for the SGL is allocated we
5b9e70b22cc592 James Smart  2018-09-10  1664  	 * allocate + 3, one for cmd, one for rsp and one for this alignment
4d4c4a4ac756e7 James Smart  2017-04-21  1665  	 */
4d4c4a4ac756e7 James Smart  2017-04-21  1666  	lpfc_tgttemplate.max_sgl_segments = phba->cfg_nvme_seg_cnt + 1;
cdb42becdd40ee James Smart  2019-01-28  1667  	lpfc_tgttemplate.max_hw_queues = phba->cfg_hdw_queue;
f485c18db27734 Dick Kennedy 2017-09-29  1668  	lpfc_tgttemplate.target_features = NVMET_FCTGTFEAT_READDATA_RSP;
d613b6a7aa9226 James Smart  2017-02-12  1669  
7d7080335f8d93 James Smart  2017-03-08  1670  #if (IS_ENABLED(CONFIG_NVME_TARGET_FC))
d613b6a7aa9226 James Smart  2017-02-12  1671  	error = nvmet_fc_register_targetport(&pinfo, &lpfc_tgttemplate,
d613b6a7aa9226 James Smart  2017-02-12  1672  					     &phba->pcidev->dev,
d613b6a7aa9226 James Smart  2017-02-12  1673  					     &phba->targetport);
166d721120c1cf James Smart  2017-03-04  1674  #else
6c621a2229b084 James Smart  2017-05-15  1675  	error = -ENOENT;
166d721120c1cf James Smart  2017-03-04  1676  #endif
d613b6a7aa9226 James Smart  2017-02-12  1677  	if (error) {
372c187b8a705c Dick Kennedy 2020-06-30  1678  		lpfc_printf_log(phba, KERN_ERR, LOG_TRACE_EVENT,
e7981a2c725f8e Dick Kennedy 2017-09-29  1679  				"6025 Cannot register NVME targetport x%x: "
e7981a2c725f8e Dick Kennedy 2017-09-29  1680  				"portnm %llx nodenm %llx segs %d qs %d\n",
e7981a2c725f8e Dick Kennedy 2017-09-29  1681  				error,
e7981a2c725f8e Dick Kennedy 2017-09-29  1682  				pinfo.port_name, pinfo.node_name,
e7981a2c725f8e Dick Kennedy 2017-09-29  1683  				lpfc_tgttemplate.max_sgl_segments,
e7981a2c725f8e Dick Kennedy 2017-09-29  1684  				lpfc_tgttemplate.max_hw_queues);
d613b6a7aa9226 James Smart  2017-02-12  1685  		phba->targetport = NULL;
e7981a2c725f8e Dick Kennedy 2017-09-29  1686  		phba->nvmet_support = 0;
6c621a2229b084 James Smart  2017-05-15  1687  
6c621a2229b084 James Smart  2017-05-15  1688  		lpfc_nvmet_cleanup_io_context(phba);
6c621a2229b084 James Smart  2017-05-15  1689  
d613b6a7aa9226 James Smart  2017-02-12  1690  	} else {
d613b6a7aa9226 James Smart  2017-02-12  1691  		tgtp = (struct lpfc_nvmet_tgtport *)
d613b6a7aa9226 James Smart  2017-02-12 @1692  			phba->targetport->private;
d613b6a7aa9226 James Smart  2017-02-12  1693  		tgtp->phba = phba;
d613b6a7aa9226 James Smart  2017-02-12  1694  
d613b6a7aa9226 James Smart  2017-02-12  1695  		lpfc_printf_log(phba, KERN_INFO, LOG_NVME_DISC,
d613b6a7aa9226 James Smart  2017-02-12  1696  				"6026 Registered NVME "
32350664497279 James Smart  2019-08-14  1697  				"targetport: x%px, private x%px "
e7981a2c725f8e Dick Kennedy 2017-09-29  1698  				"portnm %llx nodenm %llx segs %d qs %d\n",
d613b6a7aa9226 James Smart  2017-02-12  1699  				phba->targetport, tgtp,
e7981a2c725f8e Dick Kennedy 2017-09-29  1700  				pinfo.port_name, pinfo.node_name,
e7981a2c725f8e Dick Kennedy 2017-09-29  1701  				lpfc_tgttemplate.max_sgl_segments,
e7981a2c725f8e Dick Kennedy 2017-09-29  1702  				lpfc_tgttemplate.max_hw_queues);
d613b6a7aa9226 James Smart  2017-02-12  1703  
d613b6a7aa9226 James Smart  2017-02-12  1704  		atomic_set(&tgtp->rcv_ls_req_in, 0);
d613b6a7aa9226 James Smart  2017-02-12  1705  		atomic_set(&tgtp->rcv_ls_req_out, 0);
d613b6a7aa9226 James Smart  2017-02-12  1706  		atomic_set(&tgtp->rcv_ls_req_drop, 0);
d613b6a7aa9226 James Smart  2017-02-12  1707  		atomic_set(&tgtp->xmt_ls_abort, 0);
547077a44b3b49 James Smart  2017-05-15  1708  		atomic_set(&tgtp->xmt_ls_abort_cmpl, 0);
d613b6a7aa9226 James Smart  2017-02-12  1709  		atomic_set(&tgtp->xmt_ls_rsp, 0);
d613b6a7aa9226 James Smart  2017-02-12  1710  		atomic_set(&tgtp->xmt_ls_drop, 0);
d613b6a7aa9226 James Smart  2017-02-12  1711  		atomic_set(&tgtp->xmt_ls_rsp_error, 0);
4b056682d8812a James Smart  2017-12-08  1712  		atomic_set(&tgtp->xmt_ls_rsp_xb_set, 0);
4b056682d8812a James Smart  2017-12-08  1713  		atomic_set(&tgtp->xmt_ls_rsp_aborted, 0);
d613b6a7aa9226 James Smart  2017-02-12  1714  		atomic_set(&tgtp->xmt_ls_rsp_cmpl, 0);
d613b6a7aa9226 James Smart  2017-02-12  1715  		atomic_set(&tgtp->rcv_fcp_cmd_in, 0);
d613b6a7aa9226 James Smart  2017-02-12  1716  		atomic_set(&tgtp->rcv_fcp_cmd_out, 0);
d613b6a7aa9226 James Smart  2017-02-12  1717  		atomic_set(&tgtp->rcv_fcp_cmd_drop, 0);
d613b6a7aa9226 James Smart  2017-02-12  1718  		atomic_set(&tgtp->xmt_fcp_drop, 0);
d613b6a7aa9226 James Smart  2017-02-12  1719  		atomic_set(&tgtp->xmt_fcp_read_rsp, 0);
d613b6a7aa9226 James Smart  2017-02-12  1720  		atomic_set(&tgtp->xmt_fcp_read, 0);
d613b6a7aa9226 James Smart  2017-02-12  1721  		atomic_set(&tgtp->xmt_fcp_write, 0);
d613b6a7aa9226 James Smart  2017-02-12  1722  		atomic_set(&tgtp->xmt_fcp_rsp, 0);
547077a44b3b49 James Smart  2017-05-15  1723  		atomic_set(&tgtp->xmt_fcp_release, 0);
d613b6a7aa9226 James Smart  2017-02-12  1724  		atomic_set(&tgtp->xmt_fcp_rsp_cmpl, 0);
d613b6a7aa9226 James Smart  2017-02-12  1725  		atomic_set(&tgtp->xmt_fcp_rsp_error, 0);
4b056682d8812a James Smart  2017-12-08  1726  		atomic_set(&tgtp->xmt_fcp_rsp_xb_set, 0);
4b056682d8812a James Smart  2017-12-08  1727  		atomic_set(&tgtp->xmt_fcp_rsp_aborted, 0);
d613b6a7aa9226 James Smart  2017-02-12  1728  		atomic_set(&tgtp->xmt_fcp_rsp_drop, 0);
4b056682d8812a James Smart  2017-12-08  1729  		atomic_set(&tgtp->xmt_fcp_xri_abort_cqe, 0);
547077a44b3b49 James Smart  2017-05-15  1730  		atomic_set(&tgtp->xmt_fcp_abort, 0);
547077a44b3b49 James Smart  2017-05-15  1731  		atomic_set(&tgtp->xmt_fcp_abort_cmpl, 0);
547077a44b3b49 James Smart  2017-05-15  1732  		atomic_set(&tgtp->xmt_abort_unsol, 0);
547077a44b3b49 James Smart  2017-05-15  1733  		atomic_set(&tgtp->xmt_abort_sol, 0);
d613b6a7aa9226 James Smart  2017-02-12  1734  		atomic_set(&tgtp->xmt_abort_rsp, 0);
d613b6a7aa9226 James Smart  2017-02-12  1735  		atomic_set(&tgtp->xmt_abort_rsp_error, 0);
411de511c69435 James Smart  2018-01-30  1736  		atomic_set(&tgtp->defer_ctx, 0);
411de511c69435 James Smart  2018-01-30  1737  		atomic_set(&tgtp->defer_fod, 0);
411de511c69435 James Smart  2018-01-30  1738  		atomic_set(&tgtp->defer_wqfull, 0);
d613b6a7aa9226 James Smart  2017-02-12  1739  	}
d613b6a7aa9226 James Smart  2017-02-12  1740  	return error;
d613b6a7aa9226 James Smart  2017-02-12  1741  }
d613b6a7aa9226 James Smart  2017-02-12  1742  

:::::: The code at line 1692 was first introduced by commit
:::::: d613b6a7aa922690e341c9ff0faba66ae299b5ad scsi: lpfc: NVME Target: bind to nvmet_fc api

:::::: TO: James Smart <jsmart2021@gmail.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
