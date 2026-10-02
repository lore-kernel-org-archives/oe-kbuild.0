Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70482BE035
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Oct 2026 01:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790904527; cv=none; b=dWyl+DEKAIqzi6CKqrzCvfVL1558/XnKYM2QaPnGSq9QiKbkArr520WKOARx0BqJppR1xdHGj5JPCP4Ns1BbjXO8fiJSJJIbnQNPYzDGyqVPIohY4RSPMINXMA8dqkPW+hEczJBxcC6B5eVaz6Vt74zgMe7hGXhbGCVgO5nDpcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790904527; c=relaxed/simple;
	bh=lrAoaCvm3i9WNRhQtMvr6WreTOWB5hla5yViIwwMFfc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FFf+/1DaeXB1e4+r9CxWVnuk16uZPTBIkLIl8AfzCPieQQfanevUgT51mKJwok51gfidf+E+oeIBIqQQ/af3775EQ22KiVaN9ax27W9eOrrHD0khBcamqJKApI+egNSeGHSGb6fcu970EXunTJyv49Q5wU6MOwhOPZRjRuKStuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y6EIUIl8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y6EIUIl8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790904524; x=1822440524;
  h=date:from:to:cc:subject:message-id;
  bh=lrAoaCvm3i9WNRhQtMvr6WreTOWB5hla5yViIwwMFfc=;
  b=Y6EIUIl8BQJLP/GpdI8oOXcmwFdHHnboQueTWBI7M9jPa+rMkstnkHd0
   bkzpHccZogzkAIB1YszoaMHTN5LP/0iisMXZoKYNnCwYrQB5p84PEesOY
   EMDAz/7b6DDBetGMlGPlOpwQjN7JJFWPJkOzXAlJE9+FYi+C9SoBt0mtJ
   qYsPvLWrzk5u/7nDFiT1cVRM367FXqjkJVOm2MtFtHxD9UmZA5xR2ke29
   zYncsXOw2NVp1mQYHYW53OF7HCk8okJ40VFJUMBzedbraJGAvAVD8d6w1
   gfR+roKuiZyGcoBXe7ij7VeS7dbM0dPEZxLXmqdG4iaFB6XDYFN3rN8Tr
   w==;
X-CSE-ConnectionGUID: MDFjW0cKSqSKLPsJoEW38w==
X-CSE-MsgGUID: Pt7K3kayR4m9XC76YmoIQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="102199218"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="102199218"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 18:28:42 -0700
X-CSE-ConnectionGUID: M1q+rxVRQ9+yItHYySYzjw==
X-CSE-MsgGUID: x884zY8mSEG8XcbRUrWrxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="274228291"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 01 Oct 2026 18:28:41 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCS4k-000000000KH-0mdS;
	Fri, 02 Oct 2026 01:28:38 +0000
Date: Fri, 02 Oct 2026 03:28:10 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [iwlwifi-next:next 59/75]
 drivers/net/wireless/intel/iwlwifi/pcie/trans.c:2409:1-7: preceding lock on
 line 2341
