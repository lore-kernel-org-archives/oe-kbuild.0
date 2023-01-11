Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB6D180
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Jan 2023 00:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673396403; x=1704932403;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=NnSblnwTwls43RAbqvWIef8H69Q67vcwcSy73knVXQI=;
  b=f+gAXE8oaAIZZlYf/PH/Mo5BSmuyCa/XddlXUweKf8t2d+ghYsTcfnBL
   Yyxzc6MZ8f3IcwkmYip1jwmlqMeGeXE++3Q9YlLXwqeozQqQw5cJHEeOf
   Dsb8FfCERk7iU1FJF00Q3bFHYlYlK4kZEVjbA9AK3L+cXQ2vrTkAn/eOT
   sY2QfhE4Gb2QZYbi98WAsv//5v38qCdOCRj6YL9UcqH7hNKfbpToPAEsc
   B3BBCS3skJa81HcIDfnjtQ+r2E4iiv2HTinqLYISaaXWYtCyRQEAkYepf
   +FMyqO6t7qcQ/wW5Bb6cCbqZtEbi3yHs6sjJJbcR1ncs4V5y+vYtWiQlw
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="320981516"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="320981516"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2023 16:20:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="657245081"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="657245081"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 10 Jan 2023 16:20:01 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pFOqW-0008VG-2d;
	Wed, 11 Jan 2023 00:20:00 +0000
Date: Wed, 11 Jan 2023 08:19:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/ethernet/wangxun/libwx/wx_hw.c:404:37: warning:
 Parameter 'buffer' can be declared as pointer to const [constParameter]
