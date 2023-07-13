Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBA81E536
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Jul 2023 21:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689283632; x=1720819632;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t70Bvovi9cesAHf3iq4fV0DkAFoZuCaAOJo2FuRS/go=;
  b=OuE3+1B/Ytgmq4YwjP5BU5HorBdx8ee+kVdBQS5UYal9T2TIaDj8tXcu
   WBTqHftIXl7/d9vWQpkjS9MEozozNJhLLYVZSYyW9RyKzPjPM9yeSZsY8
   GeH/D8oG8PVqmHIwc5m3PTQmM9qaBQaQvgQ2nEbXix76GWMNfz2tbYd2h
   kPYI7dsRaAw1MqBUPZdsD9TySMnYtAyOsPKfXsiAVdmukXXAO7xlsu7ew
   SB//PX3ttpeXCz/89RZZibMQNPO1h+iMC3EPqNlksPZ1I9BVqtrceFF+a
   ygLIYXjaozYif9OI861+QEdLleHJ2QPSzLOHLruvJ/zz/o85dI9roPuXi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="451681649"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="451681649"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 14:27:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="722146912"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="722146912"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 13 Jul 2023 14:27:09 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qK3q9-0006ub-0F;
	Thu, 13 Jul 2023 21:27:09 +0000
Date: Fri, 14 Jul 2023 05:26:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/ntfs3/xattr.c:120 ntfs_read_ea() warn: missing unwind goto?
Message-ID: <202307140548.oJyBUCnj-lkp@intel.com>
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
TO: Edward Lo <loyuantsung@gmail.com>
CC: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eb26cbb1a754ccde5d4d74527dad5ba051808fad
commit: c9db0ff04649aa0b45f497183c957fe260f229f6 fs/ntfs3: Return error for inconsistent extended attributes
date:   11 days ago
:::::: branch date: 26 hours ago
:::::: commit date: 11 days ago
config: x86_64-randconfig-m001-20230713 (https://download.01.org/0day-ci/archive/20230714/202307140548.oJyBUCnj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307140548.oJyBUCnj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307140548.oJyBUCnj-lkp@intel.com/

smatch warnings:
fs/ntfs3/xattr.c:120 ntfs_read_ea() warn: missing unwind goto?

vim +120 fs/ntfs3/xattr.c

be71b5cba2e648 Konstantin Komarov 2021-08-13   67  
be71b5cba2e648 Konstantin Komarov 2021-08-13   68  /*
e8b8e97f91b80f Kari Argillander   2021-08-03   69   * ntfs_read_ea - Read all extended attributes.
e8b8e97f91b80f Kari Argillander   2021-08-03   70   * @ea:		New allocated memory.
e8b8e97f91b80f Kari Argillander   2021-08-03   71   * @info:	Pointer into resident data.
be71b5cba2e648 Konstantin Komarov 2021-08-13   72   */
be71b5cba2e648 Konstantin Komarov 2021-08-13   73  static int ntfs_read_ea(struct ntfs_inode *ni, struct EA_FULL **ea,
be71b5cba2e648 Konstantin Komarov 2021-08-13   74  			size_t add_bytes, const struct EA_INFO **info)
be71b5cba2e648 Konstantin Komarov 2021-08-13   75  {
0e8235d28f3a0e Konstantin Komarov 2022-10-10   76  	int err = -EINVAL;
cff32466bf851b Konstantin Komarov 2021-09-24   77  	struct ntfs_sb_info *sbi = ni->mi.sbi;
be71b5cba2e648 Konstantin Komarov 2021-08-13   78  	struct ATTR_LIST_ENTRY *le = NULL;
be71b5cba2e648 Konstantin Komarov 2021-08-13   79  	struct ATTRIB *attr_info, *attr_ea;
be71b5cba2e648 Konstantin Komarov 2021-08-13   80  	void *ea_p;
0e8235d28f3a0e Konstantin Komarov 2022-10-10   81  	u32 size, off, ea_size;
be71b5cba2e648 Konstantin Komarov 2021-08-13   82  
be71b5cba2e648 Konstantin Komarov 2021-08-13   83  	static_assert(le32_to_cpu(ATTR_EA_INFO) < le32_to_cpu(ATTR_EA));
be71b5cba2e648 Konstantin Komarov 2021-08-13   84  
be71b5cba2e648 Konstantin Komarov 2021-08-13   85  	*ea = NULL;
be71b5cba2e648 Konstantin Komarov 2021-08-13   86  	*info = NULL;
be71b5cba2e648 Konstantin Komarov 2021-08-13   87  
be71b5cba2e648 Konstantin Komarov 2021-08-13   88  	attr_info =
be71b5cba2e648 Konstantin Komarov 2021-08-13   89  		ni_find_attr(ni, NULL, &le, ATTR_EA_INFO, NULL, 0, NULL, NULL);
be71b5cba2e648 Konstantin Komarov 2021-08-13   90  	attr_ea =
be71b5cba2e648 Konstantin Komarov 2021-08-13   91  		ni_find_attr(ni, attr_info, &le, ATTR_EA, NULL, 0, NULL, NULL);
be71b5cba2e648 Konstantin Komarov 2021-08-13   92  
be71b5cba2e648 Konstantin Komarov 2021-08-13   93  	if (!attr_ea || !attr_info)
be71b5cba2e648 Konstantin Komarov 2021-08-13   94  		return 0;
be71b5cba2e648 Konstantin Komarov 2021-08-13   95  
be71b5cba2e648 Konstantin Komarov 2021-08-13   96  	*info = resident_data_ex(attr_info, sizeof(struct EA_INFO));
be71b5cba2e648 Konstantin Komarov 2021-08-13   97  	if (!*info)
0e8235d28f3a0e Konstantin Komarov 2022-10-10   98  		goto out;
be71b5cba2e648 Konstantin Komarov 2021-08-13   99  
e8b8e97f91b80f Kari Argillander   2021-08-03  100  	/* Check Ea limit. */
be71b5cba2e648 Konstantin Komarov 2021-08-13  101  	size = le32_to_cpu((*info)->size);
0e8235d28f3a0e Konstantin Komarov 2022-10-10  102  	if (size > sbi->ea_max_size) {
0e8235d28f3a0e Konstantin Komarov 2022-10-10  103  		err = -EFBIG;
0e8235d28f3a0e Konstantin Komarov 2022-10-10  104  		goto out;
0e8235d28f3a0e Konstantin Komarov 2022-10-10  105  	}
be71b5cba2e648 Konstantin Komarov 2021-08-13  106  
0e8235d28f3a0e Konstantin Komarov 2022-10-10  107  	if (attr_size(attr_ea) > sbi->ea_max_size) {
0e8235d28f3a0e Konstantin Komarov 2022-10-10  108  		err = -EFBIG;
0e8235d28f3a0e Konstantin Komarov 2022-10-10  109  		goto out;
0e8235d28f3a0e Konstantin Komarov 2022-10-10  110  	}
be71b5cba2e648 Konstantin Komarov 2021-08-13  111  
0e8235d28f3a0e Konstantin Komarov 2022-10-10  112  	if (!size) {
0e8235d28f3a0e Konstantin Komarov 2022-10-10  113  		/* EA info persists, but xattr is empty. Looks like EA problem. */
0e8235d28f3a0e Konstantin Komarov 2022-10-10  114  		goto out;
0e8235d28f3a0e Konstantin Komarov 2022-10-10  115  	}
be71b5cba2e648 Konstantin Komarov 2021-08-13  116  
e8b8e97f91b80f Kari Argillander   2021-08-03  117  	/* Allocate memory for packed Ea. */
e001e608693906 Dan Carpenter      2022-09-12  118  	ea_p = kmalloc(size_add(size, add_bytes), GFP_NOFS);
be71b5cba2e648 Konstantin Komarov 2021-08-13  119  	if (!ea_p)
be71b5cba2e648 Konstantin Komarov 2021-08-13 @120  		return -ENOMEM;
be71b5cba2e648 Konstantin Komarov 2021-08-13  121  
0e8235d28f3a0e Konstantin Komarov 2022-10-10  122  	if (attr_ea->non_res) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  123  		struct runs_tree run;
be71b5cba2e648 Konstantin Komarov 2021-08-13  124  
be71b5cba2e648 Konstantin Komarov 2021-08-13  125  		run_init(&run);
be71b5cba2e648 Konstantin Komarov 2021-08-13  126  
42f86b1226a42b Konstantin Komarov 2022-05-13  127  		err = attr_load_runs_range(ni, ATTR_EA, NULL, 0, &run, 0, size);
be71b5cba2e648 Konstantin Komarov 2021-08-13  128  		if (!err)
cff32466bf851b Konstantin Komarov 2021-09-24  129  			err = ntfs_read_run_nb(sbi, &run, 0, ea_p, size, NULL);
be71b5cba2e648 Konstantin Komarov 2021-08-13  130  		run_close(&run);
be71b5cba2e648 Konstantin Komarov 2021-08-13  131  
be71b5cba2e648 Konstantin Komarov 2021-08-13  132  		if (err)
0e8235d28f3a0e Konstantin Komarov 2022-10-10  133  			goto out1;
be71b5cba2e648 Konstantin Komarov 2021-08-13  134  	} else {
be71b5cba2e648 Konstantin Komarov 2021-08-13  135  		void *p = resident_data_ex(attr_ea, size);
be71b5cba2e648 Konstantin Komarov 2021-08-13  136  
0e8235d28f3a0e Konstantin Komarov 2022-10-10  137  		if (!p)
0e8235d28f3a0e Konstantin Komarov 2022-10-10  138  			goto out1;
be71b5cba2e648 Konstantin Komarov 2021-08-13  139  		memcpy(ea_p, p, size);
be71b5cba2e648 Konstantin Komarov 2021-08-13  140  	}
be71b5cba2e648 Konstantin Komarov 2021-08-13  141  
be71b5cba2e648 Konstantin Komarov 2021-08-13  142  	memset(Add2Ptr(ea_p, size), 0, add_bytes);
0e8235d28f3a0e Konstantin Komarov 2022-10-10  143  
c9db0ff04649aa Edward Lo          2023-03-17  144  	err = -EINVAL;
0e8235d28f3a0e Konstantin Komarov 2022-10-10  145  	/* Check all attributes for consistency. */
0e8235d28f3a0e Konstantin Komarov 2022-10-10  146  	for (off = 0; off < size; off += ea_size) {
0e8235d28f3a0e Konstantin Komarov 2022-10-10  147  		const struct EA_FULL *ef = Add2Ptr(ea_p, off);
0e8235d28f3a0e Konstantin Komarov 2022-10-10  148  		u32 bytes = size - off;
0e8235d28f3a0e Konstantin Komarov 2022-10-10  149  
0e8235d28f3a0e Konstantin Komarov 2022-10-10  150  		/* Check if we can use field ea->size. */
0e8235d28f3a0e Konstantin Komarov 2022-10-10  151  		if (bytes < sizeof(ef->size))
0e8235d28f3a0e Konstantin Komarov 2022-10-10  152  			goto out1;
0e8235d28f3a0e Konstantin Komarov 2022-10-10  153  
0e8235d28f3a0e Konstantin Komarov 2022-10-10  154  		if (ef->size) {
0e8235d28f3a0e Konstantin Komarov 2022-10-10  155  			ea_size = le32_to_cpu(ef->size);
0e8235d28f3a0e Konstantin Komarov 2022-10-10  156  			if (ea_size > bytes)
0e8235d28f3a0e Konstantin Komarov 2022-10-10  157  				goto out1;
0e8235d28f3a0e Konstantin Komarov 2022-10-10  158  			continue;
0e8235d28f3a0e Konstantin Komarov 2022-10-10  159  		}
0e8235d28f3a0e Konstantin Komarov 2022-10-10  160  
0e8235d28f3a0e Konstantin Komarov 2022-10-10  161  		/* Check if we can use fields ef->name_len and ef->elength. */
0e8235d28f3a0e Konstantin Komarov 2022-10-10  162  		if (bytes < offsetof(struct EA_FULL, name))
0e8235d28f3a0e Konstantin Komarov 2022-10-10  163  			goto out1;
0e8235d28f3a0e Konstantin Komarov 2022-10-10  164  
0e8235d28f3a0e Konstantin Komarov 2022-10-10  165  		ea_size = ALIGN(struct_size(ef, name,
0e8235d28f3a0e Konstantin Komarov 2022-10-10  166  					    1 + ef->name_len +
0e8235d28f3a0e Konstantin Komarov 2022-10-10  167  						    le16_to_cpu(ef->elength)),
0e8235d28f3a0e Konstantin Komarov 2022-10-10  168  				4);
0e8235d28f3a0e Konstantin Komarov 2022-10-10  169  		if (ea_size > bytes)
0e8235d28f3a0e Konstantin Komarov 2022-10-10  170  			goto out1;
0e8235d28f3a0e Konstantin Komarov 2022-10-10  171  	}
0e8235d28f3a0e Konstantin Komarov 2022-10-10  172  
be71b5cba2e648 Konstantin Komarov 2021-08-13  173  	*ea = ea_p;
be71b5cba2e648 Konstantin Komarov 2021-08-13  174  	return 0;
be71b5cba2e648 Konstantin Komarov 2021-08-13  175  
0e8235d28f3a0e Konstantin Komarov 2022-10-10  176  out1:
195c52bdd5d5ec Kari Argillander   2021-08-24  177  	kfree(ea_p);
0e8235d28f3a0e Konstantin Komarov 2022-10-10  178  out:
0e8235d28f3a0e Konstantin Komarov 2022-10-10  179  	ntfs_set_state(sbi, NTFS_DIRTY_DIRTY);
be71b5cba2e648 Konstantin Komarov 2021-08-13  180  	return err;
be71b5cba2e648 Konstantin Komarov 2021-08-13  181  }
be71b5cba2e648 Konstantin Komarov 2021-08-13  182  

:::::: The code at line 120 was first introduced by commit
:::::: be71b5cba2e6485e8959da7a9f9a44461a1bb074 fs/ntfs3: Add attrib operations

:::::: TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
:::::: CC: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
