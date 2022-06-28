Content-Type: multipart/mixed; boundary="===============7018761370833071631=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/afs/rxrpc.c:422:3: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Wed, 29 Jun 2022 07:49:46 +0800
Message-ID: <202206290720.apOsBnE8-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7018761370833071631==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 fs/afs/rxrpc.c:422:3: warning: Use of memory after it is freed [clang-anal=
yzer-unix.Malloc]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Chris Down <chris@chrisdown.name>
CC: Petr Mladek <pmladek@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   941e3e7912696b9fbe3586083a7c2e102cee7a87
commit: 337015573718b161891a3473d25f59273f2e626b printk: Userspace format i=
ndexing support
date:   12 months ago
:::::: branch date: 30 hours ago
:::::: commit date: 12 months ago
config: s390-randconfig-c005-20220622 (https://download.01.org/0day-ci/arch=
ive/20220629/202206290720.apOsBnE8-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 8b8d12=
6598ce7bd5243da7f94f69fa1104288bee)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D337015573718b161891a3473d25f59273f2e626b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 337015573718b161891a3473d25f59273f2e626b
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/afs/rxrpc.c:302:9: note: Assuming field 'type' is not equal to null
           ASSERT(call->type !=3D NULL);
                  ^
   fs/afs/internal.h:1667:17: note: expanded from macro 'ASSERT'
           if (unlikely(!(X))) {                                   \
               ~~~~~~~~~~~^~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/afs/rxrpc.c:302:2: note: Taking false branch
           ASSERT(call->type !=3D NULL);
           ^
   fs/afs/internal.h:1667:2: note: expanded from macro 'ASSERT'
           if (unlikely(!(X))) {                                   \
           ^
   fs/afs/rxrpc.c:302:2: note: Loop condition is false.  Exiting loop
           ASSERT(call->type !=3D NULL);
           ^
   fs/afs/internal.h:1665:24: note: expanded from macro 'ASSERT'
   #define ASSERT(X)                                               \
                                                                   ^
   fs/afs/rxrpc.c:303:9: note: Assuming field 'name' is not equal to null
           ASSERT(call->type->name !=3D NULL);
                  ^
   fs/afs/internal.h:1667:17: note: expanded from macro 'ASSERT'
           if (unlikely(!(X))) {                                   \
               ~~~~~~~~~~~^~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/afs/rxrpc.c:303:2: note: Taking false branch
           ASSERT(call->type->name !=3D NULL);
           ^
   fs/afs/internal.h:1667:2: note: expanded from macro 'ASSERT'
           if (unlikely(!(X))) {                                   \
           ^
   fs/afs/rxrpc.c:303:2: note: Loop condition is false.  Exiting loop
           ASSERT(call->type->name !=3D NULL);
           ^
   fs/afs/internal.h:1665:24: note: expanded from macro 'ASSERT'
   #define ASSERT(X)                                               \
                                                                   ^
   fs/afs/rxrpc.c:305:2: note: Assuming the condition is false
           _debug("____MAKE %p{%s,%x} [%d]____",
           ^
   fs/afs/internal.h:1650:6: note: expanded from macro '_debug'
           if (unlikely(afs_debug & AFS_DEBUG_KDEBUG))     \
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   fs/afs/rxrpc.c:305:2: note: Taking true branch
           _debug("____MAKE %p{%s,%x} [%d]____",
           ^
   fs/afs/internal.h:1650:2: note: expanded from macro '_debug'
           if (unlikely(afs_debug & AFS_DEBUG_KDEBUG))     \
           ^
   fs/afs/rxrpc.c:305:2: note: Loop condition is false.  Exiting loop
           _debug("____MAKE %p{%s,%x} [%d]____",
           ^
   fs/afs/internal.h:1651:3: note: expanded from macro '_debug'
                   kdebug(FMT,##__VA_ARGS__);              \
                   ^
   fs/afs/internal.h:1623:25: note: expanded from macro 'kdebug'
   #define kdebug(FMT,...) dbgprintk("    "FMT ,##__VA_ARGS__)
                           ^
   fs/afs/internal.h:1619:2: note: expanded from macro 'dbgprintk'
           printk("[%-6.6s] "FMT"\n", current->comm ,##__VA_ARGS__)
           ^
   include/linux/printk.h:434:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:429:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:404:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   fs/afs/rxrpc.c:305:2: note: Dereference of null pointer
           _debug("____MAKE %p{%s,%x} [%d]____",
           ^
   fs/afs/internal.h:1651:3: note: expanded from macro '_debug'
                   kdebug(FMT,##__VA_ARGS__);              \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/afs/internal.h:1623:25: note: expanded from macro 'kdebug'
   #define kdebug(FMT,...) dbgprintk("    "FMT ,##__VA_ARGS__)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/afs/internal.h:1619:29: note: expanded from macro 'dbgprintk'
           printk("[%-6.6s] "FMT"\n", current->comm ,##__VA_ARGS__)
                                      ^~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/printk.h:430:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
>> fs/afs/rxrpc.c:422:3: warning: Use of memory after it is freed [clang-an=
alyzer-unix.Malloc]
                   afs_put_call(call);
                   ^            ~~~~
   fs/afs/rxrpc.c:300:2: note: Assuming the condition is true
           _enter(",{%pISp},", &srx->transport);
           ^
   fs/afs/internal.h:1638:6: note: expanded from macro '_enter'
           if (unlikely(afs_debug & AFS_DEBUG_KENTER))     \
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   fs/afs/rxrpc.c:300:2: note: Taking false branch
           _enter(",{%pISp},", &srx->transport);
           ^
   fs/afs/internal.h:1638:2: note: expanded from macro '_enter'
           if (unlikely(afs_debug & AFS_DEBUG_KENTER))     \
           ^
   fs/afs/rxrpc.c:300:2: note: Loop condition is false.  Exiting loop
           _enter(",{%pISp},", &srx->transport);
           ^
   fs/afs/internal.h:1636:29: note: expanded from macro '_enter'
   #define _enter(FMT,...)                                 \
                                                           ^
   fs/afs/rxrpc.c:302:9: note: Assuming field 'type' is not equal to null
           ASSERT(call->type !=3D NULL);
                  ^
   fs/afs/internal.h:1667:17: note: expanded from macro 'ASSERT'
           if (unlikely(!(X))) {                                   \
               ~~~~~~~~~~~^~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/afs/rxrpc.c:302:2: note: Taking false branch
           ASSERT(call->type !=3D NULL);
           ^
   fs/afs/internal.h:1667:2: note: expanded from macro 'ASSERT'
           if (unlikely(!(X))) {                                   \
           ^
   fs/afs/rxrpc.c:302:2: note: Loop condition is false.  Exiting loop
           ASSERT(call->type !=3D NULL);
           ^
   fs/afs/internal.h:1665:24: note: expanded from macro 'ASSERT'
   #define ASSERT(X)                                               \
                                                                   ^
   fs/afs/rxrpc.c:303:9: note: Assuming field 'name' is not equal to null
           ASSERT(call->type->name !=3D NULL);
                  ^
   fs/afs/internal.h:1667:17: note: expanded from macro 'ASSERT'
           if (unlikely(!(X))) {                                   \
               ~~~~~~~~~~~^~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/afs/rxrpc.c:303:2: note: Taking false branch
           ASSERT(call->type->name !=3D NULL);
           ^
   fs/afs/internal.h:1667:2: note: expanded from macro 'ASSERT'
           if (unlikely(!(X))) {                                   \
           ^
   fs/afs/rxrpc.c:303:2: note: Loop condition is false.  Exiting loop
           ASSERT(call->type->name !=3D NULL);
           ^
   fs/afs/internal.h:1665:24: note: expanded from macro 'ASSERT'
   #define ASSERT(X)                                               \
                                                                   ^
   fs/afs/rxrpc.c:305:2: note: Assuming the condition is true
           _debug("____MAKE %p{%s,%x} [%d]____",
           ^
   fs/afs/internal.h:1650:6: note: expanded from macro '_debug'
           if (unlikely(afs_debug & AFS_DEBUG_KDEBUG))     \
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   fs/afs/rxrpc.c:305:2: note: Taking false branch
           _debug("____MAKE %p{%s,%x} [%d]____",
           ^
   fs/afs/internal.h:1650:2: note: expanded from macro '_debug'
           if (unlikely(afs_debug & AFS_DEBUG_KDEBUG))     \
           ^
   fs/afs/rxrpc.c:305:2: note: Loop condition is false.  Exiting loop
           _debug("____MAKE %p{%s,%x} [%d]____",
           ^
   fs/afs/internal.h:1648:29: note: expanded from macro '_debug'
   #define _debug(FMT,...)                                 \
                                                           ^
   fs/afs/rxrpc.c:317:6: note: Assuming field 'write_iter' is null
           if (call->write_iter)
               ^~~~~~~~~~~~~~~~
   fs/afs/rxrpc.c:317:2: note: Taking false branch
           if (call->write_iter)
           ^
   fs/afs/rxrpc.c:323:6: note: Assuming field 'async' is false
           if (call->async) {
               ^~~~~~~~~~~
   fs/afs/rxrpc.c:323:2: note: Taking false branch
           if (call->async) {
           ^
   fs/afs/rxrpc.c:332:14: note: Field 'async' is false
                                            (call->async ?

vim +422 fs/afs/rxrpc.c

e833251ad813168 David Howells 2017-08-29  285  =

08e0e7c82eeadec David Howells 2007-04-26  286  /*
0b9bf3812ad1f0d David Howells 2019-04-25  287   * Initiate a call and synch=
ronously queue up the parameters for dispatch.  Any
0b9bf3812ad1f0d David Howells 2019-04-25  288   * error is stored into the =
call struct, which the caller must check for.
08e0e7c82eeadec David Howells 2007-04-26  289   */
0b9bf3812ad1f0d David Howells 2019-04-25  290  void afs_make_call(struct af=
s_addr_cursor *ac, struct afs_call *call, gfp_t gfp)
08e0e7c82eeadec David Howells 2007-04-26  291  {
2feeaf8433c8e68 David Howells 2018-10-20  292  	struct sockaddr_rxrpc *srx =
=3D &ac->alist->addrs[ac->index];
08e0e7c82eeadec David Howells 2007-04-26  293  	struct rxrpc_call *rxcall;
08e0e7c82eeadec David Howells 2007-04-26  294  	struct msghdr msg;
08e0e7c82eeadec David Howells 2007-04-26  295  	struct kvec iov[1];
f105da1a798f23f David Howells 2020-02-06  296  	size_t len;
e754eba685aac2a David Howells 2017-06-07  297  	s64 tx_total_len;
08e0e7c82eeadec David Howells 2007-04-26  298  	int ret;
08e0e7c82eeadec David Howells 2007-04-26  299  =

4d9df9868f31df6 David Howells 2017-11-02  300  	_enter(",{%pISp},", &srx->t=
ransport);
08e0e7c82eeadec David Howells 2007-04-26  301  =

00d3b7a4533e367 David Howells 2007-04-26  302  	ASSERT(call->type !=3D NULL=
);
00d3b7a4533e367 David Howells 2007-04-26  303  	ASSERT(call->type->name !=
=3D NULL);
00d3b7a4533e367 David Howells 2007-04-26  304  =

31143d5d515ece6 David Howells 2007-05-09  305  	_debug("____MAKE %p{%s,%x} =
[%d]____",
31143d5d515ece6 David Howells 2007-05-09  306  	       call, call->type->na=
me, key_serial(call->key),
f044c8847bb61ef David Howells 2017-11-02  307  	       atomic_read(&call->n=
et->nr_outstanding_calls));
00d3b7a4533e367 David Howells 2007-04-26  308  =

3bf0fb6f33dd545 David Howells 2018-10-20  309  	call->addr_ix =3D ac->index;
3bf0fb6f33dd545 David Howells 2018-10-20  310  	call->alist =3D afs_get_add=
rlist(ac->alist);
08e0e7c82eeadec David Howells 2007-04-26  311  =

e754eba685aac2a David Howells 2017-06-07  312  	/* Work out the length we'r=
e going to transmit.  This is awkward for
e754eba685aac2a David Howells 2017-06-07  313  	 * calls such as FS.StoreDa=
ta where there's an extra injection of data
e754eba685aac2a David Howells 2017-06-07  314  	 * after the initial fixed =
part.
e754eba685aac2a David Howells 2017-06-07  315  	 */
e754eba685aac2a David Howells 2017-06-07  316  	tx_total_len =3D call->requ=
est_size;
bd80d8a80e12895 David Howells 2020-02-06  317  	if (call->write_iter)
bd80d8a80e12895 David Howells 2020-02-06  318  		tx_total_len +=3D iov_iter=
_count(call->write_iter);
e754eba685aac2a David Howells 2017-06-07  319  =

34fa47612bfe5d7 David Howells 2019-01-10  320  	/* If the call is going to =
be asynchronous, we need an extra ref for
34fa47612bfe5d7 David Howells 2019-01-10  321  	 * the call to hold itself =
so the caller need not hang on to its ref.
34fa47612bfe5d7 David Howells 2019-01-10  322  	 */
dde9f095583b3f3 David Howells 2020-03-13  323  	if (call->async) {
34fa47612bfe5d7 David Howells 2019-01-10  324  		afs_get_call(call, afs_cal=
l_trace_get);
dde9f095583b3f3 David Howells 2020-03-13  325  		call->drop_ref =3D true;
dde9f095583b3f3 David Howells 2020-03-13  326  	}
34fa47612bfe5d7 David Howells 2019-01-10  327  =

08e0e7c82eeadec David Howells 2007-04-26  328  	/* create a call */
4d9df9868f31df6 David Howells 2017-11-02  329  	rxcall =3D rxrpc_kernel_beg=
in_call(call->net->socket, srx, call->key,
e754eba685aac2a David Howells 2017-06-07  330  					 (unsigned long)call,
e754eba685aac2a David Howells 2017-06-07  331  					 tx_total_len, gfp,
0b9bf3812ad1f0d David Howells 2019-04-25  332  					 (call->async ?
56ff9c837778ba2 David Howells 2017-01-05  333  					  afs_wake_up_async_cal=
l :
a68f4a27f55f1d5 David Howells 2017-10-18  334  					  afs_wake_up_call_wait=
er),
a25e21f0bcd2567 David Howells 2018-03-27  335  					 call->upgrade,
e138aa7d3271ac1 David Howells 2020-03-13  336  					 (call->intr ? RXRPC_PR=
EINTERRUPTIBLE :
e138aa7d3271ac1 David Howells 2020-03-13  337  					  RXRPC_UNINTERRUPTIBLE=
),
a25e21f0bcd2567 David Howells 2018-03-27  338  					 call->debug_id);
08e0e7c82eeadec David Howells 2007-04-26  339  	if (IS_ERR(rxcall)) {
08e0e7c82eeadec David Howells 2007-04-26  340  		ret =3D PTR_ERR(rxcall);
3bf0fb6f33dd545 David Howells 2018-10-20  341  		call->error =3D ret;
08e0e7c82eeadec David Howells 2007-04-26  342  		goto error_kill_call;
08e0e7c82eeadec David Howells 2007-04-26  343  	}
08e0e7c82eeadec David Howells 2007-04-26  344  =

08e0e7c82eeadec David Howells 2007-04-26  345  	call->rxcall =3D rxcall;
08e0e7c82eeadec David Howells 2007-04-26  346  =

94f699c9cdb11b8 David Howells 2019-05-16  347  	if (call->max_lifespan)
94f699c9cdb11b8 David Howells 2019-05-16  348  		rxrpc_kernel_set_max_life(=
call->net->socket, rxcall,
94f699c9cdb11b8 David Howells 2019-05-16  349  					  call->max_lifespan);
94f699c9cdb11b8 David Howells 2019-05-16  350  =

08e0e7c82eeadec David Howells 2007-04-26  351  	/* send the request */
08e0e7c82eeadec David Howells 2007-04-26  352  	iov[0].iov_base	=3D call->r=
equest;
08e0e7c82eeadec David Howells 2007-04-26  353  	iov[0].iov_len	=3D call->re=
quest_size;
08e0e7c82eeadec David Howells 2007-04-26  354  =

08e0e7c82eeadec David Howells 2007-04-26  355  	msg.msg_name		=3D NULL;
08e0e7c82eeadec David Howells 2007-04-26  356  	msg.msg_namelen		=3D 0;
aa563d7bca6e882 David Howells 2018-10-20  357  	iov_iter_kvec(&msg.msg_iter=
, WRITE, iov, 1, call->request_size);
08e0e7c82eeadec David Howells 2007-04-26  358  	msg.msg_control		=3D NULL;
08e0e7c82eeadec David Howells 2007-04-26  359  	msg.msg_controllen	=3D 0;
bd80d8a80e12895 David Howells 2020-02-06  360  	msg.msg_flags		=3D MSG_WAIT=
ALL | (call->write_iter ? MSG_MORE : 0);
08e0e7c82eeadec David Howells 2007-04-26  361  =

f044c8847bb61ef David Howells 2017-11-02  362  	ret =3D rxrpc_kernel_send_d=
ata(call->net->socket, rxcall,
e833251ad813168 David Howells 2017-08-29  363  				     &msg, call->request=
_size,
e833251ad813168 David Howells 2017-08-29  364  				     afs_notify_end_requ=
est_tx);
08e0e7c82eeadec David Howells 2007-04-26  365  	if (ret < 0)
08e0e7c82eeadec David Howells 2007-04-26  366  		goto error_do_abort;
08e0e7c82eeadec David Howells 2007-04-26  367  =

bd80d8a80e12895 David Howells 2020-02-06  368  	if (call->write_iter) {
bd80d8a80e12895 David Howells 2020-02-06  369  		msg.msg_iter =3D *call->wr=
ite_iter;
bd80d8a80e12895 David Howells 2020-02-06  370  		msg.msg_flags &=3D ~MSG_MO=
RE;
bd80d8a80e12895 David Howells 2020-02-06  371  		trace_afs_send_data(call, =
&msg);
bd80d8a80e12895 David Howells 2020-02-06  372  =

bd80d8a80e12895 David Howells 2020-02-06  373  		ret =3D rxrpc_kernel_send_=
data(call->net->socket,
bd80d8a80e12895 David Howells 2020-02-06  374  					     call->rxcall, &msg,
bd80d8a80e12895 David Howells 2020-02-06  375  					     iov_iter_count(&ms=
g.msg_iter),
bd80d8a80e12895 David Howells 2020-02-06  376  					     afs_notify_end_req=
uest_tx);
bd80d8a80e12895 David Howells 2020-02-06  377  		*call->write_iter =3D msg.=
msg_iter;
bd80d8a80e12895 David Howells 2020-02-06  378  =

bd80d8a80e12895 David Howells 2020-02-06  379  		trace_afs_sent_data(call, =
&msg, ret);
31143d5d515ece6 David Howells 2007-05-09  380  		if (ret < 0)
31143d5d515ece6 David Howells 2007-05-09  381  			goto error_do_abort;
31143d5d515ece6 David Howells 2007-05-09  382  	}
31143d5d515ece6 David Howells 2007-05-09  383  =

34fa47612bfe5d7 David Howells 2019-01-10  384  	/* Note that@this point,=
 we may have received the reply or an abort
34fa47612bfe5d7 David Howells 2019-01-10  385  	 * - and an asynchronous ca=
ll may already have completed.
0b9bf3812ad1f0d David Howells 2019-04-25  386  	 *
0b9bf3812ad1f0d David Howells 2019-04-25  387  	 * afs_wait_for_call_to_com=
plete(call, ac)
0b9bf3812ad1f0d David Howells 2019-04-25  388  	 * must be called to synchr=
onously clean up.
34fa47612bfe5d7 David Howells 2019-01-10  389  	 */
0b9bf3812ad1f0d David Howells 2019-04-25  390  	return;
08e0e7c82eeadec David Howells 2007-04-26  391  =

08e0e7c82eeadec David Howells 2007-04-26  392  error_do_abort:
70af0e3bd65142f David Howells 2017-03-16  393  	if (ret !=3D -ECONNABORTED)=
 {
f044c8847bb61ef David Howells 2017-11-02  394  		rxrpc_kernel_abort_call(ca=
ll->net->socket, rxcall,
f044c8847bb61ef David Howells 2017-11-02  395  					RX_USER_ABORT, ret, "KS=
D");
70af0e3bd65142f David Howells 2017-03-16  396  	} else {
f105da1a798f23f David Howells 2020-02-06  397  		len =3D 0;
aa563d7bca6e882 David Howells 2018-10-20  398  		iov_iter_kvec(&msg.msg_ite=
r, READ, NULL, 0, 0);
eb9950eb31f56e5 David Howells 2018-08-03  399  		rxrpc_kernel_recv_data(cal=
l->net->socket, rxcall,
f105da1a798f23f David Howells 2020-02-06  400  				       &msg.msg_iter, &l=
en, false,
eb9950eb31f56e5 David Howells 2018-08-03  401  				       &call->abort_code=
, &call->service_id);
d2ddc776a4581d9 David Howells 2017-11-02  402  		ac->abort_code =3D call->a=
bort_code;
d2ddc776a4581d9 David Howells 2017-11-02  403  		ac->responded =3D true;
70af0e3bd65142f David Howells 2017-03-16  404  	}
025db80c9e421ef David Howells 2017-11-02  405  	call->error =3D ret;
025db80c9e421ef David Howells 2017-11-02  406  	trace_afs_call_done(call);
08e0e7c82eeadec David Howells 2007-04-26  407  error_kill_call:
3bf0fb6f33dd545 David Howells 2018-10-20  408  	if (call->type->done)
3bf0fb6f33dd545 David Howells 2018-10-20  409  		call->type->done(call);
34fa47612bfe5d7 David Howells 2019-01-10  410  =

34fa47612bfe5d7 David Howells 2019-01-10  411  	/* We need to dispose of th=
e extra ref we grabbed for an async call.
34fa47612bfe5d7 David Howells 2019-01-10  412  	 * The call, however, might=
 be queued on afs_async_calls and we need to
34fa47612bfe5d7 David Howells 2019-01-10  413  	 * make sure we don't get a=
ny more notifications that might requeue it.
34fa47612bfe5d7 David Howells 2019-01-10  414  	 */
34fa47612bfe5d7 David Howells 2019-01-10  415  	if (call->rxcall) {
34fa47612bfe5d7 David Howells 2019-01-10  416  		rxrpc_kernel_end_call(call=
->net->socket, call->rxcall);
34fa47612bfe5d7 David Howells 2019-01-10  417  		call->rxcall =3D NULL;
34fa47612bfe5d7 David Howells 2019-01-10  418  	}
34fa47612bfe5d7 David Howells 2019-01-10  419  	if (call->async) {
34fa47612bfe5d7 David Howells 2019-01-10  420  		if (cancel_work_sync(&call=
->async_work))
34fa47612bfe5d7 David Howells 2019-01-10  421  			afs_put_call(call);
341f741f04becee David Howells 2017-01-05 @422  		afs_put_call(call);
34fa47612bfe5d7 David Howells 2019-01-10  423  	}
34fa47612bfe5d7 David Howells 2019-01-10  424  =

d2ddc776a4581d9 David Howells 2017-11-02  425  	ac->error =3D ret;
34fa47612bfe5d7 David Howells 2019-01-10  426  	call->state =3D AFS_CALL_CO=
MPLETE;
08e0e7c82eeadec David Howells 2007-04-26  427  	_leave(" =3D %d", ret);
08e0e7c82eeadec David Howells 2007-04-26  428  }
08e0e7c82eeadec David Howells 2007-04-26  429  =


:::::: The code at line 422 was first introduced by commit
:::::: 341f741f04beceebcb30daa12ae2e5e52e64e532 afs: Refcount the afs_call =
struct

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7018761370833071631==--

