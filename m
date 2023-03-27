Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2567E7EA;
	Mon, 27 Mar 2023 05:08:25 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id t4so2052657wra.7;
        Sun, 26 Mar 2023 22:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679893703;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IyBihHAMwDtpB+yMetgmFHwIvTaFWZc9kpl7l4ASEiY=;
        b=azC52JiRb/kKJwV0DjQ4ze5UTQf8725aC+vbD3yRSCymwS9rc1ime+TZ5pTC+G2COh
         ay+I2jccjFaxPd+AHMGCLhE8v7v3sgY8w7Jl3Jm6QxxeSSgCbdJum4/z8X613MGXal6m
         4FeU0ojqs1XVZaeUlAkQlGZWC350q/PPFQQzzQTocNW7ehoujax/9/pFrsPmKCs/yGoJ
         edBo2Ogd/YMEDdAMKLB4b9uzNP4weqKEXkpfdjIA7pvAtxvzTgrkUPvLao8Wxk4z1Lxz
         I3Vjqeix9eh7N+1aud4ukK0Mf+MYzSoiBxflUIMslUKTwmPftID1+AbxyVaoHtcOSXIf
         yOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679893703;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IyBihHAMwDtpB+yMetgmFHwIvTaFWZc9kpl7l4ASEiY=;
        b=lGxYG3NnnzhkQcTWwa6pot4EFxbg9/XWUlvq7ebVWOe7bGBDyhRcDalcelOOy40ej1
         XMnvmlsNPqEUOWrbJ1GBUDM4AaO/BKLWfAy8iiHH6yRMpk2995qd1qaJcKhzj/iijCEv
         pUzSzqQVRSnOLmOLaShokxGVUmQ2iG0cV+/Utbxf+GM29zvPLdE5MOi+SVd4WU19z5Er
         cLV3pu+bpG5DWK4OY1Mh8Sa93kQeT/9a7xIRYQqdqxN6t7a2ZncGMf+I8I0HKTxgByX7
         WcZm/W/XPkgj5CexjrkBwHgPWY5mfp4tsKKsyDVDnula830s3dVVxhPyyWjU/NeZt288
         YeuA==
X-Gm-Message-State: AAQBX9dbGjFA1khC+3vT7P18tZlqVXd4Dk17EuTJQvAMWuaWM/Al8GM5
	SCl7B+H04K3aBgNHyEKzKoGSGTVVfjs=
X-Google-Smtp-Source: AKy350bJ87EeM1gDGaHYXbrJ4YQnTmZQTylER5+oiQhEBFtj/fe8JIWga3vOYPY8WOIyfkoKZbGc1A==
X-Received: by 2002:adf:fec2:0:b0:2d2:39d3:ce78 with SMTP id q2-20020adffec2000000b002d239d3ce78mr6806800wrs.10.1679893703038;
        Sun, 26 Mar 2023 22:08:23 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l18-20020a05600c4f1200b003ef67848a21sm5487944wmq.13.2023.03.26.22.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 22:08:22 -0700 (PDT)
Date: Mon, 27 Mar 2023 08:08:19 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:xfile-page-caching 171/287]
 fs/xfs/scrub/nlinks_repair.c:91 xrep_nlinks_repair_inode() warn: missing
 error code 'error'
