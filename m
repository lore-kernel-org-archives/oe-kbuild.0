Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D7C18C05
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Jun 2024 08:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718438812; cv=none; b=guISFulGMZBa2MKFogIzJCYHB0f/YEoL6OJMHgr6ZoTdKYBlxi+PxFhxvk+xprb73DwtObZK9VJE7uOdfFbRnzMUGY+27vRiRBJDyJuVzEOZ98dxr2mOLNZpGwsHmhq8Np1BqrDnO9rHPu46uewH3XCtOCLuAPptNIBCKLADJiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718438812; c=relaxed/simple;
	bh=4+4JRZ0yETvOFruaTML9Rl+jdL3DR5bCrIXr4KIi9bA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QrOhgni2RvVJmMyV2VTy7D28AnVBsrIMsYNaQmAEfrp2wQZgS2WVtev61A+OvKtybIlgf3VMjuBD8hF61XvOBFv25B8xDke1mZfPUspiGBL7z659p17A7NzwRP/SfXsNFR1cw9/k7bh1tbYM7s8ZpMcZ3/9AJTJLWRhb8Y7z0oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NykBoQHt; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NykBoQHt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718438811; x=1749974811;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4+4JRZ0yETvOFruaTML9Rl+jdL3DR5bCrIXr4KIi9bA=;
  b=NykBoQHt/Ylpkpy1B3t91FZmy+OXABMhwAi2ffiKtx249nXxg/W8VkXZ
   oHrRqSgsyoq9GbrYU4yN6A2pfyXaxosSg/YqO4MJzyQUK+BEX4vNnn59A
   4KLVciS/Jt3QIs2lwVF3YkNVY4Xe0dxGyyfVWmOiI6V6rt8tMgSbiLXLw
   ehKGYEbEkcSNUlMUsS6RysL966Vq27aoOpa84EUeaVPjc/a6d4F2AFbRN
   dRTNVWoE+jbOBhaifU/eVRRrlllxDUJw6grpde6dVbsWlF8MLbMT6lVAo
   Edj58rDLK4LiVEM99j8rvVoH4sSi8Cg4Qd5H/VtC4u4bvKbKA1Ww71z5F
   w==;
X-CSE-ConnectionGUID: XYkOsEE1TtGozB/YdCxMXQ==
X-CSE-MsgGUID: Wa2MXJlpR5aGFglV/Y7KRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15562857"
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="15562857"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 01:06:50 -0700
X-CSE-ConnectionGUID: IVBEh3THR7uW5CP9om81uw==
X-CSE-MsgGUID: PG0ERIeYQRiQoq0uh6UP+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="78213233"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Jun 2024 01:06:50 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIOQw-0002Lp-2p;
	Sat, 15 Jun 2024 08:06:46 +0000
Date: Sat, 15 Jun 2024 16:06:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 1/2] mailbox: Add power_get/power_put API to mbox_chan_ops
Message-ID: <202406151520.TDnOFFbV-lkp@intel.com>
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
In-Reply-To: <20240614040133.24967-2-jason-jh.lin@mediatek.com>
References: <20240614040133.24967-2-jason-jh.lin@mediatek.com>
TO: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
TO: Jassi Brar <jassisinghbrar@gmail.com>
TO: "Chun-Kuang Hu" <chunkuang.hu@kernel.org>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>
CC: "Jason-JH . Lin" <jason-jh.lin@mediatek.com>
CC: Singo Chang <singo.chang@mediatek.com>
CC: Nancy Lin <nancy.lin@mediatek.com>
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org
CC: Project_Global_Chrome_Upstream_Group@mediatek.com

