Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08232F0673
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Mar 2026 01:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773278073; cv=none; b=GAjs5i9L2KF99RADqy3QJIr+bp7XBpvtXrdIZtR9Tk/Vsrrt9YlEPwrqKHbzij2VOJCUzziWUF6lwRH4jSYEA78lwuzgwJkkJnBdMGDuo6MicDxj9fbkZHzVCC2iiZVXEWBp+wj1kAXkIFjMQ0fW1+3buwFoICaDns9sD05rJFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773278073; c=relaxed/simple;
	bh=yOmebJ17IpD9lUrVRZp3llyXaqUZk/y3OvgzuxVh/58=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GmzXqv1AsoFrrxSnaQvrQlfD48LM9K1OHTpW3sljGYLGnmu01A9t476heyrnMVdqWGKt0Vpoc84ZmIL/beBM4ZCh0iCVcFhZXFz22jtL22HrThvBNzJdf+xSnlqeGsDrG1AdjGAIb9abgd3Sr9t+ueUtXEaTyGXZuai2mrphRhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WWgKPxue; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WWgKPxue"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773278071; x=1804814071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yOmebJ17IpD9lUrVRZp3llyXaqUZk/y3OvgzuxVh/58=;
  b=WWgKPxueNBhmG1Apa6zJTftTW7apyweRHLA4AWLXvX/cI0ZkengdcqUV
   X9cVXiVKJigZs9AVnSosThSs54KZvb3gJIVvoPDxDzNGp/wpw6H4/9CEY
   RSWPYoCqvpg4RAuINosJilfugcr0mEFZo7MDzhQS5yjYRcv9z4PorrjcL
   fmzl7/RdlOFJ4+PSOEpo9927SS+q6LOt/x3VGQy0iqqjJoVepUsd5+MeH
   xlaMN6pccCOpYEm3WtVI/5EHOTfI+UEfrJedI6M/OdKg3iw2DMUHeoRK3
   8YqeKCjEd18cGJAFIkf9xhnEqzjGY+LN8w2kkP5/FCg6VM59OGjnPJkfx
   Q==;
X-CSE-ConnectionGUID: 7P1Un3z0SL62pkhoXJyxdw==
X-CSE-MsgGUID: XrZfd5cISBmPvMhY2wHs8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74478434"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="74478434"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 18:14:30 -0700
X-CSE-ConnectionGUID: KUbQLAd3Tf6WurSIHjGz2Q==
X-CSE-MsgGUID: QXlEL+nFTIqMG3mU8wrPuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="219923012"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Mar 2026 18:14:29 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0Ud8-000000001t9-2X1m;
	Thu, 12 Mar 2026 01:14:26 +0000
Date: Thu, 12 Mar 2026 09:13:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 -next 2/2] dpaa2: compile dpaa2 even
 CONFIG_FSL_DPAA2_ETH=n
Message-ID: <202603120913.RRbIUpUK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260309125018.420275-3-caixinchen1@huawei.com>
References: <20260309125018.420275-3-caixinchen1@huawei.com>
TO: Cai Xinchen <caixinchen1@huawei.com>
TO: ioana.ciornei@nxp.com
TO: andrew+netdev@lunn.ch
TO: davem@davemloft.net
TO: edumazet@google.com
TO: kuba@kernel.org
TO: pabeni@redhat.com
CC: netdev@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: caixinchen1@huawei.com

Hi Cai,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20260305]

url:    https://github.com/intel-lab-lkp/linux/commits/Cai-Xinchen/dpaa2-add-select-config-for-FSL_DPAA2_SWITCH/20260309-213339
base:   next-20260305
patch link:    https://lore.kernel.org/r/20260309125018.420275-3-caixinchen1%40huawei.com
patch subject: [PATCH v2 -next 2/2] dpaa2: compile dpaa2 even CONFIG_FSL_DPAA2_ETH=n
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260312/202603120913.RRbIUpUK-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260312/202603120913.RRbIUpUK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603120913.RRbIUpUK-lkp@intel.com/

All errors (new ones prefixed by >>):

   alpha-linux-ld: drivers/net/ethernet/freescale/dpaa2/dpaa2-switch.o: in function `dpaa2_switch_teardown_irqs':
>> (.text+0x14a4): undefined reference to `fsl_mc_free_irqs'
>> alpha-linux-ld: (.text+0x14ac): undefined reference to `fsl_mc_free_irqs'
   alpha-linux-ld: drivers/net/ethernet/freescale/dpaa2/dpaa2-switch.o: in function `dpaa2_switch_setup_dpbp':
>> (.text+0x1640): undefined reference to `fsl_mc_object_allocate'
>> alpha-linux-ld: (.text+0x166c): undefined reference to `fsl_mc_object_allocate'
>> alpha-linux-ld: (.text+0x16bc): undefined reference to `dpbp_open'
   alpha-linux-ld: (.text+0x16cc): undefined reference to `dpbp_open'
>> alpha-linux-ld: (.text+0x171c): undefined reference to `dpbp_reset'
   alpha-linux-ld: (.text+0x1724): undefined reference to `dpbp_reset'
