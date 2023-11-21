Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724485101C
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Nov 2023 18:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AyeEGhwR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700591704; x=1732127704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qVYB8LZzJEqjVjKlw58p2zJFRUsNQIu2f1nRRwOf2yo=;
  b=AyeEGhwRQtYn2Z8SVV3jVHAX27kvGFuyCu+MvtqXwU54G/CM6/TlFdmU
   yHm91fMdaz9rfd0gH50fy58vbkb/NhTiaTyqZgz4QHmN3IHC+y1+UHSxU
   TUZAvlJ1Eer5JrpQ1UOIS/H4ndStSsEl4xR0eD9i/x69CPY2VBmwIL7fh
   thREUU+Z1li2mUx37639Q8qa/ymCo3L1BfwFkQ+5tSfDUEjX0eEiEIjj+
   llwNqo70COzQsTITvfU0j6QXGZ7BPePMcMX11gpZn72ygiJV72ufQyjOx
   0+CvAbMeq2B+3a1XPk4lxDDnwCzrWE5g2+ZW75SlebnxGM4ip7qQ9QR8Z
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="5098184"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="5098184"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 10:35:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="1098122580"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="1098122580"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 21 Nov 2023 10:35:02 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5VaO-000893-0I;
	Tue, 21 Nov 2023 18:35:00 +0000
Date: Wed, 22 Nov 2023 02:34:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1708/2217] fs/bcachefs/move.c:512
 bch2_move_ratelimit() warn: was '== 0' instead of '='
Message-ID: <202311220244.C72WVW3D-lkp@intel.com>
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
TO: Kent Overstreet <kmo@daterainc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   07b677953b9dca02928be323e2db853511305fa9
commit: b78ad0b94d2a0264f31de44fc035c489a13680e2 [1708/2217] bcachefs: Make sure bch2_move_ratelimit() also waits for move_ops
:::::: branch date: 15 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20231121 (https://download.01.org/0day-ci/archive/20231122/202311220244.C72WVW3D-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231122/202311220244.C72WVW3D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311220244.C72WVW3D-lkp@intel.com/

smatch warnings:
fs/bcachefs/move.c:512 bch2_move_ratelimit() warn: was '== 0' instead of '='

vim +512 fs/bcachefs/move.c

883d9701f15894 Kent Overstreet 2021-03-16  481  
633169035a7ccd Kent Overstreet 2023-10-20  482  int bch2_move_ratelimit(struct moving_context *ctxt)
c91996c50a9ad6 Daniel Hill     2022-06-16  483  {
633169035a7ccd Kent Overstreet 2023-10-20  484  	struct bch_fs *c = ctxt->trans->c;
c91996c50a9ad6 Daniel Hill     2022-06-16  485  	u64 delay;
c91996c50a9ad6 Daniel Hill     2022-06-16  486  
f82755e4e8b83a Kent Overstreet 2023-10-30  487  	if (ctxt->wait_on_copygc && !c->copygc_running) {
f82755e4e8b83a Kent Overstreet 2023-10-30  488  		bch2_trans_unlock_long(ctxt->trans);
c91996c50a9ad6 Daniel Hill     2022-06-16  489  		wait_event_killable(c->copygc_running_wq,
c91996c50a9ad6 Daniel Hill     2022-06-16  490  				    !c->copygc_running ||
c91996c50a9ad6 Daniel Hill     2022-06-16  491  				    kthread_should_stop());
c91996c50a9ad6 Daniel Hill     2022-06-16  492  	}
c91996c50a9ad6 Daniel Hill     2022-06-16  493  
c91996c50a9ad6 Daniel Hill     2022-06-16  494  	do {
0337cc7eeed19e Kent Overstreet 2022-06-20  495  		delay = ctxt->rate ? bch2_ratelimit_delay(ctxt->rate) : 0;
c91996c50a9ad6 Daniel Hill     2022-06-16  496  
f82755e4e8b83a Kent Overstreet 2023-10-30  497  
c91996c50a9ad6 Daniel Hill     2022-06-16  498  		if (delay) {
f82755e4e8b83a Kent Overstreet 2023-10-30  499  			if (delay > HZ / 10)
f82755e4e8b83a Kent Overstreet 2023-10-30  500  				bch2_trans_unlock_long(ctxt->trans);
f82755e4e8b83a Kent Overstreet 2023-10-30  501  			else
633169035a7ccd Kent Overstreet 2023-10-20  502  				bch2_trans_unlock(ctxt->trans);
c91996c50a9ad6 Daniel Hill     2022-06-16  503  			set_current_state(TASK_INTERRUPTIBLE);
c91996c50a9ad6 Daniel Hill     2022-06-16  504  		}
c91996c50a9ad6 Daniel Hill     2022-06-16  505  
c91996c50a9ad6 Daniel Hill     2022-06-16  506  		if ((current->flags & PF_KTHREAD) && kthread_should_stop()) {
c91996c50a9ad6 Daniel Hill     2022-06-16  507  			__set_current_state(TASK_RUNNING);
c91996c50a9ad6 Daniel Hill     2022-06-16  508  			return 1;
c91996c50a9ad6 Daniel Hill     2022-06-16  509  		}
c91996c50a9ad6 Daniel Hill     2022-06-16  510  
c91996c50a9ad6 Daniel Hill     2022-06-16  511  		if (delay)
b78ad0b94d2a02 Kent Overstreet 2023-11-19 @512  			move_ctxt_wait_event_timeout(ctxt, false, delay);
c91996c50a9ad6 Daniel Hill     2022-06-16  513  
c91996c50a9ad6 Daniel Hill     2022-06-16  514  		if (unlikely(freezing(current))) {
633169035a7ccd Kent Overstreet 2023-10-20  515  			move_ctxt_wait_event(ctxt, list_empty(&ctxt->reads));
c91996c50a9ad6 Daniel Hill     2022-06-16  516  			try_to_freeze();
c91996c50a9ad6 Daniel Hill     2022-06-16  517  		}
c91996c50a9ad6 Daniel Hill     2022-06-16  518  	} while (delay);
c91996c50a9ad6 Daniel Hill     2022-06-16  519  
c782c5832e9251 Kent Overstreet 2023-01-09  520  	/*
c782c5832e9251 Kent Overstreet 2023-01-09  521  	 * XXX: these limits really ought to be per device, SSDs and hard drives
c782c5832e9251 Kent Overstreet 2023-01-09  522  	 * will want different limits
c782c5832e9251 Kent Overstreet 2023-01-09  523  	 */
633169035a7ccd Kent Overstreet 2023-10-20  524  	move_ctxt_wait_event(ctxt,
c782c5832e9251 Kent Overstreet 2023-01-09  525  		atomic_read(&ctxt->write_sectors) < c->opts.move_bytes_in_flight >> 9 &&
c782c5832e9251 Kent Overstreet 2023-01-09  526  		atomic_read(&ctxt->read_sectors) < c->opts.move_bytes_in_flight >> 9 &&
c782c5832e9251 Kent Overstreet 2023-01-09  527  		atomic_read(&ctxt->write_ios) < c->opts.move_ios_in_flight &&
c782c5832e9251 Kent Overstreet 2023-01-09  528  		atomic_read(&ctxt->read_ios) < c->opts.move_ios_in_flight);
c91996c50a9ad6 Daniel Hill     2022-06-16  529  
c91996c50a9ad6 Daniel Hill     2022-06-16  530  	return 0;
c91996c50a9ad6 Daniel Hill     2022-06-16  531  }
c91996c50a9ad6 Daniel Hill     2022-06-16  532  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
