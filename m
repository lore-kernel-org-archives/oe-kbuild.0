Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B7D23DB
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Mar 2023 11:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678015947; x=1709551947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kXm3J7bSBPQjZG5RCQsMPF/2CZlCcfu04DfZazCv55w=;
  b=eZBeS9+rMPuJdOShWEqLeJPXLbicRfV8mFErVJYGZUQOboVDlwhV57SL
   ph/vHmRWlY0NbZ7qyeFi44RNImaWDCpsMNcPaVWbrTv9XGxva3Ugw0dzY
   RP3rM/sAJXuxTO3zFiO2geDJul14t+4Y0c6cmfMC5ECfw6/hF9dcAOf+0
   Ze8+jMoFKARWHkVPinlwr4TWzfT35g90/+GYI+Ds6a3EqWRkbzUrJNKfr
   2JIMqxc6D7F1wyZBlJNnuR1CKG7B+0i+Mit5yQrWbkwr2G0RpJo/yFgBd
   X4o60KVhkW1xXU3sE5hBD3Ao4Ub+WQlIfmXpsSluWhvUCoUGs+sfzYSj7
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="362976709"
X-IronPort-AV: E=Sophos;i="5.98,235,1673942400"; 
   d="scan'208";a="362976709"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2023 03:32:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="799714678"
X-IronPort-AV: E=Sophos;i="5.98,235,1673942400"; 
   d="scan'208";a="799714678"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 05 Mar 2023 03:32:24 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYmbH-0002j4-36;
	Sun, 05 Mar 2023 11:32:23 +0000
Date: Sun, 5 Mar 2023 19:31:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [jfern:staging 8/8] kernel/rcu/update.c:248:2-8: preceding lock on
 line 244
Message-ID: <202303051957.c7kQywF0-lkp@intel.com>
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
TO: "Joel Fernandes (Google)" <joel@joelfernandes.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git staging
head:   e6d2024fa329f41ffba24f06090ea57e3b0041ed
commit: e6d2024fa329f41ffba24f06090ea57e3b0041ed [8/8] rcu: Add a minimum time for marking boot as completed
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: csky-randconfig-c034-20230305 (https://download.01.org/0day-ci/archive/20230305/202303051957.c7kQywF0-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202303051957.c7kQywF0-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/rcu/update.c:248:2-8: preceding lock on line 244

vim +248 kernel/rcu/update.c

e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  241) 
ee42571f4381f1 Paul E. McKenney        2015-02-19  242  void rcu_end_inkernel_boot(void)
ee42571f4381f1 Paul E. McKenney        2015-02-19  243  {
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25 @244) 	mutex_lock(&rcu_boot_end_lock);
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  245) 	rcu_boot_end_called = true;
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  246) 
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  247) 	if (rcu_boot_ended)
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25 @248) 		return;
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  249) 
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  250) 	if (rcu_boot_end_delay) {
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  251) 		u64 boot_ms = div_u64(ktime_get_boot_fast_ns(), 1000000UL);
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  252) 
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  253) 		if (boot_ms < rcu_boot_end_delay) {
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  254) 			schedule_delayed_work(&rcu_boot_end_work,
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  255) 					rcu_boot_end_delay - boot_ms);
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  256) 			mutex_unlock(&rcu_boot_end_lock);
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  257) 			return;
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  258) 		}
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  259) 	}
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  260) 
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  261) 	cancel_delayed_work(&rcu_boot_end_work);
ee42571f4381f1 Paul E. McKenney        2015-02-19  262  	rcu_unexpedite_gp();
3e42ec1aa716f1 Paul E. McKenney        2015-11-25  263  	if (rcu_normal_after_boot)
3e42ec1aa716f1 Paul E. McKenney        2015-11-25  264  		WRITE_ONCE(rcu_normal, 1);
e40bb921119814 Jules Irenge            2020-06-01  265  	rcu_boot_ended = true;
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  266) 	mutex_unlock(&rcu_boot_end_lock);
ee42571f4381f1 Paul E. McKenney        2015-02-19  267  }
0d39482c3db13a Paul E. McKenney        2015-02-18  268  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
