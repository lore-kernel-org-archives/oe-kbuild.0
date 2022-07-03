Content-Type: multipart/mixed; boundary="===============6025223161140568576=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:dhowells/linux-fs/netfs-linked-list 56/61] fs/netfs/truncate.c:177 netfs_prepare_trunc_buffers() error: uninitialized symbol 'from'.
Date: Sun, 03 Jul 2022 19:34:18 +0800
Message-ID: <202207031955.5MWchcdz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6025223161140568576==
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
commit: b0af788660145c19754695953b240c9eaa311df8 [56/61] netfs: Implement t=
runcation
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20703/202207031955.5MWchcdz-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/netfs/truncate.c:177 netfs_prepare_trunc_buffers() error: uninitialized =
symbol 'from'.
fs/netfs/truncate.c:189 netfs_prepare_trunc_buffers() error: uninitialized =
symbol 'to'.

vim +/from +177 fs/netfs/truncate.c

b0af788660145c David Howells 2021-09-30  134  =

b0af788660145c David Howells 2021-09-30  135  /*
b0af788660145c David Howells 2021-09-30  136   * Set up a pair of buffers w=
ith which we can perform an RMW cycle to
b0af788660145c David Howells 2021-09-30  137   * reconstitute the block con=
taining the EOF marker.  One buffer will hold the
b0af788660145c David Howells 2021-09-30  138   * proposed modification in u=
nencrypted form, the other will hold the
b0af788660145c David Howells 2021-09-30  139   * encrypted/compressed data.
b0af788660145c David Howells 2021-09-30  140   *
b0af788660145c David Howells 2021-09-30  141   * We don't want to make our =
proposed changes to the pagecache yet as we would
b0af788660145c David Howells 2021-09-30  142   * have to back them out if a=
n error occurs.
b0af788660145c David Howells 2021-09-30  143   */
b0af788660145c David Howells 2021-09-30  144  static int netfs_prepare_trun=
c_buffers(struct netfs_io_request *treq)
b0af788660145c David Howells 2021-09-30  145  {
b0af788660145c David Howells 2021-09-30  146  	struct netfs_inode *ctx =3D =
netfs_inode(treq->inode);
b0af788660145c David Howells 2021-09-30  147  	struct iov_iter iter;
b0af788660145c David Howells 2021-09-30  148  	struct folio *folio;
b0af788660145c David Howells 2021-09-30  149  	unsigned long long base;
b0af788660145c David Howells 2021-09-30  150  	pgoff_t from, to, fto;
b0af788660145c David Howells 2021-09-30  151  	size_t offset, seg;
b0af788660145c David Howells 2021-09-30  152  	size_t bsize =3D max_t(size_=
t, 1UL << ctx->min_bshift, PAGE_SIZE);
b0af788660145c David Howells 2021-09-30  153  	int ret;
b0af788660145c David Howells 2021-09-30  154  =

b0af788660145c David Howells 2021-09-30  155  	/* We want to hold the entir=
e replacement block, but we round that out
b0af788660145c David Howells 2021-09-30  156  	 * to a multiple of pages.
b0af788660145c David Howells 2021-09-30  157  	 */
b0af788660145c David Howells 2021-09-30  158  	base =3D round_down(treq->tr=
unc_i_size, bsize);
b0af788660145c David Howells 2021-09-30  159  	treq->start	=3D base;
b0af788660145c David Howells 2021-09-30  160  	treq->len	=3D bsize;
b0af788660145c David Howells 2021-09-30  161  	treq->first	=3D base / PAGE_=
SIZE;
b0af788660145c David Howells 2021-09-30  162  	treq->last	=3D (base + bsize=
 + 1) / PAGE_SIZE;
b0af788660145c David Howells 2021-09-30  163  =

b0af788660145c David Howells 2021-09-30  164  	ret =3D netfs_add_folios_to_=
buffer(&treq->buffer, treq->first, treq->last,
b0af788660145c David Howells 2021-09-30  165  					 GFP_KERNEL);
b0af788660145c David Howells 2021-09-30  166  	if (ret < 0)
b0af788660145c David Howells 2021-09-30  167  		return ret;
b0af788660145c David Howells 2021-09-30  168  =

b0af788660145c David Howells 2021-09-30  169  	ret =3D netfs_add_folios_to_=
buffer(&treq->bounce, treq->first, treq->last,
b0af788660145c David Howells 2021-09-30  170  					 GFP_KERNEL);
b0af788660145c David Howells 2021-09-30  171  	if (ret < 0)
b0af788660145c David Howells 2021-09-30  172  		return ret;
b0af788660145c David Howells 2021-09-30  173  =

b0af788660145c David Howells 2021-09-30  174  	/* We need to fill the buffe=
r. */
b0af788660145c David Howells 2021-09-30  175  	iov_iter_xarray(&iter, READ,=
 &treq->buffer, base, base + bsize);
b0af788660145c David Howells 2021-09-30  176  	do {
b0af788660145c David Howells 2021-09-30 @177  		folio =3D read_mapping_foli=
o(treq->mapping, from, NULL);
b0af788660145c David Howells 2021-09-30  178  		if (IS_ERR(folio))
b0af788660145c David Howells 2021-09-30  179  			return PTR_ERR(folio);
b0af788660145c David Howells 2021-09-30  180  		if (folio->index > from ||
b0af788660145c David Howells 2021-09-30  181  		    folio->index + folio_nr=
_pages(folio) <=3D folio->index) {
b0af788660145c David Howells 2021-09-30  182  			folio_put(folio);
b0af788660145c David Howells 2021-09-30  183  			kleave("-EIO [unexpected f=
olio %lx !=3D %lx]", folio->index, from);
b0af788660145c David Howells 2021-09-30  184  			return -EIO;
b0af788660145c David Howells 2021-09-30  185  		}
b0af788660145c David Howells 2021-09-30  186  =

b0af788660145c David Howells 2021-09-30  187  		offset =3D (from - folio->i=
ndex);
b0af788660145c David Howells 2021-09-30  188  		fto =3D folio->index + foli=
o_nr_pages(folio) - 1;
b0af788660145c David Howells 2021-09-30 @189  		seg =3D min(to, fto);
b0af788660145c David Howells 2021-09-30  190  		seg =3D (seg - from) + 1;
b0af788660145c David Howells 2021-09-30  191  		kdebug("buf=3D%lx-%lx fol=
=3D%lx-%lx s=3D%lx@%lx",
b0af788660145c David Howells 2021-09-30  192  		       from, to, folio->ind=
ex, fto, seg, offset);
b0af788660145c David Howells 2021-09-30  193  		if (copy_folio_to_iter(foli=
o, offset * PAGE_SIZE, seg * PAGE_SIZE, &iter)) {
b0af788660145c David Howells 2021-09-30  194  			folio_put(folio);
b0af788660145c David Howells 2021-09-30  195  			kleave(" =3D -EIO [copy fa=
ilure]");
b0af788660145c David Howells 2021-09-30  196  			return -EIO;
b0af788660145c David Howells 2021-09-30  197  		}
b0af788660145c David Howells 2021-09-30  198  =

b0af788660145c David Howells 2021-09-30  199  		/* We keep the refs to disc=
ard later - we don't want read
b0af788660145c David Howells 2021-09-30  200  		 * interfering with what we=
're up to.
b0af788660145c David Howells 2021-09-30  201  		 */
b0af788660145c David Howells 2021-09-30  202  		from =3D fto;
b0af788660145c David Howells 2021-09-30  203  	} while (from < to);
b0af788660145c David Howells 2021-09-30  204  =

b0af788660145c David Howells 2021-09-30  205  	/* Lock the folios and clear=
 the uptodate flag.  Read must wait. */
b0af788660145c David Howells 2021-09-30  206  =

b0af788660145c David Howells 2021-09-30  207  	/* Clear the region after th=
e new EOF */
b0af788660145c David Howells 2021-09-30  208  	iov_iter_xarray(&iter, READ,=
 &treq->buffer, base, base + bsize);
b0af788660145c David Howells 2021-09-30  209  	iov_iter_advance(&iter, treq=
->trunc_i_size - treq->start);
b0af788660145c David Howells 2021-09-30  210  	iov_iter_zero(iov_iter_count=
(&iter), &iter);
b0af788660145c David Howells 2021-09-30  211  	return 0;
b0af788660145c David Howells 2021-09-30  212  }
b0af788660145c David Howells 2021-09-30  213  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6025223161140568576==--