>> alpha-linux-ld: (.text+0x176c): undefined reference to `dpbp_enable'
   alpha-linux-ld: (.text+0x1774): undefined reference to `dpbp_enable'
>> alpha-linux-ld: (.text+0x17c0): undefined reference to `dpbp_get_attributes'
   alpha-linux-ld: (.text+0x17c8): undefined reference to `dpbp_get_attributes'
>> alpha-linux-ld: (.text+0x1888): undefined reference to `dpbp_disable'
   alpha-linux-ld: (.text+0x1894): undefined reference to `dpbp_disable'
>> alpha-linux-ld: (.text+0x18b0): undefined reference to `dpbp_close'
   alpha-linux-ld: (.text+0x18bc): undefined reference to `dpbp_close'
>> alpha-linux-ld: (.text+0x18d0): undefined reference to `fsl_mc_object_free'
   alpha-linux-ld: (.text+0x18d8): undefined reference to `fsl_mc_object_free'
   alpha-linux-ld: drivers/net/ethernet/freescale/dpaa2/dpaa2-switch.o: in function `dpaa2_switch_setup_irqs':
>> (.text+0x1d48): undefined reference to `fsl_mc_allocate_irqs'
>> alpha-linux-ld: (.text+0x1d64): undefined reference to `fsl_mc_allocate_irqs'
   alpha-linux-ld: (.text+0x1fa0): undefined reference to `fsl_mc_free_irqs'
   alpha-linux-ld: (.text+0x1fac): undefined reference to `fsl_mc_free_irqs'
   alpha-linux-ld: drivers/net/ethernet/freescale/dpaa2/dpaa2-switch.o: in function `dpaa2_switch_drain_bp':
>> (.text+0x2fc4): undefined reference to `dpaa2_io_service_acquire'
>> alpha-linux-ld: (.text+0x2fd4): undefined reference to `dpaa2_io_service_acquire'
   alpha-linux-ld: drivers/net/ethernet/freescale/dpaa2/dpaa2-switch.o: in function `dpaa2_switch_add_bufs':
>> (.text+0x3200): undefined reference to `dpaa2_io_service_release'
>> alpha-linux-ld: (.text+0x3218): undefined reference to `dpaa2_io_service_release'
   alpha-linux-ld: drivers/net/ethernet/freescale/dpaa2/dpaa2-switch.o: in function `dpaa2_switch_ctrl_if_setup':
