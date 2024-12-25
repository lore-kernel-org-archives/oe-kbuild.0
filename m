Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7485836C
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Dec 2024 00:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735087596; cv=none; b=O2bCG9+RYUxjQm4BV9Lt9qRMdyO3Jq7vNWGc35EM5hBRAYNwudbxz2boOOY21pQ0lv4AV1g4mL6pYL+bCmUfrUt9cUMKfLE/ArXPKO2hOPRW6eXJ41P1IDbqj1cYOrVKyh3rwCxuDvzDgIl4Xj7OPiOWH1GI8w7ygXN853c0sUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735087596; c=relaxed/simple;
	bh=bAeP08NzrhvLJ3cOcXKNalBXijI8sU6YHhZ+QjRqgxs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ml9uWGF2WHzBkWMgvrJJth8KEK8qjcIhJowQVgZNE24z03bMmfaczM0JAn9UzKXBtkzxTMLKIXhHboMwsdrx3iSNUegcGTHl3lj9AUhSHit5Io/KFxS6TSn0dzSk9VHRrIwEFH42r3pFXsAhAMWFKdh9GbIWVyKYe9hIv2YYYl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QgXHomXa; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QgXHomXa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735087594; x=1766623594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bAeP08NzrhvLJ3cOcXKNalBXijI8sU6YHhZ+QjRqgxs=;
  b=QgXHomXaZjXeScwmPC4ST+alAPS8cTGZc65QhO95HMIVCkfzVblpYdUW
   DogmWc+5lu3BxtjEJlq5Rk5RWWh7N4MwF+pEVmddTfQiPacRg7vAsGb4C
   aRAByQfvffwIoGFoqW3j2JEautnKXOpup+ITfst9kLhephwz4xGz3U199
   8M4+tAN/TOgPx6iHDruxdhbl7sncTYW9ec0A91esCM/qR0dtDg1Wn7ho2
   illEfcXGjH1sfoM9kQKZd03tMMEG9NpNwVbF4lMA4H0j17pQguNQ9tFRS
   G8BQX9aeZwDueUWE4WZ6u1kG2s1F2ptl7dLbMfFhWJnIdMyxXXf3AuwOX
   Q==;
X-CSE-ConnectionGUID: PDmvzg41QAStmtLsFZz0kg==
X-CSE-MsgGUID: pNBxJ72BQ8C7xASvYOMcHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="58011342"
X-IronPort-AV: E=Sophos;i="6.12,261,1728975600"; 
   d="scan'208";a="58011342"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 16:46:34 -0800
X-CSE-ConnectionGUID: mB5kk+qfTsKc7V3omxmm1A==
X-CSE-MsgGUID: Xs/5IJ5xRRu/bkIIqb1PaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,261,1728975600"; 
   d="scan'208";a="99817018"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 Dec 2024 16:46:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQFXh-0001Yp-2U;
	Wed, 25 Dec 2024 00:46:29 +0000
Date: Wed, 25 Dec 2024 08:46:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android15-6.6 2/2] fs/incfs/data_mgmt.c:510
 log_read_one_record() error: uninitialized symbol 'record_size'.
