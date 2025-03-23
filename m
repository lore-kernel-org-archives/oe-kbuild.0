Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCB4AD24
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Mar 2025 03:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742700194; cv=none; b=NVEWcFQS6qgVYNFRyOSGmkc/ouF4szmV5OSD61WsE4sMp9oB4I78FHRSjkTbjMLWyl/mkzTIx+bSKBWl1zL5EXMv4PM/SbZYFr9GFM4nqQ8rLJ/nuQ1vLlvywg1WeuNTjEwX5yzilKtHfGVP4/X9sY1IW9u7Xmg1PVBslY0rWG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742700194; c=relaxed/simple;
	bh=iEgQ7ldx77EJHSODpQa1otE5HK24NMgwr9bVl8gfEAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mEY5z2/esZeL/VS/yUTdks7jTsVrquAd1bBTd8OB5E9QEDl5N2dvAW62FDrSG7HzgVCdbYSQI1FXxkQD+phF0v31eCxwHVaWuaXtSb5Ughaej9zDMWBYk62bKNmR9+qkoENtAAesCTWySMGmgl8/YKn8RNRR6/tdW53zaiq5z14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k37FTQB1; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k37FTQB1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742700193; x=1774236193;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=iEgQ7ldx77EJHSODpQa1otE5HK24NMgwr9bVl8gfEAQ=;
  b=k37FTQB1fgxX/zpE4RYgNaqmH/g9fztYGnBYp3sHQjL3Icc7s66eKbZw
   9a1Nk2AgRR8o+qEiqAyNnF6g40kMgUh1cMGJ1f5xyA6SPo4aKVqIWB1i8
   GXMG9MbKN1RRmVT2X8mle0zL5e3/36ygWkjHEfkLyvvo8ITqRALpcEd2s
   pS2TdxOweMTsJt9wB5mOq49y3gcwFm9xpeHh25FNboqqxb6HmYhd8jWpe
   QpsNnKPxy50AyqJo0DGG8wYjVLAUEPgwf2VhNFn3DvDWT1X4HEoEQV4K4
   sKamnu8U8Kj6dQW4EX9/htRy9jZpmaKymWBA7OPpn0VVBc6uezlmFhS/O
   A==;
X-CSE-ConnectionGUID: 6MCFxAQdTa2CHul9UACl5g==
X-CSE-MsgGUID: 4xSC3zuNTpSA3Gs5ng9Glw==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="54140230"
X-IronPort-AV: E=Sophos;i="6.14,269,1736841600"; 
   d="scan'208";a="54140230"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 20:23:12 -0700
X-CSE-ConnectionGUID: FsWRzKeiRxiAQQw7U6cf/Q==
X-CSE-MsgGUID: 8oUMd60fTyqVJZUuOvgs6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,269,1736841600"; 
   d="scan'208";a="123703131"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 22 Mar 2025 20:23:10 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twBvT-0002Yl-07;
	Sun, 23 Mar 2025 03:23:04 +0000
Date: Sun, 23 Mar 2025 11:22:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 2/3] drm/xe/sriov: Shifting GGTT area post migration
Message-ID: <202503231159.himCw1Ch-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250306222126.3382322-3-tomasz.lis@intel.com>
References: <20250306222126.3382322-3-tomasz.lis@intel.com>
TO: Tomasz Lis <tomasz.lis@intel.com>
TO: intel-xe@lists.freedesktop.org
CC: "Michał Winiarski" <michal.winiarski@intel.com>
CC: "Michał Wajdeczko" <michal.wajdeczko@intel.com>
CC: "Piotr Piórkowski" <piotr.piorkowski@intel.com>

Hi Tomasz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on linus/master v6.14-rc7 next-20250321]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomasz-Lis/drm-drm_mm-Safe-macro-for-iterating-through-nodes-in-range/20250307-102511
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250306222126.3382322-3-tomasz.lis%40intel.com
patch subject: [PATCH v4 2/3] drm/xe/sriov: Shifting GGTT area post migration
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: openrisc-randconfig-r073-20250321 (https://download.01.org/0day-ci/archive/20250323/202503231159.himCw1Ch-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503231159.himCw1Ch-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_sriov_vf.c:191 vf_post_migration_fixup_ggtt_nodes() error: uninitialized symbol 'err'.

vim +/err +191 drivers/gpu/drm/xe/xe_sriov_vf.c

abd2202047fc75 Tomasz Lis 2024-11-04  173  
253478de2cb134 Tomasz Lis 2025-03-06  174  static int vf_post_migration_fixup_ggtt_nodes(struct xe_device *xe)
253478de2cb134 Tomasz Lis 2025-03-06  175  {
253478de2cb134 Tomasz Lis 2025-03-06  176  	struct xe_tile *tile;
253478de2cb134 Tomasz Lis 2025-03-06  177  	unsigned int id;
253478de2cb134 Tomasz Lis 2025-03-06  178  	int err;
253478de2cb134 Tomasz Lis 2025-03-06  179  
253478de2cb134 Tomasz Lis 2025-03-06  180  	for_each_tile(tile, xe, id) {
253478de2cb134 Tomasz Lis 2025-03-06  181  		struct xe_gt *gt = tile->primary_gt;
253478de2cb134 Tomasz Lis 2025-03-06  182  		int ret;
253478de2cb134 Tomasz Lis 2025-03-06  183  
253478de2cb134 Tomasz Lis 2025-03-06  184  		/* media doesn't have its own ggtt */
253478de2cb134 Tomasz Lis 2025-03-06  185  		if (xe_gt_is_media_type(gt))
253478de2cb134 Tomasz Lis 2025-03-06  186  			continue;
253478de2cb134 Tomasz Lis 2025-03-06  187  		ret = xe_gt_sriov_vf_fixup_ggtt_nodes(gt);
253478de2cb134 Tomasz Lis 2025-03-06  188  		if (ret != ENODATA)
253478de2cb134 Tomasz Lis 2025-03-06  189  			err = ret;
253478de2cb134 Tomasz Lis 2025-03-06  190  	}
253478de2cb134 Tomasz Lis 2025-03-06 @191  	return err;
253478de2cb134 Tomasz Lis 2025-03-06  192  }
253478de2cb134 Tomasz Lis 2025-03-06  193  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
