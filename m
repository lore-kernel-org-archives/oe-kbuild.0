Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0B7430CE5
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Aug 2026 11:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786533251; cv=none; b=H2uVA7eyPhEZRjTAc9unyNf6Ai1yH6XLtvamt6QGKPmiIsMvKnzEU6rXFFnVkp4cHrD/2WcQYBXFKWvR//cESAzM+H8EnRD6z97HFh1pixpHZHsu5Ree9/uGWWLFQSlFC224HN7zTsjacbw00qobIdEBnI4PIR1ukEwZbbKMUI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786533251; c=relaxed/simple;
	bh=8D3J+/lFnQny++MaLMRKBEyoqqGwzE+Wygblbq64gyM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e6ScaRVkV/2AjpB2A3z9iJ8Epz+A9gf8ijGCXyVk8vG862J0Cbq1acc3rPHO05Bl2hBNxUTQst13EfyCeXq4ilaX+QB21hjdP/SYQ/G1ook1RGwUPlzNbA8joPU5LZ63m7uaTvICmysbeJvo0tYDbWrGakNlEsgfDHXZBoImK+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S84t3QeW; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S84t3QeW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786533249; x=1818069249;
  h=date:from:to:cc:subject:message-id;
  bh=8D3J+/lFnQny++MaLMRKBEyoqqGwzE+Wygblbq64gyM=;
  b=S84t3QeWKEb+HjLQvCHx3BGb8ctZw31eMig2heXG9FfBZhPRTKdQyX/7
   A9rUM7fTkOFtFoBaJBH2NOBClLisUX12kz95pelXQR4b15VF01AhQn4qG
   UlZhq/Gx6W6BrhrayTgg+S8+TQP5ticD02SVUcqBmuM7kvIuI4kqWM4iK
   iO9haOF0Df7RpCA04ZZdIEZAGJVlQs39pWCqETJK0rN0L/VHgsvF+418l
   AzWz7MfZKcYdSVwVxe9Kc1wfA/xoWo+R5te47mzCmhoXIfq0IMhPaV8q1
   YIy6H5Qvaz4xXdancMlvkkEGDR1SSmPj1ymh27F/uY5tIcjuzdD8M6QBW
   w==;
X-CSE-ConnectionGUID: 4wALLQhXRK6DRFua9eCKiA==
X-CSE-MsgGUID: lsY9nlEZRg6za7l50C4xCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="98597146"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="98597146"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 04:14:09 -0700
X-CSE-ConnectionGUID: MXkKUHiXTK+BC9APE9uvbQ==
X-CSE-MsgGUID: 6BEEdfnoSS+qcJaZodPHCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="262309500"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Aug 2026 04:14:08 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wu6uM-00000000QSS-0PNn;
	Wed, 12 Aug 2026 11:14:06 +0000
Date: Wed, 12 Aug 2026 19:13:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/ethernet/realtek/r8169_main.c:6335:36: warning:
 'memset' call operates on objects of type 'struct rtl8169_rx_ring' while the
 size is based on a different type 'struct rtl8169_rx_ring *'
