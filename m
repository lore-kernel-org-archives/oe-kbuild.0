Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB1F45C708
	for <oe-kbuild@lists.linux.dev>; Fri, 31 Jul 2026 23:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785540599; cv=none; b=blYN2/kEvNIzUjliPhpip0ChUJMKO3D01XDx9a8UM6rL8C3BDZhKaHLEPB40PKC3vvz3naT/rQQLYAmGcfP/niAuGh2iXZIRZ0FC+/kcsJO1W7oaTdUESPvtSWiq1FpMH99XfDXUlkt8KeY4KPDymgpBFuRjk+eeI8kLqbZy0Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785540599; c=relaxed/simple;
	bh=BCQZ1LnmlAvmr2NmDy+fj6dLJEfNq+FYNO+RySeEUSc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q4BH3tGobcKO1ImBfCReCFwJNBfMSeg7x5jcmXR5tVIwb3Tq6ZqTEZTgPUgo+9S0K0oFCBU0zBNi9NO9zr36QKe03kZJjgdmoI7RA/nokcS02N/M1Wzl7LPSbOvrGpdZNc4P4FYP2goyIcWCWs8ngq+LkYyQiXUe7wlG6zZ9mvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CRuffeMR; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CRuffeMR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785540598; x=1817076598;
  h=date:from:to:cc:subject:message-id;
  bh=BCQZ1LnmlAvmr2NmDy+fj6dLJEfNq+FYNO+RySeEUSc=;
  b=CRuffeMROxKQCU2hOCjqrq+rYD6ksa9vPWLV6hraxf7Tv+UfV8bxMUzE
   7zlNJ0+A/X2ZVz4yb/1mxKiOqivGGRkfjdY0T5LMpwI4D2gD/rxqqWL/M
   4BSc0l9tt1pmhY1ZzjI6RUCzE3nDe4+6TSLiJmpszXIJxXeS2xkxEUsoI
   4gm6SAFFlLTRRo7lM2lkuXQjHMy7jnuZGN1NGguvDD0AJT8M54jv81CKN
   62eiAQhHK3V7BVzPzZSH5YuaDyS4LJpZBYOgW2vzZ/6ym5qA3K6SB7Cv9
   KIIG2vtHEJ1KwzC3zKNXu+pOhcXytlfKIBR/hjhOI02lhCpPt8YxnHJVN
   Q==;
X-CSE-ConnectionGUID: aNDB9LcWSVGjS9LmJyQRZQ==
X-CSE-MsgGUID: 2a8FuuZsQbS0eXk/IARubg==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="73706323"
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="73706323"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 16:29:57 -0700
X-CSE-ConnectionGUID: AZF9dSeDRCSBJNkuRSdxKg==
X-CSE-MsgGUID: LMpEE2UBSmG2rcLQ/Z5wXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="264512845"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 31 Jul 2026 16:29:56 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpwfp-000000002O7-2YVx;
	Fri, 31 Jul 2026 23:29:53 +0000
Date: Sat, 01 Aug 2026 07:29:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 9898/11507] fs/ntfs3/inode.c:570
 ntfs_init_ads_node() error: we previously assumed 'attr' could be null (see
 line 555)
Message-ID: <202608010712.cavVorSd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   415606a7be939835db9b0d6b711887586646346d
commit: be310476e8868ebe7a2ce8fb0e7b229535723963 [9898/11507] fs/ntfs3: Add basic support for alternative data streams
:::::: branch date: 7 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20260801/202608010712.cavVorSd-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608010712.cavVorSd-lkp@intel.com/

smatch warnings:
fs/ntfs3/inode.c:570 ntfs_init_ads_node() error: we previously assumed 'attr' could be null (see line 555)

vim +/attr +570 fs/ntfs3/inode.c

