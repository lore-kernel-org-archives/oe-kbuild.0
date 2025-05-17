Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53328347B4
	for <oe-kbuild@lists.linux.dev>; Sat, 17 May 2025 02:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747450258; cv=none; b=g4lItEHKZhPZ2t53XG2jo85fjZI+SJLfi/5b/Dp/3u8pTJxQcSZNpz7QskHCwze29M0GgraLy6se6YBjpgCqBV6h+zQtpuq4AoBCItkQ4s5LMQQ2rcHxZWGNmVxNJbEEQCkNEaisT++EvgojnkcG7pn/IlB8+jVn/NtDUHQd50w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747450258; c=relaxed/simple;
	bh=qYFXePQ45p/ex/pyBUxjmryEGUCC35jJ+5JDYHNDU40=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CaZWJCURT3HHZu8/ocxui4N7dd5j0cuvjeLivHPMZf6TOeB8hffRgJ98jQ2V6pqWXwT3ISXOeswX2+LHuWB7GNTjAIWM5gLG3fU+CIDPP/6uKTZDXu9A4bFYAUmYgxYk2izdy17obeHkshynkVlmEazwGINz9MQiql7JOf6Jb14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mBYL2cet; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mBYL2cet"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747450257; x=1778986257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qYFXePQ45p/ex/pyBUxjmryEGUCC35jJ+5JDYHNDU40=;
  b=mBYL2cetRFvnkCjkS8LiRYATLCYqxl1KySus3GKeqKvb/9t7EozHUhde
   yp8jX9n4sET8iqtYvMBli9U+yIBFtQt2yUsvGZ8CJhLkesNfNe/53Dert
   05MKqi5c0m8lRPyCwROsiG3n49j/4UAVIvnkofwEvtdz5pQp9+5nN7+NQ
   kqJowIVJvIdh6PqSmtzDcauwtZbh16y1G5XpuGEXHxDtKvR3xhPqHHABg
   NWYi/OMaO2tXmMDST26VypOucU5sywPI/z2xWsJKhONUldDVbEtDRUOO5
   /F9BSt8FgBjnpwS7awv9vTTQ3XsJ+sKM9Dp/h0n6EYLxmeP3WmoiuCf2N
   Q==;
X-CSE-ConnectionGUID: c8LjbLmbTlmXYJUUCU7t3Q==
X-CSE-MsgGUID: Gep6hWugSoSBzWKqDeGPFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="74828975"
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="74828975"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 19:50:55 -0700
X-CSE-ConnectionGUID: pHjH45LsRbOL7v7kvehrqw==
X-CSE-MsgGUID: /p0gLm6JSWSDIWblxfKSyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="169791187"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 May 2025 19:50:54 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uG7dU-000JtJ-0H;
	Sat, 17 May 2025 02:50:52 +0000
Date: Sat, 17 May 2025 10:50:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [cel:nfsd-testing 3/93] fs/nfsd/nfs4callback.c:1412
 nfsd41_cb_referring_call() warn: '&rcl->__list' not removed from list
Message-ID: <202505171002.cE46sdj5-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   d868e4920c3f4feefcbc17c5812bbe1a48af8c6f
commit: 4f3c8d8c9e109655311bbb4c6c46a54a9ef90d99 [3/93] NFSD: Implement CB_SEQUENCE referring call lists
:::::: branch date: 12 hours ago
:::::: commit date: 5 days ago
config: i386-randconfig-141-20250517 (https://download.01.org/0day-ci/archive/20250517/202505171002.cE46sdj5-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505171002.cE46sdj5-lkp@intel.com/

New smatch warnings:
fs/nfsd/nfs4callback.c:1412 nfsd41_cb_referring_call() warn: '&rcl->__list' not removed from list

Old smatch warnings:
include/linux/sunrpc/xdr.h:805 xdr_stream_decode_uint32_array() warn: potential user controlled sizeof overflow 'len * 4' '0-u32max * 4'

vim +1412 fs/nfsd/nfs4callback.c

2bbfed98a4d82a Trond Myklebust 2019-10-23  1350  
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1351  /**
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1352   * nfsd41_cb_referring_call - add a referring call to a callback operation
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1353   * @cb: context of callback to add the rc to
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1354   * @sessionid: referring call's session ID
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1355   * @slotid: referring call's session slot index
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1356   * @seqno: referring call's slot sequence number
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1357   *
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1358   * Caller serializes access to @cb.
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1359   *
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1360   * NB: If memory allocation fails, the referring call is not added.
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1361   */
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1362  void nfsd41_cb_referring_call(struct nfsd4_callback *cb,
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1363  			      struct nfs4_sessionid *sessionid,
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1364  			      u32 slotid, u32 seqno)
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1365  {
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1366  	struct nfsd4_referring_call_list *rcl;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1367  	struct nfsd4_referring_call *rc;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1368  	bool found;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1369  
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1370  	might_sleep();
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1371  
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1372  	found = false;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1373  	list_for_each_entry(rcl, &cb->cb_referring_call_list, __list) {
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1374  		if (!memcmp(rcl->rcl_sessionid.data, sessionid->data,
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1375  			   NFS4_MAX_SESSIONID_LEN)) {
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1376  			found = true;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1377  			break;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1378  		}
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1379  	}
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1380  	if (!found) {
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1381  		rcl = kmalloc(sizeof(*rcl), GFP_KERNEL);
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1382  		if (!rcl)
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1383  			return;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1384  		memcpy(rcl->rcl_sessionid.data, sessionid->data,
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1385  		       NFS4_MAX_SESSIONID_LEN);
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1386  		rcl->__nr_referring_calls = 0;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1387  		INIT_LIST_HEAD(&rcl->rcl_referring_calls);
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1388  		list_add(&rcl->__list, &cb->cb_referring_call_list);
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1389  		cb->cb_nr_referring_call_list++;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1390  	}
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1391  
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1392  	found = false;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1393  	list_for_each_entry(rc, &rcl->rcl_referring_calls, __list) {
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1394  		if (rc->rc_sequenceid == seqno && rc->rc_slotid == slotid) {
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1395  			found = true;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1396  			break;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1397  		}
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1398  	}
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1399  	if (!found) {
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1400  		rc = kmalloc(sizeof(*rc), GFP_KERNEL);
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1401  		if (!rc)
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1402  			goto out;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1403  		rc->rc_sequenceid = seqno;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1404  		rc->rc_slotid = slotid;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1405  		rcl->__nr_referring_calls++;
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1406  		list_add(&rc->__list, &rcl->rcl_referring_calls);
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1407  	}
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1408  
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1409  out:
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1410  	if (!rcl->__nr_referring_calls) {
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1411  		cb->cb_nr_referring_call_list--;
4f3c8d8c9e1096 Chuck Lever     2025-03-01 @1412  		kfree(rcl);
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1413  	}
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1414  }
4f3c8d8c9e1096 Chuck Lever     2025-03-01  1415  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
