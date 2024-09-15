Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281F11C6F40
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Sep 2024 14:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726409870; cv=none; b=duen3z7DSCo96MhzX5CtCnblh8dm34PZ+x7sppYDxqUFzO7itkoRy5se7A8bUq9mMtes815thbeL6YVyfLzhkWHYNmBHy4t2C9fO4kRnJTpdcbW90jsDe+m4uBC3kUy6lTFqRCTgY4x1uzXsKRcTZ+kXI0EUANtAibR/nZAqOhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726409870; c=relaxed/simple;
	bh=FVm4VaTv49bMbsDvWHL3FdmzkhyGQtXbIBzHQfX7r6g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UYg7Qaa+2x15+vn/W+A6mykGJplx+wg0lodc5WuFdsy7dVGHiP6jshmlwOOtcWnRC/yyxLOSAz/Lf9rCR4y7Od0VVrOj/X6QFvzbG1pdxV9M+JDn8KnBsCuMuRIl77zRGWVHkDTWAjvHp5Ri4zvwkX0G/qQVkqoTi62/QQWq/Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xda4tzfh; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xda4tzfh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726409868; x=1757945868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FVm4VaTv49bMbsDvWHL3FdmzkhyGQtXbIBzHQfX7r6g=;
  b=Xda4tzfhFNYX9/oF4O3C5eO/m6qHIukfRS8zHF23adotVk+WtZY0dFne
   LcnbbBuNJ0gTqkYrX4amgYf12f4WeLGKabROqGokwD2f8kW44u1cBj/e7
   NpFTqOtsbGRQwBD4xMx6crc3RCMGgSYO8snx/l+65p8P8Co+iTQMtNyri
   G7dHoKdHVX9r140p4K9Nv1rvjAHfLDPySvpotqSlFmAUa7Pnkd2vlP9tK
   LmI5gAH9Hmz0RxpP7olNBYrhCsRoPG4/BPeP0/mM2r6HMpTkGgSnpOL1f
   DccYHER5S7vsg6UN8/zyuR6yfRLvJ/izUi3nM+/o5j/xngLlZ0SurFQtb
   Q==;
X-CSE-ConnectionGUID: fpteB5tKScaMVX4mVTjzmQ==
X-CSE-MsgGUID: jULvVD4IQrC8rKSxdWeTVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="50673954"
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="50673954"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 07:17:47 -0700
X-CSE-ConnectionGUID: TaqbGuDvRpWexb4ApAU0Wg==
X-CSE-MsgGUID: nqI8Usy8QvKuS9U1J/QAtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="68630376"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 Sep 2024 07:17:46 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spq4O-0008jK-0p;
	Sun, 15 Sep 2024 14:17:44 +0000
Date: Sun, 15 Sep 2024 22:17:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [remoteproc:rpmsg-next 4/4] drivers/rpmsg/qcom_glink_native.c:504
 qcom_glink_send_open_req() error: strcpy() 'channel->name' too large for
 'req->data' (1010102 vs 32)
