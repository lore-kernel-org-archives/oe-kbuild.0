Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5290919ABA3
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Dec 2024 16:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735575797; cv=none; b=Jy1m9l0Qqbw3AFQ5wsFKwkNhs15QqhULhsatP2ojkzKy4QWzNQf0zF684VsK7S0ceq32OU02ry2t7wGF6inN538FLibzwNmS6FCoI/b2/eMsD0FMks9MfTJ5AEJpZGJ2Hh3ESPiCi3DXEp/3+wMduem9X+HgrlsW0pJTf8Nfet4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735575797; c=relaxed/simple;
	bh=rBT+XlsMg7qRCfKMKal8AfdAeFyxGihKL032S8DW1aY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NK6k5wVbE8CwktRx3tYNTjYKNp2BsOARKVIhb2Qc7ofjsN27tvbJ35YkWIOxK6T/WoHjooB9e4koZ477IHoBV7kDPSHQiKrXzlq8NwDBIp6spxlfILWNvZefEjCxmN62sPVUaMpeot2HhDNwq52D+0n26p0vvT0zw1xF4qC4Xj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bz2VAD9B; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bz2VAD9B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735575794; x=1767111794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rBT+XlsMg7qRCfKMKal8AfdAeFyxGihKL032S8DW1aY=;
  b=Bz2VAD9BVEFv1kbwrxc8sjAtPfBM25qPwhkoJlJHuCWjV6xIvb4MKs//
   naQbIr+FzEw2cvDjzKn6tivckSjmtKs4AYUBuTJT7dNy5oIYfVFaacjFT
   p4PMC5UunHqfM0HaOUc2+MojAsaduCaGNn4ej/DAHK2HU9CMLMPo/4b7t
   kUZDwFwwmXGKvrATMeZkPs7o52uWzf1JXg7dqbxYIYAeUPMs25RyP9TS4
   72onDohT6nAS3QQaMoQq+DOUU3Jf2QQeRF+If/7+JFBThpHi+LhtAJh2Z
   vOhctgpQKZTu1I2GYzoztmgO2H4xEMAhxSeYPtN51w5VEOUgmWz5mfIuC
   A==;
X-CSE-ConnectionGUID: fBc9PRkjT5iPqn3i0u2XEA==
X-CSE-MsgGUID: 1yuj2t/ESyWQ6sTR/x1UfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="35887026"
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; 
   d="scan'208";a="35887026"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 08:23:14 -0800
X-CSE-ConnectionGUID: MK8YPPwXSdmzSJvxmro1ew==
X-CSE-MsgGUID: pb10oxYOTwGUPgvYU89dvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; 
   d="scan'208";a="105814147"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Dec 2024 08:23:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSIXu-0006BQ-25;
	Mon, 30 Dec 2024 16:23:10 +0000
Date: Tue, 31 Dec 2024 00:22:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:incoming-android15-6.6-desktop-chromeos 0/877]
 drivers/bluetooth/btintel.c:1547:6-10: WARNING use flexible-array member
 instead
 (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
Message-ID: <202412310054.LOAPwywv-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common incoming-android15-6.6-desktop-chromeos
head:   d8ee6b4ae3d261b5d5dfe13c527acea28c2724d8
commit: e9ac6daceffc6b2f00e14979578ecb0995ed1060 [0/877] CHROMIUM: Bluetooth: surface Intel telemetry events through mgmt
:::::: branch date: 10 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-051-20241230 (https://download.01.org/0day-ci/archive/20241231/202412310054.LOAPwywv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412310054.LOAPwywv-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/bluetooth/btintel.c:1547:6-10: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

vim +1547 drivers/bluetooth/btintel.c

e9ac6daceffc6b Joseph Hwang 2021-11-12  1543  
e9ac6daceffc6b Joseph Hwang 2021-11-12  1544  struct intel_prefix_evt_data {
e9ac6daceffc6b Joseph Hwang 2021-11-12  1545  	__le16 vendor_prefix;
e9ac6daceffc6b Joseph Hwang 2021-11-12  1546  	__u8 code;
e9ac6daceffc6b Joseph Hwang 2021-11-12 @1547  	__u8 data[0];   /* a number of struct intel_tlv subevents */
e9ac6daceffc6b Joseph Hwang 2021-11-12  1548  } __packed;
e9ac6daceffc6b Joseph Hwang 2021-11-12  1549  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
