Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A7EEDE
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Dec 2024 18:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735582106; cv=none; b=imLrpHVRDmAiIOHOgjZuTQ6gjw99W57AWSxvNcXAMShC18FrzuNTJs4Xr1iwUakksXsmGO6ktAsJuWSEgklbOEmZYGz6/1Ok2ZKbIEIgAjhrDWLwnoYklrP2FB5AUBcMfUyubSIWVEfpPWtE7W13qOI5tLRoTJR0dgQFSXJh1hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735582106; c=relaxed/simple;
	bh=w5gjw6/fS4RcUPyjEBAYutqbDcnmvYv3suhuYIZnahg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LMrgUCDRWaOMHIiHKRE84+xt3lgkRX9s0GTHplM4kznCUB9lmZUg08TU0OTt3rCFi2TGMFb6BEhzjBeCSn5wQRU9aF9GDksxqbcAjtiNtetw5rT/d6A4M6/Gk0+y3DlfCNRNRt7gph4dMybceeK7d1NITFLKB1FpTlPSmePBkQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LWBwoXba; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LWBwoXba"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735582105; x=1767118105;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w5gjw6/fS4RcUPyjEBAYutqbDcnmvYv3suhuYIZnahg=;
  b=LWBwoXbaWKWPDt2HI9HLKYShQr3tbREMCfJ0B7eZI1kCZjVgEERXMM0+
   ACn927p6i6j+xpwVBEEXXA4NOuck3ryAVtteQK8oHlM39IuBnMqGOFxka
   p8fEsLCpze6ozuWEy8j3jIUf1LzfUo7EJwY7bGm+0KLk+DvXxxHyc30eA
   v9a0vJnnzesW7Q9r3u3iS1XPP6Hn1ZVXbTSliAQXsk6mBkvOm974sBpOZ
   R1l+mj8AVk3m6HATaggiiBKP2a1Q4jtUORqdS0sMXV972WRS+KwSo+bYJ
   Xci/36Zah3MJ4qliRFZEhkJ68NWgUx4nRgCcYMGG7aYXquKEEKBGQ4e/6
   Q==;
X-CSE-ConnectionGUID: HeMUhg8nQayakvaskNwjOQ==
X-CSE-MsgGUID: R0FR1TxqQTW2kLv8SlLj2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="35894017"
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; 
   d="scan'208";a="35894017"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 10:08:24 -0800
X-CSE-ConnectionGUID: Y2fmvXZWR1uT6WerBuG9BQ==
X-CSE-MsgGUID: q58o4hK3ROSq8d+cTL7drg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="124133640"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 30 Dec 2024 10:08:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSKBg-0006IH-1a;
	Mon, 30 Dec 2024 18:08:20 +0000
Date: Tue, 31 Dec 2024 02:07:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [chrome-os:chromeos-6.1 62/62] drivers/mailbox/mailbox.c:465
 mbox_request_channel() warn: inconsistent returns 'global &con_mutex'.
Message-ID: <202412310234.doSHE0xj-lkp@intel.com>
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
head:   1dc73fc6a85fde80aea12b39fa2dba89e5e571bc
commit: fd3d96240b7afa9f0b63c70c175bcfe8d903aad0 [62/62] FROMLIST: mailbox: Add power_get/power_put API to mbox_chan_ops
:::::: branch date: 3 hours ago
:::::: commit date: 11 hours ago
config: x86_64-randconfig-161-20241230 (https://download.01.org/0day-ci/archive/20241231/202412310234.doSHE0xj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412310234.doSHE0xj-lkp@intel.com/

New smatch warnings:
drivers/mailbox/mailbox.c:465 mbox_request_channel() warn: inconsistent returns 'global &con_mutex'.

Old smatch warnings:
drivers/mailbox/mailbox.c:460 mbox_request_channel() error: 'chan' dereferencing possible ERR_PTR()

vim +465 drivers/mailbox/mailbox.c

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
2b6d83e2b8b7de Jassi Brar      2014-06-12  402  	mutex_lock(&con_mutex);
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
fd3d96240b7afa Jason-jh Lin    2024-06-14  447  			return ERR_PTR(ret);
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
2b6d83e2b8b7de Jassi Brar      2014-06-12 @465  	return chan;
2b6d83e2b8b7de Jassi Brar      2014-06-12  466  }
2b6d83e2b8b7de Jassi Brar      2014-06-12  467  EXPORT_SYMBOL_GPL(mbox_request_channel);
2b6d83e2b8b7de Jassi Brar      2014-06-12  468  

:::::: The code at line 465 was first introduced by commit
:::::: 2b6d83e2b8b7de82331a6a1dcd64b51020a6031c mailbox: Introduce framework for mailbox

:::::: TO: Jassi Brar <jaswinder.singh@linaro.org>
:::::: CC: Jassi Brar <jaswinder.singh@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
