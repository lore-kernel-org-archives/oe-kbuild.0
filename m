Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA8E1D4152
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Oct 2024 09:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729846916; cv=none; b=cVBWnhsUrwxT6xn50ImthJD8JECau+c12wxe+NamiHxWRTY7/dEORwLBUbhkcFNwHjYoflGsh0EW2WFHLNaBcmFjAqdif+p7eqoMzf+7gKOl370PqWFEe2UIaslNb0InAMSXTyhiEBbnmh9Tp3l9cv3pQxO/7+f90JzwQlGoexg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729846916; c=relaxed/simple;
	bh=qutBNnIpBKXmKjYBgmhSjED9VoL4985fpRHwkUIsZKM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GWZDHCFwH9GVzA9ndBwj8BDqpzth9PpertzGA2RuZ22zpT44/RUpbGXK8Z9buOFigFn2LfH9GdkYo2+XfFwAE8sOPIQjBGU7IfXl88lRri1nhZwl832HPDXRkOZH024beNohYE6sOIRgW5ewlpa4sHonsLQgbgho0BTlO31mxX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RJ3C8jFe; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RJ3C8jFe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729846914; x=1761382914;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qutBNnIpBKXmKjYBgmhSjED9VoL4985fpRHwkUIsZKM=;
  b=RJ3C8jFenAJfg7EV2JJYhCfzoc3H5qJwCYExvZ1nwU/KrRvMb4yyRsIt
   +eylErir3cLr60spdKtSBfLWB9YZPvFZ/1VYCiriXF28K/VM+bshrwZ7q
   OxAY0ZXYiRFYcbk0STRNFpGBVVuIo3pBl+k7mt08TSUiySS0gTqmU/NLT
   FXt5G7zA17j8/4bJCHiRiDXCHaVcnseLn8EKUq/w/xyDzO57qgs8hSRjZ
   T1vBpVrqyOcjUjPNxmGcX6p27fhX/vBAJV81w7ar/r9pNxmekZ7mVKPcJ
   WziMbaCCiOl9znlM1ibtxt4gLDOsvV0CI5Pqv++3RHzlBc6AQG+Ny9frE
   g==;
X-CSE-ConnectionGUID: tb+nswkOQMSOnJq2dP25XA==
X-CSE-MsgGUID: 6U70pkdNSD6++fo8mQh17w==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="28951070"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="28951070"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 02:01:53 -0700
X-CSE-ConnectionGUID: Bef1njx3Ts+pCSN67+utBA==
X-CSE-MsgGUID: lWiwUV6lQBq31pdooCxTOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="85961296"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Oct 2024 02:01:52 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4GCb-000XuW-2B;
	Fri, 25 Oct 2024 09:01:49 +0000
Date: Fri, 25 Oct 2024 17:01:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [dhowells-fs:netfs-writeback 27/30] fs/afs/file.c:357
 afs_issue_read() warn: passing a valid pointer to 'PTR_ERR'
