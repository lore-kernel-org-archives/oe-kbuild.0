Content-Type: multipart/mixed; boundary="===============2812769974994152347=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:dhowells/linux-fs/netfs-linked-list 15/61] fs/netfs/buffered_read.c:261:12-13: WARNING opportunity for min()
Date: Sat, 09 Jul 2022 22:32:32 +0800
Message-ID: <202207092231.QXWW4ouN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2812769974994152347==
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
commit: 44acd768fad13579d00524cf853d6ba6e682caba [15/61] netfs: Implement s=
upport for DIO read
:::::: branch date: 8 days ago
:::::: commit date: 9 days ago
config: openrisc-randconfig-c024-20220707 (https://download.01.org/0day-ci/=
archive/20220709/202207092231.QXWW4ouN-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> fs/netfs/buffered_read.c:261:12-13: WARNING opportunity for min()

vim +261 fs/netfs/buffered_read.c

16211268fcb3667 David Howells           2022-03-01  214  =

16211268fcb3667 David Howells           2022-03-01  215  /**
6c62371b7fd7762 Matthew Wilcox (Oracle  2022-04-29  216)  * netfs_read_foli=
o - Helper to manage a read_folio request
16211268fcb3667 David Howells           2022-03-01  217   * @file: The file=
 to read from
6c62371b7fd7762 Matthew Wilcox (Oracle  2022-04-29  218)  * @folio: The fol=
io to read
16211268fcb3667 David Howells           2022-03-01  219   *
6c62371b7fd7762 Matthew Wilcox (Oracle  2022-04-29  220)  * Fulfil a read_f=
olio request by drawing data from the cache if
6c62371b7fd7762 Matthew Wilcox (Oracle  2022-04-29  221)  * possible, or th=
e netfs if not.  Space beyond the EOF is zero-filled.
6c62371b7fd7762 Matthew Wilcox (Oracle  2022-04-29  222)  * Multiple I/O re=
quests from different sources will get munged together.
16211268fcb3667 David Howells           2022-03-01  223   *
16211268fcb3667 David Howells           2022-03-01  224   * The calling net=
fs must initialise a netfs context contiguous to the vfs
16211268fcb3667 David Howells           2022-03-01  225   * inode before ca=
lling this.
16211268fcb3667 David Howells           2022-03-01  226   *
16211268fcb3667 David Howells           2022-03-01  227   * This is usable =
whether or not caching is enabled.
16211268fcb3667 David Howells           2022-03-01  228   */
6c62371b7fd7762 Matthew Wilcox (Oracle  2022-04-29  229) int netfs_read_fol=
io(struct file *file, struct folio *folio)
16211268fcb3667 David Howells           2022-03-01  230  {
16211268fcb3667 David Howells           2022-03-01  231  	struct address_sp=
ace *mapping =3D folio_file_mapping(folio);
16211268fcb3667 David Howells           2022-03-01  232  	struct netfs_io_r=
equest *rreq;
874c8ca1e60b2c5 David Howells           2022-06-09  233  	struct netfs_inod=
e *ctx =3D netfs_inode(mapping->host);
44acd768fad1357 David Howells           2022-01-14  234  	ssize_t ret;
16211268fcb3667 David Howells           2022-03-01  235  =

16211268fcb3667 David Howells           2022-03-01  236  	_enter("%lx", fol=
io_index(folio));
16211268fcb3667 David Howells           2022-03-01  237  =

16211268fcb3667 David Howells           2022-03-01  238  	rreq =3D netfs_al=
loc_request(mapping, file,
16211268fcb3667 David Howells           2022-03-01  239  				   folio_file_=
pos(folio), folio_size(folio),
16211268fcb3667 David Howells           2022-03-01  240  				   NETFS_READP=
AGE);
16211268fcb3667 David Howells           2022-03-01  241  	if (IS_ERR(rreq))=
 {
16211268fcb3667 David Howells           2022-03-01  242  		ret =3D PTR_ERR(=
rreq);
16211268fcb3667 David Howells           2022-03-01  243  		goto alloc_error;
16211268fcb3667 David Howells           2022-03-01  244  	}
16211268fcb3667 David Howells           2022-03-01  245  =

2dc0ef9af0bb9de David Howells           2021-08-10  246  	ret =3D netfs_beg=
in_cache_operation(rreq, ctx);
16211268fcb3667 David Howells           2022-03-01  247  	if (ret =3D=3D -E=
NOMEM || ret =3D=3D -EINTR || ret =3D=3D -ERESTARTSYS)
16211268fcb3667 David Howells           2022-03-01  248  		goto discard;
16211268fcb3667 David Howells           2022-03-01  249  =

16211268fcb3667 David Howells           2022-03-01  250  	netfs_stat(&netfs=
_n_rh_readpage);
16211268fcb3667 David Howells           2022-03-01  251  	trace_netfs_read(=
rreq, rreq->start, rreq->len, netfs_read_trace_readpage);
6e7e799136cd274 David Howells           2021-07-09  252  =

6e7e799136cd274 David Howells           2021-07-09  253  	/* Set up the out=
put buffer */
6e7e799136cd274 David Howells           2021-07-09  254  	rreq->buffering =
=3D NETFS_BUFFER;
6e7e799136cd274 David Howells           2021-07-09  255  	ret =3D netfs_set=
_up_buffer(&rreq->buffer, rreq->mapping, NULL, folio,
6e7e799136cd274 David Howells           2021-07-09  256  				  folio_index(=
folio), folio_nr_pages(folio));
6e7e799136cd274 David Howells           2021-07-09  257  	if (ret < 0)
6e7e799136cd274 David Howells           2021-07-09  258  		goto discard;
6e7e799136cd274 David Howells           2021-07-09  259  =

44acd768fad1357 David Howells           2022-01-14  260  	ret =3D netfs_beg=
in_read(rreq, true);
44acd768fad1357 David Howells           2022-01-14 @261  	return ret < 0 ? =
ret : 0;
16211268fcb3667 David Howells           2022-03-01  262  =

16211268fcb3667 David Howells           2022-03-01  263  discard:
16211268fcb3667 David Howells           2022-03-01  264  	netfs_put_request=
(rreq, false, netfs_rreq_trace_put_discard);
16211268fcb3667 David Howells           2022-03-01  265  alloc_error:
16211268fcb3667 David Howells           2022-03-01  266  	folio_unlock(foli=
o);
16211268fcb3667 David Howells           2022-03-01  267  	return ret;
16211268fcb3667 David Howells           2022-03-01  268  }
6c62371b7fd7762 Matthew Wilcox (Oracle  2022-04-29  269) EXPORT_SYMBOL(netf=
s_read_folio);
16211268fcb3667 David Howells           2022-03-01  270  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2812769974994152347==--

