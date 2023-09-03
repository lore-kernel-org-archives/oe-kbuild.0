Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1BA179
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Sep 2023 00:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693699899; x=1725235899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wGzR77ahZqM22nO7rwqlcHnJXsCiTnvKPObwi2MJrPg=;
  b=k7kdLslQoNXN6+Lg0BIKEIk+3DU9E2s0YAZdEWGVpRKE8bcHbJfCuDka
   oJik8X3Xe65SOPilWd2AaEPEPQxBkzPGd45srEbCEGRm0VlDsPK559WhZ
   Bd/mRFihTfd6f51eZppyOYZtR80yI0/YB59Um5628524C/w7fAezuXksW
   92l29didX+CBkUIqFSRqdfqotx06CRSLirSGqqbHgOOmJAcbRMJFH+CO8
   LxVCHBIyBH31kAN5TS0B8E14NMb2HhzNBJ6iQM/qOSTIht1xYZWlRyE70
   dp7dczSf5uQdifZMlWJis09XT76w2ytcSffSGCxgFJDSxSa837oomew30
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="366636199"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="366636199"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 17:11:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="1071160190"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="1071160190"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 02 Sep 2023 17:11:35 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcaiD-0002iZ-22;
	Sun, 03 Sep 2023 00:11:33 +0000
Date: Sun, 3 Sep 2023 08:11:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 12036/12910] fs/ext4/super.c:796
 update_super_work() error: uninitialized symbol 'call_notify_err'.
