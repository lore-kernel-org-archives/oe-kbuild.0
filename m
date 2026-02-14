Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9C933993
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Feb 2026 14:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771079195; cv=none; b=t5wl6iTl/Dvp+Q3Zrt6s08IT5uHw1VYjQtXi7jGt2CEb6anUzFanGZxNyK1bcSzEDr6iElGCyrC2XlQIFVm2C9vcuLzsxKi425Y/10BKd+88sfwE1lfxB32kDBK5U//U1H6uCnuQ/vCaZyVqIt+OPYVJi5Jubkovb6LW1eyhe0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771079195; c=relaxed/simple;
	bh=0tHAXkqNxMvPQ0XX48rtJL1GX5/9ndGa0I1vQjr2Qns=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RHeNFpPJhEzh0ZzAXU7BN7kohv6+QDn6Ps/E4nQm2hZiE3IP3XMIuZ/ifLgnXgGGM669vNAI5CY6ySxbHX11T8FSaiVkIH0E88pBP/2yIz9hTlf1AwCUNafvJg/dmvbOlEpYXkSVNKQq0WtE/YlHZ5qlXplFAvYJtAsMHwP14hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ljF+zAb1; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ljF+zAb1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771079193; x=1802615193;
  h=date:from:to:cc:subject:message-id;
  bh=0tHAXkqNxMvPQ0XX48rtJL1GX5/9ndGa0I1vQjr2Qns=;
  b=ljF+zAb1Tg7glQE6iJpqbyHDwn3piOUUA4fGq6S3uvisVO7TPgjINhNv
   LE6m9wWxMoeHjT20WB1iY3Ed1OGj6hmOpT2xZocUOxl8SHRqoOA/hO6U9
   MdnfSf2C7NxHxuE4NEPtKXHsrvXO9M14OwcStMr13Y726rjiU2NdU8Fda
   yuBvE2MFgbG6X6Ij026TtiRP8PEiFCApOFPx0BtkYwEnOwlzZOVWxNfw3
   t6RbVCdj/MjAXh5MoO/VBnHpLTzbpSaxMoQ6VeNvyhH/BG17aygr1IDCG
   FGTls5npGxtZ03LUQp6+AF+ZelJqv2FPt5KhxM2nPQA8J3I1Ee1ekmXAb
   Q==;
X-CSE-ConnectionGUID: xYefzvpeT7uztFAdBXON8Q==
X-CSE-MsgGUID: ByO/A2+EQACoxhp4p3MYDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="59809256"
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="59809256"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 06:26:32 -0800
X-CSE-ConnectionGUID: N0qUHcTpRC+ofRHxgstY9Q==
X-CSE-MsgGUID: LmNjWiZMR5ODVacT2ulu3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="218151340"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Feb 2026 06:26:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrGbN-00000000wcU-0zZc;
	Sat, 14 Feb 2026 14:26:29 +0000
Date: Sat, 14 Feb 2026 22:26:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/media/i2c/imx335.c:1036 imx335_enable_streams()
 error: buffer overflow 'link_freq_reglist' 2 <= 32
