Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C756D12E5D
	for <oe-kbuild@lists.linux.dev>; Mon, 21 Oct 2024 01:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729474054; cv=none; b=txt9KhjsVVu8cARWYEGiN3o50AobbXEC0yDgUwl4DdeyN64AleM+hu9GWyqjnmSF70M4z+Ep1H+Fu2MYiMGZwEHQv/ZX7tK0ySNWjnRReQznZPKbiaEzA4mjvU8Isob09I1EaGYArkU5pxYBRd4CZaMZqirD/QaZDRtbFmoCkbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729474054; c=relaxed/simple;
	bh=k1PX1rvV2APD1DF4FUAldM2PoM7AF6BmnfGp8dMdPA4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CXSgzDQ0AznWnlh8Mi4Gojj//C6oLmd5mnP5qlc6PZhtl9BW2qt0kWeq65i18eLPjTPqjwoZHvceL4kNr4GoPBXw38XAgcGTK7ofEtxjV9nYhibcjM8VMO7lfknJ+l6fxfQ/UE0L2ATii77R3F3Qg4dSH0ZGugVCH4z/71pvFcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oHumF1DF; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oHumF1DF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729474053; x=1761010053;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k1PX1rvV2APD1DF4FUAldM2PoM7AF6BmnfGp8dMdPA4=;
  b=oHumF1DFnYLuKhUV+bGGsT9NX5apdhavTXK/riPvKpfauFfofdGAxQWH
   QNK8MFZFTruYmAzxnFl16GiurUHe5Z1G2mUxy5tPhgsFhQp1ECRG7VbWr
   a9JN2lw257P60QCz+MBK64h6VZSPNU+CjG/3OuIylYkaxvAdMV62cixu6
   lEeXOgD4V5tHvym9NayoSOelwgVf2qYTDwYqaxXnr5Fz3ffV9MvQQu1ho
   HXJp/3T0BmA3Tv35YvsDhKtVNwnFcEcUzMaYyhpAs4VBpHH1v08uRWex1
   Wht6Tu1pyv+1f0LKWDFEOYK+eoGjERqCPwlF1lqBrfuJAPDWst9LI3NEK
   g==;
X-CSE-ConnectionGUID: 4f7nRaWFRMmw8XbIju0zMA==
X-CSE-MsgGUID: lXIhlhgDR/SjAX28Hrh/qQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="40332410"
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="40332410"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 18:27:30 -0700
X-CSE-ConnectionGUID: WQbiBfHWQ6Os0w25NPkX+A==
X-CSE-MsgGUID: iy3nyNsOQQ+Y0D7SGtZZsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="102687915"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Oct 2024 18:27:28 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2hCg-000QzX-1H;
	Mon, 21 Oct 2024 01:27:26 +0000
Date: Mon, 21 Oct 2024 09:26:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [chao:wip 1/8] fs/f2fs/segment.c:3650 __get_segment_type() error:
 uninitialized symbol 'type'.
Message-ID: <202410210928.RGoDvmbC-lkp@intel.com>
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
CC: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
TO: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git wip
head:   e02bdd9a3b339f200e13dc9043741ba8a17a2cc0
commit: 0ddcae3ea4dc4e7ad4caf341de221afe271ddca1 [1/8] f2fs: fix to parse temperature correctly in f2fs_get_segment_temp()
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: m68k-randconfig-r071-20241021 (https://download.01.org/0day-ci/archive/20241021/202410210928.RGoDvmbC-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410210928.RGoDvmbC-lkp@intel.com/

New smatch warnings:
fs/f2fs/segment.c:3650 __get_segment_type() error: uninitialized symbol 'type'.

Old smatch warnings:
fs/f2fs/segment.c:4349 write_compacted_summaries() warn: variable dereferenced before check 'page' (see line 4332)

vim +/type +3650 fs/f2fs/segment.c

7643f3fe27729b Jaegeuk Kim 2024-04-17  3631  
81377bd62837c8 Jaegeuk Kim 2017-05-10  3632  static int __get_segment_type(struct f2fs_io_info *fio)
351df4b2011573 Jaegeuk Kim 2012-11-02  3633  {
0ddcae3ea4dc4e Chao Yu     2024-10-17  3634  	enum log_type type;
a912b54d3aaa01 Jaegeuk Kim 2017-05-10  3635  
63189b785960c3 Chao Yu     2018-03-08  3636  	switch (F2FS_OPTION(fio->sbi).active_logs) {
351df4b2011573 Jaegeuk Kim 2012-11-02  3637  	case 2:
a912b54d3aaa01 Jaegeuk Kim 2017-05-10  3638  		type = __get_segment_type_2(fio);
a912b54d3aaa01 Jaegeuk Kim 2017-05-10  3639  		break;
351df4b2011573 Jaegeuk Kim 2012-11-02  3640  	case 4:
a912b54d3aaa01 Jaegeuk Kim 2017-05-10  3641  		type = __get_segment_type_4(fio);
a912b54d3aaa01 Jaegeuk Kim 2017-05-10  3642  		break;
a912b54d3aaa01 Jaegeuk Kim 2017-05-10  3643  	case 6:
a912b54d3aaa01 Jaegeuk Kim 2017-05-10  3644  		type = __get_segment_type_6(fio);
a912b54d3aaa01 Jaegeuk Kim 2017-05-10  3645  		break;
a912b54d3aaa01 Jaegeuk Kim 2017-05-10  3646  	default:
a912b54d3aaa01 Jaegeuk Kim 2017-05-10  3647  		f2fs_bug_on(fio->sbi, true);
351df4b2011573 Jaegeuk Kim 2012-11-02  3648  	}
81377bd62837c8 Jaegeuk Kim 2017-05-10  3649  
0ddcae3ea4dc4e Chao Yu     2024-10-17 @3650  	fio->temp = f2fs_get_segment_temp(fio->sbi, type);
7643f3fe27729b Jaegeuk Kim 2024-04-17  3651  
a912b54d3aaa01 Jaegeuk Kim 2017-05-10  3652  	return type;
351df4b2011573 Jaegeuk Kim 2012-11-02  3653  }
351df4b2011573 Jaegeuk Kim 2012-11-02  3654  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
