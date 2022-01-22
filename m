Content-Type: multipart/mixed; boundary="===============2561131686530951256=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cel:topic-rpc-with-tls 9999/9999] net/sunrpc/svcauth_unix.c:814 svcauth_tls_accept() warn: was && intended here instead of ||?
Date: Sat, 22 Jan 2022 13:28:28 +0800
Message-ID: <202201221318.rSSI29vI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2561131686530951256==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Chuck Lever <chuck.lever@oracle.com>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux topic-rpc-w=
ith-tls
head:   a72d5318846d67a7f3f5f2bcb4c0c09c4f8907d1
commit: a72d5318846d67a7f3f5f2bcb4c0c09c4f8907d1 [9999/9999] SUNRPC: Teach =
server to recognize RPC_AUTH_TLS
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: x86_64-randconfig-m001-20220117 (https://download.01.org/0day-ci/ar=
chive/20220122/202201221318.rSSI29vI-lkp(a)intel.com/config)
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

^1da177e4c3f41 Linus Torvalds 2005-04-16  795  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  796  =

a72d5318846d67 Chuck Lever    2021-08-05  797  static int
a72d5318846d67 Chuck Lever    2021-08-05  798  svcauth_tls_accept(struct sv=
c_rqst *rqstp, __be32 *authp)
a72d5318846d67 Chuck Lever    2021-08-05  799  {
a72d5318846d67 Chuck Lever    2021-08-05  800  	struct svc_cred	*cred =3D &=
rqstp->rq_cred;
a72d5318846d67 Chuck Lever    2021-08-05  801  	struct kvec *argv =3D rqstp=
->rq_arg.head;
a72d5318846d67 Chuck Lever    2021-08-05  802  	struct kvec *resv =3D rqstp=
->rq_res.head;
a72d5318846d67 Chuck Lever    2021-08-05  803  =

a72d5318846d67 Chuck Lever    2021-08-05  804  	if (argv->iov_len < XDR_UNI=
T * 3)
a72d5318846d67 Chuck Lever    2021-08-05  805  		return SVC_GARBAGE;
a72d5318846d67 Chuck Lever    2021-08-05  806  =

a72d5318846d67 Chuck Lever    2021-08-05  807  	/* Call's cred length */
a72d5318846d67 Chuck Lever    2021-08-05  808  	if (svc_getu32(argv) !=3D x=
dr_zero) {
a72d5318846d67 Chuck Lever    2021-08-05  809  		*authp =3D rpc_autherr_bad=
cred;
a72d5318846d67 Chuck Lever    2021-08-05  810  		return SVC_DENIED;
a72d5318846d67 Chuck Lever    2021-08-05  811  	}
a72d5318846d67 Chuck Lever    2021-08-05  812  =

a72d5318846d67 Chuck Lever    2021-08-05  813  	/* Call's verifier flavor a=
nd its length */
a72d5318846d67 Chuck Lever    2021-08-05 @814  	if (svc_getu32(argv) !=3D r=
pc_auth_null ||
a72d5318846d67 Chuck Lever    2021-08-05  815  	    svc_getu32(argv) !=3D x=
dr_zero) {
a72d5318846d67 Chuck Lever    2021-08-05  816  		*authp =3D rpc_autherr_bad=
verf;
a72d5318846d67 Chuck Lever    2021-08-05  817  		return SVC_DENIED;
a72d5318846d67 Chuck Lever    2021-08-05  818  	}
a72d5318846d67 Chuck Lever    2021-08-05  819  =

a72d5318846d67 Chuck Lever    2021-08-05  820  	/* AUTH_TLS is not valid on=
 non-NULL procedures */
a72d5318846d67 Chuck Lever    2021-08-05  821  	if (rqstp->rq_proc !=3D 0) {
a72d5318846d67 Chuck Lever    2021-08-05  822  		*authp =3D rpc_autherr_bad=
cred;
a72d5318846d67 Chuck Lever    2021-08-05  823  		return SVC_DENIED;
a72d5318846d67 Chuck Lever    2021-08-05  824  	}
a72d5318846d67 Chuck Lever    2021-08-05  825  =

a72d5318846d67 Chuck Lever    2021-08-05  826  	/* Mapping to nobody uid/gi=
d is required */
a72d5318846d67 Chuck Lever    2021-08-05  827  	cred->cr_uid =3D INVALID_UI=
D;
a72d5318846d67 Chuck Lever    2021-08-05  828  	cred->cr_gid =3D INVALID_GI=
D;
a72d5318846d67 Chuck Lever    2021-08-05  829  	cred->cr_group_info =3D gro=
ups_alloc(0);
a72d5318846d67 Chuck Lever    2021-08-05  830  	if (cred->cr_group_info =3D=
=3D NULL)
a72d5318846d67 Chuck Lever    2021-08-05  831  		return SVC_CLOSE; /* kmall=
oc failure - client must retry */
a72d5318846d67 Chuck Lever    2021-08-05  832  =

a72d5318846d67 Chuck Lever    2021-08-05  833  	/* Reply's verifier */
a72d5318846d67 Chuck Lever    2021-08-05  834  	svc_putnl(resv, RPC_AUTH_NU=
LL);
a72d5318846d67 Chuck Lever    2021-08-05  835  	if (rqstp->rq_xprt->xpt_ops=
->xpo_start_tls) {
a72d5318846d67 Chuck Lever    2021-08-05  836  		svc_putnl(resv, 8);
a72d5318846d67 Chuck Lever    2021-08-05  837  		memcpy(resv->iov_base + re=
sv->iov_len, "STARTTLS", 8);
a72d5318846d67 Chuck Lever    2021-08-05  838  		resv->iov_len +=3D 8;
a72d5318846d67 Chuck Lever    2021-08-05  839  	} else
a72d5318846d67 Chuck Lever    2021-08-05  840  		svc_putnl(resv, 0);
a72d5318846d67 Chuck Lever    2021-08-05  841  =

a72d5318846d67 Chuck Lever    2021-08-05  842  	rqstp->rq_cred.cr_flavor =
=3D RPC_AUTH_TLS;
a72d5318846d67 Chuck Lever    2021-08-05  843  	return SVC_OK;
a72d5318846d67 Chuck Lever    2021-08-05  844  }
a72d5318846d67 Chuck Lever    2021-08-05  845  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2561131686530951256==--

