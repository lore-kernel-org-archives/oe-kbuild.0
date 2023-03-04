Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D531D2F21
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Mar 2023 22:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677970570; x=1709506570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xRsao0dnSPM0jbHXk2pJtXmJkZXkXuIDrJuwF3dXdDY=;
  b=QBgUYFvAVKwNOxtccDOhC3+7+NF+s948aaDMDvWPtSWFt/VOjav0H5KE
   hwO1ziAfxHJOoY1ecUXO8xHU3j+CfbvEYIurbOLwRhRxs7NcvvFRimrvM
   C6cF0tAfthyrq9SmJlX+51MnMwlL2TKLN/gsr5Amwygu478oEIEy6OPdd
   oIz3pRqreqBxH1o4BUNnfbF28tgen+7f0bJPorfEDETkb5/1pSt0kKE6n
   PkYzlSdXMtScDMwIKTtGpoVoeOHZniaGRQsyanYRw2Tg+tvCeIJCN+63b
   7TmAEBnGm5qEL6lNKlgeyYcr2XJ9toF/wy+3rTJ+e5GW/C3l1C5o9lA+k
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="337632633"
X-IronPort-AV: E=Sophos;i="5.98,234,1673942400"; 
   d="scan'208";a="337632633"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 14:56:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="818890910"
X-IronPort-AV: E=Sophos;i="5.98,234,1673942400"; 
   d="scan'208";a="818890910"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 04 Mar 2023 14:56:08 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYanQ-0002PM-0k;
	Sat, 04 Mar 2023 22:56:08 +0000
Date: Sun, 5 Mar 2023 06:56:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jfern:staging 8/8] kernel/rcu/update.c:266 rcu_end_inkernel_boot()
 warn: inconsistent returns '&rcu_boot_end_lock'.
Message-ID: <202303050636.Qhxwao0u-lkp@intel.com>
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
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230305/202303050636.Qhxwao0u-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303050636.Qhxwao0u-lkp@intel.com/

smatch warnings:
kernel/rcu/update.c:266 rcu_end_inkernel_boot() warn: inconsistent returns '&rcu_boot_end_lock'.

vim +266 kernel/rcu/update.c

e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  241) 
ee42571f4381f1 Paul E. McKenney        2015-02-19  242  void rcu_end_inkernel_boot(void)
ee42571f4381f1 Paul E. McKenney        2015-02-19  243  {
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  244) 	mutex_lock(&rcu_boot_end_lock);
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  245) 	rcu_boot_end_called = true;
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  246) 
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  247) 	if (rcu_boot_ended)
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  248) 		return;
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
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25 @266) 	mutex_unlock(&rcu_boot_end_lock);
ee42571f4381f1 Paul E. McKenney        2015-02-19  267  }
0d39482c3db13a Paul E. McKenney        2015-02-18  268  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
