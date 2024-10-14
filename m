Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F22029A0
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Oct 2024 17:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728927240; cv=none; b=Ep67itoshwAnx3SSQgxhizztSDWBWv7qoCo7yKSNjtvytMjB+FPnUrQWz/Eqwg6b0+35nsMsQwGCy9HqU0pMdrErifpgATXRreoR1hf3Q+ITLwtwTd+EzU54CdJ9EXfYk7+LdjRJbOJnMwmxVYnWEFY3N+QuceKw3yPh27Dd1WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728927240; c=relaxed/simple;
	bh=iYXwd0SeFfXq0dfr9WUUVQtGeJ843GmuMxgNpVFKnQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a32/ay+Jt5aihmymVwIU28AjJHqKiSEeL8Eba7GhcbJyVdMnkD4iOYbk9P354FkyxjeJkQEwmbVeTxEiqta7sJDp+vY4fytp4OBvba63bZ9IIUHS2McYRGTpT6uhjh3BcCf2uapOSQaUakrc4F7JLGhoe7kzbYqovw7Srmezwt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IgrSksVY; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IgrSksVY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728927238; x=1760463238;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iYXwd0SeFfXq0dfr9WUUVQtGeJ843GmuMxgNpVFKnQQ=;
  b=IgrSksVYxaYLg6yHR+RyqmTsRbGuOP2b2VwLrdmsoVj+wUNmI0cnnkat
   f+qFmAbLRugy2EklyGHggTqmkfzmQVYXCfm4MgRsWgqA3mD2BmgaWN/Zn
   bNMhPwYBE7cvYPSkIi4Bx2DaHAoyZqX2nNCpShwUL3m2XLwvDiCnuuVmL
   tWAazVGaEyslUJuzRFO4liijS+vaBq1tEATB3Sh+pqAQA0CmmCub8+Ct3
   0NeyaAizTGw2P3brp7RSGiwCT9zfMNWsdyjP+3AdLr+s12gg7rKCFGrvf
   KgN+FhPY5PUQxBUcSgs/Vkh7s8l5cYfXwHNpbElontAFL2HHgRroVeSIg
   A==;
X-CSE-ConnectionGUID: //3sGgJlTC2LNvSYkrp51g==
X-CSE-MsgGUID: He6CgeM5R2O8AKRQ+/ly0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="38867618"
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="38867618"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 10:33:58 -0700
X-CSE-ConnectionGUID: qzD/ZBzIQKCx0VT/N8dWlg==
X-CSE-MsgGUID: Cv/3iIaUT2SW0uWAbTQwCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="82403146"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Oct 2024 10:33:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0Ox7-000Gx1-30;
	Mon, 14 Oct 2024 17:33:53 +0000
Date: Tue, 15 Oct 2024 01:32:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/bcachefs/bkey.c:1155 bch2_bkey_pack_test() error: uninitialized
 symbol 'a'.
Message-ID: <202410150151.Qqjv2zp4-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6485cf5ea253d40d507cd71253c9568c5470cd27
commit: 1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a bcachefs: Initial commit
date:   12 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 12 months ago
config: sparc-randconfig-r073-20241014 (https://download.01.org/0day-ci/archive/20241015/202410150151.Qqjv2zp4-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410150151.Qqjv2zp4-lkp@intel.com/

smatch warnings:
fs/bcachefs/bkey.c:1155 bch2_bkey_pack_test() error: uninitialized symbol 'a'.

vim +/a +1155 fs/bcachefs/bkey.c

1c6fdbd8f2465d Kent Overstreet 2017-03-16  1123  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1124  #ifdef CONFIG_BCACHEFS_DEBUG
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1125  void bch2_bkey_pack_test(void)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1126  {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1127  	struct bkey t = KEY(4134ULL, 1250629070527416633ULL, 0);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1128  	struct bkey_packed p;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1129  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1130  	struct bkey_format test_format = {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1131  		.key_u64s	= 2,
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1132  		.nr_fields	= BKEY_NR_FIELDS,
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1133  		.bits_per_field = {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1134  			13,
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1135  			64,
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1136  		},
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1137  	};
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1138  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1139  	struct unpack_state in_s =
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1140  		unpack_state_init(&bch2_bkey_format_current, (void *) &t);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1141  	struct pack_state out_s = pack_state_init(&test_format, &p);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1142  	unsigned i;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1143  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1144  	for (i = 0; i < out_s.format->nr_fields; i++) {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1145  		u64 a, v = get_inc_field(&in_s, i);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1146  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1147  		switch (i) {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1148  #define x(id, field)	case id: a = t.field; break;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1149  	bkey_fields()
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1150  #undef x
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1151  		default:
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1152  			BUG();
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1153  		}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1154  
1c6fdbd8f2465d Kent Overstreet 2017-03-16 @1155  		if (a != v)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
