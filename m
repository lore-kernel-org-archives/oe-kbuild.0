Content-Type: multipart/mixed; boundary="===============6602344387702827727=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [allisonhenderson-xfs-work:delayed_attrs_v26_extended 17/30] fs/xfs/libxfs/xfs_attr.c:666:46: warning: Expression '(X | 0x8) != 0x0' is always true. [comparisonError]
Date: Mon, 24 Jan 2022 18:29:29 +0800
Message-ID: <202201241821.HlPRfDgp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6602344387702827727==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Allison Henderson <allison.henderson@oracle.com>
CC: Mark Tinguely <tinguely@sgi.com>
CC: Dave Chinner <dchinner@redhat.com>

tree:   https://github.com/allisonhenderson/xfs_work.git delayed_attrs_v26_=
extended
head:   19459f5cfa422b0a6a9cd3898892e43ecb49f8f3
commit: 721a69ffe0e2561371de01822bef355354eee926 [17/30] xfs: add parent po=
inter support to attribute code
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
compiler: sparc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> fs/xfs/libxfs/xfs_attr.c:666:46: warning: Expression '(X | 0x8) !=3D 0x0=
' is always true. [comparisonError]
    rsvd =3D ((args->attr_filter & XFS_ATTR_ROOT) | XFS_ATTR_PARENT) !=3D 0;
                                                ^

vim +666 fs/xfs/libxfs/xfs_attr.c

07120f1abdff80 fs/xfs/libxfs/xfs_attr.c Allison Collins   2020-07-20  648  =

0eb81a5f5c3442 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  649  =
/*
a25446224353a7 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  650  =
 * Note: If args->value is NULL the attribute will be removed, just like the
0eb81a5f5c3442 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  651  =
 * Linux ->setattr API.
0eb81a5f5c3442 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  652  =
 */
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
0eb81a5f5c3442 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  673  =
		return error;
0eb81a5f5c3442 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  674  =

a25446224353a7 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  675  =
	args->geo =3D mp->m_attr_geo;
a25446224353a7 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  676  =
	args->whichfork =3D XFS_ATTR_FORK;
a25446224353a7 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  677  =
	args->hashval =3D xfs_da_hashname(args->name, args->namelen);
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  678  =

0eb81a5f5c3442 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  679  =
	/*
0eb81a5f5c3442 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  680  =
	 * We have no control over the attribute names that userspace passes us
0eb81a5f5c3442 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  681  =
	 * to remove, so we have to allow the name lookup prior to attribute
0eb81a5f5c3442 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  682  =
	 * removal to fail as well.
0eb81a5f5c3442 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  683  =
	 */
a25446224353a7 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  684  =
	args->op_flags =3D XFS_DA_OP_OKNOENT;
0eb81a5f5c3442 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  685  =

