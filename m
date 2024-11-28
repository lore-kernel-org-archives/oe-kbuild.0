Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7651487C1
	for <oe-kbuild@lists.linux.dev>; Thu, 28 Nov 2024 19:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732823780; cv=none; b=sX1oouRwnqrnneUEwE2C6nPb5F5P5P7AEbEU6hWKfEaOufStceb5P/nR3LJojQBy+ESWDN9DN5cfqbRwsOAe3dQw2GU9TxKHQpEqKK0d6S6SNU9McQoZIcXAqHfWZfROGazetY/ZMzG0mXGN3+UpGQ2sayw+HhjtQG6t0lkIRBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732823780; c=relaxed/simple;
	bh=fARowPWS4vvnoxTRN5yGYog0fWdrP74d1iFiAk6Ez4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jBuvcG8MnU2EuaBB/TTRlD16y1LNnbaJXgiMJ+xDV6e6x82mWanseHMRXJNOpuBEepX/Ifu3zzLHM6D+LZBuwA0MIX4oynM2fzkKmMvQZ0wBwGCU66hX9kbxdd+uoVRzamvzJdJ5k3XZ4VB8/3irO9kMHCBmCyO5ZhO3Cr569LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fLzIsMCO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fLzIsMCO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732823778; x=1764359778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fARowPWS4vvnoxTRN5yGYog0fWdrP74d1iFiAk6Ez4w=;
  b=fLzIsMCOawHUHN8vHkZvFHgNmDjNu6H1+R7dud8wBoIyxvvX732T6eNs
   Lgyb6kkTLCSkzhkhShanAfAvqUN2plEYcjw8eO51CS6fmU+KpF9KnGNtQ
   mkV2/4qNTzQf8hWdeWEmw0JskIi7jEvGySgDtMYx82j5dCYZx2yoRCV+K
   L6Vkzk8pjNCbFMTyLtOb3g6HyD79sJZaCLVoMPdmZZLjrGmB9OZK3tYk9
   eWczLLmJ2vnoZqumhmletTLtUKE2oVaQw5KtrYec2QthrJSguypUKLw0V
   +JGsktbSB96tdyjJnZO/mnNkRQ+LQXoVpfR7yDQlJvguytTBHVnMcIZNT
   Q==;
X-CSE-ConnectionGUID: WTBMCZOoRMS/9I08UxjqPg==
X-CSE-MsgGUID: LU0H0X80RnuUsmMgtW5hdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="20653929"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="20653929"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 11:56:17 -0800
X-CSE-ConnectionGUID: 29pCLKgKSoCw0xlSzQtuvA==
X-CSE-MsgGUID: EHI0o4GBRdC8kIe4bIC1kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="97289485"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 Nov 2024 11:56:16 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGkcX-0009xj-2S;
	Thu, 28 Nov 2024 19:56:13 +0000
Date: Fri, 29 Nov 2024 03:55:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c:667:42-46: ERROR:
 invalid reference to the index variable of the iterator on line 656
Message-ID: <202411290347.P7OA4EtQ-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Ben Skeggs <bskeggs@redhat.com>
CC: Dave Airlie <airlied@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b86545e02e8c22fb89218f29d381fa8e8b91d815
commit: 9e99444490238d210a421cef3598432c5da2e086 drm/nouveau/disp/r535: initial support
date:   1 year, 1 month ago
:::::: branch date: 21 hours ago
:::::: commit date: 1 year, 1 month ago
config: i386-randconfig-053-20241120 (https://download.01.org/0day-ci/archive/20241129/202411290347.P7OA4EtQ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411290347.P7OA4EtQ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c:667:42-46: ERROR: invalid reference to the index variable of the iterator on line 656

vim +667 drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c

9e99444490238d Ben Skeggs 2023-09-19  635  
9e99444490238d Ben Skeggs 2023-09-19  636  static struct nvkm_conn *
9e99444490238d Ben Skeggs 2023-09-19  637  r535_conn_new(struct nvkm_disp *disp, u32 id)
9e99444490238d Ben Skeggs 2023-09-19  638  {
9e99444490238d Ben Skeggs 2023-09-19  639  	NV0073_CTRL_SPECIFIC_GET_CONNECTOR_DATA_PARAMS *ctrl;
9e99444490238d Ben Skeggs 2023-09-19  640  	struct nvbios_connE dcbE = {};
9e99444490238d Ben Skeggs 2023-09-19  641  	struct nvkm_conn *conn;
9e99444490238d Ben Skeggs 2023-09-19  642  	int ret, index;
9e99444490238d Ben Skeggs 2023-09-19  643  
9e99444490238d Ben Skeggs 2023-09-19  644  	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
9e99444490238d Ben Skeggs 2023-09-19  645  				    NV0073_CTRL_CMD_SPECIFIC_GET_CONNECTOR_DATA, sizeof(*ctrl));
9e99444490238d Ben Skeggs 2023-09-19  646  	if (IS_ERR(ctrl))
9e99444490238d Ben Skeggs 2023-09-19  647  		return (void *)ctrl;
9e99444490238d Ben Skeggs 2023-09-19  648  
9e99444490238d Ben Skeggs 2023-09-19  649  	ctrl->subDeviceInstance = 0;
9e99444490238d Ben Skeggs 2023-09-19  650  	ctrl->displayId = BIT(id);
9e99444490238d Ben Skeggs 2023-09-19  651  
9e99444490238d Ben Skeggs 2023-09-19  652  	ctrl = nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, ctrl, sizeof(*ctrl));
9e99444490238d Ben Skeggs 2023-09-19  653  	if (IS_ERR(ctrl))
9e99444490238d Ben Skeggs 2023-09-19  654  		return (void *)ctrl;
9e99444490238d Ben Skeggs 2023-09-19  655  
9e99444490238d Ben Skeggs 2023-09-19 @656  	list_for_each_entry(conn, &disp->conns, head) {
9e99444490238d Ben Skeggs 2023-09-19  657  		if (conn->index == ctrl->data[0].index) {
9e99444490238d Ben Skeggs 2023-09-19  658  			nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
9e99444490238d Ben Skeggs 2023-09-19  659  			return conn;
9e99444490238d Ben Skeggs 2023-09-19  660  		}
9e99444490238d Ben Skeggs 2023-09-19  661  	}
9e99444490238d Ben Skeggs 2023-09-19  662  
9e99444490238d Ben Skeggs 2023-09-19  663  	dcbE.type = ctrl->data[0].type;
9e99444490238d Ben Skeggs 2023-09-19  664  	index = ctrl->data[0].index;
9e99444490238d Ben Skeggs 2023-09-19  665  	nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
9e99444490238d Ben Skeggs 2023-09-19  666  
9e99444490238d Ben Skeggs 2023-09-19 @667  	ret = nvkm_conn_new(disp, index, &dcbE, &conn);
9e99444490238d Ben Skeggs 2023-09-19  668  	if (ret)
9e99444490238d Ben Skeggs 2023-09-19  669  		return ERR_PTR(ret);
9e99444490238d Ben Skeggs 2023-09-19  670  
9e99444490238d Ben Skeggs 2023-09-19  671  	list_add_tail(&conn->head, &disp->conns);
9e99444490238d Ben Skeggs 2023-09-19  672  	return conn;
9e99444490238d Ben Skeggs 2023-09-19  673  }
9e99444490238d Ben Skeggs 2023-09-19  674  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
