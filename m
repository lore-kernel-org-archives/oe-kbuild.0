Content-Type: multipart/mixed; boundary="===============5264725247706166526=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [saeed:net-next-mlx5 26/38] net/tipc/bcast.c:305:4: warning: The expression is an uninitialized value. The computed value will also be garbage [clang-analyzer-core.uninitialized.Assign]
Date: Sun, 12 Dec 2021 02:49:38 +0800
Message-ID: <202112120259.1pw8pVdQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5264725247706166526==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux.git net=
-next-mlx5
head:   77ab714f00703c91d5a6e15d7445775c80358774
commit: 1a2fb220edca98d18f90e3ef5bd6853a6b22b1b8 [26/38] skbuff: Extract li=
st pointers to silence compiler warnings
:::::: branch date: 14 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c007-20211210 (https://download.01.org/0day-ci/ar=
chive/20211212/202112120259.1pw8pVdQ-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux.git/c=
ommit/?id=3D1a2fb220edca98d18f90e3ef5bd6853a6b22b1b8
        git remote add saeed https://git.kernel.org/pub/scm/linux/kernel/gi=
t/saeed/linux.git
        git fetch --no-tags saeed net-next-mlx5
        git checkout 1a2fb220edca98d18f90e3ef5bd6853a6b22b1b8
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:315:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/rculist.h:84:2: note: Loop condition is false.  Exiting lo=
op
           rcu_assign_pointer(list_next_rcu(prev), new);
           ^
   include/linux/rcupdate.h:453:3: note: expanded from macro 'rcu_assign_po=
inter'
                   smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p_=
_v)); \
                   ^
   include/asm-generic/barrier.h:164:2: note: expanded from macro 'smp_stor=
e_release'
           WRITE_ONCE(*p, v);                                              \
           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:307:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   include/linux/rculist.h:84:2: note: Dereference of null pointer
           rcu_assign_pointer(list_next_rcu(prev), new);
           ^
   include/linux/rcupdate.h:453:3: note: expanded from macro 'rcu_assign_po=
inter'
                   smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p_=
_v)); \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/asm-generic/barrier.h:164:2: note: expanded from macro 'smp_stor=
e_release'
           WRITE_ONCE(*p, v);                                              \
           ^~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:61:2: note: expanded from macro 'WRITE_ONCE'
           __WRITE_ONCE(x, val);                                           \
           ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:55:30: note: expanded from macro '__WRITE_O=
NCE'
           *(volatile typeof(x) *)&(x) =3D (val);                          =
  \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/vme/bridges/vme_fake.c:560:5: warning: Value stored to 'done' is=
 never read [clang-analyzer-deadcode.DeadStores]
                                   done +=3D 1;
                                   ^       ~
   drivers/vme/bridges/vme_fake.c:560:5: note: Value stored to 'done' is ne=
ver read
                                   done +=3D 1;
                                   ^       ~
   drivers/vme/bridges/vme_fake.c:604:3: warning: Value stored to 'done' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   done +=3D 1;
                   ^       ~
   drivers/vme/bridges/vme_fake.c:604:3: note: Value stored to 'done' is ne=
ver read
                   done +=3D 1;
                   ^       ~
   drivers/vme/bridges/vme_fake.c:749:5: warning: Value stored to 'done' is=
 never read [clang-analyzer-deadcode.DeadStores]
                                   done +=3D 1;
                                   ^       ~
   drivers/vme/bridges/vme_fake.c:749:5: note: Value stored to 'done' is ne=
ver read
                                   done +=3D 1;
                                   ^       ~
   drivers/vme/bridges/vme_fake.c:794:3: warning: Value stored to 'done' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   done +=3D 1;
                   ^       ~
   drivers/vme/bridges/vme_fake.c:794:3: note: Value stored to 'done' is ne=
ver read
                   done +=3D 1;
                   ^       ~
   drivers/vme/bridges/vme_fake.c:1104:2: warning: Call to function 'strcpy=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcp=
y]
           strcpy(fake_bridge->name, driver_name);
           ^~~~~~
   drivers/vme/bridges/vme_fake.c:1104:2: note: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119
           strcpy(fake_bridge->name, driver_name);
           ^~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> net/tipc/bcast.c:305:4: warning: The expression is an uninitialized valu=
