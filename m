Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610CF33D2
	for <oe-kbuild@lists.linux.dev>; Fri, 29 Mar 2024 00:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711672471; cv=none; b=Q+5lDDyFXGcM2o6gOpnoqYbvdloYlgk6/81b5AIiljvOO5Yjkepymieg48vqCM8rgKqIGeWLN2RV1cR1OQVFJFKU9qDTlXYqT14iqh8SC7iwP9FnwVYYLH9HjQXjQapRWhVTZS6wkgssr4jyo7cHfRmdqx1/bCmINLGrisEmrtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711672471; c=relaxed/simple;
	bh=+8O/Yfr/kBi8BcXMBLCSRcSg3LA8fMydd5pzg9lyhbs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fq6FM1OwkeF+XHO0CZ63c0YcFv8lVaRd9EDnL3hh6kJ0lYhYM37VfcoJOawxjjhZzCWR25sRw09liXoRBIF/z5RKaRj3d+Zddymg8pafhyYAgB52fz60Acoxi+NrejnNQpGrv/PtSsce8v1cVB19SoCb7wBpXhHOL3cOkD24BfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OoNYzp1q; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OoNYzp1q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711672469; x=1743208469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+8O/Yfr/kBi8BcXMBLCSRcSg3LA8fMydd5pzg9lyhbs=;
  b=OoNYzp1qxWKA6xYgw88eCLEDGjWS52Uo4R0k5NnDoRDwFMKOhWJr+dVc
   PnUvlwtvx3NAyqqRZLJvT0bIkFIOROjWk0VbhwhAqbPZIxWhXRlDj8m82
   nB1ODfXXqE0uNwV7f/LEkz8QFenGOqas3AhqdEWRsurjshvvB7ILHnUJo
   VUFH6RVMKuumngc6lsWGcP1eQ2t26sRz0ztVaTJvLesOe0dz6OrM0QEEt
   9/fshBi9Cu624T5LK4kL8HwjrGtuOhdLd5slkl/MjklSkUjKwV4w4bB2p
   QiWDcOmBJYzwN6cql/CHDKWMKQJjqKzE1bBuAird7gNZvEoSyw2dn3uJN
   g==;
X-CSE-ConnectionGUID: UJPz4hJfSQyLdj/Wgw/9Ug==
X-CSE-MsgGUID: 83QxEkHtSzmX6sUNR2//DQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="29341821"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="29341821"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 17:34:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="16780838"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Mar 2024 17:34:28 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rq0CO-0002du-2o;
	Fri, 29 Mar 2024 00:34:24 +0000
Date: Fri, 29 Mar 2024 08:33:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [gustavoars:testing/WFAMNAE-next20240325-CBC 4/19]
 drivers/rpmsg/qcom_glink_native.c:482 qcom_glink_send_open_req() error:
 strcpy() 'channel->name' too large for 'req->data' (1010102 vs 32)
