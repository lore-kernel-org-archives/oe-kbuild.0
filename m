Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E241549C;
	Fri,  3 Nov 2023 11:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KbkyUy36"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699012121; x=1730548121;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sKC/oUSv/poQFAbprhtHwzVkeXiHrBI6yC7IBRi6G3M=;
  b=KbkyUy361da2anzWk4Bl5/w25rFdVHtTPxIFPHBiyZOsL4pq1BNVXgX5
   x+CXGhy6v1tNSz0Y1A4BvmWa6YRTjsOximBp9nJGDURq/Btv/VBzG9FlZ
   Tn+uWyd460/RTEtl4K4ZtIxGOcwnsFkIeddWbVpcOafYJIZFVqI9hF0lF
   4Dq6/YoYjDhj9YK52KcH17glnLXpBgmS0/w4Oiaq5PXEeYQ4K7cjKcXid
   ICiYKw6tuLI6d2BNhaQm57Adq8Bi2P5uLJyvo3HA3Rm19d5GxTX9HkoOk
   vk0Ov+X9QRzEvztCIRYiT4vYbiLVPZCfbx4WrRYPzghCknYy4VfU9ucmz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="392814530"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="392814530"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 04:48:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="738061442"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="738061442"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 03 Nov 2023 04:48:04 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 16D585E2; Fri,  3 Nov 2023 13:48:02 +0200 (EET)
Date: Fri, 3 Nov 2023 13:48:02 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: drivers/thunderbolt/tmu.c:617 tb_switch_tmu_change_mode() warn:
 missing unwind goto?
Message-ID: <20231103114802.GQ17433@black.fi.intel.com>
References: <9a426df0-2ad2-48e7-aa6a-21e5c40ec839@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9a426df0-2ad2-48e7-aa6a-21e5c40ec839@kadam.mountain>

Hi Dan,

On Fri, Nov 03, 2023 at 09:01:34AM +0300, Dan Carpenter wrote:
> Hi Mika,
> 
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   4652b8e4f3ffa48c706ec334f048c217a7d9750d
> commit: c437dcb18310f296eb9db58a361f309f7817014d thunderbolt: Fix a couple of style issues in TMU code
> config: i386-randconfig-141-20231102 (https://download.01.org/0day-ci/archive/20231103/202311030814.AXtCk7PO-lkp@intel.com/config)
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> reproduce: (https://download.01.org/0day-ci/archive/20231103/202311030814.AXtCk7PO-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202311030814.AXtCk7PO-lkp@intel.com/
> 
> smatch warnings:
> drivers/thunderbolt/tmu.c:617 tb_switch_tmu_change_mode() warn: missing unwind goto?
> 
> vim +617 drivers/thunderbolt/tmu.c
> 
> c437dcb18310f2 Mika Westerberg 2022-10-07  596  static int tb_switch_tmu_change_mode(struct tb_switch *sw)
> b017a46d486cd4 Gil Fine        2022-05-26  597  {
> b017a46d486cd4 Gil Fine        2022-05-26  598  	struct tb_port *up, *down;
> b017a46d486cd4 Gil Fine        2022-05-26  599  	int ret;
> b017a46d486cd4 Gil Fine        2022-05-26  600  
> b017a46d486cd4 Gil Fine        2022-05-26  601  	up = tb_upstream_port(sw);
> 7ce542219b6323 Gil Fine        2022-09-23  602  	down = tb_switch_downstream_port(sw);
> b017a46d486cd4 Gil Fine        2022-05-26  603  	ret = tb_port_tmu_set_unidirectional(down, sw->tmu.unidirectional_request);
> b017a46d486cd4 Gil Fine        2022-05-26  604  	if (ret)
> b017a46d486cd4 Gil Fine        2022-05-26  605  		goto out;
> b017a46d486cd4 Gil Fine        2022-05-26  606  
> b017a46d486cd4 Gil Fine        2022-05-26  607  	if (sw->tmu.unidirectional_request)
> 7ce542219b6323 Gil Fine        2022-09-23  608  		ret = tb_switch_tmu_rate_write(tb_switch_parent(sw),
> 7ce542219b6323 Gil Fine        2022-09-23  609  					       sw->tmu.rate_request);
> b017a46d486cd4 Gil Fine        2022-05-26  610  	else
> b017a46d486cd4 Gil Fine        2022-05-26  611  		ret = tb_switch_tmu_rate_write(sw, sw->tmu.rate_request);
> b017a46d486cd4 Gil Fine        2022-05-26  612  	if (ret)
> b017a46d486cd4 Gil Fine        2022-05-26  613  		return ret;
> 
> These error paths should be goto out;
> 
> b017a46d486cd4 Gil Fine        2022-05-26  614  
> b017a46d486cd4 Gil Fine        2022-05-26  615  	ret = tb_switch_set_tmu_mode_params(sw, sw->tmu.rate_request);
> b017a46d486cd4 Gil Fine        2022-05-26  616  	if (ret)
> b017a46d486cd4 Gil Fine        2022-05-26 @617  		return ret;
> 
> Same.  (I guess before goto out was a do-nothing goto so it didn't
> matter).

Thanks for the report!

This code is different now in the mainline but this one is still there
and I agree it should goto out.

I will send a fix after -rc1 is released.
