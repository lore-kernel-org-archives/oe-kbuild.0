Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1D22FE575
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Mar 2026 01:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773970214; cv=none; b=CONKJevqPU3viZO7M5Q2yoWPQH+KzdWgItwekEa3NVhnO6fp/SbMbe+1UZhw98oxK3iRCWGrSoh4TVdLyyHg0DaqaCAgirZjYFo4oZBxN5sijn0qEV644jw8bwWylw0XCEvct4FnZ3AqpZKG0DjS/pXGnm0VnBYxTRNgxBD6tH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773970214; c=relaxed/simple;
	bh=od1WgNsz/i5LuxYTz0eVir4Yeikx5euW4iDiIYdAU14=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Z2ctKXd5qu+ZgKRpr8sTAJCzsiUwC9XG4CL3hIR6ib8y0i9EowB8a/a/ytSli2eYxSds8jNrm3ViJyxMvJ/aoG/sG65HtxSBskfAqltM/u3KkjhWbi6WtC13mZDkyR4B+r60UD17OxNeraD9+WQfaIDqze5eDu/RxZq08e/AQNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e61fD++O; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e61fD++O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773970211; x=1805506211;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=od1WgNsz/i5LuxYTz0eVir4Yeikx5euW4iDiIYdAU14=;
  b=e61fD++Ox2qrBLFx6aVoBgDDQQnbL2ZYmNeFBtI2qSQZXlYx3YYYpUl7
   IUOphaMS3R2PZQEjwtDOgmosr4Hy/eRIv1MzOO9ay9FZQ8TlS0dSCZIhe
   W4cvB3nF/IfRcDC19AtxeDXPEC0/gto2gvPDOQrpCVgZp5bjArCDAIzux
   OsG3wDePnq72/yaUfdcT3rN0STcovlpVFolU8o9rnh/CC+3BQ9u2h2MLf
   Y2SzkaCPtmBL4iznYENBji3KpUxe7/jompR4YeQAQNz7SH4LH09ksOsWB
   0lHcEfizxrpF4T6CrS3+SbtzrXNqUHrYfFYWOa4JG7ThtfZbckOG2dPk5
   A==;
X-CSE-ConnectionGUID: kurr/YQDT3WENIy48jbf0w==
X-CSE-MsgGUID: wKgDevQpSoGBlcoa3pVLIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="75239858"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="75239858"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 18:30:10 -0700
X-CSE-ConnectionGUID: uCGv8jVGSeiYfdMCHQB1YQ==
X-CSE-MsgGUID: iw69w8crTXm1e2hAwbYD+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="227616522"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 19 Mar 2026 18:30:09 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3Ogg-000000001qT-3itk;
	Fri, 20 Mar 2026 01:30:06 +0000
Date: Fri, 20 Mar 2026 09:29:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 141/539] drivers/gpu/drm/drm_mipi_dbi.c:1398
 mipi_dbi_debugfs_command_write() warn: potential spectre issue 'buf' [w]
 (local cap)
Message-ID: <202603200950.8gTRTwkK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_=
iter
head:   f36e0fb8d552bd827ef31f4fc1190d0149c44249
commit: 36103a518a798049c0ae81d9a8a47a62e9102d20 [141/539] drm: mipi: conve=
rt to read/write iterators
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: riscv-randconfig-r071-20260320 (https://download.01.org/0day-ci/arc=
hive/20260320/202603200950.8gTRTwkK-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4ab=
b927bacf37f18f6359a41639a6d1b3bffffb5)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603200950.8gTRTwkK-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/drm_mipi_dbi.c:1398 mipi_dbi_debugfs_command_write() warn: =
potential spectre issue 'buf' [w] (local cap)

vim +/buf +1398 drivers/gpu/drm/drm_mipi_dbi.c

