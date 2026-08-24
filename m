Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF429376468
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Aug 2026 08:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787560377; cv=none; b=EQ/qJ5LiJvHzrD7atPYxLUBwHbj2y+lsQkT08n/3QPCTx5gVovgjqhuMvemLQWO8T5DBkZTOWoIxGAZlRIOWi/JGR8JY4DVskvEhvsNgQG2OOslNQlMyosfM6KhT09Dn+YhhIkvz/PbWsB15jacgxOSccds8ubwXc5KfWmDQ+U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787560377; c=relaxed/simple;
	bh=60W19CZSE/yacjePNBpUHhVvTBycV2L8fcbyQHGjkqI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=axMBxWn804bVkVsJqdrgd4WmKSnRUg8Sq1MNfmqvgVPTeVyYdwMSyDg9LWx+JhlwSDhvvC30tG1JosMhQJwo9JZeUZAOu6Py2jPKuumg31euD5n05ZoA0OW9ExJNUU6PupjhNOdZm+HelRmN4K+ygR+P1sUvFxV2SNWuikVqtww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PYTSkWm8; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PYTSkWm8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787560376; x=1819096376;
  h=date:from:to:cc:subject:message-id;
  bh=60W19CZSE/yacjePNBpUHhVvTBycV2L8fcbyQHGjkqI=;
  b=PYTSkWm8eInwudoizo2DZ6x2UFqTImZo8g0j37ivRK1Cf2IGFijWLgdR
   Ew7ybyUX/pUYtsukLMheRl/ExE1mDfo51FqEdxAl4uDS73SGqQwGBU+/r
   ARUjQqyb7ey9gyFX+p5aoGRMnkYLzSNYIi3+RywiGh4e6EHkjufdvlhGT
   0PgHRVSoHpEqoHTvCnI6myHSW86718Xlr0XjhWkVxQmlloAddm8xUNKOn
   /VGFkySzDa0MW5NLQ/pgr/m5q90V/AkRvyr4hT1KpWo2VOAoCsIeyVx80
   yOmLFIsiECCA1hd8EOvpGtJ29cdGjzZNQpUfUDPC0tUj+N/HPP2+KdOm8
   g==;
X-CSE-ConnectionGUID: d07X8O2bQXW82pC8qM+HTQ==
X-CSE-MsgGUID: fC8hF9RTTzyYUJ3KqjMKtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="99358030"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="99358030"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 01:32:55 -0700
X-CSE-ConnectionGUID: t0rAiXA+QPqT1/GUlhTQTQ==
X-CSE-MsgGUID: sVnDIBjaTJOPvEduI27z/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="263664483"
Received: from igk-lkp-server01.igk.intel.com (HELO b49262788783) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 24 Aug 2026 01:32:54 -0700
Received: from kbuild by b49262788783 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyQ6u-000000000JH-0qHK;
	Mon, 24 Aug 2026 08:32:52 +0000
Date: Mon, 24 Aug 2026 10:32:16 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ksinyuk:drm-fabric 5/12]
 drivers/gpu/drm/fabric/.kunitconfig.debug: warning: ignored by one of the
 .gitignore files
Message-ID: <202608241000.JVpsRmKT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Konstantin Sinyuk <ksinyuk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ksinyuk/linux.git drm-fabric
head:   5e1a345a60d23b9d13211be009410f9a30ec3bfc
commit: 35955cefe73d0dd9d7553542ece17dfb65c04576 [5/12] drm/fabric: add object-model KUnit tests
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260824/202608241000.JVpsRmKT-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260824/202608241000.JVpsRmKT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608241000.JVpsRmKT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
>> drivers/gpu/drm/fabric/.kunitconfig.debug: warning: ignored by one of the .gitignore files

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
