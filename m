Content-Type: multipart/mixed; boundary="===============1889204874232633195=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 11/31] net/tcp: Add TCP-AO sign to outgoing packets
Date: Mon, 22 Aug 2022 19:22:35 +0800
Message-ID: <202208221901.Fs6wW5Jd-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1889204874232633195==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220818170005.747015-12-dima@arista.com>
References: <20220818170005.747015-12-dima@arista.com>
TO: Dmitry Safonov <dima@arista.com>
TO: Eric Dumazet <edumazet@google.com>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev(a)vger.kernel.org
TO: linux-kernel(a)vger.kernel.org
CC: Dmitry Safonov <dima@arista.com>
CC: Andy Lutomirski <luto@amacapital.net>
CC: Ard Biesheuvel <ardb@kernel.org>
CC: Bob Gilligan <gilligan@arista.com>
CC: David Ahern <dsahern@kernel.org>
CC: Eric Biggers <ebiggers@kernel.org>
CC: Francesco Ruggeri <fruggeri@arista.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>
CC: Ivan Delalande <colona@arista.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Leonard Crestez <cdleonard@gmail.com>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Salam Noureddine <noureddine@arista.com>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: linux-crypto(a)vger.kernel.org

Hi Dmitry,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on e34cfee65ec891a319ce79797dda18083af33a76]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Safonov/net-t=
cp-Add-TCP-AO-support/20220819-010628
base:   e34cfee65ec891a319ce79797dda18083af33a76
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20822/202208221901.Fs6wW5Jd-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/ipv4/tcp_output.c:640 tcp_options_write() error: uninitialized symbol '=
maclen'.
net/ipv4/tcp_output.c:686 tcp_options_write() error: we previously assumed =
'tp' could be null (see line 626)

vim +/maclen +640 net/ipv4/tcp_output.c

331fca4315efa3b Martin KaFai Lau      2020-08-20  594  =

