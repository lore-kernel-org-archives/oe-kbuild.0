Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A88C4654D
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Jun 2024 22:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718835601; cv=none; b=Lk/ArDu+uBCj9jF3zj8YeweHUdbKCokMMPoWVcDz2rOGyHHldzBVA3Z+eEl1bGrsUJU5rYj7kgS40VjPU//W3mRfXWboEQi3EwJHfs/7OOeApVeIp8+0OO5aBBip42C9obOvoKvFZJKpEcFxqj0ImODrOo53uFDSvYw7ulR5Gvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718835601; c=relaxed/simple;
	bh=jjDR8HBIavRRm+dzoPnsaKMZhaI1bB6o7g5JUesQBL8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d30K3pxwGshzIG6VWBNrJqHGEfnv7MHHDVBSibbw76+y2nFzNA1g2PJXxiFKOoIBphbfTbJbApOzHZllYrMsfR2xXAWahQ2mfF/NxkeaB4mcviuxww3e3k95R0ZEnIuhaT1vFeGnsgu5Dy401F+vPD6k5/rCV9K1rQuj9XjQ33I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZBkxFOvz; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZBkxFOvz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718835599; x=1750371599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jjDR8HBIavRRm+dzoPnsaKMZhaI1bB6o7g5JUesQBL8=;
  b=ZBkxFOvzTPB3q39J59cjRXPriR0e+7wPZcjafomqeyAua1CAksOMt9zm
   sLb4LGaT3UnU3GpXezXiGBbAm6byrriC+0Fo1tVmLqD3Tgk05LEp0NxWE
   KWt2UwOntJUrPR0cD4T01NUn2h17JJbQFB/CT6wnWR7vDLjEyOzfQv8Oj
   ogYWQ1UYi7MffzDAMTgn8qVn0AZCGfyS/QvuMFzJLSJXsTFmMMpPCm+iZ
   subScDbPUQq73bUJRUW/AnoTGjEGcSZsN6BnXCdsXwxSUQK5xTTefwCv7
   FQub37UjF4hKWL2XqeBjw4WmMNx31sMoWzGS8Ed/Z22oKSw2MHmVPxJN1
   A==;
X-CSE-ConnectionGUID: OufRn92OTyis9atL/4ZMGA==
X-CSE-MsgGUID: T64z5uXpQWqER6HrqnxLbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15624675"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="15624675"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 15:19:59 -0700
X-CSE-ConnectionGUID: bp6pEPz/Q9aNR0228arN9w==
X-CSE-MsgGUID: oKR0uhj1Q5KsKKtaMpb/ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="42151062"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Jun 2024 15:19:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sK3ek-00072w-2g;
	Wed, 19 Jun 2024 22:19:54 +0000
Date: Thu, 20 Jun 2024 06:19:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [paulmck-rcu:dev.2024.06.06a 27/34]
 kernel/time/clocksource.c:136:25: error:
 'CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US' undeclared
