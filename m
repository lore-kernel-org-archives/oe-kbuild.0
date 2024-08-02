Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12DE1ABEAF
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Aug 2024 19:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722627388; cv=none; b=gEwWR6kM/dUBGT7ydEXJsJg7Jb8gXnJg07izQVcfpJWYh5JtV+MJ9Tx6k19efhabNrXj90BvhBrK1TVToFP25Pkkcd+dgzkSPx312R2WCNiSRr9Xwo6fpAeD+9rNKGFG+DWNjiWECpl/2sH/qMpYmQbyV5+ToNk70VXUd+GR7cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722627388; c=relaxed/simple;
	bh=45QT20w/pRXzXq4A3dLPNrAFEsTXeF07xH6PFko8DtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HYWgk1DEK72OYcqcDdwjx8C/v06WNlg+9hVtaKr7UxAPheGrRD8tjaW78pYzV6tzZUTZ8cgc4wbxJwqHDwrgPrvV1eESTtW8MWPRtlVl47IMb15CMgoKC83jiCBszYyxBoMtGRdzyNBHSeADWD5tmilJ/gLL32HjlvUjdR8J2hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=no3vtk0n; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="no3vtk0n"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2642cfb2f6aso5443424fac.2
        for <oe-kbuild@lists.linux.dev>; Fri, 02 Aug 2024 12:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722627385; x=1723232185; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HhUEcss2GSTxaoo3P+vXB/LuQ1LDYqGsHE+/If8i+3U=;
        b=no3vtk0nWnNtxpUU+IEGMQSkZq6fUChCwGO/VH5rKTJ4OjgQ5OW/r4bS5bKaCIihLN
         f/X96+fOSKxoGGe3wKO3V1QcoK5iOIAgWIsJtEeQIULZEDCRM8e67cx5b8ARpapMscrw
         FCd4aEFRgYKf0AQwY1a3/QXdS2AI2jFfkkvUQIwiJ4Rx6KopChny2B8TtH/uhxW5d+6Y
         nqai4iyydbtgljZIIm/Y6ZmeIIUv5Rh1sQvc8A7Ayb2E5y/J6pWPOHcirF1c8WJtdfR4
         V39sEntPK3l+RgqSKmSzBTKkGGMy9b+2+GPblsIELnWoomJu855HWhg30sAkTsOq+WdY
         1Ygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722627385; x=1723232185;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HhUEcss2GSTxaoo3P+vXB/LuQ1LDYqGsHE+/If8i+3U=;
        b=hm5w7a+j0IVCbunHJqxCGt88q5nKk3M2XD5ku6riNx24r1iYvakas4JcLMnWypyG6I
         6EzyFOxF8zezMad58G8JX5bWig2JneFL2Ih3rlLRznyWzsfG6o661Lk3X0ChP6z5t8M7
         D5MtmR85DJGrT9pD/0fiG+SK0mIcwjZN0G+stiGXS3xPaD9Y9ze9Zlg+Wijxhb0+bHoE
         eHUqpt20yqp90j1JOuksR6WT05509a7iih6STGOM2QWdFqB29+xwR4Btd9QRg3AF2jQO
         d2Si5//y9pkDFDwV6m37xPROmzyz2Sjo56VULqV+/Otqam9BHDVnmFK9ce+5rQKz14NS
         YooQ==
X-Gm-Message-State: AOJu0Yxdr1LOxqa82GIHVuwXXitrWo9JXwxfx9uWrBQEDyjXPHpkVjwi
	+k/h028Zsgtc2yuWT3m9cU9w2Z7UZRGuK2fAp2mD5fcqsPnJQ61jRQThe+cSwVkRBVCOd6MLWE3
	W
X-Google-Smtp-Source: AGHT+IHbZTNCd8KdLG/8uZwbh1D/uLyIhI5I/8nWdFtBEqAAk6Oh9r7V8HDtSSW3MJCLTZc9J+oqwA==
X-Received: by 2002:a05:6871:582a:b0:261:16da:decb with SMTP id 586e51a60fabf-26891adfa9bmr5306186fac.11.1722627385306;
        Fri, 02 Aug 2024 12:36:25 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::17c0])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2689a2a8686sm503970fac.6.2024.08.02.12.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 12:36:24 -0700 (PDT)
Date: Fri, 2 Aug 2024 14:36:22 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Christoph Hellwig <hch@lst.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-per-rtg-bitmap 5/5] fs/xfs/xfs_rtalloc.c:1157
 xfs_growfs_rt() warn: impossible condition '(new_rgcount > ((-1))) =>
 (0-u32max > u32max)'
