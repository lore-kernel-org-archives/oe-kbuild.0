Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDEC161
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Jul 2023 00:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689466990; x=1721002990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xtcd5To3YMNyu+/Jrl5LhSGYp2en5VBvtKu5N2BLV4s=;
  b=Jj6L974aMwZgNNptvMEm8q0hZRf5u8OKT9Cl5sh2e3zZtT2NG3iKFpA/
   Fic3hl4PtG32RrDHd5gfKIHIFYEIPjmQUqjRDWCwH8adfgXp2Zb9N2s/V
   d5c21RGE4JFKfIsWegfaWnfXljZ0AZ+cGZHQA6MTYvsKRYDT0dKa5JXD9
   QqnO0UNNviQ+tPZ1xyuD1z0okt/Sc7ahMe4ZbG9gfA8d1gBpAjv5UIMkT
   bp2vt/X2tvOQwD/2Z0E/6aHPTD60NyEpohvsUwew/M6Z89udE9b7DXXNX
   /0xp21JcH439jv+KI2BR8j/ytsl5YtOXFI4mYrTIlOKGs6sLOiQ4Z2lec
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="368357580"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="368357580"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 17:23:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="700085372"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="700085372"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 15 Jul 2023 17:23:08 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKpXX-0008QL-23;
	Sun, 16 Jul 2023 00:23:07 +0000
Date: Sun, 16 Jul 2023 08:22:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [remoteproc:rpmsg-next 2/4] drivers/rpmsg/qcom_glink_native.c:1074
 qcom_glink_handle_signals() error: we previously assumed 'channel' could be
 null (see line 1069)
Message-ID: <202307160800.sb7gMnL6-lkp@intel.com>
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
TO: Chris Lew <quic_clew@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Deepak Kumar Singh <quic_deesin@quicinc.com>
CC: Sarannya S <quic_sarannya@quicinc.com>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rpmsg-next
head:   b5c9ee8296a3760760c7b5d2e305f91412adc795
commit: a2b73aa512a4a90dda7dd5bb38b26b4f1381adbb [2/4] rpmsg: glink: Add support to handle signals command
:::::: branch date: 2 hours ago
:::::: commit date: 6 hours ago
config: sh-randconfig-m041-20230716 (https://download.01.org/0day-ci/archive/20230716/202307160800.sb7gMnL6-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307160800.sb7gMnL6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307160800.sb7gMnL6-lkp@intel.com/

New smatch warnings:
drivers/rpmsg/qcom_glink_native.c:1074 qcom_glink_handle_signals() error: we previously assumed 'channel' could be null (see line 1069)

Old smatch warnings:
drivers/rpmsg/qcom_glink_native.c:478 qcom_glink_send_open_req() error: strcpy() 'channel->name' too large for 'req.name' (1010102 vs 32)

vim +/channel +1074 drivers/rpmsg/qcom_glink_native.c

a2b73aa512a4a9 Chris Lew 2023-07-07  1058  
a2b73aa512a4a9 Chris Lew 2023-07-07  1059  static void qcom_glink_handle_signals(struct qcom_glink *glink,
a2b73aa512a4a9 Chris Lew 2023-07-07  1060  				      unsigned int rcid, unsigned int sigs)
a2b73aa512a4a9 Chris Lew 2023-07-07  1061  {
a2b73aa512a4a9 Chris Lew 2023-07-07  1062  	struct glink_channel *channel;
a2b73aa512a4a9 Chris Lew 2023-07-07  1063  	unsigned long flags;
a2b73aa512a4a9 Chris Lew 2023-07-07  1064  	bool enable;
a2b73aa512a4a9 Chris Lew 2023-07-07  1065  
a2b73aa512a4a9 Chris Lew 2023-07-07  1066  	spin_lock_irqsave(&glink->idr_lock, flags);
a2b73aa512a4a9 Chris Lew 2023-07-07  1067  	channel = idr_find(&glink->rcids, rcid);
a2b73aa512a4a9 Chris Lew 2023-07-07  1068  	spin_unlock_irqrestore(&glink->idr_lock, flags);
a2b73aa512a4a9 Chris Lew 2023-07-07 @1069  	if (!channel)
a2b73aa512a4a9 Chris Lew 2023-07-07  1070  		dev_err(glink->dev, "signal for non-existing channel\n");
a2b73aa512a4a9 Chris Lew 2023-07-07  1071  
a2b73aa512a4a9 Chris Lew 2023-07-07  1072  	enable = sigs & NATIVE_DSR_SIG || sigs & NATIVE_CTS_SIG;
a2b73aa512a4a9 Chris Lew 2023-07-07  1073  
a2b73aa512a4a9 Chris Lew 2023-07-07 @1074  	if (channel->ept.flow_cb)
a2b73aa512a4a9 Chris Lew 2023-07-07  1075  		channel->ept.flow_cb(channel->ept.rpdev, channel->ept.priv, enable);
a2b73aa512a4a9 Chris Lew 2023-07-07  1076  }
a2b73aa512a4a9 Chris Lew 2023-07-07  1077  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