Hi Jason-JH.Lin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.10-rc3 next-20240613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-JH-Lin/mailbox-Add-power_get-power_put-API-to-mbox_chan_ops/20240614-120412
base:   linus/master
patch link:    https://lore.kernel.org/r/20240614040133.24967-2-jason-jh.lin%40mediatek.com
patch subject: [PATCH 1/2] mailbox: Add power_get/power_put API to mbox_chan_ops
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: x86_64-randconfig-161-20240615 (https://download.01.org/0day-ci/archive/20240615/202406151520.TDnOFFbV-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406151520.TDnOFFbV-lkp@intel.com/

smatch warnings:
drivers/mailbox/mailbox.c:485 mbox_request_channel() error: 'chan' dereferencing possible ERR_PTR()

vim +/chan +485 drivers/mailbox/mailbox.c

85a953806557db Elliot Berman   2023-04-10  426  
2b6d83e2b8b7de Jassi Brar      2014-06-12  427  /**
2b6d83e2b8b7de Jassi Brar      2014-06-12  428   * mbox_request_channel - Request a mailbox channel.
2b6d83e2b8b7de Jassi Brar      2014-06-12  429   * @cl: Identity of the client requesting the channel.
2b6d83e2b8b7de Jassi Brar      2014-06-12  430   * @index: Index of mailbox specifier in 'mboxes' property.
2b6d83e2b8b7de Jassi Brar      2014-06-12  431   *
2b6d83e2b8b7de Jassi Brar      2014-06-12  432   * The Client specifies its requirements and capabilities while asking for
2b6d83e2b8b7de Jassi Brar      2014-06-12  433   * a mailbox channel. It can't be called from atomic context.
2b6d83e2b8b7de Jassi Brar      2014-06-12  434   * The channel is exclusively allocated and can't be used by another
2b6d83e2b8b7de Jassi Brar      2014-06-12  435   * client before the owner calls mbox_free_channel.
2b6d83e2b8b7de Jassi Brar      2014-06-12  436   * After assignment, any packet received on this channel will be
2b6d83e2b8b7de Jassi Brar      2014-06-12  437   * handed over to the client via the 'rx_callback'.
2b6d83e2b8b7de Jassi Brar      2014-06-12  438   * The framework holds reference to the client, so the mbox_client
2b6d83e2b8b7de Jassi Brar      2014-06-12  439   * structure shouldn't be modified until the mbox_free_channel returns.
2b6d83e2b8b7de Jassi Brar      2014-06-12  440   *
2b6d83e2b8b7de Jassi Brar      2014-06-12  441   * Return: Pointer to the channel assigned to the client if successful.
2b6d83e2b8b7de Jassi Brar      2014-06-12  442   *		ERR_PTR for request failure.
2b6d83e2b8b7de Jassi Brar      2014-06-12  443   */
2b6d83e2b8b7de Jassi Brar      2014-06-12  444  struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index)
2b6d83e2b8b7de Jassi Brar      2014-06-12  445  {
2b6d83e2b8b7de Jassi Brar      2014-06-12  446  	struct device *dev = cl->dev;
2b6d83e2b8b7de Jassi Brar      2014-06-12  447  	struct mbox_controller *mbox;
2b6d83e2b8b7de Jassi Brar      2014-06-12  448  	struct of_phandle_args spec;
2b6d83e2b8b7de Jassi Brar      2014-06-12  449  	struct mbox_chan *chan;
2b6d83e2b8b7de Jassi Brar      2014-06-12  450  	int ret;
2b6d83e2b8b7de Jassi Brar      2014-06-12  451  
2b6d83e2b8b7de Jassi Brar      2014-06-12  452  	if (!dev || !dev->of_node) {
2b6d83e2b8b7de Jassi Brar      2014-06-12  453  		pr_debug("%s: No owner device node\n", __func__);
2b6d83e2b8b7de Jassi Brar      2014-06-12  454  		return ERR_PTR(-ENODEV);
2b6d83e2b8b7de Jassi Brar      2014-06-12  455  	}
2b6d83e2b8b7de Jassi Brar      2014-06-12  456  
2b6d83e2b8b7de Jassi Brar      2014-06-12  457  	mutex_lock(&con_mutex);
2b6d83e2b8b7de Jassi Brar      2014-06-12  458  
2b6d83e2b8b7de Jassi Brar      2014-06-12  459  	if (of_parse_phandle_with_args(dev->of_node, "mboxes",
2b6d83e2b8b7de Jassi Brar      2014-06-12  460  				       "#mbox-cells", index, &spec)) {
2b6d83e2b8b7de Jassi Brar      2014-06-12  461  		dev_dbg(dev, "%s: can't parse \"mboxes\" property\n", __func__);
2b6d83e2b8b7de Jassi Brar      2014-06-12  462  		mutex_unlock(&con_mutex);
2b6d83e2b8b7de Jassi Brar      2014-06-12  463  		return ERR_PTR(-ENODEV);
2b6d83e2b8b7de Jassi Brar      2014-06-12  464  	}
2b6d83e2b8b7de Jassi Brar      2014-06-12  465  
2d805fc1c6b2ec Benson Leung    2015-05-04  466  	chan = ERR_PTR(-EPROBE_DEFER);
2b6d83e2b8b7de Jassi Brar      2014-06-12  467  	list_for_each_entry(mbox, &mbox_cons, node)
2b6d83e2b8b7de Jassi Brar      2014-06-12  468  		if (mbox->dev->of_node == spec.np) {
2b6d83e2b8b7de Jassi Brar      2014-06-12  469  			chan = mbox->of_xlate(mbox, &spec);
8ed82e23875e60 Mikko Perttunen 2018-11-28  470  			if (!IS_ERR(chan))
2b6d83e2b8b7de Jassi Brar      2014-06-12  471  				break;
2b6d83e2b8b7de Jassi Brar      2014-06-12  472  		}
2b6d83e2b8b7de Jassi Brar      2014-06-12  473  
2b6d83e2b8b7de Jassi Brar      2014-06-12  474  	of_node_put(spec.np);
2b6d83e2b8b7de Jassi Brar      2014-06-12  475  
2d805fc1c6b2ec Benson Leung    2015-05-04  476  	if (IS_ERR(chan)) {
2d805fc1c6b2ec Benson Leung    2015-05-04  477  		mutex_unlock(&con_mutex);
2d805fc1c6b2ec Benson Leung    2015-05-04  478  		return chan;
2d805fc1c6b2ec Benson Leung    2015-05-04  479  	}
2d805fc1c6b2ec Benson Leung    2015-05-04  480  
85a953806557db Elliot Berman   2023-04-10  481  	ret = __mbox_bind_client(chan, cl);
85a953806557db Elliot Berman   2023-04-10  482  	if (ret)
2b6d83e2b8b7de Jassi Brar      2014-06-12  483  		chan = ERR_PTR(ret);
2b6d83e2b8b7de Jassi Brar      2014-06-12  484  
9c57f48cd805b1 Jason-JH.Lin    2024-06-14 @485  	if (chan->mbox->ops->power_put)
9c57f48cd805b1 Jason-JH.Lin    2024-06-14  486  		chan->mbox->ops->power_put(chan);
9c57f48cd805b1 Jason-JH.Lin    2024-06-14  487  
2b6d83e2b8b7de Jassi Brar      2014-06-12  488  	mutex_unlock(&con_mutex);
9c57f48cd805b1 Jason-JH.Lin    2024-06-14  489  
2b6d83e2b8b7de Jassi Brar      2014-06-12  490  	return chan;
2b6d83e2b8b7de Jassi Brar      2014-06-12  491  }
2b6d83e2b8b7de Jassi Brar      2014-06-12  492  EXPORT_SYMBOL_GPL(mbox_request_channel);
2b6d83e2b8b7de Jassi Brar      2014-06-12  493  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
