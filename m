Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309B8193084
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Dec 2024 21:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734816893; cv=none; b=vCLzc0NKrVS0i+fO69nsAMWLXH6Dj3w/GGx3RwiWrqDmJkN/yZBMNrOcaiWRZmFx2O6KDJnQo6hTKI6Fts81yqi7wu1NBR1yP2kZx9rHiu74+MI1lx5SugnLxC3rdCoSqzLTGJWee6WqMGwdO8lhI/6wwap2hEiLw3hsg2aM/8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734816893; c=relaxed/simple;
	bh=kgfujwUPt7hLTJyReWA5x/UKQ0wCyJtOGV4eGPeTaHo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sAValvhOq5DAjeoQMBU7RrxCfaXsJ3m4r41J/ucEVvkjaZYjAGU30rjnzz/wlmMJPDypQjzfygoK4TT+xMxkguWAsZlsh6TQFCFGbC6hmRTKbbMnZttof1QikxHto01Qf1/HYAZQW8Fatw0FI1eqqbg68Wevtp1EEWqDCn1BA5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SNDhZSaZ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SNDhZSaZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734816891; x=1766352891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kgfujwUPt7hLTJyReWA5x/UKQ0wCyJtOGV4eGPeTaHo=;
  b=SNDhZSaZe40EohZ6wOACDfbXIOu9ay9qCkVAiC965uXl9wUtGSd5QlDr
   g8yWROFUu7IeJPNHQefCptEw57mhYWQNk0SdSd9yQ6c6QrCXbxyeQVKC6
   CORzgSfzgb0Whca4Zl1JNMEYfus5JNSEqxiJoj391ydqfzhfvFhRFV291
   MsWiYPYa4azmC4vI0zjYhSnnQErnVLMTfnDruBk3IzyUtr39ka2Vq9IZ8
   OhbqiMvsU4JSDkBLku6FDf+g3A+SLBz4yuuq1rXp+AS7/kyX9RaFudseO
   zf0FrSoutezN8Ek/W0Du5K3pNzhF3MUlsLi9SzLzjzi3UH/RlF27d1VHp
   A==;
X-CSE-ConnectionGUID: KVbdMP61QqWVAyHBPIZMpw==
X-CSE-MsgGUID: SEZY2XVcTo2gNdf7YwJvgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="52860573"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="52860573"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 13:34:48 -0800
X-CSE-ConnectionGUID: pGhgEnW1RfSYCx3jW07cDg==
X-CSE-MsgGUID: xpDxYFlPQmCqk3RhjczY9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102945250"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Dec 2024 13:34:47 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP77V-0002VL-0M;
	Sat, 21 Dec 2024 21:34:45 +0000
Date: Sun, 22 Dec 2024 05:33:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/7] bus: mhi: host: Add a policy to enable image
 transfer via BHIe in PBL
Message-ID: <202412220514.mQV3IS1l-lkp@intel.com>
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
In-Reply-To: <20241213213340.2551697-3-quic_jhugo@quicinc.com>
References: <20241213213340.2551697-3-quic_jhugo@quicinc.com>
TO: Jeffrey Hugo <quic_jhugo@quicinc.com>
TO: quic_carlv@quicinc.com
TO: manivannan.sadhasivam@linaro.org
TO: quic_yabdulra@quicinc.com
TO: quic_mattleun@quicinc.com
TO: quic_thanson@quicinc.com
CC: ogabbay@kernel.org
CC: lizhi.hou@amd.com
CC: jacek.lawrynowicz@linux.intel.com
CC: linux-arm-msm@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: mhi@lists.linux.dev
CC: Jeffrey Hugo <quic_jhugo@quicinc.com>

