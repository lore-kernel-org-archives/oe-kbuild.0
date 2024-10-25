Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37922231C8C
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Oct 2024 12:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729859741; cv=none; b=RnaiC4HyM4AtyYvASavsZhmaMWyvTGhKRrSsii0QyjVzlOM5ouTdGXQaBn3YDo75yHUqhziKdL2/haDZEz6nsiWt6BrQDFKjY8ootDMmgXcvFHkxCS2rhnMrXrQYIMnJvirR6NY/7SN3y4D4xuJ3VLh7i8aUuVZ9DthIhmCEaXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729859741; c=relaxed/simple;
	bh=4HTabHm6uq2U9kuy/FX+DhWo0MKtiWH7xXMbmFYZPfE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o+QbGSbBPGhndUJHn22MrfyjHPyQb7Du+B7mtx/CHA81of5PLlLbKBXAe0+cY8+yhnUF/5UpUVWRVar2SVfR/s6RVOViVp+P1qbx426rDXGfCsi95jPamC0UHy6FffM7GwCrhqwdslz+eygypU4NRzjMD5kPMuelPYx/QXOlSTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lTLVIN09; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lTLVIN09"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43152b79d25so18444135e9.1
        for <oe-kbuild@lists.linux.dev>; Fri, 25 Oct 2024 05:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729859737; x=1730464537; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zsi0HlGorCdhFNoZKJKnZhVtYZ+RxTZZw6H3FS+EvDI=;
        b=lTLVIN09Jxtack9u6nFLDnAzWhsA/kFR8R+qTgEQMl9wPC8XyLRb3WUha9uazrEaxt
         Wyy2h9pe0pDc72k8Fs9TT0eNG0gsSMzKdnjVgqupB7VlR0zlmU2tz0C8Jipg4hc1zQLL
         0ZySEDVS7qjAX3S49+OA7kZynPYrlAXZqgkY54d6UKl/bgUQ8bvePF2J4/eeaFp5/rUr
         aNtB7r9v2dG6BUPRHdyIe0tV2JWB2zPzJk+YKZ204IhQDq7QfdYWrHm9rlC1EtIRHNSo
         ObfFDYPU3amegNuGpPr74QmdAqG9N+UdKvLDJsIxugWTDsolpl7SItdxtNVqvlSIWGg0
         2isw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729859737; x=1730464537;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zsi0HlGorCdhFNoZKJKnZhVtYZ+RxTZZw6H3FS+EvDI=;
        b=n8UodrzGmsHQbaJlR8oWkx+ZF8o8aLaXE5QT8Z7gY/FlZN+XXERhYCOQTsBHiVXhkt
         opIt/9MNburG1kPRolzNpbwtuqnKs3Lp2TB8FB2SZ1T+qbaisLp1aWrQiOsX1i46hasO
         5eaq297Y6cR9G1jmDK1e6GMUraodytUJK8amLg5sdmdFQaKrp6yRB58PjgtXA3gtAqsV
         M7dOChsG9/lN2UW269X9XCyEjWrv/jor18a5zirkUH/vdlOXz380wdeT1t2zhMC0NGEN
         e/XbMfYb6IzD88CpTrK0G+e/lo/gtl/u5wL+4jrHpdAMbnH8key6j2UqCIdpk4mLRnhf
         y8wQ==
X-Gm-Message-State: AOJu0Yw7CldjDjnGJY20KsvSoOuUjNnAOTyFSC/0ohzY/0hji8HA97e3
	Cnc0gTa1kxv6PqTHn7+Hb9E/smnH6VlzvdI0RDXMv5EJEJZNRiqGNiOV/oimM/tK7zRe7xbCxqA
	kIV9ABg==
X-Google-Smtp-Source: AGHT+IFI0XXiX/oiuZ2raUpET+Y0yapjTM7Z/v2ZlaNNFoJzvokopxF2WuPgjexVfb9DGfu/LWhe3Q==
X-Received: by 2002:a05:600c:4f11:b0:431:5ce4:bcf0 with SMTP id 5b1f17b1804b1-4318415a851mr73131645e9.15.1729859737247;
        Fri, 25 Oct 2024 05:35:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b579613sm46540545e9.38.2024.10.25.05.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 05:35:36 -0700 (PDT)
Date: Fri, 25 Oct 2024 15:35:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, David Howells <dhowells@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-writeback 27/30] fs/afs/file.c:357
 afs_issue_read() warn: passing a valid pointer to 'PTR_ERR'
Message-ID: <35a3ef96-c550-4792-bd32-0b3eae11a3eb@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-writeback
head:   d206dc1726472ebe2d929cc1ee51e4c272707977
commit: 5d3a97d9f8785ae6e48b12908966f4b82c054f06 [27/30] afs: Make {Y,}FS.FetchData an asynchronous operation
config: parisc-randconfig-r071-20241024 (https://download.01.org/0day-ci/archive/20241025/202410251654.LD7CMJ6p-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410251654.LD7CMJ6p-lkp@intel.com/

smatch warnings:
fs/afs/file.c:357 afs_issue_read() warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +357 fs/afs/file.c

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
                                                                ^^^^^^^^^
op is a valid pointer

5d3a97d9f8785ae David Howells  2024-10-10  355  
5d3a97d9f8785ae David Howells  2024-10-10  356  		if (!afs_begin_vnode_operation(op)) {
5d3a97d9f8785ae David Howells  2024-10-10 @357  			subreq->error = PTR_ERR(op);
                                                                                        ^^^^^^^^^^^

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

