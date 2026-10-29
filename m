Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793265495;
	b=pfU1NaqI1BiBaxTkOISRTqMp3W8jUnZz8CWI94tFJ+Nrg06A7u8/feiFaP1Ow5sB6kJY
	 JJOY7FR36fMYupFJCKVE1Xc+1UTP3VeIbY6vAp5k4GGWi0E6ta3H3xgZYStpATFruXIr3
	 P6Qgd4RoHb8zbiVpDsps0bftKZM8XGldrLWjJnj280LRf+f6T+LNIPh80bpIfvC1WJZ64
	 Ff1B1G3EWgSuTJJ/ve2zknqPqn13k8tTz1h1rKdYPTob2aUzGeY5vFJyOqcIjvFyPPH/r
	 j25aqAQVetbSiivzP3itdqD/jcwOZRLYKco9FtoiK0LvPw39iwYMYNGNBCH/A8FnUoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793265495;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=k/J/g9UBkr4bgTjspcsF5aXYQeh6DBCp1v9jrg53jWw=;
	b=kZjJU+JfjGLXLtK4oepkyKOUkG87swCL7kWPioV55lVOnjllwy17+D3STjeBPRFRd/zw
	 1DSyhqKS0IJb6o/GgPQYHWaOUtYsC4hG8kvtH2L7o51b3XfPf0FRqDXgkuzd00IjFl21X
	 IhNUUrNYzJOkLUG+mNGepbtsbHxd5qDqUFe92jWQfvfG8mKqa3ht/rNUsQJMk9k4Y5GQV
	 ZZmCIP/SFFDXy3C+zAK7y7ctxKJmyE7cgZv8J2g1YHGEkrCGx/0e9jZOA5Pf92crZaKJt
	 Xu3eTJjk4MQWFYAxZvCdpS3CSyVhPHUsEYTJ+AA2YuY2t7uQKuav/QBYY6ufRDIuppg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CAeJ+U1+;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A78606A31A
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Oct 2026 09:18:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23A78606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CAeJ+U1+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793265493; x=1824801493;
  h=date:from:to:cc:subject:message-id;
  bh=nj940X8t4Xa2om+ooA5JrPnvBO6N4d36ulfgyFrD2P0=;
  b=CAeJ+U1+UqrxsKlAnOk7n4lUn76YZJKJxx8/CNvkzoojpHuXZtZ4Yi/8
   GJHdy0zHqChHCUSsh+q7OnU3FI/HJTVvxuUxvHyweI/rM1zqfz7faE5tj
   WkzBjZ4OiTzMVP3zZvYTLlZIlzXBZWNeGAFOTVDcXXoyf2emBUtXm2db6
   oEICRpnSLot0nH94EsybGkmp3FzXlq6mIuuvIavLg5fdxHMGWFmTZMiDM
   a5dYtx5syCLeu2+yrrC9cgsDgkMUHQC9hGOmlNfHWvGTT1A9ZAzxAYxo9
   iOArF/pZz0ECNvyD0eggHqpZvh6h3BvFk8hEhw6qoAl/694eTrXignNM7
   Q==;
X-CSE-ConnectionGUID: 4zLe0h6+QBiZzydwTwK0ow==
X-CSE-MsgGUID: wgvmI0e1Sv66MR4udzsrnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1887315"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1887315"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 02:18:13 -0700
X-CSE-ConnectionGUID: gzQ6DUSyTjGMW/i7OZ1BWQ==
X-CSE-MsgGUID: FcB6rK1PShaeQLK6uZGy8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5180854"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 29 Oct 2026 02:18:12 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMMGt-000000005Cd-1ap2;
	Thu, 29 Oct 2026 09:18:07 +0000
Date: Thu, 29 Oct 2026 10:17:19 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ulfh-mmc:devel 6/11]
 drivers/memstick/host/bcm577x5_ms.c:671 bcm577x5_ms_req_process() error: we
 previously assumed 'dev->req' could be null (see line 653)
