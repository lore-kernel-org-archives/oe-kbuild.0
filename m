Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC323148B7
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Dec 2025 12:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766407761; cv=none; b=jb0lHXVi+Hdy/A8ja1FiJiWWGwMURyzYWUq3hULUo56frYCuKDZjaG3Cr7870kyV9fdZ9mwxSpkxfy4YHdkJSfefEwGtPwlGH/sSPHxR+lri1ligT5vLgTjWKGsoqKiYPH7NpjUMrrtUGxk5i8xdtz5qRcmesm/QpThd0E3qGjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766407761; c=relaxed/simple;
	bh=niR18WU2RTlkbCx3zrHRY/97bUt/pb987fNj+kQOf64=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r5Rh84WMknaowqKz4BfDEBdNyljIZ3gg6jXitNud5+71WylAuF+fwUDP2iVb4jhsVAbMCMbQ7BOzorpuTBAAfQzYdC/R36JP0VE31cnf7PlYklW/Yk58KPuP0XoWIbR9UpgS5TLxq8bu4UI7H2rT5oy/3Dq5HteYqoX5dTXwEFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aN5z/f7X; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aN5z/f7X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766407760; x=1797943760;
  h=date:from:to:subject:message-id:mime-version;
  bh=niR18WU2RTlkbCx3zrHRY/97bUt/pb987fNj+kQOf64=;
  b=aN5z/f7XTNY1H8pl1kiGDJlVZ3BzmbiaxkDusjgq/BCXZ2/jEFUN8AHG
   x3nVHvrywNa286RDVLeZDAY6C7TO8VgovSup1tRGN+JMpbHrnbZwiROtM
   ByLgWlEhtW7BEJdOc4phq70akf9l08GA/ZJookV7FLMnM19I+tyMrcz/2
   kxA1Cnbnr9YM7P/peOMVZtltf1GXrsHfES9F3Tre2nOB+KvUdpG/E1Fvi
   o5EhwU9LDoNxGqJ/XjVrQYH7QepEOWFyxYrX6soqySj3tlhbRbs6776tQ
   /uBQEbXFs0xGfnOz2jYI1dDwqndu38nvhjRdVxJ1iw7NWDVWrlmvoybCV
   A==;
X-CSE-ConnectionGUID: LegoR4pDQnKhHMoLzNvAYA==
X-CSE-MsgGUID: clfzW0EqQzunUwANGiHGxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68152299"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="68152299"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 04:49:20 -0800
X-CSE-ConnectionGUID: VyL/u7NUR2qzEj+UKl0z3A==
X-CSE-MsgGUID: uZeD6fpcSG2sjsRgIdaVog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="204042862"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 22 Dec 2025 04:49:19 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXfLg-000000005TM-2IXm
	for oe-kbuild@lists.linux.dev;
	Mon, 22 Dec 2025 12:49:16 +0000
Date: Mon, 22 Dec 2025 13:49:11 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v3 16/33] drm/vkms: Introduce configfs for plane color
 range
Message-ID: <202512221318.H4WXJ4HG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251222-vkms-all-config-v3-16-ba42dc3fb9ff@bootlin.com>
References: <20251222-vkms-all-config-v3-16-ba42dc3fb9ff@bootlin.com>
TO: Louis Chauvet <louis.chauvet@bootlin.com>
TO: Haneen Mohammed <hamohammed.sa@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Melissa Wen <melissa.srw@gmail.com>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: jose.exposito89@gmail.com
TO: Jonathan Corbet <corbet@lwn.net>

Hi Louis,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8e7460eac786c72f48c4e04ce9be692b939428ce]

url:    https://github.com/intel-lab-lkp/linux/commits/Louis-Chauvet/Documentation-ABI-vkms-Add-current-VKMS-ABI-documentation/20251222-181426
base:   8e7460eac786c72f48c4e04ce9be692b939428ce
patch link:    https://lore.kernel.org/r/20251222-vkms-all-config-v3-16-ba42dc3fb9ff%40bootlin.com
patch subject: [PATCH v3 16/33] drm/vkms: Introduce configfs for plane color range
:::::: branch date: 2 hours ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251222/202512221318.H4WXJ4HG-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#141: FILE: drivers/gpu/drm/vkms/vkms_configfs.c:504:
+	struct vkms_configfs_plane *plane = plane_item_to_vkms_configfs_plane(item);;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
