Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DAD70830
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Jan 2025 19:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736191170; cv=none; b=QD545ck8YSpEmeXjWvdCiPLObI3oDn+oAtWyaQKj/yU/hivNWlkuH8s7xdSjBUeXaxXhv6JCMLtsEb8avVz3DLlYt4LL/TIlhcbz3NqsuCSxLD3XxvjcA4vJpmnkX5gVF/Vl2/M/HB91dObUuHRyHkTtDzuDn9H7zgQ6yhCVJzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736191170; c=relaxed/simple;
	bh=NqxeICJG+lc7qpbQIxjsbK76rMz08+TrPFOY4Ankji0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A0ZU/frwg0kVDyyVEBvEkjlmd88rlrSrH8Sk1yldx8rRYmfGipgZoq/2oJTOIUXNkF04igNa6Obqc6Is11aGK5ffK0nWj0l/nY7eaovUC7ZjT4hqpALbLlQ+Hb7Y7ag56ipXboEq4MegyTl7L4PK4YOYWqYkMnPFkCcap5KkbbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VugyjlC3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VugyjlC3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736191169; x=1767727169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NqxeICJG+lc7qpbQIxjsbK76rMz08+TrPFOY4Ankji0=;
  b=VugyjlC3GCJymcHCZFH6ssnsZ4zVxgDvZ8w0TKzTmcDtAtOfB/WeI70W
   3AVAU1p/KpHH6kq4f0io9mcoM5qYE0I+YvRvu+b763eCxD7TpxnWjN57k
   B2SEcvL14mUM2IDYz79OcmSzYCD8uQKuq7gd4skM4xcIttTIKf2tyAx3z
   o8v7XNW3oaRC9F4Mop76WPANL0PK1QRad8+fSaMqi9PLRO8PEptzjGq8e
   L4nPusIB7YjZ0b63rrwE7VAZVJz3bZOIa+gHQqfv/2VhfNYhyYZ6jr+TB
   yn+OWQbMBiOuSZoQ9mZ97BpumZOiRj9iCAUmpmJoBmqiBLH/M7C4cprIT
   g==;
X-CSE-ConnectionGUID: VBC5gDR+S9masDSBBMGthQ==
X-CSE-MsgGUID: 3PyTUblASgqcLK2aE8Oyyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="53769641"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; 
   d="scan'208";a="53769641"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 11:19:29 -0800
X-CSE-ConnectionGUID: qAa8r1OKQpSCRJDh6NSGtg==
X-CSE-MsgGUID: W2H3w3y9RS68gjlw0/yblQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107595854"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Jan 2025 11:19:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUsdJ-000Dq9-1J;
	Mon, 06 Jan 2025 19:19:25 +0000
Date: Tue, 7 Jan 2025 03:19:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 3/191]
 arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spi@235104000: failed to
 match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
Message-ID: <202501070359.aGdWu6Z2-lkp@intel.com>
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
commit: 278e63ebefba3ddc5ee2ab969d4dcd575d16e1b8 [3/191] arm64: dts: apple: t8112: Add spi controller nodes
:::::: branch date: 34 hours ago
:::::: commit date: 6 weeks ago
config: arm64-randconfig-051-20250106 (https://download.01.org/0day-ci/archive/20250107/202501070359.aGdWu6Z2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501070359.aGdWu6Z2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501070359.aGdWu6Z2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: wifi@0,0: Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
--
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spi@235104000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: wifi@0,0: Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
