Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F6E2BE620
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Dec 2025 16:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766420971; cv=none; b=hkkK3E65lB0AZRoy0QzcbjmUluY9VOeuvyhABstiBVojKeRclLnoHJOrerTpOgmoBrSn9UtXnniCHOn+JD6aAvLfFKPvjD3PRP3js4RDl9AVPeLT9wCYjrZ2cKWhxP7PuxpAxTkp74qdotL+CBspYtn411mQZ+tpwXdXSpR31Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766420971; c=relaxed/simple;
	bh=01jFnRPqrXFiKPTMRSDB1UiLZ41eI1zv2VNXD9syCUM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Tg7tmMN7vLJZN0FoMQWsIbSgk0AFsq3rd2VRRiQ92AvEmEcBXZ/PcZO/GKVPZhKhLlMqru3rEBgEBcwreWDqQjhGpbDiaH2SQcOUSo/pb4ZfgxkJQu8pLtfJBjXGCaY7J/cMb26WLh9HEYI7Dd/m2LPA3Kzklr6k9fN1FfdNyH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q3moyg0f; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q3moyg0f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766420969; x=1797956969;
  h=date:from:to:cc:subject:message-id;
  bh=01jFnRPqrXFiKPTMRSDB1UiLZ41eI1zv2VNXD9syCUM=;
  b=Q3moyg0fBTJICKDQ8GKdAaayQHU4+MwAyEQvrIO16DVSbvgaN7bSDmNH
   nsIrmNwYQ1KeOyO57s2AEuktEgg6DU4xOoPQTYtwVMEuxlBHsrpIaly4N
   edDRBdq12FyS32nWnyurkQsJ9EUI1UPw2Qcs2BHfvKZXjnQXUDm/kGgBe
   pBqUUtGBGWWCZlhoI9/y+cYcVjSsAftwShrjx7EtGHWjl/dIK0Yg0EwhU
   wglMX0dlaz6XPAaF8n/JMaF+FtTOR6bylVf6/sePWsR9MhrcUOJi7XLE1
   Iet2JK0PBgt5bNGMymMuvOWd/bIFsegFWQpuWDOeQGs6EFdyC8lfEhHCK
   A==;
X-CSE-ConnectionGUID: b+b8/oX1Ty6AA7nX/pJPlQ==
X-CSE-MsgGUID: DbunQnx+RluP6qCTy6SrbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68031598"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="68031598"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 08:29:29 -0800
X-CSE-ConnectionGUID: S383b06aRJKk/cbpoafneg==
X-CSE-MsgGUID: QoZsYc0MR3i8zror5hRlOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="198702543"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 22 Dec 2025 08:29:28 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXimj-000000000pN-0bwm;
	Mon, 22 Dec 2025 16:29:25 +0000
Date: Tue, 23 Dec 2025 00:29:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: 
 drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c:3325
 vchiq_connect_internal() warn: iterator 'i' not incremented
Message-ID: <202512230028.z8DREZKj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jai Luthra <jai.luthra@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9448598b22c50c8a5bb77a9103e2d49f134c9578
commit: aa125180c673881f88b528600b57865dc158b3a7 platform/raspberrypi: Destage VCHIQ interface
date:   6 weeks ago
:::::: branch date: 17 hours ago
:::::: commit date: 6 weeks ago
config: arc-randconfig-r072-20251222 (https://download.01.org/0day-ci/archive/20251223/202512230028.z8DREZKj-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230028.z8DREZKj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512230028.z8DREZKj-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__ld_r13_to_r23_ret" [lib/zstd/zstd_decompress.ko] undefined!
>> ERROR: modpost: "__st_r13_to_r22" [lib/zstd/zstd_decompress.ko] undefined!
>> ERROR: modpost: "__ld_r13_to_r19_ret" [lib/zstd/zstd_decompress.ko] undefined!
>> ERROR: modpost: "__ld_r13_to_r22_ret" [lib/zstd/zstd_decompress.ko] undefined!
>> ERROR: modpost: "__st_r13_to_r15" [lib/zstd/zstd_decompress.ko] undefined!
>> ERROR: modpost: "__st_r13_to_r24" [lib/zstd/zstd_decompress.ko] undefined!
>> ERROR: modpost: "__st_r13_to_r19" [lib/zstd/zstd_decompress.ko] undefined!
>> ERROR: modpost: "__st_r13_to_r23" [lib/zstd/zstd_decompress.ko] undefined!
>> ERROR: modpost: "__ld_r13_to_r24_ret" [lib/zstd/zstd_decompress.ko] undefined!
>> ERROR: modpost: "__ld_r13_to_r18_ret" [lib/zstd/zstd_decompress.ko] undefined!
   WARNING: modpost: suppressed 4 unresolved symbol warnings because there were too many)

