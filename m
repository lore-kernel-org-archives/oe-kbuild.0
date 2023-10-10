Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50A22FE36
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Oct 2023 17:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XtiG4KCB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696959094; x=1728495094;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dmbGCPV69S4vrWUL/bSAeYfvEHC5Mtg578NhUTRKvEU=;
  b=XtiG4KCBsG/aac2NgAinnLPwYQbsq0I2GH3xT60x0QAmhlO/tDur4xvC
   6hW0fOu5BAgaR1DpIDOzlF4EIjb6iYYmkbdVMRYzirpHlGRQ63xsZqDBd
   9DVIyPR8n0SSXE8at2y3HOlwAlB4I7Wy8KgKEajjQkXjFuzh5tLjhlJOm
   gQDRD/Bfnm8j001UihFRKCDP6VC2INPzk1O/2JF1F5oNgz51KaSzqbVm3
   PBH+U5HF30o46M7JGYdoQfOvYJzKZe7g2vHSaHC749xM+Y2rP71IO+S6J
   w9IKP4i64yqjA3/IKjb9pCvEectOJevXPoqix1fw0BD8/MY18Os2JJqi/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="384317216"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; 
   d="scan'208";a="384317216"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 10:31:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="897275606"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; 
   d="scan'208";a="897275606"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 10 Oct 2023 10:29:49 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqGZu-0000q7-1d;
	Tue, 10 Oct 2023 17:31:30 +0000
Date: Wed, 11 Oct 2023 01:30:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 6935/11192]
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c:538:25-29: ERROR:
 aconnector is NULL but dereferenced.
Message-ID: <202310110104.H593hwLd-lkp@intel.com>
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
TO: Hamza Mahfooz <hamza.mahfooz@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c0a6edb636cba9c0d1db966a54d910a02e52e4be
commit: 5d72e247e58c966f4e50cffebf0d414de7fc90ed [6935/11192] drm/amd/display: switch DC over to the new DRM logging macros
:::::: branch date: 12 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-104-20231010 (https://download.01.org/0day-ci/archive/20231011/202310110104.H593hwLd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231011/202310110104.H593hwLd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202310110104.H593hwLd-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c:538:25-29: ERROR: aconnector is NULL but dereferenced.

vim +538 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c

4562236b3bc0a28 Harry Wentland 2017-09-12  534  
c84dec2fe8837fa Harry Wentland 2017-09-05  535  	struct amdgpu_dm_connector *aconnector = link->priv;
4562236b3bc0a28 Harry Wentland 2017-09-12  536  
4562236b3bc0a28 Harry Wentland 2017-09-12  537  	if (!aconnector) {
5d72e247e58c966 Hamza Mahfooz  2023-09-20 @538  		drm_dbg_dp(aconnector->base.dev,
5d72e247e58c966 Hamza Mahfooz  2023-09-20  539  			   "Failed to find connector for link!\n");
4562236b3bc0a28 Harry Wentland 2017-09-12  540  		return false;
4562236b3bc0a28 Harry Wentland 2017-09-12  541  	}
4562236b3bc0a28 Harry Wentland 2017-09-12  542  
4648cf5fc8c78d7 Hamza Mahfooz  2023-03-08  543  	return drm_dp_dpcd_read(&aconnector->dm_dp_aux.aux, address, data,
4648cf5fc8c78d7 Hamza Mahfooz  2023-03-08  544  				size) == size;
4562236b3bc0a28 Harry Wentland 2017-09-12  545  }
4562236b3bc0a28 Harry Wentland 2017-09-12  546  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
