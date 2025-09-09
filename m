Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08361239E76
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Sep 2025 01:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757382771; cv=none; b=DiR1ZweTzWYjamW+4LxqVpjKQXfvk1f5HQZjBtte08UGpeO8ztcTtQhZeskBEU288dCga2EFY85b6eDf5PJIRoJqDumdWb9MZLG87ETh3qigeCr5Gm0I1gWroiPoh7j2xPZBPJH5ruhW2nLPTx4x9YzhnKp/H1H94Fi8g7mqzLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757382771; c=relaxed/simple;
	bh=1cHuqHCK7RIdtXQzbhxy7s8zRnykZ7r74eyAuI/gDVs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NekmoVsy7mpLLs8XGYjijaqDCVRyFI+eJ8TAkM2KEW+liYB3U9Y1zSfsHo358AIkEg5GYCvXrFsgctuiCX27oL39GbHVkEsJlNmadCxN3Nm4iy8UWXOxi/zfGWIAAzpVpVabQ+T3yJ40jWv4p5o9XLzSSA8/JYRyl6P1iNop5fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RR+QPSy4; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RR+QPSy4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757382770; x=1788918770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1cHuqHCK7RIdtXQzbhxy7s8zRnykZ7r74eyAuI/gDVs=;
  b=RR+QPSy4xq3d/bHeQHNGXr17ClKFzraqCKNXZh+Uv9AwgjV8cYhtv9vc
   Wv69bA0tDSpHxLq3Ex/yV5FUY51zYpBC32Q2suSoCFtF9a3icSqq+jGEM
   R1+MF0f9cRtl8eVvH3d6j/aUMTtWvaQvmnjtjjMC7oqVCR8eeI3dWQjSA
   G7EFrQGy5jPB/lgOfnNQwWLReJqBFJboEVtSZmox9/HxRbxkHgSFi2BG5
   mSdBq2/gu4lz2fzeP4VfUo8xiphlLyM4bUalIDea9I+S7sVh6t+IErlFi
   Ih6IxV6jRSYDkLZQkXGDPdVa3yMA/BljQVa0rE4DfHbw4f2oRDNTsItBJ
   Q==;
X-CSE-ConnectionGUID: /8dvBMuzQxSyWKhORIYx5g==
X-CSE-MsgGUID: k42ElNOWQFS3aLRsNzTpIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="47230752"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="47230752"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 18:52:47 -0700
X-CSE-ConnectionGUID: Ej2HoK0MTpWdDE6lfAhXLQ==
X-CSE-MsgGUID: L0T3DyfBTw6zVC/ocxEc6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="172533679"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Sep 2025 18:52:46 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvnXH-0004Jv-3D;
	Tue, 09 Sep 2025 01:52:44 +0000
Date: Tue, 9 Sep 2025 09:52:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 3/5] platform/broadcom: Destage VCHIQ interface
Message-ID: <202509090905.ozoCDQHp-lkp@intel.com>
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
In-Reply-To: <20250907-vchiq-destage-v2-3-6884505dca78@ideasonboard.com>
References: <20250907-vchiq-destage-v2-3-6884505dca78@ideasonboard.com>
TO: Jai Luthra <jai.luthra@ideasonboard.com>
TO: Florian Fainelli <florian.fainelli@broadcom.com>
TO: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Ray Jui <rjui@broadcom.com>
TO: Scott Branden <sbranden@broadcom.com>
CC: linux-rpi-kernel@lists.infradead.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-staging@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: kernel-list@raspberrypi.com
CC: Stefan Wahren <wahrenst@gmx.net>
CC: Dave Stevenson <dave.stevenson@raspberrypi.com>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Jai Luthra <jai.luthra@ideasonboard.com>

Hi Jai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f5ae30d69d7543eee0d70083daf4de8fe15d585]

url:    https://github.com/intel-lab-lkp/linux/commits/Jai-Luthra/include-linux-Destage-VCHIQ-interface-headers/20250907-170042
base:   8f5ae30d69d7543eee0d70083daf4de8fe15d585
patch link:    https://lore.kernel.org/r/20250907-vchiq-destage-v2-3-6884505dca78%40ideasonboard.com
patch subject: [PATCH v2 3/5] platform/broadcom: Destage VCHIQ interface
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: xtensa-randconfig-r071-20250909 (https://download.01.org/0day-ci/archive/20250909/202509090905.ozoCDQHp-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509090905.ozoCDQHp-lkp@intel.com/

New smatch warnings:
drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c:3325 vchiq_connect_internal() warn: iterator 'i' not incremented
drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c:3359 vchiq_shutdown_internal() warn: iterator 'i' not incremented
drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c:1157 vchiq_instance_get_use_count() warn: iterator 'i' not incremented
drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c:1184 vchiq_instance_set_trace() warn: iterator 'i' not incremented

Old smatch warnings:
arch/xtensa/include/asm/thread_info.h:97 current_thread_info() warn: inconsistent indenting
arch/xtensa/include/asm/thread_info.h:97 current_thread_info() warn: inconsistent indenting

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