smatch warnings:
drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c:3325 vchiq_connect_internal() warn: iterator 'i' not incremented
drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c:3359 vchiq_shutdown_internal() warn: iterator 'i' not incremented
drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c:1162 vchiq_instance_get_use_count() warn: iterator 'i' not incremented
drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c:1189 vchiq_instance_set_trace() warn: iterator 'i' not incremented

vim +/i +3325 drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c

71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  3316  
3ba317227aa416 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Umang Jain             2022-12-23  3317  int
4ddf9a2555caf2 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Jamal Shareef          2019-11-05  3318  vchiq_connect_internal(struct vchiq_state *state, struct vchiq_instance *instance)
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  3319  {
7926c328d9586d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Dominic Braun          2018-12-14  3320  	struct vchiq_service *service;
fbd06c751a5c20 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Umang Jain             2024-09-18  3321  	int status = 0;
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  3322  	int i;
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  3323  
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  3324  	/* Find all services registered to this client and enable them. */
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02 @3325  	i = 0;
8a7e5633b506d6 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Gaston Gonzalez        2021-10-24  3326  	while ((service = next_service_by_instance(state, instance, &i)) != NULL) {
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  3327  		if (service->srvstate == VCHIQ_SRVSTATE_HIDDEN)
69838a4e0c4a02 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Stefan Wahren          2022-01-23  3328  			set_service_state(service, VCHIQ_SRVSTATE_LISTENING);
68a485965abad7 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Stefan Wahren          2021-06-03  3329  		vchiq_service_put(service);
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  3330  	}
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  3331  
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  3332  	if (state->conn_state == VCHIQ_CONNSTATE_DISCONNECTED) {
fbd06c751a5c20 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Umang Jain             2024-09-18  3333  		status = queue_message(state, NULL, MAKE_CONNECT, NULL, NULL, 0,
fbd06c751a5c20 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Umang Jain             2024-09-18  3334  				       QMFLAGS_IS_BLOCKING);
fbd06c751a5c20 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Umang Jain             2024-09-18  3335  		if (status)
fbd06c751a5c20 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Umang Jain             2024-09-18  3336  			return status;
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  3337  
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  3338  		vchiq_set_conn_state(state, VCHIQ_CONNSTATE_CONNECTING);
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  3339  	}
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  3340  
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  3341  	if (state->conn_state == VCHIQ_CONNSTATE_CONNECTING) {
086efbabdc0456 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Nicolas Saenz Julienne 2019-05-09  3342  		if (wait_for_completion_interruptible(&state->connect))
82a9eb4a3561e1 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Umang Jain             2022-12-23  3343  			return -EAGAIN;
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  3344  
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  3345  		vchiq_set_conn_state(state, VCHIQ_CONNSTATE_CONNECTED);
f27e47bc6b8b96 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Nicolas Saenz Julienne 2018-11-20  3346  		complete(&state->connect);
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  3347  	}
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  3348  
fbd06c751a5c20 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Umang Jain             2024-09-18  3349  	return status;
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  3350  }
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  3351  
e39ff0e4eab67d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Stefan Wahren          2021-05-15  3352  void
4ddf9a2555caf2 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Jamal Shareef          2019-11-05  3353  vchiq_shutdown_internal(struct vchiq_state *state, struct vchiq_instance *instance)
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  3354  {
7926c328d9586d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Dominic Braun          2018-12-14  3355  	struct vchiq_service *service;
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  3356  	int i;
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  3357  
1d702f5962f79e drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Stefan Wahren          2021-05-15  3358  	/* Find all services registered to this client and remove them. */
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02 @3359  	i = 0;
8a7e5633b506d6 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Gaston Gonzalez        2021-10-24  3360  	while ((service = next_service_by_instance(state, instance, &i)) != NULL) {
14780bb174266e drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Adrien Thierry         2022-05-18  3361  		(void)vchiq_remove_service(instance, service->handle);
68a485965abad7 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c Stefan Wahren          2021-06-03  3362  		vchiq_service_put(service);
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  3363  	}
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  3364  }
71bad7f086419d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c popcornmix             2013-07-02  3365  

:::::: The code at line 3325 was first introduced by commit
:::::: 71bad7f086419dc674244b91ca35a12bfa4cb597 staging: add bcm2708 vchiq driver

:::::: TO: popcornmix <popcornmix@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
