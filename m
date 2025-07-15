Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E551BCA07
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Jul 2025 01:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752544616; cv=none; b=Dv5RH5AZmpqoqt6AJc19l2V9fJiLRAF+GhUjs95AQCOKy1Ceq1/Tw4xwrch7bYvT47zGYFUG+IOtXskq35X04hBLjEPwiHMbOeC0qwF2ZP1uM1nSV0pBG7jNs0Mv5NnqBSveGEvUcIWkUIyHRpQ/5bZz0sLzdrH+enAJRQNmemM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752544616; c=relaxed/simple;
	bh=nRRx4bYffR4wcceyiH6FMjVWabGzpxBiEQAujOBUc7U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OZeAp+4OR4v/LttXr7/2tzt4ertL+ZSgefnJw0YO93mxw/Wq+s8RFqcwbkgcrmjrpC8xIjIAxU2hvZbs6/77PnBjTKhMia8Jl0wn25F6xQPKcO2mASyEAOQStKyA2LvJYX9+J0bgNoZ3msnsBBRY/EGgmGkNFpJVYBUAf1ei1bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EHKJgPL6; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EHKJgPL6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752544613; x=1784080613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nRRx4bYffR4wcceyiH6FMjVWabGzpxBiEQAujOBUc7U=;
  b=EHKJgPL6lFhkx+uo+Fu8irSlFQQbcXSLjfyMiGyB5mB1jcXOkFkQIkGP
   +EoIQNYf0pxrMiZ2iCU7dKWjvljjcq4uhUBLAlwXYbTNBAmwll2JT3nN1
   codTO6SEX9uBkq+uUT6UZ2eqqRSqcdQOWq8v6pAPSaVJEBftPCWai71P7
   y8nsl1gtP0o2Zaiwcbo8hQl8PBeAHCQHPevFmvZPVeqyQRcbk4SNvHBa7
   AZj8mYYYBHwanDnpgEpX0PaNf7mgS+8s1UCIP0p3LlA1fG60UAWLFIAUq
   FeCFsZXd4sYEOFGgO/lUV2gSREr1hZ8wzd5hP3aeeaRqCkzFfFxTxK1Ko
   Q==;
X-CSE-ConnectionGUID: 4aj0SIxxRdWmjJzdx0Volg==
X-CSE-MsgGUID: rN3vQ9R6Q7eGTVqjpGLr1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="53863922"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="53863922"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 18:56:52 -0700
X-CSE-ConnectionGUID: /vd2scAkTNayKKSkabVO7w==
X-CSE-MsgGUID: ZAk7bYsYSqm/IVWVEwMxIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="161633791"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Jul 2025 18:56:51 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubUuW-0009XN-1c;
	Tue, 15 Jul 2025 01:56:48 +0000
Date: Tue, 15 Jul 2025 09:55:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [robh:imx93-ethos-v2 9/40] drivers/accel/ethos/ethos_gem.c:317
 ethos_gem_cmdstream_copy_and_validate() warn: statement has no effect 'u64'
