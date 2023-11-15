Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE61630
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Nov 2023 01:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HSeYbkpf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700012573; x=1731548573;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r9vBfYqXw/Rj9EAd2t61EQJu/4sZDG9Gw50rNmp2sK0=;
  b=HSeYbkpf/YnjmijejPVkj4HsyxqQAbkinWY0Fe7kGiWrlF/LH3FtFKBt
   wFVkvBW/zrQKsTNdHCjGCAz2OZaZJ/bp+ptkjSkpizJQAd4QVLTSQT6+f
   1j/T5U9yJz2hQ/jqbJaQdS+wiTfDo7LwWmwGQmttkDl7vtQbaaKjwGs6F
   MlU+5X0C8zNxz91O5rDp4VQghRNaHiVM2L6rSKi712xRb8hpfEkaOIWlA
   Bj++qQlKP/2BmH0bj6et20ip+3LyPjwLK228sd9Kzqgi2Hcd2jrnz/KH9
   oShhdVl1+bSo9TtkJabB2LqJoUsFVTcGCpsb7yY1sruFX09i95WbLbpKZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="421887544"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; 
   d="scan'208";a="421887544"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 17:42:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; 
   d="scan'208";a="13006208"
Received: from lkp-server02.sh.intel.com (HELO 83346ef18697) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 14 Nov 2023 17:42:51 -0800
Received: from kbuild by 83346ef18697 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r34vY-0000tL-27;
	Wed, 15 Nov 2023 01:42:48 +0000
Date: Wed, 15 Nov 2023 09:41:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/uapi/asm-generic/signal-defs.h:19:29: sparse: sparse:
 multiple address spaces given
Message-ID: <202311150911.TjjQRuZU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: include/uapi/asm-generic/signal-defs.h:19:29: sparse: sparse: multiple address spaces given"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
CC: Christian Brauner <christian.brauner@ubuntu.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9bacdd8996c77c42ca004440be610692275ff9d0
commit: 913292c97d750fe4188b4f5aa770e5e0ca1e5a91 sched.h: Annotate sighand_struct with __rcu
date:   3 years, 10 months ago
:::::: branch date: 32 hours ago
:::::: commit date: 3 years, 10 months ago
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20231115/202311150911.TjjQRuZU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231115/202311150911.TjjQRuZU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311150911.TjjQRuZU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/signal.c: note: in included file (through arch/x86/include/uapi/asm/signal.h, arch/x86/include/asm/signal.h, include/uapi/linux/signal.h, ...):
>> include/uapi/asm-generic/signal-defs.h:19:29: sparse: sparse: multiple address spaces given
   kernel/signal.c:196:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   kernel/signal.c:196:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:196:31: sparse:     got struct spinlock [noderef] <asn:4> *
   kernel/signal.c:199:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   kernel/signal.c:199:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:199:33: sparse:     got struct spinlock [noderef] <asn:4> *
   kernel/signal.c:474:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   kernel/signal.c:474:9: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:474:9: sparse:     got struct spinlock [noderef] <asn:4> *
   kernel/signal.c:478:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   kernel/signal.c:478:34: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:478:34: sparse:     got struct spinlock [noderef] <asn:4> *
   kernel/signal.c:511:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   kernel/signal.c:511:9: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:511:9: sparse:     got struct spinlock [noderef] <asn:4> *
   kernel/signal.c:514:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   kernel/signal.c:514:36: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:514:36: sparse:     got struct spinlock [noderef] <asn:4> *
   kernel/signal.c:536:53: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct k_sigaction *ka @@     got struct k_sigaction [noderef] <asn:4> * @@
   kernel/signal.c:536:53: sparse:     expected struct k_sigaction *ka
   kernel/signal.c:536:53: sparse:     got struct k_sigaction [noderef] <asn:4> *