Message-ID: <202406200644.R3fwDBlr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "commit 421469c14614591c29c312d929142dbb07e3d521 was found in branch paulmck-rcu/dev.2024.06.06a, not in new branch paulmck-rcu/dev.2024.06.18a"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2024.06.06a
head:   f29bcafffef0ecc8a5d2cdc1bbef9a6889225263
commit: 421469c14614591c29c312d929142dbb07e3d521 [27/34] Clocksource: Take advantage of always-defined CLOCKSOURCE_WATCHDOG_MAX_SKEW_US
:::::: branch date: 26 hours ago
:::::: commit date: 6 days ago
config: arc-randconfig-002-20240620 (https://download.01.org/0day-ci/archive/20240620/202406200644.R3fwDBlr-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406200644.R3fwDBlr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406200644.R3fwDBlr-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/time/clocksource.c: In function '__clocksource_update_freq_scale':
>> kernel/time/clocksource.c:136:25: error: 'CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US' undeclared (first use in this function)
     136 | #define MAX_SKEW_USEC   CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/clocksource.c:137:28: note: in expansion of macro 'MAX_SKEW_USEC'
     137 | #define WATCHDOG_MAX_SKEW (MAX_SKEW_USEC * NSEC_PER_USEC)
         |                            ^~~~~~~~~~~~~
   kernel/time/clocksource.c:1167:50: note: in expansion of macro 'WATCHDOG_MAX_SKEW'
    1167 |                 if (cs->uncertainty_margin < 2 * WATCHDOG_MAX_SKEW)
         |                                                  ^~~~~~~~~~~~~~~~~
   kernel/time/clocksource.c:136:25: note: each undeclared identifier is reported only once for each function it appears in
     136 | #define MAX_SKEW_USEC   CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/clocksource.c:137:28: note: in expansion of macro 'MAX_SKEW_USEC'
     137 | #define WATCHDOG_MAX_SKEW (MAX_SKEW_USEC * NSEC_PER_USEC)
         |                            ^~~~~~~~~~~~~
   kernel/time/clocksource.c:1167:50: note: in expansion of macro 'WATCHDOG_MAX_SKEW'
    1167 |                 if (cs->uncertainty_margin < 2 * WATCHDOG_MAX_SKEW)
         |                                                  ^~~~~~~~~~~~~~~~~


vim +/CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US +136 kernel/time/clocksource.c

2e27e793e280ff1 Paul E. McKenney 2021-05-27  119  
2e27e793e280ff1 Paul E. McKenney 2021-05-27  120  /*
2e27e793e280ff1 Paul E. McKenney 2021-05-27  121   * Maximum permissible delay between two readouts of the watchdog
2e27e793e280ff1 Paul E. McKenney 2021-05-27  122   * clocksource surrounding a read of the clocksource being validated.
2e27e793e280ff1 Paul E. McKenney 2021-05-27  123   * This delay could be due to SMIs, NMIs, or to VCPU preemptions.  Used as
2e27e793e280ff1 Paul E. McKenney 2021-05-27  124   * a lower bound for cs->uncertainty_margin values when registering clocks.
c37e85c135cead4 Paul E. McKenney 2022-12-06  125   *
c37e85c135cead4 Paul E. McKenney 2022-12-06  126   * The default of 500 parts per million is based on NTP's limits.
c37e85c135cead4 Paul E. McKenney 2022-12-06  127   * If a clocksource is good enough for NTP, it is good enough for us!
5b1825ddca43b53 Borislav Petkov  2024-06-12  128   *
5b1825ddca43b53 Borislav Petkov  2024-06-12  129   * In other words, by default, even if a clocksource is extremely
5b1825ddca43b53 Borislav Petkov  2024-06-12  130   * precise (for example, with a sub-nanosecond period), the maximum
5b1825ddca43b53 Borislav Petkov  2024-06-12  131   * permissible skew between the clocksource watchdog and the clocksource
5b1825ddca43b53 Borislav Petkov  2024-06-12  132   * under test is not permitted to go below the 500ppm minimum defined
5b1825ddca43b53 Borislav Petkov  2024-06-12  133   * by MAX_SKEW_USEC.  This 500ppm minimum may be overridden using the
5b1825ddca43b53 Borislav Petkov  2024-06-12  134   * CLOCKSOURCE_WATCHDOG_MAX_SKEW_US Kconfig option.
2e27e793e280ff1 Paul E. McKenney 2021-05-27  135   */
fc153c1c58cb8c3 Waiman Long      2021-12-05 @136  #define MAX_SKEW_USEC	CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US
fc153c1c58cb8c3 Waiman Long      2021-12-05  137  #define WATCHDOG_MAX_SKEW (MAX_SKEW_USEC * NSEC_PER_USEC)
2e27e793e280ff1 Paul E. McKenney 2021-05-27  138  

:::::: The code at line 136 was first introduced by commit
:::::: fc153c1c58cb8c3bb3b443b4d7dc3211ff5f65fc clocksource: Add a Kconfig option for WATCHDOG_MAX_SKEW

:::::: TO: Waiman Long <longman@redhat.com>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
