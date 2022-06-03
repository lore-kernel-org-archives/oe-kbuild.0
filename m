Content-Type: multipart/mixed; boundary="===============3475251939573100778=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:dhowells/linux-fs/netfs-linked-list 58/59] fs/netfs/buffered_flush.c:664 netfs_find_writeback_start() error: uninitialized symbol 'ret'.
Date: Fri, 03 Jun 2022 15:16:56 +0800
Message-ID: <202206031529.CM5I3dvU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3475251939573100778==
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
head:   22ecc2fcdab4616e624408911ec1d54644e82030
commit: ff509dc49891f934a7a774e277b87729018db753 [58/59] netfs: Use flush f=
rom afs_writeback
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20603/202206031529.CM5I3dvU-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/netfs/buffered_flush.c:664 netfs_find_writeback_start() error: uninitial=
ized symbol 'ret'.

vim +/ret +664 fs/netfs/buffered_flush.c

c403641768e0a37 David Howells 2021-06-29  547  =

ff509dc49891f93 David Howells 2022-04-28  548  /*
ff509dc49891f93 David Howells 2022-04-28  549   * Pin the first folio of th=
e region and lock it.  The folio is attached to the
ff509dc49891f93 David Howells 2022-04-28  550   * buffer xarray with markin=
gs indicating what we need to do to clean it up
ff509dc49891f93 David Howells 2022-04-28  551   * (redirty it, drop its ref=
count, etc.).
c403641768e0a37 David Howells 2021-06-29  552   */
ff509dc49891f93 David Howells 2022-04-28  553  static int netfs_find_writeb=
ack_start(struct netfs_io_request *wreq,
ff509dc49891f93 David Howells 2022-04-28  554  				      struct writeback_c=
ontrol *wbc,
ff509dc49891f93 David Howells 2022-04-28  555  				      struct netfs_dirty=
_region *region,
ff509dc49891f93 David Howells 2022-04-28  556  				      pgoff_t *_first, p=
goff_t last)
ff509dc49891f93 David Howells 2022-04-28  557  {
ff509dc49891f93 David Howells 2022-04-28  558  	struct folio *folio;
ff509dc49891f93 David Howells 2022-04-28  559  	ssize_t ret;
ff509dc49891f93 David Howells 2022-04-28  560  	bool dirty;
ff509dc49891f93 David Howells 2022-04-28  561  	int skips =3D 0;
c403641768e0a37 David Howells 2021-06-29  562  =

ff509dc49891f93 David Howells 2022-04-28  563  	_enter("%lx,%lx,", *_first,=
 last);
c403641768e0a37 David Howells 2021-06-29  564  =

ff509dc49891f93 David Howells 2022-04-28  565  retry:
ff509dc49891f93 David Howells 2022-04-28  566  	folio =3D __filemap_get_fol=
io(wreq->mapping, *_first, 0, 0);
ff509dc49891f93 David Howells 2022-04-28  567  	if (!folio) {
ff509dc49891f93 David Howells 2022-04-28  568  		pr_warn("Folio %lx in dirt=
y region D=3D%x not present\n",
ff509dc49891f93 David Howells 2022-04-28  569  			*_first, region->debug_id=
);
ff509dc49891f93 David Howells 2022-04-28  570  		return 0;
c403641768e0a37 David Howells 2021-06-29  571  	}
c403641768e0a37 David Howells 2021-06-29  572  =

ff509dc49891f93 David Howells 2022-04-28  573  	/* At this point we hold ne=
ither the i_pages lock nor the folio lock:
ff509dc49891f93 David Howells 2022-04-28  574  	 * the folio may be truncat=
ed or invalidated (changing folio->mapping to
ff509dc49891f93 David Howells 2022-04-28  575  	 * NULL), or even swizzled =
back from swapper_space to tmpfs file
ff509dc49891f93 David Howells 2022-04-28  576  	 * mapping
ff509dc49891f93 David Howells 2022-04-28  577  	 */
ff509dc49891f93 David Howells 2022-04-28  578  	if (wbc->sync_mode !=3D WB_=
SYNC_NONE) {
ff509dc49891f93 David Howells 2022-04-28  579  		ret =3D folio_lock_killabl=
e(folio);
ff509dc49891f93 David Howells 2022-04-28  580  		if (ret < 0) {
ff509dc49891f93 David Howells 2022-04-28  581  			folio_put(folio);
ff509dc49891f93 David Howells 2022-04-28  582  			_leave(" =3D %zd [lock]",=
 ret);
ff509dc49891f93 David Howells 2022-04-28  583  			return ret;
ff509dc49891f93 David Howells 2022-04-28  584  		}
ff509dc49891f93 David Howells 2022-04-28  585  	} else {
ff509dc49891f93 David Howells 2022-04-28  586  		if (!folio_trylock(folio))=
 {
ff509dc49891f93 David Howells 2022-04-28  587  			folio_put(folio);
ff509dc49891f93 David Howells 2022-04-28  588  			_leave(" =3D 0 [trylock]"=
);
ff509dc49891f93 David Howells 2022-04-28  589  			return 0;
ff509dc49891f93 David Howells 2022-04-28  590  		}
ff509dc49891f93 David Howells 2022-04-28  591  	}
c403641768e0a37 David Howells 2021-06-29  592  =

ff509dc49891f93 David Howells 2022-04-28  593  	/* A dirty region must fit =
exactly over a span of folios - there should
ff509dc49891f93 David Howells 2022-04-28  594  	 * be no partial folio cove=
rage.
ff509dc49891f93 David Howells 2022-04-28  595  	 */
ff509dc49891f93 David Howells 2022-04-28  596  	if (*_first < folio->index)=
 {
ff509dc49891f93 David Howells 2022-04-28  597  		pr_warn("Folio %lx extends=
 before dirty region D=3D%x\n",
ff509dc49891f93 David Howells 2022-04-28  598  			*_first, region->debug_id=
);
ff509dc49891f93 David Howells 2022-04-28  599  		goto skip;
c403641768e0a37 David Howells 2021-06-29  600  	}
c403641768e0a37 David Howells 2021-06-29  601  =

ff509dc49891f93 David Howells 2022-04-28  602  	if (folio_mapping(folio) !=
=3D wreq->mapping) {
ff509dc49891f93 David Howells 2022-04-28  603  		pr_warn("Folio %lx in dirt=
y region D=3D%x has no mapping set\n",
ff509dc49891f93 David Howells 2022-04-28  604  			*_first, region->debug_id=
);
ff509dc49891f93 David Howells 2022-04-28  605  		goto skip;
ff509dc49891f93 David Howells 2022-04-28  606  	}
c403641768e0a37 David Howells 2021-06-29  607  =

ff509dc49891f93 David Howells 2022-04-28  608  	/* Any folio we have to inc=
lude must not already have writeback in
ff509dc49891f93 David Howells 2022-04-28  609  	 * progress otherwise we ma=
y get a race against old data being written.
c403641768e0a37 David Howells 2021-06-29  610  	 */
ff509dc49891f93 David Howells 2022-04-28  611  	if (folio_test_writeback(fo=
lio)) {
ff509dc49891f93 David Howells 2022-04-28  612  		folio_unlock(folio);
ff509dc49891f93 David Howells 2022-04-28  613  		if (wbc->sync_mode !=3D WB=
_SYNC_NONE)
ff509dc49891f93 David Howells 2022-04-28  614  			folio_wait_writeback(foli=
o);
ff509dc49891f93 David Howells 2022-04-28  615  		else
ff509dc49891f93 David Howells 2022-04-28  616  			*_first =3D folio_next_in=
dex(folio);
ff509dc49891f93 David Howells 2022-04-28  617  		folio_put(folio);
ff509dc49891f93 David Howells 2022-04-28  618  		if (wbc->sync_mode =3D=3D =
WB_SYNC_NONE) {
ff509dc49891f93 David Howells 2022-04-28  619  			if (skips >=3D 5 || need_=
resched())
ff509dc49891f93 David Howells 2022-04-28  620  				return 0;
ff509dc49891f93 David Howells 2022-04-28  621  			skips++;
ff509dc49891f93 David Howells 2022-04-28  622  		}
ff509dc49891f93 David Howells 2022-04-28  623  		goto retry;
ff509dc49891f93 David Howells 2022-04-28  624  	}
ff509dc49891f93 David Howells 2022-04-28  625  =

ff509dc49891f93 David Howells 2022-04-28  626  	/* A dirty region may inclu=
de a number of folios that are clean in order
ff509dc49891f93 David Howells 2022-04-28  627  	 * to make up a minimum-siz=
ed unit for writing, e.g. if we need to
ff509dc49891f93 David Howells 2022-04-28  628  	 * compress a large block o=
r write a bigger unit to the cache, so we
ff509dc49891f93 David Howells 2022-04-28  629  	 * need to keep track of th=
at in case the write op fails.
ff509dc49891f93 David Howells 2022-04-28  630  	 */
ff509dc49891f93 David Howells 2022-04-28  631  	dirty =3D folio_clear_dirty=
_for_io(folio);
ff509dc49891f93 David Howells 2022-04-28  632  	trace_netfs_folio_dirty(wre=
q->mapping, folio, netfs_folio_trace_store);
ff509dc49891f93 David Howells 2022-04-28  633  	trace_netfs_wb_page(wreq, f=
olio);
ff509dc49891f93 David Howells 2022-04-28  634  	if (folio_start_writeback(f=
olio)) {
ff509dc49891f93 David Howells 2022-04-28  635  		kdebug ("start wb failed");
ff509dc49891f93 David Howells 2022-04-28  636  		goto out_unlock;
ff509dc49891f93 David Howells 2022-04-28  637  	}
ff509dc49891f93 David Howells 2022-04-28  638  =

ff509dc49891f93 David Howells 2022-04-28  639  	ret =3D netfs_xa_store_and_=
mark(&wreq->buffer, folio->index, folio,
ff509dc49891f93 David Howells 2022-04-28  640  				      true, true, dirty,=
 GFP_NOFS);
ff509dc49891f93 David Howells 2022-04-28  641  	if (ret < 0) {
ff509dc49891f93 David Howells 2022-04-28  642  		kdebug("oom store");
ff509dc49891f93 David Howells 2022-04-28  643  		goto nomem;
ff509dc49891f93 David Howells 2022-04-28  644  	}
ff509dc49891f93 David Howells 2022-04-28  645  =

ff509dc49891f93 David Howells 2022-04-28  646  	wreq->first =3D folio->inde=
x;
ff509dc49891f93 David Howells 2022-04-28  647  	wreq->last  =3D folio_next_=
index(folio) - 1;
ff509dc49891f93 David Howells 2022-04-28  648  	wreq->len   =3D folio_size(=
folio);
ff509dc49891f93 David Howells 2022-04-28  649  	wreq->start =3D folio_pos(f=
olio);
ff509dc49891f93 David Howells 2022-04-28  650  	if (wreq->start >=3D wreq->=
i_size) {
ff509dc49891f93 David Howells 2022-04-28  651  		pr_err("wreq->start >=3D w=
req->i_size\n");
ff509dc49891f93 David Howells 2022-04-28  652  		wreq->len =3D 0;
ff509dc49891f93 David Howells 2022-04-28  653  		ret =3D -EIO;
ff509dc49891f93 David Howells 2022-04-28  654  		goto out_unlock;
ff509dc49891f93 David Howells 2022-04-28  655  	}
ff509dc49891f93 David Howells 2022-04-28  656  	_debug("START %zx @%llx [%l=
lx]", wreq->len, wreq->start, wreq->i_size);
ff509dc49891f93 David Howells 2022-04-28  657  	if (wreq->len > wreq->i_siz=
e - wreq->start)
ff509dc49891f93 David Howells 2022-04-28  658  		wreq->len =3D wreq->i_size=
 - wreq->start;
ff509dc49891f93 David Howells 2022-04-28  659  	*_first =3D wreq->last + 1;
ff509dc49891f93 David Howells 2022-04-28  660  	ret =3D 1;
ff509dc49891f93 David Howells 2022-04-28  661  out_unlock:
ff509dc49891f93 David Howells 2022-04-28  662  	folio_unlock(folio);
ff509dc49891f93 David Howells 2022-04-28  663  	_leave(" =3D %zd [%lx]", re=
t, *_first);
ff509dc49891f93 David Howells 2022-04-28 @664  	return ret;
ff509dc49891f93 David Howells 2022-04-28  665  =

ff509dc49891f93 David Howells 2022-04-28  666  nomem:
ff509dc49891f93 David Howells 2022-04-28  667  	if (dirty)
ff509dc49891f93 David Howells 2022-04-28  668  		folio_redirty_for_writepag=
e(wbc, folio);
ff509dc49891f93 David Howells 2022-04-28  669  	folio_end_writeback(folio);
ff509dc49891f93 David Howells 2022-04-28  670  	goto out_unlock;
ff509dc49891f93 David Howells 2022-04-28  671  =

ff509dc49891f93 David Howells 2022-04-28  672  skip:
ff509dc49891f93 David Howells 2022-04-28  673  	BUG();
ff509dc49891f93 David Howells 2022-04-28  674  }
c403641768e0a37 David Howells 2021-06-29  675  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3475251939573100778==--

