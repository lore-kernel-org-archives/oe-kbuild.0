Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359AF1D54F
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Jan 2024 20:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705436675; cv=none; b=MWRm4WSs6UMtebPMH7VBChXNlV4oDOZXiA0ASlQWjKbcyQDFqt+nRLF1wuRllB7O0hXfC3byS1KuV8jRshKUf6kCHpj3KeRnuGkPrZqC9inxjb4O4MtOxANgNd5nG0l+Iz4sMNe2M9BJi0teP8RbgFOTK0ka9K+U0P4e3505LLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705436675; c=relaxed/simple;
	bh=nrLNc+fbRYX+XRNf2WR6FOSafzp9cVYYIUk6jg0kB/0=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	b=gDE58EvUOLEzLQKCsaFoQZrqazDG7zZNnLhtX4v1yEs0yZ7KPM0iw7ND7AY82vpNQ23o3u08zLItYj26vp275RHRfeJq+odzHQBIrJvSRw36iQmiIYuqUy9LqMYq7TjKpTku9dqN6TDCdTTZ3Dte9+7XCdjVTeCM8NEuT4Iz0J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EiQSzZun; arc=none smtp.client-ip=192.55.52.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EiQSzZun"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705436674; x=1736972674;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nrLNc+fbRYX+XRNf2WR6FOSafzp9cVYYIUk6jg0kB/0=;
  b=EiQSzZunfGNtI9PxDR/h3aUQqXOHWVsW38s4EgQwjq9zGqs8EE5a596U
   6p4YPLCuNULd/Wp6gt9IKlPgSjV0GjkIwPbM51Rh8033yRzeDzpx7Grlv
   GyIfY2NJEkF6YoT8tPFR2vx5N+S0pJEy5mCTjP8AQGCto2g1dUmMtCbSG
   nfWCyKeyvg4nY/yhvoXDoqUPSmWTlltMZhI+4i439yOPDCFQqvTSlTTwo
   mOaSzToLpupraXRf9AD3YVS2hbwd6NyRL35CQGQgrWqdKIbLfOcIpixeP
   PwSOXF2a9C/ilPLU7XM/xxsJ6d+9Jxbbdc5rFXUSB4Y/pCPM63SOdHART
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="486137104"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="486137104"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 12:24:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="927602483"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="927602483"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 16 Jan 2024 12:24:29 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPpz1-0001CM-15;
	Tue, 16 Jan 2024 20:24:27 +0000
Date: Wed, 17 Jan 2024 04:23:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 12780/13343]
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c:219:16-26: ERROR: invalid reference
 to the index variable of the iterator on line 207
Message-ID: <202401170411.vHFo6VUt-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Yang Wang <kevinyang.wang@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Hawking Zhang <Hawking.Zhang@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8d04a7e2ee3fd6aabb8096b00c64db0d735bc874
commit: 22a4fa4709e3dc6e95b6d4343b078a9e428c9d28 [12780/13343] drm/amdgpu: implement RAS ACA driver framework
:::::: branch date: 5 days ago
:::::: commit date: 7 days ago
config: arc-randconfig-r062-20240116 (https://download.01.org/0day-ci/archive/20240117/202401170411.vHFo6VUt-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401170411.vHFo6VUt-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c:219:16-26: ERROR: invalid reference to the index variable of the iterator on line 207

vim +219 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c

22a4fa4709e3dc Yang Wang 2023-11-13  199  
22a4fa4709e3dc Yang Wang 2023-11-13  200  static struct aca_bank_error *find_bank_error(struct aca_error *aerr, struct aca_bank_info *info)
22a4fa4709e3dc Yang Wang 2023-11-13  201  {
22a4fa4709e3dc Yang Wang 2023-11-13  202  	struct aca_bank_error *bank_error = NULL;
22a4fa4709e3dc Yang Wang 2023-11-13  203  	struct aca_bank_info *tmp_info;
22a4fa4709e3dc Yang Wang 2023-11-13  204  	bool found = false;
22a4fa4709e3dc Yang Wang 2023-11-13  205  
22a4fa4709e3dc Yang Wang 2023-11-13  206  	mutex_lock(&aerr->lock);
22a4fa4709e3dc Yang Wang 2023-11-13 @207  	list_for_each_entry(bank_error, &aerr->list, node) {
22a4fa4709e3dc Yang Wang 2023-11-13  208  		tmp_info = &bank_error->info;
22a4fa4709e3dc Yang Wang 2023-11-13  209  		if (tmp_info->socket_id == info->socket_id &&
22a4fa4709e3dc Yang Wang 2023-11-13  210  		    tmp_info->die_id == info->die_id) {
22a4fa4709e3dc Yang Wang 2023-11-13  211  			found = true;
22a4fa4709e3dc Yang Wang 2023-11-13  212  			goto out_unlock;
22a4fa4709e3dc Yang Wang 2023-11-13  213  		}
22a4fa4709e3dc Yang Wang 2023-11-13  214  	}
22a4fa4709e3dc Yang Wang 2023-11-13  215  
22a4fa4709e3dc Yang Wang 2023-11-13  216  out_unlock:
22a4fa4709e3dc Yang Wang 2023-11-13  217  	mutex_unlock(&aerr->lock);
22a4fa4709e3dc Yang Wang 2023-11-13  218  
22a4fa4709e3dc Yang Wang 2023-11-13 @219  	return found ? bank_error : NULL;
22a4fa4709e3dc Yang Wang 2023-11-13  220  }
22a4fa4709e3dc Yang Wang 2023-11-13  221  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