be310476e8868e Konstantin Komarov 2026-07-30  515  
be310476e8868e Konstantin Komarov 2026-07-30  516  /*
be310476e8868e Konstantin Komarov 2026-07-30  517   * ntfs_init_ads_node
be310476e8868e Konstantin Komarov 2026-07-30  518   *
be310476e8868e Konstantin Komarov 2026-07-30  519   * This function scans base inode for given ADS.
be310476e8868e Konstantin Komarov 2026-07-30  520   * And init inode associated with this ADS
be310476e8868e Konstantin Komarov 2026-07-30  521   */
be310476e8868e Konstantin Komarov 2026-07-30  522  static int ntfs_init_ads_node(struct inode *inode, const __le16 *ads_name,
be310476e8868e Konstantin Komarov 2026-07-30  523  			      u8 ads_len, u32 flags)
be310476e8868e Konstantin Komarov 2026-07-30  524  {
be310476e8868e Konstantin Komarov 2026-07-30  525  	int err = -EINVAL;
be310476e8868e Konstantin Komarov 2026-07-30  526  	struct ntfs_inode *ni = ntfs_i(inode);
be310476e8868e Konstantin Komarov 2026-07-30  527  	struct ntfs_inode *nb = ni->base;
be310476e8868e Konstantin Komarov 2026-07-30  528  	struct ntfs_sb_info *sbi = nb->mi.sbi;
be310476e8868e Konstantin Komarov 2026-07-30  529  	struct ATTR_LIST_ENTRY *le = NULL;
be310476e8868e Konstantin Komarov 2026-07-30  530  	struct ATTRIB *attr = NULL;
be310476e8868e Konstantin Komarov 2026-07-30  531  	u16 roff, asize;
be310476e8868e Konstantin Komarov 2026-07-30  532  	u64 svcn;
be310476e8868e Konstantin Komarov 2026-07-30  533  
be310476e8868e Konstantin Komarov 2026-07-30  534  	if (nb->ni_flags & NI_FLAG_DIR)
be310476e8868e Konstantin Komarov 2026-07-30  535  		return -EINVAL; /* no ADS for directories. */
be310476e8868e Konstantin Komarov 2026-07-30  536  
be310476e8868e Konstantin Komarov 2026-07-30  537  	ni->mi.sbi = sbi;
be310476e8868e Konstantin Komarov 2026-07-30  538  	ni->mi.rno = inode->i_ino;
be310476e8868e Konstantin Komarov 2026-07-30  539  
be310476e8868e Konstantin Komarov 2026-07-30  540  	if (ads_len == ARRAY_SIZE(QUERY_STREAMS) &&
be310476e8868e Konstantin Komarov 2026-07-30  541  	    !memcmp(ads_name, QUERY_STREAMS, sizeof(QUERY_STREAMS))) {
be310476e8868e Konstantin Komarov 2026-07-30  542  		goto ok; /* use goto to reduce tab pressure. */
be310476e8868e Konstantin Komarov 2026-07-30  543  	}
be310476e8868e Konstantin Komarov 2026-07-30  544  
be310476e8868e Konstantin Komarov 2026-07-30  545  	/* Enumerate all attributes in record. */
be310476e8868e Konstantin Komarov 2026-07-30  546  	while ((attr = ni_enum_attr_ex(nb, attr, &le, NULL))) {
be310476e8868e Konstantin Komarov 2026-07-30  547  		if (attr->type == ATTR_DATA && attr->name_len &&
be310476e8868e Konstantin Komarov 2026-07-30  548  		    ads_len == attr->name_len &&
be310476e8868e Konstantin Komarov 2026-07-30  549  		    !memcmp(ads_name, attr_name(attr), ads_len * sizeof(u16))) {
be310476e8868e Konstantin Komarov 2026-07-30  550  			/* We have found the ADS to open. */
be310476e8868e Konstantin Komarov 2026-07-30  551  			break;
be310476e8868e Konstantin Komarov 2026-07-30  552  		}
be310476e8868e Konstantin Komarov 2026-07-30  553  	}
be310476e8868e Konstantin Komarov 2026-07-30  554  
be310476e8868e Konstantin Komarov 2026-07-30 @555  	if (!attr) {
be310476e8868e Konstantin Komarov 2026-07-30  556  		if (!(flags & LOOKUP_CREATE)) {
be310476e8868e Konstantin Komarov 2026-07-30  557  			/* Do not create ADS. */
be310476e8868e Konstantin Komarov 2026-07-30  558  			return -ENOENT;
be310476e8868e Konstantin Komarov 2026-07-30  559  		}
be310476e8868e Konstantin Komarov 2026-07-30  560  
be310476e8868e Konstantin Komarov 2026-07-30  561  		/* Create new ADS. */
be310476e8868e Konstantin Komarov 2026-07-30  562  		err = ni_insert_resident(nb, 0, ATTR_DATA, ads_name, ads_len,
be310476e8868e Konstantin Komarov 2026-07-30  563  					 &attr, NULL, NULL);
be310476e8868e Konstantin Komarov 2026-07-30  564  		if (err) {
be310476e8868e Konstantin Komarov 2026-07-30  565  			/* Looks like the only reasons: ENOSPC/ENOMEM .*/
be310476e8868e Konstantin Komarov 2026-07-30  566  			return err;
be310476e8868e Konstantin Komarov 2026-07-30  567  		}
be310476e8868e Konstantin Komarov 2026-07-30  568  	}
be310476e8868e Konstantin Komarov 2026-07-30  569  
be310476e8868e Konstantin Komarov 2026-07-30 @570  	if (is_attr_sparsed(attr))
be310476e8868e Konstantin Komarov 2026-07-30  571  		ni->std_fa |= FILE_ATTRIBUTE_SPARSE_FILE;
be310476e8868e Konstantin Komarov 2026-07-30  572  	else
be310476e8868e Konstantin Komarov 2026-07-30  573  		ni->std_fa &= ~FILE_ATTRIBUTE_SPARSE_FILE;
be310476e8868e Konstantin Komarov 2026-07-30  574  
be310476e8868e Konstantin Komarov 2026-07-30  575  	if (is_attr_compressed(attr))
be310476e8868e Konstantin Komarov 2026-07-30  576  		ni->std_fa |= FILE_ATTRIBUTE_COMPRESSED;
be310476e8868e Konstantin Komarov 2026-07-30  577  	else
be310476e8868e Konstantin Komarov 2026-07-30  578  		ni->std_fa &= ~FILE_ATTRIBUTE_COMPRESSED;
be310476e8868e Konstantin Komarov 2026-07-30  579  
be310476e8868e Konstantin Komarov 2026-07-30  580  	if (is_attr_encrypted(attr))
be310476e8868e Konstantin Komarov 2026-07-30  581  		ni->std_fa |= FILE_ATTRIBUTE_ENCRYPTED;
be310476e8868e Konstantin Komarov 2026-07-30  582  	else
be310476e8868e Konstantin Komarov 2026-07-30  583  		ni->std_fa &= ~FILE_ATTRIBUTE_ENCRYPTED;
be310476e8868e Konstantin Komarov 2026-07-30  584  
be310476e8868e Konstantin Komarov 2026-07-30  585  	if (!attr->non_res) {
be310476e8868e Konstantin Komarov 2026-07-30  586  		ni->ni_flags |= NI_FLAG_RESIDENT;
be310476e8868e Konstantin Komarov 2026-07-30  587  		ni->i_valid = inode->i_size = le32_to_cpu(attr->res.data_size);
be310476e8868e Konstantin Komarov 2026-07-30  588  		inode_set_bytes(inode, inode->i_size);
be310476e8868e Konstantin Komarov 2026-07-30  589  		goto ok;
be310476e8868e Konstantin Komarov 2026-07-30  590  	}
be310476e8868e Konstantin Komarov 2026-07-30  591  
be310476e8868e Konstantin Komarov 2026-07-30  592  	inode_set_bytes(inode, attr_ondisk_size(attr));
be310476e8868e Konstantin Komarov 2026-07-30  593  	ni->i_valid = le64_to_cpu(attr->nres.valid_size);
be310476e8868e Konstantin Komarov 2026-07-30  594  	inode->i_size = le64_to_cpu(attr->nres.data_size);
be310476e8868e Konstantin Komarov 2026-07-30  595  
be310476e8868e Konstantin Komarov 2026-07-30  596  	if (!attr->nres.alloc_size)
be310476e8868e Konstantin Komarov 2026-07-30  597  		goto ok;
be310476e8868e Konstantin Komarov 2026-07-30  598  
be310476e8868e Konstantin Komarov 2026-07-30  599  	roff = le16_to_cpu(attr->nres.run_off);
be310476e8868e Konstantin Komarov 2026-07-30  600  	asize = le32_to_cpu(attr->size);
be310476e8868e Konstantin Komarov 2026-07-30  601  
be310476e8868e Konstantin Komarov 2026-07-30  602  	if (roff > asize) {
be310476e8868e Konstantin Komarov 2026-07-30  603  		/* This case should be checked in mi_enum_attr */
be310476e8868e Konstantin Komarov 2026-07-30  604  		return -EINVAL;
be310476e8868e Konstantin Komarov 2026-07-30  605  	}
be310476e8868e Konstantin Komarov 2026-07-30  606  
be310476e8868e Konstantin Komarov 2026-07-30  607  	svcn = le64_to_cpu(attr->nres.svcn);
be310476e8868e Konstantin Komarov 2026-07-30  608  	err = run_unpack_ex(&ni->file.run, sbi, ni->mi.rno, svcn,
be310476e8868e Konstantin Komarov 2026-07-30  609  			    le64_to_cpu(attr->nres.evcn), svcn,
be310476e8868e Konstantin Komarov 2026-07-30  610  			    Add2Ptr(attr, roff), asize - roff);
be310476e8868e Konstantin Komarov 2026-07-30  611  	if (err < 0) {
be310476e8868e Konstantin Komarov 2026-07-30  612  		/* run_unpack_ex marks volume dirty, if logical error. */
be310476e8868e Konstantin Komarov 2026-07-30  613  		return err;
be310476e8868e Konstantin Komarov 2026-07-30  614  	}
be310476e8868e Konstantin Komarov 2026-07-30  615  
be310476e8868e Konstantin Komarov 2026-07-30  616  ok:
be310476e8868e Konstantin Komarov 2026-07-30  617  	/* Keep ADS name (little endian). */
be310476e8868e Konstantin Komarov 2026-07-30  618  	ni->file.ads.name = kmemdup(ads_name, ads_len * sizeof(u16), GFP_NOFS);
be310476e8868e Konstantin Komarov 2026-07-30  619  	if (!ni->file.ads.name)
be310476e8868e Konstantin Komarov 2026-07-30  620  		return -ENOMEM;
be310476e8868e Konstantin Komarov 2026-07-30  621  	ni->file.ads.len = ads_len;
be310476e8868e Konstantin Komarov 2026-07-30  622  
be310476e8868e Konstantin Komarov 2026-07-30  623  	set_nlink(inode, 1);
be310476e8868e Konstantin Komarov 2026-07-30  624  
be310476e8868e Konstantin Komarov 2026-07-30  625  	init_rwsem(&ni->file.run_lock);
be310476e8868e Konstantin Komarov 2026-07-30  626  	/* Most fields are the same as the base's? */
be310476e8868e Konstantin Komarov 2026-07-30  627  	inode->i_op = nb->vfs_inode.i_op;
be310476e8868e Konstantin Komarov 2026-07-30  628  	inode->i_fop = nb->vfs_inode.i_fop;
be310476e8868e Konstantin Komarov 2026-07-30  629  	inode->i_mapping->a_ops = nb->vfs_inode.i_mapping->a_ops;
be310476e8868e Konstantin Komarov 2026-07-30  630  	inode->i_flags = nb->vfs_inode.i_flags;
be310476e8868e Konstantin Komarov 2026-07-30  631  	inode->i_mode = nb->vfs_inode.i_mode;
be310476e8868e Konstantin Komarov 2026-07-30  632  	inode->i_uid = nb->vfs_inode.i_uid;
be310476e8868e Konstantin Komarov 2026-07-30  633  	inode->i_gid = nb->vfs_inode.i_gid;
be310476e8868e Konstantin Komarov 2026-07-30  634  	inode->i_generation = nb->vfs_inode.i_generation;
be310476e8868e Konstantin Komarov 2026-07-30  635  
be310476e8868e Konstantin Komarov 2026-07-30  636  	return 0;
82cae269cfa953 Konstantin Komarov 2021-08-13  637  }
82cae269cfa953 Konstantin Komarov 2021-08-13  638  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
