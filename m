Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCFC78F26
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Mar 2026 21:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774388484; cv=none; b=hgD/WiDEPPJXyBq1ziGSJqm7Iu36VG4yuuAG9DU+Qv8+ibrTK5wNYkXcc8FfCaTD3jB16IJ7g8NvolqUso7HxYRujeHqtJQiJ7HwKMVIX219KQZOELjDS8sbUgqALstCs4Lk7eWg8YNKKnZy8SgR39/JvdOPwd57OsdwQ1z1pyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774388484; c=relaxed/simple;
	bh=ZOWk7opqLTehv4J0GA16KL9bUwjLTjoWt2px5GErADs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G8oeQYDshByR8YV/hVnmUxY6mJikB9uLxyAcMApFysRypn+bg2TXgv+Lji9iFE808CNqtVYIfBoPhCuBsbUlajw1khRHJASRO4GXnVCFt+qZ0XRvkdVbyw8e/Bm/rPqsxeViGnOuN0XGUK+2lFtDrylzoBwjizIpmNoAmasI9bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Te3QAFDT; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Te3QAFDT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774388482; x=1805924482;
  h=date:from:to:cc:subject:message-id;
  bh=ZOWk7opqLTehv4J0GA16KL9bUwjLTjoWt2px5GErADs=;
  b=Te3QAFDTYIuoOrvIfPK2QELUKvxMpAgSHAXi9zZbnsOFZlZUD4t4Kx0/
   7CjDK4wenQ2Z1GYSM7UEzTDuQP8xi4xszF455T78W67UVtlkmpt0KvVm6
   CHXPZIo45/GQofyMLfP0bBX9q7mrQoBgJHkRbzu/O5HNjk0X3jU72kV8Q
   wGYSmaGdFYcfaYnMUy5cjuVJ6rNpqpXZdg+XOJ/LwvCWdkeQc3sA7HaF7
   X/rFy/R4yZ/2PEps3+DzOikvfMpBZFD3hMwk3myXxZuMka42Gf+Cgkjaj
   gz8wPTjCvQfCBHk+wRM4XPpszWWVbPqpI2VaK0yOu0EQDqgFC6VYNVRO8
   w==;
X-CSE-ConnectionGUID: /375qoU4QSGxvAw41JuSSQ==
X-CSE-MsgGUID: S8E9KG8mSzyk9wJKFQDgwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75388621"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75388621"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 14:41:21 -0700
X-CSE-ConnectionGUID: 72o7OeodQ4GElrzMkK90/w==
X-CSE-MsgGUID: +yCGeP9HS8m93diRQ0TZ9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="220063271"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Mar 2026 14:41:20 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w59V0-000000005Sf-0vXP;
	Tue, 24 Mar 2026 21:41:18 +0000
Date: Wed, 25 Mar 2026 05:41:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: 
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c:671:42-46: ERROR:
 invalid reference to the index variable of the iterator on line 660
Message-ID: <202603250509.2EIVHwFm-lkp@intel.com>
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
head:   e3c33bc767b5512dbfec643a02abf58ce608f3b2
commit: c472d828348cafa7874816f4ad2a2314d0000419 drm/nouveau/gsp: move subdev/engine impls to subdev/gsp/rm/r535/
date:   10 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 10 months ago
config: s390-randconfig-r052-20260323 (https://download.01.org/0day-ci/archive/20260325/202603250509.2EIVHwFm-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c911b8492374942bf4cfe35411e90a35d3837f6a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202603250509.2EIVHwFm-lkp@intel.com/

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
