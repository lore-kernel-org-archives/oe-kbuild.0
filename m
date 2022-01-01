Content-Type: multipart/mixed; boundary="===============4974429061674795165=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [smfrench-smb3:for-next 10/12] fs/cifs/smb2pdu.c:3811:19: warning: Although the value stored to 'ses_selected' is used in the enclosing expression, the value is never actually read from 'ses_selected' [clang-analyzer-deadcode.DeadStores]
Date: Sun, 02 Jan 2022 06:27:26 +0800
Message-ID: <202201020509.b5qCNECh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4974429061674795165==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Steve French <stfrench@microsoft.com>

tree:   git://github.com/smfrench/smb3-kernel.git for-next
head:   3fe0b5a99f6e0726eb88cee160ee96b002d2a60d
commit: 2859dc2cfd05f278e7a00a79912c32286e2d0bbe [10/12] cifs: check reconn=
ects for channels of active tcons too
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c007-20211231 (https://download.01.org/0day-ci/ar=
chive/20220102/202201020509.b5qCNECh-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c05440=
2170cd8466683a20385befc0523aba3359)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/smfrench/smb3-kernel/commit/2859dc2cfd05f278e7=
a00a79912c32286e2d0bbe
        git remote add smfrench-smb3 git://github.com/smfrench/smb3-kernel.=