Message-ID: <202602142202.4ohiTNYK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jai Luthra <jai.luthra@ideasonboard.com>
CC: Hans Verkuil <hverkuil@kernel.org>
CC: Kieran Bingham <kieran.bingham@ideasonboard.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   770aaedb461a055f79b971d538678942b6607894
commit: ca042de64800a0bcc3e0866e4efaa4a657e8ddc9 media: imx335: Switch to {enable,disable}_streams
date:   3 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 3 months ago
config: m68k-randconfig-r073-20260214 (https://download.01.org/0day-ci/archive/20260214/202602142202.4ohiTNYK-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602142202.4ohiTNYK-lkp@intel.com/

smatch warnings:
drivers/media/i2c/imx335.c:1036 imx335_enable_streams() error: buffer overflow 'link_freq_reglist' 2 <= 32

vim +/link_freq_reglist +1036 drivers/media/i2c/imx335.c

cfa49ff0558a32 Umang Jain       2023-12-11  1013  
45d19b5fb9aeab Martina Krasteva 2021-05-27  1014  /**
ca042de64800a0 Jai Luthra       2025-10-30  1015   * imx335_enable_streams() - Enable sensor streams
ca042de64800a0 Jai Luthra       2025-10-30  1016   * @sd: V4L2 subdevice
ca042de64800a0 Jai Luthra       2025-10-30  1017   * @state: V4L2 subdevice state
ca042de64800a0 Jai Luthra       2025-10-30  1018   * @pad: The pad to enable
ca042de64800a0 Jai Luthra       2025-10-30  1019   * @streams_mask: Bitmask of streams to enable
45d19b5fb9aeab Martina Krasteva 2021-05-27  1020   *
45d19b5fb9aeab Martina Krasteva 2021-05-27  1021   * Return: 0 if successful, error code otherwise.
45d19b5fb9aeab Martina Krasteva 2021-05-27  1022   */
ca042de64800a0 Jai Luthra       2025-10-30  1023  static int imx335_enable_streams(struct v4l2_subdev *sd,
ca042de64800a0 Jai Luthra       2025-10-30  1024  				 struct v4l2_subdev_state *state, u32 pad,
ca042de64800a0 Jai Luthra       2025-10-30  1025  				 u64 streams_mask)
45d19b5fb9aeab Martina Krasteva 2021-05-27  1026  {
ca042de64800a0 Jai Luthra       2025-10-30  1027  	struct imx335 *imx335 = to_imx335(sd);
45d19b5fb9aeab Martina Krasteva 2021-05-27  1028  	const struct imx335_reg_list *reg_list;
45d19b5fb9aeab Martina Krasteva 2021-05-27  1029  	int ret;
45d19b5fb9aeab Martina Krasteva 2021-05-27  1030  
34af620e67550d Jai Luthra       2025-10-30  1031  	ret = pm_runtime_resume_and_get(imx335->dev);
34af620e67550d Jai Luthra       2025-10-30  1032  	if (ret < 0)
34af620e67550d Jai Luthra       2025-10-30  1033  		return ret;
34af620e67550d Jai Luthra       2025-10-30  1034  
a95253d83297f8 Umang Jain       2024-02-20  1035  	/* Setup PLL */
a95253d83297f8 Umang Jain       2024-02-20 @1036  	reg_list = &link_freq_reglist[__ffs(imx335->link_freq_bitmap)];
8f0926dba79918 Umang Jain       2024-04-14  1037  	ret = cci_multi_reg_write(imx335->cci, reg_list->regs,
8f0926dba79918 Umang Jain       2024-04-14  1038  				  reg_list->num_of_regs, NULL);
a95253d83297f8 Umang Jain       2024-02-20  1039  	if (ret) {
a95253d83297f8 Umang Jain       2024-02-20  1040  		dev_err(imx335->dev, "%s failed to set plls\n", __func__);
34af620e67550d Jai Luthra       2025-10-30  1041  		goto err_rpm_put;
a95253d83297f8 Umang Jain       2024-02-20  1042  	}
a95253d83297f8 Umang Jain       2024-02-20  1043  
45d19b5fb9aeab Martina Krasteva 2021-05-27  1044  	/* Write sensor mode registers */
45d19b5fb9aeab Martina Krasteva 2021-05-27  1045  	reg_list = &imx335->cur_mode->reg_list;
8f0926dba79918 Umang Jain       2024-04-14  1046  	ret = cci_multi_reg_write(imx335->cci, reg_list->regs,
8f0926dba79918 Umang Jain       2024-04-14  1047  				  reg_list->num_of_regs, NULL);
45d19b5fb9aeab Martina Krasteva 2021-05-27  1048  	if (ret) {
d5ca45b8b91ea4 Kieran Bingham   2023-12-11  1049  		dev_err(imx335->dev, "fail to write initial registers\n");
34af620e67550d Jai Luthra       2025-10-30  1050  		goto err_rpm_put;
45d19b5fb9aeab Martina Krasteva 2021-05-27  1051  	}
45d19b5fb9aeab Martina Krasteva 2021-05-27  1052  
8a2451bd20e6f8 Jai Luthra       2025-10-30  1053  	/* Write sensor common registers */
8a2451bd20e6f8 Jai Luthra       2025-10-30  1054  	ret = cci_multi_reg_write(imx335->cci, imx335_common_regs,
8a2451bd20e6f8 Jai Luthra       2025-10-30  1055  				  ARRAY_SIZE(imx335_common_regs), NULL);
8a2451bd20e6f8 Jai Luthra       2025-10-30  1056  	if (ret) {
8a2451bd20e6f8 Jai Luthra       2025-10-30  1057  		dev_err(imx335->dev, "fail to write initial registers\n");
8a2451bd20e6f8 Jai Luthra       2025-10-30  1058  		goto err_rpm_put;
8a2451bd20e6f8 Jai Luthra       2025-10-30  1059  	}
8a2451bd20e6f8 Jai Luthra       2025-10-30  1060  
cfa49ff0558a32 Umang Jain       2023-12-11  1061  	ret = imx335_set_framefmt(imx335);
cfa49ff0558a32 Umang Jain       2023-12-11  1062  	if (ret) {
cfa49ff0558a32 Umang Jain       2023-12-11  1063  		dev_err(imx335->dev, "%s failed to set frame format: %d\n",
cfa49ff0558a32 Umang Jain       2023-12-11  1064  			__func__, ret);
34af620e67550d Jai Luthra       2025-10-30  1065  		goto err_rpm_put;
cfa49ff0558a32 Umang Jain       2023-12-11  1066  	}
cfa49ff0558a32 Umang Jain       2023-12-11  1067  
8249d084ac9b95 Kieran Bingham   2024-04-14  1068  	/* Configure lanes */
8f0926dba79918 Umang Jain       2024-04-14  1069  	ret = cci_write(imx335->cci, IMX335_REG_LANEMODE,
8f0926dba79918 Umang Jain       2024-04-14  1070  			imx335->lane_mode, NULL);
8249d084ac9b95 Kieran Bingham   2024-04-14  1071  	if (ret)
34af620e67550d Jai Luthra       2025-10-30  1072  		goto err_rpm_put;
8249d084ac9b95 Kieran Bingham   2024-04-14  1073  
45d19b5fb9aeab Martina Krasteva 2021-05-27  1074  	/* Setup handler will write actual exposure and gain */
45d19b5fb9aeab Martina Krasteva 2021-05-27  1075  	ret =  __v4l2_ctrl_handler_setup(imx335->sd.ctrl_handler);
45d19b5fb9aeab Martina Krasteva 2021-05-27  1076  	if (ret) {
d5ca45b8b91ea4 Kieran Bingham   2023-12-11  1077  		dev_err(imx335->dev, "fail to setup handler\n");
34af620e67550d Jai Luthra       2025-10-30  1078  		goto err_rpm_put;
45d19b5fb9aeab Martina Krasteva 2021-05-27  1079  	}
45d19b5fb9aeab Martina Krasteva 2021-05-27  1080  
45d19b5fb9aeab Martina Krasteva 2021-05-27  1081  	/* Start streaming */
8f0926dba79918 Umang Jain       2024-04-14  1082  	ret = cci_write(imx335->cci, IMX335_REG_MODE_SELECT,
8f0926dba79918 Umang Jain       2024-04-14  1083  			IMX335_MODE_STREAMING, NULL);
45d19b5fb9aeab Martina Krasteva 2021-05-27  1084  	if (ret) {
d5ca45b8b91ea4 Kieran Bingham   2023-12-11  1085  		dev_err(imx335->dev, "fail to start streaming\n");
34af620e67550d Jai Luthra       2025-10-30  1086  		goto err_rpm_put;
45d19b5fb9aeab Martina Krasteva 2021-05-27  1087  	}
45d19b5fb9aeab Martina Krasteva 2021-05-27  1088  
45d19b5fb9aeab Martina Krasteva 2021-05-27  1089  	/* Initial regulator stabilization period */
45d19b5fb9aeab Martina Krasteva 2021-05-27  1090  	usleep_range(18000, 20000);
45d19b5fb9aeab Martina Krasteva 2021-05-27  1091  
45d19b5fb9aeab Martina Krasteva 2021-05-27  1092  	return 0;
34af620e67550d Jai Luthra       2025-10-30  1093  
34af620e67550d Jai Luthra       2025-10-30  1094  err_rpm_put:
34af620e67550d Jai Luthra       2025-10-30  1095  	pm_runtime_put(imx335->dev);
34af620e67550d Jai Luthra       2025-10-30  1096  
34af620e67550d Jai Luthra       2025-10-30  1097  	return ret;
45d19b5fb9aeab Martina Krasteva 2021-05-27  1098  }
45d19b5fb9aeab Martina Krasteva 2021-05-27  1099  

:::::: The code at line 1036 was first introduced by commit
:::::: a95253d83297f8c740cad822df4b5288c0c10c04 media: imx335: Support multiple link frequency

:::::: TO: Umang Jain <umang.jain@ideasonboard.com>
:::::: CC: Hans Verkuil <hverkuil-cisco@xs4all.nl>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
