Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51250215191
	for <oe-kbuild@lists.linux.dev>; Fri,  2 May 2025 07:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746170399; cv=none; b=ssU/Pr6SjPXsKo+P0o3Ir+lQk+lD4S9XWalcJCGS8qSXWSsDc+1Cl39WqhvylwahmI75O3XOGJnMPKkAoKRSJHOecd2cLo4kEucIxsYcILJDiLefGfFyPaaczuZGElO9I4XdVVM3Xgblyk5hoI13VpOonXlElOqbPw21gM254Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746170399; c=relaxed/simple;
	bh=7svvXKZyt3CpDllEutMwF7i7TxexA5q2cPidV80T7KQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LOo6UAztWLRz8ar8RQT320PA+Uu2/zlhhXQS/UZN0YWqetQaD6x4MCvmyaU5BR7fFmBHifZNwYiVpB1oRn+vqPGpCHZYX4mZOKDIMmt6kINsw/tRIMvwdqdaP1yM495JKztlM86+MOFphsJ8sAR+oh6jfqwN7A3e39Du0e3y3h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EssGAf1Z; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EssGAf1Z"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so9908615e9.1
        for <oe-kbuild@lists.linux.dev>; Fri, 02 May 2025 00:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746170395; x=1746775195; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DoAPJg2r5FlDefbebBm+I95ftEidF+IQG+sXrrq12+4=;
        b=EssGAf1ZAu1GSG1SI1r7W7qoyF+8+xnPLF2bX2xhPI2E9OeFLpkJfYMYTvAHs5uF0+
         7aPm6B/Hzf2ftluuWYB6KXIsxPfMc+650t4oNWn0m/ZqYCpy2WmjW4OS4hK5Ghs+hN95
         h+ixbkwSBqU+oPJgDr8ifPqC/zYxZUt9YVFkj7WFmR6Uxk3jHIkWdRktNIDJXdRYZzDQ
         TXv73gRUOhQVWD69/pwcon20NwdXUTRmvlj7JduVO0hfenr9EHOdqEphNUUOkTmA+Ew5
         iNPVQN1gpM7fG63jKyxH66qLxSAMOGDgwUkvgjAKfa7yUZqYqqFxQCOEfgVxejQhVQy3
         bRRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746170395; x=1746775195;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DoAPJg2r5FlDefbebBm+I95ftEidF+IQG+sXrrq12+4=;
        b=ag91YpLRUokv8aj6nMwVWwGot1wn8Wxhawk2m/VLxz/NbR3OGrSag2PT7f6PdOOH9U
         0Qn/o+j1p4Dw4LDtIX8IkP5EG2KJfmgSaLTJClwjyLOdeRwHLwkOAFyZvIvOsu3KXfR6
         NdmGJWHDqrPzZgevtOgT62EbXA0h9RzC3Nri2ToKQJdRspyXYm/p8EZQDzoUSIxXhRye
         9u+DOER0QRdkgpcezEjoNZEMhQ2o2ZzOA5kh/QtZdLjQRGNsn4Gt6Ilp+EDMRBpFKDO4
         l8UzJjHCqoTYPTDrChmKjsroQUHWQLAl+V5qSu1YxNARHmRZK60a5BSrDHUuGahcc8er
         4/Dg==
X-Gm-Message-State: AOJu0YzDp59BcViP7W+uSCfuDivxE8n2siW8ylXrulhJa1I8lhWHWaVN
	fuou6KlMatLSlmGqBXdyeN0vr1mDLu1wsm7eQmCk6F6P1wZ5onrm78BnwnHSgLGb9fe8dalsf7z
	l
X-Gm-Gg: ASbGnctMXilO8KAKmwgKk/tn646p9tUwtRgNAVd86mK+OFadESqTu3u5WFNaWPGvTc8
	iemWq6RJXHQQke/uxjxhitLE7zJ1RxHOIhUMLdZGJBpzc+e7lIZhaLSLEXIBfs7Tr6pSgQ3ZUUy
	4dzTBZkE+q7rCpXAmkMS9Efn+l2THT0z5AXTeqS+OzH6GgEqziYasRbeduzM+GqZOAmB1sB5esY
	sdMuP+DKp9DqV1IZSRAhpuLm9qXt0FIKS/2qQgEhy4g890wj9TaVqhLOe+fqGSqcB7A8d27IcSx
	NnzXSlg/KUXLoNR5D6dfv2e8QRlB/zgt2kUgNQ9Ope9tzA==
