Content-Type: multipart/mixed; boundary="===============5963817572719700987=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 295/339] fs/xfs/xfs_reflink.c:169 xfs_reflink_find_shared() warn: variable dereferenced before check 'agbp' (see line 161)
Date: Fri, 26 Nov 2021 04:40:01 +0800
Message-ID: <202111260402.tSONRvED-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5963817572719700987==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: linux-kernel(a)vger.kernel.org
TO: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t vectorized-scrub
head:   6ae796646175258770822ebb4b83b6657f88bc55
commit: fbfc85d7ac10b107405f2fbe4b1f1967e9abba10 [295/339] xfs: wire up rea=
ltime refcount btree cursors
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-m021-20211124 (https://download.01.org/0day-ci/arch=
ive/20211126/202111260402.tSONRvED-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/xfs/xfs_reflink.c:169 xfs_reflink_find_shared() warn: variable dereferen=
ced before check 'agbp' (see line 161)

Old smatch warnings:
fs/xfs/xfs_reflink.c:652 xfs_reflink_end_cow_extent() warn: missing error c=
ode 'error'

vim +/agbp +169 fs/xfs/xfs_reflink.c

3993baeb3c52f49 Darrick J. Wong 2016-10-03   34  =

3993baeb3c52f49 Darrick J. Wong 2016-10-03   35  /*
3993baeb3c52f49 Darrick J. Wong 2016-10-03   36   * Copy on Write of Shared=
 Blocks
3993baeb3c52f49 Darrick J. Wong 2016-10-03   37   *
3993baeb3c52f49 Darrick J. Wong 2016-10-03   38   * XFS must preserve "the =
usual" file semantics even when two files share
3993baeb3c52f49 Darrick J. Wong 2016-10-03   39   * the same physical block=
s.  This means that a write to one file must not
3993baeb3c52f49 Darrick J. Wong 2016-10-03   40   * alter the blocks in a d=
ifferent file; the way that we'll do that is
3993baeb3c52f49 Darrick J. Wong 2016-10-03   41   * through the use of a co=
py-on-write mechanism.  At a high level, that
3993baeb3c52f49 Darrick J. Wong 2016-10-03   42   * means that when we want=
 to write to a shared block, we allocate a new
3993baeb3c52f49 Darrick J. Wong 2016-10-03   43   * block, write the data t=
o the new block, and if that succeeds we map the
3993baeb3c52f49 Darrick J. Wong 2016-10-03   44   * new block into the file.
3993baeb3c52f49 Darrick J. Wong 2016-10-03   45   *
3993baeb3c52f49 Darrick J. Wong 2016-10-03   46   * XFS provides a "delayed=
 allocation" mechanism that defers the allocation
3993baeb3c52f49 Darrick J. Wong 2016-10-03   47   * of disk blocks to dirty=
-but-not-yet-mapped file blocks as long as
3993baeb3c52f49 Darrick J. Wong 2016-10-03   48   * possible.  This reduces=
 fragmentation by enabling the filesystem to ask
3993baeb3c52f49 Darrick J. Wong 2016-10-03   49   * for bigger chunks less =
often, which is exactly what we want for CoW.
3993baeb3c52f49 Darrick J. Wong 2016-10-03   50   *
3993baeb3c52f49 Darrick J. Wong 2016-10-03   51   * The delalloc mechanism =
begins when the kernel wants to make a block
3993baeb3c52f49 Darrick J. Wong 2016-10-03   52   * writable (write_begin o=
r page_mkwrite).  If the offset is not mapped, we
3993baeb3c52f49 Darrick J. Wong 2016-10-03   53   * create a delalloc mappi=
ng, which is a regular in-core extent, but without
3993baeb3c52f49 Darrick J. Wong 2016-10-03   54   * a real startblock.  (Fo=
r delalloc mappings, the startblock encodes both
3993baeb3c52f49 Darrick J. Wong 2016-10-03   55   * a flag that this is a d=
elalloc mapping, and a worst-case estimate of how
3993baeb3c52f49 Darrick J. Wong 2016-10-03   56   * many blocks might be re=
quired to put the mapping into the BMBT.)  delalloc
3993baeb3c52f49 Darrick J. Wong 2016-10-03   57   * mappings are a reservat=
ion against the free space in the filesystem;
3993baeb3c52f49 Darrick J. Wong 2016-10-03   58   * adjacent mappings can a=
lso be combined into fewer larger mappings.
3993baeb3c52f49 Darrick J. Wong 2016-10-03   59   *
5eda43000064a69 Darrick J. Wong 2017-02-02   60   * As an optimization, the=
 CoW extent size hint (cowextsz) creates
5eda43000064a69 Darrick J. Wong 2017-02-02   61   * outsized aligned delall=
oc reservations in the hope of landing out of
5eda43000064a69 Darrick J. Wong 2017-02-02   62   * order nearby CoW writes=
 in a single extent on disk, thereby reducing
5eda43000064a69 Darrick J. Wong 2017-02-02   63   * fragmentation and impro=
ving future performance.
5eda43000064a69 Darrick J. Wong 2017-02-02   64   *
5eda43000064a69 Darrick J. Wong 2017-02-02   65   * D: --RRRRRRSSSRRRRRRRR-=
-- (data fork)
5eda43000064a69 Darrick J. Wong 2017-02-02   66   * C: ------DDDDDDD-------=
-- (CoW fork)
5eda43000064a69 Darrick J. Wong 2017-02-02   67   *
3993baeb3c52f49 Darrick J. Wong 2016-10-03   68   * When dirty pages are be=
ing written out (typically in writepage), the
5eda43000064a69 Darrick J. Wong 2017-02-02   69   * delalloc reservations a=
re converted into unwritten mappings by
5eda43000064a69 Darrick J. Wong 2017-02-02   70   * allocating blocks and r=
eplacing the delalloc mapping with real ones.
5eda43000064a69 Darrick J. Wong 2017-02-02   71   * A delalloc mapping can =
be replaced by several unwritten ones if the
5eda43000064a69 Darrick J. Wong 2017-02-02   72   * free space is fragmente=
d.
5eda43000064a69 Darrick J. Wong 2017-02-02   73   *
5eda43000064a69 Darrick J. Wong 2017-02-02   74   * D: --RRRRRRSSSRRRRRRRR-=
--
5eda43000064a69 Darrick J. Wong 2017-02-02   75   * C: ------UUUUUUU-------=
--
3993baeb3c52f49 Darrick J. Wong 2016-10-03   76   *
3993baeb3c52f49 Darrick J. Wong 2016-10-03   77   * We want to adapt the de=
lalloc mechanism for copy-on-write, since the
3993baeb3c52f49 Darrick J. Wong 2016-10-03   78   * write paths are similar=
.  The first two steps (creating the reservation
3993baeb3c52f49 Darrick J. Wong 2016-10-03   79   * and allocating the bloc=
ks) are exactly the same as delalloc except that
3993baeb3c52f49 Darrick J. Wong 2016-10-03   80   * the mappings must be st=
ored in a separate CoW fork because we do not want
3993baeb3c52f49 Darrick J. Wong 2016-10-03   81   * to disturb the mapping =
in the data fork until we're sure that the write
3993baeb3c52f49 Darrick J. Wong 2016-10-03   82   * succeeded.  IO completi=
on in this case is the process of removing the old
3993baeb3c52f49 Darrick J. Wong 2016-10-03   83   * mapping from the data f=
ork and moving the new mapping from the CoW fork to
3993baeb3c52f49 Darrick J. Wong 2016-10-03   84   * the data fork.  This wi=
ll be discussed shortly.
3993baeb3c52f49 Darrick J. Wong 2016-10-03   85   *
3993baeb3c52f49 Darrick J. Wong 2016-10-03   86   * For now, unaligned dire=
ctio writes will be bounced back to the page cache.
3993baeb3c52f49 Darrick J. Wong 2016-10-03   87   * Block-aligned directio =
writes will use the same mechanism as buffered
3993baeb3c52f49 Darrick J. Wong 2016-10-03   88   * writes.
3993baeb3c52f49 Darrick J. Wong 2016-10-03   89   *
5eda43000064a69 Darrick J. Wong 2017-02-02   90   * Just prior to submittin=
g the actual disk write requests, we convert
5eda43000064a69 Darrick J. Wong 2017-02-02   91   * the extents representin=
g the range of the file actually being written
5eda43000064a69 Darrick J. Wong 2017-02-02   92   * (as opposed to extra pi=
eces created for the cowextsize hint) to real
5eda43000064a69 Darrick J. Wong 2017-02-02   93   * extents.  This will bec=
ome important in the next step:
5eda43000064a69 Darrick J. Wong 2017-02-02   94   *
5eda43000064a69 Darrick J. Wong 2017-02-02   95   * D: --RRRRRRSSSRRRRRRRR-=
--
5eda43000064a69 Darrick J. Wong 2017-02-02   96   * C: ------UUrrUUU-------=
--
5eda43000064a69 Darrick J. Wong 2017-02-02   97   *
3993baeb3c52f49 Darrick J. Wong 2016-10-03   98   * CoW remapping must be d=
one after the data block write completes,
3993baeb3c52f49 Darrick J. Wong 2016-10-03   99   * because we don't want t=
o destroy the old data fork map until we're sure
3993baeb3c52f49 Darrick J. Wong 2016-10-03  100   * the new block has been =
written.  Since the new mappings are kept in a
3993baeb3c52f49 Darrick J. Wong 2016-10-03  101   * separate fork, we can s=
imply iterate these mappings to find the ones
3993baeb3c52f49 Darrick J. Wong 2016-10-03  102   * that cover the file blo=
cks that we just CoW'd.  For each extent, simply
3993baeb3c52f49 Darrick J. Wong 2016-10-03  103   * unmap the corresponding=
 range in the data fork, map the new range into
5eda43000064a69 Darrick J. Wong 2017-02-02  104   * the data fork, and remo=
ve the extent from the CoW fork.  Because of
5eda43000064a69 Darrick J. Wong 2017-02-02  105   * the presence of the cow=
extsize hint, however, we must be careful
5eda43000064a69 Darrick J. Wong 2017-02-02  106   * only to remap the block=
s that we've actually written out --  we must
5eda43000064a69 Darrick J. Wong 2017-02-02  107   * never remap delalloc re=
servations nor CoW staging blocks that have
5eda43000064a69 Darrick J. Wong 2017-02-02  108   * yet to be written.  Thi=
s corresponds exactly to the real extents in
5eda43000064a69 Darrick J. Wong 2017-02-02  109   * the CoW fork:
5eda43000064a69 Darrick J. Wong 2017-02-02  110   *
5eda43000064a69 Darrick J. Wong 2017-02-02  111   * D: --RRRRRRrrSRRRRRRRR-=
--
5eda43000064a69 Darrick J. Wong 2017-02-02  112   * C: ------UU--UUU-------=
--
3993baeb3c52f49 Darrick J. Wong 2016-10-03  113   *
3993baeb3c52f49 Darrick J. Wong 2016-10-03  114   * Since the remapping ope=
ration can be applied to an arbitrary file
3993baeb3c52f49 Darrick J. Wong 2016-10-03  115   * range, we record the ne=
ed for the remap step as a flag in the ioend
3993baeb3c52f49 Darrick J. Wong 2016-10-03  116   * instead of declaring a =
new IO type.  This is required for direct io
3993baeb3c52f49 Darrick J. Wong 2016-10-03  117   * because we only have io=
end for the whole dio, and we have to be able to
3993baeb3c52f49 Darrick J. Wong 2016-10-03  118   * remember the presence o=
f unwritten blocks and CoW blocks with a single
3993baeb3c52f49 Darrick J. Wong 2016-10-03  119   * ioend structure.  Bette=
r yet, the more ground we can cover with one
3993baeb3c52f49 Darrick J. Wong 2016-10-03  120   * ioend, the better.
3993baeb3c52f49 Darrick J. Wong 2016-10-03  121   */
2a06705cd595403 Darrick J. Wong 2016-10-03  122  =

2a06705cd595403 Darrick J. Wong 2016-10-03  123  /*
48baf97f741d909 Darrick J. Wong 2021-09-01  124   * Given an AG extent, fin=
d the lowest-numbered run of shared blocks within
48baf97f741d909 Darrick J. Wong 2021-09-01  125   * that range and return t=
he range in fbno/flen.  If find_end_of_shared is
48baf97f741d909 Darrick J. Wong 2021-09-01  126   * true, return the longes=
t contiguous extent of shared blocks.  If there are
48baf97f741d909 Darrick J. Wong 2021-09-01  127   * no shared extents, fbno=
 and flen will be set to NULLFSBLOCK and 0,
48baf97f741d909 Darrick J. Wong 2021-09-01  128   * respectively.
2a06705cd595403 Darrick J. Wong 2016-10-03  129   */
48baf97f741d909 Darrick J. Wong 2021-09-01  130  STATIC int
2a06705cd595403 Darrick J. Wong 2016-10-03  131  xfs_reflink_find_shared(
48baf97f741d909 Darrick J. Wong 2021-09-01  132  	struct xfs_inode	*ip,
92ff7285f1df559 Darrick J. Wong 2017-06-16  133  	struct xfs_trans	*tp,
48baf97f741d909 Darrick J. Wong 2021-09-01  134  	struct xfs_bmbt_irec	*ire=
c,
48baf97f741d909 Darrick J. Wong 2021-09-01  135  	xfs_fsblock_t		*fbno,
48baf97f741d909 Darrick J. Wong 2021-09-01  136  	xfs_filblks_t		*flen,
2a06705cd595403 Darrick J. Wong 2016-10-03  137  	bool			find_end_of_shared)
2a06705cd595403 Darrick J. Wong 2016-10-03  138  {
48baf97f741d909 Darrick J. Wong 2021-09-01  139  	struct xfs_mount	*mp =3D =
ip->i_mount;
fbfc85d7ac10b10 Darrick J. Wong 2021-09-01  140  	struct xfs_buf		*agbp =3D=
 NULL;
2a06705cd595403 Darrick J. Wong 2016-10-03  141  	struct xfs_btree_cur	*cur;
48baf97f741d909 Darrick J. Wong 2021-09-01  142  	xfs_agnumber_t		agno;
017e98e665e8f4a Darrick J. Wong 2021-09-01  143  	xfs_fsblock_t		agbno;
017e98e665e8f4a Darrick J. Wong 2021-09-01  144  	xfs_fsblock_t		shared_bno;
017e98e665e8f4a Darrick J. Wong 2021-09-01  145  	xfs_filblks_t		shared_len;
2a06705cd595403 Darrick J. Wong 2016-10-03  146  	int			error;
2a06705cd595403 Darrick J. Wong 2016-10-03  147  =

fbfc85d7ac10b10 Darrick J. Wong 2021-09-01  148  	if (XFS_IS_REALTIME_INODE=
(ip)) {
fbfc85d7ac10b10 Darrick J. Wong 2021-09-01  149  		agno =3D NULLAGNUMBER;
fbfc85d7ac10b10 Darrick J. Wong 2021-09-01  150  		agbno =3D irec->br_start=
block;
fbfc85d7ac10b10 Darrick J. Wong 2021-09-01  151  		xfs_rtlock(NULL, mp, XFS=
_RTLOCK_REFCOUNT);
fbfc85d7ac10b10 Darrick J. Wong 2021-09-01  152  		cur =3D xfs_rtrefcountbt=
_init_cursor(mp, tp, mp->m_rrefcountip);
fbfc85d7ac10b10 Darrick J. Wong 2021-09-01  153  	} else {
48baf97f741d909 Darrick J. Wong 2021-09-01  154  		agno =3D XFS_FSB_TO_AGNO=
(mp, irec->br_startblock);
48baf97f741d909 Darrick J. Wong 2021-09-01  155  		agbno =3D XFS_FSB_TO_AGB=
NO(mp, irec->br_startblock);
48baf97f741d909 Darrick J. Wong 2021-09-01  156  =

92ff7285f1df559 Darrick J. Wong 2017-06-16  157  		error =3D xfs_alloc_read=
_agf(mp, tp, agno, 0, &agbp);
2a06705cd595403 Darrick J. Wong 2016-10-03  158  		if (error)
2a06705cd595403 Darrick J. Wong 2016-10-03  159  			return error;
2a06705cd595403 Darrick J. Wong 2016-10-03  160  =

a81a06211fb43d8 Dave Chinner    2021-06-02 @161  		cur =3D xfs_refcountbt_i=
nit_cursor(mp, tp, agbp, agbp->b_pag);
fbfc85d7ac10b10 Darrick J. Wong 2021-09-01  162  	}
2a06705cd595403 Darrick J. Wong 2016-10-03  163  =

48baf97f741d909 Darrick J. Wong 2021-09-01  164  	error =3D xfs_refcount_fi=
nd_shared(cur, agbno, irec->br_blockcount,
48baf97f741d909 Darrick J. Wong 2021-09-01  165  			&shared_bno, &shared_le=
n, find_end_of_shared);
2a06705cd595403 Darrick J. Wong 2016-10-03  166  =

0b04b6b875b32f2 Darrick J. Wong 2018-07-19  167  	xfs_btree_del_cursor(cur,=
 error);
2a06705cd595403 Darrick J. Wong 2016-10-03  168  =

fbfc85d7ac10b10 Darrick J. Wong 2021-09-01 @169  	if (agbp)
92ff7285f1df559 Darrick J. Wong 2017-06-16  170  		xfs_trans_brelse(tp, agb=
p);
fbfc85d7ac10b10 Darrick J. Wong 2021-09-01  171  	else
fbfc85d7ac10b10 Darrick J. Wong 2021-09-01  172  		xfs_rtunlock(mp, XFS_RTL=
OCK_REFCOUNT);
48baf97f741d909 Darrick J. Wong 2021-09-01  173  =

017e98e665e8f4a Darrick J. Wong 2021-09-01  174  	if (shared_bno =3D=3D NUL=
LFSBLOCK)
48baf97f741d909 Darrick J. Wong 2021-09-01  175  		*fbno =3D NULLFSBLOCK;
fbfc85d7ac10b10 Darrick J. Wong 2021-09-01  176  	else if (XFS_IS_REALTIME_=
INODE(ip))
fbfc85d7ac10b10 Darrick J. Wong 2021-09-01  177  		*fbno =3D shared_bno;
48baf97f741d909 Darrick J. Wong 2021-09-01  178  	else
48baf97f741d909 Darrick J. Wong 2021-09-01  179  		*fbno =3D XFS_AGB_TO_FSB=
(mp, agno, shared_bno);
48baf97f741d909 Darrick J. Wong 2021-09-01  180  	*flen =3D shared_len;
2a06705cd595403 Darrick J. Wong 2016-10-03  181  	return error;
2a06705cd595403 Darrick J. Wong 2016-10-03  182  }
2a06705cd595403 Darrick J. Wong 2016-10-03  183  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5963817572719700987==--

