Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF86A1B14EF
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Sep 2024 20:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726086018; cv=none; b=XRoBWkd6rRsqThyuyM4VVTMFIL2hmXuFxE6VquhPW27rT7OgGgUPbrZbsNmzam3fOAO4nNl10Wo4/GjXi9TiDBV7O8i6wdeh3ljOYjhOAW/PvCrKODITumZdmvsmOJCn91yoGHfQ2s6/gsqEpU6pMXF+qqSDrX1hNeCxXAWZLLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726086018; c=relaxed/simple;
	bh=kOJ7jf6fRaqJo8k9DkDxYJiV699nnENiAsaapUN9Res=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EQm0niRcKPNfvheYvujhvfxv4BuTzvlQFctcP81Xv+XwUDjEMV8kooAiaLZNVkM5ejq57AeBk+dgRaGd/BpSt1DEfgb21ZQyddhXPDc/YLbRKEVE9fqHHLyTpyyAw/bkN0Ja95o+qFl0z6uoFujwTObyEABzDgf/PmFFC299llE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DnSxTBq5; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DnSxTBq5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726086017; x=1757622017;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kOJ7jf6fRaqJo8k9DkDxYJiV699nnENiAsaapUN9Res=;
  b=DnSxTBq5rj1/QOl5MlgtSfVz0h+pX/s2dHfip1RIaPqTICJeO/dKM0tQ
   nBvSwyN8+X2Z3p0XdIZ6PUahLe1NJ0DE+fwDJ9BVzRv1Q1iOP/AHFe2SJ
   Uw6jrVnYFRqGyQV7GeKYpEjnMcdrYx+OXClGDKWFLcc9bm3lAKkaKh/aq
   mGSIzXpq02JL7WG5qxLNN0nmVvUWJuSrrajepZ41lOSgxLm1TQ6uc0TDv
   RzO5ROG3EAGjGUHbDVB87l0avt3gIzYdcrF7yRC8NWxpTr0Oq6CAa9fM4
   SM0o5QiJu00OEE+zcEqykH5DldFrD0ee93MsWcoGLUmc1Snara7hHtSJ/
   w==;
X-CSE-ConnectionGUID: 70eWurldSI2N6XObXPESZQ==
X-CSE-MsgGUID: ZkCzca6PSGWB/4H45+I+9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="25101738"
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; 
   d="scan'208";a="25101738"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 13:20:16 -0700
X-CSE-ConnectionGUID: NJdubpUeT/GT+HOw9ZQE9Q==
X-CSE-MsgGUID: JwD7XgePQW2sqKdt0Nb63g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; 
   d="scan'208";a="72254046"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Sep 2024 13:20:15 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soToy-00046F-1g;
	Wed, 11 Sep 2024 20:20:12 +0000
Date: Thu, 12 Sep 2024 04:19:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 4938/11210]
 drivers/thermal/testing/zone.c:271:23-30: ERROR: invalid reference to the
 index variable of the iterator on line 256
Message-ID: <202409120427.1nPL7WfO-lkp@intel.com>
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
TO: "Rafael J. Wysocki" <rjw@rjwysocki.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   32ffa5373540a8d1c06619f52d019c6cdc948bb4
commit: f6a034f2df426e279f1ecad53626bab80c04796a [4938/11210] thermal: Introduce a debugfs-based testing facility
:::::: branch date: 9 hours ago
:::::: commit date: 3 weeks ago
config: i386-randconfig-051-20240912 (https://download.01.org/0day-ci/archive/20240912/202409120427.1nPL7WfO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202409120427.1nPL7WfO-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/thermal/testing/zone.c:271:23-30: ERROR: invalid reference to the index variable of the iterator on line 256
   drivers/thermal/testing/zone.c:303:8-15: ERROR: invalid reference to the index variable of the iterator on line 292

vim +271 drivers/thermal/testing/zone.c

f6a034f2df426e Rafael J. Wysocki 2024-08-22  237  
f6a034f2df426e Rafael J. Wysocki 2024-08-22  238  int tt_del_tz(const char *arg)
f6a034f2df426e Rafael J. Wysocki 2024-08-22  239  {
f6a034f2df426e Rafael J. Wysocki 2024-08-22  240  	struct tt_work *tt_work __free(kfree);
f6a034f2df426e Rafael J. Wysocki 2024-08-22  241  	struct tt_thermal_zone *tt_zone, *aux;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  242  	int ret;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  243  	int id;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  244  
f6a034f2df426e Rafael J. Wysocki 2024-08-22  245  	ret = sscanf(arg, "%d", &id);
f6a034f2df426e Rafael J. Wysocki 2024-08-22  246  	if (ret != 1)
f6a034f2df426e Rafael J. Wysocki 2024-08-22  247  		return -EINVAL;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  248  
f6a034f2df426e Rafael J. Wysocki 2024-08-22  249  	tt_work = kzalloc(sizeof(*tt_work), GFP_KERNEL);
f6a034f2df426e Rafael J. Wysocki 2024-08-22  250  	if (!tt_work)
f6a034f2df426e Rafael J. Wysocki 2024-08-22  251  		return -ENOMEM;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  252  
f6a034f2df426e Rafael J. Wysocki 2024-08-22  253  	guard(mutex)(&tt_thermal_zones_lock);
f6a034f2df426e Rafael J. Wysocki 2024-08-22  254  
f6a034f2df426e Rafael J. Wysocki 2024-08-22  255  	ret = -EINVAL;
f6a034f2df426e Rafael J. Wysocki 2024-08-22 @256  	list_for_each_entry_safe(tt_zone, aux, &tt_thermal_zones, list_node) {
f6a034f2df426e Rafael J. Wysocki 2024-08-22  257  		if (tt_zone->id == id) {
f6a034f2df426e Rafael J. Wysocki 2024-08-22  258  			if (tt_zone->refcount) {
f6a034f2df426e Rafael J. Wysocki 2024-08-22  259  				ret = -EBUSY;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  260  			} else {
f6a034f2df426e Rafael J. Wysocki 2024-08-22  261  				list_del(&tt_zone->list_node);
f6a034f2df426e Rafael J. Wysocki 2024-08-22  262  				ret = 0;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  263  			}
f6a034f2df426e Rafael J. Wysocki 2024-08-22  264  			break;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  265  		}
f6a034f2df426e Rafael J. Wysocki 2024-08-22  266  	}
f6a034f2df426e Rafael J. Wysocki 2024-08-22  267  
f6a034f2df426e Rafael J. Wysocki 2024-08-22  268  	if (ret)
f6a034f2df426e Rafael J. Wysocki 2024-08-22  269  		return ret;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  270  
f6a034f2df426e Rafael J. Wysocki 2024-08-22 @271  	tt_zone_unregister_tz(tt_zone);
f6a034f2df426e Rafael J. Wysocki 2024-08-22  272  
f6a034f2df426e Rafael J. Wysocki 2024-08-22  273  	INIT_WORK(&tt_work->work, tt_del_tz_work_fn);
f6a034f2df426e Rafael J. Wysocki 2024-08-22  274  	tt_work->tt_zone = tt_zone;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  275  	schedule_work(&(no_free_ptr(tt_work)->work));
f6a034f2df426e Rafael J. Wysocki 2024-08-22  276  
f6a034f2df426e Rafael J. Wysocki 2024-08-22  277  	return 0;
f6a034f2df426e Rafael J. Wysocki 2024-08-22  278  }
f6a034f2df426e Rafael J. Wysocki 2024-08-22  279  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
