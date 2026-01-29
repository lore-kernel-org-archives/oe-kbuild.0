Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EA6823DD
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Jan 2026 01:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769650733; cv=none; b=MvFG/70FAvaGkhyl3uo5Ag8ooSJ3awDBaD5zyd7bKvBdbNnZprQX8iyGSqlMsEKcYVUSbvV5I9twNIc9sfCfwIAOCrNGVQf7UJDW3wxXZlOBhVVURuJYLbkcrc8QEaq3bphLd80/xSh0b35YVeyWfY9geHttUmy1Actqp0wJNak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769650733; c=relaxed/simple;
	bh=llKddvfkmwVYcLOUjA4RVImwL7FfqXRVenO/g08hNuA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AJclKXNSX11NdoDm903M48uQ0qXjyQKfiXfA3YWYSgJhapch7rR6TsBalIPGjl+JmUNcFRXYb1lxsbu/SIu5xafG6603KYXYlbDIUUCj/NEp9AZD/NWN0DBC5uvu7Ak/rTGysRivymKh3nczlE1KO1VF61p7cLf0Q28//PLZnpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e472z7Cj; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e472z7Cj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769650731; x=1801186731;
  h=date:from:to:subject:message-id:mime-version;
  bh=llKddvfkmwVYcLOUjA4RVImwL7FfqXRVenO/g08hNuA=;
  b=e472z7CjN5T3e+0+BVt7JAPSd+gxvozlKOFekYB4qmH2p1vbojYYW6D7
   B6QCNlmXuQWE1PzxuZhLpZeGuVoLnJ4r/5haYbIlt4BjVGh7JzD98d+Tb
   Qe8fw7JsE+wax+gX6H66lBinHJociVhPx9d3vi8gqueY2jVwSGV1+TCsL
   1bkr5MsrIU9DIQy3BDeRO8kUuWK3Yfy9dWivb4oJfnk7XGfKoD9w5rhLK
   VITbDzLqA/CINzHaMLRXXPiHZuFTUIkT8CrTAA1En4zUEjs+7UIE/IEus
   I4mng3/59jLUWbOovs1qmxT8ApPaM9/3fs9+0xWGy8SxWG3bc2fSAbbqK
   w==;
X-CSE-ConnectionGUID: ZQKU3X1iR1GnlXUE9k7Frg==
X-CSE-MsgGUID: 9M+cOFduTXmzj/qEZbakyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70781272"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="70781272"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 17:38:51 -0800
X-CSE-ConnectionGUID: NiEFHXtPQWWl6ee7Yt+a4g==
X-CSE-MsgGUID: UU0kynwaTz+/A3hZsoXtbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="208663642"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 28 Jan 2026 17:38:50 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlGzg-0000000028z-28WQ
	for oe-kbuild@lists.linux.dev;
	Thu, 29 Jan 2026 01:38:48 +0000
Date: Thu, 29 Jan 2026 02:38:28 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v4 06/15] drm/dp_tunnel: Switch private_obj
 initialization to atomic_create_state
Message-ID: <202601290259.AzRE51I1-lkp@intel.com>
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
In-Reply-To: <20260128-drm-private-obj-reset-v4-6-90891fa3d3b0@redhat.com>
References: <20260128-drm-private-obj-reset-v4-6-90891fa3d3b0@redhat.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>

Hi Maxime,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 68b271a3a94cfd6c7695a96b6398b52feb89e2c2]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/drm-atomic-Make-drm_atomic_private_obj_init-fallible/20260128-205507
base:   68b271a3a94cfd6c7695a96b6398b52feb89e2c2
patch link:    https://lore.kernel.org/r/20260128-drm-private-obj-reset-v4-6-90891fa3d3b0%40redhat.com
patch subject: [PATCH v4 06/15] drm/dp_tunnel: Switch private_obj initialization to atomic_create_state
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260129/202601290259.AzRE51I1-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#29: FILE: drivers/gpu/drm/display/drm_dp_tunnel.c:1500:
+static struct drm_private_state * tunnel_group_atomic_create_state(struct drm_private_obj *obj)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
