Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0A51DDDB
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Nov 2023 13:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HIvNKEzr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699536411; x=1731072411;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3mIdRCgEBpZ+y/7jZEqb2bfLI8WO3HkclRHLGAGdffQ=;
  b=HIvNKEzr3Qp/T2G559udhJb1OLjUtd0BLbtuNae/IdfXNdb/SeD5mnYw
   xfPlJ5BvZtB/4XBFsGEHaOVAo+wJNDorBlZE4b7vv60tog82LGn6/e0ch
   g0BbeXuwQoz1S0xotWMCSU0Tg94QG0rK8su6/W3XB6VGEsxzsKXblhEPP
   kbwM0bhKdbnZyZmmESIxBWW4UNAGr787NIQwEadzL9NyD2LDi77SWOluL
   Jt6BWmeLYegPX9ye8pG67Vslbfkl3RUh/dvmGDWj8s5KKij0LvMhP4smx
   6HgNnUtNoBAC3mONBLbTI73BrMIFKgnDzABRgRhix4tIgKqSLpZfqALEe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="8633366"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="8633366"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 05:26:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="1094859181"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="1094859181"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 09 Nov 2023 05:26:49 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r153X-0008k4-1E;
	Thu, 09 Nov 2023 13:26:47 +0000
Date: Thu, 9 Nov 2023 21:25:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tglx-devel:queue/core 1/1] lib/debugobjects.c:730
 debug_object_activate() error: 'obj' dereferencing possible ERR_PTR()
Message-ID: <202311092147.YQefKK78-lkp@intel.com>
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
TO: Andrzej Hajda <andrzej.hajda@intel.com>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git queue/core
head:   265c43c4e983edc38cb9b0b75fc82eda0808512d
commit: 265c43c4e983edc38cb9b0b75fc82eda0808512d [1/1] debugobjects: Stop accessing objects after releasing hash bucket lock
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20231107 (https://download.01.org/0day-ci/archive/20231109/202311092147.YQefKK78-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231109/202311092147.YQefKK78-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311092147.YQefKK78-lkp@intel.com/

smatch warnings:
lib/debugobjects.c:730 debug_object_activate() error: 'obj' dereferencing possible ERR_PTR()

vim +/obj +730 lib/debugobjects.c

3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  687  
3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  688  /**
3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  689   * debug_object_activate - debug checks when an object is activated
3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  690   * @addr:	address of the object
3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  691   * @descr:	pointer to an object specific debug description structure
b778ae25366e6f Paul E. McKenney 2013-04-23  692   * Returns 0 for success, -EINVAL for check failed.
3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  693   */
aedcade6f4fa9a Stephen Boyd     2020-08-14  694  int debug_object_activate(void *addr, const struct debug_obj_descr *descr)
3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  695  {
63a759694eed61 Thomas Gleixner  2023-04-12  696  	struct debug_obj o = { .object = addr, .state = ODEBUG_STATE_NOTAVAILABLE, .descr = descr };
3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  697  	struct debug_bucket *db;
3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  698  	struct debug_obj *obj;
3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  699  	unsigned long flags;
3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  700  
3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  701  	if (!debug_objects_enabled)
b778ae25366e6f Paul E. McKenney 2013-04-23  702  		return 0;
3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  703  
0af462f19e635a Thomas Gleixner  2023-05-01  704  	debug_objects_fill_pool();
0af462f19e635a Thomas Gleixner  2023-05-01  705  
3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  706  	db = get_bucket((unsigned long) addr);
3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  707  
aef9cb05247df3 Thomas Gleixner  2009-11-17  708  	raw_spin_lock_irqsave(&db->lock, flags);
3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  709  
63a759694eed61 Thomas Gleixner  2023-04-12  710  	obj = lookup_object_or_alloc(addr, db, descr, false, true);
265c43c4e983ed Andrzej Hajda    2023-10-25  711  	if (unlikely(!obj)) {
265c43c4e983ed Andrzej Hajda    2023-10-25  712  		raw_spin_unlock_irqrestore(&db->lock, flags);
265c43c4e983ed Andrzej Hajda    2023-10-25  713  		debug_objects_oom();
265c43c4e983ed Andrzej Hajda    2023-10-25  714  		return 0;
265c43c4e983ed Andrzej Hajda    2023-10-25  715  	} else if (likely(!IS_ERR(obj))) {
3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  716  		switch (obj->state) {
3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  717  		case ODEBUG_STATE_ACTIVE:
3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  718  		case ODEBUG_STATE_DESTROYED:
3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  719  			break;
265c43c4e983ed Andrzej Hajda    2023-10-25  720  		case ODEBUG_STATE_INIT:
265c43c4e983ed Andrzej Hajda    2023-10-25  721  		case ODEBUG_STATE_INACTIVE:
265c43c4e983ed Andrzej Hajda    2023-10-25  722  			obj->state = ODEBUG_STATE_ACTIVE;
265c43c4e983ed Andrzej Hajda    2023-10-25  723  			fallthrough;
3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  724  		default:
aef9cb05247df3 Thomas Gleixner  2009-11-17  725  			raw_spin_unlock_irqrestore(&db->lock, flags);
265c43c4e983ed Andrzej Hajda    2023-10-25  726  			return 0;
265c43c4e983ed Andrzej Hajda    2023-10-25  727  		}
3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  728  	}
3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  729  
265c43c4e983ed Andrzej Hajda    2023-10-25 @730  	o = *obj;
aef9cb05247df3 Thomas Gleixner  2009-11-17  731  	raw_spin_unlock_irqrestore(&db->lock, flags);
265c43c4e983ed Andrzej Hajda    2023-10-25  732  	debug_print_object(&o, "activate");
d5f34153e52690 Waiman Long      2019-05-20  733  
265c43c4e983ed Andrzej Hajda    2023-10-25  734  	switch (o.state) {
265c43c4e983ed Andrzej Hajda    2023-10-25  735  	case ODEBUG_STATE_ACTIVE:
265c43c4e983ed Andrzej Hajda    2023-10-25  736  	case ODEBUG_STATE_NOTAVAILABLE:
265c43c4e983ed Andrzej Hajda    2023-10-25  737  		if (debug_object_fixup(descr->fixup_activate, addr, o.state))
63a759694eed61 Thomas Gleixner  2023-04-12  738  			return 0;
265c43c4e983ed Andrzej Hajda    2023-10-25  739  		fallthrough;
265c43c4e983ed Andrzej Hajda    2023-10-25  740  	default:
265c43c4e983ed Andrzej Hajda    2023-10-25  741  		return -EINVAL;
63a759694eed61 Thomas Gleixner  2023-04-12  742  	}
b778ae25366e6f Paul E. McKenney 2013-04-23  743  }
f8ff04e2be0815 Chris Wilson     2016-11-30  744  EXPORT_SYMBOL_GPL(debug_object_activate);
3ac7fe5a4aab40 Thomas Gleixner  2008-04-30  745  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
