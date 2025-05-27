Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE5C139D0A
	for <oe-kbuild@lists.linux.dev>; Tue, 27 May 2025 22:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748384441; cv=none; b=HLpKZS8P4cC1SmraZ/nAhjxsFCC3FJceHJyspmPgu0BH6xlPudyTVHjvUI8T4dNscnH7n/8rXxdOnVVunCCPdbgTAe/tpPeouU1wJP/8BAklX+ePwnD5pweN4WDvgECpsVi/mO3khthxrLkUPIfLHa65TBEtdqPpOW2GOGLiSc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748384441; c=relaxed/simple;
	bh=tXCSVqthv9flEWv/PfcxFzI9Ea6KXGVtW2KFSWgOGrA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D1AuIoikhQURXisQDsGiMrSr8t1dreSiXmpC8NajTxv79AC5FEDAK5zF6OqNC4SO5dyINlzCPXLEeUTpA/Pl1DxxVlEqTQITx/0Hl6nAXpW8OKKTOsWa8MMLn+JdIV55uH8DWiQxIawAJIQjaxNZqajxkDaynHT9Z1+Bj3VHqkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FoYkPgb3; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FoYkPgb3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748384439; x=1779920439;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tXCSVqthv9flEWv/PfcxFzI9Ea6KXGVtW2KFSWgOGrA=;
  b=FoYkPgb3LfyxXjERYfEFK+upCDvSql6W/4CSsLJp2SDRN5VyStda2pMq
   NQZtjkFePDuDl69WCEAuoNEdr3E2xKkQ18mJjRCdVT00d6FUY/xiPfhQs
   ny9SwHEryUMzPCvYXL6L6BzvWzK5pI1mf+zWTW59q9ncC3ZYDdx98U01K
   hoRimexL0iJ6W//7K0uSzGMEBA+hyXA/t2YrSbhVF5iXERih3iRPNff2l
   rfOV8oi/DVsHE9lOIx4zXuUQQ+T+tDqDIq6+PnksGtkLatwzj19Dwa2eI
   RaRdlfbYjt2Y5ll07IN00ozTPw8DGAqjC64VZYa55DCmFbT99ua7+jZko
   Q==;
X-CSE-ConnectionGUID: PHiOIza5TKmMoiyWdsCXhA==
X-CSE-MsgGUID: vRMi+BRnTAuV3Q5bVFdCmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="54192192"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="54192192"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 15:20:38 -0700
X-CSE-ConnectionGUID: iGw4w7V5Q7uv0JqYe/sKdQ==
X-CSE-MsgGUID: ghQHYpZITqG76ygWmFfxjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="148137832"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 May 2025 15:20:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uK2ex-000V36-0O;
	Tue, 27 May 2025 22:20:35 +0000
Date: Wed, 28 May 2025 06:20:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 09/12] tee: add Qualcomm TEE driver
Message-ID: <202505280653.Y79JKqDd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-9-024e3221b0b9@oss.qualcomm.com>
References: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-9-024e3221b0b9@oss.qualcomm.com>
TO: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
TO: Jens Wiklander <jens.wiklander@linaro.org>
TO: Sumit Garg <sumit.garg@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
TO: Apurupa Pattapu <quic_apurupa@quicinc.com>
TO: Kees Cook <kees@kernel.org>
TO: "Gustavo A. R. Silva" <gustavoars@kernel.org>
TO: Sumit Semwal <sumit.semwal@linaro.org>
TO: "Christian König" <christian.koenig@amd.com>
CC: Harshal Dev <quic_hdev@quicinc.com>
CC: linux-arm-msm@vger.kernel.org
CC: op-tee@lists.trustedfirmware.org
CC: linux-kernel@vger.kernel.org
CC: linux-hardening@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: linaro-mm-sig@lists.linaro.org
CC: linux-doc@vger.kernel.org
CC: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
CC: Neil Armstrong <neil.armstrong@linaro.org>

Hi Amirreza,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3be1a7a31fbda82f3604b6c31e4f390110de1b46]

