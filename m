Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9FC10EC
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Mar 2023 09:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679217607; x=1710753607;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UrSVn/s6i1qw1xuPqbkzXY8RwNQ3ffgmIHwGLNKjR1o=;
  b=cjGm4gIKprRl72WzbEodlV+ktDpRhfwC7e1Dyj17vcRvovKZg4OyCOcg
   PG//W7xBXo76eD7OhZ8Y15VgcPv8LOk1yX6OVgea57PqzdDo/ljlwAyN/
   EtvWNcnmgHBE2XAZ8y9FyDiGVffzYLdkkFgLSG782iSnq1SUyATi/Ot2F
   hWdhBLS2ElyDjIZb0SBE4GYv5FUauu6/sbvTCtcDlWU4hmQ2JYw4d4CMF
   sLmrkefKjE5BWyxe1Vwlf/yvq1aCcxH5qSTpOucGBQTDTSizB8rPEzy8a
   XROCRJf2aZZv5cCp1iJV3iy5fcgh/6misJieFKtdvYLafh7GSiwTbPztN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="340029970"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="340029970"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2023 02:20:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="804602009"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="804602009"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 19 Mar 2023 02:20:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdpCu-000ATy-0t;
	Sun, 19 Mar 2023 09:20:04 +0000
Date: Sun, 19 Mar 2023 17:19:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/scsi/mpi3mr/mpi3mr_app.c:822 mpi3mr_bsg_process_mpt_cmds()
 warn: potentially one past the end of array 'drv_bufs[mpirep_offset]'
