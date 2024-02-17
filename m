Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296AA1C282
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Feb 2024 19:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708199831; cv=none; b=nyixr/eW5m6mo/Qfi3hfuIg/pCV7NYfoNqXlJcfBfUnI3DdAtuD22KD6tAFt1EQ8QjnUvexSRvnGyQF3iZhEbtSSPKoCfqowzOeYA1WY1g8dwzC1CR5Yo76TRMT71G8ePfxKTMduTLisZg5+YXqSMBwKAv2cmF1H6/moO52NG9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708199831; c=relaxed/simple;
	bh=iIWVGvmf5uEAZlHYejt21hHLa46uD+NLFkTdhtjRtKs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XhOLCJkuAglvqjxiQDrytAZI+fvc/1lRxpZ7be+GTPGUQ5jnD0y9drpm8yik/OUvCiRfTUYgG6PpT/1GljonJAu6Z1WHCNY4UL2SnZ3Qhlx6b4YZr0EwMSvJ7SnOq1AmNNNQgecTWhVZY561aMhUOvOl6xxx1c9Kap/1BvniH6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fQAYb4ts; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fQAYb4ts"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708199828; x=1739735828;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iIWVGvmf5uEAZlHYejt21hHLa46uD+NLFkTdhtjRtKs=;
  b=fQAYb4ts/tGD/B+KShmfUt+/9y1krczH1DbbQE2QgTbr0H6uzI72Yrzj
   qtc7ATWuOvU6tQGAnR8ov89AH2pHxu3TO7CtNb0raAN23eRwN/DAaqRQj
   2X4+b4B+RL0sRL8OKPJm3aAOK8wYK2Epr0pYvkUASpe0SDyr1M0XdtTl6
   yuBNj00gHjP4hmp984lC7KLhSHt4bmXgUBhoroCkHQXM3c2+iSbVZOujg
   vfKI1IQTGWutQIdy9YrZ/noIBErQ0I16ItZbR8PNWATvPe13GUnxKW09S
   roc7lDWiGRx0Nus6MnwLWWf4XenCNEkW6UfZCR6gxVJjJukBdxugyzbEF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="13717655"
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="13717655"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 11:57:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="41618111"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 17 Feb 2024 11:57:06 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbQo3-0002Si-2h;
	Sat, 17 Feb 2024 19:57:03 +0000
Date: Sun, 18 Feb 2024 03:56:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 16/28] drm/i915/color: Create a transfer function color
 pipeline
Message-ID: <202402180310.gMdIXaJx-lkp@intel.com>
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
In-Reply-To: <20240213064835.139464-17-uma.shankar@intel.com>
References: <20240213064835.139464-17-uma.shankar@intel.com>
TO: Uma Shankar <uma.shankar@intel.com>
TO: intel-gfx@lists.freedesktop.org
TO: dri-devel@lists.freedesktop.org
CC: ville.syrjala@linux.intel.com
CC: pekka.paalanen@collabora.com
CC: contact@emersion.fr
CC: harry.wentland@amd.com
CC: mwen@igalia.com
CC: jadahl@redhat.com
CC: sebastian.wick@redhat.com
CC: shashank.sharma@amd.com
CC: agoins@nvidia.com
CC: joshua@froggi.es
CC: mdaenzer@redhat.com
CC: aleixpol@kde.org
CC: xaver.hugl@gmail.com
CC: victoria@system76.com
CC: daniel@ffwll.ch
CC: quic_naseer@quicinc.com
CC: quic_cbraga@quicinc.com
CC: quic_abhinavk@quicinc.com
CC: arthurgrillo@riseup.net
CC: marcan@marcan.st
CC: Liviu.Dudau@arm.com
CC: sashamcintosh@google.com
CC: sean@poorly.run
CC: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
CC: Uma Shankar <uma.shankar@intel.com>

Hi Uma,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next next-20240216]
[cannot apply to drm-intel/for-linux-next drm-intel/for-linux-next-fixes linus/master v6.8-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Uma-Shankar/drm-color-pipeline-base-work/20240213-144544
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240213064835.139464-17-uma.shankar%40intel.com
patch subject: [PATCH 16/28] drm/i915/color: Create a transfer function color pipeline
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-141-20240217 (https://download.01.org/0day-ci/archive/20240218/202402180310.gMdIXaJx-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402180310.gMdIXaJx-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/i915/display/intel_color.c:3867 intel_plane_tf_pipeline_init() error: 'colorop' dereferencing possible ERR_PTR()

Old smatch warnings:
drivers/gpu/drm/i915/display/intel_color.c:3185 i9xx_read_lut_10() error: uninitialized symbol 'ldw'.
drivers/gpu/drm/i915/display/intel_color.c:3185 i9xx_read_lut_10() error: uninitialized symbol 'udw'.

vim +/colorop +3867 drivers/gpu/drm/i915/display/intel_color.c

6c851db2c55bf8 Chaitanya Kumar Borah 2024-02-13  3851  
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3852  int intel_plane_tf_pipeline_init(struct drm_plane *plane, struct drm_prop_enum_list *list)
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3853  {
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3854  	struct intel_plane *intel_plane = to_intel_plane(plane);
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3855  	struct intel_plane_colorop *colorop;
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3856  	struct drm_device *dev = plane->dev;
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3857  	struct drm_i915_private *i915 = to_i915(dev);
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3858  	int ret;
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3859  	struct drm_colorop *prev_op;
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3860  
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3861  	colorop = intel_plane_colorop_create(CB_PLANE_PRE_CSC_LUT);
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3862  
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3863  	ret = drm_colorop_init(dev, &colorop->base, plane, DRM_COLOROP_1D_LUT);
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3864  	if (ret)
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3865  		return ret;
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3866  
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13 @3867  	list->type = colorop->base.base.id;
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3868  	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", colorop->base.base.id);
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3869  
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3870  	/* TODO: handle failures and clean up*/
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3871  	prev_op = &colorop->base;
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3872  
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3873  	if (icl_is_hdr_plane(i915, intel_plane->id)) {
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3874  		colorop = intel_plane_colorop_create(CB_PLANE_CSC);
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3875  		ret = drm_colorop_init(dev, &colorop->base, plane, DRM_COLOROP_CTM_3X3);
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3876  		if (ret)
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3877  			return ret;
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3878  
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3879  		drm_colorop_set_next_property(prev_op, &colorop->base);
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3880  		prev_op = &colorop->base;
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3881  	}
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3882  
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3883  	colorop = intel_plane_colorop_create(CB_PLANE_POST_CSC_LUT);
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3884  	ret = drm_colorop_init(dev, &colorop->base, plane, DRM_COLOROP_1D_LUT);
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3885  	if (ret)
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3886  		return ret;
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3887  
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3888  	drm_colorop_set_next_property(prev_op, &colorop->base);
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3889  
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3890  	return 0;
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3891  }
5e1e0f87c9bcae Chaitanya Kumar Borah 2024-02-13  3892  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
