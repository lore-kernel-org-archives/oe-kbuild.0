Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A0F2D73A0
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Oct 2025 06:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760941780; cv=none; b=OnEyj+d994e/nuMt+wLgWfiHxF8xWcjFyhXXljH7Frhq/ItPjhVfIss/91lXfWKN7CZ0JzK5bb1JO6+jI36OTrpkR0+vkSxtYC5tF0DLKWwIFJNq1Zx/xITgWKHBPtwP6ZsSMK0qPghspBOrBG9VhygzgUdm6ejpnoLPunb3X2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760941780; c=relaxed/simple;
	bh=udk3k7ObJvIEyo8P+QOU+sJiaWVThCCWsFLntmII6L4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uAyHK4+TvLj9uj1ODvyIIJ+7c782Phs37G+KyVIEMuZRKZ9gzsIHYi633tpTW2AVt1AhrQ7R9+Gy3GWBACVzuQbif79eVJNpqQJBuSbMJYgkxPMP5vbun3mwhRDXU+qtgZdnbtCQEdTnwvP6gdjPg14aMOccDG9YTYviqmllQVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MBrteQjo; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MBrteQjo"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47117e75258so12924095e9.2
        for <oe-kbuild@lists.linux.dev>; Sun, 19 Oct 2025 23:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760941776; x=1761546576; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AENtfqm7fCc0ByQJAMOVqtYesHku2gL+nKne67rKp4c=;
        b=MBrteQjoTQtWg6cg/Je/VAR1ve2Ji9pimFBZV45Q7uhuk7T7t4FUeLS07Qxtf/r4Vs
         lCIIk68ez8/rVZge9pGqyX/3j45E/Yl7yfd9Kfn/4lhZyvMd1H5cZgthImWMtsOqp2lS
         G2buo8ij0uAyfqsB+jTnssWoMn6smOAsrNqYdtvUueTwepknXbnhFh2XfmUyA4Fu9wf1
         cAW3IZ8xw3/kZd+VsUxumeEiCbBuCAqSiuytp1pEevTWeTVQwFFbdn9FGbFM1Oiuz8jY
         9+fubNeVsIM9BKRdg1xkn2kj5URu2/0FpTVm0TFY1K762n+1KrQW13bGN44CTDJgy24S
         XWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760941776; x=1761546576;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AENtfqm7fCc0ByQJAMOVqtYesHku2gL+nKne67rKp4c=;
        b=ri51OMNGSCfsSobiCRkw5uzBzn3UMLYDkZjvUMWmEPJS7UHynO2dXiRkOpBPBa95SP
         mrryO1M8loIY+FarOlEEcIeD89/qR4RYKGqk03JzwdTuvpTAAJGTukqen9/H/6zvHG0T
         t5Oh3c80O4i5xi9Vo1PDfn+yGTqJ723oQeoAS6izDhjoYTQwuSMj/P+c9bqfO5wifNuB
         J6vmpcRcnkj8rSQhoLpD/mKLkONPcftXBFB86jKTXPrz9Ux3bvGl7Co9Ym0w2Fw8vIWA
         8NvVkfVW8eAuG97NslQK8o2JHKKp1U41m7cRVfW9XWJYCglAlujZv1bod7TXcnap24He
         FF+A==
X-Gm-Message-State: AOJu0YzaWvkbmKnjNLt1L6eyK9cnHgEE0v/I+XpUZZYRdyQ5cwU0kDaz
	xUmLpPXbPQPZbqea0GhlVnG53BZMlryo07ntJ8m0wx4Ufc7II73dsjkiuXkTyhbxZV3xOKsXIRf
	svqZT
