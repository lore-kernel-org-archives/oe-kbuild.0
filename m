Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDB02E8DE3
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Oct 2026 06:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790922452; cv=none; b=IVtLuru3vExhJ1uu5S8O9OihS9iKtO1W13g10lJw4Ra60HbKNXSloZBD/kABuQ8knpTWlzOMS1tXTnR6f2799/Q2iTL1qXXA6tkvSP7X9wi0paF+3UDGOjAR+NTaW9TxQ5lXusKgXIwLImD90rIHlU+muJ9c5lUVljMlFhbb73s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790922452; c=relaxed/simple;
	bh=gBmX54bImiXQ3th8xNmtGrYsFa8QFZTJnoiFzHP9fKg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iRCF6hd2eYV4X76pONYUQlnlRQEm2vQfZVX0Ydddik8ZuZJy5E0FgJS4uqUp3sja6Y7ktEo+BoEp6OlyDygXw9aJb4LS6Gsc4j5RaSXQhl7CBEEOgUZ/dNl77O4k3WGWC/mJU/idFcPc7HL6+o0NNp+eAwifk7YF9UlIVaeQfAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O2WUHdDn; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O2WUHdDn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790922451; x=1822458451;
  h=date:from:to:cc:subject:message-id;
  bh=gBmX54bImiXQ3th8xNmtGrYsFa8QFZTJnoiFzHP9fKg=;
  b=O2WUHdDnXv1iuT5GfZnanIZmOu4b+iI6tV2sjLNeZ3b+N9V9zk/kCm3Q
   yZRfuNm7h+wlhvh283ffLSLn3PwI73oFME5kmjc8crAfv1PJfVlnlCogr
   /4+q9MQSytse6K7RjgQ5colaUwIor4EzJ1CLeA31aHrO9cJs/kTN/VFSQ
   tejoHMZRNtkGagFxm0kMWhLVKA7IM/iLPWGNDr7Q0zUWZUdCq6K9ziH3q
   azKUi5vY61XVatKSacxcoVkUGKmx+qQFqae2k5gdKjaO2JnvhcohFQdcF
   1f+oYkeUhCGjktAg7LS1yycHA5ZNKE3LeOfxa75vqbE0UP5UVe9Lk0wSd
   A==;
X-CSE-ConnectionGUID: dlcxjZcOSC+UjrsvCi5byw==
X-CSE-MsgGUID: 4UdU5xGrTjiPEkTB8HkLuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="101850144"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="101850144"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 23:27:31 -0700
X-CSE-ConnectionGUID: tw9jLdSSRV6+TF6KAQ1m4Q==
X-CSE-MsgGUID: 4M39m3KJRVisVpQfnzC1Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="274265491"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Oct 2026 23:27:30 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCWjv-00000000ShE-1vWL;
	Fri, 02 Oct 2026 06:27:27 +0000
Date: Fri, 02 Oct 2026 14:26:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Warning: drivers/tee/qcomtee/call.c:205 function parameter
 'oic' not described in 'qcomtee_params_to_args'
Message-ID: <202610021436.HDQInaZk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Harshal-Dev/tee-qcomtee-Track-the-object-invocation-context/20261001-163233, commit: 571ae3850d0efea9b1d925385c6b44d4cb639d8e"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
CC: 0day robot <lkp@intel.com>
CC: Harshal Dev <harshal.dev@oss.qualcomm.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Harshal-Dev/tee-qcomtee-Track-the-object-invocation-context/20261001-163233
head:   b59502937f7cb9085e9c5daf5541dc8f0e1286dc
commit: 571ae3850d0efea9b1d925385c6b44d4cb639d8e tee: qcomtee: Allow object invokes from kernel clients
date:   19 hours ago
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20261002/202610021436.HDQInaZk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021436.HDQInaZk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610021436.HDQInaZk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/tee/qcomtee/call.c:205 function parameter 'oic' not described in 'qcomtee_params_to_args'
>> Warning: drivers/tee/qcomtee/call.c:205 Excess function parameter 'ctx' description in 'qcomtee_params_to_args'
>> Warning: drivers/tee/qcomtee/call.c:279 function parameter 'oic' not described in 'qcomtee_params_from_args'
>> Warning: drivers/tee/qcomtee/call.c:279 Excess function parameter 'ctx' description in 'qcomtee_params_from_args'
   Warning: drivers/tee/qcomtee/call.c:408 function parameter 'origin' not described in 'qcomtee_object_invoke'
>> Warning: drivers/tee/qcomtee/call.c:205 function parameter 'oic' not described in 'qcomtee_params_to_args'
>> Warning: drivers/tee/qcomtee/call.c:205 Excess function parameter 'ctx' description in 'qcomtee_params_to_args'
>> Warning: drivers/tee/qcomtee/call.c:279 function parameter 'oic' not described in 'qcomtee_params_from_args'
>> Warning: drivers/tee/qcomtee/call.c:279 Excess function parameter 'ctx' description in 'qcomtee_params_from_args'
   Warning: drivers/tee/qcomtee/call.c:408 function parameter 'origin' not described in 'qcomtee_object_invoke'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
