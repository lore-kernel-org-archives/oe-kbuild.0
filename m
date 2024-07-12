Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C499B1FAA
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Jul 2024 01:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720748767; cv=none; b=BtJ/rhbYngm6U6Q2guXYaQEgFCGd9bI/tPfqqGrqwgfElZNO3TtXzS13kkNOEQG9TgA2ZlZcBDNG0dshOANNDBEk7/E/RT9r4UHM1j3gmuVe0zbjviCuFuQhMnT3/RhOscMJVgXBVm54khS+SBY8cB8b77UZbzorrZSXeQeb84Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720748767; c=relaxed/simple;
	bh=g6QKH7wSbuLYbGiuyE51GPM0xbyIY/Gb2TtCcsYQOMo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pZfmVkhUSq2WmdVxCHqFIPjBn4+awVRyd1DA9JBp9Gh5cUPhj65+CAe+Z0la6ZehmzQxxCyBMvEKGrBnHreN4V/g93yyqI8HxmzDpoEe1vS8vJgrKj2UZeCHMqAn8otlmWYeNJ7z2TIY5Cy9NtdUqjjqbATOzitdqs3op3jYEDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CX2lH7TH; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CX2lH7TH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720748763; x=1752284763;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g6QKH7wSbuLYbGiuyE51GPM0xbyIY/Gb2TtCcsYQOMo=;
  b=CX2lH7THsJ8YzrePUEG0vIHdC1+QezgDHt9MaaII7XxGNZ8I8EKm6t4D
   JEOXem2ejQN3siN+l+YHjXgbeVv/VFXjEJWlWSjV6ii28kxDn9Mi/ABnn
   yAP3YuS/fJa4nJ7QqryFTZyFeQIL84qtm3rxu7AzZA/WSMZmd8Glw3Fyi
   Pp1e2TBr6odyRBmIeywmGEU4rqf94GezobnwGAn4OIPNfIYg66ESSTspg
   3ZfaYoB3v9lB7cSXnKc3hE9pXZWX2oa/XVAI1wvUwlcvhoii4qURYQrvn
   x+KFkNxM4hQG6TFeOAaKUwF+Nxx0VAuk7P2AuRJJ2hfAXPntFE4DgZ5bv
   g==;
X-CSE-ConnectionGUID: Ag7DOo0ET+a72nDUiJUa3w==
X-CSE-MsgGUID: t1hYI04lTRGi5XO2+w7WJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18123204"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; 
   d="scan'208";a="18123204"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 18:46:01 -0700
X-CSE-ConnectionGUID: OuTxKOUoRlu/mEFHw1eg9Q==
X-CSE-MsgGUID: DyA22lydTUWTJuhT2Y/MKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; 
   d="scan'208";a="49521085"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Jul 2024 18:46:00 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sS5MD-000aCI-2G;
	Fri, 12 Jul 2024 01:45:57 +0000
Date: Fri, 12 Jul 2024 09:45:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [broonie-ci:regmap-6.11 1/3] drivers/base/regmap/regmap.c:3146
 _regmap_bulk_read() error: uninitialized symbol 'ret'.