e. The computed value will also be garbage [clang-analyzer-core.uninitializ=
ed.Assign]
                           (*cong_link_cnt)++;
                           ^
   net/tipc/bcast.c:392:6: note: Assuming field 'local' is false
           if (dests->local && !tipc_msg_reassemble(pkts, &localq)) {
               ^~~~~~~~~~~~
   net/tipc/bcast.c:392:19: note: Left side of '&&' is false
           if (dests->local && !tipc_msg_reassemble(pkts, &localq)) {
                            ^
   net/tipc/bcast.c:397:6: note: Assuming field 'remote' is not equal to 0
           if (dests->remote) {
               ^~~~~~~~~~~~~
   net/tipc/bcast.c:397:2: note: Taking true branch
           if (dests->remote) {
           ^
   net/tipc/bcast.c:402:7: note: Assuming the condition is false
                   if (msg_user(hdr) =3D=3D MSG_FRAGMENTER)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/tipc/bcast.c:402:3: note: Taking false branch
                   if (msg_user(hdr) =3D=3D MSG_FRAGMENTER)
                   ^
   net/tipc/bcast.c:407:7: note: Assuming 'rcast' is not equal to field 'rc=
ast'
                   if (rcast !=3D method->rcast) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   net/tipc/bcast.c:407:3: note: Taking true branch
                   if (rcast !=3D method->rcast) {
                   ^
   net/tipc/bcast.c:408:9: note: Calling 'tipc_mcast_send_sync'
                           rc =3D tipc_mcast_send_sync(net, skb, method, de=
sts);
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   net/tipc/bcast.c:324:2: note: 'cong_link_cnt' declared without an initia=
l value
           u16 cong_link_cnt;
           ^~~~~~~~~~~~~~~~~
   net/tipc/bcast.c:328:6: note: Assuming the condition is false
           if (!(tipc_net(net)->capabilities & TIPC_MCAST_RBCTL))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/tipc/bcast.c:328:2: note: Taking false branch
           if (!(tipc_net(net)->capabilities & TIPC_MCAST_RBCTL))
           ^
   net/tipc/bcast.c:332:6: note: Assuming the condition is false
           if (msg_user(hdr) =3D=3D MSG_FRAGMENTER)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/tipc/bcast.c:332:2: note: Taking false branch
           if (msg_user(hdr) =3D=3D MSG_FRAGMENTER)
           ^
   net/tipc/bcast.c:334:6: note: Assuming the condition is false
           if (msg_type(hdr) !=3D TIPC_MCAST_MSG)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/tipc/bcast.c:334:2: note: Taking false branch
           if (msg_type(hdr) !=3D TIPC_MCAST_MSG)
           ^
   net/tipc/bcast.c:339:6: note: Assuming '_skb' is non-null
           if (!_skb)
               ^~~~~
   net/tipc/bcast.c:339:2: note: Taking false branch
           if (!_skb)
           ^
   net/tipc/bcast.c:352:25: note: Assuming the condition is false
           msg_set_is_rcast(_hdr, !msg_is_rcast(hdr));
                                  ^~~~~~~~~~~~~~~~~~
   net/tipc/bcast.c:357:14: note: Field 'rcast' is false
           if (method->rcast)
                       ^
   net/tipc/bcast.c:357:2: note: Taking false branch
           if (method->rcast)
           ^
   net/tipc/bcast.c:360:8: note: Calling 'tipc_rcast_xmit'
                   rc =3D tipc_rcast_xmit(net, &tmpq, dests, &cong_link_cnt=
);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/tipc/bcast.c:298:2: note: Loop condition is true.  Entering loop body
           list_for_each_entry_safe(dst, tmp, &dests->list, list) {
           ^
   include/linux/list.h:717:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   net/tipc/bcast.c:300:7: note: Assuming the condition is false
                   if (!tipc_msg_pskb_copy(dnode, pkts, &_pkts))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/tipc/bcast.c:300:3: note: Taking false branch
                   if (!tipc_msg_pskb_copy(dnode, pkts, &_pkts))
                   ^
   net/tipc/bcast.c:304:7: note: Assuming the condition is true
                   if (tipc_node_xmit(net, &_pkts, dnode, selector) =3D=3D =
-ELINKCONG)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   net/tipc/bcast.c:304:3: note: Taking true branch
                   if (tipc_node_xmit(net, &_pkts, dnode, selector) =3D=3D =
-ELINKCONG)
                   ^
   net/tipc/bcast.c:305:4: note: The expression is an uninitialized value. =
The computed value will also be garbage
                           (*cong_link_cnt)++;
                           ^~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +305 net/tipc/bcast.c

5266698661401af Jon Paul Maloy 2015-10-22  279  =

a853e4c6d084372 Jon Paul Maloy 2017-01-18  280  /* tipc_rcast_xmit - replic=
ate and send a message to given destination nodes
a853e4c6d084372 Jon Paul Maloy 2017-01-18  281   * @net: the applicable net=
 namespace
a853e4c6d084372 Jon Paul Maloy 2017-01-18  282   * @pkts: chain of buffers =
containing message
a853e4c6d084372 Jon Paul Maloy 2017-01-18  283   * @dests: list of destinat=
ion nodes
a853e4c6d084372 Jon Paul Maloy 2017-01-18  284   * @cong_link_cnt: returns =
number of congested links
a853e4c6d084372 Jon Paul Maloy 2017-01-18  285   * @cong_links: returns ide=
ntities of congested links
a853e4c6d084372 Jon Paul Maloy 2017-01-18  286   * Returns 0 if success, ot=
herwise errno
a853e4c6d084372 Jon Paul Maloy 2017-01-18  287   */
a853e4c6d084372 Jon Paul Maloy 2017-01-18  288  static int tipc_rcast_xmit(=
struct net *net, struct sk_buff_head *pkts,
a853e4c6d084372 Jon Paul Maloy 2017-01-18  289  			   struct tipc_nlist *de=
sts, u16 *cong_link_cnt)
a853e4c6d084372 Jon Paul Maloy 2017-01-18  290  {
a80ae5306a7346d Jon Maloy      2017-10-13  291  	struct tipc_dest *dst, *tm=
p;
a853e4c6d084372 Jon Paul Maloy 2017-01-18  292  	struct sk_buff_head _pkts;
a80ae5306a7346d Jon Maloy      2017-10-13  293  	u32 dnode, selector;
a853e4c6d084372 Jon Paul Maloy 2017-01-18  294  =

a853e4c6d084372 Jon Paul Maloy 2017-01-18  295  	selector =3D msg_link_sele=
ctor(buf_msg(skb_peek(pkts)));
e654f9f53b45fde Jon Maloy      2019-08-15  296  	__skb_queue_head_init(&_pk=
ts);
a853e4c6d084372 Jon Paul Maloy 2017-01-18  297  =

a80ae5306a7346d Jon Maloy      2017-10-13  298  	list_for_each_entry_safe(d=
st, tmp, &dests->list, list) {
a80ae5306a7346d Jon Maloy      2017-10-13  299  		dnode =3D dst->node;
a80ae5306a7346d Jon Maloy      2017-10-13  300  		if (!tipc_msg_pskb_copy(d=
node, pkts, &_pkts))
a853e4c6d084372 Jon Paul Maloy 2017-01-18  301  			return -ENOMEM;
a853e4c6d084372 Jon Paul Maloy 2017-01-18  302  =

a853e4c6d084372 Jon Paul Maloy 2017-01-18  303  		/* Any other return value=
 than -ELINKCONG is ignored */
a80ae5306a7346d Jon Maloy      2017-10-13  304  		if (tipc_node_xmit(net, &=
_pkts, dnode, selector) =3D=3D -ELINKCONG)
a853e4c6d084372 Jon Paul Maloy 2017-01-18 @305  			(*cong_link_cnt)++;
a853e4c6d084372 Jon Paul Maloy 2017-01-18  306  	}
a853e4c6d084372 Jon Paul Maloy 2017-01-18  307  	return 0;
a853e4c6d084372 Jon Paul Maloy 2017-01-18  308  }
a853e4c6d084372 Jon Paul Maloy 2017-01-18  309  =


:::::: The code at line 305 was first introduced by commit
:::::: a853e4c6d0843729e1f25a7a7beff168e1dd7420 tipc: introduce replicast a=
s transport option for multicast

:::::: TO: Jon Paul Maloy <jon.maloy@ericsson.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5264725247706166526==--

