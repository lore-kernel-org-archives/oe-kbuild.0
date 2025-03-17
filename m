Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC02D1A2567
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Mar 2025 21:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742245404; cv=none; b=HsUmK+kI/s93j4DEp5/BY6bRkS2LuS3ijA9mi9ERCjkwiHAY/LHBJS+kh4faPwrPZV0catRZoV5u/YzAputyrCwpRGuGuAWUlr77Y6FVARuJEaEkgCf/AqnqY7NYvA3fe2Au1G+a5CVCZuEMkiRe+50p6z5NK9VGnLmYygVtHtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742245404; c=relaxed/simple;
	bh=kPaz0Dqbs+KfarG7veJvUFOZxmRFcaPRKun5xCpzHSk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=krBBPPwHPpLrzn1zA4SB6rdHQ/5kVpvhOrdHgaJtSB1TdC75P2ZM9YkNfxoCl5f4jUCWQmEb2YrTzYV7RbcJZGfmPVgi3dTLXGf2WzINB7MGyy+3YsF84HNWYAZZ2+OZDvrzN7XTbV9Q4y8iAOI5ygtbmRHC+BJy7V7a+02s6QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nbSsM9dn; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nbSsM9dn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742245403; x=1773781403;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kPaz0Dqbs+KfarG7veJvUFOZxmRFcaPRKun5xCpzHSk=;
  b=nbSsM9dnPsRYE+JPuUPCrsHP45MRoExQbaMvPRYJXXWjAj8XtX3oyeb3
   N519hn9/cBaLoPlFOnN3yMJCUrqEuZFd2dVkzWMVPWtrNxzT6g2c03Vu6
   2Qn0GrvQAdBDLujSDCudIr8X6KthGEFVV0ge2yO6UjhQJJKkvRcTEA9qY
   rPawsfdbIheApAYAXC/3DgOYPHw17e7OwtK71pYjVnJ0GRS/UrxJbH62f
   U45eGMv6fkcm0Sm/Ma1yKqNV0zFM9OdX+Tbikf8IBFF5aHrTibs0cc8AR
   dXJ9UdEhS1Eksm8ofdwJ/yPXdli1owVUtgOgKKCQGRXg2sYx6MtoONN4P
   A==;
X-CSE-ConnectionGUID: XYVyLhV4TyyLTrGkButu9w==
X-CSE-MsgGUID: eZX48Yv1TPGtgDLTaLqSZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="54031932"
X-IronPort-AV: E=Sophos;i="6.14,255,1736841600"; 
   d="scan'208";a="54031932"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 14:03:22 -0700
X-CSE-ConnectionGUID: erQl3zHSRhyR0VDQ3xKjqg==
X-CSE-MsgGUID: L0LT3LhtQDytXeprFRlLnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,255,1736841600"; 
   d="scan'208";a="123006588"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 17 Mar 2025 14:03:11 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuHc5-000DAR-0G;
	Mon, 17 Mar 2025 21:03:09 +0000
Date: Tue, 18 Mar 2025 05:02:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/nouveau/nouveau_abi16.c:809
 nouveau_abi16_ioctl_new() warn: passing positive error code '(-17),(-12)' to
 'PTR_ERR'
