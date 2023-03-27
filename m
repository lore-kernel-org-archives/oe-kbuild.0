Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1CA620;
	Mon, 27 Mar 2023 04:54:15 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id l27so7274444wrb.2;
        Sun, 26 Mar 2023 21:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679892853;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ki2sGeiFMwbLjnJ1yFxWqw3YtVUVc0x0y5uMvRjSTi4=;
        b=Rl7I5lpON0khMy6kFkTIaGTO3XlhQ6uIqZ9YZgBsTmrDhUrM9QRSWkSksQb8t2oTFv
         OdDuMyWVTOFtgCaE/+B4aFrDPZseBFG3+kq4Q9EIFszhPsn+8E2+hKdNOnxp5bsz9SuC
         YCZqAUaFR6AxY1ce7WJ+9KGKHko3wzH+o9MFR+3GrvHvaqIu2IqaglracGpGQngPvnTz
         2yib40S5dNzfPeTuSMVu6gNpMPfs0w8V3dduzIqSOGw4GdXS2t8QlAMxkbx82rbJBSbG
         z7JhZ5GJnrZdxFZSURS64uwOVhKC0A8+3in3/XDc7L/iMZUuBlyuDlQ37zO0nuZtSa0i
         1KUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679892853;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ki2sGeiFMwbLjnJ1yFxWqw3YtVUVc0x0y5uMvRjSTi4=;
        b=N2zWiTxaPWG2chYzqxELVauxSiHSIIXp5WmjEnUuxpFy71KMBkNUt8Fdp7jjIr0bZc
         VSZL7JnA0gYfSyxkZaiiJnwDimHvI+ApfxcBlDNCwOy9WQSLbkXYym1/HhMB8IV+6vyr
         elhjeXm6sEIlU6vUqEGLv43CIWwXhKZ1bhMmMpt/Cec1IMsBvktyXwstLNaVEbBkXP39
         I642NRhGw8Xk3XHumpwVfowXVR5JTzeh4dcdKMZtWSUbHGdbdOHRazOXNdUWcxcU3EF7
         gCJXJ1qLoZtxO3Kq+GbxrZ6vKlcPhzxeHKCv1mKbs/jvDJWEJUW1AJolICUwnPdu+LIA
         3jCQ==
X-Gm-Message-State: AAQBX9ccps5ejZsl8wxOnypEuD06KkJZbld+vbB0MIcmPn5H4Ykd6IWt
	+AsM2JLKCw6xE/0LQRxvyHqgi2exBmo=
X-Google-Smtp-Source: AKy350aytas9sJ0GE9YqO9FaAwRpAWR12BQoCYFsTdcci0tg1SdW8LHv3SbglHIRTg2lA++uNwJhPw==
X-Received: by 2002:a5d:6901:0:b0:2ce:9877:5120 with SMTP id t1-20020a5d6901000000b002ce98775120mr7626083wru.21.1679892853058;
        Sun, 26 Mar 2023 21:54:13 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c15-20020adfef4f000000b002c7066a6f77sm23950466wrp.31.2023.03.26.21.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 21:54:12 -0700 (PDT)
Date: Mon, 27 Mar 2023 07:54:09 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:xfile-page-caching 246/287] fs/xfs/xfs_rtalloc.c:1552
 xfs_rtfile_convert_one() warn: missing error code 'error'
