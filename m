Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57AA2F7EF3
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Aug 2026 07:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786520576; cv=none; b=X2ICs8eXnJj9qm+C74KxBj4l25xAJllEFAYcTJcy2UsNpMi6tWYx331EXweAEN/oUiFJ0e6CwhV+nNpRV7K69UNXowX1tmPXVCfF/Op5IEns4XPd03VGa7YyBJhMFXPpgY+ku6nW22I5qIO8j4wo3GZK60j2qKLuyHqMS8a4Pj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786520576; c=relaxed/simple;
	bh=mMxx3z+XmIf90B8PacqKBnvdSXJ8WJqXyq0xSkBSoFY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HeXPF/tUwBSiEnqHipUruBEa3irHqqYgqHeMCLV7MPlfIhgYIdPpE4UMbA6w5bEu1kwcRKpybLI9HVgI/HGEdYEsi4bvZedID/m3vgRj1M5n++pouDSuz0EGUMaay2mLPSF6cj6fmGF2hwbPfjk1fjEtnk+dYUEZDmo0VIeahmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AL5MKT4s; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AL5MKT4s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786520574; x=1818056574;
  h=date:from:to:cc:subject:message-id;
  bh=mMxx3z+XmIf90B8PacqKBnvdSXJ8WJqXyq0xSkBSoFY=;
  b=AL5MKT4sQx2397rNgpZJbUBJ3y6jwzEve/JB/z5+Da6w04Vyk06EbroV
   k2LbGJv54m1US1EJ8vuzxZVpk6yv4OeXZ4o7dhBs4jGjTikbgL+j2djMQ
   kwc7NC2vNKXYy2FqSPG0NPNYR0MMFx9rHjJGyT20U/aeBNmPwehO72oYq
   6D7eNCmjPLHBpFOCbBe5dRBTLRHRWLzYwIs11J7OPqYg9uP7Wumz58yPu
   1Hv9CEUt4q0YltWeC0ht39h4wkjBI769fdelDpqbS/W7E9l5h2DZRw/UG
   weJTdzSJi4WHrjZ/R3d9BgbU5WtWQJqgfHon57TMMy9B+Y66CfQE+qIKg
   A==;
X-CSE-ConnectionGUID: PiTSvBpBQ2GQt3CygTM4xg==
X-CSE-MsgGUID: fSsgILe1TmmAiyt1/zIssA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="98211979"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="98211979"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 00:42:54 -0700
X-CSE-ConnectionGUID: zCbP7wOQRRam4nQCu3tofw==
X-CSE-MsgGUID: aqj2rs3bS1eF4ca8j0QGAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="286993408"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Aug 2026 00:42:52 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wu3bu-00000000Q2g-0Ti1;
	Wed, 12 Aug 2026 07:42:50 +0000
Date: Wed, 12 Aug 2026 15:42:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/ethernet/realtek/r8169_main.c:5161:3: warning:
 label followed by a declaration is a C23 extension
