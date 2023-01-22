Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890107E
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Jan 2023 00:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674348119; x=1705884119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H4VJkGSoqvXPMEjkBN31U2J3PGg/BMhvd6VCxrPrCXQ=;
  b=oJ+Gh8TWRgAQ9cgK8/kujrGkRYwqLnhH3FDP6MQs0NbnzS6Ad5geANe8
   aTvD2JtFS8gaA27ShJSVAzK1B58I6eIw68m1l4C/vXV7KzXvoS4FTNXs+
   r3mOqVZlj7nam075rkrJ9FrShaz+s6uUeDNm0BgkmgkF+72rT6BwpJveI
   n5YODFektugfhvmiSle562Vbj3X6FOruhBtkdy/QI3VH6ZwnSUXbTxA4G
   rpN7JoJB491L/OcPyPkill0WUaTHgTKgsANfnqeyi844w/UHmVWKMbjym
   GLXOqHKk5TYZtC86NLsWce40jPX7WXgoTGEi8piha+dAPqgy28He0H6ks
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="324540489"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="324540489"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 16:41:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="729539328"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="729539328"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 21 Jan 2023 16:41:57 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJOQm-0004c4-2c;
	Sun, 22 Jan 2023 00:41:56 +0000
Date: Sun, 22 Jan 2023 08:41:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/mtd/ubi/eba.c:848:9: warning: use of NULL 'buf' where
 non-null expected [CWE-476]