Message-ID: <202409152202.xXbeT6sp-lkp@intel.com>
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
TO: "Gustavo A. R. Silva" <gustavoars@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Kees Cook <kees@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rpmsg-next
head:   c1ddb29709e675ea2a406e3114dbf5c8c705dd59
commit: c1ddb29709e675ea2a406e3114dbf5c8c705dd59 [4/4] rpmsg: glink: Avoid -Wflex-array-member-not-at-end warnings
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-r072-20240914 (https://download.01.org/0day-ci/archive/20240915/202409152202.xXbeT6sp-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409152202.xXbeT6sp-lkp@intel.com/

smatch warnings:
drivers/rpmsg/qcom_glink_native.c:504 qcom_glink_send_open_req() error: strcpy() 'channel->name' too large for 'req->data' (1010102 vs 32)

vim +504 drivers/rpmsg/qcom_glink_native.c

fb23b97346f9aa Bjorn Andersson       2023-02-13  469  
835764ddd9af0d Bjorn Andersson       2017-08-24  470  /**
4e816d0318fdfe Bjorn Andersson       2023-02-14  471   * qcom_glink_send_open_req() - send a GLINK_CMD_OPEN request to the remote
835764ddd9af0d Bjorn Andersson       2017-08-24  472   * @glink: Ptr to the glink edge
835764ddd9af0d Bjorn Andersson       2017-08-24  473   * @channel: Ptr to the channel that the open req is sent
835764ddd9af0d Bjorn Andersson       2017-08-24  474   *
4e816d0318fdfe Bjorn Andersson       2023-02-14  475   * Allocates a local channel id and sends a GLINK_CMD_OPEN message to the remote.
835764ddd9af0d Bjorn Andersson       2017-08-24  476   * Will return with refcount held, regardless of outcome.
835764ddd9af0d Bjorn Andersson       2017-08-24  477   *
631af6e0f41002 Arnaud Pouliquen      2021-11-08  478   * Return: 0 on success, negative errno otherwise.
835764ddd9af0d Bjorn Andersson       2017-08-24  479   */
835764ddd9af0d Bjorn Andersson       2017-08-24  480  static int qcom_glink_send_open_req(struct qcom_glink *glink,
835764ddd9af0d Bjorn Andersson       2017-08-24  481  				    struct glink_channel *channel)
835764ddd9af0d Bjorn Andersson       2017-08-24  482  {
c1ddb29709e675 Gustavo A. R. Silva   2024-08-07  483  	DEFINE_RAW_FLEX(struct glink_msg, req, data, GLINK_NAME_SIZE);
835764ddd9af0d Bjorn Andersson       2017-08-24  484  	int name_len = strlen(channel->name) + 1;
c1ddb29709e675 Gustavo A. R. Silva   2024-08-07  485  	int req_len = ALIGN(sizeof(*req) + name_len, 8);
835764ddd9af0d Bjorn Andersson       2017-08-24  486  	int ret;
44f6df922a260f Sricharan Ramabadhran 2017-08-24  487  	unsigned long flags;
835764ddd9af0d Bjorn Andersson       2017-08-24  488  
835764ddd9af0d Bjorn Andersson       2017-08-24  489  	kref_get(&channel->refcount);
835764ddd9af0d Bjorn Andersson       2017-08-24  490  
44f6df922a260f Sricharan Ramabadhran 2017-08-24  491  	spin_lock_irqsave(&glink->idr_lock, flags);
835764ddd9af0d Bjorn Andersson       2017-08-24  492  	ret = idr_alloc_cyclic(&glink->lcids, channel,
835764ddd9af0d Bjorn Andersson       2017-08-24  493  			       RPM_GLINK_CID_MIN, RPM_GLINK_CID_MAX,
44f6df922a260f Sricharan Ramabadhran 2017-08-24  494  			       GFP_ATOMIC);
44f6df922a260f Sricharan Ramabadhran 2017-08-24  495  	spin_unlock_irqrestore(&glink->idr_lock, flags);
835764ddd9af0d Bjorn Andersson       2017-08-24  496  	if (ret < 0)
835764ddd9af0d Bjorn Andersson       2017-08-24  497  		return ret;
835764ddd9af0d Bjorn Andersson       2017-08-24  498  
835764ddd9af0d Bjorn Andersson       2017-08-24  499  	channel->lcid = ret;
835764ddd9af0d Bjorn Andersson       2017-08-24  500  
c1ddb29709e675 Gustavo A. R. Silva   2024-08-07  501  	req->cmd = cpu_to_le16(GLINK_CMD_OPEN);
c1ddb29709e675 Gustavo A. R. Silva   2024-08-07  502  	req->param1 = cpu_to_le16(channel->lcid);
c1ddb29709e675 Gustavo A. R. Silva   2024-08-07  503  	req->param2 = cpu_to_le32(name_len);
c1ddb29709e675 Gustavo A. R. Silva   2024-08-07 @504  	strcpy(req->data, channel->name);
835764ddd9af0d Bjorn Andersson       2017-08-24  505  
34f79c11fb2f31 Bjorn Andersson       2024-08-05  506  	trace_qcom_glink_cmd_open_tx(glink->label, channel->name,
34f79c11fb2f31 Bjorn Andersson       2024-08-05  507  				     channel->lcid, channel->rcid);
34f79c11fb2f31 Bjorn Andersson       2024-08-05  508  
c1ddb29709e675 Gustavo A. R. Silva   2024-08-07  509  	ret = qcom_glink_tx(glink, req, req_len, NULL, 0, true);
835764ddd9af0d Bjorn Andersson       2017-08-24  510  	if (ret)
835764ddd9af0d Bjorn Andersson       2017-08-24  511  		goto remove_idr;
835764ddd9af0d Bjorn Andersson       2017-08-24  512  
835764ddd9af0d Bjorn Andersson       2017-08-24  513  	return 0;
835764ddd9af0d Bjorn Andersson       2017-08-24  514  
835764ddd9af0d Bjorn Andersson       2017-08-24  515  remove_idr:
44f6df922a260f Sricharan Ramabadhran 2017-08-24  516  	spin_lock_irqsave(&glink->idr_lock, flags);
835764ddd9af0d Bjorn Andersson       2017-08-24  517  	idr_remove(&glink->lcids, channel->lcid);
835764ddd9af0d Bjorn Andersson       2017-08-24  518  	channel->lcid = 0;
44f6df922a260f Sricharan Ramabadhran 2017-08-24  519  	spin_unlock_irqrestore(&glink->idr_lock, flags);
835764ddd9af0d Bjorn Andersson       2017-08-24  520  
835764ddd9af0d Bjorn Andersson       2017-08-24  521  	return ret;
835764ddd9af0d Bjorn Andersson       2017-08-24  522  }
835764ddd9af0d Bjorn Andersson       2017-08-24  523  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
