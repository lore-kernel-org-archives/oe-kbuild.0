Content-Type: multipart/mixed; boundary="===============0991184195575302915=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [smfrench-smb3:for-next 14/18] fs/cifs/smb2pdu.c:341:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
Date: Sun, 21 Nov 2021 14:53:21 +0800
Message-ID: <202111211415.ZUTCTxpd-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0991184195575302915==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Steve French <stfrench@microsoft.com>

tree:   git://github.com/smfrench/smb3-kernel.git for-next
head:   28711a66701e3aefc5748dcde38dba1e2e79de34
commit: a6649da5f02a578a9a4b1fccf3402cc9cf378ede [14/18] cifs: avoid race d=
uring socket reconnect between send  and recv
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: i386-randconfig-c001-20211118 (attached as .config)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/smfrench/smb3-kernel/commit/a6649da5f02a578a9a=
4b1fccf3402cc9cf378ede
        git remote add smfrench-smb3 git://github.com/smfrench/smb3-kernel.=
git
        git fetch --no-tags smfrench-smb3 for-next
        git checkout a6649da5f02a578a9a4b1fccf3402cc9cf378ede
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^     ~
   net/9p/client.c:1759:2: warning: Value stored to 'err' is never read [cl=
ang-analyzer-deadcode.DeadStores]
           err =3D 0;
           ^     ~
   net/9p/client.c:1759:2: note: Value stored to 'err' is never read
           err =3D 0;
           ^     ~
   net/9p/client.c:1913:2: warning: Value stored to 'err' is never read [cl=
ang-analyzer-deadcode.DeadStores]
           err =3D 0;
           ^     ~
   net/9p/client.c:1913:2: note: Value stored to 'err' is never read
           err =3D 0;
           ^     ~
   net/9p/client.c:2012:2: warning: Value stored to 'err' is never read [cl=
ang-analyzer-deadcode.DeadStores]
           err =3D 0;
           ^     ~
   net/9p/client.c:2012:2: note: Value stored to 'err' is never read
           err =3D 0;
           ^     ~
   net/9p/client.c:2089:2: warning: Value stored to 'err' is never read [cl=
ang-analyzer-deadcode.DeadStores]
           err =3D 0;
           ^     ~
   net/9p/client.c:2089:2: note: Value stored to 'err' is never read
           err =3D 0;
           ^     ~
   net/9p/client.c:2148:2: warning: Value stored to 'err' is never read [cl=
ang-analyzer-deadcode.DeadStores]
           err =3D 0;
           ^     ~
   net/9p/client.c:2148:2: note: Value stored to 'err' is never read
           err =3D 0;
           ^     ~
   net/9p/client.c:2179:2: warning: Value stored to 'err' is never read [cl=
ang-analyzer-deadcode.DeadStores]
           err =3D 0;
           ^     ~
   net/9p/client.c:2179:2: note: Value stored to 'err' is never read
           err =3D 0;
           ^     ~
   net/9p/client.c:2208:2: warning: Value stored to 'err' is never read [cl=
ang-analyzer-deadcode.DeadStores]
           err =3D 0;
           ^     ~
   net/9p/client.c:2208:2: note: Value stored to 'err' is never read
           err =3D 0;
           ^     ~
   net/9p/client.c:2240:2: warning: Value stored to 'err' is never read [cl=
ang-analyzer-deadcode.DeadStores]
           err =3D 0;
           ^     ~
   net/9p/client.c:2240:2: note: Value stored to 'err' is never read
           err =3D 0;
           ^     ~
   net/9p/client.c:2277:2: warning: Value stored to 'err' is never read [cl=
ang-analyzer-deadcode.DeadStores]
           err =3D 0;
           ^     ~
   net/9p/client.c:2277:2: note: Value stored to 'err' is never read
           err =3D 0;
           ^     ~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   fs/cifs/smb2ops.c:4215:3: warning: Call to function 'strcat' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(message, "R");
                   ^~~~~~
   fs/cifs/smb2ops.c:4215:3: note: Call to function 'strcat' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcat'. CWE-119
                   strcat(message, "R");
                   ^~~~~~
   fs/cifs/smb2ops.c:4219:3: warning: Call to function 'strcat' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(message, "H");
                   ^~~~~~
   fs/cifs/smb2ops.c:4219:3: note: Call to function 'strcat' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcat'. CWE-119
                   strcat(message, "H");
                   ^~~~~~
   fs/cifs/smb2ops.c:4223:3: warning: Call to function 'strcat' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(message, "W");
                   ^~~~~~
   fs/cifs/smb2ops.c:4223:3: note: Call to function 'strcat' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcat'. CWE-119
                   strcat(message, "W");
                   ^~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   fs/cifs/smb2transport.c:436:3: warning: Value stored to 'rc' is never re=
