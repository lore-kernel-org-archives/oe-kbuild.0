Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA456AC0
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Mar 2024 23:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709941159; cv=none; b=cz+pbIrJhJUxKazUnYXdf4EViJ1cNJDsD+ZovmHBj69v/QTVmPVBnQd4oPb40Lp0a0OnpZxc85my4U8FaQO+4R8zAh4JJSCMHm+wTzKimJllggTfsEZ5KyBu9MDyx9yOHtoPc4mr7VgEqC+/0w/um3EBkoWtEZmmHXSUd4y/E+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709941159; c=relaxed/simple;
	bh=kkG8nXPd5SfQA7zV/HNhTDDznKScxKnNcJsvGq/QihU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uhGsPfp7VxEvG5mTwVTU/v9Rj7LWGb0sKotKAiMdo2CXC2HtfpjaoLnzQoXCkywRVm10nTqmFkaWpqmP8IIi4lw86+iaZ9RWoLtjjLYavNZzwCFPebzFxmZKIcjE9zO6vSvKFrHY743HfUttvlNfZVsPKfWzdg3LEdQiElP13E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MClnzXvr; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MClnzXvr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709941156; x=1741477156;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kkG8nXPd5SfQA7zV/HNhTDDznKScxKnNcJsvGq/QihU=;
  b=MClnzXvr7JvluuJ/7siAbBY3haHRgHRcDxn/tr9gWCKdD5TZdeJ/ys93
   J4I4nkjN2TAtPqMWCfTBW6FqHY19o8nTYCQYUiTXFFCtMRZiovKdZVma0
   3KR1y4GbLTqmwWI1dcUy37YfbiC1WCU93WEIyWk93i6eWV8Ng0OYXSqWf
   hY6Fnl/x9O/zb0qzotutiW4HwBxYg6kWr9mtOm72vOjE0r8mEYZkIi+TK
   unlencKt3KTCCKtppZNQUzDRhgnscISE/pDeDPCniIQihlQXUf7ky7dqI
   DAIKlHi3zsO7UMZUKcJnB8s4Wohg3mqJzfrH7aUZjEJrnbQjsWfhBnPFs
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="7632033"
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="7632033"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 15:39:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="41537379"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Mar 2024 15:39:05 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rijnq-0006o7-2H;
	Fri, 08 Mar 2024 23:39:02 +0000
Date: Sat, 9 Mar 2024 07:38:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [openeuler:openEuler-1.0-LTS 21484/21783]
 drivers/tty/n_gsm.c:2067:2-8: preceding lock on line 2044
