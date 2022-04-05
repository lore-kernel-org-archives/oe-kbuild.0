Content-Type: multipart/mixed; boundary="===============1355231771752704658=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:dhowells/linux-fs/netfs-maple 28/40] fs/netfs/direct_read.c:193 netfs_direct_read_iter() warn: statement has no effect 3
Date: Tue, 05 Apr 2022 14:21:52 +0800
Message-ID: <202204051443.yYetEnPy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1355231771752704658==
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
head:   674eea41fc70a740ff83ec590f9833f805852464
commit: 86ffcdd2a1cb7c858063208fdfb7abe941bc0b9e [28/40] netfs: Support dec=
ryption on DIO read
:::::: branch date: 14 hours ago
:::::: commit date: 15 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20405/202204051443.yYetEnPy-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/netfs/direct_read.c:193 netfs_direct_read_iter() warn: statement has no =
effect 3

vim +193 fs/netfs/direct_read.c

be1bb787e99ec1 David Howells 2022-01-14  111  =

be1bb787e99ec1 David Howells 2022-01-14  112  /**
be1bb787e99ec1 David Howells 2022-01-14  113   * netfs_direct_read_iter - P=
erform a direct I/O read
be1bb787e99ec1 David Howells 2022-01-14  114   * @iocb: The I/O control des=
criptor describing the read
be1bb787e99ec1 David Howells 2022-01-14  115   * @iter: The output buffer (=
also specifies read length)
be1bb787e99ec1 David Howells 2022-01-14  116   */
be1bb787e99ec1 David Howells 2022-01-14  117  ssize_t netfs_direct_read_ite=
r(struct kiocb *iocb, struct iov_iter *iter)
be1bb787e99ec1 David Howells 2022-01-14  118  {
be1bb787e99ec1 David Howells 2022-01-14  119  	struct netfs_io_request *rre=
q;
86ffcdd2a1cb7c David Howells 2022-02-17  120  	struct netfs_i_context *ctx;
86ffcdd2a1cb7c David Howells 2022-02-17  121  	ssize_t n, ret;
be1bb787e99ec1 David Howells 2022-01-14  122  =

be1bb787e99ec1 David Howells 2022-01-14  123  	_enter("");
be1bb787e99ec1 David Howells 2022-01-14  124  =

be1bb787e99ec1 David Howells 2022-01-14  125  	rreq =3D netfs_alloc_request=
(iocb->ki_filp->f_mapping, iocb->ki_filp,
be1bb787e99ec1 David Howells 2022-01-14  126  				   iocb->ki_pos, iov_iter=
_count(iter),
be1bb787e99ec1 David Howells 2022-01-14  127  				   NETFS_DIO_READ);
be1bb787e99ec1 David Howells 2022-01-14  128  	if (IS_ERR(rreq))
be1bb787e99ec1 David Howells 2022-01-14  129  		return PTR_ERR(rreq);
be1bb787e99ec1 David Howells 2022-01-14  130  =

86ffcdd2a1cb7c David Howells 2022-02-17  131  	ctx =3D netfs_i_context(rreq=
->inode);
be1bb787e99ec1 David Howells 2022-01-14  132  	netfs_stat(&netfs_n_rh_dio_r=
ead);
be1bb787e99ec1 David Howells 2022-01-14  133  	trace_netfs_read(rreq, rreq-=
>start, rreq->len, netfs_read_trace_dio_read);
be1bb787e99ec1 David Howells 2022-01-14  134  =

86ffcdd2a1cb7c David Howells 2022-02-17  135  	rreq->buffering =3D NETFS_DI=
RECT;
86ffcdd2a1cb7c David Howells 2022-02-17  136  	if (test_bit(NETFS_RREQ_CONT=
ENT_ENCRYPTION, &rreq->flags)) {
86ffcdd2a1cb7c David Howells 2022-02-17  137  		static const enum netfs_buf=
fering buffering[2][2] =3D {
86ffcdd2a1cb7c David Howells 2022-02-17  138  			/* [async][aligned] */
86ffcdd2a1cb7c David Howells 2022-02-17  139  			[false][false]	=3D NETFS_B=
OUNCE_DEC_COPY,
86ffcdd2a1cb7c David Howells 2022-02-17  140  			[false][true]	=3D NETFS_BO=
UNCE_DEC_TO_DIRECT,
86ffcdd2a1cb7c David Howells 2022-02-17  141  			[true ][false]	=3D NETFS_B=
OUNCE_DEC_COPY_BV,
86ffcdd2a1cb7c David Howells 2022-02-17  142  			[true ][true]	=3D NETFS_BO=
UNCE_DEC_TO_DIRECT_BV,
86ffcdd2a1cb7c David Howells 2022-02-17  143  		};
86ffcdd2a1cb7c David Howells 2022-02-17  144  		bool aligned =3D netfs_is_c=
rypto_aligned(rreq, iter);
86ffcdd2a1cb7c David Howells 2022-02-17  145  		bool async =3D !is_sync_kio=
cb(iocb);
86ffcdd2a1cb7c David Howells 2022-02-17  146  =

86ffcdd2a1cb7c David Howells 2022-02-17  147  		rreq->buffering =3D bufferi=
ng[async][aligned];
86ffcdd2a1cb7c David Howells 2022-02-17  148  	}
86ffcdd2a1cb7c David Howells 2022-02-17  149  =

86ffcdd2a1cb7c David Howells 2022-02-17  150  	kdebug("remote_i %llx %llx %=
llx",
86ffcdd2a1cb7c David Howells 2022-02-17  151  	       ctx->remote_i_size, r=
req->i_size, i_size_read(netfs_inode(ctx)));
be1bb787e99ec1 David Howells 2022-01-14  152  =

be1bb787e99ec1 David Howells 2022-01-14  153  	/* If this is an async op, w=
e have to keep track of the destination
be1bb787e99ec1 David Howells 2022-01-14  154  	 * buffer for ourselves as t=
he caller's iterator will be trashed when
be1bb787e99ec1 David Howells 2022-01-14  155  	 * we return.
be1bb787e99ec1 David Howells 2022-01-14  156  	 *
be1bb787e99ec1 David Howells 2022-01-14  157  	 * In such a case, extract a=
n iterator to represent as much of the the
be1bb787e99ec1 David Howells 2022-01-14  158  	 * output buffer as we can m=
anage.  Note that the extraction might not
be1bb787e99ec1 David Howells 2022-01-14  159  	 * be able to allocate a suf=
ficiently large bvec array and may shorten
be1bb787e99ec1 David Howells 2022-01-14  160  	 * the request.
be1bb787e99ec1 David Howells 2022-01-14  161  	 */
be1bb787e99ec1 David Howells 2022-01-14  162  	switch (rreq->buffering) {
be1bb787e99ec1 David Howells 2022-01-14  163  	case NETFS_DIRECT:
86ffcdd2a1cb7c David Howells 2022-02-17  164  	case NETFS_BOUNCE_DEC_TO_DIR=
ECT:
86ffcdd2a1cb7c David Howells 2022-02-17  165  	case NETFS_BOUNCE_DEC_COPY:
be1bb787e99ec1 David Howells 2022-01-14  166  		rreq->direct_iter =3D *iter;
be1bb787e99ec1 David Howells 2022-01-14  167  		rreq->len =3D iov_iter_coun=
t(&rreq->direct_iter);
be1bb787e99ec1 David Howells 2022-01-14  168  		break;
be1bb787e99ec1 David Howells 2022-01-14  169  	case NETFS_DIRECT_BV:
86ffcdd2a1cb7c David Howells 2022-02-17  170  	case NETFS_BOUNCE_DEC_TO_DIR=
ECT_BV:
86ffcdd2a1cb7c David Howells 2022-02-17  171  	case NETFS_BOUNCE_DEC_COPY_B=
V:
be1bb787e99ec1 David Howells 2022-01-14  172  		n =3D extract_iter_to_iter(=
iter, rreq->len, &rreq->direct_iter,
be1bb787e99ec1 David Howells 2022-01-14  173  					 &rreq->direct_bv);
be1bb787e99ec1 David Howells 2022-01-14  174  		if (n < 0) {
86ffcdd2a1cb7c David Howells 2022-02-17  175  			ret =3D n;
86ffcdd2a1cb7c David Howells 2022-02-17  176  			goto out;
be1bb787e99ec1 David Howells 2022-01-14  177  		}
be1bb787e99ec1 David Howells 2022-01-14  178  		rreq->direct_bv_count =3D n;
be1bb787e99ec1 David Howells 2022-01-14  179  		rreq->len =3D iov_iter_coun=
t(&rreq->direct_iter);
be1bb787e99ec1 David Howells 2022-01-14  180  		break;
be1bb787e99ec1 David Howells 2022-01-14  181  	default:
be1bb787e99ec1 David Howells 2022-01-14  182  		BUG();
be1bb787e99ec1 David Howells 2022-01-14  183  	}
be1bb787e99ec1 David Howells 2022-01-14  184  =

86ffcdd2a1cb7c David Howells 2022-02-17  185  	/* If we're going to use a b=
ounce buffer, we need to set it up.  We
86ffcdd2a1cb7c David Howells 2022-02-17  186  	 * will then need to pad the=
 request out to the minimum block size.
86ffcdd2a1cb7c David Howells 2022-02-17  187  	 */
86ffcdd2a1cb7c David Howells 2022-02-17  188  	switch (rreq->buffering) {
86ffcdd2a1cb7c David Howells 2022-02-17  189  	case NETFS_BOUNCE_DEC_TO_DIR=
ECT:
86ffcdd2a1cb7c David Howells 2022-02-17  190  	case NETFS_BOUNCE_DEC_COPY:
86ffcdd2a1cb7c David Howells 2022-02-17  191  	case NETFS_BOUNCE_DEC_TO_DIR=
ECT_BV:
86ffcdd2a1cb7c David Howells 2022-02-17  192  	case NETFS_BOUNCE_DEC_COPY_B=
V:
86ffcdd2a1cb7c David Howells 2022-02-17 @193  		unsigned int min_bsize =3D =
1ULL << ctx->min_bshift;

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1355231771752704658==--

