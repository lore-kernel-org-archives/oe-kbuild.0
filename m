Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60F815B4
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Feb 2023 00:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675558211; x=1707094211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A4QFersBfj1zHf5pmgvwqKr6JfFW12xxyrQ8LzZn9Xw=;
  b=Qtg3T0CKbktVOA2dHKKr5uPvfPQt64Bb0YZ7keKqPbvS9724o3fCTkqU
   TVTe63BgLdk1qhCQbwi0aWf/x36P2Z8usoWhR460wvrPde4U5AnxYRxPr
   ehPMbX6SN00rmVQhBcmtMzvTwmKFGw+FCOyAIi4ui/t1TJTWERb3J6AE9
   5SaTefyRMm2MjiKe1N2J6E9dx7LF0z/fvok3nuzrjrPslQMVBItwjV+UI
   qohddnU75osjVQNEZZ7H0T90afVtiFfJDDGSX2V0cXr0GYRLQ16c+3CrG
   114beZkqu3xLWIonFVOLu1hnxT/XAA+7guPdKhdbjhPvUg9B/ct/Q1CNT
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="393604052"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="393604052"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 16:50:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="696505190"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="696505190"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 04 Feb 2023 16:50:07 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOTEH-0001c2-26;
	Sun, 05 Feb 2023 00:50:01 +0000
Date: Sun, 5 Feb 2023 08:49:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/scsi/mpi3mr/mpi3mr_app.c:1337 mpi3mr_bsg_process_mpt_cmds()
 warn: potentially one past the end of array 'drv_bufs[mpirep_offset]'
Message-ID: <202302050832.rOWlj7oX-lkp@intel.com>
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
TO: Masahiro Yamada <masahiroy@kernel.org>

