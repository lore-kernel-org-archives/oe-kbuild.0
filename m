Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E07731A73
	for <oe-kbuild@lists.linux.dev>; Sun, 28 Jan 2024 19:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706469821; cv=none; b=qdOKw7Ct7driCzcBgSS9ux9UV1g8UqXLQioYBiFfv/isFDxqI7Iw/dyAlOVQEcZuwLhLfa5x7RRnnCs2Aj3jyQkgvKkPqVoWNhSUno+eCFl7OlHlpUiNP99iXGU32kfWyYqkw4jLtixyWacQqGrBr2j6kbxVNtuY6btHS91/7cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706469821; c=relaxed/simple;
	bh=2o3K7ZV5tJ5QoDLElslAfW+dvgwJ8vHhUW8e+KLL/qA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t2bedWIwB3XgDKPlIY0MVeMUu5WEdNC5sNFzlswCWBIfS4OmA8zaMPI91RBMJwLrabzTAsE06ivY0arU3peXAe2x313e7XLeNUOZ1Uu8l0zEtYxje7DJ6OCgTEt6mXUbvAW1nd/QUQHK0QfdgN8Q5/2issW9E+drfecugGccBco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b+YObfio; arc=none smtp.client-ip=192.55.52.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b+YObfio"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706469819; x=1738005819;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2o3K7ZV5tJ5QoDLElslAfW+dvgwJ8vHhUW8e+KLL/qA=;
  b=b+YObfio4UcUs45mISCaboIP75kkraV1OFBueXVtJC8JgiJuP856mCeN
   5ujsl3R7IPBfxxqgP53Op2ueAawCVLy8yR1/iijwEnyBbyGmPBLmcwsyE
   WJ/qNJnI2Ddk3eX53R0carWFZNUpU2aCh8ml3g7qT/4Xmdcv9vbgR59Xs
   VSr5rdJP8lcjYpy/sRRjhkWmUYOASLhNERTfeDq2yRzwxGzyeXvy6pWhI
   H+w979HgX6Ay3rkFMj1dV6yvPYhybOLMKghS3GA4JjmpIgVlxg7jvOw2i
   47d4U+Me3CZpri0Xw2mFBBV1Wf2uArJzpDI3ixX0yTjNbwck9k3/+G/iS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="401664042"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="401664042"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 11:23:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="3096282"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Jan 2024 11:23:37 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUAkh-0003gW-1K;
	Sun, 28 Jan 2024 19:23:35 +0000
Date: Mon, 29 Jan 2024 03:22:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fbcon.c:undefined reference to `fb_is_primary_device'
Message-ID: <202401290306.IV8rhJ02-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Javier Martinez Canillas <javierm@redhat.com>
CC: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8a696a29c6905594e4abf78eaafcb62165ac61f1
commit: c242f48433e79ea8c8c9eb8d2b4a3ee340e635fb drm: Make FB_CORE to be selected if DRM fbdev emulation is enabled
date:   6 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 6 months ago
config: sparc64-randconfig-002-20240128 (https://download.01.org/0day-ci/archive/20240129/202401290306.IV8rhJ02-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401290306.IV8rhJ02-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401290306.IV8rhJ02-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: drivers/video/fbdev/core/fbcon.o: in function `fbcon_fb_registered':
>> fbcon.c:(.text+0x4f60): undefined reference to `fb_is_primary_device'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