Message-ID: <202309030813.vgQkkgxM-lkp@intel.com>
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
TO: "Theodore Ts'o" <tytso@mit.edu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a47fc304d2b678db1a5d760a7d644dac9b067752
commit: 22fe4b80ee8de5a551a27a2c91f54594b99c1db5 [12036/12910] ext4: rename s_error_work to s_sb_upd_work
:::::: branch date: 3 days ago
:::::: commit date: 11 days ago
config: x86_64-randconfig-161-20230902 (https://download.01.org/0day-ci/archive/20230903/202309030813.vgQkkgxM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230903/202309030813.vgQkkgxM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309030813.vgQkkgxM-lkp@intel.com/

smatch warnings:
fs/ext4/super.c:796 update_super_work() error: uninitialized symbol 'call_notify_err'.

vim +/call_notify_err +796 fs/ext4/super.c

ac27a0ec112a08 Dave Kleikamp     2006-10-11  752  
22fe4b80ee8de5 Theodore Ts'o     2023-08-22  753  static void update_super_work(struct work_struct *work)
c92dc856848f32 Jan Kara          2020-11-27  754  {
c92dc856848f32 Jan Kara          2020-11-27  755  	struct ext4_sb_info *sbi = container_of(work, struct ext4_sb_info,
22fe4b80ee8de5 Theodore Ts'o     2023-08-22  756  						s_sb_upd_work);
2d01ddc8660656 Jan Kara          2020-12-16  757  	journal_t *journal = sbi->s_journal;
2d01ddc8660656 Jan Kara          2020-12-16  758  	handle_t *handle;
c92dc856848f32 Jan Kara          2020-11-27  759  
2d01ddc8660656 Jan Kara          2020-12-16  760  	/*
2d01ddc8660656 Jan Kara          2020-12-16  761  	 * If the journal is still running, we have to write out superblock
2d01ddc8660656 Jan Kara          2020-12-16  762  	 * through the journal to avoid collisions of other journalled sb
2d01ddc8660656 Jan Kara          2020-12-16  763  	 * updates.
2d01ddc8660656 Jan Kara          2020-12-16  764  	 *
2d01ddc8660656 Jan Kara          2020-12-16  765  	 * We use directly jbd2 functions here to avoid recursing back into
2d01ddc8660656 Jan Kara          2020-12-16  766  	 * ext4 error handling code during handling of previous errors.
2d01ddc8660656 Jan Kara          2020-12-16  767  	 */
2d01ddc8660656 Jan Kara          2020-12-16  768  	if (!sb_rdonly(sbi->s_sb) && journal) {
558d6450c7755a Ye Bin            2021-06-15  769  		struct buffer_head *sbh = sbi->s_sbh;
58d85f2e88c97c Vitaliy Kuznetsov 2023-08-10  770  		bool call_notify_err;
2d01ddc8660656 Jan Kara          2020-12-16  771  		handle = jbd2_journal_start(journal, 1);
2d01ddc8660656 Jan Kara          2020-12-16  772  		if (IS_ERR(handle))
2d01ddc8660656 Jan Kara          2020-12-16  773  			goto write_directly;
558d6450c7755a Ye Bin            2021-06-15  774  		if (jbd2_journal_get_write_access(handle, sbh)) {
2d01ddc8660656 Jan Kara          2020-12-16  775  			jbd2_journal_stop(handle);
2d01ddc8660656 Jan Kara          2020-12-16  776  			goto write_directly;
2d01ddc8660656 Jan Kara          2020-12-16  777  		}
58d85f2e88c97c Vitaliy Kuznetsov 2023-08-10  778  
58d85f2e88c97c Vitaliy Kuznetsov 2023-08-10  779  		if (sbi->s_add_error_count > 0)
58d85f2e88c97c Vitaliy Kuznetsov 2023-08-10  780  			call_notify_err = true;
58d85f2e88c97c Vitaliy Kuznetsov 2023-08-10  781  
2d01ddc8660656 Jan Kara          2020-12-16  782  		ext4_update_super(sbi->s_sb);
558d6450c7755a Ye Bin            2021-06-15  783  		if (buffer_write_io_error(sbh) || !buffer_uptodate(sbh)) {
558d6450c7755a Ye Bin            2021-06-15  784  			ext4_msg(sbi->s_sb, KERN_ERR, "previous I/O error to "
558d6450c7755a Ye Bin            2021-06-15  785  				 "superblock detected");
558d6450c7755a Ye Bin            2021-06-15  786  			clear_buffer_write_io_error(sbh);
558d6450c7755a Ye Bin            2021-06-15  787  			set_buffer_uptodate(sbh);
558d6450c7755a Ye Bin            2021-06-15  788  		}
558d6450c7755a Ye Bin            2021-06-15  789  
558d6450c7755a Ye Bin            2021-06-15  790  		if (jbd2_journal_dirty_metadata(handle, sbh)) {
2d01ddc8660656 Jan Kara          2020-12-16  791  			jbd2_journal_stop(handle);
2d01ddc8660656 Jan Kara          2020-12-16  792  			goto write_directly;
2d01ddc8660656 Jan Kara          2020-12-16  793  		}
2d01ddc8660656 Jan Kara          2020-12-16  794  		jbd2_journal_stop(handle);
58d85f2e88c97c Vitaliy Kuznetsov 2023-08-10  795  
58d85f2e88c97c Vitaliy Kuznetsov 2023-08-10 @796  		if (call_notify_err)
d578b99443fde0 Jonathan Davies   2021-06-11  797  			ext4_notify_error_sysfs(sbi);
58d85f2e88c97c Vitaliy Kuznetsov 2023-08-10  798  
2d01ddc8660656 Jan Kara          2020-12-16  799  		return;
2d01ddc8660656 Jan Kara          2020-12-16  800  	}
2d01ddc8660656 Jan Kara          2020-12-16  801  write_directly:
2d01ddc8660656 Jan Kara          2020-12-16  802  	/*
2d01ddc8660656 Jan Kara          2020-12-16  803  	 * Write through journal failed. Write sb directly to get error info
2d01ddc8660656 Jan Kara          2020-12-16  804  	 * out and hope for the best.
2d01ddc8660656 Jan Kara          2020-12-16  805  	 */
4392fbc4bab57d Jan Kara          2020-12-16  806  	ext4_commit_super(sbi->s_sb);
d578b99443fde0 Jonathan Davies   2021-06-11  807  	ext4_notify_error_sysfs(sbi);
4327ba52afd03f Daeho Jeong       2015-10-18  808  }
ac27a0ec112a08 Dave Kleikamp     2006-10-11  809  

:::::: The code at line 796 was first introduced by commit
:::::: 58d85f2e88c97c69c869cae6c6bdd1af32936146 ext4: add periodic superblock update check

:::::: TO: Vitaliy Kuznetsov <vk.en.mail@gmail.com>
:::::: CC: Theodore Ts'o <tytso@mit.edu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
