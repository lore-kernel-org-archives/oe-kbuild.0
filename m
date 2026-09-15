Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B723845D91C
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Sep 2026 07:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789458226; cv=none; b=b5OEO5lGjnllodxbOuiQBI0bCI48TAG7Gp5g1YDSD4Xtm4DdmMtYb2ak8Wzi8YJzUNULHtQXbdrbOtRdAspIcN2uCaX7fXL6AqfDSclYz5375Y6n3Dfs9fd1s0c3yhBLWvFxv0xrG8UvIG1w10a8hk2AMQuKoCsRI4/wvHz+UEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789458226; c=relaxed/simple;
	bh=bMyWzzGowyWi99WfClav/b8WY50Z3iyL0pN+4uXqIvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uve91PJbFyDwUDKkONiJLi8PTisqxhDKHElYyhdosHvhWN/nUZ4g7EzUw+XFeO6ZhYRlZ9enZdh8x/s0RI0rAixqpseivDEkOV+gy6jqMP62ErMlGWgASoS7vUsA9pW/uLSioCOEHj6lad0J8Sw3PVNakjbTs68Sez3kwwui9Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ectBCj5h; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ectBCj5h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789458224; x=1820994224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bMyWzzGowyWi99WfClav/b8WY50Z3iyL0pN+4uXqIvQ=;
  b=ectBCj5h0DA3qHkLm+Hss6yCofEMCSl7cU5K/Vx1lQSwsee5saclX2h6
   POFa4wJwfs3nRapEL34lu5tJpV80Et3YSXtjL0A8kEnn2TEGDDxDrhB/c
   Rd89LXH620HSopuOL7XucRwjEZmcXdT0INbDWw0Mf44WdTR8UpTM4VRW+
   Ilwt8ksxsRF4FqkkjAMW2bimbliHyHl6scYhkOSEf2Rj7+6c7NY3Uc7UZ
   Aq+RDtX2X2XTsn3VB9b9tayCNHskXOLLmZf0GPcTgL7cAOB3QOaKOJx8d
   oLXetf/D99OpH9FoULwqrbraRe8WeWbhsZE3vGXjvVqYk/rhCGyXKmaia
   g==;
X-CSE-ConnectionGUID: HjwRKx2HTBGwyk9tcn3BEw==
X-CSE-MsgGUID: PnYEgh8fRwikW8rAgUCDCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="88950287"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="88950287"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 00:43:44 -0700
X-CSE-ConnectionGUID: /qMlc/zETXuJEXqN+ABN/w==
X-CSE-MsgGUID: mQOrFMH+QtCr1uqx9ZLgGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271063284"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 15 Sep 2026 00:43:43 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6NpN-000000000XL-050M;
	Tue, 15 Sep 2026 07:43:41 +0000
Date: Tue, 15 Sep 2026 09:42:42 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] PM: dpm_show_time changes to suspend/resume dmesg
 prints
Message-ID: <202609150910.dc2I5dHv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260831222926.34698-1-todd.e.brandt@linux.intel.com>
References: <20260831222926.34698-1-todd.e.brandt@linux.intel.com>
TO: Todd Brandt <todd.e.brandt@linux.intel.com>
TO: linux-pm@vger.kernel.org
TO: rafael.j.wysocki@intel.com
TO: rjw@rjwysocki.net
CC: todd.e.brandt@linux.intel.com
CC: todd.e.brandt@intel.com

Hi Todd,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on rafael-pm/bleeding-edge amd-pstate/linux-next amd-pstate/bleeding-edge linus/master v7.3-rc3 next-20260914]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Todd-Brandt/PM-dpm_show_time-changes-to-suspend-resume-dmesg-prints/20260831-152926
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20260831222926.34698-1-todd.e.brandt%40linux.intel.com
patch subject: [PATCH v2] PM: dpm_show_time changes to suspend/resume dmesg prints
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-r061-20260915 (https://download.01.org/0day-ci/archive/20260915/202609150910.dc2I5dHv-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609150910.dc2I5dHv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609150910.dc2I5dHv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:5,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:369,
                    from include/linux/dev_printk.h:14,
                    from include/linux/device.h:15,
                    from drivers/base/power/main.c:21:
   drivers/base/power/main.c: In function 'dpm_complete':
>> include/linux/stddef.h:8:14: warning: passing argument 3 of 'dpm_show_time' makes integer from pointer without a cast [-Wint-conversion]
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
         |              |
         |              void *
   drivers/base/power/main.c:1362:41: note: in expansion of macro 'NULL'
    1362 |         dpm_show_time(starttime, state, NULL, "complete");
         |                                         ^~~~
   drivers/base/power/main.c:480:70: note: expected 'int' but argument is of type 'void *'
     480 | static void dpm_show_time(ktime_t starttime, pm_message_t state, int error,
         |                                                                  ~~~~^~~~~


vim +/dpm_show_time +8 include/linux/stddef.h

^1da177e4c3f41 Linus Torvalds   2005-04-16  6  
^1da177e4c3f41 Linus Torvalds   2005-04-16  7  #undef NULL
^1da177e4c3f41 Linus Torvalds   2005-04-16 @8  #define NULL ((void *)0)
6e218287432472 Richard Knutsson 2006-09-30  9  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