X-Gm-Gg: ASbGncttjA+pCRpntY4++f4LrW+XaBAyPNvwSSwHWMrNCHmqvpP4GTbLHESX3Y3X/qM
	TaXcaJGfiWkQEPpmQsPCNVWYpuCJlF8CYGZ4XarkmpanAdMhTCsrFIznpPG/rcd7epvL1HeX8EO
	mLnRBYlg7XmCenKq/+1D0DTGWpwg9ArTowur8tjrXCphgG1w3nEnCL94L4wNY+F3pTjdUM7PQlV
	/aFN6O1lEBoV9gFuaei6BP8CiVzbtzX5rp+Rae4hMDIx8Qg67m2WfjcA7Vt//s0b00qLMkBtwC7
	Q42mbckdtQKs9w39F1zKYqxo3Yk4QlZdZiHkrRYGy7BYrHb+vVGdrftI6eh3V2lBOzdm/pYw8SK
	6z3rrV8S0VMI03uou/lqPTSfoIbrnkfXWI1wogoZGQRV7uewyg8Qk0cHMwI7Pohxd1EdBhghzMh
	IIECyCs01/0S02sL8X
X-Google-Smtp-Source: AGHT+IFAUlxx+9ASzEV8INhjqW/865AJBvjcIWxTSbEQB6B7cZqmRyJjapRBtUKDjh0rm6XQxmt1UA==
X-Received: by 2002:a05:600c:8185:b0:46f:b43a:aeed with SMTP id 5b1f17b1804b1-4711792cc0cmr81785195e9.40.1760941776102;
        Sun, 19 Oct 2025 23:29:36 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-471144c82c9sm214449875e9.14.2025.10.19.23.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 23:29:35 -0700 (PDT)
Date: Mon, 20 Oct 2025 09:29:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Christoph Hellwig <hch@lst.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-quota-cleanups 10/20] fs/xfs/xfs_qm.c:1307
 xfs_qm_quotacheck_dqadjust() warn: inconsistent returns '&dqp->q_qlock'.
Message-ID: <202510191616.ecg6r6ZD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251020062931.W0Lx2h8z9N-J7OPGrZpJF_HWzj-zxbyUwTot55_43DM@z>

