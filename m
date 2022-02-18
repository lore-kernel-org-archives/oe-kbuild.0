Content-Type: multipart/mixed; boundary="===============1200452675328036105=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cel:topic-rpc-with-tls 9999/9999] net/sunrpc/svcauth_unix.c:814 svcauth_tls_accept() warn: was && intended here instead of ||?
Date: Fri, 18 Feb 2022 11:06:59 +0800
Message-ID: <202202181110.sRoUO7gc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1200452675328036105==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Chuck Lever <chuck.lever@oracle.com>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux topic-rpc-w=
ith-tls
head:   b2635ca75c1014803ce82f7cbbcc09a111852e0a
commit: b2635ca75c1014803ce82f7cbbcc09a111852e0a [9999/9999] SUNRPC: Teach =
server to recognize RPC_AUTH_TLS
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20218/202202181110.sRoUO7gc-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/sunrpc/svcauth_unix.c:814 svcauth_tls_accept() warn: was && intended he=
re instead of ||?

Old smatch warnings:
net/sunrpc/svcauth_unix.c:721 svcauth_unix_set_client() warn: passing zero =
to 'PTR_ERR'
net/sunrpc/svcauth_unix.c:752 svcauth_null_accept() warn: was && intended h=
ere instead of ||?
net/sunrpc/svcauth_unix.c:898 svcauth_unix_accept() warn: was && intended h=
ere instead of ||?

vim +814 net/sunrpc/svcauth_unix.c

^1da177e4c3f415 Linus Torvalds 2005-04-16  795  =

^1da177e4c3f415 Linus Torvalds 2005-04-16  796  =

b2635ca75c10148 Chuck Lever    2021-08-05  797  static int
b2635ca75c10148 Chuck Lever    2021-08-05  798  svcauth_tls_accept(struct s=
vc_rqst *rqstp, __be32 *authp)
b2635ca75c10148 Chuck Lever    2021-08-05  799  {
b2635ca75c10148 Chuck Lever    2021-08-05  800  	struct svc_cred	*cred =3D =
&rqstp->rq_cred;
b2635ca75c10148 Chuck Lever    2021-08-05  801  	struct kvec *argv =3D rqst=
p->rq_arg.head;
b2635ca75c10148 Chuck Lever    2021-08-05  802  	struct kvec *resv =3D rqst=
p->rq_res.head;
b2635ca75c10148 Chuck Lever    2021-08-05  803  =

b2635ca75c10148 Chuck Lever    2021-08-05  804  	if (argv->iov_len < XDR_UN=
IT * 3)
b2635ca75c10148 Chuck Lever    2021-08-05  805  		return SVC_GARBAGE;
b2635ca75c10148 Chuck Lever    2021-08-05  806  =

b2635ca75c10148 Chuck Lever    2021-08-05  807  	/* Call's cred length */
b2635ca75c10148 Chuck Lever    2021-08-05  808  	if (svc_getu32(argv) !=3D =
xdr_zero) {
b2635ca75c10148 Chuck Lever    2021-08-05  809  		*authp =3D rpc_autherr_ba=
dcred;
b2635ca75c10148 Chuck Lever    2021-08-05  810  		return SVC_DENIED;
b2635ca75c10148 Chuck Lever    2021-08-05  811  	}
b2635ca75c10148 Chuck Lever    2021-08-05  812  =

b2635ca75c10148 Chuck Lever    2021-08-05  813  	/* Call's verifier flavor =
and its length */
b2635ca75c10148 Chuck Lever    2021-08-05 @814  	if (svc_getu32(argv) !=3D =
rpc_auth_null ||
b2635ca75c10148 Chuck Lever    2021-08-05  815  	    svc_getu32(argv) !=3D =
xdr_zero) {
b2635ca75c10148 Chuck Lever    2021-08-05  816  		*authp =3D rpc_autherr_ba=
dverf;
b2635ca75c10148 Chuck Lever    2021-08-05  817  		return SVC_DENIED;
b2635ca75c10148 Chuck Lever    2021-08-05  818  	}
b2635ca75c10148 Chuck Lever    2021-08-05  819  =

b2635ca75c10148 Chuck Lever    2021-08-05  820  	/* AUTH_TLS is not valid o=
n non-NULL procedures */
b2635ca75c10148 Chuck Lever    2021-08-05  821  	if (rqstp->rq_proc !=3D 0)=
 {
b2635ca75c10148 Chuck Lever    2021-08-05  822  		*authp =3D rpc_autherr_ba=
dcred;
b2635ca75c10148 Chuck Lever    2021-08-05  823  		return SVC_DENIED;
b2635ca75c10148 Chuck Lever    2021-08-05  824  	}
b2635ca75c10148 Chuck Lever    2021-08-05  825  =

b2635ca75c10148 Chuck Lever    2021-08-05  826  	/* Mapping to nobody uid/g=
id is required */
b2635ca75c10148 Chuck Lever    2021-08-05  827  	cred->cr_uid =3D INVALID_U=
ID;
b2635ca75c10148 Chuck Lever    2021-08-05  828  	cred->cr_gid =3D INVALID_G=
ID;
b2635ca75c10148 Chuck Lever    2021-08-05  829  	cred->cr_group_info =3D gr=
oups_alloc(0);
b2635ca75c10148 Chuck Lever    2021-08-05  830  	if (cred->cr_group_info =
=3D=3D NULL)
b2635ca75c10148 Chuck Lever    2021-08-05  831  		return SVC_CLOSE; /* kmal=
loc failure - client must retry */
b2635ca75c10148 Chuck Lever    2021-08-05  832  =

b2635ca75c10148 Chuck Lever    2021-08-05  833  	/* Reply's verifier */
b2635ca75c10148 Chuck Lever    2021-08-05  834  	svc_putnl(resv, RPC_AUTH_N=
ULL);
b2635ca75c10148 Chuck Lever    2021-08-05  835  	if (rqstp->rq_xprt->xpt_op=
s->xpo_start_tls) {
b2635ca75c10148 Chuck Lever    2021-08-05  836  		svc_putnl(resv, 8);
b2635ca75c10148 Chuck Lever    2021-08-05  837  		memcpy(resv->iov_base + r=
esv->iov_len, "STARTTLS", 8);
b2635ca75c10148 Chuck Lever    2021-08-05  838  		resv->iov_len +=3D 8;
b2635ca75c10148 Chuck Lever    2021-08-05  839  	} else
b2635ca75c10148 Chuck Lever    2021-08-05  840  		svc_putnl(resv, 0);
b2635ca75c10148 Chuck Lever    2021-08-05  841  =

b2635ca75c10148 Chuck Lever    2021-08-05  842  	rqstp->rq_cred.cr_flavor =
=3D RPC_AUTH_TLS;
b2635ca75c10148 Chuck Lever    2021-08-05  843  	return SVC_OK;
b2635ca75c10148 Chuck Lever    2021-08-05  844  }
b2635ca75c10148 Chuck Lever    2021-08-05  845  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1200452675328036105==--

