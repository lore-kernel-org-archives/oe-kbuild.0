Content-Type: multipart/mixed; boundary="===============1571044682780389588=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/netfs/buffered_read.c:337:23: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Mon, 25 Jul 2022 16:58:21 +0000
Message-ID: <202207231946.UCJxWODm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1571044682780389588==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: fs/netfs/=
buffered_read.c:337:23: warning: use of uninitialized value '<unknown>' [CW=
E-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Xiubo Li <xiubli@redhat.com>
CC: Ilya Dryomov <idryomov@gmail.com>
CC: David Howells <dhowells@redhat.com>
CC: Bagas Sanjaya <bagasdotme@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   70664fc10c0d722ec79d746d8ac1db8546c94114
commit: fac47b43c760ea90e64b895dba60df0327be7775 netfs: do not unlock and p=
ut the folio twice
date:   9 days ago
:::::: branch date: 15 hours ago
:::::: commit date: 9 days ago
config: arm-randconfig-c002-20220718 (https://download.01.org/0day-ci/archi=
ve/20220723/202207231946.UCJxWODm-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dfac47b43c760ea90e64b895dba60df0327be7775
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout fac47b43c760ea90e64b895dba60df0327be7775
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   fs/netfs/buffered_read.c: In function 'netfs_write_begin':
>> fs/netfs/buffered_read.c:337:23: warning: use of uninitialized value '<u=
nknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     337 |         struct folio *folio;
         |                       ^~~~~
     'netfs_write_begin': event 1
       |
       |  337 |         struct folio *folio;
       |      |                       ^~~~~
       |      |                       |
       |      |                       (1) use of uninitialized value '<unkn=
own>' here
       |

vim +337 fs/netfs/buffered_read.c

16211268fcb3667 David Howells           2022-03-01  297  =

16211268fcb3667 David Howells           2022-03-01  298  /**
16211268fcb3667 David Howells           2022-03-01  299   * netfs_write_beg=
in - Helper to prepare for writing
e81fb4198e27925 Linus Torvalds          2022-06-09  300   * @ctx: The netfs=
 context
16211268fcb3667 David Howells           2022-03-01  301   * @file: The file=
 to read from
16211268fcb3667 David Howells           2022-03-01  302   * @mapping: The m=
apping to read from
16211268fcb3667 David Howells           2022-03-01  303   * @pos: File posi=
tion at which the write will begin
16211268fcb3667 David Howells           2022-03-01  304   * @len: The lengt=
h of the write (may extend beyond the end of the folio chosen)
16211268fcb3667 David Howells           2022-03-01  305   * @_folio: Where =
to put the resultant folio
16211268fcb3667 David Howells           2022-03-01  306   * @_fsdata: Place=
 for the netfs to store a cookie
16211268fcb3667 David Howells           2022-03-01  307   *
16211268fcb3667 David Howells           2022-03-01  308   * Pre-read data f=
or a write-begin request by drawing data from the cache if
16211268fcb3667 David Howells           2022-03-01  309   * possible, or th=
e netfs if not.  Space beyond the EOF is zero-filled.
16211268fcb3667 David Howells           2022-03-01  310   * Multiple I/O re=
quests from different sources will get munged together.  If
16211268fcb3667 David Howells           2022-03-01  311   * necessary, the =
readahead window can be expanded in either direction to a
16211268fcb3667 David Howells           2022-03-01  312   * more convenient=
 alighment for RPC efficiency or to make storage in the cache
16211268fcb3667 David Howells           2022-03-01  313   * feasible.
16211268fcb3667 David Howells           2022-03-01  314   *
16211268fcb3667 David Howells           2022-03-01  315   * The calling net=
fs must provide a table of operations, only one of which,
16211268fcb3667 David Howells           2022-03-01  316   * issue_op, is ma=
ndatory.
16211268fcb3667 David Howells           2022-03-01  317   *
16211268fcb3667 David Howells           2022-03-01  318   * The check_write=
_begin() operation can be provided to check for and flush
16211268fcb3667 David Howells           2022-03-01  319   * conflicting wri=
tes once the folio is grabbed and locked.  It is passed a
16211268fcb3667 David Howells           2022-03-01  320   * pointer to the =
fsdata cookie that gets returned to the VM to be passed to
16211268fcb3667 David Howells           2022-03-01  321   * write_end.  It =
is permitted to sleep.  It should return 0 if the request
fac47b43c760ea9 Xiubo Li                2022-07-11  322   * should go ahead=
 or it may return an error.  It may also unlock and put the
fac47b43c760ea9 Xiubo Li                2022-07-11  323   * folio, provided=
 it sets ``*foliop`` to NULL, in which case a return of 0
fac47b43c760ea9 Xiubo Li                2022-07-11  324   * will cause the =
folio to be re-got and the process to be retried.
16211268fcb3667 David Howells           2022-03-01  325   *
16211268fcb3667 David Howells           2022-03-01  326   * The calling net=
fs must initialise a netfs context contiguous to the vfs
16211268fcb3667 David Howells           2022-03-01  327   * inode before ca=
lling this.
16211268fcb3667 David Howells           2022-03-01  328   *
16211268fcb3667 David Howells           2022-03-01  329   * This is usable =
whether or not caching is enabled.
16211268fcb3667 David Howells           2022-03-01  330   */
e81fb4198e27925 Linus Torvalds          2022-06-09  331  int netfs_write_be=
gin(struct netfs_inode *ctx,
e81fb4198e27925 Linus Torvalds          2022-06-09  332  		      struct fil=
e *file, struct address_space *mapping,
de2a93115017795 Matthew Wilcox (Oracle  2022-02-22  333) 		      loff_t pos=
, unsigned int len, struct folio **_folio,
de2a93115017795 Matthew Wilcox (Oracle  2022-02-22  334) 		      void **_fs=
data)
16211268fcb3667 David Howells           2022-03-01  335  {
16211268fcb3667 David Howells           2022-03-01  336  	struct netfs_io_r=
equest *rreq;
16211268fcb3667 David Howells           2022-03-01 @337  	struct folio *fol=
io;

:::::: The code at line 337 was first introduced by commit
:::::: 16211268fcb36672a84359362c2fc2c4695b0fc4 netfs: Split fs/netfs/read_=
helper.c

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1571044682780389588==--