Message-ID: <99e091a0-2a47-49db-abb8-733b3eb0bc09@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   10b2657dfdd633f83d3de6eba27b8e093cf0caa6
commit: 5e5ada746aad79a27ff5f0b235cac245ccc1b621 [171/287] xfs: teach repair to fix file nlinks
config: microblaze-randconfig-m041-20230326 (https://download.01.org/0day-ci/archive/20230326/202303260733.QjASwv51-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303260733.QjASwv51-lkp@intel.com/

New smatch warnings:
fs/xfs/scrub/nlinks_repair.c:91 xrep_nlinks_repair_inode() warn: missing error code 'error'

vim +/error +91 fs/xfs/scrub/nlinks_repair.c

5e5ada746aad79 Darrick J. Wong 2023-03-06   43  STATIC int
5e5ada746aad79 Darrick J. Wong 2023-03-06   44  xrep_nlinks_repair_inode(
5e5ada746aad79 Darrick J. Wong 2023-03-06   45  	struct xchk_nlink_ctrs	*xnc)
5e5ada746aad79 Darrick J. Wong 2023-03-06   46  {
5e5ada746aad79 Darrick J. Wong 2023-03-06   47  	struct xchk_nlink	obs;
5e5ada746aad79 Darrick J. Wong 2023-03-06   48  	struct xfs_scrub	*sc = xnc->sc;
5e5ada746aad79 Darrick J. Wong 2023-03-06   49  	struct xfs_mount	*mp = sc->mp;
5e5ada746aad79 Darrick J. Wong 2023-03-06   50  	struct xfs_inode	*ip = sc->ip;
5e5ada746aad79 Darrick J. Wong 2023-03-06   51  	uint64_t		total_links;
5e5ada746aad79 Darrick J. Wong 2023-03-06   52  	uint64_t		actual_nlink;
5e5ada746aad79 Darrick J. Wong 2023-03-06   53  	bool			dirty = false;
5e5ada746aad79 Darrick J. Wong 2023-03-06   54  	int			error;
5e5ada746aad79 Darrick J. Wong 2023-03-06   55  
5e5ada746aad79 Darrick J. Wong 2023-03-06   56  	xchk_ilock(sc, XFS_IOLOCK_EXCL);
5e5ada746aad79 Darrick J. Wong 2023-03-06   57  
5e5ada746aad79 Darrick J. Wong 2023-03-06   58  	error = xfs_trans_alloc(mp, &M_RES(mp)->tr_link, 0, 0, 0, &sc->tp);
5e5ada746aad79 Darrick J. Wong 2023-03-06   59  	if (error)
5e5ada746aad79 Darrick J. Wong 2023-03-06   60  		goto out_iolock;
5e5ada746aad79 Darrick J. Wong 2023-03-06   61  
5e5ada746aad79 Darrick J. Wong 2023-03-06   62  	xchk_ilock(sc, XFS_ILOCK_EXCL);
5e5ada746aad79 Darrick J. Wong 2023-03-06   63  	xfs_trans_ijoin(sc->tp, ip, 0);
5e5ada746aad79 Darrick J. Wong 2023-03-06   64  
5e5ada746aad79 Darrick J. Wong 2023-03-06   65  	mutex_lock(&xnc->lock);
5e5ada746aad79 Darrick J. Wong 2023-03-06   66  
5e5ada746aad79 Darrick J. Wong 2023-03-06   67  	if (xchk_iscan_aborted(&xnc->collect_iscan)) {
5e5ada746aad79 Darrick J. Wong 2023-03-06   68  		error = -ECANCELED;
5e5ada746aad79 Darrick J. Wong 2023-03-06   69  		goto out_scanlock;
5e5ada746aad79 Darrick J. Wong 2023-03-06   70  	}
5e5ada746aad79 Darrick J. Wong 2023-03-06   71  
5e5ada746aad79 Darrick J. Wong 2023-03-06   72  	error = xfarray_load_sparse(xnc->nlinks, ip->i_ino, &obs);
5e5ada746aad79 Darrick J. Wong 2023-03-06   73  	if (error)
5e5ada746aad79 Darrick J. Wong 2023-03-06   74  		goto out_scanlock;
5e5ada746aad79 Darrick J. Wong 2023-03-06   75  
5e5ada746aad79 Darrick J. Wong 2023-03-06   76  	/*
5e5ada746aad79 Darrick J. Wong 2023-03-06   77  	 * We're done accessing the shared scan data, so we can drop the lock.
5e5ada746aad79 Darrick J. Wong 2023-03-06   78  	 * We still hold @ip's ILOCK, so its link count cannot change.
5e5ada746aad79 Darrick J. Wong 2023-03-06   79  	 */
5e5ada746aad79 Darrick J. Wong 2023-03-06   80  	mutex_unlock(&xnc->lock);
5e5ada746aad79 Darrick J. Wong 2023-03-06   81  
5e5ada746aad79 Darrick J. Wong 2023-03-06   82  	total_links = xchk_nlink_total(&obs);
5e5ada746aad79 Darrick J. Wong 2023-03-06   83  	actual_nlink = VFS_I(ip)->i_nlink;
5e5ada746aad79 Darrick J. Wong 2023-03-06   84  
5e5ada746aad79 Darrick J. Wong 2023-03-06   85  	/*
5e5ada746aad79 Darrick J. Wong 2023-03-06   86  	 * Cannot set more than the maxiumum possible link count.  We won't
5e5ada746aad79 Darrick J. Wong 2023-03-06   87  	 * touch this file, but we don't want to abort the entire operation.
5e5ada746aad79 Darrick J. Wong 2023-03-06   88  	 */
5e5ada746aad79 Darrick J. Wong 2023-03-06   89  	if (total_links > U32_MAX) {
5e5ada746aad79 Darrick J. Wong 2023-03-06   90  		trace_xrep_nlinks_unfixable_inode(mp, ip, &obs);
5e5ada746aad79 Darrick J. Wong 2023-03-06  @91  		goto out_trans;

I reported these earlier...  It sill looks like a missing error code to
me.

5e5ada746aad79 Darrick J. Wong 2023-03-06   92  	}
5e5ada746aad79 Darrick J. Wong 2023-03-06   93  
5e5ada746aad79 Darrick J. Wong 2023-03-06   94  	/*
5e5ada746aad79 Darrick J. Wong 2023-03-06   95  	 * Linked directories should have at least one "child" (the dot entry)
5e5ada746aad79 Darrick J. Wong 2023-03-06   96  	 * pointing up to them.
5e5ada746aad79 Darrick J. Wong 2023-03-06   97  	 */
5e5ada746aad79 Darrick J. Wong 2023-03-06   98  	if (S_ISDIR(VFS_I(ip)->i_mode) && actual_nlink > 0 &&
5e5ada746aad79 Darrick J. Wong 2023-03-06   99  					  obs.children == 0) {
5e5ada746aad79 Darrick J. Wong 2023-03-06  100  		trace_xrep_nlinks_unfixable_inode(mp, ip, &obs);
5e5ada746aad79 Darrick J. Wong 2023-03-06  101  		goto out_trans;

Same etc.

5e5ada746aad79 Darrick J. Wong 2023-03-06  102  	}
5e5ada746aad79 Darrick J. Wong 2023-03-06  103  
5e5ada746aad79 Darrick J. Wong 2023-03-06  104  	/* Non-directories cannot have directories pointing up to them. */
5e5ada746aad79 Darrick J. Wong 2023-03-06  105  	if (!S_ISDIR(VFS_I(ip)->i_mode) && obs.children != 0) {
5e5ada746aad79 Darrick J. Wong 2023-03-06  106  		trace_xrep_nlinks_unfixable_inode(mp, ip, &obs);
5e5ada746aad79 Darrick J. Wong 2023-03-06  107  		goto out_trans;
5e5ada746aad79 Darrick J. Wong 2023-03-06  108  	}
5e5ada746aad79 Darrick J. Wong 2023-03-06  109  
5e5ada746aad79 Darrick J. Wong 2023-03-06  110  	/*
5e5ada746aad79 Darrick J. Wong 2023-03-06  111  	 * We did not find any links to this inode.  If the inode agrees, we
5e5ada746aad79 Darrick J. Wong 2023-03-06  112  	 * have nothing further to do.  If not, the inode has a nonzero link
5e5ada746aad79 Darrick J. Wong 2023-03-06  113  	 * count and we don't have anywhere to graft the child onto.  Dropping
5e5ada746aad79 Darrick J. Wong 2023-03-06  114  	 * a live inode's link count to zero can cause unexpected shutdowns in
5e5ada746aad79 Darrick J. Wong 2023-03-06  115  	 * inactivation, so leave it alone.
5e5ada746aad79 Darrick J. Wong 2023-03-06  116  	 */
5e5ada746aad79 Darrick J. Wong 2023-03-06  117  	if (total_links == 0) {
5e5ada746aad79 Darrick J. Wong 2023-03-06  118  		if (actual_nlink != 0)
5e5ada746aad79 Darrick J. Wong 2023-03-06  119  			trace_xrep_nlinks_unfixable_inode(mp, ip, &obs);
5e5ada746aad79 Darrick J. Wong 2023-03-06  120  		goto out_trans;
5e5ada746aad79 Darrick J. Wong 2023-03-06  121  	}
5e5ada746aad79 Darrick J. Wong 2023-03-06  122  
5e5ada746aad79 Darrick J. Wong 2023-03-06  123  	/* Commit the new link count if it changed. */
5e5ada746aad79 Darrick J. Wong 2023-03-06  124  	if (total_links != actual_nlink) {
5e5ada746aad79 Darrick J. Wong 2023-03-06  125  		trace_xrep_nlinks_update_inode(mp, ip, &obs);
5e5ada746aad79 Darrick J. Wong 2023-03-06  126  		set_nlink(VFS_I(ip), total_links);
5e5ada746aad79 Darrick J. Wong 2023-03-06  127  		dirty = true;
5e5ada746aad79 Darrick J. Wong 2023-03-06  128  	}
5e5ada746aad79 Darrick J. Wong 2023-03-06  129  
5e5ada746aad79 Darrick J. Wong 2023-03-06  130  	if (!dirty)
5e5ada746aad79 Darrick J. Wong 2023-03-06  131  		goto out_trans;
5e5ada746aad79 Darrick J. Wong 2023-03-06  132  
5e5ada746aad79 Darrick J. Wong 2023-03-06  133  	xfs_trans_log_inode(sc->tp, ip, XFS_ILOG_CORE);
5e5ada746aad79 Darrick J. Wong 2023-03-06  134  
5e5ada746aad79 Darrick J. Wong 2023-03-06  135  	error = xrep_trans_commit(sc);
5e5ada746aad79 Darrick J. Wong 2023-03-06  136  	if (error)
5e5ada746aad79 Darrick J. Wong 2023-03-06  137  		goto out_ilock;
5e5ada746aad79 Darrick J. Wong 2023-03-06  138  
5e5ada746aad79 Darrick J. Wong 2023-03-06  139  	xchk_iunlock(sc, XFS_ILOCK_EXCL | XFS_IOLOCK_EXCL);
5e5ada746aad79 Darrick J. Wong 2023-03-06  140  	return 0;
5e5ada746aad79 Darrick J. Wong 2023-03-06  141  
5e5ada746aad79 Darrick J. Wong 2023-03-06  142  out_scanlock:
5e5ada746aad79 Darrick J. Wong 2023-03-06  143  	mutex_unlock(&xnc->lock);
5e5ada746aad79 Darrick J. Wong 2023-03-06  144  out_trans:
5e5ada746aad79 Darrick J. Wong 2023-03-06  145  	xchk_trans_cancel(sc);
5e5ada746aad79 Darrick J. Wong 2023-03-06  146  out_ilock:
5e5ada746aad79 Darrick J. Wong 2023-03-06  147  	xchk_iunlock(sc, XFS_ILOCK_EXCL);
5e5ada746aad79 Darrick J. Wong 2023-03-06  148  out_iolock:
5e5ada746aad79 Darrick J. Wong 2023-03-06  149  	xchk_iunlock(sc, XFS_IOLOCK_EXCL);
5e5ada746aad79 Darrick J. Wong 2023-03-06  150  	return error;
5e5ada746aad79 Darrick J. Wong 2023-03-06  151  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

