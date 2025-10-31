Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8C22D4807
	for <oe-kbuild@lists.linux.dev>; Fri, 31 Oct 2025 05:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761889238; cv=none; b=f0P17bEMInP6wCl5e5JCbFtPRfhrK0VJZ3sdANh3Zb8yfInea9p7SvegB6ksQOzVSLhqY2LSnlBj+TPfYPunYPfCvKuG9qvsOAvZHdkVRT8Y9JP3OC9gBrnl9BMTP2v0FS5cl+PlGZx9LvxBet79hjt6lNUp4r/kOkY6Tk4GPEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761889238; c=relaxed/simple;
	bh=700wOYMJtZ2PSmCGNREtE4+zJVpk5Pax93clcATC0CM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tffSdOS2lVrQ/RFS5IbIJtA4kjcD6B4rVwPIXe9HVApXSRBG/+l+8reTrEWIOkpg9zqounakKybcaHrBMvefzbMc3QfvNy3n2A9pIw4Ipa8fLERuBWlRlTVL9SVR5yn7bRJODzwJqMivY0x2o4nzXp580nf1EYcbQAaqhXZPy+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FzNizzS+; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FzNizzS+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761889235; x=1793425235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=700wOYMJtZ2PSmCGNREtE4+zJVpk5Pax93clcATC0CM=;
  b=FzNizzS+WxKRiJPTudZiP8nf4NIeYt873tHIqc9oKap588C5heUtid9b
   WU0vKtU2EqycvdsHjkT+jUAKwe3yPC5SLN+YM7S2jxPV0VwsgpX8iOC9z
   s/kP5GX/rT3mrNmLwlPno7HabiTQibidw+p8Cme6qVHFyb9jJAnfzkmws
   FrGqLyH6kMmUAv1LGm4JvCTJbVDLBHxBP9sPDRFfncemO0nffiVeBHFme
   0dWT/CzOv/dRBVlhK7TeMVRBPE9ZEc3i9er0eSoXrGY44N6XpGDcTTPHi
   S4VbflbEoblFgj1fKus2DC1zbjEcbObd7yegCD+qB24/+l5WWvX49Gij2
   Q==;
X-CSE-ConnectionGUID: RZ+kvL09SNCStJeGPBnRaw==
X-CSE-MsgGUID: lfs22jaqTu+/rcXERIF4Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="67903163"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="67903163"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 22:40:34 -0700
X-CSE-ConnectionGUID: wszR5viPTE69NcyV9+TqPw==
X-CSE-MsgGUID: +zzGmS7fR02gjgbCV90CUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="185835235"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 30 Oct 2025 22:40:33 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEhsF-000Mng-0i;
	Fri, 31 Oct 2025 05:40:31 +0000
Date: Fri, 31 Oct 2025 13:40:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bvanassche:ufs-lrbp-as-priv-data 27/28]
 drivers/ufs/core/ufshcd.c:7594 ufshcd_advanced_rpmb_req_handler() warn:
 inconsistent returns '&hba->clk_scaling_lock'.
Message-ID: <202510311328.Is1wMfkq-lkp@intel.com>
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
TO: Bart Van Assche <bvanassche@acm.org>
CC: Avri Altman <avri.altman@sandisk.com>

