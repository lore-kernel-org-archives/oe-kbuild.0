Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C30E571
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Nov 2025 20:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764015770; cv=none; b=q9JIgRQfK9WL73/YcAo2DXQyxd5kZWAMr+Yu+UZkGLpKbOSSEjguApjbeyf3EoyPOyH/mkigD/xfjtPG2/7UQV0G8Nq05hGngQsAdHs3wR4LvVuMNB2Ofhh0LgOA8zxccESxPL5VPuZZP/vQGpxNGqOYp4gy36BWhVJTazrMFis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764015770; c=relaxed/simple;
	bh=QafFb50AvGzsFmt9SHrdYhcVwST3xBRNQILtL3E6gmM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uRqUR1TDTaFoywVkGILLJbgI1tNvWxD9lWWMqkn53Zrdd/uZ8tJ8KcdLCmlPEZa7RK4NSKhOhizb45msXyhz+gUwFTYe1MbfV39GfSO3M81GbPUqKSZeMnXkcqurJjdV1AWAHoBI+Lf33Va2MrX5Eu56WZqMUoGWuhFDzJRU0S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cTSAJ244; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cTSAJ244"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764015767; x=1795551767;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QafFb50AvGzsFmt9SHrdYhcVwST3xBRNQILtL3E6gmM=;
  b=cTSAJ244bPVxpyPN67BMZbLIsmLbVZwn257mPpuHNYJvnuiNdZpj5/Ri
   X4Y+A6YOYTtlSS4DyHoM2BcWy1oVZNnPP5bdoyPnu8Ooe18jY0Brwjcek
   seRaeequYGa8rbhGxbjrt4+7VmouTKiOe581z7RgJQHtR2/nnItYJeZQz
   G1UC0hmVpN96TeTCP+Uj2+xi8UY+P4os0vMlZr825wsDRzB6qyQafGJqu
   2DTD2bvE4vTLchkc7rO98NPv035COUk/lR7kG4ZTqldWDdvYA1iF2+Uy0
   vUl3dCrGc8pXdagk03+m+5hdh62CVHlrsvbxiYnRqRavu5PCwhgfqJWHv
   w==;
X-CSE-ConnectionGUID: MFccXi9fRBqb0p5npW4ILw==
X-CSE-MsgGUID: icJD2DSwSj2PtCmZxDQjcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="53595433"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="53595433"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 12:22:33 -0800
X-CSE-ConnectionGUID: JYO6WM+KTeOXJ8uIQM9vyw==
X-CSE-MsgGUID: JzYNY0sDTCKLMkEQYo4hnQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 24 Nov 2025 12:22:32 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNd4w-000000000Jt-2xiP;
	Mon, 24 Nov 2025 20:22:30 +0000
Date: Mon, 24 Nov 2025 21:21:54 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android12-5.4 5/5]
 drivers/power/supply/power_supply_core.c:739: warning: Function parameter or
 member 'temp' not described in 'power_supply_temp2resist_simple'
Message-ID: <202511242124.Ql5cORJX-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   7055541caeda53d6275f23b878618d609132e955
commit: a96c947b075f9781a5d5941f560acf8b4c01405e [5/5] UPSTREAM: power: supply: core: Add battery internal resistance temperature table support
:::::: branch date: 10 hours ago
:::::: commit date: 6 years ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251124/202511242124.Ql5cORJX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511242124.Ql5cORJX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511242124.Ql5cORJX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/power/supply/power_supply_core.c:739: warning: Function parameter or member 'temp' not described in 'power_supply_temp2resist_simple'
>> drivers/power/supply/power_supply_core.c:739: warning: Excess function parameter 'ocv' description in 'power_supply_temp2resist_simple'


vim +739 drivers/power/supply/power_supply_core.c

3afb50d7125bcd Baolin Wang 2018-11-05  722  
a96c947b075f97 Baolin Wang 2019-12-09  723  /**
a96c947b075f97 Baolin Wang 2019-12-09  724   * power_supply_temp2resist_simple() - find the battery internal resistance
a96c947b075f97 Baolin Wang 2019-12-09  725   * percent
a96c947b075f97 Baolin Wang 2019-12-09  726   * @table: Pointer to battery resistance temperature table
a96c947b075f97 Baolin Wang 2019-12-09  727   * @table_len: The table length
a96c947b075f97 Baolin Wang 2019-12-09  728   * @ocv: Current temperature
a96c947b075f97 Baolin Wang 2019-12-09  729   *
a96c947b075f97 Baolin Wang 2019-12-09  730   * This helper function is used to look up battery internal resistance percent
a96c947b075f97 Baolin Wang 2019-12-09  731   * according to current temperature value from the resistance temperature table,
a96c947b075f97 Baolin Wang 2019-12-09  732   * and the table must be ordered descending. Then the actual battery internal
a96c947b075f97 Baolin Wang 2019-12-09  733   * resistance = the ideal battery internal resistance * percent / 100.
a96c947b075f97 Baolin Wang 2019-12-09  734   *
a96c947b075f97 Baolin Wang 2019-12-09  735   * Return: the battery internal resistance percent
a96c947b075f97 Baolin Wang 2019-12-09  736   */
a96c947b075f97 Baolin Wang 2019-12-09  737  int power_supply_temp2resist_simple(struct power_supply_resistance_temp_table *table,
a96c947b075f97 Baolin Wang 2019-12-09  738  				    int table_len, int temp)
a96c947b075f97 Baolin Wang 2019-12-09 @739  {
a96c947b075f97 Baolin Wang 2019-12-09  740  	int i, resist;
a96c947b075f97 Baolin Wang 2019-12-09  741  
a96c947b075f97 Baolin Wang 2019-12-09  742  	for (i = 0; i < table_len; i++)
a96c947b075f97 Baolin Wang 2019-12-09  743  		if (temp > table[i].temp)
a96c947b075f97 Baolin Wang 2019-12-09  744  			break;
a96c947b075f97 Baolin Wang 2019-12-09  745  
a96c947b075f97 Baolin Wang 2019-12-09  746  	if (i > 0 && i < table_len) {
a96c947b075f97 Baolin Wang 2019-12-09  747  		int tmp;
a96c947b075f97 Baolin Wang 2019-12-09  748  
a96c947b075f97 Baolin Wang 2019-12-09  749  		tmp = (table[i - 1].resistance - table[i].resistance) *
a96c947b075f97 Baolin Wang 2019-12-09  750  			(temp - table[i].temp);
a96c947b075f97 Baolin Wang 2019-12-09  751  		tmp /= table[i - 1].temp - table[i].temp;
a96c947b075f97 Baolin Wang 2019-12-09  752  		resist = tmp + table[i].resistance;
a96c947b075f97 Baolin Wang 2019-12-09  753  	} else if (i == 0) {
a96c947b075f97 Baolin Wang 2019-12-09  754  		resist = table[0].resistance;
a96c947b075f97 Baolin Wang 2019-12-09  755  	} else {
a96c947b075f97 Baolin Wang 2019-12-09  756  		resist = table[table_len - 1].resistance;
a96c947b075f97 Baolin Wang 2019-12-09  757  	}
a96c947b075f97 Baolin Wang 2019-12-09  758  
a96c947b075f97 Baolin Wang 2019-12-09  759  	return resist;
a96c947b075f97 Baolin Wang 2019-12-09  760  }
a96c947b075f97 Baolin Wang 2019-12-09  761  EXPORT_SYMBOL_GPL(power_supply_temp2resist_simple);
a96c947b075f97 Baolin Wang 2019-12-09  762  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
