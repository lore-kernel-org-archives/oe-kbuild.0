Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DA22CA2
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Jan 2023 16:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674404015; x=1705940015;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mR52ETfZLYBFsmg6XvcJAaZ9RXFEPWnuwfaTwK4gQ8w=;
  b=H2bFGBeu+9r9+vrz3dTRyzxvh+OZEcV59b3y/JdHnUVg5dKA2kAtDNWR
   ly0kRJ05etHGNg9mx/xYnjSjzL/BUBPPQn0KzFPl8JrVqVb9L+KJO00iz
   HcmM7uTkG9aJyrOCh5cFYk7WJ+s0Nq5E7O3L7eAjTEefc5l8IIJVoNTOc
   cnwBmkt571yFbnuKOb9gAA1OII6HOeMOCIOZGtppWljKeY5ak44CybQt/
   07xGBC6hHsQaz7Rk8BpQkYwLDyZHBc2wgnSd5sm3lnxFeKk2IAF6TXLJ3
   ICwJESVzdLa9RiUh+kGlEjBndGUJDSm94Gn0rpoSgE02PwpKaUf15cTUE
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="390411433"
X-IronPort-AV: E=Sophos;i="5.97,237,1669104000"; 
   d="scan'208";a="390411433"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2023 08:13:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="661392778"
X-IronPort-AV: E=Sophos;i="5.97,237,1669104000"; 
   d="scan'208";a="661392778"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 22 Jan 2023 08:13:33 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJcyL-00057a-09;
	Sun, 22 Jan 2023 16:13:33 +0000
Date: Mon, 23 Jan 2023 00:12:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [chrome-os:chromeos-5.10 9/19]
 drivers/gpu/arm/mali/backend/gpu/mali_kbase_pm_driver.c:
 mali_kbase_pm_l2_states.h is included more than once.
Message-ID: <202301230017.sEKjfMOL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   ddc0853e897c21b593451bb768a45cdd4c50a611
commit: ef5094072eea64e551e2dc093bb05b58072b9fba [9/19] CHROMIUM: mali: Uprev to r40p0 EAC release
:::::: branch date: 17 hours ago
:::::: commit date: 4 days ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/arm/mali/backend/gpu/mali_kbase_pm_driver.c: mali_kbase_pm_l2_states.h is included more than once.
>> drivers/gpu/arm/mali/backend/gpu/mali_kbase_pm_driver.c: mali_kbase_pm_mcu_states.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
