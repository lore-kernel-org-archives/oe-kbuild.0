Content-Type: multipart/mixed; boundary="===============8669953278095496948=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 197/401] fs/xfs/xfs_swapext_item.c:57:5-24: atomic_dec_and_test variation before object free at line 58.
Date: Sun, 05 Jun 2022 00:02:12 +0800
Message-ID: <202206042303.ymfzISTL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8669953278095496948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: linux-kernel(a)vger.kernel.org
TO: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t vectorized-scrub
head:   1fcd9cea011a657d62ee332d161966c1ec92ffd5
commit: 49ba680a22785544d4121997e21d63e3c4a832c5 [197/401] xfs: introduce a=
 swap-extent log intent item
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
604/202206042303.ymfzISTL-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_swapext_item.c:57:5-24: atomic_dec_and_test variation before =
object free at line 58.

vim +57 fs/xfs/xfs_swapext_item.c

49ba680a227855 Darrick J. Wong 2022-01-06  44  =

49ba680a227855 Darrick J. Wong 2022-01-06  45  /*
49ba680a227855 Darrick J. Wong 2022-01-06  46   * Freeing the SXI requires =
that we remove it from the AIL if it has already
49ba680a227855 Darrick J. Wong 2022-01-06  47   * been placed there. Howeve=
r, the SXI may not yet have been placed in the AIL
49ba680a227855 Darrick J. Wong 2022-01-06  48   * when called by xfs_sxi_re=
lease() from SXD processing due to the ordering of
49ba680a227855 Darrick J. Wong 2022-01-06  49   * committed vs unpin operat=
ions in bulk insert operations. Hence the reference
49ba680a227855 Darrick J. Wong 2022-01-06  50   * count to ensure only the =
last caller frees the SXI.
49ba680a227855 Darrick J. Wong 2022-01-06  51   */
49ba680a227855 Darrick J. Wong 2022-01-06  52  STATIC void
49ba680a227855 Darrick J. Wong 2022-01-06  53  xfs_sxi_release(
49ba680a227855 Darrick J. Wong 2022-01-06  54  	struct xfs_sxi_log_item	*sx=
i_lip)
49ba680a227855 Darrick J. Wong 2022-01-06  55  {
49ba680a227855 Darrick J. Wong 2022-01-06  56  	ASSERT(atomic_read(&sxi_lip=
->sxi_refcount) > 0);
49ba680a227855 Darrick J. Wong 2022-01-06 @57  	if (atomic_dec_and_test(&sx=
i_lip->sxi_refcount)) {
49ba680a227855 Darrick J. Wong 2022-01-06 @58  		xfs_trans_ail_delete(&sxi_=
lip->sxi_item, SHUTDOWN_LOG_IO_ERROR);
49ba680a227855 Darrick J. Wong 2022-01-06  59  		xfs_sxi_item_free(sxi_lip);
49ba680a227855 Darrick J. Wong 2022-01-06  60  	}
49ba680a227855 Darrick J. Wong 2022-01-06  61  }
49ba680a227855 Darrick J. Wong 2022-01-06  62  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8669953278095496948==--

