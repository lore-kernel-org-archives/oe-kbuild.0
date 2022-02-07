Content-Type: multipart/mixed; boundary="===============5678253973759780581=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH nf-next] netfilter: conntrack: pptp: use single option structure
Date: Mon, 07 Feb 2022 18:01:11 +0800
Message-ID: <202202071734.MhUN0ouB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5678253973759780581==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220120150913.8719-1-fw@strlen.de>
References: <20220120150913.8719-1-fw@strlen.de>
TO: Florian Westphal <fw@strlen.de>

Hi Florian,

I love your patch! Perhaps something to improve:

[auto build test WARNING on nf-next/master]

url:    https://github.com/0day-ci/linux/commits/Florian-Westphal/netfilter=
-conntrack-pptp-use-single-option-structure/20220120-230953
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pablo/nf-next.git m=
aster
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive=
/20220207/202202071734.MhUN0ouB-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/ffa8a2dcecaa350f84e574775=
0956010d5514ab2
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Florian-Westphal/netfilter-conntra=
ck-pptp-use-single-option-structure/20220120-230953
        git checkout ffa8a2dcecaa350f84e5747750956010d5514ab2
        # save the config file to linux build tree
        mkdir build_dir
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Dx86_64 SHELL=3D/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   net/netfilter/nf_conntrack_pptp.c:48:31: sparse: sparse: symbol 'nf_nat_=
pptp_hook' redeclared with different type (different address spaces):
>> net/netfilter/nf_conntrack_pptp.c:48:31: sparse:    struct nf_nat_pptp_h=
ook const *[addressable] [toplevel] nf_nat_pptp_hook
   net/netfilter/nf_conntrack_pptp.c: note: in included file:
   include/linux/netfilter/nf_conntrack_pptp.h:320:44: sparse: note: previo=
usly declared as:
>> include/linux/netfilter/nf_conntrack_pptp.h:320:44: sparse:    struct nf=
_nat_pptp_hook const [noderef] __rcu *extern [addressable] [toplevel] nf_na=
t_pptp_hook
   net/netfilter/nf_conntrack_pptp.c:103:16: sparse: sparse: incompatible t=
ypes in comparison expression (different address spaces):
>> net/netfilter/nf_conntrack_pptp.c:103:16: sparse:    struct nf_nat_pptp_=
hook const [noderef] __rcu *
>> net/netfilter/nf_conntrack_pptp.c:103:16: sparse:    struct nf_nat_pptp_=
hook const *
   net/netfilter/nf_conntrack_pptp.c:220:16: sparse: sparse: incompatible t=
ypes in comparison expression (different address spaces):
   net/netfilter/nf_conntrack_pptp.c:220:16: sparse:    struct nf_nat_pptp_=
hook const [noderef] __rcu *
   net/netfilter/nf_conntrack_pptp.c:220:16: sparse:    struct nf_nat_pptp_=
hook const *
   net/netfilter/nf_conntrack_pptp.c:364:16: sparse: sparse: incompatible t=
ypes in comparison expression (different address spaces):
   net/netfilter/nf_conntrack_pptp.c:364:16: sparse:    struct nf_nat_pptp_=
hook const [noderef] __rcu *
   net/netfilter/nf_conntrack_pptp.c:364:16: sparse:    struct nf_nat_pptp_=
hook const *
   net/netfilter/nf_conntrack_pptp.c:459:16: sparse: sparse: incompatible t=
ypes in comparison expression (different address spaces):
   net/netfilter/nf_conntrack_pptp.c:459:16: sparse:    struct nf_nat_pptp_=
hook const [noderef] __rcu *
   net/netfilter/nf_conntrack_pptp.c:459:16: sparse:    struct nf_nat_pptp_=
hook const *

vim +48 net/netfilter/nf_conntrack_pptp.c

f09943fefe6b70 Patrick McHardy   2006-12-02   47  =

ffa8a2dcecaa35 Florian Westphal  2022-01-20  @48  const struct nf_nat_pptp_=
hook *nf_nat_pptp_hook;
ffa8a2dcecaa35 Florian Westphal  2022-01-20   49  EXPORT_SYMBOL_GPL(nf_nat_=
pptp_hook);
f09943fefe6b70 Patrick McHardy   2006-12-02   50  =

e9d376f0fa66bd Jason Baron       2009-02-05   51  #if defined(DEBUG) || def=
ined(CONFIG_DYNAMIC_DEBUG)
f09943fefe6b70 Patrick McHardy   2006-12-02   52  /* PptpControlMessageType=
 names */
