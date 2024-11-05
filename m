Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706A03BBC5
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Nov 2024 16:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730823404; cv=none; b=DbedpYJUun4eTSC3hOWzOug2xFzrWZAhd5KA+EsDG4HcO7OvjxgBGRz19mboShv/KYwNu6UzJqNb6RE2NwVHzuBoPtB8yJTeM/vnCPmAAK98SRE/CCU+qM4Mlp1DjCXAv7KJYDYg6GFgO6z8iX9c586PD3XEdlQmpwfs/XceTHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730823404; c=relaxed/simple;
	bh=ulXv1Zv8KZpzd7Ffxi0Lc1QMMMfm+qSrdATYdrQysdo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LmH5LCD5MBW36ZRYVJiTlw8R5NPUONq9I7pnhVXtPok9mbTntKBONFLoobftC7dzZJPIvPtpR24OOwQLP4XDoFLHgWi0fQpSdu/HTHuuff97epSgMI6Mz+M8iSY+L7G0cMCfR//o23Fwx+DRK3kHMuPZRn5sHW7w9LUCmCz9rnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u2BsiMEw; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u2BsiMEw"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43193678216so48658815e9.0
        for <oe-kbuild@lists.linux.dev>; Tue, 05 Nov 2024 08:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730823400; x=1731428200; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ErWpMdX9kJb8DHKb1BI5lN2B87TEzku9dZL3tB8NZgE=;
        b=u2BsiMEwtXmJm8qt0pUSbs5FO3Q5Nk4tObnO8qQ/PgMh+676MWwoAybXrAkVrydTWN
         XjZwJ3wZFTYrGQ+mLZjmT4+usyaKpIbeCqKYv3PEmR1J1A7eh7GKV3cVPyC4i0VZG/1E
         qYxN/BjpsEiJONYrjoKQCzusIbTQLfDBFX9DWYa0rRG0VlZPelgA51JFnV0lOD/FT6ad
         m3kfnIeATQhLJsEeH9gDKflvIQ9uxGPVCKy/RVeeejPPmTLYlLYyVYmG2Z+SxgrHAPsH
         MnOSHeOwjmEY3Yr/WporP2aayygoEIMs5gXVs8XClD54Mc82+Vp6lXAtyvwfDqv2veuV
         0Y5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730823400; x=1731428200;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ErWpMdX9kJb8DHKb1BI5lN2B87TEzku9dZL3tB8NZgE=;
        b=rQG4hRGv3WjXQbrMmc0mDVzg1W+F6ziORYQJ+RXg1S9+3VWM5/FSin69LXwdo2OErA
         8CxknpiqTElNrqdAgZocixVx3GPiU0jHfue5ri9tMuv8NjY37LDSEZROMkRzcP3ASCOd
         KiYcMfSv4xzeEfLmnFZkN9wix1EvT4A45ZQlZFIq7urcFWHN9ua4zqMSDGfNU3HyYesC
         nGodWtlEroqUgG22U1f8MJ5jqOu+9iXcZoEvxmDlcd1uawOl+ek04ViRzjY2OH6eY8ve
         C8cpjTZYQXwKAr6khvXtt3GlLVR0VncdxQD5GQCbxFJcT1NzAsmhO0kF8QeqJz6XmekQ
         2ubg==
X-Gm-Message-State: AOJu0YwukPkDakd4yvg+ZD1AkP+AfD9cLdhlojOOyq4GW8cjqgc7Z7HJ
	VOVxZfUYPFDs9zCCGYgQuyUm94KoZDArsRBLzSQo6kMecYD0aAFdmqsq7a+U55jXdLsr0difhc/
	fDBuNHA==
X-Google-Smtp-Source: AGHT+IFnd00Lem/gBJDfBsBNRXhNWcCdKkCDzO4PZ2I/5J/Y5cvvBpi2P0mSVm0SwxjjN9sdM7x8Qw==
X-Received: by 2002:a05:6000:acc:b0:37d:452b:478f with SMTP id ffacd0b85a97d-380610f244fmr25203220f8f.4.1730823400497;
        Tue, 05 Nov 2024 08:16:40 -0800 (PST)
