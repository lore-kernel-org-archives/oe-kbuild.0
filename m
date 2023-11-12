Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F1E440A
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Nov 2023 06:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OZO61bwe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699769673; x=1731305673;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4EQ0eCdJFKCTjYJy63W76ckyq/rYCtkT2zYFeZqXil0=;
  b=OZO61bweRbVZShwwM15IIWBP4bXxA2vqdy77AMtWddjQPKaQ2Iq8Aoi7
   j0mCB7aBFGtBM/r15JTK+LV9J10QUJVfhBcEWCZJiTqAikjeE4iPpAZZ6
   UojFtdjOCEBMni7LcHy16q3Qwf0B/9eU/PS+MDkCblqqOeUyqMZU5sWbP
   VtTpVwVyf3r59z6mvmjxQxOolfrtlGegcFWhLG6yiOdQJSuYZupE45yN4
   ouGs7uaeh6fPRM6rS1UZ67FJeTsfa4NjOJQJMB2p+FG6B2BgrE2GtARTM
   tWR7b4WYTc5kDyzE10MlZeB7O9QZs2qZVjKJgaIrQHrsyM/QTEXU7tHbY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="393182085"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="393182085"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 22:14:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="798917706"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="798917706"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 11 Nov 2023 22:14:30 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r23jo-000Az6-1b;
	Sun, 12 Nov 2023 06:14:28 +0000
Date: Sun, 12 Nov 2023 14:13:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/uapi/asm-generic/signal-defs.h:19:29: sparse: sparse:
 multiple address spaces given
Message-ID: <202311121412.uPg7oQEu-lkp@intel.com>
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
head:   1b907d0507354b74a4f2c286380cd6059af79248
commit: 913292c97d750fe4188b4f5aa770e5e0ca1e5a91 sched.h: Annotate sighand_struct with __rcu
date:   3 years, 10 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 years, 10 months ago
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20231112/202311121412.uPg7oQEu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231112/202311121412.uPg7oQEu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311121412.uPg7oQEu-lkp@intel.com/

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

b1ecb4c3a9e33c include/asm-generic/signal.h Al Viro 2005-05-04  16  
b1ecb4c3a9e33c include/asm-generic/signal.h Al Viro 2005-05-04  17  #ifndef __ASSEMBLY__
b1ecb4c3a9e33c include/asm-generic/signal.h Al Viro 2005-05-04  18  typedef void __signalfn_t(int);
b1ecb4c3a9e33c include/asm-generic/signal.h Al Viro 2005-05-04 @19  typedef __signalfn_t __user *__sighandler_t;
b1ecb4c3a9e33c include/asm-generic/signal.h Al Viro 2005-05-04  20  

:::::: The code at line 19 was first introduced by commit
:::::: b1ecb4c3a9e33cc8b93ac9cb046b535b72a15f68 [PATCH] asm/signal.h unification

:::::: TO: Al Viro <viro@www.linux.org.uk>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
