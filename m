Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2B4DDCD
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Mar 2026 21:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773351397; cv=none; b=b/EwhguRlVmzSEFai4UW90tLDA9dsF4vTcbbHHSzIFHTfxDyZdkHju34T00OivhX9uHnTUX8FQNB+V10CEAb75Q730mfZwUDMvISF8srzgIqH/YgMKVOGosUETuBcG6E9DgEU/RyPb0hiymuxA+5BOMMGkOjEbAZw5ha/fu5ywU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773351397; c=relaxed/simple;
	bh=wh2V+3QBxV8rSAUnfx1tzllp5G1Ar+raQli/pVShFIE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p1MTea6rgo28giFejEvBmKXP1xmwjm6Y1fJKHNRh7j6sAGVVKE/L8Yl7SyKLipXEs5uEZdh01jkkgtJmTq51fJkiTWiIYbuKEW2hsy1J5nUoQFEUb+eJQMNGd5jjcsP6FSQPoC0GJnWC2tNpmf1mWUFNYlhGJBe3Zd7B82N16Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bvPpwVUQ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bvPpwVUQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773351395; x=1804887395;
  h=date:from:to:cc:subject:message-id;
  bh=wh2V+3QBxV8rSAUnfx1tzllp5G1Ar+raQli/pVShFIE=;
  b=bvPpwVUQ3e7WGzd/8tSJ1FNzqPSggnSa3oNUQr4j24TthrPm/R/pWUNA
   p61S5cfSbuydU4BDZYAw5IYK0fPfHHm155XRQsVsPNcMR1M3QE9tgnJxv
   8fz8FP/hrI7SaTTo/piugpIGwXyEMlMNaojU/0ITZoMp2AO+Ad8+k7f8O
   ksjXFQ6aSgNrBHPz1eQjKZS4WfA+fTZc+p6jH81RMQuf0Bi6ORNxsanLP
   e+nCil31ikxXApnmaEEaUtHeQA8FAx+WIbQBZN0IRNSbh4KZTemjMF/Ap
   dcak7+pQzojdnnumZN1i1kWuSubIRBjM0EgnUO4uhZyM8TglGCg2t5BkW
   Q==;
X-CSE-ConnectionGUID: Ut9cuS3FTSSfaMHp5fqiuw==
X-CSE-MsgGUID: U+AQ5mjNSS6uX76DhrTC6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="78062248"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="78062248"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 14:36:35 -0700
X-CSE-ConnectionGUID: XH55/bjdT4WImJTKp3Fw3w==
X-CSE-MsgGUID: Ms4jgNYVTlq0WJJw4eZ7eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="243996986"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Mar 2026 14:36:33 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0nhn-000000003Ch-18vE;
	Thu, 12 Mar 2026 21:36:31 +0000
Date: Fri, 13 Mar 2026 05:35:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 190/471] drivers/scsi/snic/snic_debugfs.c:115
 snic_reset_stats_write() warn: potential spectre issue 'buf' [w]
