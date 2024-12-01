Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BF912DD8A
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Dec 2024 09:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733045780; cv=none; b=Jzafr0mR09II1LEECax6uKylIf0jKJ5ZVk31R36ZDw9k1pNa+XHBCfR0f9oXU9x+6/Svj2x1Vd0oEaB32NsViUGiNPL792XE5LJw9pDrvxe+9PZSoy65PBpx5e5mE/yzJsJxEXvIra/cfs4X4lTfx+6qgP+Z77tnjlgtEojX0+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733045780; c=relaxed/simple;
	bh=3rRNxmARaqC/pb7axImL05w56MmmpE5Ht4Ksl4ZQ3cI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o3AgW7SZZG+nHFCRzwWet1snppkaxRJChPUbYEvyaoKqdl86Xfwxjj7YuXrp/T3aBQvLVaKX0J3qLEo4reGgIns+JQ5375BZ7Ggj7S3CrTMra5DKlT+4tCebe8ffBFlsldWWSdtdzmJb6uC0DD501B8umaQlAQH/36n1Z0UpVdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wxme/K7L; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wxme/K7L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733045778; x=1764581778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3rRNxmARaqC/pb7axImL05w56MmmpE5Ht4Ksl4ZQ3cI=;
  b=Wxme/K7LVR6AE/kJILwl8YSv8klQHSqAycMil8WBFo/1+GIC4AjsrZsH
   wA75FNpzdDWvJ4Alh0rmhGpNaHak46UiOUbtZ8BcHIiNfhiEMrqpvc7kY
   xlHFOchzvv/k4xU8noUtWsNJFqFYFV/dy9pxNooI5+kJBU21i7fXlK6eD
   UcR3BqsvNVtojtKM4FbPSl1k1bY6lVOYQKrZ5OE++5lWpkp4t1q6Lm5hI
   cX3zf6BnIP3pN8KfCyawtACLj1rgoi5ciHa925fdqnxnmWzrNW9xD1y+A
   dqZrPyfVlkV7g5fCL3/7Hk/3slYHtVxDPJlwmx8IciLBrVit32Cqqrwru
   A==;
X-CSE-ConnectionGUID: MPsp0XI7S7WYcRn/2xq1Tw==
X-CSE-MsgGUID: xo5EgixDQ8ms2l0C1INOfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="55706249"
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="55706249"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 01:36:17 -0800
X-CSE-ConnectionGUID: hxYbk5y8Q5SGCNJPHnknUA==
X-CSE-MsgGUID: K4gJcQ44QJioRbTMp3KV0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="93303485"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 01 Dec 2024 01:36:16 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHgMs-0001Qm-1F;
	Sun, 01 Dec 2024 09:36:14 +0000