Message-ID: <202301220809.Z83VshLt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/mtd/ubi/eba.c:848:9: warning: use of NULL 'buf' where non-null expected [CWE-476] [-Wanalyzer-null-argument]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f67144022885344375ad03593e7a290cc614da34
commit: f334f5668bedf7307f6df1d98b14f55902931926 ilog2: force inlining of __ilog2_u32() and __ilog2_u64()
date:   10 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20230118 (https://download.01.org/0day-ci/archive/20230122/202301220809.Z83VshLt-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f334f5668bedf7307f6df1d98b14f55902931926
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f334f5668bedf7307f6df1d98b14f55902931926
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error'  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error' 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
                            |      |                 |
                            |      |                 (17) ...to here
                            |
                     <------+
                     |
                   'leb_write_lock': events 18-19
                     |
                     |  365 |         le = ltree_add_entry(ubi, vol_id, lnum);
                     |      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |              |
                     |      |              (18) returning to 'leb_write_lock' from 'ltree_add_entry'
                     |  366 |         if (IS_ERR(le))
                     |      |            ~  
                     |      |            |
                     |      |            (19) following 'true' branch...
                     |
                   'leb_write_lock': event 20
                     |
                     |include/linux/err.h:31:16:
                     |   31 |         return (long) ptr;
                     |      |                ^~~~~~~~~~
                     |      |                |
                     |      |                (20) ...to here
                     |
              <------+
              |
            'ubi_eba_unmap_leb': events 21-26
              |
              |drivers/mtd/ubi/eba.c:458:15:
              |  458 |         err = leb_write_lock(ubi, vol_id, lnum);
              |      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |               |
              |      |               (21) returning to 'ubi_eba_unmap_leb' from 'leb_write_lock'
              |  459 |         if (err)
              |      |            ~   
              |      |            |
              |      |            (22) following 'false' branch (when 'err == 0')...
              |......
              |  462 |         pnum = vol->eba_tbl->entries[lnum].pnum;
              |      |                ~~~~~~~~~~~~
              |      |                   |
              |      |                   (23) ...to here
              |  463 |         if (pnum < 0)
              |      |            ~   
              |      |            |
              |      |            (24) following 'false' branch (when 'pnum >= 0')...
              |......
              |  469 |         down_read(&ubi->fm_eba_sem);
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (25) ...to here
              |......
              |  475 |         leb_write_unlock(ubi, vol_id, lnum);
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (26) calling 'leb_write_unlock' from 'ubi_eba_unmap_leb'
              |
              +--> 'leb_write_unlock': events 27-28
                     |
                     |  412 | static void leb_write_unlock(struct ubi_device *ubi, int vol_id, int lnum)
                     |      |             ^~~~~~~~~~~~~~~~
                     |      |             |
                     |      |             (27) entry to 'leb_write_unlock'
                     |......
                     |  417 |         le = ltree_lookup(ubi, vol_id, lnum);
                     |      |              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |              |
                     |      |              (28) calling 'ltree_lookup' from 'leb_write_unlock'
                     |
                     +--> 'ltree_lookup': events 29-30
                            |
                            |  210 | static struct ubi_ltree_entry *ltree_lookup(struct ubi_device *ubi, int vol_id,
                            |      |                                ^~~~~~~~~~~~
                            |      |                                |
                            |      |                                (29) entry to 'ltree_lookup'
                            |......
                            |  216 |         while (p) {
                            |      |                ~                
                            |      |                |
                            |      |                (30) following 'false' branch (when 'p' is NULL)...
                            |
                          'ltree_lookup': event 31
                            |
                            |cc1:
                            | (31): ...to here
                            |
                     <------+
                     |
                   'leb_write_unlock': events 32-33
                     |
                     |  417 |         le = ltree_lookup(ubi, vol_id, lnum);
                     |      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |              |
                     |      |              (32) return of NULL to 'leb_write_unlock' from 'ltree_lookup'
                     |  418 |         le->users -= 1;
                     |      |         ~~~~~~~~~
                     |      |           |
                     |      |           (33) dereference of NULL 'le'
                     |
   drivers/mtd/ubi/eba.c: In function 'try_recover_peb':
>> drivers/mtd/ubi/eba.c:848:9: warning: use of NULL 'buf' where non-null expected [CWE-476] [-Wanalyzer-null-argument]
     848 |         memcpy(ubi->peb_buf + offset, buf, len);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'ubi_eba_atomic_leb_change': events 1-6
       |
       | 1188 | int ubi_eba_atomic_leb_change(struct ubi_device *ubi, struct ubi_volume *vol,
       |      |     ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'ubi_eba_atomic_leb_change'
       |......
       | 1196 |         if (ubi->ro_mode)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch...
       |......
       | 1199 |         if (len == 0) {
       |      |            ~
       |      |            |
       |      |            (3) ...to here
       |      |            (4) following 'true' branch (when 'len == 0')...
       |......
       | 1204 |                 err = ubi_eba_unmap_leb(ubi, vol, lnum);
       |      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (5) ...to here
       |      |                       (6) calling 'ubi_eba_unmap_leb' from 'ubi_eba_atomic_leb_change'
       |
       +--> 'ubi_eba_unmap_leb': events 7-10
              |
              |  450 | int ubi_eba_unmap_leb(struct ubi_device *ubi, struct ubi_volume *vol,
              |      |     ^~~~~~~~~~~~~~~~~
              |      |     |
              |      |     (7) entry to 'ubi_eba_unmap_leb'
              |......
              |  455 |         if (ubi->ro_mode)
              |      |            ~
              |      |            |
              |      |            (8) following 'false' branch...
              |......
              |  458 |         err = leb_write_lock(ubi, vol_id, lnum);
              |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |               |
              |      |               (9) ...to here
              |      |               (10) calling 'leb_write_lock' from 'ubi_eba_unmap_leb'
              |
              +--> 'leb_write_lock': events 11-12
                     |
                     |  361 | static int leb_write_lock(struct ubi_device *ubi, int vol_id, int lnum)
                     |      |            ^~~~~~~~~~~~~~
                     |      |            |
                     |      |            (11) entry to 'leb_write_lock'
                     |......
                     |  365 |         le = ltree_add_entry(ubi, vol_id, lnum);
                     |      |              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |              |
                     |      |              (12) calling 'ltree_add_entry' from 'leb_write_lock'
                     |
                     +--> 'ltree_add_entry': events 13-17
                            |
                            |  249 | static struct ubi_ltree_entry *ltree_add_entry(struct ubi_device *ubi,
                            |      |                                ^~~~~~~~~~~~~~~
                            |      |                                |
                            |      |                                (13) entry to 'ltree_add_entry'
                            |......
                            |  266 |         if (le1) {
                            |      |            ~                    
                            |      |            |
                            |      |            (14) following 'false' branch (when 'le1' is NULL)...
                            |......
                            |  282 |                 p = &ubi->ltree.rb_node;
                            |      |                 ~~~~~~~~~~~~~~~~~~~~~~~
                            |      |                   |
                            |      |                   (15) ...to here
                            |  283 |                 while (*p) {
                            |      |                        ~        
                            |      |                        |
                            |      |                        (16) following 'false' branch...
                            |......
                            |  300 |                 rb_link_node(&le->rb, parent, p);
                            |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                            |      |                 |
                            |      |                 (17) ...to here
                            |
                     <------+
                     |
                   'leb_write_lock': events 18-19
                     |
                     |  365 |         le = ltree_add_entry(ubi, vol_id, lnum);
                     |      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |              |
                     |      |              (18) returning to 'leb_write_lock' from 'ltree_add_entry'
                     |  366 |         if (IS_ERR(le))
                     |      |            ~  
                     |      |            |
                     |      |            (19) following 'true' branch...
                     |
                   'leb_write_lock': event 20
                     |
                     |include/linux/err.h:31:16:
                     |   31 |         return (long) ptr;
                     |      |                ^~~~~~~~~~

vim +/buf +848 drivers/mtd/ubi/eba.c

9ff08979e17423 Richard Weinberger  2015-01-10  787  
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  788  /**
f036dfeb859cb4 Boris Brezillon     2016-09-16  789   * try_recover_peb - try to recover from write failure.
f036dfeb859cb4 Boris Brezillon     2016-09-16  790   * @vol: volume description object
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  791   * @pnum: the physical eraseblock to recover
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  792   * @lnum: logical eraseblock number
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  793   * @buf: data which was not written because of the write failure
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  794   * @offset: offset of the failed write
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  795   * @len: how many bytes should have been written
3291b52f9ff0ac Boris Brezillon     2016-09-16  796   * @vidb: VID buffer
f036dfeb859cb4 Boris Brezillon     2016-09-16  797   * @retry: whether the caller should retry in case of failure
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  798   *
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  799   * This function is called in case of a write failure and moves all good data
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  800   * from the potentially bad physical eraseblock to a good physical eraseblock.
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  801   * This function also writes the data which was not written due to the failure.
f036dfeb859cb4 Boris Brezillon     2016-09-16  802   * Returns 0 in case of success, and a negative error code in case of failure.
f036dfeb859cb4 Boris Brezillon     2016-09-16  803   * In case of failure, the %retry parameter is set to false if this is a fatal
f036dfeb859cb4 Boris Brezillon     2016-09-16  804   * error (retrying won't help), and true otherwise.
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  805   */
f036dfeb859cb4 Boris Brezillon     2016-09-16  806  static int try_recover_peb(struct ubi_volume *vol, int pnum, int lnum,
f036dfeb859cb4 Boris Brezillon     2016-09-16  807  			   const void *buf, int offset, int len,
3291b52f9ff0ac Boris Brezillon     2016-09-16  808  			   struct ubi_vid_io_buf *vidb, bool *retry)
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  809  {
f036dfeb859cb4 Boris Brezillon     2016-09-16  810  	struct ubi_device *ubi = vol->ubi;
3291b52f9ff0ac Boris Brezillon     2016-09-16  811  	struct ubi_vid_hdr *vid_hdr;
f036dfeb859cb4 Boris Brezillon     2016-09-16  812  	int new_pnum, err, vol_id = vol->vol_id, data_size;
972228d87445dc Richard Weinberger  2016-06-21  813  	uint32_t crc;
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  814  
f036dfeb859cb4 Boris Brezillon     2016-09-16  815  	*retry = false;
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  816  
b36a261e8c0ab3 Richard Weinberger  2012-05-14  817  	new_pnum = ubi_wl_get_peb(ubi);
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  818  	if (new_pnum < 0) {
f036dfeb859cb4 Boris Brezillon     2016-09-16  819  		err = new_pnum;
f036dfeb859cb4 Boris Brezillon     2016-09-16  820  		goto out_put;
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  821  	}
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  822  
326087033108e7 Tanya Brokhman      2014-10-20  823  	ubi_msg(ubi, "recover PEB %d, move data to PEB %d",
326087033108e7 Tanya Brokhman      2014-10-20  824  		pnum, new_pnum);
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  825  
3291b52f9ff0ac Boris Brezillon     2016-09-16  826  	err = ubi_io_read_vid_hdr(ubi, pnum, vidb, 1);
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  827  	if (err && err != UBI_IO_BITFLIPS) {
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  828  		if (err > 0)
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  829  			err = -EIO;
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  830  		goto out_put;
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  831  	}
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  832  
884a3b647809cb Geert Uytterhoeven  2016-10-13  833  	vid_hdr = ubi_get_vid_hdr(vidb);
972228d87445dc Richard Weinberger  2016-06-21  834  	ubi_assert(vid_hdr->vol_type == UBI_VID_DYNAMIC);
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  835  
4df581f3dc6a91 Artem Bityutskiy    2008-12-04  836  	mutex_lock(&ubi->buf_mutex);
0ca39d74de8b26 Artem Bityutskiy    2012-03-08  837  	memset(ubi->peb_buf + offset, 0xFF, len);
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  838  
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  839  	/* Read everything before the area where the write failure happened */
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  840  	if (offset > 0) {
0ca39d74de8b26 Artem Bityutskiy    2012-03-08  841  		err = ubi_io_read_data(ubi, ubi->peb_buf, pnum, 0, offset);
f036dfeb859cb4 Boris Brezillon     2016-09-16  842  		if (err && err != UBI_IO_BITFLIPS)
4df581f3dc6a91 Artem Bityutskiy    2008-12-04  843  			goto out_unlock;
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  844  	}
f036dfeb859cb4 Boris Brezillon     2016-09-16  845  
f036dfeb859cb4 Boris Brezillon     2016-09-16  846  	*retry = true;
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  847  
0ca39d74de8b26 Artem Bityutskiy    2012-03-08 @848  	memcpy(ubi->peb_buf + offset, buf, len);
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  849  
972228d87445dc Richard Weinberger  2016-06-21  850  	data_size = offset + len;
972228d87445dc Richard Weinberger  2016-06-21  851  	crc = crc32(UBI_CRC32_INIT, ubi->peb_buf, data_size);
972228d87445dc Richard Weinberger  2016-06-21  852  	vid_hdr->sqnum = cpu_to_be64(ubi_next_sqnum(ubi));
972228d87445dc Richard Weinberger  2016-06-21  853  	vid_hdr->copy_flag = 1;
972228d87445dc Richard Weinberger  2016-06-21  854  	vid_hdr->data_size = cpu_to_be32(data_size);
972228d87445dc Richard Weinberger  2016-06-21  855  	vid_hdr->data_crc = cpu_to_be32(crc);
3291b52f9ff0ac Boris Brezillon     2016-09-16  856  	err = ubi_io_write_vid_hdr(ubi, new_pnum, vidb);
f036dfeb859cb4 Boris Brezillon     2016-09-16  857  	if (err)
f036dfeb859cb4 Boris Brezillon     2016-09-16  858  		goto out_unlock;
972228d87445dc Richard Weinberger  2016-06-21  859  
0ca39d74de8b26 Artem Bityutskiy    2012-03-08  860  	err = ubi_io_write_data(ubi, ubi->peb_buf, new_pnum, 0, data_size);
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  861  
f036dfeb859cb4 Boris Brezillon     2016-09-16  862  out_unlock:
e88d6e10e5c848 Artem Bityutskiy    2007-08-29  863  	mutex_unlock(&ubi->buf_mutex);
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  864  
f036dfeb859cb4 Boris Brezillon     2016-09-16  865  	if (!err)
799dca34ac5434 Boris Brezillon     2016-09-16  866  		vol->eba_tbl->entries[lnum].pnum = new_pnum;
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  867  
4df581f3dc6a91 Artem Bityutskiy    2008-12-04  868  out_put:
f036dfeb859cb4 Boris Brezillon     2016-09-16  869  	up_read(&ubi->fm_eba_sem);
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  870  
f036dfeb859cb4 Boris Brezillon     2016-09-16  871  	if (!err) {
f036dfeb859cb4 Boris Brezillon     2016-09-16  872  		ubi_wl_put_peb(ubi, vol_id, lnum, pnum, 1);
f036dfeb859cb4 Boris Brezillon     2016-09-16  873  		ubi_msg(ubi, "data was successfully recovered");
f036dfeb859cb4 Boris Brezillon     2016-09-16  874  	} else if (new_pnum >= 0) {
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  875  		/*
f036dfeb859cb4 Boris Brezillon     2016-09-16  876  		 * Bad luck? This physical eraseblock is bad too? Crud. Let's
f036dfeb859cb4 Boris Brezillon     2016-09-16  877  		 * try to get another one.
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  878  		 */
d36e59e69b8be5 Joel Reardon        2012-05-18  879  		ubi_wl_put_peb(ubi, vol_id, lnum, new_pnum, 1);
f036dfeb859cb4 Boris Brezillon     2016-09-16  880  		ubi_warn(ubi, "failed to write to PEB %d", new_pnum);
f036dfeb859cb4 Boris Brezillon     2016-09-16  881  	}
f036dfeb859cb4 Boris Brezillon     2016-09-16  882  
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  883  	return err;
801c135ce73d5d Artem B. Bityutskiy 2006-06-27  884  }
f036dfeb859cb4 Boris Brezillon     2016-09-16  885  

:::::: The code at line 848 was first introduced by commit
:::::: 0ca39d74de8b269fb61eac11b75bd6c3fc887c28 UBI: rename peb_buf1 to peb_buf

:::::: TO: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
:::::: CC: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