Message-ID: <f2b1eaf2-fe7f-4997-a6d8-b50fc24789cb@kili.mountain>
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
commit: 88d3de0890a01c4e858eb498cfe5ccfa846c9915 [246/287] xfs: make atomic extent swapping support realtime files
config: microblaze-randconfig-m041-20230326 (https://download.01.org/0day-ci/archive/20230326/202303260959.tQV2vson-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303260959.tQV2vson-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_rtalloc.c:1552 xfs_rtfile_convert_one() warn: missing error code 'error'

Old smatch warnings:
fs/xfs/xfs_rtalloc.c:847 xfs_growfs_rt_alloc() warn: missing unwind goto?

vim +/error +1552 fs/xfs/xfs_rtalloc.c

88d3de0890a01c Darrick J. Wong 2023-03-06  1517  STATIC int
88d3de0890a01c Darrick J. Wong 2023-03-06  1518  xfs_rtfile_convert_one(
88d3de0890a01c Darrick J. Wong 2023-03-06  1519  	struct xfs_inode	*ip,
88d3de0890a01c Darrick J. Wong 2023-03-06  1520  	xfs_fileoff_t		*offp,
88d3de0890a01c Darrick J. Wong 2023-03-06  1521  	xfs_fileoff_t		endoff)
88d3de0890a01c Darrick J. Wong 2023-03-06  1522  {
88d3de0890a01c Darrick J. Wong 2023-03-06  1523  	struct xfs_bmbt_irec	irec;
88d3de0890a01c Darrick J. Wong 2023-03-06  1524  	struct xfs_mount	*mp = ip->i_mount;
88d3de0890a01c Darrick J. Wong 2023-03-06  1525  	struct xfs_trans	*tp;
88d3de0890a01c Darrick J. Wong 2023-03-06  1526  	unsigned int		resblks;
88d3de0890a01c Darrick J. Wong 2023-03-06  1527  	int			nmap;
88d3de0890a01c Darrick J. Wong 2023-03-06  1528  	int			error;
88d3de0890a01c Darrick J. Wong 2023-03-06  1529  
88d3de0890a01c Darrick J. Wong 2023-03-06  1530  	resblks = XFS_DIOSTRAT_SPACE_RES(mp, 1);
88d3de0890a01c Darrick J. Wong 2023-03-06  1531  	error = xfs_trans_alloc(mp, &M_RES(mp)->tr_write, resblks, 0, 0, &tp);
88d3de0890a01c Darrick J. Wong 2023-03-06  1532  	if (error)
88d3de0890a01c Darrick J. Wong 2023-03-06  1533  		return error;
88d3de0890a01c Darrick J. Wong 2023-03-06  1534  
88d3de0890a01c Darrick J. Wong 2023-03-06  1535  	xfs_ilock(ip, XFS_ILOCK_EXCL);
88d3de0890a01c Darrick J. Wong 2023-03-06  1536  	xfs_trans_ijoin(tp, ip, 0);
88d3de0890a01c Darrick J. Wong 2023-03-06  1537  
88d3de0890a01c Darrick J. Wong 2023-03-06  1538  	/*
88d3de0890a01c Darrick J. Wong 2023-03-06  1539  	 * Read the mapping.  If we find an unwritten extent that isn't aligned
88d3de0890a01c Darrick J. Wong 2023-03-06  1540  	 * to an rt extent boundary...
88d3de0890a01c Darrick J. Wong 2023-03-06  1541  	 */
88d3de0890a01c Darrick J. Wong 2023-03-06  1542  retry:
88d3de0890a01c Darrick J. Wong 2023-03-06  1543  	nmap = 1;
88d3de0890a01c Darrick J. Wong 2023-03-06  1544  	error = xfs_bmapi_read(ip, *offp, endoff - *offp, &irec, &nmap, 0);
88d3de0890a01c Darrick J. Wong 2023-03-06  1545  	if (error)
88d3de0890a01c Darrick J. Wong 2023-03-06  1546  		goto out_cancel;
88d3de0890a01c Darrick J. Wong 2023-03-06  1547  	ASSERT(nmap == 1);
88d3de0890a01c Darrick J. Wong 2023-03-06  1548  	ASSERT(irec.br_startoff == *offp);
88d3de0890a01c Darrick J. Wong 2023-03-06  1549  	if (!xfs_rtfile_want_conversion(mp, &irec)) {
88d3de0890a01c Darrick J. Wong 2023-03-06  1550  		*offp = irec.br_startoff + irec.br_blockcount;
88d3de0890a01c Darrick J. Wong 2023-03-06  1551  		if (*offp >= endoff)
88d3de0890a01c Darrick J. Wong 2023-03-06 @1552  			goto out_cancel;

error code?

88d3de0890a01c Darrick J. Wong 2023-03-06  1553  		goto retry;
88d3de0890a01c Darrick J. Wong 2023-03-06  1554  	}
88d3de0890a01c Darrick J. Wong 2023-03-06  1555  
88d3de0890a01c Darrick J. Wong 2023-03-06  1556  	/*
88d3de0890a01c Darrick J. Wong 2023-03-06  1557  	 * ...make sure this partially unwritten rt extent gets converted to a
88d3de0890a01c Darrick J. Wong 2023-03-06  1558  	 * zeroed written extent that we can remap.
88d3de0890a01c Darrick J. Wong 2023-03-06  1559  	 */
88d3de0890a01c Darrick J. Wong 2023-03-06  1560  	nmap = 1;
88d3de0890a01c Darrick J. Wong 2023-03-06  1561  	error = xfs_bmapi_write(tp, ip, irec.br_startoff, irec.br_blockcount,
88d3de0890a01c Darrick J. Wong 2023-03-06  1562  			XFS_BMAPI_CONVERT | XFS_BMAPI_ZERO, 0, &irec, &nmap);
88d3de0890a01c Darrick J. Wong 2023-03-06  1563  	if (error)
88d3de0890a01c Darrick J. Wong 2023-03-06  1564  		goto out_cancel;
88d3de0890a01c Darrick J. Wong 2023-03-06  1565  	ASSERT(nmap == 1);
88d3de0890a01c Darrick J. Wong 2023-03-06  1566  	if (irec.br_state != XFS_EXT_NORM) {
88d3de0890a01c Darrick J. Wong 2023-03-06  1567  		ASSERT(0);
88d3de0890a01c Darrick J. Wong 2023-03-06  1568  		error = -EIO;
88d3de0890a01c Darrick J. Wong 2023-03-06  1569  		goto out_cancel;
88d3de0890a01c Darrick J. Wong 2023-03-06  1570  	}
88d3de0890a01c Darrick J. Wong 2023-03-06  1571  	error = xfs_trans_commit(tp);
88d3de0890a01c Darrick J. Wong 2023-03-06  1572  	if (error)
88d3de0890a01c Darrick J. Wong 2023-03-06  1573  		goto out_unlock;
88d3de0890a01c Darrick J. Wong 2023-03-06  1574  
88d3de0890a01c Darrick J. Wong 2023-03-06  1575  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
88d3de0890a01c Darrick J. Wong 2023-03-06  1576  	*offp = irec.br_startoff + irec.br_blockcount;
88d3de0890a01c Darrick J. Wong 2023-03-06  1577  	return 0;
88d3de0890a01c Darrick J. Wong 2023-03-06  1578  
88d3de0890a01c Darrick J. Wong 2023-03-06  1579  out_cancel:
88d3de0890a01c Darrick J. Wong 2023-03-06  1580  	xfs_trans_cancel(tp);
88d3de0890a01c Darrick J. Wong 2023-03-06  1581  out_unlock:
88d3de0890a01c Darrick J. Wong 2023-03-06  1582  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
88d3de0890a01c Darrick J. Wong 2023-03-06  1583  	return error;
88d3de0890a01c Darrick J. Wong 2023-03-06  1584  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