02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1376 =20
36103a518a7980 drivers/gpu/drm/drm_mipi_dbi.c     Jens Axboe     2024-04-09=
  1377  static ssize_t mipi_dbi_debugfs_command_write(struct kiocb *iocb,
36103a518a7980 drivers/gpu/drm/drm_mipi_dbi.c     Jens Axboe     2024-04-09=
  1378  					      struct iov_iter *from)
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1379  {
36103a518a7980 drivers/gpu/drm/drm_mipi_dbi.c     Jens Axboe     2024-04-09=
  1380  	struct seq_file *m =3D iocb->ki_filp->private_data;
84137b866e834a drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2019-=
07-22  1381  	struct mipi_dbi_dev *dbidev =3D m->private;
36103a518a7980 drivers/gpu/drm/drm_mipi_dbi.c     Jens Axboe     2024-04-09=
  1382  	size_t count =3D iov_iter_count(from);
b401f34314db7c drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
02-23  1383  	u8 val, cmd =3D 0, parameters[64];
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1384  	char *buf, *pos, *token;
d72cf01f410aa0 drivers/gpu/drm/drm_mipi_dbi.c     Dan Carpenter  2019-08-21=
  1385  	int i, ret, idx;
9d5645ad1b979c drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2019-=
02-25  1386 =20
84137b866e834a drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2019-=
07-22  1387  	if (!drm_dev_enter(&dbidev->drm, &idx))
9d5645ad1b979c drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2019-=
02-25  1388  		return -ENODEV;
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1389 =20
36103a518a7980 drivers/gpu/drm/drm_mipi_dbi.c     Jens Axboe     2024-04-09=
  1390  	buf =3D iterdup_nul(from, count);
9d5645ad1b979c drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2019-=
02-25  1391  	if (IS_ERR(buf)) {
9d5645ad1b979c drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2019-=
02-25  1392  		ret =3D PTR_ERR(buf);
9d5645ad1b979c drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2019-=
02-25  1393  		goto err_exit;
9d5645ad1b979c drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2019-=
02-25  1394  	}
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1395 =20
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1396  	/* strip trailing whitespace */
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1397  	for (i =3D count - 1; i > 0; i--)
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22 @1398  		if (isspace(buf[i]))
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1399  			buf[i] =3D '\0';
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1400  		else
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1401  			break;
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1402  	i =3D 0;
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1403  	pos =3D buf;
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1404  	while (pos) {
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1405  		token =3D strsep(&pos, " ");
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1406  		if (!token) {
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1407  			ret =3D -EINVAL;
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1408  			goto err_free;
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1409  		}
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1410 =20
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1411  		ret =3D kstrtou8(token, 16, &val);
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1412  		if (ret < 0)
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1413  			goto err_free;
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1414 =20
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1415  		if (token =3D=3D buf)
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1416  			cmd =3D val;
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1417  		else
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1418  			parameters[i++] =3D val;
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1419 =20
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1420  		if (i =3D=3D 64) {
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1421  			ret =3D -E2BIG;
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1422  			goto err_free;
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1423  		}
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1424  	}
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1425 =20
84137b866e834a drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2019-=
07-22  1426  	ret =3D mipi_dbi_command_buf(&dbidev->dbi, cmd, parameters, i=
);
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1427 =20
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1428  err_free:
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1429  	kfree(buf);
9d5645ad1b979c drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2019-=
02-25  1430  err_exit:
9d5645ad1b979c drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2019-=
02-25  1431  	drm_dev_exit(idx);
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1432 =20
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1433  	return ret < 0 ? ret : count;
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1434  }
02dd95fe316936 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Tr=C3=B8nnes 2017-=
01-22  1435 =20

:::::: The code at line 1398 was first introduced by commit
:::::: 02dd95fe316936269a52d6ccb971bb956412b40a drm/tinydrm: Add MIPI DBI s=
upport

:::::: TO: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
:::::: CC: Noralf Tr=C3=B8nnes <noralf@tronnes.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