tree:   https://github.com/bvanassche/linux ufs-lrbp-as-priv-data
head:   f5ce986a0b77ce2944bf8314554d60eec17968e8
commit: 226979e4eb8a5844be9fb6047a1d042bf2cd72ab [27/28] ufs: core: Move code out of ufshcd_wait_for_dev_cmd()
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-r071-20251031 (https://download.01.org/0day-ci/archive/20251031/202510311328.Is1wMfkq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510311328.Is1wMfkq-lkp@intel.com/

New smatch warnings:
drivers/ufs/core/ufshcd.c:7594 ufshcd_advanced_rpmb_req_handler() warn: inconsistent returns '&hba->clk_scaling_lock'.
drivers/ufs/core/ufshcd.c:7594 ufshcd_advanced_rpmb_req_handler() warn: inconsistent returns '&hba->dev_cmd.lock'.

Old smatch warnings:
drivers/ufs/core/ufshcd.c:6883 ufshcd_err_handler() warn: inconsistent returns '&hba->host_sem'.
drivers/ufs/core/ufshcd.c:9464 ufshcd_setup_clocks() warn: 'clki->clk' from clk_prepare_enable() not released on lines: 9443.

vim +7594 drivers/ufs/core/ufshcd.c

5e0a86eed84607 drivers/scsi/ufs/ufshcd.c Avri Altman     2018-10-07  7513  
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7514  /**
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7515   * ufshcd_advanced_rpmb_req_handler - handle advanced RPMB request
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7516   * @hba:	per adapter instance
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7517   * @req_upiu:	upiu request
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7518   * @rsp_upiu:	upiu reply
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7519   * @req_ehs:	EHS field which contains Advanced RPMB Request Message
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7520   * @rsp_ehs:	EHS field which returns Advanced RPMB Response Message
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7521   * @sg_cnt:	The number of sg lists actually used
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7522   * @sg_list:	Pointer to SG list when DATA IN/OUT UPIU is required in ARPMB operation
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7523   * @dir:	DMA direction
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7524   *
9ee35fd43f94bf drivers/ufs/core/ufshcd.c Bart Van Assche 2025-08-15  7525   * Return: 0 upon success; > 0 in case the UFS device reported an OCS error;
9ee35fd43f94bf drivers/ufs/core/ufshcd.c Bart Van Assche 2025-08-15  7526   * < 0 if another error occurred.
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7527   */
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7528  int ufshcd_advanced_rpmb_req_handler(struct ufs_hba *hba, struct utp_upiu_req *req_upiu,
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7529  			 struct utp_upiu_req *rsp_upiu, struct ufs_ehs *req_ehs,
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7530  			 struct ufs_ehs *rsp_ehs, int sg_cnt, struct scatterlist *sg_list,
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7531  			 enum dma_data_direction dir)
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7532  {
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7533  	const u32 tag = hba->reserved_slot;
dd24291b765afb drivers/ufs/core/ufshcd.c Bart Van Assche 2023-03-06  7534  	struct scsi_cmnd *cmd = ufshcd_tag_to_cmd(hba, tag);
dd24291b765afb drivers/ufs/core/ufshcd.c Bart Van Assche 2023-03-06  7535  	struct ufshcd_lrb *lrbp = scsi_cmd_priv(cmd);
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7536  	int err = 0;
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7537  	int result;
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7538  	u8 upiu_flags;
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7539  	u8 *ehs_data;
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7540  	u16 ehs_len;
996a24b99d63df drivers/ufs/core/ufshcd.c Avri Altman     2024-03-09  7541  	int ehs = (hba->capabilities & MASK_EHSLUTRD_SUPPORTED) ? 2 : 0;
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7542  
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7543  	/* Protects use of hba->reserved_slot. */
ddfd7f051f4e14 drivers/ufs/core/ufshcd.c Avri Altman     2024-03-09  7544  	ufshcd_dev_man_lock(hba);
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7545  
dd24291b765afb drivers/ufs/core/ufshcd.c Bart Van Assche 2023-03-06  7546  	ufshcd_setup_dev_cmd(hba, cmd, DEV_CMD_TYPE_RPMB, UFS_UPIU_RPMB_WLUN,
dd24291b765afb drivers/ufs/core/ufshcd.c Bart Van Assche 2023-03-06  7547  			     tag);
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7548  
a33a502d50fddc drivers/ufs/core/ufshcd.c Avri Altman     2024-04-10  7549  	ufshcd_prepare_req_desc_hdr(hba, lrbp, &upiu_flags, DMA_NONE, ehs);
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7550  
9f6fec65661381 drivers/ufs/core/ufshcd.c Bean Huo        2023-08-09  7551  	/* update the task tag */
617bfaa8dd50d6 drivers/ufs/core/ufshcd.c Bart Van Assche 2023-07-27  7552  	req_upiu->header.task_tag = tag;
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7553  
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7554  	/* copy the UPIU(contains CDB) request as it is */
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7555  	memcpy(lrbp->ucd_req_ptr, req_upiu, sizeof(*lrbp->ucd_req_ptr));
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7556  	/* Copy EHS, starting with byte32, immediately after the CDB package */
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7557  	memcpy(lrbp->ucd_req_ptr + 1, req_ehs, sizeof(*req_ehs));
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7558  
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7559  	if (dir != DMA_NONE && sg_list)
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7560  		ufshcd_sgl_to_prdt(hba, lrbp, sg_cnt, sg_list);
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7561  
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7562  	memset(lrbp->ucd_rsp_ptr, 0, sizeof(struct utp_upiu_rsp));
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7563  
dd24291b765afb drivers/ufs/core/ufshcd.c Bart Van Assche 2023-03-06  7564  	err = ufshcd_issue_dev_cmd(hba, cmd, tag, ADVANCED_RPMB_REQ_TIMEOUT);
226979e4eb8a58 drivers/ufs/core/ufshcd.c Bart Van Assche 2025-09-09  7565  	if (err)
226979e4eb8a58 drivers/ufs/core/ufshcd.c Bart Van Assche 2025-09-09  7566  		return err;
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7567  
226979e4eb8a58 drivers/ufs/core/ufshcd.c Bart Van Assche 2025-09-09  7568  	err = ufshcd_dev_cmd_completion(hba, lrbp);
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7569  	if (!err) {
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7570  		/* Just copy the upiu response as it is */
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7571  		memcpy(rsp_upiu, lrbp->ucd_rsp_ptr, sizeof(*rsp_upiu));
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7572  		/* Get the response UPIU result */
617bfaa8dd50d6 drivers/ufs/core/ufshcd.c Bart Van Assche 2023-07-27  7573  		result = (lrbp->ucd_rsp_ptr->header.response << 8) |
617bfaa8dd50d6 drivers/ufs/core/ufshcd.c Bart Van Assche 2023-07-27  7574  			lrbp->ucd_rsp_ptr->header.status;
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7575  
617bfaa8dd50d6 drivers/ufs/core/ufshcd.c Bart Van Assche 2023-07-27  7576  		ehs_len = lrbp->ucd_rsp_ptr->header.ehs_length;
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7577  		/*
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7578  		 * Since the bLength in EHS indicates the total size of the EHS Header and EHS Data
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7579  		 * in 32 Byte units, the value of the bLength Request/Response for Advanced RPMB
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7580  		 * Message is 02h
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7581  		 */
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7582  		if (ehs_len == 2 && rsp_ehs) {
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7583  			/*
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7584  			 * ucd_rsp_ptr points to a buffer with a length of 512 bytes
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7585  			 * (ALIGNED_UPIU_SIZE = 512), and the EHS data just starts from byte32
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7586  			 */
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7587  			ehs_data = (u8 *)lrbp->ucd_rsp_ptr + EHS_OFFSET_IN_RESPONSE;
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7588  			memcpy(rsp_ehs, ehs_data, ehs_len * 32);
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7589  		}
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7590  	}
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7591  
ddfd7f051f4e14 drivers/ufs/core/ufshcd.c Avri Altman     2024-03-09  7592  	ufshcd_dev_man_unlock(hba);
ddfd7f051f4e14 drivers/ufs/core/ufshcd.c Avri Altman     2024-03-09  7593  
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01 @7594  	return err ? : result;
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7595  }
6ff265fc5ef660 drivers/ufs/core/ufshcd.c Bean Huo        2022-12-01  7596  

:::::: The code at line 7594 was first introduced by commit
:::::: 6ff265fc5ef660499e0edc4641647e99eed3f519 scsi: ufs: core: bsg: Add advanced RPMB support in ufs_bsg

:::::: TO: Bean Huo <beanhuo@micron.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
