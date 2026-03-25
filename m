Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F763D16F8
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Mar 2026 11:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774439734; cv=none; b=cwm0/KtN++YFuPEYMqYyqXrGTvkwOox7zs2p+94mSBrHKmGsi7Q9yUWoQrNT2vPgGNdH1yxQ83gFqeYLRGD6rUUi5X8HhS4REE/V0jd/bA79F+3mJMVG39fjRHqIDKuWgf6snZt78jnP7hE1/YQE7h1URVddQB0sVcbq4sRJp3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774439734; c=relaxed/simple;
	bh=+YgxvtfEKMqYXyxOyH36Ph7suhIUsS6nLWc7R/n+FVA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fu6GhuhQsSGH1PQ6GJfz32HQo6i/ltPEpTB4M4O0onN6ejiMq2pdWbKoeP48sfeO6koqMqJQIIrHn2yq0+4e55epLh3Uy5IPLg7ITps1ZtW+xZT38UciBer/bTYUK2Ec7H1pigViaM/GrpXJbeYdZwxWjRQxP3Xh+ZwjRHUz+1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XJeESM2Z; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XJeESM2Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774439732; x=1805975732;
  h=date:from:to:cc:subject:message-id;
  bh=+YgxvtfEKMqYXyxOyH36Ph7suhIUsS6nLWc7R/n+FVA=;
  b=XJeESM2ZXNDxTMkmW9Zj2+RCuLxuGbPtcY7VUx2r+Ur8fB5/lyJwdVUB
   YFYmCm0D5ybPBkHDyNoLng1mza5m/W7pp1x4ZLn8KrFHvvPiyeBTbd1rL
   7GU44vZ22Y76MUT4dYCYMNbNnavsW2hAtchDxcCAaxitSwOUVLttnDFWK
   VQfWzVvHbRFsb7q0MgFHaM5SU47mcB2FpTUDZaTSMXbIjVZ0MtrkG98Ty
   Ov6LRKezHPHIoEHyHK/ZyZl1wJE861tEbDtRn5uxBsXfJgf5Y7G3jlfO8
   KgQZGx2oIdFRBuMzTQCPryex6CDYJGwTUJAFv3Ef+9qP6LOa+TitJEVYX
   w==;
X-CSE-ConnectionGUID: 84p5ryKUQ5G2EgbG8/alAA==
X-CSE-MsgGUID: NIWDKBraRwywC/7JTys6tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86551093"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="86551093"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 04:55:31 -0700
X-CSE-ConnectionGUID: s7/qKjNUS9SMa2vG+ms4tQ==
X-CSE-MsgGUID: qF4UbWvaQoeGhBkhjR6EYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="248179868"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Mar 2026 04:55:30 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5Mpc-000000006lV-11q6;
	Wed, 25 Mar 2026 11:55:28 +0000
Date: Wed, 25 Mar 2026 19:55:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/firmware/thead,th1520-aon.c:174
 th1520_aon_power_update() error: buffer overflow 'data' 2 <= 3
Message-ID: <202603251917.9rxYz4kf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Michal Wilczynski <m.wilczynski@samsung.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bbeb83d3182abe0d245318e274e8531e5dd7a948
commit: e4b3cbd840e565484d0ad8d260d27c057466ed17 firmware: thead: Add AON firmware protocol driver
date:   1 year ago
:::::: branch date: 12 hours ago
:::::: commit date: 1 year ago
config: riscv-randconfig-r073-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251917.9rxYz4kf-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603251917.9rxYz4kf-lkp@intel.com/

New smatch warnings:
drivers/firmware/thead,th1520-aon.c:174 th1520_aon_power_update() error: buffer overflow 'data' 2 <= 3

Old smatch warnings:
drivers/firmware/thead,th1520-aon.c:174 th1520_aon_power_update() error: buffer overflow 'data' 2 <= 2
drivers/firmware/thead,th1520-aon.c:221 th1520_aon_init() error: dereferencing freed memory 'aon_chan' (line 220)

vim +/data +174 drivers/firmware/thead,th1520-aon.c

e4b3cbd840e5654 Michal Wilczynski 2025-03-11  143  
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  144  /**
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  145   * th1520_aon_power_update() - Change power state of a resource via TH1520 AON
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  146   * @aon_chan: Pointer to the AON channel structure
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  147   * @rsrc: Resource ID whose power state needs to be updated
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  148   * @power_on: Boolean indicating whether the resource should be powered on (true)
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  149   *            or powered off (false)
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  150   *
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  151   * This function requests the TH1520 AON subsystem to set the power mode of the
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  152   * given resource (@rsrc) to either on or off. It constructs the message in
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  153   * `struct th1520_aon_msg_req_set_resource_power_mode` and then invokes
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  154   * th1520_aon_call_rpc() to make the request. If the AON call fails, an error
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  155   * message is logged along with the specific return code.
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  156   *
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  157   * Return:
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  158   * * 0 on success
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  159   * * A negative error code in case of failures (propagated from
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  160   *   th1520_aon_call_rpc()).
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  161   */
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  162  int th1520_aon_power_update(struct th1520_aon_chan *aon_chan, u16 rsrc,
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  163  			    bool power_on)
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  164  {
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  165  	struct th1520_aon_msg_req_set_resource_power_mode msg = {};
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  166  	struct th1520_aon_rpc_msg_hdr *hdr = &msg.hdr;
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  167  	int ret;
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  168  
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  169  	hdr->svc = TH1520_AON_RPC_SVC_PM;
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  170  	hdr->func = TH1520_AON_PM_FUNC_SET_RESOURCE_POWER_MODE;
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  171  	hdr->size = TH1520_AON_RPC_MSG_NUM;
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  172  
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  173  	RPC_SET_BE16(&msg.resource, 0, rsrc);
e4b3cbd840e5654 Michal Wilczynski 2025-03-11 @174  	RPC_SET_BE16(&msg.resource, 2,
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  175  		     (power_on ? TH1520_AON_PM_PW_MODE_ON :
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  176  				 TH1520_AON_PM_PW_MODE_OFF));
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  177  
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  178  	ret = th1520_aon_call_rpc(aon_chan, &msg);
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  179  	if (ret)
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  180  		dev_err(aon_chan->cl.dev, "failed to power %s resource %d ret %d\n",
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  181  			power_on ? "up" : "off", rsrc, ret);
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  182  
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  183  	return ret;
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  184  }
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  185  EXPORT_SYMBOL_GPL(th1520_aon_power_update);
e4b3cbd840e5654 Michal Wilczynski 2025-03-11  186  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