Message-ID: <202412250844.U4BGBYsX-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   cc2a6cb2e3103c2718274f27b95bf61fb8225ab6
commit: fe2917fdb90f6d5513202ed424b446d2dd0f15eb [2/2] ANDROID: Incremental fs: Finer readlog compression internally
:::::: branch date: 6 hours ago
:::::: commit date: 3 years, 10 months ago
config: x86_64-randconfig-161-20241217 (https://download.01.org/0day-ci/archive/20241225/202412250844.U4BGBYsX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412250844.U4BGBYsX-lkp@intel.com/

smatch warnings:
fs/incfs/data_mgmt.c:510 log_read_one_record() error: uninitialized symbol 'record_size'.

vim +/record_size +510 fs/incfs/data_mgmt.c

c6819dd77861f22 Eugene Zemtsov 2019-11-18  457  
b6b4a3a404ccd9c Paul Lawrence  2020-04-22  458  static void log_read_one_record(struct read_log *rl, struct read_log_state *rs)
b6b4a3a404ccd9c Paul Lawrence  2020-04-22  459  {
b6b4a3a404ccd9c Paul Lawrence  2020-04-22  460  	union log_record *record =
b6b4a3a404ccd9c Paul Lawrence  2020-04-22  461  		(union log_record *)((u8 *)rl->rl_ring_buf + rs->next_offset);
b6b4a3a404ccd9c Paul Lawrence  2020-04-22  462  	size_t record_size;
b6b4a3a404ccd9c Paul Lawrence  2020-04-22  463  
b6b4a3a404ccd9c Paul Lawrence  2020-04-22  464  	switch (record->full_record.type) {
b6b4a3a404ccd9c Paul Lawrence  2020-04-22  465  	case FULL:
b6b4a3a404ccd9c Paul Lawrence  2020-04-22  466  		rs->base_record = record->full_record;
b6b4a3a404ccd9c Paul Lawrence  2020-04-22  467  		record_size = sizeof(record->full_record);
b6b4a3a404ccd9c Paul Lawrence  2020-04-22  468  		break;
b6b4a3a404ccd9c Paul Lawrence  2020-04-22  469  
b6b4a3a404ccd9c Paul Lawrence  2020-04-22  470  	case SAME_FILE:
b6b4a3a404ccd9c Paul Lawrence  2020-04-22  471  		rs->base_record.block_index =
fe2917fdb90f6d5 Paul Lawrence  2021-03-08  472  			record->same_file.block_index;
b6b4a3a404ccd9c Paul Lawrence  2020-04-22  473  		rs->base_record.absolute_ts_us +=
fe2917fdb90f6d5 Paul Lawrence  2021-03-08  474  			record->same_file.relative_ts_us;
fe2917fdb90f6d5 Paul Lawrence  2021-03-08  475  		rs->base_record.uid = record->same_file.uid;
fe2917fdb90f6d5 Paul Lawrence  2021-03-08  476  		record_size = sizeof(record->same_file);
fe2917fdb90f6d5 Paul Lawrence  2021-03-08  477  		break;
fe2917fdb90f6d5 Paul Lawrence  2021-03-08  478  
fe2917fdb90f6d5 Paul Lawrence  2021-03-08  479  	case SAME_FILE_CLOSE_BLOCK:
fe2917fdb90f6d5 Paul Lawrence  2021-03-08  480  		rs->base_record.block_index +=
fe2917fdb90f6d5 Paul Lawrence  2021-03-08  481  			record->same_file_close_block.block_index_delta;
fe2917fdb90f6d5 Paul Lawrence  2021-03-08  482  		rs->base_record.absolute_ts_us +=
fe2917fdb90f6d5 Paul Lawrence  2021-03-08  483  			record->same_file_close_block.relative_ts_us;
fe2917fdb90f6d5 Paul Lawrence  2021-03-08  484  		record_size = sizeof(record->same_file_close_block);
fe2917fdb90f6d5 Paul Lawrence  2021-03-08  485  		break;
fe2917fdb90f6d5 Paul Lawrence  2021-03-08  486  
fe2917fdb90f6d5 Paul Lawrence  2021-03-08  487  	case SAME_FILE_CLOSE_BLOCK_SHORT:
fe2917fdb90f6d5 Paul Lawrence  2021-03-08  488  		rs->base_record.block_index +=
fe2917fdb90f6d5 Paul Lawrence  2021-03-08  489  			record->same_file_close_block_short.block_index_delta;
fe2917fdb90f6d5 Paul Lawrence  2021-03-08  490  		rs->base_record.absolute_ts_us +=
fe2917fdb90f6d5 Paul Lawrence  2021-03-08  491  		   record->same_file_close_block_short.relative_ts_tens_us * 10;
fe2917fdb90f6d5 Paul Lawrence  2021-03-08  492  		record_size = sizeof(record->same_file_close_block_short);
b6b4a3a404ccd9c Paul Lawrence  2020-04-22  493  		break;
b6b4a3a404ccd9c Paul Lawrence  2020-04-22  494  
b6b4a3a404ccd9c Paul Lawrence  2020-04-22  495  	case SAME_FILE_NEXT_BLOCK:
b6b4a3a404ccd9c Paul Lawrence  2020-04-22  496  		++rs->base_record.block_index;
b6b4a3a404ccd9c Paul Lawrence  2020-04-22  497  		rs->base_record.absolute_ts_us +=
b6b4a3a404ccd9c Paul Lawrence  2020-04-22  498  			record->same_file_next_block.relative_ts_us;
b6b4a3a404ccd9c Paul Lawrence  2020-04-22  499  		record_size = sizeof(record->same_file_next_block);
b6b4a3a404ccd9c Paul Lawrence  2020-04-22  500  		break;
b6b4a3a404ccd9c Paul Lawrence  2020-04-22  501  
b6b4a3a404ccd9c Paul Lawrence  2020-04-22  502  	case SAME_FILE_NEXT_BLOCK_SHORT:
b6b4a3a404ccd9c Paul Lawrence  2020-04-22  503  		++rs->base_record.block_index;
b6b4a3a404ccd9c Paul Lawrence  2020-04-22  504  		rs->base_record.absolute_ts_us +=
fe2917fdb90f6d5 Paul Lawrence  2021-03-08  505  		    record->same_file_next_block_short.relative_ts_tens_us * 10;
b6b4a3a404ccd9c Paul Lawrence  2020-04-22  506  		record_size = sizeof(record->same_file_next_block_short);
b6b4a3a404ccd9c Paul Lawrence  2020-04-22  507  		break;
b6b4a3a404ccd9c Paul Lawrence  2020-04-22  508  	}
b6b4a3a404ccd9c Paul Lawrence  2020-04-22  509  
b6b4a3a404ccd9c Paul Lawrence  2020-04-22 @510  	rs->next_offset += record_size;
b6b4a3a404ccd9c Paul Lawrence  2020-04-22  511  	if (rs->next_offset > rl->rl_size - sizeof(*record)) {
b6b4a3a404ccd9c Paul Lawrence  2020-04-22  512  		rs->next_offset = 0;
b6b4a3a404ccd9c Paul Lawrence  2020-04-22  513  		++rs->current_pass_no;
b6b4a3a404ccd9c Paul Lawrence  2020-04-22  514  	}
b6b4a3a404ccd9c Paul Lawrence  2020-04-22  515  	++rs->current_record_no;
b6b4a3a404ccd9c Paul Lawrence  2020-04-22  516  }
b6b4a3a404ccd9c Paul Lawrence  2020-04-22  517  

:::::: The code at line 510 was first introduced by commit
:::::: b6b4a3a404ccd9c62347e27c4fc7883d776c2cbb ANDROID: Incremental fs: Use simple compression in log buffer

:::::: TO: Paul Lawrence <paullawrence@google.com>
:::::: CC: Paul Lawrence <paullawrence@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