Message-ID: <202303191748.U9bmP8w0-lkp@intel.com>
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
TO: Sumit Saxena <sumit.saxena@broadcom.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Himanshu Madhani <himanshu.madhani@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a3671bd86a9770e34969522d29bb30a1b66fd88a
commit: 506bc1a0d6ba626492c06e5632a3fbe202770fd2 scsi: mpi3mr: Add support for MPT commands
date:   11 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 11 months ago
config: riscv-randconfig-m031-20230319 (https://download.01.org/0day-ci/archive/20230319/202303191748.U9bmP8w0-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303191748.U9bmP8w0-lkp@intel.com/

New smatch warnings:
drivers/scsi/mpi3mr/mpi3mr_app.c:822 mpi3mr_bsg_process_mpt_cmds() warn: potentially one past the end of array 'drv_bufs[mpirep_offset]'
drivers/scsi/mpi3mr/mpi3mr_app.c:822 mpi3mr_bsg_process_mpt_cmds() warn: potentially one past the end of array 'drv_bufs[mpirep_offset]'
drivers/scsi/mpi3mr/mpi3mr_app.c:852 mpi3mr_bsg_process_mpt_cmds() warn: potentially one past the end of array 'drv_bufs[erb_offset]'

Old smatch warnings:
drivers/scsi/mpi3mr/mpi3mr_app.c:823 mpi3mr_bsg_process_mpt_cmds() warn: potentially one past the end of array 'drv_bufs[mpirep_offset]'

vim +822 drivers/scsi/mpi3mr/mpi3mr_app.c

506bc1a0d6ba62 Sumit Saxena 2022-04-29  448  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  449  /**
506bc1a0d6ba62 Sumit Saxena 2022-04-29  450   * mpi3mr_bsg_process_mpt_cmds - MPI Pass through BSG handler
506bc1a0d6ba62 Sumit Saxena 2022-04-29  451   * @job: BSG job reference
506bc1a0d6ba62 Sumit Saxena 2022-04-29  452   *
506bc1a0d6ba62 Sumit Saxena 2022-04-29  453   * This function is the top level handler for MPI Pass through
506bc1a0d6ba62 Sumit Saxena 2022-04-29  454   * command, this does basic validation of the input data buffers,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  455   * identifies the given buffer types and MPI command, allocates
506bc1a0d6ba62 Sumit Saxena 2022-04-29  456   * DMAable memory for user given buffers, construstcs SGL
506bc1a0d6ba62 Sumit Saxena 2022-04-29  457   * properly and passes the command to the firmware.
506bc1a0d6ba62 Sumit Saxena 2022-04-29  458   *
506bc1a0d6ba62 Sumit Saxena 2022-04-29  459   * Once the MPI command is completed the driver copies the data
506bc1a0d6ba62 Sumit Saxena 2022-04-29  460   * if any and reply, sense information to user provided buffers.
506bc1a0d6ba62 Sumit Saxena 2022-04-29  461   * If the command is timed out then issues controller reset
506bc1a0d6ba62 Sumit Saxena 2022-04-29  462   * prior to returning.
506bc1a0d6ba62 Sumit Saxena 2022-04-29  463   *
506bc1a0d6ba62 Sumit Saxena 2022-04-29  464   * Return: 0 on success and proper error codes on failure
506bc1a0d6ba62 Sumit Saxena 2022-04-29  465   */
506bc1a0d6ba62 Sumit Saxena 2022-04-29  466  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  467  static long mpi3mr_bsg_process_mpt_cmds(struct bsg_job *job, unsigned int *reply_payload_rcv_len)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  468  {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  469  	long rval = -EINVAL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  470  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  471  	struct mpi3mr_ioc *mrioc = NULL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  472  	u8 *mpi_req = NULL, *sense_buff_k = NULL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  473  	u8 mpi_msg_size = 0;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  474  	struct mpi3mr_bsg_packet *bsg_req = NULL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  475  	struct mpi3mr_bsg_mptcmd *karg;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  476  	struct mpi3mr_buf_entry *buf_entries = NULL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  477  	struct mpi3mr_buf_map *drv_bufs = NULL, *drv_buf_iter = NULL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  478  	u8 count, bufcnt = 0, is_rmcb = 0, is_rmrb = 0, din_cnt = 0, dout_cnt = 0;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  479  	u8 invalid_be = 0, erb_offset = 0xFF, mpirep_offset = 0xFF, sg_entries = 0;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  480  	u8 block_io = 0, resp_code = 0;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  481  	struct mpi3_request_header *mpi_header = NULL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  482  	struct mpi3_status_reply_descriptor *status_desc;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  483  	struct mpi3_scsi_task_mgmt_request *tm_req;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  484  	u32 erbsz = MPI3MR_SENSE_BUF_SZ, tmplen;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  485  	u16 dev_handle;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  486  	struct mpi3mr_tgt_dev *tgtdev;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  487  	struct mpi3mr_stgt_priv_data *stgt_priv = NULL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  488  	struct mpi3mr_bsg_in_reply_buf *bsg_reply_buf = NULL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  489  	u32 din_size = 0, dout_size = 0;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  490  	u8 *din_buf = NULL, *dout_buf = NULL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  491  	u8 *sgl_iter = NULL, *sgl_din_iter = NULL, *sgl_dout_iter = NULL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  492  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  493  	bsg_req = job->request;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  494  	karg = (struct mpi3mr_bsg_mptcmd *)&bsg_req->cmd.mptcmd;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  495  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  496  	mrioc = mpi3mr_bsg_verify_adapter(karg->mrioc_id);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  497  	if (!mrioc)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  498  		return -ENODEV;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  499  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  500  	if (karg->timeout < MPI3MR_APP_DEFAULT_TIMEOUT)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  501  		karg->timeout = MPI3MR_APP_DEFAULT_TIMEOUT;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  502  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  503  	mpi_req = kzalloc(MPI3MR_ADMIN_REQ_FRAME_SZ, GFP_KERNEL);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  504  	if (!mpi_req)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  505  		return -ENOMEM;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  506  	mpi_header = (struct mpi3_request_header *)mpi_req;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  507  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  508  	bufcnt = karg->buf_entry_list.num_of_entries;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  509  	drv_bufs = kzalloc((sizeof(*drv_bufs) * bufcnt), GFP_KERNEL);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  510  	if (!drv_bufs) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  511  		rval = -ENOMEM;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  512  		goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  513  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  514  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  515  	dout_buf = kzalloc(job->request_payload.payload_len,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  516  				      GFP_KERNEL);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  517  	if (!dout_buf) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  518  		rval = -ENOMEM;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  519  		goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  520  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  521  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  522  	din_buf = kzalloc(job->reply_payload.payload_len,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  523  				     GFP_KERNEL);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  524  	if (!din_buf) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  525  		rval = -ENOMEM;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  526  		goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  527  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  528  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  529  	sg_copy_to_buffer(job->request_payload.sg_list,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  530  			  job->request_payload.sg_cnt,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  531  			  dout_buf, job->request_payload.payload_len);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  532  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  533  	buf_entries = karg->buf_entry_list.buf_entry;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  534  	sgl_din_iter = din_buf;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  535  	sgl_dout_iter = dout_buf;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  536  	drv_buf_iter = drv_bufs;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  537  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  538  	for (count = 0; count < bufcnt; count++, buf_entries++, drv_buf_iter++) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  539  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  540  		if (sgl_dout_iter > (dout_buf + job->request_payload.payload_len)) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  541  			dprint_bsg_err(mrioc, "%s: data_out buffer length mismatch\n",
506bc1a0d6ba62 Sumit Saxena 2022-04-29  542  				__func__);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  543  			rval = -EINVAL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  544  			goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  545  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  546  		if (sgl_din_iter > (din_buf + job->reply_payload.payload_len)) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  547  			dprint_bsg_err(mrioc, "%s: data_in buffer length mismatch\n",
506bc1a0d6ba62 Sumit Saxena 2022-04-29  548  				__func__);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  549  			rval = -EINVAL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  550  			goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  551  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  552  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  553  		switch (buf_entries->buf_type) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  554  		case MPI3MR_BSG_BUFTYPE_RAIDMGMT_CMD:
506bc1a0d6ba62 Sumit Saxena 2022-04-29  555  			sgl_iter = sgl_dout_iter;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  556  			sgl_dout_iter += buf_entries->buf_len;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  557  			drv_buf_iter->data_dir = DMA_TO_DEVICE;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  558  			is_rmcb = 1;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  559  			if (count != 0)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  560  				invalid_be = 1;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  561  			break;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  562  		case MPI3MR_BSG_BUFTYPE_RAIDMGMT_RESP:
506bc1a0d6ba62 Sumit Saxena 2022-04-29  563  			sgl_iter = sgl_din_iter;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  564  			sgl_din_iter += buf_entries->buf_len;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  565  			drv_buf_iter->data_dir = DMA_FROM_DEVICE;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  566  			is_rmrb = 1;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  567  			if (count != 1 || !is_rmcb)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  568  				invalid_be = 1;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  569  			break;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  570  		case MPI3MR_BSG_BUFTYPE_DATA_IN:
506bc1a0d6ba62 Sumit Saxena 2022-04-29  571  			sgl_iter = sgl_din_iter;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  572  			sgl_din_iter += buf_entries->buf_len;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  573  			drv_buf_iter->data_dir = DMA_FROM_DEVICE;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  574  			din_cnt++;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  575  			din_size += drv_buf_iter->bsg_buf_len;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  576  			if ((din_cnt > 1) && !is_rmcb)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  577  				invalid_be = 1;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  578  			break;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  579  		case MPI3MR_BSG_BUFTYPE_DATA_OUT:
506bc1a0d6ba62 Sumit Saxena 2022-04-29  580  			sgl_iter = sgl_dout_iter;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  581  			sgl_dout_iter += buf_entries->buf_len;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  582  			drv_buf_iter->data_dir = DMA_TO_DEVICE;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  583  			dout_cnt++;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  584  			dout_size += drv_buf_iter->bsg_buf_len;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  585  			if ((dout_cnt > 1) && !is_rmcb)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  586  				invalid_be = 1;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  587  			break;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  588  		case MPI3MR_BSG_BUFTYPE_MPI_REPLY:
506bc1a0d6ba62 Sumit Saxena 2022-04-29  589  			sgl_iter = sgl_din_iter;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  590  			sgl_din_iter += buf_entries->buf_len;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  591  			drv_buf_iter->data_dir = DMA_NONE;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  592  			mpirep_offset = count;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  593  			break;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  594  		case MPI3MR_BSG_BUFTYPE_ERR_RESPONSE:
506bc1a0d6ba62 Sumit Saxena 2022-04-29  595  			sgl_iter = sgl_din_iter;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  596  			sgl_din_iter += buf_entries->buf_len;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  597  			drv_buf_iter->data_dir = DMA_NONE;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  598  			erb_offset = count;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  599  			break;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  600  		case MPI3MR_BSG_BUFTYPE_MPI_REQUEST:
506bc1a0d6ba62 Sumit Saxena 2022-04-29  601  			sgl_iter = sgl_dout_iter;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  602  			sgl_dout_iter += buf_entries->buf_len;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  603  			drv_buf_iter->data_dir = DMA_NONE;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  604  			mpi_msg_size = buf_entries->buf_len;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  605  			if ((!mpi_msg_size || (mpi_msg_size % 4)) ||
506bc1a0d6ba62 Sumit Saxena 2022-04-29  606  					(mpi_msg_size > MPI3MR_ADMIN_REQ_FRAME_SZ)) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  607  				dprint_bsg_err(mrioc, "%s: invalid MPI message size\n",
506bc1a0d6ba62 Sumit Saxena 2022-04-29  608  					__func__);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  609  				rval = -EINVAL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  610  				goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  611  			}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  612  			memcpy(mpi_req, sgl_iter, buf_entries->buf_len);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  613  			break;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  614  		default:
506bc1a0d6ba62 Sumit Saxena 2022-04-29  615  			invalid_be = 1;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  616  			break;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  617  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  618  		if (invalid_be) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  619  			dprint_bsg_err(mrioc, "%s: invalid buffer entries passed\n",
506bc1a0d6ba62 Sumit Saxena 2022-04-29  620  				__func__);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  621  			rval = -EINVAL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  622  			goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  623  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  624  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  625  		drv_buf_iter->bsg_buf = sgl_iter;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  626  		drv_buf_iter->bsg_buf_len = buf_entries->buf_len;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  627  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  628  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  629  	if (!is_rmcb && (dout_cnt || din_cnt)) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  630  		sg_entries = dout_cnt + din_cnt;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  631  		if (((mpi_msg_size) + (sg_entries *
506bc1a0d6ba62 Sumit Saxena 2022-04-29  632  		      sizeof(struct mpi3_sge_common))) > MPI3MR_ADMIN_REQ_FRAME_SZ) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  633  			dprint_bsg_err(mrioc,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  634  			    "%s:%d: invalid message size passed\n",
506bc1a0d6ba62 Sumit Saxena 2022-04-29  635  			    __func__, __LINE__);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  636  			rval = -EINVAL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  637  			goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  638  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  639  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  640  	if (din_size > MPI3MR_MAX_APP_XFER_SIZE) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  641  		dprint_bsg_err(mrioc,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  642  		    "%s:%d: invalid data transfer size passed for function 0x%x din_size=%d\n",
506bc1a0d6ba62 Sumit Saxena 2022-04-29  643  		    __func__, __LINE__, mpi_header->function, din_size);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  644  		rval = -EINVAL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  645  		goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  646  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  647  	if (dout_size > MPI3MR_MAX_APP_XFER_SIZE) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  648  		dprint_bsg_err(mrioc,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  649  		    "%s:%d: invalid data transfer size passed for function 0x%x dout_size = %d\n",
506bc1a0d6ba62 Sumit Saxena 2022-04-29  650  		    __func__, __LINE__, mpi_header->function, dout_size);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  651  		rval = -EINVAL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  652  		goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  653  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  654  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  655  	drv_buf_iter = drv_bufs;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  656  	for (count = 0; count < bufcnt; count++, drv_buf_iter++) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  657  		if (drv_buf_iter->data_dir == DMA_NONE)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  658  			continue;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  659  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  660  		drv_buf_iter->kern_buf_len = drv_buf_iter->bsg_buf_len;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  661  		if (is_rmcb && !count)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  662  			drv_buf_iter->kern_buf_len += ((dout_cnt + din_cnt) *
506bc1a0d6ba62 Sumit Saxena 2022-04-29  663  			    sizeof(struct mpi3_sge_common));
506bc1a0d6ba62 Sumit Saxena 2022-04-29  664  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  665  		if (!drv_buf_iter->kern_buf_len)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  666  			continue;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  667  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  668  		drv_buf_iter->kern_buf = dma_alloc_coherent(&mrioc->pdev->dev,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  669  		    drv_buf_iter->kern_buf_len, &drv_buf_iter->kern_buf_dma,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  670  		    GFP_KERNEL);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  671  		if (!drv_buf_iter->kern_buf) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  672  			rval = -ENOMEM;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  673  			goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  674  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  675  		if (drv_buf_iter->data_dir == DMA_TO_DEVICE) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  676  			tmplen = min(drv_buf_iter->kern_buf_len,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  677  			    drv_buf_iter->bsg_buf_len);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  678  			memcpy(drv_buf_iter->kern_buf, drv_buf_iter->bsg_buf, tmplen);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  679  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  680  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  681  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  682  	if (erb_offset != 0xFF) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  683  		sense_buff_k = kzalloc(erbsz, GFP_KERNEL);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  684  		if (!sense_buff_k) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  685  			rval = -ENOMEM;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  686  			goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  687  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  688  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  689  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  690  	if (mutex_lock_interruptible(&mrioc->bsg_cmds.mutex)) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  691  		rval = -ERESTARTSYS;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  692  		goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  693  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  694  	if (mrioc->bsg_cmds.state & MPI3MR_CMD_PENDING) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  695  		rval = -EAGAIN;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  696  		dprint_bsg_err(mrioc, "%s: command is in use\n", __func__);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  697  		mutex_unlock(&mrioc->bsg_cmds.mutex);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  698  		goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  699  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  700  	if (mrioc->unrecoverable) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  701  		dprint_bsg_err(mrioc, "%s: unrecoverable controller\n",
506bc1a0d6ba62 Sumit Saxena 2022-04-29  702  		    __func__);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  703  		rval = -EFAULT;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  704  		mutex_unlock(&mrioc->bsg_cmds.mutex);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  705  		goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  706  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  707  	if (mrioc->reset_in_progress) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  708  		dprint_bsg_err(mrioc, "%s: reset in progress\n", __func__);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  709  		rval = -EAGAIN;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  710  		mutex_unlock(&mrioc->bsg_cmds.mutex);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  711  		goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  712  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  713  	if (mrioc->stop_bsgs) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  714  		dprint_bsg_err(mrioc, "%s: bsgs are blocked\n", __func__);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  715  		rval = -EAGAIN;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  716  		mutex_unlock(&mrioc->bsg_cmds.mutex);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  717  		goto out;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  718  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  719  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  720  	if (mpi_header->function != MPI3_BSG_FUNCTION_NVME_ENCAPSULATED) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  721  		mpi3mr_bsg_build_sgl(mpi_req, (mpi_msg_size),
506bc1a0d6ba62 Sumit Saxena 2022-04-29  722  		    drv_bufs, bufcnt, is_rmcb, is_rmrb,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  723  		    (dout_cnt + din_cnt));
506bc1a0d6ba62 Sumit Saxena 2022-04-29  724  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  725  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  726  	if (mpi_header->function == MPI3_BSG_FUNCTION_SCSI_TASK_MGMT) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  727  		tm_req = (struct mpi3_scsi_task_mgmt_request *)mpi_req;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  728  		if (tm_req->task_type !=
506bc1a0d6ba62 Sumit Saxena 2022-04-29  729  		    MPI3_SCSITASKMGMT_TASKTYPE_ABORT_TASK) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  730  			dev_handle = tm_req->dev_handle;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  731  			block_io = 1;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  732  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  733  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  734  	if (block_io) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  735  		tgtdev = mpi3mr_get_tgtdev_by_handle(mrioc, dev_handle);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  736  		if (tgtdev && tgtdev->starget && tgtdev->starget->hostdata) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  737  			stgt_priv = (struct mpi3mr_stgt_priv_data *)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  738  			    tgtdev->starget->hostdata;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  739  			atomic_inc(&stgt_priv->block_io);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  740  			mpi3mr_tgtdev_put(tgtdev);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  741  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  742  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  743  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  744  	mrioc->bsg_cmds.state = MPI3MR_CMD_PENDING;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  745  	mrioc->bsg_cmds.is_waiting = 1;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  746  	mrioc->bsg_cmds.callback = NULL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  747  	mrioc->bsg_cmds.is_sense = 0;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  748  	mrioc->bsg_cmds.sensebuf = sense_buff_k;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  749  	memset(mrioc->bsg_cmds.reply, 0, mrioc->reply_sz);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  750  	mpi_header->host_tag = cpu_to_le16(MPI3MR_HOSTTAG_BSG_CMDS);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  751  	if (mrioc->logging_level & MPI3_DEBUG_BSG_INFO) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  752  		dprint_bsg_info(mrioc,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  753  		    "%s: posting bsg request to the controller\n", __func__);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  754  		dprint_dump(mpi_req, MPI3MR_ADMIN_REQ_FRAME_SZ,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  755  		    "bsg_mpi3_req");
506bc1a0d6ba62 Sumit Saxena 2022-04-29  756  		if (mpi_header->function == MPI3_BSG_FUNCTION_MGMT_PASSTHROUGH) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  757  			drv_buf_iter = &drv_bufs[0];
506bc1a0d6ba62 Sumit Saxena 2022-04-29  758  			dprint_dump(drv_buf_iter->kern_buf,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  759  			    drv_buf_iter->kern_buf_len, "mpi3_mgmt_req");
506bc1a0d6ba62 Sumit Saxena 2022-04-29  760  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  761  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  762  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  763  	init_completion(&mrioc->bsg_cmds.done);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  764  	rval = mpi3mr_admin_request_post(mrioc, mpi_req,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  765  	    MPI3MR_ADMIN_REQ_FRAME_SZ, 0);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  766  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  767  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  768  	if (rval) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  769  		mrioc->bsg_cmds.is_waiting = 0;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  770  		dprint_bsg_err(mrioc,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  771  		    "%s: posting bsg request is failed\n", __func__);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  772  		rval = -EAGAIN;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  773  		goto out_unlock;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  774  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  775  	wait_for_completion_timeout(&mrioc->bsg_cmds.done,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  776  	    (karg->timeout * HZ));
506bc1a0d6ba62 Sumit Saxena 2022-04-29  777  	if (block_io && stgt_priv)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  778  		atomic_dec(&stgt_priv->block_io);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  779  	if (!(mrioc->bsg_cmds.state & MPI3MR_CMD_COMPLETE)) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  780  		mrioc->bsg_cmds.is_waiting = 0;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  781  		rval = -EAGAIN;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  782  		if (mrioc->bsg_cmds.state & MPI3MR_CMD_RESET)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  783  			goto out_unlock;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  784  		dprint_bsg_err(mrioc,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  785  		    "%s: bsg request timedout after %d seconds\n", __func__,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  786  		    karg->timeout);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  787  		if (mrioc->logging_level & MPI3_DEBUG_BSG_ERROR) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  788  			dprint_dump(mpi_req, MPI3MR_ADMIN_REQ_FRAME_SZ,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  789  			    "bsg_mpi3_req");
506bc1a0d6ba62 Sumit Saxena 2022-04-29  790  			if (mpi_header->function ==
506bc1a0d6ba62 Sumit Saxena 2022-04-29  791  			    MPI3_BSG_FUNCTION_MGMT_PASSTHROUGH) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  792  				drv_buf_iter = &drv_bufs[0];
506bc1a0d6ba62 Sumit Saxena 2022-04-29  793  				dprint_dump(drv_buf_iter->kern_buf,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  794  				    drv_buf_iter->kern_buf_len, "mpi3_mgmt_req");
506bc1a0d6ba62 Sumit Saxena 2022-04-29  795  			}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  796  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  797  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  798  		if (mpi_header->function == MPI3_BSG_FUNCTION_SCSI_IO)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  799  			mpi3mr_issue_tm(mrioc,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  800  			    MPI3_SCSITASKMGMT_TASKTYPE_TARGET_RESET,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  801  			    mpi_header->function_dependent, 0,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  802  			    MPI3MR_HOSTTAG_BLK_TMS, MPI3MR_RESETTM_TIMEOUT,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  803  			    &mrioc->host_tm_cmds, &resp_code, NULL);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  804  		if (!(mrioc->bsg_cmds.state & MPI3MR_CMD_COMPLETE) &&
506bc1a0d6ba62 Sumit Saxena 2022-04-29  805  		    !(mrioc->bsg_cmds.state & MPI3MR_CMD_RESET))
506bc1a0d6ba62 Sumit Saxena 2022-04-29  806  			mpi3mr_soft_reset_handler(mrioc,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  807  			    MPI3MR_RESET_FROM_APP_TIMEOUT, 1);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  808  		goto out_unlock;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  809  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  810  	dprint_bsg_info(mrioc, "%s: bsg request is completed\n", __func__);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  811  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  812  	if ((mrioc->bsg_cmds.ioc_status & MPI3_IOCSTATUS_STATUS_MASK)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  813  	     != MPI3_IOCSTATUS_SUCCESS) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  814  		dprint_bsg_info(mrioc,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  815  		    "%s: command failed, ioc_status(0x%04x) log_info(0x%08x)\n",
506bc1a0d6ba62 Sumit Saxena 2022-04-29  816  		    __func__,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  817  		    (mrioc->bsg_cmds.ioc_status & MPI3_IOCSTATUS_STATUS_MASK),
506bc1a0d6ba62 Sumit Saxena 2022-04-29  818  		    mrioc->bsg_cmds.ioc_loginfo);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  819  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  820  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  821  	if ((mpirep_offset != 0xFF) &&
506bc1a0d6ba62 Sumit Saxena 2022-04-29 @822  	    drv_bufs[mpirep_offset].bsg_buf_len) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  823  		drv_buf_iter = &drv_bufs[mpirep_offset];
506bc1a0d6ba62 Sumit Saxena 2022-04-29  824  		drv_buf_iter->kern_buf_len = (sizeof(*bsg_reply_buf) - 1 +
506bc1a0d6ba62 Sumit Saxena 2022-04-29  825  					   mrioc->reply_sz);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  826  		bsg_reply_buf = kzalloc(drv_buf_iter->kern_buf_len, GFP_KERNEL);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  827  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  828  		if (!bsg_reply_buf) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  829  			rval = -ENOMEM;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  830  			goto out_unlock;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  831  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  832  		if (mrioc->bsg_cmds.state & MPI3MR_CMD_REPLY_VALID) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  833  			bsg_reply_buf->mpi_reply_type =
506bc1a0d6ba62 Sumit Saxena 2022-04-29  834  				MPI3MR_BSG_MPI_REPLY_BUFTYPE_ADDRESS;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  835  			memcpy(bsg_reply_buf->reply_buf,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  836  			    mrioc->bsg_cmds.reply, mrioc->reply_sz);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  837  		} else {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  838  			bsg_reply_buf->mpi_reply_type =
506bc1a0d6ba62 Sumit Saxena 2022-04-29  839  				MPI3MR_BSG_MPI_REPLY_BUFTYPE_STATUS;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  840  			status_desc = (struct mpi3_status_reply_descriptor *)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  841  			    bsg_reply_buf->reply_buf;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  842  			status_desc->ioc_status = mrioc->bsg_cmds.ioc_status;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  843  			status_desc->ioc_log_info = mrioc->bsg_cmds.ioc_loginfo;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  844  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  845  		tmplen = min(drv_buf_iter->kern_buf_len,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  846  			drv_buf_iter->bsg_buf_len);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  847  		memcpy(drv_buf_iter->bsg_buf, bsg_reply_buf, tmplen);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  848  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  849  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  850  	if (erb_offset != 0xFF && mrioc->bsg_cmds.sensebuf &&
506bc1a0d6ba62 Sumit Saxena 2022-04-29  851  	    mrioc->bsg_cmds.is_sense) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29 @852  		drv_buf_iter = &drv_bufs[erb_offset];
506bc1a0d6ba62 Sumit Saxena 2022-04-29  853  		tmplen = min(erbsz, drv_buf_iter->bsg_buf_len);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  854  		memcpy(drv_buf_iter->bsg_buf, sense_buff_k, tmplen);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  855  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  856  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  857  	drv_buf_iter = drv_bufs;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  858  	for (count = 0; count < bufcnt; count++, drv_buf_iter++) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  859  		if (drv_buf_iter->data_dir == DMA_NONE)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  860  			continue;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  861  		if (drv_buf_iter->data_dir == DMA_FROM_DEVICE) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  862  			tmplen = min(drv_buf_iter->kern_buf_len,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  863  				     drv_buf_iter->bsg_buf_len);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  864  			memcpy(drv_buf_iter->bsg_buf,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  865  			       drv_buf_iter->kern_buf, tmplen);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  866  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  867  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  868  
506bc1a0d6ba62 Sumit Saxena 2022-04-29  869  out_unlock:
506bc1a0d6ba62 Sumit Saxena 2022-04-29  870  	if (din_buf) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  871  		*reply_payload_rcv_len =
506bc1a0d6ba62 Sumit Saxena 2022-04-29  872  			sg_copy_from_buffer(job->reply_payload.sg_list,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  873  					    job->reply_payload.sg_cnt,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  874  					    din_buf, job->reply_payload.payload_len);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  875  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  876  	mrioc->bsg_cmds.is_sense = 0;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  877  	mrioc->bsg_cmds.sensebuf = NULL;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  878  	mrioc->bsg_cmds.state = MPI3MR_CMD_NOTUSED;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  879  	mutex_unlock(&mrioc->bsg_cmds.mutex);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  880  out:
506bc1a0d6ba62 Sumit Saxena 2022-04-29  881  	kfree(sense_buff_k);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  882  	kfree(dout_buf);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  883  	kfree(din_buf);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  884  	kfree(mpi_req);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  885  	if (drv_bufs) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  886  		drv_buf_iter = drv_bufs;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  887  		for (count = 0; count < bufcnt; count++, drv_buf_iter++) {
506bc1a0d6ba62 Sumit Saxena 2022-04-29  888  			if (drv_buf_iter->kern_buf && drv_buf_iter->kern_buf_dma)
506bc1a0d6ba62 Sumit Saxena 2022-04-29  889  				dma_free_coherent(&mrioc->pdev->dev,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  890  				    drv_buf_iter->kern_buf_len,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  891  				    drv_buf_iter->kern_buf,
506bc1a0d6ba62 Sumit Saxena 2022-04-29  892  				    drv_buf_iter->kern_buf_dma);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  893  		}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  894  		kfree(drv_bufs);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  895  	}
506bc1a0d6ba62 Sumit Saxena 2022-04-29  896  	kfree(bsg_reply_buf);
506bc1a0d6ba62 Sumit Saxena 2022-04-29  897  	return rval;
506bc1a0d6ba62 Sumit Saxena 2022-04-29  898  }
506bc1a0d6ba62 Sumit Saxena 2022-04-29  899  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
