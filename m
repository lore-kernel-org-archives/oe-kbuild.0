Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231533164D3
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Jan 2026 15:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768923145; cv=none; b=X634N5dhjfymGEYtN2PEpA85RNw/a+adLxND4vMao8un6yvDvV+jFntenhriUxKxx9ZGEC8eEFs+jH45APb4hSOpMP3w+WV9CzqSMILXbJ+Cqx4RPoMF8mfiCQ8yHeqtGwWBrjRxQGk0IT400yzZMzDbAALbrepHUe4sLe0Z4rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768923145; c=relaxed/simple;
	bh=dgRzyho+z6bjRBMpHL+LBKq3eaWe9ypZnvd6gZAlJi0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dL0zAAx5oYEKnEQj4O6EJMc3LWXWGuskqdSAIZD5mhqSCc8J9aC6on9IVBxAozW9BT0EACaD844vPaEBqpntJmFDyQNSqHKXPyhpZr4q48Of9iDJgChQ84UbrjpluPMSZsQKjUZJnzqMp7oeCdkqtlKCkYssW8w+EqgOOHEElu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nrpQLuhi; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nrpQLuhi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768923144; x=1800459144;
  h=date:from:to:cc:subject:message-id;
  bh=dgRzyho+z6bjRBMpHL+LBKq3eaWe9ypZnvd6gZAlJi0=;
  b=nrpQLuhihchLpo/8yCm2GRD1tsGo99Tq5HrZLIy4YtyCYOxSGTHMje5E
   spzaCXeZU7ZTlvgFVUmiR0J8Ay9vUh1OZPHLD/g9GRdOh5LtnyghobeW6
   Hu8qx0zHebZfB9siiJeUBbgvspmaZctECpzNJuX7vFrIuB8tlX12pT2l6
   hl0oRK2ikjeAmOlD+YlK3tPz1rcPfm1/bRrDper8FVz97uj/m7KVwjpwo
   YWUtODgYF68bk3M7sgrxCuIPVOCAiZndKyJ83xV4KYtITSkYVUnglBxBs
   n9w8OARPhSYxWvduNl4RymbUEhK+Ob7UBbREHFZxetazHvwZIUhIfjr00
   A==;
X-CSE-ConnectionGUID: rXyqHCUdTzGhsORM8mzITg==
X-CSE-MsgGUID: X9eGP2mBQVWDphLnVRBOAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="95607578"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="95607578"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 07:32:22 -0800
X-CSE-ConnectionGUID: s7lgi96qRG2Bn9aFhQQsaw==
X-CSE-MsgGUID: 7GIMsh1WQv+/jOT/6FVDFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="210639521"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Jan 2026 07:32:21 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viDiM-00000000P7t-2uxx;
	Tue, 20 Jan 2026 15:32:18 +0000
Date: Tue, 20 Jan 2026 23:31:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1527/7987]
 drivers/clk/qcom/tcsrcc-kaanapali.c:140:1: sparse: sparse: bad integer
 constant expression
Message-ID: <202601202351.nPJHZS57-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/clk/qcom/tcsrcc-kaanapali.c:140:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Taniya Das <taniya.das@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Dmitry Baryshkov <lumag@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Abel Vesa <abel.vesa@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d08c85ac8894995d4b0d8fb48d2f6a3e53cd79ab
commit: e5682c953f5a9fbaad060ea000beff80f11c4048 [1527/7987] clk: qcom: Add TCSR clock driver for Kaanapali
:::::: branch date: 17 hours ago
:::::: commit date: 5 weeks ago
config: arc-randconfig-r134-20260120 (https://download.01.org/0day-ci/archive/20260120/202601202351.nPJHZS57-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601202351.nPJHZS57-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601202351.nPJHZS57-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/qcom/tcsrcc-kaanapali.c:140:1: sparse: sparse: bad integer constant expression
   drivers/clk/qcom/tcsrcc-kaanapali.c:140:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/clk/qcom/tcsrcc-kaanapali.c:141:1: sparse: sparse: bad integer constant expression
   drivers/clk/qcom/tcsrcc-kaanapali.c:141:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +140 drivers/clk/qcom/tcsrcc-kaanapali.c

e5682c953f5a9f Taniya Das 2025-12-09  139  
e5682c953f5a9f Taniya Das 2025-12-09 @140  MODULE_DESCRIPTION("QTI TCSR_CC Kaanapali Driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
