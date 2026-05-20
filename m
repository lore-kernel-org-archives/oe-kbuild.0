Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5C836CE14
	for <oe-kbuild@lists.linux.dev>; Wed, 20 May 2026 04:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779250114; cv=none; b=XPDYK6zlVvfXV+4Pbx27ILvVPyKvb7lAV+v1YjbELWPExG9YP18BSU8j0jSRJv/ygCSO2BGO4dlyg70gYhGCzt6MAnfUoMSLDdruArmLZ5UrF9XbNvUvJ0P0uIwmFkWmzrk2KNC3JkGh1lcwUbNjfLfWiHtifbwAfJ9xZY3RaW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779250114; c=relaxed/simple;
	bh=Of229JuY4sucpvqxCnFoDAL2Hm9U25nX+rjLlxDpQiI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OeIFr3o43+oaUhZQDuNDMneJJIG9JChkqDhvcWDXzNnhrL+XE/tEg7G+2Yv8uUT63/vQxcWgHOGP1JCkzYEUKkGBu0WBwP4iYHWJasMUTmvksuercsklQfsKItqUtZeLKTIxf2OtUJYSqfDQipav7DC4m/k3q+RBXIrX7LQ/8gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PGtf7XIQ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PGtf7XIQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779250111; x=1810786111;
  h=date:from:to:cc:subject:message-id;
  bh=Of229JuY4sucpvqxCnFoDAL2Hm9U25nX+rjLlxDpQiI=;
  b=PGtf7XIQ3+ROhh5ogkVPGqHFKfoMUxuocX7byXPRf/NuJMB/J64HbpIG
   YD87D25edcKnqJLrJABlzX34HKOMjv5BZrx4J0OEfz10X976aiIdfGhbt
   dU0ItoPu5MYJVPxQDy+tD2JKufUGofCRYGXjc37jyLdKv1pNGJJBnzSaa
   N4Ma9OUo8FssXX0vb3ptUJW2FEC13pTuR+UT7IbPpPd537jheLboMl9cW
   QM3JAgd43Tn62c1khzXIh2k3Vpry/pWGePXmb+ARebEc00VWH/W734uam
   BHJje2Nv8SDFvOOg4bkZGK+ca9ByR2MSUZ5HRva+PtTG+1ga3JwzcHsfd
   Q==;
X-CSE-ConnectionGUID: H5NSuh70RkeNz1ZoFCss4Q==
X-CSE-MsgGUID: hJcS30sOTqmp5PqNtZ6rcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="80042711"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="80042711"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 21:08:30 -0700
X-CSE-ConnectionGUID: mepI6GqLR36c4nsOHZGn9A==
X-CSE-MsgGUID: qoQN5vWvTjKbpNf2QUi2Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="278116606"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 19 May 2026 21:08:29 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPYEM-00000000AQf-3bFH;
	Wed, 20 May 2026 04:08:26 +0000
Date: Wed, 20 May 2026 06:08:26 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 8/114]
 arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spi@23510c000/hid-transport@0:
 failed to match any schema with compatible: ['apple,spi-hid-transport']
Message-ID: <202605200629.ISwmf6KE-lkp@intel.com>
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
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   2d563843e07af55de0249a409021af705f586961
commit: 74f6e723573daa18159aeebabf858115d10377f7 [8/114] arm64: dts: apple: t8103: Add spi3 keyboard node
:::::: branch date: 6 days ago
:::::: commit date: 11 days ago
config: arm64-randconfig-2055-20260516 (https://download.01.org/0day-ci/archive/20260520/202605200629.ISwmf6KE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605200629.ISwmf6KE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605200629.ISwmf6KE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spi@23510c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
--
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/spi@23510c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
