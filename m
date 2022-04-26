Content-Type: multipart/mixed; boundary="===============3147201312062770661=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/smc/af_smc.c:1510:27: warning: Uninitialized variables: isk.sk, isk.clcsock, isk.clcsk_state_change, isk.clcsk_data_ready, isk.clcsk_write_space, isk.clcsk_error_report, isk.conn, isk.listen_smc, isk.connect_work, isk.tcp_listen_work, isk.smc_listen_w...
Date: Wed, 27 Apr 2022 02:35:52 +0800
Message-ID: <202204270232.UUVQksHt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3147201312062770661==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Wen Gu <guwen@linux.alibaba.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d615b5416f8a1afeb82d13b238f8152c572d59c0
commit: 341adeec9adad0874f29a0a1af35638207352a39 net/smc: Forward wakeup to=
 smc socket waitqueue after fallback
date:   3 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 3 months ago
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 341adeec9adad0874f29a0a1af35638207352a39
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   net/smc/af_smc.c:1770:54: warning: Parameter 'smcd' can be declared with=
 const [constParameter]
   static bool smc_is_already_selected(struct smcd_dev *smcd,
                                                        ^
>> net/smc/af_smc.c:1510:27: warning: Uninitialized variables: isk.sk, isk.=
clcsock, isk.clcsk_state_change, isk.clcsk_data_ready, isk.clcsk_write_spac=
e, isk.clcsk_error_report, isk.conn, isk.listen_smc, isk.connect_work, isk.=
tcp_listen_work, isk.smc_listen_work, isk.accept_q, isk.accept_q_lock, isk.=
use_fallback, isk.fallback_rsn, isk.peer_diagnosis, isk.sockopt_defer_accep=
t, isk.wait_close_tx_prepared, isk.connect_nonblock, isk.clcsock_release_lo=
ck [uninitvar]
     new_sk =3D (struct sock *)isk;
                             ^

vim +1510 net/smc/af_smc.c

a046d57da19f81 Ursula Braun 2017-01-09  1499  =

a046d57da19f81 Ursula Braun 2017-01-09  1500  /* remove a sock from the acc=
ept queue to bind it to a new socket created
a046d57da19f81 Ursula Braun 2017-01-09  1501   * for a socket accept call f=
rom user space
a046d57da19f81 Ursula Braun 2017-01-09  1502   */
b38d732477e421 Ursula Braun 2017-01-09  1503  struct sock *smc_accept_deque=
ue(struct sock *parent,
a046d57da19f81 Ursula Braun 2017-01-09  1504  				struct socket *new_sock)
a046d57da19f81 Ursula Braun 2017-01-09  1505  {
a046d57da19f81 Ursula Braun 2017-01-09  1506  	struct smc_sock *isk, *n;
a046d57da19f81 Ursula Braun 2017-01-09  1507  	struct sock *new_sk;
a046d57da19f81 Ursula Braun 2017-01-09  1508  =

a046d57da19f81 Ursula Braun 2017-01-09  1509  	list_for_each_entry_safe(isk=
, n, &smc_sk(parent)->accept_q, accept_q) {
a046d57da19f81 Ursula Braun 2017-01-09 @1510  		new_sk =3D (struct sock *)i=
sk;
a046d57da19f81 Ursula Braun 2017-01-09  1511  =

a046d57da19f81 Ursula Braun 2017-01-09  1512  		smc_accept_unlink(new_sk);
a046d57da19f81 Ursula Braun 2017-01-09  1513  		if (new_sk->sk_state =3D=3D=
 SMC_CLOSED) {
f61bca58f6c36e Ursula Braun 2019-04-11  1514  			new_sk->sk_prot->unhash(ne=
w_sk);
127f497058236e Ursula Braun 2018-01-26  1515  			if (isk->clcsock) {
127f497058236e Ursula Braun 2018-01-26  1516  				sock_release(isk->clcsock=
);
127f497058236e Ursula Braun 2018-01-26  1517  				isk->clcsock =3D NULL;
127f497058236e Ursula Braun 2018-01-26  1518  			}
51f1de79ad8ed3 Ursula Braun 2018-01-26  1519  			sock_put(new_sk); /* final=
 */
a046d57da19f81 Ursula Braun 2017-01-09  1520  			continue;
a046d57da19f81 Ursula Braun 2017-01-09  1521  		}
07603b230895a7 Ursula Braun 2019-04-11  1522  		if (new_sock) {
a046d57da19f81 Ursula Braun 2017-01-09  1523  			sock_graft(new_sk, new_soc=
k);
07603b230895a7 Ursula Braun 2019-04-11  1524  			if (isk->use_fallback) {
07603b230895a7 Ursula Braun 2019-04-11  1525  				smc_sk(new_sk)->clcsock->=
file =3D new_sock->file;
07603b230895a7 Ursula Braun 2019-04-11  1526  				isk->clcsock->file->priva=
te_data =3D isk->clcsock;
07603b230895a7 Ursula Braun 2019-04-11  1527  			}
07603b230895a7 Ursula Braun 2019-04-11  1528  		}
a046d57da19f81 Ursula Braun 2017-01-09  1529  		return new_sk;
a046d57da19f81 Ursula Braun 2017-01-09  1530  	}
a046d57da19f81 Ursula Braun 2017-01-09  1531  	return NULL;
a046d57da19f81 Ursula Braun 2017-01-09  1532  }
a046d57da19f81 Ursula Braun 2017-01-09  1533  =


:::::: The code at line 1510 was first introduced by commit
:::::: a046d57da19f812216f393e7c535f5858f793ac3 smc: CLC handshake (incl. p=
reparation steps)

:::::: TO: Ursula Braun <ubraun@linux.vnet.ibm.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3147201312062770661==--

