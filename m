Content-Type: multipart/mixed; boundary="===============8649496832829342157=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cel:topic-rpc-with-tls-upcall 14/15] net/tls/af_tlsh.c:314:11: warning: Although the value stored to 'newsk' is used in the enclosing expression, the value is never actually read from 'newsk' [clang-analyzer-deadcode.DeadStores]
Date: Tue, 07 Dec 2021 22:08:53 +0800
Message-ID: <202112072224.ToBlQGuO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8649496832829342157==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Chuck Lever <chuck.lever@oracle.com>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux topic-rpc-w=
ith-tls-upcall
head:   667fe15e9d8a4b978367248bdf40bcd31620a08d
commit: c6ec67d41918e82616ed6f0ea2c3cb90710f2ee7 [14/15] NET: Add support f=
or PF_TLSH (a TLS handshake listener)
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: riscv-randconfig-c006-20211207 (https://download.01.org/0day-ci/arc=
hive/20211207/202112072224.ToBlQGuO-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git/com=
mit/?id=3Dc6ec67d41918e82616ed6f0ea2c3cb90710f2ee7
        git remote add cel git://git.kernel.org/pub/scm/linux/kernel/git/ce=
l/linux
        git fetch --no-tags cel topic-rpc-with-tls-upcall
        git checkout c6ec67d41918e82616ed6f0ea2c3cb90710f2ee7
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/usb/dwc2/hcd_ddma.c:974:2: note: Taking false branch
           if (chan->halt_status =3D=3D DWC2_HC_XFER_URB_DEQUEUE) {
           ^
   drivers/usb/dwc2/hcd_ddma.c:980:6: note: Assuming 'halt_status' is equal=
 to DWC2_HC_XFER_AHB_ERR
           if (halt_status =3D=3D DWC2_HC_XFER_AHB_ERR ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc2/hcd_ddma.c:980:42: note: Left side of '||' is true
           if (halt_status =3D=3D DWC2_HC_XFER_AHB_ERR ||
                                                   ^
   drivers/usb/dwc2/hcd_ddma.c:991:13: note: 'halt_status' is equal to DWC2=
_HC_XFER_AHB_ERR
                   int err =3D halt_status =3D=3D DWC2_HC_XFER_AHB_ERR ?
                             ^~~~~~~~~~~
   drivers/usb/dwc2/hcd_ddma.c:991:13: note: '?' condition is true
   drivers/usb/dwc2/hcd_ddma.c:994:3: note: Loop condition is true.  Enteri=
ng loop body
                   list_for_each_entry_safe(qtd, qtd_tmp, &qh->qtd_list,
                   ^
   include/linux/list.h:717:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   drivers/usb/dwc2/hcd_ddma.c:996:8: note: Assuming field 'urb' is null
                           if (qtd->urb) {
                               ^~~~~~~~
   drivers/usb/dwc2/hcd_ddma.c:996:4: note: Taking false branch
                           if (qtd->urb) {
                           ^
   drivers/usb/dwc2/hcd_ddma.c:1006:4: note: Calling 'dwc2_hcd_qtd_unlink_a=
nd_free'
                           dwc2_hcd_qtd_unlink_and_free(hsotg, qtd, qh);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc2/hcd.h:584:2: note: Memory is released
           kfree(qtd);
           ^~~~~~~~~~
   drivers/usb/dwc2/hcd_ddma.c:1006:4: note: Returning; memory was released
                           dwc2_hcd_qtd_unlink_and_free(hsotg, qtd, qh);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc2/hcd_ddma.c:994:3: note: Loop condition is false. Execut=
ion continues on line 1009
                   list_for_each_entry_safe(qtd, qtd_tmp, &qh->qtd_list,
                   ^
   include/linux/list.h:717:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   drivers/usb/dwc2/hcd_ddma.c:1308:3: note: Returning; memory was released
                   dwc2_complete_isoc_xfer_ddma(hsotg, chan, halt_status);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc2/hcd_ddma.c:1311:7: note: 'halt_status' is not equal to =
DWC2_HC_XFER_COMPLETE
                   if (halt_status !=3D DWC2_HC_XFER_COMPLETE ||
                       ^~~~~~~~~~~
   drivers/usb/dwc2/hcd_ddma.c:1311:44: note: Left side of '||' is true
                   if (halt_status !=3D DWC2_HC_XFER_COMPLETE ||
                                                            ^
   drivers/usb/dwc2/hcd_ddma.c:1319:4: note: Use of memory after it is freed
                           list_for_each_entry_safe(qtd, qtd_tmp,
                           ^
   include/linux/list.h:718:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:557:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:513:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/hwmon/stts751.c:685:3: warning: Value stored to 'name' is never =
read [clang-analyzer-deadcode.DeadStores]
                   name =3D "STTS751-0";
                   ^      ~~~~~~~~~~~
   drivers/hwmon/stts751.c:685:3: note: Value stored to 'name' is never read
                   name =3D "STTS751-0";
                   ^      ~~~~~~~~~~~
   drivers/hwmon/stts751.c:688:3: warning: Value stored to 'name' is never =
read [clang-analyzer-deadcode.DeadStores]
                   name =3D "STTS751-1";
                   ^      ~~~~~~~~~~~
   drivers/hwmon/stts751.c:688:3: note: Value stored to 'name' is never read
                   name =3D "STTS751-1";
                   ^      ~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> net/tls/af_tlsh.c:314:11: warning: Although the value stored to 'newsk' =
is used in the enclosing expression, the value is never actually read from =
'newsk' [clang-analyzer-deadcode.DeadStores]
           while (!(newsk =3D tlsh_accept_dequeue(sk, newsock))) {
                    ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/tls/af_tlsh.c:314:11: note: Although the value stored to 'newsk' is =
used in the enclosing expression, the value is never actually read from 'ne=
wsk'
           while (!(newsk =3D tlsh_accept_dequeue(sk, newsock))) {
                    ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   net/tls/tls_sw.c:407:2: warning: Use of memory after it is freed [clang-=
analyzer-unix.Malloc]
           list_for_each_entry_safe(rec, tmp, &ctx->tx_list, list) {
           ^
   include/linux/list.h:718:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^
   include/linux/list.h:557:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^
   include/linux/list.h:513:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^
   net/tls/tls_sw.c:2288:15: note: Assuming 'tls_ctx' is non-null
           if (unlikely(!tls_ctx))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/tls/tls_sw.c:2288:2: note: Taking false branch
           if (unlikely(!tls_ctx))
           ^
   net/tls/tls_sw.c:2292:6: note: Assuming the condition is false
           if (test_bit(BIT_TX_CLOSING, &ctx->tx_bitmask))
               ^
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   net/tls/tls_sw.c:2292:2: note: Taking false branch
           if (test_bit(BIT_TX_CLOSING, &ctx->tx_bitmask))
           ^
   net/tls/tls_sw.c:2295:6: note: Assuming the condition is false
           if (!test_and_clear_bit(BIT_TX_SCHEDULED, &ctx->tx_bitmask))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/tls/tls_sw.c:2295:2: note: Taking false branch
           if (!test_and_clear_bit(BIT_TX_SCHEDULED, &ctx->tx_bitmask))
           ^
   net/tls/tls_sw.c:2299:2: note: Calling 'tls_tx_records'
           tls_tx_records(sk, -1);
           ^~~~~~~~~~~~~~~~~~~~~~
   net/tls/tls_sw.c:385:2: note: Taking true branch
           if (tls_is_partially_sent_record(tls_ctx)) {
           ^
   net/tls/tls_sw.c:389:3: note: Taking true branch
                   if (flags =3D=3D -1)
                   ^
   net/tls/tls_sw.c:395:7: note: Assuming 'rc' is 0
                   if (rc)
                       ^~
   net/tls/tls_sw.c:395:3: note: Taking false branch
                   if (rc)
                   ^
   net/tls/tls_sw.c:403:3: note: Memory is released
                   kfree(rec);
                   ^~~~~~~~~~
   net/tls/tls_sw.c:407:2: note: Use of memory after it is freed
           list_for_each_entry_safe(rec, tmp, &ctx->tx_list, list) {
           ^
   include/linux/list.h:718:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:557:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:513:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   net/tls/tls_sw.c:1963:5: warning: Value stored to 'decrypted' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                                   decrypted =3D 0;
                                   ^           ~
   net/tls/tls_sw.c:1963:5: note: Value stored to 'decrypted' is never read
                                   decrypted =3D 0;
                                   ^           ~
   net/tls/tls_sw.c:2212:2: warning: Use of memory after it is freed [clang=
-analyzer-unix.Malloc]
           list_for_each_entry_safe(rec, tmp, &ctx->tx_list, list) {
           ^
   include/linux/list.h:718:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:557:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:513:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)

vim +314 net/tls/af_tlsh.c

c6ec67d41918e8 Chuck Lever 2021-11-19  283  =

c6ec67d41918e8 Chuck Lever 2021-11-19  284  /**
c6ec67d41918e8 Chuck Lever 2021-11-19  285   * tlsh_accept - return a conne=
ction waiting for a TLS handshake
c6ec67d41918e8 Chuck Lever 2021-11-19  286   * @sock: listener socket which=
 connection requests arrive on
c6ec67d41918e8 Chuck Lever 2021-11-19  287   * @newsock: socket to move inc=
oming connection to
c6ec67d41918e8 Chuck Lever 2021-11-19  288   * @flags: SOCK_NONBLOCK and/or=
 SOCK_CLOEXEC
c6ec67d41918e8 Chuck Lever 2021-11-19  289   * @kern: 'true' for kernel-int=
ernal sockets (ignored)
c6ec67d41918e8 Chuck Lever 2021-11-19  290   *
c6ec67d41918e8 Chuck Lever 2021-11-19  291   * Return values:
c6ec67d41918e8 Chuck Lever 2021-11-19  292   *   %0: @newsock has been init=
ialized.
c6ec67d41918e8 Chuck Lever 2021-11-19  293   *   %-EPERM: caller is not pri=
vileged
c6ec67d41918e8 Chuck Lever 2021-11-19  294   */
c6ec67d41918e8 Chuck Lever 2021-11-19  295  static int tlsh_accept(struct s=
ocket *sock, struct socket *newsock, int flags,
c6ec67d41918e8 Chuck Lever 2021-11-19  296  		       bool kern)
c6ec67d41918e8 Chuck Lever 2021-11-19  297  {
c6ec67d41918e8 Chuck Lever 2021-11-19  298  	struct sock *sk =3D sock->sk, =
*newsk;
c6ec67d41918e8 Chuck Lever 2021-11-19  299  	DECLARE_WAITQUEUE(wait, curren=
t);
c6ec67d41918e8 Chuck Lever 2021-11-19  300  	long timeo;
c6ec67d41918e8 Chuck Lever 2021-11-19  301  	int rc;
c6ec67d41918e8 Chuck Lever 2021-11-19  302  =

c6ec67d41918e8 Chuck Lever 2021-11-19  303  	if (!capable(CAP_NET_BIND_SERV=
ICE))
c6ec67d41918e8 Chuck Lever 2021-11-19  304  		return -EPERM;
c6ec67d41918e8 Chuck Lever 2021-11-19  305  =

c6ec67d41918e8 Chuck Lever 2021-11-19  306  	lock_sock(sk);
c6ec67d41918e8 Chuck Lever 2021-11-19  307  	rc =3D -EBADF;
c6ec67d41918e8 Chuck Lever 2021-11-19  308  	if (sk->sk_state !=3D TCP_LIST=
EN)
c6ec67d41918e8 Chuck Lever 2021-11-19  309  		goto out;
c6ec67d41918e8 Chuck Lever 2021-11-19  310  =

c6ec67d41918e8 Chuck Lever 2021-11-19  311  	timeo =3D sock_rcvtimeo(sk, fl=
ags & O_NONBLOCK);
c6ec67d41918e8 Chuck Lever 2021-11-19  312  =

c6ec67d41918e8 Chuck Lever 2021-11-19  313  	add_wait_queue_exclusive(sk_sl=
eep(sk), &wait);
c6ec67d41918e8 Chuck Lever 2021-11-19 @314  	while (!(newsk =3D tlsh_accept=
_dequeue(sk, newsock))) {
c6ec67d41918e8 Chuck Lever 2021-11-19  315  		set_current_state(TASK_INTERR=
UPTIBLE);
c6ec67d41918e8 Chuck Lever 2021-11-19  316  		if (!timeo) {
c6ec67d41918e8 Chuck Lever 2021-11-19  317  			rc =3D -EAGAIN;
c6ec67d41918e8 Chuck Lever 2021-11-19  318  			break;
c6ec67d41918e8 Chuck Lever 2021-11-19  319  		}
c6ec67d41918e8 Chuck Lever 2021-11-19  320  =

c6ec67d41918e8 Chuck Lever 2021-11-19  321  		release_sock(sk);
c6ec67d41918e8 Chuck Lever 2021-11-19  322  		timeo =3D schedule_timeout(ti=
meo);
c6ec67d41918e8 Chuck Lever 2021-11-19  323  		lock_sock(sk);
c6ec67d41918e8 Chuck Lever 2021-11-19  324  =

c6ec67d41918e8 Chuck Lever 2021-11-19  325  		if (sk->sk_state !=3D TCP_LIS=
TEN) {
c6ec67d41918e8 Chuck Lever 2021-11-19  326  			rc =3D -EBADF;
c6ec67d41918e8 Chuck Lever 2021-11-19  327  			break;
c6ec67d41918e8 Chuck Lever 2021-11-19  328  		}
c6ec67d41918e8 Chuck Lever 2021-11-19  329  =

c6ec67d41918e8 Chuck Lever 2021-11-19  330  		if (signal_pending(current)) {
c6ec67d41918e8 Chuck Lever 2021-11-19  331  			rc =3D sock_intr_errno(timeo=
);
c6ec67d41918e8 Chuck Lever 2021-11-19  332  			break;
c6ec67d41918e8 Chuck Lever 2021-11-19  333  		}
c6ec67d41918e8 Chuck Lever 2021-11-19  334  	}
c6ec67d41918e8 Chuck Lever 2021-11-19  335  	set_current_state(TASK_RUNNING=
);
c6ec67d41918e8 Chuck Lever 2021-11-19  336  	remove_wait_queue(sk_sleep(sk)=
, &wait);
c6ec67d41918e8 Chuck Lever 2021-11-19  337  	if (rc)
c6ec67d41918e8 Chuck Lever 2021-11-19  338  		goto out;
c6ec67d41918e8 Chuck Lever 2021-11-19  339  =

c6ec67d41918e8 Chuck Lever 2021-11-19  340  	sk->sk_state =3D TCP_LISTEN;
c6ec67d41918e8 Chuck Lever 2021-11-19  341  	sk_acceptq_removed(sk);
c6ec67d41918e8 Chuck Lever 2021-11-19  342  out:
c6ec67d41918e8 Chuck Lever 2021-11-19  343  	release_sock(sk);
c6ec67d41918e8 Chuck Lever 2021-11-19  344  	return rc;
c6ec67d41918e8 Chuck Lever 2021-11-19  345  }
c6ec67d41918e8 Chuck Lever 2021-11-19  346  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8649496832829342157==--

