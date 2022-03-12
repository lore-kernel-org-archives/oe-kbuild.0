Content-Type: multipart/mixed; boundary="===============1895986661392221904=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [smfrench-smb3:for-next 6/6] fs/cifs/sess.c:248:2: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Sat, 12 Mar 2022 16:03:35 +0800
Message-ID: <202203121658.5EfuBwl5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1895986661392221904==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Steve French <stfrench@microsoft.com>

tree:   git://github.com/smfrench/smb3-kernel.git for-next
head:   4eb628dd74df04ab34ef61ef83cff1c61d5d377e
commit: 4eb628dd74df04ab34ef61ef83cff1c61d5d377e [6/6] cifs: during reconne=
ct, update interface if necessary
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20312/202203121658.5EfuBwl5-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca8=
7382b8f16a65bddac700202924228982f6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/smfrench/smb3-kernel/commit/4eb628dd74df04ab34=
ef61ef83cff1c61d5d377e
        git remote add smfrench-smb3 git://github.com/smfrench/smb3-kernel.=
git
        git fetch --no-tags smfrench-smb3 for-next
        git checkout 4eb628dd74df04ab34ef61ef83cff1c61d5d377e
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   net/core/rtnetlink.c:2619:6: note: Assuming the condition is false
           if (tb[IFLA_NET_NS_PID] || tb[IFLA_NET_NS_FD] || tb[IFLA_TARGET_=
NETNSID]) {
               ^~~~~~~~~~~~~~~~~~~
   net/core/rtnetlink.c:2619:6: note: Left side of '||' is false
   net/core/rtnetlink.c:2619:29: note: Assuming the condition is false
           if (tb[IFLA_NET_NS_PID] || tb[IFLA_NET_NS_FD] || tb[IFLA_TARGET_=
NETNSID]) {
                                      ^~~~~~~~~~~~~~~~~~
   net/core/rtnetlink.c:2619:6: note: Left side of '||' is false
           if (tb[IFLA_NET_NS_PID] || tb[IFLA_NET_NS_FD] || tb[IFLA_TARGET_=
NETNSID]) {
               ^
   net/core/rtnetlink.c:2619:51: note: Assuming the condition is true
           if (tb[IFLA_NET_NS_PID] || tb[IFLA_NET_NS_FD] || tb[IFLA_TARGET_=
NETNSID]) {
                                                            ^~~~~~~~~~~~~~~=
~~~~~~~~
   net/core/rtnetlink.c:2619:2: note: Taking true branch
           if (tb[IFLA_NET_NS_PID] || tb[IFLA_NET_NS_FD] || tb[IFLA_TARGET_=
NETNSID]) {
           ^
   net/core/rtnetlink.c:2620:21: note: Assuming 'ifname' is null
                   const char *pat =3D ifname && ifname[0] ? ifname : NULL;
                                     ^~~~~~
   net/core/rtnetlink.c:2620:28: note: Left side of '&&' is false
                   const char *pat =3D ifname && ifname[0] ? ifname : NULL;
                                            ^
   net/core/rtnetlink.c:2626:7: note: Calling 'IS_ERR'
                   if (IS_ERR(net)) {
                       ^~~~~~~~~~~
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/rtnetlink.c:2626:7: note: Returning from 'IS_ERR'
                   if (IS_ERR(net)) {
                       ^~~~~~~~~~~
   net/core/rtnetlink.c:2626:3: note: Taking false branch
                   if (IS_ERR(net)) {
                   ^
   net/core/rtnetlink.c:2631:7: note: Assuming the condition is false
                   if (tb[IFLA_NEW_IFINDEX])
                       ^~~~~~~~~~~~~~~~~~~~
   net/core/rtnetlink.c:2631:3: note: Taking false branch
                   if (tb[IFLA_NEW_IFINDEX])
                   ^
   net/core/rtnetlink.c:2638:7: note: Assuming 'err' is 0
                   if (err)
                       ^~~
   net/core/rtnetlink.c:2638:3: note: Taking false branch
                   if (err)
                   ^
   net/core/rtnetlink.c:2643:6: note: Assuming the condition is false
           if (tb[IFLA_MAP]) {
               ^~~~~~~~~~~~
   net/core/rtnetlink.c:2643:2: note: Taking false branch
           if (tb[IFLA_MAP]) {
           ^
   net/core/rtnetlink.c:2672:6: note: Assuming the condition is false
           if (tb[IFLA_ADDRESS]) {
               ^~~~~~~~~~~~~~~~
   net/core/rtnetlink.c:2672:2: note: Taking false branch
           if (tb[IFLA_ADDRESS]) {
           ^
   net/core/rtnetlink.c:2693:6: note: Assuming the condition is false
           if (tb[IFLA_MTU]) {
               ^~~~~~~~~~~~
   net/core/rtnetlink.c:2693:2: note: Taking false branch
           if (tb[IFLA_MTU]) {
           ^
   net/core/rtnetlink.c:2700:6: note: Assuming the condition is false
           if (tb[IFLA_GROUP]) {
               ^~~~~~~~~~~~~~
   net/core/rtnetlink.c:2700:2: note: Taking false branch
           if (tb[IFLA_GROUP]) {
           ^
   net/core/rtnetlink.c:2710:6: note: Assuming field 'ifi_index' is > 0
           if (ifm->ifi_index > 0 && ifname[0]) {
               ^~~~~~~~~~~~~~~~~~
   net/core/rtnetlink.c:2710:6: note: Left side of '&&' is true
   net/core/rtnetlink.c:2710:28: note: Array access (from variable 'ifname'=
) results in a null pointer dereference
           if (ifm->ifi_index > 0 && ifname[0]) {
                                     ^~~~~~
   net/core/rtnetlink.c:2833:2: warning: Value stored to 'err' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           err =3D 0;
           ^     ~
   net/core/rtnetlink.c:2833:2: note: Value stored to 'err' is never read
           err =3D 0;
           ^     ~
   net/core/rtnetlink.c:2868:2: warning: Value stored to 'err' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           err =3D 0;
           ^     ~
   net/core/rtnetlink.c:2868:2: note: Value stored to 'err' is never read
           err =3D 0;
           ^     ~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   fs/cifs/ioctl.c:334:4: warning: Value stored to 'caps' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                           caps =3D le64_to_cpu(tcon->fsUnixInfo.Capability=
);
                           ^
   fs/cifs/ioctl.c:334:4: note: Value stored to 'caps' is never read
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
>> fs/cifs/sess.c:248:2: warning: Dereference of null pointer [clang-analyz=
er-core.NullDereference]
           list_for_each_entry_safe_continue(iface, niface, &ses->iface_lis=
t,
           ^
   include/linux/list.h:741:13: note: expanded from macro 'list_for_each_en=
try_safe_continue'
           for (pos =3D list_next_entry(pos, member),                      =
          \
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   fs/cifs/sess.c:231:28: note: 'iface' initialized to a null pointer value
           struct cifs_server_iface *iface =3D NULL, *niface =3D NULL;
                                     ^~~~~
   fs/cifs/sess.c:236:6: note: Assuming 'chan_index' is not equal to 0
           if (!chan_index)
               ^~~~~~~~~~~
   fs/cifs/sess.c:236:2: note: Taking false branch
           if (!chan_index)
           ^
   fs/cifs/sess.c:239:6: note: Assuming field 'iface' is null
           if (ses->chans[chan_index].iface) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/sess.c:239:2: note: Taking false branch
           if (ses->chans[chan_index].iface) {
           ^
   fs/cifs/sess.c:248:2: note: Dereference of null pointer
           list_for_each_entry_safe_continue(iface, niface, &ses->iface_lis=
t,
           ^
   include/linux/list.h:741:13: note: expanded from macro 'list_for_each_en=
try_safe_continue'
           for (pos =3D list_next_entry(pos, member),                      =
          \
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   fs/cifs/sess.c:305:22: warning: Value stored to 'ipv4' during its initia=
lization is never read [clang-analyzer-deadcode.DeadStores]
           struct sockaddr_in *ipv4 =3D (struct sockaddr_in *)&iface->socka=
ddr;
                               ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/sess.c:305:22: note: Value stored to 'ipv4' during its initializ=
ation is never read
           struct sockaddr_in *ipv4 =3D (struct sockaddr_in *)&iface->socka=
ddr;
                               ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/sess.c:306:23: warning: Value stored to 'ipv6' during its initia=
lization is never read [clang-analyzer-deadcode.DeadStores]
           struct sockaddr_in6 *ipv6 =3D (struct sockaddr_in6 *)&iface->soc=
kaddr;
                                ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   fs/cifs/sess.c:306:23: note: Value stored to 'ipv6' during its initializ=
ation is never read
           struct sockaddr_in6 *ipv6 =3D (struct sockaddr_in6 *)&iface->soc=
kaddr;
                                ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   fs/cifs/sess.c:590:2: warning: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(bcc_ptr, "Linux version ");
           ^~~~~~
   fs/cifs/sess.c:590:2: note: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119
           strcpy(bcc_ptr, "Linux version ");
           ^~~~~~
   fs/cifs/sess.c:592:2: warning: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(bcc_ptr, init_utsname()->release);
           ^~~~~~
   fs/cifs/sess.c:592:2: note: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119
           strcpy(bcc_ptr, init_utsname()->release);
           ^~~~~~
   fs/cifs/sess.c:595:2: warning: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(bcc_ptr, CIFS_NETWORK_OPSYS);
           ^~~~~~
   fs/cifs/sess.c:595:2: note: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119
           strcpy(bcc_ptr, CIFS_NETWORK_OPSYS);
           ^~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   include/linux/hid.h:1037:9: warning: Access to field 'name' results in a=
 dereference of a null pointer (loaded from variable 'input') [clang-analyz=
er-core.NullDereference]
                                       input->name, c, type);
                                       ^
   drivers/hid/hid-ite.c:49:7: note: Assuming the condition is true
           if ((quirks & QUIRK_TOUCHPAD_ON_OFF_REPORT) &&
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-ite.c:49:6: note: Left side of '&&' is true
           if ((quirks & QUIRK_TOUCHPAD_ON_OFF_REPORT) &&
               ^
   drivers/hid/hid-ite.c:50:6: note: Assuming the condition is true
               (usage->hid & HID_USAGE_PAGE) =3D=3D 0x00880000) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-ite.c:49:2: note: Taking true branch
           if ((quirks & QUIRK_TOUCHPAD_ON_OFF_REPORT) &&
           ^
   drivers/hid/hid-ite.c:51:7: note: Assuming field 'hid' is equal to 89130=
16
                   if (usage->hid =3D=3D 0x00880078) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-ite.c:51:3: note: Taking true branch
                   if (usage->hid =3D=3D 0x00880078) {
                   ^
   drivers/hid/hid-ite.c:53:4: note: Calling 'hid_map_usage_clear'
                           hid_map_usage_clear(hi, usage, bit, max, EV_KEY,=
 KEY_F22);

vim +248 fs/cifs/sess.c

d70e9fa55884760 Aurelien Aptel 2019-09-20  222  =

4eb628dd74df04a Shyam Prasad N 2022-01-03  223  /*
4eb628dd74df04a Shyam Prasad N 2022-01-03  224   * update the iface for the=
 channel if necessary.
4eb628dd74df04a Shyam Prasad N 2022-01-03  225   * will return 0 when iface=
 is updated. 1 otherwise
4eb628dd74df04a Shyam Prasad N 2022-01-03  226   */
4eb628dd74df04a Shyam Prasad N 2022-01-03  227  int
4eb628dd74df04a Shyam Prasad N 2022-01-03  228  cifs_chan_update_iface(stru=
ct cifs_ses *ses, struct TCP_Server_Info *server)
4eb628dd74df04a Shyam Prasad N 2022-01-03  229  {
4eb628dd74df04a Shyam Prasad N 2022-01-03  230  	unsigned int chan_index =
=3D cifs_ses_get_chan_index(ses, server);
4eb628dd74df04a Shyam Prasad N 2022-01-03  231  	struct cifs_server_iface *=
iface =3D NULL, *niface =3D NULL;
4eb628dd74df04a Shyam Prasad N 2022-01-03  232  	struct cifs_server_iface *=
old_iface =3D NULL;
4eb628dd74df04a Shyam Prasad N 2022-01-03  233  	int rc =3D 0;
4eb628dd74df04a Shyam Prasad N 2022-01-03  234  =

4eb628dd74df04a Shyam Prasad N 2022-01-03  235  	/* primary channel. This c=
an never go away */
4eb628dd74df04a Shyam Prasad N 2022-01-03  236  	if (!chan_index)
4eb628dd74df04a Shyam Prasad N 2022-01-03  237  		return 0;
4eb628dd74df04a Shyam Prasad N 2022-01-03  238  =

4eb628dd74df04a Shyam Prasad N 2022-01-03  239  	if (ses->chans[chan_index]=
.iface) {
4eb628dd74df04a Shyam Prasad N 2022-01-03  240  		old_iface =3D ses->chans[=
chan_index].iface;
4eb628dd74df04a Shyam Prasad N 2022-01-03  241  		if (old_iface->is_active)
4eb628dd74df04a Shyam Prasad N 2022-01-03  242  			return 1;
4eb628dd74df04a Shyam Prasad N 2022-01-03  243  	}
4eb628dd74df04a Shyam Prasad N 2022-01-03  244  =

4eb628dd74df04a Shyam Prasad N 2022-01-03  245  	spin_lock(&ses->iface_lock=
);
4eb628dd74df04a Shyam Prasad N 2022-01-03  246  =

4eb628dd74df04a Shyam Prasad N 2022-01-03  247  	/* then look for a new one=
 */
4eb628dd74df04a Shyam Prasad N 2022-01-03 @248  	list_for_each_entry_safe_c=
ontinue(iface, niface, &ses->iface_list,
4eb628dd74df04a Shyam Prasad N 2022-01-03  249  					  iface_head) {
4eb628dd74df04a Shyam Prasad N 2022-01-03  250  		if (!iface->is_active ||
4eb628dd74df04a Shyam Prasad N 2022-01-03  251  		    (is_ses_using_iface(s=
es, iface) &&
4eb628dd74df04a Shyam Prasad N 2022-01-03  252  		     !iface->rss_capable)=
) {
4eb628dd74df04a Shyam Prasad N 2022-01-03  253  			continue;
4eb628dd74df04a Shyam Prasad N 2022-01-03  254  		}
4eb628dd74df04a Shyam Prasad N 2022-01-03  255  		kref_get(&iface->refcount=
);
4eb628dd74df04a Shyam Prasad N 2022-01-03  256  	}
4eb628dd74df04a Shyam Prasad N 2022-01-03  257  =

4eb628dd74df04a Shyam Prasad N 2022-01-03  258  	if (!iface) {
4eb628dd74df04a Shyam Prasad N 2022-01-03  259  		rc =3D 1;
4eb628dd74df04a Shyam Prasad N 2022-01-03  260  		cifs_dbg(FYI, "unable to =
find a suitable iface. Keeping old one\n");
4eb628dd74df04a Shyam Prasad N 2022-01-03  261  		goto exit;
4eb628dd74df04a Shyam Prasad N 2022-01-03  262  	}
4eb628dd74df04a Shyam Prasad N 2022-01-03  263  =

4eb628dd74df04a Shyam Prasad N 2022-01-03  264  	/* now drop the ref to the=
 current iface */
4eb628dd74df04a Shyam Prasad N 2022-01-03  265  	if (old_iface)
4eb628dd74df04a Shyam Prasad N 2022-01-03  266  		kref_put(&old_iface->refc=
ount, release_iface);
4eb628dd74df04a Shyam Prasad N 2022-01-03  267  =

4eb628dd74df04a Shyam Prasad N 2022-01-03  268  	ses->chans[chan_index].ifa=
ce =3D iface;
4eb628dd74df04a Shyam Prasad N 2022-01-03  269  =

4eb628dd74df04a Shyam Prasad N 2022-01-03  270  exit:
4eb628dd74df04a Shyam Prasad N 2022-01-03  271  	spin_unlock(&ses->iface_lo=
ck);
4eb628dd74df04a Shyam Prasad N 2022-01-03  272  =

4eb628dd74df04a Shyam Prasad N 2022-01-03  273  	return rc;
4eb628dd74df04a Shyam Prasad N 2022-01-03  274  }
4eb628dd74df04a Shyam Prasad N 2022-01-03  275  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1895986661392221904==--