Message-ID: <202301110818.Ft1aKKn4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "low confidence static check warning: drivers/n=
et/ethernet/wangxun/libwx/wx_hw.c:404:37: warning: Parameter 'buffer' can b=
e declared as pointer to const [constParameter]"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jiawen Wu <jiawenwu@trustnetic.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7dd4b804e08041ff56c88bdd8da742d14b17ed25
commit: 1efa9bfe58c595149ef1d5a7c23ad406d713b158 net: libwx: Implement inte=
raction with firmware
date:   2 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 2 months ago
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 1efa9bfe58c595149ef1d5a7c23ad406d713b158
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/net/ethernet/wangxun/libwx/wx_hw.c:210:6: warning: The if condit=
ion is the same as the previous if condition [duplicateCondition]
    if (status) {
        ^
   drivers/net/ethernet/wangxun/libwx/wx_hw.c:206:6: note: First condition
    if (status)
        ^
   drivers/net/ethernet/wangxun/libwx/wx_hw.c:210:6: note: Second condition
    if (status) {
        ^
>> drivers/net/ethernet/wangxun/libwx/wx_hw.c:404:37: warning: Parameter 'b=
uffer' can be declared as pointer to const [constParameter]
   static u8 wx_calculate_checksum(u8 *buffer, u32 length)
                                       ^
>> kernel/trace/bpf_trace.c:2293:1: warning: syntax error [syntaxError]
   BPF_TRACE_DEFN_x(2);
   ^
>> net/rxrpc/conn_client.c:809:3: warning: Syntax Error: AST broken, 'call'=
 doesn't have a parent. [internalAstError]
     ASSERTCMP(call->call_id, =3D=3D, 0);
     ^
--
>> net/rxrpc/conn_object.c:357:2: warning: Syntax Error: AST broken, 'conn'=
 doesn't have a parent. [internalAstError]
    ASSERTCMP(refcount_read(&conn->ref), =3D=3D, 0);
    ^
--
   net/mptcp/pm_netlink.c:123:54: warning: Uninitialized variables: subflow=
=2Enode, subflow.local_key, subflow.remote_key, subflow.idsn, subflow.map_s=
eq, subflow.snd_isn, subflow.token, subflow.rel_write_seq, subflow.map_subf=
low_seq, subflow.ssn_offset, subflow.map_data_len, subflow.map_data_csum, s=
ubflow.map_csum_len, subflow.request_mptcp, subflow.request_join, subflow.r=
equest_bkup, subflow.mp_capable, subflow.mp_join, subflow.fully_established=
, subflow.pm_notified, subflow.conn_finished, subflow.map_valid, subflow.ma=
p_csum_reqd, subflow.map_data_fin, subflow.mpc_map, subflow.backup, subflow=
=2Esend_mp_prio, subflow.send_mp_fail, subflow.send_fastclose, subflow.send=
_infinite_map, subflow.rx_eof, subflow.can_ack, subflow.disposable, subflow=
=2Estale, subflow.local_id_valid, subflow.valid_csum_seen, subflow.data_ava=
il, subflow.remote_nonce, subflow.thmac, subflow.local_nonce, subflow.remot=
e_token, subflow.local_id, subflow.remote_id, subflow.reset_seen, subflow.r=
eset_transient, subflow.reset_reason, subflow.stale_count, subflow.delegate=
d_status, subflow.fail_tout, subflow.delegated_node, subflow.setsockopt_seq=
, subflow.stale_rcv_tstamp, subflow.tcp_sock, subflow.conn, subflow.icsk_af=
_ops, subflow.tcp_state_change, subflow.tcp_error_report, subflow.rcu [unin=
itvar]
     skc =3D (struct sock_common *)mptcp_subflow_tcp_sock(subflow);
                                                        ^
   net/mptcp/pm_netlink.c:141:54: warning: Uninitialized variables: subflow=
=2Enode, subflow.local_key, subflow.remote_key, subflow.idsn, subflow.map_s=
eq, subflow.snd_isn, subflow.token, subflow.rel_write_seq, subflow.map_subf=
low_seq, subflow.ssn_offset, subflow.map_data_len, subflow.map_data_csum, s=
ubflow.map_csum_len, subflow.request_mptcp, subflow.request_join, subflow.r=
equest_bkup, subflow.mp_capable, subflow.mp_join, subflow.fully_established=
, subflow.pm_notified, subflow.conn_finished, subflow.map_valid, subflow.ma=
p_csum_reqd, subflow.map_data_fin, subflow.mpc_map, subflow.backup, subflow=
=2Esend_mp_prio, subflow.send_mp_fail, subflow.send_fastclose, subflow.send=
_infinite_map, subflow.rx_eof, subflow.can_ack, subflow.disposable, subflow=
=2Estale, subflow.local_id_valid, subflow.valid_csum_seen, subflow.data_ava=
il, subflow.remote_nonce, subflow.thmac, subflow.local_nonce, subflow.remot=
e_token, subflow.local_id, subflow.remote_id, subflow.reset_seen, subflow.r=
eset_transient, subflow.reset_reason, subflow.stale_count, subflow.delegate=
d_status, subflow.fail_tout, subflow.delegated_node, subflow.setsockopt_seq=
, subflow.stale_rcv_tstamp, subflow.tcp_sock, subflow.conn, subflow.icsk_af=
_ops, subflow.tcp_state_change, subflow.tcp_error_report, subflow.rcu [unin=
itvar]
     skc =3D (struct sock_common *)mptcp_subflow_tcp_sock(subflow);
                                                        ^
>> net/mptcp/pm_netlink.c:162:16: warning: Uninitialized variable: entry->f=
lags [uninitvar]
     if (!(entry->flags & MPTCP_PM_ADDR_FLAG_SUBFLOW))
                  ^
   net/mptcp/pm_netlink.c:200:16: warning: Uninitialized variable: entry->f=
lags [uninitvar]
     if (!(entry->flags & MPTCP_PM_ADDR_FLAG_SIGNAL))
                  ^
   net/mptcp/pm_netlink.c:197:7: note: Assuming condition is false
     if (!test_bit(entry->addr.id, msk->pm.id_avail_bitmap))
         ^
   net/mptcp/pm_netlink.c:200:16: note: Uninitialized variable: entry->flags
     if (!(entry->flags & MPTCP_PM_ADDR_FLAG_SIGNAL))
                  ^
>> net/mptcp/pm_netlink.c:265:11: warning: Uninitialized variables: entry.l=
ist, entry.add_timer, entry.sock, entry.retrans_times [uninitvar]
      return entry;
             ^
   net/mptcp/pm_netlink.c:450:33: warning: Uninitialized variables: subflow=
=2Enode, subflow.local_key, subflow.remote_key, subflow.idsn, subflow.map_s=
eq, subflow.snd_isn, subflow.token, subflow.rel_write_seq, subflow.map_subf=
low_seq, subflow.ssn_offset, subflow.map_data_len, subflow.map_data_csum, s=
ubflow.map_csum_len, subflow.request_mptcp, subflow.request_join, subflow.r=
equest_bkup, subflow.mp_capable, subflow.mp_join, subflow.fully_established=
, subflow.pm_notified, subflow.conn_finished, subflow.map_valid, subflow.ma=
p_csum_reqd, subflow.map_data_fin, subflow.mpc_map, subflow.backup, subflow=
=2Esend_mp_prio, subflow.send_mp_fail, subflow.send_fastclose, subflow.send=
_infinite_map, subflow.rx_eof, subflow.can_ack, subflow.disposable, subflow=
=2Estale, subflow.local_id_valid, subflow.valid_csum_seen, subflow.data_ava=
il, subflow.remote_nonce, subflow.thmac, subflow.local_nonce, subflow.remot=
e_token, subflow.local_id, subflow.remote_id, subflow.reset_seen, subflow.r=
eset_transient, subflow.reset_reason, subflow.stale_count, subflow.delegate=
d_status, subflow.fail_tout, subflow.delegated_node, subflow.setsockopt_seq=
, subflow.stale_rcv_tstamp, subflow.tcp_sock, subflow.conn, subflow.icsk_af=
_ops, subflow.tcp_state_change, subflow.tcp_error_report, subflow.rcu [unin=
itvar]
      ssk =3D mptcp_subflow_tcp_sock(subflow);
                                   ^
>> net/mptcp/pm_netlink.c:504:14: warning: Uninitialized variable: entry->a=
ddr [uninitvar]
     if (entry->addr.id =3D=3D id)
                ^
>> net/mptcp/pm_netlink.c:520:11: warning: Uninitialized variables: entry.l=
ist, entry.flags, entry.ifindex, entry.lsk [uninitvar]
      return entry;
             ^
   net/mptcp/pm_netlink.c:645:16: warning: Uninitialized variable: entry->f=
lags [uninitvar]
     if (!(entry->flags & MPTCP_PM_ADDR_FLAG_FULLMESH))
                  ^
   net/mptcp/pm_netlink.c:748:45: warning: Uninitialized variables: subflow=
=2Enode, subflow.local_key, subflow.remote_key, subflow.idsn, subflow.map_s=
eq, subflow.snd_isn, subflow.token, subflow.rel_write_seq, subflow.map_subf=
low_seq, subflow.ssn_offset, subflow.map_data_len, subflow.map_data_csum, s=
ubflow.map_csum_len, subflow.request_mptcp, subflow.request_join, subflow.r=
equest_bkup, subflow.mp_capable, subflow.mp_join, subflow.fully_established=
, subflow.pm_notified, subflow.conn_finished, subflow.map_valid, subflow.ma=
p_csum_reqd, subflow.map_data_fin, subflow.mpc_map, subflow.backup, subflow=
=2Esend_mp_prio, subflow.send_mp_fail, subflow.send_fastclose, subflow.send=
_infinite_map, subflow.rx_eof, subflow.can_ack, subflow.disposable, subflow=
=2Estale, subflow.local_id_valid, subflow.valid_csum_seen, subflow.data_ava=
il, subflow.remote_nonce, subflow.thmac, subflow.local_nonce, subflow.remot=
e_token, subflow.local_id, subflow.remote_id, subflow.reset_seen, subflow.r=
eset_transient, subflow.reset_reason, subflow.stale_count, subflow.delegate=
d_status, subflow.fail_tout, subflow.delegated_node, subflow.setsockopt_seq=
, subflow.stale_rcv_tstamp, subflow.tcp_sock, subflow.conn, subflow.icsk_af=
_ops, subflow.tcp_state_change, subflow.tcp_error_report, subflow.rcu [unin=
itvar]
     struct sock *ssk =3D mptcp_subflow_tcp_sock(subflow);
                                               ^
   net/mptcp/pm_netlink.c:1143:7: warning: Uninitialized variables: iter.no=
de, iter.local_key, iter.remote_key, iter.idsn, iter.map_seq, iter.snd_isn,=
 iter.token, iter.rel_write_seq, iter.map_subflow_seq, iter.ssn_offset, ite=
r.map_data_len, iter.map_data_csum, iter.map_csum_len, iter.request_mptcp, =
iter.request_join, iter.request_bkup, iter.mp_capable, iter.mp_join, iter.f=
ully_established, iter.pm_notified, iter.conn_finished, iter.map_valid, ite=
r.map_csum_reqd, iter.map_data_fin, iter.mpc_map, iter.backup, iter.send_mp=
_prio, iter.send_mp_fail, iter.send_fastclose, iter.send_infinite_map, iter=
=2Erx_eof, iter.can_ack, iter.disposable, iter.stale, iter.local_id_valid, =
iter.valid_csum_seen, iter.data_avail, iter.remote_nonce, iter.thmac, iter.=
local_nonce, iter.remote_token, iter.local_id, iter.remote_id, iter.reset_s=
een, iter.reset_transient, iter.reset_reason, iter.stale_count, iter.delega=
ted_status, iter.fail_tout, iter.delegated_node, iter.setsockopt_seq, iter.=
stale_rcv_tstamp, iter.tcp_sock, iter.conn, iter.icsk_af_ops, iter.tcp_stat=
e_change, iter.tcp_error_report, iter.rcu [uninitvar]
     if (iter !=3D subflow && mptcp_subflow_active(iter) &&
         ^
   net/mptcp/pm_netlink.c:1137:40: note: Assuming condition is false
    if (subflow->stale || !stale_loss_cnt || subflow->stale_count <=3D stal=
e_loss_cnt)
                                          ^
   net/mptcp/pm_netlink.c:1143:7: note: Uninitialized variables: iter.node,=
 iter.local_key, iter.remote_key, iter.idsn, iter.map_seq, iter.snd_isn, it=
er.token, iter.rel_write_seq, iter.map_subflow_seq, iter.ssn_offset, iter.m=
ap_data_len, iter.map_data_csum, iter.map_csum_len, iter.request_mptcp, ite=
r.request_join, iter.request_bkup, iter.mp_capable, iter.mp_join, iter.full=
y_established, iter.pm_notified, iter.conn_finished, iter.map_valid, iter.m=
ap_csum_reqd, iter.map_data_fin, iter.mpc_map, iter.backup, iter.send_mp_pr=
io, iter.send_mp_fail, iter.send_fastclose, iter.send_infinite_map, iter.rx=
_eof, iter.can_ack, iter.disposable, iter.stale, iter.local_id_valid, iter.=
valid_csum_seen, iter.data_avail, iter.remote_nonce, iter.thmac, iter.local=
_nonce, iter.remote_token, iter.local_id, iter.remote_id, iter.reset_seen, =
iter.reset_transient, iter.reset_reason, iter.stale_count, iter.delegated_s=
tatus, iter.fail_tout, iter.delegated_node, iter.setsockopt_seq, iter.stale=
_rcv_tstamp, iter.tcp_sock, iter.conn, iter.icsk_af_ops, iter.tcp_state_cha=
nge, iter.tcp_error_report, iter.rcu
     if (iter !=3D subflow && mptcp_subflow_active(iter) &&
         ^
>> net/mptcp/pm_netlink.c:66:6: warning: Using argument a that points at un=
initialized variable entry->addr [ctuuninitvar]
    if (a->family =3D=3D b->family) {
        ^
   net/mptcp/pm_netlink.c:264:28: note: Calling function mptcp_addresses_eq=
ual, 1st argument is uninitialized
     if (mptcp_addresses_equal(&entry->addr, addr, true))
                              ^
   net/mptcp/pm_netlink.c:66:6: note: Using argument a
    if (a->family =3D=3D b->family) {
        ^
>> net/mptcp/pm_netlink.c:66:19: warning: Using argument b that points at u=
ninitialized variable entry->addr [ctuuninitvar]
    if (a->family =3D=3D b->family) {
                     ^
   net/mptcp/pm_netlink.c:1551:30: note: Calling function lookup_subflow_by=
_saddr, 2nd argument is uninitialized
     if (lookup_subflow_by_saddr(&msk->conn_list, &entry->addr) &&
                                ^
   net/mptcp/pm_netlink.c:126:7: note: Calling function mptcp_addresses_equ=
al, 2nd argument is uninitialized
     if (mptcp_addresses_equal(&cur, saddr, saddr->port))
         ^
   net/mptcp/pm_netlink.c:66:19: note: Using argument b
    if (a->family =3D=3D b->family) {
                     ^
--
>> net/mptcp/options.c:578:3: warning: Assignment of function parameter has=
 no effect outside the function. [uselessAssignmentArg]
     remaining -=3D map_size;
     ^
   net/mptcp/options.c:883:3: warning: Assignment of function parameter has=
 no effect outside the function. [uselessAssignmentArg]
     remaining -=3D opt_size;
     ^

vim +/buffer +404 drivers/net/ethernet/wangxun/libwx/wx_hw.c

1efa9bfe58c5951 Jiawen Wu 2022-10-31  396 =20
1efa9bfe58c5951 Jiawen Wu 2022-10-31  397  /**
1efa9bfe58c5951 Jiawen Wu 2022-10-31  398   *  wx_calculate_checksum - Calc=
ulate checksum for buffer
1efa9bfe58c5951 Jiawen Wu 2022-10-31  399   *  @buffer: pointer to EEPROM
1efa9bfe58c5951 Jiawen Wu 2022-10-31  400   *  @length: size of EEPROM to c=
alculate a checksum for
1efa9bfe58c5951 Jiawen Wu 2022-10-31  401   *  Calculates the checksum for =
some buffer on a specified length.  The
1efa9bfe58c5951 Jiawen Wu 2022-10-31  402   *  checksum calculated is retur=
ned.
1efa9bfe58c5951 Jiawen Wu 2022-10-31  403   **/
1efa9bfe58c5951 Jiawen Wu 2022-10-31 @404  static u8 wx_calculate_checksum(=
u8 *buffer, u32 length)
1efa9bfe58c5951 Jiawen Wu 2022-10-31  405  {
1efa9bfe58c5951 Jiawen Wu 2022-10-31  406  	u8 sum =3D 0;
1efa9bfe58c5951 Jiawen Wu 2022-10-31  407  	u32 i;
1efa9bfe58c5951 Jiawen Wu 2022-10-31  408 =20
1efa9bfe58c5951 Jiawen Wu 2022-10-31  409  	if (!buffer)
1efa9bfe58c5951 Jiawen Wu 2022-10-31  410  		return 0;
1efa9bfe58c5951 Jiawen Wu 2022-10-31  411 =20
1efa9bfe58c5951 Jiawen Wu 2022-10-31  412  	for (i =3D 0; i < length; i++)
1efa9bfe58c5951 Jiawen Wu 2022-10-31  413  		sum +=3D buffer[i];
1efa9bfe58c5951 Jiawen Wu 2022-10-31  414 =20
1efa9bfe58c5951 Jiawen Wu 2022-10-31  415  	return (u8)(0 - sum);
1efa9bfe58c5951 Jiawen Wu 2022-10-31  416  }
1efa9bfe58c5951 Jiawen Wu 2022-10-31  417 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
