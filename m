Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDC322FDEF
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Mar 2025 19:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741031332; cv=none; b=qjsjmm2dD96jsevOc2BZG/EFQgP3asMf6vanWYNS8y//2mwodLEVML9uOroxVbrJrMj8tKQPvo0tfW9e7iTDzviOOIPOXBSZRiFW9MnwECceoCsEFvlAr79lbVuq1bMRqfXVyI3I2JuHBBCikmdF5uTP8HneDDFTHGEuazT6qAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741031332; c=relaxed/simple;
	bh=5W6MzCJyIUTMANlmkbi7nWkLkslJQf6v2flyBaibh+M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d2o4mHrAmjAQmiLMFpGpLXT0/1iQB8QHkRPhBPx3DUmWgPz+6hTziyOK0hukbOzV4k7oOvySHBs0Kd3909TBllrIzh7ObbefRyAYEA1vlzsTCj+kDiywcmPV02QR5NAxN07ZUTG8jTeHEdJ93ZSaaL+TELBzqyC9mjVQvT+fIMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WvhxlI+T; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WvhxlI+T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741031330; x=1772567330;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5W6MzCJyIUTMANlmkbi7nWkLkslJQf6v2flyBaibh+M=;
  b=WvhxlI+TszOU3XW+1B5IAp+Qj0vGK4eAwMXBKjMTek+UohHn1+frAB3v
   JijwU3K/7z5OOTiwPIRplhglHtpVgW0PIjjdap+hMkDj3j12jRv8KYKQQ
   IqYN5lLvzzViZLV96fUUBz3PiV8NJjBYHBkYS9eslBnf7nnBpMhCSg60R
   mc2AU1VOoD8B30iqtFKWJC2espGymLyKzDbZrXhCIpYTxR9I5TVs8Ztur
   xAqjfKiDToiJo/x98TAyMefOQM30cDuBZ2JJrOCnSZzyi9GStARizFf6B
   AVANEwy/aVTM5Q1vW4FfCGFCFMojbJd4x3h4z6JyNilgXJm4oH0EsgpbL
   g==;
X-CSE-ConnectionGUID: ZP/JAB7tRySaQJ6WW0d07Q==
X-CSE-MsgGUID: 1gmWcwuBQlyzBRoTQo/TFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="44734905"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="44734905"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 11:48:49 -0800
X-CSE-ConnectionGUID: RgMiDXcmQ+OeIegphTSkpQ==
X-CSE-MsgGUID: tyLwzDJaQyijUQaTpjsxGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="149061587"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 03 Mar 2025 11:48:48 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpBmQ-000Ise-0v;
	Mon, 03 Mar 2025 19:48:46 +0000
Date: Tue, 4 Mar 2025 03:48:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 4810/7719] drivers/iio/imu/adis.c:319
 __adis_check_status() error: uninitialized symbol 'status_16'.
