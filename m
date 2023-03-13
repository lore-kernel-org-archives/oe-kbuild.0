Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628FA8F4E
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Mar 2023 23:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678751996; x=1710287996;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4pGL2xaDKouYJ5+aoTvvCrPERqAT+w2cOLa6y7GBRZU=;
  b=QY48xTHZgZYffVdjsvjrSofadriMlUzjZLB/atZstjP1p5zSwNM8i4tp
   2QAVpOTV+bv4xlk71TokGlAv8qVJAbCUwbnBi96gmsftw/guYvNDp3cpP
   RDRLBD+/VeFePxNLvSrubRQmm/wAbRNIRbTSJ2fah/6IhuuyrHld+xGaJ
   at4JvWzm4L08dZ3M2oEm/IWy031qkqj+8PpT2+X5ZbEt529/VlvZH+KET
   1TJ3u0Qp38JfmSA2bEv50uJgR/U4IAC6FfM5TIC4uC6I+INmt9t0BspiE
   tw8Z1yD91aaXRqhQ4MfUy7Lb7odgbMWO4RZ9ClqNmE/XPhrX00yDqwpgO
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="334766301"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; 
   d="scan'208";a="334766301"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 16:59:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="709078349"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; 
   d="scan'208";a="709078349"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 13 Mar 2023 16:59:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbs53-0006Ga-0x;
	Mon, 13 Mar 2023 23:59:53 +0000
