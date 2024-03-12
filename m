Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8285956457
	for <oe-kbuild@lists.linux.dev>; Tue, 12 Mar 2024 12:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710247476; cv=none; b=jt7HJ+MKYgB0N2b3DuXPCNMA3CfIlnE2hWIgcc+8cvEIvXVJBUuO7cnNYYCS4BE+RBlKKkQ8QfOdK1/qie3uZ1XGk+xLzMaTsWtb4gcL3Q5p/tfa973h2SOGUajyP2dAP/dzEyZHy40EaFeDJGU+nJndAVg+3+m+FYLt+Z0FlOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710247476; c=relaxed/simple;
	bh=cParYF+zoJRtpA9Bc4ze6ZqnpUbt/aorYuBSaz0hcfI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sm3cS8/CLxKfyp63fBZc4QnYYDZj1gxane9VzArFE5Xhc127Etaae48llpUYLzbfCduGnXsUjs/b/9TCEXQP9vgspXm2FzXv+of3AunGoGSbgLI3UKaYHgqOliUDT4M6awxxZSjrKV6h7kauh42ER2KDdNovQvhLTvDdEi2+0zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bBoKkB9r; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bBoKkB9r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710247474; x=1741783474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cParYF+zoJRtpA9Bc4ze6ZqnpUbt/aorYuBSaz0hcfI=;
  b=bBoKkB9rcbuZ4Dlg3GbFWrdvNvxkE5mMqv+zJ83VC/KmJ4RUFrdOLqZz
   IsqLJfTz7o4eqjvlT9EEY4dQbMkI6tkXt4v9+Ztc30wDxc1JD4qZ9x5en
   s2uC8ViEkr9C0Iq87+YWpxcPwZVM+y2wTeUmT3VN2xKQHZ4lCa9mFm7ti
   1YW5ZsKy9vHdWQw84GjLZaAkcfa35NFqMtik7TVVEVUw2T1gvib0ZCVy0
   sYPoZ8JB4QcB/FUrUBcVd5xYJrckE91qoN2TO/KV3Qt0pzj+LQ5eQjoV+
   rM+bjv4fKu1rF8FQJYfV/aFMC3JaLiOD6sCCDDnqC6ZffpclIAqaqal72
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4825237"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4825237"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 05:44:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="11961928"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Mar 2024 05:44:32 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rk1Ub-000A8l-0Y;
	Tue, 12 Mar 2024 12:44:29 +0000
Date: Tue, 12 Mar 2024 20:44:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>,
	Elena Reshetova <elena.reshetova@intel.com>
Subject: fs/dlm/lock.c:1540:5-24: WARNING: atomic_dec_and_test variation
 before object free at line 1541.
