Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794784490;
	b=Ioy/zaygDz5j35g7w0lRb2XfnTr37w7GRedd0deDTaya8TdlX4EIhWLN8aYMbKo4k6iS
	 gAY9cfHlj4V3Gyel0Z499MmlNQAdWSWq/kTv4Xl4/jhLrFnySz22j5gKvFWz4GpT34zeW
	 yKGE37A9mtOw/1c6PdP8e/DsJrVmFMupTnn7axvoBq2YXeJD4eSJvT4xrSHcbVbupyz4P
	 9KVehSZe4Mdd/0+/qFNthpJxC/wLIMmX8jcdcVdYD9XxbTWTpsGhgbzze5BH08P5TD3bY
	 RyTl0/Y94GSZkluTDC4MFXWH4ieocTGjQQLpTf/3jkJEqmXejIYQC8db1lv9FPM8kSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794784490;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=gKdYSuKh/wOps+p+C6m9vD13i2AzaXLlraAek7rgDOY=;
	b=cxHgCvntdaNLcWvIOPYxj18zcDQ926gc0C+6BR3IjZ6M+vMYe5rJeeuDkPGw394PvxLn
	 L+VK1rlrTmc2MJZEd64etUR5xQ7hU6w9AxwWAYWXgK3Z4DJDkZ7ukomoUKQWsOWtEr410
	 TbLXtgncGtCXJ8BFMm4AWBd78cZWnmRNY2kYywufaz7dxnc/nU7qjn5G2sfiqru3CLjr7
	 Mee1tBQXS659OTY3TpvyOrlUd5h+o+PIYI56L6SIZRCTPue4x7/kUfxpTZtyFdepPr2Rx
	 GXThPCVujOqBXexju/4MWyN0OMSGTSHEhX5/KbF7eu48ODNhztzSQo9ksRXWBVjkNRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GmVQb161;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57400606A31F
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Nov 2026 23:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57400606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GmVQb161
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794784490; x=1826320490;
  h=date:from:to:cc:subject:message-id;
  bh=+eN44obC55RvtrEyirnGTCwdVevUZutZzeCEMR3N83M=;
  b=GmVQb161lCyD84SN6GB6szQ1uRvCNHuqzfMud2LzwdPn8ZCqU7M6b3H/
   uw27IvM68riiug7MbVV/3ph51x+T+hY+0ByYPwwqIy8cwPYII5pLrY6EB
   lnAoDeztuBiUt/dkorA9QuTIU2ak5ysK5mGCbUXKuKl/AJFYceIEGKokd
   xbrpxvQMda3DDKa0Nyd7NVqZqxPrgwPRs2/cqV5qdRGftJPTXIcNnnNwQ
   SFlnjsLdOnHhHQqM+y7oUiPqGZQK++Fu0sMSZQsWeoLduBe6SJlBWArOM
   +1UfsCLQzqErs5PSMjOClT9CCFOOPbSD+SYsq0aj1dYU+4aCGyc7a2OcR
   g==;
X-CSE-ConnectionGUID: rHdHaIUFRc6/aCQMA82agQ==
X-CSE-MsgGUID: 5uCgZ9n9RMCj2DYCEBKDew==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3523481"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3523481"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 15:14:49 -0800
X-CSE-ConnectionGUID: cOdIQLLFSFaf+2WzC53gdw==
X-CSE-MsgGUID: v+U+aQqTS62WoQSKYgGjXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9401501"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 15 Nov 2026 15:14:48 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSjQr-000000002V9-1d6g;
	Sun, 15 Nov 2026 23:14:45 +0000
Date: Mon, 16 Nov 2026 00:14:13 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/hsi/controllers/omap_ssi_port.c:304:6-16:
 opportunity for str_write_read(msg -> ttype)
Message-ID: <202611160054.7cvapnA8-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Rosen Penev <rosenp@gmail.com>
CC: Sebastian Reichel <sebastian.reichel@collabora.com>

