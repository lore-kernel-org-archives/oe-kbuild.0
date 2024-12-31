Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C910113D521
	for <oe-kbuild@lists.linux.dev>; Tue, 31 Dec 2024 10:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735641874; cv=none; b=GGTfRXfa0r6hkB/pCI9s9y6dYbGnak+Ky7U7GsJuW6IktFIAXbuMIraMwCOF9B9BlenFPhzfYvzsRICCNSl3q/9tFjVw1k5Mzv6B/Qy8Rrr0QiYT+qZ7x0qvFfoeUTztd13OtpheIDzBBsphn/j271RO9giw6s+EkosCW4dAiQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735641874; c=relaxed/simple;
	bh=9CbkI1OZxVmXdjvzQBVVZ1X0P8fSQJv2RnvtCwsYdas=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RT6zFiwi9HeERP/kzy/L70GmSIKLiPs9mSk5ZrRi97d43Xgn6xdCUvjiyplJvnXbyfec3fd0QM3VUiz6LGuVgVH2LKZ1iIXsS4iC401T4BkPIkCwkZmj0G7i24IuQTeNM7SE1JwSJ3ywQdtNuJbv5t9zviroN8Vky6XhLS6JHT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H2NnhaEH; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H2NnhaEH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735641873; x=1767177873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9CbkI1OZxVmXdjvzQBVVZ1X0P8fSQJv2RnvtCwsYdas=;
  b=H2NnhaEHzcI4NIHp66aWb58rIdgMA1OeoanfX88cN8WtnkxTadFjsYgQ
   R8Z3G2d27zlqsGSGarmjuRuIkJFYgiuG06CfmfY14fZoKdQtKVbdrJ+5+
   BBYxu31kIENt2pxZTmWTa4YXAq1VTov8HXpqxwWbCROFQZSrvN9xML4cD
   +xq54hEvPtBYaFenJoNEFtX3NfMV+E/qkNYACfDbqh/JvcX0O7tR6fTIb
   mvsYVFquCaS9YszsdCpFukvZztu3L7ehy1QGmIuPb9N913o7iNGRYPDjD
   5pz5+lGUUo8Bo+8NCRms+853UR2xIv6F5zEMqgu8xuLkHkDn+kiXVzMTw
   Q==;
X-CSE-ConnectionGUID: A9Mp3D2IT9+PdXE6rAY30g==
X-CSE-MsgGUID: W/kGNILVS0yAYrvRNuo8Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="39851741"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; 
   d="scan'208";a="39851741"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 02:44:32 -0800
X-CSE-ConnectionGUID: huN8dNZbTmKIajHyqyqBAQ==
X-CSE-MsgGUID: W5ePQG99Sd+Uwzb3XKDCBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="138363770"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 31 Dec 2024 02:44:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSZjg-00074P-2d;
	Tue, 31 Dec 2024 10:44:28 +0000
Date: Tue, 31 Dec 2024 18:44:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [chrome-os:chromeos-6.1 83/83] drivers/mailbox/mailbox.c:447:3-9:
 preceding lock on line 402