Message-ID: <202403290814.cOUu3Mvn-lkp@intel.com>
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
CC: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
CC: LKML <linux-kernel@vger.kernel.org>
TO: "Gustavo A. R. Silva" <gustavoars@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/WFAMNAE-next20240325-CBC
head:   17bfb8485e6c8faa5602b51762b51d1e3b33f889
commit: e43cef4b7f03e1ff61532a632d184304354b7d6a [4/19] rpmsg: glink: Avoid -Wflex-array-member-not-at-end warning
:::::: branch date: 3 hours ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20240328 (https://download.01.org/0day-ci/archive/20240329/202403290814.cOUu3Mvn-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403290814.cOUu3Mvn-lkp@intel.com/

smatch warnings:
drivers/rpmsg/qcom_glink_native.c:482 qcom_glink_send_open_req() error: strcpy() 'channel->name' too large for 'req->data' (1010102 vs 32)

vim +482 drivers/rpmsg/qcom_glink_native.c

fb23b97346f9aaa Bjorn Andersson       2023-02-13  447  
835764ddd9af0d9 Bjorn Andersson       2017-08-24  448  /**
4e816d0318fdfe8 Bjorn Andersson       2023-02-14  449   * qcom_glink_send_open_req() - send a GLINK_CMD_OPEN request to the remote
835764ddd9af0d9 Bjorn Andersson       2017-08-24  450   * @glink: Ptr to the glink edge
835764ddd9af0d9 Bjorn Andersson       2017-08-24  451   * @channel: Ptr to the channel that the open req is sent
835764ddd9af0d9 Bjorn Andersson       2017-08-24  452   *
4e816d0318fdfe8 Bjorn Andersson       2023-02-14  453   * Allocates a local channel id and sends a GLINK_CMD_OPEN message to the remote.
835764ddd9af0d9 Bjorn Andersson       2017-08-24  454   * Will return with refcount held, regardless of outcome.
835764ddd9af0d9 Bjorn Andersson       2017-08-24  455   *
631af6e0f41002d Arnaud Pouliquen      2021-11-08  456   * Return: 0 on success, negative errno otherwise.
835764ddd9af0d9 Bjorn Andersson       2017-08-24  457   */
835764ddd9af0d9 Bjorn Andersson       2017-08-24  458  static int qcom_glink_send_open_req(struct qcom_glink *glink,
835764ddd9af0d9 Bjorn Andersson       2017-08-24  459  				    struct glink_channel *channel)
835764ddd9af0d9 Bjorn Andersson       2017-08-24  460  {
e43cef4b7f03e1f Gustavo A. R. Silva   2024-03-19  461  	DEFINE_RAW_FLEX(struct glink_msg, req, data, GLINK_NAME_SIZE);
835764ddd9af0d9 Bjorn Andersson       2017-08-24  462  	int name_len = strlen(channel->name) + 1;
e43cef4b7f03e1f Gustavo A. R. Silva   2024-03-19  463  	int req_len = ALIGN(sizeof(*req) + name_len, 8);
835764ddd9af0d9 Bjorn Andersson       2017-08-24  464  	int ret;
44f6df922a260f1 Sricharan Ramabadhran 2017-08-24  465  	unsigned long flags;
835764ddd9af0d9 Bjorn Andersson       2017-08-24  466  
835764ddd9af0d9 Bjorn Andersson       2017-08-24  467  	kref_get(&channel->refcount);
835764ddd9af0d9 Bjorn Andersson       2017-08-24  468  
44f6df922a260f1 Sricharan Ramabadhran 2017-08-24  469  	spin_lock_irqsave(&glink->idr_lock, flags);
835764ddd9af0d9 Bjorn Andersson       2017-08-24  470  	ret = idr_alloc_cyclic(&glink->lcids, channel,
835764ddd9af0d9 Bjorn Andersson       2017-08-24  471  			       RPM_GLINK_CID_MIN, RPM_GLINK_CID_MAX,
44f6df922a260f1 Sricharan Ramabadhran 2017-08-24  472  			       GFP_ATOMIC);
44f6df922a260f1 Sricharan Ramabadhran 2017-08-24  473  	spin_unlock_irqrestore(&glink->idr_lock, flags);
835764ddd9af0d9 Bjorn Andersson       2017-08-24  474  	if (ret < 0)
835764ddd9af0d9 Bjorn Andersson       2017-08-24  475  		return ret;
835764ddd9af0d9 Bjorn Andersson       2017-08-24  476  
835764ddd9af0d9 Bjorn Andersson       2017-08-24  477  	channel->lcid = ret;
835764ddd9af0d9 Bjorn Andersson       2017-08-24  478  
e43cef4b7f03e1f Gustavo A. R. Silva   2024-03-19  479  	req->cmd = cpu_to_le16(GLINK_CMD_OPEN);
e43cef4b7f03e1f Gustavo A. R. Silva   2024-03-19  480  	req->param1 = cpu_to_le16(channel->lcid);
e43cef4b7f03e1f Gustavo A. R. Silva   2024-03-19  481  	req->param2 = cpu_to_le32(name_len);
e43cef4b7f03e1f Gustavo A. R. Silva   2024-03-19 @482  	strcpy(req->data, channel->name);
835764ddd9af0d9 Bjorn Andersson       2017-08-24  483  
835764ddd9af0d9 Bjorn Andersson       2017-08-24  484  	ret = qcom_glink_tx(glink, &req, req_len, NULL, 0, true);
835764ddd9af0d9 Bjorn Andersson       2017-08-24  485  	if (ret)
835764ddd9af0d9 Bjorn Andersson       2017-08-24  486  		goto remove_idr;
835764ddd9af0d9 Bjorn Andersson       2017-08-24  487  
835764ddd9af0d9 Bjorn Andersson       2017-08-24  488  	return 0;
835764ddd9af0d9 Bjorn Andersson       2017-08-24  489  
835764ddd9af0d9 Bjorn Andersson       2017-08-24  490  remove_idr:
44f6df922a260f1 Sricharan Ramabadhran 2017-08-24  491  	spin_lock_irqsave(&glink->idr_lock, flags);
835764ddd9af0d9 Bjorn Andersson       2017-08-24  492  	idr_remove(&glink->lcids, channel->lcid);
835764ddd9af0d9 Bjorn Andersson       2017-08-24  493  	channel->lcid = 0;
44f6df922a260f1 Sricharan Ramabadhran 2017-08-24  494  	spin_unlock_irqrestore(&glink->idr_lock, flags);
835764ddd9af0d9 Bjorn Andersson       2017-08-24  495  
835764ddd9af0d9 Bjorn Andersson       2017-08-24  496  	return ret;
835764ddd9af0d9 Bjorn Andersson       2017-08-24  497  }
835764ddd9af0d9 Bjorn Andersson       2017-08-24  498  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
