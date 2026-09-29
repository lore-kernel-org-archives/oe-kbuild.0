Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E34F522EE2
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Sep 2026 12:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790685388; cv=none; b=GFKoMFjOPDeLfvfIwhLtbx7mrxBf/VO0lU34o4Va5vky6q9IR0JWcwvZEgqJ8qJdN4LerUT1Q6XsXIdPLlSHVffJMrPLljkh9YTef/Hxc33PkR21cB6gwoYIb/P2Yg/IfLaWfytG1MSFk/PE1tFZKEboVCy8IBspOLDW1zDOxVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790685388; c=relaxed/simple;
	bh=EqvoTVvyLL3LlBPjlH5BRn8R5SXXhx7aoVa2Pr4NN08=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IDNQR53cHPcZBt6Hn/DJQMpaT+e6yRB124xegoNpmJGHCyfm4G3+k16XWpN1wfVOsMiPUzf6pCwrpvxu6ZW3+oCo4P9v/jWqSxmUu8FtOYgYAjqc+eZE5ztKo/FWV730x5IAl8HocMi6qNneOpJPC7RUF1q0YS5qNbeIj4Dp+V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=is3eG5qV; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="is3eG5qV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790685386; x=1822221386;
  h=date:from:to:cc:subject:message-id;
  bh=EqvoTVvyLL3LlBPjlH5BRn8R5SXXhx7aoVa2Pr4NN08=;
  b=is3eG5qVE+JuoshmDOMRZaIytbyGwjfXSlhd1ikFiEPFx2WDfFq8WDKm
   EvFhfcyAlb7m/HbYVpk1ycL6MqRrNgkPNluDoxZkPSuKmWLfqeLZuy9Rl
   SQ99NJG8xYY2qYZW10ma45c2b3yH2RlI51shQIbpBPLuSItpMD6xU59h1
   aWH3tinHutIfqj93V+w8Y4mt3iNK6MZioCCJCBmsvwtIkEK8NCQ5bV8Tb
   NF1Q6EKRzxqL9t2OG3lWxf6LSzd1hEU3zw30WnG7lfc4/AKP2FqgBUbcY
   SXXr3PWzxHyll23hre0hyjpcWgQUUuzj/nYmrbYgnfG8KJcImUv83+bNe
   w==;
X-CSE-ConnectionGUID: 7LIEsL2jQzO4tEBqsgoDNg==
X-CSE-MsgGUID: 62UPYT8ITemZIRdFhhrfmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="101570524"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="101570524"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 05:36:26 -0700
X-CSE-ConnectionGUID: WT3Pf0q9Ra++UpTmsyaiMw==
X-CSE-MsgGUID: hahK98LGQfKTqTz/uh7uYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="301640599"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Sep 2026 05:36:25 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBX4I-00000000PJ1-27yh;
	Tue, 29 Sep 2026 12:36:22 +0000
Date: Tue, 29 Sep 2026 20:35:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/dsa/motorcomm/chip.c:3928:29: error: use of
 undeclared identifier 'priv'
Message-ID: <202609292029.Bs28dmhw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Kyle-Switch/net-dsa-motorcomm-initialize-dsa_switch-based-on-chipid/20260929-105407, commit: f8eedf583837090fc6c8af9028daa5ae14066fd2"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Kyle Switch <kyle.switch@motor-comm.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Kyle-Switch/net-dsa-motorcomm-initialize-dsa_switch-based-on-chipid/20260929-105407
head:   17230188d88553553a3648a5296554ff1e98926a
commit: f8eedf583837090fc6c8af9028daa5ae14066fd2 net: dsa: motorcomm: move mib stop from remove() to teardown()
date:   10 hours ago
:::::: branch date: 5 hours ago
:::::: commit date: 10 hours ago
config: hexagon-randconfig-1000-20260929 (https://download.01.org/0day-ci/archive/20260929/202609292029.Bs28dmhw-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5f609f950d2e80addf5566623013db68394334db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260929/202609292029.Bs28dmhw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609292029.Bs28dmhw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/dsa/motorcomm/chip.c:3928:29: error: use of undeclared identifier 'priv'
    3928 |         for (size_t i = ARRAY_SIZE(priv->ports); i-- > 0; ) {
         |                                    ^~~~
>> drivers/net/dsa/motorcomm/chip.c:3928:29: error: use of undeclared identifier 'priv'
    3928 |         for (size_t i = ARRAY_SIZE(priv->ports); i-- > 0; ) {
         |                                    ^~~~
>> drivers/net/dsa/motorcomm/chip.c:3928:29: error: use of undeclared identifier 'priv'
    3928 |         for (size_t i = ARRAY_SIZE(priv->ports); i-- > 0; ) {
         |                                    ^~~~
   drivers/net/dsa/motorcomm/chip.c:3929:29: error: use of undeclared identifier 'priv'
    3929 |                 struct yt921x_port *pp = &priv->ports[i];
         |                                           ^~~~
   4 errors generated.


vim +/priv +3928 drivers/net/dsa/motorcomm/chip.c

f8eedf58383709 Kyle Switch 2026-09-29  3927  
f8eedf58383709 Kyle Switch 2026-09-29 @3928  	for (size_t i = ARRAY_SIZE(priv->ports); i-- > 0; ) {
f8eedf58383709 Kyle Switch 2026-09-29  3929  		struct yt921x_port *pp = &priv->ports[i];
f8eedf58383709 Kyle Switch 2026-09-29  3930  
f8eedf58383709 Kyle Switch 2026-09-29  3931  		disable_delayed_work_sync(&pp->mib_read);
f8eedf58383709 Kyle Switch 2026-09-29  3932  	}
9af9a816821365 David Yang  2026-08-31  3933  }
9af9a816821365 David Yang  2026-08-31  3934  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
