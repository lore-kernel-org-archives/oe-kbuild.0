Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5C61A38DA
	for <oe-kbuild@lists.linux.dev>; Fri, 15 Mar 2024 04:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710476460; cv=none; b=UENFWITxh72y0BkB+K2IGYeJZgC4ofJBNDFUoyuMIc2xWaUmfNa6L8cJ4CFsaStnUG0t2fWKArT4eHH3cjysV/2q42eXODtVCcL1vkNqs6xooWsKelfpe6US8Jlc/+sfQin36/zrfcfHOlJ4Xx4qiODtAl2cWoF5fFocXIMnt4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710476460; c=relaxed/simple;
	bh=J3AjJ1mxLmcfZ+2nG1JkeSLYKTNxVNG/YZd/aCViXbA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DPOe+M6IMOaActre8aw2Bjz+GA6uAj9U04wRIyd6yR9GSvkIk5PxzDI+tH+BTlGeXyXnml0s6ZO/70PlzOMrAFtyk8/wrA4ItpFFt+F0iocDakQi953CUhaOwkZGxH9iYpITPJzYJoCv3hPnnwiTn2+PBKWDFh367CF76XbNGhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OLwVTkWH; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OLwVTkWH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710476458; x=1742012458;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J3AjJ1mxLmcfZ+2nG1JkeSLYKTNxVNG/YZd/aCViXbA=;
  b=OLwVTkWHpE51cNWzO58DRn2cKVdkZEN09Iz9lB3wu2bJaC6Cui+mbbwh
   pv8yvejMzaQ2i6a+RWmxcFGbmfQu/rVDdoWJSXLLg9hGXFLuL4DQJcOkp
   R2hnaeIryj8Fk4bjINtxSWE08AtkYbGfViykxY6/yr//qDQp2pJ+U+QhZ
   WZWz6lA8zbsAwcTNqbbE+WG1th06zgsJ/q4TxAagK8V7n3UYdsBqgmguL
   zObZYR+GN3U6ujQtLISofr1m3ofxVsF3sD70Hcd33mdJOgaLl+XuppERV
   /4kYhnMCvwptXCJi6WRvMMTZ/wAL7RSDtO2BZcC9ZFnxB+GxYE5nv4qfx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="16785026"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="16785026"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 21:20:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="17232111"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Mar 2024 21:20:56 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkz3t-000E5R-1F;
	Fri, 15 Mar 2024 04:20:53 +0000
Date: Fri, 15 Mar 2024 12:20:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 12881/13613] fs/exfat/dir.c:896
 __exfat_get_dentry_set() warn: missing unwind goto?