Hi Masahiro,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   95078069c1e70d1b3b141132d18d0c563acedd0c
commit: 3753af778dd9d0d5199d6a7d01b0ead33135d095 kbuild: fix single directory build
date:   4 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 4 months ago
config: s390-randconfig-m031-20230204 (https://download.01.org/0day-ci/archive/20230205/202302050832.rOWlj7oX-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

New smatch warnings:
drivers/scsi/mpi3mr/mpi3mr_app.c:1337 mpi3mr_bsg_process_mpt_cmds() warn: potentially one past the end of array 'drv_bufs[mpirep_offset]'
drivers/scsi/mpi3mr/mpi3mr_app.c:1337 mpi3mr_bsg_process_mpt_cmds() warn: potentially one past the end of array 'drv_bufs[mpirep_offset]'
drivers/scsi/mpi3mr/mpi3mr_app.c:1367 mpi3mr_bsg_process_mpt_cmds() warn: potentially one past the end of array 'drv_bufs[erb_offset]'
drivers/scsi/mpi3mr/mpi3mr_transport.c:2063 mpi3mr_expander_add() warn: returning -1 instead of -ENOMEM is sloppy
drivers/scsi/mpi3mr/mpi3mr_fw.c:1413 mpi3mr_issue_reset() error: uninitialized symbol 'host_diagnostic'.
drivers/scsi/mpi3mr/mpi3mr_fw.c:1919 mpi3mr_create_op_reply_q() error: we previously assumed 'op_reply_q->q_segments' could be null (see line 1872)
drivers/scsi/mpi3mr/mpi3mr_fw.c:2027 mpi3mr_create_op_req_q() error: we previously assumed 'op_req_q->q_segments' could be null (see line 2000)

Old smatch warnings:
drivers/scsi/mpi3mr/mpi3mr_app.c:1338 mpi3mr_bsg_process_mpt_cmds() warn: potentially one past the end of array 'drv_bufs[mpirep_offset]'

vim +1337 drivers/scsi/mpi3mr/mpi3mr_app.c

7dbd0dd8cde356 Sumit Saxena 2022-04-29   698  
7dbd0dd8cde356 Sumit Saxena 2022-04-29   699  /**
7dbd0dd8cde356 Sumit Saxena 2022-04-29   700   * mpi3mr_build_nvme_prp - PRP constructor for NVME
7dbd0dd8cde356 Sumit Saxena 2022-04-29   701   *			       encapsulated request
7dbd0dd8cde356 Sumit Saxena 2022-04-29   702   * @mrioc: Adapter instance reference
7dbd0dd8cde356 Sumit Saxena 2022-04-29   703   * @nvme_encap_request: NVMe encapsulated MPI request
7dbd0dd8cde356 Sumit Saxena 2022-04-29   704   * @drv_bufs: DMA address of the buffers to be placed in SGL
7dbd0dd8cde356 Sumit Saxena 2022-04-29   705   * @bufcnt: Number of DMA buffers
7dbd0dd8cde356 Sumit Saxena 2022-04-29   706   *
7dbd0dd8cde356 Sumit Saxena 2022-04-29   707   * This function places the DMA address of the given buffers in
7dbd0dd8cde356 Sumit Saxena 2022-04-29   708   * proper format as PRP entries in the given NVMe encapsulated
7dbd0dd8cde356 Sumit Saxena 2022-04-29   709   * request.
7dbd0dd8cde356 Sumit Saxena 2022-04-29   710   *
7dbd0dd8cde356 Sumit Saxena 2022-04-29   711   * Return: 0 on success, -1 on failure
7dbd0dd8cde356 Sumit Saxena 2022-04-29   712   */
7dbd0dd8cde356 Sumit Saxena 2022-04-29   713  static int mpi3mr_build_nvme_prp(struct mpi3mr_ioc *mrioc,
7dbd0dd8cde356 Sumit Saxena 2022-04-29   714  	struct mpi3_nvme_encapsulated_request *nvme_encap_request,
7dbd0dd8cde356 Sumit Saxena 2022-04-29   715  	struct mpi3mr_buf_map *drv_bufs, u8 bufcnt)
7dbd0dd8cde356 Sumit Saxena 2022-04-29   716  {
7dbd0dd8cde356 Sumit Saxena 2022-04-29   717  	int prp_size = MPI3MR_NVME_PRP_SIZE;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   718  	__le64 *prp_entry, *prp1_entry, *prp2_entry;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   719  	__le64 *prp_page;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   720  	dma_addr_t prp_entry_dma, prp_page_dma, dma_addr;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   721  	u32 offset, entry_len, dev_pgsz;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   722  	u32 page_mask_result, page_mask;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   723  	size_t length = 0;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   724  	u8 count;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   725  	struct mpi3mr_buf_map *drv_buf_iter = drv_bufs;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   726  	u64 sgemod_mask = ((u64)((mrioc->facts.sge_mod_mask) <<
7dbd0dd8cde356 Sumit Saxena 2022-04-29   727  			    mrioc->facts.sge_mod_shift) << 32);
7dbd0dd8cde356 Sumit Saxena 2022-04-29   728  	u64 sgemod_val = ((u64)(mrioc->facts.sge_mod_value) <<
7dbd0dd8cde356 Sumit Saxena 2022-04-29   729  			  mrioc->facts.sge_mod_shift) << 32;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   730  	u16 dev_handle = nvme_encap_request->dev_handle;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   731  	struct mpi3mr_tgt_dev *tgtdev;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   732  
7dbd0dd8cde356 Sumit Saxena 2022-04-29   733  	tgtdev = mpi3mr_get_tgtdev_by_handle(mrioc, dev_handle);
7dbd0dd8cde356 Sumit Saxena 2022-04-29   734  	if (!tgtdev) {
7dbd0dd8cde356 Sumit Saxena 2022-04-29   735  		dprint_bsg_err(mrioc, "%s: invalid device handle 0x%04x\n",
7dbd0dd8cde356 Sumit Saxena 2022-04-29   736  			__func__, dev_handle);
7dbd0dd8cde356 Sumit Saxena 2022-04-29   737  		return -1;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   738  	}
7dbd0dd8cde356 Sumit Saxena 2022-04-29   739  
7dbd0dd8cde356 Sumit Saxena 2022-04-29   740  	if (tgtdev->dev_spec.pcie_inf.pgsz == 0) {
7dbd0dd8cde356 Sumit Saxena 2022-04-29   741  		dprint_bsg_err(mrioc,
7dbd0dd8cde356 Sumit Saxena 2022-04-29   742  		    "%s: NVMe device page size is zero for handle 0x%04x\n",
7dbd0dd8cde356 Sumit Saxena 2022-04-29   743  		    __func__, dev_handle);
7dbd0dd8cde356 Sumit Saxena 2022-04-29   744  		mpi3mr_tgtdev_put(tgtdev);
7dbd0dd8cde356 Sumit Saxena 2022-04-29   745  		return -1;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   746  	}
7dbd0dd8cde356 Sumit Saxena 2022-04-29   747  
7dbd0dd8cde356 Sumit Saxena 2022-04-29   748  	dev_pgsz = 1 << (tgtdev->dev_spec.pcie_inf.pgsz);
7dbd0dd8cde356 Sumit Saxena 2022-04-29   749  	mpi3mr_tgtdev_put(tgtdev);
7dbd0dd8cde356 Sumit Saxena 2022-04-29   750  
7dbd0dd8cde356 Sumit Saxena 2022-04-29   751  	/*
7dbd0dd8cde356 Sumit Saxena 2022-04-29   752  	 * Not all commands require a data transfer. If no data, just return
7dbd0dd8cde356 Sumit Saxena 2022-04-29   753  	 * without constructing any PRP.
7dbd0dd8cde356 Sumit Saxena 2022-04-29   754  	 */
7dbd0dd8cde356 Sumit Saxena 2022-04-29   755  	for (count = 0; count < bufcnt; count++, drv_buf_iter++) {
7dbd0dd8cde356 Sumit Saxena 2022-04-29   756  		if (drv_buf_iter->data_dir == DMA_NONE)
7dbd0dd8cde356 Sumit Saxena 2022-04-29   757  			continue;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   758  		dma_addr = drv_buf_iter->kern_buf_dma;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   759  		length = drv_buf_iter->kern_buf_len;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   760  		break;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   761  	}
7dbd0dd8cde356 Sumit Saxena 2022-04-29   762  
7dbd0dd8cde356 Sumit Saxena 2022-04-29   763  	if (!length)
7dbd0dd8cde356 Sumit Saxena 2022-04-29   764  		return 0;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   765  
7dbd0dd8cde356 Sumit Saxena 2022-04-29   766  	mrioc->prp_sz = 0;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   767  	mrioc->prp_list_virt = dma_alloc_coherent(&mrioc->pdev->dev,
7dbd0dd8cde356 Sumit Saxena 2022-04-29   768  	    dev_pgsz, &mrioc->prp_list_dma, GFP_KERNEL);
7dbd0dd8cde356 Sumit Saxena 2022-04-29   769  
7dbd0dd8cde356 Sumit Saxena 2022-04-29   770  	if (!mrioc->prp_list_virt)
7dbd0dd8cde356 Sumit Saxena 2022-04-29   771  		return -1;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   772  	mrioc->prp_sz = dev_pgsz;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   773  
7dbd0dd8cde356 Sumit Saxena 2022-04-29   774  	/*
7dbd0dd8cde356 Sumit Saxena 2022-04-29   775  	 * Set pointers to PRP1 and PRP2, which are in the NVMe command.
7dbd0dd8cde356 Sumit Saxena 2022-04-29   776  	 * PRP1 is located at a 24 byte offset from the start of the NVMe
7dbd0dd8cde356 Sumit Saxena 2022-04-29   777  	 * command.  Then set the current PRP entry pointer to PRP1.
7dbd0dd8cde356 Sumit Saxena 2022-04-29   778  	 */
7dbd0dd8cde356 Sumit Saxena 2022-04-29   779  	prp1_entry = (__le64 *)((u8 *)(nvme_encap_request->command) +
7dbd0dd8cde356 Sumit Saxena 2022-04-29   780  	    MPI3MR_NVME_CMD_PRP1_OFFSET);
7dbd0dd8cde356 Sumit Saxena 2022-04-29   781  	prp2_entry = (__le64 *)((u8 *)(nvme_encap_request->command) +
7dbd0dd8cde356 Sumit Saxena 2022-04-29   782  	    MPI3MR_NVME_CMD_PRP2_OFFSET);
7dbd0dd8cde356 Sumit Saxena 2022-04-29   783  	prp_entry = prp1_entry;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   784  	/*
7dbd0dd8cde356 Sumit Saxena 2022-04-29   785  	 * For the PRP entries, use the specially allocated buffer of
7dbd0dd8cde356 Sumit Saxena 2022-04-29   786  	 * contiguous memory.
7dbd0dd8cde356 Sumit Saxena 2022-04-29   787  	 */
7dbd0dd8cde356 Sumit Saxena 2022-04-29   788  	prp_page = (__le64 *)mrioc->prp_list_virt;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   789  	prp_page_dma = mrioc->prp_list_dma;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   790  
7dbd0dd8cde356 Sumit Saxena 2022-04-29   791  	/*
7dbd0dd8cde356 Sumit Saxena 2022-04-29   792  	 * Check if we are within 1 entry of a page boundary we don't
7dbd0dd8cde356 Sumit Saxena 2022-04-29   793  	 * want our first entry to be a PRP List entry.
7dbd0dd8cde356 Sumit Saxena 2022-04-29   794  	 */
7dbd0dd8cde356 Sumit Saxena 2022-04-29   795  	page_mask = dev_pgsz - 1;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   796  	page_mask_result = (uintptr_t)((u8 *)prp_page + prp_size) & page_mask;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   797  	if (!page_mask_result) {
7dbd0dd8cde356 Sumit Saxena 2022-04-29   798  		dprint_bsg_err(mrioc, "%s: PRP page is not page aligned\n",
7dbd0dd8cde356 Sumit Saxena 2022-04-29   799  		    __func__);
7dbd0dd8cde356 Sumit Saxena 2022-04-29   800  		goto err_out;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   801  	}
7dbd0dd8cde356 Sumit Saxena 2022-04-29   802  
7dbd0dd8cde356 Sumit Saxena 2022-04-29   803  	/*
7dbd0dd8cde356 Sumit Saxena 2022-04-29   804  	 * Set PRP physical pointer, which initially points to the current PRP
7dbd0dd8cde356 Sumit Saxena 2022-04-29   805  	 * DMA memory page.
7dbd0dd8cde356 Sumit Saxena 2022-04-29   806  	 */
7dbd0dd8cde356 Sumit Saxena 2022-04-29   807  	prp_entry_dma = prp_page_dma;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   808  
7dbd0dd8cde356 Sumit Saxena 2022-04-29   809  
7dbd0dd8cde356 Sumit Saxena 2022-04-29   810  	/* Loop while the length is not zero. */
7dbd0dd8cde356 Sumit Saxena 2022-04-29   811  	while (length) {
7dbd0dd8cde356 Sumit Saxena 2022-04-29   812  		page_mask_result = (prp_entry_dma + prp_size) & page_mask;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   813  		if (!page_mask_result && (length >  dev_pgsz)) {
7dbd0dd8cde356 Sumit Saxena 2022-04-29   814  			dprint_bsg_err(mrioc,
7dbd0dd8cde356 Sumit Saxena 2022-04-29   815  			    "%s: single PRP page is not sufficient\n",
7dbd0dd8cde356 Sumit Saxena 2022-04-29   816  			    __func__);
7dbd0dd8cde356 Sumit Saxena 2022-04-29   817  			goto err_out;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   818  		}
7dbd0dd8cde356 Sumit Saxena 2022-04-29   819  
7dbd0dd8cde356 Sumit Saxena 2022-04-29   820  		/* Need to handle if entry will be part of a page. */
7dbd0dd8cde356 Sumit Saxena 2022-04-29   821  		offset = dma_addr & page_mask;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   822  		entry_len = dev_pgsz - offset;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   823  
7dbd0dd8cde356 Sumit Saxena 2022-04-29   824  		if (prp_entry == prp1_entry) {
7dbd0dd8cde356 Sumit Saxena 2022-04-29   825  			/*
7dbd0dd8cde356 Sumit Saxena 2022-04-29   826  			 * Must fill in the first PRP pointer (PRP1) before
7dbd0dd8cde356 Sumit Saxena 2022-04-29   827  			 * moving on.
7dbd0dd8cde356 Sumit Saxena 2022-04-29   828  			 */
7dbd0dd8cde356 Sumit Saxena 2022-04-29   829  			*prp1_entry = cpu_to_le64(dma_addr);
7dbd0dd8cde356 Sumit Saxena 2022-04-29   830  			if (*prp1_entry & sgemod_mask) {
7dbd0dd8cde356 Sumit Saxena 2022-04-29   831  				dprint_bsg_err(mrioc,
7dbd0dd8cde356 Sumit Saxena 2022-04-29   832  				    "%s: PRP1 address collides with SGE modifier\n",
7dbd0dd8cde356 Sumit Saxena 2022-04-29   833  				    __func__);
7dbd0dd8cde356 Sumit Saxena 2022-04-29   834  				goto err_out;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   835  			}
7dbd0dd8cde356 Sumit Saxena 2022-04-29   836  			*prp1_entry &= ~sgemod_mask;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   837  			*prp1_entry |= sgemod_val;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   838  
7dbd0dd8cde356 Sumit Saxena 2022-04-29   839  			/*
7dbd0dd8cde356 Sumit Saxena 2022-04-29   840  			 * Now point to the second PRP entry within the
7dbd0dd8cde356 Sumit Saxena 2022-04-29   841  			 * command (PRP2).
7dbd0dd8cde356 Sumit Saxena 2022-04-29   842  			 */
7dbd0dd8cde356 Sumit Saxena 2022-04-29   843  			prp_entry = prp2_entry;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   844  		} else if (prp_entry == prp2_entry) {
7dbd0dd8cde356 Sumit Saxena 2022-04-29   845  			/*
7dbd0dd8cde356 Sumit Saxena 2022-04-29   846  			 * Should the PRP2 entry be a PRP List pointer or just
7dbd0dd8cde356 Sumit Saxena 2022-04-29   847  			 * a regular PRP pointer?  If there is more than one
7dbd0dd8cde356 Sumit Saxena 2022-04-29   848  			 * more page of data, must use a PRP List pointer.
7dbd0dd8cde356 Sumit Saxena 2022-04-29   849  			 */
7dbd0dd8cde356 Sumit Saxena 2022-04-29   850  			if (length > dev_pgsz) {
7dbd0dd8cde356 Sumit Saxena 2022-04-29   851  				/*
7dbd0dd8cde356 Sumit Saxena 2022-04-29   852  				 * PRP2 will contain a PRP List pointer because
7dbd0dd8cde356 Sumit Saxena 2022-04-29   853  				 * more PRP's are needed with this command. The
7dbd0dd8cde356 Sumit Saxena 2022-04-29   854  				 * list will start at the beginning of the
7dbd0dd8cde356 Sumit Saxena 2022-04-29   855  				 * contiguous buffer.
7dbd0dd8cde356 Sumit Saxena 2022-04-29   856  				 */
7dbd0dd8cde356 Sumit Saxena 2022-04-29   857  				*prp2_entry = cpu_to_le64(prp_entry_dma);
7dbd0dd8cde356 Sumit Saxena 2022-04-29   858  				if (*prp2_entry & sgemod_mask) {
7dbd0dd8cde356 Sumit Saxena 2022-04-29   859  					dprint_bsg_err(mrioc,
7dbd0dd8cde356 Sumit Saxena 2022-04-29   860  					    "%s: PRP list address collides with SGE modifier\n",
7dbd0dd8cde356 Sumit Saxena 2022-04-29   861  					    __func__);
7dbd0dd8cde356 Sumit Saxena 2022-04-29   862  					goto err_out;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   863  				}
7dbd0dd8cde356 Sumit Saxena 2022-04-29   864  				*prp2_entry &= ~sgemod_mask;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   865  				*prp2_entry |= sgemod_val;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   866  
7dbd0dd8cde356 Sumit Saxena 2022-04-29   867  				/*
7dbd0dd8cde356 Sumit Saxena 2022-04-29   868  				 * The next PRP Entry will be the start of the
7dbd0dd8cde356 Sumit Saxena 2022-04-29   869  				 * first PRP List.
7dbd0dd8cde356 Sumit Saxena 2022-04-29   870  				 */
7dbd0dd8cde356 Sumit Saxena 2022-04-29   871  				prp_entry = prp_page;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   872  				continue;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   873  			} else {
7dbd0dd8cde356 Sumit Saxena 2022-04-29   874  				/*
7dbd0dd8cde356 Sumit Saxena 2022-04-29   875  				 * After this, the PRP Entries are complete.
7dbd0dd8cde356 Sumit Saxena 2022-04-29   876  				 * This command uses 2 PRP's and no PRP list.
7dbd0dd8cde356 Sumit Saxena 2022-04-29   877  				 */
7dbd0dd8cde356 Sumit Saxena 2022-04-29   878  				*prp2_entry = cpu_to_le64(dma_addr);
7dbd0dd8cde356 Sumit Saxena 2022-04-29   879  				if (*prp2_entry & sgemod_mask) {
7dbd0dd8cde356 Sumit Saxena 2022-04-29   880  					dprint_bsg_err(mrioc,
7dbd0dd8cde356 Sumit Saxena 2022-04-29   881  					    "%s: PRP2 collides with SGE modifier\n",
7dbd0dd8cde356 Sumit Saxena 2022-04-29   882  					    __func__);
7dbd0dd8cde356 Sumit Saxena 2022-04-29   883  					goto err_out;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   884  				}
7dbd0dd8cde356 Sumit Saxena 2022-04-29   885  				*prp2_entry &= ~sgemod_mask;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   886  				*prp2_entry |= sgemod_val;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   887  			}
7dbd0dd8cde356 Sumit Saxena 2022-04-29   888  		} else {
7dbd0dd8cde356 Sumit Saxena 2022-04-29   889  			/*
7dbd0dd8cde356 Sumit Saxena 2022-04-29   890  			 * Put entry in list and bump the addresses.
7dbd0dd8cde356 Sumit Saxena 2022-04-29   891  			 *
7dbd0dd8cde356 Sumit Saxena 2022-04-29   892  			 * After PRP1 and PRP2 are filled in, this will fill in
7dbd0dd8cde356 Sumit Saxena 2022-04-29   893  			 * all remaining PRP entries in a PRP List, one per
7dbd0dd8cde356 Sumit Saxena 2022-04-29   894  			 * each time through the loop.
7dbd0dd8cde356 Sumit Saxena 2022-04-29   895  			 */
7dbd0dd8cde356 Sumit Saxena 2022-04-29   896  			*prp_entry = cpu_to_le64(dma_addr);
7dbd0dd8cde356 Sumit Saxena 2022-04-29   897  			if (*prp1_entry & sgemod_mask) {
7dbd0dd8cde356 Sumit Saxena 2022-04-29   898  				dprint_bsg_err(mrioc,
7dbd0dd8cde356 Sumit Saxena 2022-04-29   899  				    "%s: PRP address collides with SGE modifier\n",
7dbd0dd8cde356 Sumit Saxena 2022-04-29   900  				    __func__);
7dbd0dd8cde356 Sumit Saxena 2022-04-29   901  				goto err_out;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   902  			}
7dbd0dd8cde356 Sumit Saxena 2022-04-29   903  			*prp_entry &= ~sgemod_mask;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   904  			*prp_entry |= sgemod_val;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   905  			prp_entry++;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   906  			prp_entry_dma++;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   907  		}
7dbd0dd8cde356 Sumit Saxena 2022-04-29   908  
7dbd0dd8cde356 Sumit Saxena 2022-04-29   909  		/*
7dbd0dd8cde356 Sumit Saxena 2022-04-29   910  		 * Bump the phys address of the command's data buffer by the
7dbd0dd8cde356 Sumit Saxena 2022-04-29   911  		 * entry_len.
7dbd0dd8cde356 Sumit Saxena 2022-04-29   912  		 */
7dbd0dd8cde356 Sumit Saxena 2022-04-29   913  		dma_addr += entry_len;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   914  
7dbd0dd8cde356 Sumit Saxena 2022-04-29   915  		/* decrement length accounting for last partial page. */
7dbd0dd8cde356 Sumit Saxena 2022-04-29   916  		if (entry_len > length)
7dbd0dd8cde356 Sumit Saxena 2022-04-29   917  			length = 0;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   918  		else
7dbd0dd8cde356 Sumit Saxena 2022-04-29   919  			length -= entry_len;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   920  	}
7dbd0dd8cde356 Sumit Saxena 2022-04-29   921  	return 0;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   922  err_out:
7dbd0dd8cde356 Sumit Saxena 2022-04-29   923  	if (mrioc->prp_list_virt) {
7dbd0dd8cde356 Sumit Saxena 2022-04-29   924  		dma_free_coherent(&mrioc->pdev->dev, mrioc->prp_sz,
7dbd0dd8cde356 Sumit Saxena 2022-04-29   925  		    mrioc->prp_list_virt, mrioc->prp_list_dma);
7dbd0dd8cde356 Sumit Saxena 2022-04-29   926  		mrioc->prp_list_virt = NULL;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   927  	}
7dbd0dd8cde356 Sumit Saxena 2022-04-29   928  	return -1;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   929  }
506bc1a0d6ba62 Sumit Saxena 2022-04-29   930  /**
506bc1a0d6ba62 Sumit Saxena 2022-04-29   931   * mpi3mr_bsg_process_mpt_cmds - MPI Pass through BSG handler
506bc1a0d6ba62 Sumit Saxena 2022-04-29   932   * @job: BSG job reference
506bc1a0d6ba62 Sumit Saxena 2022-04-29   933   *
506bc1a0d6ba62 Sumit Saxena 2022-04-29   934   * This function is the top level handler for MPI Pass through
506bc1a0d6ba62 Sumit Saxena 2022-04-29   935   * command, this does basic validation of the input data buffers,
506bc1a0d6ba62 Sumit Saxena 2022-04-29   936   * identifies the given buffer types and MPI command, allocates
506bc1a0d6ba62 Sumit Saxena 2022-04-29   937   * DMAable memory for user given buffers, construstcs SGL
506bc1a0d6ba62 Sumit Saxena 2022-04-29   938   * properly and passes the command to the firmware.
506bc1a0d6ba62 Sumit Saxena 2022-04-29   939   *
506bc1a0d6ba62 Sumit Saxena 2022-04-29   940   * Once the MPI command is completed the driver copies the data
506bc1a0d6ba62 Sumit Saxena 2022-04-29   941   * if any and reply, sense information to user provided buffers.
506bc1a0d6ba62 Sumit Saxena 2022-04-29   942   * If the command is timed out then issues controller reset
506bc1a0d6ba62 Sumit Saxena 2022-04-29   943   * prior to returning.
506bc1a0d6ba62 Sumit Saxena 2022-04-29   944   *
506bc1a0d6ba62 Sumit Saxena 2022-04-29   945   * Return: 0 on success and proper error codes on failure
506bc1a0d6ba62 Sumit Saxena 2022-04-29   946   */
506bc1a0d6ba62 Sumit Saxena 2022-04-29   947  
506bc1a0d6ba62 Sumit Saxena 2022-04-29   948  static long mpi3mr_bsg_process_mpt_cmds(struct bsg_job *job, unsigned int *reply_payload_rcv_len)
506bc1a0d6ba62 Sumit Saxena 2022-04-29   949  {
506bc1a0d6ba62 Sumit Saxena 2022-04-29   950  	long rval = -EINVAL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29   951  
506bc1a0d6ba62 Sumit Saxena 2022-04-29   952  	struct mpi3mr_ioc *mrioc = NULL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29   953  	u8 *mpi_req = NULL, *sense_buff_k = NULL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29   954  	u8 mpi_msg_size = 0;
506bc1a0d6ba62 Sumit Saxena 2022-04-29   955  	struct mpi3mr_bsg_packet *bsg_req = NULL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29   956  	struct mpi3mr_bsg_mptcmd *karg;
506bc1a0d6ba62 Sumit Saxena 2022-04-29   957  	struct mpi3mr_buf_entry *buf_entries = NULL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29   958  	struct mpi3mr_buf_map *drv_bufs = NULL, *drv_buf_iter = NULL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29   959  	u8 count, bufcnt = 0, is_rmcb = 0, is_rmrb = 0, din_cnt = 0, dout_cnt = 0;
506bc1a0d6ba62 Sumit Saxena 2022-04-29   960  	u8 invalid_be = 0, erb_offset = 0xFF, mpirep_offset = 0xFF, sg_entries = 0;
7dbd0dd8cde356 Sumit Saxena 2022-04-29   961  	u8 block_io = 0, resp_code = 0, nvme_fmt = 0;
506bc1a0d6ba62 Sumit Saxena 2022-04-29   962  	struct mpi3_request_header *mpi_header = NULL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29   963  	struct mpi3_status_reply_descriptor *status_desc;
506bc1a0d6ba62 Sumit Saxena 2022-04-29   964  	struct mpi3_scsi_task_mgmt_request *tm_req;
506bc1a0d6ba62 Sumit Saxena 2022-04-29   965  	u32 erbsz = MPI3MR_SENSE_BUF_SZ, tmplen;
506bc1a0d6ba62 Sumit Saxena 2022-04-29   966  	u16 dev_handle;
506bc1a0d6ba62 Sumit Saxena 2022-04-29   967  	struct mpi3mr_tgt_dev *tgtdev;
506bc1a0d6ba62 Sumit Saxena 2022-04-29   968  	struct mpi3mr_stgt_priv_data *stgt_priv = NULL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29   969  	struct mpi3mr_bsg_in_reply_buf *bsg_reply_buf = NULL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29   970  	u32 din_size = 0, dout_size = 0;
506bc1a0d6ba62 Sumit Saxena 2022-04-29   971  	u8 *din_buf = NULL, *dout_buf = NULL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29   972  	u8 *sgl_iter = NULL, *sgl_din_iter = NULL, *sgl_dout_iter = NULL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29   973  
506bc1a0d6ba62 Sumit Saxena 2022-04-29   974  	bsg_req = job->request;
506bc1a0d6ba62 Sumit Saxena 2022-04-29   975  	karg = (struct mpi3mr_bsg_mptcmd *)&bsg_req->cmd.mptcmd;
506bc1a0d6ba62 Sumit Saxena 2022-04-29   976  
506bc1a0d6ba62 Sumit Saxena 2022-04-29   977  	mrioc = mpi3mr_bsg_verify_adapter(karg->mrioc_id);
506bc1a0d6ba62 Sumit Saxena 2022-04-29   978  	if (!mrioc)
506bc1a0d6ba62 Sumit Saxena 2022-04-29   979  		return -ENODEV;
506bc1a0d6ba62 Sumit Saxena 2022-04-29   980  
506bc1a0d6ba62 Sumit Saxena 2022-04-29   981  	if (karg->timeout < MPI3MR_APP_DEFAULT_TIMEOUT)
506bc1a0d6ba62 Sumit Saxena 2022-04-29   982  		karg->timeout = MPI3MR_APP_DEFAULT_TIMEOUT;
506bc1a0d6ba62 Sumit Saxena 2022-04-29   983  
506bc1a0d6ba62 Sumit Saxena 2022-04-29   984  	mpi_req = kzalloc(MPI3MR_ADMIN_REQ_FRAME_SZ, GFP_KERNEL);
506bc1a0d6ba62 Sumit Saxena 2022-04-29   985  	if (!mpi_req)
506bc1a0d6ba62 Sumit Saxena 2022-04-29   986  		return -ENOMEM;
506bc1a0d6ba62 Sumit Saxena 2022-04-29   987  	mpi_header = (struct mpi3_request_header *)mpi_req;
506bc1a0d6ba62 Sumit Saxena 2022-04-29   988  
506bc1a0d6ba62 Sumit Saxena 2022-04-29   989  	bufcnt = karg->buf_entry_list.num_of_entries;
506bc1a0d6ba62 Sumit Saxena 2022-04-29   990  	drv_bufs = kzalloc((sizeof(*drv_bufs) * bufcnt), GFP_KERNEL);
506bc1a0d6ba62 Sumit Saxena 2022-04-29   991  	if (!drv_bufs) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29   992  		rval = -ENOMEM;
506bc1a0d6ba62 Sumit Saxena 2022-04-29   993  		goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29   994  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29   995  
506bc1a0d6ba62 Sumit Saxena 2022-04-29   996  	dout_buf = kzalloc(job->request_payload.payload_len,
506bc1a0d6ba62 Sumit Saxena 2022-04-29   997  				      GFP_KERNEL);
506bc1a0d6ba62 Sumit Saxena 2022-04-29   998  	if (!dout_buf) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29   999  		rval = -ENOMEM;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1000  		goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1001  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1002  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1003  	din_buf = kzalloc(job->reply_payload.payload_len,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1004  				     GFP_KERNEL);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1005  	if (!din_buf) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1006  		rval = -ENOMEM;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1007  		goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1008  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1009  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1010  	sg_copy_to_buffer(job->request_payload.sg_list,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1011  			  job->request_payload.sg_cnt,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1012  			  dout_buf, job->request_payload.payload_len);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1013  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1014  	buf_entries = karg->buf_entry_list.buf_entry;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1015  	sgl_din_iter = din_buf;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1016  	sgl_dout_iter = dout_buf;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1017  	drv_buf_iter = drv_bufs;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1018  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1019  	for (count = 0; count < bufcnt; count++, buf_entries++, drv_buf_iter++) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1020  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1021  		if (sgl_dout_iter > (dout_buf + job->request_payload.payload_len)) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1022  			dprint_bsg_err(mrioc, "%s: data_out buffer length mismatch\n",
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1023  				__func__);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1024  			rval = -EINVAL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1025  			goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1026  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1027  		if (sgl_din_iter > (din_buf + job->reply_payload.payload_len)) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1028  			dprint_bsg_err(mrioc, "%s: data_in buffer length mismatch\n",
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1029  				__func__);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1030  			rval = -EINVAL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1031  			goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1032  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1033  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1034  		switch (buf_entries->buf_type) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1035  		case MPI3MR_BSG_BUFTYPE_RAIDMGMT_CMD:
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1036  			sgl_iter = sgl_dout_iter;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1037  			sgl_dout_iter += buf_entries->buf_len;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1038  			drv_buf_iter->data_dir = DMA_TO_DEVICE;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1039  			is_rmcb = 1;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1040  			if (count != 0)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1041  				invalid_be = 1;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1042  			break;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1043  		case MPI3MR_BSG_BUFTYPE_RAIDMGMT_RESP:
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1044  			sgl_iter = sgl_din_iter;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1045  			sgl_din_iter += buf_entries->buf_len;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1046  			drv_buf_iter->data_dir = DMA_FROM_DEVICE;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1047  			is_rmrb = 1;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1048  			if (count != 1 || !is_rmcb)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1049  				invalid_be = 1;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1050  			break;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1051  		case MPI3MR_BSG_BUFTYPE_DATA_IN:
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1052  			sgl_iter = sgl_din_iter;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1053  			sgl_din_iter += buf_entries->buf_len;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1054  			drv_buf_iter->data_dir = DMA_FROM_DEVICE;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1055  			din_cnt++;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1056  			din_size += drv_buf_iter->bsg_buf_len;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1057  			if ((din_cnt > 1) && !is_rmcb)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1058  				invalid_be = 1;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1059  			break;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1060  		case MPI3MR_BSG_BUFTYPE_DATA_OUT:
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1061  			sgl_iter = sgl_dout_iter;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1062  			sgl_dout_iter += buf_entries->buf_len;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1063  			drv_buf_iter->data_dir = DMA_TO_DEVICE;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1064  			dout_cnt++;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1065  			dout_size += drv_buf_iter->bsg_buf_len;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1066  			if ((dout_cnt > 1) && !is_rmcb)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1067  				invalid_be = 1;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1068  			break;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1069  		case MPI3MR_BSG_BUFTYPE_MPI_REPLY:
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1070  			sgl_iter = sgl_din_iter;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1071  			sgl_din_iter += buf_entries->buf_len;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1072  			drv_buf_iter->data_dir = DMA_NONE;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1073  			mpirep_offset = count;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1074  			break;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1075  		case MPI3MR_BSG_BUFTYPE_ERR_RESPONSE:
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1076  			sgl_iter = sgl_din_iter;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1077  			sgl_din_iter += buf_entries->buf_len;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1078  			drv_buf_iter->data_dir = DMA_NONE;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1079  			erb_offset = count;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1080  			break;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1081  		case MPI3MR_BSG_BUFTYPE_MPI_REQUEST:
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1082  			sgl_iter = sgl_dout_iter;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1083  			sgl_dout_iter += buf_entries->buf_len;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1084  			drv_buf_iter->data_dir = DMA_NONE;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1085  			mpi_msg_size = buf_entries->buf_len;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1086  			if ((!mpi_msg_size || (mpi_msg_size % 4)) ||
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1087  					(mpi_msg_size > MPI3MR_ADMIN_REQ_FRAME_SZ)) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1088  				dprint_bsg_err(mrioc, "%s: invalid MPI message size\n",
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1089  					__func__);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1090  				rval = -EINVAL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1091  				goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1092  			}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1093  			memcpy(mpi_req, sgl_iter, buf_entries->buf_len);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1094  			break;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1095  		default:
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1096  			invalid_be = 1;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1097  			break;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1098  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1099  		if (invalid_be) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1100  			dprint_bsg_err(mrioc, "%s: invalid buffer entries passed\n",
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1101  				__func__);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1102  			rval = -EINVAL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1103  			goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1104  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1105  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1106  		drv_buf_iter->bsg_buf = sgl_iter;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1107  		drv_buf_iter->bsg_buf_len = buf_entries->buf_len;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1108  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1109  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1110  	if (!is_rmcb && (dout_cnt || din_cnt)) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1111  		sg_entries = dout_cnt + din_cnt;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1112  		if (((mpi_msg_size) + (sg_entries *
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1113  		      sizeof(struct mpi3_sge_common))) > MPI3MR_ADMIN_REQ_FRAME_SZ) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1114  			dprint_bsg_err(mrioc,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1115  			    "%s:%d: invalid message size passed\n",
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1116  			    __func__, __LINE__);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1117  			rval = -EINVAL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1118  			goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1119  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1120  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1121  	if (din_size > MPI3MR_MAX_APP_XFER_SIZE) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1122  		dprint_bsg_err(mrioc,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1123  		    "%s:%d: invalid data transfer size passed for function 0x%x din_size=%d\n",
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1124  		    __func__, __LINE__, mpi_header->function, din_size);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1125  		rval = -EINVAL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1126  		goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1127  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1128  	if (dout_size > MPI3MR_MAX_APP_XFER_SIZE) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1129  		dprint_bsg_err(mrioc,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1130  		    "%s:%d: invalid data transfer size passed for function 0x%x dout_size = %d\n",
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1131  		    __func__, __LINE__, mpi_header->function, dout_size);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1132  		rval = -EINVAL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1133  		goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1134  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1135  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1136  	drv_buf_iter = drv_bufs;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1137  	for (count = 0; count < bufcnt; count++, drv_buf_iter++) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1138  		if (drv_buf_iter->data_dir == DMA_NONE)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1139  			continue;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1140  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1141  		drv_buf_iter->kern_buf_len = drv_buf_iter->bsg_buf_len;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1142  		if (is_rmcb && !count)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1143  			drv_buf_iter->kern_buf_len += ((dout_cnt + din_cnt) *
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1144  			    sizeof(struct mpi3_sge_common));
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1145  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1146  		if (!drv_buf_iter->kern_buf_len)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1147  			continue;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1148  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1149  		drv_buf_iter->kern_buf = dma_alloc_coherent(&mrioc->pdev->dev,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1150  		    drv_buf_iter->kern_buf_len, &drv_buf_iter->kern_buf_dma,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1151  		    GFP_KERNEL);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1152  		if (!drv_buf_iter->kern_buf) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1153  			rval = -ENOMEM;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1154  			goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1155  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1156  		if (drv_buf_iter->data_dir == DMA_TO_DEVICE) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1157  			tmplen = min(drv_buf_iter->kern_buf_len,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1158  			    drv_buf_iter->bsg_buf_len);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1159  			memcpy(drv_buf_iter->kern_buf, drv_buf_iter->bsg_buf, tmplen);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1160  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1161  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1162  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1163  	if (erb_offset != 0xFF) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1164  		sense_buff_k = kzalloc(erbsz, GFP_KERNEL);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1165  		if (!sense_buff_k) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1166  			rval = -ENOMEM;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1167  			goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1168  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1169  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1170  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1171  	if (mutex_lock_interruptible(&mrioc->bsg_cmds.mutex)) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1172  		rval = -ERESTARTSYS;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1173  		goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1174  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1175  	if (mrioc->bsg_cmds.state & MPI3MR_CMD_PENDING) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1176  		rval = -EAGAIN;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1177  		dprint_bsg_err(mrioc, "%s: command is in use\n", __func__);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1178  		mutex_unlock(&mrioc->bsg_cmds.mutex);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1179  		goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1180  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1181  	if (mrioc->unrecoverable) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1182  		dprint_bsg_err(mrioc, "%s: unrecoverable controller\n",
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1183  		    __func__);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1184  		rval = -EFAULT;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1185  		mutex_unlock(&mrioc->bsg_cmds.mutex);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1186  		goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1187  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1188  	if (mrioc->reset_in_progress) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1189  		dprint_bsg_err(mrioc, "%s: reset in progress\n", __func__);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1190  		rval = -EAGAIN;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1191  		mutex_unlock(&mrioc->bsg_cmds.mutex);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1192  		goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1193  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1194  	if (mrioc->stop_bsgs) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1195  		dprint_bsg_err(mrioc, "%s: bsgs are blocked\n", __func__);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1196  		rval = -EAGAIN;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1197  		mutex_unlock(&mrioc->bsg_cmds.mutex);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1198  		goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1199  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1200  
7dbd0dd8cde356 Sumit Saxena 2022-04-29  1201  	if (mpi_header->function == MPI3_BSG_FUNCTION_NVME_ENCAPSULATED) {
7dbd0dd8cde356 Sumit Saxena 2022-04-29  1202  		nvme_fmt = mpi3mr_get_nvme_data_fmt(
7dbd0dd8cde356 Sumit Saxena 2022-04-29  1203  			(struct mpi3_nvme_encapsulated_request *)mpi_req);
7dbd0dd8cde356 Sumit Saxena 2022-04-29  1204  		if (nvme_fmt == MPI3MR_NVME_DATA_FORMAT_PRP) {
7dbd0dd8cde356 Sumit Saxena 2022-04-29  1205  			if (mpi3mr_build_nvme_prp(mrioc,
7dbd0dd8cde356 Sumit Saxena 2022-04-29  1206  			    (struct mpi3_nvme_encapsulated_request *)mpi_req,
7dbd0dd8cde356 Sumit Saxena 2022-04-29  1207  			    drv_bufs, bufcnt)) {
7dbd0dd8cde356 Sumit Saxena 2022-04-29  1208  				rval = -ENOMEM;
7dbd0dd8cde356 Sumit Saxena 2022-04-29  1209  				mutex_unlock(&mrioc->bsg_cmds.mutex);
7dbd0dd8cde356 Sumit Saxena 2022-04-29  1210  				goto out;
7dbd0dd8cde356 Sumit Saxena 2022-04-29  1211  			}
7dbd0dd8cde356 Sumit Saxena 2022-04-29  1212  		} else if (nvme_fmt == MPI3MR_NVME_DATA_FORMAT_SGL1 ||
7dbd0dd8cde356 Sumit Saxena 2022-04-29  1213  			nvme_fmt == MPI3MR_NVME_DATA_FORMAT_SGL2) {
7dbd0dd8cde356 Sumit Saxena 2022-04-29  1214  			if (mpi3mr_build_nvme_sgl(mrioc,
7dbd0dd8cde356 Sumit Saxena 2022-04-29  1215  			    (struct mpi3_nvme_encapsulated_request *)mpi_req,
7dbd0dd8cde356 Sumit Saxena 2022-04-29  1216  			    drv_bufs, bufcnt)) {
7dbd0dd8cde356 Sumit Saxena 2022-04-29  1217  				rval = -EINVAL;
7dbd0dd8cde356 Sumit Saxena 2022-04-29  1218  				mutex_unlock(&mrioc->bsg_cmds.mutex);
7dbd0dd8cde356 Sumit Saxena 2022-04-29  1219  				goto out;
7dbd0dd8cde356 Sumit Saxena 2022-04-29  1220  			}
7dbd0dd8cde356 Sumit Saxena 2022-04-29  1221  		} else {
7dbd0dd8cde356 Sumit Saxena 2022-04-29  1222  			dprint_bsg_err(mrioc,
7dbd0dd8cde356 Sumit Saxena 2022-04-29  1223  			    "%s:invalid NVMe command format\n", __func__);
7dbd0dd8cde356 Sumit Saxena 2022-04-29  1224  			rval = -EINVAL;
7dbd0dd8cde356 Sumit Saxena 2022-04-29  1225  			mutex_unlock(&mrioc->bsg_cmds.mutex);
7dbd0dd8cde356 Sumit Saxena 2022-04-29  1226  			goto out;
7dbd0dd8cde356 Sumit Saxena 2022-04-29  1227  		}
7dbd0dd8cde356 Sumit Saxena 2022-04-29  1228  	} else {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1229  		mpi3mr_bsg_build_sgl(mpi_req, (mpi_msg_size),
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1230  		    drv_bufs, bufcnt, is_rmcb, is_rmrb,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1231  		    (dout_cnt + din_cnt));
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1232  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1233  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1234  	if (mpi_header->function == MPI3_BSG_FUNCTION_SCSI_TASK_MGMT) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1235  		tm_req = (struct mpi3_scsi_task_mgmt_request *)mpi_req;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1236  		if (tm_req->task_type !=
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1237  		    MPI3_SCSITASKMGMT_TASKTYPE_ABORT_TASK) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1238  			dev_handle = tm_req->dev_handle;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1239  			block_io = 1;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1240  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1241  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1242  	if (block_io) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1243  		tgtdev = mpi3mr_get_tgtdev_by_handle(mrioc, dev_handle);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1244  		if (tgtdev && tgtdev->starget && tgtdev->starget->hostdata) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1245  			stgt_priv = (struct mpi3mr_stgt_priv_data *)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1246  			    tgtdev->starget->hostdata;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1247  			atomic_inc(&stgt_priv->block_io);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1248  			mpi3mr_tgtdev_put(tgtdev);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1249  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1250  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1251  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1252  	mrioc->bsg_cmds.state = MPI3MR_CMD_PENDING;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1253  	mrioc->bsg_cmds.is_waiting = 1;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1254  	mrioc->bsg_cmds.callback = NULL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1255  	mrioc->bsg_cmds.is_sense = 0;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1256  	mrioc->bsg_cmds.sensebuf = sense_buff_k;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1257  	memset(mrioc->bsg_cmds.reply, 0, mrioc->reply_sz);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1258  	mpi_header->host_tag = cpu_to_le16(MPI3MR_HOSTTAG_BSG_CMDS);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1259  	if (mrioc->logging_level & MPI3_DEBUG_BSG_INFO) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1260  		dprint_bsg_info(mrioc,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1261  		    "%s: posting bsg request to the controller\n", __func__);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1262  		dprint_dump(mpi_req, MPI3MR_ADMIN_REQ_FRAME_SZ,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1263  		    "bsg_mpi3_req");
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1264  		if (mpi_header->function == MPI3_BSG_FUNCTION_MGMT_PASSTHROUGH) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1265  			drv_buf_iter = &drv_bufs[0];
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1266  			dprint_dump(drv_buf_iter->kern_buf,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1267  			    drv_buf_iter->kern_buf_len, "mpi3_mgmt_req");
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1268  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1269  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1270  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1271  	init_completion(&mrioc->bsg_cmds.done);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1272  	rval = mpi3mr_admin_request_post(mrioc, mpi_req,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1273  	    MPI3MR_ADMIN_REQ_FRAME_SZ, 0);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1274  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1275  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1276  	if (rval) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1277  		mrioc->bsg_cmds.is_waiting = 0;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1278  		dprint_bsg_err(mrioc,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1279  		    "%s: posting bsg request is failed\n", __func__);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1280  		rval = -EAGAIN;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1281  		goto out_unlock;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1282  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1283  	wait_for_completion_timeout(&mrioc->bsg_cmds.done,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1284  	    (karg->timeout * HZ));
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1285  	if (block_io && stgt_priv)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1286  		atomic_dec(&stgt_priv->block_io);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1287  	if (!(mrioc->bsg_cmds.state & MPI3MR_CMD_COMPLETE)) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1288  		mrioc->bsg_cmds.is_waiting = 0;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1289  		rval = -EAGAIN;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1290  		if (mrioc->bsg_cmds.state & MPI3MR_CMD_RESET)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1291  			goto out_unlock;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1292  		dprint_bsg_err(mrioc,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1293  		    "%s: bsg request timedout after %d seconds\n", __func__,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1294  		    karg->timeout);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1295  		if (mrioc->logging_level & MPI3_DEBUG_BSG_ERROR) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1296  			dprint_dump(mpi_req, MPI3MR_ADMIN_REQ_FRAME_SZ,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1297  			    "bsg_mpi3_req");
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1298  			if (mpi_header->function ==
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1299  			    MPI3_BSG_FUNCTION_MGMT_PASSTHROUGH) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1300  				drv_buf_iter = &drv_bufs[0];
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1301  				dprint_dump(drv_buf_iter->kern_buf,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1302  				    drv_buf_iter->kern_buf_len, "mpi3_mgmt_req");
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1303  			}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1304  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1305  
7dbd0dd8cde356 Sumit Saxena 2022-04-29  1306  		if ((mpi_header->function == MPI3_BSG_FUNCTION_NVME_ENCAPSULATED) ||
7dbd0dd8cde356 Sumit Saxena 2022-04-29  1307  		    (mpi_header->function == MPI3_BSG_FUNCTION_SCSI_IO))
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1308  			mpi3mr_issue_tm(mrioc,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1309  			    MPI3_SCSITASKMGMT_TASKTYPE_TARGET_RESET,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1310  			    mpi_header->function_dependent, 0,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1311  			    MPI3MR_HOSTTAG_BLK_TMS, MPI3MR_RESETTM_TIMEOUT,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1312  			    &mrioc->host_tm_cmds, &resp_code, NULL);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1313  		if (!(mrioc->bsg_cmds.state & MPI3MR_CMD_COMPLETE) &&
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1314  		    !(mrioc->bsg_cmds.state & MPI3MR_CMD_RESET))
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1315  			mpi3mr_soft_reset_handler(mrioc,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1316  			    MPI3MR_RESET_FROM_APP_TIMEOUT, 1);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1317  		goto out_unlock;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1318  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1319  	dprint_bsg_info(mrioc, "%s: bsg request is completed\n", __func__);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1320  
7dbd0dd8cde356 Sumit Saxena 2022-04-29  1321  	if (mrioc->prp_list_virt) {
7dbd0dd8cde356 Sumit Saxena 2022-04-29  1322  		dma_free_coherent(&mrioc->pdev->dev, mrioc->prp_sz,
7dbd0dd8cde356 Sumit Saxena 2022-04-29  1323  		    mrioc->prp_list_virt, mrioc->prp_list_dma);
7dbd0dd8cde356 Sumit Saxena 2022-04-29  1324  		mrioc->prp_list_virt = NULL;
7dbd0dd8cde356 Sumit Saxena 2022-04-29  1325  	}
7dbd0dd8cde356 Sumit Saxena 2022-04-29  1326  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1327  	if ((mrioc->bsg_cmds.ioc_status & MPI3_IOCSTATUS_STATUS_MASK)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1328  	     != MPI3_IOCSTATUS_SUCCESS) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1329  		dprint_bsg_info(mrioc,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1330  		    "%s: command failed, ioc_status(0x%04x) log_info(0x%08x)\n",
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1331  		    __func__,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1332  		    (mrioc->bsg_cmds.ioc_status & MPI3_IOCSTATUS_STATUS_MASK),
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1333  		    mrioc->bsg_cmds.ioc_loginfo);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1334  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1335  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1336  	if ((mpirep_offset != 0xFF) &&
506bc1a0d6ba62 Sumit Saxena 2022-04-29 @1337  	    drv_bufs[mpirep_offset].bsg_buf_len) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1338  		drv_buf_iter = &drv_bufs[mpirep_offset];
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1339  		drv_buf_iter->kern_buf_len = (sizeof(*bsg_reply_buf) - 1 +
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1340  					   mrioc->reply_sz);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1341  		bsg_reply_buf = kzalloc(drv_buf_iter->kern_buf_len, GFP_KERNEL);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1342  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1343  		if (!bsg_reply_buf) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1344  			rval = -ENOMEM;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1345  			goto out_unlock;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1346  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1347  		if (mrioc->bsg_cmds.state & MPI3MR_CMD_REPLY_VALID) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1348  			bsg_reply_buf->mpi_reply_type =
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1349  				MPI3MR_BSG_MPI_REPLY_BUFTYPE_ADDRESS;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1350  			memcpy(bsg_reply_buf->reply_buf,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1351  			    mrioc->bsg_cmds.reply, mrioc->reply_sz);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1352  		} else {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1353  			bsg_reply_buf->mpi_reply_type =
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1354  				MPI3MR_BSG_MPI_REPLY_BUFTYPE_STATUS;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1355  			status_desc = (struct mpi3_status_reply_descriptor *)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1356  			    bsg_reply_buf->reply_buf;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1357  			status_desc->ioc_status = mrioc->bsg_cmds.ioc_status;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1358  			status_desc->ioc_log_info = mrioc->bsg_cmds.ioc_loginfo;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1359  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1360  		tmplen = min(drv_buf_iter->kern_buf_len,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1361  			drv_buf_iter->bsg_buf_len);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1362  		memcpy(drv_buf_iter->bsg_buf, bsg_reply_buf, tmplen);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1363  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1364  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1365  	if (erb_offset != 0xFF && mrioc->bsg_cmds.sensebuf &&
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1366  	    mrioc->bsg_cmds.is_sense) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29 @1367  		drv_buf_iter = &drv_bufs[erb_offset];
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1368  		tmplen = min(erbsz, drv_buf_iter->bsg_buf_len);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1369  		memcpy(drv_buf_iter->bsg_buf, sense_buff_k, tmplen);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1370  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1371  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1372  	drv_buf_iter = drv_bufs;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1373  	for (count = 0; count < bufcnt; count++, drv_buf_iter++) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1374  		if (drv_buf_iter->data_dir == DMA_NONE)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1375  			continue;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1376  		if (drv_buf_iter->data_dir == DMA_FROM_DEVICE) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1377  			tmplen = min(drv_buf_iter->kern_buf_len,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1378  				     drv_buf_iter->bsg_buf_len);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1379  			memcpy(drv_buf_iter->bsg_buf,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1380  			       drv_buf_iter->kern_buf, tmplen);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1381  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1382  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1383  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1384  out_unlock:
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1385  	if (din_buf) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1386  		*reply_payload_rcv_len =
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1387  			sg_copy_from_buffer(job->reply_payload.sg_list,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1388  					    job->reply_payload.sg_cnt,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1389  					    din_buf, job->reply_payload.payload_len);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1390  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1391  	mrioc->bsg_cmds.is_sense = 0;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1392  	mrioc->bsg_cmds.sensebuf = NULL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1393  	mrioc->bsg_cmds.state = MPI3MR_CMD_NOTUSED;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1394  	mutex_unlock(&mrioc->bsg_cmds.mutex);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1395  out:
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1396  	kfree(sense_buff_k);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1397  	kfree(dout_buf);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1398  	kfree(din_buf);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1399  	kfree(mpi_req);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1400  	if (drv_bufs) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1401  		drv_buf_iter = drv_bufs;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1402  		for (count = 0; count < bufcnt; count++, drv_buf_iter++) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1403  			if (drv_buf_iter->kern_buf && drv_buf_iter->kern_buf_dma)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1404  				dma_free_coherent(&mrioc->pdev->dev,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1405  				    drv_buf_iter->kern_buf_len,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1406  				    drv_buf_iter->kern_buf,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1407  				    drv_buf_iter->kern_buf_dma);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1408  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1409  		kfree(drv_bufs);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1410  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1411  	kfree(bsg_reply_buf);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1412  	return rval;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1413  }
506bc1a0d6ba62 Sumit Saxena 2022-04-29  1414  

:::::: The code at line 1337 was first introduced by commit
:::::: 506bc1a0d6ba626492c06e5632a3fbe202770fd2 scsi: mpi3mr: Add support for MPT commands

:::::: TO: Sumit Saxena <sumit.saxena@broadcom.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
