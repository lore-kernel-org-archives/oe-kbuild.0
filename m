Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D648614EC60
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Nov 2024 21:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732743168; cv=none; b=u6YZaItChYJ46q/Hji1yzwNyLEMXcbp98+sbTpdWCxduw2l5TTL7OEQnLVWcm9BtJJOJ9807jYzxvwi2Nqf82vCK2V1g5xH+577Ro40PgoR2qZubCqJdY+DE6C7w3mTF6hfg8dwwa5V58WHaugy4JlD5HSupqMkoZEUB8l87lPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732743168; c=relaxed/simple;
	bh=vCIbueTfx69heU6nPyWUXrbvERrQ8++9rTbSGrT3K74=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XtT+OxHeY/P0Dm8fHNz+Q69svm3khBnaiwIK1WLQKon4i9q0wBTJm9G29OxZJ314hafOHH0pwuHpH06H/4XTVtvMdPW5Kwz9+0vhRLmyNP/ciTjgNl8e11ZBweqJqjrYY+tTjnEe/qPimq0jZD1pL/TwbuZr7WndkkHZEPheQps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hFxz/mVz; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hFxz/mVz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732743166; x=1764279166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vCIbueTfx69heU6nPyWUXrbvERrQ8++9rTbSGrT3K74=;
  b=hFxz/mVzUZ7ubk/gEzydB14us0zakK7K3fVOkrgKIZAO+YFEkH4d0h2a
   neHymusJH5zGX0IxMKL760RzS7m7yI8J2xa4riawSmfezGcna95vugZNo
   KLDgdEyWaBsTizq470Qxp+huY11b6vSMC0SLaK3cRaHi9vU6qgC5lCoMH
   1XdPQB4lub2D/R7YnQiBeC6DlrCjB60w4rDTGFfaRbXW7rYTJKWS+rhTs
   IDU6DUauo2U1bON1FN5y3Uoz4RYlm+C/jA7skleWvk32a8mnlGVXHMZ4g
   1fxjrxIInR0GNPQ7whJtpM8nUDoNQ/rW/4tw86NJ3A9CNT8WU4ck7lncB
   A==;
X-CSE-ConnectionGUID: Kd1txaoXRl+TXaw9s9nl4g==
X-CSE-MsgGUID: 7HwNXK8zRyq40F5K67IZiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="43572382"
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; 
   d="scan'208";a="43572382"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 13:32:45 -0800
X-CSE-ConnectionGUID: vjqPR0CAR+Ca/BqqeWEGHA==
X-CSE-MsgGUID: U4MJUxO5TsSjDRrXU9vKlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; 
   d="scan'208";a="96496467"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Nov 2024 13:32:44 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGPeL-0008NT-07;
	Wed, 27 Nov 2024 21:32:41 +0000
Date: Thu, 28 Nov 2024 05:31:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android16-6.12 38/6123]
 net/netfilter/xt_IDLETIMER.c:206 idletimer_tg_show() error: we previously
 assumed 'timer' could be null (see line 197)
