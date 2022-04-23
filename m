Content-Type: multipart/mixed; boundary="===============7955141373927504108=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:dhowells/linux-fs/netfs-maple 30/44] fs/netfs/direct_read.c:198:17: sparse: sparse: typename in expression
Date: Sat, 23 Apr 2022 20:55:03 +0800
Message-ID: <202204232011.YGgzZkW8-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7955141373927504108==
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
:::::: branch date: 21 hours ago
:::::: commit date: 23 hours ago
config: arc-randconfig-s032-20220422 (https://download.01.org/0day-ci/archi=
ve/20220423/202204232011.YGgzZkW8-lkp(a)intel.com/config)
compiler: arc-elf-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/ammarfaizi2/linux-block/commit/d1c47ebbbed8921=
181b4573ba5736595bc3b787c
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/netfs-maple
        git checkout d1c47ebbbed8921181b4573ba5736595bc3b787c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
rc SHELL=3D/bin/bash fs/netfs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> fs/netfs/direct_read.c:198:17: sparse: sparse: typename in expression
   fs/netfs/direct_read.c:198:26: sparse: sparse: Expected ; at end of stat=
ement
   fs/netfs/direct_read.c:198:26: sparse: sparse: got int
   fs/netfs/direct_read.c:198:17: sparse: sparse: undefined identifier 'uns=
igned'
   fs/netfs/direct_read.c:199:44: sparse: sparse: undefined identifier 'min=
_bsize'
>> fs/netfs/direct_read.c:199:44: sparse: sparse: cast from unknown type
   fs/netfs/direct_read.c:200:42: sparse: sparse: undefined identifier 'min=
_bsize'
   fs/netfs/direct_read.c:200:42: sparse: sparse: cast from unknown type
   fs/netfs/direct_read.c:200:42: sparse: sparse: cast from unknown type
   fs/netfs/direct_read.c:200:42: sparse: sparse: undefined identifier 'min=
_bsize'
   fs/netfs/direct_read.c:200:42: sparse: sparse: cast from unknown type
   fs/netfs/direct_read.c:200:42: sparse: sparse: cast from unknown type
   fs/netfs/direct_read.c:200:42: sparse: sparse: undefined identifier 'min=
_bsize'
   fs/netfs/direct_read.c:200:42: sparse: sparse: cast from unknown type
   fs/netfs/direct_read.c:200:42: sparse: sparse: cast from unknown type
   fs/netfs/direct_read.c:200:42: sparse: sparse: undefined identifier 'min=
_bsize'
   fs/netfs/direct_read.c:200:42: sparse: sparse: cast from unknown type
   fs/netfs/direct_read.c:200:42: sparse: sparse: cast from unknown type
   fs/netfs/direct_read.c:200:42: sparse: sparse: undefined identifier 'min=
_bsize'
   fs/netfs/direct_read.c:200:42: sparse: sparse: cast from unknown type
   fs/netfs/direct_read.c:200:42: sparse: sparse: cast from unknown type

vim +198 fs/netfs/direct_read.c

4efd404b77925f David Howells 2022-01-14  116  =

