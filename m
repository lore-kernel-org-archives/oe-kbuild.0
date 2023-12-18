Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A594FF9A
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Dec 2023 16:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bGnhROl1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702918270; x=1734454270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mEdzTuq2hDTxT6+weAQwWJzHRnDps2Vv8r3ISP658Fg=;
  b=bGnhROl1LwQ74ruDJuGZyZIj4xQPNmgnXBvP/zIyZGhu2/HrqDA9qVOf
   dvfUWLPXPEWBo1kzMIA3EJiymoICiAhbEnhzDrrRV+5f6dP+9rzqOqqa8
   vG4ePE0102IMtCIGuo86vDTwTwhbgYXaZDaxvhLWgklGkYK3N36CTE2KN
   E8rEZKcRJ20GC9m/MTFgQuD1pyyR7u2wF/VVwsHuw2eYoB0YUdV+bXQ/m
   PyXSuN6uny3q3sLaXbQ2mK51Pf1EpsrBw7xaZttgHXy09+y8G2EIqOBJM
   qAbINWXOIm2F9+CZdEhp9CKAiQVMa2K+GnyUBR6Lra14X0rnOSXCYyOo5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="2383961"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="2383961"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 08:51:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="866283664"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="866283664"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Dec 2023 08:51:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFGpd-0004L4-1K;
	Mon, 18 Dec 2023 16:51:05 +0000
Date: Tue, 19 Dec 2023 00:50:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [staging:staging-testing 87/153]
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:686
 vchiq_initialise() error: we previously assumed 'state' could be null (see
 line 681)
Message-ID: <202312190038.zuEX32PB-lkp@intel.com>
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
CC: devel@driverdev.osuosl.org
TO: Umang Jain <umang.jain@ideasonboard.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-testing
head:   5e8cdb6f6ebe28976876ab04995a5d3779b85082
commit: e70f17ed997cb7ee6c34089f2cdc2a9edc886503 [87/153] staging: vc04_services: Drop vchiq_log_error() in favour of dev_err
:::::: branch date: 3 days ago
:::::: commit date: 12 days ago
config: csky-randconfig-r081-20231218 (https://download.01.org/0day-ci/archive/20231219/202312190038.zuEX32PB-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312190038.zuEX32PB-lkp@intel.com/

smatch warnings:
drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:686 vchiq_initialise() error: we previously assumed 'state' could be null (see line 681)

vim +/state +686 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c

7b9148dcb74a004 Ojaswin Mujoo        2021-07-21  666  
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  667  #define VCHIQ_INIT_RETRIES 10
abf2836a381a307 Stefan Wahren        2021-04-25  668  int vchiq_initialise(struct vchiq_instance **instance_out)
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  669  {
2d0a0291135fd2f Dominic Braun        2018-12-14  670  	struct vchiq_state *state;
4ddf9a2555caf21 Jamal Shareef        2019-11-05  671  	struct vchiq_instance *instance = NULL;
abf2836a381a307 Stefan Wahren        2021-04-25  672  	int i, ret;
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  673  
3da8757576ef789 Amarjargal Gundjalam 2020-10-28  674  	/*
3da8757576ef789 Amarjargal Gundjalam 2020-10-28  675  	 * VideoCore may not be ready due to boot up timing.
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  676  	 * It may never be ready if kernel and firmware are mismatched,so don't
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  677  	 * block forever.
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  678  	 */
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  679  	for (i = 0; i < VCHIQ_INIT_RETRIES; i++) {
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  680  		state = vchiq_get_state();
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02 @681  		if (state)
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  682  			break;
81244ba0f03691a Stefan Wahren        2018-03-31  683  		usleep_range(500, 600);
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  684  	}
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  685  	if (i == VCHIQ_INIT_RETRIES) {
e70f17ed997cb7e Umang Jain           2023-12-05 @686  		dev_err(state->dev, "core: %s: Videocore not initialized\n", __func__);
abf2836a381a307 Stefan Wahren        2021-04-25  687  		ret = -ENOTCONN;
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  688  		goto failed;
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  689  	} else if (i > 0) {
0b12086306d0563 Umang Jain           2023-10-24  690  		vchiq_log_warning(state->dev, VCHIQ_CORE,
146707c355e9823 Gaston Gonzalez      2021-09-19  691  				  "%s: videocore initialized after %d retries\n", __func__, i);
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  692  	}
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  693  
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  694  	instance = kzalloc(sizeof(*instance), GFP_KERNEL);
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  695  	if (!instance) {
e70f17ed997cb7e Umang Jain           2023-12-05  696  		dev_err(state->dev, "core: %s: Cannot allocate vchiq instance\n", __func__);
abf2836a381a307 Stefan Wahren        2021-04-25  697  		ret = -ENOMEM;
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  698  		goto failed;
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  699  	}
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  700  
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  701  	instance->connected = 0;
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  702  	instance->state = state;
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  703  	mutex_init(&instance->bulk_waiter_list_mutex);
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  704  	INIT_LIST_HEAD(&instance->bulk_waiter_list);
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  705  
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  706  	*instance_out = instance;
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  707  
abf2836a381a307 Stefan Wahren        2021-04-25  708  	ret = 0;
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  709  
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  710  failed:
9748de55a37ee33 Umang Jain           2023-10-24  711  	vchiq_log_trace(state->dev, VCHIQ_CORE,
9748de55a37ee33 Umang Jain           2023-10-24  712  			"%s(%p): returning %d", __func__, instance, ret);
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  713  
abf2836a381a307 Stefan Wahren        2021-04-25  714  	return ret;
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  715  }
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  716  EXPORT_SYMBOL(vchiq_initialise);
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  717  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
