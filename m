Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A4663CB
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Mar 2024 07:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711784668; cv=none; b=lWq75JRYD9x40Nq8qIrqyX4HdXEYN923vh+5kYNdcBlZ0BsTCcwMTyYOyEHUZlkWZnpFZbLVywsTZ+FysDXoDqxXkoHrHBpo3/mTBU5IfIhkevYezPqmviNFzkN7+Cyn6Kg7zx/6uvzaeANRoTlPpe3w3Ov9SS+3KvjQaXxglRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711784668; c=relaxed/simple;
	bh=49jYwI/SvagQC1nbp9XHbq+hLFtkKWvHaI9IkT8dDEE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XTk02VQqBWPy7WJcFGH6RmswzfDkRLwQ6UVykcC6cHQxYQcw8Y1vh1u1LodWA2KldjMbkXo8npSLeF/F559yskQiahAyyXyEKxPsaFqCKMv25YF3u8faDCjaY8QeWLlgtMYF9mHehTnftH3bIjpA+/58HL37lzDEZayjT/5E/Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n1krxEPP; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n1krxEPP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711784667; x=1743320667;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=49jYwI/SvagQC1nbp9XHbq+hLFtkKWvHaI9IkT8dDEE=;
  b=n1krxEPPuaM+uU9fy5G9ixVv/P8ysSN3Rf4HthJckYrkE+h+0kaXr7Gj
   sHvz8R3uAPVMx62VvX6bC4oYKVDxSHvxK5TN83n+dstn0NNdZzKA61jCR
   2i+80DnN9KH7R4RlQE/pdXSVMBqjBdPPu8sUO7henRPQkTASfA45la2nJ
   eEt1zNaqYCcxh7150BvtL9pQTmHCVGJ6W1+VnXBw+14vMude1AvNX5w53
   8NRCY/Lm9YiR2A9sCnxtVefiRw/iFVQfes0odloNh4yMIiqFBhfinYFFP
   W9n8CsHSWGSxFK1cKXVm8qBb0nXDpZiH1dDb9Veg0X0dvLhpEhgEDMFPO
   Q==;
X-CSE-ConnectionGUID: JdcAVqPPSqmXUBhw7KUi6A==
X-CSE-MsgGUID: V6hGK0dORqWizg1Xp4gsyw==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="10754550"
X-IronPort-AV: E=Sophos;i="6.07,166,1708416000"; 
   d="scan'208";a="10754550"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2024 00:44:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,166,1708416000"; 
   d="scan'208";a="17255861"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Mar 2024 00:44:24 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqTO1-00043i-25;
	Sat, 30 Mar 2024 07:44:21 +0000
Date: Sat, 30 Mar 2024 15:43:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/xe/xe_uc_fw.c:675 uc_fw_request() error: we
 previously assumed 'uc_fw->path' could be null (see line 662)
