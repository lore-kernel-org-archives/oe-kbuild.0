Content-Type: multipart/mixed; boundary="===============0380433625660416845=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 3/4] mptcp: build ADD_ADDR/echo-ADD_ADDR option according pm.add_signal
Date: Fri, 18 Jun 2021 07:38:32 +0800
Message-ID: <202106180728.SDfNEduo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0380433625660416845==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <1623921276-97178-4-git-send-email-liyonglong@chinatelecom.c=
n>
References: <1623921276-97178-4-git-send-email-liyonglong@chinatelecom.cn>
TO: Yonglong Li <liyonglong@chinatelecom.cn>
TO: mptcp(a)lists.linux.dev
CC: pabeni(a)redhat.com
CC: matthieu.baerts(a)tessares.net
CC: mathew.j.martineau(a)linux.intel.com
CC: geliangtang(a)gmail.com
CC: Yonglong Li <liyonglong@chinatelecom.cn>

Hi Yonglong,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on mptcp/export]
[also build test WARNING on linus/master v5.13-rc6 next-20210617]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Yonglong-Li/mptcp-fix-conf=
licts-when-using-pm-add_signal-in-ADD_ADDR-echo-and-RM_ADDR-process/2021061=
7-171559
base:   https://github.com/multipath-tcp/mptcp_net-next.git export
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   net/mptcp/options.c:591:3: warning: Assignment of function parameter has=
 no effect outside the function. [uselessAssignmentArg]
     remaining -=3D map_size;
     ^
   net/mptcp/options.c:849:3: warning: Assignment of function parameter has=
 no effect outside the function. [uselessAssignmentArg]
     remaining -=3D opt_size;
     ^
>> net/mptcp/options.c:726:34: warning: Uninitialized variable: flags [unin=
itvar]
    WRITE_ONCE(msk->pm.addr_signal, flags | msk->pm.addr_signal);
                                    ^

vim +726 net/mptcp/options.c

3df523ab582c52 Peter Krystad 2020-03-27  656  =

