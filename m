Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9399E1E766F
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Jun 2026 15:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780588189; cv=none; b=pbg4wECal1K+9D6TxuHDjXf2PUY66D52LTRmF0fAMkHqzUpY73wCq0Ol0BmTfCeChXP7BJGtb3UWXm6GtRqOC3MSJqmf8afx0vPMYsaaHIkMK8NYjXoM2zLAY0xXr1K6afAvaP1d0MUXThTbLr7ltoJRA5+R5jnv89oAfF3J46o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780588189; c=relaxed/simple;
	bh=gfeNNE7dMu6kk5hxFGIJjiUlyj0ecRSeU1VBBwV8zco=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ku7QtPqBtganVF5YAFBqy2z6SngezeH7787bHvjCx/CYxRQFycW9+ES+kMvKEnUHxt1WAOyqEwvlPoFOb0OOKUtTyH8B+aq95aYjoWUVu+wzmCGkdztVLqy2wN+XOgLQVsm81tV1N9xEKTGVPxCfJAv2ELutdim8P6iB98qIlfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BSzU/793; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BSzU/793"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780588187; x=1812124187;
  h=date:from:to:cc:subject:message-id;
  bh=gfeNNE7dMu6kk5hxFGIJjiUlyj0ecRSeU1VBBwV8zco=;
  b=BSzU/793VAziUZfSoWaVfdVxvnM38HCjiQo5Peqkfy9JZZCip+Coc5Bn
   7mqgX1aw0JBgQRPBoXfOEUIuYpYBNoZmL867YdkRXpdroojr5Kd2CZ/hc
   zqIemnZODxCHQnf4aNr7V+lOuxdiWLOc0hyCITORzaRZsteHAL2Tjj9RG
   VZUFLte0TMf3g8VhenSPFHz3lUmT+ya+bR4lWiHXnAuGOhXW6yCkpea1f
   7Vzh2W361pPMDJs5dHk2AgywPwTlrBFJOaSqzVgKPTi78cS8GIhoNHP10
   4gOfKC9ECyEF5BylMlw1UBO4AbnVWyYOxJWZ6OoW3BQyQj0rcVURHN9CC
   A==;
X-CSE-ConnectionGUID: pIo34SoORMC06LgaP4KMOA==
X-CSE-MsgGUID: eHyIaUyfTemlzJVdEtmYkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="80557525"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="80557525"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 08:49:47 -0700
X-CSE-ConnectionGUID: pKe1koL1R1O8qDd4GJvQNg==
X-CSE-MsgGUID: pO2b46RFRUS3mo3Blej+fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="246414075"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Jun 2026 08:49:46 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVAKF-00000000Etm-0zh7;
	Thu, 04 Jun 2026 15:49:43 +0000
Date: Thu, 04 Jun 2026 23:49:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: 
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c:671:42-46: ERROR:
 invalid reference to the index variable of the iterator on line 660
Message-ID: <202606042310.V07jmBFp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ben Skeggs <bskeggs@nvidia.com>
CC: Dave Airlie <airlied@redhat.com>
CC: Timur Tabi <ttabi@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
commit: c472d828348cafa7874816f4ad2a2314d0000419 drm/nouveau/gsp: move subdev/engine impls to subdev/gsp/rm/r535/
date:   1 year, 1 month ago
:::::: branch date: 2 days ago
:::::: commit date: 1 year, 1 month ago
config: mips-randconfig-r063-20260604 (https://download.01.org/0day-ci/archive/20260604/202606042310.V07jmBFp-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e5ab4f8a1f766febdc65ce89c00dec85393cfd68)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c472d828348c ("drm/nouveau/gsp: move subdev/engine impls to subdev/gsp/rm/r535/")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202606042310.V07jmBFp-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c:671:42-46: ERROR: invalid reference to the index variable of the iterator on line 660

vim +671 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c

9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs  2023-09-19  637  
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs  2023-09-19  638  static struct nvkm_conn *
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs  2023-09-19  639  r535_conn_new(struct nvkm_disp *disp, u32 id)
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs  2023-09-19  640  {
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs  2023-09-19  641  	NV0073_CTRL_SPECIFIC_GET_CONNECTOR_DATA_PARAMS *ctrl;
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs  2023-09-19  642  	struct nvbios_connE dcbE = {};
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs  2023-09-19  643  	struct nvkm_conn *conn;
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs  2023-09-19  644  	int ret, index;
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs  2023-09-19  645  
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs  2023-09-19  646  	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs  2023-09-19  647  				    NV0073_CTRL_CMD_SPECIFIC_GET_CONNECTOR_DATA, sizeof(*ctrl));
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs  2023-09-19  648  	if (IS_ERR(ctrl))
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs  2023-09-19  649  		return (void *)ctrl;
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs  2023-09-19  650  
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs  2023-09-19  651  	ctrl->subDeviceInstance = 0;
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs  2023-09-19  652  	ctrl->displayId = BIT(id);
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs  2023-09-19  653  
4ae3a20102b20d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Dave Airlie 2023-12-22  654  	ret = nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, &ctrl, sizeof(*ctrl));
4ae3a20102b20d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Dave Airlie 2023-12-22  655  	if (ret) {
4ae3a20102b20d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Dave Airlie 2023-12-22  656  		nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
4ae3a20102b20d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Dave Airlie 2023-12-22  657  		return ERR_PTR(ret);
4ae3a20102b20d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Dave Airlie 2023-12-22  658  	}
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs  2023-09-19  659  
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs  2023-09-19 @660  	list_for_each_entry(conn, &disp->conns, head) {
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs  2023-09-19  661  		if (conn->index == ctrl->data[0].index) {
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs  2023-09-19  662  			nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs  2023-09-19  663  			return conn;
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs  2023-09-19  664  		}
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs  2023-09-19  665  	}
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs  2023-09-19  666  
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs  2023-09-19  667  	dcbE.type = ctrl->data[0].type;
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs  2023-09-19  668  	index = ctrl->data[0].index;
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs  2023-09-19  669  	nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs  2023-09-19  670  
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs  2023-09-19 @671  	ret = nvkm_conn_new(disp, index, &dcbE, &conn);
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs  2023-09-19  672  	if (ret)
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs  2023-09-19  673  		return ERR_PTR(ret);
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs  2023-09-19  674  
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs  2023-09-19  675  	list_add_tail(&conn->head, &disp->conns);
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs  2023-09-19  676  	return conn;
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs  2023-09-19  677  }
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs  2023-09-19  678  

:::::: The code at line 671 was first introduced by commit
:::::: 9e99444490238d210a421cef3598432c5da2e086 drm/nouveau/disp/r535: initial support

:::::: TO: Ben Skeggs <bskeggs@redhat.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
