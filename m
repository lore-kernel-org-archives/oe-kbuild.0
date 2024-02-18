Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A781DFF2
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Feb 2024 20:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708289352; cv=none; b=rz0J4J70hwYJYJIA2SV0VcQgZ/AZv9IgAZ2UKBwEv5iA3BEUkcL2mFEX1P1pw+HsSxfaOKgBwPnOo3n9g0IgSHK4/T/KAw9RPew9MRzY+i3j5cfGYNxsboDDGcljj9cXRcsPyHzj0il/iIULrBSw042+o05+CTjf7h3A3hAqKg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708289352; c=relaxed/simple;
	bh=79ajAEPhE0M6dBXWoSum5/dwqEaVcL4Vsu41sxfofEc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tt9FENBTLLtv/2xqElpOiSEjvtT0g7aAQQD8qHp6GHLV6LaZf9nZzkkuWFHGfPRwruXUCM+fq4bCWiEwMFECNjNO8c6ao2kwOCY0YW/EimcbDt96gRgejC/64hc+8SX+oc0x0yLm0RosWGFTlfaUW0xweoAj3Q+9Lq05jqAPeWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DE+bFwMq; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DE+bFwMq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708289350; x=1739825350;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=79ajAEPhE0M6dBXWoSum5/dwqEaVcL4Vsu41sxfofEc=;
  b=DE+bFwMq8kCQ8xqtktdZDSo5nasi2iLv5/abvAfVhPrcLW7VFpyYievd
   Vsj3STeV0AjNc9uhSb3oy/5E86RkCp5wxSsr5uwDdUwmrwchO4zAPAsTe
   T4GOdaYNI+ioDa5HbvRUlxkKDyckPwBfRHuoZ1LduUhOgSn9ZmqVuExJ7
   hHJ95AlgFPo5Mp931z0I0ZEs+kS5sLSCfj5L+sHAQxGjVAQMADmirGkIz
   SH3gNULWEpJzDbwVcFkHb+2Y9VwiLXq6H8htJa9nlQr7LkzxfWw54jfED
   NBuE81jkmmpoXU0+kq/sGZhdlQGSQCkkIJTvaxBSCq+/ZXH1uyWUm+rY0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="2794695"
X-IronPort-AV: E=Sophos;i="6.06,169,1705392000"; 
   d="scan'208";a="2794695"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2024 12:49:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,169,1705392000"; 
   d="scan'208";a="9002058"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 18 Feb 2024 12:49:08 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbo53-0003IY-0x;
	Sun, 18 Feb 2024 20:48:20 +0000
Date: Mon, 19 Feb 2024 04:47:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [lumag-msm:msm-next-lumag-test 31/49]
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c:746
 dpu_encoder_phys_cmd_init() warn: variable dereferenced before check
 'phys_enc->hw_intf' (see line 742)
Message-ID: <202402190439.kNeGrO9l-lkp@intel.com>
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
TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>

tree:   https://gitlab.freedesktop.org/lumag/msm msm-next-lumag-test
head:   32d80494be094a2b7a0464460c61059ebc032494
commit: d13f638c9b88e9921d39d133a797e80aa1c235f0 [31/49] drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set
:::::: branch date: 8 hours ago
:::::: commit date: 7 days ago
config: powerpc64-randconfig-r071-20240218 (https://download.01.org/0day-ci/archive/20240219/202402190439.kNeGrO9l-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402190439.kNeGrO9l-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c:746 dpu_encoder_phys_cmd_init() warn: variable dereferenced before check 'phys_enc->hw_intf' (see line 742)

vim +746 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c

25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  719  
73169b45e1ed29 Dmitry Baryshkov  2023-12-02  720  struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(struct drm_device *dev,
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  721  		struct dpu_enc_phys_init_params *p)
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  722  {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  723  	struct dpu_encoder_phys *phys_enc = NULL;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  724  	struct dpu_encoder_phys_cmd *cmd_enc = NULL;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  725  
8ea432b8428e9b Dmitry Baryshkov  2023-06-01  726  	DPU_DEBUG("intf\n");
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  727  
73169b45e1ed29 Dmitry Baryshkov  2023-12-02  728  	cmd_enc = drmm_kzalloc(dev, sizeof(*cmd_enc), GFP_KERNEL);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  729  	if (!cmd_enc) {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  730  		DPU_ERROR("failed to allocate\n");
ed02d3dd18dc35 Dmitry Baryshkov  2023-06-01  731  		return ERR_PTR(-ENOMEM);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  732  	}
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  733  	phys_enc = &cmd_enc->base;
7731ee3b06c12b Dmitry Baryshkov  2023-06-01  734  
7731ee3b06c12b Dmitry Baryshkov  2023-06-01  735  	dpu_encoder_phys_init(phys_enc, p);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  736  
45284ff733e4ca Paloma Arellano   2023-12-12  737  	mutex_init(&phys_enc->vblank_ctl_lock);
45284ff733e4ca Paloma Arellano   2023-12-12  738  	phys_enc->vblank_refcount = 0;
45284ff733e4ca Paloma Arellano   2023-12-12  739  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  740  	dpu_encoder_phys_cmd_init_ops(&phys_enc->ops);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  741  	phys_enc->intf_mode = INTF_MODE_CMD;
d13f638c9b88e9 Dmitry Baryshkov  2024-02-08 @742  	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
d13f638c9b88e9 Dmitry Baryshkov  2024-02-08  743  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  744  	cmd_enc->stream_sel = 0;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  745  
edc8230af66611 Dmitry Baryshkov  2023-09-04 @746  	if (!phys_enc->hw_intf) {

:::::: The code at line 746 was first introduced by commit
:::::: edc8230af6661189b1f40dccf0a75d9e6062569b drm/msm/dpu: move INTF tearing checks to dpu_encoder_phys_cmd_init

:::::: TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
:::::: CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