url:    https://github.com/intel-lab-lkp/linux/commits/Amirreza-Zarrabi/tee-allow-a-driver-to-allocate-a-tee_device-without-a-pool/20250527-151020
base:   3be1a7a31fbda82f3604b6c31e4f390110de1b46
patch link:    https://lore.kernel.org/r/20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-9-024e3221b0b9%40oss.qualcomm.com
patch subject: [PATCH v5 09/12] tee: add Qualcomm TEE driver
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: x86_64-randconfig-161-20250528 (https://download.01.org/0day-ci/archive/20250528/202505280653.Y79JKqDd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505280653.Y79JKqDd-lkp@intel.com/

smatch warnings:
drivers/tee/qcomtee/call.c:748 qcomtee_probe() warn: missing error code 'err'
drivers/tee/qcomtee/core.c:192 qcomtee_idx_erase() warn: impossible condition '(idx > ((~0))) => (2147483649-u32max > u32max)'
drivers/tee/qcomtee/core.c:786 qcomtee_object_do_invoke_internal() error: uninitialized symbol 'errno'.

vim +/err +748 drivers/tee/qcomtee/call.c

accd33ce59c3367 Amirreza Zarrabi 2025-05-26  710  
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  711  static int qcomtee_probe(struct platform_device *pdev)
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  712  {
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  713  	struct workqueue_struct *async_wq;
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  714  	struct tee_device *teedev;
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  715  	struct tee_shm_pool *pool;
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  716  	struct tee_context *ctx;
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  717  	struct qcomtee *qcomtee;
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  718  	int err;
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  719  
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  720  	qcomtee = kzalloc(sizeof(*qcomtee), GFP_KERNEL);
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  721  	if (!qcomtee)
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  722  		return -ENOMEM;
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  723  
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  724  	pool = qcomtee_shm_pool_alloc();
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  725  	if (IS_ERR(pool)) {
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  726  		err = PTR_ERR(pool);
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  727  
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  728  		goto err_free_qcomtee;
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  729  	}
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  730  
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  731  	teedev = tee_device_alloc(&qcomtee_desc, NULL, pool, qcomtee);
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  732  	if (IS_ERR(teedev)) {
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  733  		err = PTR_ERR(teedev);
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  734  
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  735  		goto err_pool_destroy;
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  736  	}
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  737  
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  738  	qcomtee->teedev = teedev;
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  739  	qcomtee->pool = pool;
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  740  	err = tee_device_register(qcomtee->teedev);
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  741  	if (err)
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  742  		goto err_unreg_teedev;
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  743  
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  744  	platform_set_drvdata(pdev, qcomtee);
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  745  	/* Start async wq. */
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  746  	async_wq = alloc_ordered_workqueue("qcomtee_wq", 0);
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  747  	if (!async_wq)
accd33ce59c3367 Amirreza Zarrabi 2025-05-26 @748  		goto err_unreg_teedev;
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  749  
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  750  	qcomtee->wq = async_wq;
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  751  	/* Driver context used for async operations of teedev. */
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  752  	ctx = teedev_open(qcomtee->teedev);
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  753  	if (IS_ERR(ctx)) {
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  754  		err = PTR_ERR(ctx);
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  755  
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  756  		goto err_dest_wq;
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  757  	}
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  758  
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  759  	qcomtee->ctx = ctx;
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  760  	/* Init Object table. */
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  761  	qcomtee->xa_last_id = 0;
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  762  	xa_init_flags(&qcomtee->xa_local_objects, XA_FLAGS_ALLOC);
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  763  	/* Get QTEE verion. */
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  764  	qcomtee_get_qtee_feature_list(qcomtee->ctx,
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  765  				      QCOMTEE_FEATURE_VER_OP_GET_QTEE_ID,
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  766  				      &qtee_version);
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  767  
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  768  	pr_info("QTEE version %u.%u.%u\n",
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  769  		QTEE_VERSION_GET_MAJOR(qtee_version),
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  770  		QTEE_VERSION_GET_MINOR(qtee_version),
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  771  		QTEE_VERSION_GET_PATCH(qtee_version));
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  772  
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  773  	return 0;
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  774  
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  775  err_dest_wq:
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  776  	destroy_workqueue(qcomtee->wq);
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  777  err_unreg_teedev:
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  778  	tee_device_unregister(qcomtee->teedev);
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  779  err_pool_destroy:
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  780  	tee_shm_pool_free(pool);
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  781  err_free_qcomtee:
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  782  	kfree(qcomtee);
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  783  
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  784  	return err;
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  785  }
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  786  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
