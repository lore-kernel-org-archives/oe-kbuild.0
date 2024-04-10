Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C5015958E
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Apr 2024 15:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712763258; cv=none; b=t52PCGIVTVr/JQ0PmtaLZbL4CLSfZU34wcBFXeLgzbwotE7mg9VQ6esBRGGa+KMCH6hazS6HBzFdETCuqYHqUEnzkzPRlVkpAg14yw3ZUDj5piCbJe/6eIJYuIz1OZUzbVpCOwF/P1dtESzbVGAQeVBWq5qpy7QudSIIIRBwt0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712763258; c=relaxed/simple;
	bh=RFhI4oraX4koxy3Fr1aogm94uQykd9iczIAj6GXGwTA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O1vYdNbYogXCOnVA+amOym5ucPG/E8f4zfzRTj+9TitJwW3IpDdny6PH1pCI7kYA/mNH498X3WJRhPykRUadiMXd/ApAnQQtFcl8Gz82ke8IeUBYrHyIZaQTO/9DuBPnqx2rk1Un3u02uvxpf5AAbp5hHenxcFv7U2KDRQRfPPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g7NjEjJQ; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g7NjEjJQ"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a450bedffdfso958703166b.3
        for <oe-kbuild@lists.linux.dev>; Wed, 10 Apr 2024 08:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712763254; x=1713368054; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O/bG/UksmBY+n9+44Q4S1vw3NnNhPusgPNICiXUhcy0=;
        b=g7NjEjJQOIaZ7ZUzdxYNZncRuXuUe2smJ2a69QzzOtQGj0uvZox8p7hIlIuOpyhOB8
         tYOrrEfhTv/mrmpYMhli9V0iHj6p3bGM5A2fm18QIjpjP6iJ8c+9yO3tl+N8mT8qFY2/
         nhA4+MTfnU7Q4kWDIlfEpuP/3pW60JDq8v0Z4iC44C7yVNXjonJOipRlaWR1KNke2WEq
         +Fz/69HZKg8eQutTU5X3kZ4BLylqdUnLRcVCtzT5Gyjkx6lSq1UvpQPsmr73vINQPpwv
         O4Uq1FtejpM4HFNVEvEmHBm9fn0GzI88UEVfRAhSbDfJmztkrdBLpYxtudEtfl4YvTVw
         I0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712763254; x=1713368054;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O/bG/UksmBY+n9+44Q4S1vw3NnNhPusgPNICiXUhcy0=;
        b=bNDxFQBzRDsLuDM+aGPgpzg2UaXfaHdCdT5kBeLGlNL2hbtDmuBFrHPX32D5+nveNy
         f2xkbNXOyR8V4aRrSOwQTk0bEJrcg9z3JeBgx5yfmIc0IW8g304i1Ny36rTXgSYAJJU/
         /OTYRaDlmJNzGGFvLfGlbSJ20JlBfRLcoqqM6V3Q8ubzmV5VRAmBb3nVgBUlMvdYgusg
         D9z7nSg8/ACS5DBCCZzp8q0mo0Rr4GRLBYbC8twJ4zkcjIkarBaPKcX2MTYwzorrtKbU
         2mjdPAwf8liPUFNu0WV//sMv7kihgP3vZCaNHhuJV8Pg/0araRrOJVt47RgTjdpcW4E2
         3fkw==
X-Gm-Message-State: AOJu0Yx1FSza7NzDKYYHsxGsRmHYoIYS9LpcvYmwey75eifH1XEPHCNc
	oQ7JsnJzjuYxxaStqJZBDeUJH9srXbwFx3VDPOKkOS2e/0oTEdTqWM1NGaDeNgpoyJyPpQfNxPe
	9
X-Google-Smtp-Source: AGHT+IFvRJwWXP9c4p0HQMxn1TLEVYfA8Vu/GWtQlwTiRW6Vnef+4UqaoKjDMdiszXG5TBd7NE1I3A==
X-Received: by 2002:a17:906:454c:b0:a4e:904:3c7f with SMTP id s12-20020a170906454c00b00a4e09043c7fmr1609308ejq.50.1712763253879;
        Wed, 10 Apr 2024 08:34:13 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id qx3-20020a170906fcc300b00a4e26377bf1sm7163830ejb.175.2024.04.10.08.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 08:34:12 -0700 (PDT)
Date: Wed, 10 Apr 2024 18:34:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:timestats-hoist 445/457] fs/xfs/xfs_bmap_util.c:1823
 xfs_convert_rtbigalloc_mapping() warn: missing error code 'error'
