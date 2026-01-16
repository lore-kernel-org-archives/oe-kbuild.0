Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB7736BCC6
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Jan 2026 17:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768584139; cv=none; b=sL7ONFfGAlhvQJs/gPonC6hRueTTLJFxdJHzCDzrZ/myK7ySCabIKRG9UOfmGLxY2Yf5hyenlT3TQt+j9u75mvQ1LqjXzAW/VxMQ+TYbClDgzWq5OnOnsWGzCX8Qzxa8dYvY7A3uovcM0HD7jHJHodb+Zr+PEE/UA4DRcK6defc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768584139; c=relaxed/simple;
	bh=9yDbI4Pt8U+b4JFcOI0QqYKwBRkKWleEedMGKMCpI0s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=phNT6gVg7b7NCYGnt1vt0BGGy4qHrFyl4hvH0cvt302B0Co8qbziB+5lvqy3SIj1zUqSZsRUL4eI/ZtpWWkkzqr2pYES2hBcIo4lyeIqgwafuOuSWoTzdGPJw+Dm9kRsITtoDhvhthCUP4oNXB/fXslNSBxVLYH7wDOMaS0+8WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pt8LMjRN; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pt8LMjRN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768584135; x=1800120135;
  h=date:from:to:cc:subject:message-id;
  bh=9yDbI4Pt8U+b4JFcOI0QqYKwBRkKWleEedMGKMCpI0s=;
  b=Pt8LMjRNlrdRHLju2DW32JukPUTNQoU5SrbL1goubabjO9R5Y6fyNFVE
   3Wq73wmnuPr5dzWdnUuKzA64TdS2fLkfKf2p0fkA59SfgcoOXvx/+qlVW
   mh4DYWxHWG3QQPhmSDP/8pj1dyN6vqh5XeufHEPhM2+V9ijMhmtop3c6/
   vFVoxJvdIHJQ/uke1E+C2R32bnBMSxJqnkDXl0H+CfGs7qE753+h0I704
   5DqL4nMkL1YUAdbwov4F4eeKMTkgvqrz7HhWFyMdspudIJYB+Gj2HFEjg
   NwE4aI5RmzlGs8ZOOfRkXF6o0LnSTpCXzeQ1wyAAFzD7ve0m6RWTycWNb
   w==;
X-CSE-ConnectionGUID: Ie1173RoQNGUiHEZ/bDTyw==
X-CSE-MsgGUID: VBxeHR0nT1+nSU4fJUvrcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="92565548"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="92565548"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 09:22:14 -0800
X-CSE-ConnectionGUID: Rfeff1wfRUaT9Bzxjqiv5w==
X-CSE-MsgGUID: ocWCUmVNQoqnzFD8Ni2ZbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="236562162"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Jan 2026 09:22:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgnWU-00000000L5M-0mAt;
	Fri, 16 Jan 2026 17:22:10 +0000
Date: Sat, 17 Jan 2026 01:22:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: 
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c:671:42-46: ERROR:
 invalid reference to the index variable of the iterator on line 660
Message-ID: <202601170133.B5TREFOw-lkp@intel.com>
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

Hi Ben,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   983d014aafb14ee5e4915465bf8948e8f3a723b5
commit: c472d828348cafa7874816f4ad2a2314d0000419 drm/nouveau/gsp: move subdev/engine impls to subdev/gsp/rm/r535/
date:   8 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-101-20260112 (https://download.01.org/0day-ci/archive/20260117/202601170133.B5TREFOw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202601170133.B5TREFOw-lkp@intel.com/

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
