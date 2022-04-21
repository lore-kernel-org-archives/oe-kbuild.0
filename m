Content-Type: multipart/mixed; boundary="===============8601739070580902369=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [dhowells-fs:netfs-lib 14/18] fs/netfs/buffered_read.c:262:12-13: WARNING opportunity for min()
Date: Fri, 22 Apr 2022 02:02:25 +0800
Message-ID: <202204220135.nOoiG5PE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8601739070580902369==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.g=
it netfs-lib
head:   5b166ee5742c8a13e2958bad90e4b3a5d9bb0426
commit: c651efa781eff30c846758de8e504163e8095a26 [14/18] netfs: Implement s=
upport for DIO read
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-c023-20220421 (https://download.01.org/0day-ci/=
archive/20220422/202204220135.nOoiG5PE-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> fs/netfs/buffered_read.c:262:12-13: WARNING opportunity for min()

vim +262 fs/netfs/buffered_read.c

16211268fcb366 David Howells 2022-03-01  214  =

16211268fcb366 David Howells 2022-03-01  215  /**
16211268fcb366 David Howells 2022-03-01  216   * netfs_readpage - Helper to=
 manage a readpage request
16211268fcb366 David Howells 2022-03-01  217   * @file: The file to read fr=
om
16211268fcb366 David Howells 2022-03-01  218   * @subpage: A subpage of the=
 folio to read
16211268fcb366 David Howells 2022-03-01  219   *
16211268fcb366 David Howells 2022-03-01  220   * Fulfil a readpage request =
by drawing data from the cache if possible, or the
16211268fcb366 David Howells 2022-03-01  221   * netfs if not.  Space beyon=
d the EOF is zero-filled.  Multiple I/O requests
16211268fcb366 David Howells 2022-03-01  222   * from different sources wil=
l get munged together.
16211268fcb366 David Howells 2022-03-01  223   *
16211268fcb366 David Howells 2022-03-01  224   * The calling netfs must ini=
tialise a netfs context contiguous to the vfs
16211268fcb366 David Howells 2022-03-01  225   * inode before calling this.
16211268fcb366 David Howells 2022-03-01  226   *
16211268fcb366 David Howells 2022-03-01  227   * This is usable whether or =
not caching is enabled.
16211268fcb366 David Howells 2022-03-01  228   */
16211268fcb366 David Howells 2022-03-01  229  int netfs_readpage(struct fil=
e *file, struct page *subpage)
16211268fcb366 David Howells 2022-03-01  230  {
16211268fcb366 David Howells 2022-03-01  231  	struct folio *folio =3D page=
_folio(subpage);
16211268fcb366 David Howells 2022-03-01  232  	struct address_space *mappin=
g =3D folio_file_mapping(folio);
16211268fcb366 David Howells 2022-03-01  233  	struct netfs_io_request *rre=
q;
16211268fcb366 David Howells 2022-03-01  234  	struct netfs_i_context *ctx =
=3D netfs_i_context(mapping->host);
c651efa781eff3 David Howells 2022-01-14  235  	ssize_t ret;
16211268fcb366 David Howells 2022-03-01  236  =

16211268fcb366 David Howells 2022-03-01  237  	_enter("%lx", folio_index(fo=
lio));
16211268fcb366 David Howells 2022-03-01  238  =

16211268fcb366 David Howells 2022-03-01  239  	rreq =3D netfs_alloc_request=
(mapping, file,
16211268fcb366 David Howells 2022-03-01  240  				   folio_file_pos(folio),=
 folio_size(folio),
16211268fcb366 David Howells 2022-03-01  241  				   NETFS_READPAGE);
16211268fcb366 David Howells 2022-03-01  242  	if (IS_ERR(rreq)) {
16211268fcb366 David Howells 2022-03-01  243  		ret =3D PTR_ERR(rreq);
16211268fcb366 David Howells 2022-03-01  244  		goto alloc_error;
16211268fcb366 David Howells 2022-03-01  245  	}
16211268fcb366 David Howells 2022-03-01  246  =

75e3a30e9a3f57 David Howells 2021-08-10  247  	ret =3D netfs_begin_cache_op=
eration(rreq, ctx);
16211268fcb366 David Howells 2022-03-01  248  	if (ret =3D=3D -ENOMEM || re=
t =3D=3D -EINTR || ret =3D=3D -ERESTARTSYS)
16211268fcb366 David Howells 2022-03-01  249  		goto discard;
16211268fcb366 David Howells 2022-03-01  250  =

16211268fcb366 David Howells 2022-03-01  251  	netfs_stat(&netfs_n_rh_readp=
age);
16211268fcb366 David Howells 2022-03-01  252  	trace_netfs_read(rreq, rreq-=
>start, rreq->len, netfs_read_trace_readpage);
b0bb28c75e708e David Howells 2021-07-09  253  =

b0bb28c75e708e David Howells 2021-07-09  254  	/* Set up the output buffer =
*/
b0bb28c75e708e David Howells 2021-07-09  255  	rreq->buffering =3D NETFS_BU=
FFER;
b0bb28c75e708e David Howells 2021-07-09  256  	ret =3D netfs_set_up_buffer(=
&rreq->buffer, rreq->mapping, NULL, folio,
b0bb28c75e708e David Howells 2021-07-09  257  				  folio_index(folio), fol=
io_nr_pages(folio));
b0bb28c75e708e David Howells 2021-07-09  258  	if (ret < 0)
b0bb28c75e708e David Howells 2021-07-09  259  		goto discard;
b0bb28c75e708e David Howells 2021-07-09  260  =

c651efa781eff3 David Howells 2022-01-14  261  	ret =3D netfs_begin_read(rre=
q, true);
c651efa781eff3 David Howells 2022-01-14 @262  	return ret < 0 ? ret : 0;
16211268fcb366 David Howells 2022-03-01  263  =

16211268fcb366 David Howells 2022-03-01  264  discard:
16211268fcb366 David Howells 2022-03-01  265  	netfs_put_request(rreq, fals=
e, netfs_rreq_trace_put_discard);
16211268fcb366 David Howells 2022-03-01  266  alloc_error:
16211268fcb366 David Howells 2022-03-01  267  	folio_unlock(folio);
16211268fcb366 David Howells 2022-03-01  268  	return ret;
16211268fcb366 David Howells 2022-03-01  269  }
16211268fcb366 David Howells 2022-03-01  270  EXPORT_SYMBOL(netfs_readpage);
16211268fcb366 David Howells 2022-03-01  271  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8601739070580902369==--

