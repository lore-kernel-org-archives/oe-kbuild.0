Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604D01DF759
	for <oe-kbuild@lists.linux.dev>; Sat, 26 Apr 2025 19:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745695594; cv=none; b=SgpjGSzhjkvTxQvVQgjleAqsXpJ4Vw37dIK+Hjkp7yn/0pduS58aZCzQ2zgnwDS35F/t8NK4cyM+rZXavwoXl8UyxwGh97ap/EyUVWwGjaRR8WUPyY/zsrwTc+6PHGQZ9KTFsDhxoU5E3/naEVSaESlburhABzIgnk+C/Gb8M6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745695594; c=relaxed/simple;
	bh=4kLdb9L2K37Wfc2AFfS+bh7vtbLI1T8+8YcD0q+YSXc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uar989/LP+y8esYQ+x6xoifyMcHKrOO2YQEIvysQAp9KbPSkvis9bZsETGm49cgQDmAFpatGZ/+/VYYsVso2IHw8cHqtxMYeL1ols0PJ/NBjiIJuZRcMxoOtPR3tNPE5vUvwptLE22Tzps+l98tKvvcwPZcEFOUUWH8isNpOFrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aBKP1c1y; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aBKP1c1y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745695593; x=1777231593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4kLdb9L2K37Wfc2AFfS+bh7vtbLI1T8+8YcD0q+YSXc=;
  b=aBKP1c1y6l2pn50zS00BaRL0dtbIiNijxxSvWjcn1MW71qRzo5IdqXhM
   juoKuScb/+74LjTAijE3VGCAPnD1UzRfqLSD6W2zf3lODgxW5C+hQBhdR
   tAgns0Seo3PqA/CCNNuGbphxk0jJnHW/0+X7XZhcppfZhe5IxrRZI3EUa
   5L3oVCtu+pE42hf4BbC6vtyRwSf6y57JelpoQJWGThjCcMAmWBG1sVbmS
   f7yWfFSwBcyOB48Yj+Qx2ef53m3twsr6p1jW/t8M1pLfh887keP1eJAvr
   X9XQ5Zh5SJXCzmdAsIC4F5JYRV6JAw7Zia5pN2vwP6gLejNZEbE9hEHd2
   Q==;
X-CSE-ConnectionGUID: +5xcWpKVT3u5/yNfGrIqdw==
X-CSE-MsgGUID: VJviXtd+S4eMX9PECTAYYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="47212129"
X-IronPort-AV: E=Sophos;i="6.15,242,1739865600"; 
   d="scan'208";a="47212129"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 12:26:32 -0700
X-CSE-ConnectionGUID: DPyLTap0Rxq7EUiRYpB0KQ==
X-CSE-MsgGUID: qAVW+HGIRzCssftgpTxAww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,242,1739865600"; 
   d="scan'208";a="138147974"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 26 Apr 2025 12:26:31 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8lAS-0005xl-0m;
	Sat, 26 Apr 2025 19:26:28 +0000
Date: Sun, 27 Apr 2025 03:25:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 03/11] fuse: refactor fuse_fill_write_pages()
Message-ID: <202504270319.GmkEM1Xg-lkp@intel.com>
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
In-Reply-To: <20250426000828.3216220-4-joannelkoong@gmail.com>
References: <20250426000828.3216220-4-joannelkoong@gmail.com>
TO: Joanne Koong <joannelkoong@gmail.com>
TO: miklos@szeredi.hu
CC: linux-fsdevel@vger.kernel.org
CC: jlayton@kernel.org
CC: jefflexu@linux.alibaba.com
CC: josef@toxicpanda.com
CC: bernd.schubert@fastmail.fm
CC: willy@infradead.org
CC: kernel-team@meta.com

