Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94F824B2F
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Sep 2024 03:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726545168; cv=none; b=edEFtWCAg5M8CSvgVWeRpDKhwFmR0L5OKuqQCWZd6LW645xmV4qDJLtTBP4MhQs3F134JnBTsgw3RL1FGo5sPuwP36MlJQ94HsF4yH6i6s1OKxYCAfjSrCGa1rZqQAQbhX13ZbkaZKtWHs4l6wqO81iUZXd2d6VJbemnnatiG2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726545168; c=relaxed/simple;
	bh=5nxz7HjpTPWYtPVyyM++klA5EJuc8B9b9Xtgq2OqcRI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bdAbpJFIUzMsnJ11wpXJRAcj5Inmf2rRN0j+1L5dXz5JCIQYIMU60G6ynyiTpBBWpnZrdhwNWm9BHMRtXe2NZtEoglAXVtu1phZV2G62TmvQc5p8KO0t+gWI3LBz5Eb2e7+VSkV/Z9wgihaeMolvgFa/hi+0A/4pjXqfIjT8p3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HIgTGKKA; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HIgTGKKA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726545167; x=1758081167;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5nxz7HjpTPWYtPVyyM++klA5EJuc8B9b9Xtgq2OqcRI=;
  b=HIgTGKKAA9WCCIZAVXUOa/J8w5jO/l+Pc3hVpWEWWUOuyBNbpQzZ5G4B
   iTEKGFIx7ox6YyU6vIpuecrM47i3rGrz9csWGFx+BHV18LiWO4jilUksS
   7B6O0KxSHFes0rE+3sUE2J9HgefW8l63s/0BZSzmosw0m41Sf2M4LKSkO
   YnYt9d79ssNV8a7qNVelZPdepbX1gSTyM0cCRG2UoFqPeUx0cmiCE+MxQ
   TYrZWroNxcCdCXBN3bIYoc05FrUECEIrozRqbmJ2fLMqyA2TFH/SMILVY
   cFtnbaI/7KOhEhYN6wTqlYV9rdti12XETbODeJN39LxdT+p3T4Qt1o/fN
   A==;
X-CSE-ConnectionGUID: nZZ5p7VwS5C5zdpyY5yZwQ==
X-CSE-MsgGUID: 2HbwA9ZlRLiLGAnrisvdcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="25490176"
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; 
   d="scan'208";a="25490176"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 20:52:46 -0700
X-CSE-ConnectionGUID: 3lZmaHaqTHOI4bgnRWggfQ==
X-CSE-MsgGUID: eiz8TXtdRG2qoBJ/C3gKtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; 
   d="scan'208";a="73892326"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Sep 2024 20:52:45 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqPGc-000AlM-2B;
	Tue, 17 Sep 2024 03:52:42 +0000
Date: Tue, 17 Sep 2024 11:52:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c:219:16-26: ERROR: invalid
 reference to the index variable of the iterator on line 207
Message-ID: <202409171115.9vTLkrZN-lkp@intel.com>
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
TO: Yang Wang <kevinyang.wang@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Hawking Zhang <Hawking.Zhang@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a430d95c5efa2b545d26a094eb5f624e36732af0
commit: f5e4cc8461c408dcb679bb1f7c3bd8a586406709 drm/amdgpu: implement RAS ACA driver framework
date:   8 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 8 months ago
config: i386-randconfig-052-20240917 (https://download.01.org/0day-ci/archive/20240917/202409171115.9vTLkrZN-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202409171115.9vTLkrZN-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c:219:16-26: ERROR: invalid reference to the index variable of the iterator on line 207

vim +219 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c

f5e4cc8461c408 Yang Wang 2023-11-13  199  
f5e4cc8461c408 Yang Wang 2023-11-13  200  static struct aca_bank_error *find_bank_error(struct aca_error *aerr, struct aca_bank_info *info)
f5e4cc8461c408 Yang Wang 2023-11-13  201  {
f5e4cc8461c408 Yang Wang 2023-11-13  202  	struct aca_bank_error *bank_error = NULL;
f5e4cc8461c408 Yang Wang 2023-11-13  203  	struct aca_bank_info *tmp_info;
f5e4cc8461c408 Yang Wang 2023-11-13  204  	bool found = false;
f5e4cc8461c408 Yang Wang 2023-11-13  205  
f5e4cc8461c408 Yang Wang 2023-11-13  206  	mutex_lock(&aerr->lock);
f5e4cc8461c408 Yang Wang 2023-11-13 @207  	list_for_each_entry(bank_error, &aerr->list, node) {
f5e4cc8461c408 Yang Wang 2023-11-13  208  		tmp_info = &bank_error->info;
f5e4cc8461c408 Yang Wang 2023-11-13  209  		if (tmp_info->socket_id == info->socket_id &&
f5e4cc8461c408 Yang Wang 2023-11-13  210  		    tmp_info->die_id == info->die_id) {
f5e4cc8461c408 Yang Wang 2023-11-13  211  			found = true;
f5e4cc8461c408 Yang Wang 2023-11-13  212  			goto out_unlock;
f5e4cc8461c408 Yang Wang 2023-11-13  213  		}
f5e4cc8461c408 Yang Wang 2023-11-13  214  	}
f5e4cc8461c408 Yang Wang 2023-11-13  215  
f5e4cc8461c408 Yang Wang 2023-11-13  216  out_unlock:
f5e4cc8461c408 Yang Wang 2023-11-13  217  	mutex_unlock(&aerr->lock);
f5e4cc8461c408 Yang Wang 2023-11-13  218  
f5e4cc8461c408 Yang Wang 2023-11-13 @219  	return found ? bank_error : NULL;
f5e4cc8461c408 Yang Wang 2023-11-13  220  }
f5e4cc8461c408 Yang Wang 2023-11-13  221  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
