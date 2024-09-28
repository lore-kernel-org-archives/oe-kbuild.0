Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB594A1B
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Sep 2024 03:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727495765; cv=none; b=lP2UFjute6Mi3vZYjfOv1mftA28Kpv8RTKS+Ra1AQXUgg4KzH8fSJqqM7FKT8R2zYOXD1uWZTZ8d23rQI47GBlcA85iehU3wMrN38NIXhlIPUVt6r3VTTMechsWQOTHFXHefAYkgM/TeRZJAtG/ZAQ31gzyttzVyiUdRP3VGBQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727495765; c=relaxed/simple;
	bh=xb25KoVHtkwlB6Zws73eIEuJZMgtGMYDM2BUTnPSPqg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QFATXcvQpsuzer8+ijbxCBkyrVa20dhqbMjAN3XsnKQaIc0oRmG7nMALeDkI/oZL3xTZVMi1ZZuVP8fKChxaJAB77DDGGOZN8IfPvuzjW2x3xbdXfPtpoQpKDNcEmh16kzQPwUuQQiz+Dlt5dQWfyW3dbhtMsQly5tFPVkAlY6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CuxADd22; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CuxADd22"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727495761; x=1759031761;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xb25KoVHtkwlB6Zws73eIEuJZMgtGMYDM2BUTnPSPqg=;
  b=CuxADd22jxuql6vGFPwKStKpcmagbt0wS3yyZsX5Y+6snxcACvrILc3r
   6cCt3OVR0dq51hT6WMtdU+bS09R/AuY6C6cLz1dYc0tfE33AuDxertCIa
   r8E0qxkdAYKV/4w5NoSETO1PSOjupLF82lh5qWSIG4KXm+N15YbbOEjM+
   uejr7TP04DdMy+rhMU9YXgHw/c/yIDClKXAtk/sGNC+9xruc6aaR7kY3D
   2kTj4Q0RUMwsizBehVa8sUXdSYWTzEwAO2fBN8evvGyH+LDqg4kUpSI70
   kUq28ZcpSnOWalyIfXOieEmsFYIzOpOxrpn0wW4C2DCU76uIBxXe5RzV+
   A==;
X-CSE-ConnectionGUID: ceG92dD3SLyRob+PHbnuig==
X-CSE-MsgGUID: vKMa56xVQSe1ESFhbx1MOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="44170648"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="44170648"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 20:56:00 -0700
X-CSE-ConnectionGUID: OeeYHaiER52utmoP9Hg2LQ==
X-CSE-MsgGUID: f3hnjcwrSHy46AkN8+i/0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="77112015"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Sep 2024 20:55:58 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suOYm-000Mtr-2W;
	Sat, 28 Sep 2024 03:55:56 +0000
Date: Sat, 28 Sep 2024 11:55:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android-mainline 2402/5421] fs/incfs/data_mgmt.c:510
 log_read_one_record() error: uninitialized symbol 'record_size'.
Message-ID: <202409281145.FPOHPs8c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   da0c10aefaf6089b483a9c679b7151dc316a36c7
commit: fe2917fdb90f6d5513202ed424b446d2dd0f15eb [2402/5421] ANDROID: Incremental fs: Finer readlog compression internally
:::::: branch date: 25 hours ago
:::::: commit date: 3 years, 7 months ago
config: i386-randconfig-141-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281145.FPOHPs8c-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409281145.FPOHPs8c-lkp@intel.com/

smatch warnings:
fs/incfs/data_mgmt.c:510 log_read_one_record() error: uninitialized symbol 'record_size'.

vim +/record_size +510 fs/incfs/data_mgmt.c