Hi Jeffrey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.13-rc3 next-20241220]
[cannot apply to mani-mhi/mhi-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeffrey-Hugo/bus-mhi-host-Refactor-BHI-BHIe-based-firmware-loading/20241214-053540
base:   linus/master
patch link:    https://lore.kernel.org/r/20241213213340.2551697-3-quic_jhugo%40quicinc.com
patch subject: [PATCH 2/7] bus: mhi: host: Add a policy to enable image transfer via BHIe in PBL
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: x86_64-randconfig-161-20241220 (https://download.01.org/0day-ci/archive/20241222/202412220514.mQV3IS1l-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412220514.mQV3IS1l-lkp@intel.com/

smatch warnings:
drivers/bus/mhi/host/boot.c:630 mhi_fw_load_handler() error: uninitialized symbol 'fw_load_type'.

vim +/fw_load_type +630 drivers/bus/mhi/host/boot.c

4fe13d31a862beb drivers/bus/mhi/host/boot.c Matthew Leung         2024-12-13  504  
560e3a045961ed0 drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2020-05-21  505  void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  506  {
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  507  	const struct firmware *firmware = NULL;
560e3a045961ed0 drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2020-05-21  508  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
4fe13d31a862beb drivers/bus/mhi/host/boot.c Matthew Leung         2024-12-13  509  	enum mhi_fw_load_type fw_load_type;
1d1493bdc25f498 drivers/bus/mhi/host/boot.c Jeffrey Hugo          2023-04-10  510  	enum mhi_pm_state new_state;
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  511  	const char *fw_name;
efe47a18e43f59f drivers/bus/mhi/host/boot.c Kalle Valo            2023-07-27  512  	const u8 *fw_data;
efe47a18e43f59f drivers/bus/mhi/host/boot.c Kalle Valo            2023-07-27  513  	size_t size, fw_sz;
8ddf54a32111f6d drivers/bus/mhi/host/boot.c Jeffrey Hugo          2024-01-05  514  	int ret;
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  515  
560e3a045961ed0 drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2020-05-21  516  	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  517  		dev_err(dev, "Device MHI is not in valid state\n");
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  518  		return;
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  519  	}
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  520  
8e3729bfa7be159 drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2020-09-29  521  	/* save hardware info from BHI */
8e3729bfa7be159 drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2020-09-29  522  	ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_SERIALNU,
8e3729bfa7be159 drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2020-09-29  523  			   &mhi_cntrl->serial_number);
8e3729bfa7be159 drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2020-09-29  524  	if (ret)
8e3729bfa7be159 drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2020-09-29  525  		dev_err(dev, "Could not capture serial number via BHI\n");
8e3729bfa7be159 drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2020-09-29  526  
e72919cebd19618 drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2021-03-29  527  	/* wait for ready on pass through or any other execution environment */
3e60c9f06803b52 drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2021-12-16  528  	if (!MHI_FW_LOAD_CAPABLE(mhi_cntrl->ee))
4f214496ac7421b drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2021-03-29  529  		goto fw_load_ready_state;
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  530  
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  531  	fw_name = (mhi_cntrl->ee == MHI_EE_EDL) ?
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  532  		mhi_cntrl->edl_image : mhi_cntrl->fw_image;
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  533  
4fe13d31a862beb drivers/bus/mhi/host/boot.c Matthew Leung         2024-12-13  534  	fw_load_type = mhi_fw_load_type_get(mhi_cntrl);
4fe13d31a862beb drivers/bus/mhi/host/boot.c Matthew Leung         2024-12-13  535  	if (fw_load_type == MHI_FW_LOAD_UNKNOWN) {
4fe13d31a862beb drivers/bus/mhi/host/boot.c Matthew Leung         2024-12-13  536  		dev_err(dev, "Cannot load FW as load type is UNKNOWN\n");
4fe13d31a862beb drivers/bus/mhi/host/boot.c Matthew Leung         2024-12-13  537  		return;
4fe13d31a862beb drivers/bus/mhi/host/boot.c Matthew Leung         2024-12-13  538  	}
4fe13d31a862beb drivers/bus/mhi/host/boot.c Matthew Leung         2024-12-13  539  
efe47a18e43f59f drivers/bus/mhi/host/boot.c Kalle Valo            2023-07-27  540  	/* check if the driver has already provided the firmware data */
efe47a18e43f59f drivers/bus/mhi/host/boot.c Kalle Valo            2023-07-27  541  	if (!fw_name && mhi_cntrl->fbc_download &&
efe47a18e43f59f drivers/bus/mhi/host/boot.c Kalle Valo            2023-07-27  542  	    mhi_cntrl->fw_data && mhi_cntrl->fw_sz) {
efe47a18e43f59f drivers/bus/mhi/host/boot.c Kalle Valo            2023-07-27  543  		if (!mhi_cntrl->sbl_size) {
efe47a18e43f59f drivers/bus/mhi/host/boot.c Kalle Valo            2023-07-27  544  			dev_err(dev, "fw_data provided but no sbl_size\n");
efe47a18e43f59f drivers/bus/mhi/host/boot.c Kalle Valo            2023-07-27  545  			goto error_fw_load;
efe47a18e43f59f drivers/bus/mhi/host/boot.c Kalle Valo            2023-07-27  546  		}
efe47a18e43f59f drivers/bus/mhi/host/boot.c Kalle Valo            2023-07-27  547  
efe47a18e43f59f drivers/bus/mhi/host/boot.c Kalle Valo            2023-07-27  548  		size = mhi_cntrl->sbl_size;
efe47a18e43f59f drivers/bus/mhi/host/boot.c Kalle Valo            2023-07-27  549  		fw_data = mhi_cntrl->fw_data;
efe47a18e43f59f drivers/bus/mhi/host/boot.c Kalle Valo            2023-07-27  550  		fw_sz = mhi_cntrl->fw_sz;
efe47a18e43f59f drivers/bus/mhi/host/boot.c Kalle Valo            2023-07-27  551  		goto skip_req_fw;
efe47a18e43f59f drivers/bus/mhi/host/boot.c Kalle Valo            2023-07-27  552  	}
efe47a18e43f59f drivers/bus/mhi/host/boot.c Kalle Valo            2023-07-27  553  
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  554  	if (!fw_name || (mhi_cntrl->fbc_download && (!mhi_cntrl->sbl_size ||
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  555  						     !mhi_cntrl->seg_len))) {
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  556  		dev_err(dev,
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  557  			"No firmware image defined or !sbl_size || !seg_len\n");
12e050c77be0363 drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2020-11-09  558  		goto error_fw_load;
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  559  	}
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  560  
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  561  	ret = request_firmware(&firmware, fw_name, dev);
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  562  	if (ret) {
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  563  		dev_err(dev, "Error loading firmware: %d\n", ret);
12e050c77be0363 drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2020-11-09  564  		goto error_fw_load;
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  565  	}
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  566  
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  567  	size = (mhi_cntrl->fbc_download) ? mhi_cntrl->sbl_size : firmware->size;
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  568  
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  569  	/* SBL size provided is maximum size, not necessarily the image size */
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  570  	if (size > firmware->size)
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  571  		size = firmware->size;
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  572  
efe47a18e43f59f drivers/bus/mhi/host/boot.c Kalle Valo            2023-07-27  573  	fw_data = firmware->data;
efe47a18e43f59f drivers/bus/mhi/host/boot.c Kalle Valo            2023-07-27  574  	fw_sz = firmware->size;
efe47a18e43f59f drivers/bus/mhi/host/boot.c Kalle Valo            2023-07-27  575  
efe47a18e43f59f drivers/bus/mhi/host/boot.c Kalle Valo            2023-07-27  576  skip_req_fw:
4fe13d31a862beb drivers/bus/mhi/host/boot.c Matthew Leung         2024-12-13  577  	if (fw_load_type == MHI_FW_LOAD_BHIE)
4fe13d31a862beb drivers/bus/mhi/host/boot.c Matthew Leung         2024-12-13  578  		ret = mhi_send_image_bhie(mhi_cntrl, fw_data, size);
4fe13d31a862beb drivers/bus/mhi/host/boot.c Matthew Leung         2024-12-13  579  	else
4fe13d31a862beb drivers/bus/mhi/host/boot.c Matthew Leung         2024-12-13  580  		ret = mhi_send_image_bhi(mhi_cntrl, fw_data, size);
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  581  
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  582  	/* Error or in EDL mode, we're done */
0a895f091ebd943 drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2020-05-21  583  	if (ret) {
4fe13d31a862beb drivers/bus/mhi/host/boot.c Matthew Leung         2024-12-13  584  		dev_err(dev, "MHI did not load image over BHI%s, ret: %d\n",
4fe13d31a862beb drivers/bus/mhi/host/boot.c Matthew Leung         2024-12-13  585  			fw_load_type == MHI_FW_LOAD_BHIE ? "e" : "",
4fe13d31a862beb drivers/bus/mhi/host/boot.c Matthew Leung         2024-12-13  586  			ret);
12e050c77be0363 drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2020-11-09  587  		release_firmware(firmware);
12e050c77be0363 drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2020-11-09  588  		goto error_fw_load;
0a895f091ebd943 drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2020-05-21  589  	}
0a895f091ebd943 drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2020-05-21  590  
4f214496ac7421b drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2021-03-29  591  	/* Wait for ready since EDL image was loaded */
efe47a18e43f59f drivers/bus/mhi/host/boot.c Kalle Valo            2023-07-27  592  	if (fw_name && fw_name == mhi_cntrl->edl_image) {
12e050c77be0363 drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2020-11-09  593  		release_firmware(firmware);
4f214496ac7421b drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2021-03-29  594  		goto fw_load_ready_state;
12e050c77be0363 drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2020-11-09  595  	}
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  596  
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  597  	write_lock_irq(&mhi_cntrl->pm_lock);
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  598  	mhi_cntrl->dev_state = MHI_STATE_RESET;
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  599  	write_unlock_irq(&mhi_cntrl->pm_lock);
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  600  
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  601  	/*
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  602  	 * If we're doing fbc, populate vector tables while
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  603  	 * device transitioning into MHI READY state
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  604  	 */
4fe13d31a862beb drivers/bus/mhi/host/boot.c Matthew Leung         2024-12-13  605  	if (fw_load_type == MHI_FW_LOAD_FBC) {
efe47a18e43f59f drivers/bus/mhi/host/boot.c Kalle Valo            2023-07-27  606  		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image, fw_sz);
12e050c77be0363 drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2020-11-09  607  		if (ret) {
12e050c77be0363 drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2020-11-09  608  			release_firmware(firmware);
12e050c77be0363 drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2020-11-09  609  			goto error_fw_load;
12e050c77be0363 drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2020-11-09  610  		}
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  611  
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  612  		/* Load the firmware into BHIE vec table */
90c6730746c4737 drivers/bus/mhi/host/boot.c Matthew Leung         2024-12-13  613  		mhi_firmware_copy_bhie(mhi_cntrl, fw_data, fw_sz, mhi_cntrl->fbc_image);
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  614  	}
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  615  
12e050c77be0363 drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2020-11-09  616  	release_firmware(firmware);
12e050c77be0363 drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2020-11-09  617  
4f214496ac7421b drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2021-03-29  618  fw_load_ready_state:
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  619  	/* Transitioning into MHI RESET->READY state */
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  620  	ret = mhi_ready_state_transition(mhi_cntrl);
0a895f091ebd943 drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2020-05-21  621  	if (ret) {
0a895f091ebd943 drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2020-05-21  622  		dev_err(dev, "MHI did not enter READY state\n");
faa257075bcc35e drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2020-11-09  623  		goto error_ready_state;
0a895f091ebd943 drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2020-05-21  624  	}
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  625  
4884362f6977fc0 drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2021-02-24  626  	dev_info(dev, "Wait for device to enter SBL or Mission mode\n");
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  627  	return;
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  628  
faa257075bcc35e drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2020-11-09  629  error_ready_state:
4fe13d31a862beb drivers/bus/mhi/host/boot.c Matthew Leung         2024-12-13 @630  	if (fw_load_type == MHI_FW_LOAD_FBC) {
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  631  		mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  632  		mhi_cntrl->fbc_image = NULL;
4884362f6977fc0 drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2021-02-24  633  	}
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  634  
12e050c77be0363 drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2020-11-09  635  error_fw_load:
1d1493bdc25f498 drivers/bus/mhi/host/boot.c Jeffrey Hugo          2023-04-10  636  	write_lock_irq(&mhi_cntrl->pm_lock);
1d1493bdc25f498 drivers/bus/mhi/host/boot.c Jeffrey Hugo          2023-04-10  637  	new_state = mhi_tryset_pm_state(mhi_cntrl, MHI_PM_FW_DL_ERR);
1d1493bdc25f498 drivers/bus/mhi/host/boot.c Jeffrey Hugo          2023-04-10  638  	write_unlock_irq(&mhi_cntrl->pm_lock);
1d1493bdc25f498 drivers/bus/mhi/host/boot.c Jeffrey Hugo          2023-04-10  639  	if (new_state == MHI_PM_FW_DL_ERR)
12e050c77be0363 drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2020-11-09  640  		wake_up_all(&mhi_cntrl->state_event);
cd457afb1667050 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  641  }
4884362f6977fc0 drivers/bus/mhi/core/boot.c Bhaumik Bhatt         2021-02-24  642  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