Message-ID: <202610291015.s3D2Njcw-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ho Jie Feng <hjf3108@gmail.com>
CC: Ulf Hansson <ulfh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git devel
head:   2ff8dfc1822a90414af82c144bc788ce06127885
commit: 67f654add5a2b328a6bd741d3275af23e20a688a [6/11] memstick: Add Broadcom BCM57765/BCM57785 host driver
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: powerpc-randconfig-r2200-20261029 (https://download.01.org/0day-ci/archive/20261029/202610291015.s3D2Njcw-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610291015.s3D2Njcw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610291015.s3D2Njcw-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: arch/powerpc/boot/wrapper.a(decompress.o): in function `partial_decompress':
>> arch/powerpc/boot/decompress.c:132:(.text+0x1b4): undefined reference to `__decompress'

smatch warnings:
drivers/memstick/host/bcm577x5_ms.c:671 bcm577x5_ms_req_process() error: we previously assumed 'dev->req' could be null (see line 653)

vim +671 drivers/memstick/host/bcm577x5_ms.c

67f654add5a2b3 Ho Jie Feng 2026-10-02  645  
67f654add5a2b3 Ho Jie Feng 2026-10-02  646  static void bcm577x5_ms_req_process(struct work_struct *data)
67f654add5a2b3 Ho Jie Feng 2026-10-02  647  {
67f654add5a2b3 Ho Jie Feng 2026-10-02  648  	struct bcm577x5_device *dev =
67f654add5a2b3 Ho Jie Feng 2026-10-02  649  		container_of(data, struct bcm577x5_device, req_work);
67f654add5a2b3 Ho Jie Feng 2026-10-02  650  	int err, cmderr = 0;
67f654add5a2b3 Ho Jie Feng 2026-10-02  651  
67f654add5a2b3 Ho Jie Feng 2026-10-02  652  	/* Already processing requests */
67f654add5a2b3 Ho Jie Feng 2026-10-02 @653  	if (dev->req)
67f654add5a2b3 Ho Jie Feng 2026-10-02  654  		return;
67f654add5a2b3 Ho Jie Feng 2026-10-02  655  
67f654add5a2b3 Ho Jie Feng 2026-10-02  656  	mutex_lock(&dev->req_lock);
67f654add5a2b3 Ho Jie Feng 2026-10-02  657  	do {
67f654add5a2b3 Ho Jie Feng 2026-10-02  658  		err = memstick_next_req(dev->host, &dev->req);
67f654add5a2b3 Ho Jie Feng 2026-10-02  659  
67f654add5a2b3 Ho Jie Feng 2026-10-02  660  		if (!err && completion_done(&dev->host->card->mrq_complete)) {
67f654add5a2b3 Ho Jie Feng 2026-10-02  661  			dev->req = NULL;
67f654add5a2b3 Ho Jie Feng 2026-10-02  662  			break;
67f654add5a2b3 Ho Jie Feng 2026-10-02  663  		}
67f654add5a2b3 Ho Jie Feng 2026-10-02  664  
67f654add5a2b3 Ho Jie Feng 2026-10-02  665  		if (!err) {
67f654add5a2b3 Ho Jie Feng 2026-10-02  666  			atomic_set(&dev->int_seen, 0);
67f654add5a2b3 Ho Jie Feng 2026-10-02  667  			cmderr = bcm577x5_ms_execute_cmd(dev);
67f654add5a2b3 Ho Jie Feng 2026-10-02  668  			if (atomic_read(&dev->int_seen) &
67f654add5a2b3 Ho Jie Feng 2026-10-02  669  			    BCM577x5_MS_INT_CARD_REMOVE)
67f654add5a2b3 Ho Jie Feng 2026-10-02  670  				cmderr = -ENODEV;
67f654add5a2b3 Ho Jie Feng 2026-10-02 @671  			dev->req->error = cmderr;
67f654add5a2b3 Ho Jie Feng 2026-10-02  672  		}
67f654add5a2b3 Ho Jie Feng 2026-10-02  673  	} while (!err && !cmderr);
67f654add5a2b3 Ho Jie Feng 2026-10-02  674  
67f654add5a2b3 Ho Jie Feng 2026-10-02  675  	if (cmderr) {
67f654add5a2b3 Ho Jie Feng 2026-10-02  676  		/* Reset the controller so it accepts new commands */
67f654add5a2b3 Ho Jie Feng 2026-10-02  677  		bcm577x5_ms_init(dev);
67f654add5a2b3 Ho Jie Feng 2026-10-02  678  
67f654add5a2b3 Ho Jie Feng 2026-10-02  679  		/* Controller will not respond to any more commands anyway */
67f654add5a2b3 Ho Jie Feng 2026-10-02  680  		while (!err && dev->req) {
67f654add5a2b3 Ho Jie Feng 2026-10-02  681  			dev->req->error = cmderr;
67f654add5a2b3 Ho Jie Feng 2026-10-02  682  			err = memstick_next_req(dev->host, &dev->req);
67f654add5a2b3 Ho Jie Feng 2026-10-02  683  		}
67f654add5a2b3 Ho Jie Feng 2026-10-02  684  	}
67f654add5a2b3 Ho Jie Feng 2026-10-02  685  	mutex_unlock(&dev->req_lock);
67f654add5a2b3 Ho Jie Feng 2026-10-02  686  }
67f654add5a2b3 Ho Jie Feng 2026-10-02  687  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
