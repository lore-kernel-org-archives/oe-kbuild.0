Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF5163A0
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Dec 2023 05:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lrUMDTGi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702531195; x=1734067195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RGxsx0FM/zwiNIjr5JcAw9KGVd1ASTE7hsl0s3Rpb30=;
  b=lrUMDTGiT3gPrEsR58v8zVGPeYOXPiBD0rLjNrbEv3t5Z3wxAn+D0irQ
   5IaYEGAX958TUNRoufYAz9DGaLMwUbZPxi0b28JCj4gKGRA0l0vD/QrxS
   auxY4VpoIKXMIj332kWBW5E0m1UkBIgX1yEkukL5m0M6CbYTHZDM0Qft7
   pTR1TkAYlC75vsCwUnyh5A2PIWsC0eLHODMl6JF/sy9X9uL8eO1okgQSl
   WqCFd7uxRhxSfZXZ9HqdMAmLs0wRqFV6btmMYebtzsVD0FBFyZXLn/FJ7
   UfuqMCaX89PHSKwhpa2F80wKHdrLt360KUbHeRCcxcSmcKwMxR+YLMzHJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="375225551"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="375225551"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 21:19:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="897612769"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="897612769"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 13 Dec 2023 21:19:52 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDe8U-000LcD-0E;
	Thu, 14 Dec 2023 05:19:50 +0000
Date: Thu, 14 Dec 2023 13:19:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 4424/7300] drivers/scsi/mpi3mr/mpi3mr_app.c:712
 mpi3mr_bsg_build_sgl() warn: missing unwind goto?
