Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4531FECAD
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Mar 2025 18:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742062170; cv=none; b=AuI/y3iKZ8lRrHt5IGa2viO0j1xf7qnvs7KAojbM/My4+UsRU9vgZoYoADuM3aRO4/JdOsI8UnXluc6zf1pqccOLSbKmySTy+j/rDgQudrGeDP0gWtzA9ixM1jnNgE0scTTxqLtixRzB+Tn8pG/ep+6nxDFxXB78qtLv6WRBq1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742062170; c=relaxed/simple;
	bh=q3e++d2hgFAW+04qsnEs6++SpgSA1iRPIdEZGHEDkA4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PpH51qQFkT7pK5/9vnyLPZR9LSms9MKn+N55NnODLtEwI7QJQgkHG8rEoWRplYXPb3tbW+pEVei96I9NtqE/gt8IJSB0qh/dg8unlr7xV/EDngej4RQ7f55ORJBgRW0bfwSu+6OvP50eNoojnXP22HcLWkJGSHrxjXEHKOHIgXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TVzD8iq5; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TVzD8iq5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742062168; x=1773598168;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q3e++d2hgFAW+04qsnEs6++SpgSA1iRPIdEZGHEDkA4=;
  b=TVzD8iq58BgMYnLrpJdQuELdg3wIKK56Qy2G4JmVuE1hTUwH9CVtWgwY
   zEaEAxcMBmI+TAHe/e9jtu2aLgIEbHLjsrDFOqt/CeBdByFMEZd8PGjql
   lnjl3SAWNl96OTYtPhzmTsI7/yxlAXQwJR/aO5wCldxVK908rwcVkUb4Q
   gBUmP/Hv0W2s6yuieR2L2YdHdTh/62XNisbv5pG82vTJ/hL3MccXLQUzz
   USQG603AW01TQqk5onjZzgk2PFqtAlgzV07xBh994sIFPy1t9KDFDtl12
   qD6w0OVXGyN8RedDCVJ0675DQsADhNuFN+er2vZUHcbhcX7J1DCnHoouk
   w==;
X-CSE-ConnectionGUID: ip+D/94rQvu/ID1Za9xH/w==
X-CSE-MsgGUID: D760B3K9QjqMvjb5fPdbvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="65659840"
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="65659840"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 11:09:28 -0700
X-CSE-ConnectionGUID: 1RHwk0BtQMeP/KUyVjfcnQ==
X-CSE-MsgGUID: RUgBVHLSRpGQAAQUmaxE3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="152447208"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 15 Mar 2025 11:09:27 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttVwq-000BYh-1s;
	Sat, 15 Mar 2025 18:09:24 +0000
Date: Sun, 16 Mar 2025 02:09:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/nouveau/nouveau_abi16.c:809
 nouveau_abi16_ioctl_new() warn: passing positive error code '(-17),(-12)' to
 'PTR_ERR'
