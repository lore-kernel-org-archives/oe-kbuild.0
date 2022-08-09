Content-Type: multipart/mixed; boundary="===============7851918717752529016=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 227/436] fs/xfs/xfs_swapext_item.c:57:5-24: atomic_dec_and_test variation before object free at line 58.
Date: Tue, 09 Aug 2022 23:23:15 +0800
Message-ID: <202208092311.7SOuIkrv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7851918717752529016==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t vectorized-scrub
head:   86a823e6ac8710f71c368b395e2909bc1edcb1f0
commit: 3173276296f9c72840979c139377cf74423e68f7 [227/436] xfs: introduce a=
 swap-extent log intent item
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-c034-20220808 (https://download.01.org/0day-ci/arch=
ive/20220809/202208092311.7SOuIkrv-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_swapext_item.c:57:5-24: atomic_dec_and_test variation before =
object free at line 58.

vim +57 fs/xfs/xfs_swapext_item.c

3173276296f9c7 Darrick J. Wong 2022-07-14  44  =

3173276296f9c7 Darrick J. Wong 2022-07-14  45  /*
3173276296f9c7 Darrick J. Wong 2022-07-14  46   * Freeing the SXI requires =
that we remove it from the AIL if it has already
3173276296f9c7 Darrick J. Wong 2022-07-14  47   * been placed there. Howeve=
r, the SXI may not yet have been placed in the AIL
3173276296f9c7 Darrick J. Wong 2022-07-14  48   * when called by xfs_sxi_re=
lease() from SXD processing due to the ordering of
3173276296f9c7 Darrick J. Wong 2022-07-14  49   * committed vs unpin operat=
ions in bulk insert operations. Hence the reference
3173276296f9c7 Darrick J. Wong 2022-07-14  50   * count to ensure only the =
last caller frees the SXI.
3173276296f9c7 Darrick J. Wong 2022-07-14  51   */
3173276296f9c7 Darrick J. Wong 2022-07-14  52  STATIC void
3173276296f9c7 Darrick J. Wong 2022-07-14  53  xfs_sxi_release(
3173276296f9c7 Darrick J. Wong 2022-07-14  54  	struct xfs_sxi_log_item	*sx=
i_lip)
3173276296f9c7 Darrick J. Wong 2022-07-14  55  {
3173276296f9c7 Darrick J. Wong 2022-07-14  56  	ASSERT(atomic_read(&sxi_lip=
->sxi_refcount) > 0);
3173276296f9c7 Darrick J. Wong 2022-07-14 @57  	if (atomic_dec_and_test(&sx=
i_lip->sxi_refcount)) {
3173276296f9c7 Darrick J. Wong 2022-07-14 @58  		xfs_trans_ail_delete(&sxi_=
lip->sxi_item, SHUTDOWN_LOG_IO_ERROR);
3173276296f9c7 Darrick J. Wong 2022-07-14  59  		xfs_sxi_item_free(sxi_lip);
3173276296f9c7 Darrick J. Wong 2022-07-14  60  	}
3173276296f9c7 Darrick J. Wong 2022-07-14  61  }
3173276296f9c7 Darrick J. Wong 2022-07-14  62  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7851918717752529016==--