ad [clang-analyzer-deadcode.DeadStores]
                   rc =3D generate_key(ses, ptriplet->encryption.label,
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/smb2transport.c:436:3: note: Value stored to 'rc' is never read
                   rc =3D generate_key(ses, ptriplet->encryption.label,
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   fs/cifs/smb2misc.c:503:2: warning: Value stored to 'rc' is never read [c=
lang-analyzer-deadcode.DeadStores]
           rc =3D SMB2_lease_break(0, tlink_tcon(lw->tlink), lw->lease_key,
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/smb2misc.c:503:2: note: Value stored to 'rc' is never read
           rc =3D SMB2_lease_break(0, tlink_tcon(lw->tlink), lw->lease_key,
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> fs/cifs/smb2pdu.c:341:2: warning: Undefined or garbage value returned to=
 caller [clang-analyzer-core.uninitialized.UndefReturn]
           return rc;
           ^      ~~
   fs/cifs/smb2pdu.c:145:2: note: 'rc' declared without an initial value
           int rc;
           ^~~~~~
   fs/cifs/smb2pdu.c:155:6: note: Assuming 'tcon' is not equal to NULL
           if (tcon =3D=3D NULL)
               ^~~~~~~~~~~~
   fs/cifs/smb2pdu.c:155:2: note: Taking false branch
           if (tcon =3D=3D NULL)
           ^
   fs/cifs/smb2pdu.c:162:6: note: Assuming 'smb2_command' is not equal to S=
MB2_TREE_CONNECT
           if (smb2_command =3D=3D SMB2_TREE_CONNECT || smb2_command =3D=3D=
 SMB2_IOCTL)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/smb2pdu.c:162:6: note: Left side of '||' is false
   fs/cifs/smb2pdu.c:162:43: note: Assuming 'smb2_command' is not equal to =
SMB2_IOCTL
           if (smb2_command =3D=3D SMB2_TREE_CONNECT || smb2_command =3D=3D=
 SMB2_IOCTL)
                                                    ^~~~~~~~~~~~~~~~~~~~~~~=
~~~
   fs/cifs/smb2pdu.c:162:2: note: Taking false branch
           if (smb2_command =3D=3D SMB2_TREE_CONNECT || smb2_command =3D=3D=
 SMB2_IOCTL)
           ^
   fs/cifs/smb2pdu.c:166:6: note: Assuming field 'tidStatus' is not equal t=
o CifsExiting
           if (tcon->tidStatus =3D=3D CifsExiting) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/smb2pdu.c:166:2: note: Taking false branch
           if (tcon->tidStatus =3D=3D CifsExiting) {
           ^
   fs/cifs/smb2pdu.c:182:7: note: Assuming field 'ses' is non-null
           if ((!tcon->ses) || (tcon->ses->status =3D=3D CifsExiting) ||
                ^~~~~~~~~~
   fs/cifs/smb2pdu.c:182:6: note: Left side of '||' is false
           if ((!tcon->ses) || (tcon->ses->status =3D=3D CifsExiting) ||
               ^
   fs/cifs/smb2pdu.c:182:23: note: Assuming field 'status' is not equal to =
CifsExiting
           if ((!tcon->ses) || (tcon->ses->status =3D=3D CifsExiting) ||
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/smb2pdu.c:182:6: note: Left side of '||' is false
           if ((!tcon->ses) || (tcon->ses->status =3D=3D CifsExiting) ||
               ^
   fs/cifs/smb2pdu.c:183:7: note: Assuming field 'server' is non-null
               (!tcon->ses->server) || !server)
                ^~~~~~~~~~~~~~~~~~
   fs/cifs/smb2pdu.c:182:6: note: Left side of '||' is false
           if ((!tcon->ses) || (tcon->ses->status =3D=3D CifsExiting) ||
               ^
   fs/cifs/smb2pdu.c:183:30: note: Assuming 'server' is non-null
               (!tcon->ses->server) || !server)
                                       ^~~~~~~
   fs/cifs/smb2pdu.c:182:2: note: Taking false branch
           if ((!tcon->ses) || (tcon->ses->status =3D=3D CifsExiting) ||
           ^
   fs/cifs/smb2pdu.c:194:9: note: Assuming field 'tcpStatus' is not equal t=
o CifsNeedReconnect
           while (server->tcpStatus =3D=3D CifsNeedReconnect) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/smb2pdu.c:194:2: note: Loop condition is false. Execution contin=
ues on line 242
           while (server->tcpStatus =3D=3D CifsNeedReconnect) {
           ^
   fs/cifs/smb2pdu.c:243:6: note: Assuming the condition is false
           if (!cifs_chan_needs_reconnect(ses, server) && !tcon->need_recon=
nect) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/smb2pdu.c:243:46: note: Left side of '&&' is false
           if (!cifs_chan_needs_reconnect(ses, server) && !tcon->need_recon=
nect) {
                                                       ^
   fs/cifs/smb2pdu.c:247:2: note: Taking false branch
           cifs_dbg(FYI, "sess reconnect mask: 0x%lx, tcon reconnect: %d",
           ^
   fs/cifs/cifs_debug.h:76:2: note: expanded from macro 'cifs_dbg'
           if ((type) & ONCE)                                              \
           ^
   fs/cifs/smb2pdu.c:247:2: note: Left side of '&&' is true
           cifs_dbg(FYI, "sess reconnect mask: 0x%lx, tcon reconnect: %d",
           ^
   fs/cifs/cifs_debug.h:79:3: note: expanded from macro 'cifs_dbg'
                   cifs_dbg_func(ratelimited, type, fmt, ##__VA_ARGS__);   \
                   ^
   fs/cifs/cifs_debug.h:64:6: note: expanded from macro 'cifs_dbg_func'
           if ((type) & FYI && cifsFYI & CIFS_INFO) {                      \
               ^
   fs/cifs/smb2pdu.c:247:2: note: Assuming the condition is false
           cifs_dbg(FYI, "sess reconnect mask: 0x%lx, tcon reconnect: %d",
           ^
   fs/cifs/cifs_debug.h:79:3: note: expanded from macro 'cifs_dbg'
                   cifs_dbg_func(ratelimited, type, fmt, ##__VA_ARGS__);   \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/cifs_debug.h:64:22: note: expanded from macro 'cifs_dbg_func'
           if ((type) & FYI && cifsFYI & CIFS_INFO) {                      \
                               ^~~~~~~~~~~~~~~~~~~
   fs/cifs/smb2pdu.c:247:2: note: Taking false branch
           cifs_dbg(FYI, "sess reconnect mask: 0x%lx, tcon reconnect: %d",
           ^
   fs/cifs/cifs_debug.h:79:3: note: expanded from macro 'cifs_dbg'
                   cifs_dbg_func(ratelimited, type, fmt, ##__VA_ARGS__);   \
                   ^
   fs/cifs/cifs_debug.h:64:2: note: expanded from macro 'cifs_dbg_func'
           if ((type) & FYI && cifsFYI & CIFS_INFO) {                      \
           ^
   fs/cifs/smb2pdu.c:247:2: note: Taking false branch
           cifs_dbg(FYI, "sess reconnect mask: 0x%lx, tcon reconnect: %d",
           ^
   fs/cifs/cifs_debug.h:79:3: note: expanded from macro 'cifs_dbg'

vim +341 fs/cifs/smb2pdu.c

ec2e4523fdba88 Pavel Shilovsky   2011-12-27  140  =

ec2e4523fdba88 Pavel Shilovsky   2011-12-27  141  static int
352d96f3acc6e0 Aurelien Aptel    2020-05-31  142  smb2_reconnect(__le16 smb=
2_command, struct cifs_tcon *tcon,
352d96f3acc6e0 Aurelien Aptel    2020-05-31  143  	       struct TCP_Server=
_Info *server)
ec2e4523fdba88 Pavel Shilovsky   2011-12-27  144  {
7ffbe65578b44f Paulo Alcantara   2018-07-05  145  	int rc;
aa24d1e9692411 Pavel Shilovsky   2011-12-27  146  	struct nls_table *nls_co=
depage;
aa24d1e9692411 Pavel Shilovsky   2011-12-27  147  	struct cifs_ses *ses;
a3a53b7603798f Paulo Alcantara   2018-11-14  148  	int retries;
aa24d1e9692411 Pavel Shilovsky   2011-12-27  149  =

aa24d1e9692411 Pavel Shilovsky   2011-12-27  150  	/*
aa24d1e9692411 Pavel Shilovsky   2011-12-27  151  	 * SMB2s NegProt, SessSe=
tup, Logoff do not have tcon yet so
aa24d1e9692411 Pavel Shilovsky   2011-12-27  152  	 * check for tcp and smb=
 session status done differently
aa24d1e9692411 Pavel Shilovsky   2011-12-27  153  	 * for those three - in =
the calling routine.
aa24d1e9692411 Pavel Shilovsky   2011-12-27  154  	 */
aa24d1e9692411 Pavel Shilovsky   2011-12-27  155  	if (tcon =3D=3D NULL)
7ffbe65578b44f Paulo Alcantara   2018-07-05  156  		return 0;
aa24d1e9692411 Pavel Shilovsky   2011-12-27  157  =

c88f7dcd6d6429 Paulo Alcantara   2021-11-03  158  	/*
c88f7dcd6d6429 Paulo Alcantara   2021-11-03  159  	 * Need to also skip SMB=
2_IOCTL because it is used for checking nested dfs links in
c88f7dcd6d6429 Paulo Alcantara   2021-11-03  160  	 * cifs_tree_connect().
c88f7dcd6d6429 Paulo Alcantara   2021-11-03  161  	 */
c88f7dcd6d6429 Paulo Alcantara   2021-11-03  162  	if (smb2_command =3D=3D =
SMB2_TREE_CONNECT || smb2_command =3D=3D SMB2_IOCTL)
7ffbe65578b44f Paulo Alcantara   2018-07-05  163  		return 0;
aa24d1e9692411 Pavel Shilovsky   2011-12-27  164  =

46c2db2a208986 Steve French      2021-11-19  165  	spin_lock(&cifs_tcp_ses_=
lock);
aa24d1e9692411 Pavel Shilovsky   2011-12-27  166  	if (tcon->tidStatus =3D=
=3D CifsExiting) {
aa24d1e9692411 Pavel Shilovsky   2011-12-27  167  		/*
aa24d1e9692411 Pavel Shilovsky   2011-12-27  168  		 * only tree disconnect=
, open, and write,
aa24d1e9692411 Pavel Shilovsky   2011-12-27  169  		 * (and ulogoff which d=
oes not have tcon)
aa24d1e9692411 Pavel Shilovsky   2011-12-27  170  		 * are allowed as we st=
art force umount.
aa24d1e9692411 Pavel Shilovsky   2011-12-27  171  		 */
aa24d1e9692411 Pavel Shilovsky   2011-12-27  172  		if ((smb2_command !=3D =
SMB2_WRITE) &&
aa24d1e9692411 Pavel Shilovsky   2011-12-27  173  		   (smb2_command !=3D S=
MB2_CREATE) &&
aa24d1e9692411 Pavel Shilovsky   2011-12-27  174  		   (smb2_command !=3D S=
MB2_TREE_DISCONNECT)) {
46c2db2a208986 Steve French      2021-11-19  175  			spin_unlock(&cifs_tcp_=
ses_lock);
f96637be081141 Joe Perches       2013-05-04  176  			cifs_dbg(FYI, "can not=
 send cmd %d while umounting\n",
aa24d1e9692411 Pavel Shilovsky   2011-12-27  177  				 smb2_command);
aa24d1e9692411 Pavel Shilovsky   2011-12-27  178  			return -ENODEV;
aa24d1e9692411 Pavel Shilovsky   2011-12-27  179  		}
aa24d1e9692411 Pavel Shilovsky   2011-12-27  180  	}
46c2db2a208986 Steve French      2021-11-19  181  	spin_unlock(&cifs_tcp_se=
s_lock);
aa24d1e9692411 Pavel Shilovsky   2011-12-27  182  	if ((!tcon->ses) || (tco=
n->ses->status =3D=3D CifsExiting) ||
352d96f3acc6e0 Aurelien Aptel    2020-05-31  183  	    (!tcon->ses->server)=
 || !server)
aa24d1e9692411 Pavel Shilovsky   2011-12-27  184  		return -EIO;
aa24d1e9692411 Pavel Shilovsky   2011-12-27  185  =

aa24d1e9692411 Pavel Shilovsky   2011-12-27  186  	ses =3D tcon->ses;
a3a53b7603798f Paulo Alcantara   2018-11-14  187  	retries =3D server->nr_t=
argets;
a3a53b7603798f Paulo Alcantara   2018-11-14  188  =

aa24d1e9692411 Pavel Shilovsky   2011-12-27  189  	/*
a3a53b7603798f Paulo Alcantara   2018-11-14  190  	 * Give demultiplex thre=
ad up to 10 seconds to each target available for
a3a53b7603798f Paulo Alcantara   2018-11-14  191  	 * reconnect -- should b=
e greater than cifs socket timeout which is 7
a3a53b7603798f Paulo Alcantara   2018-11-14  192  	 * seconds.
aa24d1e9692411 Pavel Shilovsky   2011-12-27  193  	 */
aa24d1e9692411 Pavel Shilovsky   2011-12-27  194  	while (server->tcpStatus=
 =3D=3D CifsNeedReconnect) {
aa24d1e9692411 Pavel Shilovsky   2011-12-27  195  		/*
aa24d1e9692411 Pavel Shilovsky   2011-12-27  196  		 * Return to caller for=
 TREE_DISCONNECT and LOGOFF and CLOSE
aa24d1e9692411 Pavel Shilovsky   2011-12-27  197  		 * here since they are =
implicitly done when session drops.
aa24d1e9692411 Pavel Shilovsky   2011-12-27  198  		 */
aa24d1e9692411 Pavel Shilovsky   2011-12-27  199  		switch (smb2_command) {
aa24d1e9692411 Pavel Shilovsky   2011-12-27  200  		/*
aa24d1e9692411 Pavel Shilovsky   2011-12-27  201  		 * BB Should we keep op=
lock break and add flush to exceptions?
aa24d1e9692411 Pavel Shilovsky   2011-12-27  202  		 */
aa24d1e9692411 Pavel Shilovsky   2011-12-27  203  		case SMB2_TREE_DISCONNE=
CT:
aa24d1e9692411 Pavel Shilovsky   2011-12-27  204  		case SMB2_CANCEL:
aa24d1e9692411 Pavel Shilovsky   2011-12-27  205  		case SMB2_CLOSE:
aa24d1e9692411 Pavel Shilovsky   2011-12-27  206  		case SMB2_OPLOCK_BREAK:
aa24d1e9692411 Pavel Shilovsky   2011-12-27  207  			return -EAGAIN;
aa24d1e9692411 Pavel Shilovsky   2011-12-27  208  		}
aa24d1e9692411 Pavel Shilovsky   2011-12-27  209  =

7ffbe65578b44f Paulo Alcantara   2018-07-05  210  		rc =3D wait_event_inter=
ruptible_timeout(server->response_q,
7ffbe65578b44f Paulo Alcantara   2018-07-05  211  						      (server->tcpS=
tatus !=3D CifsNeedReconnect),
7ffbe65578b44f Paulo Alcantara   2018-07-05  212  						      10 * HZ);
7ffbe65578b44f Paulo Alcantara   2018-07-05  213  		if (rc < 0) {
a0a3036b81f1f6 Joe Perches       2020-04-14  214  			cifs_dbg(FYI, "%s: abo=
rting reconnect due to a received signal by the process\n",
a0a3036b81f1f6 Joe Perches       2020-04-14  215  				 __func__);
7ffbe65578b44f Paulo Alcantara   2018-07-05  216  			return -ERESTARTSYS;
7ffbe65578b44f Paulo Alcantara   2018-07-05  217  		}
aa24d1e9692411 Pavel Shilovsky   2011-12-27  218  =

aa24d1e9692411 Pavel Shilovsky   2011-12-27  219  		/* are we still trying =
to reconnect? */
46c2db2a208986 Steve French      2021-11-19  220  		spin_lock(&cifs_tcp_ses=
_lock);
46c2db2a208986 Steve French      2021-11-19  221  		if (server->tcpStatus !=
=3D CifsNeedReconnect) {
46c2db2a208986 Steve French      2021-11-19  222  			spin_unlock(&cifs_tcp_=
ses_lock);
aa24d1e9692411 Pavel Shilovsky   2011-12-27  223  			break;
46c2db2a208986 Steve French      2021-11-19  224  		}
46c2db2a208986 Steve French      2021-11-19  225  		spin_unlock(&cifs_tcp_s=
es_lock);
aa24d1e9692411 Pavel Shilovsky   2011-12-27  226  =

c54849ddd832ae Ronnie Sahlberg   2020-01-31  227  		if (retries && --retrie=
s)
a3a53b7603798f Paulo Alcantara   2018-11-14  228  			continue;
a3a53b7603798f Paulo Alcantara   2018-11-14  229  =

aa24d1e9692411 Pavel Shilovsky   2011-12-27  230  		/*
aa24d1e9692411 Pavel Shilovsky   2011-12-27  231  		 * on "soft" mounts we =
wait once. Hard mounts keep
aa24d1e9692411 Pavel Shilovsky   2011-12-27  232  		 * retrying until proce=
ss is killed or server comes
aa24d1e9692411 Pavel Shilovsky   2011-12-27  233  		 * back on-line
aa24d1e9692411 Pavel Shilovsky   2011-12-27  234  		 */
aa24d1e9692411 Pavel Shilovsky   2011-12-27  235  		if (!tcon->retry) {
f96637be081141 Joe Perches       2013-05-04  236  			cifs_dbg(FYI, "gave up=
 waiting on reconnect in smb_init\n");
aa24d1e9692411 Pavel Shilovsky   2011-12-27  237  			return -EHOSTDOWN;
aa24d1e9692411 Pavel Shilovsky   2011-12-27  238  		}
a3a53b7603798f Paulo Alcantara   2018-11-14  239  		retries =3D server->nr_=
targets;
aa24d1e9692411 Pavel Shilovsky   2011-12-27  240  	}
aa24d1e9692411 Pavel Shilovsky   2011-12-27  241  =

2e1950bf3a3683 Steve French      2021-11-19  242  	spin_lock(&ses->chan_loc=
k);
2e1950bf3a3683 Steve French      2021-11-19  243  	if (!cifs_chan_needs_rec=
onnect(ses, server) && !tcon->need_reconnect) {
2e1950bf3a3683 Steve French      2021-11-19  244  		spin_unlock(&ses->chan_=
lock);
7ffbe65578b44f Paulo Alcantara   2018-07-05  245  		return 0;
2e1950bf3a3683 Steve French      2021-11-19  246  	}
2e1950bf3a3683 Steve French      2021-11-19  247  	cifs_dbg(FYI, "sess reco=
nnect mask: 0x%lx, tcon reconnect: %d",
2e1950bf3a3683 Steve French      2021-11-19  248  		 tcon->ses->chans_need_=
reconnect,
2e1950bf3a3683 Steve French      2021-11-19  249  		 tcon->need_reconnect);
2e1950bf3a3683 Steve French      2021-11-19  250  	spin_unlock(&ses->chan_l=
ock);
aa24d1e9692411 Pavel Shilovsky   2011-12-27  251  =

aa24d1e9692411 Pavel Shilovsky   2011-12-27  252  	nls_codepage =3D load_nl=
s_default();
aa24d1e9692411 Pavel Shilovsky   2011-12-27  253  =

76e752701a8af4 Samuel Cabrero    2017-07-11  254  	/*
76e752701a8af4 Samuel Cabrero    2017-07-11  255  	 * Recheck after acquire=
 mutex. If another thread is negotiating
76e752701a8af4 Samuel Cabrero    2017-07-11  256  	 * and the server never =
sends an answer the socket will be closed
76e752701a8af4 Samuel Cabrero    2017-07-11  257  	 * and tcpStatus set to =
reconnect.
76e752701a8af4 Samuel Cabrero    2017-07-11  258  	 */
46c2db2a208986 Steve French      2021-11-19  259  	spin_lock(&cifs_tcp_ses_=
lock);
76e752701a8af4 Samuel Cabrero    2017-07-11  260  	if (server->tcpStatus =
=3D=3D CifsNeedReconnect) {
46c2db2a208986 Steve French      2021-11-19  261  		spin_unlock(&cifs_tcp_s=
es_lock);
76e752701a8af4 Samuel Cabrero    2017-07-11  262  		rc =3D -EHOSTDOWN;
76e752701a8af4 Samuel Cabrero    2017-07-11  263  		goto out;
76e752701a8af4 Samuel Cabrero    2017-07-11  264  	}
46c2db2a208986 Steve French      2021-11-19  265  	spin_unlock(&cifs_tcp_se=
s_lock);
76e752701a8af4 Samuel Cabrero    2017-07-11  266  =

2e1950bf3a3683 Steve French      2021-11-19  267  	/*
2e1950bf3a3683 Steve French      2021-11-19  268  	 * need to prevent multi=
ple threads trying to simultaneously
2e1950bf3a3683 Steve French      2021-11-19  269  	 * reconnect the same SM=
B session
2e1950bf3a3683 Steve French      2021-11-19  270  	 */
2e1950bf3a3683 Steve French      2021-11-19  271  	spin_lock(&ses->chan_loc=
k);
2e1950bf3a3683 Steve French      2021-11-19  272  	if (!cifs_chan_needs_rec=
onnect(ses, server)) {
2e1950bf3a3683 Steve French      2021-11-19  273  		spin_unlock(&ses->chan_=
lock);
2e1950bf3a3683 Steve French      2021-11-19  274  =

0d0119cf6ce4eb Steve French      2021-11-19  275  		/* this means that we o=
nly need to tree connect */
2e1950bf3a3683 Steve French      2021-11-19  276  		if (tcon->need_reconnec=
t)
2e1950bf3a3683 Steve French      2021-11-19  277  			goto skip_sess_setup;
2e1950bf3a3683 Steve French      2021-11-19  278  =

2e1950bf3a3683 Steve French      2021-11-19  279  		goto out;
2e1950bf3a3683 Steve French      2021-11-19  280  	}
2e1950bf3a3683 Steve French      2021-11-19  281  	spin_unlock(&ses->chan_l=
ock);
2e1950bf3a3683 Steve French      2021-11-19  282  =

b8272812b48c94 Shyam Prasad N    2021-07-19  283  	mutex_lock(&ses->session=
_mutex);
0d0119cf6ce4eb Steve French      2021-11-19  284  	rc =3D cifs_negotiate_pr=
otocol(0, ses, server);
2e1950bf3a3683 Steve French      2021-11-19  285  	if (!rc) {
0d0119cf6ce4eb Steve French      2021-11-19  286  		rc =3D cifs_setup_sessi=
on(0, ses, server, nls_codepage);
b0dd940e582b6a Ronnie Sahlberg   2020-02-05  287  		if ((rc =3D=3D -EACCES)=
 && !tcon->retry) {
0d0119cf6ce4eb Steve French      2021-11-19  288  			mutex_unlock(&ses->ses=
sion_mutex);
b8272812b48c94 Shyam Prasad N    2021-07-19  289  			rc =3D -EHOSTDOWN;
b0dd940e582b6a Ronnie Sahlberg   2020-02-05  290  			goto failed;
b0dd940e582b6a Ronnie Sahlberg   2020-02-05  291  		}
b0dd940e582b6a Ronnie Sahlberg   2020-02-05  292  	}
2f58967979409e Aurelien Aptel    2020-04-24  293  =

aa24d1e9692411 Pavel Shilovsky   2011-12-27  294  	if (rc || !tcon->need_re=
connect) {
b8272812b48c94 Shyam Prasad N    2021-07-19  295  		mutex_unlock(&ses->sess=
ion_mutex);
aa24d1e9692411 Pavel Shilovsky   2011-12-27  296  		goto out;
aa24d1e9692411 Pavel Shilovsky   2011-12-27  297  	}
aa24d1e9692411 Pavel Shilovsky   2011-12-27  298  =

2e1950bf3a3683 Steve French      2021-11-19  299  skip_sess_setup:
aa24d1e9692411 Pavel Shilovsky   2011-12-27  300  	cifs_mark_open_files_inv=
alid(tcon);
96a988ffeb90db Pavel Shilovsky   2016-11-29  301  	if (tcon->use_persistent)
96a988ffeb90db Pavel Shilovsky   2016-11-29  302  		tcon->need_reopen_files=
 =3D true;
52ace1ef1259e1 Steve French      2016-09-22  303  =

565674d613d7f4 Stefan Metzmacher 2020-07-21  304  	rc =3D cifs_tree_connect=
(0, tcon, nls_codepage);
b8272812b48c94 Shyam Prasad N    2021-07-19  305  	mutex_unlock(&ses->sessi=
on_mutex);
52ace1ef1259e1 Steve French      2016-09-22  306  =

f96637be081141 Joe Perches       2013-05-04  307  	cifs_dbg(FYI, "reconnect=
 tcon rc =3D %d\n", rc);
c318e6c26cbe91 Steve French      2018-04-04  308  	if (rc) {
c318e6c26cbe91 Steve French      2018-04-04  309  		/* If sess reconnected =
but tcon didn't, something strange ... */
a0a3036b81f1f6 Joe Perches       2020-04-14  310  		pr_warn_once("reconnect=
 tcon failed rc =3D %d\n", rc);
aa24d1e9692411 Pavel Shilovsky   2011-12-27  311  		goto out;
c318e6c26cbe91 Steve French      2018-04-04  312  	}
96a988ffeb90db Pavel Shilovsky   2016-11-29  313  =

96a988ffeb90db Pavel Shilovsky   2016-11-29  314  	if (smb2_command !=3D SM=
B2_INTERNAL_CMD)
b08484d715128a Stefan Metzmacher 2020-02-24  315  		mod_delayed_work(cifsio=
d_wq, &server->reconnect, 0);
96a988ffeb90db Pavel Shilovsky   2016-11-29  316  =

aa24d1e9692411 Pavel Shilovsky   2011-12-27  317  	atomic_inc(&tconInfoReco=
nnectCount);
aa24d1e9692411 Pavel Shilovsky   2011-12-27  318  out:
aa24d1e9692411 Pavel Shilovsky   2011-12-27  319  	/*
aa24d1e9692411 Pavel Shilovsky   2011-12-27  320  	 * Check if handle based=
 operation so we know whether we can continue
aa24d1e9692411 Pavel Shilovsky   2011-12-27  321  	 * or not without return=
ing to caller to reset file handle.
aa24d1e9692411 Pavel Shilovsky   2011-12-27  322  	 */
aa24d1e9692411 Pavel Shilovsky   2011-12-27  323  	/*
aa24d1e9692411 Pavel Shilovsky   2011-12-27  324  	 * BB Is flush done by s=
erver on drop of tcp session? Should we special
aa24d1e9692411 Pavel Shilovsky   2011-12-27  325  	 * case it and skip abov=
e?
aa24d1e9692411 Pavel Shilovsky   2011-12-27  326  	 */
aa24d1e9692411 Pavel Shilovsky   2011-12-27  327  	switch (smb2_command) {
aa24d1e9692411 Pavel Shilovsky   2011-12-27  328  	case SMB2_FLUSH:
aa24d1e9692411 Pavel Shilovsky   2011-12-27  329  	case SMB2_READ:
aa24d1e9692411 Pavel Shilovsky   2011-12-27  330  	case SMB2_WRITE:
aa24d1e9692411 Pavel Shilovsky   2011-12-27  331  	case SMB2_LOCK:
aa24d1e9692411 Pavel Shilovsky   2011-12-27  332  	case SMB2_IOCTL:
aa24d1e9692411 Pavel Shilovsky   2011-12-27  333  	case SMB2_QUERY_DIRECTOR=
Y:
aa24d1e9692411 Pavel Shilovsky   2011-12-27  334  	case SMB2_CHANGE_NOTIFY:
aa24d1e9692411 Pavel Shilovsky   2011-12-27  335  	case SMB2_QUERY_INFO:
aa24d1e9692411 Pavel Shilovsky   2011-12-27  336  	case SMB2_SET_INFO:
4772c79599564b Pavel Shilovsky   2016-11-29  337  		rc =3D -EAGAIN;
aa24d1e9692411 Pavel Shilovsky   2011-12-27  338  	}
b0dd940e582b6a Ronnie Sahlberg   2020-02-05  339  failed:
aa24d1e9692411 Pavel Shilovsky   2011-12-27  340  	unload_nls(nls_codepage);
ec2e4523fdba88 Pavel Shilovsky   2011-12-27 @341  	return rc;
ec2e4523fdba88 Pavel Shilovsky   2011-12-27  342  }
ec2e4523fdba88 Pavel Shilovsky   2011-12-27  343  =


:::::: The code at line 341 was first introduced by commit
:::::: ec2e4523fdba88317e06d0c7a88af3a0860447fc CIFS: Add capability to sen=
d SMB2 negotiate message

:::::: TO: Pavel Shilovsky <piastry@etersoft.ru>
:::::: CC: Pavel Shilovsky <pshilovsky@samba.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0991184195575302915==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
r9YayPQBAA==
--===============0991184195575302915==--