Message-ID: <202403090717.4hBU8QwC-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Yi Yang <yiyang13@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   eac3c6a044aaf481751d9f7fb4b6096ae431e167
commit: 6ec821f56b356d4556cda52162717ea1fee7a824 [21484/21783] tty: n_gsm: fix restart handling via CLD command
:::::: branch date: 14 hours ago
:::::: commit date: 2 months ago
config: x86_64-randconfig-103-20240308 (https://download.01.org/0day-ci/archive/20240309/202403090717.4hBU8QwC-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202403090717.4hBU8QwC-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/tty/n_gsm.c:2067:2-8: preceding lock on line 2044

vim +2067 drivers/tty/n_gsm.c

e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox      2010-03-26  2026  
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox      2010-03-26  2027  /**
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox      2010-03-26  2028   *	gsm_cleanup_mux		-	generic GSM protocol cleanup
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox      2010-03-26  2029   *	@gsm: our mux
6ec821f56b356d drivers/tty/n_gsm.c  Daniel Starke 2023-12-27  2030   *	@disc: disconnect link?
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox      2010-03-26  2031   *
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox      2010-03-26  2032   *	Clean up the bits of the mux which are the same for all framing
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox      2010-03-26  2033   *	protocols. Remove the mux from the mux table, stop all the timers
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox      2010-03-26  2034   *	and then shut down each device hanging up the channels as we go.
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox      2010-03-26  2035   */
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox      2010-03-26  2036  
6ec821f56b356d drivers/tty/n_gsm.c  Daniel Starke 2023-12-27  2037  static void gsm_cleanup_mux(struct gsm_mux *gsm, bool disc)
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox      2010-03-26  2038  {
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox      2010-03-26  2039  	int i;
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox      2010-03-26  2040  	struct gsm_dlci *dlci = gsm->dlci[0];
329e56780e514a drivers/tty/n_gsm.c  Russ Gorby    2012-08-13  2041  	struct gsm_msg *txq, *ntxq;
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox      2010-03-26  2042  
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox      2010-03-26  2043  	gsm->dead = 1;
6ec821f56b356d drivers/tty/n_gsm.c  Daniel Starke 2023-12-27 @2044  	mutex_lock(&gsm->mutex);
6ec821f56b356d drivers/tty/n_gsm.c  Daniel Starke 2023-12-27  2045  
6ec821f56b356d drivers/tty/n_gsm.c  Daniel Starke 2023-12-27  2046  	if (dlci) {
6ec821f56b356d drivers/tty/n_gsm.c  Daniel Starke 2023-12-27  2047  		if (disc && dlci->state != DLCI_CLOSED) {
6ec821f56b356d drivers/tty/n_gsm.c  Daniel Starke 2023-12-27  2048  			gsm_dlci_begin_close(dlci);
6ec821f56b356d drivers/tty/n_gsm.c  Daniel Starke 2023-12-27  2049  			wait_event(gsm->event, dlci->state == DLCI_CLOSED);
6ec821f56b356d drivers/tty/n_gsm.c  Daniel Starke 2023-12-27  2050  		}
6ec821f56b356d drivers/tty/n_gsm.c  Daniel Starke 2023-12-27  2051  		dlci->dead = true;
6ec821f56b356d drivers/tty/n_gsm.c  Daniel Starke 2023-12-27  2052  	}
6ec821f56b356d drivers/tty/n_gsm.c  Daniel Starke 2023-12-27  2053  
6ec821f56b356d drivers/tty/n_gsm.c  Daniel Starke 2023-12-27  2054  	/* Finish outstanding timers, making sure they are done */
6ec821f56b356d drivers/tty/n_gsm.c  Daniel Starke 2023-12-27  2055  	del_timer_sync(&gsm->t2_timer);
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox      2010-03-26  2056  
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox      2010-03-26  2057  	spin_lock(&gsm_mux_lock);
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox      2010-03-26  2058  	for (i = 0; i < MAX_MUX; i++) {
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox      2010-03-26  2059  		if (gsm_mux[i] == gsm) {
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox      2010-03-26  2060  			gsm_mux[i] = NULL;
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox      2010-03-26  2061  			break;
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox      2010-03-26  2062  		}
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox      2010-03-26  2063  	}
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox      2010-03-26  2064  	spin_unlock(&gsm_mux_lock);
d175feca89a1c1 drivers/tty/n_gsm.c  Jiri Slaby    2016-03-22  2065  	/* open failed before registering => nothing to do */
d175feca89a1c1 drivers/tty/n_gsm.c  Jiri Slaby    2016-03-22  2066  	if (i == MAX_MUX)
d175feca89a1c1 drivers/tty/n_gsm.c  Jiri Slaby    2016-03-22 @2067  		return;
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox      2010-03-26  2068  
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox      2010-03-26  2069  	/* Free up any link layer users */
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox      2010-03-26  2070  	for (i = 0; i < NUM_DLCI; i++)
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox      2010-03-26  2071  		if (gsm->dlci[i])
6ab8fba7fcb012 drivers/tty/n_gsm.c  Russ Gorby    2011-06-16  2072  			gsm_dlci_release(gsm->dlci[i]);
dfabf7ffa30585 drivers/tty/n_gsm.c  Chao Bi       2013-11-26  2073  	mutex_unlock(&gsm->mutex);
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox      2010-03-26  2074  	/* Now wipe the queues */
b4338e1efc3399 drivers/tty/n_gsm.c  Russ Gorby    2012-08-13  2075  	list_for_each_entry_safe(txq, ntxq, &gsm->tx_list, list)
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox      2010-03-26  2076  		kfree(txq);
b4338e1efc3399 drivers/tty/n_gsm.c  Russ Gorby    2012-08-13  2077  	INIT_LIST_HEAD(&gsm->tx_list);
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox      2010-03-26  2078  }
e1eaea46bb4020 drivers/char/n_gsm.c Alan Cox      2010-03-26  2079  

:::::: The code at line 2067 was first introduced by commit
:::::: d175feca89a1c162f60f4e3560ca7bc9437c65eb TTY: n_gsm, fix false positive WARN_ON

:::::: TO: Jiri Slaby <jslaby@suse.cz>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