Message-ID: <202608121953.Sdqn2cck-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/javen/r8169-add-support-for-multi-irqs/20260811-195102, commit: d59b0fc7e3bbccbc0418e405b1a7ecf0665b986a"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Javen Xu <javen_xu@realsil.com.cn>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/javen/r8169-add-support-for-multi-irqs/20260811-195102
head:   d59b0fc7e3bbccbc0418e405b1a7ecf0665b986a
commit: d59b0fc7e3bbccbc0418e405b1a7ecf0665b986a r8169: support setting rx queue numbers via ethtool
date:   23 hours ago
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: arm64-randconfig-004-20260812 (https://download.01.org/0day-ci/archive/20260812/202608121953.Sdqn2cck-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 12df34b8469b8095359de8c249cb1b2753fadeea)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260812/202608121953.Sdqn2cck-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608121953.Sdqn2cck-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/realtek/r8169_main.c:5140:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
    5140 |                 u32 status = opts1 & (RxProtoMask | RxCSFailMask);
         |                 ^
>> drivers/net/ethernet/realtek/r8169_main.c:6335:36: warning: 'memset' call operates on objects of type 'struct rtl8169_rx_ring' while the size is based on a different type 'struct rtl8169_rx_ring *' [-Wsizeof-pointer-memaccess]
    6335 |         memset(tp->rx_ring, 0, sizeof(tp->rx_ring));
         |                ~~~~~~~~~~~            ~~~~^~~~~~~
   drivers/net/ethernet/realtek/r8169_main.c:6335:36: note: did you mean to dereference the argument to 'sizeof' (and multiply it by the number of elements)?
    6335 |         memset(tp->rx_ring, 0, sizeof(tp->rx_ring));
         |                                       ~~~~^~~~~~~
   2 warnings generated.


vim +6335 drivers/net/ethernet/realtek/r8169_main.c

d59b0fc7e3bbccb Javen Xu 2026-08-03  6272  
d59b0fc7e3bbccb Javen Xu 2026-08-03  6273  static int rtl8169_set_channels(struct net_device *dev,
d59b0fc7e3bbccb Javen Xu 2026-08-03  6274  				struct ethtool_channels *ch)
d59b0fc7e3bbccb Javen Xu 2026-08-03  6275  {
d59b0fc7e3bbccb Javen Xu 2026-08-03  6276  	struct rtl8169_private *tp = netdev_priv(dev);
d59b0fc7e3bbccb Javen Xu 2026-08-03  6277  	bool if_running = netif_running(dev);
d59b0fc7e3bbccb Javen Xu 2026-08-03  6278  	enum rx_desc_type old_rx_desc_type;
d59b0fc7e3bbccb Javen Xu 2026-08-03  6279  	enum rx_desc_type new_desc_type;
d59b0fc7e3bbccb Javen Xu 2026-08-03  6280  	struct rtl8169_rx_ring *new_rx;
d59b0fc7e3bbccb Javen Xu 2026-08-03  6281  	int i, ret;
d59b0fc7e3bbccb Javen Xu 2026-08-03  6282  
d59b0fc7e3bbccb Javen Xu 2026-08-03  6283  	if (ch->rx_count == tp->num_rx_rings)
d59b0fc7e3bbccb Javen Xu 2026-08-03  6284  		return 0;
d59b0fc7e3bbccb Javen Xu 2026-08-03  6285  
d59b0fc7e3bbccb Javen Xu 2026-08-03  6286  	old_rx_desc_type = tp->init_rx_desc_type;
d59b0fc7e3bbccb Javen Xu 2026-08-03  6287  
d59b0fc7e3bbccb Javen Xu 2026-08-03  6288  	if (!rtl_hw_support_rss(tp)) {
d59b0fc7e3bbccb Javen Xu 2026-08-03  6289  		netdev_warn(dev, "This chip does not support multiple channels/RSS.\n");
d59b0fc7e3bbccb Javen Xu 2026-08-03  6290  		return -EOPNOTSUPP;
d59b0fc7e3bbccb Javen Xu 2026-08-03  6291  	}
d59b0fc7e3bbccb Javen Xu 2026-08-03  6292  
d59b0fc7e3bbccb Javen Xu 2026-08-03  6293  	if (ch->rx_count > tp->hw_supp_num_rx_queues || !is_power_of_2(ch->rx_count) ||
d59b0fc7e3bbccb Javen Xu 2026-08-03  6294  	    tp->irq_nvecs < get_min_irq_nvecs(tp))
d59b0fc7e3bbccb Javen Xu 2026-08-03  6295  		return -EINVAL;
d59b0fc7e3bbccb Javen Xu 2026-08-03  6296  
d59b0fc7e3bbccb Javen Xu 2026-08-03  6297  	new_desc_type = ch->rx_count > 1 ? RX_DESC_TYPE_RSS : RX_DESC_TYPE_DEFAULT;
d59b0fc7e3bbccb Javen Xu 2026-08-03  6298  
d59b0fc7e3bbccb Javen Xu 2026-08-03  6299  	if (!if_running) {
d59b0fc7e3bbccb Javen Xu 2026-08-03  6300  		ret = netif_set_real_num_rx_queues(dev, ch->rx_count);
d59b0fc7e3bbccb Javen Xu 2026-08-03  6301  		if (ret)
d59b0fc7e3bbccb Javen Xu 2026-08-03  6302  			return ret;
d59b0fc7e3bbccb Javen Xu 2026-08-03  6303  
d59b0fc7e3bbccb Javen Xu 2026-08-03  6304  		tp->num_rx_rings = ch->rx_count;
d59b0fc7e3bbccb Javen Xu 2026-08-03  6305  		tp->init_rx_desc_type = new_desc_type;
d59b0fc7e3bbccb Javen Xu 2026-08-03  6306  
d59b0fc7e3bbccb Javen Xu 2026-08-03  6307  		rtl8169_set_rss_indir_tbl(tp, tp->num_rx_rings);
d59b0fc7e3bbccb Javen Xu 2026-08-03  6308  		rtl_set_irq_mask(tp);
d59b0fc7e3bbccb Javen Xu 2026-08-03  6309  		return 0;
d59b0fc7e3bbccb Javen Xu 2026-08-03  6310  	}
d59b0fc7e3bbccb Javen Xu 2026-08-03  6311  
d59b0fc7e3bbccb Javen Xu 2026-08-03  6312  	new_rx = kzalloc_objs(*new_rx, R8169_MAX_RX_QUEUES);
d59b0fc7e3bbccb Javen Xu 2026-08-03  6313  	if (!new_rx)
d59b0fc7e3bbccb Javen Xu 2026-08-03  6314  		return -ENOMEM;
d59b0fc7e3bbccb Javen Xu 2026-08-03  6315  
d59b0fc7e3bbccb Javen Xu 2026-08-03  6316  	netif_stop_queue(dev);
d59b0fc7e3bbccb Javen Xu 2026-08-03  6317  	rtl8169_down(tp);
d59b0fc7e3bbccb Javen Xu 2026-08-03  6318  
d59b0fc7e3bbccb Javen Xu 2026-08-03  6319  	ret = netif_set_real_num_rx_queues(dev, ch->rx_count);
d59b0fc7e3bbccb Javen Xu 2026-08-03  6320  	if (ret)
d59b0fc7e3bbccb Javen Xu 2026-08-03  6321  		goto err_up;
d59b0fc7e3bbccb Javen Xu 2026-08-03  6322  
d59b0fc7e3bbccb Javen Xu 2026-08-03  6323  	tp->init_rx_desc_type = new_desc_type;
d59b0fc7e3bbccb Javen Xu 2026-08-03  6324  
d59b0fc7e3bbccb Javen Xu 2026-08-03  6325  	ret = rtl8169_realloc_rx(tp, new_rx, ch->rx_count);
d59b0fc7e3bbccb Javen Xu 2026-08-03  6326  	if (ret)
d59b0fc7e3bbccb Javen Xu 2026-08-03  6327  		goto err_reset;
d59b0fc7e3bbccb Javen Xu 2026-08-03  6328  
d59b0fc7e3bbccb Javen Xu 2026-08-03  6329  	for (i = 0; i < tp->num_rx_rings; i++)
d59b0fc7e3bbccb Javen Xu 2026-08-03  6330  		rtl8169_rx_clear(tp, &tp->rx_ring[i], old_rx_desc_type);
d59b0fc7e3bbccb Javen Xu 2026-08-03  6331  	rtl8169_free_rx_desc(tp);
d59b0fc7e3bbccb Javen Xu 2026-08-03  6332  
d59b0fc7e3bbccb Javen Xu 2026-08-03  6333  	tp->num_rx_rings = ch->rx_count;
d59b0fc7e3bbccb Javen Xu 2026-08-03  6334  
d59b0fc7e3bbccb Javen Xu 2026-08-03 @6335  	memset(tp->rx_ring, 0, sizeof(tp->rx_ring));
d59b0fc7e3bbccb Javen Xu 2026-08-03  6336  	memcpy(tp->rx_ring, new_rx, sizeof(*new_rx) * ch->rx_count);
d59b0fc7e3bbccb Javen Xu 2026-08-03  6337  
d59b0fc7e3bbccb Javen Xu 2026-08-03  6338  	rtl8169_set_rss_indir_tbl(tp, tp->num_rx_rings);
d59b0fc7e3bbccb Javen Xu 2026-08-03  6339  	rtl_set_irq_mask(tp);
d59b0fc7e3bbccb Javen Xu 2026-08-03  6340  
d59b0fc7e3bbccb Javen Xu 2026-08-03  6341  	rtl8169_up(tp);
d59b0fc7e3bbccb Javen Xu 2026-08-03  6342  	netif_start_queue(dev);
d59b0fc7e3bbccb Javen Xu 2026-08-03  6343  
d59b0fc7e3bbccb Javen Xu 2026-08-03  6344  	kfree(new_rx);
d59b0fc7e3bbccb Javen Xu 2026-08-03  6345  
d59b0fc7e3bbccb Javen Xu 2026-08-03  6346  	return 0;
d59b0fc7e3bbccb Javen Xu 2026-08-03  6347  
d59b0fc7e3bbccb Javen Xu 2026-08-03  6348  err_reset:
d59b0fc7e3bbccb Javen Xu 2026-08-03  6349  	if (netif_set_real_num_rx_queues(dev, tp->num_rx_rings))
d59b0fc7e3bbccb Javen Xu 2026-08-03  6350  		netdev_err(dev, "Failed to revert rx_queues, state might be inconsistent!\n");
d59b0fc7e3bbccb Javen Xu 2026-08-03  6351  	tp->init_rx_desc_type = old_rx_desc_type;
d59b0fc7e3bbccb Javen Xu 2026-08-03  6352  err_up:
d59b0fc7e3bbccb Javen Xu 2026-08-03  6353  	rtl8169_up(tp);
d59b0fc7e3bbccb Javen Xu 2026-08-03  6354  	netif_start_queue(dev);
d59b0fc7e3bbccb Javen Xu 2026-08-03  6355  	kfree(new_rx);
d59b0fc7e3bbccb Javen Xu 2026-08-03  6356  
d59b0fc7e3bbccb Javen Xu 2026-08-03  6357  	return ret;
d59b0fc7e3bbccb Javen Xu 2026-08-03  6358  }
d59b0fc7e3bbccb Javen Xu 2026-08-03  6359  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
