Content-Type: multipart/mixed; boundary="===============4709629172557080626=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/nfsd/nfs4xdr.c:2004:9: warning: Identical condition 'status', second condition is always false
Date: Tue, 10 Nov 2020 14:02:15 +0800
Message-ID: <202011101408.vO2gD8dm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4709629172557080626==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Frank van der Linden <fllinden@amazon.com>
CC: Chuck Lever <chuck.lever@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   407ab579637ced6dc32cfb2295afb7259cca4b22
commit: 23e50fe3a5e6045a573c69d4b0e3d78aa6183323 nfsd: implement the xattr =
functions and en/decode logic
date:   4 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 4 months ago
compiler: h8300-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> fs/nfsd/nfs4xdr.c:2004:9: warning: Identical condition 'status', second =
condition is always false [identicalConditionAfterEarlyExit]
    return status;
           ^
   fs/nfsd/nfs4xdr.c:1996:6: note: first condition
    if (status)
        ^
   fs/nfsd/nfs4xdr.c:2004:9: note: second condition
    return status;
           ^
   fs/nfsd/nfs4xdr.c:1013:2: warning: Variable 'p' is reassigned a value be=
fore the old one has been used. 'break;' missing? [redundantAssignInSwitch]
    READ_BUF(4);
    ^
   fs/nfsd/nfs4xdr.c:991:4: note: Variable 'p' is reassigned a value before=
 the old one has been used. 'break;' missing?
      COPYMEM(open->op_verf.data, NFS4_VERIFIER_SIZE);
      ^
   fs/nfsd/nfs4xdr.c:1013:2: note: Variable 'p' is reassigned a value befor=
e the old one has been used. 'break;' missing?
    READ_BUF(4);
    ^

vim +/status +2004 fs/nfsd/nfs4xdr.c

23e50fe3a5e6045 Frank van der Linden 2020-06-23  1981  =

23e50fe3a5e6045 Frank van der Linden 2020-06-23  1982  /*
23e50fe3a5e6045 Frank van der Linden 2020-06-23  1983   * A GETXATTR op req=
uest comes without a length specifier. We just set the
23e50fe3a5e6045 Frank van der Linden 2020-06-23  1984   * maximum length fo=
r the reply based on XATTR_SIZE_MAX and the maximum
23e50fe3a5e6045 Frank van der Linden 2020-06-23  1985   * channel reply siz=
e. nfsd_getxattr will probe the length of the xattr,
23e50fe3a5e6045 Frank van der Linden 2020-06-23  1986   * check it against =
getxa_len, and allocate + return the value.
23e50fe3a5e6045 Frank van der Linden 2020-06-23  1987   */
23e50fe3a5e6045 Frank van der Linden 2020-06-23  1988  static __be32
23e50fe3a5e6045 Frank van der Linden 2020-06-23  1989  nfsd4_decode_getxatt=
r(struct nfsd4_compoundargs *argp,
23e50fe3a5e6045 Frank van der Linden 2020-06-23  1990  		      struct nfsd4=
_getxattr *getxattr)
23e50fe3a5e6045 Frank van der Linden 2020-06-23  1991  {
23e50fe3a5e6045 Frank van der Linden 2020-06-23  1992  	__be32 status;
23e50fe3a5e6045 Frank van der Linden 2020-06-23  1993  	u32 maxcount;
23e50fe3a5e6045 Frank van der Linden 2020-06-23  1994  =

23e50fe3a5e6045 Frank van der Linden 2020-06-23  1995  	status =3D nfsd4_de=
code_xattr_name(argp, &getxattr->getxa_name);
23e50fe3a5e6045 Frank van der Linden 2020-06-23  1996  	if (status)
23e50fe3a5e6045 Frank van der Linden 2020-06-23  1997  		return status;
23e50fe3a5e6045 Frank van der Linden 2020-06-23  1998  =

23e50fe3a5e6045 Frank van der Linden 2020-06-23  1999  	maxcount =3D svc_ma=
x_payload(argp->rqstp);
23e50fe3a5e6045 Frank van der Linden 2020-06-23  2000  	maxcount =3D min_t(=
u32, XATTR_SIZE_MAX, maxcount);
23e50fe3a5e6045 Frank van der Linden 2020-06-23  2001  =

23e50fe3a5e6045 Frank van der Linden 2020-06-23  2002  	getxattr->getxa_len=
 =3D maxcount;
23e50fe3a5e6045 Frank van der Linden 2020-06-23  2003  =

23e50fe3a5e6045 Frank van der Linden 2020-06-23 @2004  	return status;
23e50fe3a5e6045 Frank van der Linden 2020-06-23  2005  }
23e50fe3a5e6045 Frank van der Linden 2020-06-23  2006  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4709629172557080626==--