Message-ID: <202412311801.3SkeAmZY-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   dcf42c495d0dc7b7303797a236fd1a4ee67e9d72
commit: fd3d96240b7afa9f0b63c70c175bcfe8d903aad0 [83/83] FROMLIST: mailbox: Add power_get/power_put API to mbox_chan_ops
:::::: branch date: 4 hours ago
:::::: commit date: 27 hours ago
config: x86_64-randconfig-104-20241231 (https://download.01.org/0day-ci/archive/20241231/202412311801.3SkeAmZY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412311801.3SkeAmZY-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/mailbox/mailbox.c:447:3-9: preceding lock on line 402

vim +447 drivers/mailbox/mailbox.c

a8803d7421cc2b Thierry Reding  2018-11-28  370  
2b6d83e2b8b7de Jassi Brar      2014-06-12  371  /**
2b6d83e2b8b7de Jassi Brar      2014-06-12  372   * mbox_request_channel - Request a mailbox channel.
2b6d83e2b8b7de Jassi Brar      2014-06-12  373   * @cl: Identity of the client requesting the channel.
2b6d83e2b8b7de Jassi Brar      2014-06-12  374   * @index: Index of mailbox specifier in 'mboxes' property.
2b6d83e2b8b7de Jassi Brar      2014-06-12  375   *
2b6d83e2b8b7de Jassi Brar      2014-06-12  376   * The Client specifies its requirements and capabilities while asking for
2b6d83e2b8b7de Jassi Brar      2014-06-12  377   * a mailbox channel. It can't be called from atomic context.
2b6d83e2b8b7de Jassi Brar      2014-06-12  378   * The channel is exclusively allocated and can't be used by another
2b6d83e2b8b7de Jassi Brar      2014-06-12  379   * client before the owner calls mbox_free_channel.
2b6d83e2b8b7de Jassi Brar      2014-06-12  380   * After assignment, any packet received on this channel will be
2b6d83e2b8b7de Jassi Brar      2014-06-12  381   * handed over to the client via the 'rx_callback'.
2b6d83e2b8b7de Jassi Brar      2014-06-12  382   * The framework holds reference to the client, so the mbox_client
2b6d83e2b8b7de Jassi Brar      2014-06-12  383   * structure shouldn't be modified until the mbox_free_channel returns.
2b6d83e2b8b7de Jassi Brar      2014-06-12  384   *
2b6d83e2b8b7de Jassi Brar      2014-06-12  385   * Return: Pointer to the channel assigned to the client if successful.
2b6d83e2b8b7de Jassi Brar      2014-06-12  386   *		ERR_PTR for request failure.
2b6d83e2b8b7de Jassi Brar      2014-06-12  387   */
2b6d83e2b8b7de Jassi Brar      2014-06-12  388  struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index)
2b6d83e2b8b7de Jassi Brar      2014-06-12  389  {
2b6d83e2b8b7de Jassi Brar      2014-06-12  390  	struct device *dev = cl->dev;
2b6d83e2b8b7de Jassi Brar      2014-06-12  391  	struct mbox_controller *mbox;
2b6d83e2b8b7de Jassi Brar      2014-06-12  392  	struct of_phandle_args spec;
2b6d83e2b8b7de Jassi Brar      2014-06-12  393  	struct mbox_chan *chan;
2b6d83e2b8b7de Jassi Brar      2014-06-12  394  	unsigned long flags;
2b6d83e2b8b7de Jassi Brar      2014-06-12  395  	int ret;
2b6d83e2b8b7de Jassi Brar      2014-06-12  396  
2b6d83e2b8b7de Jassi Brar      2014-06-12  397  	if (!dev || !dev->of_node) {
2b6d83e2b8b7de Jassi Brar      2014-06-12  398  		pr_debug("%s: No owner device node\n", __func__);
2b6d83e2b8b7de Jassi Brar      2014-06-12  399  		return ERR_PTR(-ENODEV);
2b6d83e2b8b7de Jassi Brar      2014-06-12  400  	}
2b6d83e2b8b7de Jassi Brar      2014-06-12  401  
2b6d83e2b8b7de Jassi Brar      2014-06-12 @402  	mutex_lock(&con_mutex);
2b6d83e2b8b7de Jassi Brar      2014-06-12  403  
2b6d83e2b8b7de Jassi Brar      2014-06-12  404  	if (of_parse_phandle_with_args(dev->of_node, "mboxes",
2b6d83e2b8b7de Jassi Brar      2014-06-12  405  				       "#mbox-cells", index, &spec)) {
2b6d83e2b8b7de Jassi Brar      2014-06-12  406  		dev_dbg(dev, "%s: can't parse \"mboxes\" property\n", __func__);
2b6d83e2b8b7de Jassi Brar      2014-06-12  407  		mutex_unlock(&con_mutex);
2b6d83e2b8b7de Jassi Brar      2014-06-12  408  		return ERR_PTR(-ENODEV);
2b6d83e2b8b7de Jassi Brar      2014-06-12  409  	}
2b6d83e2b8b7de Jassi Brar      2014-06-12  410  
2d805fc1c6b2ec Benson Leung    2015-05-04  411  	chan = ERR_PTR(-EPROBE_DEFER);
2b6d83e2b8b7de Jassi Brar      2014-06-12  412  	list_for_each_entry(mbox, &mbox_cons, node)
2b6d83e2b8b7de Jassi Brar      2014-06-12  413  		if (mbox->dev->of_node == spec.np) {
2b6d83e2b8b7de Jassi Brar      2014-06-12  414  			chan = mbox->of_xlate(mbox, &spec);
8ed82e23875e60 Mikko Perttunen 2018-11-28  415  			if (!IS_ERR(chan))
2b6d83e2b8b7de Jassi Brar      2014-06-12  416  				break;
2b6d83e2b8b7de Jassi Brar      2014-06-12  417  		}
2b6d83e2b8b7de Jassi Brar      2014-06-12  418  
2b6d83e2b8b7de Jassi Brar      2014-06-12  419  	of_node_put(spec.np);
2b6d83e2b8b7de Jassi Brar      2014-06-12  420  
2d805fc1c6b2ec Benson Leung    2015-05-04  421  	if (IS_ERR(chan)) {
2d805fc1c6b2ec Benson Leung    2015-05-04  422  		mutex_unlock(&con_mutex);
2d805fc1c6b2ec Benson Leung    2015-05-04  423  		return chan;
2d805fc1c6b2ec Benson Leung    2015-05-04  424  	}
2d805fc1c6b2ec Benson Leung    2015-05-04  425  
2d805fc1c6b2ec Benson Leung    2015-05-04  426  	if (chan->cl || !try_module_get(mbox->dev->driver->owner)) {
2b6d83e2b8b7de Jassi Brar      2014-06-12  427  		dev_dbg(dev, "%s: mailbox not free\n", __func__);
2b6d83e2b8b7de Jassi Brar      2014-06-12  428  		mutex_unlock(&con_mutex);
2b6d83e2b8b7de Jassi Brar      2014-06-12  429  		return ERR_PTR(-EBUSY);
2b6d83e2b8b7de Jassi Brar      2014-06-12  430  	}
2b6d83e2b8b7de Jassi Brar      2014-06-12  431  
2b6d83e2b8b7de Jassi Brar      2014-06-12  432  	spin_lock_irqsave(&chan->lock, flags);
2b6d83e2b8b7de Jassi Brar      2014-06-12  433  	chan->msg_free = 0;
2b6d83e2b8b7de Jassi Brar      2014-06-12  434  	chan->msg_count = 0;
2b6d83e2b8b7de Jassi Brar      2014-06-12  435  	chan->active_req = NULL;
2b6d83e2b8b7de Jassi Brar      2014-06-12  436  	chan->cl = cl;
2b6d83e2b8b7de Jassi Brar      2014-06-12  437  	init_completion(&chan->tx_complete);
2b6d83e2b8b7de Jassi Brar      2014-06-12  438  
2b6d83e2b8b7de Jassi Brar      2014-06-12  439  	if (chan->txdone_method	== TXDONE_BY_POLL && cl->knows_txdone)
33cd7123ac0ba5 Sudeep Holla    2017-09-28  440  		chan->txdone_method = TXDONE_BY_ACK;
2b6d83e2b8b7de Jassi Brar      2014-06-12  441  
2b6d83e2b8b7de Jassi Brar      2014-06-12  442  	spin_unlock_irqrestore(&chan->lock, flags);
2b6d83e2b8b7de Jassi Brar      2014-06-12  443  
fd3d96240b7afa Jason-jh Lin    2024-06-14  444  	if (chan->mbox->ops->power_get) {
fd3d96240b7afa Jason-jh Lin    2024-06-14  445  		ret = chan->mbox->ops->power_get(chan);
fd3d96240b7afa Jason-jh Lin    2024-06-14  446  		if (ret < 0)
fd3d96240b7afa Jason-jh Lin    2024-06-14 @447  			return ERR_PTR(ret);
fd3d96240b7afa Jason-jh Lin    2024-06-14  448  	}
fd3d96240b7afa Jason-jh Lin    2024-06-14  449  
b7133d6fcd9a9e Bjorn Andersson 2017-05-27  450  	if (chan->mbox->ops->startup) {
2b6d83e2b8b7de Jassi Brar      2014-06-12  451  		ret = chan->mbox->ops->startup(chan);
b7133d6fcd9a9e Bjorn Andersson 2017-05-27  452  
2b6d83e2b8b7de Jassi Brar      2014-06-12  453  		if (ret) {
2b6d83e2b8b7de Jassi Brar      2014-06-12  454  			dev_err(dev, "Unable to startup the chan (%d)\n", ret);
2b6d83e2b8b7de Jassi Brar      2014-06-12  455  			mbox_free_channel(chan);
2b6d83e2b8b7de Jassi Brar      2014-06-12  456  			chan = ERR_PTR(ret);
2b6d83e2b8b7de Jassi Brar      2014-06-12  457  		}
b7133d6fcd9a9e Bjorn Andersson 2017-05-27  458  	}
2b6d83e2b8b7de Jassi Brar      2014-06-12  459  
fd3d96240b7afa Jason-jh Lin    2024-06-14  460  	if (chan->mbox->ops->power_put)
fd3d96240b7afa Jason-jh Lin    2024-06-14  461  		chan->mbox->ops->power_put(chan);
fd3d96240b7afa Jason-jh Lin    2024-06-14  462  
2b6d83e2b8b7de Jassi Brar      2014-06-12  463  	mutex_unlock(&con_mutex);
fd3d96240b7afa Jason-jh Lin    2024-06-14  464  
2b6d83e2b8b7de Jassi Brar      2014-06-12  465  	return chan;
2b6d83e2b8b7de Jassi Brar      2014-06-12  466  }
2b6d83e2b8b7de Jassi Brar      2014-06-12  467  EXPORT_SYMBOL_GPL(mbox_request_channel);
2b6d83e2b8b7de Jassi Brar      2014-06-12  468  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
