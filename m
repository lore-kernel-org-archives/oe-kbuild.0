Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F19813C9C0
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Sep 2024 18:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726339939; cv=none; b=cXs5kWlKLhkSKBjBBiXacJ3xX+zbi2qfxj3FWMYEZDq72AAKktZMkiylnMiqsuYTndwopm8bmc1ZMfTbuKZRNdrC1gyNIhoqc/9MQVTIBsqXUv8+wxqXr7cXq+er2Y6FoaU+48SsQoWvf8y5kEKgqOwAfL79AZhF+kI6JSVRIMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726339939; c=relaxed/simple;
	bh=pGIpcY3btHmEvsm9ZZhoq9iUyIRjvS84eF31e6GhTe8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ikAxpd59QoZ5TWEpD/d8M1md6jico2c9U0RLcRY4WcZFY0TFLrLz+q86z+SSqTcfj0+H5HiZ3WM2JeMBb0/X0eVXy8Xk7uKm7HHIhtg1Eivz5bDo+Uhm/TeYEHfWbBhHL+iJtrqxIqHEalVaZz4Q6nXc/eWU6DngZZNQCLMNdMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dWHk1f+n; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dWHk1f+n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726339937; x=1757875937;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pGIpcY3btHmEvsm9ZZhoq9iUyIRjvS84eF31e6GhTe8=;
  b=dWHk1f+nwHdh03SMFHD1T/J1xh7msFGXdAR9iHT801vIFrMvLHxXo7NH
   gHKJsZCvDlipGNPAOGlEUoqBYZuPiTGYjjw73jyKDrhlFwyBlKzM083Zv
   HwAg6mmpJ+GjG+X2qoKlUOxSLLpZS71a4+lAG8TFwt2My55RJpVt5QUyn
   LvXGrnF833ecfPiyx5/EeJVjrK4iPj/6oGlPTeT6nW4VlIb2YTyT/ly1j
   G50IQIoKwN8WJdHwxNvRoh+F2lhvyE9J1vc/lJWs2r1SN1/ONQ7UvqF/y
   7uPPHlXpnQIODIlXBw6amIXZifSgUNcOG96JEn9XGe0+28xrno3J4dTtH
   A==;
X-CSE-ConnectionGUID: +xZrCuTHSX+ek9zkfDmi9Q==
X-CSE-MsgGUID: btR459viSvOSW6G/YmYQuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="36604271"
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="36604271"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 11:52:16 -0700
X-CSE-ConnectionGUID: l9eYIvTHTEOSD1FoEpfOcw==
X-CSE-MsgGUID: 6Na9Muv3S1uTD5GCIykW0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="99121586"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Sep 2024 11:52:15 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spXsS-00084k-31;
	Sat, 14 Sep 2024 18:52:12 +0000
Date: Sun, 15 Sep 2024 02:51:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] pm: cpupower: Makefile: better support
 cross-compiling
Message-ID: <202409150222.w4WkOKKF-lkp@intel.com>
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
In-Reply-To: <20240912013846.3058728-2-peng.fan@oss.nxp.com>
References: <20240912013846.3058728-2-peng.fan@oss.nxp.com>
TO: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
TO: Thomas Renninger <trenn@suse.com>
TO: Shuah Khan <skhan@linuxfoundation.org>
TO: "John B. Wyatt IV" <jwyatt@redhat.com>
TO: John Kacur <jkacur@redhat.com>
TO: "open list:CPU POWER MONITORING SUBSYSTEM" <linux-pm@vger.kernel.org>
TO: open list <linux-kernel@vger.kernel.org>
CC: Peng Fan <peng.fan@nxp.com>

Hi Peng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on amd-pstate/linux-next]
[also build test WARNING on amd-pstate/bleeding-edge linus/master v6.11-rc7 next-20240913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan-OSS/pm-cpupower-Makefile-better-support-cross-compiling/20240912-093139
base:   https://git.kernel.org/pub/scm/linux/kernel/git/superm1/linux.git linux-next
patch link:    https://lore.kernel.org/r/20240912013846.3058728-2-peng.fan%40oss.nxp.com
patch subject: [PATCH 2/2] pm: cpupower: Makefile: better support cross-compiling
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240915/202409150222.w4WkOKKF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409150222.w4WkOKKF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> utils/cpupower-set.c:77:21: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
      77 |                         params.perf_bias = 1;
         |                                          ^ ~
   utils/cpupower-set.c:86:15: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
      86 |                         params.epp = 1;
         |                                    ^ ~
   utils/cpupower-set.c:97:16: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
      97 |                         params.mode = 1;
         |                                     ^ ~
   utils/cpupower-set.c:107:23: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
     107 |                         params.turbo_boost = 1;
         |                                            ^ ~
>> utils/cpupower-info.c:60:21: warning: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
      60 |                         params.perf_bias = 1;
         |                                          ^ ~
   4 warnings generated.
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
