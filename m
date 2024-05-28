Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4492629C
	for <oe-kbuild@lists.linux.dev>; Tue, 28 May 2024 07:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716881578; cv=none; b=r2zbd7ZLZh11XkYz7/+GtqR31tSK2bT6oszCbE4Gnjgnvr7StiYHIJCha3tLummZNZcyl7l55dBRCwTRRCVRorfwonKThwJM+7Dwk13XV90CVNj2E6y24/syIeVnhWMskpUcdGKhp9jP5DoiNENZ3XaBjhgwSSqL84KlHlt85kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716881578; c=relaxed/simple;
	bh=9ARu8Cr1Qx68WNaGkj/AXdrs3QRTpx1+GUhainWq2xE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u3WKn84SAraFGVMvibh1lAuhXwKq2XF9pXfwBdOmUQVDFJimxQy0KhBe6f519wukL+pixbnrZmUWQQ47CDZxW8ZW4GMmU/i5jEQyWbXLkI/OiScPipPo1JAGfphPpeuPGENxip2kVCQKAuOU6Dba9hCNSdLUim8Z+RfidZt46SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hnpfd5wU; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hnpfd5wU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716881576; x=1748417576;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9ARu8Cr1Qx68WNaGkj/AXdrs3QRTpx1+GUhainWq2xE=;
  b=Hnpfd5wUxYyetKh7jx0FLId5cCp6XQxgNNtoRQ9i8j+uwEMk/mftTkwE
   bWDqyRa61dFKAk/acItG3lE7OIb6dfMAtUXxZTjr0eawFKo8VtDNG34fb
   HRO0wo/X9Guc3R1YhOtw0MAPAX5ot5VFI5WwJuajzaEpF1PYL5Zk6Auks
   VIwcEKdp9+4Ee0BoA2UhUlWo4nzMf4wz/qTk0YJ3Pdfn2fvKzX7Xd8RWh
   Isk2YdbyAtSIViUudWTGTwnnkj6Y56l4RLdB98SUYob7t2ooyI/Qh2i0N
   Qrbs/YDBzEv3TlZmhha3RWOOeT25wDSHyyL8F04/RMH4YjvD5qPN5sWzg
   g==;
X-CSE-ConnectionGUID: TBYwXaWMSNuUUgD70IauHw==
X-CSE-MsgGUID: DjTiLqqKTXqO3aPghXYvlA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13430157"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="13430157"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 00:32:55 -0700
X-CSE-ConnectionGUID: a97IFQhDSBaQmh0JsXIPHg==
X-CSE-MsgGUID: vXQrfpfVTw+MMvQBD3r0Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="35464624"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 28 May 2024 00:32:54 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBrKF-000Bpv-2A;
	Tue, 28 May 2024 07:32:51 +0000
Date: Tue, 28 May 2024 15:32:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 9/9] drivers: iio: imu: Add support for adis1657x
 family
Message-ID: <202405281539.EXGy0dhk-lkp@intel.com>
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
In-Reply-To: <20240527142618.275897-10-ramona.bolboaca13@gmail.com>
References: <20240527142618.275897-10-ramona.bolboaca13@gmail.com>
TO: Ramona Gradinariu <ramona.bolboaca13@gmail.com>
TO: linux-kernel@vger.kernel.org
TO: jic23@kernel.org
TO: linux-iio@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: conor+dt@kernel.org
TO: krzysztof.kozlowski+dt@linaro.org
TO: robh@kernel.org
TO: nuno.sa@analog.com
CC: Ramona Gradinariu <ramona.bolboaca13@gmail.com>