Hi Joanne,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mszeredi-fuse/for-next]
[also build test WARNING on next-20250424]
[cannot apply to linus/master v6.15-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joanne-Koong/fuse-support-copying-large-folios/20250426-081219
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git for-next
patch link:    https://lore.kernel.org/r/20250426000828.3216220-4-joannelkoong%40gmail.com
patch subject: [PATCH v5 03/11] fuse: refactor fuse_fill_write_pages()
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: i386-randconfig-141-20250426 (https://download.01.org/0day-ci/archive/20250427/202504270319.GmkEM1Xg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504270319.GmkEM1Xg-lkp@intel.com/

smatch warnings:
fs/fuse/file.c:1207 fuse_fill_write_pages() error: uninitialized symbol 'err'.

vim +/err +1207 fs/fuse/file.c

ea9b9907b82a09 Nicholas Piggin    2008-04-30  1126  
4f06dd92b5d0a6 Vivek Goyal        2020-10-21  1127  static ssize_t fuse_fill_write_pages(struct fuse_io_args *ia,
ea9b9907b82a09 Nicholas Piggin    2008-04-30  1128  				     struct address_space *mapping,
338f2e3f3341a9 Miklos Szeredi     2019-09-10  1129  				     struct iov_iter *ii, loff_t pos,
338f2e3f3341a9 Miklos Szeredi     2019-09-10  1130  				     unsigned int max_pages)
ea9b9907b82a09 Nicholas Piggin    2008-04-30  1131  {
4f06dd92b5d0a6 Vivek Goyal        2020-10-21  1132  	struct fuse_args_pages *ap = &ia->ap;
ea9b9907b82a09 Nicholas Piggin    2008-04-30  1133  	struct fuse_conn *fc = get_fuse_conn(mapping->host);
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  1134  	unsigned offset = pos & (PAGE_SIZE - 1);
ea9b9907b82a09 Nicholas Piggin    2008-04-30  1135  	size_t count = 0;
dfda790dfda452 Joanne Koong       2025-04-25  1136  	unsigned int num;
ea9b9907b82a09 Nicholas Piggin    2008-04-30  1137  	int err;
ea9b9907b82a09 Nicholas Piggin    2008-04-30  1138  
dfda790dfda452 Joanne Koong       2025-04-25  1139  	num = min(iov_iter_count(ii), fc->max_write);
dfda790dfda452 Joanne Koong       2025-04-25  1140  	num = min(num, max_pages << PAGE_SHIFT);
dfda790dfda452 Joanne Koong       2025-04-25  1141  
338f2e3f3341a9 Miklos Szeredi     2019-09-10  1142  	ap->args.in_pages = true;
68bfb7eb7f7de3 Joanne Koong       2024-10-24  1143  	ap->descs[0].offset = offset;
ea9b9907b82a09 Nicholas Piggin    2008-04-30  1144  
dfda790dfda452 Joanne Koong       2025-04-25  1145  	while (num) {
ea9b9907b82a09 Nicholas Piggin    2008-04-30  1146  		size_t tmp;
9bafbe7ae01321 Josef Bacik        2024-09-30  1147  		struct folio *folio;
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  1148  		pgoff_t index = pos >> PAGE_SHIFT;
dfda790dfda452 Joanne Koong       2025-04-25  1149  		unsigned bytes = min(PAGE_SIZE - offset, num);
ea9b9907b82a09 Nicholas Piggin    2008-04-30  1150  
ea9b9907b82a09 Nicholas Piggin    2008-04-30  1151   again:
9bafbe7ae01321 Josef Bacik        2024-09-30  1152  		folio = __filemap_get_folio(mapping, index, FGP_WRITEBEGIN,
9bafbe7ae01321 Josef Bacik        2024-09-30  1153  					    mapping_gfp_mask(mapping));
9bafbe7ae01321 Josef Bacik        2024-09-30  1154  		if (IS_ERR(folio)) {
9bafbe7ae01321 Josef Bacik        2024-09-30  1155  			err = PTR_ERR(folio);
ea9b9907b82a09 Nicholas Piggin    2008-04-30  1156  			break;
9bafbe7ae01321 Josef Bacik        2024-09-30  1157  		}
ea9b9907b82a09 Nicholas Piggin    2008-04-30  1158  
931e80e4b3263d anfei zhou         2010-02-02  1159  		if (mapping_writably_mapped(mapping))
9bafbe7ae01321 Josef Bacik        2024-09-30  1160  			flush_dcache_folio(folio);
931e80e4b3263d anfei zhou         2010-02-02  1161  
9bafbe7ae01321 Josef Bacik        2024-09-30  1162  		tmp = copy_folio_from_iter_atomic(folio, offset, bytes, ii);
9bafbe7ae01321 Josef Bacik        2024-09-30  1163  		flush_dcache_folio(folio);
ea9b9907b82a09 Nicholas Piggin    2008-04-30  1164  
ea9b9907b82a09 Nicholas Piggin    2008-04-30  1165  		if (!tmp) {
9bafbe7ae01321 Josef Bacik        2024-09-30  1166  			folio_unlock(folio);
9bafbe7ae01321 Josef Bacik        2024-09-30  1167  			folio_put(folio);
faa794dd2e17e7 Dave Hansen        2025-01-29  1168  
faa794dd2e17e7 Dave Hansen        2025-01-29  1169  			/*
faa794dd2e17e7 Dave Hansen        2025-01-29  1170  			 * Ensure forward progress by faulting in
faa794dd2e17e7 Dave Hansen        2025-01-29  1171  			 * while not holding the folio lock:
faa794dd2e17e7 Dave Hansen        2025-01-29  1172  			 */
faa794dd2e17e7 Dave Hansen        2025-01-29  1173  			if (fault_in_iov_iter_readable(ii, bytes)) {
faa794dd2e17e7 Dave Hansen        2025-01-29  1174  				err = -EFAULT;
faa794dd2e17e7 Dave Hansen        2025-01-29  1175  				break;
faa794dd2e17e7 Dave Hansen        2025-01-29  1176  			}
faa794dd2e17e7 Dave Hansen        2025-01-29  1177  
ea9b9907b82a09 Nicholas Piggin    2008-04-30  1178  			goto again;
ea9b9907b82a09 Nicholas Piggin    2008-04-30  1179  		}
ea9b9907b82a09 Nicholas Piggin    2008-04-30  1180  
ea9b9907b82a09 Nicholas Piggin    2008-04-30  1181  		err = 0;
f2ef459bab7326 Joanne Koong       2024-10-24  1182  		ap->folios[ap->num_folios] = folio;
68bfb7eb7f7de3 Joanne Koong       2024-10-24  1183  		ap->descs[ap->num_folios].length = tmp;
f2ef459bab7326 Joanne Koong       2024-10-24  1184  		ap->num_folios++;
ea9b9907b82a09 Nicholas Piggin    2008-04-30  1185  
ea9b9907b82a09 Nicholas Piggin    2008-04-30  1186  		count += tmp;
ea9b9907b82a09 Nicholas Piggin    2008-04-30  1187  		pos += tmp;
dfda790dfda452 Joanne Koong       2025-04-25  1188  		num -= tmp;
ea9b9907b82a09 Nicholas Piggin    2008-04-30  1189  		offset += tmp;
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  1190  		if (offset == PAGE_SIZE)
ea9b9907b82a09 Nicholas Piggin    2008-04-30  1191  			offset = 0;
ea9b9907b82a09 Nicholas Piggin    2008-04-30  1192  
4f06dd92b5d0a6 Vivek Goyal        2020-10-21  1193  		/* If we copied full page, mark it uptodate */
4f06dd92b5d0a6 Vivek Goyal        2020-10-21  1194  		if (tmp == PAGE_SIZE)
9bafbe7ae01321 Josef Bacik        2024-09-30  1195  			folio_mark_uptodate(folio);
4f06dd92b5d0a6 Vivek Goyal        2020-10-21  1196  
9bafbe7ae01321 Josef Bacik        2024-09-30  1197  		if (folio_test_uptodate(folio)) {
9bafbe7ae01321 Josef Bacik        2024-09-30  1198  			folio_unlock(folio);
4f06dd92b5d0a6 Vivek Goyal        2020-10-21  1199  		} else {
f2ef459bab7326 Joanne Koong       2024-10-24  1200  			ia->write.folio_locked = true;
4f06dd92b5d0a6 Vivek Goyal        2020-10-21  1201  			break;
4f06dd92b5d0a6 Vivek Goyal        2020-10-21  1202  		}
dfda790dfda452 Joanne Koong       2025-04-25  1203  		if (!fc->big_writes || offset != 0)
78bb6cb9a890d3 Miklos Szeredi     2008-05-12  1204  			break;
dfda790dfda452 Joanne Koong       2025-04-25  1205  	}
ea9b9907b82a09 Nicholas Piggin    2008-04-30  1206  
ea9b9907b82a09 Nicholas Piggin    2008-04-30 @1207  	return count > 0 ? count : err;
ea9b9907b82a09 Nicholas Piggin    2008-04-30  1208  }
ea9b9907b82a09 Nicholas Piggin    2008-04-30  1209  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
