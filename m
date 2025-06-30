Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC03539A
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Jun 2025 06:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751264596; cv=none; b=MdXRS7kXxxVq+wXTc66FRFSV47ccf/XLFNBM5qEAdJBfK1c0jLY+ih0IehjdVU04TBJMZTJ8ie7x1FIKMXtjILTswO8VgL/h3pWrwl61qawCkp6HPbfHi6JqTofqZcog74r1KUXOWj64s0RM6cEkgz+N4+NRo22ZgQXKcZBocW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751264596; c=relaxed/simple;
	bh=e84SKCSHXKeN3oxzg9sCTVB/0i9fwxOd6VP57wUtwnE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yq51Dgs5Ps/L/DXA5YrJTi8h59s3IEn5CM2przDFXMowxUfsf6c1Jk+hm8Db87kMKreFOsHJRutq6GkoZfwU+BIEfUX+alvEFJUog0Sz3GF1hhmOrnJITR6vvga4D/rr4xP0TB8hdLNNlm0B1CgLvGKc1AikokYleSFF3bu93uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HFo9rvmb; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HFo9rvmb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751264595; x=1782800595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e84SKCSHXKeN3oxzg9sCTVB/0i9fwxOd6VP57wUtwnE=;
  b=HFo9rvmbCRtsz7FrMJ8i81UcZqgJG9oLZWOFDRM12CC6/Ose6d2EMp4q
   Qw1mw59AFl62+JupPweJJ+s17oAUU5DLYxKRJsR5gK1mvLI72ZiG8vdnA
   8FcjSTCv2cQZ6o6+gvV3xYRE3S8IhL6hHqf4Z0USeDtdYJhxoF8G6IF/K
   Tt2Vgj3yCqMpW6neykK90q2vZA7jfcm+KJIJtk/nmF0vypL1lxFM4QGU7
   ZKHBEUp0cei3F9q8Kg52vBO67AU/iVd463tvZeTG/m+LoHbdy25nuUZT1
   QhC1hKoaV2DT/Ca1YzOFXzYafiQ5Qs6rCmQ1wSCWI9D6tLr5WQBd5hZ7t
   w==;
X-CSE-ConnectionGUID: +extiuZnSpO3JM+jhBst7g==
X-CSE-MsgGUID: SRMPDDZNTzu8VHu7FFpjgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53604390"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="53604390"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 23:23:14 -0700
X-CSE-ConnectionGUID: p81pE2vwTyauEcaN6ouiOA==
X-CSE-MsgGUID: EADvU+wFQ+2kNUYhUOJoOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="159096587"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Jun 2025 23:23:13 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uW7v4-000YVm-2K;
	Mon, 30 Jun 2025 06:23:10 +0000
Date: Mon, 30 Jun 2025 14:22:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] soc: qcom: llcc: Add per slice counter and common
 llcc slice descriptor
Message-ID: <202506301401.m1NkXwJf-lkp@intel.com>
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
In-Reply-To: <20250626-llcc_refcount-v2-1-d05ec8169734@oss.qualcomm.com>
References: <20250626-llcc_refcount-v2-1-d05ec8169734@oss.qualcomm.com>
TO: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
CC: quic_satyap@quicinc.com
CC: linux-arm-msm@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: kernel@oss.qualcomm.com
CC: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>

Hi Unnathi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on f02769e7f272d6f42b9767f066c5a99afd2338f3]

url:    https://github.com/intel-lab-lkp/linux/commits/Unnathi-Chalicheemala/soc-qcom-llcc-Add-per-slice-counter-and-common-llcc-slice-descriptor/20250627-060459
base:   f02769e7f272d6f42b9767f066c5a99afd2338f3
patch link:    https://lore.kernel.org/r/20250626-llcc_refcount-v2-1-d05ec8169734%40oss.qualcomm.com
patch subject: [PATCH v2] soc: qcom: llcc: Add per slice counter and common llcc slice descriptor
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: um-randconfig-r071-20250630 (https://download.01.org/0day-ci/archive/20250630/202506301401.m1NkXwJf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506301401.m1NkXwJf-lkp@intel.com/

smatch warnings:
drivers/soc/qcom/llcc-qcom.c:3859 llcc_slice_getd() warn: passing zero to 'ERR_CAST'

vim +/ERR_CAST +3859 drivers/soc/qcom/llcc-qcom.c

a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3845  
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3846  /**
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3847   * llcc_slice_getd - get llcc slice descriptor
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3848   * @uid: usecase_id for the client
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3849   *
a3e7259f9ebe04 drivers/soc/qcom/llcc-qcom.c  Xiang wangx           2022-06-04  3850   * A pointer to llcc slice descriptor will be returned on success
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3851   * and error pointer is returned on failure
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3852   */
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3853  struct llcc_slice_desc *llcc_slice_getd(u32 uid)
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3854  {
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3855  	const struct llcc_slice_config *cfg;
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3856  	u32 sz, count;
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3857  
bc13c2450f770e drivers/soc/qcom/llcc-qcom.c  Unnathi Chalicheemala 2025-06-26  3858  	if (IS_ERR(drv_data) || !drv_data)
72d1cd033154f5 drivers/soc/qcom/llcc-slice.c Jordan Crouse         2018-12-11 @3859  		return ERR_CAST(drv_data);
72d1cd033154f5 drivers/soc/qcom/llcc-slice.c Jordan Crouse         2018-12-11  3860  
bc13c2450f770e drivers/soc/qcom/llcc-qcom.c  Unnathi Chalicheemala 2025-06-26  3861  	if (IS_ERR_OR_NULL(drv_data->desc) || !drv_data->cfg)
bc13c2450f770e drivers/soc/qcom/llcc-qcom.c  Unnathi Chalicheemala 2025-06-26  3862  		return ERR_PTR(-ENODEV);
bc13c2450f770e drivers/soc/qcom/llcc-qcom.c  Unnathi Chalicheemala 2025-06-26  3863  
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3864  	cfg = drv_data->cfg;
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3865  	sz = drv_data->cfg_size;
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3866  
bc13c2450f770e drivers/soc/qcom/llcc-qcom.c  Unnathi Chalicheemala 2025-06-26  3867  	for (count = 0; count < sz; count++, cfg++)
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3868  		if (cfg->usecase_id == uid)
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3869  			break;
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3870  
bc13c2450f770e drivers/soc/qcom/llcc-qcom.c  Unnathi Chalicheemala 2025-06-26  3871  	if (count == sz)
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3872  		return ERR_PTR(-ENODEV);
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3873  
bc13c2450f770e drivers/soc/qcom/llcc-qcom.c  Unnathi Chalicheemala 2025-06-26  3874  	return &drv_data->desc[count];
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3875  }
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3876  EXPORT_SYMBOL_GPL(llcc_slice_getd);
a3134fb09e0bc5 drivers/soc/qcom/llcc-slice.c Rishabh Bhatnagar     2018-05-23  3877  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