Message-ID: <202403122023.XRJJaNfg-lkp@intel.com>
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
TO: Alexander Aring <aahringo@redhat.com>
CC: David Teigland <teigland@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   855684c7d938c2442f07eabc154e7532b4c1fbf9
commit: 75a7d60134ce84209f2c61ec4619ee543aa8f466 fs: dlm: handle lkb wait count as atomic_t
date:   9 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-103-20240312 (https://download.01.org/0day-ci/archive/20240312/202403122023.XRJJaNfg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202403122023.XRJJaNfg-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/dlm/lock.c:1540:5-24: WARNING: atomic_dec_and_test variation before object free at line 1541.
   fs/dlm/lock.c:5066:10-29: WARNING: atomic_dec_and_test variation before object free at line 5070.

vim +1540 fs/dlm/lock.c

e7fd41792fc0ee David Teigland  2006-01-18  1455  
b790c3b7c38aae David Teigland  2007-01-24  1456  /* We clear the RESEND flag because we might be taking an lkb off the waiters
b790c3b7c38aae David Teigland  2007-01-24  1457     list as part of process_requestqueue (e.g. a lookup that has an optimized
b790c3b7c38aae David Teigland  2007-01-24  1458     request reply on the requestqueue) between dlm_recover_waiters_pre() which
b790c3b7c38aae David Teigland  2007-01-24  1459     set RESEND and dlm_recover_waiters_post() */
b790c3b7c38aae David Teigland  2007-01-24  1460  
43279e5376017c David Teigland  2009-01-28  1461  static int _remove_from_waiters(struct dlm_lkb *lkb, int mstype,
43279e5376017c David Teigland  2009-01-28  1462  				struct dlm_message *ms)
e7fd41792fc0ee David Teigland  2006-01-18  1463  {
ef0c2bb05f40f9 David Teigland  2007-03-28  1464  	struct dlm_ls *ls = lkb->lkb_resource->res_ls;
ef0c2bb05f40f9 David Teigland  2007-03-28  1465  	int overlap_done = 0;
e7fd41792fc0ee David Teigland  2006-01-18  1466  
e1af8728f600f6 Alexander Aring 2023-03-06  1467  	if (mstype == DLM_MSG_UNLOCK_REPLY &&
e1af8728f600f6 Alexander Aring 2023-03-06  1468  	    test_and_clear_bit(DLM_IFL_OVERLAP_UNLOCK_BIT, &lkb->lkb_iflags)) {
43279e5376017c David Teigland  2009-01-28  1469  		log_debug(ls, "remwait %x unlock_reply overlap", lkb->lkb_id);
ef0c2bb05f40f9 David Teigland  2007-03-28  1470  		overlap_done = 1;
ef0c2bb05f40f9 David Teigland  2007-03-28  1471  		goto out_del;
e7fd41792fc0ee David Teigland  2006-01-18  1472  	}
ef0c2bb05f40f9 David Teigland  2007-03-28  1473  
e1af8728f600f6 Alexander Aring 2023-03-06  1474  	if (mstype == DLM_MSG_CANCEL_REPLY &&
e1af8728f600f6 Alexander Aring 2023-03-06  1475  	    test_and_clear_bit(DLM_IFL_OVERLAP_CANCEL_BIT, &lkb->lkb_iflags)) {
43279e5376017c David Teigland  2009-01-28  1476  		log_debug(ls, "remwait %x cancel_reply overlap", lkb->lkb_id);
ef0c2bb05f40f9 David Teigland  2007-03-28  1477  		overlap_done = 1;
ef0c2bb05f40f9 David Teigland  2007-03-28  1478  		goto out_del;
ef0c2bb05f40f9 David Teigland  2007-03-28  1479  	}
ef0c2bb05f40f9 David Teigland  2007-03-28  1480  
43279e5376017c David Teigland  2009-01-28  1481  	/* Cancel state was preemptively cleared by a successful convert,
43279e5376017c David Teigland  2009-01-28  1482  	   see next comment, nothing to do. */
43279e5376017c David Teigland  2009-01-28  1483  
43279e5376017c David Teigland  2009-01-28  1484  	if ((mstype == DLM_MSG_CANCEL_REPLY) &&
43279e5376017c David Teigland  2009-01-28  1485  	    (lkb->lkb_wait_type != DLM_MSG_CANCEL)) {
43279e5376017c David Teigland  2009-01-28  1486  		log_debug(ls, "remwait %x cancel_reply wait_type %d",
43279e5376017c David Teigland  2009-01-28  1487  			  lkb->lkb_id, lkb->lkb_wait_type);
43279e5376017c David Teigland  2009-01-28  1488  		return -1;
43279e5376017c David Teigland  2009-01-28  1489  	}
43279e5376017c David Teigland  2009-01-28  1490  
43279e5376017c David Teigland  2009-01-28  1491  	/* Remove for the convert reply, and premptively remove for the
43279e5376017c David Teigland  2009-01-28  1492  	   cancel reply.  A convert has been granted while there's still
43279e5376017c David Teigland  2009-01-28  1493  	   an outstanding cancel on it (the cancel is moot and the result
43279e5376017c David Teigland  2009-01-28  1494  	   in the cancel reply should be 0).  We preempt the cancel reply
43279e5376017c David Teigland  2009-01-28  1495  	   because the app gets the convert result and then can follow up
43279e5376017c David Teigland  2009-01-28  1496  	   with another op, like convert.  This subsequent op would see the
43279e5376017c David Teigland  2009-01-28  1497  	   lingering state of the cancel and fail with -EBUSY. */
43279e5376017c David Teigland  2009-01-28  1498  
43279e5376017c David Teigland  2009-01-28  1499  	if ((mstype == DLM_MSG_CONVERT_REPLY) &&
e1af8728f600f6 Alexander Aring 2023-03-06  1500  	    (lkb->lkb_wait_type == DLM_MSG_CONVERT) && ms && !ms->m_result &&
e1af8728f600f6 Alexander Aring 2023-03-06  1501  	    test_and_clear_bit(DLM_IFL_OVERLAP_CANCEL_BIT, &lkb->lkb_iflags)) {
43279e5376017c David Teigland  2009-01-28  1502  		log_debug(ls, "remwait %x convert_reply zap overlap_cancel",
43279e5376017c David Teigland  2009-01-28  1503  			  lkb->lkb_id);
43279e5376017c David Teigland  2009-01-28  1504  		lkb->lkb_wait_type = 0;
75a7d60134ce84 Alexander Aring 2023-05-29  1505  		atomic_dec(&lkb->lkb_wait_count);
1689c169134f4b Alexander Aring 2022-04-29  1506  		unhold_lkb(lkb);
43279e5376017c David Teigland  2009-01-28  1507  		goto out_del;
43279e5376017c David Teigland  2009-01-28  1508  	}
43279e5376017c David Teigland  2009-01-28  1509  
ef0c2bb05f40f9 David Teigland  2007-03-28  1510  	/* N.B. type of reply may not always correspond to type of original
ef0c2bb05f40f9 David Teigland  2007-03-28  1511  	   msg due to lookup->request optimization, verify others? */
ef0c2bb05f40f9 David Teigland  2007-03-28  1512  
ef0c2bb05f40f9 David Teigland  2007-03-28  1513  	if (lkb->lkb_wait_type) {
ef0c2bb05f40f9 David Teigland  2007-03-28  1514  		lkb->lkb_wait_type = 0;
ef0c2bb05f40f9 David Teigland  2007-03-28  1515  		goto out_del;
ef0c2bb05f40f9 David Teigland  2007-03-28  1516  	}
ef0c2bb05f40f9 David Teigland  2007-03-28  1517  
6d40c4a708e0e9 David Teigland  2012-04-23  1518  	log_error(ls, "remwait error %x remote %d %x msg %d flags %x no wait",
3428785a65dabf Alexander Aring 2022-04-04  1519  		  lkb->lkb_id, ms ? le32_to_cpu(ms->m_header.h_nodeid) : 0,
e1af8728f600f6 Alexander Aring 2023-03-06  1520  		  lkb->lkb_remid, mstype, dlm_iflags_val(lkb));
ef0c2bb05f40f9 David Teigland  2007-03-28  1521  	return -1;
ef0c2bb05f40f9 David Teigland  2007-03-28  1522  
ef0c2bb05f40f9 David Teigland  2007-03-28  1523   out_del:
ef0c2bb05f40f9 David Teigland  2007-03-28  1524  	/* the force-unlock/cancel has completed and we haven't recvd a reply
ef0c2bb05f40f9 David Teigland  2007-03-28  1525  	   to the op that was in progress prior to the unlock/cancel; we
ef0c2bb05f40f9 David Teigland  2007-03-28  1526  	   give up on any reply to the earlier op.  FIXME: not sure when/how
ef0c2bb05f40f9 David Teigland  2007-03-28  1527  	   this would happen */
ef0c2bb05f40f9 David Teigland  2007-03-28  1528  
ef0c2bb05f40f9 David Teigland  2007-03-28  1529  	if (overlap_done && lkb->lkb_wait_type) {
43279e5376017c David Teigland  2009-01-28  1530  		log_error(ls, "remwait error %x reply %d wait_type %d overlap",
ef0c2bb05f40f9 David Teigland  2007-03-28  1531  			  lkb->lkb_id, mstype, lkb->lkb_wait_type);
75a7d60134ce84 Alexander Aring 2023-05-29  1532  		atomic_dec(&lkb->lkb_wait_count);
1689c169134f4b Alexander Aring 2022-04-29  1533  		unhold_lkb(lkb);
e7fd41792fc0ee David Teigland  2006-01-18  1534  		lkb->lkb_wait_type = 0;
ef0c2bb05f40f9 David Teigland  2007-03-28  1535  	}
ef0c2bb05f40f9 David Teigland  2007-03-28  1536  
75a7d60134ce84 Alexander Aring 2023-05-29  1537  	DLM_ASSERT(atomic_read(&lkb->lkb_wait_count), dlm_print_lkb(lkb););
ef0c2bb05f40f9 David Teigland  2007-03-28  1538  
e1af8728f600f6 Alexander Aring 2023-03-06  1539  	clear_bit(DLM_IFL_RESEND_BIT, &lkb->lkb_iflags);
75a7d60134ce84 Alexander Aring 2023-05-29 @1540  	if (atomic_dec_and_test(&lkb->lkb_wait_count))
ef0c2bb05f40f9 David Teigland  2007-03-28 @1541  		list_del_init(&lkb->lkb_wait_reply);
e7fd41792fc0ee David Teigland  2006-01-18  1542  	unhold_lkb(lkb);
ef0c2bb05f40f9 David Teigland  2007-03-28  1543  	return 0;
ef0c2bb05f40f9 David Teigland  2007-03-28  1544  }
ef0c2bb05f40f9 David Teigland  2007-03-28  1545  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