Message-ID: <202503040339.Ws1JMYWk-lkp@intel.com>
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
TO: Robert Budai <robert.budai@analog.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Ramona Gradinariu <ramona.gradinariu@analog.com>
CC: Antoniu Miclaus <antoniu.miclaus@analog.com>
CC: "Nuno Sá" <nuno.sa@analog.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   cd3215bbcb9d4321def93fea6cfad4d5b42b9d1d
commit: 9fa98d94131806cae0441d05213d36da480d7389 [4810/7719] iio: imu: adis: Add DIAG_STAT register
:::::: branch date: 12 hours ago
:::::: commit date: 9 days ago
config: sparc64-randconfig-r071-20250303 (https://download.01.org/0day-ci/archive/20250304/202503040339.Ws1JMYWk-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503040339.Ws1JMYWk-lkp@intel.com/

smatch warnings:
drivers/iio/imu/adis.c:319 __adis_check_status() error: uninitialized symbol 'status_16'.

vim +/status_16 +319 drivers/iio/imu/adis.c

ccd2b52f4ac69c drivers/staging/iio/imu/adis.c Lars-Peter Clausen 2012-11-13  298  
ccd2b52f4ac69c drivers/staging/iio/imu/adis.c Lars-Peter Clausen 2012-11-13  299  /**
6a4d6a7d6588d8 drivers/iio/imu/adis.c         Alexandru Ardelean 2019-11-22  300   * __adis_check_status() - Check the device for error conditions (unlocked)
ccd2b52f4ac69c drivers/staging/iio/imu/adis.c Lars-Peter Clausen 2012-11-13  301   * @adis: The adis device
ccd2b52f4ac69c drivers/staging/iio/imu/adis.c Lars-Peter Clausen 2012-11-13  302   *
ccd2b52f4ac69c drivers/staging/iio/imu/adis.c Lars-Peter Clausen 2012-11-13  303   * Returns 0 on success, a negative error code otherwise
ccd2b52f4ac69c drivers/staging/iio/imu/adis.c Lars-Peter Clausen 2012-11-13  304   */
6a4d6a7d6588d8 drivers/iio/imu/adis.c         Alexandru Ardelean 2019-11-22  305  int __adis_check_status(struct adis *adis)
ccd2b52f4ac69c drivers/staging/iio/imu/adis.c Lars-Peter Clausen 2012-11-13  306  {
9fa98d94131806 drivers/iio/imu/adis.c         Robert Budai       2025-02-17  307  	unsigned int status;
9fa98d94131806 drivers/iio/imu/adis.c         Robert Budai       2025-02-17  308  	int diag_stat_bits;
9fa98d94131806 drivers/iio/imu/adis.c         Robert Budai       2025-02-17  309  	u16 status_16;
ccd2b52f4ac69c drivers/staging/iio/imu/adis.c Lars-Peter Clausen 2012-11-13  310  	int ret;
ccd2b52f4ac69c drivers/staging/iio/imu/adis.c Lars-Peter Clausen 2012-11-13  311  	int i;
ccd2b52f4ac69c drivers/staging/iio/imu/adis.c Lars-Peter Clausen 2012-11-13  312  
9fa98d94131806 drivers/iio/imu/adis.c         Robert Budai       2025-02-17  313  	if (adis->data->diag_stat_size) {
9fa98d94131806 drivers/iio/imu/adis.c         Robert Budai       2025-02-17  314  		ret = adis->ops->read(adis, adis->data->diag_stat_reg, &status,
9fa98d94131806 drivers/iio/imu/adis.c         Robert Budai       2025-02-17  315  				      adis->data->diag_stat_size);
9fa98d94131806 drivers/iio/imu/adis.c         Robert Budai       2025-02-17  316  	} else {
9fa98d94131806 drivers/iio/imu/adis.c         Robert Budai       2025-02-17  317  		ret = __adis_read_reg_16(adis, adis->data->diag_stat_reg,
9fa98d94131806 drivers/iio/imu/adis.c         Robert Budai       2025-02-17  318  					 &status_16);
9fa98d94131806 drivers/iio/imu/adis.c         Robert Budai       2025-02-17 @319  		status = status_16;
9fa98d94131806 drivers/iio/imu/adis.c         Robert Budai       2025-02-17  320  	}
6a39ab3b195c12 drivers/iio/imu/adis.c         Alexandru Ardelean 2019-11-01  321  	if (ret)
ccd2b52f4ac69c drivers/staging/iio/imu/adis.c Lars-Peter Clausen 2012-11-13  322  		return ret;
ccd2b52f4ac69c drivers/staging/iio/imu/adis.c Lars-Peter Clausen 2012-11-13  323  
ccd2b52f4ac69c drivers/staging/iio/imu/adis.c Lars-Peter Clausen 2012-11-13  324  	status &= adis->data->status_error_mask;
ccd2b52f4ac69c drivers/staging/iio/imu/adis.c Lars-Peter Clausen 2012-11-13  325  
ccd2b52f4ac69c drivers/staging/iio/imu/adis.c Lars-Peter Clausen 2012-11-13  326  	if (status == 0)
ccd2b52f4ac69c drivers/staging/iio/imu/adis.c Lars-Peter Clausen 2012-11-13  327  		return 0;
ccd2b52f4ac69c drivers/staging/iio/imu/adis.c Lars-Peter Clausen 2012-11-13  328  
9fa98d94131806 drivers/iio/imu/adis.c         Robert Budai       2025-02-17  329  	diag_stat_bits = BITS_PER_BYTE * (adis->data->diag_stat_size ?
9fa98d94131806 drivers/iio/imu/adis.c         Robert Budai       2025-02-17  330  					  adis->data->diag_stat_size : 2);
9fa98d94131806 drivers/iio/imu/adis.c         Robert Budai       2025-02-17  331  
9fa98d94131806 drivers/iio/imu/adis.c         Robert Budai       2025-02-17  332  	for (i = 0; i < diag_stat_bits; ++i) {
ccd2b52f4ac69c drivers/staging/iio/imu/adis.c Lars-Peter Clausen 2012-11-13  333  		if (status & BIT(i)) {
ccd2b52f4ac69c drivers/staging/iio/imu/adis.c Lars-Peter Clausen 2012-11-13  334  			dev_err(&adis->spi->dev, "%s.\n",
ccd2b52f4ac69c drivers/staging/iio/imu/adis.c Lars-Peter Clausen 2012-11-13  335  				adis->data->status_error_msgs[i]);
ccd2b52f4ac69c drivers/staging/iio/imu/adis.c Lars-Peter Clausen 2012-11-13  336  		}
ccd2b52f4ac69c drivers/staging/iio/imu/adis.c Lars-Peter Clausen 2012-11-13  337  	}
ccd2b52f4ac69c drivers/staging/iio/imu/adis.c Lars-Peter Clausen 2012-11-13  338  
ccd2b52f4ac69c drivers/staging/iio/imu/adis.c Lars-Peter Clausen 2012-11-13  339  	return -EIO;
ccd2b52f4ac69c drivers/staging/iio/imu/adis.c Lars-Peter Clausen 2012-11-13  340  }
cdd30ebb1b9f36 drivers/iio/imu/adis.c         Peter Zijlstra     2024-12-02  341  EXPORT_SYMBOL_NS_GPL(__adis_check_status, "IIO_ADISLIB");
ccd2b52f4ac69c drivers/staging/iio/imu/adis.c Lars-Peter Clausen 2012-11-13  342  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