>> include/uapi/asm-generic/signal-defs.h:19:29: sparse: sparse: multiple address spaces given
   kernel/signal.c:689:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   kernel/signal.c:689:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:689:33: sparse:     got struct spinlock [noderef] <asn:4> *
   kernel/signal.c:691:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   kernel/signal.c:691:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:691:31: sparse:     got struct spinlock [noderef] <asn:4> *
   kernel/signal.c:1311:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   kernel/signal.c:1311:9: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:1311:9: sparse:     got struct spinlock [noderef] <asn:4> *
   kernel/signal.c:1312:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct k_sigaction *action @@     got struct k_sigaction [noderef] <asn:4> * @@
   kernel/signal.c:1312:16: sparse:     expected struct k_sigaction *action
   kernel/signal.c:1312:16: sparse:     got struct k_sigaction [noderef] <asn:4> *
   kernel/signal.c:1329:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   kernel/signal.c:1329:34: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:1329:34: sparse:     got struct spinlock [noderef] <asn:4> *
   kernel/signal.c:1644:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   kernel/signal.c:1644:17: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:1644:17: sparse:     got struct spinlock [noderef] <asn:4> *
   kernel/signal.c:1646:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   kernel/signal.c:1646:42: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:1646:42: sparse:     got struct spinlock [noderef] <asn:4> *
   kernel/signal.c:1819:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   kernel/signal.c:1819:36: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:1819:36: sparse:     got struct spinlock [noderef] <asn:4> *
   kernel/signal.c:1948:65: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] <asn:4> *parent @@
   kernel/signal.c:1948:65: sparse:     expected struct task_struct *tsk
   kernel/signal.c:1948:65: sparse:     got struct task_struct [noderef] <asn:4> *parent
   kernel/signal.c:1949:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile *p @@     got struct cred const [noderef] <asn:4> *[noderef] <asn:4> * @@
   kernel/signal.c:1949:40: sparse:     expected void const volatile *p
   kernel/signal.c:1949:40: sparse:     got struct cred const [noderef] <asn:4> *[noderef] <asn:4> *
   kernel/signal.c:1949:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile *p @@     got struct cred const [noderef] <asn:4> *[noderef] <asn:4> * @@
   kernel/signal.c:1949:40: sparse:     expected void const volatile *p
   kernel/signal.c:1949:40: sparse:     got struct cred const [noderef] <asn:4> *[noderef] <asn:4> *
   kernel/signal.c:1967:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sighand_struct *psig @@     got struct sighand_struct [noderef] <asn:4> *[noderef] <asn:4> sighand @@
   kernel/signal.c:1967:14: sparse:     expected struct sighand_struct *psig
   kernel/signal.c:1967:14: sparse:     got struct sighand_struct [noderef] <asn:4> *[noderef] <asn:4> sighand
   kernel/signal.c:1992:54: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] <asn:4> *parent @@
   kernel/signal.c:1992:54: sparse:     expected struct task_struct *p
   kernel/signal.c:1992:54: sparse:     got struct task_struct [noderef] <asn:4> *parent
   kernel/signal.c:1993:34: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] <asn:4> *parent @@
   kernel/signal.c:1993:34: sparse:     expected struct task_struct *parent
   kernel/signal.c:1993:34: sparse:     got struct task_struct [noderef] <asn:4> *parent
   kernel/signal.c:2022:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] <asn:4> *parent @@
   kernel/signal.c:2022:24: sparse:     expected struct task_struct *parent
   kernel/signal.c:2022:24: sparse:     got struct task_struct [noderef] <asn:4> *parent
   kernel/signal.c:2025:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] <asn:4> *real_parent @@
   kernel/signal.c:2025:24: sparse:     expected struct task_struct *parent
   kernel/signal.c:2025:24: sparse:     got struct task_struct [noderef] <asn:4> *real_parent
   kernel/signal.c:2058:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sighand_struct *sighand @@     got struct sighand_struct [noderef] <asn:4> *sighand @@
   kernel/signal.c:2058:17: sparse:     expected struct sighand_struct *sighand
   kernel/signal.c:2058:17: sparse:     got struct sighand_struct [noderef] <asn:4> *sighand
   kernel/signal.c:2133:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   kernel/signal.c:2133:41: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2133:41: sparse:     got struct spinlock [noderef] <asn:4> *
   kernel/signal.c:2135:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   kernel/signal.c:2135:39: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2135:39: sparse:     got struct spinlock [noderef] <asn:4> *
   kernel/signal.c:2183:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   kernel/signal.c:2183:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2183:33: sparse:     got struct spinlock [noderef] <asn:4> *
   kernel/signal.c:2238:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   kernel/signal.c:2238:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2238:31: sparse:     got struct spinlock [noderef] <asn:4> *
   kernel/signal.c:2272:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   kernel/signal.c:2272:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2272:31: sparse:     got struct spinlock [noderef] <asn:4> *
   kernel/signal.c:2274:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   kernel/signal.c:2274:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2274:33: sparse:     got struct spinlock [noderef] <asn:4> *
   kernel/signal.c:2371:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   kernel/signal.c:2371:41: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2371:41: sparse:     got struct spinlock [noderef] <asn:4> *
   kernel/signal.c:2456:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   kernel/signal.c:2456:41: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2456:41: sparse:     got struct spinlock [noderef] <asn:4> *
   kernel/signal.c:2468:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   kernel/signal.c:2468:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2468:33: sparse:     got struct spinlock [noderef] <asn:4> *
   kernel/signal.c:2506:52: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] <asn:4> *parent @@
   kernel/signal.c:2506:52: sparse:     expected struct task_struct *tsk
   kernel/signal.c:2506:52: sparse:     got struct task_struct [noderef] <asn:4> *parent
   kernel/signal.c:2508:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile *p @@     got struct cred const [noderef] <asn:4> *[noderef] <asn:4> * @@
   kernel/signal.c:2508:49: sparse:     expected void const volatile *p
   kernel/signal.c:2508:49: sparse:     got struct cred const [noderef] <asn:4> *[noderef] <asn:4> *
   kernel/signal.c:2508:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile *p @@     got struct cred const [noderef] <asn:4> *[noderef] <asn:4> * @@
   kernel/signal.c:2508:49: sparse:     expected void const volatile *p
   kernel/signal.c:2508:49: sparse:     got struct cred const [noderef] <asn:4> *[noderef] <asn:4> *
   kernel/signal.c:2523:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sighand_struct *sighand @@     got struct sighand_struct [noderef] <asn:4> *sighand @@
   kernel/signal.c:2523:49: sparse:     expected struct sighand_struct *sighand
   kernel/signal.c:2523:49: sparse:     got struct sighand_struct [noderef] <asn:4> *sighand
   kernel/signal.c:2827:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   kernel/signal.c:2827:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2827:27: sparse:     got struct spinlock [noderef] <asn:4> *
   kernel/signal.c:2847:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   kernel/signal.c:2847:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2847:29: sparse:     got struct spinlock [noderef] <asn:4> *
   kernel/signal.c:2914:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   kernel/signal.c:2914:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2914:27: sparse:     got struct spinlock [noderef] <asn:4> *
   kernel/signal.c:2916:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
