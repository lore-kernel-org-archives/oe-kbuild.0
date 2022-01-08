Content-Type: multipart/mixed; boundary="===============5066120597604617261=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1036/11475] fs/dlm/lowcomms.c:607:2: warning: Value stored to 'inet' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 08 Jan 2022 14:49:08 +0800
Message-ID: <202201081440.CY1jZS8M-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5066120597604617261==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Alexander Aring <aahringo@redhat.com>
CC: David Teigland <teigland@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   b8170452cd5121b11a5726e3ea8dbdfc2d74e771
commit: 4c3d90570bcc2b338f70f61f01110268e281ca3c [1036/11475] fs: dlm: don'=
t call kernel_getpeername() in error_report()
:::::: branch date: 15 hours ago
:::::: commit date: 8 weeks ago
config: riscv-randconfig-c006-20220102 (https://download.01.org/0day-ci/arc=
hive/20220108/202201081440.CY1jZS8M-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 104a82=
7ea6de0cbe0f5faef4407552ede31d165c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D4c3d90570bcc2b338f70f61f01110268e281ca3c
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 4c3d90570bcc2b338f70f61f01110268e281ca3c
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:730:18: note: Division=
 by zero
                                           numpkt * HZ / (jiffies - lastj),
                                                       ^
   drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:68:22: note: expanded =
from macro 'dprintk'
                          __func__, ##arg);                                \
                                      ^~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/hid/hid-kye.c:684:6: warning: Access to field 'maxfield' results=
 in a dereference of an undefined pointer value (loaded from variable 'repo=
rt') [clang-analyzer-core.NullDereference]
           if (report->maxfield < 1 || report->field[0]->report_count < 7) {
               ^
   drivers/hid/hid-kye.c:708:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/hid/hid-kye.c:708:2: note: Taking false branch
           if (ret) {
           ^
   drivers/hid/hid-kye.c:714:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/hid/hid-kye.c:714:2: note: Taking false branch
           if (ret) {
           ^
   drivers/hid/hid-kye.c:719:2: note: Control jumps to 'case 20501:' @li=
ne 725
           switch (id->product) {
           ^
   drivers/hid/hid-kye.c:726:9: note: Calling 'kye_tablet_enable'
                   ret =3D kye_tablet_enable(hdev);
                         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-kye.c:669:2: note: 'report' declared without an initial =
value
           struct hid_report *report;
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-kye.c:673:2: note: Loop condition is false. Execution co=
ntinues on line 679
           list_for_each(head, list) {
           ^
   include/linux/list.h:571:2: note: expanded from macro 'list_for_each'
           for (pos =3D (head)->next; pos !=3D (head); pos =3D pos->next)
           ^
   drivers/hid/hid-kye.c:679:6: note: Assuming 'head' is not equal to 'list'
           if (head =3D=3D list) {
               ^~~~~~~~~~~~
   drivers/hid/hid-kye.c:679:2: note: Taking false branch
           if (head =3D=3D list) {
           ^
   drivers/hid/hid-kye.c:684:6: note: Access to field 'maxfield' results in=
 a dereference of an undefined pointer value (loaded from variable 'report')
           if (report->maxfield < 1 || report->field[0]->report_count < 7) {
               ^~~~~~
   Suppressed 2 warnings (2 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   4 warnings generated.
>> fs/dlm/lowcomms.c:607:2: warning: Value stored to 'inet' is never read [=
clang-analyzer-deadcode.DeadStores]
           inet =3D inet_sk(sk);
           ^      ~~~~~~~~~~~
   fs/dlm/lowcomms.c:607:2: note: Value stored to 'inet' is never read
           inet =3D inet_sk(sk);
           ^      ~~~~~~~~~~~
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
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
   drivers/thermal/thermal_hwmon.c:96:3: warning: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(type, tz->type);
                   ^~~~~~
   drivers/thermal/thermal_hwmon.c:96:3: note: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119
                   strcpy(type, tz->type);
                   ^~~~~~
   Suppressed 2 warnings (2 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/w1/slaves/w1_ds2438.c:69:3: warning: Value stored to 'crc' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   crc =3D 0;
                   ^     ~
   drivers/w1/slaves/w1_ds2438.c:69:3: note: Value stored to 'crc' is never=
 read
                   crc =3D 0;
                   ^     ~
   Suppressed 2 warnings (2 in non-user code).
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   include/linux/log2.h:57:13: warning: The result of the left shift is und=
efined due to shifting by '32', which is greater or equal to the width of t=
ype 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1UL << fls_long(n - 1);
                      ^
   drivers/infiniband/sw/rxe/rxe_qp.c:594:6: note: Assuming the condition i=
s true
           if (mask & IB_QP_MAX_QP_RD_ATOMIC) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/sw/rxe/rxe_qp.c:594:2: note: Taking true branch
           if (mask & IB_QP_MAX_QP_RD_ATOMIC) {
           ^
   drivers/infiniband/sw/rxe/rxe_qp.c:595:23: note: Assuming field 'max_rd_=
atomic' is not equal to 0
                   int max_rd_atomic =3D attr->max_rd_atomic ?
                                       ^~~~~~~~~~~~~~~~~~~
   drivers/infiniband/sw/rxe/rxe_qp.c:595:23: note: '?' condition is true
   drivers/infiniband/sw/rxe/rxe_qp.c:596:4: note: '?' condition is false
                           roundup_pow_of_two(attr->max_rd_atomic) : 0;
                           ^
   include/linux/log2.h:176:2: note: expanded from macro 'roundup_pow_of_tw=
o'
           __builtin_constant_p(n) ? (             \
           ^
   drivers/infiniband/sw/rxe/rxe_qp.c:596:4: note: Calling '__roundup_pow_o=
f_two'

vim +/inet +607 fs/dlm/lowcomms.c

e125fbeb538e5e Alexander Aring 2021-03-01  593  =

b3a5bbfd780d9e Bob Peterson    2015-08-27  594  static void lowcomms_error_=
report(struct sock *sk)
b3a5bbfd780d9e Bob Peterson    2015-08-27  595  {
b81171cb686911 Bob Peterson    2016-02-05  596  	struct connection *con;
b81171cb686911 Bob Peterson    2016-02-05  597  	void (*orig_report)(struct=
 sock *) =3D NULL;
4c3d90570bcc2b Alexander Aring 2021-11-15  598  	struct inet_sock *inet;
b3a5bbfd780d9e Bob Peterson    2015-08-27  599  =

b81171cb686911 Bob Peterson    2016-02-05  600  	read_lock_bh(&sk->sk_callb=
ack_lock);
b81171cb686911 Bob Peterson    2016-02-05  601  	con =3D sock2con(sk);
b81171cb686911 Bob Peterson    2016-02-05  602  	if (con =3D=3D NULL)
b81171cb686911 Bob Peterson    2016-02-05  603  		goto out;
b81171cb686911 Bob Peterson    2016-02-05  604  =

cc661fc934a004 Bob Peterson    2017-09-12  605  	orig_report =3D listen_soc=
k.sk_error_report;
b3a5bbfd780d9e Bob Peterson    2015-08-27  606  =

4c3d90570bcc2b Alexander Aring 2021-11-15 @607  	inet =3D inet_sk(sk);
4c3d90570bcc2b Alexander Aring 2021-11-15  608  	switch (sk->sk_family) {
4c3d90570bcc2b Alexander Aring 2021-11-15  609  	case AF_INET:
b3a5bbfd780d9e Bob Peterson    2015-08-27  610  		printk_ratelimited(KERN_E=
RR "dlm: node %d: socket error "
4c3d90570bcc2b Alexander Aring 2021-11-15  611  				   "sending to node %d =
at %pI4, dport %d, "
b3a5bbfd780d9e Bob Peterson    2015-08-27  612  				   "sk_err=3D%d/%d\n", =
dlm_our_nodeid(),
4c3d90570bcc2b Alexander Aring 2021-11-15  613  				   con->nodeid, &inet->=
inet_daddr,
4c3d90570bcc2b Alexander Aring 2021-11-15  614  				   ntohs(inet->inet_dpo=
rt), sk->sk_err,
b3a5bbfd780d9e Bob Peterson    2015-08-27  615  				   sk->sk_err_soft);
4c3d90570bcc2b Alexander Aring 2021-11-15  616  		break;
4c3d90570bcc2b Alexander Aring 2021-11-15  617  	case AF_INET6:
b3a5bbfd780d9e Bob Peterson    2015-08-27  618  		printk_ratelimited(KERN_E=
RR "dlm: node %d: socket error "
4c3d90570bcc2b Alexander Aring 2021-11-15  619  				   "sending to node %d =
at %pI6c, "
4c3d90570bcc2b Alexander Aring 2021-11-15  620  				   "dport %d, sk_err=3D=
%d/%d\n", dlm_our_nodeid(),
4c3d90570bcc2b Alexander Aring 2021-11-15  621  				   con->nodeid, &sk->sk=
_v6_daddr,
4c3d90570bcc2b Alexander Aring 2021-11-15  622  				   ntohs(inet->inet_dpo=
rt), sk->sk_err,
b3a5bbfd780d9e Bob Peterson    2015-08-27  623  				   sk->sk_err_soft);
4c3d90570bcc2b Alexander Aring 2021-11-15  624  		break;
4c3d90570bcc2b Alexander Aring 2021-11-15  625  	default:
4c3d90570bcc2b Alexander Aring 2021-11-15  626  		printk_ratelimited(KERN_E=
RR "dlm: node %d: socket error "
4c3d90570bcc2b Alexander Aring 2021-11-15  627  				   "invalid socket fami=
ly %d set, "
4c3d90570bcc2b Alexander Aring 2021-11-15  628  				   "sk_err=3D%d/%d\n", =
dlm_our_nodeid(),
4c3d90570bcc2b Alexander Aring 2021-11-15  629  				   sk->sk_family, sk->s=
k_err, sk->sk_err_soft);
4c3d90570bcc2b Alexander Aring 2021-11-15  630  		goto out;
b3a5bbfd780d9e Bob Peterson    2015-08-27  631  	}
ba868d9deaab2b Alexander Aring 2021-05-21  632  =

ba868d9deaab2b Alexander Aring 2021-05-21  633  	/* below sendcon only hand=
ling */
ba868d9deaab2b Alexander Aring 2021-05-21  634  	if (test_bit(CF_IS_OTHERCO=
N, &con->flags))
ba868d9deaab2b Alexander Aring 2021-05-21  635  		con =3D con->sendcon;
ba868d9deaab2b Alexander Aring 2021-05-21  636  =

ba868d9deaab2b Alexander Aring 2021-05-21  637  	switch (sk->sk_err) {
ba868d9deaab2b Alexander Aring 2021-05-21  638  	case ECONNREFUSED:
ba868d9deaab2b Alexander Aring 2021-05-21  639  		set_bit(CF_DELAY_CONNECT,=
 &con->flags);
ba868d9deaab2b Alexander Aring 2021-05-21  640  		break;
ba868d9deaab2b Alexander Aring 2021-05-21  641  	default:
ba868d9deaab2b Alexander Aring 2021-05-21  642  		break;
ba868d9deaab2b Alexander Aring 2021-05-21  643  	}
ba868d9deaab2b Alexander Aring 2021-05-21  644  =

ba868d9deaab2b Alexander Aring 2021-05-21  645  	if (!test_and_set_bit(CF_R=
ECONNECT, &con->flags))
ba868d9deaab2b Alexander Aring 2021-05-21  646  		queue_work(send_workqueue=
, &con->swork);
ba868d9deaab2b Alexander Aring 2021-05-21  647  =

b81171cb686911 Bob Peterson    2016-02-05  648  out:
b81171cb686911 Bob Peterson    2016-02-05  649  	read_unlock_bh(&sk->sk_cal=
lback_lock);
b81171cb686911 Bob Peterson    2016-02-05  650  	if (orig_report)
b81171cb686911 Bob Peterson    2016-02-05  651  		orig_report(sk);
b81171cb686911 Bob Peterson    2016-02-05  652  }
b81171cb686911 Bob Peterson    2016-02-05  653  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5066120597604617261==--

