Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9A93596C
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Jan 2025 03:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736220349; cv=none; b=lkU9Zg+SUEvj4do/4jTlzCc7B2gFxj8zMf0IiKl0tNuLFiFmOqQ+ocGpUl1ljdNxdGM/50s2+sf7Az7odWrN8EkZ1EuSRUdnp/FkUblt6HAEkkyVB228g0B0BQJuCt7+fDAI6czPF464nFYUy1ZoDiy9G5q6ZZaWZFpCJBjnj0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736220349; c=relaxed/simple;
	bh=WIcVdGMXMzH7dMOhpA50oYRIFqt5LqpmJ7cnhUU9nTg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z4h2IbSbNTK+9qR+TmrlS5qR9OiZZfy0OLzzoPJRSldibn6k0iQ3+iBl4o/uNcgrcRozYwz+Sof2oF9VECQm8dnqDrRgwEFbdPlPR85WNDjmNCIO3KmuSDKF4UuenBao9zpl4i5AT2/UMGE3yHskKmVYWpJCZHnCsWJz0bmRCPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EnFQ+4xd; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EnFQ+4xd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736220347; x=1767756347;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WIcVdGMXMzH7dMOhpA50oYRIFqt5LqpmJ7cnhUU9nTg=;
  b=EnFQ+4xdR49mdTDFqPtM7CS0dMRLgc10+RLFZHx7WFJUoZkwV12N5J9w
   6PQS8XwRa5wwNnTQ8arSJj4Rxzv9o8AbTmuhcaFze2ht53oA5DQvpenN0
   rHa7a7oXc/ds5vOBzKIDGc1yPjWxT1/TT0T2PIMtiIGKzFFekw9hXaH+X
   Hba9fqX7lmUNE22EhI36h9Jwn4V1b6WDgjXWZ8+95Jjm3wzx3NIjR9NPd
   XwoThST+kJm/JyqFn1NLwSqCzGklNJA1zK2+NN1Zocvrlhq9JitbaiDzT
   dLfEPxWSccZN8iDqL/aSEguAWRu2DRj5m43gWjBSD3tIJoIubxBn5UZSD
   Q==;
X-CSE-ConnectionGUID: gBK6LnbfRZ62kuDZW+0Q5A==
X-CSE-MsgGUID: 5bRkHP1KR/2dDNRri71xvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="53805138"
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="53805138"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 19:25:46 -0800
X-CSE-ConnectionGUID: GJwzJSQISE6VTXn6DdBhxg==
X-CSE-MsgGUID: o9xGV8uRTVOHER2lftNtWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106666850"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Jan 2025 19:25:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tV0Du-000EBP-2P;
	Tue, 07 Jan 2025 03:25:42 +0000
Date: Tue, 7 Jan 2025 11:24:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 4/191]
 arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/spi@39b104000: failed to
 match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
Message-ID: <202501071101.cE5F4ggc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   3579121c157a4c56e00b67dbb6eb45d963046590
commit: be9695ea66f062940c27096ee51cbea2a67d47d4 [4/191] arm64: dts: apple: t600x: Add spi controller nodes
:::::: branch date: 2 days ago
:::::: commit date: 6 weeks ago
config: arm64-randconfig-051-20250106 (https://download.01.org/0day-ci/archive/20250107/202501071101.cE5F4ggc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501071101.cE5F4ggc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501071101.cE5F4ggc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/spi@39b10c000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/spi@39b10c000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
--
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/spi@39b10c000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/spi@39b10c000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
--
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/spi@39b10c000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/spi@39b10c000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
--
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/spi@39b10c000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/spi@39b10c000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
--
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/spi@39b104000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/spi@39b10c000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/spi@39b10c000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
--
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/spi@39b104000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/spi@39b104000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/spi@39b10c000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/spi@39b10c000: failed to match any schema with compatible: ['apple,t6000-spi', 'apple,spi']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
