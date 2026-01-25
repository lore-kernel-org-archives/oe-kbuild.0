Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DA4EEAB
	for <oe-kbuild@lists.linux.dev>; Sun, 25 Jan 2026 14:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769351712; cv=none; b=XcpqGzuwTjFBJaiQ7DqRtYNB7FfunE13qO13BIxaLmfYn/Jr4eMt7UqQAnZllxX/pMlUExEQJ3Q0gIZNcKgnH8VpTuvSqAg/MpQR0Yx1ryzuWHqF8KP4MdtX5tWfN1nKQBrCjYlCCFEkUiVW/gYZK5Z7hUueYY65AvmOE3A3hok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769351712; c=relaxed/simple;
	bh=YCH+XweOkAJ5NG4JIOlwg1cQt6OmdEckNFwyHMGnrWY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Cfam4UaV4vRiIb1g5r2+GQAvoBYwpbK3rgQGpfnqvEOl381ia/MNZLEx6wosv72Sj/82ReWIHbKFDsmO0lwgVgb0O5GaZKVl77ZIvMF5vjBUzanKpCP0DzdljVE+KFBZDZuzQde23t8fq2TPaZ2KdSHuQ85KomUzr0DYjfdPtc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G/81uafv; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G/81uafv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769351710; x=1800887710;
  h=date:from:to:cc:subject:message-id;
  bh=YCH+XweOkAJ5NG4JIOlwg1cQt6OmdEckNFwyHMGnrWY=;
  b=G/81uafvNIrlAQsbsPt/EnBaIkZ2+ItAn5Edc+bGL5Pw6gozz+Ok96+Z
   kDA4uHepPcEvzAPlWN5KyqDSj9PllsTJe9mvac6n7PDP1E50+uyAO+hXH
   Crhj27JlokW7k1tNpOtOMzR10e+9T3lyn28iJTEIwQzitdHAuXnLiddB5
   coMSO6ERX1F/8SoyAigkUQ8ZrdfqI9Z4XbcBSk3nHrlIN6cMBq9ADZB/Y
   NKKCYMBTxYTkZTzPbtUvXlEUy7UXdWGOFVbG0Hz0rbXBaMUrZevev1HMN
   mQKGphLmbENhcseLDbVp/EKReNTSLPcTYXQk5nRFbrDbBEPQSRx+7N5FO
   Q==;
X-CSE-ConnectionGUID: fi6nm/BISq+XTe3nlRYZ0Q==
X-CSE-MsgGUID: 318bW3z+TUqQEwHjAdtbXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="81654475"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="81654475"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 06:35:08 -0800
X-CSE-ConnectionGUID: OkFqbbCCRYWvFJ+yO86JEQ==
X-CSE-MsgGUID: TLucRHiMSb6hDCv4528wZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="207898923"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 25 Jan 2026 06:35:07 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk1Cj-00000000W50-09Gz;
	Sun, 25 Jan 2026 14:35:05 +0000
Date: Sun, 25 Jan 2026 22:34:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7732/9539]
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:161
 dpu_hw_sspp_setup_pe_config_v13() warn: variable dereferenced before check
 'ctx' (see line 159)