>> (.text+0x339c): undefined reference to `dpaa2_io_store_create'
>> alpha-linux-ld: (.text+0x33ac): undefined reference to `dpaa2_io_store_create'
>> alpha-linux-ld: (.text+0x33fc): undefined reference to `dpaa2_io_store_destroy'
   alpha-linux-ld: (.text+0x3400): undefined reference to `dpaa2_io_store_destroy'
   alpha-linux-ld: (.text+0x3448): undefined reference to `dpaa2_io_service_register'
   alpha-linux-ld: (.text+0x3464): undefined reference to `dpaa2_io_service_register'
   alpha-linux-ld: (.text+0x34d4): undefined reference to `dpaa2_io_service_deregister'
   alpha-linux-ld: (.text+0x34e4): undefined reference to `dpaa2_io_service_deregister'
   alpha-linux-ld: (.text+0x3528): undefined reference to `dpaa2_io_service_deregister'
   alpha-linux-ld: (.text+0x3530): undefined reference to `dpaa2_io_service_deregister'
   alpha-linux-ld: (.text+0x35e0): undefined reference to `dpaa2_io_service_deregister'
   alpha-linux-ld: drivers/net/ethernet/freescale/dpaa2/dpaa2-switch.o:(.text+0x35e4): more undefined references to `dpaa2_io_service_deregister' follow
   alpha-linux-ld: drivers/net/ethernet/freescale/dpaa2/dpaa2-switch.o: in function `dpaa2_switch_ctrl_if_setup':
   (.text+0x3610): undefined reference to `dpaa2_io_store_destroy'
   alpha-linux-ld: (.text+0x3614): undefined reference to `dpaa2_io_store_destroy'
   alpha-linux-ld: (.text+0x3624): undefined reference to `dpaa2_io_store_destroy'
   alpha-linux-ld: (.text+0x3628): undefined reference to `dpaa2_io_store_destroy'
   alpha-linux-ld: (.text+0x3640): undefined reference to `dpbp_disable'
   alpha-linux-ld: (.text+0x3648): undefined reference to `dpbp_disable'
   alpha-linux-ld: (.text+0x3660): undefined reference to `dpbp_close'
   alpha-linux-ld: (.text+0x3668): undefined reference to `dpbp_close'
   alpha-linux-ld: (.text+0x3678): undefined reference to `fsl_mc_object_free'
   alpha-linux-ld: (.text+0x367c): undefined reference to `fsl_mc_object_free'
   alpha-linux-ld: drivers/net/ethernet/freescale/dpaa2/dpaa2-switch.o: in function `dpaa2_switch_poll':
   (.text+0x459c): undefined reference to `dpaa2_io_service_pull_fq'
   alpha-linux-ld: (.text+0x45a0): undefined reference to `dpaa2_io_service_pull_fq'
   alpha-linux-ld: (.text+0x4684): undefined reference to `dpaa2_io_store_next'
   alpha-linux-ld: (.text+0x468c): undefined reference to `dpaa2_io_store_next'
   alpha-linux-ld: (.text+0x4790): undefined reference to `dpaa2_io_service_rearm'
   alpha-linux-ld: (.text+0x479c): undefined reference to `dpaa2_io_service_rearm'
   alpha-linux-ld: drivers/net/ethernet/freescale/dpaa2/dpaa2-switch.o: in function `dpaa2_switch_port_tx':
   (.text+0x4ce4): undefined reference to `dpaa2_io_service_enqueue_qd'
   alpha-linux-ld: (.text+0x4cfc): undefined reference to `dpaa2_io_service_enqueue_qd'
   alpha-linux-ld: drivers/net/ethernet/freescale/dpaa2/dpaa2-switch.o: in function `dpaa2_switch_teardown':
   (.text+0x5444): undefined reference to `dpaa2_io_service_deregister'
   alpha-linux-ld: (.text+0x5448): undefined reference to `dpaa2_io_service_deregister'
   alpha-linux-ld: (.text+0x5460): undefined reference to `dpaa2_io_service_deregister'
   alpha-linux-ld: (.text+0x5464): undefined reference to `dpaa2_io_service_deregister'
   alpha-linux-ld: (.text+0x5474): undefined reference to `dpaa2_io_store_destroy'
   alpha-linux-ld: (.text+0x5478): undefined reference to `dpaa2_io_store_destroy'
   alpha-linux-ld: (.text+0x5488): undefined reference to `dpaa2_io_store_destroy'
   alpha-linux-ld: (.text+0x548c): undefined reference to `dpaa2_io_store_destroy'
   alpha-linux-ld: (.text+0x54b8): undefined reference to `dpbp_disable'
   alpha-linux-ld: (.text+0x54c0): undefined reference to `dpbp_disable'
   alpha-linux-ld: (.text+0x54d8): undefined reference to `dpbp_close'
   alpha-linux-ld: (.text+0x54e0): undefined reference to `dpbp_close'
   alpha-linux-ld: (.text+0x54f0): undefined reference to `fsl_mc_object_free'
   alpha-linux-ld: (.text+0x54f4): undefined reference to `fsl_mc_object_free'
   alpha-linux-ld: drivers/net/ethernet/freescale/dpaa2/dpaa2-switch.o: in function `dpaa2_switch_remove':
   (.text+0x56bc): undefined reference to `fsl_mc_portal_free'
   alpha-linux-ld: (.text+0x56c0): undefined reference to `fsl_mc_portal_free'
   alpha-linux-ld: drivers/net/ethernet/freescale/dpaa2/dpaa2-switch.o: in function `dpaa2_switch_port_connect_mac':
   (.text+0x580c): undefined reference to `fsl_mc_get_endpoint'
   alpha-linux-ld: (.text+0x582c): undefined reference to `fsl_mc_get_endpoint'
   alpha-linux-ld: (.text+0x5858): undefined reference to `fsl_mc_bus_dpmac_type'
   alpha-linux-ld: drivers/net/ethernet/freescale/dpaa2/dpaa2-switch.o: in function `dpaa2_switch_probe':
   (.text+0x79e8): undefined reference to `fsl_mc_portal_allocate'
   alpha-linux-ld: (.text+0x79f0): undefined reference to `fsl_mc_portal_allocate'
   alpha-linux-ld: (.text+0x7f08): undefined reference to `fsl_mc_portal_free'
   alpha-linux-ld: (.text+0x7f0c): undefined reference to `fsl_mc_portal_free'
   alpha-linux-ld: drivers/net/ethernet/freescale/dpaa2/dpaa2-switch.o: in function `dpaa2_switch_driver_init':
   (.init.text+0xc): undefined reference to `__fsl_mc_driver_register'
   alpha-linux-ld: (.init.text+0x34): undefined reference to `__fsl_mc_driver_register'
   alpha-linux-ld: (.init.text+0x134): undefined reference to `fsl_mc_driver_unregister'
   alpha-linux-ld: (.init.text+0x13c): undefined reference to `fsl_mc_driver_unregister'
   alpha-linux-ld: drivers/net/ethernet/freescale/dpaa2/dpsw.o: in function `dpsw_open':
   (.text+0x10): undefined reference to `mc_send_command'
   alpha-linux-ld: (.text+0x64): undefined reference to `mc_send_command'
   alpha-linux-ld: drivers/net/ethernet/freescale/dpaa2/dpsw.o: in function `dpsw_close':
   (.text+0xd4): undefined reference to `mc_send_command'
   alpha-linux-ld: (.text+0x124): undefined reference to `mc_send_command'
   alpha-linux-ld: drivers/net/ethernet/freescale/dpaa2/dpsw.o: in function `dpsw_enable':
   (.text+0x194): undefined reference to `mc_send_command'
   alpha-linux-ld: drivers/net/ethernet/freescale/dpaa2/dpsw.o:(.text+0x1e4): more undefined references to `mc_send_command' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
