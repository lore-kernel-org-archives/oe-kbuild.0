Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F7B1D2B11
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Dec 2024 09:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734428385; cv=none; b=nsIRce4a0Ev3wZKuhKMweyHZ4u87CKsYdfMMr4x5VxItgpVvUF3ARnqTC21TTbkW9NoLZjRGu+1fx9gfPpCefhZBahtaWh3WX8H6fDz1nnkObV3+JBaSMYOJ/hYbfeJtbSPz0AJf4RKZU9JAzgQ5xJIL3zuG/17Wryk1NJQAAPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734428385; c=relaxed/simple;
	bh=F+cLda16NPRimq/5Nn6W2IjdS3YNfOmfxdeMFPR41co=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vp8iBPU4GjS6VK9Cg6A3XLtGlgta1OCOJkBh4FtxoBo3F72+qbuwGEyUWkrWiklnjZ+8O/t/hvZKGTJYzQKIMN0dqukhKZj4NGjfZxxE0Sx4e0yGO5yJHW4nLAtBxHUZ0OTVeDpMcBM7gd4Ue4RMl+KGf1x3p3Gh8e60fs4Yt1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jm9c52Ah; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jm9c52Ah"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734428383; x=1765964383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F+cLda16NPRimq/5Nn6W2IjdS3YNfOmfxdeMFPR41co=;
  b=jm9c52Ah5HySDiphbI1fWL7QJfOXqTdQccrnETUC+n88KWg1DDsLWWGJ
   UJE8ImgNstJ1i3CdjFuHvfQxn7shhLLO8s2WLxGZB1hiqVGyND4iRKDeA
   lhhy78TpD85Jjo1ODBFYkE859lp6PZ63nZi+7dClG7PTMr55fb6jvVFTJ
   PlGfzHl+vKVGHOshZygEnl4eFy6P+j/eEkgI7oa5Vj2ap4FNJTWKqR/zz
   anlaSXrncHe2gK/TBDkEmsxo7N1AKs71dB0Ijh9OQaTTzO/J450GrBGd6
   tRJCEuVF3EzrX3KRhWrh0fCsV0EyESvbagYJEQqmzm2mlHRAIvn8d5uXj
   g==;
X-CSE-ConnectionGUID: tWJ+klbfRkenpbzGSV8hZQ==
X-CSE-MsgGUID: sZhsmKbZRwetty7c4wFayg==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="35069202"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="35069202"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 01:39:42 -0800
X-CSE-ConnectionGUID: fEcqK5GER9e2v3HtZ0kEQw==
X-CSE-MsgGUID: MZ1V7Ho9S32M5YHxEy99Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102458687"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Dec 2024 01:39:41 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNU3G-000Eug-2z;
	Tue, 17 Dec 2024 09:39:38 +0000
Date: Tue, 17 Dec 2024 17:39:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android15-6.6 2402/20502] fs/incfs/data_mgmt.c:510
 log_read_one_record() error: uninitialized symbol 'record_size'.
Message-ID: <202412171731.S2hRb3xz-lkp@intel.com>
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
head:   4c2c65ff08ee9a0f8d838770b1e921da2adf3fa2
commit: fe2917fdb90f6d5513202ed424b446d2dd0f15eb [2402/20502] ANDROID: Incremental fs: Finer readlog compression internally
:::::: branch date: 12 hours ago
:::::: commit date: 3 years, 9 months ago
config: x86_64-randconfig-161-20241217 (https://download.01.org/0day-ci/archive/20241217/202412171731.S2hRb3xz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412171731.S2hRb3xz-lkp@intel.com/

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