Message-ID: <202601252214.oEaY3UZM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
CC: Dmitry Baryshkov <lumag@kernel.org>
CC: Yongxing Mou <yongxing.mou@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
commit: 688c7734002a1ee6f50a28ba9bd7aa380edbe12d [7732/9539] drm/msm/dpu: Add Kaanapali SSPP sub-block support
:::::: branch date: 2 days ago
:::::: commit date: 5 days ago
config: mips-randconfig-r071-20260125 (https://download.01.org/0day-ci/archive/20260125/202601252214.oEaY3UZM-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601252214.oEaY3UZM-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:161 dpu_hw_sspp_setup_pe_config_v13() warn: variable dereferenced before check 'ctx' (see line 159)

vim +/ctx +161 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c

688c7734002a1e Yuanjie Yang 2026-01-15  151  
688c7734002a1e Yuanjie Yang 2026-01-15  152  static void dpu_hw_sspp_setup_pe_config_v13(struct dpu_hw_sspp *ctx,
688c7734002a1e Yuanjie Yang 2026-01-15  153  					    struct dpu_hw_pixel_ext *pe_ext)
688c7734002a1e Yuanjie Yang 2026-01-15  154  {
688c7734002a1e Yuanjie Yang 2026-01-15  155  	struct dpu_hw_blk_reg_map *c;
688c7734002a1e Yuanjie Yang 2026-01-15  156  	u8 color;
688c7734002a1e Yuanjie Yang 2026-01-15  157  	u32 lr_pe[4], tb_pe[4];
688c7734002a1e Yuanjie Yang 2026-01-15  158  	const u32 bytemask = 0xff;
688c7734002a1e Yuanjie Yang 2026-01-15 @159  	u32 offset = ctx->cap->sblk->sspp_rec0_blk.base;
688c7734002a1e Yuanjie Yang 2026-01-15  160  
688c7734002a1e Yuanjie Yang 2026-01-15 @161  	if (!ctx || !pe_ext)
688c7734002a1e Yuanjie Yang 2026-01-15  162  		return;
688c7734002a1e Yuanjie Yang 2026-01-15  163  
688c7734002a1e Yuanjie Yang 2026-01-15  164  	c = &ctx->hw;
688c7734002a1e Yuanjie Yang 2026-01-15  165  	/* program SW pixel extension override for all pipes*/
688c7734002a1e Yuanjie Yang 2026-01-15  166  	for (color = 0; color < DPU_MAX_PLANES; color++) {
688c7734002a1e Yuanjie Yang 2026-01-15  167  		/* color 2 has the same set of registers as color 1 */
688c7734002a1e Yuanjie Yang 2026-01-15  168  		if (color == 2)
688c7734002a1e Yuanjie Yang 2026-01-15  169  			continue;
688c7734002a1e Yuanjie Yang 2026-01-15  170  
688c7734002a1e Yuanjie Yang 2026-01-15  171  		lr_pe[color] = ((pe_ext->right_ftch[color] & bytemask) << 24) |
688c7734002a1e Yuanjie Yang 2026-01-15  172  			       ((pe_ext->right_rpt[color] & bytemask) << 16) |
688c7734002a1e Yuanjie Yang 2026-01-15  173  			       ((pe_ext->left_ftch[color] & bytemask) << 8) |
688c7734002a1e Yuanjie Yang 2026-01-15  174  			       (pe_ext->left_rpt[color] & bytemask);
688c7734002a1e Yuanjie Yang 2026-01-15  175  
688c7734002a1e Yuanjie Yang 2026-01-15  176  		tb_pe[color] = ((pe_ext->btm_ftch[color] & bytemask) << 24) |
688c7734002a1e Yuanjie Yang 2026-01-15  177  			       ((pe_ext->btm_rpt[color] & bytemask) << 16) |
688c7734002a1e Yuanjie Yang 2026-01-15  178  			       ((pe_ext->top_ftch[color] & bytemask) << 8) |
688c7734002a1e Yuanjie Yang 2026-01-15  179  			       (pe_ext->top_rpt[color] & bytemask);
688c7734002a1e Yuanjie Yang 2026-01-15  180  	}
688c7734002a1e Yuanjie Yang 2026-01-15  181  
688c7734002a1e Yuanjie Yang 2026-01-15  182  	/* color 0 */
688c7734002a1e Yuanjie Yang 2026-01-15  183  	DPU_REG_WRITE(c, SSPP_REC_SW_PIX_EXT_LR + offset, lr_pe[0]);
688c7734002a1e Yuanjie Yang 2026-01-15  184  	DPU_REG_WRITE(c, SSPP_REC_SW_PIX_EXT_TB + offset, tb_pe[0]);
688c7734002a1e Yuanjie Yang 2026-01-15  185  
688c7734002a1e Yuanjie Yang 2026-01-15  186  	/* color 1 and color 2 */
688c7734002a1e Yuanjie Yang 2026-01-15  187  	DPU_REG_WRITE(c, SSPP_REC_SW_PIX_EXT_LR_ODX + offset, lr_pe[1]);
688c7734002a1e Yuanjie Yang 2026-01-15  188  	DPU_REG_WRITE(c, SSPP_REC_SW_PIX_EXT_TB_ODX + offset, tb_pe[1]);
688c7734002a1e Yuanjie Yang 2026-01-15  189  }
688c7734002a1e Yuanjie Yang 2026-01-15  190  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
