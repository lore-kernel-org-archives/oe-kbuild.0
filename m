Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D460B225A35
	for <oe-kbuild@lists.linux.dev>; Fri, 15 Aug 2025 18:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755282530; cv=none; b=I7QtxnNrHbEU2HkPFQektuTNtMY6sJQNJ/8CJVCtQAGX1IPdsAVXj4I7qgVVh1THtqZtzHNzJyqOAY8ImDq/lz1vkRP3TAUWaBfj3ftZ6UArJ1yFOM+RDtDY9glifipQEjHMs57pzF9lEbgrG59y0XCMRA2QcwXjJiMfenSVo+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755282530; c=relaxed/simple;
	bh=lUaCSvjCe0AfgGELBlVsPAybHd+FPBsBWVtEMsQCpIw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CDao7dikF4pf/fsV5vA8eRq0Mhc7J9leCGJu4624G//t/NGNDSPOeRul50zYfiJqBlp0QtMOucJOHRBemP6a4ze/TtXzrdgDwZ2MRRbVe6uL3lAIYjvRzonutTbonSIYMjTpuM2XJdagAGFOLPkz7dur4f9CNcvSyNeURYBIoVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c3h86ZEZ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c3h86ZEZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755282528; x=1786818528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lUaCSvjCe0AfgGELBlVsPAybHd+FPBsBWVtEMsQCpIw=;
  b=c3h86ZEZxLNMG70hW7v5imX4QNVdnnrZyLOYRd3OSRqndoglic34ab3L
   dot+FeNk293r4hG+JDzuKX4VGGO4WvmfcVwcvSTmJEo2HWzcMWYBY1W0S
   r+eo78HacY2++XSvsYmCWkHe9vl/uQYf+exqWHNbyNuR7tYcfQG3SeQkF
   GxW0bcp+lAudPnyEnWNynfBodzwvZSMJm2cg4wqrJFURe6rRFCiE6BU5D
   h72puLiMgkiNIgSahnhu+D7lJQVqjZXwUZKi/+2Z9l4Lnxh+Xp74pvXEn
   TypbGzJ70h1yBlyBrKaylq/NbdaaneaUMwkZYwsUe4KOu18eBJX2MSjT3
   w==;
X-CSE-ConnectionGUID: Wda3q2f2SLS4w45Q8yn+Jw==
X-CSE-MsgGUID: skdLMJYTQ8KlphfV8TNzGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="68977429"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="68977429"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 11:28:46 -0700
X-CSE-ConnectionGUID: tCqsS1G6T02QQG28ZR7LNQ==
X-CSE-MsgGUID: yfjNhau5Tum8TvOdx0LOpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="167417899"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 15 Aug 2025 11:28:46 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umzAR-000CEO-1L;
	Fri, 15 Aug 2025 18:28:43 +0000
Date: Sat, 16 Aug 2025 02:27:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [spacemit:k1/for-next 2/2]
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: serial@f0612000
 (spacemit,k1-uart): 'clocks' is a required property
Message-ID: <202508160212.Xtt79ySL-lkp@intel.com>
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
CC: Yixun Lan <dlan@gentoo.org>
TO: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
CC: Yixun Lan <dlan@gentoo.org>

tree:   https://github.com/spacemit-com/linux k1/for-next
head:   bab8dea259100a99e047fd11a48940b229d30031
commit: bab8dea259100a99e047fd11a48940b229d30031 [2/2] riscv: dts: spacemit: Add OrangePi RV2 board device tree
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: riscv-randconfig-052-20250816 (https://download.01.org/0day-ci/archive/20250816/202508160212.Xtt79ySL-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250816/202508160212.Xtt79ySL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508160212.Xtt79ySL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: serial@f0612000 (spacemit,k1-uart): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: serial@f0612000 (spacemit,k1-uart): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