Message-ID: <202411280507.zHUMJ6Re-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   a25cb215b47fd50a85585c15ccaa72675c8426a6
commit: f0c2df2b1228a4407c72e92e07d9f3fe695fa558 [38/6123] ANDROID: netfilter: xt_IDLETIMER: Add new netlink msg type
:::::: branch date: 5 hours ago
:::::: commit date: 6 years ago
config: i386-randconfig-141-20241122 (https://download.01.org/0day-ci/archive/20241128/202411280507.zHUMJ6Re-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411280507.zHUMJ6Re-lkp@intel.com/

smatch warnings:
net/netfilter/xt_IDLETIMER.c:206 idletimer_tg_show() error: we previously assumed 'timer' could be null (see line 197)
net/netfilter/xt_IDLETIMER.c:243 idletimer_resume() warn: can 'timer' even be NULL?

vim +/timer +206 net/netfilter/xt_IDLETIMER.c

0902b469bd2506 Luciano Coelho 2010-06-15  186  
0902b469bd2506 Luciano Coelho 2010-06-15  187  static ssize_t idletimer_tg_show(struct kobject *kobj, struct attribute *attr,
0902b469bd2506 Luciano Coelho 2010-06-15  188  				 char *buf)
0902b469bd2506 Luciano Coelho 2010-06-15  189  {
0902b469bd2506 Luciano Coelho 2010-06-15  190  	struct idletimer_tg *timer;
0902b469bd2506 Luciano Coelho 2010-06-15  191  	unsigned long expires = 0;
f0c2df2b1228a4 JP Abgrall     2012-04-26  192  	unsigned long now = jiffies;
0902b469bd2506 Luciano Coelho 2010-06-15  193  
0902b469bd2506 Luciano Coelho 2010-06-15  194  	mutex_lock(&list_mutex);
0902b469bd2506 Luciano Coelho 2010-06-15  195  
0902b469bd2506 Luciano Coelho 2010-06-15  196  	timer =	__idletimer_tg_find_by_label(attr->name);
0902b469bd2506 Luciano Coelho 2010-06-15 @197  	if (timer)
0902b469bd2506 Luciano Coelho 2010-06-15  198  		expires = timer->timer.expires;
0902b469bd2506 Luciano Coelho 2010-06-15  199  
0902b469bd2506 Luciano Coelho 2010-06-15  200  	mutex_unlock(&list_mutex);
0902b469bd2506 Luciano Coelho 2010-06-15  201  
f0c2df2b1228a4 JP Abgrall     2012-04-26  202  	if (time_after(expires, now))
0902b469bd2506 Luciano Coelho 2010-06-15  203  		return sprintf(buf, "%u\n",
f0c2df2b1228a4 JP Abgrall     2012-04-26  204  			       jiffies_to_msecs(expires - now) / 1000);
0902b469bd2506 Luciano Coelho 2010-06-15  205  
f0c2df2b1228a4 JP Abgrall     2012-04-26 @206  	if (timer->send_nl_msg)
f0c2df2b1228a4 JP Abgrall     2012-04-26  207  		return sprintf(buf, "0 %d\n",
f0c2df2b1228a4 JP Abgrall     2012-04-26  208  			jiffies_to_msecs(now - expires) / 1000);
f0c2df2b1228a4 JP Abgrall     2012-04-26  209  	else
0902b469bd2506 Luciano Coelho 2010-06-15  210  		return sprintf(buf, "0\n");
0902b469bd2506 Luciano Coelho 2010-06-15  211  }
0902b469bd2506 Luciano Coelho 2010-06-15  212  
0902b469bd2506 Luciano Coelho 2010-06-15  213  static void idletimer_tg_work(struct work_struct *work)
0902b469bd2506 Luciano Coelho 2010-06-15  214  {
0902b469bd2506 Luciano Coelho 2010-06-15  215  	struct idletimer_tg *timer = container_of(work, struct idletimer_tg,
0902b469bd2506 Luciano Coelho 2010-06-15  216  						  work);
0902b469bd2506 Luciano Coelho 2010-06-15  217  
0902b469bd2506 Luciano Coelho 2010-06-15  218  	sysfs_notify(idletimer_tg_kobj, NULL, timer->attr.attr.name);
f0c2df2b1228a4 JP Abgrall     2012-04-26  219  
f0c2df2b1228a4 JP Abgrall     2012-04-26  220  	if (timer->send_nl_msg)
f0c2df2b1228a4 JP Abgrall     2012-04-26  221  		notify_netlink_uevent(timer->attr.attr.name, timer);
0902b469bd2506 Luciano Coelho 2010-06-15  222  }
0902b469bd2506 Luciano Coelho 2010-06-15  223  
e99e88a9d2b067 Kees Cook      2017-10-16  224  static void idletimer_tg_expired(struct timer_list *t)
0902b469bd2506 Luciano Coelho 2010-06-15  225  {
e99e88a9d2b067 Kees Cook      2017-10-16  226  	struct idletimer_tg *timer = from_timer(timer, t, timer);
0902b469bd2506 Luciano Coelho 2010-06-15  227  
0902b469bd2506 Luciano Coelho 2010-06-15  228  	pr_debug("timer %s expired\n", timer->attr.attr.name);
f0c2df2b1228a4 JP Abgrall     2012-04-26  229  	spin_lock_bh(&timestamp_lock);
f0c2df2b1228a4 JP Abgrall     2012-04-26  230  	timer->active = false;
f0c2df2b1228a4 JP Abgrall     2012-04-26  231  	timer->work_pending = true;
f0c2df2b1228a4 JP Abgrall     2012-04-26  232  	schedule_work(&timer->work);
f0c2df2b1228a4 JP Abgrall     2012-04-26  233  	spin_unlock_bh(&timestamp_lock);
f0c2df2b1228a4 JP Abgrall     2012-04-26  234  }
0902b469bd2506 Luciano Coelho 2010-06-15  235  
f0c2df2b1228a4 JP Abgrall     2012-04-26  236  static int idletimer_resume(struct notifier_block *notifier,
f0c2df2b1228a4 JP Abgrall     2012-04-26  237  		unsigned long pm_event, void *unused)
f0c2df2b1228a4 JP Abgrall     2012-04-26  238  {
f0c2df2b1228a4 JP Abgrall     2012-04-26  239  	struct timespec ts;
f0c2df2b1228a4 JP Abgrall     2012-04-26  240  	unsigned long time_diff, now = jiffies;
f0c2df2b1228a4 JP Abgrall     2012-04-26  241  	struct idletimer_tg *timer = container_of(notifier,
f0c2df2b1228a4 JP Abgrall     2012-04-26  242  			struct idletimer_tg, pm_nb);
f0c2df2b1228a4 JP Abgrall     2012-04-26 @243  	if (!timer)
f0c2df2b1228a4 JP Abgrall     2012-04-26  244  		return NOTIFY_DONE;
f0c2df2b1228a4 JP Abgrall     2012-04-26  245  	switch (pm_event) {
f0c2df2b1228a4 JP Abgrall     2012-04-26  246  	case PM_SUSPEND_PREPARE:
f0c2df2b1228a4 JP Abgrall     2012-04-26  247  		get_monotonic_boottime(&timer->last_suspend_time);
f0c2df2b1228a4 JP Abgrall     2012-04-26  248  		break;
f0c2df2b1228a4 JP Abgrall     2012-04-26  249  	case PM_POST_SUSPEND:
f0c2df2b1228a4 JP Abgrall     2012-04-26  250  		spin_lock_bh(&timestamp_lock);
f0c2df2b1228a4 JP Abgrall     2012-04-26  251  		if (!timer->active) {
f0c2df2b1228a4 JP Abgrall     2012-04-26  252  			spin_unlock_bh(&timestamp_lock);
f0c2df2b1228a4 JP Abgrall     2012-04-26  253  			break;
f0c2df2b1228a4 JP Abgrall     2012-04-26  254  		}
f0c2df2b1228a4 JP Abgrall     2012-04-26  255  		/* since jiffies are not updated when suspended now represents
f0c2df2b1228a4 JP Abgrall     2012-04-26  256  		 * the time it would have suspended */
f0c2df2b1228a4 JP Abgrall     2012-04-26  257  		if (time_after(timer->timer.expires, now)) {
f0c2df2b1228a4 JP Abgrall     2012-04-26  258  			get_monotonic_boottime(&ts);
f0c2df2b1228a4 JP Abgrall     2012-04-26  259  			ts = timespec_sub(ts, timer->last_suspend_time);
f0c2df2b1228a4 JP Abgrall     2012-04-26  260  			time_diff = timespec_to_jiffies(&ts);
f0c2df2b1228a4 JP Abgrall     2012-04-26  261  			if (timer->timer.expires > (time_diff + now)) {
f0c2df2b1228a4 JP Abgrall     2012-04-26  262  				mod_timer_pending(&timer->timer,
f0c2df2b1228a4 JP Abgrall     2012-04-26  263  						(timer->timer.expires - time_diff));
f0c2df2b1228a4 JP Abgrall     2012-04-26  264  			} else {
f0c2df2b1228a4 JP Abgrall     2012-04-26  265  				del_timer(&timer->timer);
f0c2df2b1228a4 JP Abgrall     2012-04-26  266  				timer->timer.expires = 0;
f0c2df2b1228a4 JP Abgrall     2012-04-26  267  				timer->active = false;
f0c2df2b1228a4 JP Abgrall     2012-04-26  268  				timer->work_pending = true;
0902b469bd2506 Luciano Coelho 2010-06-15  269  				schedule_work(&timer->work);
0902b469bd2506 Luciano Coelho 2010-06-15  270  			}
f0c2df2b1228a4 JP Abgrall     2012-04-26  271  		}
f0c2df2b1228a4 JP Abgrall     2012-04-26  272  		spin_unlock_bh(&timestamp_lock);
f0c2df2b1228a4 JP Abgrall     2012-04-26  273  		break;
f0c2df2b1228a4 JP Abgrall     2012-04-26  274  	default:
f0c2df2b1228a4 JP Abgrall     2012-04-26  275  		break;
f0c2df2b1228a4 JP Abgrall     2012-04-26  276  	}
f0c2df2b1228a4 JP Abgrall     2012-04-26  277  	return NOTIFY_DONE;
f0c2df2b1228a4 JP Abgrall     2012-04-26  278  }
0902b469bd2506 Luciano Coelho 2010-06-15  279  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
