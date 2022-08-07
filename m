Content-Type: multipart/mixed; boundary="===============6255501981660328354=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/iomap/buffered-io.c:1175:14: warning: use of uninitialized value '*ioend.io_bio' [CWE-457]
Date: Sun, 07 Aug 2022 18:33:21 +0800
Message-ID: <202208071841.OBfPTNbg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6255501981660328354==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "commit no functional change"
:::::: Manual check reason: "low confidence static check warning: fs/iomap/=
buffered-io.c:1175:14: warning: use of uninitialized value '*ioend.io_bio' =
[CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: Christoph Hellwig <hch@lst.de>
CC: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1612c382ffbdf1f673caec76502b1c00e6d35363
commit: 6e478521df535b9d5ef5eb84d4352f235bbbef99 iomap,xfs: Convert ->disca=
rd_page to ->discard_folio
date:   8 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 8 months ago
config: arm-randconfig-c002-20220805 (https://download.01.org/0day-ci/archi=
ve/20220807/202208071841.OBfPTNbg-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D6e478521df535b9d5ef5eb84d4352f235bbbef99
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 6e478521df535b9d5ef5eb84d4352f235bbbef99
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   fs/iomap/buffered-io.c: In function 'iomap_submit_ioend':
>> fs/iomap/buffered-io.c:1175:14: warning: use of uninitialized value '*io=
end.io_bio' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1175 |         ioend->io_bio->bi_private =3D ioend;
         |         ~~~~~^~~~~~~~
     'iomap_writepage_map': event 1
       |
       | 1308 | iomap_writepage_map(struct iomap_writepage_ctx *wpc,
       |      | ^~~~~~~~~~~~~~~~~~~
       |      | |
       |      | (1) entry to 'iomap_writepage_map'
       |
     'iomap_writepage_map': event 2
       |
       | 1318 |         LIST_HEAD(submit_list);
       |      |                   ^~~~~~~~~~~
       |      |                   |
       |      |                   (2) region created on stack here
   include/linux/list.h:26:26: note: in definition of macro 'LIST_HEAD'
       |   26 |         struct list_head name =3D LIST_HEAD_INIT(name)
       |      |                          ^~~~
       |
     'iomap_writepage_map': event 3
       |
       |include/linux/once_lite.h:15:38:
       |   15 |                 bool __ret_do_once =3D !!(condition);      =
               \
       |      |                                      ^~~~~~~~~~~~~
       |      |                                      |
       |      |                                      (3) following 'false' =
branch (when 'iop' is NULL)...
   include/asm-generic/bug.h:146:9: note: in expansion of macro 'DO_ONCE_LI=
TE_IF'
       |  146 |         DO_ONCE_LITE_IF(condition, WARN_ON, 1)
       |      |         ^~~~~~~~~~~~~~~
   fs/iomap/buffered-io.c:1320:9: note: in expansion of macro 'WARN_ON_ONCE'
       | 1320 |         WARN_ON_ONCE(iop && atomic_read(&iop->write_bytes_p=
ending) !=3D 0);
       |      |         ^~~~~~~~~~~~
       |
     'iomap_writepage_map': event 4
       |
       |cc1:
       | (4): ...to here
       |
     'iomap_writepage_map': event 5
       |
       |include/linux/once_lite.h:17:20:
       |   17 |                 if (unlikely(__ret_do_once && !__already_do=
ne)) {       \
       |      |                    ^
       |      |                    |
       |      |                    (5) following 'false' branch...
   include/asm-generic/bug.h:146:9: note: in expansion of macro 'DO_ONCE_LI=
TE_IF'
       |  146 |         DO_ONCE_LITE_IF(condition, WARN_ON, 1)
       |      |         ^~~~~~~~~~~~~~~
   fs/iomap/buffered-io.c:1320:9: note: in expansion of macro 'WARN_ON_ONCE'
       | 1320 |         WARN_ON_ONCE(iop && atomic_read(&iop->write_bytes_p=
ending) !=3D 0);
       |      |         ^~~~~~~~~~~~
       |
     'iomap_writepage_map': event 6
       |
       |include/linux/pagemap.h:691:29:
       |  691 |         return ((loff_t)page->index) << PAGE_SHIFT;
       |      |                         ~~~~^~~~~~~
       |      |                             |
       |      |                             (6) ...to here
       |
     'iomap_writepage_map': event 7
       |
       |include/linux/once_lite.h:17:20:
       |   17 |                 if (unlikely(__ret_do_once && !__already_do=
ne)) {       \
       |      |                    ^
       |      |                    |
       |      |                    (7) following 'false' branch...
   include/asm-generic/bug.h:146:9: note: in expansion of macro 'DO_ONCE_LI=
TE_IF'
       |  146 |         DO_ONCE_LITE_IF(condition, WARN_ON, 1)
       |      |         ^~~~~~~~~~~~~~~
   fs/iomap/buffered-io.c:1345:9: note: in expansion of macro 'WARN_ON_ONCE'
       | 1345 |         WARN_ON_ONCE(!wpc->ioend && !list_empty(&submit_lis=
t));
       |      |         ^~~~~~~~~~~~
       |
     'iomap_writepage_map': event 8
       |
       |include/asm-generic/rwonce.h:44:26:
       |   44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_t=
ypeof(x) *)&(x))
       |      |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~
       |      |                          |
       |      |                          (8) ...to here
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_O=
NCE'
       |   50 |         __READ_ONCE(x);                                    =
             \
       |      |         ^~~~~~~~~~~
   include/linux/page-flags.h:198:30: note: in expansion of macro 'READ_ONC=
E'
       |  198 |         unsigned long head =3D READ_ONCE(page->compound_hea=
d);
       |      |                              ^~~~~~~~~
       |
     'iomap_writepage_map': events 9-10
       |
       |fs/iomap/buffered-io.c:1356:12:
       | 1356 |         if (unlikely(error)) {
       |      |            ^
       |      |            |
       |      |            (9) following 'false' branch...
       |......
       | 1372 |         set_page_writeback(page);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (10) ...to here

vim +1175 fs/iomap/buffered-io.c

598ecfbaa742ac Christoph Hellwig   2019-10-17  1162  =

598ecfbaa742ac Christoph Hellwig   2019-10-17  1163  /*
598ecfbaa742ac Christoph Hellwig   2019-10-17  1164   * Submit the final bi=
o for an ioend.
598ecfbaa742ac Christoph Hellwig   2019-10-17  1165   *
598ecfbaa742ac Christoph Hellwig   2019-10-17  1166   * If @error is non-ze=
ro, it means that we have a situation where some part of
f1f264b4c134ee Andreas Gruenbacher 2021-08-02  1167   * the submission proc=
ess has failed after we've marked pages for writeback
598ecfbaa742ac Christoph Hellwig   2019-10-17  1168   * and unlocked them. =
 In this situation, we need to fail the bio instead of
598ecfbaa742ac Christoph Hellwig   2019-10-17  1169   * submitting it.  Thi=
s typically only happens on a filesystem shutdown.
598ecfbaa742ac Christoph Hellwig   2019-10-17  1170   */
598ecfbaa742ac Christoph Hellwig   2019-10-17  1171  static int
598ecfbaa742ac Christoph Hellwig   2019-10-17  1172  iomap_submit_ioend(str=
uct iomap_writepage_ctx *wpc, struct iomap_ioend *ioend,
598ecfbaa742ac Christoph Hellwig   2019-10-17  1173  		int error)
598ecfbaa742ac Christoph Hellwig   2019-10-17  1174  {
598ecfbaa742ac Christoph Hellwig   2019-10-17 @1175  	ioend->io_bio->bi_pri=
vate =3D ioend;
598ecfbaa742ac Christoph Hellwig   2019-10-17  1176  	ioend->io_bio->bi_end=
_io =3D iomap_writepage_end_bio;
598ecfbaa742ac Christoph Hellwig   2019-10-17  1177  =

598ecfbaa742ac Christoph Hellwig   2019-10-17  1178  	if (wpc->ops->prepare=
_ioend)
598ecfbaa742ac Christoph Hellwig   2019-10-17  1179  		error =3D wpc->ops->=
prepare_ioend(ioend, error);
598ecfbaa742ac Christoph Hellwig   2019-10-17  1180  	if (error) {
598ecfbaa742ac Christoph Hellwig   2019-10-17  1181  		/*
f1f264b4c134ee Andreas Gruenbacher 2021-08-02  1182  		 * If we're failing =
the IO now, just mark the ioend with an
598ecfbaa742ac Christoph Hellwig   2019-10-17  1183  		 * error and finish =
it.  This will run IO completion immediately
598ecfbaa742ac Christoph Hellwig   2019-10-17  1184  		 * as there is only =
one reference to the ioend at this point in
598ecfbaa742ac Christoph Hellwig   2019-10-17  1185  		 * time.
598ecfbaa742ac Christoph Hellwig   2019-10-17  1186  		 */
598ecfbaa742ac Christoph Hellwig   2019-10-17  1187  		ioend->io_bio->bi_st=
atus =3D errno_to_blk_status(error);
598ecfbaa742ac Christoph Hellwig   2019-10-17  1188  		bio_endio(ioend->io_=
bio);
598ecfbaa742ac Christoph Hellwig   2019-10-17  1189  		return error;
598ecfbaa742ac Christoph Hellwig   2019-10-17  1190  	}
598ecfbaa742ac Christoph Hellwig   2019-10-17  1191  =

598ecfbaa742ac Christoph Hellwig   2019-10-17  1192  	submit_bio(ioend->io_=
bio);
598ecfbaa742ac Christoph Hellwig   2019-10-17  1193  	return 0;
598ecfbaa742ac Christoph Hellwig   2019-10-17  1194  }
598ecfbaa742ac Christoph Hellwig   2019-10-17  1195  =


:::::: The code at line 1175 was first introduced by commit
:::::: 598ecfbaa742aca0dcdbbea25681406f95cc0b63 iomap: lift the xfs writeba=
ck code to iomap

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Darrick J. Wong <darrick.wong@oracle.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6255501981660328354==--