4efd404b77925f David Howells 2022-01-14  117  /**
4efd404b77925f David Howells 2022-01-14  118   * netfs_direct_read_iter - P=
erform a direct I/O read
4efd404b77925f David Howells 2022-01-14  119   * @iocb: The I/O control des=
criptor describing the read
4efd404b77925f David Howells 2022-01-14  120   * @iter: The output buffer (=
also specifies read length)
4efd404b77925f David Howells 2022-01-14  121   */
4efd404b77925f David Howells 2022-01-14  122  ssize_t netfs_direct_read_ite=
r(struct kiocb *iocb, struct iov_iter *iter)
4efd404b77925f David Howells 2022-01-14  123  {
4efd404b77925f David Howells 2022-01-14  124  	struct netfs_io_request *rre=
q;
d1c47ebbbed892 David Howells 2022-02-17  125  	struct netfs_i_context *ctx;
d1c47ebbbed892 David Howells 2022-02-17  126  	ssize_t n, ret;
4efd404b77925f David Howells 2022-01-14  127  =

4efd404b77925f David Howells 2022-01-14  128  	_enter("");
4efd404b77925f David Howells 2022-01-14  129  =

4efd404b77925f David Howells 2022-01-14  130  	rreq =3D netfs_alloc_request=
(iocb->ki_filp->f_mapping, iocb->ki_filp,
4efd404b77925f David Howells 2022-01-14  131  				   iocb->ki_pos, iov_iter=
_count(iter),
4efd404b77925f David Howells 2022-01-14  132  				   NETFS_DIO_READ);
4efd404b77925f David Howells 2022-01-14  133  	if (IS_ERR(rreq))
4efd404b77925f David Howells 2022-01-14  134  		return PTR_ERR(rreq);
4efd404b77925f David Howells 2022-01-14  135  =

d1c47ebbbed892 David Howells 2022-02-17  136  	ctx =3D netfs_i_context(rreq=
->inode);
4efd404b77925f David Howells 2022-01-14  137  	netfs_stat(&netfs_n_rh_dio_r=
ead);
4efd404b77925f David Howells 2022-01-14  138  	trace_netfs_read(rreq, rreq-=
>start, rreq->len, netfs_read_trace_dio_read);
4efd404b77925f David Howells 2022-01-14  139  =

d1c47ebbbed892 David Howells 2022-02-17  140  	rreq->buffering =3D NETFS_DI=
RECT;
d1c47ebbbed892 David Howells 2022-02-17  141  	if (test_bit(NETFS_RREQ_CONT=
ENT_ENCRYPTION, &rreq->flags)) {
d1c47ebbbed892 David Howells 2022-02-17  142  		static const enum netfs_buf=
fering buffering[2][2] =3D {
d1c47ebbbed892 David Howells 2022-02-17  143  			/* [async][aligned] */
d1c47ebbbed892 David Howells 2022-02-17  144  			[false][false]	=3D NETFS_B=
OUNCE_DEC_COPY,
d1c47ebbbed892 David Howells 2022-02-17  145  			[false][true]	=3D NETFS_BO=
UNCE_DEC_TO_DIRECT,
d1c47ebbbed892 David Howells 2022-02-17  146  			[true ][false]	=3D NETFS_B=
OUNCE_DEC_COPY_BV,
d1c47ebbbed892 David Howells 2022-02-17  147  			[true ][true]	=3D NETFS_BO=
UNCE_DEC_TO_DIRECT_BV,
d1c47ebbbed892 David Howells 2022-02-17  148  		};
d1c47ebbbed892 David Howells 2022-02-17  149  		bool aligned =3D netfs_is_c=
rypto_aligned(rreq, iter);
d1c47ebbbed892 David Howells 2022-02-17  150  		bool async =3D !is_sync_kio=
cb(iocb);
d1c47ebbbed892 David Howells 2022-02-17  151  =

d1c47ebbbed892 David Howells 2022-02-17  152  		rreq->buffering =3D bufferi=
ng[async][aligned];
d1c47ebbbed892 David Howells 2022-02-17  153  	}
d1c47ebbbed892 David Howells 2022-02-17  154  =

d1c47ebbbed892 David Howells 2022-02-17  155  	kdebug("remote_i %llx %llx %=
llx",
d1c47ebbbed892 David Howells 2022-02-17  156  	       ctx->remote_i_size, r=
req->i_size, i_size_read(netfs_inode(ctx)));
4efd404b77925f David Howells 2022-01-14  157  =

4efd404b77925f David Howells 2022-01-14  158  	/* If this is an async op, w=
e have to keep track of the destination
4efd404b77925f David Howells 2022-01-14  159  	 * buffer for ourselves as t=
he caller's iterator will be trashed when
4efd404b77925f David Howells 2022-01-14  160  	 * we return.
4efd404b77925f David Howells 2022-01-14  161  	 *
4efd404b77925f David Howells 2022-01-14  162  	 * In such a case, extract a=
n iterator to represent as much of the the
4efd404b77925f David Howells 2022-01-14  163  	 * output buffer as we can m=
anage.  Note that the extraction might not
4efd404b77925f David Howells 2022-01-14  164  	 * be able to allocate a suf=
ficiently large bvec array and may shorten
4efd404b77925f David Howells 2022-01-14  165  	 * the request.
4efd404b77925f David Howells 2022-01-14  166  	 */
4efd404b77925f David Howells 2022-01-14  167  	switch (rreq->buffering) {
4efd404b77925f David Howells 2022-01-14  168  	case NETFS_DIRECT:
d1c47ebbbed892 David Howells 2022-02-17  169  	case NETFS_BOUNCE_DEC_TO_DIR=
ECT:
d1c47ebbbed892 David Howells 2022-02-17  170  	case NETFS_BOUNCE_DEC_COPY:
4efd404b77925f David Howells 2022-01-14  171  		rreq->direct_iter =3D *iter;
4efd404b77925f David Howells 2022-01-14  172  		rreq->len =3D iov_iter_coun=
t(&rreq->direct_iter);
4efd404b77925f David Howells 2022-01-14  173  		break;
4efd404b77925f David Howells 2022-01-14  174  	case NETFS_DIRECT_BV:
d1c47ebbbed892 David Howells 2022-02-17  175  	case NETFS_BOUNCE_DEC_TO_DIR=
ECT_BV:
d1c47ebbbed892 David Howells 2022-02-17  176  	case NETFS_BOUNCE_DEC_COPY_B=
V:
4efd404b77925f David Howells 2022-01-14  177  		n =3D extract_iter_to_iter(=
iter, rreq->len, &rreq->direct_iter,
4efd404b77925f David Howells 2022-01-14  178  					 &rreq->direct_bv);
4efd404b77925f David Howells 2022-01-14  179  		if (n < 0) {
d1c47ebbbed892 David Howells 2022-02-17  180  			ret =3D n;
d1c47ebbbed892 David Howells 2022-02-17  181  			goto out;
4efd404b77925f David Howells 2022-01-14  182  		}
4efd404b77925f David Howells 2022-01-14  183  		rreq->direct_bv_count =3D n;
4efd404b77925f David Howells 2022-01-14  184  		rreq->len =3D iov_iter_coun=
t(&rreq->direct_iter);
4efd404b77925f David Howells 2022-01-14  185  		break;
4efd404b77925f David Howells 2022-01-14  186  	default:
4efd404b77925f David Howells 2022-01-14  187  		BUG();
4efd404b77925f David Howells 2022-01-14  188  	}
4efd404b77925f David Howells 2022-01-14  189  =

d1c47ebbbed892 David Howells 2022-02-17  190  	/* If we're going to use a b=
ounce buffer, we need to set it up.  We
d1c47ebbbed892 David Howells 2022-02-17  191  	 * will then need to pad the=
 request out to the minimum block size.
d1c47ebbbed892 David Howells 2022-02-17  192  	 */
d1c47ebbbed892 David Howells 2022-02-17  193  	switch (rreq->buffering) {
d1c47ebbbed892 David Howells 2022-02-17  194  	case NETFS_BOUNCE_DEC_TO_DIR=
ECT:
d1c47ebbbed892 David Howells 2022-02-17  195  	case NETFS_BOUNCE_DEC_COPY:
d1c47ebbbed892 David Howells 2022-02-17  196  	case NETFS_BOUNCE_DEC_TO_DIR=
ECT_BV:
d1c47ebbbed892 David Howells 2022-02-17  197  	case NETFS_BOUNCE_DEC_COPY_B=
V:
d1c47ebbbed892 David Howells 2022-02-17 @198  		unsigned int min_bsize =3D =
1ULL << ctx->min_bshift;
d1c47ebbbed892 David Howells 2022-02-17 @199  		unsigned long long start =
=3D round_down(rreq->start, min_bsize);

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7955141373927504108==--