Message-ID: <202403151204.LNYJdVfp-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Yuezhang Mo <Yuezhang.Mo@sony.com>
CC: Namjae Jeon <linkinjeon@kernel.org>
CC: Andy Wu <Andy.Wu@sony.com>
CC: Aoyama Wataru <wataru.aoyama@sony.com>
CC: Sungjong Seo <sj1557.seo@samsung.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9bb9b28d0568991b1d63e66fe75afa5f97ad1156
commit: bd31db2fd3bdaca4be598ddc39770eb6ebd9e3f3 [12881/13613] exfat: add __exfat_get_dentry_set() helper
:::::: branch date: 25 hours ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20240313 (https://download.01.org/0day-ci/archive/20240315/202403151204.LNYJdVfp-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403151204.LNYJdVfp-lkp@intel.com/

New smatch warnings:
fs/exfat/dir.c:896 __exfat_get_dentry_set() warn: missing unwind goto?

Old smatch warnings:
fs/exfat/dir.c:172 exfat_readdir() warn: passing freed memory 'bh'
fs/exfat/dir.c:494 exfat_init_dir_entry() warn: passing freed memory 'bh'
fs/exfat/dir.c:578 exfat_init_ext_entry() warn: passing freed memory 'bh'
fs/exfat/dir.c:590 exfat_init_ext_entry() warn: passing freed memory 'bh'

vim +896 fs/exfat/dir.c

943af1fdacfebe Tetsuhiro Kohada 2020-05-20  829  
ca06197382bde0 Namjae Jeon      2020-03-02  830  /*
bd31db2fd3bdac Yuezhang Mo      2023-12-08  831   * Returns a set of dentries.
ca06197382bde0 Namjae Jeon      2020-03-02  832   *
943af1fdacfebe Tetsuhiro Kohada 2020-05-20  833   * Note It provides a direct pointer to bh->data via exfat_get_dentry_cached().
943af1fdacfebe Tetsuhiro Kohada 2020-05-20  834   * User should call exfat_get_dentry_set() after setting 'modified' to apply
943af1fdacfebe Tetsuhiro Kohada 2020-05-20  835   * changes made in this entry set to the real device.
ca06197382bde0 Namjae Jeon      2020-03-02  836   *
ca06197382bde0 Namjae Jeon      2020-03-02  837   * in:
ca06197382bde0 Namjae Jeon      2020-03-02  838   *   sb+p_dir+entry: indicates a file/dir
bd31db2fd3bdac Yuezhang Mo      2023-12-08  839   *   num_entries: specifies how many dentries should be included.
bd31db2fd3bdac Yuezhang Mo      2023-12-08  840   *                It will be set to es->num_entries if it is not 0.
bd31db2fd3bdac Yuezhang Mo      2023-12-08  841   *                If num_entries is 0, es->num_entries will be obtained
bd31db2fd3bdac Yuezhang Mo      2023-12-08  842   *                from the first dentry.
bd31db2fd3bdac Yuezhang Mo      2023-12-08  843   * out:
bd31db2fd3bdac Yuezhang Mo      2023-12-08  844   *   es: pointer of entry set on success.
ca06197382bde0 Namjae Jeon      2020-03-02  845   * return:
bd31db2fd3bdac Yuezhang Mo      2023-12-08  846   *   0 on success
bd31db2fd3bdac Yuezhang Mo      2023-12-08  847   *   -error code on failure
ca06197382bde0 Namjae Jeon      2020-03-02  848   */
bd31db2fd3bdac Yuezhang Mo      2023-12-08  849  static int __exfat_get_dentry_set(struct exfat_entry_set_cache *es,
20914ff6dd56dd Yuezhang Mo      2022-11-17  850  		struct super_block *sb, struct exfat_chain *p_dir, int entry,
bd31db2fd3bdac Yuezhang Mo      2023-12-08  851  		unsigned int num_entries)
ca06197382bde0 Namjae Jeon      2020-03-02  852  {
943af1fdacfebe Tetsuhiro Kohada 2020-05-20  853  	int ret, i, num_bh;
36955d368dc101 Yuezhang Mo      2022-11-17  854  	unsigned int off;
ca06197382bde0 Namjae Jeon      2020-03-02  855  	sector_t sec;
ca06197382bde0 Namjae Jeon      2020-03-02  856  	struct exfat_sb_info *sbi = EXFAT_SB(sb);
ca06197382bde0 Namjae Jeon      2020-03-02  857  	struct buffer_head *bh;
ca06197382bde0 Namjae Jeon      2020-03-02  858  
ca06197382bde0 Namjae Jeon      2020-03-02  859  	if (p_dir->dir == DIR_DELETED) {
d1727d55c0327e Joe Perches      2020-04-24  860  		exfat_err(sb, "access to deleted dentry");
20914ff6dd56dd Yuezhang Mo      2022-11-17  861  		return -EIO;
ca06197382bde0 Namjae Jeon      2020-03-02  862  	}
ca06197382bde0 Namjae Jeon      2020-03-02  863  
36955d368dc101 Yuezhang Mo      2022-11-17  864  	ret = exfat_find_location(sb, p_dir, entry, &sec, &off);
ca06197382bde0 Namjae Jeon      2020-03-02  865  	if (ret)
20914ff6dd56dd Yuezhang Mo      2022-11-17  866  		return ret;
ca06197382bde0 Namjae Jeon      2020-03-02  867  
20914ff6dd56dd Yuezhang Mo      2022-11-17  868  	memset(es, 0, sizeof(*es));
943af1fdacfebe Tetsuhiro Kohada 2020-05-20  869  	es->sb = sb;
943af1fdacfebe Tetsuhiro Kohada 2020-05-20  870  	es->modified = false;
943af1fdacfebe Tetsuhiro Kohada 2020-05-20  871  	es->start_off = off;
a3ff29a95fde16 Yuezhang Mo      2022-11-09  872  	es->bh = es->__bh;
ca06197382bde0 Namjae Jeon      2020-03-02  873  
ca06197382bde0 Namjae Jeon      2020-03-02  874  	bh = sb_bread(sb, sec);
ca06197382bde0 Namjae Jeon      2020-03-02  875  	if (!bh)
20914ff6dd56dd Yuezhang Mo      2022-11-17  876  		return -EIO;
943af1fdacfebe Tetsuhiro Kohada 2020-05-20  877  	es->bh[es->num_bh++] = bh;
ca06197382bde0 Namjae Jeon      2020-03-02  878  
bd31db2fd3bdac Yuezhang Mo      2023-12-08  879  	if (num_entries == ES_ALL_ENTRIES) {
bd31db2fd3bdac Yuezhang Mo      2023-12-08  880  		struct exfat_dentry *ep;
bd31db2fd3bdac Yuezhang Mo      2023-12-08  881  
f3fe3954c09f97 Yuezhang Mo      2022-03-17  882  		ep = exfat_get_dentry_cached(es, ES_IDX_FILE);
bd31db2fd3bdac Yuezhang Mo      2023-12-08  883  		if (ep->type != EXFAT_FILE)
3b9681acb0ef73 Yuezhang Mo      2022-03-17  884  			goto put_es;
ca06197382bde0 Namjae Jeon      2020-03-02  885  
bd31db2fd3bdac Yuezhang Mo      2023-12-08  886  		num_entries = ep->dentry.file.num_ext + 1;
bd31db2fd3bdac Yuezhang Mo      2023-12-08  887  	}
bd31db2fd3bdac Yuezhang Mo      2023-12-08  888  
ca06197382bde0 Namjae Jeon      2020-03-02  889  	es->num_entries = num_entries;
ca06197382bde0 Namjae Jeon      2020-03-02  890  
943af1fdacfebe Tetsuhiro Kohada 2020-05-20  891  	num_bh = EXFAT_B_TO_BLK_ROUND_UP(off + num_entries * DENTRY_SIZE, sb);
a3ff29a95fde16 Yuezhang Mo      2022-11-09  892  	if (num_bh > ARRAY_SIZE(es->__bh)) {
a3ff29a95fde16 Yuezhang Mo      2022-11-09  893  		es->bh = kmalloc_array(num_bh, sizeof(*es->bh), GFP_KERNEL);
a3ff29a95fde16 Yuezhang Mo      2022-11-09  894  		if (!es->bh) {
a3ff29a95fde16 Yuezhang Mo      2022-11-09  895  			brelse(bh);
20914ff6dd56dd Yuezhang Mo      2022-11-17 @896  			return -ENOMEM;
a3ff29a95fde16 Yuezhang Mo      2022-11-09  897  		}
a3ff29a95fde16 Yuezhang Mo      2022-11-09  898  		es->bh[0] = bh;
a3ff29a95fde16 Yuezhang Mo      2022-11-09  899  	}
a3ff29a95fde16 Yuezhang Mo      2022-11-09  900  
943af1fdacfebe Tetsuhiro Kohada 2020-05-20  901  	for (i = 1; i < num_bh; i++) {
ca06197382bde0 Namjae Jeon      2020-03-02  902  		/* get the next sector */
ca06197382bde0 Namjae Jeon      2020-03-02  903  		if (exfat_is_last_sector_in_cluster(sbi, sec)) {
36955d368dc101 Yuezhang Mo      2022-11-17  904  			unsigned int clu = exfat_sector_to_cluster(sbi, sec);
36955d368dc101 Yuezhang Mo      2022-11-17  905  
943af1fdacfebe Tetsuhiro Kohada 2020-05-20  906  			if (p_dir->flags == ALLOC_NO_FAT_CHAIN)
ca06197382bde0 Namjae Jeon      2020-03-02  907  				clu++;
ca06197382bde0 Namjae Jeon      2020-03-02  908  			else if (exfat_get_next_cluster(sb, &clu))
3b9681acb0ef73 Yuezhang Mo      2022-03-17  909  				goto put_es;
ca06197382bde0 Namjae Jeon      2020-03-02  910  			sec = exfat_cluster_to_sector(sbi, clu);
ca06197382bde0 Namjae Jeon      2020-03-02  911  		} else {
ca06197382bde0 Namjae Jeon      2020-03-02  912  			sec++;
ca06197382bde0 Namjae Jeon      2020-03-02  913  		}
ca06197382bde0 Namjae Jeon      2020-03-02  914  
ca06197382bde0 Namjae Jeon      2020-03-02  915  		bh = sb_bread(sb, sec);
ca06197382bde0 Namjae Jeon      2020-03-02  916  		if (!bh)
3b9681acb0ef73 Yuezhang Mo      2022-03-17  917  			goto put_es;
943af1fdacfebe Tetsuhiro Kohada 2020-05-20  918  		es->bh[es->num_bh++] = bh;
ca06197382bde0 Namjae Jeon      2020-03-02  919  	}
ca06197382bde0 Namjae Jeon      2020-03-02  920  
bd31db2fd3bdac Yuezhang Mo      2023-12-08  921  	return 0;
bd31db2fd3bdac Yuezhang Mo      2023-12-08  922  
bd31db2fd3bdac Yuezhang Mo      2023-12-08  923  put_es:
bd31db2fd3bdac Yuezhang Mo      2023-12-08  924  	exfat_put_dentry_set(es, false);
bd31db2fd3bdac Yuezhang Mo      2023-12-08  925  	return -EIO;
bd31db2fd3bdac Yuezhang Mo      2023-12-08  926  }
bd31db2fd3bdac Yuezhang Mo      2023-12-08  927  

:::::: The code at line 896 was first introduced by commit
:::::: 20914ff6dd56dd6b548bf5dd90bff09ef89999e4 exfat: move exfat_entry_set_cache from heap to stack

:::::: TO: Yuezhang Mo <Yuezhang.Mo@sony.com>
:::::: CC: Namjae Jeon <linkinjeon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
