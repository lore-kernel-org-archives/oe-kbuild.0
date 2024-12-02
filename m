Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE6A1DB940
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Dec 2024 22:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733179793; cv=none; b=uawCKcH3HolfC9XvsaRnJmBATGzdBqt9NTffEivkXURZcPUkyiAmRCwXXb9hxkRM5ADiGji4NKLY1iD9TP5fSTu1KCiTfKJwxReCRBBN1uu0hfyYTGxiHpHJMGYcqHr2P51bx3EtW40QGB9eLU9VU9zeiU+U7PodP15GQVCp9nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733179793; c=relaxed/simple;
	bh=gekG+aZy6xj0HnL7NJCj88kTncrh8qYC22B/eaVeNuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AjESN1zGpcV8abMFMDgIzc5puq/8Ymnx2idWjej696k3RR0bdXcg+Ml5m8+jwJ+ZdA1WE3JAVdCE4AgQqBvgCdfUdD+rWOfKQVRd1ePuZ0CSwo5E4VUApBFxXhE2YqB8k0iDBdR8cj1Pd9eZhvx3GJb8LykX2e3b7DnfBxcxI1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BsD3I+a6; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BsD3I+a6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733179791; x=1764715791;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=gekG+aZy6xj0HnL7NJCj88kTncrh8qYC22B/eaVeNuQ=;
  b=BsD3I+a6igrL/H6EEnvbxSw/NZpZxH04lIfjWvRaV0RtANUBJ32sJR6k
   eTb3m2QcKG3WZGmAJM5hmRBFSpBbtRFyqkQDITZl8ayzsBRAh+Qjos4lR
   78J2tGOZb/7dRNsRE3QFyGAFKulY/l0mlWAJvOSHe0bQJEN0mSluhp7e5
   kkQSAPnj0RsHi64bgotbjNwpl240SYrZsCMwvmgWPnqvx5VS8SFZ+MNpL
   tuzqueqnag7Jtbk8V/CPj4bY+ae4tylOCpsxLa0FkvwhHeXvw1CzhQKx+
   4B+0hEhGwI6HvqTOewtSc7BZVZxP15tWOII1HZahLlNzK+6VKviC7cm+Q
   Q==;
X-CSE-ConnectionGUID: qSXFXMu7RmmoyrxYQuX3fA==
X-CSE-MsgGUID: zLibneGgSfWsdsfeYctIUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="55860493"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="55860493"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 14:49:51 -0800
X-CSE-ConnectionGUID: DWE+LasGQaCAgTXPAw1ziQ==
X-CSE-MsgGUID: hRjRdz5rS3+1XBdPgQS/hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="92899914"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 02 Dec 2024 14:49:49 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIFEb-0002zH-0g;
	Mon, 02 Dec 2024 22:49:44 +0000
Date: Tue, 3 Dec 2024 06:49:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/sti/sti_mixer.c:341:32-38: opportunity for
 str_enable_disable(status)
Message-ID: <202412030600.A9JtaQ1v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Ville Syrjälä" <ville.syrjala@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e70140ba0d2b1a30467d4af6bcfe761327b9ec95
commit: 74bde7581df3e18061119e1b27b63d0a9ea57b7a drm/sti: Allow build with COMPILE_TEST=y
date:   6 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 6 months ago
config: alpha-randconfig-r051-20241203 (https://download.01.org/0day-ci/archive/20241203/202412030600.A9JtaQ1v-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412030600.A9JtaQ1v-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/sti/sti_mixer.c:341:32-38: opportunity for str_enable_disable(status)

vim +341 drivers/gpu/drm/sti/sti_mixer.c

e21e21939ce003 Benjamin Gaignard 2014-07-28  335  
871bcdfea68560 Vincent Abriou    2015-07-31  336  int sti_mixer_set_plane_status(struct sti_mixer *mixer,
871bcdfea68560 Vincent Abriou    2015-07-31  337  			       struct sti_plane *plane, bool status)
e21e21939ce003 Benjamin Gaignard 2014-07-28  338  {
e21e21939ce003 Benjamin Gaignard 2014-07-28  339  	u32 mask, val;
e21e21939ce003 Benjamin Gaignard 2014-07-28  340  
d219673d8437ff Benjamin Gaignard 2014-07-30 @341  	DRM_DEBUG_DRIVER("%s %s %s\n", status ? "enable" : "disable",
871bcdfea68560 Vincent Abriou    2015-07-31  342  			 sti_mixer_to_str(mixer), sti_plane_to_str(plane));
d219673d8437ff Benjamin Gaignard 2014-07-30  343  
871bcdfea68560 Vincent Abriou    2015-07-31  344  	mask = sti_mixer_get_plane_mask(plane);
e21e21939ce003 Benjamin Gaignard 2014-07-28  345  	if (!mask) {
871bcdfea68560 Vincent Abriou    2015-07-31  346  		DRM_ERROR("Can't find layer mask\n");
e21e21939ce003 Benjamin Gaignard 2014-07-28  347  		return -EINVAL;
e21e21939ce003 Benjamin Gaignard 2014-07-28  348  	}
e21e21939ce003 Benjamin Gaignard 2014-07-28  349  
e21e21939ce003 Benjamin Gaignard 2014-07-28  350  	val = sti_mixer_reg_read(mixer, GAM_MIXER_CTL);
e21e21939ce003 Benjamin Gaignard 2014-07-28  351  	val &= ~mask;
e21e21939ce003 Benjamin Gaignard 2014-07-28  352  	val |= status ? mask : 0;
e21e21939ce003 Benjamin Gaignard 2014-07-28  353  	sti_mixer_reg_write(mixer, GAM_MIXER_CTL, val);
e21e21939ce003 Benjamin Gaignard 2014-07-28  354  
e21e21939ce003 Benjamin Gaignard 2014-07-28  355  	return 0;
e21e21939ce003 Benjamin Gaignard 2014-07-28  356  }
e21e21939ce003 Benjamin Gaignard 2014-07-28  357  

:::::: The code at line 341 was first introduced by commit
:::::: d219673d8437ff1073c11d30ac496fa42b09662c drm: sti: add Compositor

:::::: TO: Benjamin Gaignard <benjamin.gaignard@linaro.org>
:::::: CC: Benjamin Gaignard <benjamin.gaignard@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
