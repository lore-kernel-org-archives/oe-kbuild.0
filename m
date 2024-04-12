Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D091B81F
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Apr 2024 08:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712910101; cv=none; b=Ylp8MUwqucCnld+zZtgkIirnWS0RToHoWtEMHjornCAMftPEkYK0ScD/xLgzVmuG2uAGqdscrCQ0XrDN4m/FuTI12CbsjUfYsRUNfNrmjOTseMfHmGPCVz5CCYEutafEhP/B0PCrK3EcYW6mtnYW2gRwa8UatFl0l3f/tyJw0Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712910101; c=relaxed/simple;
	bh=pctIHGBfL8UvmT6cMRAkugnhpsswf8HYeZop2BQ01x0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mUv9C7NugQiopPRU3Mvhh1zNCOvZak8WuT1c2QAqPyr0psU54FoDD6sFGhqg7olXifaf7a9N4sYkT1LwnSgj4S7OgUlM4RvrGuuwdxFAnqjIfhHPhZiIqeUKNjYS3pvUc9pif1P5Mm6RASzC9lKuff7qswCQVcqbkSrZin+lGok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gk7a0d+h; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gk7a0d+h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712910099; x=1744446099;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pctIHGBfL8UvmT6cMRAkugnhpsswf8HYeZop2BQ01x0=;
  b=gk7a0d+hxWA/a/OuJcNcs6tdE/jfyLc9NYlAQKNA2dREC28e83ocm8aZ
   wkmMYMergrSv+zlprzQHYioaZKFiimLG9pPkYSZ2lkNyxfYQZjogBVVgp
   sRiWBAvzd61UbIB6Jodz26xy7m59TZ6/xH2lM/yrNif5A22fLJ3twyo9m
   /aGH/odm1GsvdWSwUCoEEz28xp4PPLGaIUZYSeLjH0fNj9WqDXPP1ohWB
   YuNOvwcecEWflzLVpEuxWdHHELJHKm/K6TuLy/DV7q7oCsigsFxUCmzCD
   IiZICyxNyHGZQfMGk5QsA5PF92Q8EtYAKfanUT9nWXw/Jnb5sGSoGcE/E
   A==;
X-CSE-ConnectionGUID: k5hBQVZ0TaSYJSqS0cwSuw==
X-CSE-MsgGUID: UFPjXLyoR/eYUSGAWNsB1Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="18964380"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="18964380"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 01:21:38 -0700
X-CSE-ConnectionGUID: QA6ndJk7R9inNNSESszd2w==
X-CSE-MsgGUID: kA1tLyk4TZedBmb9SwVHnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="44436875"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Apr 2024 01:21:37 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvCAB-0009YD-0Y;
	Fri, 12 Apr 2024 08:21:35 +0000
Date: Fri, 12 Apr 2024 16:21:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:rw_iter 53/438] net/mac80211/debugfs.c:123 aqm_write()
 warn: potential spectre issue 'buf' [w]
