Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BE82571C0
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Feb 2025 00:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740444461; cv=none; b=XRdKEXGAKU8YehXeB+2VcdJn+ZCpD0bxH9DF1L5ZmMal9ipaloBXni6qfgm/HqC0dtk197lF+EIBOcYWyc/SqJjDzGCZWxOk1Xj3ZAtqBg04ykFKdBq0GzjTkmuIu9uIiZ1fqpuYTFo32fD554T/xutJgC2jRnj9zr7kOaMc0f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740444461; c=relaxed/simple;
	bh=vVfUdUfkZMpaTskaaIWU6i/SKqEW4TJB75+0RNh2nGc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XYPBO2QBAA1WsirNHu2bAXqIKuemcPJ8/MCwL4AdHSLu+e9d3c51bo4pRq2YhRyBJNk0ybBUmkPKB9RM2lHQ1WWEN4eDQCsvU51soWR1M9oVsHips8XxcrTfDJlK83X6YQFuRHTa7APMtNF3PllRiieeBc3zZawHuGi4uSCdCfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZONK05Xr; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZONK05Xr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740444460; x=1771980460;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vVfUdUfkZMpaTskaaIWU6i/SKqEW4TJB75+0RNh2nGc=;
  b=ZONK05XrIsqXYXZqb2yjVU3TurX3mMVdakb49EsaPfbdAy8e8C2f2BCV
   V+IuJxWjsU81vGYReZBWsKVPcNIKVpwRos7fED/+yEKb1H9fEc5ldAE8I
   KGBJtCI0Dum4hJJqLgPnORb9XJBFhmzXSBj/jHgVcVGn3u/HvB3Ho6rRE
   66oRNHtBOikQx4Ag8itsxX4FXOPbn85L9G9Xic53Ld32vy2zNtWP3rcBJ
   FgtNo6PFlb5Qe1uUik9kEx07RkCQVirTPqAvTLXHHSSpAstPNh/+Iz9CT
   H6Cwbtf2mjVDpPCEYUbGAkXUw12xFrjXdXgsScPfhuhKC+XrxdFja5SYN
   A==;
X-CSE-ConnectionGUID: ACvOVBmXQqex7Lqk3npp7Q==
X-CSE-MsgGUID: o4y8Ksx2Sly3wSatJVFhLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="66599934"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="66599934"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 16:47:39 -0800
X-CSE-ConnectionGUID: kDJmI+8BS3qRSFMrx8fS7w==
X-CSE-MsgGUID: InNJNVqsQGGJ5OK5hREPiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="147064944"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 24 Feb 2025 16:47:38 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmj6l-0009WF-0e;
	Tue, 25 Feb 2025 00:47:35 +0000
Date: Tue, 25 Feb 2025 08:47:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/media/platform/nuvoton/npcm-video.c:1677:3-9: ERROR: missing
 put_device; call of_find_device_by_node on line 1667, but without a
 corresponding object release within this function.