Date: Sun, 1 Dec 2024 17:29:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/notify/fanotify/fanotify_user.c:374:4-13: second lock on line 374
Message-ID: <202412011707.RghBKABb-lkp@intel.com>
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
TO: Jan Kara <jack@suse.cz>
CC: Amir Goldstein <amir73il@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bcc8eda6d34934d80b96adb8dc4ff5dfc632a53a
commit: 40873284d7106fc0f0f4d2deae74b38fb18342cc fanotify: Track permission event state
date:   6 years ago
:::::: branch date: 7 hours ago
:::::: commit date: 6 years ago
config: i386-randconfig-054-20241118 (https://download.01.org/0day-ci/archive/20241201/202412011707.RghBKABb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412011707.RghBKABb-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/notify/fanotify/fanotify_user.c:374:4-13: second lock on line 374
   fs/notify/fanotify/fanotify_user.c:374:4-13: second lock on line 379
   fs/notify/fanotify/fanotify_user.c:440:1-10: second lock on line 446
   fs/notify/fanotify/fanotify_user.c:440:1-10: second lock on line 463
   fs/notify/fanotify/fanotify_user.c:446:2-11: second lock on line 446
   fs/notify/fanotify/fanotify_user.c:446:2-11: second lock on line 463
   fs/notify/fanotify/fanotify_user.c:463:2-11: second lock on line 463

vim +374 fs/notify/fanotify/fanotify_user.c

a1014f10232239 Eric Paris      2009-12-17  316  
a1014f10232239 Eric Paris      2009-12-17  317  static ssize_t fanotify_read(struct file *file, char __user *buf,
a1014f10232239 Eric Paris      2009-12-17  318  			     size_t count, loff_t *pos)
a1014f10232239 Eric Paris      2009-12-17  319  {
a1014f10232239 Eric Paris      2009-12-17  320  	struct fsnotify_group *group;
a1014f10232239 Eric Paris      2009-12-17  321  	struct fsnotify_event *kevent;
a1014f10232239 Eric Paris      2009-12-17  322  	char __user *start;
a1014f10232239 Eric Paris      2009-12-17  323  	int ret;
536ebe9ca999f6 Peter Zijlstra  2014-12-16  324  	DEFINE_WAIT_FUNC(wait, woken_wake_function);
a1014f10232239 Eric Paris      2009-12-17  325  
a1014f10232239 Eric Paris      2009-12-17  326  	start = buf;
a1014f10232239 Eric Paris      2009-12-17  327  	group = file->private_data;
a1014f10232239 Eric Paris      2009-12-17  328  
a1014f10232239 Eric Paris      2009-12-17  329  	pr_debug("%s: group=%p\n", __func__, group);
a1014f10232239 Eric Paris      2009-12-17  330  
536ebe9ca999f6 Peter Zijlstra  2014-12-16  331  	add_wait_queue(&group->notification_waitq, &wait);
a1014f10232239 Eric Paris      2009-12-17  332  	while (1) {
a1014f10232239 Eric Paris      2009-12-17  333  		kevent = get_one_event(group, count);
d8aaab4f619acf Jan Kara        2014-04-03  334  		if (IS_ERR(kevent)) {
a1014f10232239 Eric Paris      2009-12-17  335  			ret = PTR_ERR(kevent);
a1014f10232239 Eric Paris      2009-12-17  336  			break;
a1014f10232239 Eric Paris      2009-12-17  337  		}
a1014f10232239 Eric Paris      2009-12-17  338  
d8aaab4f619acf Jan Kara        2014-04-03  339  		if (!kevent) {
a1014f10232239 Eric Paris      2009-12-17  340  			ret = -EAGAIN;
a1014f10232239 Eric Paris      2009-12-17  341  			if (file->f_flags & O_NONBLOCK)
a1014f10232239 Eric Paris      2009-12-17  342  				break;
d8aaab4f619acf Jan Kara        2014-04-03  343  
1a5cea7215f7c6 Lino Sanfilippo 2010-10-29  344  			ret = -ERESTARTSYS;
a1014f10232239 Eric Paris      2009-12-17  345  			if (signal_pending(current))
a1014f10232239 Eric Paris      2009-12-17  346  				break;
a1014f10232239 Eric Paris      2009-12-17  347  
a1014f10232239 Eric Paris      2009-12-17  348  			if (start != buf)
a1014f10232239 Eric Paris      2009-12-17  349  				break;
536ebe9ca999f6 Peter Zijlstra  2014-12-16  350  
536ebe9ca999f6 Peter Zijlstra  2014-12-16  351  			wait_woken(&wait, TASK_INTERRUPTIBLE, MAX_SCHEDULE_TIMEOUT);
d8aaab4f619acf Jan Kara        2014-04-03  352  			continue;
d8aaab4f619acf Jan Kara        2014-04-03  353  		}
d8aaab4f619acf Jan Kara        2014-04-03  354  
5b03a472b4e39c Kees Cook       2018-12-04  355  		ret = copy_event_to_user(group, kevent, buf, count);
4ff33aafd32e08 Amir Goldstein  2017-04-25  356  		if (unlikely(ret == -EOPENSTALE)) {
4ff33aafd32e08 Amir Goldstein  2017-04-25  357  			/*
4ff33aafd32e08 Amir Goldstein  2017-04-25  358  			 * We cannot report events with stale fd so drop it.
4ff33aafd32e08 Amir Goldstein  2017-04-25  359  			 * Setting ret to 0 will continue the event loop and
4ff33aafd32e08 Amir Goldstein  2017-04-25  360  			 * do the right thing if there are no more events to
4ff33aafd32e08 Amir Goldstein  2017-04-25  361  			 * read (i.e. return bytes read, -EAGAIN or wait).
4ff33aafd32e08 Amir Goldstein  2017-04-25  362  			 */
4ff33aafd32e08 Amir Goldstein  2017-04-25  363  			ret = 0;
4ff33aafd32e08 Amir Goldstein  2017-04-25  364  		}
4ff33aafd32e08 Amir Goldstein  2017-04-25  365  
d8aaab4f619acf Jan Kara        2014-04-03  366  		/*
d8aaab4f619acf Jan Kara        2014-04-03  367  		 * Permission events get queued to wait for response.  Other
d8aaab4f619acf Jan Kara        2014-04-03  368  		 * events can be destroyed now.
d8aaab4f619acf Jan Kara        2014-04-03  369  		 */
a0a92d261f2922 Amir Goldstein  2019-01-10  370  		if (!fanotify_is_perm_event(FANOTIFY_E(kevent)->mask)) {
d8aaab4f619acf Jan Kara        2014-04-03  371  			fsnotify_destroy_event(group, kevent);
d507816b58bebc Jan Kara        2014-04-03  372  		} else {
4ff33aafd32e08 Amir Goldstein  2017-04-25  373  			if (ret <= 0) {
40873284d7106f Jan Kara        2019-01-08 @374  				spin_lock(&group->notification_lock);
40873284d7106f Jan Kara        2019-01-08  375  				finish_permission_event(group,
40873284d7106f Jan Kara        2019-01-08  376  					FANOTIFY_PE(kevent), FAN_DENY);
d507816b58bebc Jan Kara        2014-04-03  377  				wake_up(&group->fanotify_data.access_waitq);
4ff33aafd32e08 Amir Goldstein  2017-04-25  378  			} else {
073f65522aeb23 Jan Kara        2016-10-07  379  				spin_lock(&group->notification_lock);
d507816b58bebc Jan Kara        2014-04-03  380  				list_add_tail(&kevent->list,
d507816b58bebc Jan Kara        2014-04-03  381  					&group->fanotify_data.access_list);
073f65522aeb23 Jan Kara        2016-10-07  382  				spin_unlock(&group->notification_lock);
4ff33aafd32e08 Amir Goldstein  2017-04-25  383  			}
d507816b58bebc Jan Kara        2014-04-03  384  		}
4ff33aafd32e08 Amir Goldstein  2017-04-25  385  		if (ret < 0)
4ff33aafd32e08 Amir Goldstein  2017-04-25  386  			break;
d8aaab4f619acf Jan Kara        2014-04-03  387  		buf += ret;
d8aaab4f619acf Jan Kara        2014-04-03  388  		count -= ret;
a1014f10232239 Eric Paris      2009-12-17  389  	}
536ebe9ca999f6 Peter Zijlstra  2014-12-16  390  	remove_wait_queue(&group->notification_waitq, &wait);
a1014f10232239 Eric Paris      2009-12-17  391  
a1014f10232239 Eric Paris      2009-12-17  392  	if (start != buf && ret != -EFAULT)
a1014f10232239 Eric Paris      2009-12-17  393  		ret = buf - start;
a1014f10232239 Eric Paris      2009-12-17  394  	return ret;
a1014f10232239 Eric Paris      2009-12-17  395  }
a1014f10232239 Eric Paris      2009-12-17  396  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