Date: Tue, 14 Mar 2023 07:59:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/ntfs3/frecord.c:640 ni_repack() warn: 'run.runs' double freed
Message-ID: <202303140746.KkXIZc0c-lkp@intel.com>
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
TO: Marco Elver <elver@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Andrey Konovalov <andreyknvl@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fc89d7fb499b0162e081f434d45e8d1b47e82ece
commit: 4ec4190be4cf9cc3e0ccaf5f155a5f9066d18950 kasan, x86: don't rename memintrinsics in uninstrumented files
date:   11 days ago
:::::: branch date: 6 hours ago
:::::: commit date: 11 days ago
config: x86_64-randconfig-m001-20230313 (https://download.01.org/0day-ci/archive/20230314/202303140746.KkXIZc0c-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303140746.KkXIZc0c-lkp@intel.com/

New smatch warnings:
fs/ntfs3/frecord.c:640 ni_repack() warn: 'run.runs' double freed
fs/ntfs3/fslog.c:3863 log_replay() error: dereferencing freed memory 'rst_info.r_page'
fs/ntfs3/fslog.c:5185 log_replay() error: double free of 'rst_info.r_page'

Old smatch warnings:
fs/ntfs3/frecord.c:482 ni_ins_new_attr() error: we previously assumed 'le' could be null (see line 467)
fs/ntfs3/frecord.c:1489 ni_insert_nonresident() warn: potential memory corrupting cast 8 vs 2 bytes
fs/ntfs3/frecord.c:1648 ni_fname_name() warn: inconsistent indenting
fs/ntfs3/frecord.c:2631 ni_read_frame() warn: ignoring unreachable code.
fs/ntfs3/fslog.c:2173 last_log_lsn() warn: possible memory leak of 'page_bufs'
fs/ntfs3/fslog.c:2385 find_log_rec() error: we previously assumed 'rh' could be null (see line 2372)
fs/ntfs3/fslog.c:3125 do_action() warn: variable dereferenced before check 'mi' (see line 3086)

vim +640 fs/ntfs3/frecord.c

4342306f0f0d5f Konstantin Komarov 2021-08-13  510  
4342306f0f0d5f Konstantin Komarov 2021-08-13  511  /*
e8b8e97f91b80f Kari Argillander   2021-08-03  512   * ni_repack
e8b8e97f91b80f Kari Argillander   2021-08-03  513   *
e8b8e97f91b80f Kari Argillander   2021-08-03  514   * Random write access to sparsed or compressed file may result to
4342306f0f0d5f Konstantin Komarov 2021-08-13  515   * not optimized packed runs.
e8b8e97f91b80f Kari Argillander   2021-08-03  516   * Here is the place to optimize it.
4342306f0f0d5f Konstantin Komarov 2021-08-13  517   */
4342306f0f0d5f Konstantin Komarov 2021-08-13  518  static int ni_repack(struct ntfs_inode *ni)
4342306f0f0d5f Konstantin Komarov 2021-08-13  519  {
4342306f0f0d5f Konstantin Komarov 2021-08-13  520  	int err = 0;
4342306f0f0d5f Konstantin Komarov 2021-08-13  521  	struct ntfs_sb_info *sbi = ni->mi.sbi;
4342306f0f0d5f Konstantin Komarov 2021-08-13  522  	struct mft_inode *mi, *mi_p = NULL;
4342306f0f0d5f Konstantin Komarov 2021-08-13  523  	struct ATTRIB *attr = NULL, *attr_p;
4342306f0f0d5f Konstantin Komarov 2021-08-13  524  	struct ATTR_LIST_ENTRY *le = NULL, *le_p;
4342306f0f0d5f Konstantin Komarov 2021-08-13  525  	CLST alloc = 0;
4342306f0f0d5f Konstantin Komarov 2021-08-13  526  	u8 cluster_bits = sbi->cluster_bits;
4342306f0f0d5f Konstantin Komarov 2021-08-13  527  	CLST svcn, evcn = 0, svcn_p, evcn_p, next_svcn;
4342306f0f0d5f Konstantin Komarov 2021-08-13  528  	u32 roff, rs = sbi->record_size;
4342306f0f0d5f Konstantin Komarov 2021-08-13  529  	struct runs_tree run;
4342306f0f0d5f Konstantin Komarov 2021-08-13  530  
4342306f0f0d5f Konstantin Komarov 2021-08-13  531  	run_init(&run);
4342306f0f0d5f Konstantin Komarov 2021-08-13  532  
4342306f0f0d5f Konstantin Komarov 2021-08-13  533  	while ((attr = ni_enum_attr_ex(ni, attr, &le, &mi))) {
4342306f0f0d5f Konstantin Komarov 2021-08-13  534  		if (!attr->non_res)
4342306f0f0d5f Konstantin Komarov 2021-08-13  535  			continue;
4342306f0f0d5f Konstantin Komarov 2021-08-13  536  
4342306f0f0d5f Konstantin Komarov 2021-08-13  537  		svcn = le64_to_cpu(attr->nres.svcn);
4342306f0f0d5f Konstantin Komarov 2021-08-13  538  		if (svcn != le64_to_cpu(le->vcn)) {
4342306f0f0d5f Konstantin Komarov 2021-08-13  539  			err = -EINVAL;
4342306f0f0d5f Konstantin Komarov 2021-08-13  540  			break;
4342306f0f0d5f Konstantin Komarov 2021-08-13  541  		}
4342306f0f0d5f Konstantin Komarov 2021-08-13  542  
4342306f0f0d5f Konstantin Komarov 2021-08-13  543  		if (!svcn) {
4342306f0f0d5f Konstantin Komarov 2021-08-13  544  			alloc = le64_to_cpu(attr->nres.alloc_size) >>
4342306f0f0d5f Konstantin Komarov 2021-08-13  545  				cluster_bits;
4342306f0f0d5f Konstantin Komarov 2021-08-13  546  			mi_p = NULL;
4342306f0f0d5f Konstantin Komarov 2021-08-13  547  		} else if (svcn != evcn + 1) {
4342306f0f0d5f Konstantin Komarov 2021-08-13  548  			err = -EINVAL;
4342306f0f0d5f Konstantin Komarov 2021-08-13  549  			break;
4342306f0f0d5f Konstantin Komarov 2021-08-13  550  		}
4342306f0f0d5f Konstantin Komarov 2021-08-13  551  
4342306f0f0d5f Konstantin Komarov 2021-08-13  552  		evcn = le64_to_cpu(attr->nres.evcn);
4342306f0f0d5f Konstantin Komarov 2021-08-13  553  
4342306f0f0d5f Konstantin Komarov 2021-08-13  554  		if (svcn > evcn + 1) {
4342306f0f0d5f Konstantin Komarov 2021-08-13  555  			err = -EINVAL;
4342306f0f0d5f Konstantin Komarov 2021-08-13  556  			break;
4342306f0f0d5f Konstantin Komarov 2021-08-13  557  		}
4342306f0f0d5f Konstantin Komarov 2021-08-13  558  
4342306f0f0d5f Konstantin Komarov 2021-08-13  559  		if (!mi_p) {
bd6ae049b7be47 Konstantin Komarov 2022-09-09  560  			/* Do not try if not enough free space. */
4342306f0f0d5f Konstantin Komarov 2021-08-13  561  			if (le32_to_cpu(mi->mrec->used) + 8 >= rs)
4342306f0f0d5f Konstantin Komarov 2021-08-13  562  				continue;
4342306f0f0d5f Konstantin Komarov 2021-08-13  563  
e8b8e97f91b80f Kari Argillander   2021-08-03  564  			/* Do not try if last attribute segment. */
4342306f0f0d5f Konstantin Komarov 2021-08-13  565  			if (evcn + 1 == alloc)
4342306f0f0d5f Konstantin Komarov 2021-08-13  566  				continue;
4342306f0f0d5f Konstantin Komarov 2021-08-13  567  			run_close(&run);
4342306f0f0d5f Konstantin Komarov 2021-08-13  568  		}
4342306f0f0d5f Konstantin Komarov 2021-08-13  569  
4342306f0f0d5f Konstantin Komarov 2021-08-13  570  		roff = le16_to_cpu(attr->nres.run_off);
6db620863f8528 Edward Lo          2022-08-06  571  
6db620863f8528 Edward Lo          2022-08-06  572  		if (roff > le32_to_cpu(attr->size)) {
6db620863f8528 Edward Lo          2022-08-06  573  			err = -EINVAL;
6db620863f8528 Edward Lo          2022-08-06  574  			break;
6db620863f8528 Edward Lo          2022-08-06  575  		}
6db620863f8528 Edward Lo          2022-08-06  576  
4342306f0f0d5f Konstantin Komarov 2021-08-13  577  		err = run_unpack(&run, sbi, ni->mi.rno, svcn, evcn, svcn,
4342306f0f0d5f Konstantin Komarov 2021-08-13  578  				 Add2Ptr(attr, roff),
4342306f0f0d5f Konstantin Komarov 2021-08-13  579  				 le32_to_cpu(attr->size) - roff);
4342306f0f0d5f Konstantin Komarov 2021-08-13  580  		if (err < 0)
4342306f0f0d5f Konstantin Komarov 2021-08-13  581  			break;
4342306f0f0d5f Konstantin Komarov 2021-08-13  582  
4342306f0f0d5f Konstantin Komarov 2021-08-13  583  		if (!mi_p) {
4342306f0f0d5f Konstantin Komarov 2021-08-13  584  			mi_p = mi;
4342306f0f0d5f Konstantin Komarov 2021-08-13  585  			attr_p = attr;
4342306f0f0d5f Konstantin Komarov 2021-08-13  586  			svcn_p = svcn;
4342306f0f0d5f Konstantin Komarov 2021-08-13  587  			evcn_p = evcn;
4342306f0f0d5f Konstantin Komarov 2021-08-13  588  			le_p = le;
4342306f0f0d5f Konstantin Komarov 2021-08-13  589  			err = 0;
4342306f0f0d5f Konstantin Komarov 2021-08-13  590  			continue;
4342306f0f0d5f Konstantin Komarov 2021-08-13  591  		}
4342306f0f0d5f Konstantin Komarov 2021-08-13  592  
4342306f0f0d5f Konstantin Komarov 2021-08-13  593  		/*
e8b8e97f91b80f Kari Argillander   2021-08-03  594  		 * Run contains data from two records: mi_p and mi
e8b8e97f91b80f Kari Argillander   2021-08-03  595  		 * Try to pack in one.
4342306f0f0d5f Konstantin Komarov 2021-08-13  596  		 */
4342306f0f0d5f Konstantin Komarov 2021-08-13  597  		err = mi_pack_runs(mi_p, attr_p, &run, evcn + 1 - svcn_p);
4342306f0f0d5f Konstantin Komarov 2021-08-13  598  		if (err)
4342306f0f0d5f Konstantin Komarov 2021-08-13  599  			break;
4342306f0f0d5f Konstantin Komarov 2021-08-13  600  
4342306f0f0d5f Konstantin Komarov 2021-08-13  601  		next_svcn = le64_to_cpu(attr_p->nres.evcn) + 1;
4342306f0f0d5f Konstantin Komarov 2021-08-13  602  
4342306f0f0d5f Konstantin Komarov 2021-08-13  603  		if (next_svcn >= evcn + 1) {
e8b8e97f91b80f Kari Argillander   2021-08-03  604  			/* We can remove this attribute segment. */
4342306f0f0d5f Konstantin Komarov 2021-08-13  605  			al_remove_le(ni, le);
78ab59fee07f22 Konstantin Komarov 2021-08-31  606  			mi_remove_attr(NULL, mi, attr);
4342306f0f0d5f Konstantin Komarov 2021-08-13  607  			le = le_p;
4342306f0f0d5f Konstantin Komarov 2021-08-13  608  			continue;
4342306f0f0d5f Konstantin Komarov 2021-08-13  609  		}
4342306f0f0d5f Konstantin Komarov 2021-08-13  610  
4342306f0f0d5f Konstantin Komarov 2021-08-13  611  		attr->nres.svcn = le->vcn = cpu_to_le64(next_svcn);
4342306f0f0d5f Konstantin Komarov 2021-08-13  612  		mi->dirty = true;
4342306f0f0d5f Konstantin Komarov 2021-08-13  613  		ni->attr_list.dirty = true;
4342306f0f0d5f Konstantin Komarov 2021-08-13  614  
4342306f0f0d5f Konstantin Komarov 2021-08-13  615  		if (evcn + 1 == alloc) {
4342306f0f0d5f Konstantin Komarov 2021-08-13  616  			err = mi_pack_runs(mi, attr, &run,
4342306f0f0d5f Konstantin Komarov 2021-08-13  617  					   evcn + 1 - next_svcn);
4342306f0f0d5f Konstantin Komarov 2021-08-13  618  			if (err)
4342306f0f0d5f Konstantin Komarov 2021-08-13  619  				break;
4342306f0f0d5f Konstantin Komarov 2021-08-13  620  			mi_p = NULL;
4342306f0f0d5f Konstantin Komarov 2021-08-13  621  		} else {
4342306f0f0d5f Konstantin Komarov 2021-08-13  622  			mi_p = mi;
4342306f0f0d5f Konstantin Komarov 2021-08-13  623  			attr_p = attr;
4342306f0f0d5f Konstantin Komarov 2021-08-13  624  			svcn_p = next_svcn;
4342306f0f0d5f Konstantin Komarov 2021-08-13  625  			evcn_p = evcn;
4342306f0f0d5f Konstantin Komarov 2021-08-13  626  			le_p = le;
4342306f0f0d5f Konstantin Komarov 2021-08-13  627  			run_truncate_head(&run, next_svcn);
4342306f0f0d5f Konstantin Komarov 2021-08-13  628  		}
4342306f0f0d5f Konstantin Komarov 2021-08-13  629  	}
4342306f0f0d5f Konstantin Komarov 2021-08-13  630  
4342306f0f0d5f Konstantin Komarov 2021-08-13  631  	if (err) {
4342306f0f0d5f Konstantin Komarov 2021-08-13  632  		ntfs_inode_warn(&ni->vfs_inode, "repack problem");
4342306f0f0d5f Konstantin Komarov 2021-08-13  633  		ntfs_set_state(sbi, NTFS_DIRTY_ERROR);
4342306f0f0d5f Konstantin Komarov 2021-08-13  634  
e8b8e97f91b80f Kari Argillander   2021-08-03  635  		/* Pack loaded but not packed runs. */
4342306f0f0d5f Konstantin Komarov 2021-08-13  636  		if (mi_p)
4342306f0f0d5f Konstantin Komarov 2021-08-13  637  			mi_pack_runs(mi_p, attr_p, &run, evcn_p + 1 - svcn_p);
4342306f0f0d5f Konstantin Komarov 2021-08-13  638  	}
4342306f0f0d5f Konstantin Komarov 2021-08-13  639  
4342306f0f0d5f Konstantin Komarov 2021-08-13 @640  	run_close(&run);
4342306f0f0d5f Konstantin Komarov 2021-08-13  641  	return err;
4342306f0f0d5f Konstantin Komarov 2021-08-13  642  }
4342306f0f0d5f Konstantin Komarov 2021-08-13  643  

:::::: The code at line 640 was first introduced by commit
:::::: 4342306f0f0d5ff4315a204d315c1b51b914fca5 fs/ntfs3: Add file operations and implementation

:::::: TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
:::::: CC: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