84dfe3677a6f45 Geliang Tang  2020-11-19  657  static bool mptcp_established=
_options_add_addr(struct sock *sk, struct sk_buff *skb,
3df523ab582c52 Peter Krystad 2020-03-27  658  					       unsigned int *siz=
e,
3df523ab582c52 Peter Krystad 2020-03-27  659  					       unsigned int rema=
ining,
3df523ab582c52 Peter Krystad 2020-03-27  660  					       struct mptcp_out_=
options *opts)
3df523ab582c52 Peter Krystad 2020-03-27  661  {
3df523ab582c52 Peter Krystad 2020-03-27  662  	struct mptcp_subflow_context=
 *subflow =3D mptcp_subflow_ctx(sk);
3df523ab582c52 Peter Krystad 2020-03-27  663  	struct mptcp_sock *msk =3D m=
ptcp_sk(subflow->conn);
84dfe3677a6f45 Geliang Tang  2020-11-19  664  	bool drop_other_suboptions =
=3D false;
84dfe3677a6f45 Geliang Tang  2020-11-19  665  	unsigned int opt_size =3D *s=
ize;
dcb008513c667a Yonglong Li   2021-06-17  666  	struct mptcp_addr_info remot=
e;
dcb008513c667a Yonglong Li   2021-06-17  667  	struct mptcp_addr_info local;
dcb008513c667a Yonglong Li   2021-06-17  668  	int ret =3D false;
dcb008513c667a Yonglong Li   2021-06-17  669  	u8 add_addr, flags;
1b1c7a0ef7f323 Peter Krystad 2020-03-27  670  	int len;
3df523ab582c52 Peter Krystad 2020-03-27  671  =

dcb008513c667a Yonglong Li   2021-06-17  672  	if (!mptcp_pm_should_add_sig=
nal(msk))
dcb008513c667a Yonglong Li   2021-06-17  673  		goto out;
dcb008513c667a Yonglong Li   2021-06-17  674  =

dcb008513c667a Yonglong Li   2021-06-17  675  	*size =3D 0;
dcb008513c667a Yonglong Li   2021-06-17  676  	mptcp_pm_add_addr_signal(msk=
, &local, &remote, &add_addr);
dcb008513c667a Yonglong Li   2021-06-17  677  	if (mptcp_pm_should_add_sign=
al_echo(msk)) {
dcb008513c667a Yonglong Li   2021-06-17  678  		if (skb && skb_is_tcp_pure_=
ack(skb)) {
84dfe3677a6f45 Geliang Tang  2020-11-19  679  			pr_debug("drop other subop=
tions");
84dfe3677a6f45 Geliang Tang  2020-11-19  680  			opts->suboptions =3D 0;
3ae32c07815a24 Geliang Tang  2020-12-15  681  			opts->ext_copy.use_ack =3D=
 0;
3ae32c07815a24 Geliang Tang  2020-12-15  682  			opts->ext_copy.use_map =3D=
 0;
84dfe3677a6f45 Geliang Tang  2020-11-19  683  			remaining +=3D opt_size;
84dfe3677a6f45 Geliang Tang  2020-11-19  684  			drop_other_suboptions =3D =
true;
84dfe3677a6f45 Geliang Tang  2020-11-19  685  		}
dcb008513c667a Yonglong Li   2021-06-17  686  		len =3D mptcp_add_addr_len(=
remote.family, true, !!remote.port);
dcb008513c667a Yonglong Li   2021-06-17  687  		if (remaining < len && mptc=
p_pm_should_add_signal_addr(msk))
dcb008513c667a Yonglong Li   2021-06-17  688  			goto add_addr;
dcb008513c667a Yonglong Li   2021-06-17  689  		else if (remaining < len)
dcb008513c667a Yonglong Li   2021-06-17  690  			goto out;
dcb008513c667a Yonglong Li   2021-06-17  691  		remaining -=3D len;
dcb008513c667a Yonglong Li   2021-06-17  692  		*size +=3D len;
dcb008513c667a Yonglong Li   2021-06-17  693  		opts->remote =3D remote;
dcb008513c667a Yonglong Li   2021-06-17  694  		flags =3D (u8)~BIT(MPTCP_AD=
D_ADDR_ECHO);
dcb008513c667a Yonglong Li   2021-06-17  695  		opts->suboptions |=3D OPTIO=
N_MPTCP_ADD_ECHO;
dcb008513c667a Yonglong Li   2021-06-17  696  		pr_debug("addr_id=3D%d, ech=
o=3D1, port=3D%d addr_signal:%x",
dcb008513c667a Yonglong Li   2021-06-17  697  			 opts->remote.id, ntohs(op=
ts->remote.port), add_addr);
dcb008513c667a Yonglong Li   2021-06-17  698  	} else if (mptcp_pm_should_a=
dd_signal_addr(msk)) {
dcb008513c667a Yonglong Li   2021-06-17  699  add_addr:
dcb008513c667a Yonglong Li   2021-06-17  700  		if ((local.family =3D=3D AF=
_INET6 || local.port) && skb &&
dcb008513c667a Yonglong Li   2021-06-17  701  		    skb_is_tcp_pure_ack(skb=
)) {
dcb008513c667a Yonglong Li   2021-06-17  702  			pr_debug("drop other subop=
tions");
dcb008513c667a Yonglong Li   2021-06-17  703  			opts->suboptions =3D 0;
dcb008513c667a Yonglong Li   2021-06-17  704  			opts->ext_copy.use_ack =3D=
 0;
dcb008513c667a Yonglong Li   2021-06-17  705  			opts->ext_copy.use_map =3D=
 0;
dcb008513c667a Yonglong Li   2021-06-17  706  			remaining +=3D opt_size;
dcb008513c667a Yonglong Li   2021-06-17  707  			drop_other_suboptions =3D =
true;
dcb008513c667a Yonglong Li   2021-06-17  708  		}
dcb008513c667a Yonglong Li   2021-06-17  709  		len =3D mptcp_add_addr_len(=
local.family, false, !!local.port);
1b1c7a0ef7f323 Peter Krystad 2020-03-27  710  		if (remaining < len)
dcb008513c667a Yonglong Li   2021-06-17  711  			goto out;
dcb008513c667a Yonglong Li   2021-06-17  712  		*size +=3D len;
dcb008513c667a Yonglong Li   2021-06-17  713  		opts->addr =3D local;
3df523ab582c52 Peter Krystad 2020-03-27  714  		opts->ahmac =3D add_addr_ge=
nerate_hmac(msk->local_key,
3df523ab582c52 Peter Krystad 2020-03-27  715  						     msk->remote_key,
761c124ed96985 Geliang Tang  2021-04-06  716  						     &opts->addr);
dcb008513c667a Yonglong Li   2021-06-17  717  		opts->suboptions |=3D OPTIO=
N_MPTCP_ADD_ADDR;
dcb008513c667a Yonglong Li   2021-06-17  718  		flags =3D (u8)~BIT(MPTCP_AD=
D_ADDR_SIGNAL);
dcb008513c667a Yonglong Li   2021-06-17  719  		pr_debug("addr_id=3D%d, ahm=
ac=3D%llu, echo=3D0, port=3D%d, addr_signal:%x",
dcb008513c667a Yonglong Li   2021-06-17  720  			 opts->addr.id, opts->ahma=
c, ntohs(opts->addr.port), add_addr);
3df523ab582c52 Peter Krystad 2020-03-27  721  	}
3df523ab582c52 Peter Krystad 2020-03-27  722  =

dcb008513c667a Yonglong Li   2021-06-17  723  	if (drop_other_suboptions)
dcb008513c667a Yonglong Li   2021-06-17  724  		*size -=3D opt_size;
dcb008513c667a Yonglong Li   2021-06-17  725  	spin_lock_bh(&msk->pm.lock);
dcb008513c667a Yonglong Li   2021-06-17 @726  	WRITE_ONCE(msk->pm.addr_sign=
al, flags | msk->pm.addr_signal);
dcb008513c667a Yonglong Li   2021-06-17  727  	spin_unlock_bh(&msk->pm.lock=
);
dcb008513c667a Yonglong Li   2021-06-17  728  	ret =3D true;
dcb008513c667a Yonglong Li   2021-06-17  729  =

dcb008513c667a Yonglong Li   2021-06-17  730  out:
dcb008513c667a Yonglong Li   2021-06-17  731  	return ret;
3df523ab582c52 Peter Krystad 2020-03-27  732  }
3df523ab582c52 Peter Krystad 2020-03-27  733  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0380433625660416845==--