Message-ID: <202507150932.jgCTCIwX-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git imx93-ethos-v2
head:   f2fd4883d04c3245bc2fdd061078823b49709c68
commit: 1c7d7ea09db140254890b25e0c8af3bcda7a1e31 [9/40] drm: ethos: rework validate to copy from user while validating
:::::: branch date: 5 days ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-r073-20250714 (https://download.01.org/0day-ci/archive/20250715/202507150932.jgCTCIwX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507150932.jgCTCIwX-lkp@intel.com/

New smatch warnings:
drivers/accel/ethos/ethos_gem.c:317 ethos_gem_cmdstream_copy_and_validate() warn: statement has no effect 'u64'

Old smatch warnings:
drivers/accel/ethos/ethos_gem.c:216 feat_matrix_length() warn: statement has no effect 'u32'
drivers/accel/ethos/ethos_gem.c:603 ethos_gem_cmdstream_create() warn: argument 3 to %llx specifier is cast from pointer

vim +/u64 +317 drivers/accel/ethos/ethos_gem.c

93463a14b8df63 Rob Herring (Arm  2025-06-24  278) 
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  279) static int
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  280) ethos_gem_cmdstream_copy_and_validate(struct drm_device *ddev,
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  281) 				      u32 __user *ucmds,
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  282) 				      struct ethos_gem_object *bo, u32 size)
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  283) {
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  284) 	struct ethos_validated_cmdstream_info *info;
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  285) 	u32 *bocmds = bo->base.vaddr;
b4e21041a4d0a5 Rob Herring (Arm  2025-06-24  286) 	struct cmd_state st = {};
b4e21041a4d0a5 Rob Herring (Arm  2025-06-24  287) 	int i;
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  288) 
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  289) 	info = kzalloc(sizeof(*info), GFP_KERNEL);
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  290) 	if (!info)
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  291) 		return -ENOMEM;
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  292) 	info->cmd_size = size;
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  293) 
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  294) 	for (i = 0; i < size/4; i++) {
93463a14b8df63 Rob Herring (Arm  2025-06-24  295) 		bool use_ifm, use_ifm2, use_scale;
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  296) 		u32 cmds[2];
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  297) 		u64 addr;
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  298) 
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  299) 		if (get_user(cmds[0], ucmds++))
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  300) 			goto fault;
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  301) 
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  302) 		bocmds[i] = cmds[0];
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  303) 
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  304) 		u16 cmd = cmds[0];
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  305) 		u16 param = cmds[0] >> 16;
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  306) 
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  307) 		if (cmd & 0x4000) {
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  308) 			if (get_user(cmds[1], ucmds++))
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  309) 				goto fault;
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  310) 			i++;
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  311) 			bocmds[i] = cmds[1];
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  312) 			addr = cmd_to_addr(cmds);
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  313) 		}
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  314) 
b4e21041a4d0a5 Rob Herring (Arm  2025-06-24  315) 		switch(cmd) {
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  316) 		case 0x10: // NPU_OP_DMA_START
b4e21041a4d0a5 Rob Herring (Arm  2025-06-24 @317) 			u64 srclen = dma_length(info, st.dma.mode, st.dma.size0, st.dma.size1, &st.dma.src);
b4e21041a4d0a5 Rob Herring (Arm  2025-06-24  318) 			u64 dstlen = dma_length(info, st.dma.mode, st.dma.size0, st.dma.size1, &st.dma.dst);
b4e21041a4d0a5 Rob Herring (Arm  2025-06-24  319) 			if (st.dma.dst.region >= 0)
b4e21041a4d0a5 Rob Herring (Arm  2025-06-24  320) 				info->output_region[st.dma.dst.region] = true;
ce8d803c4f5d72 Rob Herring (Arm  2025-06-25  321) 			dev_info(ddev->dev, "cmd: DMA SRC:%d:0x%llx+0x%llx DST:%d:0x%llx+0x%llx\n",
b4e21041a4d0a5 Rob Herring (Arm  2025-06-24  322) 				 st.dma.src.region, st.dma.src.offset, srclen,
b4e21041a4d0a5 Rob Herring (Arm  2025-06-24  323) 				 st.dma.dst.region, st.dma.dst.offset, dstlen);
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  324) 			break;
93463a14b8df63 Rob Herring (Arm  2025-06-24  325) 		case 0x2: // NPU_OP_CONV
93463a14b8df63 Rob Herring (Arm  2025-06-24  326) 		case 0x3: // NPU_OP_DEPTHWISE
93463a14b8df63 Rob Herring (Arm  2025-06-24  327) 			use_ifm2 = param & 0x1;  // weights_ifm2
93463a14b8df63 Rob Herring (Arm  2025-06-24  328) 			use_scale = !(st.ofm.precision & 0x100);
93463a14b8df63 Rob Herring (Arm  2025-06-24  329) 			calc_sizes(ddev, info, cmd, &st, true, use_ifm2, !use_ifm2, use_scale);
93463a14b8df63 Rob Herring (Arm  2025-06-24  330) 			break;
93463a14b8df63 Rob Herring (Arm  2025-06-24  331) 		case 0x5: // NPU_OP_POOL
93463a14b8df63 Rob Herring (Arm  2025-06-24  332) 			use_ifm = param != 0x4;  // pooling mode
93463a14b8df63 Rob Herring (Arm  2025-06-24  333) 			use_scale = !(st.ofm.precision & 0x100);
93463a14b8df63 Rob Herring (Arm  2025-06-24  334) 			calc_sizes(ddev, info, cmd, &st, use_ifm, false, false, use_scale);
93463a14b8df63 Rob Herring (Arm  2025-06-24  335) 			break;
93463a14b8df63 Rob Herring (Arm  2025-06-24  336) 		case 0x6: // NPU_OP_ELEMENTWISE
93463a14b8df63 Rob Herring (Arm  2025-06-24  337) 			use_ifm2 = !((st.ifm2.broadcast == 8) || (param == 5) || (param == 6) || (param == 7) || (param == 0x24));
93463a14b8df63 Rob Herring (Arm  2025-06-24  338) 			use_ifm = st.ifm.broadcast != 8;
93463a14b8df63 Rob Herring (Arm  2025-06-24  339) 			calc_sizes(ddev, info, cmd, &st, use_ifm, use_ifm2, false, false);
93463a14b8df63 Rob Herring (Arm  2025-06-24  340) 			break;
93463a14b8df63 Rob Herring (Arm  2025-06-24  341) 		case 0x7: // NPU_OP_RESIZE (U85)
93463a14b8df63 Rob Herring (Arm  2025-06-24  342) 			WARN_ON(1); // TODO
93463a14b8df63 Rob Herring (Arm  2025-06-24  343) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  344) 		case 0x120: // NPU_SET_KERNEL_WIDTH_M1
7226bed0a964f4 Rob Herring (Arm  2025-06-24  345) 			st.ifm.width = param;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  346) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  347) 		case 0x121: // NPU_SET_KERNEL_HEIGHT_M1
7226bed0a964f4 Rob Herring (Arm  2025-06-24  348) 			st.ifm.height[2] = param;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  349) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  350) 		case 0x100: // NPU_SET_IFM_PAD_TOP
7226bed0a964f4 Rob Herring (Arm  2025-06-24  351) 			st.ifm.pad_top = param & 0x7f;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  352) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  353) 		case 0x101: // NPU_SET_IFM_PAD_LEFT
7226bed0a964f4 Rob Herring (Arm  2025-06-24  354) 			st.ifm.pad_left = param & 0x7f;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  355) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  356) 		case 0x102: // NPU_SET_IFM_PAD_RIGHT
7226bed0a964f4 Rob Herring (Arm  2025-06-24  357) 			st.ifm.pad_right = param & 0xff;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  358) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  359) 		case 0x103: // NPU_SET_IFM_PAD_BOTTOM
7226bed0a964f4 Rob Herring (Arm  2025-06-24  360) 			st.ifm.pad_bottom = param & 0xff;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  361) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  362) 		case 0x104: // NPU_SET_IFM_DEPTH_M1
7226bed0a964f4 Rob Herring (Arm  2025-06-24  363) 			st.ifm.depth = param;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  364) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  365) 		case 0x105: // NPU_SET_IFM_PRECISION
7226bed0a964f4 Rob Herring (Arm  2025-06-24  366) 			st.ifm.precision = param;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  367) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  368) 		case 0x108: // NPU_SET_IFM_BROADCAST
7226bed0a964f4 Rob Herring (Arm  2025-06-24  369) 			st.ifm.broadcast = param;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  370) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  371) 		case 0x10f: // NPU_SET_IFM_REGION
7226bed0a964f4 Rob Herring (Arm  2025-06-24  372) 			st.ifm.region = param & 0x7f;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  373) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  374) 		case 0x10a: // NPU_SET_IFM_WIDTH0_M1
7226bed0a964f4 Rob Herring (Arm  2025-06-24  375) 			st.ifm.width0 = param;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  376) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  377) 		case 0x10b: // NPU_SET_IFM_HEIGHT0_M1
7226bed0a964f4 Rob Herring (Arm  2025-06-24  378) 			st.ifm.height[0] = param;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  379) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  380) 		case 0x10c: // NPU_SET_IFM_HEIGHT1_M1
7226bed0a964f4 Rob Herring (Arm  2025-06-24  381) 			st.ifm.height[1] = param;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  382) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  383) 		case 0x4000: // NPU_SET_IFM_BASE0
7226bed0a964f4 Rob Herring (Arm  2025-06-24  384) 		case 0x4001: // NPU_SET_IFM_BASE1
7226bed0a964f4 Rob Herring (Arm  2025-06-24  385) 		case 0x4002: // NPU_SET_IFM_BASE2
7226bed0a964f4 Rob Herring (Arm  2025-06-24  386) 		case 0x4003: // NPU_SET_IFM_BASE3
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  387) 			st.ifm.base[cmd & 0x3] = addr;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  388) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  389) 		case 0x4004: // NPU_SET_IFM_STRIDE_X
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  390) 			st.ifm.stride_x = addr;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  391) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  392) 		case 0x4005: // NPU_SET_IFM_STRIDE_Y
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  393) 			st.ifm.stride_y = addr;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  394) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  395) 		case 0x4006: // NPU_SET_IFM_STRIDE_C
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  396) 			st.ifm.stride_c = addr;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  397) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  398) 
7226bed0a964f4 Rob Herring (Arm  2025-06-24  399) 		case 0x111: // NPU_SET_OFM_WIDTH_M1
7226bed0a964f4 Rob Herring (Arm  2025-06-24  400) 			st.ofm.width = param;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  401) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  402) 		case 0x112: // NPU_SET_OFM_HEIGHT_M1
7226bed0a964f4 Rob Herring (Arm  2025-06-24  403) 			st.ofm.height[2] = param;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  404) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  405) 		case 0x113: // NPU_SET_OFM_DEPTH_M1
7226bed0a964f4 Rob Herring (Arm  2025-06-24  406) 			st.ofm.depth = param;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  407) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  408) 		case 0x114: // NPU_SET_OFM_PRECISION
7226bed0a964f4 Rob Herring (Arm  2025-06-24  409) 			st.ofm.precision = param;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  410) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  411) 		case 0x11f: // NPU_SET_OFM_REGION
7226bed0a964f4 Rob Herring (Arm  2025-06-24  412) 			st.ofm.region = param & 0x7;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  413) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  414) 		case 0x11a: // NPU_SET_OFM_WIDTH0_M1
7226bed0a964f4 Rob Herring (Arm  2025-06-24  415) 			st.ofm.width0 = param;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  416) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  417) 		case 0x11b: // NPU_SET_OFM_HEIGHT0_M1
7226bed0a964f4 Rob Herring (Arm  2025-06-24  418) 			st.ofm.height[0] = param;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  419) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  420) 		case 0x11c: // NPU_SET_OFM_HEIGHT1_M1
7226bed0a964f4 Rob Herring (Arm  2025-06-24  421) 			st.ofm.height[1] = param;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  422) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  423) 		case 0x4010: // NPU_SET_OFM_BASE0
7226bed0a964f4 Rob Herring (Arm  2025-06-24  424) 		case 0x4011: // NPU_SET_OFM_BASE1
7226bed0a964f4 Rob Herring (Arm  2025-06-24  425) 		case 0x4012: // NPU_SET_OFM_BASE2
7226bed0a964f4 Rob Herring (Arm  2025-06-24  426) 		case 0x4013: // NPU_SET_OFM_BASE3
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  427) 			st.ofm.base[cmd & 0x3] = addr;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  428) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  429) 		case 0x4014: // NPU_SET_OFM_STRIDE_X
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  430) 			st.ofm.stride_x = addr;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  431) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  432) 		case 0x4015: // NPU_SET_OFM_STRIDE_Y
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  433) 			st.ofm.stride_y = addr;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  434) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  435) 		case 0x4016: // NPU_SET_OFM_STRIDE_C
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  436) 			st.ofm.stride_c = addr;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  437) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  438) 
7226bed0a964f4 Rob Herring (Arm  2025-06-24  439) 		case 0x180: // NPU_SET_IFM2_BROADCAST
7226bed0a964f4 Rob Herring (Arm  2025-06-24  440) 			st.ifm2.broadcast = param;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  441) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  442) 		case 0x185: // NPU_SET_IFM2_PRECISION
7226bed0a964f4 Rob Herring (Arm  2025-06-24  443) 			st.ifm2.precision = param;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  444) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  445) 		case 0x18f: // NPU_SET_IFM2_REGION
7226bed0a964f4 Rob Herring (Arm  2025-06-24  446) 			st.ifm2.region = param & 0x7;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  447) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  448) 		case 0x18a: // NPU_SET_IFM2_WIDTH0_M1
7226bed0a964f4 Rob Herring (Arm  2025-06-24  449) 			st.ifm2.width0 = param;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  450) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  451) 		case 0x18b: // NPU_SET_IFM2_HEIGHT0_M1
7226bed0a964f4 Rob Herring (Arm  2025-06-24  452) 			st.ifm2.height[0] = param;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  453) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  454) 		case 0x18c: // NPU_SET_IFM2_HEIGHT1_M1
7226bed0a964f4 Rob Herring (Arm  2025-06-24  455) 			st.ifm2.height[1] = param;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  456) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  457) 		case 0x4080: // NPU_SET_IFM2_BASE0
7226bed0a964f4 Rob Herring (Arm  2025-06-24  458) 		case 0x4081: // NPU_SET_IFM2_BASE1
7226bed0a964f4 Rob Herring (Arm  2025-06-24  459) 		case 0x4082: // NPU_SET_IFM2_BASE2
7226bed0a964f4 Rob Herring (Arm  2025-06-24  460) 		case 0x4083: // NPU_SET_IFM2_BASE3
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  461) 			st.ifm2.base[cmd & 0x3] = addr;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  462) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  463) 		case 0x4084: // NPU_SET_IFM_STRIDE_X
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  464) 			st.ifm2.stride_x = addr;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  465) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  466) 		case 0x4085: // NPU_SET_IFM_STRIDE_Y
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  467) 			st.ifm2.stride_y = addr;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  468) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  469) 		case 0x4086: // NPU_SET_IFM2_STRIDE_C
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  470) 			st.ifm2.stride_c = addr;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  471) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  472) 
7226bed0a964f4 Rob Herring (Arm  2025-06-24  473) 		case 0x128: // NPU_SET_WEIGHT_REGION
7226bed0a964f4 Rob Herring (Arm  2025-06-24  474) 			st.weight[0].region = param & 0x7;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  475) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  476) 		case 0x129: // NPU_SET_SCALE_REGION
7226bed0a964f4 Rob Herring (Arm  2025-06-24  477) 			st.scale[0].region = param & 0x7;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  478) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  479) 		case 0x4020: // NPU_SET_WEIGHT_BASE
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  480) 			st.weight[0].base = addr;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  481) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  482) 		case 0x4021: // NPU_SET_WEIGHT_LENGTH
7226bed0a964f4 Rob Herring (Arm  2025-06-24  483) 			st.weight[0].length = cmds[1];
7226bed0a964f4 Rob Herring (Arm  2025-06-24  484) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  485) 		case 0x4022: // NPU_SET_SCALE_BASE
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  486) 			st.scale[0].base = addr;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  487) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  488) 		case 0x4023: // NPU_SET_SCALE_LENGTH
7226bed0a964f4 Rob Herring (Arm  2025-06-24  489) 			st.scale[0].length = cmds[1];
7226bed0a964f4 Rob Herring (Arm  2025-06-24  490) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  491) 		case 0x4090: // NPU_SET_WEIGHT1_BASE
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  492) 			st.weight[1].base = addr;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  493) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  494) 		case 0x4091: // NPU_SET_WEIGHT1_LENGTH
7226bed0a964f4 Rob Herring (Arm  2025-06-24  495) 			st.weight[1].length = cmds[1];
7226bed0a964f4 Rob Herring (Arm  2025-06-24  496) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  497) 		case 0x4092: // NPU_SET_SCALE1_BASE/NPU_SET_WEIGHT2_BASE
7226bed0a964f4 Rob Herring (Arm  2025-06-24  498) 			if (0 /*U85*/)
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  499) 				st.weight[2].base = addr;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  500) 			else
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  501) 				st.scale[1].base = addr;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  502) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  503) 		case 0x4093: // NPU_SET_SCALE1_LENGTH/NPU_SET_WEIGHT2_LENGTH
7226bed0a964f4 Rob Herring (Arm  2025-06-24  504) 			if (0 /*U85*/)
7226bed0a964f4 Rob Herring (Arm  2025-06-24  505) 				st.weight[1].length = cmds[1];
7226bed0a964f4 Rob Herring (Arm  2025-06-24  506) 			else
7226bed0a964f4 Rob Herring (Arm  2025-06-24  507) 				st.scale[1].length = cmds[1];
7226bed0a964f4 Rob Herring (Arm  2025-06-24  508) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  509) 		case 0x4094: // NPU_SET_WEIGHT3_BASE
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  510) 			st.weight[3].base = addr;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  511) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  512) 		case 0x4095: // NPU_SET_WEIGHT3_LENGTH
7226bed0a964f4 Rob Herring (Arm  2025-06-24  513) 			st.weight[3].length = cmds[1];
7226bed0a964f4 Rob Herring (Arm  2025-06-24  514) 			break;
7226bed0a964f4 Rob Herring (Arm  2025-06-24  515) 
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  516) 		case 0x130: // NPU_SET_DMA0_SRC_REGION
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  517) 			if (param & 0x100)
b4e21041a4d0a5 Rob Herring (Arm  2025-06-24  518) 				st.dma.src.region = -1;
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  519) 			else
b4e21041a4d0a5 Rob Herring (Arm  2025-06-24  520) 				st.dma.src.region = param & 0x7;
b4e21041a4d0a5 Rob Herring (Arm  2025-06-24  521) 			st.dma.mode = (param >> 9) & 0x3;
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  522) 			break;
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  523) 		case 0x131: // NPU_SET_DMA0_DST_REGION
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  524) 			if (param & 0x100)
b4e21041a4d0a5 Rob Herring (Arm  2025-06-24  525) 				st.dma.dst.region = -1;
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  526) 			else
b4e21041a4d0a5 Rob Herring (Arm  2025-06-24  527) 				st.dma.dst.region = param & 0x7;
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  528) 			break;
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  529) 		case 0x132: // NPU_SET_DMA0_SIZE0
b4e21041a4d0a5 Rob Herring (Arm  2025-06-24  530) 			st.dma.size0 = param;
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  531) 			break;
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  532) 		case 0x133: // NPU_SET_DMA0_SIZE1
b4e21041a4d0a5 Rob Herring (Arm  2025-06-24  533) 			st.dma.size1 = param;
b4e21041a4d0a5 Rob Herring (Arm  2025-06-24  534) 			break;
b4e21041a4d0a5 Rob Herring (Arm  2025-06-24  535) 		case 0x4033: // NPU_SET_DMA0_SRC_STRIDE0
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  536) 			st.dma.src.stride[0] = ((s64)addr << 24) >> 24;
b4e21041a4d0a5 Rob Herring (Arm  2025-06-24  537) 			break;
b4e21041a4d0a5 Rob Herring (Arm  2025-06-24  538) 		case 0x4034: // NPU_SET_DMA0_SRC_STRIDE1
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  539) 			st.dma.src.stride[1] = ((s64)addr << 24) >> 24;
b4e21041a4d0a5 Rob Herring (Arm  2025-06-24  540) 			break;
b4e21041a4d0a5 Rob Herring (Arm  2025-06-24  541) 		case 0x4035: // NPU_SET_DMA0_DST_STRIDE0
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  542) 			st.dma.dst.stride[0] = ((s64)addr << 24) >> 24;
b4e21041a4d0a5 Rob Herring (Arm  2025-06-24  543) 			break;
b4e21041a4d0a5 Rob Herring (Arm  2025-06-24  544) 		case 0x4036: // NPU_SET_DMA0_DST_STRIDE1
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  545) 			st.dma.dst.stride[1] = ((s64)addr << 24) >> 24;
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  546) 			break;
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  547) 		case 0x4030: // NPU_SET_DMA0_SRC
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  548) 			st.dma.src.offset = addr;
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  549) 			break;
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  550) 		case 0x4031: // NPU_SET_DMA0_DST
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  551) 			st.dma.dst.offset = addr;
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  552) 			break;
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  553) 		case 0x4032: // NPU_SET_DMA0_LEN
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  554) 			st.dma.src.len = st.dma.dst.len = addr;
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  555) 			break;
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  556) 		default:
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  557) 			break;
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  558) 		}
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  559) 
b4e21041a4d0a5 Rob Herring (Arm  2025-06-24  560) 	}
b4e21041a4d0a5 Rob Herring (Arm  2025-06-24  561) 
b4e21041a4d0a5 Rob Herring (Arm  2025-06-24  562) 	for (i = 0; i < NPU_BASEP_REGION_MAX; i++) {
b4e21041a4d0a5 Rob Herring (Arm  2025-06-24  563) 		if (!info->region_size[i])
b4e21041a4d0a5 Rob Herring (Arm  2025-06-24  564) 			continue;
ce8d803c4f5d72 Rob Herring (Arm  2025-06-25  565) 		dev_info(ddev->dev, "region %d max size: 0x%llx\n", i, info->region_size[i]);
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  566) 	}
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  567) 
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  568) 	bo->info = info;
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  569) 	return 0;
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  570) 
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  571) fault:
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  572) 	kfree(info);
1c7d7ea09db140 Rob Herring (Arm  2025-06-26  573) 	return -EFAULT;
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  574) }
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  575) 

:::::: The code at line 317 was first introduced by commit
:::::: b4e21041a4d0a52c49e6bfd738499e9113ec725a drm: ethos: Rework cmdstream DMA validation

:::::: TO: Rob Herring (Arm) <robh@kernel.org>
:::::: CC: Rob Herring (Arm) <robh@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