a25446224353a7 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  686  =
	if (args->value) {
0eb81a5f5c3442 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  687  =
		XFS_STATS_INC(mp, xs_attr_set);
0eb81a5f5c3442 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  688  =

a25446224353a7 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  689  =
		args->op_flags |=3D XFS_DA_OP_ADDNAME;
a25446224353a7 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  690  =
		args->total =3D xfs_attr_calc_size(args, &local);
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  691  =

^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  692  =
		/*
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  693  =
		 * If the inode doesn't have an attribute fork, add one.
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  694  =
		 * (inode must not be locked when we call this routine)
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  695  =
		 */
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  696  =
		if (XFS_IFORK_Q(dp) =3D=3D 0) {
0eb81a5f5c3442 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  697  =
			int sf_size =3D sizeof(struct xfs_attr_sf_hdr) +
e01b7eed5d0a9b fs/xfs/libxfs/xfs_attr.c Carlos Maiolino   2020-09-07  698  =
				xfs_attr_sf_entsize_byname(args->namelen,
a25446224353a7 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  699  =
						args->valuelen);
e5889e90dda328 fs/xfs/xfs_attr.c        Barry Naujok      2007-02-10  700  =

c5b4ac39a4cb6a fs/xfs/xfs_attr.c        Christoph Hellwig 2014-05-13  701  =
			error =3D xfs_bmap_add_attrfork(dp, sf_size, rsvd);
c5b4ac39a4cb6a fs/xfs/xfs_attr.c        Christoph Hellwig 2014-05-13  702  =
			if (error)
c5b4ac39a4cb6a fs/xfs/xfs_attr.c        Christoph Hellwig 2014-05-13  703  =
				return error;
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  704  =
		}
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  705  =

253f4911f297b8 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2016-04-06  706  =
		tres.tr_logres =3D M_RES(mp)->tr_attrsetm.tr_logres +
a25446224353a7 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  707  =
				 M_RES(mp)->tr_attrsetrt.tr_logres *
a25446224353a7 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  708  =
					args->total;
253f4911f297b8 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2016-04-06  709  =
		tres.tr_logcount =3D XFS_ATTRSET_LOG_COUNT;
253f4911f297b8 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2016-04-06  710  =
		tres.tr_logflags =3D XFS_TRANS_PERM_LOG_RES;
a25446224353a7 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  711  =
		total =3D args->total;
3a19bb147c72d2 fs/xfs/libxfs/xfs_attr.c Chandan Babu R    2021-01-22  712  =

3a19bb147c72d2 fs/xfs/libxfs/xfs_attr.c Chandan Babu R    2021-01-22  713  =
		if (!local)
3a19bb147c72d2 fs/xfs/libxfs/xfs_attr.c Chandan Babu R    2021-01-22  714  =
			rmt_blks =3D xfs_attr3_rmt_blocks(mp, args->valuelen);
0eb81a5f5c3442 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  715  =
	} else {
0eb81a5f5c3442 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  716  =
		XFS_STATS_INC(mp, xs_attr_remove);
0eb81a5f5c3442 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  717  =

0eb81a5f5c3442 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  718  =
		tres =3D M_RES(mp)->tr_attrrm;
0eb81a5f5c3442 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  719  =
		total =3D XFS_ATTRRM_SPACE_RES(mp);
3a19bb147c72d2 fs/xfs/libxfs/xfs_attr.c Chandan Babu R    2021-01-22  720  =
		rmt_blks =3D xfs_attr3_rmt_blocks(mp, XFS_XATTR_SIZE_MAX);
0eb81a5f5c3442 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  721  =
	}
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  722  =

5fad9cb9d34c53 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2022-01-18  723  =
	if (delayed) {
5fad9cb9d34c53 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2022-01-18  724  =
		error =3D xfs_attr_use_log_assist(mp);
5fad9cb9d34c53 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2022-01-18  725  =
		if (error)
5fad9cb9d34c53 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2022-01-18  726  =
			return error;
5fad9cb9d34c53 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2022-01-18  727  =
	}
5fad9cb9d34c53 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2022-01-18  728  =

^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  729  =
	/*
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  730  =
	 * Root fork attributes can use reserved data blocks for this
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  731  =
	 * operation if necessary
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  732  =
	 */
3de4eb106fcc97 fs/xfs/libxfs/xfs_attr.c Darrick J. Wong   2021-01-26  733  =
	error =3D xfs_trans_alloc_inode(dp, &tres, total, 0, rsvd, &args->trans);
253f4911f297b8 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2016-04-06  734  =
	if (error)
5fad9cb9d34c53 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2022-01-18  735  =
		goto drop_incompat;
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  736  =

3a19bb147c72d2 fs/xfs/libxfs/xfs_attr.c Chandan Babu R    2021-01-22  737  =
	if (args->value || xfs_inode_hasattr(dp)) {
3a19bb147c72d2 fs/xfs/libxfs/xfs_attr.c Chandan Babu R    2021-01-22  738  =
		error =3D xfs_iext_count_may_overflow(dp, XFS_ATTR_FORK,
3a19bb147c72d2 fs/xfs/libxfs/xfs_attr.c Chandan Babu R    2021-01-22  739  =
				XFS_IEXT_ATTR_MANIP_CNT(rmt_blks));
3a19bb147c72d2 fs/xfs/libxfs/xfs_attr.c Chandan Babu R    2021-01-22  740  =
		if (error)
3a19bb147c72d2 fs/xfs/libxfs/xfs_attr.c Chandan Babu R    2021-01-22  741  =
			goto out_trans_cancel;
3a19bb147c72d2 fs/xfs/libxfs/xfs_attr.c Chandan Babu R    2021-01-22  742  =
	}
3a19bb147c72d2 fs/xfs/libxfs/xfs_attr.c Chandan Babu R    2021-01-22  743  =

51b495eba84dee fs/xfs/libxfs/xfs_attr.c Dave Chinner      2021-08-18  744  =
	error =3D xfs_attr_lookup(args);
