Content-Type: multipart/mixed; boundary="===============5593952177250470814=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 302/346] fs/xfs/xfs_reflink.c:169 xfs_reflink_find_shared() warn: variable dereferenced before check 'agbp' (see line 161)
Date: Mon, 31 Jan 2022 13:06:47 +0800
Message-ID: <202201311225.ZjUHSOKj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5593952177250470814==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: linux-kernel(a)vger.kernel.org
TO: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t vectorized-scrub
head:   81e1a6295557a8263b17d815d60dbcbcd09faa08
commit: ac6bf33df99f93b2ba32a9fd75b1081e8fdc13df [302/346] xfs: wire up rea=
ltime refcount btree cursors
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: nios2-randconfig-m031-20220131 (https://download.01.org/0day-ci/arc=
hive/20220131/202201311225.ZjUHSOKj-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/xfs/xfs_reflink.c:169 xfs_reflink_find_shared() warn: variable dereferen=
ced before check 'agbp' (see line 161)

Old smatch warnings:
fs/xfs/xfs_reflink.c:652 xfs_reflink_end_cow_extent() warn: missing error c=
ode 'error'
arch/nios2/include/asm/thread_info.h:71 current_thread_info() error: uninit=
ialized symbol 'sp'.

vim +/agbp +169 fs/xfs/xfs_reflink.c

3993baeb3c52f4 Darrick J. Wong 2016-10-03   34  =

3993baeb3c52f4 Darrick J. Wong 2016-10-03   35  /*
3993baeb3c52f4 Darrick J. Wong 2016-10-03   36   * Copy on Write of Shared =
Blocks
3993baeb3c52f4 Darrick J. Wong 2016-10-03   37   *
3993baeb3c52f4 Darrick J. Wong 2016-10-03   38   * XFS must preserve "the u=
sual" file semantics even when two files share
3993baeb3c52f4 Darrick J. Wong 2016-10-03   39   * the same physical blocks=
.  This means that a write to one file must not
3993baeb3c52f4 Darrick J. Wong 2016-10-03   40   * alter the blocks in a di=
fferent file; the way that we'll do that is
3993baeb3c52f4 Darrick J. Wong 2016-10-03   41   * through the use of a cop=
y-on-write mechanism.  At a high level, that
3993baeb3c52f4 Darrick J. Wong 2016-10-03   42   * means that when we want =
to write to a shared block, we allocate a new
3993baeb3c52f4 Darrick J. Wong 2016-10-03   43   * block, write the data to=
 the new block, and if that succeeds we map the
3993baeb3c52f4 Darrick J. Wong 2016-10-03   44   * new block into the file.
3993baeb3c52f4 Darrick J. Wong 2016-10-03   45   *
3993baeb3c52f4 Darrick J. Wong 2016-10-03   46   * XFS provides a "delayed =
allocation" mechanism that defers the allocation
3993baeb3c52f4 Darrick J. Wong 2016-10-03   47   * of disk blocks to dirty-=
but-not-yet-mapped file blocks as long as
3993baeb3c52f4 Darrick J. Wong 2016-10-03   48   * possible.  This reduces =
fragmentation by enabling the filesystem to ask
3993baeb3c52f4 Darrick J. Wong 2016-10-03   49   * for bigger chunks less o=
ften, which is exactly what we want for CoW.
3993baeb3c52f4 Darrick J. Wong 2016-10-03   50   *
3993baeb3c52f4 Darrick J. Wong 2016-10-03   51   * The delalloc mechanism b=
egins when the kernel wants to make a block
3993baeb3c52f4 Darrick J. Wong 2016-10-03   52   * writable (write_begin or=
 page_mkwrite).  If the offset is not mapped, we
3993baeb3c52f4 Darrick J. Wong 2016-10-03   53   * create a delalloc mappin=
g, which is a regular in-core extent, but without
3993baeb3c52f4 Darrick J. Wong 2016-10-03   54   * a real startblock.  (For=
 delalloc mappings, the startblock encodes both
3993baeb3c52f4 Darrick J. Wong 2016-10-03   55   * a flag that this is a de=
lalloc mapping, and a worst-case estimate of how
3993baeb3c52f4 Darrick J. Wong 2016-10-03   56   * many blocks might be req=
uired to put the mapping into the BMBT.)  delalloc
3993baeb3c52f4 Darrick J. Wong 2016-10-03   57   * mappings are a reservati=
on against the free space in the filesystem;
3993baeb3c52f4 Darrick J. Wong 2016-10-03   58   * adjacent mappings can al=
so be combined into fewer larger mappings.
3993baeb3c52f4 Darrick J. Wong 2016-10-03   59   *
5eda43000064a6 Darrick J. Wong 2017-02-02   60   * As an optimization, the =
CoW extent size hint (cowextsz) creates
5eda43000064a6 Darrick J. Wong 2017-02-02   61   * outsized aligned delallo=
c reservations in the hope of landing out of
5eda43000064a6 Darrick J. Wong 2017-02-02   62   * order nearby CoW writes =
in a single extent on disk, thereby reducing
5eda43000064a6 Darrick J. Wong 2017-02-02   63   * fragmentation and improv=
ing future performance.
5eda43000064a6 Darrick J. Wong 2017-02-02   64   *
5eda43000064a6 Darrick J. Wong 2017-02-02   65   * D: --RRRRRRSSSRRRRRRRR--=
- (data fork)
5eda43000064a6 Darrick J. Wong 2017-02-02   66   * C: ------DDDDDDD--------=
- (CoW fork)
5eda43000064a6 Darrick J. Wong 2017-02-02   67   *
3993baeb3c52f4 Darrick J. Wong 2016-10-03   68   * When dirty pages are bei=
ng written out (typically in writepage), the
5eda43000064a6 Darrick J. Wong 2017-02-02   69   * delalloc reservations ar=
e converted into unwritten mappings by
5eda43000064a6 Darrick J. Wong 2017-02-02   70   * allocating blocks and re=
placing the delalloc mapping with real ones.
5eda43000064a6 Darrick J. Wong 2017-02-02   71   * A delalloc mapping can b=
e replaced by several unwritten ones if the
5eda43000064a6 Darrick J. Wong 2017-02-02   72   * free space is fragmented.
5eda43000064a6 Darrick J. Wong 2017-02-02   73   *
5eda43000064a6 Darrick J. Wong 2017-02-02   74   * D: --RRRRRRSSSRRRRRRRR---
5eda43000064a6 Darrick J. Wong 2017-02-02   75   * C: ------UUUUUUU---------
3993baeb3c52f4 Darrick J. Wong 2016-10-03   76   *
3993baeb3c52f4 Darrick J. Wong 2016-10-03   77   * We want to adapt the del=
alloc mechanism for copy-on-write, since the
3993baeb3c52f4 Darrick J. Wong 2016-10-03   78   * write paths are similar.=
  The first two steps (creating the reservation
3993baeb3c52f4 Darrick J. Wong 2016-10-03   79   * and allocating the block=
s) are exactly the same as delalloc except that
3993baeb3c52f4 Darrick J. Wong 2016-10-03   80   * the mappings must be sto=
red in a separate CoW fork because we do not want
3993baeb3c52f4 Darrick J. Wong 2016-10-03   81   * to disturb the mapping i=
n the data fork until we're sure that the write
3993baeb3c52f4 Darrick J. Wong 2016-10-03   82   * succeeded.  IO completio=
n in this case is the process of removing the old
3993baeb3c52f4 Darrick J. Wong 2016-10-03   83   * mapping from the data fo=
rk and moving the new mapping from the CoW fork to
3993baeb3c52f4 Darrick J. Wong 2016-10-03   84   * the data fork.  This wil=
l be discussed shortly.
3993baeb3c52f4 Darrick J. Wong 2016-10-03   85   *
3993baeb3c52f4 Darrick J. Wong 2016-10-03   86   * For now, unaligned direc=
tio writes will be bounced back to the page cache.
3993baeb3c52f4 Darrick J. Wong 2016-10-03   87   * Block-aligned directio w=
rites will use the same mechanism as buffered
3993baeb3c52f4 Darrick J. Wong 2016-10-03   88   * writes.
3993baeb3c52f4 Darrick J. Wong 2016-10-03   89   *
5eda43000064a6 Darrick J. Wong 2017-02-02   90   * Just prior to submitting=
 the actual disk write requests, we convert
5eda43000064a6 Darrick J. Wong 2017-02-02   91   * the extents representing=
 the range of the file actually being written
5eda43000064a6 Darrick J. Wong 2017-02-02   92   * (as opposed to extra pie=
ces created for the cowextsize hint) to real
5eda43000064a6 Darrick J. Wong 2017-02-02   93   * extents.  This will beco=
me important in the next step:
5eda43000064a6 Darrick J. Wong 2017-02-02   94   *
5eda43000064a6 Darrick J. Wong 2017-02-02   95   * D: --RRRRRRSSSRRRRRRRR---
5eda43000064a6 Darrick J. Wong 2017-02-02   96   * C: ------UUrrUUU---------
5eda43000064a6 Darrick J. Wong 2017-02-02   97   *
3993baeb3c52f4 Darrick J. Wong 2016-10-03   98   * CoW remapping must be do=
ne after the data block write completes,
3993baeb3c52f4 Darrick J. Wong 2016-10-03   99   * because we don't want to=
 destroy the old data fork map until we're sure
3993baeb3c52f4 Darrick J. Wong 2016-10-03  100   * the new block has been w=
ritten.  Since the new mappings are kept in a
3993baeb3c52f4 Darrick J. Wong 2016-10-03  101   * separate fork, we can si=
mply iterate these mappings to find the ones
3993baeb3c52f4 Darrick J. Wong 2016-10-03  102   * that cover the file bloc=
ks that we just CoW'd.  For each extent, simply
3993baeb3c52f4 Darrick J. Wong 2016-10-03  103   * unmap the corresponding =
range in the data fork, map the new range into
5eda43000064a6 Darrick J. Wong 2017-02-02  104   * the data fork, and remov=
e the extent from the CoW fork.  Because of
5eda43000064a6 Darrick J. Wong 2017-02-02  105   * the presence of the cowe=
xtsize hint, however, we must be careful
5eda43000064a6 Darrick J. Wong 2017-02-02  106   * only to remap the blocks=
 that we've actually written out --  we must
5eda43000064a6 Darrick J. Wong 2017-02-02  107   * never remap delalloc res=
ervations nor CoW staging blocks that have
5eda43000064a6 Darrick J. Wong 2017-02-02  108   * yet to be written.  This=
 corresponds exactly to the real extents in
5eda43000064a6 Darrick J. Wong 2017-02-02  109   * the CoW fork:
5eda43000064a6 Darrick J. Wong 2017-02-02  110   *
5eda43000064a6 Darrick J. Wong 2017-02-02  111   * D: --RRRRRRrrSRRRRRRRR---
5eda43000064a6 Darrick J. Wong 2017-02-02  112   * C: ------UU--UUU---------
3993baeb3c52f4 Darrick J. Wong 2016-10-03  113   *
3993baeb3c52f4 Darrick J. Wong 2016-10-03  114   * Since the remapping oper=
ation can be applied to an arbitrary file
3993baeb3c52f4 Darrick J. Wong 2016-10-03  115   * range, we record the nee=
d for the remap step as a flag in the ioend
3993baeb3c52f4 Darrick J. Wong 2016-10-03  116   * instead of declaring a n=
ew IO type.  This is required for direct io
3993baeb3c52f4 Darrick J. Wong 2016-10-03  117   * because we only have ioe=
nd for the whole dio, and we have to be able to
3993baeb3c52f4 Darrick J. Wong 2016-10-03  118   * remember the presence of=
 unwritten blocks and CoW blocks with a single
3993baeb3c52f4 Darrick J. Wong 2016-10-03  119   * ioend structure.  Better=
 yet, the more ground we can cover with one
3993baeb3c52f4 Darrick J. Wong 2016-10-03  120   * ioend, the better.
3993baeb3c52f4 Darrick J. Wong 2016-10-03  121   */
2a06705cd59540 Darrick J. Wong 2016-10-03  122  =

2a06705cd59540 Darrick J. Wong 2016-10-03  123  /*
e26ff303027ba5 Darrick J. Wong 2022-01-06  124   * Given an AG extent, find=
 the lowest-numbered run of shared blocks within
e26ff303027ba5 Darrick J. Wong 2022-01-06  125   * that range and return th=
e range in fbno/flen.  If find_end_of_shared is
e26ff303027ba5 Darrick J. Wong 2022-01-06  126   * true, return the longest=
 contiguous extent of shared blocks.  If there are
e26ff303027ba5 Darrick J. Wong 2022-01-06  127   * no shared extents, fbno =
and flen will be set to NULLFSBLOCK and 0,
e26ff303027ba5 Darrick J. Wong 2022-01-06  128   * respectively.
2a06705cd59540 Darrick J. Wong 2016-10-03  129   */
e26ff303027ba5 Darrick J. Wong 2022-01-06  130  STATIC int
2a06705cd59540 Darrick J. Wong 2016-10-03  131  xfs_reflink_find_shared(
e26ff303027ba5 Darrick J. Wong 2022-01-06  132  	struct xfs_inode	*ip,
92ff7285f1df55 Darrick J. Wong 2017-06-16  133  	struct xfs_trans	*tp,
e26ff303027ba5 Darrick J. Wong 2022-01-06  134  	struct xfs_bmbt_irec	*irec,
e26ff303027ba5 Darrick J. Wong 2022-01-06  135  	xfs_fsblock_t		*fbno,
e26ff303027ba5 Darrick J. Wong 2022-01-06  136  	xfs_filblks_t		*flen,
2a06705cd59540 Darrick J. Wong 2016-10-03  137  	bool			find_end_of_shared)
2a06705cd59540 Darrick J. Wong 2016-10-03  138  {
e26ff303027ba5 Darrick J. Wong 2022-01-06  139  	struct xfs_mount	*mp =3D i=
p->i_mount;
ac6bf33df99f93 Darrick J. Wong 2022-01-06  140  	struct xfs_buf		*agbp =3D =
NULL;
2a06705cd59540 Darrick J. Wong 2016-10-03  141  	struct xfs_btree_cur	*cur;
e26ff303027ba5 Darrick J. Wong 2022-01-06  142  	xfs_agnumber_t		agno;
9d9cde914dadd9 Darrick J. Wong 2022-01-06  143  	xfs_fsblock_t		agbno;
9d9cde914dadd9 Darrick J. Wong 2022-01-06  144  	xfs_fsblock_t		shared_bno;
9d9cde914dadd9 Darrick J. Wong 2022-01-06  145  	xfs_filblks_t		shared_len;
2a06705cd59540 Darrick J. Wong 2016-10-03  146  	int			error;
2a06705cd59540 Darrick J. Wong 2016-10-03  147  =

ac6bf33df99f93 Darrick J. Wong 2022-01-06  148  	if (XFS_IS_REALTIME_INODE(=
ip)) {
ac6bf33df99f93 Darrick J. Wong 2022-01-06  149  		agno =3D NULLAGNUMBER;
ac6bf33df99f93 Darrick J. Wong 2022-01-06  150  		agbno =3D irec->br_startb=
lock;
ac6bf33df99f93 Darrick J. Wong 2022-01-06  151  		xfs_rtlock(NULL, mp, XFS_=
RTLOCK_REFCOUNT);
ac6bf33df99f93 Darrick J. Wong 2022-01-06  152  		cur =3D xfs_rtrefcountbt_=
init_cursor(mp, tp, mp->m_rrefcountip);
ac6bf33df99f93 Darrick J. Wong 2022-01-06  153  	} else {
e26ff303027ba5 Darrick J. Wong 2022-01-06  154  		agno =3D XFS_FSB_TO_AGNO(=
mp, irec->br_startblock);
e26ff303027ba5 Darrick J. Wong 2022-01-06  155  		agbno =3D XFS_FSB_TO_AGBN=
O(mp, irec->br_startblock);
e26ff303027ba5 Darrick J. Wong 2022-01-06  156  =

92ff7285f1df55 Darrick J. Wong 2017-06-16  157  		error =3D xfs_alloc_read_=
agf(mp, tp, agno, 0, &agbp);
2a06705cd59540 Darrick J. Wong 2016-10-03  158  		if (error)
2a06705cd59540 Darrick J. Wong 2016-10-03  159  			return error;
2a06705cd59540 Darrick J. Wong 2016-10-03  160  =

a81a06211fb43d Dave Chinner    2021-06-02 @161  		cur =3D xfs_refcountbt_in=
it_cursor(mp, tp, agbp, agbp->b_pag);
ac6bf33df99f93 Darrick J. Wong 2022-01-06  162  	}
2a06705cd59540 Darrick J. Wong 2016-10-03  163  =

e26ff303027ba5 Darrick J. Wong 2022-01-06  164  	error =3D xfs_refcount_fin=
d_shared(cur, agbno, irec->br_blockcount,
e26ff303027ba5 Darrick J. Wong 2022-01-06  165  			&shared_bno, &shared_len=
, find_end_of_shared);
2a06705cd59540 Darrick J. Wong 2016-10-03  166  =

0b04b6b875b32f Darrick J. Wong 2018-07-19  167  	xfs_btree_del_cursor(cur, =
error);
2a06705cd59540 Darrick J. Wong 2016-10-03  168  =

ac6bf33df99f93 Darrick J. Wong 2022-01-06 @169  	if (agbp)
92ff7285f1df55 Darrick J. Wong 2017-06-16  170  		xfs_trans_brelse(tp, agbp=
);
ac6bf33df99f93 Darrick J. Wong 2022-01-06  171  	else
ac6bf33df99f93 Darrick J. Wong 2022-01-06  172  		xfs_rtunlock(mp, XFS_RTLO=
CK_REFCOUNT);
e26ff303027ba5 Darrick J. Wong 2022-01-06  173  =

9d9cde914dadd9 Darrick J. Wong 2022-01-06  174  	if (shared_bno =3D=3D NULL=
FSBLOCK)
e26ff303027ba5 Darrick J. Wong 2022-01-06  175  		*fbno =3D NULLFSBLOCK;
ac6bf33df99f93 Darrick J. Wong 2022-01-06  176  	else if (XFS_IS_REALTIME_I=
NODE(ip))
ac6bf33df99f93 Darrick J. Wong 2022-01-06  177  		*fbno =3D shared_bno;
e26ff303027ba5 Darrick J. Wong 2022-01-06  178  	else
e26ff303027ba5 Darrick J. Wong 2022-01-06  179  		*fbno =3D XFS_AGB_TO_FSB(=
mp, agno, shared_bno);
e26ff303027ba5 Darrick J. Wong 2022-01-06  180  	*flen =3D shared_len;
2a06705cd59540 Darrick J. Wong 2016-10-03  181  	return error;
2a06705cd59540 Darrick J. Wong 2016-10-03  182  }
2a06705cd59540 Darrick J. Wong 2016-10-03  183  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5593952177250470814==--

