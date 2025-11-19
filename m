Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078DC1FBCA7
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Nov 2025 19:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763581847; cv=none; b=b09n9EJtWrKqHqq0G9wSKi1rhH8REc45DaJvKbamy1/5y2Xrwr0GHOCCem4z2ETOh6yDvxoL1keHisWMPJ3fwgZqhuy6Ev4ddZXqw9ctXI7GEkkLHlq8K5F2V0OSbxchH4R6qkMfEi+5SriPMIAWGec4TKBM97eWmE5Cs1qZz/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763581847; c=relaxed/simple;
	bh=6iEZXJ6E+Rwt88VE4201MEAt0wY3YZQZuhY8Ykr+lLU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uyJDmq8J7tl60RKCfY8iKKf4nslQOV3FCjnC+qGK1ZWxTzHTabtk4jddrmqVnv1s1V5lxgMc5MsAIGR1gGzHSwEluS1xhpAY1Z+LimWnrzQOayTK8i34jfYL0c/Of59Dc6akzCKlhWKvFyfeUkl1ybCmmzmWjy42AGVIPc4V5aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PKZ3jekr; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PKZ3jekr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763581844; x=1795117844;
  h=date:from:to:subject:message-id:mime-version;
  bh=6iEZXJ6E+Rwt88VE4201MEAt0wY3YZQZuhY8Ykr+lLU=;
  b=PKZ3jekriIrar6Lpd5kX7IJsigLenAwWNdMgQI+URxZm/2GeIvdyhbFe
   v6i0/SIO+yztwuGK4syJ1VYJwznviPYdL/KbtCu0FxhVBQn+WBLm3WZaZ
   nUVq9m71Rstw7f5Y3vXh8WViprs5lUpzKbiMVFFFOlXIlcu+zQe9P/1qu
   OZk8fODlogEY74Np9TLrqgqBXHPT0Lrai7RPryg2zgb2ZEAxgtsnDfbOQ
   7Bk3H5BoGOzv6YY0Nvl+EskcdIAS1CFNYtipiFz0h03xe18PkZ7CoZ5TE
   viV8iZrMkc8ctu8EmyW9v4Fgm6mUcvJAqkIUFwz0xFIUUoDtyODwDBDBN
   w==;
X-CSE-ConnectionGUID: ATzxXD1sSOuEo7A6NkohNw==
X-CSE-MsgGUID: vanUnI3FQGKi+yG/cB+ENA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="77104373"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="77104373"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 11:50:43 -0800
X-CSE-ConnectionGUID: TTHmAnX/TXSMXVsErYxCfw==
X-CSE-MsgGUID: 5R4yuYE0QY6mCyvnTUHkVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="190406290"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 19 Nov 2025 11:50:43 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vLoCO-000000001Gx-2dQX
	for oe-kbuild@lists.linux.dev;
	Wed, 19 Nov 2025 19:50:40 +0000
Date: Wed, 19 Nov 2025 20:49:43 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 203/301] checkpatch: ERROR:POINTER_LOCATION:
 "foo * bar" should be "foo *bar"
Message-ID: <202511192033.NuEBFrXN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   358b4c20d9bd90f783a5bf7273e770d827c14138
commit: 52761079b56e2a1908e05b87ebee485afb82019d [203/301] CHROMIUM: regulator: parse off-on-delay-us for mt6359 regulator
:::::: branch date: 14 hours ago
:::::: commit date: 3 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251119/202511192033.NuEBFrXN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511192033.NuEBFrXN-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#35: FILE: drivers/regulator/mt6359-regulator.c:949:
+				struct mt6359_regulator_info * mt6359_info)

ERROR:SPACING: space required after that ',' (ctx:VxV)
#43: FILE: drivers/regulator/mt6359-regulator.c:957:
+		dev_err(dev,"%s invalid param.",__func__);
 		           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#43: FILE: drivers/regulator/mt6359-regulator.c:957:
+		dev_err(dev,"%s invalid param.",__func__);
 		                               ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#64: FILE: drivers/regulator/mt6359-regulator.c:978:
+				dev_dbg(dev,"%s found Regulator node '%s':off-on-delay = %u us\n",
 				           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#65: FILE: drivers/regulator/mt6359-regulator.c:979:
+					__func__,child->name, off_on_delay);
 					        ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
