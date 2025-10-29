Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3E83590D9
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Oct 2025 19:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761767933; cv=none; b=Fsh+MSLFZ+TUsV+tgYvYX5i4/J3ti7AG7KrUMlPxBzBk3T33p0TyYaQVgZcPWLd7sf++xEKteJVWf4aSPgKvPCG0OSgJJfryNGbeHcvoqZ8SI9fEAJDt/iwLk6C+htJdh6xRa6G98mYXh8rfjMkypq+b0r0bMctfD6Im8hfOfT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761767933; c=relaxed/simple;
	bh=lclu4vGxhLKe4uO253jIcCZ7r5w2A/KgrU1YS/aYvT4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a+GPFoyfWOmUJQdvm8SG1q/HVaiR5z677z/43cCIvyebaUri2t8o2nANRjkCFyzZ5wPZyYhdovogCIhugK/+7Mba2hOxesLUXasL8q/PPrUuczwXAUxThsRmN28p6ZW2ZF2ei+fipHpx1VaQxvV6L/MHLbmVNamcgKE8YTQ+Z9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OxV9d3a3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OxV9d3a3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761767931; x=1793303931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lclu4vGxhLKe4uO253jIcCZ7r5w2A/KgrU1YS/aYvT4=;
  b=OxV9d3a34sLdSJnbwJkcTm/kGPvJsTsSL56v7TrOnwYM4tHVxav73gZU
   GRGGHJ/sluciFfBtS1+cq8n57B0yY9c2GeGUiSlqp7lfewOfrxWar/ooo
   /MTyQqkVbWIploHw4+Plx6YwPsnEp7eU/2+F6z48spiiM3H166ng1O1J9
   2OetkxM+aATwsRagNzPfkmckSFZdkZeuoIjOIHvovChWOnHTlGl+Feh0i
   ByytiN4NnvF3Z/bSGoVO7zyrRtGGb4tde3BVcdCm7y8QpGbKFTScZ6Wvc
   fZnCu1W6laKovuRa9+wvrWc8R/JQixLoSQQwI70YUO6mVhfDiKJpqxgja
   g==;
X-CSE-ConnectionGUID: 5AYSuauqRKyQNkyYWIHbFA==
X-CSE-MsgGUID: wxHnYWUTSS6qA0hfBq2PLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63601633"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="63601633"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 12:58:50 -0700
X-CSE-ConnectionGUID: nHWKrF9yRH6qfg3l1ZONWw==
X-CSE-MsgGUID: zOP4FqdERhWRDTtRFaGlwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="186502818"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 29 Oct 2025 12:58:49 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vECJd-000L7Y-0q;
	Wed, 29 Oct 2025 19:58:42 +0000
Date: Thu, 30 Oct 2025 03:57:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/hid/hid-corsair-void.c:574:3-10: WARNING: Consider using %pe
 to print PTR_ERR()
Message-ID: <202510300342.WtPn2jF3-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
CC: Jiri Kosina <jikos@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6
commit: 6ea2a6fd3872e60a4d500b548ad65ed94e459ddd HID: corsair-void: Add Corsair Void headset family driver
date:   1 year, 1 month ago
:::::: branch date: 19 hours ago
:::::: commit date: 1 year, 1 month ago
config: powerpc-randconfig-r054-20251029 (https://download.01.org/0day-ci/archive/20251030/202510300342.WtPn2jF3-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202510300342.WtPn2jF3-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/hid/hid-corsair-void.c:574:3-10: WARNING: Consider using %pe to print PTR_ERR()

vim +574 drivers/hid/hid-corsair-void.c

6ea2a6fd3872e6 Stuart Hayhurst 2024-10-09  552  
6ea2a6fd3872e6 Stuart Hayhurst 2024-10-09  553  static void corsair_void_battery_add_work_handler(struct work_struct *work)
6ea2a6fd3872e6 Stuart Hayhurst 2024-10-09  554  {
6ea2a6fd3872e6 Stuart Hayhurst 2024-10-09  555  	struct corsair_void_drvdata *drvdata;
6ea2a6fd3872e6 Stuart Hayhurst 2024-10-09  556  	struct power_supply_config psy_cfg;
6ea2a6fd3872e6 Stuart Hayhurst 2024-10-09  557  	struct power_supply *new_supply;
6ea2a6fd3872e6 Stuart Hayhurst 2024-10-09  558  
6ea2a6fd3872e6 Stuart Hayhurst 2024-10-09  559  	drvdata = container_of(work, struct corsair_void_drvdata,
6ea2a6fd3872e6 Stuart Hayhurst 2024-10-09  560  			       battery_add_work);
6ea2a6fd3872e6 Stuart Hayhurst 2024-10-09  561  	guard(mutex)(&drvdata->battery_mutex);
6ea2a6fd3872e6 Stuart Hayhurst 2024-10-09  562  	if (drvdata->battery)
6ea2a6fd3872e6 Stuart Hayhurst 2024-10-09  563  		return;
6ea2a6fd3872e6 Stuart Hayhurst 2024-10-09  564  
6ea2a6fd3872e6 Stuart Hayhurst 2024-10-09  565  	psy_cfg.drv_data = drvdata;
6ea2a6fd3872e6 Stuart Hayhurst 2024-10-09  566  	new_supply = power_supply_register(drvdata->dev,
6ea2a6fd3872e6 Stuart Hayhurst 2024-10-09  567  					   &drvdata->battery_desc,
6ea2a6fd3872e6 Stuart Hayhurst 2024-10-09  568  					   &psy_cfg);
6ea2a6fd3872e6 Stuart Hayhurst 2024-10-09  569  
6ea2a6fd3872e6 Stuart Hayhurst 2024-10-09  570  	if (IS_ERR(new_supply)) {
6ea2a6fd3872e6 Stuart Hayhurst 2024-10-09  571  		hid_err(drvdata->hid_dev,
6ea2a6fd3872e6 Stuart Hayhurst 2024-10-09  572  			"failed to register battery '%s' (reason: %ld)\n",
6ea2a6fd3872e6 Stuart Hayhurst 2024-10-09  573  			drvdata->battery_desc.name,
6ea2a6fd3872e6 Stuart Hayhurst 2024-10-09 @574  			PTR_ERR(new_supply));
6ea2a6fd3872e6 Stuart Hayhurst 2024-10-09  575  		return;
6ea2a6fd3872e6 Stuart Hayhurst 2024-10-09  576  	}
6ea2a6fd3872e6 Stuart Hayhurst 2024-10-09  577  
6ea2a6fd3872e6 Stuart Hayhurst 2024-10-09  578  	if (power_supply_powers(new_supply, drvdata->dev)) {
6ea2a6fd3872e6 Stuart Hayhurst 2024-10-09  579  		power_supply_unregister(new_supply);
6ea2a6fd3872e6 Stuart Hayhurst 2024-10-09  580  		return;
6ea2a6fd3872e6 Stuart Hayhurst 2024-10-09  581  	}
6ea2a6fd3872e6 Stuart Hayhurst 2024-10-09  582  
6ea2a6fd3872e6 Stuart Hayhurst 2024-10-09  583  	drvdata->battery = new_supply;
6ea2a6fd3872e6 Stuart Hayhurst 2024-10-09  584  }
6ea2a6fd3872e6 Stuart Hayhurst 2024-10-09  585  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
