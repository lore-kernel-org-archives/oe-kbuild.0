Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2132D12BE81
	for <oe-kbuild@lists.linux.dev>; Wed,  8 May 2024 17:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715189353; cv=none; b=spghUv3BClerYqh8t45YO8xviPnzMPAGMgdHXAolgFmj44AdaoTzJKOYhsTNcvi8SAPryxG0WcWHjVGuRsWCGi3/YkaGND/xtc/q1BrlFWiAOO+qDppzGk1hnOlfnF/DUoHeQrzDK3foxkGHfsrECurS86xBJUn60URm8Mr2Fds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715189353; c=relaxed/simple;
	bh=j6/4pvVLhSMz5J+iI9feOKauZ/WAgiWFUsbPUBgoH6c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UROqZ8WO4azAfqjGyitoMyQHQojguOiHTOj01DCwa21GJHyYvlGoC9HQkXhBqhJMXZv9D773bfxsUTJOE5+IO8FIDHELsqrF0nyF2aiKS/ytJw7gEchBXTRH3YmwPmUHb1gEin1Uktf+RObGRf9B7/edj2YM0uDwPae58LIbsVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=khsChh4P; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="khsChh4P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715189332; x=1746725332;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j6/4pvVLhSMz5J+iI9feOKauZ/WAgiWFUsbPUBgoH6c=;
  b=khsChh4P+BsjoIqtP1qU/uve3SjMF/5HFYnnRScmOvRtk+AM22mZaFm7
   qDluGyoUmYU88VtavdhrWs709oNgBuk4C1Xf5GYZqKmPibfbSdUqwbkRy
   daTJZBH7TI4Dr20bVFTU+DmhVRFvzr3jBkwYkzqulkHOQ7SnWP9BSapRp
   u2Dad0B1oOXfWvlyuLuSKYqacPPK9cz0eJ3DvCh7BDMamYn/ixZ97sAhf
   KpQMxd8IBmRlr1/XWc7s87pnN2vcoymLiydGWktpJ0hRPsW+JtokR/oG4
   sNzL2guaUbPggg8MsrO2JwizI2O0TpE7KQKlYSwoply3ZzF/DAAMxLTv6
   g==;
X-CSE-ConnectionGUID: WOwKDCJ3QZeA0bZBPBuw4w==
X-CSE-MsgGUID: 5D+jYfPtSoWwDQLdWA9ckQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11431138"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="11431138"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 10:28:47 -0700
X-CSE-ConnectionGUID: f/iEUTltSiGsQlUakqPOyA==
X-CSE-MsgGUID: 8A517FhKQnSio+RWn6v2ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="33762815"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 May 2024 10:28:47 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4l5w-0003vm-0S;
	Wed, 08 May 2024 17:28:44 +0000
Date: Thu, 9 May 2024 01:28:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [openeuler:openEuler-1.0-LTS 10307/22320]
 drivers/pinctrl/.tmp_pinctrl-ingenic.o: warning: objtool:
 ingenic_pinconf_set()+0x9c: sibling call from callable instruction with
 modified stack frame
Message-ID: <202405090152.efDVxQ9E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only Makefile file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: kernel@openeuler.org
TO: Xie XiuQi <xiexiuqi@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   9ff44822aad3feccdf9b76d1b04aa62e958c05e0
commit: 96d6a274fc187fff18c10499215920e011ddb46a [10307/22320] kbuild: add -fcf-protection=none when using retpoline flags
:::::: branch date: 6 hours ago
:::::: commit date: 4 years, 4 months ago
config: x86_64-buildonly-randconfig-005-20240508 (https://download.01.org/0day-ci/archive/20240509/202405090152.efDVxQ9E-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240509/202405090152.efDVxQ9E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405090152.efDVxQ9E-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/.tmp_pinctrl-ingenic.o: warning: objtool: ingenic_pinconf_set()+0x9c: sibling call from callable instruction with modified stack frame

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