Message-ID: <201b1727-8409-42fc-8ffe-8f27cc067eb2@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-per-rtg-bitmap
head:   a20a115ce4258bcd890eddb67ff3b15c7a4e9157
commit: a20a115ce4258bcd890eddb67ff3b15c7a4e9157 [5/5] xfs: use per-RTG bitmaps and summaries
config: x86_64-randconfig-161-20240802 (https://download.01.org/0day-ci/archive/20240803/202408030320.zYTuPl1H-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202408030320.zYTuPl1H-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_rtalloc.c:1157 xfs_growfs_rt() warn: impossible condition '(new_rgcount > ((-1))) => (0-u32max > u32max)'

vim +1157 fs/xfs/xfs_rtalloc.c

^1da177e4c3f41 Linus Torvalds      2005-04-16  1082  int
^1da177e4c3f41 Linus Torvalds      2005-04-16  1083  xfs_growfs_rt(
a20a115ce4258b Christoph Hellwig   2024-07-31  1084  	struct xfs_mount	*mp,
a20a115ce4258b Christoph Hellwig   2024-07-31  1085  	struct xfs_growfs_rt	*in)
^1da177e4c3f41 Linus Torvalds      2005-04-16  1086  {
a20a115ce4258b Christoph Hellwig   2024-07-31  1087  	xfs_rgnumber_t		last_rgno = mp->m_sb.sb_rgcount - 1;
a20a115ce4258b Christoph Hellwig   2024-07-31  1088  	unsigned int		new_rgcount = 1;

Should this be a u64?

a20a115ce4258b Christoph Hellwig   2024-07-31  1089  	xfs_rtxnum_t		nrextents;
a20a115ce4258b Christoph Hellwig   2024-07-31  1090  	struct xfs_rtgroup	*rtg;
a20a115ce4258b Christoph Hellwig   2024-07-31  1091  	xfs_rgnumber_t		rgno;
a20a115ce4258b Christoph Hellwig   2024-07-31  1092  	struct xfs_buf		*bp;
a20a115ce4258b Christoph Hellwig   2024-07-31  1093  	int			error;	
a20a115ce4258b Christoph Hellwig   2024-07-31  1094  	unsigned int		i;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1095  
743bb4650da9e2 sandeen@sandeen.net 2008-11-25  1096  	if (!capable(CAP_SYS_ADMIN))
2451337dd04390 Dave Chinner        2014-06-25  1097  		return -EPERM;
0e2af9296f4f9c Darrick J. Wong     2021-07-12  1098  
0e2af9296f4f9c Darrick J. Wong     2021-07-12  1099  	/* Needs to have been mounted with an rt device. */
0e2af9296f4f9c Darrick J. Wong     2021-07-12  1100  	if (!XFS_IS_REALTIME_MOUNT(mp))
0e2af9296f4f9c Darrick J. Wong     2021-07-12  1101  		return -EINVAL;
0e2af9296f4f9c Darrick J. Wong     2021-07-12  1102  
0e2af9296f4f9c Darrick J. Wong     2021-07-12  1103  	/* Shrink not supported. */
6cb9e23fdae7c1 Christoph Hellwig   2024-07-30  1104  	if (in->newblocks <= mp->m_sb.sb_rblocks)
0e2af9296f4f9c Darrick J. Wong     2021-07-12  1105  		return -EINVAL;
0e2af9296f4f9c Darrick J. Wong     2021-07-12  1106  
0e2af9296f4f9c Darrick J. Wong     2021-07-12  1107  	/* Can only change rt extent size when adding rt volume. */
6cb9e23fdae7c1 Christoph Hellwig   2024-07-30  1108  	if (mp->m_sb.sb_rblocks > 0 && in->extsize != mp->m_sb.sb_rextsize)
0e2af9296f4f9c Darrick J. Wong     2021-07-12  1109  		return -EINVAL;
0e2af9296f4f9c Darrick J. Wong     2021-07-12  1110  
0e2af9296f4f9c Darrick J. Wong     2021-07-12  1111  	/* Range check the extent size. */
0e2af9296f4f9c Darrick J. Wong     2021-07-12  1112  	if (XFS_FSB_TO_B(mp, in->extsize) > XFS_MAX_RTEXTSIZE ||
0e2af9296f4f9c Darrick J. Wong     2021-07-12  1113  	    XFS_FSB_TO_B(mp, in->extsize) < XFS_MIN_RTEXTSIZE)
2451337dd04390 Dave Chinner        2014-06-25  1114  		return -EINVAL;
0e2af9296f4f9c Darrick J. Wong     2021-07-12  1115  
0e2af9296f4f9c Darrick J. Wong     2021-07-12  1116  	/* Unsupported realtime features. */
bb88dce9eeb696 Darrick J. Wong     2024-05-28  1117  	if (!xfs_has_rtgroups(mp) && (xfs_has_rmapbt(mp) || xfs_has_reflink(mp)))
bb88dce9eeb696 Darrick J. Wong     2024-05-28  1118  		return -EOPNOTSUPP;
bb88dce9eeb696 Darrick J. Wong     2024-05-28  1119  	if (xfs_has_quota(mp))
a7b6869effc4eb Darrick J. Wong     2024-05-28  1120  		return -EOPNOTSUPP;
bb88dce9eeb696 Darrick J. Wong     2024-05-28  1121  	if (xfs_has_reflink(mp) && in->extsize != 1)
0e2af9296f4f9c Darrick J. Wong     2021-07-12  1122  		return -EOPNOTSUPP;
0e2af9296f4f9c Darrick J. Wong     2021-07-12  1123  
6cb9e23fdae7c1 Christoph Hellwig   2024-07-30  1124  	error = xfs_sb_validate_fsb_count(&mp->m_sb, in->newblocks);
0e2af9296f4f9c Darrick J. Wong     2021-07-12  1125  	if (error)
4cc929ee305c69 Nathan Scott        2007-05-14  1126  		return error;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1127  	/*
^1da177e4c3f41 Linus Torvalds      2005-04-16  1128  	 * Read in the last block of the device, make sure it exists.
^1da177e4c3f41 Linus Torvalds      2005-04-16  1129  	 */
ba3726742c1712 Dave Chinner        2014-10-02  1130  	error = xfs_buf_read_uncached(mp->m_rtdev_targp,
6cb9e23fdae7c1 Christoph Hellwig   2024-07-30  1131  				XFS_FSB_TO_BB(mp, in->newblocks - 1),
ba3726742c1712 Dave Chinner        2014-10-02  1132  				XFS_FSB_TO_BB(mp, 1), 0, &bp, NULL);
ba3726742c1712 Dave Chinner        2014-10-02  1133  	if (error)
eab4e63368b4cf Dave Chinner        2012-11-12  1134  		return error;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1135  	xfs_buf_relse(bp);
1922c949c59f93 Dave Chinner        2010-09-22  1136  
^1da177e4c3f41 Linus Torvalds      2005-04-16  1137  	/*
^1da177e4c3f41 Linus Torvalds      2005-04-16  1138  	 * Calculate new parameters.  These are the final values to be reached.
^1da177e4c3f41 Linus Torvalds      2005-04-16  1139  	 */
6cb9e23fdae7c1 Christoph Hellwig   2024-07-30  1140  	nrextents = div_u64(in->newblocks, in->extsize);
5bb69dac440d87 Christoph Hellwig   2024-07-30  1141  	if (nrextents == 0)
e14293803f4e84 Darrick J. Wong     2023-12-01  1142  		return -EINVAL;
6cb9e23fdae7c1 Christoph Hellwig   2024-07-30  1143  
31e8765dfb1353 Darrick J. Wong     2024-05-28  1144  	/* Make sure the new fs size won't cause problems with the log. */
31e8765dfb1353 Darrick J. Wong     2024-05-28  1145  	error = xfs_growfs_check_rtgeom(mp, mp->m_sb.sb_dblocks, in->newblocks,
31e8765dfb1353 Darrick J. Wong     2024-05-28  1146  			in->extsize);
31e8765dfb1353 Darrick J. Wong     2024-05-28  1147  	if (error)
31e8765dfb1353 Darrick J. Wong     2024-05-28  1148  		return error;
d40c00393d9cf8 Darrick J. Wong     2024-05-28  1149  
d40c00393d9cf8 Darrick J. Wong     2024-05-28  1150  	/*
d40c00393d9cf8 Darrick J. Wong     2024-05-28  1151  	 * Compute the new number of rt groups.  Changing the rtgroup size is
d40c00393d9cf8 Darrick J. Wong     2024-05-28  1152  	 * not allowed (even if the rt volume hasn't yet been initialized)
d40c00393d9cf8 Darrick J. Wong     2024-05-28  1153  	 * because the userspace ABI doesn't support it.
d40c00393d9cf8 Darrick J. Wong     2024-05-28  1154  	 */
d40c00393d9cf8 Darrick J. Wong     2024-05-28  1155  	if (xfs_has_rtgroups(mp)) {
d40c00393d9cf8 Darrick J. Wong     2024-05-28  1156  		new_rgcount = howmany_64(nrextents, mp->m_sb.sb_rgextents);
d40c00393d9cf8 Darrick J. Wong     2024-05-28 @1157  		if (new_rgcount > XFS_MAX_RGNUMBER)

howmany_64() returns a u64.

d40c00393d9cf8 Darrick J. Wong     2024-05-28  1158  			return -EINVAL;
d40c00393d9cf8 Darrick J. Wong     2024-05-28  1159  
a20a115ce4258b Christoph Hellwig   2024-07-31  1160  		/*
a20a115ce4258b Christoph Hellwig   2024-07-31  1161  		 * Set up the realtime superblock if we're adding a new rt
a20a115ce4258b Christoph Hellwig   2024-07-31  1162  		 * section.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

