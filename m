Content-Type: multipart/mixed; boundary="===============5441453481142828389=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 192/396] fs/xfs/xfs_swapext_item.c:56:5-24: atomic_dec_and_test variation before object free at line 57.
Date: Wed, 13 Apr 2022 15:46:58 +0800
Message-ID: <202204131524.M9rRVHoK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5441453481142828389==
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
head:   bd756ef7af68274b79308166ee64949d288be861
commit: a15a0bd61ce19d35585a45930a3ab5a84256bf3e [192/396] xfs: introduce a=
 swap-extent log intent item
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: i386-randconfig-c021 (https://download.01.org/0day-ci/archive/20220=
413/202204131524.M9rRVHoK-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_swapext_item.c:56:5-24: atomic_dec_and_test variation before =
object free at line 57.

vim +56 fs/xfs/xfs_swapext_item.c

a15a0bd61ce19d Darrick J. Wong 2022-01-06  43  =

a15a0bd61ce19d Darrick J. Wong 2022-01-06  44  /*
a15a0bd61ce19d Darrick J. Wong 2022-01-06  45   * Freeing the SXI requires =
that we remove it from the AIL if it has already
a15a0bd61ce19d Darrick J. Wong 2022-01-06  46   * been placed there. Howeve=
r, the SXI may not yet have been placed in the AIL
a15a0bd61ce19d Darrick J. Wong 2022-01-06  47   * when called by xfs_sxi_re=
lease() from SXD processing due to the ordering of
a15a0bd61ce19d Darrick J. Wong 2022-01-06  48   * committed vs unpin operat=
ions in bulk insert operations. Hence the reference
a15a0bd61ce19d Darrick J. Wong 2022-01-06  49   * count to ensure only the =
last caller frees the SXI.
a15a0bd61ce19d Darrick J. Wong 2022-01-06  50   */
a15a0bd61ce19d Darrick J. Wong 2022-01-06  51  STATIC void
a15a0bd61ce19d Darrick J. Wong 2022-01-06  52  xfs_sxi_release(
a15a0bd61ce19d Darrick J. Wong 2022-01-06  53  	struct xfs_sxi_log_item	*sx=
i_lip)
a15a0bd61ce19d Darrick J. Wong 2022-01-06  54  {
a15a0bd61ce19d Darrick J. Wong 2022-01-06  55  	ASSERT(atomic_read(&sxi_lip=
->sxi_refcount) > 0);
a15a0bd61ce19d Darrick J. Wong 2022-01-06 @56  	if (atomic_dec_and_test(&sx=
i_lip->sxi_refcount)) {
a15a0bd61ce19d Darrick J. Wong 2022-01-06 @57  		xfs_trans_ail_delete(&sxi_=
lip->sxi_item, SHUTDOWN_LOG_IO_ERROR);
a15a0bd61ce19d Darrick J. Wong 2022-01-06  58  		xfs_sxi_item_free(sxi_lip);
a15a0bd61ce19d Darrick J. Wong 2022-01-06  59  	}
a15a0bd61ce19d Darrick J. Wong 2022-01-06  60  }
a15a0bd61ce19d Darrick J. Wong 2022-01-06  61  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5441453481142828389==--

