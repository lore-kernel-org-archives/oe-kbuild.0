Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52852F5F
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Apr 2023 17:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682877226; x=1714413226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0CsvVtQc/oiKbLENnMu/og8IoutdwURf3fiije+S8kk=;
  b=nSeKlyrwohX4YXc+e6t1S8+ivYwh+V5VrNTDe4/b3nHTZQS0Wf62THHA
   G1yQRQ6iWzA7rU3DX0ivcUz910CN1Tkx37Vzu9pwbNoDgQqaguK6CRWIe
   eSS/drZtTidRF9dXLeZoJPT0dwBXOet8oMJAaE1V3ZCXYP7hMk9vfDHur
   gnTzRMbk6bdW/vAPKE9cPx31P2i222llpEDzXVdxiXj9OsYmx1V8qMlqV
   0cn7665v54koeSzdxIWc9WQx5FMK+R5wIpAbotzYtMYCxwjk4IYEYAw5y
   6BfRsMkJKyy1+d6c279rM49SU8ibyNKvFTgd7VQXIS7rlsuHqVDs2emCE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="350990538"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="350990538"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 10:53:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="807183157"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="807183157"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 30 Apr 2023 10:53:42 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptBEz-00004l-1z;
	Sun, 30 Apr 2023 17:53:41 +0000
Date: Mon, 1 May 2023 01:53:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [tytso-ext4:test 112/113] fs/ext4/mballoc.c:2598:6-9: duplicated
 argument to && or ||
Message-ID: <202305010128.IfRIXw8H-lkp@intel.com>
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
CC: linux-ext4@vger.kernel.org
TO: "Theodore Ts'o" <tytso@mit.edu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git test
head:   493cc71f24795ab9afc311649f5d2c23f652fb1e
commit: b9d6ed27a28439d79a90058587b2e3eeb2fcab73 [112/113] ext4: DO NOT MERGE: allow ext4_get_group_info() to fail
:::::: branch date: 22 hours ago
:::::: commit date: 25 hours ago
config: i386-randconfig-c021 (https://download.01.org/0day-ci/archive/20230501/202305010128.IfRIXw8H-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202305010128.IfRIXw8H-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/ext4/mballoc.c:2598:6-9: duplicated argument to && or ||

vim +2598 fs/ext4/mballoc.c

cfd73237722135 Alex Zhuravlev 2020-04-21  2572  
cfd73237722135 Alex Zhuravlev 2020-04-21  2573  /*
cfd73237722135 Alex Zhuravlev 2020-04-21  2574   * Prefetching reads the block bitmap into the buffer cache; but we
cfd73237722135 Alex Zhuravlev 2020-04-21  2575   * need to make sure that the buddy bitmap in the page cache has been
cfd73237722135 Alex Zhuravlev 2020-04-21  2576   * initialized.  Note that ext4_mb_init_group() will block if the I/O
cfd73237722135 Alex Zhuravlev 2020-04-21  2577   * is not yet completed, or indeed if it was not initiated by
cfd73237722135 Alex Zhuravlev 2020-04-21  2578   * ext4_mb_prefetch did not start the I/O.
cfd73237722135 Alex Zhuravlev 2020-04-21  2579   *
cfd73237722135 Alex Zhuravlev 2020-04-21  2580   * TODO: We should actually kick off the buddy bitmap setup in a work
cfd73237722135 Alex Zhuravlev 2020-04-21  2581   * queue when the buffer I/O is completed, so that we don't block
cfd73237722135 Alex Zhuravlev 2020-04-21  2582   * waiting for the block allocation bitmap read to finish when
cfd73237722135 Alex Zhuravlev 2020-04-21  2583   * ext4_mb_prefetch_fini is called from ext4_mb_regular_allocator().
cfd73237722135 Alex Zhuravlev 2020-04-21  2584   */
3d392b2676bf31 Theodore Ts'o  2020-07-17  2585  void ext4_mb_prefetch_fini(struct super_block *sb, ext4_group_t group,
cfd73237722135 Alex Zhuravlev 2020-04-21  2586  			   unsigned int nr)
cfd73237722135 Alex Zhuravlev 2020-04-21  2587  {
22fab984025313 Kemeng Shi     2023-03-04  2588  	struct ext4_group_desc *gdp;
22fab984025313 Kemeng Shi     2023-03-04  2589  	struct ext4_group_info *grp;
cfd73237722135 Alex Zhuravlev 2020-04-21  2590  
22fab984025313 Kemeng Shi     2023-03-04  2591  	while (nr-- > 0) {
cfd73237722135 Alex Zhuravlev 2020-04-21  2592  		if (!group)
cfd73237722135 Alex Zhuravlev 2020-04-21  2593  			group = ext4_get_groups_count(sb);
cfd73237722135 Alex Zhuravlev 2020-04-21  2594  		group--;
22fab984025313 Kemeng Shi     2023-03-04  2595  		gdp = ext4_get_group_desc(sb, group, NULL);
cfd73237722135 Alex Zhuravlev 2020-04-21  2596  		grp = ext4_get_group_info(sb, group);
cfd73237722135 Alex Zhuravlev 2020-04-21  2597  
b9d6ed27a28439 Theodore Ts'o  2023-04-29 @2598  		if (grp && grp && EXT4_MB_GRP_NEED_INIT(grp) &&
cfd73237722135 Alex Zhuravlev 2020-04-21  2599  		    ext4_free_group_clusters(sb, gdp) > 0 &&
cfd73237722135 Alex Zhuravlev 2020-04-21  2600  		    !(ext4_has_group_desc_csum(sb) &&
cfd73237722135 Alex Zhuravlev 2020-04-21  2601  		      (gdp->bg_flags & cpu_to_le16(EXT4_BG_BLOCK_UNINIT)))) {
cfd73237722135 Alex Zhuravlev 2020-04-21  2602  			if (ext4_mb_init_group(sb, group, GFP_NOFS))
cfd73237722135 Alex Zhuravlev 2020-04-21  2603  				break;
cfd73237722135 Alex Zhuravlev 2020-04-21  2604  		}
cfd73237722135 Alex Zhuravlev 2020-04-21  2605  	}
cfd73237722135 Alex Zhuravlev 2020-04-21  2606  }
cfd73237722135 Alex Zhuravlev 2020-04-21  2607  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
