Content-Type: multipart/mixed; boundary="===============3771665164443390320=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/netfilter/nf_tables_api.c:9669 nft_verdict_init() warn: passing a valid pointer to 'PTR_ERR'
Date: Sun, 14 Aug 2022 23:28:02 +0800
Message-ID: <202208142304.8AJF9bcD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3771665164443390320==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
CC: Pablo Neira Ayuso <pablo@netfilter.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   aea23e7c464bfdec04b52cf61edb62030e9e0d0a
commit: 95f466d22364a33d183509629d0879885b4f547e netfilter: nf_tables: do n=
ot allow CHAIN_ID to refer to another table
date:   5 days ago
:::::: branch date: 15 hours ago
:::::: commit date: 5 days ago
config: nios2-randconfig-m031-20220814 (https://download.01.org/0day-ci/arc=
hive/20220814/202208142304.8AJF9bcD-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/netfilter/nf_tables_api.c:9669 nft_verdict_init() warn: passing a valid=
 pointer to 'PTR_ERR'

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:62 current_thread_info() error: uninit=
ialized symbol 'sp'.
net/netfilter/nf_tables_api.c:2526 nf_tables_newchain() warn: passing a val=
id pointer to 'PTR_ERR'
net/netfilter/nf_tables_api.c:3425 nf_tables_newrule() warn: passing a vali=
d pointer to 'PTR_ERR'
net/netfilter/nf_tables_api.c:3436 nf_tables_newrule() warn: passing a vali=
d pointer to 'PTR_ERR'
net/netfilter/nf_tables_api.c:3461 nf_tables_newrule() warn: passing a vali=
d pointer to 'PTR_ERR'
net/netfilter/nf_tables_api.c:4242 nf_tables_getset() warn: passing a valid=
 pointer to 'PTR_ERR'
net/netfilter/nf_tables_api.c:4468 nf_tables_newset() warn: passing a valid=
 pointer to 'PTR_ERR'
net/netfilter/nf_tables_api.c:4670 nf_tables_delset() warn: passing a valid=
 pointer to 'PTR_ERR'
net/netfilter/nf_tables_api.c:5363 nf_tables_getsetelem() warn: passing a v=
alid pointer to 'PTR_ERR'
net/netfilter/nf_tables_api.c:6514 nf_tables_delsetelem() warn: passing a v=
alid pointer to 'PTR_ERR'
net/netfilter/nf_tables_api.c:6843 nf_tables_newobj() warn: passing a valid=
 pointer to 'PTR_ERR'
net/netfilter/nf_tables_api.c:7646 nf_tables_newflowtable() warn: passing a=
 valid pointer to 'PTR_ERR'

vim +/PTR_ERR +9669 net/netfilter/nf_tables_api.c

20a69341f2d00c Patrick McHardy               2013-10-11  9626  =

20a69341f2d00c Patrick McHardy               2013-10-11  9627  static int n=
ft_verdict_init(const struct nft_ctx *ctx, struct nft_data *data,
20a69341f2d00c Patrick McHardy               2013-10-11  9628  			    struc=
t nft_data_desc *desc, const struct nlattr *nla)
20a69341f2d00c Patrick McHardy               2013-10-11  9629  {
664b0f8cd8c66d Pablo Neira Ayuso             2016-06-12  9630  	u8 genmask =
=3D nft_genmask_next(ctx->net);
20a69341f2d00c Patrick McHardy               2013-10-11  9631  	struct nlat=
tr *tb[NFTA_VERDICT_MAX + 1];
20a69341f2d00c Patrick McHardy               2013-10-11  9632  	struct nft_=
chain *chain;
20a69341f2d00c Patrick McHardy               2013-10-11  9633  	int err;
20a69341f2d00c Patrick McHardy               2013-10-11  9634  =

8cb081746c031f Johannes Berg                 2019-04-26  9635  	err =3D nla=
_parse_nested_deprecated(tb, NFTA_VERDICT_MAX, nla,
8cb081746c031f Johannes Berg                 2019-04-26  9636  					  nft_v=
erdict_policy, NULL);
20a69341f2d00c Patrick McHardy               2013-10-11  9637  	if (err < 0)
20a69341f2d00c Patrick McHardy               2013-10-11  9638  		return err;
20a69341f2d00c Patrick McHardy               2013-10-11  9639  =

20a69341f2d00c Patrick McHardy               2013-10-11  9640  	if (!tb[NFT=
A_VERDICT_CODE])
20a69341f2d00c Patrick McHardy               2013-10-11  9641  		return -EI=
NVAL;
1ca2e1702c050a Patrick McHardy               2015-04-11  9642  	data->verdi=
ct.code =3D ntohl(nla_get_be32(tb[NFTA_VERDICT_CODE]));
20a69341f2d00c Patrick McHardy               2013-10-11  9643  =

1ca2e1702c050a Patrick McHardy               2015-04-11  9644  	switch (dat=
a->verdict.code) {
e0abdadcc6e113 Patrick McHardy               2014-02-18  9645  	default:
1ca2e1702c050a Patrick McHardy               2015-04-11  9646  		switch (da=
ta->verdict.code & NF_VERDICT_MASK) {
20a69341f2d00c Patrick McHardy               2013-10-11  9647  		case NF_AC=
CEPT:
20a69341f2d00c Patrick McHardy               2013-10-11  9648  		case NF_DR=
OP:
20a69341f2d00c Patrick McHardy               2013-10-11  9649  		case NF_QU=
EUE:
e0abdadcc6e113 Patrick McHardy               2014-02-18  9650  			break;
e0abdadcc6e113 Patrick McHardy               2014-02-18  9651  		default:
e0abdadcc6e113 Patrick McHardy               2014-02-18  9652  			return -E=
INVAL;
e0abdadcc6e113 Patrick McHardy               2014-02-18  9653  		}
954d82979b2f9d Gustavo A. R. Silva           2020-07-08  9654  		fallthroug=
h;
20a69341f2d00c Patrick McHardy               2013-10-11  9655  	case NFT_CO=
NTINUE:
20a69341f2d00c Patrick McHardy               2013-10-11  9656  	case NFT_BR=
EAK:
20a69341f2d00c Patrick McHardy               2013-10-11  9657  	case NFT_RE=
TURN:
20a69341f2d00c Patrick McHardy               2013-10-11  9658  		break;
20a69341f2d00c Patrick McHardy               2013-10-11  9659  	case NFT_JU=
MP:
20a69341f2d00c Patrick McHardy               2013-10-11  9660  	case NFT_GO=
TO:
51d70f181ff4e2 Pablo Neira Ayuso             2020-06-30  9661  		if (tb[NFT=
A_VERDICT_CHAIN]) {
f102d66b335a41 Florian Westphal              2018-07-11  9662  			chain =3D=
 nft_chain_lookup(ctx->net, ctx->table,
51d70f181ff4e2 Pablo Neira Ayuso             2020-06-30  9663  						 tb[NF=
TA_VERDICT_CHAIN],
51d70f181ff4e2 Pablo Neira Ayuso             2020-06-30  9664  						 genma=
sk);
51d70f181ff4e2 Pablo Neira Ayuso             2020-06-30  9665  		} else if =
(tb[NFTA_VERDICT_CHAIN_ID]) {
95f466d22364a3 Thadeu Lima de Souza Cascardo 2022-08-09  9666  			chain =3D=
 nft_chain_lookup_byid(ctx->net, ctx->table,
51d70f181ff4e2 Pablo Neira Ayuso             2020-06-30  9667  						      =
tb[NFTA_VERDICT_CHAIN_ID]);
51d70f181ff4e2 Pablo Neira Ayuso             2020-06-30  9668  			if (IS_ER=
R(chain))
51d70f181ff4e2 Pablo Neira Ayuso             2020-06-30 @9669  				return P=
TR_ERR(chain);
51d70f181ff4e2 Pablo Neira Ayuso             2020-06-30  9670  		} else {
51d70f181ff4e2 Pablo Neira Ayuso             2020-06-30  9671  			return -E=
INVAL;
51d70f181ff4e2 Pablo Neira Ayuso             2020-06-30  9672  		}
51d70f181ff4e2 Pablo Neira Ayuso             2020-06-30  9673  =

20a69341f2d00c Patrick McHardy               2013-10-11  9674  		if (IS_ERR=
(chain))
20a69341f2d00c Patrick McHardy               2013-10-11  9675  			return PT=
R_ERR(chain);
f323d9546927a0 Pablo Neira Ayuso             2017-03-20  9676  		if (nft_is=
_base_chain(chain))
20a69341f2d00c Patrick McHardy               2013-10-11  9677  			return -E=
OPNOTSUPP;
96518518cc417b Patrick McHardy               2013-10-14  9678  =

96518518cc417b Patrick McHardy               2013-10-14  9679  		chain->use=
++;
1ca2e1702c050a Patrick McHardy               2015-04-11  9680  		data->verd=
ict.chain =3D chain;
96518518cc417b Patrick McHardy               2013-10-14  9681  		break;
96518518cc417b Patrick McHardy               2013-10-14  9682  	}
96518518cc417b Patrick McHardy               2013-10-14  9683  =

4c4ed0748f82e2 Florian Westphal              2015-04-14  9684  	desc->len =
=3D sizeof(data->verdict);
96518518cc417b Patrick McHardy               2013-10-14  9685  	desc->type =
=3D NFT_DATA_VERDICT;
96518518cc417b Patrick McHardy               2013-10-14  9686  	return 0;
96518518cc417b Patrick McHardy               2013-10-14  9687  }
96518518cc417b Patrick McHardy               2013-10-14  9688  =


:::::: The code at line 9669 was first introduced by commit
:::::: 51d70f181ff4e2c996ddf256af1efecd7d5864e5 netfilter: nf_tables: add N=
FTA_VERDICT_CHAIN_ID attribute

:::::: TO: Pablo Neira Ayuso <pablo@netfilter.org>
:::::: CC: Pablo Neira Ayuso <pablo@netfilter.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3771665164443390320==--

