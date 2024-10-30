Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6B91BD9D1
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Oct 2024 18:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730314234; cv=none; b=clLsFIvJGcBSkZBcYKHHQAv/ZkIDsuouhgCctK3WReHaLEwckWwngNQKbsuH8zCklLtVlTe25L9spKGP6Mrw+tnLYpkMTtqmEIpwH3kCplC9sLyqxyrYFoGzqoc/25M5my3vBqTSvf8kF2+TClPuaHQBcvwwF5YreKdQX2l9eys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730314234; c=relaxed/simple;
	bh=Wnx650iD3CJoGJwwRpLH05gnngGqbWNhnR1up2zasdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K6HFWglbaPdDs+g8yM8mCQBguWFee+ZYfyXr/mvE+eF7JMCeRh/fC7T24QYXE+Dijzq3FVwYN5/ozmEtYFTozudt+ICvrnh4LBPtzjTV0Fqlx/EQvJmgRD/X+A//1Ya6r5Wi9AsZQYK/kFGcT+kRdApBI6DyZ97BselRzx2N0XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fA8/4uHw; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fA8/4uHw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730314232; x=1761850232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wnx650iD3CJoGJwwRpLH05gnngGqbWNhnR1up2zasdQ=;
  b=fA8/4uHwbZD9Lvz4aC8EbzdsIpwaiBXyElr6UvCk7N3+N6GNzB4Ab3n+
   Q2h3f5kz8yuTfux0sQ0WvQvqH2OYr3p3pwR2juKd6Kp6k8NmO7mqU3ZyD
   oIAi3I+b4KohAq/swL5tAVHJrWuq7syYt4FTwxia3TglpcpbJIGI5EWfm
   d78Fzb/vK6T7Inug6hRbLf7bJm2EoXzAw7SzVWuk4ODXx8bpenT0PCT0W
   ctO1hPR5Poi5uiEbGEiAuYhf/tQIi2iXpxep2TUi3SlvhwjGSJKIoXAsc
   WC3J3ZT4vwpX87Elqx5+mogU7aZUt0BSSBA/fKqMaJpnXyZo4Ex7aJbWh
   g==;
X-CSE-ConnectionGUID: o2DPwrexSjOIGj1VA+pz3A==
X-CSE-MsgGUID: OH4kloaTQpKCOnYMb4//Lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41135170"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41135170"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 11:50:31 -0700
X-CSE-ConnectionGUID: 4YDQyODQTXOXhQJRqBE2BQ==
X-CSE-MsgGUID: /hnXdJJhS/yugjilKmAdvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="82320712"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 30 Oct 2024 11:50:30 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6Dlz-000fDA-0S;
	Wed, 30 Oct 2024 18:50:27 +0000
Date: Thu, 31 Oct 2024 02:50:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-kiwi-6.1 2402/26644]
 fs/incfs/data_mgmt.c:510 log_read_one_record() error: uninitialized symbol
 'record_size'.
Message-ID: <202410310227.PhTV02LF-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   cc3c1ec57c62cf6ce4db5d9a5e6f9980885c4fb3
commit: fe2917fdb90f6d5513202ed424b446d2dd0f15eb [2402/26644] ANDROID: Incremental fs: Finer readlog compression internally
:::::: branch date: 28 hours ago
:::::: commit date: 3 years, 8 months ago
config: i386-randconfig-141-20241029 (https://download.01.org/0day-ci/archive/20241031/202410310227.PhTV02LF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410310227.PhTV02LF-lkp@intel.com/

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
