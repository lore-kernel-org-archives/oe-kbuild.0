Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4EB17BB35
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Dec 2024 11:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734954503; cv=none; b=mpHSjXAYm5N/uswHqf9PDN3b7wCQgqC7yQjpt2HJFaJvVWTI94MBpyG72qLnVFAfLAO5OCOEelnm2xj/8rYhgDN4G10AdghGGKJdQHvGBsCkYznU0FbA3Rnfjjdn8x7eYUp+/boqr+9VALq9/A9jakKLsHWDVzTuHUXLtTU+3RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734954503; c=relaxed/simple;
	bh=cF6ONwY9yJHSnFgucVI3+JaNI17Sj6LyUU9aKecEcIc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MA7uBnqMSxlqBnHgjFYon3bLxb/GMWu8LlOsz5mhd2R6ZXLaYA8POPDPX4QpGEhWzSWmC3ouQY0Aih1rIzeITgkXNuPUOZGrFfZUhJ62JAXIbuuwRlTJHzoH/Z/BFOXe74ggQm7tuWFecHLFqhlOZ7CbQNNxAr/G+wNz2YxXWrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bW+fJtbC; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bW+fJtbC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734954501; x=1766490501;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cF6ONwY9yJHSnFgucVI3+JaNI17Sj6LyUU9aKecEcIc=;
  b=bW+fJtbC9jmcks+iTtmKAKI82p6FrVZCb3MfELprKDAyOt4x7WtrVIYe
   2AzWITIvPhueU/iw+s5rCNEOlOM+/2+yLuTR3rR/5/MjaHwSwUatbuZSm
   qI3edWtBkZPiV2JjSIwazBePpzJ7F2G5oiTutBrTaPt1i7sdDpu+mg95b
   o5At8ZjbD9eV0Q1kxTnMZOeTXwRKANaBeK/8U87U0VfipXfdJMvMwmt4+
   rXmEwLgRX/XuWrbr1UEDohvgqb7W+pPNIbi9seQtjyaEqzpiv12N45xyT
   A/M6F3jNv/YpzM45Fk/haC8x1JMpeLQTOe9Z8qObuHxK/8MFSFJAjy5GE
   Q==;
X-CSE-ConnectionGUID: KB8oXW9nR3qWAJ36NErpKw==
X-CSE-MsgGUID: w4BLIuQTQpq5c3ckfVUwSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="46017486"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="46017486"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 03:48:18 -0800
X-CSE-ConnectionGUID: y/cnS9iqTv+SaNmlpdN3SQ==
X-CSE-MsgGUID: zqD+NXL5SIWixJelqllTYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103804463"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Dec 2024 03:48:16 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPgv0-0003ZF-1H;
	Mon, 23 Dec 2024 11:48:14 +0000
Date: Mon, 23 Dec 2024 19:48:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [lumag-msm:msm-next-lumag 13/20]
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1042
 dpu_plane_virtual_atomic_check() error: uninitialized symbol 'crtc_state'.
Message-ID: <202412231937.tOzYv4oB-lkp@intel.com>
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