Message-ID: <202502250846.5pJIcZWY-lkp@intel.com>
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
TO: Zhen Lei <thunder.leizhen@huawei.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d082ecbc71e9e0bf49883ee4afd435a77a5101b6
commit: c4b7779abc6633677e6edb79e2809f4f61fde157 media: nuvoton: Fix an error check in npcm_video_ece_init()
date:   7 weeks ago
:::::: branch date: 28 hours ago
:::::: commit date: 7 weeks ago
config: mips-randconfig-r052-20250224 (https://download.01.org/0day-ci/archive/20250225/202502250846.5pJIcZWY-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202502250846.5pJIcZWY-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/media/platform/nuvoton/npcm-video.c:1677:3-9: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
   drivers/media/platform/nuvoton/npcm-video.c:1684:3-9: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
   drivers/media/platform/nuvoton/npcm-video.c:1690:3-9: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
   drivers/media/platform/nuvoton/npcm-video.c:1694:1-7: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.

vim +1677 drivers/media/platform/nuvoton/npcm-video.c

46c15a4ff1f4fe Marvin Lin    2023-09-22  1648  
46c15a4ff1f4fe Marvin Lin    2023-09-22  1649  static int npcm_video_ece_init(struct npcm_video *video)
46c15a4ff1f4fe Marvin Lin    2023-09-22  1650  {
46c15a4ff1f4fe Marvin Lin    2023-09-22  1651  	struct device *dev = video->dev;
46c15a4ff1f4fe Marvin Lin    2023-09-22  1652  	struct device_node *ece_node;
46c15a4ff1f4fe Marvin Lin    2023-09-22  1653  	struct platform_device *ece_pdev;
46c15a4ff1f4fe Marvin Lin    2023-09-22  1654  	void __iomem *regs;
46c15a4ff1f4fe Marvin Lin    2023-09-22  1655  
46c15a4ff1f4fe Marvin Lin    2023-09-22  1656  	ece_node = of_parse_phandle(video->dev->of_node, "nuvoton,ece", 0);
5f9fcbf92da901 Dan Carpenter 2023-09-27  1657  	if (!ece_node) {
46c15a4ff1f4fe Marvin Lin    2023-09-22  1658  		dev_err(dev, "Failed to get ECE phandle in DTS\n");
5f9fcbf92da901 Dan Carpenter 2023-09-27  1659  		return -ENODEV;
46c15a4ff1f4fe Marvin Lin    2023-09-22  1660  	}
46c15a4ff1f4fe Marvin Lin    2023-09-22  1661  
46c15a4ff1f4fe Marvin Lin    2023-09-22  1662  	video->ece.enable = of_device_is_available(ece_node);
46c15a4ff1f4fe Marvin Lin    2023-09-22  1663  
46c15a4ff1f4fe Marvin Lin    2023-09-22  1664  	if (video->ece.enable) {
46c15a4ff1f4fe Marvin Lin    2023-09-22  1665  		dev_info(dev, "Support HEXTILE pixel format\n");
46c15a4ff1f4fe Marvin Lin    2023-09-22  1666  
46c15a4ff1f4fe Marvin Lin    2023-09-22 @1667  		ece_pdev = of_find_device_by_node(ece_node);
c4b7779abc6633 Zhen Lei      2024-10-15  1668  		if (!ece_pdev) {
46c15a4ff1f4fe Marvin Lin    2023-09-22  1669  			dev_err(dev, "Failed to find ECE device\n");
c4b7779abc6633 Zhen Lei      2024-10-15  1670  			return -ENODEV;
46c15a4ff1f4fe Marvin Lin    2023-09-22  1671  		}
46c15a4ff1f4fe Marvin Lin    2023-09-22  1672  		of_node_put(ece_node);
46c15a4ff1f4fe Marvin Lin    2023-09-22  1673  
46c15a4ff1f4fe Marvin Lin    2023-09-22  1674  		regs = devm_platform_ioremap_resource(ece_pdev, 0);
46c15a4ff1f4fe Marvin Lin    2023-09-22  1675  		if (IS_ERR(regs)) {
46c15a4ff1f4fe Marvin Lin    2023-09-22  1676  			dev_err(dev, "Failed to parse ECE reg in DTS\n");
46c15a4ff1f4fe Marvin Lin    2023-09-22 @1677  			return PTR_ERR(regs);
46c15a4ff1f4fe Marvin Lin    2023-09-22  1678  		}
46c15a4ff1f4fe Marvin Lin    2023-09-22  1679  
46c15a4ff1f4fe Marvin Lin    2023-09-22  1680  		video->ece.regmap = devm_regmap_init_mmio(dev, regs,
46c15a4ff1f4fe Marvin Lin    2023-09-22  1681  							  &npcm_video_ece_regmap_cfg);
46c15a4ff1f4fe Marvin Lin    2023-09-22  1682  		if (IS_ERR(video->ece.regmap)) {
46c15a4ff1f4fe Marvin Lin    2023-09-22  1683  			dev_err(dev, "Failed to initialize ECE regmap\n");
46c15a4ff1f4fe Marvin Lin    2023-09-22  1684  			return PTR_ERR(video->ece.regmap);
46c15a4ff1f4fe Marvin Lin    2023-09-22  1685  		}
46c15a4ff1f4fe Marvin Lin    2023-09-22  1686  
46c15a4ff1f4fe Marvin Lin    2023-09-22  1687  		video->ece.reset = devm_reset_control_get(&ece_pdev->dev, NULL);
46c15a4ff1f4fe Marvin Lin    2023-09-22  1688  		if (IS_ERR(video->ece.reset)) {
46c15a4ff1f4fe Marvin Lin    2023-09-22  1689  			dev_err(dev, "Failed to get ECE reset control in DTS\n");
46c15a4ff1f4fe Marvin Lin    2023-09-22  1690  			return PTR_ERR(video->ece.reset);
46c15a4ff1f4fe Marvin Lin    2023-09-22  1691  		}
46c15a4ff1f4fe Marvin Lin    2023-09-22  1692  	}
46c15a4ff1f4fe Marvin Lin    2023-09-22  1693  
46c15a4ff1f4fe Marvin Lin    2023-09-22  1694  	return 0;
46c15a4ff1f4fe Marvin Lin    2023-09-22  1695  }
46c15a4ff1f4fe Marvin Lin    2023-09-22  1696  

:::::: The code at line 1677 was first introduced by commit
:::::: 46c15a4ff1f4fe078c5b250fb2570020211eab38 media: nuvoton: Add driver for NPCM video capture and encoding engine

:::::: TO: Marvin Lin <milkfafa@gmail.com>
:::::: CC: Hans Verkuil <hverkuil-cisco@xs4all.nl>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
