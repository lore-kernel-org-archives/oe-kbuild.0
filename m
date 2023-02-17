Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57529446
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Feb 2023 17:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676653650; x=1708189650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UFboslK/4gZ1N3pV380Th3pIUu8pDTS8qTLZryFmhAU=;
  b=RfA7pcNTa8BJkLSgvue3m64N6aauidhNeBH3HVrG6A4vY4ABEdSu9les
   UgvzpyIPpnB6vcRGbiEDDrTnnbdz27TWue7Ww3IEbr0qgRV25X5cBvhCY
   XwDWakozv1jEAmeABokfa+NMdA8YcUx3UtLIv2V6CzcpXZbzKCNIhhvCT
   3weFad2IJNLBfXDvF39htcBnS6GsdryoJPJmntKbt1f4qN0LHl+MbltJi
   Q71Y6l+ZTgrNzo5yaP+i7fKycXMWb+Vnsos3XcnbYI0fnL0gLLZTGHiyM
   IpFsvvlzj8jO4UV+BN21H0i1e1oJik89oPKdHIVIhaQKX0PLWasbJ11Zy
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="359485107"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="359485107"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 09:07:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="700962603"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="700962603"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 17 Feb 2023 09:07:28 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pT4Cl-000Bfd-34;
	Fri, 17 Feb 2023 17:07:27 +0000
Date: Sat, 18 Feb 2023 01:06:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [chrome-os:chromeos-6.1 3624/4023]
 drivers/gpu/drm/i915/display/intel_drrs.c:393:0-23: WARNING:
 intel_drrs_debugfs_ctl_fops should be defined with DEFINE_DEBUGFS_ATTRIBUTE
Message-ID: <202302180036.wIGXMhwS-lkp@intel.com>
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
head:   c12fda46da80ea090695e2b47edd6701b37e195c
commit: 6aecb2d1e217a0da6e3504dee6aa65f3e65ebf09 [3624/4023] UPSTREAM: drm/i915: Move DRRS debugfs next to the implementation
:::::: branch date: 19 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c002 (https://download.01.org/0day-ci/archive/20230218/202302180036.wIGXMhwS-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202302180036.wIGXMhwS-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_drrs.c:393:0-23: WARNING: intel_drrs_debugfs_ctl_fops should be defined with DEFINE_DEBUGFS_ATTRIBUTE

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
