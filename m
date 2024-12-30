Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176E81A070E
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Dec 2024 16:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735575137; cv=none; b=KHoCN95DnEXo0LhS6XHqWfSTIciY7hv8A0VKgKkCBz1ghSL4vD9umrzYxKJLZQg+80po5I9ZjwCrf2cL6qV1HrgN7GgeQ6qOVfphNCKqRtL/Fhg3pthHBI+RT5EprjtZ3lixmTN/yS7POajFLDwsHbOHQmELFDICfW6A11F0eZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735575137; c=relaxed/simple;
	bh=XwSZQqL80WQafOW57yXrajMJnTo6rX3BDPvR8wG7H2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MUxadwKtvJ8B+e4b7i+iAEfKNpRIFdG186YSL+qg1SkU4p3Dn6PgY9USgBsqJ8R0fNebIK94s+UAS4nONetugzfXGp6vOvrxlLVXxtZBCqr4/J+4w+eBibV4CAMRAdQL0baz+cRSMW3YWZVjJmidKs60J2iVpsddV96fyhswMTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J1+yjIjD; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J1+yjIjD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735575136; x=1767111136;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XwSZQqL80WQafOW57yXrajMJnTo6rX3BDPvR8wG7H2I=;
  b=J1+yjIjDcNyso3sdK0hSEXCanIqZx1PqENfwjBl/c7GvBDncpTvYgHjN
   zAKtyEDCJDeN3cqOdL6Bgvoon8Nw12E2T5zDsnYJ6UeJvHjq7fDY1vwdZ
   osBNNXUlKPzosBLtnVsNXcIva02wvinHP0l+MJtzehu9UH4+NKkSlgOn4
   2JDU+MLqZHagIN2QXAy30wuy7pU9iwHPPQnp91vfoZEKSXpEcGdfLkvKb
   zYFJbtRFlgdM3RZmxOzXlQHB9mMaWtKNsVYmJQht+Ew4mM2MXkRaXRfOE
   J9VeDnEQIzNpKn/YQ8dsoHOOzIm97A+NGoct8qwh36EK+R+G+qua9k5sy
   w==;
X-CSE-ConnectionGUID: XzsGY5OjQ2SS/gK/V/F9UQ==
X-CSE-MsgGUID: Am/aKyFTSgSK7/z9el2o/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="35976180"
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; 
   d="scan'208";a="35976180"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 08:12:14 -0800
X-CSE-ConnectionGUID: 9r+0ytG4Ra2zSXkEnQJ0pQ==
X-CSE-MsgGUID: AlXXwX6DRH6JS6Fj4VeyNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="131773555"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Dec 2024 08:12:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSINF-0006Ah-1q;
	Mon, 30 Dec 2024 16:12:09 +0000
Date: Tue, 31 Dec 2024 00:11:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [chrome-os:chromeos-6.6 99/99] drivers/mailbox/mailbox.c:485
 mbox_request_channel() error: 'chan' dereferencing possible ERR_PTR()
Message-ID: <202412310057.CBZZURC9-lkp@intel.com>
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

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   470a6487b5bb9674538d8dc645791263251b6996
commit: 71e4fcb288df366078213ba4fcf976f12a14d5e2 [99/99] FROMLIST: mailbox: Add power_get/power_put API to mbox_chan_ops
:::::: branch date: 3 hours ago
:::::: commit date: 9 hours ago
config: i386-randconfig-141-20241230 (https://download.01.org/0day-ci/archive/20241231/202412310057.CBZZURC9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412310057.CBZZURC9-lkp@intel.com/

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
71e4fcb288df36 Jason-JH.Lin    2024-06-14 @485  	if (chan->mbox->ops->power_put)
71e4fcb288df36 Jason-JH.Lin    2024-06-14  486  		chan->mbox->ops->power_put(chan);
71e4fcb288df36 Jason-JH.Lin    2024-06-14  487  
2b6d83e2b8b7de Jassi Brar      2014-06-12  488  	mutex_unlock(&con_mutex);
71e4fcb288df36 Jason-JH.Lin    2024-06-14  489  
2b6d83e2b8b7de Jassi Brar      2014-06-12  490  	return chan;
2b6d83e2b8b7de Jassi Brar      2014-06-12  491  }
2b6d83e2b8b7de Jassi Brar      2014-06-12  492  EXPORT_SYMBOL_GPL(mbox_request_channel);
2b6d83e2b8b7de Jassi Brar      2014-06-12  493  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
