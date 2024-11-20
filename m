Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83B4174EDB
	for <oe-kbuild@lists.linux.dev>; Wed, 20 Nov 2024 15:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732115768; cv=none; b=fIG2SVEVQcaC3D+KEPciYnHfiheA65Gs3+KJpN0CJZiDXKqqZWnH1XVt9i3ueKglisM0G3YliwD1E3ltGOCU7Mlv+WxutkmyMkk10Md+g8DBhdQXiEKLsW8o9Bjf1qF3K6CfjKyJc6gHMfZ+VkAULnlfHYRFcbqiUeQqwfe7Ykc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732115768; c=relaxed/simple;
	bh=X0b2H+7T78Ds78jfeqX35nIM4Hnb8S50+B3d/JMqVeU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bs/EBDKJyn856I0Q/7fhTP0ndGUxQ24IAjT4D4Z60SxAMqFHH5Jv7b6ainWutvzUno/vqmr2D/v1ng4gDS+gQOqQ0ncJ0uvewtYuP3zInK5Cid/AL67hBF9+bre8RrV/YRsqgtQTVki+PcUnYtbaJSLY+22A98YzNTFecxLBqwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EiaZ2qUz; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EiaZ2qUz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732115764; x=1763651764;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X0b2H+7T78Ds78jfeqX35nIM4Hnb8S50+B3d/JMqVeU=;
  b=EiaZ2qUzLcLzOm4MQ+HpAKiairA12OSi02Hu+IqOnVVyF/2w1jlendZm
   oFHj1p6+FjFuJdkPe3x3heMXTdbGDVC0o04wespEsv6hG54Py48w46v2W
   IR6IDkDzk9aANTicUZP/uzOBwXqWb0eKMvDhLNQogtm/5283+l+yCUHmd
   /UxvO+VQDmSY5XBfuMW5WPRtnOq2gZSZ/lKSqOI8lQYcGGC3+xai3aI+e
   oBKQB2eA33r5NVNgubxVLq8jfiNzEFu6wstP41FEefHu4RZdg+Y2hAzWd
   fz1afyreELVuQ5MAxhEoBmFUx9iea8uNtpcYiqHiT3cqt/4dIiLw296qp
   w==;
X-CSE-ConnectionGUID: ASDqCV6oTSmXP30Z6eCXIQ==
X-CSE-MsgGUID: VAruuk1mQ4mjszTWqTsaoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="32240845"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="32240845"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 07:16:04 -0800
X-CSE-ConnectionGUID: VhNfO29DQRiZTRHrlgH1sA==
X-CSE-MsgGUID: r6v1TE+bQhS9FfUxS+KZRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="113221341"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Nov 2024 07:16:03 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDmQy-0000x5-2j;
	Wed, 20 Nov 2024 15:16:00 +0000
Date: Wed, 20 Nov 2024 23:15:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c:667:42-46: ERROR:
 invalid reference to the index variable of the iterator on line 656
Message-ID: <202411210115.mdWYbcQJ-lkp@intel.com>
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
head:   bf9aa14fc523d2763fc9a10672a709224e8fcaf4
commit: 9e99444490238d210a421cef3598432c5da2e086 drm/nouveau/disp/r535: initial support
date:   1 year, 1 month ago
:::::: branch date: 17 hours ago
:::::: commit date: 1 year, 1 month ago
config: i386-randconfig-053-20241120 (https://download.01.org/0day-ci/archive/20241121/202411210115.mdWYbcQJ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411210115.mdWYbcQJ-lkp@intel.com/

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