Message-ID: <da4cb9df-0db1-4cf0-88b8-19ee75c78515@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git timestats-hoist
head:   ed4cedcef505729c94212031f8ed784a5fd81ac5
commit: d228af407b64a712f8c858b00b3014b2df2c5586 [445/457] xfs: support reflink with force align enabled
config: i386-randconfig-141-20240410 (https://download.01.org/0day-ci/archive/20240410/202404102346.P2kP55zW-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202404102346.P2kP55zW-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_bmap_util.c:1823 xfs_convert_rtbigalloc_mapping() warn: missing error code 'error'

vim +/error +1823 fs/xfs/xfs_bmap_util.c

8ff235eaba14273 Darrick J. Wong 2024-02-20  1788  STATIC int
8ff235eaba14273 Darrick J. Wong 2024-02-20  1789  xfs_convert_rtbigalloc_mapping(
8ff235eaba14273 Darrick J. Wong 2024-02-20  1790  	struct xfs_inode	*ip,
8ff235eaba14273 Darrick J. Wong 2024-02-20  1791  	xfs_fileoff_t		*offp,
8ff235eaba14273 Darrick J. Wong 2024-02-20  1792  	xfs_fileoff_t		endoff)
8ff235eaba14273 Darrick J. Wong 2024-02-20  1793  {
8ff235eaba14273 Darrick J. Wong 2024-02-20  1794  	struct xfs_bmbt_irec	irec;
8ff235eaba14273 Darrick J. Wong 2024-02-20  1795  	struct xfs_mount	*mp = ip->i_mount;
8ff235eaba14273 Darrick J. Wong 2024-02-20  1796  	struct xfs_trans	*tp;
8ff235eaba14273 Darrick J. Wong 2024-02-20  1797  	unsigned int		resblks;
8ff235eaba14273 Darrick J. Wong 2024-02-20  1798  	int			nmap;
8ff235eaba14273 Darrick J. Wong 2024-02-20  1799  	int			error;
8ff235eaba14273 Darrick J. Wong 2024-02-20  1800  
8ff235eaba14273 Darrick J. Wong 2024-02-20  1801  	resblks = XFS_DIOSTRAT_SPACE_RES(mp, 1);
8ff235eaba14273 Darrick J. Wong 2024-02-20  1802  	error = xfs_trans_alloc(mp, &M_RES(mp)->tr_write, resblks, 0, 0, &tp);
8ff235eaba14273 Darrick J. Wong 2024-02-20  1803  	if (error)
8ff235eaba14273 Darrick J. Wong 2024-02-20  1804  		return error;
8ff235eaba14273 Darrick J. Wong 2024-02-20  1805  
8ff235eaba14273 Darrick J. Wong 2024-02-20  1806  	xfs_ilock(ip, XFS_ILOCK_EXCL);
8ff235eaba14273 Darrick J. Wong 2024-02-20  1807  	xfs_trans_ijoin(tp, ip, 0);
8ff235eaba14273 Darrick J. Wong 2024-02-20  1808  
8ff235eaba14273 Darrick J. Wong 2024-02-20  1809  	/*
8ff235eaba14273 Darrick J. Wong 2024-02-20  1810  	 * Read the mapping.  If we find an unwritten extent that isn't aligned
8ff235eaba14273 Darrick J. Wong 2024-02-20  1811  	 * to an allocation unit...
8ff235eaba14273 Darrick J. Wong 2024-02-20  1812  	 */
8ff235eaba14273 Darrick J. Wong 2024-02-20  1813  retry:
8ff235eaba14273 Darrick J. Wong 2024-02-20  1814  	nmap = 1;
8ff235eaba14273 Darrick J. Wong 2024-02-20  1815  	error = xfs_bmapi_read(ip, *offp, endoff - *offp, &irec, &nmap, 0);
8ff235eaba14273 Darrick J. Wong 2024-02-20  1816  	if (error)
8ff235eaba14273 Darrick J. Wong 2024-02-20  1817  		goto out_cancel;
8ff235eaba14273 Darrick J. Wong 2024-02-20  1818  	ASSERT(nmap == 1);
8ff235eaba14273 Darrick J. Wong 2024-02-20  1819  	ASSERT(irec.br_startoff == *offp);
8ff235eaba14273 Darrick J. Wong 2024-02-20  1820  	if (!xfs_want_convert_rtbigalloc_mapping(mp, &irec)) {
8ff235eaba14273 Darrick J. Wong 2024-02-20  1821  		*offp = irec.br_startoff + irec.br_blockcount;
8ff235eaba14273 Darrick J. Wong 2024-02-20  1822  		if (*offp >= endoff)
8ff235eaba14273 Darrick J. Wong 2024-02-20 @1823  			goto out_cancel;

error code?

8ff235eaba14273 Darrick J. Wong 2024-02-20  1824  		goto retry;
8ff235eaba14273 Darrick J. Wong 2024-02-20  1825  	}
8ff235eaba14273 Darrick J. Wong 2024-02-20  1826  
8ff235eaba14273 Darrick J. Wong 2024-02-20  1827  	/*
8ff235eaba14273 Darrick J. Wong 2024-02-20  1828  	 * ...then write zeroes to the space and change the mapping state to
8ff235eaba14273 Darrick J. Wong 2024-02-20  1829  	 * written.  This consolidates the mappings for this allocation unit.
8ff235eaba14273 Darrick J. Wong 2024-02-20  1830  	 */
8ff235eaba14273 Darrick J. Wong 2024-02-20  1831  	nmap = 1;
8ff235eaba14273 Darrick J. Wong 2024-02-20  1832  	error = xfs_bmapi_write(tp, ip, irec.br_startoff, irec.br_blockcount,
8ff235eaba14273 Darrick J. Wong 2024-02-20  1833  			XFS_BMAPI_CONVERT | XFS_BMAPI_ZERO, 0, &irec, &nmap);
8ff235eaba14273 Darrick J. Wong 2024-02-20  1834  	if (error)
8ff235eaba14273 Darrick J. Wong 2024-02-20  1835  		goto out_cancel;
8ff235eaba14273 Darrick J. Wong 2024-02-20  1836  	error = xfs_trans_commit(tp);
8ff235eaba14273 Darrick J. Wong 2024-02-20  1837  	if (error)
8ff235eaba14273 Darrick J. Wong 2024-02-20  1838  		goto out_unlock;
8ff235eaba14273 Darrick J. Wong 2024-02-20  1839  
8ff235eaba14273 Darrick J. Wong 2024-02-20  1840  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
8ff235eaba14273 Darrick J. Wong 2024-02-20  1841  
8ff235eaba14273 Darrick J. Wong 2024-02-20  1842  	/*
8ff235eaba14273 Darrick J. Wong 2024-02-20  1843  	 * If an unwritten mapping was returned, something is very wrong.
8ff235eaba14273 Darrick J. Wong 2024-02-20  1844  	 * If no mapping was returned, then bmapi_write thought it performed
8ff235eaba14273 Darrick J. Wong 2024-02-20  1845  	 * a short allocation, which should be impossible since we previously
8ff235eaba14273 Darrick J. Wong 2024-02-20  1846  	 * queried the mapping and haven't cycled locks since then.  Either
8ff235eaba14273 Darrick J. Wong 2024-02-20  1847  	 * way, fail the operation.
8ff235eaba14273 Darrick J. Wong 2024-02-20  1848  	 */
8ff235eaba14273 Darrick J. Wong 2024-02-20  1849  	if (nmap == 0 || irec.br_state != XFS_EXT_NORM) {
8ff235eaba14273 Darrick J. Wong 2024-02-20  1850  		ASSERT(nmap != 0);
8ff235eaba14273 Darrick J. Wong 2024-02-20  1851  		ASSERT(irec.br_state == XFS_EXT_NORM);
8ff235eaba14273 Darrick J. Wong 2024-02-20  1852  		return -EIO;
8ff235eaba14273 Darrick J. Wong 2024-02-20  1853  	}
8ff235eaba14273 Darrick J. Wong 2024-02-20  1854  
8ff235eaba14273 Darrick J. Wong 2024-02-20  1855  	/* Advance the cursor to the end of the mapping returned. */
8ff235eaba14273 Darrick J. Wong 2024-02-20  1856  	*offp = irec.br_startoff + irec.br_blockcount;
8ff235eaba14273 Darrick J. Wong 2024-02-20  1857  	return 0;
8ff235eaba14273 Darrick J. Wong 2024-02-20  1858  
8ff235eaba14273 Darrick J. Wong 2024-02-20  1859  out_cancel:
8ff235eaba14273 Darrick J. Wong 2024-02-20  1860  	xfs_trans_cancel(tp);
8ff235eaba14273 Darrick J. Wong 2024-02-20  1861  out_unlock:
8ff235eaba14273 Darrick J. Wong 2024-02-20  1862  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
8ff235eaba14273 Darrick J. Wong 2024-02-20  1863  	return error;
8ff235eaba14273 Darrick J. Wong 2024-02-20  1864  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