4c559f15efcc43 Pablo Neira Ayuso 2020-05-14   53  static const char *const =
pptp_msg_name_array[PPTP_MSG_MAX + 1] =3D {
4c559f15efcc43 Pablo Neira Ayuso 2020-05-14   54  	[0]				=3D "UNKNOWN_MESS=
AGE",
4c559f15efcc43 Pablo Neira Ayuso 2020-05-14   55  	[PPTP_START_SESSION_REQU=
EST]	=3D "START_SESSION_REQUEST",
4c559f15efcc43 Pablo Neira Ayuso 2020-05-14   56  	[PPTP_START_SESSION_REPL=
Y]	=3D "START_SESSION_REPLY",
4c559f15efcc43 Pablo Neira Ayuso 2020-05-14   57  	[PPTP_STOP_SESSION_REQUE=
ST]	=3D "STOP_SESSION_REQUEST",
4c559f15efcc43 Pablo Neira Ayuso 2020-05-14   58  	[PPTP_STOP_SESSION_REPLY=
]	=3D "STOP_SESSION_REPLY",
4c559f15efcc43 Pablo Neira Ayuso 2020-05-14   59  	[PPTP_ECHO_REQUEST]		=3D=
 "ECHO_REQUEST",
4c559f15efcc43 Pablo Neira Ayuso 2020-05-14   60  	[PPTP_ECHO_REPLY]		=3D "=
ECHO_REPLY",
4c559f15efcc43 Pablo Neira Ayuso 2020-05-14   61  	[PPTP_OUT_CALL_REQUEST]	=
	=3D "OUT_CALL_REQUEST",
4c559f15efcc43 Pablo Neira Ayuso 2020-05-14   62  	[PPTP_OUT_CALL_REPLY]		=
=3D "OUT_CALL_REPLY",
4c559f15efcc43 Pablo Neira Ayuso 2020-05-14   63  	[PPTP_IN_CALL_REQUEST]		=
=3D "IN_CALL_REQUEST",
4c559f15efcc43 Pablo Neira Ayuso 2020-05-14   64  	[PPTP_IN_CALL_REPLY]		=
=3D "IN_CALL_REPLY",
4c559f15efcc43 Pablo Neira Ayuso 2020-05-14   65  	[PPTP_IN_CALL_CONNECT]		=
=3D "IN_CALL_CONNECT",
4c559f15efcc43 Pablo Neira Ayuso 2020-05-14   66  	[PPTP_CALL_CLEAR_REQUEST=
]	=3D "CALL_CLEAR_REQUEST",
4c559f15efcc43 Pablo Neira Ayuso 2020-05-14   67  	[PPTP_CALL_DISCONNECT_NO=
TIFY]	=3D "CALL_DISCONNECT_NOTIFY",
4c559f15efcc43 Pablo Neira Ayuso 2020-05-14   68  	[PPTP_WAN_ERROR_NOTIFY]	=
	=3D "WAN_ERROR_NOTIFY",
4c559f15efcc43 Pablo Neira Ayuso 2020-05-14   69  	[PPTP_SET_LINK_INFO]		=
=3D "SET_LINK_INFO"
f09943fefe6b70 Patrick McHardy   2006-12-02   70  };
4c559f15efcc43 Pablo Neira Ayuso 2020-05-14   71  =

4946ea5c123703 Pablo Neira Ayuso 2020-05-27   72  const char *pptp_msg_name=
(u_int16_t msg)
4c559f15efcc43 Pablo Neira Ayuso 2020-05-14   73  {
4c559f15efcc43 Pablo Neira Ayuso 2020-05-14   74  	if (msg > PPTP_MSG_MAX)
4c559f15efcc43 Pablo Neira Ayuso 2020-05-14   75  		return pptp_msg_name_ar=
ray[0];
4c559f15efcc43 Pablo Neira Ayuso 2020-05-14   76  =

4c559f15efcc43 Pablo Neira Ayuso 2020-05-14   77  	return pptp_msg_name_arr=
ay[msg];
4c559f15efcc43 Pablo Neira Ayuso 2020-05-14   78  }
f09943fefe6b70 Patrick McHardy   2006-12-02   79  EXPORT_SYMBOL(pptp_msg_na=
me);
f09943fefe6b70 Patrick McHardy   2006-12-02   80  #endif
f09943fefe6b70 Patrick McHardy   2006-12-02   81  =

f09943fefe6b70 Patrick McHardy   2006-12-02   82  #define SECS *HZ
f09943fefe6b70 Patrick McHardy   2006-12-02   83  #define MINS * 60 SECS
f09943fefe6b70 Patrick McHardy   2006-12-02   84  #define HOURS * 60 MINS
f09943fefe6b70 Patrick McHardy   2006-12-02   85  =

f09943fefe6b70 Patrick McHardy   2006-12-02   86  #define PPTP_GRE_TIMEOUT =
		(10 MINS)