--
   drivers/tty/tty_jobctrl.c:77:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   drivers/tty/tty_jobctrl.c:77:9: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:77:9: sparse:     got struct spinlock [noderef] <asn:4> *
   drivers/tty/tty_jobctrl.c:80:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   drivers/tty/tty_jobctrl.c:80:34: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:80:34: sparse:     got struct spinlock [noderef] <asn:4> *
   drivers/tty/tty_jobctrl.c:120:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   drivers/tty/tty_jobctrl.c:120:31: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:120:31: sparse:     got struct spinlock [noderef] <asn:4> *
   drivers/tty/tty_jobctrl.c:122:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   drivers/tty/tty_jobctrl.c:122:33: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:122:33: sparse:     got struct spinlock [noderef] <asn:4> *
   drivers/tty/tty_jobctrl.c:131:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   drivers/tty/tty_jobctrl.c:131:31: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:131:31: sparse:     got struct spinlock [noderef] <asn:4> *
   drivers/tty/tty_jobctrl.c:152:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   drivers/tty/tty_jobctrl.c:152:33: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:152:33: sparse:     got struct spinlock [noderef] <asn:4> *
   drivers/tty/tty_jobctrl.c:161:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   drivers/tty/tty_jobctrl.c:161:9: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:161:9: sparse:     got struct spinlock [noderef] <asn:4> *
   drivers/tty/tty_jobctrl.c:163:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   drivers/tty/tty_jobctrl.c:163:40: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:163:40: sparse:     got struct spinlock [noderef] <asn:4> *
   drivers/tty/tty_jobctrl.c:200:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   drivers/tty/tty_jobctrl.c:200:41: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:200:41: sparse:     got struct spinlock [noderef] <asn:4> *
   drivers/tty/tty_jobctrl.c:208:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   drivers/tty/tty_jobctrl.c:208:51: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:208:51: sparse:     got struct spinlock [noderef] <asn:4> *
   drivers/tty/tty_jobctrl.c:219:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   drivers/tty/tty_jobctrl.c:219:43: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:219:43: sparse:     got struct spinlock [noderef] <asn:4> *
   drivers/tty/tty_jobctrl.c:281:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   drivers/tty/tty_jobctrl.c:281:39: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:281:39: sparse:     got struct spinlock [noderef] <asn:4> *
   drivers/tty/tty_jobctrl.c:284:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   drivers/tty/tty_jobctrl.c:284:41: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:284:41: sparse:     got struct spinlock [noderef] <asn:4> *
   drivers/tty/tty_jobctrl.c:293:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   drivers/tty/tty_jobctrl.c:293:31: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:293:31: sparse:     got struct spinlock [noderef] <asn:4> *
   drivers/tty/tty_jobctrl.c:309:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] <asn:4> * @@
   drivers/tty/tty_jobctrl.c:309:33: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:309:33: sparse:     got struct spinlock [noderef] <asn:4> *
>> drivers/tty/tty_jobctrl.c:18:41: sparse: sparse: dereference of noderef expression

vim +19 include/uapi/asm-generic/signal-defs.h

b1ecb4c3a9e33cc include/asm-generic/signal.h Al Viro 2005-05-04  16  
b1ecb4c3a9e33cc include/asm-generic/signal.h Al Viro 2005-05-04  17  #ifndef __ASSEMBLY__
b1ecb4c3a9e33cc include/asm-generic/signal.h Al Viro 2005-05-04  18  typedef void __signalfn_t(int);
b1ecb4c3a9e33cc include/asm-generic/signal.h Al Viro 2005-05-04 @19  typedef __signalfn_t __user *__sighandler_t;
b1ecb4c3a9e33cc include/asm-generic/signal.h Al Viro 2005-05-04  20  

:::::: The code at line 19 was first introduced by commit
:::::: b1ecb4c3a9e33cc8b93ac9cb046b535b72a15f68 [PATCH] asm/signal.h unification

:::::: TO: Al Viro <viro@www.linux.org.uk>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