tree:   https://gitlab.freedesktop.org/lumag/msm msm-next-lumag
head:   c9261bcc1546a564407513e148c35a79a58bc2b9
commit: 774bcfb731765d092992136b54c34958d7c64bea [13/20] drm/msm/dpu: add support for virtual planes
:::::: branch date: 28 hours ago
:::::: commit date: 8 days ago
config: powerpc-randconfig-r072-20241223 (https://download.01.org/0day-ci/archive/20241223/202412231937.tOzYv4oB-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412231937.tOzYv4oB-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1042 dpu_plane_virtual_atomic_check() error: uninitialized symbol 'crtc_state'.
drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1130 dpu_assign_plane_resources() error: uninitialized symbol 'ret'.

vim +/crtc_state +1042 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c

dbbf57dfd04e62 Dmitry Baryshkov 2024-10-25  1026  
774bcfb731765d Dmitry Baryshkov 2024-12-15  1027  static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
774bcfb731765d Dmitry Baryshkov 2024-12-15  1028  					  struct drm_atomic_state *state)
774bcfb731765d Dmitry Baryshkov 2024-12-15  1029  {
774bcfb731765d Dmitry Baryshkov 2024-12-15  1030  	struct drm_plane_state *plane_state =
774bcfb731765d Dmitry Baryshkov 2024-12-15  1031  		drm_atomic_get_plane_state(state, plane);
774bcfb731765d Dmitry Baryshkov 2024-12-15  1032  	struct drm_plane_state *old_plane_state =
774bcfb731765d Dmitry Baryshkov 2024-12-15  1033  		drm_atomic_get_old_plane_state(state, plane);
774bcfb731765d Dmitry Baryshkov 2024-12-15  1034  	struct dpu_plane_state *pstate = to_dpu_plane_state(plane_state);
774bcfb731765d Dmitry Baryshkov 2024-12-15  1035  	struct drm_crtc_state *crtc_state;
774bcfb731765d Dmitry Baryshkov 2024-12-15  1036  	int ret;
774bcfb731765d Dmitry Baryshkov 2024-12-15  1037  
774bcfb731765d Dmitry Baryshkov 2024-12-15  1038  	if (plane_state->crtc)
774bcfb731765d Dmitry Baryshkov 2024-12-15  1039  		crtc_state = drm_atomic_get_new_crtc_state(state,
774bcfb731765d Dmitry Baryshkov 2024-12-15  1040  							   plane_state->crtc);
774bcfb731765d Dmitry Baryshkov 2024-12-15  1041  
774bcfb731765d Dmitry Baryshkov 2024-12-15 @1042  	ret = dpu_plane_atomic_check_nosspp(plane, plane_state, crtc_state);
774bcfb731765d Dmitry Baryshkov 2024-12-15  1043  	if (ret)
774bcfb731765d Dmitry Baryshkov 2024-12-15  1044  		return ret;
774bcfb731765d Dmitry Baryshkov 2024-12-15  1045  
774bcfb731765d Dmitry Baryshkov 2024-12-15  1046  	if (!plane_state->visible) {
774bcfb731765d Dmitry Baryshkov 2024-12-15  1047  		/*
774bcfb731765d Dmitry Baryshkov 2024-12-15  1048  		 * resources are freed by dpu_crtc_assign_plane_resources(),
774bcfb731765d Dmitry Baryshkov 2024-12-15  1049  		 * but clean them here.
774bcfb731765d Dmitry Baryshkov 2024-12-15  1050  		 */
774bcfb731765d Dmitry Baryshkov 2024-12-15  1051  		pstate->pipe.sspp = NULL;
774bcfb731765d Dmitry Baryshkov 2024-12-15  1052  		pstate->r_pipe.sspp = NULL;
774bcfb731765d Dmitry Baryshkov 2024-12-15  1053  
774bcfb731765d Dmitry Baryshkov 2024-12-15  1054  		return 0;
774bcfb731765d Dmitry Baryshkov 2024-12-15  1055  	}
774bcfb731765d Dmitry Baryshkov 2024-12-15  1056  
774bcfb731765d Dmitry Baryshkov 2024-12-15  1057  	/* force resource reallocation if the format of FB has changed */
774bcfb731765d Dmitry Baryshkov 2024-12-15  1058  	if (!old_plane_state || !old_plane_state->fb ||
774bcfb731765d Dmitry Baryshkov 2024-12-15  1059  	    msm_framebuffer_format(old_plane_state->fb) !=
774bcfb731765d Dmitry Baryshkov 2024-12-15  1060  	    msm_framebuffer_format(plane_state->fb))
774bcfb731765d Dmitry Baryshkov 2024-12-15  1061  		crtc_state->planes_changed = true;
774bcfb731765d Dmitry Baryshkov 2024-12-15  1062  
774bcfb731765d Dmitry Baryshkov 2024-12-15  1063  	return 0;
774bcfb731765d Dmitry Baryshkov 2024-12-15  1064  }
774bcfb731765d Dmitry Baryshkov 2024-12-15  1065  
774bcfb731765d Dmitry Baryshkov 2024-12-15  1066  static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
774bcfb731765d Dmitry Baryshkov 2024-12-15  1067  					      struct dpu_global_state *global_state,
774bcfb731765d Dmitry Baryshkov 2024-12-15  1068  					      struct drm_atomic_state *state,
774bcfb731765d Dmitry Baryshkov 2024-12-15  1069  					      struct drm_plane_state *plane_state)
774bcfb731765d Dmitry Baryshkov 2024-12-15  1070  {
774bcfb731765d Dmitry Baryshkov 2024-12-15  1071  	const struct drm_crtc_state *crtc_state = NULL;
774bcfb731765d Dmitry Baryshkov 2024-12-15  1072  	struct drm_plane *plane = plane_state->plane;
774bcfb731765d Dmitry Baryshkov 2024-12-15  1073  	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
774bcfb731765d Dmitry Baryshkov 2024-12-15  1074  	struct dpu_rm_sspp_requirements reqs;
774bcfb731765d Dmitry Baryshkov 2024-12-15  1075  	struct dpu_plane_state *pstate;
774bcfb731765d Dmitry Baryshkov 2024-12-15  1076  	struct dpu_sw_pipe *pipe;
774bcfb731765d Dmitry Baryshkov 2024-12-15  1077  	struct dpu_sw_pipe *r_pipe;
774bcfb731765d Dmitry Baryshkov 2024-12-15  1078  	const struct msm_format *fmt;
774bcfb731765d Dmitry Baryshkov 2024-12-15  1079  
774bcfb731765d Dmitry Baryshkov 2024-12-15  1080  	if (plane_state->crtc)
774bcfb731765d Dmitry Baryshkov 2024-12-15  1081  		crtc_state = drm_atomic_get_new_crtc_state(state,
774bcfb731765d Dmitry Baryshkov 2024-12-15  1082  							   plane_state->crtc);
774bcfb731765d Dmitry Baryshkov 2024-12-15  1083  
774bcfb731765d Dmitry Baryshkov 2024-12-15  1084  	pstate = to_dpu_plane_state(plane_state);
774bcfb731765d Dmitry Baryshkov 2024-12-15  1085  	pipe = &pstate->pipe;
774bcfb731765d Dmitry Baryshkov 2024-12-15  1086  	r_pipe = &pstate->r_pipe;
774bcfb731765d Dmitry Baryshkov 2024-12-15  1087  
774bcfb731765d Dmitry Baryshkov 2024-12-15  1088  	pipe->sspp = NULL;
774bcfb731765d Dmitry Baryshkov 2024-12-15  1089  	r_pipe->sspp = NULL;
774bcfb731765d Dmitry Baryshkov 2024-12-15  1090  
774bcfb731765d Dmitry Baryshkov 2024-12-15  1091  	if (!plane_state->fb)
774bcfb731765d Dmitry Baryshkov 2024-12-15  1092  		return -EINVAL;
774bcfb731765d Dmitry Baryshkov 2024-12-15  1093  
774bcfb731765d Dmitry Baryshkov 2024-12-15  1094  	fmt = msm_framebuffer_format(plane_state->fb);
774bcfb731765d Dmitry Baryshkov 2024-12-15  1095  	reqs.yuv = MSM_FORMAT_IS_YUV(fmt);
774bcfb731765d Dmitry Baryshkov 2024-12-15  1096  	reqs.scale = (plane_state->src_w >> 16 != plane_state->crtc_w) ||
774bcfb731765d Dmitry Baryshkov 2024-12-15  1097  		(plane_state->src_h >> 16 != plane_state->crtc_h);
774bcfb731765d Dmitry Baryshkov 2024-12-15  1098  
774bcfb731765d Dmitry Baryshkov 2024-12-15  1099  	reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
774bcfb731765d Dmitry Baryshkov 2024-12-15  1100  
774bcfb731765d Dmitry Baryshkov 2024-12-15  1101  	pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
774bcfb731765d Dmitry Baryshkov 2024-12-15  1102  	if (!pipe->sspp)
774bcfb731765d Dmitry Baryshkov 2024-12-15  1103  		return -ENODEV;
774bcfb731765d Dmitry Baryshkov 2024-12-15  1104  
774bcfb731765d Dmitry Baryshkov 2024-12-15  1105  	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
774bcfb731765d Dmitry Baryshkov 2024-12-15  1106  }
774bcfb731765d Dmitry Baryshkov 2024-12-15  1107  
774bcfb731765d Dmitry Baryshkov 2024-12-15  1108  int dpu_assign_plane_resources(struct dpu_global_state *global_state,
774bcfb731765d Dmitry Baryshkov 2024-12-15  1109  			       struct drm_atomic_state *state,
774bcfb731765d Dmitry Baryshkov 2024-12-15  1110  			       struct drm_crtc *crtc,
774bcfb731765d Dmitry Baryshkov 2024-12-15  1111  			       struct drm_plane_state **states,
774bcfb731765d Dmitry Baryshkov 2024-12-15  1112  			       unsigned int num_planes)
774bcfb731765d Dmitry Baryshkov 2024-12-15  1113  {
774bcfb731765d Dmitry Baryshkov 2024-12-15  1114  	unsigned int i;
774bcfb731765d Dmitry Baryshkov 2024-12-15  1115  	int ret;
774bcfb731765d Dmitry Baryshkov 2024-12-15  1116  
774bcfb731765d Dmitry Baryshkov 2024-12-15  1117  	for (i = 0; i < num_planes; i++) {
774bcfb731765d Dmitry Baryshkov 2024-12-15  1118  		struct drm_plane_state *plane_state = states[i];
774bcfb731765d Dmitry Baryshkov 2024-12-15  1119  
774bcfb731765d Dmitry Baryshkov 2024-12-15  1120  		if (!plane_state ||
774bcfb731765d Dmitry Baryshkov 2024-12-15  1121  		    !plane_state->visible)
774bcfb731765d Dmitry Baryshkov 2024-12-15  1122  			continue;
774bcfb731765d Dmitry Baryshkov 2024-12-15  1123  
774bcfb731765d Dmitry Baryshkov 2024-12-15  1124  		ret = dpu_plane_virtual_assign_resources(crtc, global_state,
774bcfb731765d Dmitry Baryshkov 2024-12-15  1125  							 state, plane_state);
774bcfb731765d Dmitry Baryshkov 2024-12-15  1126  		if (ret)
774bcfb731765d Dmitry Baryshkov 2024-12-15  1127  			break;
774bcfb731765d Dmitry Baryshkov 2024-12-15  1128  	}
774bcfb731765d Dmitry Baryshkov 2024-12-15  1129  
774bcfb731765d Dmitry Baryshkov 2024-12-15 @1130  	return ret;
774bcfb731765d Dmitry Baryshkov 2024-12-15  1131  }
774bcfb731765d Dmitry Baryshkov 2024-12-15  1132  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
