Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895A7279327
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Dec 2025 07:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766475968; cv=none; b=ZdolI8MQgD6Q8VU/ljoDST04NSk8YpHNq3QVsNy2Wk6Neg55SuexNM+i1MBdZNnQBNbg8SAwJ8sQSoqttfDITeJF5VOVzoldnw6bGHIBih8vt31DTxkyncxi6DzvBikmUs8sDytHiag8WBfWKKE7j+keepPTJ5lK2pnx6f7peLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766475968; c=relaxed/simple;
	bh=24XpMI84yV2+65d21ngHmiJZTUBS94WeMdfrEn0hdP4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=flm0VobrIoFHgREQajZJQshcXt3/ZOL/hx6MhgmOoM4kpdQSxRIP3B4sNdVGrmulOzRAyteVxwqwD3nsvBYx9g++tIr7Gl/JbfJ3uvphcc5RK6OGi9wbvhwZdKgnhTLd/0S3tBIaUkMIQH/BFJV+lPg3ruWK6IMuD1Q6rMQJdtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KVnO1LHj; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KVnO1LHj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766475967; x=1798011967;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=24XpMI84yV2+65d21ngHmiJZTUBS94WeMdfrEn0hdP4=;
  b=KVnO1LHjdiXKzE7DZ/JXNERJq5qWS82rsq31tYr6FBblAxFnOmtJ/7k4
   DJTZQE/dEYfXdW/WPy9SD8tmDwayX6eKI1LpeKFVUcEMQrOozOB1/Zifc
   6Vhl7PD/2TiD4Dc0Aj6hyaDVz9ff3kYH+QzzOTzJ4/ZNSCusAgCGzRNe1
   84xDcgeI0usVZIATsyZI/KYhQ2V4wL42Z05vF/lmt9831WXMj/awmxbsl
   WC4Iz0vDYayyZKlrIPLgIMQWZ2ssGPndN6eR3Vgp2WHwdrfS0hL3sI7ki
   HQouLoQ+GvQsOI0E3ASuM2ERhxLtG9t4SkPjyADA+YKkB6jupy1xBHC0s
   A==;
X-CSE-ConnectionGUID: OqJN4aS2RmC4MWOyp9Lu7g==
X-CSE-MsgGUID: c/NpqjKSSLexUbJrh/roQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="67520583"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="67520583"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 23:46:06 -0800
X-CSE-ConnectionGUID: p32Yxpz6S9WlOfa7Zkjn9g==
X-CSE-MsgGUID: lfUxhTlSRFmvp3pqc3pDDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="237129841"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 22 Dec 2025 23:46:04 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXx5m-000000001bk-1gK0;
	Tue, 23 Dec 2025 07:46:02 +0000
Date: Tue, 23 Dec 2025 15:45:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 18/33] drm/vkms: Introduce configfs for plane format
Message-ID: <202512231517.fiGsQEEL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/vkms/tests/vkms_configfs_test.c:8:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251222-vkms-all-config-v3-18-ba42dc3fb9ff@bootlin.com>
References: <20251222-vkms-all-config-v3-18-ba42dc3fb9ff@bootlin.com>
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
CC: victoria@system76.com
CC: sebastian.wick@redhat.com
CC: thomas.petazzoni@bootlin.com
CC: dri-devel@lists.freedesktop.org
CC: linux-kernel@vger.kernel.org
CC: linux-doc@vger.kernel.org
CC: Louis Chauvet <louis.chauvet@bootlin.com>

Hi Louis,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8e7460eac786c72f48c4e04ce9be692b939428ce]

url:    https://github.com/intel-lab-lkp/linux/commits/Louis-Chauvet/Documentation-ABI-vkms-Add-current-VKMS-ABI-documentation/20251222-181426
base:   8e7460eac786c72f48c4e04ce9be692b939428ce
patch link:    https://lore.kernel.org/r/20251222-vkms-all-config-v3-18-ba42dc3fb9ff%40bootlin.com
patch subject: [PATCH v3 18/33] drm/vkms: Introduce configfs for plane format
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: openrisc-randconfig-r133-20251223 (https://download.01.org/0day-ci/archive/20251223/202512231517.fiGsQEEL-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512231517.fiGsQEEL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512231517.fiGsQEEL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/vkms/tests/vkms_configfs_test.c:8:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/vkms/tests/vkms_configfs_test.c:8:1: sparse: sparse: static assertion failed: "MODULE_INFO(import_ns, ...) contains embedded NUL byte"
   drivers/gpu/drm/vkms/tests/vkms_configfs_test.c:101:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/vkms/tests/vkms_configfs_test.c:101:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/gpu/drm/vkms/tests/vkms_configfs_test.c:101:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/vkms/tests/vkms_configfs_test.c:101:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/gpu/drm/vkms/tests/vkms_configfs_test.c:102:1: sparse: sparse: bad integer constant expression
   drivers/gpu/drm/vkms/tests/vkms_configfs_test.c:102:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"

vim +8 drivers/gpu/drm/vkms/tests/vkms_configfs_test.c

9d5862b7732204 Louis Chauvet 2025-12-22  7  
9d5862b7732204 Louis Chauvet 2025-12-22 @8  MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
9d5862b7732204 Louis Chauvet 2025-12-22  9  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