Message-ID: <202403301558.U5UX04tH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   486291a0e6246364936df1ecd64c90affef4b9c5
commit: 237412e45390805e14a6936fb998d756c4eac9d8 drm/xe: Enable 32bits build
date:   6 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 6 weeks ago
config: i386-randconfig-141-20240329 (https://download.01.org/0day-ci/archive/20240330/202403301558.U5UX04tH-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403301558.U5UX04tH-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_uc_fw.c:675 uc_fw_request() error: we previously assumed 'uc_fw->path' could be null (see line 662)

vim +675 drivers/gpu/drm/xe/xe_uc_fw.c

2e7227b4b73322 Daniele Ceraolo Spurio 2023-11-17  643  
c93ea05191c5b6 Michał Winiarski       2023-12-05  644  static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmware_p)
a9a95523c84957 Daniele Ceraolo Spurio 2023-10-25  645  {
a9a95523c84957 Daniele Ceraolo Spurio 2023-10-25  646  	struct xe_device *xe = uc_fw_to_xe(uc_fw);
a9a95523c84957 Daniele Ceraolo Spurio 2023-10-25  647  	struct device *dev = xe->drm.dev;
2e7227b4b73322 Daniele Ceraolo Spurio 2023-11-17  648  	struct drm_printer p = drm_info_printer(dev);
a9a95523c84957 Daniele Ceraolo Spurio 2023-10-25  649  	const struct firmware *fw = NULL;
a9a95523c84957 Daniele Ceraolo Spurio 2023-10-25  650  	int err;
a9a95523c84957 Daniele Ceraolo Spurio 2023-10-25  651  
a9a95523c84957 Daniele Ceraolo Spurio 2023-10-25  652  	/*
a9a95523c84957 Daniele Ceraolo Spurio 2023-10-25  653  	 * we use FIRMWARE_UNINITIALIZED to detect checks against uc_fw->status
a9a95523c84957 Daniele Ceraolo Spurio 2023-10-25  654  	 * before we're looked at the HW caps to see if we have uc support
a9a95523c84957 Daniele Ceraolo Spurio 2023-10-25  655  	 */
a9a95523c84957 Daniele Ceraolo Spurio 2023-10-25  656  	BUILD_BUG_ON(XE_UC_FIRMWARE_UNINITIALIZED);
a9a95523c84957 Daniele Ceraolo Spurio 2023-10-25  657  	xe_assert(xe, !uc_fw->status);
a9a95523c84957 Daniele Ceraolo Spurio 2023-10-25  658  	xe_assert(xe, !uc_fw->path);
a9a95523c84957 Daniele Ceraolo Spurio 2023-10-25  659  
a9a95523c84957 Daniele Ceraolo Spurio 2023-10-25  660  	uc_fw_auto_select(xe, uc_fw);
45883418969c44 Lucas De Marchi        2024-02-01  661  	uc_fw_override(uc_fw);
a9a95523c84957 Daniele Ceraolo Spurio 2023-10-25 @662  	xe_uc_fw_change_status(uc_fw, uc_fw->path ?
a9a95523c84957 Daniele Ceraolo Spurio 2023-10-25  663  			       XE_UC_FIRMWARE_SELECTED :
a9a95523c84957 Daniele Ceraolo Spurio 2023-10-25  664  			       XE_UC_FIRMWARE_NOT_SUPPORTED);
a9a95523c84957 Daniele Ceraolo Spurio 2023-10-25  665  
6badfc463d609a Lucas De Marchi        2024-02-01  666  	if (!xe_uc_fw_is_supported(uc_fw)) {
6badfc463d609a Lucas De Marchi        2024-02-01  667  		if (uc_fw->type == XE_UC_FW_TYPE_GUC) {
6badfc463d609a Lucas De Marchi        2024-02-01  668  			drm_err(&xe->drm, "No GuC firmware defined for platform\n");
6badfc463d609a Lucas De Marchi        2024-02-01  669  			return -ENOENT;
6badfc463d609a Lucas De Marchi        2024-02-01  670  		}
a9a95523c84957 Daniele Ceraolo Spurio 2023-10-25  671  		return 0;
6badfc463d609a Lucas De Marchi        2024-02-01  672  	}
a9a95523c84957 Daniele Ceraolo Spurio 2023-10-25  673  
a9a95523c84957 Daniele Ceraolo Spurio 2023-10-25  674  	/* an empty path means the firmware is disabled */
a9a95523c84957 Daniele Ceraolo Spurio 2023-10-25 @675  	if (!xe_device_uc_enabled(xe) || !(*uc_fw->path)) {
a9a95523c84957 Daniele Ceraolo Spurio 2023-10-25  676  		xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_DISABLED);
a9a95523c84957 Daniele Ceraolo Spurio 2023-10-25  677  		drm_dbg(&xe->drm, "%s disabled", xe_uc_fw_type_repr(uc_fw->type));
a9a95523c84957 Daniele Ceraolo Spurio 2023-10-25  678  		return 0;
a9a95523c84957 Daniele Ceraolo Spurio 2023-10-25  679  	}
a9a95523c84957 Daniele Ceraolo Spurio 2023-10-25  680  
a9a95523c84957 Daniele Ceraolo Spurio 2023-10-25  681  	err = request_firmware(&fw, uc_fw->path, dev);
a9a95523c84957 Daniele Ceraolo Spurio 2023-10-25  682  	if (err)
a9a95523c84957 Daniele Ceraolo Spurio 2023-10-25  683  		goto fail;
a9a95523c84957 Daniele Ceraolo Spurio 2023-10-25  684  
a9a95523c84957 Daniele Ceraolo Spurio 2023-10-25  685  	err = parse_headers(uc_fw, fw);
a9a95523c84957 Daniele Ceraolo Spurio 2023-10-25  686  	if (err)
a9a95523c84957 Daniele Ceraolo Spurio 2023-10-25  687  		goto fail;
a9a95523c84957 Daniele Ceraolo Spurio 2023-10-25  688  
2e7227b4b73322 Daniele Ceraolo Spurio 2023-11-17  689  	print_uc_fw_version(&p,
2e7227b4b73322 Daniele Ceraolo Spurio 2023-11-17  690  			    &uc_fw->versions.found[XE_UC_FW_VER_RELEASE],
2e7227b4b73322 Daniele Ceraolo Spurio 2023-11-17  691  			    "Using %s firmware from %s",
2e7227b4b73322 Daniele Ceraolo Spurio 2023-11-17  692  			    xe_uc_fw_type_repr(uc_fw->type), uc_fw->path);
61e72e77b66259 Lucas De Marchi        2023-04-05  693  
0881cbe0407778 Daniele Ceraolo Spurio 2023-11-17  694  	/* for GSC FW we want the compatibility version, which we query after load */
0881cbe0407778 Daniele Ceraolo Spurio 2023-11-17  695  	if (uc_fw->type != XE_UC_FW_TYPE_GSC) {
0881cbe0407778 Daniele Ceraolo Spurio 2023-11-17  696  		err = xe_uc_fw_check_version_requirements(uc_fw);
ad55ead7f3c7b0 Lucas De Marchi        2023-03-23  697  		if (err)
dd08ebf6c3525a Matthew Brost          2023-03-30  698  			goto fail;
0881cbe0407778 Daniele Ceraolo Spurio 2023-11-17  699  	}
dd08ebf6c3525a Matthew Brost          2023-03-30  700  
c93ea05191c5b6 Michał Winiarski       2023-12-05  701  	*firmware_p = fw;
c93ea05191c5b6 Michał Winiarski       2023-12-05  702  
c93ea05191c5b6 Michał Winiarski       2023-12-05  703  	return 0;
c93ea05191c5b6 Michał Winiarski       2023-12-05  704  
c93ea05191c5b6 Michał Winiarski       2023-12-05  705  fail:
c93ea05191c5b6 Michał Winiarski       2023-12-05  706  	xe_uc_fw_change_status(uc_fw, err == -ENOENT ?
c93ea05191c5b6 Michał Winiarski       2023-12-05  707  			       XE_UC_FIRMWARE_MISSING :
c93ea05191c5b6 Michał Winiarski       2023-12-05  708  			       XE_UC_FIRMWARE_ERROR);
c93ea05191c5b6 Michał Winiarski       2023-12-05  709  
c93ea05191c5b6 Michał Winiarski       2023-12-05  710  	drm_notice(&xe->drm, "%s firmware %s: fetch failed with error %d\n",
c93ea05191c5b6 Michał Winiarski       2023-12-05  711  		   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path, err);
c93ea05191c5b6 Michał Winiarski       2023-12-05  712  	drm_info(&xe->drm, "%s firmware(s) can be downloaded from %s\n",
c93ea05191c5b6 Michał Winiarski       2023-12-05  713  		 xe_uc_fw_type_repr(uc_fw->type), XE_UC_FIRMWARE_URL);
c93ea05191c5b6 Michał Winiarski       2023-12-05  714  
c93ea05191c5b6 Michał Winiarski       2023-12-05  715  	release_firmware(fw);		/* OK even if fw is NULL */
c93ea05191c5b6 Michał Winiarski       2023-12-05  716  
c93ea05191c5b6 Michał Winiarski       2023-12-05  717  	return err;
c93ea05191c5b6 Michał Winiarski       2023-12-05  718  }
c93ea05191c5b6 Michał Winiarski       2023-12-05  719  

:::::: The code at line 675 was first introduced by commit
:::::: a9a95523c84957b7863796b5d1df2f3f5dca4519 drm/xe/uc: Prepare for parsing of different header types

:::::: TO: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