Message-ID: <202503180409.dQ6FoP5O-lkp@intel.com>
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
TO: Ben Skeggs <bskeggs@nvidia.com>
CC: Danilo Krummrich <dakr@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4701f33a10702d5fc577c32434eb62adde0a1ae1
commit: ba6b8479c944c50db7e2a81794885896fa6c48a8 drm/nouveau: handle limited nvif ioctl in abi16
date:   8 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 8 months ago
config: openrisc-randconfig-r071-20250314 (https://download.01.org/0day-ci/archive/20250318/202503180409.dQ6FoP5O-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503180409.dQ6FoP5O-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/nouveau/nouveau_abi16.c:809 nouveau_abi16_ioctl_new() warn: passing positive error code '(-17),(-12)' to 'PTR_ERR'

Old smatch warnings:
drivers/gpu/drm/nouveau/nouveau_abi16.c:820 nouveau_abi16_ioctl_new() warn: passing positive error code '(-17),(-12)' to 'PTR_ERR'

vim +809 drivers/gpu/drm/nouveau/nouveau_abi16.c

ba6b8479c944c5 Ben Skeggs 2024-07-26  786  
ba6b8479c944c5 Ben Skeggs 2024-07-26  787  static int
ba6b8479c944c5 Ben Skeggs 2024-07-26  788  nouveau_abi16_ioctl_new(struct nouveau_abi16 *abi16, struct nvif_ioctl_v0 *ioctl, u32 argc)
ba6b8479c944c5 Ben Skeggs 2024-07-26  789  {
ba6b8479c944c5 Ben Skeggs 2024-07-26  790  	struct nvif_ioctl_new_v0 *args;
ba6b8479c944c5 Ben Skeggs 2024-07-26  791  	struct nouveau_abi16_chan *chan;
ba6b8479c944c5 Ben Skeggs 2024-07-26  792  	struct nouveau_abi16_obj *obj;
ba6b8479c944c5 Ben Skeggs 2024-07-26  793  	int ret;
ba6b8479c944c5 Ben Skeggs 2024-07-26  794  
ba6b8479c944c5 Ben Skeggs 2024-07-26  795  	if (argc < sizeof(*args))
ba6b8479c944c5 Ben Skeggs 2024-07-26  796  		return -EINVAL;
ba6b8479c944c5 Ben Skeggs 2024-07-26  797  	args = (void *)ioctl->data;
ba6b8479c944c5 Ben Skeggs 2024-07-26  798  	argc -= sizeof(*args);
ba6b8479c944c5 Ben Skeggs 2024-07-26  799  
ba6b8479c944c5 Ben Skeggs 2024-07-26  800  	if (args->version != 0)
ba6b8479c944c5 Ben Skeggs 2024-07-26  801  		return -EINVAL;
ba6b8479c944c5 Ben Skeggs 2024-07-26  802  
ba6b8479c944c5 Ben Skeggs 2024-07-26  803  	if (!ioctl->route) {
ba6b8479c944c5 Ben Skeggs 2024-07-26  804  		if (ioctl->object || args->oclass != NV_DEVICE)
ba6b8479c944c5 Ben Skeggs 2024-07-26  805  			return -EINVAL;
ba6b8479c944c5 Ben Skeggs 2024-07-26  806  
ba6b8479c944c5 Ben Skeggs 2024-07-26  807  		obj = nouveau_abi16_obj_new(abi16, DEVICE, args->object);
ba6b8479c944c5 Ben Skeggs 2024-07-26  808  		if (IS_ERR(obj))
ba6b8479c944c5 Ben Skeggs 2024-07-26 @809  			return PTR_ERR(obj);
ba6b8479c944c5 Ben Skeggs 2024-07-26  810  
ba6b8479c944c5 Ben Skeggs 2024-07-26  811  		return 0;
ba6b8479c944c5 Ben Skeggs 2024-07-26  812  	}
ba6b8479c944c5 Ben Skeggs 2024-07-26  813  
ba6b8479c944c5 Ben Skeggs 2024-07-26  814  	chan = nouveau_abi16_chan(abi16, ioctl->token);
ba6b8479c944c5 Ben Skeggs 2024-07-26  815  	if (!chan)
ba6b8479c944c5 Ben Skeggs 2024-07-26  816  		return -EINVAL;
ba6b8479c944c5 Ben Skeggs 2024-07-26  817  
ba6b8479c944c5 Ben Skeggs 2024-07-26  818  	obj = nouveau_abi16_obj_new(abi16, ENGOBJ, args->object);
ba6b8479c944c5 Ben Skeggs 2024-07-26  819  	if (IS_ERR(obj))
ba6b8479c944c5 Ben Skeggs 2024-07-26  820  		return PTR_ERR(obj);
ba6b8479c944c5 Ben Skeggs 2024-07-26  821  
ba6b8479c944c5 Ben Skeggs 2024-07-26  822  	ret = nvif_object_ctor(&chan->chan->user, "abi16EngObj", args->handle, args->oclass,
ba6b8479c944c5 Ben Skeggs 2024-07-26  823  			       NULL, 0, &obj->engobj);
ba6b8479c944c5 Ben Skeggs 2024-07-26  824  	if (ret)
ba6b8479c944c5 Ben Skeggs 2024-07-26  825  		nouveau_abi16_obj_del(obj);
ba6b8479c944c5 Ben Skeggs 2024-07-26  826  
ba6b8479c944c5 Ben Skeggs 2024-07-26  827  	return ret;
ba6b8479c944c5 Ben Skeggs 2024-07-26  828  }
ba6b8479c944c5 Ben Skeggs 2024-07-26  829  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
