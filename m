Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2567B2E3EE
	for <oe-kbuild@lists.linux.dev>; Fri, 22 Nov 2024 16:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732291310; cv=none; b=SsvnwJ2GGKrOBBCnqsI8raxewsovNGGtzpRxQlCoysKqfvGzD9kUIT4yZDm/yiRFwb84Nl4TTCA+YmwQ8Xw/ORWOXt+3gEjr59N9R5HbLEgFS4t0yibLL/r6l/Gt+u66LrYiCKU7IjrWzR4sfZPVL2e7MS+Bk2Xau66jZvMKy6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732291310; c=relaxed/simple;
	bh=IJeKqgzV+lgZeFw70cx5YhWXtJuBpd+Cinzt2ps65qo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NqcbFdxveA1+aJfz1Xjd5oSxYKpO1EhqTMHSq5nEUPIpuSeJOTjtBbR+WMRFhIqQQg8vXLSRgP7cjiZpRdHM1zy/DnTFmdxn92FLHc2q2DTDCMaqTLsFDiQlmS862BN5dU/3m3Xuc2dluc5V4tA7CUTzf/GnxE12z9tZlNBzY0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mJSCPv7U; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mJSCPv7U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732291308; x=1763827308;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IJeKqgzV+lgZeFw70cx5YhWXtJuBpd+Cinzt2ps65qo=;
  b=mJSCPv7Um4h1xrbgjyxS3uXS0VD8qw1K8BpGscw6oDEl5xKuX2f/TwKF
   u3ZKRlUFWuCPvdWqFGt5xV/uF6n7le78OaW7ZrQ+gj+KnHSLeyUjsLUKq
   W1QmdsOJh1a1Ui9i+LPlYloXHXpqfhfDhGer4nIeNe9CxLdv0SEQuApj0
   DK259yrkmWiCGpw+q5M5Ny7MIM35sGBXguDw/uuNdTY+K4cKU2nkPKQAm
   v8TcleBI3qku7VCdJTOQ1wjkRkO28USpPe1IngnTHczuIswOSwSoAXGjt
   C9tKwW9VyNY9t7AacRP+jFUWEGlO3B6I6BqQaTuLwhc5mfR5itjL9UEku
   g==;
X-CSE-ConnectionGUID: Gu+jhH1iRkO8qtmuMEENjA==
X-CSE-MsgGUID: 9ux4GbXlS5ea16FMLg870w==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="43828989"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="43828989"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 08:01:47 -0800
X-CSE-ConnectionGUID: SSPSDDbhRFmNDH7ZMLXcVQ==
X-CSE-MsgGUID: nugRGPojRX6gQVQjkzNiBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="113888131"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Nov 2024 08:01:46 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEW6K-00042R-0E;
	Fri, 22 Nov 2024 16:01:44 +0000
Date: Sat, 23 Nov 2024 00:01:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android16-6.12 38/6108]
 net/netfilter/xt_IDLETIMER.c:206 idletimer_tg_show() error: we previously
 assumed 'timer' could be null (see line 197)
Message-ID: <202411222344.akGJ6WjR-lkp@intel.com>
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
head:   84abfa8faedf827ec60f5b6a2d913bf80d14fab6
commit: f0c2df2b1228a4407c72e92e07d9f3fe695fa558 [38/6108] ANDROID: netfilter: xt_IDLETIMER: Add new netlink msg type
:::::: branch date: 3 hours ago
:::::: commit date: 6 years ago
config: i386-randconfig-141-20241122 (https://download.01.org/0day-ci/archive/20241122/202411222344.akGJ6WjR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411222344.akGJ6WjR-lkp@intel.com/

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
