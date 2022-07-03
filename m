Content-Type: multipart/mixed; boundary="===============0500754775285151937=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:dhowells/linux-fs/netfs-linked-list 55/61] fs/netfs/buffered_flush.c:206 netfs_redirty_range() error: uninitialized symbol 'd2'.
Date: Sun, 03 Jul 2022 18:53:26 +0800
Message-ID: <202207031840.9ZeurKY1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0500754775285151937==
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
commit: aab6b81ed98dd0387c82b293f20d0ed5595c2dd3 [55/61] netfs: Implement r=
edirtying after writeback failure
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20703/202207031840.9ZeurKY1-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/netfs/buffered_flush.c:206 netfs_redirty_range() error: uninitialized sy=
mbol 'd2'.

Old smatch warnings:
fs/netfs/buffered_flush.c:236 netfs_redirty_range() error: uninitialized sy=
mbol 'd2'.
fs/netfs/buffered_flush.c:370 netfs_check_dirty_list() warn: ignoring unrea=
chable code.
fs/netfs/buffered_flush.c:814 netfs_find_writeback_start() error: uninitial=
ized symbol 'ret'.

vim +/d2 +206 fs/netfs/buffered_flush.c

aab6b81ed98dd0 David Howells 2022-06-30  121  =

2dc27084e13c29 David Howells 2021-06-29  122  /*
2dc27084e13c29 David Howells 2021-06-29  123   * The write failed to some e=
xtent.  We need to work out which bits we managed
2dc27084e13c29 David Howells 2021-06-29  124   * to do - for instance, we m=
ight have managed to write stuff to the cache, but
2dc27084e13c29 David Howells 2021-06-29  125   * not upload to the server.
2dc27084e13c29 David Howells 2021-06-29  126   */
2dc27084e13c29 David Howells 2021-06-29  127  static void netfs_redirty_ran=
ge(struct netfs_io_request *wreq)
2dc27084e13c29 David Howells 2021-06-29  128  {
aab6b81ed98dd0 David Howells 2022-06-30  129  	struct netfs_io_chain *chain;
aab6b81ed98dd0 David Howells 2022-06-30  130  	struct netfs_dirty_region *d=
, *d2, *w, *w2, *tmp;
aab6b81ed98dd0 David Howells 2022-06-30  131  	struct netfs_inode *ctx =3D =
netfs_inode(wreq->inode);
aab6b81ed98dd0 David Howells 2022-06-30  132  	unsigned int c;
aab6b81ed98dd0 David Howells 2022-06-30  133  	bool upload_failed =3D false;
aab6b81ed98dd0 David Howells 2022-06-30  134  	LIST_HEAD(discards);
aab6b81ed98dd0 David Howells 2022-06-30  135  =

2dc27084e13c29 David Howells 2021-06-29  136  	trace_netfs_rreq(wreq, netfs=
_rreq_trace_redirty);
aab6b81ed98dd0 David Howells 2022-06-30  137  =

aab6b81ed98dd0 David Howells 2022-06-30  138  	if (list_empty(&wreq->region=
s))
aab6b81ed98dd0 David Howells 2022-06-30  139  		return netfs_clean_dirty_ra=
nge(wreq);
aab6b81ed98dd0 David Howells 2022-06-30  140  =

aab6b81ed98dd0 David Howells 2022-06-30  141  	/* If an upload failed, we n=
eed to ask the filesystem how it wants to
aab6b81ed98dd0 David Howells 2022-06-30  142  	 * handle things.  It has tw=
o choices: redirty everything or leave
aab6b81ed98dd0 David Howells 2022-06-30  143  	 * everything clean.
aab6b81ed98dd0 David Howells 2022-06-30  144  	 */
aab6b81ed98dd0 David Howells 2022-06-30  145  	for (c =3D 0; c < wreq->nr_c=
hains; c++) {
aab6b81ed98dd0 David Howells 2022-06-30  146  		chain =3D &wreq->chains[c];
aab6b81ed98dd0 David Howells 2022-06-30  147  		if (chain->source !=3D NETF=
S_WRITE_TO_CACHE && chain->error)
aab6b81ed98dd0 David Howells 2022-06-30  148  			upload_failed =3D true;
aab6b81ed98dd0 David Howells 2022-06-30  149  	}
aab6b81ed98dd0 David Howells 2022-06-30  150  =

aab6b81ed98dd0 David Howells 2022-06-30  151  	if (!upload_failed ||
aab6b81ed98dd0 David Howells 2022-06-30  152  	    !wreq->netfs_ops->redirt=
y_on_failure ||
aab6b81ed98dd0 David Howells 2022-06-30  153  	    !wreq->netfs_ops->redirt=
y_on_failure(wreq))
aab6b81ed98dd0 David Howells 2022-06-30  154  		return netfs_clean_dirty_ra=
nge(wreq);
aab6b81ed98dd0 David Howells 2022-06-30  155  =

aab6b81ed98dd0 David Howells 2022-06-30  156  	/* First of all, we step thr=
ough the list of regions that were to be
aab6b81ed98dd0 David Howells 2022-06-30  157  	 * written back and see if w=
e can discard/shorten anything that got
aab6b81ed98dd0 David Howells 2022-06-30  158  	 * partially stored.
aab6b81ed98dd0 David Howells 2022-06-30  159  	 *
aab6b81ed98dd0 David Howells 2022-06-30  160  	 * Don't retry write failure=
s to the cache.  If the cache got a fatal
aab6b81ed98dd0 David Howells 2022-06-30  161  	 * error, it will have gone =
offline and retrying is pointless; if it
aab6b81ed98dd0 David Howells 2022-06-30  162  	 * ran out of space, it prob=
ably won't be able to supply us with space
aab6b81ed98dd0 David Howells 2022-06-30  163  	 * on the second attempt.
aab6b81ed98dd0 David Howells 2022-06-30  164  	 */
aab6b81ed98dd0 David Howells 2022-06-30  165  	list_for_each_entry_safe(w, =
tmp, &wreq->regions, dirty_link) {
aab6b81ed98dd0 David Howells 2022-06-30  166  		if (w->type =3D=3D NETFS_CO=
PY_TO_CACHE) {
aab6b81ed98dd0 David Howells 2022-06-30  167  			list_del_init(&w->dirty_li=
nk);
aab6b81ed98dd0 David Howells 2022-06-30  168  			netfs_put_dirty_region(ctx=
, w, netfs_region_trace_put_clear);
aab6b81ed98dd0 David Howells 2022-06-30  169  		}
aab6b81ed98dd0 David Howells 2022-06-30  170  	}
aab6b81ed98dd0 David Howells 2022-06-30  171  =

aab6b81ed98dd0 David Howells 2022-06-30  172  	if (list_empty(&wreq->region=
s))
aab6b81ed98dd0 David Howells 2022-06-30  173  		return;
aab6b81ed98dd0 David Howells 2022-06-30  174  =

aab6b81ed98dd0 David Howells 2022-06-30  175  	/* Mark the pages dirty agai=
n. */
aab6b81ed98dd0 David Howells 2022-06-30  176  	list_for_each_entry(w, &wreq=
->regions, dirty_link) {
aab6b81ed98dd0 David Howells 2022-06-30  177  		netfs_redirty_folios(wreq, =
w->first, w->last);
aab6b81ed98dd0 David Howells 2022-06-30  178  	}
aab6b81ed98dd0 David Howells 2022-06-30  179  =

aab6b81ed98dd0 David Howells 2022-06-30  180  	/* Step through the the unco=
mpleted regions and reintegrate them into
aab6b81ed98dd0 David Howells 2022-06-30  181  	 * the dirty list.
aab6b81ed98dd0 David Howells 2022-06-30  182  	 */
aab6b81ed98dd0 David Howells 2022-06-30  183  	spin_lock(&ctx->dirty_lock);
aab6b81ed98dd0 David Howells 2022-06-30  184  =

aab6b81ed98dd0 David Howells 2022-06-30  185  	w =3D list_first_entry(&wreq=
->regions, struct netfs_dirty_region, dirty_link);
aab6b81ed98dd0 David Howells 2022-06-30  186  	d =3D list_first_entry_or_nu=
ll(&ctx->dirty_regions,
aab6b81ed98dd0 David Howells 2022-06-30  187  				     struct netfs_dirty_r=
egion, dirty_link);
aab6b81ed98dd0 David Howells 2022-06-30  188  =

aab6b81ed98dd0 David Howells 2022-06-30  189  	while (d && w) {
aab6b81ed98dd0 David Howells 2022-06-30  190  		w2 =3D netfs_rreq_next_regi=
on(wreq, w);
aab6b81ed98dd0 David Howells 2022-06-30  191  =

aab6b81ed98dd0 David Howells 2022-06-30  192  		/* Dirty region before writ=
eback region and not touching. */
aab6b81ed98dd0 David Howells 2022-06-30  193  		if (d->last < w->first && d=
->last !=3D w->first - 1) {
aab6b81ed98dd0 David Howells 2022-06-30  194  			d =3D netfs_next_region(ct=
x, d);
aab6b81ed98dd0 David Howells 2022-06-30  195  			if (!d)
aab6b81ed98dd0 David Howells 2022-06-30  196  				break;
aab6b81ed98dd0 David Howells 2022-06-30  197  			continue;
aab6b81ed98dd0 David Howells 2022-06-30  198  		}
aab6b81ed98dd0 David Howells 2022-06-30  199  =

aab6b81ed98dd0 David Howells 2022-06-30  200  		/* Dirty region overlaps wi=
th writeback region.  If two regions
aab6b81ed98dd0 David Howells 2022-06-30  201  		 * overlap, they *must* be =
compatible, otherwise the new
aab6b81ed98dd0 David Howells 2022-06-30  202  		 * changes would not get ap=
plied until this request completes.
aab6b81ed98dd0 David Howells 2022-06-30  203  		 */
aab6b81ed98dd0 David Howells 2022-06-30  204  		if (d->first <=3D w->last) {
aab6b81ed98dd0 David Howells 2022-06-30  205  			if (d->last =3D=3D w->firs=
t - 1 &&
aab6b81ed98dd0 David Howells 2022-06-30 @206  			    !netfs_are_regions_mer=
geable(ctx, d, d2)) {
aab6b81ed98dd0 David Howells 2022-06-30  207  				d =3D netfs_next_region(c=
tx, d);
aab6b81ed98dd0 David Howells 2022-06-30  208  				if (!d)
aab6b81ed98dd0 David Howells 2022-06-30  209  					break;
aab6b81ed98dd0 David Howells 2022-06-30  210  				continue;
aab6b81ed98dd0 David Howells 2022-06-30  211  			}
aab6b81ed98dd0 David Howells 2022-06-30  212  =

aab6b81ed98dd0 David Howells 2022-06-30  213  			d->first =3D min(d->first,=
 w->first);
aab6b81ed98dd0 David Howells 2022-06-30  214  			d->last  =3D max(d->last, =
w->last);
aab6b81ed98dd0 David Howells 2022-06-30  215  			d->from  =3D min(d->from, =
w->from);
aab6b81ed98dd0 David Howells 2022-06-30  216  			d->to    =3D max(d->to, w-=
>to);
aab6b81ed98dd0 David Howells 2022-06-30  217  			trace_netfs_dirty(ctx, d, =
w, netfs_dirty_trace_redirty_merge);
aab6b81ed98dd0 David Howells 2022-06-30  218  =

aab6b81ed98dd0 David Howells 2022-06-30  219  			while ((d2 =3D netfs_next_=
region(ctx, d)) &&
aab6b81ed98dd0 David Howells 2022-06-30  220  			       d->last >=3D d2->fi=
rst - 1 &&
aab6b81ed98dd0 David Howells 2022-06-30  221  			       netfs_are_regions_m=
ergeable(ctx, d, d2)
aab6b81ed98dd0 David Howells 2022-06-30  222  			       ) {
aab6b81ed98dd0 David Howells 2022-06-30  223  				d->last =3D d2->last;
aab6b81ed98dd0 David Howells 2022-06-30  224  				d->to   =3D d2->to;
aab6b81ed98dd0 David Howells 2022-06-30  225  				list_move(&d2->dirty_link=
, &discards);
aab6b81ed98dd0 David Howells 2022-06-30  226  				trace_netfs_dirty(ctx, d,=
 d2, netfs_dirty_trace_bridged);
aab6b81ed98dd0 David Howells 2022-06-30  227  			}
aab6b81ed98dd0 David Howells 2022-06-30  228  =

aab6b81ed98dd0 David Howells 2022-06-30  229  			list_move_tail(&w->dirty_l=
ink, &discards);
aab6b81ed98dd0 David Howells 2022-06-30  230  			w =3D w2;
aab6b81ed98dd0 David Howells 2022-06-30  231  			continue;
aab6b81ed98dd0 David Howells 2022-06-30  232  		}
aab6b81ed98dd0 David Howells 2022-06-30  233  =

aab6b81ed98dd0 David Howells 2022-06-30  234  		/* Dirty region after write=
back region and touching. */
aab6b81ed98dd0 David Howells 2022-06-30  235  		if (d->first =3D=3D w->last=
 + 1) {
aab6b81ed98dd0 David Howells 2022-06-30  236  			if (netfs_are_regions_merg=
eable(ctx, d, d2)) {
aab6b81ed98dd0 David Howells 2022-06-30  237  				d->first =3D min(d->first=
, w->first);
aab6b81ed98dd0 David Howells 2022-06-30  238  				d->from  =3D min(d->from,=
 w->from);
aab6b81ed98dd0 David Howells 2022-06-30  239  				trace_netfs_dirty(ctx, d,=
 w, netfs_dirty_trace_redirty_merge);
aab6b81ed98dd0 David Howells 2022-06-30  240  				list_move_tail(&w->dirty_=
link, &discards);
aab6b81ed98dd0 David Howells 2022-06-30  241  				w =3D w2;
aab6b81ed98dd0 David Howells 2022-06-30  242  				continue;
aab6b81ed98dd0 David Howells 2022-06-30  243  			}
aab6b81ed98dd0 David Howells 2022-06-30  244  		}
aab6b81ed98dd0 David Howells 2022-06-30  245  =

aab6b81ed98dd0 David Howells 2022-06-30  246  		/* Dirty region after write=
back and not touching. */
aab6b81ed98dd0 David Howells 2022-06-30  247  		list_move_tail(&w->dirty_li=
nk, &d->dirty_link);
aab6b81ed98dd0 David Howells 2022-06-30  248  		trace_netfs_dirty(ctx, w, N=
ULL, netfs_dirty_trace_redirty_insert);
aab6b81ed98dd0 David Howells 2022-06-30  249  		w =3D w2;
aab6b81ed98dd0 David Howells 2022-06-30  250  	}
aab6b81ed98dd0 David Howells 2022-06-30  251  =

aab6b81ed98dd0 David Howells 2022-06-30  252  	if (w && !d) {
aab6b81ed98dd0 David Howells 2022-06-30  253  		list_for_each_entry_from(w,=
 &wreq->regions, dirty_link) {
aab6b81ed98dd0 David Howells 2022-06-30  254  			trace_netfs_dirty(ctx, w, =
NULL, netfs_dirty_trace_redirty_insert);
aab6b81ed98dd0 David Howells 2022-06-30  255  		}
aab6b81ed98dd0 David Howells 2022-06-30  256  		list_splice_tail_init(&wreq=
->regions, &ctx->dirty_regions);
aab6b81ed98dd0 David Howells 2022-06-30  257  	}
aab6b81ed98dd0 David Howells 2022-06-30  258  =

aab6b81ed98dd0 David Howells 2022-06-30  259  	spin_unlock(&ctx->dirty_lock=
);
aab6b81ed98dd0 David Howells 2022-06-30  260  =

aab6b81ed98dd0 David Howells 2022-06-30  261  	while ((d =3D list_first_ent=
ry_or_null(&discards,
aab6b81ed98dd0 David Howells 2022-06-30  262  					     struct netfs_dirty_=
region, dirty_link))) {
aab6b81ed98dd0 David Howells 2022-06-30  263  		list_del_init(&d->dirty_lin=
k);
aab6b81ed98dd0 David Howells 2022-06-30  264  		netfs_put_dirty_region(ctx,=
 d, netfs_region_trace_put_merged);
aab6b81ed98dd0 David Howells 2022-06-30  265  	}
2dc27084e13c29 David Howells 2021-06-29  266  }
2dc27084e13c29 David Howells 2021-06-29  267  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0500754775285151937==--

