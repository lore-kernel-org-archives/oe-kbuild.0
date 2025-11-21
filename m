Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7469B34D39E
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Nov 2025 14:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763735697; cv=none; b=rEUNpcykJZMKDWixPAWcquG4CH906QhyhNi86LzN58O2kIrm9CVhPOvnjaQNHsL1afC7s8xLVtOqMTR9eSyxIPNR+IQaWxQv9DywDzHENdZh8dCaUMgh/CtchQGhFxrrQeCx+TwTLsJH9m1orkaB6v84d0uVO0DhCySpgG4gS84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763735697; c=relaxed/simple;
	bh=yrorLVu11rquZsW5wRO/q7EAjROUf+SU1Xf8Um/Fz8w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rUe/N6fIs0+Hv36CqklzIwDuvaiY27zNLOqy/HzicTsHGLhkP3k5ljpSX3moBA81uIczyMeBTjrb5PNfNjSf899zSmRJxhgEkTTvkNraE0sTXNrhZahBw7faEpyG659tTtnH9doYeZPDFN6G7CfQmJUSMYLqqe/awtlmrF/d4Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eE02b8OY; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eE02b8OY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763735695; x=1795271695;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yrorLVu11rquZsW5wRO/q7EAjROUf+SU1Xf8Um/Fz8w=;
  b=eE02b8OY0tJ99DfCSNS7sR0modLWxapD+VFGgVpAMqtc8AdF6xtXEUjM
   lvAluyNq2NG2e88cvqI2CoiGRVsbq+9nZbVJDl3/93jLzgeGnEVKSSQJF
   96CZC1Oc5pGTuozFwJK86vhghcoWpsuBf31YfSHHkCZwAxYZdDaDX7QCu
   7L9xGKzylptQnpngRQKUXunklFBX4kWPHheekEIEK5XYut914wVaQl/Xx
   nPxQ4wUCsa323PBRsT8iBVCA/QuKLx2VF8MeF/X9k4nNeeQ0Uo69vqmpB
   pCmKFiVminhGMwhvdzJxV3t7O+LmzyO8br4yUF1DCDpmnrbuLW/nwxRUj
   Q==;
X-CSE-ConnectionGUID: XzwdOz9IQ8SeJaQqEhlRhw==
X-CSE-MsgGUID: DnYhjrN8T3aYS3BhBQLqSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="64832758"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="64832758"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 06:34:53 -0800
X-CSE-ConnectionGUID: Eu40P9RMSs2V1rEbZb/5ZA==
X-CSE-MsgGUID: raLQcJrxRqSbvhq4z1x3mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="195871988"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Nov 2025 06:34:52 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMSDp-0006T9-2v;
	Fri, 21 Nov 2025 14:34:49 +0000
Date: Fri, 21 Nov 2025 22:34:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: error[E0609]: no field `acpi_match_table` on type
 `bindings::device_driver`
Message-ID: <202511212222.JC3svoXd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "um-randconfig-001-20251121 results in a lot of rust failure"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Igor Korotin <igor.korotin.linux@gmail.com>
CC: Danilo Krummrich <dakr@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd95357fd8c6778ac7dea6c57a19b8b182b6e91f
commit: 8411e6f06a022679a642c236724944057b90e60e rust: platform: Add ACPI match table support to `Driver` trait
date:   5 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 5 months ago
config: um-randconfig-001-20251121 (https://download.01.org/0day-ci/archive/20251121/202511212222.JC3svoXd-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511212222.JC3svoXd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511212222.JC3svoXd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `acpi_match_table` on type `bindings::device_driver`
   --> rust/kernel/platform.rs:51:34
   |
   51 |             (*pdrv.get()).driver.acpi_match_table = acpi_table;
   |                                  ^^^^^^^^^^^^^^^^ unknown field
   |
   = note: available field is: `_address`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
