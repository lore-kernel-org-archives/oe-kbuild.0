Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EEF184F
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Nov 2024 09:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732958620; cv=none; b=fKoGSsYVFasjlmbpB3aqd3BGgzm6192GTAqAS6LOaeqfBWlFMb38BCKp+ZcpzzlH5liRgNcaOYVXIluDX0AkHz72cwoSwoKx1SB1dEsj8lEXM8RxVWkXtDu7VZpZFjJOvKGTL35J+SE2E15DXejcz3XEdqzQkg/XkYY3TLtfkbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732958620; c=relaxed/simple;
	bh=2OUJ9SDYuxvrAszaGJx5goSgwzTBjfsfjjDOxlDI73o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JJLC7TCW2/42Etu2a/FcjRTgDuoRfmqrQ0Dr4hT39H2vEqvL/t2cxSE0IvtKPww9lbQ2G62FoixqJ+HpUI2c61TK7JzKs1th27gYtYO2K/2C3nm933NqB3vLFWcqe1B0iZjs2M5gtEbPLY+gbJF0VNWD4u4aFyrgIs36MOVtiKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F079CVNE; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F079CVNE"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d0cd8a0e91so410081a12.3
        for <oe-kbuild@lists.linux.dev>; Sat, 30 Nov 2024 01:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732958615; x=1733563415; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wNn0N9jDq1p/ntWtIe2lUxsxzv49kXbS9L8bGEae5TY=;
        b=F079CVNEJF0bpBOoT2JEN6RXltfd59MC1taE2zHZRN7iU6V8sS3WvNrEGIcAyrX5Vr
         jSD51n+K4o1sJK18dwYKqFyMDCOHFvOHUg9PUA/eXsYFKjPPvVA4soYB/3wEn9pBw5X5
         EQr5UeVVCsgK4BV5dmXUAuPhEbgTrUBr65R05Kx4qtvdL8NbudOY4k5SVJJkbIX45zne
         SGWv+irVWnNdl4osW0dFbGXXKtVhj4tr6LT++XZE4Po2lgMKTOCjZOlH9iS8IEeaz1BE
         om/DM97H9Ui9wUMEwhQK5/AwxjaLzKsC2ZD0Ucf/PdU/mY/3gJBBEo7n5tge7Z2M3jfk
         v3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732958615; x=1733563415;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wNn0N9jDq1p/ntWtIe2lUxsxzv49kXbS9L8bGEae5TY=;
        b=mPeGRI19W0fz94FgTUm9gJ3aALWjUHXwt71jvsYGdouWkbfU4NEypO2l9wIUvAgnus
         K6UE/4QVrTt5QwB291IbbeKuB+TrFIFDr5pIXBRTwmWgI4HtZQnp8WCHodFb/1saJIsm
         /xlbvWJb/uQdiIKyahsJ4tYEhZ4thplZtqu6durRnhdqr4B70DygH6SEsJxMlb9IwZOk
         KadZgsgoJbFFDnfSycvzkjfkFLC5933a6OxHL8GuZoxJp2RCnI/Nra31Boba6BwGmbS1
         CmHtKtPeXfSxeGF35/voTPJB03kdRES67h+SjSPfrAmGTSEKYldYerC85lFVVQq+0xMV
         fD+A==
X-Gm-Message-State: AOJu0YzsJ9Y08Xmy8mBJzee2KMu7JCN9pwha7FA0rqld13++dVkGorAe
	zVyPuTByVmRIqLIFeWuMAN+d8HO+33jgrUpwMfCJD4hKg5JESWnon0l6R06n70FaUD4TAqEefOW
	URplntQ==
X-Gm-Gg: ASbGnctzKryKE8k/0pEMADsShgRsydeUGjm7Rwp1YqAAs591RONdgjj9+mDb4Cj7BVJ
	KvdiPX7k253/cHAyU1fmjmAnnJUzpSUM5YWdDHGl1nkArdhLS/rbLS2BsAqiLvIa2ccUcM++T6H
	Fva6Y9ffDp8nVPXeHdjaBu4G2jxtwhrbYoL7AiizFxPJOrkSro0uav280NEIxays7jXL7JZvGID
	ISV7X4c9a+qzxlJCWRk69+/r5NKASuLOdNTlS/UtWYowUd+nXo=
X-Google-Smtp-Source: AGHT+IExn+HuCRy5UB+VuKnRtU4BZvaKp3wYwlJ79i9R5J2BE7cmWFVMlJ7YAf6e6Ov5l7d8xM339Q==
X-Received: by 2002:a05:6402:43c9:b0:5d0:c649:b2ba with SMTP id 4fb4d7f45d1cf-5d0c649bb5bmr4090706a12.32.1732958615549;
        Sat, 30 Nov 2024 01:23:35 -0800 (PST)
Received: from localhost ([41.210.145.9])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d098330dd2sm2680751a12.14.2024.11.30.01.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 01:23:35 -0800 (PST)
Date: Sat, 30 Nov 2024 12:23:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Christoph Hellwig <hch@lst.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 89/98] fs/xfs/xfs_fsops.c:346 xfs_growfs_data()
 warn: inconsistent returns '&mp->m_growlock'.
