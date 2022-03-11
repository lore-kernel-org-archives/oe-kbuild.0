Content-Type: multipart/mixed; boundary="===============6011723636636490436=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH bpf-next v3 1/4] bpf, sockmap: Fix memleak in sk_psock_queue_msg
Date: Sat, 12 Mar 2022 00:27:02 +0800
Message-ID: <202203120008.5maLLSVP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6011723636636490436==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220304081145.2037182-2-wangyufen@huawei.com>
References: <20220304081145.2037182-2-wangyufen@huawei.com>
TO: Wang Yufen <wangyufen@huawei.com>
TO: john.fastabend(a)gmail.com
TO: daniel(a)iogearbox.net
TO: jakub(a)cloudflare.com
TO: lmb(a)cloudflare.com
TO: davem(a)davemloft.net
TO: bpf(a)vger.kernel.org
CC: edumazet(a)google.com
CC: yoshfuji(a)linux-ipv6.org
CC: dsahern(a)kernel.org
CC: kuba(a)kernel.org
CC: ast(a)kernel.org
CC: andrii(a)kernel.org
CC: kafai(a)fb.com
CC: songliubraving(a)fb.com
CC: yhs(a)fb.com
CC: kpsingh(a)kernel.org
CC: netdev(a)vger.kernel.org
CC: Wang Yufen <wangyufen@huawei.com>

