Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C7B58137
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Nov 2023 17:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hKxncJnU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701366269; x=1732902269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vvCSsMhaHRlaQ6lwzQ0sWtHRnMBPkQS2N+6d4cuQ+9c=;
  b=hKxncJnUbkAfokU6atruOJQbbMoMQFqmh84JtIWDEERrIKnMy0oipY1s
   tFCldi2/vQOhYBGQgJ3C3LeLXr7CohtkOk37qlZW5k0pJqy4wD7MkzIJe
   Kw1gLcw0lTd9yJovEaV6oGcXMi8gBglOznsXUNYiE2f07icl+dN+aZg7b
   G9XyRinAva/zEZURsLDYDxlrLXJoUDrM759spe61YIJq9y9SwSoQJsU7G
   gp9wWYOdqWCA5qE9qQt+PH6LuHSGc5Jf7HtPn8IrK/fzNTsiee2ZvlD4v
   L/4s8fovzgDQv+O89gdlHJy5Kvmlf6kHtJB0quNa4RIy/gWh1WPzAD0nx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="353895"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="353895"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 09:44:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="1016719398"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="1016719398"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 30 Nov 2023 09:44:24 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8l5K-0002TE-1Y;
	Thu, 30 Nov 2023 17:44:22 +0000
Date: Fri, 1 Dec 2023 01:43:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] posix-timers: add multi_clock_gettime system call
Message-ID: <202312010141.Mz5MHrQK-lkp@intel.com>
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
In-Reply-To: <20231127153901.6399-1-maimon.sagi@gmail.com>
References: <20231127153901.6399-1-maimon.sagi@gmail.com>
TO: Sagi Maimon <maimon.sagi@gmail.com>
TO: richardcochran@gmail.com
TO: reibax@gmail.com
TO: davem@davemloft.net
TO: rrameshbabu@nvidia.com
CC: netdev@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: maheshb@google.com
CC: maimon.sagi@gmail.com