67edfef78639573 Andi Kleen            2009-07-21  595  /* Write previously =
computed TCP options to the packet.
67edfef78639573 Andi Kleen            2009-07-21  596   *
67edfef78639573 Andi Kleen            2009-07-21  597   * Beware: Something=
 in the Internet is very sensitive to the ordering of
fd6149d332973ba Ilpo J=C3=A4rvinen         2008-10-23  598   * TCP options,=
 we learned this through the hard way, so be careful here.
fd6149d332973ba Ilpo J=C3=A4rvinen         2008-10-23  599   * Luckily we c=
an at least blame others for their non-compliance but from
8e3bff96afa6736 stephen hemminger     2013-12-08  600   * inter-operability=
 perspective it seems that we're somewhat stuck with
fd6149d332973ba Ilpo J=C3=A4rvinen         2008-10-23  601   * the ordering=
 which we have been using if we want to keep working with
fd6149d332973ba Ilpo J=C3=A4rvinen         2008-10-23  602   * those broken=
 things (not that it currently hurts anybody as there isn't
fd6149d332973ba Ilpo J=C3=A4rvinen         2008-10-23  603   * particular r=
eason why the ordering would need to be changed).
fd6149d332973ba Ilpo J=C3=A4rvinen         2008-10-23  604   *
fd6149d332973ba Ilpo J=C3=A4rvinen         2008-10-23  605   * At least SAC=
K_PERM as the first option is known to lead to a disaster
fd6149d332973ba Ilpo J=C3=A4rvinen         2008-10-23  606   * (but it may =
well be that other scenarios fail similarly).
fd6149d332973ba Ilpo J=C3=A4rvinen         2008-10-23  607   */
ea66758c1795cef Paolo Abeni           2022-05-04  608  static void tcp_opti=
ons_write(struct tcphdr *th, struct tcp_sock *tp,
85df6b860d509a9 Dmitry Safonov        2022-08-18  609  			      struct tcp_=
out_options *opts,
85df6b860d509a9 Dmitry Safonov        2022-08-18  610  			      struct tcp_=
ao_key *ao_key)
bd0388ae7707502 William Allen Simpson 2009-12-02  611  {
ea66758c1795cef Paolo Abeni           2022-05-04  612  	__be32 *ptr =3D (__=
be32 *)(th + 1);
2100c8d2d9db23c Yuchung Cheng         2012-07-19  613  	u16 options =3D opt=
s->options;	/* mungable copy */
bd0388ae7707502 William Allen Simpson 2009-12-02  614  =

bd0388ae7707502 William Allen Simpson 2009-12-02  615  	if (unlikely(OPTION=
_MD5 & options)) {
1a2c6181c4a1922 Christoph Paasch      2013-03-17  616  		*ptr++ =3D htonl((=
TCPOPT_NOP << 24) | (TCPOPT_NOP << 16) |
1a2c6181c4a1922 Christoph Paasch      2013-03-17  617  			       (TCPOPT_MD=
5SIG << 8) | TCPOLEN_MD5SIG);
bd0388ae7707502 William Allen Simpson 2009-12-02  618  		/* overload cookie=
 hash location */
bd0388ae7707502 William Allen Simpson 2009-12-02  619  		opts->hash_locatio=
n =3D (__u8 *)ptr;
33ad798c924b4a1 Adam Langley          2008-07-19  620  		ptr +=3D 4;
33ad798c924b4a1 Adam Langley          2008-07-19  621  	}
85df6b860d509a9 Dmitry Safonov        2022-08-18  622  #ifdef CONFIG_TCP_AO
85df6b860d509a9 Dmitry Safonov        2022-08-18  623  	if (unlikely(OPTION=
_AO & options)) {
85df6b860d509a9 Dmitry Safonov        2022-08-18  624  		u8 maclen;
33ad798c924b4a1 Adam Langley          2008-07-19  625  =

85df6b860d509a9 Dmitry Safonov        2022-08-18 @626  		if (tp) {
85df6b860d509a9 Dmitry Safonov        2022-08-18  627  			struct tcp_ao_inf=
o *ao_info;
85df6b860d509a9 Dmitry Safonov        2022-08-18  628  =

85df6b860d509a9 Dmitry Safonov        2022-08-18  629  			ao_info =3D rcu_d=
ereference_check(tp->ao_info,
85df6b860d509a9 Dmitry Safonov        2022-08-18  630  				lockdep_sock_is_=
held(&tp->inet_conn.icsk_inet.sk));
85df6b860d509a9 Dmitry Safonov        2022-08-18  631  			if (WARN_ON_ONCE(=
!ao_key || !ao_info || !ao_info->rnext_key))
85df6b860d509a9 Dmitry Safonov        2022-08-18  632  				goto out_ao;
85df6b860d509a9 Dmitry Safonov        2022-08-18  633  			maclen =3D tcp_ao=
_maclen(ao_key);
85df6b860d509a9 Dmitry Safonov        2022-08-18  634  			*ptr++ =3D htonl(=
(TCPOPT_AO << 24) |
85df6b860d509a9 Dmitry Safonov        2022-08-18  635  				       (tcp_ao_l=
en(ao_key) << 16) |
85df6b860d509a9 Dmitry Safonov        2022-08-18  636  				       (ao_key->=
sndid << 8) |
85df6b860d509a9 Dmitry Safonov        2022-08-18  637  				       (ao_info-=
>rnext_key->rcvid));
85df6b860d509a9 Dmitry Safonov        2022-08-18  638  		}
85df6b860d509a9 Dmitry Safonov        2022-08-18  639  		opts->hash_locatio=
n =3D (__u8 *)ptr;
85df6b860d509a9 Dmitry Safonov        2022-08-18 @640  		ptr +=3D maclen / =
sizeof(*ptr);
85df6b860d509a9 Dmitry Safonov        2022-08-18  641  		if (unlikely(macle=
n % sizeof(*ptr))) {
85df6b860d509a9 Dmitry Safonov        2022-08-18  642  			memset(ptr, TCPOP=
T_NOP, sizeof(*ptr));
85df6b860d509a9 Dmitry Safonov        2022-08-18  643  			ptr++;
85df6b860d509a9 Dmitry Safonov        2022-08-18  644  		}
85df6b860d509a9 Dmitry Safonov        2022-08-18  645  	}
85df6b860d509a9 Dmitry Safonov        2022-08-18  646  out_ao:
85df6b860d509a9 Dmitry Safonov        2022-08-18  647  #endif
fd6149d332973ba Ilpo J=C3=A4rvinen         2008-10-23  648  	if (unlikely(o=
pts->mss)) {
fd6149d332973ba Ilpo J=C3=A4rvinen         2008-10-23  649  		*ptr++ =3D ht=
onl((TCPOPT_MSS << 24) |
fd6149d332973ba Ilpo J=C3=A4rvinen         2008-10-23  650  			       (TCPO=
LEN_MSS << 16) |
fd6149d332973ba Ilpo J=C3=A4rvinen         2008-10-23  651  			       opts-=
>mss);
fd6149d332973ba Ilpo J=C3=A4rvinen         2008-10-23  652  	}
fd6149d332973ba Ilpo J=C3=A4rvinen         2008-10-23  653  =

bd0388ae7707502 William Allen Simpson 2009-12-02  654  	if (likely(OPTION_T=
S & options)) {
bd0388ae7707502 William Allen Simpson 2009-12-02  655  		if (unlikely(OPTIO=
N_SACK_ADVERTISE & options)) {
33ad798c924b4a1 Adam Langley          2008-07-19  656  			*ptr++ =3D htonl(=
(TCPOPT_SACK_PERM << 24) |
33ad798c924b4a1 Adam Langley          2008-07-19  657  				       (TCPOLEN_=
SACK_PERM << 16) |
33ad798c924b4a1 Adam Langley          2008-07-19  658  				       (TCPOPT_T=
IMESTAMP << 8) |
33ad798c924b4a1 Adam Langley          2008-07-19  659  				       TCPOLEN_T=
IMESTAMP);
bd0388ae7707502 William Allen Simpson 2009-12-02  660  			options &=3D ~OPT=
ION_SACK_ADVERTISE;
33ad798c924b4a1 Adam Langley          2008-07-19  661  		} else {
496c98dff8e3538 YOSHIFUJI Hideaki     2006-10-10  662  			*ptr++ =3D htonl(=
(TCPOPT_NOP << 24) |
40efc6fa179f440 Stephen Hemminger     2006-01-03  663  				       (TCPOPT_N=
OP << 16) |
40efc6fa179f440 Stephen Hemminger     2006-01-03  664  				       (TCPOPT_T=
IMESTAMP << 8) |
40efc6fa179f440 Stephen Hemminger     2006-01-03  665  				       TCPOLEN_T=
IMESTAMP);
40efc6fa179f440 Stephen Hemminger     2006-01-03  666  		}
33ad798c924b4a1 Adam Langley          2008-07-19  667  		*ptr++ =3D htonl(o=
pts->tsval);
33ad798c924b4a1 Adam Langley          2008-07-19  668  		*ptr++ =3D htonl(o=
pts->tsecr);
33ad798c924b4a1 Adam Langley          2008-07-19  669  	}
33ad798c924b4a1 Adam Langley          2008-07-19  670  =

bd0388ae7707502 William Allen Simpson 2009-12-02  671  	if (unlikely(OPTION=
_SACK_ADVERTISE & options)) {
33ad798c924b4a1 Adam Langley          2008-07-19  672  		*ptr++ =3D htonl((=
TCPOPT_NOP << 24) |
33ad798c924b4a1 Adam Langley          2008-07-19  673  			       (TCPOPT_NO=
P << 16) |
33ad798c924b4a1 Adam Langley          2008-07-19  674  			       (TCPOPT_SA=
CK_PERM << 8) |
33ad798c924b4a1 Adam Langley          2008-07-19  675  			       TCPOLEN_SA=
CK_PERM);
33ad798c924b4a1 Adam Langley          2008-07-19  676  	}
33ad798c924b4a1 Adam Langley          2008-07-19  677  =

bd0388ae7707502 William Allen Simpson 2009-12-02  678  	if (unlikely(OPTION=
_WSCALE & options)) {
33ad798c924b4a1 Adam Langley          2008-07-19  679  		*ptr++ =3D htonl((=
TCPOPT_NOP << 24) |
33ad798c924b4a1 Adam Langley          2008-07-19  680  			       (TCPOPT_WI=
NDOW << 16) |
33ad798c924b4a1 Adam Langley          2008-07-19  681  			       (TCPOLEN_W=
INDOW << 8) |
33ad798c924b4a1 Adam Langley          2008-07-19  682  			       opts->ws);
33ad798c924b4a1 Adam Langley          2008-07-19  683  	}
33ad798c924b4a1 Adam Langley          2008-07-19  684  =

33ad798c924b4a1 Adam Langley          2008-07-19  685  	if (unlikely(opts->=
num_sack_blocks)) {
33ad798c924b4a1 Adam Langley          2008-07-19 @686  		struct tcp_sack_bl=
ock *sp =3D tp->rx_opt.dsack ?
33ad798c924b4a1 Adam Langley          2008-07-19  687  			tp->duplicate_sac=
k : tp->selective_acks;
40efc6fa179f440 Stephen Hemminger     2006-01-03  688  		int this_sack;
40efc6fa179f440 Stephen Hemminger     2006-01-03  689  =

40efc6fa179f440 Stephen Hemminger     2006-01-03  690  		*ptr++ =3D htonl((=
TCPOPT_NOP  << 24) |
40efc6fa179f440 Stephen Hemminger     2006-01-03  691  			       (TCPOPT_NO=
P  << 16) |
40efc6fa179f440 Stephen Hemminger     2006-01-03  692  			       (TCPOPT_SA=
CK <<  8) |
33ad798c924b4a1 Adam Langley          2008-07-19  693  			       (TCPOLEN_S=
ACK_BASE + (opts->num_sack_blocks *
40efc6fa179f440 Stephen Hemminger     2006-01-03  694  						     TCPOLEN_S=
ACK_PERBLOCK)));
2de979bd7da9c8b Stephen Hemminger     2007-03-08  695  =

33ad798c924b4a1 Adam Langley          2008-07-19  696  		for (this_sack =3D=
 0; this_sack < opts->num_sack_blocks;
33ad798c924b4a1 Adam Langley          2008-07-19  697  		     ++this_sack) {
40efc6fa179f440 Stephen Hemminger     2006-01-03  698  			*ptr++ =3D htonl(=
sp[this_sack].start_seq);
40efc6fa179f440 Stephen Hemminger     2006-01-03  699  			*ptr++ =3D htonl(=
sp[this_sack].end_seq);
40efc6fa179f440 Stephen Hemminger     2006-01-03  700  		}
2de979bd7da9c8b Stephen Hemminger     2007-03-08  701  =

40efc6fa179f440 Stephen Hemminger     2006-01-03  702  		tp->rx_opt.dsack =
=3D 0;
40efc6fa179f440 Stephen Hemminger     2006-01-03  703  	}
2100c8d2d9db23c Yuchung Cheng         2012-07-19  704  =

2100c8d2d9db23c Yuchung Cheng         2012-07-19  705  	if (unlikely(OPTION=
_FAST_OPEN_COOKIE & options)) {
2100c8d2d9db23c Yuchung Cheng         2012-07-19  706  		struct tcp_fastope=
n_cookie *foc =3D opts->fastopen_cookie;
7f9b838b71eb78a Daniel Lee            2015-04-06  707  		u8 *p =3D (u8 *)pt=
r;
7f9b838b71eb78a Daniel Lee            2015-04-06  708  		u32 len; /* Fast O=
pen option length */
2100c8d2d9db23c Yuchung Cheng         2012-07-19  709  =

7f9b838b71eb78a Daniel Lee            2015-04-06  710  		if (foc->exp) {
7f9b838b71eb78a Daniel Lee            2015-04-06  711  			len =3D TCPOLEN_E=
XP_FASTOPEN_BASE + foc->len;
7f9b838b71eb78a Daniel Lee            2015-04-06  712  			*ptr =3D htonl((T=
CPOPT_EXP << 24) | (len << 16) |
2100c8d2d9db23c Yuchung Cheng         2012-07-19  713  				     TCPOPT_FAST=
OPEN_MAGIC);
7f9b838b71eb78a Daniel Lee            2015-04-06  714  			p +=3D TCPOLEN_EX=
P_FASTOPEN_BASE;
7f9b838b71eb78a Daniel Lee            2015-04-06  715  		} else {
7f9b838b71eb78a Daniel Lee            2015-04-06  716  			len =3D TCPOLEN_F=
ASTOPEN_BASE + foc->len;
7f9b838b71eb78a Daniel Lee            2015-04-06  717  			*p++ =3D TCPOPT_F=
ASTOPEN;
7f9b838b71eb78a Daniel Lee            2015-04-06  718  			*p++ =3D len;
7f9b838b71eb78a Daniel Lee            2015-04-06  719  		}
2100c8d2d9db23c Yuchung Cheng         2012-07-19  720  =

7f9b838b71eb78a Daniel Lee            2015-04-06  721  		memcpy(p, foc->val=
, foc->len);
7f9b838b71eb78a Daniel Lee            2015-04-06  722  		if ((len & 3) =3D=
=3D 2) {
7f9b838b71eb78a Daniel Lee            2015-04-06  723  			p[foc->len] =3D T=
CPOPT_NOP;
7f9b838b71eb78a Daniel Lee            2015-04-06  724  			p[foc->len + 1] =
=3D TCPOPT_NOP;
2100c8d2d9db23c Yuchung Cheng         2012-07-19  725  		}
7f9b838b71eb78a Daniel Lee            2015-04-06  726  		ptr +=3D (len + 3)=
 >> 2;
2100c8d2d9db23c Yuchung Cheng         2012-07-19  727  	}
60e2a7780793bae Ursula Braun          2017-10-25  728  =

60e2a7780793bae Ursula Braun          2017-10-25  729  	smc_options_write(p=
tr, &options);
eda7acddf8080bb Peter Krystad         2020-01-21  730  =

ea66758c1795cef Paolo Abeni           2022-05-04  731  	mptcp_options_write=
(th, ptr, tp, opts);
60e2a7780793bae Ursula Braun          2017-10-25  732  }
60e2a7780793bae Ursula Braun          2017-10-25  733  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1889204874232633195==--