tree:   git://git.infradead.org/users/hch/xfs xfs-quota-cleanups
head:   65122be191ff384c885bb15ab86d84951a501c49
commit: bac6d7a22f577467f49a0696ca995957f78b5caa [10/20] xfs: return the dquot unlocked from xfs_qm_dqget
config: i386-randconfig-141-20251015 (https://download.01.org/0day-ci/archive/20251019/202510191616.ecg6r6ZD-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510191616.ecg6r6ZD-lkp@intel.com/

smatch warnings:
fs/xfs/xfs_qm.c:1307 xfs_qm_quotacheck_dqadjust() warn: inconsistent returns '&dqp->q_qlock'.

vim +1307 fs/xfs/xfs_qm.c

52fda1142495783 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2010-09-06  1248  STATIC int
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1249  xfs_qm_quotacheck_dqadjust(
52fda1142495783 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2010-09-06  1250  	struct xfs_inode	*ip,
1a7ed271653a4f4 fs/xfs/xfs_qm.c       Darrick J. Wong   2020-07-15  1251  	xfs_dqtype_t		type,
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1252  	xfs_qcnt_t		nblks,
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1253  	xfs_qcnt_t		rtblks)
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1254  {
52fda1142495783 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2010-09-06  1255  	struct xfs_mount	*mp = ip->i_mount;
52fda1142495783 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2010-09-06  1256  	struct xfs_dquot	*dqp;
0fcef1270f309df fs/xfs/xfs_qm.c       Darrick J. Wong   2018-05-04  1257  	xfs_dqid_t		id;
52fda1142495783 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2010-09-06  1258  	int			error;
52fda1142495783 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2010-09-06  1259  
0fcef1270f309df fs/xfs/xfs_qm.c       Darrick J. Wong   2018-05-04  1260  	id = xfs_qm_id_for_quotatype(ip, type);
30ab2dcf2c0693e fs/xfs/xfs_qm.c       Darrick J. Wong   2018-05-04  1261  	error = xfs_qm_dqget(mp, id, type, true, &dqp);
52fda1142495783 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2010-09-06  1262  	if (error) {
52fda1142495783 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2010-09-06  1263  		/*
52fda1142495783 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2010-09-06  1264  		 * Shouldn't be able to turn off quotas here.
52fda1142495783 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2010-09-06  1265  		 */
2451337dd043901 fs/xfs/xfs_qm.c       Dave Chinner      2014-06-25  1266  		ASSERT(error != -ESRCH);
2451337dd043901 fs/xfs/xfs_qm.c       Dave Chinner      2014-06-25  1267  		ASSERT(error != -ENOENT);
52fda1142495783 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2010-09-06  1268  		return error;
52fda1142495783 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2010-09-06  1269  	}
0b1b213fcf3a848 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2009-12-14  1270  
bac6d7a22f57746 fs/xfs/xfs_qm.c       Christoph Hellwig 2025-09-20  1271  	mutex_lock(&dqp->q_qlock);
ca378189fdfa890 fs/xfs/xfs_qm.c       Darrick J. Wong   2024-12-02  1272  	error = xfs_dquot_attach_buf(NULL, dqp);
ca378189fdfa890 fs/xfs/xfs_qm.c       Darrick J. Wong   2024-12-02  1273  	if (error)
ca378189fdfa890 fs/xfs/xfs_qm.c       Darrick J. Wong   2024-12-02  1274  		return error;

Unlock before returning?

ca378189fdfa890 fs/xfs/xfs_qm.c       Darrick J. Wong   2024-12-02  1275  
0b1b213fcf3a848 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2009-12-14  1276  	trace_xfs_dqadjust(dqp);
0b1b213fcf3a848 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2009-12-14  1277  
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1278  	/*
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1279  	 * Adjust the inode count and the block count to reflect this inode's
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1280  	 * resource usage.
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1281  	 */
be37d40c1ba0b54 fs/xfs/xfs_qm.c       Darrick J. Wong   2020-07-14  1282  	dqp->q_ino.count++;
784e80f5640db9a fs/xfs/xfs_qm.c       Darrick J. Wong   2020-07-14  1283  	dqp->q_ino.reserved++;
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1284  	if (nblks) {
be37d40c1ba0b54 fs/xfs/xfs_qm.c       Darrick J. Wong   2020-07-14  1285  		dqp->q_blk.count += nblks;
784e80f5640db9a fs/xfs/xfs_qm.c       Darrick J. Wong   2020-07-14  1286  		dqp->q_blk.reserved += nblks;
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1287  	}
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1288  	if (rtblks) {
be37d40c1ba0b54 fs/xfs/xfs_qm.c       Darrick J. Wong   2020-07-14  1289  		dqp->q_rtb.count += rtblks;
784e80f5640db9a fs/xfs/xfs_qm.c       Darrick J. Wong   2020-07-14  1290  		dqp->q_rtb.reserved += rtblks;
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1291  	}
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1292  
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1293  	/*
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1294  	 * Set default limits, adjust timers (since we changed usages)
191f8488f9f7600 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2010-04-20  1295  	 *
191f8488f9f7600 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2010-04-20  1296  	 * There are no timers for the default values set in the root dquot.
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1297  	 */
c51df7334167e44 fs/xfs/xfs_qm.c       Darrick J. Wong   2020-07-14  1298  	if (dqp->q_id) {
c8c753e19a76507 fs/xfs/xfs_qm.c       Darrick J. Wong   2020-07-14  1299  		xfs_qm_adjust_dqlimits(dqp);
c8c753e19a76507 fs/xfs/xfs_qm.c       Darrick J. Wong   2020-07-14  1300  		xfs_qm_adjust_dqtimers(dqp);
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1301  	}
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1302  
985a78fdde15e17 fs/xfs/xfs_qm.c       Darrick J. Wong   2020-07-14  1303  	dqp->q_flags |= XFS_DQFLAG_DIRTY;
53d33c2d3e82492 fs/xfs/xfs_qm.c       Christoph Hellwig 2025-09-20  1304  	mutex_unlock(&dqp->q_qlock);
53d33c2d3e82492 fs/xfs/xfs_qm.c       Christoph Hellwig 2025-09-20  1305  
53d33c2d3e82492 fs/xfs/xfs_qm.c       Christoph Hellwig 2025-09-20  1306  	xfs_qm_dqrele(dqp);
52fda1142495783 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2010-09-06 @1307  	return 0;
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1308  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

