Content-Type: multipart/mixed; boundary="===============0652690681368459029=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [net-next:master 2/18] net/mptcp/pm_userspace.c:106:33: warning: Parameter 'skc' can be declared with const [constParameter]
Date: Thu, 05 May 2022 15:54:43 +0800
Message-ID: <202205051501.caEl7hUV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0652690681368459029==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: netdev(a)vger.kernel.org
TO: Kishen Maloor <kishen.maloor@intel.com>
CC: Mat Martineau <mathew.j.martineau@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
master
head:   4950b6990e3b1efae64a5f6fc5738d25e3b816b3
commit: 8b20137012d9e521736c040328f8979cf0a144d0 [2/18] mptcp: read attribu=
tes of addr entries managed by userspace PMs
:::::: branch date: 4 hours ago
:::::: commit date: 22 hours ago
compiler: aarch64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 8b20137012d9e521736c040328f8979cf0a144d0
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from net/mptcp/pm_userspace.c:
>> net/mptcp/pm_userspace.c:106:33: warning: Parameter 'skc' can be declare=
d with const [constParameter]
           struct mptcp_addr_info *skc)
                                   ^
   net/mptcp/protocol.h:657:7: warning: Uninitialized variables: tmp.node, =
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
>> net/mptcp/pm_userspace.c:47:12: warning: Uninitialized variables: e.list=
, e.flags, e.ifindex, e.lsk [uninitvar]
      match =3D e;
              ^
