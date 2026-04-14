Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4551C8460
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Apr 2026 00:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776126408; cv=none; b=E6j1SHPLhUF81098VHMsi2+pAv7y3qdH2bJ6sW4IA4p63IKHDT1ORmm4sB5emZ+K44vX6ryfCBALzqGH5lKHTPJKb840D9NZFskljXQ8HpLlK//dV4HcWpnZU9ylGGKdY5ebHhmZ4LAIoZqGmXAWLAuUJXhhH24mF9N0gc0CzB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776126408; c=relaxed/simple;
	bh=aU+8OKEIZzBxrSGcxGf9Qu9JYfdSZGT3PEnAIzsCTlg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DDW8cZpru3Nw3dXHjT8psL8nsDwupOtTwFLNgD4O0Vk0lJuPOx7/xQtMezb7BCpYYwxeU0d5/mTjan0SCIaOjvCfbSVIMDfd9g4DQhYGS3CCAelyO9PU3nYwg8M3dC+MvYvveo1KOiC0nWCjrbqvVIaj7LN+vQzxMD5wOTfYqQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i9+x2FNL; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i9+x2FNL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776126406; x=1807662406;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aU+8OKEIZzBxrSGcxGf9Qu9JYfdSZGT3PEnAIzsCTlg=;
  b=i9+x2FNLvyVY8+oAIIc1PUdAFZRUYZwSaNBbsh/AUCximkjnGB4+HjtH
   a7NWonH3xyj6ubFxUjdORJfuMYiqUFSFschj1RFbjmQlJ7UnnRPsylUZw
   27ThA4yt263QnRBmL0zxtZ/abyaw4rQqbsZC6QLzkH26PW5VV8QkNzAY2
   efB8iQ1USkSZOW4C92zSHXJZkwhZJJsvo/uqdttsF0V1osUpWn5DyRFK4
   kA3owu2LoJOgaYo4AZO0HmBW6v7OiJfdWensG8NiKOPkUVqufbe6deHyu
   /x8bDN7cErf7tf8989iWMYV49u6m/cKyyrNQNnP6CdKVH7/vYKPOqJXO5
   Q==;
X-CSE-ConnectionGUID: Ag1GuQSdTvKjq0zF+V7oiA==
X-CSE-MsgGUID: an2+hPbsS46VnkgsfFWyFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="77254711"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="77254711"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 17:26:45 -0700
X-CSE-ConnectionGUID: dewjdVjwQT2x7rrwM9Tl5g==
X-CSE-MsgGUID: ktd1brHJSw2opgc3pN6q1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="229058078"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Apr 2026 17:26:44 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCRc2-0000000010X-1jaS;
	Tue, 14 Apr 2026 00:26:42 +0000
Date: Tue, 14 Apr 2026 08:26:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3] Bluetooth: btintel_pcie: Support Product level reset
Message-ID: <202604140816.wm7rA2AH-lkp@intel.com>
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
In-Reply-To: <20260413042041.1318723-1-chandrashekar.devegowda@intel.com>
References: <20260413042041.1318723-1-chandrashekar.devegowda@intel.com>
TO: Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>
TO: linux-bluetooth@vger.kernel.org
CC: linux-pci@vger.kernel.org
CC: bhelgaas@google.com
CC: ravishankar.srivatsa@intel.com
CC: chethan.tumkur.narayan@intel.com
CC: Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>