Message-ID: <3d59369c-6c9f-4e95-b754-1c9998c96097@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   1d218c27f2f5a8c87669b49292f1fd3432112426
commit: a37a349d7a21f1c61dc54c5771a81aee04a265cd [89/98] xfs: don't allow growfs of the data device with internal RT device
config: x86_64-randconfig-161-20241123 (https://download.01.org/0day-ci/archive/20241123/202411232011.Zes6bDSz-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411232011.Zes6bDSz-lkp@intel.com/

smatch warnings:
fs/xfs/xfs_fsops.c:346 xfs_growfs_data() warn: inconsistent returns '&mp->m_growlock'.

vim +346 fs/xfs/xfs_fsops.c

^1da177e4c3f41 Linus Torvalds      2005-04-16  298  int
^1da177e4c3f41 Linus Torvalds      2005-04-16  299  xfs_growfs_data(
87444b8c267a5c Dave Chinner        2018-05-13  300  	struct xfs_mount	*mp,
87444b8c267a5c Dave Chinner        2018-05-13  301  	struct xfs_growfs_data	*in)
^1da177e4c3f41 Linus Torvalds      2005-04-16  302  {
87444b8c267a5c Dave Chinner        2018-05-13  303  	int			error = 0;
743bb4650da9e2 sandeen@sandeen.net 2008-11-25  304  
743bb4650da9e2 sandeen@sandeen.net 2008-11-25  305  	if (!capable(CAP_SYS_ADMIN))
2451337dd04390 Dave Chinner        2014-06-25  306  		return -EPERM;
cc92e7ac8d9641 Christoph Hellwig   2007-08-30  307  	if (!mutex_trylock(&mp->m_growlock))
                                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

2451337dd04390 Dave Chinner        2014-06-25  308  		return -EWOULDBLOCK;
87444b8c267a5c Dave Chinner        2018-05-13  309  
a37a349d7a21f1 Christoph Hellwig   2024-11-22  310  	/* we can't grow the data section when an internal RT section exists */
a37a349d7a21f1 Christoph Hellwig   2024-11-22  311  	if (in->newblocks != mp->m_sb.sb_dblocks && mp->m_sb.sb_rtstart)
a37a349d7a21f1 Christoph Hellwig   2024-11-22  312  		return -EINVAL;

Needs to unlock before returning.

a37a349d7a21f1 Christoph Hellwig   2024-11-22  313  
87444b8c267a5c Dave Chinner        2018-05-13  314  	/* update imaxpct separately to the physical grow of the filesystem */
87444b8c267a5c Dave Chinner        2018-05-13  315  	if (in->imaxpct != mp->m_sb.sb_imax_pct) {
87444b8c267a5c Dave Chinner        2018-05-13  316  		error = xfs_growfs_imaxpct(mp, in->imaxpct);
87444b8c267a5c Dave Chinner        2018-05-13  317  		if (error)
87444b8c267a5c Dave Chinner        2018-05-13  318  			goto out_error;
87444b8c267a5c Dave Chinner        2018-05-13  319  	}
87444b8c267a5c Dave Chinner        2018-05-13  320  
87444b8c267a5c Dave Chinner        2018-05-13  321  	if (in->newblocks != mp->m_sb.sb_dblocks) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  322  		error = xfs_growfs_data_private(mp, in);
87444b8c267a5c Dave Chinner        2018-05-13  323  		if (error)
87444b8c267a5c Dave Chinner        2018-05-13  324  			goto out_error;
87444b8c267a5c Dave Chinner        2018-05-13  325  	}
87444b8c267a5c Dave Chinner        2018-05-13  326  
87444b8c267a5c Dave Chinner        2018-05-13  327  	/* Post growfs calculations needed to reflect new state in operations */
87444b8c267a5c Dave Chinner        2018-05-13  328  	if (mp->m_sb.sb_imax_pct) {
87444b8c267a5c Dave Chinner        2018-05-13  329  		uint64_t icount = mp->m_sb.sb_dblocks * mp->m_sb.sb_imax_pct;
87444b8c267a5c Dave Chinner        2018-05-13  330  		do_div(icount, 100);
ef325959993edd Darrick J. Wong     2019-06-05  331  		M_IGEO(mp)->maxicount = XFS_FSB_TO_INO(mp, icount);
87444b8c267a5c Dave Chinner        2018-05-13  332  	} else
ef325959993edd Darrick J. Wong     2019-06-05  333  		M_IGEO(mp)->maxicount = 0;
87444b8c267a5c Dave Chinner        2018-05-13  334  
83a7f86e39ff5d Dave Chinner        2018-05-13  335  	/* Update secondary superblocks now the physical grow has completed */
b16817b66b6c97 Dave Chinner        2018-05-13  336  	error = xfs_update_secondary_sbs(mp);
83a7f86e39ff5d Dave Chinner        2018-05-13  337  
87444b8c267a5c Dave Chinner        2018-05-13  338  out_error:
527851124d10f9 Christoph Hellwig   2015-02-16  339  	/*
527851124d10f9 Christoph Hellwig   2015-02-16  340  	 * Increment the generation unconditionally, the error could be from
527851124d10f9 Christoph Hellwig   2015-02-16  341  	 * updating the secondary superblocks, in which case the new size
527851124d10f9 Christoph Hellwig   2015-02-16  342  	 * is live already.
527851124d10f9 Christoph Hellwig   2015-02-16  343  	 */
527851124d10f9 Christoph Hellwig   2015-02-16  344  	mp->m_generation++;
cc92e7ac8d9641 Christoph Hellwig   2007-08-30  345  	mutex_unlock(&mp->m_growlock);
^1da177e4c3f41 Linus Torvalds      2005-04-16 @346  	return error;
^1da177e4c3f41 Linus Torvalds      2005-04-16  347  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

