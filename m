Content-Type: multipart/mixed; boundary="===============5859647923215153574=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:dhowells/linux-fs/netfs-maple 30/44] fs/netfs/direct_read.c:198 netfs_direct_read_iter() warn: statement has no effect 3
Date: Sat, 23 Apr 2022 11:35:27 +0800
Message-ID: <202204231139.gyI23UFz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5859647923215153574==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: David Howells <dhowells@redhat.com>

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/netfs-=
maple
head:   931e50676c6598d0eda1954ead465519ff91874d
commit: d1c47ebbbed8921181b4573ba5736595bc3b787c [30/44] netfs: Support dec=
ryption on DIO read
:::::: branch date: 12 hours ago
:::::: commit date: 14 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
423/202204231139.gyI23UFz-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/netfs/direct_read.c:198 netfs_direct_read_iter() warn: statement has no =
effect 3

vim +198 fs/netfs/direct_read.c

4efd404b77925f9 David Howells 2022-01-14  116  =

4efd404b77925f9 David Howells 2022-01-14  117  /**
4efd404b77925f9 David Howells 2022-01-14  118   * netfs_direct_read_iter - =
Perform a direct I/O read
4efd404b77925f9 David Howells 2022-01-14  119   * @iocb: The I/O control de=
scriptor describing the read
4efd404b77925f9 David Howells 2022-01-14  120   * @iter: The output buffer =
(also specifies read length)
4efd404b77925f9 David Howells 2022-01-14  121   */
4efd404b77925f9 David Howells 2022-01-14  122  ssize_t netfs_direct_read_it=
er(struct kiocb *iocb, struct iov_iter *iter)
4efd404b77925f9 David Howells 2022-01-14  123  {
4efd404b77925f9 David Howells 2022-01-14  124  	struct netfs_io_request *rr=
eq;
d1c47ebbbed8921 David Howells 2022-02-17  125  	struct netfs_i_context *ctx;
d1c47ebbbed8921 David Howells 2022-02-17  126  	ssize_t n, ret;
4efd404b77925f9 David Howells 2022-01-14  127  =

4efd404b77925f9 David Howells 2022-01-14  128  	_enter("");
4efd404b77925f9 David Howells 2022-01-14  129  =

4efd404b77925f9 David Howells 2022-01-14  130  	rreq =3D netfs_alloc_reques=
t(iocb->ki_filp->f_mapping, iocb->ki_filp,
4efd404b77925f9 David Howells 2022-01-14  131  				   iocb->ki_pos, iov_ite=
r_count(iter),
4efd404b77925f9 David Howells 2022-01-14  132  				   NETFS_DIO_READ);
4efd404b77925f9 David Howells 2022-01-14  133  	if (IS_ERR(rreq))
4efd404b77925f9 David Howells 2022-01-14  134  		return PTR_ERR(rreq);
4efd404b77925f9 David Howells 2022-01-14  135  =

d1c47ebbbed8921 David Howells 2022-02-17  136  	ctx =3D netfs_i_context(rre=
q->inode);
4efd404b77925f9 David Howells 2022-01-14  137  	netfs_stat(&netfs_n_rh_dio_=
read);
4efd404b77925f9 David Howells 2022-01-14  138  	trace_netfs_read(rreq, rreq=
->start, rreq->len, netfs_read_trace_dio_read);
4efd404b77925f9 David Howells 2022-01-14  139  =

d1c47ebbbed8921 David Howells 2022-02-17  140  	rreq->buffering =3D NETFS_D=
IRECT;
d1c47ebbbed8921 David Howells 2022-02-17  141  	if (test_bit(NETFS_RREQ_CON=
TENT_ENCRYPTION, &rreq->flags)) {
d1c47ebbbed8921 David Howells 2022-02-17  142  		static const enum netfs_bu=
ffering buffering[2][2] =3D {
d1c47ebbbed8921 David Howells 2022-02-17  143  			/* [async][aligned] */
d1c47ebbbed8921 David Howells 2022-02-17  144  			[false][false]	=3D NETFS_=
BOUNCE_DEC_COPY,
d1c47ebbbed8921 David Howells 2022-02-17  145  			[false][true]	=3D NETFS_B=
OUNCE_DEC_TO_DIRECT,
d1c47ebbbed8921 David Howells 2022-02-17  146  			[true ][false]	=3D NETFS_=
BOUNCE_DEC_COPY_BV,
d1c47ebbbed8921 David Howells 2022-02-17  147  			[true ][true]	=3D NETFS_B=
OUNCE_DEC_TO_DIRECT_BV,
d1c47ebbbed8921 David Howells 2022-02-17  148  		};
d1c47ebbbed8921 David Howells 2022-02-17  149  		bool aligned =3D netfs_is_=
crypto_aligned(rreq, iter);
d1c47ebbbed8921 David Howells 2022-02-17  150  		bool async =3D !is_sync_ki=
ocb(iocb);
d1c47ebbbed8921 David Howells 2022-02-17  151  =

d1c47ebbbed8921 David Howells 2022-02-17  152  		rreq->buffering =3D buffer=
ing[async][aligned];
d1c47ebbbed8921 David Howells 2022-02-17  153  	}
d1c47ebbbed8921 David Howells 2022-02-17  154  =

d1c47ebbbed8921 David Howells 2022-02-17  155  	kdebug("remote_i %llx %llx =
%llx",
d1c47ebbbed8921 David Howells 2022-02-17  156  	       ctx->remote_i_size, =
rreq->i_size, i_size_read(netfs_inode(ctx)));
4efd404b77925f9 David Howells 2022-01-14  157  =

4efd404b77925f9 David Howells 2022-01-14  158  	/* If this is an async op, =
we have to keep track of the destination
4efd404b77925f9 David Howells 2022-01-14  159  	 * buffer for ourselves as =
the caller's iterator will be trashed when
4efd404b77925f9 David Howells 2022-01-14  160  	 * we return.
4efd404b77925f9 David Howells 2022-01-14  161  	 *
4efd404b77925f9 David Howells 2022-01-14  162  	 * In such a case, extract =
an iterator to represent as much of the the
4efd404b77925f9 David Howells 2022-01-14  163  	 * output buffer as we can =
manage.  Note that the extraction might not
4efd404b77925f9 David Howells 2022-01-14  164  	 * be able to allocate a su=
fficiently large bvec array and may shorten
4efd404b77925f9 David Howells 2022-01-14  165  	 * the request.
4efd404b77925f9 David Howells 2022-01-14  166  	 */
4efd404b77925f9 David Howells 2022-01-14  167  	switch (rreq->buffering) {
4efd404b77925f9 David Howells 2022-01-14  168  	case NETFS_DIRECT:
d1c47ebbbed8921 David Howells 2022-02-17  169  	case NETFS_BOUNCE_DEC_TO_DI=
RECT:
d1c47ebbbed8921 David Howells 2022-02-17  170  	case NETFS_BOUNCE_DEC_COPY:
4efd404b77925f9 David Howells 2022-01-14  171  		rreq->direct_iter =3D *ite=
r;
4efd404b77925f9 David Howells 2022-01-14  172  		rreq->len =3D iov_iter_cou=
nt(&rreq->direct_iter);
4efd404b77925f9 David Howells 2022-01-14  173  		break;
4efd404b77925f9 David Howells 2022-01-14  174  	case NETFS_DIRECT_BV:
d1c47ebbbed8921 David Howells 2022-02-17  175  	case NETFS_BOUNCE_DEC_TO_DI=
RECT_BV:
d1c47ebbbed8921 David Howells 2022-02-17  176  	case NETFS_BOUNCE_DEC_COPY_=
BV:
4efd404b77925f9 David Howells 2022-01-14  177  		n =3D extract_iter_to_iter=
(iter, rreq->len, &rreq->direct_iter,
4efd404b77925f9 David Howells 2022-01-14  178  					 &rreq->direct_bv);
4efd404b77925f9 David Howells 2022-01-14  179  		if (n < 0) {
d1c47ebbbed8921 David Howells 2022-02-17  180  			ret =3D n;
d1c47ebbbed8921 David Howells 2022-02-17  181  			goto out;
4efd404b77925f9 David Howells 2022-01-14  182  		}
4efd404b77925f9 David Howells 2022-01-14  183  		rreq->direct_bv_count =3D =
n;
4efd404b77925f9 David Howells 2022-01-14  184  		rreq->len =3D iov_iter_cou=
nt(&rreq->direct_iter);
4efd404b77925f9 David Howells 2022-01-14  185  		break;
4efd404b77925f9 David Howells 2022-01-14  186  	default:
4efd404b77925f9 David Howells 2022-01-14  187  		BUG();
4efd404b77925f9 David Howells 2022-01-14  188  	}
4efd404b77925f9 David Howells 2022-01-14  189  =

d1c47ebbbed8921 David Howells 2022-02-17  190  	/* If we're going to use a =
bounce buffer, we need to set it up.  We
d1c47ebbbed8921 David Howells 2022-02-17  191  	 * will then need to pad th=
e request out to the minimum block size.
d1c47ebbbed8921 David Howells 2022-02-17  192  	 */
d1c47ebbbed8921 David Howells 2022-02-17  193  	switch (rreq->buffering) {
d1c47ebbbed8921 David Howells 2022-02-17  194  	case NETFS_BOUNCE_DEC_TO_DI=
RECT:
d1c47ebbbed8921 David Howells 2022-02-17  195  	case NETFS_BOUNCE_DEC_COPY:
d1c47ebbbed8921 David Howells 2022-02-17  196  	case NETFS_BOUNCE_DEC_TO_DI=
RECT_BV:
d1c47ebbbed8921 David Howells 2022-02-17  197  	case NETFS_BOUNCE_DEC_COPY_=
BV:
d1c47ebbbed8921 David Howells 2022-02-17 @198  		unsigned int min_bsize =3D=
 1ULL << ctx->min_bshift;

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5859647923215153574==--