Message-ID: <202608121506.0oaMDBfU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/javen/r8169-add-support-for-multi-irqs/20260811-195102, commit: 4d4c6d643fda8df39e065683728abd64379f3ffb"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Javen Xu <javen_xu@realsil.com.cn>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/javen/r8169-add-support-for-multi-irqs/20260811-195102
head:   d59b0fc7e3bbccbc0418e405b1a7ecf0665b986a
commit: 4d4c6d643fda8df39e065683728abd64379f3ffb r8169: add support and enable rss
date:   20 hours ago
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: arm64-randconfig-004-20260812 (https://download.01.org/0day-ci/archive/20260812/202608121506.0oaMDBfU-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 12df34b8469b8095359de8c249cb1b2753fadeea)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260812/202608121506.0oaMDBfU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608121506.0oaMDBfU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/realtek/r8169_main.c:5161:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
    5161 |                 u32 status = opts1 & (RxProtoMask | RxCSFailMask);
         |                 ^
   1 warning generated.


vim +5161 drivers/net/ethernet/realtek/r8169_main.c

4d4c6d643fda8d drivers/net/ethernet/realtek/r8169_main.c Javen Xu        2026-08-03  5147  
4d4c6d643fda8d drivers/net/ethernet/realtek/r8169_main.c Javen Xu        2026-08-03  5148  static inline void rtl8169_rx_csum(struct rtl8169_private *tp,
4d4c6d643fda8d drivers/net/ethernet/realtek/r8169_main.c Javen Xu        2026-08-03  5149  				   struct sk_buff *skb,
31f019951f5da8 drivers/net/ethernet/realtek/r8169_main.c Javen Xu        2026-08-03  5150  				   u32 opts1)
^1da177e4c3f41 drivers/net/r8169.c                       Linus Torvalds  2005-04-16  5151  {
4d4c6d643fda8d drivers/net/ethernet/realtek/r8169_main.c Javen Xu        2026-08-03  5152  	bool csum_ok = false;
4d4c6d643fda8d drivers/net/ethernet/realtek/r8169_main.c Javen Xu        2026-08-03  5153  
4d4c6d643fda8d drivers/net/ethernet/realtek/r8169_main.c Javen Xu        2026-08-03  5154  	switch (tp->init_rx_desc_type) {
4d4c6d643fda8d drivers/net/ethernet/realtek/r8169_main.c Javen Xu        2026-08-03  5155  	case RX_DESC_TYPE_RSS:
4d4c6d643fda8d drivers/net/ethernet/realtek/r8169_main.c Javen Xu        2026-08-03  5156  		if (((opts1 & RX_TCPT_DESC_RSS) && !(opts1 & RX_TCPF_DESC_RSS)) ||
4d4c6d643fda8d drivers/net/ethernet/realtek/r8169_main.c Javen Xu        2026-08-03  5157  		    ((opts1 & RX_UDPT_DESC_RSS) && !(opts1 & RX_UDPF_DESC_RSS)))
4d4c6d643fda8d drivers/net/ethernet/realtek/r8169_main.c Javen Xu        2026-08-03  5158  			csum_ok = true;
4d4c6d643fda8d drivers/net/ethernet/realtek/r8169_main.c Javen Xu        2026-08-03  5159  		break;
4d4c6d643fda8d drivers/net/ethernet/realtek/r8169_main.c Javen Xu        2026-08-03  5160  	default:
206a75e003e17a drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit 2021-01-12 @5161  		u32 status = opts1 & (RxProtoMask | RxCSFailMask);
^1da177e4c3f41 drivers/net/r8169.c                       Linus Torvalds  2005-04-16  5162  
206a75e003e17a drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit 2021-01-12  5163  		if (status == RxProtoTCP || status == RxProtoUDP)
4d4c6d643fda8d drivers/net/ethernet/realtek/r8169_main.c Javen Xu        2026-08-03  5164  			csum_ok = true;
4d4c6d643fda8d drivers/net/ethernet/realtek/r8169_main.c Javen Xu        2026-08-03  5165  		break;
4d4c6d643fda8d drivers/net/ethernet/realtek/r8169_main.c Javen Xu        2026-08-03  5166  	}
4d4c6d643fda8d drivers/net/ethernet/realtek/r8169_main.c Javen Xu        2026-08-03  5167  
4d4c6d643fda8d drivers/net/ethernet/realtek/r8169_main.c Javen Xu        2026-08-03  5168  	if (csum_ok)
^1da177e4c3f41 drivers/net/r8169.c                       Linus Torvalds  2005-04-16  5169  		skb->ip_summed = CHECKSUM_UNNECESSARY;
^1da177e4c3f41 drivers/net/r8169.c                       Linus Torvalds  2005-04-16  5170  	else
bc8acf2c8c3e43 drivers/net/r8169.c                       Eric Dumazet    2010-09-02  5171  		skb_checksum_none_assert(skb);
^1da177e4c3f41 drivers/net/r8169.c                       Linus Torvalds  2005-04-16  5172  }
^1da177e4c3f41 drivers/net/r8169.c                       Linus Torvalds  2005-04-16  5173  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