git
        git fetch --no-tags smfrench-smb3 for-next
        git checkout 2859dc2cfd05f278e7a00a79912c32286e2d0bbe
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/rcupdate.h:317:2: note: expanded from macro 'RCU_LOCKDEP_W=
ARN'
           do {                                                            \
           ^
   net/ipv4/fib_trie.c:657:7: note: Assuming 'node1' is non-null
                   if (!node1 || !node0) {
                       ^~~~~~
   net/ipv4/fib_trie.c:657:7: note: Left side of '||' is false
   net/ipv4/fib_trie.c:657:17: note: Assuming 'node0' is non-null
                   if (!node1 || !node0) {
                                 ^~~~~~
   net/ipv4/fib_trie.c:657:3: note: Taking false branch
                   if (!node1 || !node0) {
                   ^
   net/ipv4/fib_trie.c:664:8: note: 'inode' is non-null
                   if (!inode)
                        ^~~~~
   net/ipv4/fib_trie.c:664:3: note: Taking false branch
                   if (!inode)
                   ^
   net/ipv4/fib_trie.c:669:3: note: Calling 'put_child'
                   put_child(inode, 1, node1);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/fib_trie.c:419:27: note: Assuming the condition is false
           struct key_vector *chi =3D get_child(tn, i);
                                    ^
   net/ipv4/fib_trie.c:194:26: note: expanded from macro 'get_child'
   #define get_child(tn, i) rtnl_dereference((tn)->tnode[i])
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rtnetlink.h:81:2: note: expanded from macro 'rtnl_derefere=
nce'
           rcu_dereference_protected(p, lockdep_rtnl_is_held())
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:588:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:397:19: note: expanded from macro '__rcu_derefe=
rence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   include/linux/rcupdate.h:319:8: note: expanded from macro 'RCU_LOCKDEP_W=
ARN'
                   if ((c) && debug_lockdep_rcu_enabled() && !__warned) {  \
                        ^
   net/ipv4/fib_trie.c:419:27: note: Left side of '&&' is false
           struct key_vector *chi =3D get_child(tn, i);
                                    ^
   net/ipv4/fib_trie.c:194:26: note: expanded from macro 'get_child'
   #define get_child(tn, i) rtnl_dereference((tn)->tnode[i])
                            ^
   include/linux/rtnetlink.h:81:2: note: expanded from macro 'rtnl_derefere=
nce'
           rcu_dereference_protected(p, lockdep_rtnl_is_held())
           ^
   include/linux/rcupdate.h:588:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^
   include/linux/rcupdate.h:397:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:319:11: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
                   if ((c) && debug_lockdep_rcu_enabled() && !__warned) {  \
                           ^
   net/ipv4/fib_trie.c:419:27: note: Loop condition is false.  Exiting loop
           struct key_vector *chi =3D get_child(tn, i);
                                    ^
   net/ipv4/fib_trie.c:194:26: note: expanded from macro 'get_child'
   #define get_child(tn, i) rtnl_dereference((tn)->tnode[i])
                            ^
   include/linux/rtnetlink.h:81:2: note: expanded from macro 'rtnl_derefere=
nce'
           rcu_dereference_protected(p, lockdep_rtnl_is_held())
           ^
   include/linux/rcupdate.h:588:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), (c), __rcu)
           ^
   include/linux/rcupdate.h:397:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:317:2: note: expanded from macro 'RCU_LOCKDEP_W=
ARN'
           do {                                                            \
           ^
   net/ipv4/fib_trie.c:419:2: note: Assigned value is garbage or undefined
           struct key_vector *chi =3D get_child(tn, i);
           ^
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   fs/cifs/smb2misc.c:503:2: warning: Value stored to 'rc' is never read [c=
lang-analyzer-deadcode.DeadStores]
           rc =3D SMB2_lease_break(0, tlink_tcon(lw->tlink), lw->lease_key,
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/smb2misc.c:503:2: note: Value stored to 'rc' is never read
           rc =3D SMB2_lease_break(0, tlink_tcon(lw->tlink), lw->lease_key,
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   fs/cifs/smb2pdu.c:596:3: warning: Value stored to 'pneg_ctxt' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                   pneg_ctxt +=3D ctxt_len;
                   ^            ~~~~~~~~
   fs/cifs/smb2pdu.c:596:3: note: Value stored to 'pneg_ctxt' is never read
                   pneg_ctxt +=3D ctxt_len;
                   ^            ~~~~~~~~
>> fs/cifs/smb2pdu.c:3811:19: warning: Although the value stored to 'ses_se=
lected' is used in the enclosing expression, the value is never actually re=
ad from 'ses_selected' [clang-analyzer-deadcode.DeadStores]
                   tcon_selected =3D ses_selected =3D false;
                                   ^              ~~~~~
   fs/cifs/smb2pdu.c:3811:19: note: Although the value stored to 'ses_selec=
ted' is used in the enclosing expression, the value is never actually read =
from 'ses_selected'
                   tcon_selected =3D ses_selected =3D false;
                                   ^              ~~~~~
>> fs/cifs/smb2pdu.c:3836:4: warning: Value stored to 'ses_selected' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                           ses_selected =3D ses_exist =3D true;
                           ^              ~~~~~~~~~~~~~~~~
   fs/cifs/smb2pdu.c:3836:4: note: Value stored to 'ses_selected' is never =
read
                           ses_selected =3D ses_exist =3D true;
                           ^              ~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   fs/cifs/cifsacl.c:1141:3: warning: Value stored to 'new_aces_set' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                   new_aces_set =3D true;
                   ^              ~~~~
   fs/cifs/cifsacl.c:1141:3: note: Value stored to 'new_aces_set' is never =
read
                   new_aces_set =3D true;
                   ^              ~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   fs/cifs/connect.c:317:4: warning: Value stored to 'rc' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                           rc =3D reconn_set_ipaddr_from_hostname(server);
                           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/connect.c:317:4: note: Value stored to 'rc' is never read
                           rc =3D reconn_set_ipaddr_from_hostname(server);
                           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/connect.c:3748:3: warning: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(bcc_ptr, tree);
                   ^~~~~~
   fs/cifs/connect.c:3748:3: note: Call to function 'strcpy' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcpy'. CWE-119
                   strcpy(bcc_ptr, tree);
                   ^~~~~~
   fs/cifs/connect.c:3751:2: warning: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(bcc_ptr, "?????");
           ^~~~~~
   fs/cifs/connect.c:3751:2: note: Call to function 'strcpy' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcpy'. CWE-119
           strcpy(bcc_ptr, "?????");
           ^~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   fs/cifs/file.c:568:24: warning: Access to field 'f_flags' results in a d=
ereference of a null pointer (loaded from variable 'cfile') [clang-analyzer=
-core.NullDereference]
                   if (file->f_flags =3D=3D cfile->f_flags) {
                                        ^~~~~
   fs/cifs/file.c:531:8: note: Taking false branch
           xid =3D get_xid();
                 ^
   fs/cifs/cifsproto.h:38:2: note: expanded from macro 'get_xid'
           cifs_dbg(FYI, "VFS: in %s as Xid: %u with uid: %d\n",           \
           ^
   fs/cifs/cifs_debug.h:76:2: note: expanded from macro 'cifs_dbg'
           if ((type) & ONCE)                                              \
           ^
   fs/cifs/file.c:531:8: note: Left side of '&&' is true
           xid =3D get_xid();
                 ^
   fs/cifs/cifsproto.h:38:2: note: expanded from macro 'get_xid'
           cifs_dbg(FYI, "VFS: in %s as Xid: %u with uid: %d\n",           \
           ^
   fs/cifs/cifs_debug.h:79:3: note: expanded from macro 'cifs_dbg'
                   cifs_dbg_func(ratelimited, type, fmt, ##__VA_ARGS__);   \
                   ^
   fs/cifs/cifs_debug.h:64:6: note: expanded from macro 'cifs_dbg_func'
           if ((type) & FYI && cifsFYI & CIFS_INFO) {                      \
               ^
   fs/cifs/file.c:531:8: note: Assuming the condition is false
           xid =3D get_xid();
                 ^
   fs/cifs/cifsproto.h:38:2: note: expanded from macro 'get_xid'
           cifs_dbg(FYI, "VFS: in %s as Xid: %u with uid: %d\n",           \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/cifs_debug.h:79:3: note: expanded from macro 'cifs_dbg'
                   cifs_dbg_func(ratelimited, type, fmt, ##__VA_ARGS__);   \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/cifs_debug.h:64:22: note: expanded from macro 'cifs_dbg_func'
           if ((type) & FYI && cifsFYI & CIFS_INFO) {                      \
                               ^~~~~~~~~~~~~~~~~~~
   fs/cifs/file.c:531:8: note: Taking false branch
           xid =3D get_xid();
                 ^
   fs/cifs/cifsproto.h:38:2: note: expanded from macro 'get_xid'
           cifs_dbg(FYI, "VFS: in %s as Xid: %u with uid: %d\n",           \
           ^
   fs/cifs/cifs_debug.h:79:3: note: expanded from macro 'cifs_dbg'
                   cifs_dbg_func(ratelimited, type, fmt, ##__VA_ARGS__);   \
                   ^
   fs/cifs/cifs_debug.h:64:2: note: expanded from macro 'cifs_dbg_func'
           if ((type) & FYI && cifsFYI & CIFS_INFO) {                      \
           ^
   fs/cifs/file.c:531:8: note: Taking false branch
           xid =3D get_xid();

vim +3811 fs/cifs/smb2pdu.c

9094fad1ed90ca Pavel Shilovsky  2012-07-12  3784  =

53e0e11efe9289 Pavel Shilovsky  2016-11-04  3785  void smb2_reconnect_serve=
r(struct work_struct *work)
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3786  {
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3787  	struct TCP_Server_Info *=
server =3D container_of(work,
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3788  					struct TCP_Server_In=
fo, reconnect.work);
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3789  	struct TCP_Server_Info *=
pserver;
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3790  	struct cifs_ses *ses, *s=
es2;
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3791  	struct cifs_tcon *tcon, =
*tcon2;
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3792  	struct list_head tmp_lis=
t, tmp_ses_list;
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3793  	bool tcon_exist =3D fals=
e, ses_exist =3D false;
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3794  	bool tcon_selected =3D f=
alse, ses_selected =3D false;
18ea43113f5b74 Germano Percossi 2017-04-07  3795  	int rc;
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3796  	bool resched =3D false;
18ea43113f5b74 Germano Percossi 2017-04-07  3797  =

2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3798  	/* If server is a channe=
l, select the primary channel */
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3799  	pserver =3D CIFS_SERVER_=
IS_CHAN(server) ? server->primary_server : server;
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3800  =

53e0e11efe9289 Pavel Shilovsky  2016-11-04  3801  	/* Prevent simultaneous =
reconnects that can corrupt tcon->rlist list */
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3802  	mutex_lock(&pserver->rec=
onnect_mutex);
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3803  =

53e0e11efe9289 Pavel Shilovsky  2016-11-04  3804  	INIT_LIST_HEAD(&tmp_list=
);
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3805  	INIT_LIST_HEAD(&tmp_ses_=
list);
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3806  	cifs_dbg(FYI, "Reconnect=
ing tcons and channels\n");
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3807  =

53e0e11efe9289 Pavel Shilovsky  2016-11-04  3808  	spin_lock(&cifs_tcp_ses_=
lock);
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3809  	list_for_each_entry(ses,=
 &pserver->smb_ses_list, smb_ses_list) {
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3810  =

2859dc2cfd05f2 Shyam Prasad N   2021-10-30 @3811  		tcon_selected =3D ses_s=
elected =3D false;
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3812  =

53e0e11efe9289 Pavel Shilovsky  2016-11-04  3813  		list_for_each_entry(tco=
n, &ses->tcon_list, tcon_list) {
96a988ffeb90db Pavel Shilovsky  2016-11-29  3814  			if (tcon->need_reconne=
ct || tcon->need_reopen_files) {
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3815  				tcon->tc_count++;
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3816  				list_add_tail(&tcon->=
rlist, &tmp_list);
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3817  				tcon_selected =3D tco=
n_exist =3D true;
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3818  			}
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3819  		}
0ff2b018b02f89 Ronnie Sahlberg  2019-06-05  3820  		/*
0ff2b018b02f89 Ronnie Sahlberg  2019-06-05  3821  		 * IPC has the same lif=
etime as its session and uses its
0ff2b018b02f89 Ronnie Sahlberg  2019-06-05  3822  		 * refcount.
0ff2b018b02f89 Ronnie Sahlberg  2019-06-05  3823  		 */
b327a717e50698 Aurelien Aptel   2018-01-24  3824  		if (ses->tcon_ipc && se=
s->tcon_ipc->need_reconnect) {
b327a717e50698 Aurelien Aptel   2018-01-24  3825  			list_add_tail(&ses->tc=
on_ipc->rlist, &tmp_list);
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3826  			tcon_selected =3D tcon=
_exist =3D true;
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3827  			ses->ses_count++;
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3828  		}
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3829  		/*
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3830  		 * handle the case wher=
e channel needs to reconnect
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3831  		 * binding session, but=
 tcon is healthy (some other channel
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3832  		 * is active)
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3833  		 */
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3834  		if (!tcon_selected && c=
ifs_chan_needs_reconnect(ses, server)) {
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3835  			list_add_tail(&ses->rl=
ist, &tmp_ses_list);
2859dc2cfd05f2 Shyam Prasad N   2021-10-30 @3836  			ses_selected =3D ses_e=
xist =3D true;
0ff2b018b02f89 Ronnie Sahlberg  2019-06-05  3837  			ses->ses_count++;
b327a717e50698 Aurelien Aptel   2018-01-24  3838  		}
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3839  	}
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3840  	/*
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3841  	 * Get the reference to =
server struct to be sure that the last call of
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3842  	 * cifs_put_tcon() in th=
e loop below won't release the server pointer.
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3843  	 */
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3844  	if (tcon_exist || ses_ex=
ist)
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3845  		server->srv_count++;
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3846  =

53e0e11efe9289 Pavel Shilovsky  2016-11-04  3847  	spin_unlock(&cifs_tcp_se=
s_lock);
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3848  =

53e0e11efe9289 Pavel Shilovsky  2016-11-04  3849  	list_for_each_entry_safe=
(tcon, tcon2, &tmp_list, rlist) {
352d96f3acc6e0 Aurelien Aptel   2020-05-31  3850  		rc =3D smb2_reconnect(S=
MB2_INTERNAL_CMD, tcon, server);
18ea43113f5b74 Germano Percossi 2017-04-07  3851  		if (!rc)
96a988ffeb90db Pavel Shilovsky  2016-11-29  3852  			cifs_reopen_persistent=
_handles(tcon);
18ea43113f5b74 Germano Percossi 2017-04-07  3853  		else
18ea43113f5b74 Germano Percossi 2017-04-07  3854  			resched =3D true;
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3855  		list_del_init(&tcon->rl=
ist);
0ff2b018b02f89 Ronnie Sahlberg  2019-06-05  3856  		if (tcon->ipc)
0ff2b018b02f89 Ronnie Sahlberg  2019-06-05  3857  			cifs_put_smb_ses(tcon-=
>ses);
0ff2b018b02f89 Ronnie Sahlberg  2019-06-05  3858  		else
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3859  			cifs_put_tcon(tcon);
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3860  	}
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3861  =

2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3862  	if (!ses_exist)
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3863  		goto done;
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3864  =

2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3865  	/* allocate a dummy tcon=
 struct used for reconnect */
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3866  	tcon =3D kzalloc(sizeof(=
struct cifs_tcon), GFP_KERNEL);
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3867  	if (!tcon) {
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3868  		resched =3D true;
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3869  		list_del_init(&ses->rli=
st);
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3870  		cifs_put_smb_ses(ses);
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3871  		goto done;
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3872  	}
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3873  =

2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3874  	tcon->tidStatus =3D Cifs=
Good;
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3875  	tcon->retry =3D false;
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3876  	tcon->need_reconnect =3D=
 false;
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3877  =

2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3878  	/* now reconnect session=
s for necessary channels */
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3879  	list_for_each_entry_safe=
(ses, ses2, &tmp_ses_list, rlist) {
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3880  		tcon->ses =3D ses;
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3881  		rc =3D smb2_reconnect(S=
MB2_INTERNAL_CMD, tcon, server);
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3882  		if (rc)
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3883  			resched =3D true;
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3884  		list_del_init(&ses->rli=
st);
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3885  		cifs_put_smb_ses(ses);
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3886  	}
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3887  	kfree(tcon);
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3888  =

2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3889  done:
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3890  	cifs_dbg(FYI, "Reconnect=
ing tcons and channels finished\n");
18ea43113f5b74 Germano Percossi 2017-04-07  3891  	if (resched)
18ea43113f5b74 Germano Percossi 2017-04-07  3892  		queue_delayed_work(cifs=
iod_wq, &server->reconnect, 2 * HZ);
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3893  	mutex_unlock(&pserver->r=
econnect_mutex);
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3894  =

53e0e11efe9289 Pavel Shilovsky  2016-11-04  3895  	/* now we can safely rel=
ease srv struct */
2859dc2cfd05f2 Shyam Prasad N   2021-10-30  3896  	if (tcon_exist || ses_ex=
ist)
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3897  		cifs_put_tcp_session(se=
rver, 1);
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3898  }
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3899  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4974429061674795165==--

