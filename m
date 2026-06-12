Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5882F6931
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Jun 2026 04:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781238752; cv=none; b=YkyELxVZY/TG/3aG/gvWVtuIRCm12Wad57X9JATxxlcTSWxULohAP+8oIQQz91GKc26tCEw/yfo1HVU7HwEX8W1tsYZegrQrQqw5Ef26mHhzyfnnNtFDmSqXUYnsCzkDDD5AvNk3tBzGheJlITamFJoESt18r4RB5wjjZPjVL4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781238752; c=relaxed/simple;
	bh=aEF5Np8ZYgZq6KtGfXv946n/zT04mnIPetfrwGa1YgE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Uhq+RMYpPvpB9MTXbkWXKMyWzNm1APjEIAY+SFr1zy0zdh25hNym4l+b+n99oUNefi6X8hkwCELAvZ4jFDpPgixc2TgSm4SMevmX09QCXM9WTZQP2kzlFMt3BfU5crXCzyxixxcrffR4epJTPS1i4NSjycltTKGwWPzfflhIgC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AWMnw09V; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AWMnw09V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781238751; x=1812774751;
  h=date:from:to:cc:subject:message-id;
  bh=aEF5Np8ZYgZq6KtGfXv946n/zT04mnIPetfrwGa1YgE=;
  b=AWMnw09V0iaOgZiEUvauTrM751ZjqqjMMsil26O6lzBjZF1MUqMLHMis
   zh9kkTBob5/cq8QFax4xKV2zv/zWnoyFAD4eYYBQ+xTaC92D66/KcIOFG
   yi54bYakTOT6NazBjfb0m4mvofK81RPXYH3LCErJKtvwdQSkZPnuh3bA4
   PMMiA0qizrHLT+49CDcUu+mJI7waooo/w3WuGTYM11Twq01FZuvd3jfLJ
   Qbi4szbx+W8+oYMK39zmh70Qg0HtTzxthrlBMtMKVdB0Vj4onOacra04u
   iYjxdpkvaT+aduoHzLH+bbJMmcNOyDKYe3U8avMEAYj5bNz4DRaYnhjKC
   A==;
X-CSE-ConnectionGUID: hXkllKnFQaKBgMpp81wP8A==
X-CSE-MsgGUID: T+F2jqRhTWqidaf2+9nwuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82072613"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="82072613"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 21:32:30 -0700
X-CSE-ConnectionGUID: sfR0/Zo0S/C4Bx7pznyB5Q==
X-CSE-MsgGUID: 6GRs6QHnQdyx/HhkuZseUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="245614406"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Jun 2026 21:32:29 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXtZC-00000000OJl-2V0s;
	Fri, 12 Jun 2026 04:32:26 +0000
Date: Fri, 12 Jun 2026 12:31:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c:48
 r535_gsp_rpc_rm_ctrl_push() warn: passing zero to 'PTR_ERR'
Message-ID: <202606121221.InKamYNM-lkp@intel.com>
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
head:   2b414a95b8f7307d42173ba9e580d6d3e2bcbfce
commit: 063d193f12b8c5c07cfe2e10972b2a687786284d drm/nouveau/gsp: split rm ctrl handling out on its own
date:   1 year, 1 month ago
:::::: branch date: 11 hours ago
:::::: commit date: 1 year, 1 month ago
config: i386-randconfig-141-20260611 (https://download.01.org/0day-ci/archive/20260612/202606121221.InKamYNM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 063d193f12b8 ("drm/nouveau/gsp: split rm ctrl handling out on its own")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606121221.InKamYNM-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c:48 r535_gsp_rpc_rm_ctrl_push() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +48 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c

063d193f12b8c5 Ben Skeggs 2024-11-14  37  
063d193f12b8c5 Ben Skeggs 2024-11-14  38  static int
063d193f12b8c5 Ben Skeggs 2024-11-14  39  r535_gsp_rpc_rm_ctrl_push(struct nvkm_gsp_object *object, void **params, u32 repc)
063d193f12b8c5 Ben Skeggs 2024-11-14  40  {
063d193f12b8c5 Ben Skeggs 2024-11-14  41  	rpc_gsp_rm_control_v03_00 *rpc = to_payload_hdr((*params), rpc);
063d193f12b8c5 Ben Skeggs 2024-11-14  42  	struct nvkm_gsp *gsp = object->client->gsp;
063d193f12b8c5 Ben Skeggs 2024-11-14  43  	int ret = 0;
063d193f12b8c5 Ben Skeggs 2024-11-14  44  
063d193f12b8c5 Ben Skeggs 2024-11-14  45  	rpc = nvkm_gsp_rpc_push(gsp, rpc, NVKM_GSP_RPC_REPLY_RECV, repc);
063d193f12b8c5 Ben Skeggs 2024-11-14  46  	if (IS_ERR_OR_NULL(rpc)) {
063d193f12b8c5 Ben Skeggs 2024-11-14  47  		*params = NULL;
063d193f12b8c5 Ben Skeggs 2024-11-14 @48  		return PTR_ERR(rpc);
063d193f12b8c5 Ben Skeggs 2024-11-14  49  	}
063d193f12b8c5 Ben Skeggs 2024-11-14  50  
063d193f12b8c5 Ben Skeggs 2024-11-14  51  	if (rpc->status) {
063d193f12b8c5 Ben Skeggs 2024-11-14  52  		ret = r535_rpc_status_to_errno(rpc->status);
063d193f12b8c5 Ben Skeggs 2024-11-14  53  		if (ret != -EAGAIN && ret != -EBUSY)
063d193f12b8c5 Ben Skeggs 2024-11-14  54  			nvkm_error(&gsp->subdev, "cli:0x%08x obj:0x%08x ctrl cmd:0x%08x failed: 0x%08x\n",
063d193f12b8c5 Ben Skeggs 2024-11-14  55  				   object->client->object.handle, object->handle, rpc->cmd, rpc->status);
063d193f12b8c5 Ben Skeggs 2024-11-14  56  	}
063d193f12b8c5 Ben Skeggs 2024-11-14  57  
063d193f12b8c5 Ben Skeggs 2024-11-14  58  	if (repc)
063d193f12b8c5 Ben Skeggs 2024-11-14  59  		*params = rpc->params;
063d193f12b8c5 Ben Skeggs 2024-11-14  60  	else
063d193f12b8c5 Ben Skeggs 2024-11-14  61  		nvkm_gsp_rpc_done(gsp, rpc);
063d193f12b8c5 Ben Skeggs 2024-11-14  62  
063d193f12b8c5 Ben Skeggs 2024-11-14  63  	return ret;
063d193f12b8c5 Ben Skeggs 2024-11-14  64  }
063d193f12b8c5 Ben Skeggs 2024-11-14  65  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