Hi Ramona,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[cannot apply to linus/master v6.10-rc1 next-20240523]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ramona-Gradinariu/dt-bindings-iio-imu-Add-ADIS16501-compatibles/20240527-230203
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20240527142618.275897-10-ramona.bolboaca13%40gmail.com
patch subject: [PATCH v5 9/9] drivers: iio: imu: Add support for adis1657x family
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: x86_64-randconfig-161-20240528 (https://download.01.org/0day-ci/archive/20240528/202405281539.EXGy0dhk-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405281539.EXGy0dhk-lkp@intel.com/

smatch warnings:
drivers/iio/imu/adis16475.c:1608 adis16475_push_single_sample() warn: missing error code? 'ret'

vim +/ret +1608 drivers/iio/imu/adis16475.c

fff7352bf7a3ce Nuno Sá           2020-04-13  1576  
c49e2871e50119 Ramona Gradinariu 2024-05-27  1577  static int adis16475_push_single_sample(struct iio_poll_func *pf)
fff7352bf7a3ce Nuno Sá           2020-04-13  1578  {
fff7352bf7a3ce Nuno Sá           2020-04-13  1579  	struct iio_dev *indio_dev = pf->indio_dev;
fff7352bf7a3ce Nuno Sá           2020-04-13  1580  	struct adis16475 *st = iio_priv(indio_dev);
fff7352bf7a3ce Nuno Sá           2020-04-13  1581  	struct adis *adis = &st->adis;
8f6bc87d67c030 Ramona Bolboaca   2023-08-08  1582  	int ret, bit, buff_offset = 0, i = 0;
fff7352bf7a3ce Nuno Sá           2020-04-13  1583  	__be16 *buffer;
fff7352bf7a3ce Nuno Sá           2020-04-13  1584  	u16 crc;
fff7352bf7a3ce Nuno Sá           2020-04-13  1585  	bool valid;
7f174ee4adeb12 Ramona Gradinariu 2024-05-27  1586  	u8 crc_offset = 9;
7f174ee4adeb12 Ramona Gradinariu 2024-05-27  1587  	u16 burst_size = ADIS16475_BURST_MAX_DATA;
7f174ee4adeb12 Ramona Gradinariu 2024-05-27  1588  	u16 start_idx = (st->info->flags & ADIS16475_HAS_TIMESTAMP32) ? 2 : 0;
7f174ee4adeb12 Ramona Gradinariu 2024-05-27  1589  
fff7352bf7a3ce Nuno Sá           2020-04-13  1590  	/* offset until the first element after gyro and accel */
fff7352bf7a3ce Nuno Sá           2020-04-13  1591  	const u8 offset = st->burst32 ? 13 : 7;
fff7352bf7a3ce Nuno Sá           2020-04-13  1592  
7f174ee4adeb12 Ramona Gradinariu 2024-05-27  1593  	if (st->burst32) {
7f174ee4adeb12 Ramona Gradinariu 2024-05-27  1594  		crc_offset = (st->info->flags & ADIS16475_HAS_TIMESTAMP32) ? 16 : 15;
7f174ee4adeb12 Ramona Gradinariu 2024-05-27  1595  		burst_size = adis->data->burst_max_len;
7f174ee4adeb12 Ramona Gradinariu 2024-05-27  1596  	}
7f174ee4adeb12 Ramona Gradinariu 2024-05-27  1597  
fff7352bf7a3ce Nuno Sá           2020-04-13  1598  	ret = spi_sync(adis->spi, &adis->msg);
fff7352bf7a3ce Nuno Sá           2020-04-13  1599  	if (ret)
7f174ee4adeb12 Ramona Gradinariu 2024-05-27  1600  		return ret;
fff7352bf7a3ce Nuno Sá           2020-04-13  1601  
fff7352bf7a3ce Nuno Sá           2020-04-13  1602  	buffer = adis->buffer;
fff7352bf7a3ce Nuno Sá           2020-04-13  1603  
7f174ee4adeb12 Ramona Gradinariu 2024-05-27  1604  	crc = be16_to_cpu(buffer[crc_offset]);
7f174ee4adeb12 Ramona Gradinariu 2024-05-27  1605  	valid = adis16475_validate_crc(adis->buffer, crc, burst_size, start_idx);
fff7352bf7a3ce Nuno Sá           2020-04-13  1606  	if (!valid) {
fff7352bf7a3ce Nuno Sá           2020-04-13  1607  		dev_err(&adis->spi->dev, "Invalid crc\n");
7f174ee4adeb12 Ramona Gradinariu 2024-05-27 @1608  		return ret;
fff7352bf7a3ce Nuno Sá           2020-04-13  1609  	}
fff7352bf7a3ce Nuno Sá           2020-04-13  1610  
fff7352bf7a3ce Nuno Sá           2020-04-13  1611  	for_each_set_bit(bit, indio_dev->active_scan_mask,
fff7352bf7a3ce Nuno Sá           2020-04-13  1612  			 indio_dev->masklength) {
fff7352bf7a3ce Nuno Sá           2020-04-13  1613  		/*
fff7352bf7a3ce Nuno Sá           2020-04-13  1614  		 * When burst mode is used, system flags is the first data
fff7352bf7a3ce Nuno Sá           2020-04-13  1615  		 * channel in the sequence, but the scan index is 7.
fff7352bf7a3ce Nuno Sá           2020-04-13  1616  		 */
fff7352bf7a3ce Nuno Sá           2020-04-13  1617  		switch (bit) {
fff7352bf7a3ce Nuno Sá           2020-04-13  1618  		case ADIS16475_SCAN_TEMP:
fff7352bf7a3ce Nuno Sá           2020-04-13  1619  			st->data[i++] = buffer[offset];
d2d1ecc67c48ca Ramona Gradinariu 2023-09-26  1620  			/*
d2d1ecc67c48ca Ramona Gradinariu 2023-09-26  1621  			 * The temperature channel has 16-bit storage size.
d2d1ecc67c48ca Ramona Gradinariu 2023-09-26  1622  			 * We need to perform the padding to have the buffer
d2d1ecc67c48ca Ramona Gradinariu 2023-09-26  1623  			 * elements naturally aligned in case there are any
d2d1ecc67c48ca Ramona Gradinariu 2023-09-26  1624  			 * 32-bit storage size channels enabled which have a
d2d1ecc67c48ca Ramona Gradinariu 2023-09-26  1625  			 * scan index higher than the temperature channel scan
d2d1ecc67c48ca Ramona Gradinariu 2023-09-26  1626  			 * index.
d2d1ecc67c48ca Ramona Gradinariu 2023-09-26  1627  			 */
d2d1ecc67c48ca Ramona Gradinariu 2023-09-26  1628  			if (*indio_dev->active_scan_mask & GENMASK(ADIS16475_SCAN_DELTVEL_Z, ADIS16475_SCAN_DELTANG_X))
d2d1ecc67c48ca Ramona Gradinariu 2023-09-26  1629  				st->data[i++] = 0;
fff7352bf7a3ce Nuno Sá           2020-04-13  1630  			break;
8f6bc87d67c030 Ramona Bolboaca   2023-08-08  1631  		case ADIS16475_SCAN_DELTANG_X ... ADIS16475_SCAN_DELTVEL_Z:
8f6bc87d67c030 Ramona Bolboaca   2023-08-08  1632  			buff_offset = ADIS16475_SCAN_DELTANG_X;
8f6bc87d67c030 Ramona Bolboaca   2023-08-08  1633  			fallthrough;
fff7352bf7a3ce Nuno Sá           2020-04-13  1634  		case ADIS16475_SCAN_GYRO_X ... ADIS16475_SCAN_ACCEL_Z:
fff7352bf7a3ce Nuno Sá           2020-04-13  1635  			/*
fff7352bf7a3ce Nuno Sá           2020-04-13  1636  			 * The first 2 bytes on the received data are the
fff7352bf7a3ce Nuno Sá           2020-04-13  1637  			 * DIAG_STAT reg, hence the +1 offset here...
fff7352bf7a3ce Nuno Sá           2020-04-13  1638  			 */
fff7352bf7a3ce Nuno Sá           2020-04-13  1639  			if (st->burst32) {
fff7352bf7a3ce Nuno Sá           2020-04-13  1640  				/* upper 16 */
8f6bc87d67c030 Ramona Bolboaca   2023-08-08  1641  				st->data[i++] = buffer[(bit - buff_offset) * 2 + 2];
fff7352bf7a3ce Nuno Sá           2020-04-13  1642  				/* lower 16 */
8f6bc87d67c030 Ramona Bolboaca   2023-08-08  1643  				st->data[i++] = buffer[(bit - buff_offset) * 2 + 1];
fff7352bf7a3ce Nuno Sá           2020-04-13  1644  			} else {
8f6bc87d67c030 Ramona Bolboaca   2023-08-08  1645  				st->data[i++] = buffer[(bit - buff_offset) + 1];
fff7352bf7a3ce Nuno Sá           2020-04-13  1646  				/*
fff7352bf7a3ce Nuno Sá           2020-04-13  1647  				 * Don't bother in doing the manual read if the
fff7352bf7a3ce Nuno Sá           2020-04-13  1648  				 * device supports burst32. burst32 will be
fff7352bf7a3ce Nuno Sá           2020-04-13  1649  				 * enabled in the next call to
fff7352bf7a3ce Nuno Sá           2020-04-13  1650  				 * adis16475_burst32_check()...
fff7352bf7a3ce Nuno Sá           2020-04-13  1651  				 */
8f6bc87d67c030 Ramona Bolboaca   2023-08-08  1652  				if (st->lsb_flag && !(st->info->flags & ADIS16475_HAS_BURST32)) {
fff7352bf7a3ce Nuno Sá           2020-04-13  1653  					u16 val = 0;
fff7352bf7a3ce Nuno Sá           2020-04-13  1654  					const u32 reg = ADIS16475_REG_X_GYRO_L +
fff7352bf7a3ce Nuno Sá           2020-04-13  1655  						bit * 4;
fff7352bf7a3ce Nuno Sá           2020-04-13  1656  
fff7352bf7a3ce Nuno Sá           2020-04-13  1657  					adis_read_reg_16(adis, reg, &val);
fff7352bf7a3ce Nuno Sá           2020-04-13  1658  					st->data[i++] = cpu_to_be16(val);
fff7352bf7a3ce Nuno Sá           2020-04-13  1659  				} else {
fff7352bf7a3ce Nuno Sá           2020-04-13  1660  					/* lower not used */
fff7352bf7a3ce Nuno Sá           2020-04-13  1661  					st->data[i++] = 0;
fff7352bf7a3ce Nuno Sá           2020-04-13  1662  				}
fff7352bf7a3ce Nuno Sá           2020-04-13  1663  			}
fff7352bf7a3ce Nuno Sá           2020-04-13  1664  			break;
fff7352bf7a3ce Nuno Sá           2020-04-13  1665  		}
fff7352bf7a3ce Nuno Sá           2020-04-13  1666  	}
fff7352bf7a3ce Nuno Sá           2020-04-13  1667  
7f174ee4adeb12 Ramona Gradinariu 2024-05-27  1668  	/* There might not be a timestamp option for some devices. */
fff7352bf7a3ce Nuno Sá           2020-04-13  1669  	iio_push_to_buffers_with_timestamp(indio_dev, st->data, pf->timestamp);
7f174ee4adeb12 Ramona Gradinariu 2024-05-27  1670  
7f174ee4adeb12 Ramona Gradinariu 2024-05-27  1671  	return 0;
7f174ee4adeb12 Ramona Gradinariu 2024-05-27  1672  }
7f174ee4adeb12 Ramona Gradinariu 2024-05-27  1673  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
