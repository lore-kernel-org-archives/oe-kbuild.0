Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481E118B497
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Aug 2024 09:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724145992; cv=none; b=c4c4DKuJuf5SCNVwnbfg9lnpr5QeD6J3iP1Q6YhOpwFAlErrHgCnlY1IbKFNpyjxpF/JDiquxrQ+XEhKoJAybxyuaS4hICKT7h5VyAsiEqdPpn3dQI5ynVOt3VO2m61QeF/yFKal+Gti9JJDcFlhJkZ3N7sPsWulKk2UAWkH0IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724145992; c=relaxed/simple;
	bh=hmMs9/eC9wa9H6PuhrC1zud4HJqCAO4xeyVC479eC2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lrE0RIWV+bscsc2LcMx0KnpsFSOeJMCzhajgCXY3cWLVmUhE6e8QzCRKk4sGcks6e+I7UnZ3okADEGCkZjwetKQo63DEjHkaVN6PkLz9c/F5foupcoVObk2XuDQjA4il3Hko43/PGgcYFwFgH4YaaIgjFY37wCFEtrQ7KP0Y/pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=muHETbx5; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="muHETbx5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724145991; x=1755681991;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hmMs9/eC9wa9H6PuhrC1zud4HJqCAO4xeyVC479eC2Y=;
  b=muHETbx5wAzV0tS5lY/ULFRqDSFyUQneUxX5TgHjzKrbS+vbHuSERIxz
   fmOzDlA0HzAshDFwjKhOE5O3YPE5FrI1EJMbpuhTtLNj/3zKvlK9u4hF4
   mJ2TfqNTqXPCubH88/gf1bqHU4OcgMcFk/1O8rPKKX+P5scbdA57bbogU
   yPaqtFipY7kzXgWfMS2c8gnglFS2f1FWEfoUMvRMB3L+6IRVPkDKWqao/
   4ctTgeJ1BOPGj8VY9kYk6xLSLv+LP2DdKWsO17MqU6WE94pJb8qHP7B79
   mfL/8dnoi14LCsAgNjbJnLawBOhfreV1ZC4gLLDLG8/bN0EOVz1vOJSLl
   Q==;
X-CSE-ConnectionGUID: OH8W/nsMQbaKiY2MbPNvNg==
X-CSE-MsgGUID: yWva2In2QoOfepRO/Dv1hA==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="44955854"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="44955854"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 02:26:28 -0700
X-CSE-ConnectionGUID: I1v7wEduQ5K4xKfFfgbQEg==
X-CSE-MsgGUID: j4EE1/VUQB6m9bjGCXrESQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="98132865"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Aug 2024 02:26:26 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgL8C-0009yB-22;
	Tue, 20 Aug 2024 09:26:24 +0000
Date: Tue, 20 Aug 2024 17:25:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:rw_iter 142/447] drivers/gpu/drm/drm_mipi_dbi.c:1386
 mipi_dbi_debugfs_command_write() warn: potential spectre issue 'buf' [w]
 (local cap)
Message-ID: <202408201700.TTU0t7dM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   2e5eb501c913b2c9440308f4afe547f0cb6a7678
commit: fffd96f3a4e84151c9705f3a3e494ec271831c18 [142/447] drm: mipi: convert to read/write iterators
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20240820 (https://download.01.org/0day-ci/archive/20240820/202408201700.TTU0t7dM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408201700.TTU0t7dM-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/drm_mipi_dbi.c:1386 mipi_dbi_debugfs_command_write() warn: potential spectre issue 'buf' [w] (local cap)

vim +/buf +1386 drivers/gpu/drm/drm_mipi_dbi.c

02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1364  
fffd96f3a4e8415 drivers/gpu/drm/drm_mipi_dbi.c     Jens Axboe     2024-04-09  1365  static ssize_t mipi_dbi_debugfs_command_write(struct kiocb *iocb,
fffd96f3a4e8415 drivers/gpu/drm/drm_mipi_dbi.c     Jens Axboe     2024-04-09  1366  					      struct iov_iter *from)
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1367  {
fffd96f3a4e8415 drivers/gpu/drm/drm_mipi_dbi.c     Jens Axboe     2024-04-09  1368  	struct seq_file *m = iocb->ki_filp->private_data;
84137b866e834ac drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2019-07-22  1369  	struct mipi_dbi_dev *dbidev = m->private;
fffd96f3a4e8415 drivers/gpu/drm/drm_mipi_dbi.c     Jens Axboe     2024-04-09  1370  	size_t count = iov_iter_count(from);
b401f34314db7c6 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-02-23  1371  	u8 val, cmd = 0, parameters[64];
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1372  	char *buf, *pos, *token;
d72cf01f410aa09 drivers/gpu/drm/drm_mipi_dbi.c     Dan Carpenter  2019-08-21  1373  	int i, ret, idx;
9d5645ad1b979c9 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2019-02-25  1374  
84137b866e834ac drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2019-07-22  1375  	if (!drm_dev_enter(&dbidev->drm, &idx))
9d5645ad1b979c9 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2019-02-25  1376  		return -ENODEV;
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1377  
fffd96f3a4e8415 drivers/gpu/drm/drm_mipi_dbi.c     Jens Axboe     2024-04-09  1378  	buf = iterdup_nul(from, count);
9d5645ad1b979c9 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2019-02-25  1379  	if (IS_ERR(buf)) {
9d5645ad1b979c9 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2019-02-25  1380  		ret = PTR_ERR(buf);
9d5645ad1b979c9 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2019-02-25  1381  		goto err_exit;
9d5645ad1b979c9 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2019-02-25  1382  	}
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1383  
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1384  	/* strip trailing whitespace */
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1385  	for (i = count - 1; i > 0; i--)
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22 @1386  		if (isspace(buf[i]))
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1387  			buf[i] = '\0';
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1388  		else
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1389  			break;
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1390  	i = 0;
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1391  	pos = buf;
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1392  	while (pos) {
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1393  		token = strsep(&pos, " ");
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1394  		if (!token) {
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1395  			ret = -EINVAL;
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1396  			goto err_free;
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1397  		}
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1398  
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1399  		ret = kstrtou8(token, 16, &val);
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1400  		if (ret < 0)
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1401  			goto err_free;
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1402  
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1403  		if (token == buf)
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1404  			cmd = val;
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1405  		else
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1406  			parameters[i++] = val;
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1407  
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1408  		if (i == 64) {
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1409  			ret = -E2BIG;
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1410  			goto err_free;
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1411  		}
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1412  	}
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1413  
84137b866e834ac drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2019-07-22  1414  	ret = mipi_dbi_command_buf(&dbidev->dbi, cmd, parameters, i);
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1415  
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1416  err_free:
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1417  	kfree(buf);
9d5645ad1b979c9 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2019-02-25  1418  err_exit:
9d5645ad1b979c9 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2019-02-25  1419  	drm_dev_exit(idx);
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1420  
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1421  	return ret < 0 ? ret : count;
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1422  }
02dd95fe3169362 drivers/gpu/drm/tinydrm/mipi-dbi.c Noralf Trønnes 2017-01-22  1423  

:::::: The code at line 1386 was first introduced by commit
:::::: 02dd95fe316936269a52d6ccb971bb956412b40a drm/tinydrm: Add MIPI DBI support

:::::: TO: Noralf Trønnes <noralf@tronnes.org>
:::::: CC: Noralf Trønnes <noralf@tronnes.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
