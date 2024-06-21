Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C994912BF3A
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Jun 2024 04:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718944049; cv=none; b=FlRTvkYfVL9xHaHS4KXu/8VvlBFPYYNDWMHSz7QPgxSGYxJKkUyItmcDZ46q56yDApsVhQbjNiEi2XRkUeWkftvU4xGbn5y4KEdPT9Gd/0gABVRuG2W4gHzK4epzTgmgVMqoLKJL8runtehwFTOKKIcUlIBOy9G97pJjpx8DvRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718944049; c=relaxed/simple;
	bh=zyLAS/Q0plgy1g8o3bfALlQ3buWrNrUNhos2LUght3w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S6gmL8F6yxNw/wiFVRZjF4sERHMHt5E4S6kDk4UrmB8xywb9dnvaeEAz0ZwhQW+Wg4aebcsvfYq9Icz7oqWnkA9YuMndDfXUn5QhzC/gdy6Q24XbIXMu/9GOOs0QNDJ423pxy/X74S5eNqEGlc11NO9kih62DVvQnCYbmK/GbTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PkjwYN23; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PkjwYN23"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718944046; x=1750480046;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zyLAS/Q0plgy1g8o3bfALlQ3buWrNrUNhos2LUght3w=;
  b=PkjwYN23gw/eguRxVHYKBwOiuFTo7v5YyD/r/njFJSQhOfVwGiD/oJzU
   /H1ww+petPZMuCuWETpStroWyZyzHzYaLF54pxmst5YKY3tixxevRctto
   kAAfSL2RlXDCcd6HYnCNXo9K8d9ffU4ckuYI0WyxP1fzXCEgtf5XBvV6C
   7XadFMv3RvopzAqsK1ejLepdOyI6kF4U1Tg8dLFVcgSrDTwYgMVkZE2qP
   fZHXaSmO2/grYXhXGFIportXFn8O39RTQ+oAnseWWUmzS4RsWpmQC5jAL
   nyND1Eb5u+dnIbKZSymaTt5sWsZw2D1wRafA+D6IeG4hexWSxe0xZeNjL
   g==;
X-CSE-ConnectionGUID: 4HrErKJNQFGrPwz2EkxjXA==
X-CSE-MsgGUID: StfYs3MhRYWofv1fVZ+vmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="16079681"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="16079681"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 21:27:25 -0700
X-CSE-ConnectionGUID: 9UrQilVLTyKdn/pGfkc24w==
X-CSE-MsgGUID: 2tb/ewmoSYefNsbq1crChQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="43144997"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Jun 2024 21:27:24 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKVrt-0008DW-2s;
	Fri, 21 Jun 2024 04:27:21 +0000
Date: Fri, 21 Jun 2024 12:27:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next v6 9/9] ethtool: Add ability to flash
 transceiver modules' firmware
Message-ID: <202406211244.fPBtKk4s-lkp@intel.com>
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
In-Reply-To: <20240619121727.3643161-10-danieller@nvidia.com>
References: <20240619121727.3643161-10-danieller@nvidia.com>
TO: Danielle Ratson <danieller@nvidia.com>

Hi Danielle,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Danielle-Ratson/ethtool-Add-ethtool-operation-to-write-to-a-transceiver-module-EEPROM/20240619-202527
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240619121727.3643161-10-danieller%40nvidia.com
patch subject: [PATCH net-next v6 9/9] ethtool: Add ability to flash transceiver modules' firmware
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20240620 (https://download.01.org/0day-ci/archive/20240621/202406211244.fPBtKk4s-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406211244.fPBtKk4s-lkp@intel.com/

New smatch warnings:
net/ethtool/module.c:208 module_flash_fw_work_list_add() warn: inconsistent returns '&module_fw_flash_work_list_lock'.

Old smatch warnings:
net/ethtool/module.c:461 ethnl_module_fw_flash_ntf_put_err() warn: passing zero to 'PTR_ERR'

vim +208 net/ethtool/module.c

d55d0c47876a6d Danielle Ratson 2024-06-19  190  
d55d0c47876a6d Danielle Ratson 2024-06-19  191  static int
d55d0c47876a6d Danielle Ratson 2024-06-19  192  module_flash_fw_work_list_add(struct ethtool_module_fw_flash *module_fw,
d55d0c47876a6d Danielle Ratson 2024-06-19  193  			      struct genl_info *info)
d55d0c47876a6d Danielle Ratson 2024-06-19  194  {
d55d0c47876a6d Danielle Ratson 2024-06-19  195  	struct ethtool_module_fw_flash *work;
d55d0c47876a6d Danielle Ratson 2024-06-19  196  
d55d0c47876a6d Danielle Ratson 2024-06-19  197  	/* First, check if already registered. */
d55d0c47876a6d Danielle Ratson 2024-06-19  198  	spin_lock(&module_fw_flash_work_list_lock);
d55d0c47876a6d Danielle Ratson 2024-06-19  199  	list_for_each_entry(work, &module_fw_flash_work_list, list) {
d55d0c47876a6d Danielle Ratson 2024-06-19  200  		if (work->fw_update.ntf_params.portid == info->snd_portid &&
d55d0c47876a6d Danielle Ratson 2024-06-19  201  		    work->fw_update.dev == module_fw->fw_update.dev)
d55d0c47876a6d Danielle Ratson 2024-06-19  202  			return -EALREADY;
d55d0c47876a6d Danielle Ratson 2024-06-19  203  	}
d55d0c47876a6d Danielle Ratson 2024-06-19  204  
d55d0c47876a6d Danielle Ratson 2024-06-19  205  	list_add_tail(&module_fw->list, &module_fw_flash_work_list);
d55d0c47876a6d Danielle Ratson 2024-06-19  206  	spin_unlock(&module_fw_flash_work_list_lock);
d55d0c47876a6d Danielle Ratson 2024-06-19  207  
d55d0c47876a6d Danielle Ratson 2024-06-19 @208  	return 0;
d55d0c47876a6d Danielle Ratson 2024-06-19  209  }
d55d0c47876a6d Danielle Ratson 2024-06-19  210  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