c6819dd77861f2 Eugene Zemtsov 2019-11-18  457  
b6b4a3a404ccd9 Paul Lawrence  2020-04-22  458  static void log_read_one_record(struct read_log *rl, struct read_log_state *rs)
b6b4a3a404ccd9 Paul Lawrence  2020-04-22  459  {
b6b4a3a404ccd9 Paul Lawrence  2020-04-22  460  	union log_record *record =
b6b4a3a404ccd9 Paul Lawrence  2020-04-22  461  		(union log_record *)((u8 *)rl->rl_ring_buf + rs->next_offset);
b6b4a3a404ccd9 Paul Lawrence  2020-04-22  462  	size_t record_size;
b6b4a3a404ccd9 Paul Lawrence  2020-04-22  463  
b6b4a3a404ccd9 Paul Lawrence  2020-04-22  464  	switch (record->full_record.type) {
b6b4a3a404ccd9 Paul Lawrence  2020-04-22  465  	case FULL:
b6b4a3a404ccd9 Paul Lawrence  2020-04-22  466  		rs->base_record = record->full_record;
b6b4a3a404ccd9 Paul Lawrence  2020-04-22  467  		record_size = sizeof(record->full_record);
b6b4a3a404ccd9 Paul Lawrence  2020-04-22  468  		break;
b6b4a3a404ccd9 Paul Lawrence  2020-04-22  469  
b6b4a3a404ccd9 Paul Lawrence  2020-04-22  470  	case SAME_FILE:
b6b4a3a404ccd9 Paul Lawrence  2020-04-22  471  		rs->base_record.block_index =
fe2917fdb90f6d Paul Lawrence  2021-03-08  472  			record->same_file.block_index;
b6b4a3a404ccd9 Paul Lawrence  2020-04-22  473  		rs->base_record.absolute_ts_us +=
fe2917fdb90f6d Paul Lawrence  2021-03-08  474  			record->same_file.relative_ts_us;
fe2917fdb90f6d Paul Lawrence  2021-03-08  475  		rs->base_record.uid = record->same_file.uid;
fe2917fdb90f6d Paul Lawrence  2021-03-08  476  		record_size = sizeof(record->same_file);
fe2917fdb90f6d Paul Lawrence  2021-03-08  477  		break;
fe2917fdb90f6d Paul Lawrence  2021-03-08  478  
fe2917fdb90f6d Paul Lawrence  2021-03-08  479  	case SAME_FILE_CLOSE_BLOCK:
fe2917fdb90f6d Paul Lawrence  2021-03-08  480  		rs->base_record.block_index +=
fe2917fdb90f6d Paul Lawrence  2021-03-08  481  			record->same_file_close_block.block_index_delta;
fe2917fdb90f6d Paul Lawrence  2021-03-08  482  		rs->base_record.absolute_ts_us +=
fe2917fdb90f6d Paul Lawrence  2021-03-08  483  			record->same_file_close_block.relative_ts_us;
fe2917fdb90f6d Paul Lawrence  2021-03-08  484  		record_size = sizeof(record->same_file_close_block);
fe2917fdb90f6d Paul Lawrence  2021-03-08  485  		break;
fe2917fdb90f6d Paul Lawrence  2021-03-08  486  
fe2917fdb90f6d Paul Lawrence  2021-03-08  487  	case SAME_FILE_CLOSE_BLOCK_SHORT:
fe2917fdb90f6d Paul Lawrence  2021-03-08  488  		rs->base_record.block_index +=
fe2917fdb90f6d Paul Lawrence  2021-03-08  489  			record->same_file_close_block_short.block_index_delta;
fe2917fdb90f6d Paul Lawrence  2021-03-08  490  		rs->base_record.absolute_ts_us +=
fe2917fdb90f6d Paul Lawrence  2021-03-08  491  		   record->same_file_close_block_short.relative_ts_tens_us * 10;
fe2917fdb90f6d Paul Lawrence  2021-03-08  492  		record_size = sizeof(record->same_file_close_block_short);
b6b4a3a404ccd9 Paul Lawrence  2020-04-22  493  		break;
b6b4a3a404ccd9 Paul Lawrence  2020-04-22  494  
b6b4a3a404ccd9 Paul Lawrence  2020-04-22  495  	case SAME_FILE_NEXT_BLOCK:
b6b4a3a404ccd9 Paul Lawrence  2020-04-22  496  		++rs->base_record.block_index;
b6b4a3a404ccd9 Paul Lawrence  2020-04-22  497  		rs->base_record.absolute_ts_us +=
b6b4a3a404ccd9 Paul Lawrence  2020-04-22  498  			record->same_file_next_block.relative_ts_us;
b6b4a3a404ccd9 Paul Lawrence  2020-04-22  499  		record_size = sizeof(record->same_file_next_block);
b6b4a3a404ccd9 Paul Lawrence  2020-04-22  500  		break;
b6b4a3a404ccd9 Paul Lawrence  2020-04-22  501  
b6b4a3a404ccd9 Paul Lawrence  2020-04-22  502  	case SAME_FILE_NEXT_BLOCK_SHORT:
b6b4a3a404ccd9 Paul Lawrence  2020-04-22  503  		++rs->base_record.block_index;
b6b4a3a404ccd9 Paul Lawrence  2020-04-22  504  		rs->base_record.absolute_ts_us +=
fe2917fdb90f6d Paul Lawrence  2021-03-08  505  		    record->same_file_next_block_short.relative_ts_tens_us * 10;
b6b4a3a404ccd9 Paul Lawrence  2020-04-22  506  		record_size = sizeof(record->same_file_next_block_short);
b6b4a3a404ccd9 Paul Lawrence  2020-04-22  507  		break;
b6b4a3a404ccd9 Paul Lawrence  2020-04-22  508  	}
b6b4a3a404ccd9 Paul Lawrence  2020-04-22  509  
b6b4a3a404ccd9 Paul Lawrence  2020-04-22 @510  	rs->next_offset += record_size;
b6b4a3a404ccd9 Paul Lawrence  2020-04-22  511  	if (rs->next_offset > rl->rl_size - sizeof(*record)) {
b6b4a3a404ccd9 Paul Lawrence  2020-04-22  512  		rs->next_offset = 0;
b6b4a3a404ccd9 Paul Lawrence  2020-04-22  513  		++rs->current_pass_no;
b6b4a3a404ccd9 Paul Lawrence  2020-04-22  514  	}
b6b4a3a404ccd9 Paul Lawrence  2020-04-22  515  	++rs->current_record_no;
b6b4a3a404ccd9 Paul Lawrence  2020-04-22  516  }
b6b4a3a404ccd9 Paul Lawrence  2020-04-22  517  

:::::: The code at line 510 was first introduced by commit
:::::: b6b4a3a404ccd9c62347e27c4fc7883d776c2cbb ANDROID: Incremental fs: Use simple compression in log buffer

:::::: TO: Paul Lawrence <paullawrence@google.com>
:::::: CC: Paul Lawrence <paullawrence@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
