Content-Type: multipart/mixed; boundary="===============3173222597146010282=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH net] net/sched: act_pedit: really ensure the skb is writable
Date: Fri, 06 May 2022 01:31:27 +0800
Message-ID: <202205060152.sIspNBBq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3173222597146010282==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <dfcfe03e01c364599e92715828b24713d955e7c8.1651764848.git.paben=
i@redhat.com>
References: <dfcfe03e01c364599e92715828b24713d955e7c8.1651764848.git.pabeni=
@redhat.com>
TO: Paolo Abeni <pabeni@redhat.com>

Hi Paolo,

I love your patch! Perhaps something to improve:

[auto build test WARNING on net/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Paolo-Abeni/net-sche=
d-act_pedit-really-ensure-the-skb-is-writable/20220505-235513
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git 4071b=
f121d59944d5cd2238de0642f3d7995a997
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
506/202205060152.sIspNBBq-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> net/sched/act_pedit.c:333:2-8: preceding lock on line 326

vim +333 net/sched/act_pedit.c

71d0ed7079dffb net/sched/act_pedit.c Amir Vadai        2017-02-07  318  =

6a2b401cd17d41 net/sched/act_pedit.c Jamal Hadi Salim  2018-08-12  319  sta=
tic int tcf_pedit_act(struct sk_buff *skb, const struct tc_action *a,
e9ce1cd3cf6cf3 net/sched/act_pedit.c David S. Miller   2006-08-21  320  			=
 struct tcf_result *res)
^1da177e4c3f41 net/sched/pedit.c     Linus Torvalds    2005-04-16  321  {
a85a970af265f1 net/sched/act_pedit.c WANG Cong         2016-07-25  322  	st=
ruct tcf_pedit *p =3D to_pedit(a);
5453f7744a582e net/sched/act_pedit.c Paolo Abeni       2022-05-05  323  	u3=
2 max_offset;
4749c3ef854e3a net/sched/act_pedit.c Florian Westphal  2015-04-30  324  	in=
t i;
^1da177e4c3f41 net/sched/pedit.c     Linus Torvalds    2005-04-16  325  =

e9ce1cd3cf6cf3 net/sched/act_pedit.c David S. Miller   2006-08-21 @326  	sp=
in_lock(&p->tcf_lock);
^1da177e4c3f41 net/sched/pedit.c     Linus Torvalds    2005-04-16  327  =

5453f7744a582e net/sched/act_pedit.c Paolo Abeni       2022-05-05  328  	ma=
x_offset =3D (skb_transport_header_was_set(skb) ?
5453f7744a582e net/sched/act_pedit.c Paolo Abeni       2022-05-05  329  		 =
     skb_transport_offset(skb) :
5453f7744a582e net/sched/act_pedit.c Paolo Abeni       2022-05-05  330  		 =
     skb_network_offset(skb)) +
5453f7744a582e net/sched/act_pedit.c Paolo Abeni       2022-05-05  331  		 =
    p->tcfp_off_max_hint;
5453f7744a582e net/sched/act_pedit.c Paolo Abeni       2022-05-05  332  	if=
 (skb_ensure_writable(skb, min(skb->len, max_offset)))
5453f7744a582e net/sched/act_pedit.c Paolo Abeni       2022-05-05 @333  		r=
eturn p->tcf_action;
5453f7744a582e net/sched/act_pedit.c Paolo Abeni       2022-05-05  334  =

9c4a4e488bc8f5 net/sched/act_pedit.c Jamal Hadi Salim  2016-06-06  335  	tc=
f_lastuse_update(&p->tcf_tm);
^1da177e4c3f41 net/sched/pedit.c     Linus Torvalds    2005-04-16  336  =

e9ce1cd3cf6cf3 net/sched/act_pedit.c David S. Miller   2006-08-21  337  	if=
 (p->tcfp_nkeys > 0) {
e9ce1cd3cf6cf3 net/sched/act_pedit.c David S. Miller   2006-08-21  338  		s=
truct tc_pedit_key *tkey =3D p->tcfp_keys;
71d0ed7079dffb net/sched/act_pedit.c Amir Vadai        2017-02-07  339  		s=
truct tcf_pedit_key_ex *tkey_ex =3D p->tcfp_keys_ex;
80f0f574cc615b net/sched/act_pedit.c Roman Mashak      2018-06-27  340  		e=
num pedit_header_type htype =3D
80f0f574cc615b net/sched/act_pedit.c Roman Mashak      2018-06-27  341  			=
TCA_PEDIT_KEY_EX_HDR_TYPE_NETWORK;
853a14ba4682f8 net/sched/act_pedit.c Amir Vadai        2017-02-07  342  		e=
num pedit_cmd cmd =3D TCA_PEDIT_KEY_EX_CMD_SET;
^1da177e4c3f41 net/sched/pedit.c     Linus Torvalds    2005-04-16  343  =

e9ce1cd3cf6cf3 net/sched/act_pedit.c David S. Miller   2006-08-21  344  		f=
or (i =3D p->tcfp_nkeys; i > 0; i--, tkey++) {
544377cd2545f3 net/sched/act_pedit.c Roman Mashak      2018-06-27  345  			=
u32 *ptr, hdata;
^1da177e4c3f41 net/sched/pedit.c     Linus Torvalds    2005-04-16  346  			=
int offset =3D tkey->off;
71d0ed7079dffb net/sched/act_pedit.c Amir Vadai        2017-02-07  347  			=
int hoffset;
853a14ba4682f8 net/sched/act_pedit.c Amir Vadai        2017-02-07  348  			=
u32 val;
71d0ed7079dffb net/sched/act_pedit.c Amir Vadai        2017-02-07  349  			=
int rc;
71d0ed7079dffb net/sched/act_pedit.c Amir Vadai        2017-02-07  350  =

71d0ed7079dffb net/sched/act_pedit.c Amir Vadai        2017-02-07  351  			=
if (tkey_ex) {
71d0ed7079dffb net/sched/act_pedit.c Amir Vadai        2017-02-07  352  			=
	htype =3D tkey_ex->htype;
853a14ba4682f8 net/sched/act_pedit.c Amir Vadai        2017-02-07  353  			=
	cmd =3D tkey_ex->cmd;
853a14ba4682f8 net/sched/act_pedit.c Amir Vadai        2017-02-07  354  =

71d0ed7079dffb net/sched/act_pedit.c Amir Vadai        2017-02-07  355  			=
	tkey_ex++;
71d0ed7079dffb net/sched/act_pedit.c Amir Vadai        2017-02-07  356  			}
71d0ed7079dffb net/sched/act_pedit.c Amir Vadai        2017-02-07  357  =

71d0ed7079dffb net/sched/act_pedit.c Amir Vadai        2017-02-07  358  			=
rc =3D pedit_skb_hdr_offset(skb, htype, &hoffset);
71d0ed7079dffb net/sched/act_pedit.c Amir Vadai        2017-02-07  359  			=
if (rc) {
95b0d2dc13c7e7 net/sched/act_pedit.c Roman Mashak      2018-06-27  360  			=
	pr_info("tc action pedit bad header type specified (0x%x)\n",
71d0ed7079dffb net/sched/act_pedit.c Amir Vadai        2017-02-07  361  			=
		htype);
71d0ed7079dffb net/sched/act_pedit.c Amir Vadai        2017-02-07  362  			=
	goto bad;
71d0ed7079dffb net/sched/act_pedit.c Amir Vadai        2017-02-07  363  			}
^1da177e4c3f41 net/sched/pedit.c     Linus Torvalds    2005-04-16  364  =

^1da177e4c3f41 net/sched/pedit.c     Linus Torvalds    2005-04-16  365  			=
if (tkey->offmask) {
430527415398cf net/sched/act_pedit.c Roman Mashak      2018-06-27  366  			=
	u8 *d, _d;
db2c24175d149b net/sched/act_pedit.c Changli Gao       2010-06-02  367  =

71d0ed7079dffb net/sched/act_pedit.c Amir Vadai        2017-02-07  368  			=
	if (!offset_valid(skb, hoffset + tkey->at)) {
95b0d2dc13c7e7 net/sched/act_pedit.c Roman Mashak      2018-06-27  369  			=
		pr_info("tc action pedit 'at' offset %d out of bounds\n",
71d0ed7079dffb net/sched/act_pedit.c Amir Vadai        2017-02-07  370  			=
			hoffset + tkey->at);
95c2027bfeda21 net/sched/act_pedit.c Amir Vadai        2016-11-28  371  			=
		goto bad;
95c2027bfeda21 net/sched/act_pedit.c Amir Vadai        2016-11-28  372  			=
	}
80f0f574cc615b net/sched/act_pedit.c Roman Mashak      2018-06-27  373  			=
	d =3D skb_header_pointer(skb, hoffset + tkey->at,
6ff7586e382cb4 net/sched/act_pedit.c Roman Mashak      2018-06-27  374  			=
			       sizeof(_d), &_d);
db2c24175d149b net/sched/act_pedit.c Changli Gao       2010-06-02  375  			=
	if (!d)
^1da177e4c3f41 net/sched/pedit.c     Linus Torvalds    2005-04-16  376  			=
		goto bad;
db2c24175d149b net/sched/act_pedit.c Changli Gao       2010-06-02  377  			=
	offset +=3D (*d & tkey->offmask) >> tkey->shift;
^1da177e4c3f41 net/sched/pedit.c     Linus Torvalds    2005-04-16  378  			}
^1da177e4c3f41 net/sched/pedit.c     Linus Torvalds    2005-04-16  379  =

^1da177e4c3f41 net/sched/pedit.c     Linus Torvalds    2005-04-16  380  			=
if (offset % 4) {
95b0d2dc13c7e7 net/sched/act_pedit.c Roman Mashak      2018-06-27  381  			=
	pr_info("tc action pedit offset must be on 32 bit boundaries\n");
^1da177e4c3f41 net/sched/pedit.c     Linus Torvalds    2005-04-16  382  			=
	goto bad;
^1da177e4c3f41 net/sched/pedit.c     Linus Torvalds    2005-04-16  383  			}
95c2027bfeda21 net/sched/act_pedit.c Amir Vadai        2016-11-28  384  =

71d0ed7079dffb net/sched/act_pedit.c Amir Vadai        2017-02-07  385  			=
if (!offset_valid(skb, hoffset + offset)) {
95b0d2dc13c7e7 net/sched/act_pedit.c Roman Mashak      2018-06-27  386  			=
	pr_info("tc action pedit offset %d out of bounds\n",
71d0ed7079dffb net/sched/act_pedit.c Amir Vadai        2017-02-07  387  			=
		hoffset + offset);
^1da177e4c3f41 net/sched/pedit.c     Linus Torvalds    2005-04-16  388  			=
	goto bad;
^1da177e4c3f41 net/sched/pedit.c     Linus Torvalds    2005-04-16  389  			}
^1da177e4c3f41 net/sched/pedit.c     Linus Torvalds    2005-04-16  390  =

80f0f574cc615b net/sched/act_pedit.c Roman Mashak      2018-06-27  391  			=
ptr =3D skb_header_pointer(skb, hoffset + offset,
6ff7586e382cb4 net/sched/act_pedit.c Roman Mashak      2018-06-27  392  			=
			 sizeof(hdata), &hdata);
db2c24175d149b net/sched/act_pedit.c Changli Gao       2010-06-02  393  			=
if (!ptr)
db2c24175d149b net/sched/act_pedit.c Changli Gao       2010-06-02  394  			=
	goto bad;
^1da177e4c3f41 net/sched/pedit.c     Linus Torvalds    2005-04-16  395  			=
/* just do it, baby */
853a14ba4682f8 net/sched/act_pedit.c Amir Vadai        2017-02-07  396  			=
switch (cmd) {
853a14ba4682f8 net/sched/act_pedit.c Amir Vadai        2017-02-07  397  			=
case TCA_PEDIT_KEY_EX_CMD_SET:
853a14ba4682f8 net/sched/act_pedit.c Amir Vadai        2017-02-07  398  			=
	val =3D tkey->val;
853a14ba4682f8 net/sched/act_pedit.c Amir Vadai        2017-02-07  399  			=
	break;
853a14ba4682f8 net/sched/act_pedit.c Amir Vadai        2017-02-07  400  			=
case TCA_PEDIT_KEY_EX_CMD_ADD:
853a14ba4682f8 net/sched/act_pedit.c Amir Vadai        2017-02-07  401  			=
	val =3D (*ptr + tkey->val) & ~tkey->mask;
853a14ba4682f8 net/sched/act_pedit.c Amir Vadai        2017-02-07  402  			=
	break;
853a14ba4682f8 net/sched/act_pedit.c Amir Vadai        2017-02-07  403  			=
default:
95b0d2dc13c7e7 net/sched/act_pedit.c Roman Mashak      2018-06-27  404  			=
	pr_info("tc action pedit bad command (%d)\n",
853a14ba4682f8 net/sched/act_pedit.c Amir Vadai        2017-02-07  405  			=
		cmd);
853a14ba4682f8 net/sched/act_pedit.c Amir Vadai        2017-02-07  406  			=
	goto bad;
853a14ba4682f8 net/sched/act_pedit.c Amir Vadai        2017-02-07  407  			}
853a14ba4682f8 net/sched/act_pedit.c Amir Vadai        2017-02-07  408  =

853a14ba4682f8 net/sched/act_pedit.c Amir Vadai        2017-02-07  409  			=
*ptr =3D ((*ptr & tkey->mask) ^ val);
544377cd2545f3 net/sched/act_pedit.c Roman Mashak      2018-06-27  410  			=
if (ptr =3D=3D &hdata)
71d0ed7079dffb net/sched/act_pedit.c Amir Vadai        2017-02-07  411  			=
	skb_store_bits(skb, hoffset + offset, ptr, 4);
^1da177e4c3f41 net/sched/pedit.c     Linus Torvalds    2005-04-16  412  		}
^1da177e4c3f41 net/sched/pedit.c     Linus Torvalds    2005-04-16  413  =

^1da177e4c3f41 net/sched/pedit.c     Linus Torvalds    2005-04-16  414  		g=
oto done;
80f0f574cc615b net/sched/act_pedit.c Roman Mashak      2018-06-27  415  	} =
else {
6ff9c3644e72bf net/sched/act_pedit.c stephen hemminger 2010-05-12  416  		W=
ARN(1, "pedit BUG: index %d\n", p->tcf_index);
80f0f574cc615b net/sched/act_pedit.c Roman Mashak      2018-06-27  417  	}
^1da177e4c3f41 net/sched/pedit.c     Linus Torvalds    2005-04-16  418  =

^1da177e4c3f41 net/sched/pedit.c     Linus Torvalds    2005-04-16  419  bad:
e9ce1cd3cf6cf3 net/sched/act_pedit.c David S. Miller   2006-08-21  420  	p-=
>tcf_qstats.overlimits++;
^1da177e4c3f41 net/sched/pedit.c     Linus Torvalds    2005-04-16  421  don=
e:
bfe0d0298f2a67 net/sched/act_pedit.c Eric Dumazet      2011-01-09  422  	bs=
tats_update(&p->tcf_bstats, skb);
e9ce1cd3cf6cf3 net/sched/act_pedit.c David S. Miller   2006-08-21  423  	sp=
in_unlock(&p->tcf_lock);
e9ce1cd3cf6cf3 net/sched/act_pedit.c David S. Miller   2006-08-21  424  	re=
turn p->tcf_action;
^1da177e4c3f41 net/sched/pedit.c     Linus Torvalds    2005-04-16  425  }
^1da177e4c3f41 net/sched/pedit.c     Linus Torvalds    2005-04-16  426  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3173222597146010282==--