Message-ID: <202404121658.DGRqS1Rr-lkp@intel.com>
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
head:   8e79f6c3d0a118031e843758491803e38794f6e8
commit: d2d1bb23987df509fb968b7c2b8987522b513a28 [53/438] net: mac80211: convert to read/write iterators
:::::: branch date: 13 hours ago
:::::: commit date: 17 hours ago
config: x86_64-randconfig-161-20240412 (https://download.01.org/0day-ci/archive/20240412/202404121658.DGRqS1Rr-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404121658.DGRqS1Rr-lkp@intel.com/

New smatch warnings:
net/mac80211/debugfs.c:123 aqm_write() warn: potential spectre issue 'buf' [w]
net/mac80211/debugfs.c:175 airtime_flags_write() warn: potential spectre issue 'buf' [w]
net/mac80211/debugfs.c:257 aql_txq_limit_write() warn: potential spectre issue 'buf' [w]
net/mac80211/debugfs.c:367 force_tx_status_write() warn: potential spectre issue 'buf' [w]

Old smatch warnings:
net/mac80211/debugfs.c:267 aql_txq_limit_write() warn: potential spectre issue 'local->aql_txq_limit_low' [r] (local cap)
net/mac80211/debugfs.c:268 aql_txq_limit_write() warn: potential spectre issue 'local->aql_txq_limit_high' [r] (local cap)
net/mac80211/debugfs.c:276 aql_txq_limit_write() warn: possible spectre second half.  'q_limit_low_old'
net/mac80211/debugfs.c:277 aql_txq_limit_write() warn: possible spectre second half.  'q_limit_high_old'
net/mac80211/debugfs.c:278 aql_txq_limit_write() warn: potential spectre issue 'sta->airtime' [w] (local cap)

vim +/buf +123 net/mac80211/debugfs.c

9399b86c0e9a05 Michal Kazior          2016-05-19  109  
d2d1bb23987df5 Jens Axboe             2024-04-10  110  static ssize_t aqm_write(struct kiocb *iocb, struct iov_iter *from)
9399b86c0e9a05 Michal Kazior          2016-05-19  111  {
d2d1bb23987df5 Jens Axboe             2024-04-10  112  	struct ieee80211_local *local = iocb->ki_filp->private_data;
d2d1bb23987df5 Jens Axboe             2024-04-10  113  	size_t count = iov_iter_count(from);
9399b86c0e9a05 Michal Kazior          2016-05-19  114  	char buf[100];
9399b86c0e9a05 Michal Kazior          2016-05-19  115  
6020d534fa012b Shayne Chen            2021-01-12  116  	if (count >= sizeof(buf))
9399b86c0e9a05 Michal Kazior          2016-05-19  117  		return -EINVAL;
9399b86c0e9a05 Michal Kazior          2016-05-19  118  
d2d1bb23987df5 Jens Axboe             2024-04-10  119  	if (!copy_from_iter(buf, count, from))
9399b86c0e9a05 Michal Kazior          2016-05-19  120  		return -EFAULT;
9399b86c0e9a05 Michal Kazior          2016-05-19  121  
6020d534fa012b Shayne Chen            2021-01-12  122  	if (count && buf[count - 1] == '\n')
6020d534fa012b Shayne Chen            2021-01-12 @123  		buf[count - 1] = '\0';
6020d534fa012b Shayne Chen            2021-01-12  124  	else
6020d534fa012b Shayne Chen            2021-01-12  125  		buf[count] = '\0';
9399b86c0e9a05 Michal Kazior          2016-05-19  126  
9399b86c0e9a05 Michal Kazior          2016-05-19  127  	if (sscanf(buf, "fq_limit %u", &local->fq.limit) == 1)
9399b86c0e9a05 Michal Kazior          2016-05-19  128  		return count;
2a4e675d887bb3 Toke Høiland-Jørgensen 2016-09-23  129  	else if (sscanf(buf, "fq_memory_limit %u", &local->fq.memory_limit) == 1)
2a4e675d887bb3 Toke Høiland-Jørgensen 2016-09-23  130  		return count;
9399b86c0e9a05 Michal Kazior          2016-05-19  131  	else if (sscanf(buf, "fq_quantum %u", &local->fq.quantum) == 1)
9399b86c0e9a05 Michal Kazior          2016-05-19  132  		return count;
9399b86c0e9a05 Michal Kazior          2016-05-19  133  
9399b86c0e9a05 Michal Kazior          2016-05-19  134  	return -EINVAL;
9399b86c0e9a05 Michal Kazior          2016-05-19  135  }
9399b86c0e9a05 Michal Kazior          2016-05-19  136  
9399b86c0e9a05 Michal Kazior          2016-05-19  137  static const struct file_operations aqm_ops = {
d2d1bb23987df5 Jens Axboe             2024-04-10  138  	.write_iter = aqm_write,
d2d1bb23987df5 Jens Axboe             2024-04-10  139  	.read_iter = aqm_read,
8d51dbb8c7fb54 Toke Høiland-Jørgensen 2016-09-12  140  	.open = simple_open,
9399b86c0e9a05 Michal Kazior          2016-05-19  141  	.llseek = default_llseek,
9399b86c0e9a05 Michal Kazior          2016-05-19  142  };
9399b86c0e9a05 Michal Kazior          2016-05-19  143  
d2d1bb23987df5 Jens Axboe             2024-04-10  144  static ssize_t airtime_flags_read(struct kiocb *iocb, struct iov_iter *to)
e322c07f837116 Lorenzo Bianconi       2019-11-27  145  {
d2d1bb23987df5 Jens Axboe             2024-04-10  146  	struct ieee80211_local *local = iocb->ki_filp->private_data;
e322c07f837116 Lorenzo Bianconi       2019-11-27  147  	char buf[128] = {}, *pos, *end;
e322c07f837116 Lorenzo Bianconi       2019-11-27  148  
e322c07f837116 Lorenzo Bianconi       2019-11-27  149  	pos = buf;
e322c07f837116 Lorenzo Bianconi       2019-11-27  150  	end = pos + sizeof(buf) - 1;
e322c07f837116 Lorenzo Bianconi       2019-11-27  151  
e322c07f837116 Lorenzo Bianconi       2019-11-27  152  	if (local->airtime_flags & AIRTIME_USE_TX)
e322c07f837116 Lorenzo Bianconi       2019-11-27  153  		pos += scnprintf(pos, end - pos, "AIRTIME_TX\t(%lx)\n",
e322c07f837116 Lorenzo Bianconi       2019-11-27  154  				 AIRTIME_USE_TX);
e322c07f837116 Lorenzo Bianconi       2019-11-27  155  	if (local->airtime_flags & AIRTIME_USE_RX)
e322c07f837116 Lorenzo Bianconi       2019-11-27  156  		pos += scnprintf(pos, end - pos, "AIRTIME_RX\t(%lx)\n",
e322c07f837116 Lorenzo Bianconi       2019-11-27  157  				 AIRTIME_USE_RX);
e322c07f837116 Lorenzo Bianconi       2019-11-27  158  
d2d1bb23987df5 Jens Axboe             2024-04-10  159  	return simple_copy_to_iter(buf, &iocb->ki_pos, strlen(buf), to);
e322c07f837116 Lorenzo Bianconi       2019-11-27  160  }
e322c07f837116 Lorenzo Bianconi       2019-11-27  161  
d2d1bb23987df5 Jens Axboe             2024-04-10  162  static ssize_t airtime_flags_write(struct kiocb *iocb, struct iov_iter *from)
e322c07f837116 Lorenzo Bianconi       2019-11-27  163  {
d2d1bb23987df5 Jens Axboe             2024-04-10  164  	struct ieee80211_local *local = iocb->ki_filp->private_data;
d2d1bb23987df5 Jens Axboe             2024-04-10  165  	size_t count = iov_iter_count(from);
e322c07f837116 Lorenzo Bianconi       2019-11-27  166  	char buf[16];
e322c07f837116 Lorenzo Bianconi       2019-11-27  167  
6020d534fa012b Shayne Chen            2021-01-12  168  	if (count >= sizeof(buf))
e322c07f837116 Lorenzo Bianconi       2019-11-27  169  		return -EINVAL;
e322c07f837116 Lorenzo Bianconi       2019-11-27  170  
d2d1bb23987df5 Jens Axboe             2024-04-10  171  	if (!copy_from_iter(buf, count, from))
e322c07f837116 Lorenzo Bianconi       2019-11-27  172  		return -EFAULT;
e322c07f837116 Lorenzo Bianconi       2019-11-27  173  
6020d534fa012b Shayne Chen            2021-01-12  174  	if (count && buf[count - 1] == '\n')
6020d534fa012b Shayne Chen            2021-01-12 @175  		buf[count - 1] = '\0';
6020d534fa012b Shayne Chen            2021-01-12  176  	else
6020d534fa012b Shayne Chen            2021-01-12  177  		buf[count] = '\0';
e322c07f837116 Lorenzo Bianconi       2019-11-27  178  
e322c07f837116 Lorenzo Bianconi       2019-11-27  179  	if (kstrtou16(buf, 0, &local->airtime_flags))
e322c07f837116 Lorenzo Bianconi       2019-11-27  180  		return -EINVAL;
e322c07f837116 Lorenzo Bianconi       2019-11-27  181  
e322c07f837116 Lorenzo Bianconi       2019-11-27  182  	return count;
e322c07f837116 Lorenzo Bianconi       2019-11-27  183  }
e322c07f837116 Lorenzo Bianconi       2019-11-27  184  
e322c07f837116 Lorenzo Bianconi       2019-11-27  185  static const struct file_operations airtime_flags_ops = {
d2d1bb23987df5 Jens Axboe             2024-04-10  186  	.write_iter = airtime_flags_write,
d2d1bb23987df5 Jens Axboe             2024-04-10  187  	.read_iter = airtime_flags_read,
e322c07f837116 Lorenzo Bianconi       2019-11-27  188  	.open = simple_open,
e322c07f837116 Lorenzo Bianconi       2019-11-27  189  	.llseek = default_llseek,
e322c07f837116 Lorenzo Bianconi       2019-11-27  190  };
e322c07f837116 Lorenzo Bianconi       2019-11-27  191  
d2d1bb23987df5 Jens Axboe             2024-04-10  192  static ssize_t aql_pending_read(struct kiocb *iocb, struct iov_iter *to)
3db2c5604f39e3 Felix Fietkau          2022-06-25  193  {
d2d1bb23987df5 Jens Axboe             2024-04-10  194  	struct ieee80211_local *local = iocb->ki_filp->private_data;
3db2c5604f39e3 Felix Fietkau          2022-06-25  195  	char buf[400];
3db2c5604f39e3 Felix Fietkau          2022-06-25  196  	int len = 0;
3db2c5604f39e3 Felix Fietkau          2022-06-25  197  
3db2c5604f39e3 Felix Fietkau          2022-06-25  198  	len = scnprintf(buf, sizeof(buf),
3db2c5604f39e3 Felix Fietkau          2022-06-25  199  			"AC     AQL pending\n"
3db2c5604f39e3 Felix Fietkau          2022-06-25  200  			"VO     %u us\n"
3db2c5604f39e3 Felix Fietkau          2022-06-25  201  			"VI     %u us\n"
3db2c5604f39e3 Felix Fietkau          2022-06-25  202  			"BE     %u us\n"
3db2c5604f39e3 Felix Fietkau          2022-06-25  203  			"BK     %u us\n"
3db2c5604f39e3 Felix Fietkau          2022-06-25  204  			"total  %u us\n",
3db2c5604f39e3 Felix Fietkau          2022-06-25  205  			atomic_read(&local->aql_ac_pending_airtime[IEEE80211_AC_VO]),
3db2c5604f39e3 Felix Fietkau          2022-06-25  206  			atomic_read(&local->aql_ac_pending_airtime[IEEE80211_AC_VI]),
3db2c5604f39e3 Felix Fietkau          2022-06-25  207  			atomic_read(&local->aql_ac_pending_airtime[IEEE80211_AC_BE]),
3db2c5604f39e3 Felix Fietkau          2022-06-25  208  			atomic_read(&local->aql_ac_pending_airtime[IEEE80211_AC_BK]),
3db2c5604f39e3 Felix Fietkau          2022-06-25  209  			atomic_read(&local->aql_total_pending_airtime));
d2d1bb23987df5 Jens Axboe             2024-04-10  210  	return simple_copy_to_iter( buf, &iocb->ki_pos, len, to);
3db2c5604f39e3 Felix Fietkau          2022-06-25  211  }
3db2c5604f39e3 Felix Fietkau          2022-06-25  212  
3db2c5604f39e3 Felix Fietkau          2022-06-25  213  static const struct file_operations aql_pending_ops = {
d2d1bb23987df5 Jens Axboe             2024-04-10  214  	.read_iter = aql_pending_read,
3db2c5604f39e3 Felix Fietkau          2022-06-25  215  	.open = simple_open,
3db2c5604f39e3 Felix Fietkau          2022-06-25  216  	.llseek = default_llseek,
3db2c5604f39e3 Felix Fietkau          2022-06-25  217  };
3db2c5604f39e3 Felix Fietkau          2022-06-25  218  
d2d1bb23987df5 Jens Axboe             2024-04-10  219  static ssize_t aql_txq_limit_read(struct kiocb *iocb, struct iov_iter *to)
3ace10f5b5ad94 Kan Yan                2019-11-18  220  {
d2d1bb23987df5 Jens Axboe             2024-04-10  221  	struct ieee80211_local *local = iocb->ki_filp->private_data;
3ace10f5b5ad94 Kan Yan                2019-11-18  222  	char buf[400];
3ace10f5b5ad94 Kan Yan                2019-11-18  223  	int len = 0;
3ace10f5b5ad94 Kan Yan                2019-11-18  224  
3ace10f5b5ad94 Kan Yan                2019-11-18  225  	len = scnprintf(buf, sizeof(buf),
3ace10f5b5ad94 Kan Yan                2019-11-18  226  			"AC	AQL limit low	AQL limit high\n"
3ace10f5b5ad94 Kan Yan                2019-11-18  227  			"VO	%u		%u\n"
3ace10f5b5ad94 Kan Yan                2019-11-18  228  			"VI	%u		%u\n"
3ace10f5b5ad94 Kan Yan                2019-11-18  229  			"BE	%u		%u\n"
3ace10f5b5ad94 Kan Yan                2019-11-18  230  			"BK	%u		%u\n",
942741dabcb432 Felix Fietkau          2022-06-25  231  			local->aql_txq_limit_low[IEEE80211_AC_VO],
942741dabcb432 Felix Fietkau          2022-06-25  232  			local->aql_txq_limit_high[IEEE80211_AC_VO],
942741dabcb432 Felix Fietkau          2022-06-25  233  			local->aql_txq_limit_low[IEEE80211_AC_VI],
942741dabcb432 Felix Fietkau          2022-06-25  234  			local->aql_txq_limit_high[IEEE80211_AC_VI],
942741dabcb432 Felix Fietkau          2022-06-25  235  			local->aql_txq_limit_low[IEEE80211_AC_BE],
942741dabcb432 Felix Fietkau          2022-06-25  236  			local->aql_txq_limit_high[IEEE80211_AC_BE],
942741dabcb432 Felix Fietkau          2022-06-25  237  			local->aql_txq_limit_low[IEEE80211_AC_BK],
942741dabcb432 Felix Fietkau          2022-06-25  238  			local->aql_txq_limit_high[IEEE80211_AC_BK]);
d2d1bb23987df5 Jens Axboe             2024-04-10  239  	return simple_copy_to_iter(buf, &iocb->ki_pos, len, to);
3ace10f5b5ad94 Kan Yan                2019-11-18  240  }
3ace10f5b5ad94 Kan Yan                2019-11-18  241  
d2d1bb23987df5 Jens Axboe             2024-04-10  242  static ssize_t aql_txq_limit_write(struct kiocb *iocb, struct iov_iter *from)
3ace10f5b5ad94 Kan Yan                2019-11-18  243  {
d2d1bb23987df5 Jens Axboe             2024-04-10  244  	struct ieee80211_local *local = iocb->ki_filp->private_data;
3ace10f5b5ad94 Kan Yan                2019-11-18  245  	char buf[100];
3ace10f5b5ad94 Kan Yan                2019-11-18  246  	u32 ac, q_limit_low, q_limit_high, q_limit_low_old, q_limit_high_old;
3ace10f5b5ad94 Kan Yan                2019-11-18  247  	struct sta_info *sta;
d2d1bb23987df5 Jens Axboe             2024-04-10  248  	size_t count = iov_iter_count(from);
3ace10f5b5ad94 Kan Yan                2019-11-18  249  
6020d534fa012b Shayne Chen            2021-01-12  250  	if (count >= sizeof(buf))
3ace10f5b5ad94 Kan Yan                2019-11-18  251  		return -EINVAL;
3ace10f5b5ad94 Kan Yan                2019-11-18  252  
d2d1bb23987df5 Jens Axboe             2024-04-10  253  	if (!copy_from_iter_full(buf, count, from))
3ace10f5b5ad94 Kan Yan                2019-11-18  254  		return -EFAULT;
3ace10f5b5ad94 Kan Yan                2019-11-18  255  
6020d534fa012b Shayne Chen            2021-01-12  256  	if (count && buf[count - 1] == '\n')
6020d534fa012b Shayne Chen            2021-01-12 @257  		buf[count - 1] = '\0';
6020d534fa012b Shayne Chen            2021-01-12  258  	else
6020d534fa012b Shayne Chen            2021-01-12  259  		buf[count] = '\0';
3ace10f5b5ad94 Kan Yan                2019-11-18  260  
3ace10f5b5ad94 Kan Yan                2019-11-18  261  	if (sscanf(buf, "%u %u %u", &ac, &q_limit_low, &q_limit_high) != 3)
3ace10f5b5ad94 Kan Yan                2019-11-18  262  		return -EINVAL;
3ace10f5b5ad94 Kan Yan                2019-11-18  263  
3ace10f5b5ad94 Kan Yan                2019-11-18  264  	if (ac >= IEEE80211_NUM_ACS)
3ace10f5b5ad94 Kan Yan                2019-11-18  265  		return -EINVAL;
3ace10f5b5ad94 Kan Yan                2019-11-18  266  
942741dabcb432 Felix Fietkau          2022-06-25  267  	q_limit_low_old = local->aql_txq_limit_low[ac];
942741dabcb432 Felix Fietkau          2022-06-25  268  	q_limit_high_old = local->aql_txq_limit_high[ac];
3ace10f5b5ad94 Kan Yan                2019-11-18  269  
4d3acf4311a040 Johannes Berg          2023-08-28  270  	wiphy_lock(local->hw.wiphy);
942741dabcb432 Felix Fietkau          2022-06-25  271  	local->aql_txq_limit_low[ac] = q_limit_low;
942741dabcb432 Felix Fietkau          2022-06-25  272  	local->aql_txq_limit_high[ac] = q_limit_high;
3ace10f5b5ad94 Kan Yan                2019-11-18  273  
3ace10f5b5ad94 Kan Yan                2019-11-18  274  	list_for_each_entry(sta, &local->sta_list, list) {
3ace10f5b5ad94 Kan Yan                2019-11-18  275  		/* If a sta has customized queue limits, keep it */
3ace10f5b5ad94 Kan Yan                2019-11-18  276  		if (sta->airtime[ac].aql_limit_low == q_limit_low_old &&
3ace10f5b5ad94 Kan Yan                2019-11-18  277  		    sta->airtime[ac].aql_limit_high == q_limit_high_old) {
3ace10f5b5ad94 Kan Yan                2019-11-18  278  			sta->airtime[ac].aql_limit_low = q_limit_low;
3ace10f5b5ad94 Kan Yan                2019-11-18  279  			sta->airtime[ac].aql_limit_high = q_limit_high;
3ace10f5b5ad94 Kan Yan                2019-11-18  280  		}
3ace10f5b5ad94 Kan Yan                2019-11-18  281  	}
4d3acf4311a040 Johannes Berg          2023-08-28  282  	wiphy_unlock(local->hw.wiphy);
4d3acf4311a040 Johannes Berg          2023-08-28  283  
3ace10f5b5ad94 Kan Yan                2019-11-18  284  	return count;
3ace10f5b5ad94 Kan Yan                2019-11-18  285  }
3ace10f5b5ad94 Kan Yan                2019-11-18  286  

:::::: The code at line 123 was first introduced by commit
:::::: 6020d534fa012b80c6d13811dc4d2dfedca2e403 mac80211: fix incorrect strlen of .write in debugfs

:::::: TO: Shayne Chen <shayne.chen@mediatek.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
