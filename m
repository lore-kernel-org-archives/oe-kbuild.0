Content-Type: multipart/mixed; boundary="===============3441338876189800899=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [net-next:master 8/18] net/mptcp/pm_userspace.c:322:32: warning: Uninitialized variables: subflow.node, subflow.local_key, subflow.remote_key, subflow.idsn, subflow.map_seq, subflow.snd_isn, subflow.token, subflow.rel_write_seq, subflow.map_subflow_seq, subflow.ssn_offset, subf...
Date: Thu, 05 May 2022 18:37:11 +0800
Message-ID: <202205051821.ES4LkrFL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3441338876189800899==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: netdev(a)vger.kernel.org
TO: Florian Westphal <fw@strlen.de>
CC: Kishen Maloor <kishen.maloor@intel.com>
CC: Mat Martineau <mathew.j.martineau@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
master
head:   4950b6990e3b1efae64a5f6fc5738d25e3b816b3
commit: 702c2f646d42cfd9e31133d68a8283fea48fd810 [8/18] mptcp: netlink: all=
ow userspace-driven subflow establishment
:::::: branch date: 7 hours ago
:::::: commit date: 25 hours ago
compiler: aarch64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 702c2f646d42cfd9e31133d68a8283fea48fd810
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from net/mptcp/pm_userspace.c:
   net/mptcp/pm_userspace.c:106:33: warning: Parameter 'skc' can be declare=
d with const [constParameter]
           struct mptcp_addr_info *skc)
                                   ^
   net/mptcp/protocol.h:658:7: warning: Uninitialized variables: tmp.node, =
tmp.local_key, tmp.remote_key, tmp.idsn, tmp.map_seq, tmp.snd_isn, tmp.toke=
n, tmp.rel_write_seq, tmp.map_subflow_seq, tmp.ssn_offset, tmp.map_data_len=
, tmp.map_data_csum, tmp.map_csum_len, tmp.request_mptcp, tmp.request_join,=
 tmp.request_bkup, tmp.mp_capable, tmp.mp_join, tmp.fully_established, tmp.=
pm_notified, tmp.conn_finished, tmp.map_valid, tmp.map_csum_reqd, tmp.map_d=
ata_fin, tmp.mpc_map, tmp.backup, tmp.send_mp_prio, tmp.send_mp_fail, tmp.s=
end_fastclose, tmp.send_infinite_map, tmp.rx_eof, tmp.can_ack, tmp.disposab=
le, tmp.stale, tmp.local_id_valid, tmp.data_avail, tmp.mp_fail_response_exp=
ect, tmp.remote_nonce, tmp.thmac, tmp.local_nonce, tmp.remote_token, tmp.lo=
cal_id, tmp.remote_id, tmp.reset_seen, tmp.reset_transient, tmp.reset_reaso=
n, tmp.stale_count, tmp.delegated_status, tmp.delegated_node, tmp.setsockop=
t_seq, tmp.stale_rcv_tstamp, tmp.tcp_sock, tmp.conn, tmp.icsk_af_ops, tmp.t=
cp_state_change, tmp.tcp_error_report, tmp.rcu [uninitvar]
     if (tmp !=3D subflow)
         ^
   net/mptcp/pm_userspace.c:47:12: warning: Uninitialized variables: e.list=
, e.flags, e.ifindex, e.lsk [uninitvar]
      match =3D e;
              ^
   net/mptcp/pm_userspace.c:91:20: warning: Uninitialized variable: entry->=