Message-ID: <202603130550.fgKk1WLt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   0a49759be1c3b29207758e467fdc1a90d0716d06
commit: 0d07945d5b860ff47b1f9407b74746f9232896ef [190/471] scsi: snic: convert to read/write iterators
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: openrisc-randconfig-r071-20260307 (https://download.01.org/0day-ci/archive/20260313/202603130550.fgKk1WLt-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603130550.fgKk1WLt-lkp@intel.com/

smatch warnings:
drivers/scsi/snic/snic_debugfs.c:115 snic_reset_stats_write() warn: potential spectre issue 'buf' [w]

vim +/buf +115 drivers/scsi/snic/snic_debugfs.c

c8806b6c9e824f Narsimhulu Musini 2015-05-29   82  
c8806b6c9e824f Narsimhulu Musini 2015-05-29   83  /*
c8806b6c9e824f Narsimhulu Musini 2015-05-29   84   * snic_reset_stats_write - Write to reset_stats debugfs file
c8806b6c9e824f Narsimhulu Musini 2015-05-29   85   * @filp: The file pointer to write from
c8806b6c9e824f Narsimhulu Musini 2015-05-29   86   * @ubuf: The buffer to copy the data from.
c8806b6c9e824f Narsimhulu Musini 2015-05-29   87   * @cnt: The number of bytes to write.
c8806b6c9e824f Narsimhulu Musini 2015-05-29   88   * @ppos: The position in the file to start writing to.
c8806b6c9e824f Narsimhulu Musini 2015-05-29   89   *
c8806b6c9e824f Narsimhulu Musini 2015-05-29   90   * Description:
c8806b6c9e824f Narsimhulu Musini 2015-05-29   91   * This routine writes data from user buffer @ubuf to buffer @buf and
c8806b6c9e824f Narsimhulu Musini 2015-05-29   92   * resets cumulative stats of snic.
c8806b6c9e824f Narsimhulu Musini 2015-05-29   93   *
c8806b6c9e824f Narsimhulu Musini 2015-05-29   94   * Returns:
c8806b6c9e824f Narsimhulu Musini 2015-05-29   95   * This function returns the amount of data that was written.
c8806b6c9e824f Narsimhulu Musini 2015-05-29   96   */
c8806b6c9e824f Narsimhulu Musini 2015-05-29   97  static ssize_t
0d07945d5b860f Jens Axboe        2024-04-08   98  snic_reset_stats_write(struct kiocb *iocb, struct iov_iter *from)
c8806b6c9e824f Narsimhulu Musini 2015-05-29   99  {
0d07945d5b860f Jens Axboe        2024-04-08  100  	struct snic *snic = iocb->ki_filp->private_data;
c8806b6c9e824f Narsimhulu Musini 2015-05-29  101  	struct snic_stats *stats = &snic->s_stats;
c8806b6c9e824f Narsimhulu Musini 2015-05-29  102  	u64 *io_stats_p = (u64 *) &stats->io;
c8806b6c9e824f Narsimhulu Musini 2015-05-29  103  	u64 *fw_stats_p = (u64 *) &stats->fw;
0d07945d5b860f Jens Axboe        2024-04-08  104  	size_t cnt = iov_iter_count(from);
c8806b6c9e824f Narsimhulu Musini 2015-05-29  105  	char buf[64];
c8806b6c9e824f Narsimhulu Musini 2015-05-29  106  	unsigned long val;
c8806b6c9e824f Narsimhulu Musini 2015-05-29  107  	int ret;
c8806b6c9e824f Narsimhulu Musini 2015-05-29  108  
c8806b6c9e824f Narsimhulu Musini 2015-05-29  109  	if (cnt >= sizeof(buf))
c8806b6c9e824f Narsimhulu Musini 2015-05-29  110  		return -EINVAL;
c8806b6c9e824f Narsimhulu Musini 2015-05-29  111  
0d07945d5b860f Jens Axboe        2024-04-08  112  	if (!copy_from_iter_full(&buf, cnt, from))
c8806b6c9e824f Narsimhulu Musini 2015-05-29  113  		return -EFAULT;
c8806b6c9e824f Narsimhulu Musini 2015-05-29  114  
c8806b6c9e824f Narsimhulu Musini 2015-05-29 @115  	buf[cnt] = '\0';
c8806b6c9e824f Narsimhulu Musini 2015-05-29  116  
c8806b6c9e824f Narsimhulu Musini 2015-05-29  117  	ret = kstrtoul(buf, 10, &val);
c8806b6c9e824f Narsimhulu Musini 2015-05-29  118  	if (ret < 0)
c8806b6c9e824f Narsimhulu Musini 2015-05-29  119  		return ret;
c8806b6c9e824f Narsimhulu Musini 2015-05-29  120  
c8806b6c9e824f Narsimhulu Musini 2015-05-29  121  	snic->reset_stats = val;
c8806b6c9e824f Narsimhulu Musini 2015-05-29  122  
c8806b6c9e824f Narsimhulu Musini 2015-05-29  123  	if (snic->reset_stats) {
c8806b6c9e824f Narsimhulu Musini 2015-05-29  124  		/* Skip variable is used to avoid descrepancies to Num IOs
c8806b6c9e824f Narsimhulu Musini 2015-05-29  125  		 * and IO Completions stats. Skip incrementing No IO Compls
c8806b6c9e824f Narsimhulu Musini 2015-05-29  126  		 * for pending active IOs after reset_stats
c8806b6c9e824f Narsimhulu Musini 2015-05-29  127  		 */
c8806b6c9e824f Narsimhulu Musini 2015-05-29  128  		atomic64_set(&snic->io_cmpl_skip,
c8806b6c9e824f Narsimhulu Musini 2015-05-29  129  			     atomic64_read(&stats->io.active));
c8806b6c9e824f Narsimhulu Musini 2015-05-29  130  		memset(&stats->abts, 0, sizeof(struct snic_abort_stats));
c8806b6c9e824f Narsimhulu Musini 2015-05-29  131  		memset(&stats->reset, 0, sizeof(struct snic_reset_stats));
c8806b6c9e824f Narsimhulu Musini 2015-05-29  132  		memset(&stats->misc, 0, sizeof(struct snic_misc_stats));
c8806b6c9e824f Narsimhulu Musini 2015-05-29  133  		memset(io_stats_p+1,
c8806b6c9e824f Narsimhulu Musini 2015-05-29  134  			0,
c8806b6c9e824f Narsimhulu Musini 2015-05-29  135  			sizeof(struct snic_io_stats) - sizeof(u64));
c8806b6c9e824f Narsimhulu Musini 2015-05-29  136  		memset(fw_stats_p+1,
c8806b6c9e824f Narsimhulu Musini 2015-05-29  137  			0,
c8806b6c9e824f Narsimhulu Musini 2015-05-29  138  			sizeof(struct snic_fw_stats) - sizeof(u64));
c8806b6c9e824f Narsimhulu Musini 2015-05-29  139  	}
c8806b6c9e824f Narsimhulu Musini 2015-05-29  140  
0d07945d5b860f Jens Axboe        2024-04-08  141  	iocb->ki_pos++;
c8806b6c9e824f Narsimhulu Musini 2015-05-29  142  
c8806b6c9e824f Narsimhulu Musini 2015-05-29  143  	SNIC_HOST_INFO(snic->shost, "Reset Op: Driver statistics.\n");
c8806b6c9e824f Narsimhulu Musini 2015-05-29  144  
c8806b6c9e824f Narsimhulu Musini 2015-05-29  145  	return cnt;
c8806b6c9e824f Narsimhulu Musini 2015-05-29  146  }
c8806b6c9e824f Narsimhulu Musini 2015-05-29  147  

:::::: The code at line 115 was first introduced by commit
:::::: c8806b6c9e824f47726f2a9b7fbbe7ebf19306fa snic: driver for Cisco SCSI HBA

:::::: TO: Narsimhulu Musini <nmusini@cisco.com>
:::::: CC: James Bottomley <JBottomley@Odin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
