Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D091721D3E8
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Oct 2025 03:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761796759; cv=none; b=VJ4fmKmpo1MMd8ed0N9jzO/rT4hyFXtiZAYdsRYOot7QZgAyDgjYLso/GZtGg7VRN5Dlww6H3dlPUmTG/15hCrsbkhIbXR7Zj51xF2D/Cwl6Mk16ss3XeWciR4AlpblTz6U+8QXlRdvZM4p0Fe2InCVXcBZk+z2mA6IhSi+4G+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761796759; c=relaxed/simple;
	bh=g6aUilnSAEh6zm/ZAPz59xlFmXz1J43dHvBHG6jNNHY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VAUM44y4oXALSAFmzztBNyM8WhPR/Q1/LbZukZh8BtGAxkf50B8rb1QvbZXc3eQhLnhatMDiqfHiXZ4Q7lWYPPkgSpDg87euAuTz2Kz7Zpn8uyD4YrsouUHHYy1rLYqNeqvZz1eReRXcMJayl3qpXfgZj2+qrOghal7zrXwz5bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kJnt5dFL; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kJnt5dFL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761796757; x=1793332757;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g6aUilnSAEh6zm/ZAPz59xlFmXz1J43dHvBHG6jNNHY=;
  b=kJnt5dFL0LBL0mjaMfTqz1W/wRtvOjSI26uXqtsW0pnwz0coR3/gYWzo
   +T3DQOlbILu/7HWZxchSBzU7NL2+J+I7kOv1RPYlVWz6+q+CgXNPhVu6x
   vVc4a1SEpNKGZORwq9qi7seFK8RkPGJeXK5NrZMyibyKTylefFpqwkFAx
   ftHamDGMS74zq+f6lW9ZkFFkLkj7mfgd1rhIBaHuPr1iF1vtJnLJ1zWmE
   1VhCnysfK1PFaHab8WrMC5RO4ddEh3OuW8gE+7Zu/TSGUMfXHSF2HJ++f
   V91YGdnnzqnlT0hyuXS4opt8Werl7cJS3MIKMESs7dGJ/UDIPa0gym77v
   A==;
X-CSE-ConnectionGUID: mnfSpJjXTUqLvubu7RP/Ew==
X-CSE-MsgGUID: ZM29WWP8RvmeFFbzUsQJVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="89397470"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="89397470"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 20:59:17 -0700
X-CSE-ConnectionGUID: YAvnI3Z6S12og6RAVRb+pw==
X-CSE-MsgGUID: iw5v+AbPRx28VOqb5QCnpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="189914650"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 29 Oct 2025 20:59:15 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEJof-000LR8-0v;
	Thu, 30 Oct 2025 03:59:13 +0000
Date: Thu, 30 Oct 2025 11:54:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/soc/imx/soc-imx8m.c:310:64-71: WARNING: Consider using %pe
 to print PTR_ERR()
Message-ID: <202510301153.uMYLvXU2-lkp@intel.com>
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
TO: Marek Vasut <marex@denx.de>
CC: Shawn Guo <shawnguo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6
commit: 9cc832d37799dbea950c4c8a34721b02b8b5a8ff soc: imx8m: Probe the SoC driver as platform driver
date:   1 year ago
:::::: branch date: 27 hours ago
:::::: commit date: 1 year ago
config: loongarch-randconfig-r062-20251030 (https://download.01.org/0day-ci/archive/20251030/202510301153.uMYLvXU2-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202510301153.uMYLvXU2-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/soc/imx/soc-imx8m.c:310:64-71: WARNING: Consider using %pe to print PTR_ERR()

vim +310 drivers/soc/imx/soc-imx8m.c

9cc832d37799db Marek Vasut 2024-09-29  292  
9cc832d37799db Marek Vasut 2024-09-29  293  static int __init imx8_soc_init(void)
9cc832d37799db Marek Vasut 2024-09-29  294  {
9cc832d37799db Marek Vasut 2024-09-29  295  	struct platform_device *pdev;
9cc832d37799db Marek Vasut 2024-09-29  296  	int ret;
9cc832d37799db Marek Vasut 2024-09-29  297  
9cc832d37799db Marek Vasut 2024-09-29  298  	/* No match means this is non-i.MX8M hardware, do nothing. */
9cc832d37799db Marek Vasut 2024-09-29  299  	if (!of_match_node(imx8_soc_match, of_root))
9cc832d37799db Marek Vasut 2024-09-29  300  		return 0;
9cc832d37799db Marek Vasut 2024-09-29  301  
9cc832d37799db Marek Vasut 2024-09-29  302  	ret = platform_driver_register(&imx8m_soc_driver);
9cc832d37799db Marek Vasut 2024-09-29  303  	if (ret) {
9cc832d37799db Marek Vasut 2024-09-29  304  		pr_err("Failed to register imx8m-soc platform driver: %d\n", ret);
9cc832d37799db Marek Vasut 2024-09-29  305  		return ret;
9cc832d37799db Marek Vasut 2024-09-29  306  	}
9cc832d37799db Marek Vasut 2024-09-29  307  
9cc832d37799db Marek Vasut 2024-09-29  308  	pdev = platform_device_register_simple("imx8m-soc", -1, NULL, 0);
9cc832d37799db Marek Vasut 2024-09-29  309  	if (IS_ERR(pdev)) {
9cc832d37799db Marek Vasut 2024-09-29 @310  		pr_err("Failed to register imx8m-soc platform device: %ld\n", PTR_ERR(pdev));

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