X-Google-Smtp-Source: AGHT+IGDXqkfe1u2yqMqpOu/6VDE/AYit1pb3gLMDmFZ8TpsxF7u4SMYespa5oXz9q5Gnr1AdFduxQ==
X-Received: by 2002:a05:600c:3495:b0:43d:585f:ebf5 with SMTP id 5b1f17b1804b1-441bbea0d60mr11313255e9.1.1746170395366;
        Fri, 02 May 2025 00:19:55 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b8a315c8sm34682415e9.35.2025.05.02.00.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 00:19:54 -0700 (PDT)
Date: Fri, 2 May 2025 10:19:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [isilence:tx-tstamp 5/8] io_uring/poll.c:713 io_arm_poll_handler()
 warn: if statement not indented
Message-ID: <202505021022.SUf8vLiH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20250502071951.Jb8-X5WVms4ys2gIZhN-36mkaXugIvD2qT_lyXY7sy4@z>

tree:   https://github.com/isilence/linux tx-tstamp
head:   6f5b01cc66b200d99c494caaa62f429268923263
commit: 275ff22a8d4d1524bbf3b6514af8ab291d682a6b [5/8] io_uring/poll: introduce io_arm_apoll()
config: x86_64-randconfig-161-20250502 (https://download.01.org/0day-ci/archive/20250502/202505021022.SUf8vLiH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505021022.SUf8vLiH-lkp@intel.com/

smatch warnings:
io_uring/poll.c:713 io_arm_poll_handler() warn: if statement not indented

vim +713 io_uring/poll.c

275ff22a8d4d15 Pavel Begunkov 2025-04-27  699  int io_arm_poll_handler(struct io_kiocb *req, unsigned issue_flags)
275ff22a8d4d15 Pavel Begunkov 2025-04-27  700  {
275ff22a8d4d15 Pavel Begunkov 2025-04-27  701  	const struct io_issue_def *def = &io_issue_defs[req->opcode];
275ff22a8d4d15 Pavel Begunkov 2025-04-27  702  	__poll_t mask = POLLPRI | POLLERR | EPOLLET;
275ff22a8d4d15 Pavel Begunkov 2025-04-27  703  
275ff22a8d4d15 Pavel Begunkov 2025-04-27  704  	if (!def->pollin && !def->pollout)
275ff22a8d4d15 Pavel Begunkov 2025-04-27  705  		return IO_APOLL_ABORTED;
275ff22a8d4d15 Pavel Begunkov 2025-04-27  706  	if (!io_file_can_poll(req))
275ff22a8d4d15 Pavel Begunkov 2025-04-27  707  		return IO_APOLL_ABORTED;
275ff22a8d4d15 Pavel Begunkov 2025-04-27  708  
275ff22a8d4d15 Pavel Begunkov 2025-04-27  709  	if (def->pollin) {
275ff22a8d4d15 Pavel Begunkov 2025-04-27  710  		mask |= EPOLLIN | EPOLLRDNORM;
275ff22a8d4d15 Pavel Begunkov 2025-04-27  711  
275ff22a8d4d15 Pavel Begunkov 2025-04-27  712  		/* If reading from MSG_ERRQUEUE using recvmsg, ignore POLLIN */
275ff22a8d4d15 Pavel Begunkov 2025-04-27 @713  		if (req->flags & REQ_F_CLEAR_POLLIN)
275ff22a8d4d15 Pavel Begunkov 2025-04-27  714  		mask &= ~EPOLLIN;

Missing tab.

275ff22a8d4d15 Pavel Begunkov 2025-04-27  715  	} else {
275ff22a8d4d15 Pavel Begunkov 2025-04-27  716  		mask |= EPOLLOUT | EPOLLWRNORM;
275ff22a8d4d15 Pavel Begunkov 2025-04-27  717  	}
275ff22a8d4d15 Pavel Begunkov 2025-04-27  718  	if (def->poll_exclusive)
275ff22a8d4d15 Pavel Begunkov 2025-04-27  719  		mask |= EPOLLEXCLUSIVE;
275ff22a8d4d15 Pavel Begunkov 2025-04-27  720  
275ff22a8d4d15 Pavel Begunkov 2025-04-27  721  	return io_arm_apoll(req, issue_flags, mask);
275ff22a8d4d15 Pavel Begunkov 2025-04-27  722  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