Message-ID: <202610020316.KUXGBgHz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Miri Korenblit <miriam.rachel.korenblit@intel.com>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git next
head:   f57fea3e69a06c3377092834e74d9841e1af3210
commit: f683e93e84341b3e4dff12fa06e70bee00025f47 [59/75] wifi: iwlwifi: drop the orphaned nic_access annotations
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: powerpc64-randconfig-r2100-20261002 (https://download.01.org/0day-ci/archive/20261002/202610020316.KUXGBgHz-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610020316.KUXGBgHz-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/wireless/intel/iwlwifi/pcie/trans.c:2409:1-7: preceding lock on line 2341

vim +2409 drivers/net/wireless/intel/iwlwifi/pcie/trans.c

b8133439bda70f drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Avraham Stern     2022-11-23  2324  
c544d89b0d67d9 drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Johannes Berg     2021-04-15  2325  /*
c544d89b0d67d9 drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Johannes Berg     2021-04-15  2326   * This version doesn't disable BHs but rather assumes they're
c544d89b0d67d9 drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Johannes Berg     2021-04-15  2327   * already disabled.
c544d89b0d67d9 drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Johannes Berg     2021-04-15  2328   */
e4588c25c9d122 drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c Marco Elver       2025-12-19  2329  bool _iwl_trans_pcie_grab_nic_access(struct iwl_trans *trans, bool silent)
7a65d17053c758 drivers/net/wireless/iwlwifi/pcie/trans.c              Emmanuel Grumbach 2012-12-24  2330  {
7a65d17053c758 drivers/net/wireless/iwlwifi/pcie/trans.c              Emmanuel Grumbach 2012-12-24  2331  	int ret;
cfb4e624314b65 drivers/net/wireless/iwlwifi/pcie/trans.c              Johannes Berg     2013-06-20  2332  	struct iwl_trans_pcie *trans_pcie = IWL_TRANS_GET_PCIE_TRANS(trans);
9ce041f5966fd0 drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Johannes Berg     2021-08-02  2333  	u32 write = CSR_GP_CNTRL_REG_FLAG_MAC_ACCESS_REQ;
9ce041f5966fd0 drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Johannes Berg     2021-08-02  2334  	u32 mask = CSR_GP_CNTRL_REG_FLAG_MAC_CLOCK_READY |
9ce041f5966fd0 drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Johannes Berg     2021-08-02  2335  		   CSR_GP_CNTRL_REG_FLAG_GOING_TO_SLEEP;
9ce041f5966fd0 drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Johannes Berg     2021-08-02  2336  	u32 poll = CSR_GP_CNTRL_REG_VAL_MAC_ACCESS_EN;
cfb4e624314b65 drivers/net/wireless/iwlwifi/pcie/trans.c              Johannes Berg     2013-06-20  2337  
6185e1e5b4d0a7 drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Johannes Berg     2023-09-21  2338  	if (test_bit(STATUS_TRANS_DEAD, &trans->status))
6185e1e5b4d0a7 drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Johannes Berg     2023-09-21  2339  		return false;
6185e1e5b4d0a7 drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Johannes Berg     2023-09-21  2340  
c544d89b0d67d9 drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Johannes Berg     2021-04-15 @2341  	spin_lock(&trans_pcie->reg_lock);
7a65d17053c758 drivers/net/wireless/iwlwifi/pcie/trans.c              Emmanuel Grumbach 2012-12-24  2342  
fc8a350d0b8df7 drivers/net/wireless/iwlwifi/pcie/trans.c              Ilan Peer         2015-05-13  2343  	if (trans_pcie->cmd_hold_nic_awake)
b9439491055a18 drivers/net/wireless/iwlwifi/pcie/trans.c              Emmanuel Grumbach 2013-12-22  2344  		goto out;
b9439491055a18 drivers/net/wireless/iwlwifi/pcie/trans.c              Emmanuel Grumbach 2013-12-22  2345  
c96a36491003d7 drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Johannes Berg     2025-05-08  2346  	if (trans->mac_cfg->device_family >= IWL_DEVICE_FAMILY_BZ) {
9ce041f5966fd0 drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Johannes Berg     2021-08-02  2347  		write = CSR_GP_CNTRL_REG_FLAG_BZ_MAC_ACCESS_REQ;
9ce041f5966fd0 drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Johannes Berg     2021-08-02  2348  		mask = CSR_GP_CNTRL_REG_FLAG_MAC_STATUS;
9ce041f5966fd0 drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Johannes Berg     2021-08-02  2349  		poll = CSR_GP_CNTRL_REG_FLAG_MAC_STATUS;
9ce041f5966fd0 drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Johannes Berg     2021-08-02  2350  	}
9ce041f5966fd0 drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Johannes Berg     2021-08-02  2351  
7a65d17053c758 drivers/net/wireless/iwlwifi/pcie/trans.c              Emmanuel Grumbach 2012-12-24  2352  	/* this bit wakes up the NIC */
dc6bc511216639 drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c Rotem Kerem       2025-06-12  2353  	iwl_trans_set_bit(trans, CSR_GP_CNTRL, write);
c96a36491003d7 drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Johannes Berg     2025-05-08  2354  	if (trans->mac_cfg->device_family >= IWL_DEVICE_FAMILY_8000)
01e58a281e6f01 drivers/net/wireless/iwlwifi/pcie/trans.c              Emmanuel Grumbach 2014-10-27  2355  		udelay(2);
7a65d17053c758 drivers/net/wireless/iwlwifi/pcie/trans.c              Emmanuel Grumbach 2012-12-24  2356  
7a65d17053c758 drivers/net/wireless/iwlwifi/pcie/trans.c              Emmanuel Grumbach 2012-12-24  2357  	/*
7a65d17053c758 drivers/net/wireless/iwlwifi/pcie/trans.c              Emmanuel Grumbach 2012-12-24  2358  	 * These bits say the device is running, and should keep running for
7a65d17053c758 drivers/net/wireless/iwlwifi/pcie/trans.c              Emmanuel Grumbach 2012-12-24  2359  	 * at least a short while (at least as long as MAC_ACCESS_REQ stays 1),
7a65d17053c758 drivers/net/wireless/iwlwifi/pcie/trans.c              Emmanuel Grumbach 2012-12-24  2360  	 * but they do not indicate that embedded SRAM is restored yet;
fb70d49f2afec8 drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Luca Coelho       2017-07-17  2361  	 * HW with volatile SRAM must save/restore contents to/from
fb70d49f2afec8 drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Luca Coelho       2017-07-17  2362  	 * host DRAM when sleeping/waking for power-saving.
7a65d17053c758 drivers/net/wireless/iwlwifi/pcie/trans.c              Emmanuel Grumbach 2012-12-24  2363  	 * Each direction takes approximately 1/4 millisecond; with this
7a65d17053c758 drivers/net/wireless/iwlwifi/pcie/trans.c              Emmanuel Grumbach 2012-12-24  2364  	 * overhead, it's a good idea to grab and hold MAC_ACCESS_REQUEST if a
7a65d17053c758 drivers/net/wireless/iwlwifi/pcie/trans.c              Emmanuel Grumbach 2012-12-24  2365  	 * series of register accesses are expected (e.g. reading Event Log),
7a65d17053c758 drivers/net/wireless/iwlwifi/pcie/trans.c              Emmanuel Grumbach 2012-12-24  2366  	 * to keep device from sleeping.
7a65d17053c758 drivers/net/wireless/iwlwifi/pcie/trans.c              Emmanuel Grumbach 2012-12-24  2367  	 *
7a65d17053c758 drivers/net/wireless/iwlwifi/pcie/trans.c              Emmanuel Grumbach 2012-12-24  2368  	 * CSR_UCODE_DRV_GP1 register bit MAC_SLEEP == 0 indicates that
7a65d17053c758 drivers/net/wireless/iwlwifi/pcie/trans.c              Emmanuel Grumbach 2012-12-24  2369  	 * SRAM is okay/restored.  We don't check that here because this call
fb70d49f2afec8 drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Luca Coelho       2017-07-17  2370  	 * is just for hardware register access; but GP1 MAC_SLEEP
fb70d49f2afec8 drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Luca Coelho       2017-07-17  2371  	 * check is a good idea before accessing the SRAM of HW with
fb70d49f2afec8 drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Luca Coelho       2017-07-17  2372  	 * volatile SRAM (e.g. reading Event Log).
7a65d17053c758 drivers/net/wireless/iwlwifi/pcie/trans.c              Emmanuel Grumbach 2012-12-24  2373  	 *
7a65d17053c758 drivers/net/wireless/iwlwifi/pcie/trans.c              Emmanuel Grumbach 2012-12-24  2374  	 * 5000 series and later (including 1000 series) have non-volatile SRAM,
7a65d17053c758 drivers/net/wireless/iwlwifi/pcie/trans.c              Emmanuel Grumbach 2012-12-24  2375  	 * and do not save/restore SRAM when power cycling.
7a65d17053c758 drivers/net/wireless/iwlwifi/pcie/trans.c              Emmanuel Grumbach 2012-12-24  2376  	 */
14db492738d922 drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c Rotem Kerem       2025-07-09  2377  	ret = iwl_poll_bits_mask(trans, CSR_GP_CNTRL, poll, mask, 15000);
48d41b73316c80 drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c Itamar Shalev     2025-07-09  2378  	if (unlikely(ret)) {
49564a806fc555 drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Luca Coelho       2017-12-12  2379  		u32 cntrl = iwl_read32(trans, CSR_GP_CNTRL);
49564a806fc555 drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Luca Coelho       2017-12-12  2380  
15220a257319ff drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Emmanuel Grumbach 2025-04-20  2381  		if (silent) {
15220a257319ff drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Emmanuel Grumbach 2025-04-20  2382  			spin_unlock(&trans_pcie->reg_lock);
15220a257319ff drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Emmanuel Grumbach 2025-04-20  2383  			return false;
15220a257319ff drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Emmanuel Grumbach 2025-04-20  2384  		}
15220a257319ff drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Emmanuel Grumbach 2025-04-20  2385  
7a65d17053c758 drivers/net/wireless/iwlwifi/pcie/trans.c              Emmanuel Grumbach 2012-12-24  2386  		WARN_ONCE(1,
7a65d17053c758 drivers/net/wireless/iwlwifi/pcie/trans.c              Emmanuel Grumbach 2012-12-24  2387  			  "Timeout waiting for hardware access (CSR_GP_CNTRL 0x%08x)\n",
49564a806fc555 drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Luca Coelho       2017-12-12  2388  			  cntrl);
49564a806fc555 drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Luca Coelho       2017-12-12  2389  
e4efdfcaaf49bd drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c Rotem Kerem       2025-06-12  2390  		iwl_trans_pcie_dump_regs(trans, trans_pcie->pci_dev);
49564a806fc555 drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Luca Coelho       2017-12-12  2391  
b8133439bda70f drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Avraham Stern     2022-11-23  2392  		if (iwlwifi_mod_params.remove_when_gone && cntrl == ~0U)
9673c35486d473 drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Johannes Berg     2024-12-31  2393  			iwl_trans_pcie_reset(trans,
9673c35486d473 drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Johannes Berg     2024-12-31  2394  					     IWL_RESET_MODE_REMOVE_ONLY);
b8133439bda70f drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Avraham Stern     2022-11-23  2395  		else
49564a806fc555 drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Luca Coelho       2017-12-12  2396  			iwl_write32(trans, CSR_RESET,
49564a806fc555 drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Luca Coelho       2017-12-12  2397  				    CSR_RESET_REG_FLAG_FORCE_NMI);
49564a806fc555 drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Luca Coelho       2017-12-12  2398  
c544d89b0d67d9 drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Johannes Berg     2021-04-15  2399  		spin_unlock(&trans_pcie->reg_lock);
7a65d17053c758 drivers/net/wireless/iwlwifi/pcie/trans.c              Emmanuel Grumbach 2012-12-24  2400  		return false;
7a65d17053c758 drivers/net/wireless/iwlwifi/pcie/trans.c              Emmanuel Grumbach 2012-12-24  2401  	}
7a65d17053c758 drivers/net/wireless/iwlwifi/pcie/trans.c              Emmanuel Grumbach 2012-12-24  2402  
b9439491055a18 drivers/net/wireless/iwlwifi/pcie/trans.c              Emmanuel Grumbach 2013-12-22  2403  out:
e56b04efc1f795 drivers/net/wireless/iwlwifi/pcie/trans.c              Lilach Edelstein  2013-01-16  2404  	/*
f683e93e84341b drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Miri Korenblit    2026-09-26  2405  	 * Deliberately return with reg_lock held; the caller must drop it via
f683e93e84341b drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Miri Korenblit    2026-09-26  2406  	 * iwl_trans_pcie_release_nic_access(), or explicitly if it wants to
f683e93e84341b drivers/net/wireless/intel/iwlwifi/pcie/trans.c        Miri Korenblit    2026-09-26  2407  	 * keep the NIC awake past the critical section (cmd_hold_nic_awake).
e56b04efc1f795 drivers/net/wireless/iwlwifi/pcie/trans.c              Lilach Edelstein  2013-01-16  2408  	 */
7a65d17053c758 drivers/net/wireless/iwlwifi/pcie/trans.c              Emmanuel Grumbach 2012-12-24 @2409  	return true;
7a65d17053c758 drivers/net/wireless/iwlwifi/pcie/trans.c              Emmanuel Grumbach 2012-12-24  2410  }
7a65d17053c758 drivers/net/wireless/iwlwifi/pcie/trans.c              Emmanuel Grumbach 2012-12-24  2411  

:::::: The code at line 2409 was first introduced by commit
:::::: 7a65d17053c758109477f420e813ba2d826b0eae iwlwifi: virtualize iwl_{grab,release}_nic_access

:::::: TO: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
