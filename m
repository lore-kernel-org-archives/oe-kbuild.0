Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA474502A
	for <oe-kbuild@lists.linux.dev>; Sat,  9 May 2026 17:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778347953; cv=none; b=CDo0E/zJXbL4QPVU2Xw0rMmFp68UEjFVpwsfiTKVP/2JkLBZirIcYDNA4gFWI9eBVbG/Pps1XKKtgOkNY60iG6uGLzPzBwDWq2cmHvdlwvfT/gXMWGEiHYrkgnE2zVTDb/SQskSiFyMYD5WJ7kvZYvwpNLaGcj9WBMaIRLn7TI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778347953; c=relaxed/simple;
	bh=mqhubj/RbXT+BK7bfJhXDPhTN45pq3Jv468AHQf5Sfo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BP21AKyIA56Hv/rlDY7QfJBOHTbzfW8fuaXGKrE/UV01x5pndB3WFTRWxhAsVBFW8Y1LWUhH06aqBra/ya2kWLkfJtYGn+UGyYpfvGwqUQQQ4nPY0sN6Gj7NsPb3paxEYtj3xiW1svmeSoLxWLlTT4ZD+vCk2hlyCSoqmlRsagE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UulAUsvw; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UulAUsvw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778347952; x=1809883952;
  h=date:from:to:cc:subject:message-id;
  bh=mqhubj/RbXT+BK7bfJhXDPhTN45pq3Jv468AHQf5Sfo=;
  b=UulAUsvwgyf1egRDhRLtEokaMVQ4ex4ugyiR2AMqqvb4BjIrycYmzi0J
   Mup560oWX3dPjL9VlXX+ZLDzSoqRba/YddM3Iq2pIhGgkHcXjuZnuKqlC
   Gaki/PX1sIqFJeCcu8pCqx9AYa9K5fcUHVrMgr19a0zNaWPbp3b6jEq6l
   KdNZG1hWDNv6T3SKFoHKGJ8witCyBrxNzKypX9TAEJyCSQCX/a/ElXxKK
   NBO8Jdkqdt6XoAVJ71y6pY5KZd1oIyyJ+eE8uGCsKWP2EppytnCKVusZ5
   HTQ2m6Mz43/KL9LZDpBspT7aKt5L1jnOQcfKciUJqW5n/h2RbxK+kp6SR
   w==;
X-CSE-ConnectionGUID: s9fyG900RmibX19E/DG5qQ==
X-CSE-MsgGUID: 1BQjzNJQSoSG6lDATJgBzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="79198854"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="79198854"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 10:32:32 -0700
X-CSE-ConnectionGUID: v200LHwTTzy1tJpYBDtylQ==
X-CSE-MsgGUID: 2QOkASspSiqkLfB6NUgD7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="260509656"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 09 May 2026 10:32:30 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLlXQ-000000007Wf-1Xf7;
	Sat, 09 May 2026 17:32:28 +0000
Date: Sat, 09 May 2026 19:32:13 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/140-pci 1/10]
 Documentation/devicetree/bindings/pci/apple,pcie.yaml: ^pci@: Missing
 additionalProperties/unevaluatedProperties constraint
Message-ID: <202605091956.XutyI70P-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Hector Martin <marcan@marcan.st>
CC: Janne Grunau <j@jannau.net>
CC: linux-doc@vger.kernel.org

tree:   https://github.com/AsahiLinux/linux bits/140-pci
head:   40b6ae2b4de91d0d903425309cdebea3def43c4b
commit: 68f278dcd853689f7df242464e7e831aa24c4038 [1/10] dt-bindings: pci: apple,pcie: Add subnode binding, pwren-gpios property
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: arc-randconfig-2051-20260509 (https://download.01.org/0day-ci/archive/20260509/202605091956.XutyI70P-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605091956.XutyI70P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605091956.XutyI70P-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/pci/apple,pcie.yaml: ^pci@: Missing additionalProperties/unevaluatedProperties constraint

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
