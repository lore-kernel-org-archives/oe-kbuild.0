Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960172144A1
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Apr 2025 14:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744121165; cv=none; b=uWPj/9gZTgJNf5xysHlQ65KmpXZnsXC2zQh4vh3U6xrxFgjmBHtYE/8RUZAOuveVo3lYXdn32DmmY5kld8GeldPXyI6qKvrteuzQQ5arpmh0cefuHhwBwlqBXLAbnM4bn7g6AyzBmYwOtmqFlTf9WylNmITGnGSp/XhzZFr2M4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744121165; c=relaxed/simple;
	bh=LXjko/SE3QxhXis7wStClGb6zDjo39VMqP/020gQyGg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HHeu68o4y3lb9y00EY2q0iZcDkGtejv9jXlJaUKpYLKwPrI6Nj/Mj7YowTViaGp4O7jZSB2RCc2lP99snzrAgMuklyNxQhKvz0mYWwPBAY8SwHuOG+zVA+afEPPZ9Ee0cwprSn7774vHyt5wwUi8OY15J8JndkXwFT94pt74cG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LEGiKpYX; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LEGiKpYX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744121164; x=1775657164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LXjko/SE3QxhXis7wStClGb6zDjo39VMqP/020gQyGg=;
  b=LEGiKpYXbH5Zfpw1m57ogWx14th3qy5S//uZSen9Hu6110Jv4uNRVFUn
   xVQezUUoMAfxNJC+KcCxDq4zBe0caEoMT9fwLPDQELW34a0I9IqM1pKcz
   vP4E5AFPTfz+UYMo6Z/st/YIzvCVfZk6kc3PjNlUp65iWj3FUxnd9KyWX
   oE3RIoAS9v+rhtB/9mCGL3sSH9qGHzDDwyEumaBwGBnXmAzHf5RbeItWB
   pBU2pMc/qXsNRY0tNWKNXKXkypHTgAj5fdfQYNDIL2Ftob0qgBm2JQc8m
   zj3I8GzQbR17n3kwQEGRG/u4mIcHa4lduJy8nPJ1TZ2FPAhF9fS/N05jb
   w==;
X-CSE-ConnectionGUID: 5pkzjL0ORl22ab47LBN2Vw==
X-CSE-MsgGUID: 72yYdTKoRGafHVb9G0zUEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="33159142"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="33159142"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 07:06:03 -0700
X-CSE-ConnectionGUID: Vj3sTp+PSj6/YyxYqMxPkA==
X-CSE-MsgGUID: 9AAfZ0rtRUeONcIzgdlhug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="128152898"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Apr 2025 07:06:01 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u29aR-0007WJ-1Y;
	Tue, 08 Apr 2025 14:05:59 +0000
Date: Tue, 8 Apr 2025 22:05:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 1070/1936] fs/nfsd/nfs4callback.c:1393:26-29:
 ERROR: invalid reference to the index variable of the iterator on line 1373