Hi Sagi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arnd-asm-generic/master]
[also build test WARNING on tip/timers/core linus/master v6.7-rc3]
[cannot apply to tip/x86/asm next-20231130]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sagi-Maimon/posix-timers-add-multi_clock_gettime-system-call/20231128-000215
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git master
patch link:    https://lore.kernel.org/r/20231127153901.6399-1-maimon.sagi%40gmail.com
patch subject: [PATCH v2] posix-timers: add multi_clock_gettime system call
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-r081-20231130 (https://download.01.org/0day-ci/archive/20231201/202312010141.Mz5MHrQK-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20231201/202312010141.Mz5MHrQK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312010141.Mz5MHrQK-lkp@intel.com/

smatch warnings:
kernel/time/posix-timers.c:1457 __do_sys_multi_clock_gettime() error: uninitialized symbol 'error'.
kernel/time/posix-timers.c:1457 __do_sys_multi_clock_gettime() error: uninitialized symbol 'error'.
kernel/time/posix-timers.c:1488 __do_sys_multi_clock_gettime32() error: uninitialized symbol 'error'.
kernel/time/posix-timers.c:1488 __do_sys_multi_clock_gettime32() error: uninitialized symbol 'error'.

vim +/error +1457 kernel/time/posix-timers.c

6631fa12c105e3 Thomas Gleixner 2017-05-30  1428  
2b752da024b14d Sagi Maimon     2023-11-27  1429  SYSCALL_DEFINE1(multi_clock_gettime, struct __ptp_multi_clock_get __user *, ptp_multi_clk_get)
2b752da024b14d Sagi Maimon     2023-11-27  1430  {
2b752da024b14d Sagi Maimon     2023-11-27  1431  	const struct k_clock *kc;
2b752da024b14d Sagi Maimon     2023-11-27  1432  	struct timespec64 kernel_tp;
2b752da024b14d Sagi Maimon     2023-11-27  1433  	struct __ptp_multi_clock_get multi_clk_get;
2b752da024b14d Sagi Maimon     2023-11-27  1434  	int error;
2b752da024b14d Sagi Maimon     2023-11-27  1435  	unsigned int i, j;
2b752da024b14d Sagi Maimon     2023-11-27  1436  
2b752da024b14d Sagi Maimon     2023-11-27  1437  	if (copy_from_user(&multi_clk_get, ptp_multi_clk_get, sizeof(multi_clk_get)))
2b752da024b14d Sagi Maimon     2023-11-27  1438  		return -EFAULT;
2b752da024b14d Sagi Maimon     2023-11-27  1439  
2b752da024b14d Sagi Maimon     2023-11-27  1440  	if (multi_clk_get.n_samples > MULTI_PTP_MAX_SAMPLES)
2b752da024b14d Sagi Maimon     2023-11-27  1441  		return -EINVAL;
2b752da024b14d Sagi Maimon     2023-11-27  1442  	if (multi_clk_get.n_clocks > MULTI_PTP_MAX_CLOCKS)
2b752da024b14d Sagi Maimon     2023-11-27  1443  		return -EINVAL;
2b752da024b14d Sagi Maimon     2023-11-27  1444  
2b752da024b14d Sagi Maimon     2023-11-27  1445  	for (j = 0; j < multi_clk_get.n_samples; j++) {
2b752da024b14d Sagi Maimon     2023-11-27  1446  		for (i = 0; i < multi_clk_get.n_clocks; i++) {
2b752da024b14d Sagi Maimon     2023-11-27  1447  			kc = clockid_to_kclock(multi_clk_get.clkid_arr[i]);
2b752da024b14d Sagi Maimon     2023-11-27  1448  			if (!kc)
2b752da024b14d Sagi Maimon     2023-11-27  1449  				return -EINVAL;
2b752da024b14d Sagi Maimon     2023-11-27  1450  			error = kc->clock_get_timespec(multi_clk_get.clkid_arr[i], &kernel_tp);
2b752da024b14d Sagi Maimon     2023-11-27  1451  			if (!error && put_timespec64(&kernel_tp, (struct __kernel_timespec __user *)
2b752da024b14d Sagi Maimon     2023-11-27  1452  						     &ptp_multi_clk_get->ts[j][i]))
2b752da024b14d Sagi Maimon     2023-11-27  1453  				error = -EFAULT;
2b752da024b14d Sagi Maimon     2023-11-27  1454  		}
2b752da024b14d Sagi Maimon     2023-11-27  1455  	}
2b752da024b14d Sagi Maimon     2023-11-27  1456  
2b752da024b14d Sagi Maimon     2023-11-27 @1457  	return error;
2b752da024b14d Sagi Maimon     2023-11-27  1458  }
2b752da024b14d Sagi Maimon     2023-11-27  1459  
2b752da024b14d Sagi Maimon     2023-11-27  1460  SYSCALL_DEFINE1(multi_clock_gettime32, struct __ptp_multi_clock_get32 __user *, ptp_multi_clk_get)
2b752da024b14d Sagi Maimon     2023-11-27  1461  {
2b752da024b14d Sagi Maimon     2023-11-27  1462  	const struct k_clock *kc;
2b752da024b14d Sagi Maimon     2023-11-27  1463  	struct timespec64 kernel_tp;
2b752da024b14d Sagi Maimon     2023-11-27  1464  	struct __ptp_multi_clock_get multi_clk_get;
2b752da024b14d Sagi Maimon     2023-11-27  1465  	int error;
2b752da024b14d Sagi Maimon     2023-11-27  1466  	unsigned int i, j;
2b752da024b14d Sagi Maimon     2023-11-27  1467  
2b752da024b14d Sagi Maimon     2023-11-27  1468  	if (copy_from_user(&multi_clk_get, ptp_multi_clk_get, sizeof(multi_clk_get)))
2b752da024b14d Sagi Maimon     2023-11-27  1469  		return -EFAULT;
2b752da024b14d Sagi Maimon     2023-11-27  1470  
2b752da024b14d Sagi Maimon     2023-11-27  1471  	if (multi_clk_get.n_samples > MULTI_PTP_MAX_SAMPLES)
2b752da024b14d Sagi Maimon     2023-11-27  1472  		return -EINVAL;
2b752da024b14d Sagi Maimon     2023-11-27  1473  	if (multi_clk_get.n_clocks > MULTI_PTP_MAX_CLOCKS)
2b752da024b14d Sagi Maimon     2023-11-27  1474  		return -EINVAL;
2b752da024b14d Sagi Maimon     2023-11-27  1475  
2b752da024b14d Sagi Maimon     2023-11-27  1476  	for (j = 0; j < multi_clk_get.n_samples; j++) {
2b752da024b14d Sagi Maimon     2023-11-27  1477  		for (i = 0; i < multi_clk_get.n_clocks; i++) {
2b752da024b14d Sagi Maimon     2023-11-27  1478  			kc = clockid_to_kclock(multi_clk_get.clkid_arr[i]);
2b752da024b14d Sagi Maimon     2023-11-27  1479  			if (!kc)
2b752da024b14d Sagi Maimon     2023-11-27  1480  				return -EINVAL;
2b752da024b14d Sagi Maimon     2023-11-27  1481  			error = kc->clock_get_timespec(multi_clk_get.clkid_arr[i], &kernel_tp);
2b752da024b14d Sagi Maimon     2023-11-27  1482  			if (!error && put_old_timespec32(&kernel_tp, (struct old_timespec32 __user *)
2b752da024b14d Sagi Maimon     2023-11-27  1483  							&ptp_multi_clk_get->ts[j][i]))
2b752da024b14d Sagi Maimon     2023-11-27  1484  				error = -EFAULT;
2b752da024b14d Sagi Maimon     2023-11-27  1485  		}
2b752da024b14d Sagi Maimon     2023-11-27  1486  	}
2b752da024b14d Sagi Maimon     2023-11-27  1487  
2b752da024b14d Sagi Maimon     2023-11-27 @1488  	return error;
2b752da024b14d Sagi Maimon     2023-11-27  1489  }
2b752da024b14d Sagi Maimon     2023-11-27  1490  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
