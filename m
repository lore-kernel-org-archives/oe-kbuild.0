Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF2D433038
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Aug 2026 14:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786545164; cv=none; b=EtVgjr+DBd8aibGFqpeRMNjPofhFl9oOB7WQn4DF/geJzDoZttmE0EEA+D+q/khzxm8aBQXfQ1q5im7MLc8g/dTFvf9dSXu8SRjkUN3nyrEZQSvIoOSqkdTkICywECVtQC365TlxN4hKw37lBq/A2ixtEFjmphmYog+EJj067lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786545164; c=relaxed/simple;
	bh=qfifR/agPXK5D48znfDRX9Z9G1s0eDYLV6fGLhfImYc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ro4Z26Jf/8g+wqlKwq565rX+UqA993DZGVC8Z4gywuydNgM/ntGDgj3hAnLfaZjzm36JIv7Z8Kd9wEvLKmXAjiuZ8vDRBvr1k5sIWnvNPLVBO42B++6OoUcp203ozE0uCKvYCN09IGBS4u8dEsMQJk/Nqa7c3U+qW9IPyOlWNMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZL8E/Yom; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZL8E/Yom"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786545162; x=1818081162;
  h=date:from:to:cc:subject:message-id;
  bh=qfifR/agPXK5D48znfDRX9Z9G1s0eDYLV6fGLhfImYc=;
  b=ZL8E/Yom5e2pOUKyc0OZnTbpGQSoCCtWRt0svY+0bxmSZ1Re40lN4zpE
   NBObUVg0YlXUIqdHk0c2HGFeZe06X8pro6CdVfifGddJWB5shVdmsRsDo
   Fo+Ea7H7ojWEwIEchu7g1Eoh2wPNRAlPhT2UTi9+wlxUnbUtitZJ6UG1G
   WyEFdhwaUHyuNfoXx8nKzNW4s3P5Q88GkaZpQSdhuep0d70Vu7IkNyHbO
   KHdoO0Fb4rfk3YrGnje/I9vZW0hzgPgy/Xmy1ohL/jAbHxjLSuA9aYGy4
   S+keCd1GDusrK3Fov0FbhH+DgPV3utkQj9YKpG8xIIEe7gi5Rwk/aifUs
   w==;
X-CSE-ConnectionGUID: hG6dD7E3QjeNOY9z+mxVDA==
X-CSE-MsgGUID: pzjijUO0T5WbligSuiI7zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86958177"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="86958177"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 07:32:42 -0700
X-CSE-ConnectionGUID: 7nL3oXRDSpirH5oOAraEHA==
X-CSE-MsgGUID: /gz6RARwSVuotNzQ/eFs2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="261034292"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Aug 2026 07:32:41 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuA0U-00000000QsF-1XVf;
	Wed, 12 Aug 2026 14:32:38 +0000
Date: Wed, 12 Aug 2026 22:31:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/media/platform/amd/isp4/isp4_subdev.c:35:3-9:
 opportunity for str_enable_disable(enable)
Message-ID: <202608122218.FUNWw6nP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Bin Du <Bin.Du@amd.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Sultan Alsawaf <sultan@kerneltoast.com>
CC: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f5bbbfec59b4e2fb7520a91de3df8a6174325d6a
commit: 4e5e7a7ddb4ab9ac35928d7dc72efc8797639dc3 media: platform: amd: isp4 subdev and firmware loading handling added
date:   3 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-102-20260812 (https://download.01.org/0day-ci/archive/20260812/202608122218.FUNWw6nP-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4e5e7a7ddb4a ("media: platform: amd: isp4 subdev and firmware loading handling added")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202608122218.FUNWw6nP-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/media/platform/amd/isp4/isp4_subdev.c:35:3-9: opportunity for str_enable_disable(enable)

vim +35 drivers/media/platform/amd/isp4/isp4_subdev.c

4e5e7a7ddb4ab9 Bin Du 2026-05-06  29  
4e5e7a7ddb4ab9 Bin Du 2026-05-06  30  static void isp4sd_module_enable(struct isp4_subdev *isp_subdev, bool enable)
4e5e7a7ddb4ab9 Bin Du 2026-05-06  31  {
4e5e7a7ddb4ab9 Bin Du 2026-05-06  32  	if (isp_subdev->enable_gpio) {
4e5e7a7ddb4ab9 Bin Du 2026-05-06  33  		gpiod_set_value(isp_subdev->enable_gpio, enable ? 1 : 0);
4e5e7a7ddb4ab9 Bin Du 2026-05-06  34  		dev_dbg(isp_subdev->dev, "%s isp_subdev module\n",
4e5e7a7ddb4ab9 Bin Du 2026-05-06 @35  			enable ? "enable" : "disable");
4e5e7a7ddb4ab9 Bin Du 2026-05-06  36  	}
4e5e7a7ddb4ab9 Bin Du 2026-05-06  37  }
4e5e7a7ddb4ab9 Bin Du 2026-05-06  38  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