Message-ID: <202410251654.LD7CMJ6p-lkp@intel.com>
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
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-writeback
head:   d206dc1726472ebe2d929cc1ee51e4c272707977
commit: 5d3a97d9f8785ae6e48b12908966f4b82c054f06 [27/30] afs: Make {Y,}FS.FetchData an asynchronous operation
:::::: branch date: 11 hours ago
:::::: commit date: 2 days ago
config: parisc-randconfig-r071-20241024 (https://download.01.org/0day-ci/archive/20241025/202410251654.LD7CMJ6p-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410251654.LD7CMJ6p-lkp@intel.com/

smatch warnings:
fs/afs/file.c:357 afs_issue_read() warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +357 fs/afs/file.c

5d3a97d9f8785ae David Howells  2024-10-10  321  
d2ddc776a4581d9 David Howells  2017-11-02  322  /*
d2ddc776a4581d9 David Howells  2017-11-02  323   * Fetch file data from the volume.
d2ddc776a4581d9 David Howells  2017-11-02  324   */
5d3a97d9f8785ae David Howells  2024-10-10  325  static void afs_issue_read(struct netfs_io_subrequest *subreq)
d2ddc776a4581d9 David Howells  2017-11-02  326  {
e49c7b2f6de7ff8 David Howells  2020-04-10  327  	struct afs_operation *op;
007b0b9c4879d02 David Howells  2024-10-10  328  	struct afs_vnode *vnode = AFS_FS_I(subreq->rreq->inode);
007b0b9c4879d02 David Howells  2024-10-10  329  	struct key *key = subreq->rreq->netfs_priv;
d2ddc776a4581d9 David Howells  2017-11-02  330  
3b6492df4153b85 David Howells  2018-10-20  331  	_enter("%s{%llx:%llu.%u},%x,,,",
d2ddc776a4581d9 David Howells  2017-11-02  332  	       vnode->volume->name,
d2ddc776a4581d9 David Howells  2017-11-02  333  	       vnode->fid.vid,
d2ddc776a4581d9 David Howells  2017-11-02  334  	       vnode->fid.vnode,
d2ddc776a4581d9 David Howells  2017-11-02  335  	       vnode->fid.unique,
007b0b9c4879d02 David Howells  2024-10-10  336  	       key_serial(key));
d2ddc776a4581d9 David Howells  2017-11-02  337  
007b0b9c4879d02 David Howells  2024-10-10  338  	op = afs_alloc_operation(key, vnode->volume);
5cbf03985c67c7f David Howells  2020-02-06  339  	if (IS_ERR(op)) {
007b0b9c4879d02 David Howells  2024-10-10  340  		subreq->error = PTR_ERR(op);
007b0b9c4879d02 David Howells  2024-10-10  341  		netfs_read_subreq_terminated(subreq);
007b0b9c4879d02 David Howells  2024-10-10  342  		return;
5cbf03985c67c7f David Howells  2020-02-06  343  	}
d2ddc776a4581d9 David Howells  2017-11-02  344  
e49c7b2f6de7ff8 David Howells  2020-04-10  345  	afs_op_set_vnode(op, 0, vnode);
76a5cb6fc1e22a2 David Howells  2018-04-06  346  
007b0b9c4879d02 David Howells  2024-10-10  347  	op->fetch.subreq = subreq;
e49c7b2f6de7ff8 David Howells  2020-04-10  348  	op->ops		= &afs_fetch_data_operation;
^1da177e4c3f415 Linus Torvalds 2005-04-16  349  
ee4cdf7ba857a89 David Howells  2024-07-02  350  	trace_netfs_sreq(subreq, netfs_sreq_trace_submit);
5d3a97d9f8785ae David Howells  2024-10-10  351  
5d3a97d9f8785ae David Howells  2024-10-10  352  	if (subreq->rreq->origin == NETFS_READAHEAD ||
5d3a97d9f8785ae David Howells  2024-10-10  353  	    subreq->rreq->iocb) {
5d3a97d9f8785ae David Howells  2024-10-10  354  		op->flags |= AFS_OPERATION_ASYNC;
5d3a97d9f8785ae David Howells  2024-10-10  355  
5d3a97d9f8785ae David Howells  2024-10-10  356  		if (!afs_begin_vnode_operation(op)) {
5d3a97d9f8785ae David Howells  2024-10-10 @357  			subreq->error = PTR_ERR(op);
5d3a97d9f8785ae David Howells  2024-10-10  358  			netfs_read_subreq_terminated(subreq);
5d3a97d9f8785ae David Howells  2024-10-10  359  			afs_put_operation(op);
5d3a97d9f8785ae David Howells  2024-10-10  360  			return;
^1da177e4c3f415 Linus Torvalds 2005-04-16  361  		}
9b3f26c9110dcea David Howells  2009-04-03  362  
5d3a97d9f8785ae David Howells  2024-10-10  363  		if (!afs_select_fileserver(op)) {
5d3a97d9f8785ae David Howells  2024-10-10  364  			afs_end_read(op);
5d3a97d9f8785ae David Howells  2024-10-10  365  			return;
5d3a97d9f8785ae David Howells  2024-10-10  366  		}
5d3a97d9f8785ae David Howells  2024-10-10  367  
5d3a97d9f8785ae David Howells  2024-10-10  368  		afs_issue_read_call(op);
5d3a97d9f8785ae David Howells  2024-10-10  369  	} else {
5d3a97d9f8785ae David Howells  2024-10-10  370  		afs_do_sync_operation(op);
5d3a97d9f8785ae David Howells  2024-10-10  371  	}
2e45b922977c07b David Howells  2024-06-13  372  }
2e45b922977c07b David Howells  2024-06-13  373  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