addr [uninitvar]
     if (id =3D=3D entry->addr.id) {
                      ^
>> net/mptcp/pm_userspace.c:322:32: warning: Uninitialized variables: subfl=
ow.node, subflow.local_key, subflow.remote_key, subflow.idsn, subflow.map_s=
eq, subflow.snd_isn, subflow.token, subflow.rel_write_seq, subflow.map_subf=
low_seq, subflow.ssn_offset, subflow.map_data_len, subflow.map_data_csum, s=
ubflow.map_csum_len, subflow.request_mptcp, subflow.request_join, subflow.r=
equest_bkup, subflow.mp_capable, subflow.mp_join, subflow.fully_established=
, subflow.pm_notified, subflow.conn_finished, subflow.map_valid, subflow.ma=
p_csum_reqd, subflow.map_data_fin, subflow.mpc_map, subflow.backup, subflow=
.send_mp_prio, subflow.send_mp_fail, subflow.send_fastclose, subflow.send_i=
nfinite_map, subflow.rx_eof, subflow.can_ack, subflow.disposable, subflow.s=
tale, subflow.local_id_valid, subflow.data_avail, subflow.mp_fail_response_=
expect, subflow.remote_nonce, subflow.thmac, subflow.local_nonce, subflow.r=
emote_token, subflow.local_id, subflow.remote_id, subflow.reset_seen, subfl=
ow.reset_transient, subflow.reset_reason, subflow.stale_count, subflow.dele=
gated_status, subflow.delegated_node, subflow.setsockopt_seq, subflow.stale=
_rcv_tstamp, subflow.tcp_sock, subflow.conn, subflow.icsk_af_ops, subflow.t=
cp_state_change, subflow.tcp_error_report, subflow.rcu [uninitvar]
     ssk =3D mptcp_subflow_tcp_sock(subflow);
                                  ^
   net/mptcp/pm_userspace.c:313:20: note: Assuming condition is false
    if (local->family !=3D remote->family)
                      ^
   net/mptcp/pm_userspace.c:313:20: note: Assuming condition is false
    if (local->family !=3D remote->family)
                      ^
   net/mptcp/pm_userspace.c:313:20: note: Assuming condition is false
    if (local->family !=3D remote->family)
                      ^
   net/mptcp/pm_userspace.c:313:20: note: Assuming condition is false
    if (local->family !=3D remote->family)
                      ^
   net/mptcp/pm_userspace.c:313:20: note: Assuming condition is false
    if (local->family !=3D remote->family)
                      ^
   net/mptcp/pm_userspace.c:313:20: note: Assuming condition is false
    if (local->family !=3D remote->family)
                      ^
   net/mptcp/pm_userspace.c:313:20: note: Assuming condition is false
    if (local->family !=3D remote->family)
                      ^
   net/mptcp/pm_userspace.c:313:20: note: Assuming condition is false
    if (local->family !=3D remote->family)
                      ^
   net/mptcp/pm_userspace.c:313:20: note: Assuming condition is false
    if (local->family !=3D remote->family)
                      ^
   net/mptcp/pm_userspace.c:313:20: note: Assuming condition is false
    if (local->family !=3D remote->family)
                      ^
   net/mptcp/pm_userspace.c:313:20: note: Assuming condition is false
    if (local->family !=3D remote->family)
                      ^
   net/mptcp/pm_userspace.c:313:20: note: Assuming condition is false
    if (local->family !=3D remote->family)
                      ^
   net/mptcp/pm_userspace.c:313:20: note: Assuming condition is false
    if (local->family !=3D remote->family)
                      ^
   net/mptcp/pm_userspace.c:313:20: note: Assuming condition is false
    if (local->family !=3D remote->family)
                      ^
   net/mptcp/pm_userspace.c:313:20: note: Assuming condition is false
    if (local->family !=3D remote->family)
                      ^
   net/mptcp/pm_userspace.c:313:20: note: Assuming condition is false
    if (local->family !=3D remote->family)
                      ^
   net/mptcp/pm_userspace.c:313:20: note: Assuming condition is false
    if (local->family !=3D remote->family)
                      ^
   net/mptcp/pm_userspace.c:313:20: note: Assuming condition is false
    if (local->family !=3D remote->family)
                      ^
   net/mptcp/pm_userspace.c:313:20: note: Assuming condition is false
    if (local->family !=3D remote->family)
                      ^
   net/mptcp/pm_userspace.c:313:20: note: Assuming condition is false
    if (local->family !=3D remote->family)
                      ^
   net/mptcp/pm_userspace.c:313:20: note: Assuming condition is false
    if (local->family !=3D remote->family)
                      ^
   net/mptcp/pm_userspace.c:313:20: note: Assuming condition is false
    if (local->family !=3D remote->family)
                      ^
   net/mptcp/pm_userspace.c:313:20: note: Assuming condition is false
    if (local->family !=3D remote->family)
                      ^
   net/mptcp/pm_userspace.c:313:20: note: Assuming condition is false
    if (local->family !=3D remote->family)
                      ^
   net/mptcp/pm_userspace.c:313:20: note: Assuming condition is false
    if (local->family !=3D remote->family)
                      ^
   net/mptcp/pm_userspace.c:313:20: note: Assuming condition is false
    if (local->family !=3D remote->family)
                      ^
   net/mptcp/pm_userspace.c:313:20: note: Assuming condition is false
    if (local->family !=3D remote->family)
                      ^
   net/mptcp/pm_userspace.c:313:20: note: Assuming condition is false
    if (local->family !=3D remote->family)
                      ^
   net/mptcp/pm_userspace.c:313:20: note: Assuming condition is false
    if (local->family !=3D remote->family)
                      ^
   net/mptcp/pm_userspace.c:313:20: note: Assuming condition is false
    if (local->family !=3D remote->family)
                      ^
   net/mptcp/pm_userspace.c:313:20: note: Assuming condition is false
    if (local->family !=3D remote->family)
                      ^
   net/mptcp/pm_userspace.c:313:20: note: Assuming condition is false
    if (local->family !=3D remote->family)
                      ^
   net/mptcp/pm_userspace.c:313:20: note: Assuming condition is false
    if (local->family !=3D remote->family)

vim +322 net/mptcp/pm_userspace.c

702c2f646d42cf Florian Westphal 2022-05-03  304  =

702c2f646d42cf Florian Westphal 2022-05-03  305  static struct sock *mptcp_=
nl_find_ssk(struct mptcp_sock *msk,
702c2f646d42cf Florian Westphal 2022-05-03  306  				      const struct mpt=
cp_addr_info *local,
702c2f646d42cf Florian Westphal 2022-05-03  307  				      const struct mpt=
cp_addr_info *remote)
702c2f646d42cf Florian Westphal 2022-05-03  308  {
702c2f646d42cf Florian Westphal 2022-05-03  309  	struct sock *sk =3D &msk-=
>sk.icsk_inet.sk;
702c2f646d42cf Florian Westphal 2022-05-03  310  	struct mptcp_subflow_cont=
ext *subflow;
702c2f646d42cf Florian Westphal 2022-05-03  311  	struct sock *found =3D NU=
LL;
702c2f646d42cf Florian Westphal 2022-05-03  312  =

702c2f646d42cf Florian Westphal 2022-05-03  313  	if (local->family !=3D re=
mote->family)
702c2f646d42cf Florian Westphal 2022-05-03  314  		return NULL;
702c2f646d42cf Florian Westphal 2022-05-03  315  =

702c2f646d42cf Florian Westphal 2022-05-03  316  	lock_sock(sk);
702c2f646d42cf Florian Westphal 2022-05-03  317  =

702c2f646d42cf Florian Westphal 2022-05-03  318  	mptcp_for_each_subflow(ms=
k, subflow) {
702c2f646d42cf Florian Westphal 2022-05-03  319  		const struct inet_sock *=
issk;
702c2f646d42cf Florian Westphal 2022-05-03  320  		struct sock *ssk;
702c2f646d42cf Florian Westphal 2022-05-03  321  =

702c2f646d42cf Florian Westphal 2022-05-03 @322  		ssk =3D mptcp_subflow_tc=
p_sock(subflow);
702c2f646d42cf Florian Westphal 2022-05-03  323  =

702c2f646d42cf Florian Westphal 2022-05-03  324  		if (local->family !=3D s=
sk->sk_family)
702c2f646d42cf Florian Westphal 2022-05-03  325  			continue;
702c2f646d42cf Florian Westphal 2022-05-03  326  =

702c2f646d42cf Florian Westphal 2022-05-03  327  		issk =3D inet_sk(ssk);
702c2f646d42cf Florian Westphal 2022-05-03  328  =

702c2f646d42cf Florian Westphal 2022-05-03  329  		switch (ssk->sk_family) {
702c2f646d42cf Florian Westphal 2022-05-03  330  		case AF_INET:
702c2f646d42cf Florian Westphal 2022-05-03  331  			if (issk->inet_saddr !=
=3D local->addr.s_addr ||
702c2f646d42cf Florian Westphal 2022-05-03  332  			    issk->inet_daddr !=
=3D remote->addr.s_addr)
702c2f646d42cf Florian Westphal 2022-05-03  333  				continue;
702c2f646d42cf Florian Westphal 2022-05-03  334  			break;
702c2f646d42cf Florian Westphal 2022-05-03  335  #if IS_ENABLED(CONFIG_MPTC=
P_IPV6)
702c2f646d42cf Florian Westphal 2022-05-03  336  		case AF_INET6: {
702c2f646d42cf Florian Westphal 2022-05-03  337  			const struct ipv6_pinfo=
 *pinfo =3D inet6_sk(ssk);
702c2f646d42cf Florian Westphal 2022-05-03  338  =

702c2f646d42cf Florian Westphal 2022-05-03  339  			if (!ipv6_addr_equal(&l=
ocal->addr6, &pinfo->saddr) ||
702c2f646d42cf Florian Westphal 2022-05-03  340  			    !ipv6_addr_equal(&r=
emote->addr6, &ssk->sk_v6_daddr))
702c2f646d42cf Florian Westphal 2022-05-03  341  				continue;
702c2f646d42cf Florian Westphal 2022-05-03  342  			break;
702c2f646d42cf Florian Westphal 2022-05-03  343  		}
702c2f646d42cf Florian Westphal 2022-05-03  344  #endif
702c2f646d42cf Florian Westphal 2022-05-03  345  		default:
702c2f646d42cf Florian Westphal 2022-05-03  346  			continue;
702c2f646d42cf Florian Westphal 2022-05-03  347  		}
702c2f646d42cf Florian Westphal 2022-05-03  348  =

702c2f646d42cf Florian Westphal 2022-05-03  349  		if (issk->inet_sport =3D=
=3D local->port &&
702c2f646d42cf Florian Westphal 2022-05-03  350  		    issk->inet_dport =3D=
=3D remote->port) {
702c2f646d42cf Florian Westphal 2022-05-03  351  			found =3D ssk;
702c2f646d42cf Florian Westphal 2022-05-03  352  			goto found;
702c2f646d42cf Florian Westphal 2022-05-03  353  		}
702c2f646d42cf Florian Westphal 2022-05-03  354  	}
702c2f646d42cf Florian Westphal 2022-05-03  355  =

702c2f646d42cf Florian Westphal 2022-05-03  356  found:
702c2f646d42cf Florian Westphal 2022-05-03  357  	release_sock(sk);
702c2f646d42cf Florian Westphal 2022-05-03  358  =

702c2f646d42cf Florian Westphal 2022-05-03  359  	return found;
702c2f646d42cf Florian Westphal 2022-05-03  360  }
702c2f646d42cf Florian Westphal 2022-05-03  361  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3441338876189800899==--

