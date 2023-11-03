Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B34A10FB
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Nov 2023 00:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XQ/1qwAG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698972386; x=1730508386;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cz+i1C+RwcHIt6HROlqtBdOXf9rm7EV1iubTl61qkhM=;
  b=XQ/1qwAGhgFU41FN1yLt1OKqp6QuBRTqc+0Nd3g5u3245qipOSTFVU9s
   CwgiF6zhf1kNpqXoO8hT2OOF/gdCEnR03vk7PSpsG7RF+uD+fMa0pAGNQ
   jR1zPNz/2w+TWmq9GQYDxsOQk4GRHfghnQol7/w4QOcynMIE3x6k9jMcQ
   DxnWeAVbATouKbo7iSnQ5b4kXmSyQxGocOeZLSmzsztvQ6M+UZf1VZL5G
   A/vKilLP0lc86podZtAqWeQHpW05FYA1bpzXYHKibkLj00jyb2lilDP9i
   K4xx9PUzaFZK5A4C3X+GlB/i28C7qGEAvEl/abQdP/GVeiUlazKjCOXJp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="369057691"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="369057691"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 17:46:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="934950091"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="934950091"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 02 Nov 2023 17:46:23 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyiKM-00023t-0A;
	Fri, 03 Nov 2023 00:46:22 +0000
Date: Fri, 3 Nov 2023 08:45:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/thunderbolt/tmu.c:617 tb_switch_tmu_change_mode() warn:
 missing unwind goto?
Message-ID: <202311030814.AXtCk7PO-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Mika Westerberg <mika.westerberg@linux.intel.com>

Hi Mika,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4652b8e4f3ffa48c706ec334f048c217a7d9750d
commit: c437dcb18310f296eb9db58a361f309f7817014d thunderbolt: Fix a couple of style issues in TMU code
date:   5 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 5 months ago
config: i386-randconfig-141-20231102 (https://download.01.org/0day-ci/archive/20231103/202311030814.AXtCk7PO-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231103/202311030814.AXtCk7PO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311030814.AXtCk7PO-lkp@intel.com/

smatch warnings:
drivers/thunderbolt/tmu.c:617 tb_switch_tmu_change_mode() warn: missing unwind goto?

vim +617 drivers/thunderbolt/tmu.c

b017a46d486cd4 Gil Fine        2022-05-26  595  
c437dcb18310f2 Mika Westerberg 2022-10-07  596  static int tb_switch_tmu_change_mode(struct tb_switch *sw)
b017a46d486cd4 Gil Fine        2022-05-26  597  {
b017a46d486cd4 Gil Fine        2022-05-26  598  	struct tb_port *up, *down;
b017a46d486cd4 Gil Fine        2022-05-26  599  	int ret;
b017a46d486cd4 Gil Fine        2022-05-26  600  
b017a46d486cd4 Gil Fine        2022-05-26  601  	up = tb_upstream_port(sw);
7ce542219b6323 Gil Fine        2022-09-23  602  	down = tb_switch_downstream_port(sw);
b017a46d486cd4 Gil Fine        2022-05-26  603  	ret = tb_port_tmu_set_unidirectional(down, sw->tmu.unidirectional_request);
b017a46d486cd4 Gil Fine        2022-05-26  604  	if (ret)
b017a46d486cd4 Gil Fine        2022-05-26  605  		goto out;
b017a46d486cd4 Gil Fine        2022-05-26  606  
b017a46d486cd4 Gil Fine        2022-05-26  607  	if (sw->tmu.unidirectional_request)
7ce542219b6323 Gil Fine        2022-09-23  608  		ret = tb_switch_tmu_rate_write(tb_switch_parent(sw),
7ce542219b6323 Gil Fine        2022-09-23  609  					       sw->tmu.rate_request);
b017a46d486cd4 Gil Fine        2022-05-26  610  	else
b017a46d486cd4 Gil Fine        2022-05-26  611  		ret = tb_switch_tmu_rate_write(sw, sw->tmu.rate_request);
b017a46d486cd4 Gil Fine        2022-05-26  612  	if (ret)
b017a46d486cd4 Gil Fine        2022-05-26  613  		return ret;
b017a46d486cd4 Gil Fine        2022-05-26  614  
b017a46d486cd4 Gil Fine        2022-05-26  615  	ret = tb_switch_set_tmu_mode_params(sw, sw->tmu.rate_request);
b017a46d486cd4 Gil Fine        2022-05-26  616  	if (ret)
b017a46d486cd4 Gil Fine        2022-05-26 @617  		return ret;
b017a46d486cd4 Gil Fine        2022-05-26  618  
b017a46d486cd4 Gil Fine        2022-05-26  619  	ret = tb_port_tmu_set_unidirectional(up, sw->tmu.unidirectional_request);
b017a46d486cd4 Gil Fine        2022-05-26  620  	if (ret)
b017a46d486cd4 Gil Fine        2022-05-26  621  		goto out;
b017a46d486cd4 Gil Fine        2022-05-26  622  
b017a46d486cd4 Gil Fine        2022-05-26  623  	ret = tb_port_tmu_time_sync_enable(down);
b017a46d486cd4 Gil Fine        2022-05-26  624  	if (ret)
b017a46d486cd4 Gil Fine        2022-05-26  625  		goto out;
b017a46d486cd4 Gil Fine        2022-05-26  626  
b017a46d486cd4 Gil Fine        2022-05-26  627  	ret = tb_port_tmu_time_sync_enable(up);
b017a46d486cd4 Gil Fine        2022-05-26  628  	if (ret)
b017a46d486cd4 Gil Fine        2022-05-26  629  		goto out;
b017a46d486cd4 Gil Fine        2022-05-26  630  
b017a46d486cd4 Gil Fine        2022-05-26  631  	return 0;
b017a46d486cd4 Gil Fine        2022-05-26  632  
b017a46d486cd4 Gil Fine        2022-05-26  633  out:
c437dcb18310f2 Mika Westerberg 2022-10-07  634  	tb_switch_tmu_change_mode_prev(sw);
b017a46d486cd4 Gil Fine        2022-05-26  635  	return ret;
b017a46d486cd4 Gil Fine        2022-05-26  636  }
b017a46d486cd4 Gil Fine        2022-05-26  637  

:::::: The code at line 617 was first introduced by commit
:::::: b017a46d486cd4113b1856f3fd611f54cd0f9c03 thunderbolt: Add CL1 support for USB4 and Titan Ridge routers

:::::: TO: Gil Fine <gil.fine@intel.com>
:::::: CC: Mika Westerberg <mika.westerberg@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