a25446224353a7 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  745  =
	if (args->value) {
deed9512872d09 fs/xfs/libxfs/xfs_attr.c Allison Collins   2020-07-20  746  =
		if (error =3D=3D -EEXIST && (args->attr_flags & XATTR_CREATE))
deed9512872d09 fs/xfs/libxfs/xfs_attr.c Allison Collins   2020-07-20  747  =
			goto out_trans_cancel;
deed9512872d09 fs/xfs/libxfs/xfs_attr.c Allison Collins   2020-07-20  748  =
		if (error =3D=3D -ENOATTR && (args->attr_flags & XATTR_REPLACE))
deed9512872d09 fs/xfs/libxfs/xfs_attr.c Allison Collins   2020-07-20  749  =
			goto out_trans_cancel;
deed9512872d09 fs/xfs/libxfs/xfs_attr.c Allison Collins   2020-07-20  750  =
		if (error !=3D -ENOATTR && error !=3D -EEXIST)
deed9512872d09 fs/xfs/libxfs/xfs_attr.c Allison Collins   2020-07-20  751  =
			goto out_trans_cancel;
deed9512872d09 fs/xfs/libxfs/xfs_attr.c Allison Collins   2020-07-20  752  =

5fad9cb9d34c53 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2022-01-18  753  =
		error =3D xfs_attr_set_deferred(args);
322ff6b8cd54fe fs/xfs/xfs_attr.c        Niv Sardi         2008-08-13  754  =
		if (error)
710d707d2fa9cf fs/xfs/libxfs/xfs_attr.c Darrick J. Wong   2019-04-24  755  =
			goto out_trans_cancel;
5fad9cb9d34c53 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2022-01-18  756  =

2f3cd809196381 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2018-10-18  757  =
		/* shortform attribute has already been committed */
a25446224353a7 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  758  =
		if (!args->trans)
2f3cd809196381 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2018-10-18  759  =
			goto out_unlock;
0eb81a5f5c3442 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  760  =
	} else {
deed9512872d09 fs/xfs/libxfs/xfs_attr.c Allison Collins   2020-07-20  761  =
		if (error !=3D -EEXIST)
deed9512872d09 fs/xfs/libxfs/xfs_attr.c Allison Collins   2020-07-20  762  =
			goto out_trans_cancel;
deed9512872d09 fs/xfs/libxfs/xfs_attr.c Allison Collins   2020-07-20  763  =

5fad9cb9d34c53 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2022-01-18  764  =
		error =3D xfs_attr_remove_deferred(args);
0eb81a5f5c3442 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  765  =
		if (error)
0eb81a5f5c3442 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  766  =
			goto out_trans_cancel;
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  767  =
	}
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  768  =

^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  769  =
	/*
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  770  =
	 * If this is a synchronous mount, make sure that the
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  771  =
	 * transaction goes to disk before returning to the user.
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  772  =
	 */
0560f31a09e523 fs/xfs/libxfs/xfs_attr.c Dave Chinner      2021-08-18  773  =
	if (xfs_has_wsync(mp))
a25446224353a7 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  774  =
		xfs_trans_set_sync(args->trans);
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  775  =

1d733019940040 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  776  =
	if (!(args->op_flags & XFS_DA_OP_NOTIME))
a25446224353a7 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  777  =
		xfs_trans_ichgtime(args->trans, dp, XFS_ICHGTIME_CHG);
dcd79a1423f64e fs/xfs/xfs_attr.c        Dave Chinner      2010-09-28  778  =

^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  779  =
	/*
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  780  =
	 * Commit the last in the sequence of transactions.
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  781  =
	 */
a25446224353a7 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  782  =
	xfs_trans_log_inode(args->trans, dp, XFS_ILOG_CORE);
a25446224353a7 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  783  =
	error =3D xfs_trans_commit(args->trans);
2f3cd809196381 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2018-10-18  784  =
out_unlock:
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  785  =
	xfs_iunlock(dp, XFS_ILOCK_EXCL);
5fad9cb9d34c53 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2022-01-18  786  =
drop_incompat:
5fad9cb9d34c53 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2022-01-18  787  =
	if (delayed)
5fad9cb9d34c53 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2022-01-18  788  =
		xlog_drop_incompat_feat(mp->m_log);
c5b4ac39a4cb6a fs/xfs/xfs_attr.c        Christoph Hellwig 2014-05-13  789  =
	return error;
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  790  =

2f3cd809196381 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2018-10-18  791  =
out_trans_cancel:
a25446224353a7 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  792  =
	if (args->trans)
a25446224353a7 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2020-02-26  793  =
		xfs_trans_cancel(args->trans);
2f3cd809196381 fs/xfs/libxfs/xfs_attr.c Allison Henderson 2018-10-18  794  =
	goto out_unlock;
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  795  }
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  796  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6602344387702827727==--

