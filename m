Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F27030359
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Dec 2023 13:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DIQj/tob"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702734222; x=1734270222;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=85hrrlIy01y9bZuod3CZ2tPK3Wk+r0Y73n/+iSXGOVM=;
  b=DIQj/tob1BF91/mZC7IbfeAv07sFrOW8rRXxUcWxWWAwtYbjp/Tpx9ap
   cLTUb6s2SHiTHuyAUI9lgC/ksc/tqSTaBpyQIJojUIab3mmPnxFUkKG8p
   gwibKU7auWqinPM5+BYn/D3uWL7NyuNolGypHiPszUsmenCcJCO9D+Ohy
   YsGhzdS9WboTqtwfchz9bFviJwSac/5ykZB7jx3yBSiPQuMfdY4iPm6Rn
   ZHspY+OC8OsoE4uQo5kwkLOCsBBaTxEe+fTTPjr0eipaANq/ickrjIF/4
   1a24yBVV30GKF6G7RKlYxF+aEWa4xupQrnGadI6TAGFtnzt2HIV19l07y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="16930914"
X-IronPort-AV: E=Sophos;i="6.04,281,1695711600"; 
   d="scan'208";a="16930914"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 05:43:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="1106435523"
X-IronPort-AV: E=Sophos;i="6.04,281,1695711600"; 
   d="scan'208";a="1106435523"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 16 Dec 2023 05:43:40 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEUx8-0001fg-1B;
	Sat, 16 Dec 2023 13:43:38 +0000
Date: Sat, 16 Dec 2023 21:42:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c:79:2-8: WARNING: NULL
 check before some freeing functions is not needed.
Message-ID: <202312162143.qXua7GQQ-lkp@intel.com>
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
TO: Lucas Stach <l.stach@pengutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c8e97fc6b4c057a350a9e9a1ad625e10cc9c39ee
commit: fd4b77e8deea9cced6c1eca8bd64d2f03fc7cc94 drm/etnaviv: don't restrict to certain architectures
date:   4 years, 11 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 4 years, 11 months ago
config: i386-randconfig-053-20231216 (https://download.01.org/0day-ci/archive/20231216/202312162143.qXua7GQQ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312162143.qXua7GQQ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c:79:2-8: WARNING: NULL check before some freeing functions is not needed.
--
>> drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:588:2-8: WARNING: NULL check before some freeing functions is not needed.
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:590:2-8: WARNING: NULL check before some freeing functions is not needed.
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:592:2-8: WARNING: NULL check before some freeing functions is not needed.
   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:594:2-8: WARNING: NULL check before some freeing functions is not needed.
--
>> drivers/gpu/drm/etnaviv/etnaviv_gem.c:335:8-15: ERROR: reference preceded by free on line 323
--
>> drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1736:2-9: line 1736 is redundant because platform_get_irq() already prints an error

vim +79 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c

a8c21a5451d831 The etnaviv authors 2015-12-03  68  
a8c21a5451d831 The etnaviv authors 2015-12-03  69  static void etnaviv_gem_prime_release(struct etnaviv_gem_object *etnaviv_obj)
a8c21a5451d831 The etnaviv authors 2015-12-03  70  {
a8c21a5451d831 The etnaviv authors 2015-12-03  71  	if (etnaviv_obj->vaddr)
a8c21a5451d831 The etnaviv authors 2015-12-03  72  		dma_buf_vunmap(etnaviv_obj->base.import_attach->dmabuf,
a8c21a5451d831 The etnaviv authors 2015-12-03  73  			       etnaviv_obj->vaddr);
a8c21a5451d831 The etnaviv authors 2015-12-03  74  
a8c21a5451d831 The etnaviv authors 2015-12-03  75  	/* Don't drop the pages for imported dmabuf, as they are not
a8c21a5451d831 The etnaviv authors 2015-12-03  76  	 * ours, just free the array we allocated:
a8c21a5451d831 The etnaviv authors 2015-12-03  77  	 */
a8c21a5451d831 The etnaviv authors 2015-12-03  78  	if (etnaviv_obj->pages)
2098105ec65cb3 Michal Hocko        2017-05-17 @79  		kvfree(etnaviv_obj->pages);
a8c21a5451d831 The etnaviv authors 2015-12-03  80  
a8c21a5451d831 The etnaviv authors 2015-12-03  81  	drm_prime_gem_destroy(&etnaviv_obj->base, etnaviv_obj->sgt);
a8c21a5451d831 The etnaviv authors 2015-12-03  82  }
a8c21a5451d831 The etnaviv authors 2015-12-03  83  

:::::: The code at line 79 was first introduced by commit
:::::: 2098105ec65cb364f3d77baa446b2ad5ba6bc7b9 drm: drop drm_[cm]alloc* helpers

:::::: TO: Michal Hocko <mhocko@kernel.org>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