f09943fefe6b70 Patrick McHardy   2006-12-02   87  #define PPTP_GRE_STREAM_T=
IMEOUT 	(5 HOURS)
f09943fefe6b70 Patrick McHardy   2006-12-02   88  =

f09943fefe6b70 Patrick McHardy   2006-12-02   89  static void pptp_expectfn=
(struct nf_conn *ct,
f09943fefe6b70 Patrick McHardy   2006-12-02   90  			 struct nf_conntrack_e=
xpect *exp)
f09943fefe6b70 Patrick McHardy   2006-12-02   91  {
ffa8a2dcecaa35 Florian Westphal  2022-01-20   92  	const struct nf_nat_pptp=
_hook *hook;
0e6e75af921d1f Alexey Dobriyan   2008-10-08   93  	struct net *net =3D nf_c=
t_net(ct);
0d53778e81ac7a Patrick McHardy   2007-07-07   94  	pr_debug("increasing tim=
eouts\n");
f09943fefe6b70 Patrick McHardy   2006-12-02   95  =

f09943fefe6b70 Patrick McHardy   2006-12-02   96  	/* increase timeout of G=
RE data channel conntrack entry */
f09943fefe6b70 Patrick McHardy   2006-12-02   97  	ct->proto.gre.timeout	  =
   =3D PPTP_GRE_TIMEOUT;
f09943fefe6b70 Patrick McHardy   2006-12-02   98  	ct->proto.gre.stream_tim=
eout =3D PPTP_GRE_STREAM_TIMEOUT;
f09943fefe6b70 Patrick McHardy   2006-12-02   99  =

f09943fefe6b70 Patrick McHardy   2006-12-02  100  	/* Can you see how rusty=
 this code is, compared with the pre-2.6.11
f09943fefe6b70 Patrick McHardy   2006-12-02  101  	 * one? That's what happ=
ened to my shiny newnat of 2002 ;( -HW */
f09943fefe6b70 Patrick McHardy   2006-12-02  102  =

ffa8a2dcecaa35 Florian Westphal  2022-01-20 @103  	hook =3D rcu_dereference=
(nf_nat_pptp_hook);
ffa8a2dcecaa35 Florian Westphal  2022-01-20  104  	if (hook && ct->master->=
status & IPS_NAT_MASK)
ffa8a2dcecaa35 Florian Westphal  2022-01-20  105  		hook->expectfn(ct, exp);
f09943fefe6b70 Patrick McHardy   2006-12-02  106  	else {
f09943fefe6b70 Patrick McHardy   2006-12-02  107  		struct nf_conntrack_tup=
le inv_t;
f09943fefe6b70 Patrick McHardy   2006-12-02  108  		struct nf_conntrack_exp=
ect *exp_other;
f09943fefe6b70 Patrick McHardy   2006-12-02  109  =

f09943fefe6b70 Patrick McHardy   2006-12-02  110  		/* obviously this tuple=
 inversion only works until you do NAT */
303e0c5589592e Florian Westphal  2019-01-15  111  		nf_ct_invert_tuple(&inv=
_t, &exp->tuple);
0d53778e81ac7a Patrick McHardy   2007-07-07  112  		pr_debug("trying to une=
xpect other dir: ");
3c9fba656a185c Jan Engelhardt    2008-04-14  113  		nf_ct_dump_tuple(&inv_t=
);
f09943fefe6b70 Patrick McHardy   2006-12-02  114  =

5d0aa2ccd4699a Patrick McHardy   2010-02-15  115  		exp_other =3D nf_ct_exp=
ect_find_get(net, nf_ct_zone(ct), &inv_t);
f09943fefe6b70 Patrick McHardy   2006-12-02  116  		if (exp_other) {
f09943fefe6b70 Patrick McHardy   2006-12-02  117  			/* delete other expect=
ation.  */
0d53778e81ac7a Patrick McHardy   2007-07-07  118  			pr_debug("found\n");
6823645d608541 Patrick McHardy   2007-07-07  119  			nf_ct_unexpect_related=
(exp_other);
6823645d608541 Patrick McHardy   2007-07-07  120  			nf_ct_expect_put(exp_o=
ther);
f09943fefe6b70 Patrick McHardy   2006-12-02  121  		} else {
0d53778e81ac7a Patrick McHardy   2007-07-07  122  			pr_debug("not found\n"=
);
f09943fefe6b70 Patrick McHardy   2006-12-02  123  		}
f09943fefe6b70 Patrick McHardy   2006-12-02  124  	}
f09943fefe6b70 Patrick McHardy   2006-12-02  125  }
f09943fefe6b70 Patrick McHardy   2006-12-02  126  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5678253973759780581==--

