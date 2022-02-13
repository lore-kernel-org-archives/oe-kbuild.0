Content-Type: multipart/mixed; boundary="===============4650971714550233794=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/nfsd/nfs4state.c:3627:19: warning: Access to field 'cn_flags' results in a dereference of an undefined pointer value (loaded from variable 'conn') [clang-analyzer-core.NullDereference]
Date: Sun, 13 Feb 2022 14:36:11 +0800
Message-ID: <202202131440.w39JB2NU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4650971714550233794==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Dai Ngo <dai.ngo@oracle.com>
CC: Chuck Lever <chuck.lever@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b81b1829e7e39f6cebdf6e4d5484eacbceda8554
commit: 02579b2ff8b0becfb51d85a975908ac4ab15fba8 nfsd: back channel stuck i=
n SEQ4_STATUS_CB_PATH_DOWN
date:   5 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 5 months ago
config: arm-randconfig-c002-20220213 (https://download.01.org/0day-ci/archi=
ve/20220213/202202131440.w39JB2NU-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c7eb84=
634519e6497be42f5fe323f9a04ed67127)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D02579b2ff8b0becfb51d85a975908ac4ab15fba8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 02579b2ff8b0becfb51d85a975908ac4ab15fba8
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   fs/nfsd/nfs4state.c:1825:7: note: Loop condition is false.  Exiting loop
                   c =3D list_first_entry(&s->se_conns, struct nfsd4_conn, =
cn_persession);
                       ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   fs/nfsd/nfs4state.c:1830:3: note: Calling 'free_conn'
                   free_conn(c);
                   ^~~~~~~~~~~~
   fs/nfsd/nfs4state.c:1741:2: note: Memory is released
           kfree(c);
           ^~~~~~~~
   fs/nfsd/nfs4state.c:1830:3: note: Returning; memory was released via 1st=
 parameter
                   free_conn(c);
                   ^~~~~~~~~~~~
   fs/nfsd/nfs4state.c:1824:2: note: Loop condition is true.  Entering loop=
 body
           while (!list_empty(&s->se_conns)) {
           ^
   fs/nfsd/nfs4state.c:1825:7: note: Left side of '&&' is false
                   c =3D list_first_entry(&s->se_conns, struct nfsd4_conn, =
cn_persession);
                       ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   fs/nfsd/nfs4state.c:1825:7: note: Taking false branch
                   c =3D list_first_entry(&s->se_conns, struct nfsd4_conn, =
cn_persession);
                       ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   fs/nfsd/nfs4state.c:1825:7: note: Loop condition is false.  Exiting loop
                   c =3D list_first_entry(&s->se_conns, struct nfsd4_conn, =
cn_persession);
                       ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   fs/nfsd/nfs4state.c:1829:23: note: Use of memory after it is freed
                   unregister_xpt_user(c->cn_xprt, &c->cn_xpt_user);
                                       ^~~~~~~~~~
>> fs/nfsd/nfs4state.c:3627:19: warning: Access to field 'cn_flags' results=
 in a dereference of an undefined pointer value (loaded from variable 'conn=
') [clang-analyzer-core.NullDereference]
                           conn->cn_flags |=3D NFS4_CDFC4_BACK;
                           ~~~~           ^
   fs/nfsd/nfs4state.c:3607:2: note: 'conn' declared without an initial val=
ue
           struct nfsd4_conn *conn;
           ^~~~~~~~~~~~~~~~~~~~~~~
   fs/nfsd/nfs4state.c:3609:28: note: Assuming field 'rq_xprt' is null
           struct net *net =3D SVC_NET(rqstp);
                                     ^
   include/linux/sunrpc/svc.h:311:24: note: expanded from macro 'SVC_NET'
   #define SVC_NET(rqst) (rqst->rq_xprt ? rqst->rq_xprt->xpt_net : rqst->rq=
_bc_net)
                          ^~~~~~~~~~~~~
   fs/nfsd/nfs4state.c:3609:28: note: '?' condition is false
           struct net *net =3D SVC_NET(rqstp);
                                     ^
   fs/nfsd/nfs4state.c:3612:7: note: Calling 'nfsd4_last_compound_op'
           if (!nfsd4_last_compound_op(rqstp))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfsd/xdr4.h:738:9: note: Assuming 'argp->opcnt' is equal to 'resp->op=
cnt'
           return argp->opcnt =3D=3D resp->opcnt;
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfsd/xdr4.h:738:2: note: Returning the value 1, which participates in=
 a condition later
           return argp->opcnt =3D=3D resp->opcnt;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfsd/nfs4state.c:3612:7: note: Returning from 'nfsd4_last_compound_op'
           if (!nfsd4_last_compound_op(rqstp))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfsd/nfs4state.c:3612:2: note: Taking false branch
           if (!nfsd4_last_compound_op(rqstp))
           ^
   fs/nfsd/nfs4state.c:3615:12: note: Calling 'find_in_sessionid_hashtbl'
           session =3D find_in_sessionid_hashtbl(&bcts->sessionid, net, &st=
atus);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   fs/nfsd/nfs4state.c:1917:6: note: Assuming 'session' is non-null, which =
participates in a condition later
           if (!session)
               ^~~~~~~~
   fs/nfsd/nfs4state.c:1917:2: note: Taking false branch
           if (!session)
           ^
   fs/nfsd/nfs4state.c:1920:6: note: Assuming 'status' is 0
           if (status)
               ^~~~~~
   fs/nfsd/nfs4state.c:1920:2: note: Taking false branch
           if (status)
           ^
   fs/nfsd/nfs4state.c:1924:2: note: Returning pointer (loaded from 'sessio=
n'), which participates in a condition later
           return session;
           ^~~~~~~~~~~~~~
   fs/nfsd/nfs4state.c:3615:12: note: Returning from 'find_in_sessionid_has=
htbl'
           session =3D find_in_sessionid_hashtbl(&bcts->sessionid, net, &st=
atus);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   fs/nfsd/nfs4state.c:3617:7: note: 'session' is non-null
           if (!session)
                ^~~~~~~
   fs/nfsd/nfs4state.c:3617:2: note: Taking false branch
           if (!session)
           ^
   fs/nfsd/nfs4state.c:3620:7: note: Calling 'nfsd4_mach_creds_match'
           if (!nfsd4_mach_creds_match(session->se_client, rqstp))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfsd/nfs4state.c:2283:6: note: Assuming field 'cl_mach_cred' is false=
, which participates in a condition later
           if (!cl->cl_mach_cred)
               ^~~~~~~~~~~~~~~~~
   fs/nfsd/nfs4state.c:2283:2: note: Taking true branch
           if (!cl->cl_mach_cred)
           ^
   fs/nfsd/nfs4state.c:2284:3: note: Returning the value 1, which participa=
tes in a condition later
                   return true;
                   ^~~~~~~~~~~
   fs/nfsd/nfs4state.c:3620:7: note: Returning from 'nfsd4_mach_creds_match'
           if (!nfsd4_mach_creds_match(session->se_client, rqstp))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfsd/nfs4state.c:3620:2: note: Taking false branch
           if (!nfsd4_mach_creds_match(session->se_client, rqstp))
           ^
   fs/nfsd/nfs4state.c:3622:11: note: Calling 'nfsd4_match_existing_connect=
ion'
           status =3D nfsd4_match_existing_connection(rqstp, session,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfsd/nfs4state.c:3583:6: note: Assuming 'c' is null
           if (!c)
               ^~
   fs/nfsd/nfs4state.c:3583:2: note: Taking true branch
           if (!c)
           ^
   fs/nfsd/nfs4state.c:3596:6: note: Assuming the condition is false
           if (status =3D=3D nfs_ok && conn)
               ^~~~~~~~~~~~~~~~
   fs/nfsd/nfs4state.c:3596:23: note: Left side of '&&' is false
           if (status =3D=3D nfs_ok && conn)
                                ^
   fs/nfsd/nfs4state.c:3598:2: note: Returning without writing to '*conn'
           return status;
           ^
   fs/nfsd/nfs4state.c:3622:11: note: Returning from 'nfsd4_match_existing_=
connection'
           status =3D nfsd4_match_existing_connection(rqstp, session,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfsd/nfs4state.c:3624:6: note: Assuming the condition is true
           if (status =3D=3D nfs_ok) {
               ^~~~~~~~~~~~~~~~
   fs/nfsd/nfs4state.c:3624:2: note: Taking true branch
           if (status =3D=3D nfs_ok) {

vim +3627 fs/nfsd/nfs4state.c

c2d715a1af7544 J. Bruce Fields      2020-04-27  3600  =

1d1bc8f2074f0b J. Bruce Fields      2010-10-04  3601  __be32 nfsd4_bind_con=
n_to_session(struct svc_rqst *rqstp,
1d1bc8f2074f0b J. Bruce Fields      2010-10-04  3602  		     struct nfsd4_c=
ompound_state *cstate,
eb69853da94592 Christoph Hellwig    2017-05-08  3603  		     union nfsd4_op=
_u *u)
1d1bc8f2074f0b J. Bruce Fields      2010-10-04  3604  {
eb69853da94592 Christoph Hellwig    2017-05-08  3605  	struct nfsd4_bind_co=
nn_to_session *bcts =3D &u->bind_conn_to_session;
1d1bc8f2074f0b J. Bruce Fields      2010-10-04  3606  	__be32 status;
3ba6367124f3f0 J. Bruce Fields      2012-09-11  3607  	struct nfsd4_conn *c=
onn;
4f6e6c17733ecf J. Bruce Fields      2013-03-18  3608  	struct nfsd4_session=
 *session;
d4e19e70276a32 Trond Myklebust      2014-06-30  3609  	struct net *net =3D =
SVC_NET(rqstp);
d4e19e70276a32 Trond Myklebust      2014-06-30  3610  	struct nfsd_net *nn =
=3D net_generic(net, nfsd_net_id);
1d1bc8f2074f0b J. Bruce Fields      2010-10-04  3611  =

1d1bc8f2074f0b J. Bruce Fields      2010-10-04  3612  	if (!nfsd4_last_comp=
ound_op(rqstp))
1d1bc8f2074f0b J. Bruce Fields      2010-10-04  3613  		return nfserr_not_o=
nly_op;
c9a4962881929d Stanislav Kinsbursky 2012-11-26  3614  	spin_lock(&nn->clien=
t_lock);
d4e19e70276a32 Trond Myklebust      2014-06-30  3615  	session =3D find_in_=
sessionid_hashtbl(&bcts->sessionid, net, &status);
c9a4962881929d Stanislav Kinsbursky 2012-11-26  3616  	spin_unlock(&nn->cli=
ent_lock);
4f6e6c17733ecf J. Bruce Fields      2013-03-18  3617  	if (!session)
d4e19e70276a32 Trond Myklebust      2014-06-30  3618  		goto out_no_session;
57266a6e916e25 J. Bruce Fields      2013-04-13  3619  	status =3D nfserr_wr=
ong_cred;
dedeb13f9efb44 Andrew Elble         2016-06-15  3620  	if (!nfsd4_mach_cred=
s_match(session->se_client, rqstp))
57266a6e916e25 J. Bruce Fields      2013-04-13  3621  		goto out;
02579b2ff8b0be Dai Ngo              2021-09-16  3622  	status =3D nfsd4_mat=
ch_existing_connection(rqstp, session,
02579b2ff8b0be Dai Ngo              2021-09-16  3623  			bcts->dir, &conn);
02579b2ff8b0be Dai Ngo              2021-09-16  3624  	if (status =3D=3D nf=
s_ok) {
02579b2ff8b0be Dai Ngo              2021-09-16  3625  		if (bcts->dir =3D=
=3D NFS4_CDFC4_FORE_OR_BOTH ||
02579b2ff8b0be Dai Ngo              2021-09-16  3626  				bcts->dir =3D=3D =
NFS4_CDFC4_BACK)
02579b2ff8b0be Dai Ngo              2021-09-16 @3627  			conn->cn_flags |=
=3D NFS4_CDFC4_BACK;
02579b2ff8b0be Dai Ngo              2021-09-16  3628  		nfsd4_probe_callbac=
k(session->se_client);
02579b2ff8b0be Dai Ngo              2021-09-16  3629  		goto out;
02579b2ff8b0be Dai Ngo              2021-09-16  3630  	}
02579b2ff8b0be Dai Ngo              2021-09-16  3631  	if (status =3D=3D nf=
serr_inval)
c2d715a1af7544 J. Bruce Fields      2020-04-27  3632  		goto out;
1d1bc8f2074f0b J. Bruce Fields      2010-10-04  3633  	status =3D nfsd4_map=
_bcts_dir(&bcts->dir);
3ba6367124f3f0 J. Bruce Fields      2012-09-11  3634  	if (status)
4f6e6c17733ecf J. Bruce Fields      2013-03-18  3635  		goto out;
3ba6367124f3f0 J. Bruce Fields      2012-09-11  3636  	conn =3D alloc_conn(=
rqstp, bcts->dir);
4f6e6c17733ecf J. Bruce Fields      2013-03-18  3637  	status =3D nfserr_ju=
kebox;
3ba6367124f3f0 J. Bruce Fields      2012-09-11  3638  	if (!conn)
4f6e6c17733ecf J. Bruce Fields      2013-03-18  3639  		goto out;
4f6e6c17733ecf J. Bruce Fields      2013-03-18  3640  	nfsd4_init_conn(rqst=
p, conn, session);
4f6e6c17733ecf J. Bruce Fields      2013-03-18  3641  	status =3D nfs_ok;
4f6e6c17733ecf J. Bruce Fields      2013-03-18  3642  out:
d4e19e70276a32 Trond Myklebust      2014-06-30  3643  	nfsd4_put_session(se=
ssion);
d4e19e70276a32 Trond Myklebust      2014-06-30  3644  out_no_session:
4f6e6c17733ecf J. Bruce Fields      2013-03-18  3645  	return status;
1d1bc8f2074f0b J. Bruce Fields      2010-10-04  3646  }
1d1bc8f2074f0b J. Bruce Fields      2010-10-04  3647  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4650971714550233794==--