Received: from localhost ([154.14.63.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c113e5d6sm16626073f8f.76.2024.11.05.08.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 08:16:40 -0800 (PST)
Date: Tue, 5 Nov 2024 19:16:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Christoph Hellwig <hch@lst.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 64/68] fs/xfs/xfs_rtalloc.c:1487 xfs_growfs_rt()
 warn: inconsistent returns '&mp->m_growlock'.
Message-ID: <016a880c-2b78-417c-8cbe-482bd7732c8f@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   bdd2e8eca7805ce39b762a49098e4852c59b6f1f
commit: 937d89e065a77b67572051a23436accd7ce4c782 [64/68] xfs: factor out a xfs_rt_check_size helper
config: x86_64-randconfig-161-20241105 (https://download.01.org/0day-ci/archive/20241105/202411052208.zlY4ueQm-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411052208.zlY4ueQm-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_rtalloc.c:1487 xfs_growfs_rt() warn: inconsistent returns '&mp->m_growlock'.

vim +1487 fs/xfs/xfs_rtalloc.c

^1da177e4c3f415 Linus Torvalds      2005-04-16  1365  int
^1da177e4c3f415 Linus Torvalds      2005-04-16  1366  xfs_growfs_rt(
c2290446af8946b Darrick J. Wong     2024-10-15  1367  	struct xfs_mount	*mp,
c2290446af8946b Darrick J. Wong     2024-10-15  1368  	struct xfs_growfs_rt	*in)
^1da177e4c3f415 Linus Torvalds      2005-04-16  1369  {
c2290446af8946b Darrick J. Wong     2024-10-15  1370  	xfs_rgnumber_t		old_rgcount = mp->m_sb.sb_rgcount;
c2290446af8946b Darrick J. Wong     2024-10-15  1371  	xfs_rgnumber_t		new_rgcount = 1;
c2290446af8946b Darrick J. Wong     2024-10-15  1372  	xfs_rgnumber_t		rgno;
a24cae8fc1f13f6 Darrick J. Wong     2024-08-22  1373  	xfs_agblock_t		old_rextsize = mp->m_sb.sb_rextsize;
e0bdb91d92d21a1 Christoph Hellwig   2024-10-15  1374  	int			error;
^1da177e4c3f415 Linus Torvalds      2005-04-16  1375  
743bb4650da9e25 sandeen@sandeen.net 2008-11-25  1376  	if (!capable(CAP_SYS_ADMIN))
2451337dd043901 Dave Chinner        2014-06-25  1377  		return -EPERM;
0e2af9296f4f9c4 Darrick J. Wong     2021-07-12  1378  
0e2af9296f4f9c4 Darrick J. Wong     2021-07-12  1379  	/* Needs to have been mounted with an rt device. */
0e2af9296f4f9c4 Darrick J. Wong     2021-07-12  1380  	if (!XFS_IS_REALTIME_MOUNT(mp))
0e2af9296f4f9c4 Darrick J. Wong     2021-07-12  1381  		return -EINVAL;
16e1fbdce9c8d08 Darrick J. Wong     2024-08-22  1382  
16e1fbdce9c8d08 Darrick J. Wong     2024-08-22  1383  	if (!mutex_trylock(&mp->m_growlock))
16e1fbdce9c8d08 Darrick J. Wong     2024-08-22  1384  		return -EWOULDBLOCK;
0e2af9296f4f9c4 Darrick J. Wong     2021-07-12  1385  
0e2af9296f4f9c4 Darrick J. Wong     2021-07-12  1386  	/* Shrink not supported. */
e0bdb91d92d21a1 Christoph Hellwig   2024-10-15  1387  	error = -EINVAL;
7996f10ce6cc6a9 Christoph Hellwig   2024-08-30  1388  	if (in->newblocks <= mp->m_sb.sb_rblocks)
16e1fbdce9c8d08 Darrick J. Wong     2024-08-22  1389  		goto out_unlock;
0e2af9296f4f9c4 Darrick J. Wong     2021-07-12  1390  	/* Can only change rt extent size when adding rt volume. */
7996f10ce6cc6a9 Christoph Hellwig   2024-08-30  1391  	if (mp->m_sb.sb_rblocks > 0 && in->extsize != mp->m_sb.sb_rextsize)
16e1fbdce9c8d08 Darrick J. Wong     2024-08-22  1392  		goto out_unlock;
0e2af9296f4f9c4 Darrick J. Wong     2021-07-12  1393  
0e2af9296f4f9c4 Darrick J. Wong     2021-07-12  1394  	/* Range check the extent size. */
0e2af9296f4f9c4 Darrick J. Wong     2021-07-12  1395  	if (XFS_FSB_TO_B(mp, in->extsize) > XFS_MAX_RTEXTSIZE ||
0e2af9296f4f9c4 Darrick J. Wong     2021-07-12  1396  	    XFS_FSB_TO_B(mp, in->extsize) < XFS_MIN_RTEXTSIZE)
16e1fbdce9c8d08 Darrick J. Wong     2024-08-22  1397  		goto out_unlock;
0e2af9296f4f9c4 Darrick J. Wong     2021-07-12  1398  
0e2af9296f4f9c4 Darrick J. Wong     2021-07-12  1399  	/* Unsupported realtime features. */
16e1fbdce9c8d08 Darrick J. Wong     2024-08-22  1400  	error = -EOPNOTSUPP;
9c871895435c232 Darrick J. Wong     2024-10-15  1401  	if ((xfs_has_rmapbt(mp) || xfs_has_quota(mp)) && !xfs_has_rtgroups(mp))
1d1fde3ab4498cf Darrick J. Wong     2024-10-15  1402  		goto out_unlock;
c74ba44d90a5216 Darrick J. Wong     2024-10-15  1403  	if (xfs_has_reflink(mp) &&
c74ba44d90a5216 Darrick J. Wong     2024-10-15  1404  	    !xfs_reflink_supports_rextsize(mp, in->extsize))
16e1fbdce9c8d08 Darrick J. Wong     2024-08-22  1405  		goto out_unlock;
0e2af9296f4f9c4 Darrick J. Wong     2021-07-12  1406  
7996f10ce6cc6a9 Christoph Hellwig   2024-08-30  1407  	error = xfs_sb_validate_fsb_count(&mp->m_sb, in->newblocks);
0e2af9296f4f9c4 Darrick J. Wong     2021-07-12  1408  	if (error)
937d89e065a77b6 Christoph Hellwig   2024-07-30  1409  		return error;

goto out_unlock;

937d89e065a77b6 Christoph Hellwig   2024-07-30  1410  
937d89e065a77b6 Christoph Hellwig   2024-07-30  1411  	error = xfs_rt_check_size(mp, in->newblocks - 1);
ba3726742c1712c Dave Chinner        2014-10-02  1412  	if (error)
937d89e065a77b6 Christoph Hellwig   2024-07-30  1413  		return error;

same

1922c949c59f93b Dave Chinner        2010-09-22  1414  
^1da177e4c3f415 Linus Torvalds      2005-04-16  1415  	/*
^1da177e4c3f415 Linus Torvalds      2005-04-16  1416  	 * Calculate new parameters.  These are the final values to be reached.
^1da177e4c3f415 Linus Torvalds      2005-04-16  1417  	 */
16e1fbdce9c8d08 Darrick J. Wong     2024-08-22  1418  	error = -EINVAL;
140f03a1285d84d Christoph Hellwig   2024-10-15  1419  	if (in->newblocks < in->extsize)
16e1fbdce9c8d08 Darrick J. Wong     2024-08-22  1420  		goto out_unlock;
7996f10ce6cc6a9 Christoph Hellwig   2024-08-30  1421  
140f03a1285d84d Christoph Hellwig   2024-10-15  1422  	/* Make sure the new fs size won't cause problems with the log. */
59ad7d04a88ab22 Darrick J. Wong     2024-10-15  1423  	error = xfs_growfs_check_rtgeom(mp, mp->m_sb.sb_dblocks, in->newblocks,
59ad7d04a88ab22 Darrick J. Wong     2024-10-15  1424  			in->extsize);
140f03a1285d84d Christoph Hellwig   2024-10-15  1425  	if (error)
16e1fbdce9c8d08 Darrick J. Wong     2024-08-22  1426  		goto out_unlock;
65eed012d1f2d0f Omar Sandoval       2018-12-21  1427  
c2290446af8946b Darrick J. Wong     2024-10-15  1428  	if (xfs_has_rtgroups(mp)) {
c2290446af8946b Darrick J. Wong     2024-10-15  1429  		error = xfs_growfs_rt_prep_groups(mp, in->newblocks,
c2290446af8946b Darrick J. Wong     2024-10-15  1430  				in->extsize, &new_rgcount);
c2290446af8946b Darrick J. Wong     2024-10-15  1431  		if (error)
c2290446af8946b Darrick J. Wong     2024-10-15  1432  			goto out_unlock;
c2290446af8946b Darrick J. Wong     2024-10-15  1433  	}
c2290446af8946b Darrick J. Wong     2024-10-15  1434  
c2290446af8946b Darrick J. Wong     2024-10-15  1435  	if (xfs_grow_last_rtg(mp)) {
c2290446af8946b Darrick J. Wong     2024-10-15  1436  		error = xfs_growfs_rtg(mp, old_rgcount - 1, in->newblocks,
c2290446af8946b Darrick J. Wong     2024-10-15  1437  				in->extsize);
3cb30d5162292a3 Christoph Hellwig   2024-08-30  1438  		if (error)
3cb30d5162292a3 Christoph Hellwig   2024-08-30  1439  			goto out_unlock;
c2290446af8946b Darrick J. Wong     2024-10-15  1440  	}
7249c95a3fd72c7 Darrick J. Wong     2020-10-07  1441  
c2290446af8946b Darrick J. Wong     2024-10-15  1442  	for (rgno = old_rgcount; rgno < new_rgcount; rgno++) {
c2290446af8946b Darrick J. Wong     2024-10-15  1443  		xfs_rtbxlen_t	rextents = div_u64(in->newblocks, in->extsize);
c2290446af8946b Darrick J. Wong     2024-10-15  1444  
c2290446af8946b Darrick J. Wong     2024-10-15  1445  		error = xfs_rtgroup_alloc(mp, rgno, new_rgcount, rextents);
a24cae8fc1f13f6 Darrick J. Wong     2024-08-22  1446  		if (error)
e0bdb91d92d21a1 Christoph Hellwig   2024-10-15  1447  			goto out_unlock;
c2290446af8946b Darrick J. Wong     2024-10-15  1448  
c2290446af8946b Darrick J. Wong     2024-10-15  1449  		error = xfs_growfs_rtg(mp, rgno, in->newblocks, in->extsize);
c2290446af8946b Darrick J. Wong     2024-10-15  1450  		if (error) {
c2290446af8946b Darrick J. Wong     2024-10-15  1451  			struct xfs_rtgroup	*rtg;
c2290446af8946b Darrick J. Wong     2024-10-15  1452  
c2290446af8946b Darrick J. Wong     2024-10-15  1453  			rtg = xfs_rtgroup_grab(mp, rgno);
c2290446af8946b Darrick J. Wong     2024-10-15  1454  			if (!WARN_ON_ONCE(!rtg)) {
c2290446af8946b Darrick J. Wong     2024-10-15  1455  				xfs_rtunmount_rtg(rtg);
c2290446af8946b Darrick J. Wong     2024-10-15  1456  				xfs_rtgroup_rele(rtg);
c2290446af8946b Darrick J. Wong     2024-10-15  1457  				xfs_rtgroup_free(mp, rgno);
c2290446af8946b Darrick J. Wong     2024-10-15  1458  			}
c2290446af8946b Darrick J. Wong     2024-10-15  1459  			break;
c2290446af8946b Darrick J. Wong     2024-10-15  1460  		}
a24cae8fc1f13f6 Darrick J. Wong     2024-08-22  1461  	}
a24cae8fc1f13f6 Darrick J. Wong     2024-08-22  1462  
c2290446af8946b Darrick J. Wong     2024-10-15  1463  	if (!error && old_rextsize != in->extsize)
c2290446af8946b Darrick J. Wong     2024-10-15  1464  		error = xfs_growfs_rt_fixup_extsize(mp);
c2290446af8946b Darrick J. Wong     2024-10-15  1465  
c2290446af8946b Darrick J. Wong     2024-10-15  1466  	/*
c2290446af8946b Darrick J. Wong     2024-10-15  1467  	 * Update secondary superblocks now the physical grow has completed.
c2290446af8946b Darrick J. Wong     2024-10-15  1468  	 *
c2290446af8946b Darrick J. Wong     2024-10-15  1469  	 * Also do this in case of an error as we might have already
c2290446af8946b Darrick J. Wong     2024-10-15  1470  	 * successfully updated one or more RTGs and incremented sb_rgcount.
c2290446af8946b Darrick J. Wong     2024-10-15  1471  	 */
c2290446af8946b Darrick J. Wong     2024-10-15  1472  	if (!xfs_is_shutdown(mp)) {
c2290446af8946b Darrick J. Wong     2024-10-15  1473  		int error2 = xfs_update_secondary_sbs(mp);
c2290446af8946b Darrick J. Wong     2024-10-15  1474  
c2290446af8946b Darrick J. Wong     2024-10-15  1475  		if (!error)
c2290446af8946b Darrick J. Wong     2024-10-15  1476  			error = error2;
3db6c1b842a69bf Darrick J. Wong     2024-10-15  1477  
3db6c1b842a69bf Darrick J. Wong     2024-10-15  1478  		/* Reset the rt metadata btree space reservations. */
3db6c1b842a69bf Darrick J. Wong     2024-10-15  1479  		xfs_rt_resv_free(mp);
3db6c1b842a69bf Darrick J. Wong     2024-10-15  1480  		error2 = xfs_rt_resv_init(mp);
3db6c1b842a69bf Darrick J. Wong     2024-10-15  1481  		if (error2 && error2 != -ENOSPC)
3db6c1b842a69bf Darrick J. Wong     2024-10-15  1482  			error = error2;
c2290446af8946b Darrick J. Wong     2024-10-15  1483  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  1484  
16e1fbdce9c8d08 Darrick J. Wong     2024-08-22  1485  out_unlock:
16e1fbdce9c8d08 Darrick J. Wong     2024-08-22  1486  	mutex_unlock(&mp->m_growlock);
^1da177e4c3f415 Linus Torvalds      2005-04-16 @1487  	return error;
^1da177e4c3f415 Linus Torvalds      2005-04-16  1488  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