Message-ID: <202407120935.QjnGDAhH-lkp@intel.com>
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
TO: Guenter Roeck <linux@roeck-us.net>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git regmap-6.11
head:   c2bb8198fee88a428513f8d023c627ecd13aa694
commit: 3c1ff93b4deea502cd8b0869839557cab2a28b71 [1/3] regmap: Implement regmap_multi_reg_read()
:::::: branch date: 14 hours ago
:::::: commit date: 32 hours ago
config: arm-randconfig-r071-20240711 (https://download.01.org/0day-ci/archive/20240712/202407120935.QjnGDAhH-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407120935.QjnGDAhH-lkp@intel.com/

New smatch warnings:
drivers/base/regmap/regmap.c:3146 _regmap_bulk_read() error: uninitialized symbol 'ret'.

Old smatch warnings:
drivers/base/regmap/regmap.c:702 __regmap_init() warn: 'map->hwlock' is an error pointer or valid
drivers/base/regmap/regmap.c:2023 _regmap_raw_write() error: uninitialized symbol 'ret'.
drivers/base/regmap/regmap.c:2963 regmap_raw_read() error: uninitialized symbol 'ret'.

vim +/ret +3146 drivers/base/regmap/regmap.c

a0102375ee82db Kuninori Morimoto 2013-09-01  3103  
3c1ff93b4deea5 Guenter Roeck     2024-07-09  3104  static int _regmap_bulk_read(struct regmap *map, unsigned int reg,
3c1ff93b4deea5 Guenter Roeck     2024-07-09  3105  			     unsigned int *regs, void *val, size_t val_count)
b83a313bf25201 Mark Brown        2011-05-11  3106  {
d5b98eb12420ce Mark Brown        2015-08-28  3107  	u32 *u32 = val;
d5b98eb12420ce Mark Brown        2015-08-28  3108  	u16 *u16 = val;
d5b98eb12420ce Mark Brown        2015-08-28  3109  	u8 *u8 = val;
3c1ff93b4deea5 Guenter Roeck     2024-07-09  3110  	int ret, i;
d5b98eb12420ce Mark Brown        2015-08-28  3111  
186ba2eec275a5 Charles Keepax    2018-02-15  3112  	map->lock(map->lock_arg);
186ba2eec275a5 Charles Keepax    2018-02-15  3113  
9ae27a8d1f3ebf Charles Keepax    2018-02-12  3114  	for (i = 0; i < val_count; i++) {
9ae27a8d1f3ebf Charles Keepax    2018-02-12  3115  		unsigned int ival;
9ae27a8d1f3ebf Charles Keepax    2018-02-12  3116  
3c1ff93b4deea5 Guenter Roeck     2024-07-09  3117  		if (regs) {
3c1ff93b4deea5 Guenter Roeck     2024-07-09  3118  			if (!IS_ALIGNED(regs[i], map->reg_stride)) {
3c1ff93b4deea5 Guenter Roeck     2024-07-09  3119  				ret = -EINVAL;
3c1ff93b4deea5 Guenter Roeck     2024-07-09  3120  				goto out;
3c1ff93b4deea5 Guenter Roeck     2024-07-09  3121  			}
3c1ff93b4deea5 Guenter Roeck     2024-07-09  3122  			ret = _regmap_read(map, regs[i], &ival);
3c1ff93b4deea5 Guenter Roeck     2024-07-09  3123  		} else {
3c1ff93b4deea5 Guenter Roeck     2024-07-09  3124  			ret = _regmap_read(map, reg + regmap_get_offset(map, i), &ival);
3c1ff93b4deea5 Guenter Roeck     2024-07-09  3125  		}
9ae27a8d1f3ebf Charles Keepax    2018-02-12  3126  		if (ret != 0)
186ba2eec275a5 Charles Keepax    2018-02-15  3127  			goto out;
9ae27a8d1f3ebf Charles Keepax    2018-02-12  3128  
d5b98eb12420ce Mark Brown        2015-08-28  3129  		switch (map->format.val_bytes) {
d5b98eb12420ce Mark Brown        2015-08-28  3130  		case 4:
d5b98eb12420ce Mark Brown        2015-08-28  3131  			u32[i] = ival;
d5b98eb12420ce Mark Brown        2015-08-28  3132  			break;
d5b98eb12420ce Mark Brown        2015-08-28  3133  		case 2:
d5b98eb12420ce Mark Brown        2015-08-28  3134  			u16[i] = ival;
d5b98eb12420ce Mark Brown        2015-08-28  3135  			break;
d5b98eb12420ce Mark Brown        2015-08-28  3136  		case 1:
d5b98eb12420ce Mark Brown        2015-08-28  3137  			u8[i] = ival;
d5b98eb12420ce Mark Brown        2015-08-28  3138  			break;
d5b98eb12420ce Mark Brown        2015-08-28  3139  		default:
186ba2eec275a5 Charles Keepax    2018-02-15  3140  			ret = -EINVAL;
186ba2eec275a5 Charles Keepax    2018-02-15  3141  			goto out;
d5b98eb12420ce Mark Brown        2015-08-28  3142  		}
de2d808f4de091 Mark Brown        2011-10-10  3143  	}
186ba2eec275a5 Charles Keepax    2018-02-15  3144  out:
186ba2eec275a5 Charles Keepax    2018-02-15  3145  	map->unlock(map->lock_arg);
3c1ff93b4deea5 Guenter Roeck     2024-07-09 @3146  	return ret;
de2d808f4de091 Mark Brown        2011-10-10  3147  }
b83a313bf25201 Mark Brown        2011-05-11  3148  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