Message-ID: <202312141327.iY7oEhov-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Chandrakanth patil <chandrakanth.patil@broadcom.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Sathya Prakash <sathya.prakash@broadcom.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   48e8992e33abf054bcc0bb2e77b2d43bb899212e
commit: fb231d7deffb41fd445929a3b79815277b883fec [4424/7300] scsi: mpi3mr: Support for preallocation of SGL BSG data buffers part-2
:::::: branch date: 25 hours ago
:::::: commit date: 8 days ago
config: x86_64-randconfig-161-20231214 (https://download.01.org/0day-ci/archive/20231214/202312141327.iY7oEhov-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231214/202312141327.iY7oEhov-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312141327.iY7oEhov-lkp@intel.com/

New smatch warnings:
drivers/scsi/mpi3mr/mpi3mr_app.c:712 mpi3mr_bsg_build_sgl() warn: missing unwind goto?
drivers/scsi/mpi3mr/mpi3mr_app.c:1091 mpi3mr_map_data_buffer_dma() warn: returning -1 instead of -ENOMEM is sloppy

Old smatch warnings:
drivers/scsi/mpi3mr/mpi3mr_app.c:1567 mpi3mr_bsg_process_mpt_cmds() warn: potentially one past the end of array 'drv_bufs[mpirep_offset]'
drivers/scsi/mpi3mr/mpi3mr_app.c:1567 mpi3mr_bsg_process_mpt_cmds() warn: potentially one past the end of array 'drv_bufs[mpirep_offset]'
drivers/scsi/mpi3mr/mpi3mr_app.c:1568 mpi3mr_bsg_process_mpt_cmds() warn: potentially one past the end of array 'drv_bufs[mpirep_offset]'
drivers/scsi/mpi3mr/mpi3mr_app.c:1597 mpi3mr_bsg_process_mpt_cmds() warn: potentially one past the end of array 'drv_bufs[erb_offset]'

vim +712 drivers/scsi/mpi3mr/mpi3mr_app.c

fb231d7deffb41 Chandrakanth patil 2023-12-06  593  
506bc1a0d6ba62 Sumit Saxena       2022-04-29  594  /**
506bc1a0d6ba62 Sumit Saxena       2022-04-29  595   * mpi3mr_bsg_build_sgl - SGL construction for MPI commands
fb231d7deffb41 Chandrakanth patil 2023-12-06  596   * @mrioc: Adapter instance reference
506bc1a0d6ba62 Sumit Saxena       2022-04-29  597   * @mpi_req: MPI request
506bc1a0d6ba62 Sumit Saxena       2022-04-29  598   * @sgl_offset: offset to start sgl in the MPI request
506bc1a0d6ba62 Sumit Saxena       2022-04-29  599   * @drv_bufs: DMA address of the buffers to be placed in sgl
506bc1a0d6ba62 Sumit Saxena       2022-04-29  600   * @bufcnt: Number of DMA buffers
506bc1a0d6ba62 Sumit Saxena       2022-04-29  601   * @is_rmc: Does the buffer list has management command buffer
506bc1a0d6ba62 Sumit Saxena       2022-04-29  602   * @is_rmr: Does the buffer list has management response buffer
506bc1a0d6ba62 Sumit Saxena       2022-04-29  603   * @num_datasges: Number of data buffers in the list
506bc1a0d6ba62 Sumit Saxena       2022-04-29  604   *
506bc1a0d6ba62 Sumit Saxena       2022-04-29  605   * This function places the DMA address of the given buffers in
506bc1a0d6ba62 Sumit Saxena       2022-04-29  606   * proper format as SGEs in the given MPI request.
506bc1a0d6ba62 Sumit Saxena       2022-04-29  607   *
fb231d7deffb41 Chandrakanth patil 2023-12-06  608   * Return: 0 on success,-1 on failure
506bc1a0d6ba62 Sumit Saxena       2022-04-29  609   */
fb231d7deffb41 Chandrakanth patil 2023-12-06  610  static int mpi3mr_bsg_build_sgl(struct mpi3mr_ioc *mrioc, u8 *mpi_req,
fb231d7deffb41 Chandrakanth patil 2023-12-06  611  				u32 sgl_offset, struct mpi3mr_buf_map *drv_bufs,
fb231d7deffb41 Chandrakanth patil 2023-12-06  612  				u8 bufcnt, u8 is_rmc, u8 is_rmr, u8 num_datasges)
506bc1a0d6ba62 Sumit Saxena       2022-04-29  613  {
fb231d7deffb41 Chandrakanth patil 2023-12-06  614  	struct mpi3_request_header *mpi_header =
fb231d7deffb41 Chandrakanth patil 2023-12-06  615  		(struct mpi3_request_header *)mpi_req;
506bc1a0d6ba62 Sumit Saxena       2022-04-29  616  	u8 *sgl = (mpi_req + sgl_offset), count = 0;
506bc1a0d6ba62 Sumit Saxena       2022-04-29  617  	struct mpi3_mgmt_passthrough_request *rmgmt_req =
506bc1a0d6ba62 Sumit Saxena       2022-04-29  618  	    (struct mpi3_mgmt_passthrough_request *)mpi_req;
506bc1a0d6ba62 Sumit Saxena       2022-04-29  619  	struct mpi3mr_buf_map *drv_buf_iter = drv_bufs;
fb231d7deffb41 Chandrakanth patil 2023-12-06  620  	u8 flag, sgl_flags, sgl_flag_eob, sgl_flags_last, last_chain_sgl_flag;
fb231d7deffb41 Chandrakanth patil 2023-12-06  621  	u16 available_sges, i, sges_needed;
fb231d7deffb41 Chandrakanth patil 2023-12-06  622  	u32 sge_element_size = sizeof(struct mpi3_sge_common);
fb231d7deffb41 Chandrakanth patil 2023-12-06  623  	bool chain_used = false;
506bc1a0d6ba62 Sumit Saxena       2022-04-29  624  
506bc1a0d6ba62 Sumit Saxena       2022-04-29  625  	sgl_flags = MPI3_SGE_FLAGS_ELEMENT_TYPE_SIMPLE |
fb231d7deffb41 Chandrakanth patil 2023-12-06  626  		MPI3_SGE_FLAGS_DLAS_SYSTEM;
fb231d7deffb41 Chandrakanth patil 2023-12-06  627  	sgl_flag_eob = sgl_flags | MPI3_SGE_FLAGS_END_OF_BUFFER;
fb231d7deffb41 Chandrakanth patil 2023-12-06  628  	sgl_flags_last = sgl_flag_eob | MPI3_SGE_FLAGS_END_OF_LIST;
fb231d7deffb41 Chandrakanth patil 2023-12-06  629  	last_chain_sgl_flag = MPI3_SGE_FLAGS_ELEMENT_TYPE_LAST_CHAIN |
fb231d7deffb41 Chandrakanth patil 2023-12-06  630  	    MPI3_SGE_FLAGS_DLAS_SYSTEM;
fb231d7deffb41 Chandrakanth patil 2023-12-06  631  
fb231d7deffb41 Chandrakanth patil 2023-12-06  632  	sges_needed = mpi3mr_total_num_ioctl_sges(drv_bufs, bufcnt);
506bc1a0d6ba62 Sumit Saxena       2022-04-29  633  
506bc1a0d6ba62 Sumit Saxena       2022-04-29  634  	if (is_rmc) {
506bc1a0d6ba62 Sumit Saxena       2022-04-29  635  		mpi3mr_add_sg_single(&rmgmt_req->command_sgl,
506bc1a0d6ba62 Sumit Saxena       2022-04-29  636  		    sgl_flags_last, drv_buf_iter->kern_buf_len,
506bc1a0d6ba62 Sumit Saxena       2022-04-29  637  		    drv_buf_iter->kern_buf_dma);
fb231d7deffb41 Chandrakanth patil 2023-12-06  638  		sgl = (u8 *)drv_buf_iter->kern_buf +
fb231d7deffb41 Chandrakanth patil 2023-12-06  639  			drv_buf_iter->bsg_buf_len;
fb231d7deffb41 Chandrakanth patil 2023-12-06  640  		available_sges = (drv_buf_iter->kern_buf_len -
fb231d7deffb41 Chandrakanth patil 2023-12-06  641  		    drv_buf_iter->bsg_buf_len) / sge_element_size;
fb231d7deffb41 Chandrakanth patil 2023-12-06  642  
fb231d7deffb41 Chandrakanth patil 2023-12-06  643  		if (sges_needed > available_sges)
fb231d7deffb41 Chandrakanth patil 2023-12-06  644  			return -1;
fb231d7deffb41 Chandrakanth patil 2023-12-06  645  
fb231d7deffb41 Chandrakanth patil 2023-12-06  646  		chain_used = true;
506bc1a0d6ba62 Sumit Saxena       2022-04-29  647  		drv_buf_iter++;
506bc1a0d6ba62 Sumit Saxena       2022-04-29  648  		count++;
506bc1a0d6ba62 Sumit Saxena       2022-04-29  649  		if (is_rmr) {
506bc1a0d6ba62 Sumit Saxena       2022-04-29  650  			mpi3mr_add_sg_single(&rmgmt_req->response_sgl,
506bc1a0d6ba62 Sumit Saxena       2022-04-29  651  			    sgl_flags_last, drv_buf_iter->kern_buf_len,
506bc1a0d6ba62 Sumit Saxena       2022-04-29  652  			    drv_buf_iter->kern_buf_dma);
506bc1a0d6ba62 Sumit Saxena       2022-04-29  653  			drv_buf_iter++;
506bc1a0d6ba62 Sumit Saxena       2022-04-29  654  			count++;
506bc1a0d6ba62 Sumit Saxena       2022-04-29  655  		} else
506bc1a0d6ba62 Sumit Saxena       2022-04-29  656  			mpi3mr_build_zero_len_sge(
506bc1a0d6ba62 Sumit Saxena       2022-04-29  657  			    &rmgmt_req->response_sgl);
fb231d7deffb41 Chandrakanth patil 2023-12-06  658  		if (num_datasges) {
fb231d7deffb41 Chandrakanth patil 2023-12-06  659  			i = 0;
fb231d7deffb41 Chandrakanth patil 2023-12-06  660  			goto build_sges;
fb231d7deffb41 Chandrakanth patil 2023-12-06  661  		}
fb231d7deffb41 Chandrakanth patil 2023-12-06  662  	} else {
fb231d7deffb41 Chandrakanth patil 2023-12-06  663  		if (sgl_offset >= MPI3MR_ADMIN_REQ_FRAME_SZ)
fb231d7deffb41 Chandrakanth patil 2023-12-06  664  			return -1;
fb231d7deffb41 Chandrakanth patil 2023-12-06  665  		available_sges = (MPI3MR_ADMIN_REQ_FRAME_SZ - sgl_offset) /
fb231d7deffb41 Chandrakanth patil 2023-12-06  666  		sge_element_size;
fb231d7deffb41 Chandrakanth patil 2023-12-06  667  		if (!available_sges)
fb231d7deffb41 Chandrakanth patil 2023-12-06  668  			return -1;
506bc1a0d6ba62 Sumit Saxena       2022-04-29  669  	}
506bc1a0d6ba62 Sumit Saxena       2022-04-29  670  	if (!num_datasges) {
506bc1a0d6ba62 Sumit Saxena       2022-04-29  671  		mpi3mr_build_zero_len_sge(sgl);
fb231d7deffb41 Chandrakanth patil 2023-12-06  672  		return 0;
506bc1a0d6ba62 Sumit Saxena       2022-04-29  673  	}
fb231d7deffb41 Chandrakanth patil 2023-12-06  674  	if (mpi_header->function == MPI3_BSG_FUNCTION_SMP_PASSTHROUGH) {
fb231d7deffb41 Chandrakanth patil 2023-12-06  675  		if ((sges_needed > 2) || (sges_needed > available_sges))
fb231d7deffb41 Chandrakanth patil 2023-12-06  676  			return -1;
506bc1a0d6ba62 Sumit Saxena       2022-04-29  677  		for (; count < bufcnt; count++, drv_buf_iter++) {
fb231d7deffb41 Chandrakanth patil 2023-12-06  678  			if (drv_buf_iter->data_dir == DMA_NONE ||
fb231d7deffb41 Chandrakanth patil 2023-12-06  679  			    !drv_buf_iter->num_dma_desc)
506bc1a0d6ba62 Sumit Saxena       2022-04-29  680  				continue;
506bc1a0d6ba62 Sumit Saxena       2022-04-29  681  			mpi3mr_add_sg_single(sgl, sgl_flags_last,
fb231d7deffb41 Chandrakanth patil 2023-12-06  682  					     drv_buf_iter->dma_desc[0].size,
fb231d7deffb41 Chandrakanth patil 2023-12-06  683  					     drv_buf_iter->dma_desc[0].dma_addr);
fb231d7deffb41 Chandrakanth patil 2023-12-06  684  			sgl += sge_element_size;
fb231d7deffb41 Chandrakanth patil 2023-12-06  685  		}
fb231d7deffb41 Chandrakanth patil 2023-12-06  686  		return 0;
fb231d7deffb41 Chandrakanth patil 2023-12-06  687  	}
fb231d7deffb41 Chandrakanth patil 2023-12-06  688  	i = 0;
fb231d7deffb41 Chandrakanth patil 2023-12-06  689  
fb231d7deffb41 Chandrakanth patil 2023-12-06  690  build_sges:
fb231d7deffb41 Chandrakanth patil 2023-12-06  691  	for (; count < bufcnt; count++, drv_buf_iter++) {
fb231d7deffb41 Chandrakanth patil 2023-12-06  692  		if (drv_buf_iter->data_dir == DMA_NONE)
fb231d7deffb41 Chandrakanth patil 2023-12-06  693  			continue;
fb231d7deffb41 Chandrakanth patil 2023-12-06  694  		if (!drv_buf_iter->num_dma_desc) {
fb231d7deffb41 Chandrakanth patil 2023-12-06  695  			if (chain_used && !available_sges)
fb231d7deffb41 Chandrakanth patil 2023-12-06  696  				return -1;
fb231d7deffb41 Chandrakanth patil 2023-12-06  697  			if (!chain_used && (available_sges == 1) &&
fb231d7deffb41 Chandrakanth patil 2023-12-06  698  			    (sges_needed > 1))
fb231d7deffb41 Chandrakanth patil 2023-12-06  699  				goto setup_chain;
fb231d7deffb41 Chandrakanth patil 2023-12-06  700  			flag = sgl_flag_eob;
fb231d7deffb41 Chandrakanth patil 2023-12-06  701  			if (num_datasges == 1)
fb231d7deffb41 Chandrakanth patil 2023-12-06  702  				flag = sgl_flags_last;
fb231d7deffb41 Chandrakanth patil 2023-12-06  703  			mpi3mr_add_sg_single(sgl, flag, 0, 0);
fb231d7deffb41 Chandrakanth patil 2023-12-06  704  			sgl += sge_element_size;
fb231d7deffb41 Chandrakanth patil 2023-12-06  705  			sges_needed--;
fb231d7deffb41 Chandrakanth patil 2023-12-06  706  			available_sges--;
fb231d7deffb41 Chandrakanth patil 2023-12-06  707  			num_datasges--;
fb231d7deffb41 Chandrakanth patil 2023-12-06  708  			continue;
fb231d7deffb41 Chandrakanth patil 2023-12-06  709  		}
fb231d7deffb41 Chandrakanth patil 2023-12-06  710  		for (; i < drv_buf_iter->num_dma_desc; i++) {
fb231d7deffb41 Chandrakanth patil 2023-12-06  711  			if (chain_used && !available_sges)
fb231d7deffb41 Chandrakanth patil 2023-12-06 @712  				return -1;
fb231d7deffb41 Chandrakanth patil 2023-12-06  713  			if (!chain_used && (available_sges == 1) &&
fb231d7deffb41 Chandrakanth patil 2023-12-06  714  			    (sges_needed > 1))
fb231d7deffb41 Chandrakanth patil 2023-12-06  715  				goto setup_chain;
fb231d7deffb41 Chandrakanth patil 2023-12-06  716  			flag = sgl_flags;
fb231d7deffb41 Chandrakanth patil 2023-12-06  717  			if (i == (drv_buf_iter->num_dma_desc - 1)) {
fb231d7deffb41 Chandrakanth patil 2023-12-06  718  				if (num_datasges == 1)
fb231d7deffb41 Chandrakanth patil 2023-12-06  719  					flag = sgl_flags_last;
506bc1a0d6ba62 Sumit Saxena       2022-04-29  720  				else
fb231d7deffb41 Chandrakanth patil 2023-12-06  721  					flag = sgl_flag_eob;
fb231d7deffb41 Chandrakanth patil 2023-12-06  722  			}
fb231d7deffb41 Chandrakanth patil 2023-12-06  723  
fb231d7deffb41 Chandrakanth patil 2023-12-06  724  			mpi3mr_add_sg_single(sgl, flag,
fb231d7deffb41 Chandrakanth patil 2023-12-06  725  					     drv_buf_iter->dma_desc[i].size,
fb231d7deffb41 Chandrakanth patil 2023-12-06  726  					     drv_buf_iter->dma_desc[i].dma_addr);
fb231d7deffb41 Chandrakanth patil 2023-12-06  727  			sgl += sge_element_size;
fb231d7deffb41 Chandrakanth patil 2023-12-06  728  			available_sges--;
fb231d7deffb41 Chandrakanth patil 2023-12-06  729  			sges_needed--;
fb231d7deffb41 Chandrakanth patil 2023-12-06  730  		}
506bc1a0d6ba62 Sumit Saxena       2022-04-29  731  		num_datasges--;
fb231d7deffb41 Chandrakanth patil 2023-12-06  732  		i = 0;
506bc1a0d6ba62 Sumit Saxena       2022-04-29  733  	}
fb231d7deffb41 Chandrakanth patil 2023-12-06  734  	return 0;
fb231d7deffb41 Chandrakanth patil 2023-12-06  735  
fb231d7deffb41 Chandrakanth patil 2023-12-06  736  setup_chain:
fb231d7deffb41 Chandrakanth patil 2023-12-06  737  	available_sges = mrioc->ioctl_chain_sge.size / sge_element_size;
fb231d7deffb41 Chandrakanth patil 2023-12-06  738  	if (sges_needed > available_sges)
fb231d7deffb41 Chandrakanth patil 2023-12-06  739  		return -1;
fb231d7deffb41 Chandrakanth patil 2023-12-06  740  	mpi3mr_add_sg_single(sgl, last_chain_sgl_flag,
fb231d7deffb41 Chandrakanth patil 2023-12-06  741  			     (sges_needed * sge_element_size),
fb231d7deffb41 Chandrakanth patil 2023-12-06  742  			     mrioc->ioctl_chain_sge.dma_addr);
fb231d7deffb41 Chandrakanth patil 2023-12-06  743  	memset(mrioc->ioctl_chain_sge.addr, 0, mrioc->ioctl_chain_sge.size);
fb231d7deffb41 Chandrakanth patil 2023-12-06  744  	sgl = (u8 *)mrioc->ioctl_chain_sge.addr;
fb231d7deffb41 Chandrakanth patil 2023-12-06  745  	chain_used = true;
fb231d7deffb41 Chandrakanth patil 2023-12-06  746  	goto build_sges;
506bc1a0d6ba62 Sumit Saxena       2022-04-29  747  }
506bc1a0d6ba62 Sumit Saxena       2022-04-29  748  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
