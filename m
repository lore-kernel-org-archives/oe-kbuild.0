Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD97019EED0
	for <oe-kbuild@lists.linux.dev>; Tue, 22 Oct 2024 14:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729607221; cv=none; b=gNtYcbYmQtW5kJ5S4KbAFpL5FNVsq1mKBHW1oBKWCkSop3AN57rU3hnQE0mbq4rvCAbZztk2o9ek6XWx2+Df/3if8qInB1adqTjp+IhfSo22C5J1doDi6N6PzuPdHMYnnurIuGdvTUtfPuGJXqmp6TXMJ0M1tqJTJR90Z7Fu7jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729607221; c=relaxed/simple;
	bh=507NDW79tuPRDE8H+1d34456NlCtuWxRfjtZGl+MC7c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p3HHj3ViRjTGAUTN1P7irueG8MZzdokqB/ANin+1WybutmiSVVgCmhp8fZWgAuiEl2IJ6JeoQEhEPpTMZfPDdNZWypDhG8QoDh7kJkYo95VQyxNOSstWdiYDaLyBwEnlo/UzkquAzZv925FP5x0D416zivcwUe1oWGM8zR+Z5UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bfkJ+I96; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bfkJ+I96"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43163667f0eso41741205e9.0
        for <oe-kbuild@lists.linux.dev>; Tue, 22 Oct 2024 07:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729607218; x=1730212018; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SnNY11DlBcywSr7FidTmtJE0zuhfmLO2xoiETxhwzmg=;
        b=bfkJ+I96B1cPHSAt49V28XxkHn31OpiPM/G5kCSazzlEPjg14TbMZMdKPLtVCc35oj
         bvVO3y9H0M7C3n9wsJfxZqufMs86LY/1+lwD8c4tqv0o3D45vfCMDnbyILbSe/BhyAOV
         GOk5JxHYdmpuDyZIcjQvPB1Pn5oAgvitzXaGphJueZd/mkth9Nm44b7+kmjjKiTLeLte
         Dp0X3m1yqdVOnr2yBgyTdaQHkaVXRtGy1GZPbMEZja6aPI8VfyqEXqPEHdPKl0WokpRj
         i0uUOwAjY8xVYUlFjXd9fPRsZZ6cED+jfuK4t+bVWXb9OOIvY1tsDTIhOU988tgMyvBU
         6ruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729607218; x=1730212018;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SnNY11DlBcywSr7FidTmtJE0zuhfmLO2xoiETxhwzmg=;
        b=ooUfj+oVKNVmuRunRvBpYyA8Z7ACt770w60LJ9+CsoSj6bbW3X+Som9aClj6uEqT67
         ctpVXQw4dp8PEnioKIPchSgmQcpY5hOntpk6OhGGn6m6mlG4Ho+nn0x+tBAAkeZEX5yC
         aaeTWj95wjaKcuCW+Bks3mQ2SRbyd5LTq2PTnj1jgApdJhwJEEwMErbjoorV56muc0F3
         UZuWVBFUOIpYyFH4bZL7h1n0oNGk+/7dKJmb7ptf3PUWmeHsys8rMNVYnsgm9d7/Sswd
         Wt1OqAvuD1Zs0mDIqLKJT1xVzb/3ts5BSacx3RHfe/FtWOpucZIxni4RtQ5i5uDXl0HO
         zGiw==
X-Gm-Message-State: AOJu0YzKg9+iMvnxLDQxz36sXQCR8gdr+CNbAVux3Iky37j1uWQGf43z
	fzPa5kwg12pqhFdrfBgh476JcmgbPFZiKHiScGftmUqQCrSGZFYeBJSkDdyZOMMuYJspqvhhtNY
	jzgk=
