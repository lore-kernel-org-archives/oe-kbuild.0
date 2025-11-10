Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9A2315789
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Nov 2025 15:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762787532; cv=none; b=WxsdysqFp8zobuW8LqSF/bywueBQOUZUbpXksGnEwu0V+Nc8ah8/NdWpnzsae97agvXxBJGyZDc5Uu2CBqH1mB0WAYrHp37S58EwkWlGmFfFvxL6tK618n1z7BoXPNyFBjij+JERB82/pg9fU7BZ10QlBemicCMRDN0dj3BDfdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762787532; c=relaxed/simple;
	bh=3cCPL1lzQr1Z1p9yEMS4KMTJa2SNzOgrBffr4a2imQM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M63KrluBLHcjmNYJfm1RX8LQxbvoWIv1psS4K4Lo80iwQ+XZ9lyVpGFDG2uiUcBR9jD85dcI2HbYgTvvVqsGi0HOt1OE+bJnF6wDi6xboNiREbeudoBhdtgL0a6J5wm5oX2453rIHxqkf5sSyuZ07iBp4U2ls+LCr0YRklC0YSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YBaShcc6; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YBaShcc6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762787530; x=1794323530;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3cCPL1lzQr1Z1p9yEMS4KMTJa2SNzOgrBffr4a2imQM=;
  b=YBaShcc6T+HFeRmEHD21a1n5LBitDz//IbcLwQMZAGdxaYTf88wS5o6t
   X5959wFnnaS3aC1kXLCcBMpHmOiXYBFiAYfGDUkCoxmcHo2j4nXBzR10N
   FydtNfIXq+3iC2BUh3BnNGD0yAOe2RaZLwvA5GjCwPv7w6nBxy390o/7U
   JHipLUWiApNLlZAbUvRL6UwO8msZHTHup8Ts3vkFp+OCaiqFw4t9+qe4M
   o2EknUHWmTlDRiVHCyH7LBxYxwEr6/TzI5+bGFF8Um/EXUqrhbeZ7YfHt
   YWJQbKSFBp2tiHnHtlBuhmkSkdx4A7u4KIEBb/HxQtjjWWvs/HYuHhFOH
   g==;
X-CSE-ConnectionGUID: SVpr8KQMQ364nMfFrqW0mA==
X-CSE-MsgGUID: F1Qf8RVSR5+yrUnXPxbmGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75943605"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="75943605"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 07:12:03 -0800
X-CSE-ConnectionGUID: nhKCiVklRfexQv6kFeJkjA==
X-CSE-MsgGUID: U2hssOybRee9Fs5HpQtmjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="189416222"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Nov 2025 07:11:58 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vITYh-0000aN-3C;
	Mon, 10 Nov 2025 15:11:55 +0000
Date: Mon, 10 Nov 2025 23:11:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 3/3] drm/syncobj: Add a fast path to
 drm_syncobj_array_find
Message-ID: <202511102233.GPoKgaPv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251106132645.28208-4-tvrtko.ursulin@igalia.com>
References: <20251106132645.28208-4-tvrtko.ursulin@igalia.com>
TO: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
TO: dri-devel@lists.freedesktop.org
CC: kernel-dev@igalia.com
CC: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: "Maíra Canal" <mcanal@igalia.com>

