Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054962EE280
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Sep 2025 10:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756808593; cv=none; b=Vcvz3xrqoKPs9Akic3xoVXvw8CZxMurvt6OAnyf0C5VLWFIVTG8EXoAYvuerRbSMZ8DYADX+OQklFOkvFLI+m7FEsA/y2QsfMw59ENpY/++Ich5kwld1WAOqhp1bm6ksT2fd1xsOQx5XLnyCjNen3ajgOlBcKGSV1m0LJ9X7kX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756808593; c=relaxed/simple;
	bh=BhOWOUHF7abd7uv8sZgWuBB2tUUP2DiZo5L5AJDXFC8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hspDyVA33aDM0Wcng4Cl/XY3iyapuXZ4TrtJO7l52L5gInzld8IHOZHws+Qu/af4DEJS4SLC3V60jckR5ln1HDOQs01WdHqw5PvNptem0wqrF+ZUS5IgxU3b35HNh5HEolW0jUsTAmZ8LQjh9S45v8x2bnTLWnpYggLacOz6tew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W6C/kOfT; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W6C/kOfT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756808590; x=1788344590;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BhOWOUHF7abd7uv8sZgWuBB2tUUP2DiZo5L5AJDXFC8=;
  b=W6C/kOfTcRgA0uEvLP+TbBkcsVa81c2KC+hI4o7HM/QAKuy/24//3xjR
   lXyJKTg4v2WtcobYQWL9kC100Yii1LY3eL4/nECNgM3h5Gc3TSA4tkWQN
   idcrar/3AwJY+tCOqA/7nluOEp2f0nQorvswWTNH7zNfdlfPGA0/ZQppB
   mWNnGHYk4DnmkifdOetZ0q+OVy6aEFXzcWzWWvMm2EClgwWG0DI1b+wtH
   bR4sLIkd9WoyBwSh19l0GTWy6dhz5f2hC/UcdaHziheWVV1XCLFXsP/IE
   PRduhFRSjFN2Rdz0WMkvp04Xur+7rIXIBCohSPHEP3ttOWu/nF5LSCbpd
   A==;
X-CSE-ConnectionGUID: 1J5T3JEmSWqFTr9Z/2uoNA==
X-CSE-MsgGUID: ncO71fMUQzaNII2VmBJtFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59025298"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59025298"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 03:23:08 -0700
X-CSE-ConnectionGUID: 6ust0GFnST2SKip3lSYAkg==
X-CSE-MsgGUID: CzYjAd8ZTjCTfRWuJNzj7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="171682122"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 02 Sep 2025 03:23:06 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utOAK-0001pH-05;
	Tue, 02 Sep 2025 10:23:04 +0000
Date: Tue, 2 Sep 2025 18:23:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 2400/5641] fs/btrfs/tests/inode-tests.c:787
 test_btrfs_get_extent() warn: Function too hairy.  No more merges.