X-Google-Smtp-Source: AGHT+IG3CjPCVujE1g44pgMXAG7vbovdiq+SKSLL3j/8dKFNZxkb5J3YUjlEcELTWRCtCPIkX86Naw==
X-Received: by 2002:a05:600c:3b9b:b0:42c:bae0:f065 with SMTP id 5b1f17b1804b1-431616332c3mr137901035e9.5.1729607217437;
        Tue, 22 Oct 2024 07:26:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f5cc596sm88861275e9.44.2024.10.22.07.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 07:26:56 -0700 (PDT)
Date: Tue, 22 Oct 2024 17:26:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, kernel@openeuler.org,
	Zheng Zengkai <zhengzengkai@huawei.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 4612/30000] fs/ntfs3/attrib.c:1660
 attr_allocate_frame() error: we previously assumed 'attr_b' could be null
 (see line 1573)
Message-ID: <6b6e4146-ce58-4101-bda1-e00cae515bd6@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   31421c83a2aaf8ecc1d8f377ea9e7e7a37cdb2bf
commit: c213d417e466b7a7d9e02939bb67fcf5d82a3f2f [4612/30000] fs/ntfs3: Add NTFS3 in fs/Kconfig and fs/Makefile
config: x86_64-randconfig-161-20241012 (https://download.01.org/0day-ci/archive/20241022/202410222227.KBnc3TTD-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410222227.KBnc3TTD-lkp@intel.com/

New smatch warnings:
fs/ntfs3/attrib.c:1660 attr_allocate_frame() error: we previously assumed 'attr_b' could be null (see line 1573)

vim +/attr_b +1660 fs/ntfs3/attrib.c

6a00145b61696d Konstantin Komarov 2022-01-28  1449  int attr_allocate_frame(struct ntfs_inode *ni, CLST frame, size_t compr_size,
6a00145b61696d Konstantin Komarov 2022-01-28  1450  			u64 new_valid)
6a00145b61696d Konstantin Komarov 2022-01-28  1451  {
6a00145b61696d Konstantin Komarov 2022-01-28  1452  	int err = 0;
6a00145b61696d Konstantin Komarov 2022-01-28  1453  	struct runs_tree *run = &ni->file.run;
6a00145b61696d Konstantin Komarov 2022-01-28  1454  	struct ntfs_sb_info *sbi = ni->mi.sbi;
6a00145b61696d Konstantin Komarov 2022-01-28  1455  	struct ATTRIB *attr = NULL, *attr_b;
6a00145b61696d Konstantin Komarov 2022-01-28  1456  	struct ATTR_LIST_ENTRY *le, *le_b;
6a00145b61696d Konstantin Komarov 2022-01-28  1457  	struct mft_inode *mi, *mi_b;
6a00145b61696d Konstantin Komarov 2022-01-28  1458  	CLST svcn, evcn1, next_svcn, lcn, len;
6a00145b61696d Konstantin Komarov 2022-01-28  1459  	CLST vcn, end, clst_data;
6a00145b61696d Konstantin Komarov 2022-01-28  1460  	u64 total_size, valid_size, data_size;
6a00145b61696d Konstantin Komarov 2022-01-28  1461  
6a00145b61696d Konstantin Komarov 2022-01-28  1462  	le_b = NULL;
6a00145b61696d Konstantin Komarov 2022-01-28  1463  	attr_b = ni_find_attr(ni, NULL, &le_b, ATTR_DATA, NULL, 0, NULL, &mi_b);
6a00145b61696d Konstantin Komarov 2022-01-28  1464  	if (!attr_b)
6a00145b61696d Konstantin Komarov 2022-01-28  1465  		return -ENOENT;
6a00145b61696d Konstantin Komarov 2022-01-28  1466  
6a00145b61696d Konstantin Komarov 2022-01-28  1467  	if (!is_attr_ext(attr_b))
6a00145b61696d Konstantin Komarov 2022-01-28  1468  		return -EINVAL;
6a00145b61696d Konstantin Komarov 2022-01-28  1469  
6a00145b61696d Konstantin Komarov 2022-01-28  1470  	vcn = frame << NTFS_LZNT_CUNIT;
6a00145b61696d Konstantin Komarov 2022-01-28  1471  	total_size = le64_to_cpu(attr_b->nres.total_size);
6a00145b61696d Konstantin Komarov 2022-01-28  1472  
6a00145b61696d Konstantin Komarov 2022-01-28  1473  	svcn = le64_to_cpu(attr_b->nres.svcn);
6a00145b61696d Konstantin Komarov 2022-01-28  1474  	evcn1 = le64_to_cpu(attr_b->nres.evcn) + 1;
6a00145b61696d Konstantin Komarov 2022-01-28  1475  	data_size = le64_to_cpu(attr_b->nres.data_size);
6a00145b61696d Konstantin Komarov 2022-01-28  1476  
6a00145b61696d Konstantin Komarov 2022-01-28  1477  	if (svcn <= vcn && vcn < evcn1) {
6a00145b61696d Konstantin Komarov 2022-01-28  1478  		attr = attr_b;
6a00145b61696d Konstantin Komarov 2022-01-28  1479  		le = le_b;
6a00145b61696d Konstantin Komarov 2022-01-28  1480  		mi = mi_b;
6a00145b61696d Konstantin Komarov 2022-01-28  1481  	} else if (!le_b) {
6a00145b61696d Konstantin Komarov 2022-01-28  1482  		err = -EINVAL;
6a00145b61696d Konstantin Komarov 2022-01-28  1483  		goto out;
6a00145b61696d Konstantin Komarov 2022-01-28  1484  	} else {
6a00145b61696d Konstantin Komarov 2022-01-28  1485  		le = le_b;
6a00145b61696d Konstantin Komarov 2022-01-28  1486  		attr = ni_find_attr(ni, attr_b, &le, ATTR_DATA, NULL, 0, &vcn,
6a00145b61696d Konstantin Komarov 2022-01-28  1487  				    &mi);
6a00145b61696d Konstantin Komarov 2022-01-28  1488  		if (!attr) {
6a00145b61696d Konstantin Komarov 2022-01-28  1489  			err = -EINVAL;
6a00145b61696d Konstantin Komarov 2022-01-28  1490  			goto out;
6a00145b61696d Konstantin Komarov 2022-01-28  1491  		}
6a00145b61696d Konstantin Komarov 2022-01-28  1492  		svcn = le64_to_cpu(attr->nres.svcn);
6a00145b61696d Konstantin Komarov 2022-01-28  1493  		evcn1 = le64_to_cpu(attr->nres.evcn) + 1;
6a00145b61696d Konstantin Komarov 2022-01-28  1494  	}
6a00145b61696d Konstantin Komarov 2022-01-28  1495  
6a00145b61696d Konstantin Komarov 2022-01-28  1496  	err = attr_load_runs(attr, ni, run, NULL);
6a00145b61696d Konstantin Komarov 2022-01-28  1497  	if (err)
6a00145b61696d Konstantin Komarov 2022-01-28  1498  		goto out;
6a00145b61696d Konstantin Komarov 2022-01-28  1499  
6a00145b61696d Konstantin Komarov 2022-01-28  1500  	err = attr_is_frame_compressed(ni, attr_b, frame, &clst_data);
6a00145b61696d Konstantin Komarov 2022-01-28  1501  	if (err)
6a00145b61696d Konstantin Komarov 2022-01-28  1502  		goto out;
6a00145b61696d Konstantin Komarov 2022-01-28  1503  
6a00145b61696d Konstantin Komarov 2022-01-28  1504  	total_size -= (u64)clst_data << sbi->cluster_bits;
6a00145b61696d Konstantin Komarov 2022-01-28  1505  
6a00145b61696d Konstantin Komarov 2022-01-28  1506  	len = bytes_to_cluster(sbi, compr_size);
6a00145b61696d Konstantin Komarov 2022-01-28  1507  
6a00145b61696d Konstantin Komarov 2022-01-28  1508  	if (len == clst_data)
6a00145b61696d Konstantin Komarov 2022-01-28  1509  		goto out;
6a00145b61696d Konstantin Komarov 2022-01-28  1510  
6a00145b61696d Konstantin Komarov 2022-01-28  1511  	if (len < clst_data) {
6a00145b61696d Konstantin Komarov 2022-01-28  1512  		err = run_deallocate_ex(sbi, run, vcn + len, clst_data - len,
6a00145b61696d Konstantin Komarov 2022-01-28  1513  					NULL, true);
6a00145b61696d Konstantin Komarov 2022-01-28  1514  		if (err)
6a00145b61696d Konstantin Komarov 2022-01-28  1515  			goto out;
6a00145b61696d Konstantin Komarov 2022-01-28  1516  
6a00145b61696d Konstantin Komarov 2022-01-28  1517  		if (!run_add_entry(run, vcn + len, SPARSE_LCN, clst_data - len,
6a00145b61696d Konstantin Komarov 2022-01-28  1518  				   false)) {
6a00145b61696d Konstantin Komarov 2022-01-28  1519  			err = -ENOMEM;
6a00145b61696d Konstantin Komarov 2022-01-28  1520  			goto out;
6a00145b61696d Konstantin Komarov 2022-01-28  1521  		}
6a00145b61696d Konstantin Komarov 2022-01-28  1522  		end = vcn + clst_data;
a68089bd730ee3 Kari Argillander   2022-01-28  1523  		/* Run contains updated range [vcn + len : end). */
6a00145b61696d Konstantin Komarov 2022-01-28  1524  	} else {
6a00145b61696d Konstantin Komarov 2022-01-28  1525  		CLST alen, hint = 0;
a68089bd730ee3 Kari Argillander   2022-01-28  1526  		/* Get the last LCN to allocate from. */
6a00145b61696d Konstantin Komarov 2022-01-28  1527  		if (vcn + clst_data &&
6a00145b61696d Konstantin Komarov 2022-01-28  1528  		    !run_lookup_entry(run, vcn + clst_data - 1, &hint, NULL,
6a00145b61696d Konstantin Komarov 2022-01-28  1529  				      NULL)) {
6a00145b61696d Konstantin Komarov 2022-01-28  1530  			hint = -1;
6a00145b61696d Konstantin Komarov 2022-01-28  1531  		}
6a00145b61696d Konstantin Komarov 2022-01-28  1532  
6a00145b61696d Konstantin Komarov 2022-01-28  1533  		err = attr_allocate_clusters(sbi, run, vcn + clst_data,
6a00145b61696d Konstantin Komarov 2022-01-28  1534  					     hint + 1, len - clst_data, NULL, 0,
6a00145b61696d Konstantin Komarov 2022-01-28  1535  					     &alen, 0, &lcn);
6a00145b61696d Konstantin Komarov 2022-01-28  1536  		if (err)
6a00145b61696d Konstantin Komarov 2022-01-28  1537  			goto out;
6a00145b61696d Konstantin Komarov 2022-01-28  1538  
6a00145b61696d Konstantin Komarov 2022-01-28  1539  		end = vcn + len;
a68089bd730ee3 Kari Argillander   2022-01-28  1540  		/* Run contains updated range [vcn + clst_data : end). */
6a00145b61696d Konstantin Komarov 2022-01-28  1541  	}
6a00145b61696d Konstantin Komarov 2022-01-28  1542  
6a00145b61696d Konstantin Komarov 2022-01-28  1543  	total_size += (u64)len << sbi->cluster_bits;
6a00145b61696d Konstantin Komarov 2022-01-28  1544  
6a00145b61696d Konstantin Komarov 2022-01-28  1545  repack:
6a00145b61696d Konstantin Komarov 2022-01-28  1546  	err = mi_pack_runs(mi, attr, run, max(end, evcn1) - svcn);
6a00145b61696d Konstantin Komarov 2022-01-28  1547  	if (err)
6a00145b61696d Konstantin Komarov 2022-01-28  1548  		goto out;
6a00145b61696d Konstantin Komarov 2022-01-28  1549  
6a00145b61696d Konstantin Komarov 2022-01-28  1550  	attr_b->nres.total_size = cpu_to_le64(total_size);
6a00145b61696d Konstantin Komarov 2022-01-28  1551  	inode_set_bytes(&ni->vfs_inode, total_size);
6a00145b61696d Konstantin Komarov 2022-01-28  1552  
6a00145b61696d Konstantin Komarov 2022-01-28  1553  	mi_b->dirty = true;
6a00145b61696d Konstantin Komarov 2022-01-28  1554  	mark_inode_dirty(&ni->vfs_inode);
6a00145b61696d Konstantin Komarov 2022-01-28  1555  
a68089bd730ee3 Kari Argillander   2022-01-28  1556  	/* Stored [vcn : next_svcn) from [vcn : end). */
6a00145b61696d Konstantin Komarov 2022-01-28  1557  	next_svcn = le64_to_cpu(attr->nres.evcn) + 1;
6a00145b61696d Konstantin Komarov 2022-01-28  1558  
6a00145b61696d Konstantin Komarov 2022-01-28  1559  	if (end <= evcn1) {
6a00145b61696d Konstantin Komarov 2022-01-28  1560  		if (next_svcn == evcn1) {
a68089bd730ee3 Kari Argillander   2022-01-28  1561  			/* Normal way. Update attribute and exit. */
6a00145b61696d Konstantin Komarov 2022-01-28  1562  			goto ok;
6a00145b61696d Konstantin Komarov 2022-01-28  1563  		}
a68089bd730ee3 Kari Argillander   2022-01-28  1564  		/* Add new segment [next_svcn : evcn1 - next_svcn). */
6a00145b61696d Konstantin Komarov 2022-01-28  1565  		if (!ni->attr_list.size) {
6a00145b61696d Konstantin Komarov 2022-01-28  1566  			err = ni_create_attr_list(ni);
6a00145b61696d Konstantin Komarov 2022-01-28  1567  			if (err)
6a00145b61696d Konstantin Komarov 2022-01-28  1568  				goto out;
a68089bd730ee3 Kari Argillander   2022-01-28  1569  			/* Layout of records is changed. */
6a00145b61696d Konstantin Komarov 2022-01-28  1570  			le_b = NULL;
6a00145b61696d Konstantin Komarov 2022-01-28  1571  			attr_b = ni_find_attr(ni, NULL, &le_b, ATTR_DATA, NULL,
6a00145b61696d Konstantin Komarov 2022-01-28  1572  					      0, NULL, &mi_b);
6a00145b61696d Konstantin Komarov 2022-01-28 @1573  			if (!attr_b) {
6a00145b61696d Konstantin Komarov 2022-01-28  1574  				err = -ENOENT;
6a00145b61696d Konstantin Komarov 2022-01-28  1575  				goto out;

This error path will crash.  attr_b is NULL.

6a00145b61696d Konstantin Komarov 2022-01-28  1576  			}
6a00145b61696d Konstantin Komarov 2022-01-28  1577  
6a00145b61696d Konstantin Komarov 2022-01-28  1578  			attr = attr_b;
6a00145b61696d Konstantin Komarov 2022-01-28  1579  			le = le_b;
6a00145b61696d Konstantin Komarov 2022-01-28  1580  			mi = mi_b;
6a00145b61696d Konstantin Komarov 2022-01-28  1581  			goto repack;
6a00145b61696d Konstantin Komarov 2022-01-28  1582  		}
6a00145b61696d Konstantin Komarov 2022-01-28  1583  	}
6a00145b61696d Konstantin Komarov 2022-01-28  1584  
6a00145b61696d Konstantin Komarov 2022-01-28  1585  	svcn = evcn1;
6a00145b61696d Konstantin Komarov 2022-01-28  1586  
a68089bd730ee3 Kari Argillander   2022-01-28  1587  	/* Estimate next attribute. */
6a00145b61696d Konstantin Komarov 2022-01-28  1588  	attr = ni_find_attr(ni, attr, &le, ATTR_DATA, NULL, 0, &svcn, &mi);
6a00145b61696d Konstantin Komarov 2022-01-28  1589  
6a00145b61696d Konstantin Komarov 2022-01-28  1590  	if (attr) {
6a00145b61696d Konstantin Komarov 2022-01-28  1591  		CLST alloc = bytes_to_cluster(
6a00145b61696d Konstantin Komarov 2022-01-28  1592  			sbi, le64_to_cpu(attr_b->nres.alloc_size));
6a00145b61696d Konstantin Komarov 2022-01-28  1593  		CLST evcn = le64_to_cpu(attr->nres.evcn);
6a00145b61696d Konstantin Komarov 2022-01-28  1594  
6a00145b61696d Konstantin Komarov 2022-01-28  1595  		if (end < next_svcn)
6a00145b61696d Konstantin Komarov 2022-01-28  1596  			end = next_svcn;
6a00145b61696d Konstantin Komarov 2022-01-28  1597  		while (end > evcn) {
a68089bd730ee3 Kari Argillander   2022-01-28  1598  			/* Remove segment [svcn : evcn). */
cde96c417f3996 Konstantin Komarov 2022-01-28  1599  			mi_remove_attr(NULL, mi, attr);
6a00145b61696d Konstantin Komarov 2022-01-28  1600  
6a00145b61696d Konstantin Komarov 2022-01-28  1601  			if (!al_remove_le(ni, le)) {
6a00145b61696d Konstantin Komarov 2022-01-28  1602  				err = -EINVAL;
6a00145b61696d Konstantin Komarov 2022-01-28  1603  				goto out;
6a00145b61696d Konstantin Komarov 2022-01-28  1604  			}
6a00145b61696d Konstantin Komarov 2022-01-28  1605  
6a00145b61696d Konstantin Komarov 2022-01-28  1606  			if (evcn + 1 >= alloc) {
a68089bd730ee3 Kari Argillander   2022-01-28  1607  				/* Last attribute segment. */
6a00145b61696d Konstantin Komarov 2022-01-28  1608  				evcn1 = evcn + 1;
6a00145b61696d Konstantin Komarov 2022-01-28  1609  				goto ins_ext;
6a00145b61696d Konstantin Komarov 2022-01-28  1610  			}
6a00145b61696d Konstantin Komarov 2022-01-28  1611  
6a00145b61696d Konstantin Komarov 2022-01-28  1612  			if (ni_load_mi(ni, le, &mi)) {
6a00145b61696d Konstantin Komarov 2022-01-28  1613  				attr = NULL;
6a00145b61696d Konstantin Komarov 2022-01-28  1614  				goto out;
6a00145b61696d Konstantin Komarov 2022-01-28  1615  			}
6a00145b61696d Konstantin Komarov 2022-01-28  1616  
6a00145b61696d Konstantin Komarov 2022-01-28  1617  			attr = mi_find_attr(mi, NULL, ATTR_DATA, NULL, 0,
6a00145b61696d Konstantin Komarov 2022-01-28  1618  					    &le->id);
6a00145b61696d Konstantin Komarov 2022-01-28  1619  			if (!attr) {
6a00145b61696d Konstantin Komarov 2022-01-28  1620  				err = -EINVAL;
6a00145b61696d Konstantin Komarov 2022-01-28  1621  				goto out;
6a00145b61696d Konstantin Komarov 2022-01-28  1622  			}
6a00145b61696d Konstantin Komarov 2022-01-28  1623  			svcn = le64_to_cpu(attr->nres.svcn);
6a00145b61696d Konstantin Komarov 2022-01-28  1624  			evcn = le64_to_cpu(attr->nres.evcn);
6a00145b61696d Konstantin Komarov 2022-01-28  1625  		}
6a00145b61696d Konstantin Komarov 2022-01-28  1626  
6a00145b61696d Konstantin Komarov 2022-01-28  1627  		if (end < svcn)
6a00145b61696d Konstantin Komarov 2022-01-28  1628  			end = svcn;
6a00145b61696d Konstantin Komarov 2022-01-28  1629  
6a00145b61696d Konstantin Komarov 2022-01-28  1630  		err = attr_load_runs(attr, ni, run, &end);
6a00145b61696d Konstantin Komarov 2022-01-28  1631  		if (err)
6a00145b61696d Konstantin Komarov 2022-01-28  1632  			goto out;
6a00145b61696d Konstantin Komarov 2022-01-28  1633  
6a00145b61696d Konstantin Komarov 2022-01-28  1634  		evcn1 = evcn + 1;
6a00145b61696d Konstantin Komarov 2022-01-28  1635  		attr->nres.svcn = cpu_to_le64(next_svcn);
6a00145b61696d Konstantin Komarov 2022-01-28  1636  		err = mi_pack_runs(mi, attr, run, evcn1 - next_svcn);
6a00145b61696d Konstantin Komarov 2022-01-28  1637  		if (err)
6a00145b61696d Konstantin Komarov 2022-01-28  1638  			goto out;
6a00145b61696d Konstantin Komarov 2022-01-28  1639  
6a00145b61696d Konstantin Komarov 2022-01-28  1640  		le->vcn = cpu_to_le64(next_svcn);
6a00145b61696d Konstantin Komarov 2022-01-28  1641  		ni->attr_list.dirty = true;
6a00145b61696d Konstantin Komarov 2022-01-28  1642  		mi->dirty = true;
6a00145b61696d Konstantin Komarov 2022-01-28  1643  
6a00145b61696d Konstantin Komarov 2022-01-28  1644  		next_svcn = le64_to_cpu(attr->nres.evcn) + 1;
6a00145b61696d Konstantin Komarov 2022-01-28  1645  	}
6a00145b61696d Konstantin Komarov 2022-01-28  1646  ins_ext:
6a00145b61696d Konstantin Komarov 2022-01-28  1647  	if (evcn1 > next_svcn) {
6a00145b61696d Konstantin Komarov 2022-01-28  1648  		err = ni_insert_nonresident(ni, ATTR_DATA, NULL, 0, run,
6a00145b61696d Konstantin Komarov 2022-01-28  1649  					    next_svcn, evcn1 - next_svcn,
6a00145b61696d Konstantin Komarov 2022-01-28  1650  					    attr_b->flags, &attr, &mi);
6a00145b61696d Konstantin Komarov 2022-01-28  1651  		if (err)
6a00145b61696d Konstantin Komarov 2022-01-28  1652  			goto out;
6a00145b61696d Konstantin Komarov 2022-01-28  1653  	}
6a00145b61696d Konstantin Komarov 2022-01-28  1654  ok:
6a00145b61696d Konstantin Komarov 2022-01-28  1655  	run_truncate_around(run, vcn);
6a00145b61696d Konstantin Komarov 2022-01-28  1656  out:
6a00145b61696d Konstantin Komarov 2022-01-28  1657  	if (new_valid > data_size)
6a00145b61696d Konstantin Komarov 2022-01-28  1658  		new_valid = data_size;
6a00145b61696d Konstantin Komarov 2022-01-28  1659  
6a00145b61696d Konstantin Komarov 2022-01-28 @1660  	valid_size = le64_to_cpu(attr_b->nres.valid_size);
6a00145b61696d Konstantin Komarov 2022-01-28  1661  	if (new_valid != valid_size) {
6a00145b61696d Konstantin Komarov 2022-01-28  1662  		attr_b->nres.valid_size = cpu_to_le64(valid_size);
6a00145b61696d Konstantin Komarov 2022-01-28  1663  		mi_b->dirty = true;
6a00145b61696d Konstantin Komarov 2022-01-28  1664  	}
6a00145b61696d Konstantin Komarov 2022-01-28  1665  
6a00145b61696d Konstantin Komarov 2022-01-28  1666  	return err;
6a00145b61696d Konstantin Komarov 2022-01-28  1667  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