Hi Wang,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Wang-Yufen/bpf-sockmap-Fix=
-memleaks-and-issues-of-mem-charge-uncharge/20220304-155608
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: riscv-randconfig-c006-20220307 (https://download.01.org/0day-ci/arc=
hive/20220312/202203120008.5maLLSVP-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/686b7d3583903f187fd3e88e1=
649b07e80a0cfa7
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Wang-Yufen/bpf-sockmap-Fix-memleak=
s-and-issues-of-mem-charge-uncharge/20220304-155608
        git checkout 686b7d3583903f187fd3e88e1649b07e80a0cfa7
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                ^
   drivers/scsi/st.c:3121:6: note: Assuming 'SRpnt' is null
           if (!SRpnt)
               ^~~~~~
   drivers/scsi/st.c:3121:2: note: Taking true branch
           if (!SRpnt)
           ^
   drivers/scsi/st.c:3122:3: note: Returning without writing to '*partition'
                   return (STp->buffer)->syscall_result;
                   ^
   drivers/scsi/st.c:3266:11: note: Returning from 'get_location'
           if ((i =3D get_location(STp, &block, &partition, 1)) < 0)
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/st.c:3266:6: note: Assuming the condition is false
           if ((i =3D get_location(STp, &block, &partition, 1)) < 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/st.c:3266:2: note: Taking false branch
           if ((i =3D get_location(STp, &block, &partition, 1)) < 0)
           ^
   drivers/scsi/st.c:3268:16: note: The left operand of '>=3D' is a garbage=
 value
           if (partition >=3D ST_NBR_PARTITIONS)
               ~~~~~~~~~ ^
   drivers/scsi/st.c:4252:7: warning: Although the value stored to 'stp' is=
 used in the enclosing expression, the value is never actually read from 's=
tp' [clang-analyzer-deadcode.DeadStores]
           if ((stp =3D st_incompatible(SDp))) {
                ^     ~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/st.c:4252:7: note: Although the value stored to 'stp' is us=
ed in the enclosing expression, the value is never actually read from 'stp'
           if ((stp =3D st_incompatible(SDp))) {
                ^     ~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/media/dvb-frontends/si2165.c:528:34: warning: Value stored to 'c=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct dtv_frontend_properties *c =3D &fe->dtv_property_cache;
                                           ^   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/si2165.c:528:34: note: Value stored to 'c' d=
uring its initialization is never read
           struct dtv_frontend_properties *c =3D &fe->dtv_property_cache;
                                           ^   ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/media/dvb-frontends/sp2.c:208:14: warning: Value stored to 's' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct sp2 *s =3D en50221->data;
                       ^   ~~~~~~~~~~~~~
   drivers/media/dvb-frontends/sp2.c:208:14: note: Value stored to 's' duri=
ng its initialization is never read
           struct sp2 *s =3D en50221->data;
                       ^   ~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/media/dvb-frontends/horus3a.c:141:23: warning: Value stored to '=
priv' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct horus3a_priv *priv =3D fe->tuner_priv;
                                ^~~~   ~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/horus3a.c:141:23: note: Value stored to 'pri=
v' during its initialization is never read
           struct horus3a_priv *priv =3D fe->tuner_priv;
                                ^~~~   ~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/horus3a.c:149:23: warning: Value stored to '=
priv' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct horus3a_priv *priv =3D fe->tuner_priv;
                                ^~~~   ~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/horus3a.c:149:23: note: Value stored to 'pri=
v' during its initialization is never read
           struct horus3a_priv *priv =3D fe->tuner_priv;
                                ^~~~   ~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/media/dvb-frontends/ascot2e.c:252:23: warning: Value stored to '=
priv' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct ascot2e_priv *priv =3D fe->tuner_priv;
                                ^~~~   ~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/ascot2e.c:252:23: note: Value stored to 'pri=
v' during its initialization is never read
           struct ascot2e_priv *priv =3D fe->tuner_priv;
                                ^~~~   ~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/ascot2e.c:272:23: warning: Value stored to '=
priv' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct ascot2e_priv *priv =3D fe->tuner_priv;
                                ^~~~   ~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/ascot2e.c:272:23: note: Value stored to 'pri=
v' during its initialization is never read
           struct ascot2e_priv *priv =3D fe->tuner_priv;
                                ^~~~   ~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   net/core/net-sysfs.c:1769:2: warning: Value stored to 'txq' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           txq =3D real_tx;
           ^     ~~~~~~~
   net/core/net-sysfs.c:1769:2: note: Value stored to 'txq' is never read
           txq =3D real_tx;
           ^     ~~~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   65 warnings generated.
   Suppressed 65 warnings (63 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
>> net/core/skmsg.c:569:3: warning: Attempt to free released memory [clang-=
analyzer-unix.Malloc]
                   kfree(msg);
                   ^
   net/core/skmsg.c:631:6: note: Assuming field 'skb' is null
           if (unlikely(state->skb)) {
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   net/core/skmsg.c:631:2: note: Taking false branch
           if (unlikely(state->skb)) {
           ^
   net/core/skmsg.c:639:6: note: 'skb' is null
           if (skb)
               ^~~
   net/core/skmsg.c:639:2: note: Taking false branch
           if (skb)
           ^
   net/core/skmsg.c:642:2: note: Loop condition is true.  Entering loop body
           while ((skb =3D skb_dequeue(&psock->ingress_skb))) {
           ^
   net/core/skmsg.c:645:7: note: Assuming the condition is true
                   if (skb_bpf_strparser(skb)) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   net/core/skmsg.c:645:3: note: Taking true branch
                   if (skb_bpf_strparser(skb)) {
                   ^
   net/core/skmsg.c:656:8: note: Assuming the condition is true
                           if (!sock_flag(psock->sk, SOCK_DEAD))
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/skmsg.c:656:4: note: Taking true branch
                           if (!sock_flag(psock->sk, SOCK_DEAD))
                           ^
   net/core/skmsg.c:657:11: note: Calling 'sk_psock_handle_skb'
                                   ret =3D sk_psock_handle_skb(psock, skb, =
off,
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   net/core/skmsg.c:597:6: note: Assuming 'ingress' is true
           if (!ingress) {
               ^~~~~~~~
   net/core/skmsg.c:597:2: note: Taking false branch
           if (!ingress) {
           ^
   net/core/skmsg.c:602:9: note: Calling 'sk_psock_skb_ingress'
           return sk_psock_skb_ingress(psock, skb, off, len);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/skmsg.c:554:15: note: Assuming 'sk' is not equal to field 'sk'
           if (unlikely(skb->sk =3D=3D sk))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/core/skmsg.c:554:2: note: Taking false branch
           if (unlikely(skb->sk =3D=3D sk))
           ^
   net/core/skmsg.c:556:8: note: Calling 'sk_psock_create_ingress_msg'
           msg =3D sk_psock_create_ingress_msg(sk, skb);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/skmsg.c:496:6: note: Assuming the condition is false
           if (atomic_read(&sk->sk_rmem_alloc) > sk->sk_rcvbuf)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/skmsg.c:496:2: note: Taking false branch
           if (atomic_read(&sk->sk_rmem_alloc) > sk->sk_rcvbuf)
           ^
   net/core/skmsg.c:499:2: note: Taking false branch
           if (!sk_rmem_schedule(sk, skb, skb->truesize))
           ^
   net/core/skmsg.c:503:15: note: Assuming 'msg' is non-null
           if (unlikely(!msg))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/core/skmsg.c:503:2: note: Taking false branch
           if (unlikely(!msg))
           ^
   net/core/skmsg.c:556:8: note: Returning from 'sk_psock_create_ingress_ms=
g'
           msg =3D sk_psock_create_ingress_msg(sk, skb);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/skmsg.c:557:7: note: 'msg' is non-null
           if (!msg)
                ^~~
   net/core/skmsg.c:557:2: note: Taking false branch
           if (!msg)
           ^
   net/core/skmsg.c:567:8: note: Calling 'sk_psock_skb_ingress_enqueue'
           err =3D sk_psock_skb_ingress_enqueue(skb, off, len, psock, sk, m=
sg);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/skmsg.c:523:2: note: Taking false branch
           if (skb_linearize(skb))
           ^
   net/core/skmsg.c:526:15: note: Assuming 'num_sge' is >=3D 0
           if (unlikely(num_sge < 0))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/core/skmsg.c:526:2: note: Taking false branch
           if (unlikely(num_sge < 0))
           ^
   net/core/skmsg.c:535:2: note: Calling 'sk_psock_queue_msg'
           sk_psock_queue_msg(psock, msg);

vim +569 net/core/skmsg.c

604326b41a6fb9 Daniel Borkmann 2018-10-13  539  =

7303524e04af49 Liu Jian        2021-10-29  540  static int sk_psock_skb_ing=
ress_self(struct sk_psock *psock, struct sk_buff *skb,
7303524e04af49 Liu Jian        2021-10-29  541  				     u32 off, u32 len);
2443ca66676d50 John Fastabend  2020-11-16  542  =

7303524e04af49 Liu Jian        2021-10-29  543  static int sk_psock_skb_ing=
ress(struct sk_psock *psock, struct sk_buff *skb,
7303524e04af49 Liu Jian        2021-10-29  544  				u32 off, u32 len)
6fa9201a898983 John Fastabend  2020-11-16  545  {
6fa9201a898983 John Fastabend  2020-11-16  546  	struct sock *sk =3D psock-=
>sk;
6fa9201a898983 John Fastabend  2020-11-16  547  	struct sk_msg *msg;
7e6b27a69167f9 John Fastabend  2021-07-12  548  	int err;
6fa9201a898983 John Fastabend  2020-11-16  549  =

2443ca66676d50 John Fastabend  2020-11-16  550  	/* If we are receiving on =
the same sock skb->sk is already assigned,
2443ca66676d50 John Fastabend  2020-11-16  551  	 * skip memory accounting =
and owner transition seeing it already set
2443ca66676d50 John Fastabend  2020-11-16  552  	 * correctly.
2443ca66676d50 John Fastabend  2020-11-16  553  	 */
2443ca66676d50 John Fastabend  2020-11-16  554  	if (unlikely(skb->sk =3D=
=3D sk))
7303524e04af49 Liu Jian        2021-10-29  555  		return sk_psock_skb_ingre=
ss_self(psock, skb, off, len);
6fa9201a898983 John Fastabend  2020-11-16  556  	msg =3D sk_psock_create_in=
gress_msg(sk, skb);
6fa9201a898983 John Fastabend  2020-11-16  557  	if (!msg)
6fa9201a898983 John Fastabend  2020-11-16  558  		return -EAGAIN;
6fa9201a898983 John Fastabend  2020-11-16  559  =

6fa9201a898983 John Fastabend  2020-11-16  560  	/* This will transition ow=
nership of the data from the socket where
6fa9201a898983 John Fastabend  2020-11-16  561  	 * the BPF program was run=
 initiating the redirect to the socket
6fa9201a898983 John Fastabend  2020-11-16  562  	 * we will eventually rece=
ive this data on. The data will be released
6fa9201a898983 John Fastabend  2020-11-16  563  	 * from skb_consume found =
in __tcp_bpf_recvmsg() after its been copied
6fa9201a898983 John Fastabend  2020-11-16  564  	 * into user buffers.
6fa9201a898983 John Fastabend  2020-11-16  565  	 */
6fa9201a898983 John Fastabend  2020-11-16  566  	skb_set_owner_r(skb, sk);
7303524e04af49 Liu Jian        2021-10-29  567  	err =3D sk_psock_skb_ingre=
ss_enqueue(skb, off, len, psock, sk, msg);
7e6b27a69167f9 John Fastabend  2021-07-12  568  	if (err < 0)
7e6b27a69167f9 John Fastabend  2021-07-12 @569  		kfree(msg);
7e6b27a69167f9 John Fastabend  2021-07-12  570  	return err;
6fa9201a898983 John Fastabend  2020-11-16  571  }
6fa9201a898983 John Fastabend  2020-11-16  572  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============6011723636636490436==--

