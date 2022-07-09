Content-Type: multipart/mixed; boundary="===============4611828926746681930=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:dhowells/linux-fs/netfs-linked-list 61/61] fs/netfs/buffered_flush.c:1072:1-7: preceding lock on line 1011
Date: Sat, 09 Jul 2022 23:03:04 +0800
Message-ID: <202207092348.fCpvRbGD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4611828926746681930==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: David Howells <dhowells@redhat.com>

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/netfs-=
linked-list
head:   ce4670495468b797b0c5927fcb661bc0da48b9ab
commit: ce4670495468b797b0c5927fcb661bc0da48b9ab [61/61] netfs: Add a struc=
t to group modifications together and flushed in order
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: openrisc-randconfig-c024-20220707 (https://download.01.org/0day-ci/=
archive/20220709/202207092348.fCpvRbGD-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> fs/netfs/buffered_flush.c:1072:1-7: preceding lock on line 1011

vim +1072 fs/netfs/buffered_flush.c

ce4670495468b79 David Howells 2022-02-07   962  =

2dc27084e13c291 David Howells 2021-06-29   963  /*
2dc27084e13c291 David Howells 2021-06-29   964   * Flush some of the dirty =
queue, transforming a part of a sequence of dirty
2dc27084e13c291 David Howells 2021-06-29   965   * regions into a block we =
can flush.
2dc27084e13c291 David Howells 2021-06-29   966   *
2dc27084e13c291 David Howells 2021-06-29   967   * A number of things const=
rain us:
2dc27084e13c291 David Howells 2021-06-29   968   *  - The region we write o=
ut should not be undergoing modification
2dc27084e13c291 David Howells 2021-06-29   969   *  - We may need to expand=
 or split the region for a number of reasons:
2dc27084e13c291 David Howells 2021-06-29   970   *    - Filesystem storage =
block/object size
2dc27084e13c291 David Howells 2021-06-29   971   *    - Filesystem RPC size=
 (wsize)
2dc27084e13c291 David Howells 2021-06-29   972   *    - Cache block size
2dc27084e13c291 David Howells 2021-06-29   973   *    - Cache DIO block size
2dc27084e13c291 David Howells 2021-06-29   974   *    - Crypto/compression =
block size
2dc27084e13c291 David Howells 2021-06-29   975   *
2dc27084e13c291 David Howells 2021-06-29   976   * This may be entered mult=
iple times simultaneously.  Automatic flushing by
2dc27084e13c291 David Howells 2021-06-29   977   * the VM is serialised on =
I_SYNC, but things like fsync() may enter multiple
2dc27084e13c291 David Howells 2021-06-29   978   * times simultaneously.
2dc27084e13c291 David Howells 2021-06-29   979   */
2dc27084e13c291 David Howells 2021-06-29   980  static int netfs_select_dir=
ty(struct netfs_io_request *wreq,
2dc27084e13c291 David Howells 2021-06-29   981  			      struct writeback_c=
ontrol *wbc,
2dc27084e13c291 David Howells 2021-06-29   982  			      struct netfs_inode=
 *ctx,
2dc27084e13c291 David Howells 2021-06-29   983  			      pgoff_t *_first, p=
goff_t last)
2dc27084e13c291 David Howells 2021-06-29   984  {
2dc27084e13c291 David Howells 2021-06-29   985  	struct netfs_dirty_region =
*region;
ce4670495468b79 David Howells 2022-02-07   986  	struct netfs_flush_group *=
group;
2dc27084e13c291 David Howells 2021-06-29   987  	pgoff_t first =3D *_first;
2dc27084e13c291 David Howells 2021-06-29   988  	pgoff_t csize =3D 1UL << c=
tx->cache_order;
ce4670495468b79 David Howells 2022-02-07   989  	bool advance =3D true;
2dc27084e13c291 David Howells 2021-06-29   990  	int ret;
2dc27084e13c291 David Howells 2021-06-29   991  =

2dc27084e13c291 David Howells 2021-06-29   992  	/* Round out the range we'=
re looking through to accommodate whole cache
2dc27084e13c291 David Howells 2021-06-29   993  	 * blocks.  The cache may =
only be able to store blocks of that size, in
2dc27084e13c291 David Howells 2021-06-29   994  	 * which case we may need =
to add non-dirty pages to the buffer too.
2dc27084e13c291 David Howells 2021-06-29   995  	 */
2dc27084e13c291 David Howells 2021-06-29   996  	if (ctx->cache_order) {
2dc27084e13c291 David Howells 2021-06-29   997  		first =3D round_down(firs=
t, csize);
2dc27084e13c291 David Howells 2021-06-29   998  		last =3D round_up_incl(la=
st, csize);
2dc27084e13c291 David Howells 2021-06-29   999  	}
2dc27084e13c291 David Howells 2021-06-29  1000  =

2dc27084e13c291 David Howells 2021-06-29  1001  	_enter("%lx-%lx", first, l=
ast);
2dc27084e13c291 David Howells 2021-06-29  1002  =

2dc27084e13c291 David Howells 2021-06-29  1003  	if (wbc->sync_mode =3D=3D =
WB_SYNC_NONE) {
2dc27084e13c291 David Howells 2021-06-29  1004  		if (!mutex_trylock(&ctx->=
wb_mutex))
2dc27084e13c291 David Howells 2021-06-29  1005  			return 0;
2dc27084e13c291 David Howells 2021-06-29  1006  	} else {
2dc27084e13c291 David Howells 2021-06-29  1007  		mutex_lock(&ctx->wb_mutex=
);
2dc27084e13c291 David Howells 2021-06-29  1008  	}
2dc27084e13c291 David Howells 2021-06-29  1009  =

2dc27084e13c291 David Howells 2021-06-29  1010  	/* Find the first dirty re=
gion that overlaps the requested range */
2dc27084e13c291 David Howells 2021-06-29 @1011  	spin_lock(&ctx->dirty_lock=
);
ce4670495468b79 David Howells 2022-02-07  1012  =

2dc27084e13c291 David Howells 2021-06-29  1013  	region =3D netfs_scan_for_=
region(ctx, first, last);
ce4670495468b79 David Howells 2022-02-07  1014  	if (region)
ce4670495468b79 David Howells 2022-02-07  1015  		kdebug("scan got D=3D%08x=
", region->debug_id);
ce4670495468b79 David Howells 2022-02-07  1016  =

ce4670495468b79 David Howells 2022-02-07  1017  	/* If the region selected =
is not in the bottommost flush group, we need
ce4670495468b79 David Howells 2022-02-07  1018  	 * to flush prerequisites =
first.
ce4670495468b79 David Howells 2022-02-07  1019  	 */
ce4670495468b79 David Howells 2022-02-07  1020  	if (region && region->grou=
p) {
ce4670495468b79 David Howells 2022-02-07  1021  		group =3D list_first_entr=
y(&ctx->flush_groups,
ce4670495468b79 David Howells 2022-02-07  1022  					 struct netfs_flush_gr=
oup, group_link);
ce4670495468b79 David Howells 2022-02-07  1023  		if (region->group !=3D gr=
oup) {
ce4670495468b79 David Howells 2022-02-07  1024  			kdebug("flush prereq");
ce4670495468b79 David Howells 2022-02-07  1025  			region =3D netfs_select_=
from_flush_group(wbc, ctx, group);
ce4670495468b79 David Howells 2022-02-07  1026  			if (IS_ERR(region)) {
ce4670495468b79 David Howells 2022-02-07  1027  				ret =3D PTR_ERR(region);
ce4670495468b79 David Howells 2022-02-07  1028  				goto unlock;
ce4670495468b79 David Howells 2022-02-07  1029  			}
ce4670495468b79 David Howells 2022-02-07  1030  			advance =3D false;
ce4670495468b79 David Howells 2022-02-07  1031  		}
2dc27084e13c291 David Howells 2021-06-29  1032  	}
ce4670495468b79 David Howells 2022-02-07  1033  =

ce4670495468b79 David Howells 2022-02-07  1034  	if (region)
ce4670495468b79 David Howells 2022-02-07  1035  		netfs_get_dirty_region(ct=
x, region, netfs_region_trace_get_wback);
ce4670495468b79 David Howells 2022-02-07  1036  =

2dc27084e13c291 David Howells 2021-06-29  1037  	spin_unlock(&ctx->dirty_lo=
ck);
2dc27084e13c291 David Howells 2021-06-29  1038  	if (!region) {
2dc27084e13c291 David Howells 2021-06-29  1039  		_debug("scan failed");
2dc27084e13c291 David Howells 2021-06-29  1040  		*_first =3D last;
2dc27084e13c291 David Howells 2021-06-29  1041  		ret =3D 0;
2dc27084e13c291 David Howells 2021-06-29  1042  		goto unlock;
2dc27084e13c291 David Howells 2021-06-29  1043  	}
2dc27084e13c291 David Howells 2021-06-29  1044  =

2dc27084e13c291 David Howells 2021-06-29  1045  	/* Try to grab the first f=
olio of the requested range within that
2dc27084e13c291 David Howells 2021-06-29  1046  	 * region.
2dc27084e13c291 David Howells 2021-06-29  1047  	 */
2dc27084e13c291 David Howells 2021-06-29  1048  	if (*_first < region->firs=
t)
2dc27084e13c291 David Howells 2021-06-29  1049  		*_first =3D region->first;
ce4670495468b79 David Howells 2022-02-07  1050  =

2dc27084e13c291 David Howells 2021-06-29  1051  	ret =3D netfs_find_writeba=
ck_start(wreq, wbc, region, _first, last);
2dc27084e13c291 David Howells 2021-06-29  1052  	if (ret <=3D 0)
ce4670495468b79 David Howells 2022-02-07  1053  		goto put_region;
2dc27084e13c291 David Howells 2021-06-29  1054  =

2dc27084e13c291 David Howells 2021-06-29  1055  	netfs_extend_writeback(wre=
q, wbc, ctx, region);
ce4670495468b79 David Howells 2022-02-07  1056  	if (advance)
2dc27084e13c291 David Howells 2021-06-29  1057  		*_first =3D wreq->last + =
1;
2dc27084e13c291 David Howells 2021-06-29  1058  =

2dc27084e13c291 David Howells 2021-06-29  1059  	netfs_split_out_regions(wr=
eq, ctx, region);
2dc27084e13c291 David Howells 2021-06-29  1060  =

2dc27084e13c291 David Howells 2021-06-29  1061  	/* The assembled write req=
uest gets placed on the list to prevent
2dc27084e13c291 David Howells 2021-06-29  1062  	 * conflicting write reque=
sts happening simultaneously.
2dc27084e13c291 David Howells 2021-06-29  1063  	 */
2dc27084e13c291 David Howells 2021-06-29  1064  	netfs_add_wback_to_list(ct=
x, wreq);
2dc27084e13c291 David Howells 2021-06-29  1065  	ret =3D 1;
2dc27084e13c291 David Howells 2021-06-29  1066  =

ce4670495468b79 David Howells 2022-02-07  1067  put_region:
ce4670495468b79 David Howells 2022-02-07  1068  	netfs_put_dirty_region(ctx=
, region, netfs_region_trace_put_wback);
2dc27084e13c291 David Howells 2021-06-29  1069  unlock:
2dc27084e13c291 David Howells 2021-06-29  1070  	mutex_unlock(&ctx->wb_mute=
x);
2dc27084e13c291 David Howells 2021-06-29  1071  	_leave(" =3D %d [%lx]", re=
t, *_first);
2dc27084e13c291 David Howells 2021-06-29 @1072  	return ret;
2dc27084e13c291 David Howells 2021-06-29  1073  }
2dc27084e13c291 David Howells 2021-06-29  1074  =


:::::: The code at line 1072 was first introduced by commit
:::::: 2dc27084e13c29183f0a6853b81e5fa2941948e3 netfs: Generate a write req=
uest from ->writepages()

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4611828926746681930==--

