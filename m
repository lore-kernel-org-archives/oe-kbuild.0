Content-Type: multipart/mixed; boundary="===============2310491041951406400=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [allisonhenderson-xfs-work:delayed_attrs_v26_extended 17/30] fs/xfs/libxfs/xfs_attr.c:666:46: warning: Expression '(X | 0x8) != 0x0' is always true. [comparisonError]
Date: Mon, 24 Jan 2022 15:07:58 +0300
Message-ID: <20220124114626.GK1978@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2310491041951406400==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/allisonhenderson/xfs_work.git  delayed_attrs_v26=
_extended
head:   19459f5cfa422b0a6a9cd3898892e43ecb49f8f3
commit: 721a69ffe0e2561371de01822bef355354eee926 [17/30] xfs: add parent po=
inter support to attribute code
compiler: sparc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> fs/xfs/libxfs/xfs_attr.c:666:46: warning: Expression '(X | 0x8) !=3D 0x0=
' is always true. [comparisonError]
    rsvd =3D ((args->attr_filter & XFS_ATTR_ROOT) | XFS_ATTR_PARENT) !=3D 0;
                                                ^

vim +666 fs/xfs/libxfs/xfs_attr.c

c5b4ac39a4cb6a fs/xfs/xfs_attr.c        Christoph Hellwig 2014-05-13  653  =
int
c5b4ac39a4cb6a fs/xfs/xfs_attr.c        Christoph Hellwig 2014-05-13  654  =
xfs_attr_set(
a25446224353a7 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  655  =
	struct xfs_da_args	*args)
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  656  {
a25446224353a7 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  657  =
	struct xfs_inode	*dp =3D args->dp;
3d3c8b5222b924 fs/xfs/xfs_attr.c        Jie Liu           2013-08-12  658  =
	struct xfs_mount	*mp =3D dp->i_mount;
3d3c8b5222b924 fs/xfs/xfs_attr.c        Jie Liu           2013-08-12  659  =
	struct xfs_trans_res	tres;
721a69ffe0e256 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2021-08-23  660  =
	bool			rsvd;
4c74a56b9de76b fs/xfs/libxfs/xfs_attr.c Allison Henderson 2018-10-18  661  =
	int			error, local;
3a19bb147c72d2 fs/xfs/libxfs/xfs_attr.c Chandan Babu R    2021-01-22  662  =
	int			rmt_blks =3D 0;
0eb81a5f5c3442 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  663  =
	unsigned int		total;
5fad9cb9d34c53 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2022-01-18  664  =
	int			delayed =3D xfs_has_larp(mp);
c5b4ac39a4cb6a fs/xfs/xfs_attr.c        Christoph Hellwig 2014-05-13  665  =

721a69ffe0e256 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2021-08-23 @666  =
	rsvd =3D ((args->attr_filter & XFS_ATTR_ROOT) | XFS_ATTR_PARENT) !=3D 0;

Anything ORed with XFS_ATTR_PARENT can't be zero.  Parentheses in the
wrong location?

	rsvd =3D (args->attr_filter & (XFS_ATTR_ROOT | XFS_ATTR_PARENT)) !=3D 0;

721a69ffe0e256 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2021-08-23  667  =

75c8c50fa16a23 fs/xfs/libxfs/xfs_attr.c Dave Chinner      2021-08-18  668  =
	if (xfs_is_shutdown(dp->i_mount))
2451337dd04390 fs/xfs/libxfs/xfs_attr.c Dave Chinner      2014-06-25  669  =
		return -EIO;
c5b4ac39a4cb6a fs/xfs/xfs_attr.c        Christoph Hellwig 2014-05-13  670  =

0eb81a5f5c3442 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  671  =
	error =3D xfs_qm_dqattach(dp);
0eb81a5f5c3442 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  672  =
	if (error)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org =

_______________________________________________
kbuild mailing list -- kbuild(a)lists.01.org
To unsubscribe send an email to kbuild-leave(a)lists.01.org
--===============2310491041951406400==--