Message-ID: <202504082137.uuO3MtBv-lkp@intel.com>
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
TO: Chuck Lever <chuck.lever@oracle.com>
CC: Jeff Layton <jlayton@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7702d0130dc002bab2c3571ddb6ff68f82d99aea
commit: 1893a098bca47504d628f1668bfceeaf18e01bbb [1070/1936] NFSD: Implement CB_SEQUENCE referring call lists
:::::: branch date: 10 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-104-20250408 (https://download.01.org/0day-ci/archive/20250408/202504082137.uuO3MtBv-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202504082137.uuO3MtBv-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/nfsd/nfs4callback.c:1393:26-29: ERROR: invalid reference to the index variable of the iterator on line 1373

vim +1393 fs/nfsd/nfs4callback.c

2bbfed98a4d82a Trond Myklebust 2019-10-23  1350  
1893a098bca475 Chuck Lever     2025-03-01  1351  /**
1893a098bca475 Chuck Lever     2025-03-01  1352   * nfsd41_cb_referring_call - add a referring call to a callback operation
1893a098bca475 Chuck Lever     2025-03-01  1353   * @cb: context of callback to add the rc to
1893a098bca475 Chuck Lever     2025-03-01  1354   * @sessionid: referring call's session ID
1893a098bca475 Chuck Lever     2025-03-01  1355   * @slotid: referring call's session slot index
1893a098bca475 Chuck Lever     2025-03-01  1356   * @seqno: referring call's slot sequence number
1893a098bca475 Chuck Lever     2025-03-01  1357   *
1893a098bca475 Chuck Lever     2025-03-01  1358   * Caller serializes access to @cb.
1893a098bca475 Chuck Lever     2025-03-01  1359   *
1893a098bca475 Chuck Lever     2025-03-01  1360   * NB: If memory allocation fails, the referring call is not added.
1893a098bca475 Chuck Lever     2025-03-01  1361   */
1893a098bca475 Chuck Lever     2025-03-01  1362  void nfsd41_cb_referring_call(struct nfsd4_callback *cb,
1893a098bca475 Chuck Lever     2025-03-01  1363  			      struct nfs4_sessionid *sessionid,
1893a098bca475 Chuck Lever     2025-03-01  1364  			      u32 slotid, u32 seqno)
1893a098bca475 Chuck Lever     2025-03-01  1365  {
1893a098bca475 Chuck Lever     2025-03-01  1366  	struct nfsd4_referring_call_list *rcl;
1893a098bca475 Chuck Lever     2025-03-01  1367  	struct nfsd4_referring_call *rc;
1893a098bca475 Chuck Lever     2025-03-01  1368  	bool found;
1893a098bca475 Chuck Lever     2025-03-01  1369  
1893a098bca475 Chuck Lever     2025-03-01  1370  	might_sleep();
1893a098bca475 Chuck Lever     2025-03-01  1371  
1893a098bca475 Chuck Lever     2025-03-01  1372  	found = false;
1893a098bca475 Chuck Lever     2025-03-01 @1373  	list_for_each_entry(rcl, &cb->cb_referring_call_list, __list) {
1893a098bca475 Chuck Lever     2025-03-01  1374  		if (!memcmp(rcl->rcl_sessionid.data, sessionid->data,
1893a098bca475 Chuck Lever     2025-03-01  1375  			   NFS4_MAX_SESSIONID_LEN)) {
1893a098bca475 Chuck Lever     2025-03-01  1376  			found = true;
1893a098bca475 Chuck Lever     2025-03-01  1377  			break;
1893a098bca475 Chuck Lever     2025-03-01  1378  		}
1893a098bca475 Chuck Lever     2025-03-01  1379  	}
1893a098bca475 Chuck Lever     2025-03-01  1380  	if (!found) {
1893a098bca475 Chuck Lever     2025-03-01  1381  		rcl = kmalloc(sizeof(*rcl), GFP_KERNEL);
1893a098bca475 Chuck Lever     2025-03-01  1382  		if (!rcl)
1893a098bca475 Chuck Lever     2025-03-01  1383  			return;
1893a098bca475 Chuck Lever     2025-03-01  1384  		memcpy(rcl->rcl_sessionid.data, sessionid->data,
1893a098bca475 Chuck Lever     2025-03-01  1385  		       NFS4_MAX_SESSIONID_LEN);
1893a098bca475 Chuck Lever     2025-03-01  1386  		rcl->__nr_referring_calls = 0;
1893a098bca475 Chuck Lever     2025-03-01  1387  		INIT_LIST_HEAD(&rcl->rcl_referring_calls);
1893a098bca475 Chuck Lever     2025-03-01  1388  		list_add(&rcl->__list, &cb->cb_referring_call_list);
1893a098bca475 Chuck Lever     2025-03-01  1389  		cb->cb_nr_referring_call_list++;
1893a098bca475 Chuck Lever     2025-03-01  1390  	}
1893a098bca475 Chuck Lever     2025-03-01  1391  
1893a098bca475 Chuck Lever     2025-03-01  1392  	found = false;
1893a098bca475 Chuck Lever     2025-03-01 @1393  	list_for_each_entry(rc, &rcl->rcl_referring_calls, __list) {
1893a098bca475 Chuck Lever     2025-03-01  1394  		if (rc->rc_sequenceid == seqno && rc->rc_slotid == slotid) {
1893a098bca475 Chuck Lever     2025-03-01  1395  			found = true;
1893a098bca475 Chuck Lever     2025-03-01  1396  			break;
1893a098bca475 Chuck Lever     2025-03-01  1397  		}
1893a098bca475 Chuck Lever     2025-03-01  1398  	}
1893a098bca475 Chuck Lever     2025-03-01  1399  	if (!found) {
1893a098bca475 Chuck Lever     2025-03-01  1400  		rc = kmalloc(sizeof(*rc), GFP_KERNEL);
1893a098bca475 Chuck Lever     2025-03-01  1401  		if (!rc)
1893a098bca475 Chuck Lever     2025-03-01  1402  			goto out;
1893a098bca475 Chuck Lever     2025-03-01  1403  		rc->rc_sequenceid = seqno;
1893a098bca475 Chuck Lever     2025-03-01  1404  		rc->rc_slotid = slotid;
1893a098bca475 Chuck Lever     2025-03-01  1405  		rcl->__nr_referring_calls++;
1893a098bca475 Chuck Lever     2025-03-01  1406  		list_add(&rc->__list, &rcl->rcl_referring_calls);
1893a098bca475 Chuck Lever     2025-03-01  1407  	}
1893a098bca475 Chuck Lever     2025-03-01  1408  
1893a098bca475 Chuck Lever     2025-03-01  1409  out:
1893a098bca475 Chuck Lever     2025-03-01  1410  	if (!rcl->__nr_referring_calls) {
1893a098bca475 Chuck Lever     2025-03-01  1411  		cb->cb_nr_referring_call_list--;
1893a098bca475 Chuck Lever     2025-03-01  1412  		kfree(rcl);
1893a098bca475 Chuck Lever     2025-03-01  1413  	}
1893a098bca475 Chuck Lever     2025-03-01  1414  }
1893a098bca475 Chuck Lever     2025-03-01  1415  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