Hi Rosen,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fa2933aac170dd19c6a7f0d7b81a8f537e40915c
commit: df5ead915b19a6c1fa25f44419f28e1228677b02 HSI: omap_ssi_port: remove depends on ARM
date:   8 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 8 months ago
config: powerpc64-randconfig-r2100-20261115 (https://download.01.org/0day-ci/archive/20261116/202611160054.7cvapnA8-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c0693becb96c1610aeb87445a50df00d58a823cd)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: df5ead915b19 ("HSI: omap_ssi_port: remove depends on ARM")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202611160054.7cvapnA8-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/hsi/controllers/omap_ssi_port.c:304:6-16: opportunity for str_write_read(msg -> ttype)

vim +304 drivers/hsi/controllers/omap_ssi_port.c

b209e047bc7432 Sebastian Reichel 2013-12-15  279  
b209e047bc7432 Sebastian Reichel 2013-12-15  280  static int ssi_start_pio(struct hsi_msg *msg)
b209e047bc7432 Sebastian Reichel 2013-12-15  281  {
b209e047bc7432 Sebastian Reichel 2013-12-15  282  	struct hsi_port *port = hsi_get_port(msg->cl);
b209e047bc7432 Sebastian Reichel 2013-12-15  283  	struct omap_ssi_port *omap_port = hsi_port_drvdata(port);
b209e047bc7432 Sebastian Reichel 2013-12-15  284  	struct hsi_controller *ssi = to_hsi_controller(port->device.parent);
b209e047bc7432 Sebastian Reichel 2013-12-15  285  	struct omap_ssi_controller *omap_ssi = hsi_controller_drvdata(ssi);
b209e047bc7432 Sebastian Reichel 2013-12-15  286  	u32 val;
b209e047bc7432 Sebastian Reichel 2013-12-15  287  
62aa292b3eae92 Sebastian Reichel 2016-06-17  288  	pm_runtime_get(omap_port->pdev);
62aa292b3eae92 Sebastian Reichel 2016-06-17  289  
62aa292b3eae92 Sebastian Reichel 2016-06-17  290  	if (!pm_runtime_active(omap_port->pdev)) {
62aa292b3eae92 Sebastian Reichel 2016-06-17  291  		dev_warn(&port->device, "ssi_start_pio called without runtime PM!\n");
ad60db2f9fe336 Sebastian Reichel 2016-05-11  292  		pm_runtime_put_autosuspend(omap_port->pdev);
62aa292b3eae92 Sebastian Reichel 2016-06-17  293  		return -EREMOTEIO;
62aa292b3eae92 Sebastian Reichel 2016-06-17  294  	}
62aa292b3eae92 Sebastian Reichel 2016-06-17  295  
b209e047bc7432 Sebastian Reichel 2013-12-15  296  	if (msg->ttype == HSI_MSG_WRITE) {
b209e047bc7432 Sebastian Reichel 2013-12-15  297  		val = SSI_DATAACCEPT(msg->channel);
b209e047bc7432 Sebastian Reichel 2013-12-15  298  		/* Hold clocks for pio writes */
62aa292b3eae92 Sebastian Reichel 2016-06-17  299  		pm_runtime_get(omap_port->pdev);
b209e047bc7432 Sebastian Reichel 2013-12-15  300  	} else {
b209e047bc7432 Sebastian Reichel 2013-12-15  301  		val = SSI_DATAAVAILABLE(msg->channel) | SSI_ERROROCCURED;
b209e047bc7432 Sebastian Reichel 2013-12-15  302  	}
b209e047bc7432 Sebastian Reichel 2013-12-15  303  	dev_dbg(&port->device, "Single %s transfer\n",
b209e047bc7432 Sebastian Reichel 2013-12-15 @304  						msg->ttype ? "write" : "read");
b209e047bc7432 Sebastian Reichel 2013-12-15  305  	val |= readl(omap_ssi->sys + SSI_MPU_ENABLE_REG(port->num, 0));
b209e047bc7432 Sebastian Reichel 2013-12-15  306  	writel(val, omap_ssi->sys + SSI_MPU_ENABLE_REG(port->num, 0));
ad60db2f9fe336 Sebastian Reichel 2016-05-11  307  	pm_runtime_put_autosuspend(omap_port->pdev);
b209e047bc7432 Sebastian Reichel 2013-12-15  308  	msg->actual_len = 0;
b209e047bc7432 Sebastian Reichel 2013-12-15  309  	msg->status = HSI_STATUS_PROCEEDING;
b209e047bc7432 Sebastian Reichel 2013-12-15  310  
b209e047bc7432 Sebastian Reichel 2013-12-15  311  	return 0;
b209e047bc7432 Sebastian Reichel 2013-12-15  312  }
b209e047bc7432 Sebastian Reichel 2013-12-15  313  

:::::: The code at line 304 was first introduced by commit
:::::: b209e047bc743247f74ce79e8827ae1ed556bae0 HSI: Introduce OMAP SSI driver

:::::: TO: Sebastian Reichel <sre@kernel.org>
:::::: CC: Sebastian Reichel <sre@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