Hi Chandrashekar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bluetooth-next/master]
[cannot apply to bluetooth/master linus/master v7.0]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chandrashekar-Devegowda/Bluetooth-btintel_pcie-Support-Product-level-reset/20260414-025925
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20260413042041.1318723-1-chandrashekar.devegowda%40intel.com
patch subject: [PATCH v3] Bluetooth: btintel_pcie: Support Product level reset
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: i386-randconfig-141-20260414 (https://download.01.org/0day-ci/archive/20260414/202604140816.wm7rA2AH-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9007-gcf3ea02b

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604140816.wm7rA2AH-lkp@intel.com/

smatch warnings:
drivers/bluetooth/btintel_pcie.c:2405 btintel_pcie_reset_work() warn: can 'data' even be NULL?

vim +/data +2405 drivers/bluetooth/btintel_pcie.c

d12004a0c6a569 Chandrashekar Devegowda 2026-04-13  2392  
d12004a0c6a569 Chandrashekar Devegowda 2026-04-13  2393  static void btintel_pcie_reset_work(struct work_struct *wk)
d12004a0c6a569 Chandrashekar Devegowda 2026-04-13  2394  {
d12004a0c6a569 Chandrashekar Devegowda 2026-04-13  2395  	struct btintel_pcie_data *data =
d12004a0c6a569 Chandrashekar Devegowda 2026-04-13  2396  		container_of(wk, struct btintel_pcie_data, reset_work);
d12004a0c6a569 Chandrashekar Devegowda 2026-04-13  2397  	struct pci_dev *pdev = data->pdev;
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2398  	int err;
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2399  
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2400  	pci_lock_rescan_remove();
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2401  
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2402  	if (!pdev->bus)
d12004a0c6a569 Chandrashekar Devegowda 2026-04-13  2403  		goto out;
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2404  
d12004a0c6a569 Chandrashekar Devegowda 2026-04-13 @2405  	if (!data)
d12004a0c6a569 Chandrashekar Devegowda 2026-04-13  2406  		goto out;
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2407  
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2408  	btintel_pcie_disable_interrupts(data);
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2409  	btintel_pcie_synchronize_irqs(data);
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2410  
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2411  	flush_work(&data->rx_work);
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2412  
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2413  	bt_dev_dbg(data->hdev, "Release bluetooth interface");
d12004a0c6a569 Chandrashekar Devegowda 2026-04-13  2414  	if (data->reset_type == BTINTEL_PCIE_IOSF_PRR_PLDR) {
d12004a0c6a569 Chandrashekar Devegowda 2026-04-13  2415  		/* This function holds pci_lock_rescan_remove(), which acquires
d12004a0c6a569 Chandrashekar Devegowda 2026-04-13  2416  		 * pci_rescan_remove_lock. This mutex serializes against PCI device
d12004a0c6a569 Chandrashekar Devegowda 2026-04-13  2417  		 * addition/removal (hotplug), so no device can be added to or
d12004a0c6a569 Chandrashekar Devegowda 2026-04-13  2418  		 * removed from the bus list while this code runs.
d12004a0c6a569 Chandrashekar Devegowda 2026-04-13  2419  		 */
d12004a0c6a569 Chandrashekar Devegowda 2026-04-13  2420  		btintel_pcie_perform_pldr(data);
d12004a0c6a569 Chandrashekar Devegowda 2026-04-13  2421  		goto out;
d12004a0c6a569 Chandrashekar Devegowda 2026-04-13  2422  	}
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2423  	btintel_pcie_release_hdev(data);
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2424  
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2425  	err = pci_reset_function(pdev);
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2426  	if (err) {
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2427  		BT_ERR("Failed resetting the pcie device (%d)", err);
d12004a0c6a569 Chandrashekar Devegowda 2026-04-13  2428  		goto out;
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2429  	}
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2430  
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2431  	btintel_pcie_enable_interrupts(data);
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2432  	btintel_pcie_config_msix(data);
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2433  
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2434  	err = btintel_pcie_enable_bt(data);
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2435  	if (err) {
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2436  		BT_ERR("Failed to enable bluetooth hardware after reset (%d)",
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2437  		       err);
d12004a0c6a569 Chandrashekar Devegowda 2026-04-13  2438  		goto out;
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2439  	}
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2440  
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2441  	btintel_pcie_reset_ia(data);
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2442  	btintel_pcie_start_rx(data);
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2443  	data->flags = 0;
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2444  
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2445  	err = btintel_pcie_setup_hdev(data);
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2446  	if (err) {
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2447  		BT_ERR("Failed registering hdev (%d)", err);
d12004a0c6a569 Chandrashekar Devegowda 2026-04-13  2448  		goto out;
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2449  	}
d12004a0c6a569 Chandrashekar Devegowda 2026-04-13  2450  out:
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2451  	pci_dev_put(pdev);
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2452  	pci_unlock_rescan_remove();
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2453  }
256ab9520d15c7 Chandrashekar Devegowda 2025-06-10  2454  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