Message-ID: <202503160103.g0I4iil6-lkp@intel.com>
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
head:   3571e8b091f4270d869dda7a6cc43616c6ad6897
commit: ba6b8479c944c50db7e2a81794885896fa6c48a8 drm/nouveau: handle limited nvif ioctl in abi16
date:   8 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 8 months ago
config: openrisc-randconfig-r071-20250314 (https://download.01.org/0day-ci/archive/20250316/202503160103.g0I4iil6-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503160103.g0I4iil6-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/nouveau/nouveau_abi16.c:809 nouveau_abi16_ioctl_new() warn: passing positive error code '(-17),(-12)' to 'PTR_ERR'

Old smatch warnings:
drivers/gpu/drm/nouveau/nouveau_abi16.c:820 nouveau_abi16_ioctl_new() warn: passing positive error code '(-17),(-12)' to 'PTR_ERR'

vim +809 drivers/gpu/drm/nouveau/nouveau_abi16.c

ba6b8479c944c50 Ben Skeggs 2024-07-26  786  
ba6b8479c944c50 Ben Skeggs 2024-07-26  787  static int
ba6b8479c944c50 Ben Skeggs 2024-07-26  788  nouveau_abi16_ioctl_new(struct nouveau_abi16 *abi16, struct nvif_ioctl_v0 *ioctl, u32 argc)
ba6b8479c944c50 Ben Skeggs 2024-07-26  789  {
ba6b8479c944c50 Ben Skeggs 2024-07-26  790  	struct nvif_ioctl_new_v0 *args;
ba6b8479c944c50 Ben Skeggs 2024-07-26  791  	struct nouveau_abi16_chan *chan;
ba6b8479c944c50 Ben Skeggs 2024-07-26  792  	struct nouveau_abi16_obj *obj;
ba6b8479c944c50 Ben Skeggs 2024-07-26  793  	int ret;
ba6b8479c944c50 Ben Skeggs 2024-07-26  794  
ba6b8479c944c50 Ben Skeggs 2024-07-26  795  	if (argc < sizeof(*args))
ba6b8479c944c50 Ben Skeggs 2024-07-26  796  		return -EINVAL;
ba6b8479c944c50 Ben Skeggs 2024-07-26  797  	args = (void *)ioctl->data;
ba6b8479c944c50 Ben Skeggs 2024-07-26  798  	argc -= sizeof(*args);
ba6b8479c944c50 Ben Skeggs 2024-07-26  799  
ba6b8479c944c50 Ben Skeggs 2024-07-26  800  	if (args->version != 0)
ba6b8479c944c50 Ben Skeggs 2024-07-26  801  		return -EINVAL;
ba6b8479c944c50 Ben Skeggs 2024-07-26  802  
ba6b8479c944c50 Ben Skeggs 2024-07-26  803  	if (!ioctl->route) {
ba6b8479c944c50 Ben Skeggs 2024-07-26  804  		if (ioctl->object || args->oclass != NV_DEVICE)
ba6b8479c944c50 Ben Skeggs 2024-07-26  805  			return -EINVAL;
ba6b8479c944c50 Ben Skeggs 2024-07-26  806  
ba6b8479c944c50 Ben Skeggs 2024-07-26  807  		obj = nouveau_abi16_obj_new(abi16, DEVICE, args->object);
ba6b8479c944c50 Ben Skeggs 2024-07-26  808  		if (IS_ERR(obj))
ba6b8479c944c50 Ben Skeggs 2024-07-26 @809  			return PTR_ERR(obj);
ba6b8479c944c50 Ben Skeggs 2024-07-26  810  
ba6b8479c944c50 Ben Skeggs 2024-07-26  811  		return 0;
ba6b8479c944c50 Ben Skeggs 2024-07-26  812  	}
ba6b8479c944c50 Ben Skeggs 2024-07-26  813  
ba6b8479c944c50 Ben Skeggs 2024-07-26  814  	chan = nouveau_abi16_chan(abi16, ioctl->token);
ba6b8479c944c50 Ben Skeggs 2024-07-26  815  	if (!chan)
ba6b8479c944c50 Ben Skeggs 2024-07-26  816  		return -EINVAL;
ba6b8479c944c50 Ben Skeggs 2024-07-26  817  
ba6b8479c944c50 Ben Skeggs 2024-07-26  818  	obj = nouveau_abi16_obj_new(abi16, ENGOBJ, args->object);
ba6b8479c944c50 Ben Skeggs 2024-07-26  819  	if (IS_ERR(obj))
ba6b8479c944c50 Ben Skeggs 2024-07-26  820  		return PTR_ERR(obj);
ba6b8479c944c50 Ben Skeggs 2024-07-26  821  
ba6b8479c944c50 Ben Skeggs 2024-07-26  822  	ret = nvif_object_ctor(&chan->chan->user, "abi16EngObj", args->handle, args->oclass,
ba6b8479c944c50 Ben Skeggs 2024-07-26  823  			       NULL, 0, &obj->engobj);
ba6b8479c944c50 Ben Skeggs 2024-07-26  824  	if (ret)
ba6b8479c944c50 Ben Skeggs 2024-07-26  825  		nouveau_abi16_obj_del(obj);
ba6b8479c944c50 Ben Skeggs 2024-07-26  826  
ba6b8479c944c50 Ben Skeggs 2024-07-26  827  	return ret;
ba6b8479c944c50 Ben Skeggs 2024-07-26  828  }
ba6b8479c944c50 Ben Skeggs 2024-07-26  829  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