>> net/mptcp/pm_userspace.c:91:20: warning: Uninitialized variable: entry->=
addr [uninitvar]
     if (id =3D=3D entry->addr.id) {
                      ^

vim +/skc +106 net/mptcp/pm_userspace.c

4638de5aefe563 Kishen Maloor 2022-05-03   26  =

4638de5aefe563 Kishen Maloor 2022-05-03   27  int mptcp_userspace_pm_append=
_new_local_addr(struct mptcp_sock *msk,
4638de5aefe563 Kishen Maloor 2022-05-03   28  					     struct mptcp_pm_add=
r_entry *entry)
4638de5aefe563 Kishen Maloor 2022-05-03   29  {
4638de5aefe563 Kishen Maloor 2022-05-03   30  	DECLARE_BITMAP(id_bitmap, MP=
TCP_PM_MAX_ADDR_ID + 1);
4638de5aefe563 Kishen Maloor 2022-05-03   31  	struct mptcp_pm_addr_entry *=
match =3D NULL;
4638de5aefe563 Kishen Maloor 2022-05-03   32  	struct sock *sk =3D (struct =
sock *)msk;
4638de5aefe563 Kishen Maloor 2022-05-03   33  	struct mptcp_pm_addr_entry *=
e;
4638de5aefe563 Kishen Maloor 2022-05-03   34  	bool addr_match =3D false;
4638de5aefe563 Kishen Maloor 2022-05-03   35  	bool id_match =3D false;
4638de5aefe563 Kishen Maloor 2022-05-03   36  	int ret =3D -EINVAL;
4638de5aefe563 Kishen Maloor 2022-05-03   37  =

4638de5aefe563 Kishen Maloor 2022-05-03   38  	bitmap_zero(id_bitmap, MPTCP=
_PM_MAX_ADDR_ID + 1);
4638de5aefe563 Kishen Maloor 2022-05-03   39  =

4638de5aefe563 Kishen Maloor 2022-05-03   40  	spin_lock_bh(&msk->pm.lock);
4638de5aefe563 Kishen Maloor 2022-05-03   41  	list_for_each_entry(e, &msk-=
>pm.userspace_pm_local_addr_list, list) {
4638de5aefe563 Kishen Maloor 2022-05-03   42  		addr_match =3D mptcp_addres=
ses_equal(&e->addr, &entry->addr, true);
4638de5aefe563 Kishen Maloor 2022-05-03   43  		if (addr_match && entry->ad=
dr.id =3D=3D 0)
4638de5aefe563 Kishen Maloor 2022-05-03   44  			entry->addr.id =3D e->addr=
.id;
4638de5aefe563 Kishen Maloor 2022-05-03   45  		id_match =3D (e->addr.id =
=3D=3D entry->addr.id);
4638de5aefe563 Kishen Maloor 2022-05-03   46  		if (addr_match && id_match)=
 {
4638de5aefe563 Kishen Maloor 2022-05-03  @47  			match =3D e;
4638de5aefe563 Kishen Maloor 2022-05-03   48  			break;
4638de5aefe563 Kishen Maloor 2022-05-03   49  		} else if (addr_match || id=
_match) {
4638de5aefe563 Kishen Maloor 2022-05-03   50  			break;
4638de5aefe563 Kishen Maloor 2022-05-03   51  		}
4638de5aefe563 Kishen Maloor 2022-05-03   52  		__set_bit(e->addr.id, id_bi=
tmap);
4638de5aefe563 Kishen Maloor 2022-05-03   53  	}
4638de5aefe563 Kishen Maloor 2022-05-03   54  =

4638de5aefe563 Kishen Maloor 2022-05-03   55  	if (!match && !addr_match &&=
 !id_match) {
4638de5aefe563 Kishen Maloor 2022-05-03   56  		/* Memory for the entry is =
allocated from the
4638de5aefe563 Kishen Maloor 2022-05-03   57  		 * sock option buffer.
4638de5aefe563 Kishen Maloor 2022-05-03   58  		 */
4638de5aefe563 Kishen Maloor 2022-05-03   59  		e =3D sock_kmalloc(sk, size=
of(*e), GFP_ATOMIC);
4638de5aefe563 Kishen Maloor 2022-05-03   60  		if (!e) {
4638de5aefe563 Kishen Maloor 2022-05-03   61  			spin_unlock_bh(&msk->pm.lo=
ck);
4638de5aefe563 Kishen Maloor 2022-05-03   62  			return -ENOMEM;
4638de5aefe563 Kishen Maloor 2022-05-03   63  		}
4638de5aefe563 Kishen Maloor 2022-05-03   64  =

4638de5aefe563 Kishen Maloor 2022-05-03   65  		*e =3D *entry;
4638de5aefe563 Kishen Maloor 2022-05-03   66  		if (!e->addr.id)
4638de5aefe563 Kishen Maloor 2022-05-03   67  			e->addr.id =3D find_next_z=
ero_bit(id_bitmap,
4638de5aefe563 Kishen Maloor 2022-05-03   68  							MPTCP_PM_MAX_ADDR_ID +=
 1,
4638de5aefe563 Kishen Maloor 2022-05-03   69  							1);
4638de5aefe563 Kishen Maloor 2022-05-03   70  		list_add_tail_rcu(&e->list,=
 &msk->pm.userspace_pm_local_addr_list);
4638de5aefe563 Kishen Maloor 2022-05-03   71  		ret =3D e->addr.id;
4638de5aefe563 Kishen Maloor 2022-05-03   72  	} else if (match) {
4638de5aefe563 Kishen Maloor 2022-05-03   73  		ret =3D entry->addr.id;
4638de5aefe563 Kishen Maloor 2022-05-03   74  	}
4638de5aefe563 Kishen Maloor 2022-05-03   75  =

4638de5aefe563 Kishen Maloor 2022-05-03   76  	spin_unlock_bh(&msk->pm.lock=
);
4638de5aefe563 Kishen Maloor 2022-05-03   77  	return ret;
4638de5aefe563 Kishen Maloor 2022-05-03   78  }
8b20137012d9e5 Kishen Maloor 2022-05-03   79  =

8b20137012d9e5 Kishen Maloor 2022-05-03   80  int mptcp_userspace_pm_get_fl=
ags_and_ifindex_by_id(struct mptcp_sock *msk,
8b20137012d9e5 Kishen Maloor 2022-05-03   81  						   unsigned int id,
8b20137012d9e5 Kishen Maloor 2022-05-03   82  						   u8 *flags, int *ifin=
dex)
8b20137012d9e5 Kishen Maloor 2022-05-03   83  {
8b20137012d9e5 Kishen Maloor 2022-05-03   84  	struct mptcp_pm_addr_entry *=
entry, *match =3D NULL;
8b20137012d9e5 Kishen Maloor 2022-05-03   85  =

8b20137012d9e5 Kishen Maloor 2022-05-03   86  	*flags =3D 0;
8b20137012d9e5 Kishen Maloor 2022-05-03   87  	*ifindex =3D 0;
8b20137012d9e5 Kishen Maloor 2022-05-03   88  =

8b20137012d9e5 Kishen Maloor 2022-05-03   89  	spin_lock_bh(&msk->pm.lock);
8b20137012d9e5 Kishen Maloor 2022-05-03   90  	list_for_each_entry(entry, &=
msk->pm.userspace_pm_local_addr_list, list) {
8b20137012d9e5 Kishen Maloor 2022-05-03  @91  		if (id =3D=3D entry->addr.i=
d) {
8b20137012d9e5 Kishen Maloor 2022-05-03   92  			match =3D entry;
8b20137012d9e5 Kishen Maloor 2022-05-03   93  			break;
8b20137012d9e5 Kishen Maloor 2022-05-03   94  		}
8b20137012d9e5 Kishen Maloor 2022-05-03   95  	}
8b20137012d9e5 Kishen Maloor 2022-05-03   96  	spin_unlock_bh(&msk->pm.lock=
);
8b20137012d9e5 Kishen Maloor 2022-05-03   97  	if (match) {
8b20137012d9e5 Kishen Maloor 2022-05-03   98  		*flags =3D match->flags;
8b20137012d9e5 Kishen Maloor 2022-05-03   99  		*ifindex =3D match->ifindex;
8b20137012d9e5 Kishen Maloor 2022-05-03  100  	}
8b20137012d9e5 Kishen Maloor 2022-05-03  101  =

8b20137012d9e5 Kishen Maloor 2022-05-03  102  	return 0;
8b20137012d9e5 Kishen Maloor 2022-05-03  103  }
8b20137012d9e5 Kishen Maloor 2022-05-03  104  =

8b20137012d9e5 Kishen Maloor 2022-05-03  105  int mptcp_userspace_pm_get_lo=
cal_id(struct mptcp_sock *msk,
8b20137012d9e5 Kishen Maloor 2022-05-03 @106  				    struct mptcp_addr_inf=
o *skc)

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0652690681368459029==--