Message-ID: <202509021811.rZ3p8UnU-lkp@intel.com>
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
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3db46a82d467bd23d9ebc473d872a865785299d8
commit: cec6e40a02ef66e28208dc808cd28cce418efc1d [2400/5641] riscv: dts: microchip: Minor whitespace cleanup
:::::: branch date: 5 hours ago
:::::: commit date: 2 weeks ago
config: powerpc64-randconfig-r071-20250902 (https://download.01.org/0day-ci/archive/20250902/202509021811.rZ3p8UnU-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 2e122990391b2ba062e6308a12cfedf7206270ba)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509021811.rZ3p8UnU-lkp@intel.com/

smatch warnings:
fs/btrfs/tests/inode-tests.c:787 test_btrfs_get_extent() warn: Function too hairy.  No more merges.

vim +787 fs/btrfs/tests/inode-tests.c

aaedb55bc08f38 Josef Bacik   2013-10-11  217  
b9ef22dedde08a Feifei Xu     2016-06-01  218  static noinline int test_btrfs_get_extent(u32 sectorsize, u32 nodesize)
aaedb55bc08f38 Josef Bacik   2013-10-11  219  {
7c0260ee098db7 Jeff Mahoney  2016-06-20  220  	struct btrfs_fs_info *fs_info = NULL;
aaedb55bc08f38 Josef Bacik   2013-10-11  221  	struct inode *inode = NULL;
aaedb55bc08f38 Josef Bacik   2013-10-11  222  	struct btrfs_root *root = NULL;
aaedb55bc08f38 Josef Bacik   2013-10-11  223  	struct extent_map *em = NULL;
aaedb55bc08f38 Josef Bacik   2013-10-11  224  	u64 orig_start;
aaedb55bc08f38 Josef Bacik   2013-10-11  225  	u64 disk_bytenr;
aaedb55bc08f38 Josef Bacik   2013-10-11  226  	u64 offset;
aaedb55bc08f38 Josef Bacik   2013-10-11  227  	int ret = -ENOMEM;
aaedb55bc08f38 Josef Bacik   2013-10-11  228  
e4fa7469eb7a93 David Sterba  2019-03-18  229  	test_msg("running btrfs_get_extent tests");
e4fa7469eb7a93 David Sterba  2019-03-18  230  
aaedb55bc08f38 Josef Bacik   2013-10-11  231  	inode = btrfs_new_test_inode();
aaedb55bc08f38 Josef Bacik   2013-10-11  232  	if (!inode) {
6a060db85d0a81 David Sterba  2019-03-15  233  		test_std_err(TEST_ALLOC_INODE);
aaedb55bc08f38 Josef Bacik   2013-10-11  234  		return ret;
aaedb55bc08f38 Josef Bacik   2013-10-11  235  	}
aaedb55bc08f38 Josef Bacik   2013-10-11  236  
da17066c40472c Jeff Mahoney  2016-06-15  237  	fs_info = btrfs_alloc_dummy_fs_info(nodesize, sectorsize);
7c0260ee098db7 Jeff Mahoney  2016-06-20  238  	if (!fs_info) {
37b2a7bc1ea919 David Sterba  2019-03-15  239  		test_std_err(TEST_ALLOC_FS_INFO);
aaedb55bc08f38 Josef Bacik   2013-10-11  240  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  241  	}
aaedb55bc08f38 Josef Bacik   2013-10-11  242  
da17066c40472c Jeff Mahoney  2016-06-15  243  	root = btrfs_alloc_dummy_root(fs_info);
7c0260ee098db7 Jeff Mahoney  2016-06-20  244  	if (IS_ERR(root)) {
52ab7bca3583fa David Sterba  2019-03-15  245  		test_std_err(TEST_ALLOC_ROOT);
aaedb55bc08f38 Josef Bacik   2013-10-11  246  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  247  	}
aaedb55bc08f38 Josef Bacik   2013-10-11  248  
da17066c40472c Jeff Mahoney  2016-06-15  249  	root->node = alloc_dummy_extent_buffer(fs_info, nodesize);
aaedb55bc08f38 Josef Bacik   2013-10-11  250  	if (!root->node) {
9e3d9f8462ef02 David Sterba  2019-03-15  251  		test_std_err(TEST_ALLOC_ROOT);
aaedb55bc08f38 Josef Bacik   2013-10-11  252  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  253  	}
aaedb55bc08f38 Josef Bacik   2013-10-11  254  
aaedb55bc08f38 Josef Bacik   2013-10-11  255  	btrfs_set_header_nritems(root->node, 0);
aaedb55bc08f38 Josef Bacik   2013-10-11  256  	btrfs_set_header_level(root->node, 0);
aaedb55bc08f38 Josef Bacik   2013-10-11  257  	ret = -EINVAL;
aaedb55bc08f38 Josef Bacik   2013-10-11  258  
aaedb55bc08f38 Josef Bacik   2013-10-11  259  	/* First with no extents */
aaedb55bc08f38 Josef Bacik   2013-10-11  260  	BTRFS_I(inode)->root = root;
8bab0a30665e46 Qu Wenruo     2024-01-08  261  	em = btrfs_get_extent(BTRFS_I(inode), NULL, 0, sectorsize);
aaedb55bc08f38 Josef Bacik   2013-10-11  262  	if (IS_ERR(em)) {
aaedb55bc08f38 Josef Bacik   2013-10-11  263  		em = NULL;
3c7251f2f88880 David Sterba  2018-05-17  264  		test_err("got an error when we shouldn't have");
aaedb55bc08f38 Josef Bacik   2013-10-11  265  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  266  	}
c77a8c61002e91 Qu Wenruo     2024-04-30  267  	if (em->disk_bytenr != EXTENT_MAP_HOLE) {
c77a8c61002e91 Qu Wenruo     2024-04-30  268  		test_err("expected a hole, got %llu", em->disk_bytenr);
aaedb55bc08f38 Josef Bacik   2013-10-11  269  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  270  	}
ae98ae2a50d72b Filipe Manana 2025-04-08  271  	btrfs_free_extent_map(em);
4c0c8cfc843345 Filipe Manana 2022-09-19  272  	btrfs_drop_extent_map_range(BTRFS_I(inode), 0, (u64)-1, false);
aaedb55bc08f38 Josef Bacik   2013-10-11  273  
aaedb55bc08f38 Josef Bacik   2013-10-11  274  	/*
aaedb55bc08f38 Josef Bacik   2013-10-11  275  	 * All of the magic numbers are based on the mapping setup in
aaedb55bc08f38 Josef Bacik   2013-10-11  276  	 * setup_file_extents, so if you change anything there you need to
aaedb55bc08f38 Josef Bacik   2013-10-11  277  	 * update the comment and update the expected values below.
aaedb55bc08f38 Josef Bacik   2013-10-11  278  	 */
b9ef22dedde08a Feifei Xu     2016-06-01  279  	setup_file_extents(root, sectorsize);
aaedb55bc08f38 Josef Bacik   2013-10-11  280  
8bab0a30665e46 Qu Wenruo     2024-01-08  281  	em = btrfs_get_extent(BTRFS_I(inode), NULL, 0, (u64)-1);
aaedb55bc08f38 Josef Bacik   2013-10-11  282  	if (IS_ERR(em)) {
3c7251f2f88880 David Sterba  2018-05-17  283  		test_err("got an error when we shouldn't have");
aaedb55bc08f38 Josef Bacik   2013-10-11  284  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  285  	}
c77a8c61002e91 Qu Wenruo     2024-04-30  286  	if (em->disk_bytenr != EXTENT_MAP_INLINE) {
c77a8c61002e91 Qu Wenruo     2024-04-30  287  		test_err("expected an inline, got %llu", em->disk_bytenr);
aaedb55bc08f38 Josef Bacik   2013-10-11  288  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  289  	}
b9ef22dedde08a Feifei Xu     2016-06-01  290  
d52a1365258b57 Qu Wenruo     2022-09-16  291  	/*
d52a1365258b57 Qu Wenruo     2022-09-16  292  	 * For inline extent, we always round up the em to sectorsize, as
d52a1365258b57 Qu Wenruo     2022-09-16  293  	 * they are either:
d52a1365258b57 Qu Wenruo     2022-09-16  294  	 *
d52a1365258b57 Qu Wenruo     2022-09-16  295  	 * a) a hidden hole
d52a1365258b57 Qu Wenruo     2022-09-16  296  	 *    The range will be zeroed at inline extent read time.
d52a1365258b57 Qu Wenruo     2022-09-16  297  	 *
d52a1365258b57 Qu Wenruo     2022-09-16  298  	 * b) a file extent with unaligned bytenr
d52a1365258b57 Qu Wenruo     2022-09-16  299  	 *    Tree checker will reject it.
d52a1365258b57 Qu Wenruo     2022-09-16  300  	 */
d52a1365258b57 Qu Wenruo     2022-09-16  301  	if (em->start != 0 || em->len != sectorsize) {
3c7251f2f88880 David Sterba  2018-05-17  302  		test_err(
d52a1365258b57 Qu Wenruo     2022-09-16  303  	"unexpected extent wanted start 0 len %u, got start %llu len %llu",
d52a1365258b57 Qu Wenruo     2022-09-16  304  			sectorsize, em->start, em->len);
aaedb55bc08f38 Josef Bacik   2013-10-11  305  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  306  	}
aaedb55bc08f38 Josef Bacik   2013-10-11  307  	if (em->flags != 0) {
f86f7a75e2fb5f Filipe Manana 2023-12-04  308  		test_err("unexpected flags set, want 0 have %u", em->flags);
aaedb55bc08f38 Josef Bacik   2013-10-11  309  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  310  	}
aaedb55bc08f38 Josef Bacik   2013-10-11  311  	/*
aaedb55bc08f38 Josef Bacik   2013-10-11  312  	 * We don't test anything else for inline since it doesn't get set
aaedb55bc08f38 Josef Bacik   2013-10-11  313  	 * unless we have a page for it to write into.  Maybe we should change
aaedb55bc08f38 Josef Bacik   2013-10-11  314  	 * this?
aaedb55bc08f38 Josef Bacik   2013-10-11  315  	 */
aaedb55bc08f38 Josef Bacik   2013-10-11  316  	offset = em->start + em->len;
ae98ae2a50d72b Filipe Manana 2025-04-08  317  	btrfs_free_extent_map(em);
aaedb55bc08f38 Josef Bacik   2013-10-11  318  
8bab0a30665e46 Qu Wenruo     2024-01-08  319  	em = btrfs_get_extent(BTRFS_I(inode), NULL, offset, sectorsize);
aaedb55bc08f38 Josef Bacik   2013-10-11  320  	if (IS_ERR(em)) {
3c7251f2f88880 David Sterba  2018-05-17  321  		test_err("got an error when we shouldn't have");
aaedb55bc08f38 Josef Bacik   2013-10-11  322  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  323  	}
c77a8c61002e91 Qu Wenruo     2024-04-30  324  	if (em->disk_bytenr != EXTENT_MAP_HOLE) {
c77a8c61002e91 Qu Wenruo     2024-04-30  325  		test_err("expected a hole, got %llu", em->disk_bytenr);
aaedb55bc08f38 Josef Bacik   2013-10-11  326  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  327  	}
aaedb55bc08f38 Josef Bacik   2013-10-11  328  	if (em->start != offset || em->len != 4) {
3c7251f2f88880 David Sterba  2018-05-17  329  		test_err(
3c7251f2f88880 David Sterba  2018-05-17  330  	"unexpected extent wanted start %llu len 4, got start %llu len %llu",
3c7251f2f88880 David Sterba  2018-05-17  331  			offset, em->start, em->len);
aaedb55bc08f38 Josef Bacik   2013-10-11  332  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  333  	}
aaedb55bc08f38 Josef Bacik   2013-10-11  334  	if (em->flags != 0) {
f86f7a75e2fb5f Filipe Manana 2023-12-04  335  		test_err("unexpected flags set, want 0 have %u", em->flags);
aaedb55bc08f38 Josef Bacik   2013-10-11  336  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  337  	}
aaedb55bc08f38 Josef Bacik   2013-10-11  338  	offset = em->start + em->len;
ae98ae2a50d72b Filipe Manana 2025-04-08  339  	btrfs_free_extent_map(em);
aaedb55bc08f38 Josef Bacik   2013-10-11  340  
aaedb55bc08f38 Josef Bacik   2013-10-11  341  	/* Regular extent */
8bab0a30665e46 Qu Wenruo     2024-01-08  342  	em = btrfs_get_extent(BTRFS_I(inode), NULL, offset, sectorsize);
aaedb55bc08f38 Josef Bacik   2013-10-11  343  	if (IS_ERR(em)) {
3c7251f2f88880 David Sterba  2018-05-17  344  		test_err("got an error when we shouldn't have");
aaedb55bc08f38 Josef Bacik   2013-10-11  345  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  346  	}
c77a8c61002e91 Qu Wenruo     2024-04-30  347  	if (em->disk_bytenr >= EXTENT_MAP_LAST_BYTE) {
c77a8c61002e91 Qu Wenruo     2024-04-30  348  		test_err("expected a real extent, got %llu", em->disk_bytenr);
aaedb55bc08f38 Josef Bacik   2013-10-11  349  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  350  	}
b9ef22dedde08a Feifei Xu     2016-06-01  351  	if (em->start != offset || em->len != sectorsize - 1) {
3c7251f2f88880 David Sterba  2018-05-17  352  		test_err(
3c7251f2f88880 David Sterba  2018-05-17  353  	"unexpected extent wanted start %llu len 4095, got start %llu len %llu",
3c7251f2f88880 David Sterba  2018-05-17  354  			offset, em->start, em->len);
aaedb55bc08f38 Josef Bacik   2013-10-11  355  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  356  	}
aaedb55bc08f38 Josef Bacik   2013-10-11  357  	if (em->flags != 0) {
f86f7a75e2fb5f Filipe Manana 2023-12-04  358  		test_err("unexpected flags set, want 0 have %u", em->flags);
aaedb55bc08f38 Josef Bacik   2013-10-11  359  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  360  	}
4aa7b5d1784f51 Qu Wenruo     2024-04-30  361  	if (em->offset != 0) {
4aa7b5d1784f51 Qu Wenruo     2024-04-30  362  		test_err("wrong offset, want 0, have %llu", em->offset);
aaedb55bc08f38 Josef Bacik   2013-10-11  363  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  364  	}
aaedb55bc08f38 Josef Bacik   2013-10-11  365  	offset = em->start + em->len;
ae98ae2a50d72b Filipe Manana 2025-04-08  366  	btrfs_free_extent_map(em);
aaedb55bc08f38 Josef Bacik   2013-10-11  367  
aaedb55bc08f38 Josef Bacik   2013-10-11  368  	/* The next 3 are split extents */
8bab0a30665e46 Qu Wenruo     2024-01-08  369  	em = btrfs_get_extent(BTRFS_I(inode), NULL, offset, sectorsize);
aaedb55bc08f38 Josef Bacik   2013-10-11  370  	if (IS_ERR(em)) {
3c7251f2f88880 David Sterba  2018-05-17  371  		test_err("got an error when we shouldn't have");
aaedb55bc08f38 Josef Bacik   2013-10-11  372  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  373  	}
c77a8c61002e91 Qu Wenruo     2024-04-30  374  	if (em->disk_bytenr >= EXTENT_MAP_LAST_BYTE) {
c77a8c61002e91 Qu Wenruo     2024-04-30  375  		test_err("expected a real extent, got %llu", em->disk_bytenr);
aaedb55bc08f38 Josef Bacik   2013-10-11  376  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  377  	}
b9ef22dedde08a Feifei Xu     2016-06-01  378  	if (em->start != offset || em->len != sectorsize) {
3c7251f2f88880 David Sterba  2018-05-17  379  		test_err(
3c7251f2f88880 David Sterba  2018-05-17  380  		"unexpected extent start %llu len %u, got start %llu len %llu",
b9ef22dedde08a Feifei Xu     2016-06-01  381  			offset, sectorsize, em->start, em->len);
aaedb55bc08f38 Josef Bacik   2013-10-11  382  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  383  	}
aaedb55bc08f38 Josef Bacik   2013-10-11  384  	if (em->flags != 0) {
f86f7a75e2fb5f Filipe Manana 2023-12-04  385  		test_err("unexpected flags set, want 0 have %u", em->flags);
aaedb55bc08f38 Josef Bacik   2013-10-11  386  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  387  	}
4aa7b5d1784f51 Qu Wenruo     2024-04-30  388  	if (em->offset != 0) {
4aa7b5d1784f51 Qu Wenruo     2024-04-30  389  		test_err("wrong offset, want 0, have %llu", em->offset);
aaedb55bc08f38 Josef Bacik   2013-10-11  390  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  391  	}
2e871330cea44f Filipe Manana 2025-04-08  392  	disk_bytenr = btrfs_extent_map_block_start(em);
aaedb55bc08f38 Josef Bacik   2013-10-11  393  	orig_start = em->start;
aaedb55bc08f38 Josef Bacik   2013-10-11  394  	offset = em->start + em->len;
ae98ae2a50d72b Filipe Manana 2025-04-08  395  	btrfs_free_extent_map(em);
aaedb55bc08f38 Josef Bacik   2013-10-11  396  
8bab0a30665e46 Qu Wenruo     2024-01-08  397  	em = btrfs_get_extent(BTRFS_I(inode), NULL, offset, sectorsize);
aaedb55bc08f38 Josef Bacik   2013-10-11  398  	if (IS_ERR(em)) {
3c7251f2f88880 David Sterba  2018-05-17  399  		test_err("got an error when we shouldn't have");
aaedb55bc08f38 Josef Bacik   2013-10-11  400  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  401  	}
c77a8c61002e91 Qu Wenruo     2024-04-30  402  	if (em->disk_bytenr != EXTENT_MAP_HOLE) {
c77a8c61002e91 Qu Wenruo     2024-04-30  403  		test_err("expected a hole, got %llu", em->disk_bytenr);
aaedb55bc08f38 Josef Bacik   2013-10-11  404  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  405  	}
b9ef22dedde08a Feifei Xu     2016-06-01  406  	if (em->start != offset || em->len != sectorsize) {
3c7251f2f88880 David Sterba  2018-05-17  407  		test_err(
3c7251f2f88880 David Sterba  2018-05-17  408  	"unexpected extent wanted start %llu len %u, got start %llu len %llu",
b9ef22dedde08a Feifei Xu     2016-06-01  409  			offset, sectorsize, em->start, em->len);
aaedb55bc08f38 Josef Bacik   2013-10-11  410  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  411  	}
aaedb55bc08f38 Josef Bacik   2013-10-11  412  	if (em->flags != 0) {
f86f7a75e2fb5f Filipe Manana 2023-12-04  413  		test_err("unexpected flags set, want 0 have %u", em->flags);
aaedb55bc08f38 Josef Bacik   2013-10-11  414  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  415  	}
aaedb55bc08f38 Josef Bacik   2013-10-11  416  	offset = em->start + em->len;
ae98ae2a50d72b Filipe Manana 2025-04-08  417  	btrfs_free_extent_map(em);
aaedb55bc08f38 Josef Bacik   2013-10-11  418  
8bab0a30665e46 Qu Wenruo     2024-01-08  419  	em = btrfs_get_extent(BTRFS_I(inode), NULL, offset, sectorsize);
aaedb55bc08f38 Josef Bacik   2013-10-11  420  	if (IS_ERR(em)) {
3c7251f2f88880 David Sterba  2018-05-17  421  		test_err("got an error when we shouldn't have");
aaedb55bc08f38 Josef Bacik   2013-10-11  422  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  423  	}
c77a8c61002e91 Qu Wenruo     2024-04-30  424  	if (em->disk_bytenr >= EXTENT_MAP_LAST_BYTE) {
c77a8c61002e91 Qu Wenruo     2024-04-30  425  		test_err("expected a real extent, got %llu", em->disk_bytenr);
aaedb55bc08f38 Josef Bacik   2013-10-11  426  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  427  	}
b9ef22dedde08a Feifei Xu     2016-06-01  428  	if (em->start != offset || em->len != 2 * sectorsize) {
3c7251f2f88880 David Sterba  2018-05-17  429  		test_err(
3c7251f2f88880 David Sterba  2018-05-17  430  	"unexpected extent wanted start %llu len %u, got start %llu len %llu",
b9ef22dedde08a Feifei Xu     2016-06-01  431  			offset, 2 * sectorsize, em->start, em->len);
aaedb55bc08f38 Josef Bacik   2013-10-11  432  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  433  	}
aaedb55bc08f38 Josef Bacik   2013-10-11  434  	if (em->flags != 0) {
f86f7a75e2fb5f Filipe Manana 2023-12-04  435  		test_err("unexpected flags set, want 0 have %u", em->flags);
aaedb55bc08f38 Josef Bacik   2013-10-11  436  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  437  	}
4aa7b5d1784f51 Qu Wenruo     2024-04-30  438  	if (em->start - em->offset != orig_start) {
4aa7b5d1784f51 Qu Wenruo     2024-04-30  439  		test_err("wrong offset, em->start=%llu em->offset=%llu orig_start=%llu",
4aa7b5d1784f51 Qu Wenruo     2024-04-30  440  			 em->start, em->offset, orig_start);
aaedb55bc08f38 Josef Bacik   2013-10-11  441  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  442  	}
aaedb55bc08f38 Josef Bacik   2013-10-11  443  	disk_bytenr += (em->start - orig_start);
2e871330cea44f Filipe Manana 2025-04-08  444  	if (btrfs_extent_map_block_start(em) != disk_bytenr) {
3c7251f2f88880 David Sterba  2018-05-17  445  		test_err("wrong block start, want %llu, have %llu",
2e871330cea44f Filipe Manana 2025-04-08  446  			 disk_bytenr, btrfs_extent_map_block_start(em));
aaedb55bc08f38 Josef Bacik   2013-10-11  447  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  448  	}
aaedb55bc08f38 Josef Bacik   2013-10-11  449  	offset = em->start + em->len;
ae98ae2a50d72b Filipe Manana 2025-04-08  450  	btrfs_free_extent_map(em);
aaedb55bc08f38 Josef Bacik   2013-10-11  451  
aaedb55bc08f38 Josef Bacik   2013-10-11  452  	/* Prealloc extent */
8bab0a30665e46 Qu Wenruo     2024-01-08  453  	em = btrfs_get_extent(BTRFS_I(inode), NULL, offset, sectorsize);
aaedb55bc08f38 Josef Bacik   2013-10-11  454  	if (IS_ERR(em)) {
3c7251f2f88880 David Sterba  2018-05-17  455  		test_err("got an error when we shouldn't have");
aaedb55bc08f38 Josef Bacik   2013-10-11  456  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  457  	}
c77a8c61002e91 Qu Wenruo     2024-04-30  458  	if (em->disk_bytenr >= EXTENT_MAP_LAST_BYTE) {
c77a8c61002e91 Qu Wenruo     2024-04-30  459  		test_err("expected a real extent, got %llu", em->disk_bytenr);
aaedb55bc08f38 Josef Bacik   2013-10-11  460  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  461  	}
b9ef22dedde08a Feifei Xu     2016-06-01  462  	if (em->start != offset || em->len != sectorsize) {
3c7251f2f88880 David Sterba  2018-05-17  463  		test_err(
3c7251f2f88880 David Sterba  2018-05-17  464  	"unexpected extent wanted start %llu len %u, got start %llu len %llu",
b9ef22dedde08a Feifei Xu     2016-06-01  465  			offset, sectorsize, em->start, em->len);
aaedb55bc08f38 Josef Bacik   2013-10-11  466  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  467  	}
aaedb55bc08f38 Josef Bacik   2013-10-11  468  	if (em->flags != prealloc_only) {
f86f7a75e2fb5f Filipe Manana 2023-12-04  469  		test_err("unexpected flags set, want %u have %u",
aaedb55bc08f38 Josef Bacik   2013-10-11  470  			 prealloc_only, em->flags);
aaedb55bc08f38 Josef Bacik   2013-10-11  471  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  472  	}
4aa7b5d1784f51 Qu Wenruo     2024-04-30  473  	if (em->offset != 0) {
4aa7b5d1784f51 Qu Wenruo     2024-04-30  474  		test_err("wrong offset, want 0, have %llu", em->offset);
aaedb55bc08f38 Josef Bacik   2013-10-11  475  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  476  	}
aaedb55bc08f38 Josef Bacik   2013-10-11  477  	offset = em->start + em->len;
ae98ae2a50d72b Filipe Manana 2025-04-08  478  	btrfs_free_extent_map(em);
aaedb55bc08f38 Josef Bacik   2013-10-11  479  
aaedb55bc08f38 Josef Bacik   2013-10-11  480  	/* The next 3 are a half written prealloc extent */
8bab0a30665e46 Qu Wenruo     2024-01-08  481  	em = btrfs_get_extent(BTRFS_I(inode), NULL, offset, sectorsize);
aaedb55bc08f38 Josef Bacik   2013-10-11  482  	if (IS_ERR(em)) {
3c7251f2f88880 David Sterba  2018-05-17  483  		test_err("got an error when we shouldn't have");
aaedb55bc08f38 Josef Bacik   2013-10-11  484  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  485  	}
c77a8c61002e91 Qu Wenruo     2024-04-30  486  	if (em->disk_bytenr >= EXTENT_MAP_LAST_BYTE) {
c77a8c61002e91 Qu Wenruo     2024-04-30  487  		test_err("expected a real extent, got %llu", em->disk_bytenr);
aaedb55bc08f38 Josef Bacik   2013-10-11  488  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  489  	}
b9ef22dedde08a Feifei Xu     2016-06-01  490  	if (em->start != offset || em->len != sectorsize) {
3c7251f2f88880 David Sterba  2018-05-17  491  		test_err(
3c7251f2f88880 David Sterba  2018-05-17  492  	"unexpected extent wanted start %llu len %u, got start %llu len %llu",
b9ef22dedde08a Feifei Xu     2016-06-01  493  			offset, sectorsize, em->start, em->len);
aaedb55bc08f38 Josef Bacik   2013-10-11  494  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  495  	}
aaedb55bc08f38 Josef Bacik   2013-10-11  496  	if (em->flags != prealloc_only) {
f86f7a75e2fb5f Filipe Manana 2023-12-04  497  		test_err("unexpected flags set, want %u have %u",
aaedb55bc08f38 Josef Bacik   2013-10-11  498  			 prealloc_only, em->flags);
aaedb55bc08f38 Josef Bacik   2013-10-11  499  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  500  	}
4aa7b5d1784f51 Qu Wenruo     2024-04-30  501  	if (em->offset != 0) {
4aa7b5d1784f51 Qu Wenruo     2024-04-30  502  		test_err("wrong offset, want 0, have %llu", em->offset);
aaedb55bc08f38 Josef Bacik   2013-10-11  503  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  504  	}
2e871330cea44f Filipe Manana 2025-04-08  505  	disk_bytenr = btrfs_extent_map_block_start(em);
aaedb55bc08f38 Josef Bacik   2013-10-11  506  	orig_start = em->start;
aaedb55bc08f38 Josef Bacik   2013-10-11  507  	offset = em->start + em->len;
ae98ae2a50d72b Filipe Manana 2025-04-08  508  	btrfs_free_extent_map(em);
aaedb55bc08f38 Josef Bacik   2013-10-11  509  
8bab0a30665e46 Qu Wenruo     2024-01-08  510  	em = btrfs_get_extent(BTRFS_I(inode), NULL, offset, sectorsize);
aaedb55bc08f38 Josef Bacik   2013-10-11  511  	if (IS_ERR(em)) {
3c7251f2f88880 David Sterba  2018-05-17  512  		test_err("got an error when we shouldn't have");
aaedb55bc08f38 Josef Bacik   2013-10-11  513  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  514  	}
c77a8c61002e91 Qu Wenruo     2024-04-30  515  	if (em->disk_bytenr >= EXTENT_MAP_HOLE) {
c77a8c61002e91 Qu Wenruo     2024-04-30  516  		test_err("expected a real extent, got %llu", em->disk_bytenr);
aaedb55bc08f38 Josef Bacik   2013-10-11  517  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  518  	}
b9ef22dedde08a Feifei Xu     2016-06-01  519  	if (em->start != offset || em->len != sectorsize) {
3c7251f2f88880 David Sterba  2018-05-17  520  		test_err(
3c7251f2f88880 David Sterba  2018-05-17  521  	"unexpected extent wanted start %llu len %u, got start %llu len %llu",
b9ef22dedde08a Feifei Xu     2016-06-01  522  			offset, sectorsize, em->start, em->len);
aaedb55bc08f38 Josef Bacik   2013-10-11  523  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  524  	}
aaedb55bc08f38 Josef Bacik   2013-10-11  525  	if (em->flags != 0) {
f86f7a75e2fb5f Filipe Manana 2023-12-04  526  		test_err("unexpected flags set, want 0 have %u", em->flags);
aaedb55bc08f38 Josef Bacik   2013-10-11  527  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  528  	}
4aa7b5d1784f51 Qu Wenruo     2024-04-30  529  	if (em->start - em->offset != orig_start) {
4aa7b5d1784f51 Qu Wenruo     2024-04-30  530  		test_err("unexpected offset, wanted %llu, have %llu",
4aa7b5d1784f51 Qu Wenruo     2024-04-30  531  			 em->start - orig_start, em->offset);
aaedb55bc08f38 Josef Bacik   2013-10-11  532  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  533  	}
2e871330cea44f Filipe Manana 2025-04-08  534  	if (btrfs_extent_map_block_start(em) != disk_bytenr + em->offset) {
3c7251f2f88880 David Sterba  2018-05-17  535  		test_err("unexpected block start, wanted %llu, have %llu",
2e871330cea44f Filipe Manana 2025-04-08  536  			 disk_bytenr + em->offset, btrfs_extent_map_block_start(em));
aaedb55bc08f38 Josef Bacik   2013-10-11  537  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  538  	}
aaedb55bc08f38 Josef Bacik   2013-10-11  539  	offset = em->start + em->len;
ae98ae2a50d72b Filipe Manana 2025-04-08  540  	btrfs_free_extent_map(em);
aaedb55bc08f38 Josef Bacik   2013-10-11  541  
8bab0a30665e46 Qu Wenruo     2024-01-08  542  	em = btrfs_get_extent(BTRFS_I(inode), NULL, offset, sectorsize);
aaedb55bc08f38 Josef Bacik   2013-10-11  543  	if (IS_ERR(em)) {
3c7251f2f88880 David Sterba  2018-05-17  544  		test_err("got an error when we shouldn't have");
aaedb55bc08f38 Josef Bacik   2013-10-11  545  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  546  	}
c77a8c61002e91 Qu Wenruo     2024-04-30  547  	if (em->disk_bytenr >= EXTENT_MAP_LAST_BYTE) {
c77a8c61002e91 Qu Wenruo     2024-04-30  548  		test_err("expected a real extent, got %llu", em->disk_bytenr);
aaedb55bc08f38 Josef Bacik   2013-10-11  549  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  550  	}
b9ef22dedde08a Feifei Xu     2016-06-01  551  	if (em->start != offset || em->len != 2 * sectorsize) {
3c7251f2f88880 David Sterba  2018-05-17  552  		test_err(
3c7251f2f88880 David Sterba  2018-05-17  553  	"unexpected extent wanted start %llu len %u, got start %llu len %llu",
b9ef22dedde08a Feifei Xu     2016-06-01  554  			offset, 2 * sectorsize, em->start, em->len);
aaedb55bc08f38 Josef Bacik   2013-10-11  555  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  556  	}
aaedb55bc08f38 Josef Bacik   2013-10-11  557  	if (em->flags != prealloc_only) {
f86f7a75e2fb5f Filipe Manana 2023-12-04  558  		test_err("unexpected flags set, want %u have %u",
aaedb55bc08f38 Josef Bacik   2013-10-11  559  			 prealloc_only, em->flags);
aaedb55bc08f38 Josef Bacik   2013-10-11  560  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  561  	}
4aa7b5d1784f51 Qu Wenruo     2024-04-30  562  	if (em->start - em->offset != orig_start) {
4aa7b5d1784f51 Qu Wenruo     2024-04-30  563  		test_err("wrong offset, em->start=%llu em->offset=%llu orig_start=%llu",
4aa7b5d1784f51 Qu Wenruo     2024-04-30  564  			 em->start, em->offset, orig_start);
aaedb55bc08f38 Josef Bacik   2013-10-11  565  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  566  	}
2e871330cea44f Filipe Manana 2025-04-08  567  	if (btrfs_extent_map_block_start(em) != disk_bytenr + em->offset) {
3c7251f2f88880 David Sterba  2018-05-17  568  		test_err("unexpected block start, wanted %llu, have %llu",
2e871330cea44f Filipe Manana 2025-04-08  569  			 disk_bytenr + em->offset, btrfs_extent_map_block_start(em));
aaedb55bc08f38 Josef Bacik   2013-10-11  570  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  571  	}
aaedb55bc08f38 Josef Bacik   2013-10-11  572  	offset = em->start + em->len;
ae98ae2a50d72b Filipe Manana 2025-04-08  573  	btrfs_free_extent_map(em);
aaedb55bc08f38 Josef Bacik   2013-10-11  574  
aaedb55bc08f38 Josef Bacik   2013-10-11  575  	/* Now for the compressed extent */
8bab0a30665e46 Qu Wenruo     2024-01-08  576  	em = btrfs_get_extent(BTRFS_I(inode), NULL, offset, sectorsize);
aaedb55bc08f38 Josef Bacik   2013-10-11  577  	if (IS_ERR(em)) {
3c7251f2f88880 David Sterba  2018-05-17  578  		test_err("got an error when we shouldn't have");
aaedb55bc08f38 Josef Bacik   2013-10-11  579  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  580  	}
c77a8c61002e91 Qu Wenruo     2024-04-30  581  	if (em->disk_bytenr >= EXTENT_MAP_LAST_BYTE) {
c77a8c61002e91 Qu Wenruo     2024-04-30  582  		test_err("expected a real extent, got %llu", em->disk_bytenr);
aaedb55bc08f38 Josef Bacik   2013-10-11  583  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  584  	}
b9ef22dedde08a Feifei Xu     2016-06-01  585  	if (em->start != offset || em->len != 2 * sectorsize) {
3c7251f2f88880 David Sterba  2018-05-17  586  		test_err(
3c7251f2f88880 David Sterba  2018-05-17  587  	"unexpected extent wanted start %llu len %u, got start %llu len %llu",
b9ef22dedde08a Feifei Xu     2016-06-01  588  			offset, 2 * sectorsize, em->start, em->len);
aaedb55bc08f38 Josef Bacik   2013-10-11  589  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  590  	}
aaedb55bc08f38 Josef Bacik   2013-10-11  591  	if (em->flags != compressed_only) {
f86f7a75e2fb5f Filipe Manana 2023-12-04  592  		test_err("unexpected flags set, want %u have %u",
aaedb55bc08f38 Josef Bacik   2013-10-11  593  			 compressed_only, em->flags);
aaedb55bc08f38 Josef Bacik   2013-10-11  594  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  595  	}
4aa7b5d1784f51 Qu Wenruo     2024-04-30  596  	if (em->offset != 0) {
4aa7b5d1784f51 Qu Wenruo     2024-04-30  597  		test_err("wrong offset, want 0, have %llu", em->offset);
aaedb55bc08f38 Josef Bacik   2013-10-11  598  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  599  	}
962162ffa64f31 Filipe Manana 2025-04-08  600  	if (btrfs_extent_map_compression(em) != BTRFS_COMPRESS_ZLIB) {
3c7251f2f88880 David Sterba  2018-05-17  601  		test_err("unexpected compress type, wanted %d, got %d",
962162ffa64f31 Filipe Manana 2025-04-08  602  			 BTRFS_COMPRESS_ZLIB, btrfs_extent_map_compression(em));
aaedb55bc08f38 Josef Bacik   2013-10-11  603  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  604  	}
aaedb55bc08f38 Josef Bacik   2013-10-11  605  	offset = em->start + em->len;
ae98ae2a50d72b Filipe Manana 2025-04-08  606  	btrfs_free_extent_map(em);
aaedb55bc08f38 Josef Bacik   2013-10-11  607  
aaedb55bc08f38 Josef Bacik   2013-10-11  608  	/* Split compressed extent */
8bab0a30665e46 Qu Wenruo     2024-01-08  609  	em = btrfs_get_extent(BTRFS_I(inode), NULL, offset, sectorsize);
aaedb55bc08f38 Josef Bacik   2013-10-11  610  	if (IS_ERR(em)) {
3c7251f2f88880 David Sterba  2018-05-17  611  		test_err("got an error when we shouldn't have");
aaedb55bc08f38 Josef Bacik   2013-10-11  612  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  613  	}
c77a8c61002e91 Qu Wenruo     2024-04-30  614  	if (em->disk_bytenr >= EXTENT_MAP_LAST_BYTE) {
c77a8c61002e91 Qu Wenruo     2024-04-30  615  		test_err("expected a real extent, got %llu", em->disk_bytenr);
aaedb55bc08f38 Josef Bacik   2013-10-11  616  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  617  	}
b9ef22dedde08a Feifei Xu     2016-06-01  618  	if (em->start != offset || em->len != sectorsize) {
3c7251f2f88880 David Sterba  2018-05-17  619  		test_err(
3c7251f2f88880 David Sterba  2018-05-17  620  	"unexpected extent wanted start %llu len %u, got start %llu len %llu",
b9ef22dedde08a Feifei Xu     2016-06-01  621  			offset, sectorsize, em->start, em->len);
aaedb55bc08f38 Josef Bacik   2013-10-11  622  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  623  	}
aaedb55bc08f38 Josef Bacik   2013-10-11  624  	if (em->flags != compressed_only) {
f86f7a75e2fb5f Filipe Manana 2023-12-04  625  		test_err("unexpected flags set, want %u have %u",
aaedb55bc08f38 Josef Bacik   2013-10-11  626  			 compressed_only, em->flags);
aaedb55bc08f38 Josef Bacik   2013-10-11  627  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  628  	}
4aa7b5d1784f51 Qu Wenruo     2024-04-30  629  	if (em->offset != 0) {
4aa7b5d1784f51 Qu Wenruo     2024-04-30  630  		test_err("wrong offset, want 0, have %llu", em->offset);
aaedb55bc08f38 Josef Bacik   2013-10-11  631  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  632  	}
962162ffa64f31 Filipe Manana 2025-04-08  633  	if (btrfs_extent_map_compression(em) != BTRFS_COMPRESS_ZLIB) {
3c7251f2f88880 David Sterba  2018-05-17  634  		test_err("unexpected compress type, wanted %d, got %d",
962162ffa64f31 Filipe Manana 2025-04-08  635  			 BTRFS_COMPRESS_ZLIB, btrfs_extent_map_compression(em));
aaedb55bc08f38 Josef Bacik   2013-10-11  636  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  637  	}
2e871330cea44f Filipe Manana 2025-04-08  638  	disk_bytenr = btrfs_extent_map_block_start(em);
aaedb55bc08f38 Josef Bacik   2013-10-11  639  	orig_start = em->start;
aaedb55bc08f38 Josef Bacik   2013-10-11  640  	offset = em->start + em->len;
ae98ae2a50d72b Filipe Manana 2025-04-08  641  	btrfs_free_extent_map(em);
aaedb55bc08f38 Josef Bacik   2013-10-11  642  
8bab0a30665e46 Qu Wenruo     2024-01-08  643  	em = btrfs_get_extent(BTRFS_I(inode), NULL, offset, sectorsize);
aaedb55bc08f38 Josef Bacik   2013-10-11  644  	if (IS_ERR(em)) {
3c7251f2f88880 David Sterba  2018-05-17  645  		test_err("got an error when we shouldn't have");
aaedb55bc08f38 Josef Bacik   2013-10-11  646  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  647  	}
c77a8c61002e91 Qu Wenruo     2024-04-30  648  	if (em->disk_bytenr >= EXTENT_MAP_LAST_BYTE) {
c77a8c61002e91 Qu Wenruo     2024-04-30  649  		test_err("expected a real extent, got %llu", em->disk_bytenr);
aaedb55bc08f38 Josef Bacik   2013-10-11  650  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  651  	}
b9ef22dedde08a Feifei Xu     2016-06-01  652  	if (em->start != offset || em->len != sectorsize) {
3c7251f2f88880 David Sterba  2018-05-17  653  		test_err(
3c7251f2f88880 David Sterba  2018-05-17  654  	"unexpected extent wanted start %llu len %u, got start %llu len %llu",
b9ef22dedde08a Feifei Xu     2016-06-01  655  			offset, sectorsize, em->start, em->len);
aaedb55bc08f38 Josef Bacik   2013-10-11  656  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  657  	}
aaedb55bc08f38 Josef Bacik   2013-10-11  658  	if (em->flags != 0) {
f86f7a75e2fb5f Filipe Manana 2023-12-04  659  		test_err("unexpected flags set, want 0 have %u", em->flags);
aaedb55bc08f38 Josef Bacik   2013-10-11  660  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  661  	}
4aa7b5d1784f51 Qu Wenruo     2024-04-30  662  	if (em->offset != 0) {
4aa7b5d1784f51 Qu Wenruo     2024-04-30  663  		test_err("wrong offset, want 0, have %llu", em->offset);
aaedb55bc08f38 Josef Bacik   2013-10-11  664  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  665  	}
aaedb55bc08f38 Josef Bacik   2013-10-11  666  	offset = em->start + em->len;
ae98ae2a50d72b Filipe Manana 2025-04-08  667  	btrfs_free_extent_map(em);
aaedb55bc08f38 Josef Bacik   2013-10-11  668  
8bab0a30665e46 Qu Wenruo     2024-01-08  669  	em = btrfs_get_extent(BTRFS_I(inode), NULL, offset, sectorsize);
aaedb55bc08f38 Josef Bacik   2013-10-11  670  	if (IS_ERR(em)) {
3c7251f2f88880 David Sterba  2018-05-17  671  		test_err("got an error when we shouldn't have");
aaedb55bc08f38 Josef Bacik   2013-10-11  672  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  673  	}
2e871330cea44f Filipe Manana 2025-04-08  674  	if (btrfs_extent_map_block_start(em) != disk_bytenr) {
3c7251f2f88880 David Sterba  2018-05-17  675  		test_err("block start does not match, want %llu got %llu",
2e871330cea44f Filipe Manana 2025-04-08  676  			 disk_bytenr, btrfs_extent_map_block_start(em));
aaedb55bc08f38 Josef Bacik   2013-10-11  677  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  678  	}
b9ef22dedde08a Feifei Xu     2016-06-01  679  	if (em->start != offset || em->len != 2 * sectorsize) {
3c7251f2f88880 David Sterba  2018-05-17  680  		test_err(
3c7251f2f88880 David Sterba  2018-05-17  681  	"unexpected extent wanted start %llu len %u, got start %llu len %llu",
b9ef22dedde08a Feifei Xu     2016-06-01  682  			offset, 2 * sectorsize, em->start, em->len);
aaedb55bc08f38 Josef Bacik   2013-10-11  683  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  684  	}
aaedb55bc08f38 Josef Bacik   2013-10-11  685  	if (em->flags != compressed_only) {
f86f7a75e2fb5f Filipe Manana 2023-12-04  686  		test_err("unexpected flags set, want %u have %u",
aaedb55bc08f38 Josef Bacik   2013-10-11  687  			 compressed_only, em->flags);
aaedb55bc08f38 Josef Bacik   2013-10-11  688  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  689  	}
4aa7b5d1784f51 Qu Wenruo     2024-04-30  690  	if (em->start - em->offset != orig_start) {
4aa7b5d1784f51 Qu Wenruo     2024-04-30  691  		test_err("wrong offset, em->start=%llu em->offset=%llu orig_start=%llu",
4aa7b5d1784f51 Qu Wenruo     2024-04-30  692  			 em->start, em->offset, orig_start);
aaedb55bc08f38 Josef Bacik   2013-10-11  693  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  694  	}
962162ffa64f31 Filipe Manana 2025-04-08  695  	if (btrfs_extent_map_compression(em) != BTRFS_COMPRESS_ZLIB) {
3c7251f2f88880 David Sterba  2018-05-17  696  		test_err("unexpected compress type, wanted %d, got %d",
962162ffa64f31 Filipe Manana 2025-04-08  697  			 BTRFS_COMPRESS_ZLIB, btrfs_extent_map_compression(em));
aaedb55bc08f38 Josef Bacik   2013-10-11  698  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  699  	}
aaedb55bc08f38 Josef Bacik   2013-10-11  700  	offset = em->start + em->len;
ae98ae2a50d72b Filipe Manana 2025-04-08  701  	btrfs_free_extent_map(em);
aaedb55bc08f38 Josef Bacik   2013-10-11  702  
aaedb55bc08f38 Josef Bacik   2013-10-11  703  	/* A hole between regular extents but no hole extent */
8bab0a30665e46 Qu Wenruo     2024-01-08  704  	em = btrfs_get_extent(BTRFS_I(inode), NULL, offset + 6, sectorsize);
aaedb55bc08f38 Josef Bacik   2013-10-11  705  	if (IS_ERR(em)) {
3c7251f2f88880 David Sterba  2018-05-17  706  		test_err("got an error when we shouldn't have");
aaedb55bc08f38 Josef Bacik   2013-10-11  707  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  708  	}
c77a8c61002e91 Qu Wenruo     2024-04-30  709  	if (em->disk_bytenr >= EXTENT_MAP_LAST_BYTE) {
c77a8c61002e91 Qu Wenruo     2024-04-30  710  		test_err("expected a real extent, got %llu", em->disk_bytenr);
aaedb55bc08f38 Josef Bacik   2013-10-11  711  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  712  	}
b9ef22dedde08a Feifei Xu     2016-06-01  713  	if (em->start != offset || em->len != sectorsize) {
3c7251f2f88880 David Sterba  2018-05-17  714  		test_err(
3c7251f2f88880 David Sterba  2018-05-17  715  	"unexpected extent wanted start %llu len %u, got start %llu len %llu",
b9ef22dedde08a Feifei Xu     2016-06-01  716  			offset, sectorsize, em->start, em->len);
aaedb55bc08f38 Josef Bacik   2013-10-11  717  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  718  	}
aaedb55bc08f38 Josef Bacik   2013-10-11  719  	if (em->flags != 0) {
f86f7a75e2fb5f Filipe Manana 2023-12-04  720  		test_err("unexpected flags set, want 0 have %u", em->flags);
aaedb55bc08f38 Josef Bacik   2013-10-11  721  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  722  	}
4aa7b5d1784f51 Qu Wenruo     2024-04-30  723  	if (em->offset != 0) {
4aa7b5d1784f51 Qu Wenruo     2024-04-30  724  		test_err("wrong offset, want 0, have %llu", em->offset);
aaedb55bc08f38 Josef Bacik   2013-10-11  725  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  726  	}
aaedb55bc08f38 Josef Bacik   2013-10-11  727  	offset = em->start + em->len;
ae98ae2a50d72b Filipe Manana 2025-04-08  728  	btrfs_free_extent_map(em);
aaedb55bc08f38 Josef Bacik   2013-10-11  729  
8bab0a30665e46 Qu Wenruo     2024-01-08  730  	em = btrfs_get_extent(BTRFS_I(inode), NULL, offset, SZ_4M);
aaedb55bc08f38 Josef Bacik   2013-10-11  731  	if (IS_ERR(em)) {
3c7251f2f88880 David Sterba  2018-05-17  732  		test_err("got an error when we shouldn't have");
aaedb55bc08f38 Josef Bacik   2013-10-11  733  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  734  	}
c77a8c61002e91 Qu Wenruo     2024-04-30  735  	if (em->disk_bytenr != EXTENT_MAP_HOLE) {
c77a8c61002e91 Qu Wenruo     2024-04-30  736  		test_err("expected a hole extent, got %llu", em->disk_bytenr);
aaedb55bc08f38 Josef Bacik   2013-10-11  737  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  738  	}
aaedb55bc08f38 Josef Bacik   2013-10-11  739  	/*
aaedb55bc08f38 Josef Bacik   2013-10-11  740  	 * Currently we just return a length that we requested rather than the
aaedb55bc08f38 Josef Bacik   2013-10-11  741  	 * length of the actual hole, if this changes we'll have to change this
aaedb55bc08f38 Josef Bacik   2013-10-11  742  	 * test.
aaedb55bc08f38 Josef Bacik   2013-10-11  743  	 */
b9ef22dedde08a Feifei Xu     2016-06-01  744  	if (em->start != offset || em->len != 3 * sectorsize) {
3c7251f2f88880 David Sterba  2018-05-17  745  		test_err(
3c7251f2f88880 David Sterba  2018-05-17  746  	"unexpected extent wanted start %llu len %u, got start %llu len %llu",
b9ef22dedde08a Feifei Xu     2016-06-01  747  			offset, 3 * sectorsize, em->start, em->len);
aaedb55bc08f38 Josef Bacik   2013-10-11  748  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  749  	}
aaedb55bc08f38 Josef Bacik   2013-10-11  750  	if (em->flags != vacancy_only) {
f86f7a75e2fb5f Filipe Manana 2023-12-04  751  		test_err("unexpected flags set, want %u have %u",
aaedb55bc08f38 Josef Bacik   2013-10-11  752  			 vacancy_only, em->flags);
aaedb55bc08f38 Josef Bacik   2013-10-11  753  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  754  	}
4aa7b5d1784f51 Qu Wenruo     2024-04-30  755  	if (em->offset != 0) {
4aa7b5d1784f51 Qu Wenruo     2024-04-30  756  		test_err("wrong offset, want 0, have %llu", em->offset);
aaedb55bc08f38 Josef Bacik   2013-10-11  757  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  758  	}
aaedb55bc08f38 Josef Bacik   2013-10-11  759  	offset = em->start + em->len;
ae98ae2a50d72b Filipe Manana 2025-04-08  760  	btrfs_free_extent_map(em);
aaedb55bc08f38 Josef Bacik   2013-10-11  761  
8bab0a30665e46 Qu Wenruo     2024-01-08  762  	em = btrfs_get_extent(BTRFS_I(inode), NULL, offset, sectorsize);
aaedb55bc08f38 Josef Bacik   2013-10-11  763  	if (IS_ERR(em)) {
3c7251f2f88880 David Sterba  2018-05-17  764  		test_err("got an error when we shouldn't have");
aaedb55bc08f38 Josef Bacik   2013-10-11  765  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  766  	}
c77a8c61002e91 Qu Wenruo     2024-04-30  767  	if (em->disk_bytenr >= EXTENT_MAP_LAST_BYTE) {
c77a8c61002e91 Qu Wenruo     2024-04-30  768  		test_err("expected a real extent, got %llu", em->disk_bytenr);
aaedb55bc08f38 Josef Bacik   2013-10-11  769  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  770  	}
b9ef22dedde08a Feifei Xu     2016-06-01  771  	if (em->start != offset || em->len != sectorsize) {
3c7251f2f88880 David Sterba  2018-05-17  772  		test_err(
3c7251f2f88880 David Sterba  2018-05-17  773  	"unexpected extent wanted start %llu len %u, got start %llu len %llu",
b9ef22dedde08a Feifei Xu     2016-06-01  774  			offset, sectorsize, em->start, em->len);
aaedb55bc08f38 Josef Bacik   2013-10-11  775  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  776  	}
aaedb55bc08f38 Josef Bacik   2013-10-11  777  	if (em->flags != 0) {
f86f7a75e2fb5f Filipe Manana 2023-12-04  778  		test_err("unexpected flags set, want 0 have %u", em->flags);
aaedb55bc08f38 Josef Bacik   2013-10-11  779  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  780  	}
4aa7b5d1784f51 Qu Wenruo     2024-04-30  781  	if (em->offset != 0) {
4aa7b5d1784f51 Qu Wenruo     2024-04-30  782  		test_err("wrong orig offset, want 0, have %llu", em->offset);
aaedb55bc08f38 Josef Bacik   2013-10-11  783  		goto out;
aaedb55bc08f38 Josef Bacik   2013-10-11  784  	}
aaedb55bc08f38 Josef Bacik   2013-10-11  785  	ret = 0;
aaedb55bc08f38 Josef Bacik   2013-10-11  786  out:
aaedb55bc08f38 Josef Bacik   2013-10-11 @787  	if (!IS_ERR(em))
ae98ae2a50d72b Filipe Manana 2025-04-08  788  		btrfs_free_extent_map(em);
aaedb55bc08f38 Josef Bacik   2013-10-11  789  	iput(inode);
faa2dbf004e89e Josef Bacik   2014-05-07  790  	btrfs_free_dummy_root(root);
7c0260ee098db7 Jeff Mahoney  2016-06-20  791  	btrfs_free_dummy_fs_info(fs_info);
aaedb55bc08f38 Josef Bacik   2013-10-11  792  	return ret;
aaedb55bc08f38 Josef Bacik   2013-10-11  793  }
aaedb55bc08f38 Josef Bacik   2013-10-11  794  

:::::: The code at line 787 was first introduced by commit
:::::: aaedb55bc08f384b7f57dbb3222a511baed4decf Btrfs: add tests for btrfs_get_extent

:::::: TO: Josef Bacik <jbacik@fusionio.com>
:::::: CC: Chris Mason <chris.mason@fusionio.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