Hi Tvrtko,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.18-rc5 next-20251110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tvrtko-Ursulin/drm-syncobj-Use-vmemdup_array_user-in-drm_syncobj_array_find/20251106-212904
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20251106132645.28208-4-tvrtko.ursulin%40igalia.com
patch subject: [PATCH 3/3] drm/syncobj: Add a fast path to drm_syncobj_array_find
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20251110 (https://download.01.org/0day-ci/archive/20251110/202511102233.GPoKgaPv-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511102233.GPoKgaPv-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/drm_syncobj.c:1339 drm_syncobj_array_find() warn: missing unwind goto?

vim +1339 drivers/gpu/drm/drm_syncobj.c

5e60a10eaebab9 Dave Airlie    2017-08-25  1309  
3e6fb72d6cef6a Faith Ekstrand 2017-08-25  1310  static int drm_syncobj_array_find(struct drm_file *file_private,
9e5544627339ec Ville Syrjälä  2017-09-01  1311  				  void __user *user_handles,
9e5544627339ec Ville Syrjälä  2017-09-01  1312  				  uint32_t count_handles,
6cbb5aa2c8c162 Tvrtko Ursulin 2025-11-06  1313  				  uint32_t *stack_handles,
6cbb5aa2c8c162 Tvrtko Ursulin 2025-11-06  1314  				  struct drm_syncobj **stack_syncobjs,
6cbb5aa2c8c162 Tvrtko Ursulin 2025-11-06  1315  				  u32 stack_count,
3e6fb72d6cef6a Faith Ekstrand 2017-08-25  1316  				  struct drm_syncobj ***syncobjs_out)
5e60a10eaebab9 Dave Airlie    2017-08-25  1317  {
3e6fb72d6cef6a Faith Ekstrand 2017-08-25  1318  	uint32_t i, *handles;
e7aca5031a2fb5 Faith Ekstrand 2017-08-25  1319  	struct drm_syncobj **syncobjs;
3e6fb72d6cef6a Faith Ekstrand 2017-08-25  1320  	int ret;
5e60a10eaebab9 Dave Airlie    2017-08-25  1321  
6cbb5aa2c8c162 Tvrtko Ursulin 2025-11-06  1322  	if (count_handles > stack_count) {
b4ebe6f6bf86ff Tvrtko Ursulin 2025-11-06  1323  		handles = memdup_array_user(user_handles, count_handles,
b4ebe6f6bf86ff Tvrtko Ursulin 2025-11-06  1324  					    sizeof(*handles));
b4ebe6f6bf86ff Tvrtko Ursulin 2025-11-06  1325  		if (IS_ERR(handles))
b4ebe6f6bf86ff Tvrtko Ursulin 2025-11-06  1326  			return PTR_ERR(handles);
5e60a10eaebab9 Dave Airlie    2017-08-25  1327  
6cbb5aa2c8c162 Tvrtko Ursulin 2025-11-06  1328  		syncobjs = kmalloc_array(count_handles, sizeof(*syncobjs),
6cbb5aa2c8c162 Tvrtko Ursulin 2025-11-06  1329  					 GFP_KERNEL);
6cbb5aa2c8c162 Tvrtko Ursulin 2025-11-06  1330  		if (!syncobjs) {
5e60a10eaebab9 Dave Airlie    2017-08-25  1331  			ret = -ENOMEM;
5e60a10eaebab9 Dave Airlie    2017-08-25  1332  			goto err_free_handles;
5e60a10eaebab9 Dave Airlie    2017-08-25  1333  		}
6cbb5aa2c8c162 Tvrtko Ursulin 2025-11-06  1334  	} else {
6cbb5aa2c8c162 Tvrtko Ursulin 2025-11-06  1335  		handles = stack_handles;
6cbb5aa2c8c162 Tvrtko Ursulin 2025-11-06  1336  		syncobjs = stack_syncobjs;
6cbb5aa2c8c162 Tvrtko Ursulin 2025-11-06  1337  		if (copy_from_user(handles, user_handles,
6cbb5aa2c8c162 Tvrtko Ursulin 2025-11-06  1338  				   count_handles * sizeof(*handles)))
6cbb5aa2c8c162 Tvrtko Ursulin 2025-11-06 @1339  			return -EFAULT;
6cbb5aa2c8c162 Tvrtko Ursulin 2025-11-06  1340  	}
5e60a10eaebab9 Dave Airlie    2017-08-25  1341  
3e6fb72d6cef6a Faith Ekstrand 2017-08-25  1342  	for (i = 0; i < count_handles; i++) {
e7aca5031a2fb5 Faith Ekstrand 2017-08-25  1343  		syncobjs[i] = drm_syncobj_find(file_private, handles[i]);
e7aca5031a2fb5 Faith Ekstrand 2017-08-25  1344  		if (!syncobjs[i]) {
e7aca5031a2fb5 Faith Ekstrand 2017-08-25  1345  			ret = -ENOENT;
3e6fb72d6cef6a Faith Ekstrand 2017-08-25  1346  			goto err_put_syncobjs;
5e60a10eaebab9 Dave Airlie    2017-08-25  1347  		}
e7aca5031a2fb5 Faith Ekstrand 2017-08-25  1348  	}
5e60a10eaebab9 Dave Airlie    2017-08-25  1349  
6cbb5aa2c8c162 Tvrtko Ursulin 2025-11-06  1350  	if (handles != stack_handles)
3e6fb72d6cef6a Faith Ekstrand 2017-08-25  1351  		kfree(handles);
3e6fb72d6cef6a Faith Ekstrand 2017-08-25  1352  	*syncobjs_out = syncobjs;
3e6fb72d6cef6a Faith Ekstrand 2017-08-25  1353  	return 0;
5e60a10eaebab9 Dave Airlie    2017-08-25  1354  
3e6fb72d6cef6a Faith Ekstrand 2017-08-25  1355  err_put_syncobjs:
e7aca5031a2fb5 Faith Ekstrand 2017-08-25  1356  	while (i-- > 0)
e7aca5031a2fb5 Faith Ekstrand 2017-08-25  1357  		drm_syncobj_put(syncobjs[i]);
6cbb5aa2c8c162 Tvrtko Ursulin 2025-11-06  1358  	if (syncobjs != stack_syncobjs)
e7aca5031a2fb5 Faith Ekstrand 2017-08-25  1359  		kfree(syncobjs);
5e60a10eaebab9 Dave Airlie    2017-08-25  1360  err_free_handles:
6cbb5aa2c8c162 Tvrtko Ursulin 2025-11-06  1361  	if (handles != stack_handles)
5e60a10eaebab9 Dave Airlie    2017-08-25  1362  		kfree(handles);
5e60a10eaebab9 Dave Airlie    2017-08-25  1363  
5e60a10eaebab9 Dave Airlie    2017-08-25  1364  	return ret;
5e60a10eaebab9 Dave Airlie    2017-08-25  1365  }
3e6fb72d6cef6a Faith Ekstrand 2017-08-25  1366  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
