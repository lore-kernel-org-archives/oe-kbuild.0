Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9C910E4
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Jul 2023 05:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690004888; x=1721540888;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xFsRRHoL1tcyyvnTQJYJp2s2Z0sUtfXfaoFP6WOJ7wU=;
  b=azFdSgvLN5/Ar0lo69NyD+vVFWUWaAEz5UbEW39jPwONemmm/P4bsU5L
   ZY2GAyUDznDd8R9GItdUx/esZX3fc+mZCGJ2q6g8LBFw4k+txO8XeY46r
   C5/u5akqj9MMtYLL2U/m+asOJt6zihGTAuVJ4MMYpKkpwKdAX2Oir2sx0
   /2OGp2HmScMYpayi7hoOV8qI48fIsH/13xxhIwEH4UQDT3mcxjTXY3m58
   NUg7W7b+PryEZdDcjh5C10lZQz1MDQnjH+aRNorP0XhfcDL1oJNzQZ2Oh
   Mna0DIWxTmA48jqKY6MpZxdRDRy63/hAemME8mcohmR4xzIER4Gyb/gpV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="346768887"
X-IronPort-AV: E=Sophos;i="6.01,223,1684825200"; 
   d="scan'208";a="346768887"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 22:48:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="795196104"
X-IronPort-AV: E=Sophos;i="6.01,223,1684825200"; 
   d="scan'208";a="795196104"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 21 Jul 2023 22:48:06 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qN5TJ-00082D-2L;
	Sat, 22 Jul 2023 05:48:05 +0000
Date: Sat, 22 Jul 2023 13:47:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [chrome-os:chromeos-6.1 2/3]
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:359:57-58: WARNING
 opportunity for swap()
Message-ID: <202307221332.goiW26om-lkp@intel.com>
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
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   3ad05c551fb5409858f4ef876187d75d870322fb
commit: f202feb44dc9028e93958c62761168f1da8e5a75 [2/3] UPSTREAM: drm/amd/display: Ensure that planes are in the same order
:::::: branch date: 14 hours ago
:::::: commit date: 24 hours ago
config: alpha-randconfig-r062-20230720 (https://download.01.org/0day-ci/archive/20230722/202307221332.goiW26om-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307221332.goiW26om-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202307221332.goiW26om-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:359:57-58: WARNING opportunity for swap()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
