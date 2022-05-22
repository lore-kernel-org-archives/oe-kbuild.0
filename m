Content-Type: multipart/mixed; boundary="===============4230400038294061043=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/marvell/octeontx2/nic/otx2_tc.c:363 otx2_tc_parse_actions() error: uninitialized symbol 'rate'.
Date: Sun, 22 May 2022 13:43:31 +0800
Message-ID: <202205221311.6ubyABuA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4230400038294061043==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Subbaraya Sundeep <sbhatta@marvell.com>
CC: Sunil Kovvuri Goutham <sgoutham@marvell.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   eaea45fc0e7b6ae439526b4a41d91230c8517336
commit: 68fbff68dbea35f9e6f7649dd22fce492a5aedac octeontx2-pf: Add police a=
ction for TC flower
date:   11 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 11 months ago
config: s390-randconfig-m031-20220522 (https://download.01.org/0day-ci/arch=
ive/20220522/202205221311.6ubyABuA-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/ethernet/marvell/octeontx2/nic/otx2_tc.c:363 otx2_tc_parse_acti=
ons() error: uninitialized symbol 'rate'.
drivers/net/ethernet/marvell/octeontx2/nic/otx2_tc.c:363 otx2_tc_parse_acti=
ons() error: uninitialized symbol 'burst'.

Old smatch warnings:
drivers/net/ethernet/marvell/octeontx2/nic/otx2_tc.c:364 otx2_tc_parse_acti=
ons() error: uninitialized symbol 'pps'.

vim +/rate +363 drivers/net/ethernet/marvell/octeontx2/nic/otx2_tc.c

68fbff68dbea35 Subbaraya Sundeep    2021-06-15  278  =

1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  279  static int otx2_tc_par=
se_actions(struct otx2_nic *nic,
1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  280  				 struct flow_actio=
n *flow_action,
5d2fdd86d51735 Subbaraya Sundeep    2021-06-15  281  				 struct npc_instal=
l_flow_req *req,
68fbff68dbea35 Subbaraya Sundeep    2021-06-15  282  				 struct flow_cls_o=
ffload *f,
68fbff68dbea35 Subbaraya Sundeep    2021-06-15  283  				 struct otx2_tc_fl=
ow *node)
1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  284  {
5d2fdd86d51735 Subbaraya Sundeep    2021-06-15  285  	struct netlink_ext_ac=
k *extack =3D f->common.extack;
1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  286  	struct flow_action_en=
try *act;
1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  287  	struct net_device *ta=
rget;
1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  288  	struct otx2_nic *priv;
68fbff68dbea35 Subbaraya Sundeep    2021-06-15  289  	u32 burst, mark =3D 0;
68fbff68dbea35 Subbaraya Sundeep    2021-06-15  290  	u8 nr_police =3D 0;
68fbff68dbea35 Subbaraya Sundeep    2021-06-15  291  	bool pps;
68fbff68dbea35 Subbaraya Sundeep    2021-06-15  292  	u64 rate;
1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  293  	int i;
1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  294  =

1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  295  	if (!flow_action_has_=
entries(flow_action)) {
5d2fdd86d51735 Subbaraya Sundeep    2021-06-15  296  		NL_SET_ERR_MSG_MOD(e=
xtack, "no tc actions specified");
1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  297  		return -EINVAL;
1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  298  	}
1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  299  =

1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  300  	flow_action_for_each(=
i, act, flow_action) {
1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  301  		switch (act->id) {
1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  302  		case FLOW_ACTION_DRO=
P:
1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  303  			req->op =3D NIX_RX_=
ACTIONOP_DROP;
1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  304  			return 0;
1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  305  		case FLOW_ACTION_ACC=
EPT:
1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  306  			req->op =3D NIX_RX_=
ACTION_DEFAULT;
1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  307  			return 0;
1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  308  		case FLOW_ACTION_RED=
IRECT_INGRESS:
1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  309  			target =3D act->dev;
1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  310  			priv =3D netdev_pri=
v(target);
1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  311  			/* npc_install_flow=
_req doesn't support passing a target pcifunc */
1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  312  			if (rvu_get_pf(nic-=
>pcifunc) !=3D rvu_get_pf(priv->pcifunc)) {
5d2fdd86d51735 Subbaraya Sundeep    2021-06-15  313  				NL_SET_ERR_MSG_MOD=
(extack,
5d2fdd86d51735 Subbaraya Sundeep    2021-06-15  314  						   "can't redire=
ct to other pf/vf");
1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  315  				return -EOPNOTSUPP;
1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  316  			}
1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  317  			req->vf =3D priv->p=
cifunc & RVU_PFVF_FUNC_MASK;
1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  318  			req->op =3D NIX_RX_=
ACTION_DEFAULT;
1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  319  			return 0;
1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  320  		case FLOW_ACTION_VLA=
N_POP:
1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  321  			req->vtag0_valid =
=3D true;
1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  322  			/* use RX_VTAG_TYPE=
7 which is initialized to strip vlan tag */
1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  323  			req->vtag0_type =3D=
 NIX_AF_LFX_RX_VTAG_TYPE7;
1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  324  			break;
68fbff68dbea35 Subbaraya Sundeep    2021-06-15  325  		case FLOW_ACTION_POL=
ICE:
68fbff68dbea35 Subbaraya Sundeep    2021-06-15  326  			/* Ingress ratelimi=
ting is not supported on OcteonTx2 */
68fbff68dbea35 Subbaraya Sundeep    2021-06-15  327  			if (is_dev_otx2(nic=
->pdev)) {
68fbff68dbea35 Subbaraya Sundeep    2021-06-15  328  				NL_SET_ERR_MSG_MOD=
(extack,
68fbff68dbea35 Subbaraya Sundeep    2021-06-15  329  					"Ingress policing=
 not supported on this platform");
68fbff68dbea35 Subbaraya Sundeep    2021-06-15  330  				return -EOPNOTSUPP;
68fbff68dbea35 Subbaraya Sundeep    2021-06-15  331  			}
68fbff68dbea35 Subbaraya Sundeep    2021-06-15  332  =

68fbff68dbea35 Subbaraya Sundeep    2021-06-15  333  			if (act->police.rat=
e_bytes_ps > 0) {
68fbff68dbea35 Subbaraya Sundeep    2021-06-15  334  				rate =3D act->poli=
ce.rate_bytes_ps * 8;
68fbff68dbea35 Subbaraya Sundeep    2021-06-15  335  				burst =3D act->pol=
ice.burst;
68fbff68dbea35 Subbaraya Sundeep    2021-06-15  336  			} else if (act->pol=
ice.rate_pkt_ps > 0) {
68fbff68dbea35 Subbaraya Sundeep    2021-06-15  337  				/* The algorithm u=
sed to calculate rate
68fbff68dbea35 Subbaraya Sundeep    2021-06-15  338  				 * mantissa, expon=
ent values for a given token
68fbff68dbea35 Subbaraya Sundeep    2021-06-15  339  				 * rate (token can=
 be byte or packet) requires
68fbff68dbea35 Subbaraya Sundeep    2021-06-15  340  				 * token rate to b=
e mutiplied by 8.
68fbff68dbea35 Subbaraya Sundeep    2021-06-15  341  				 */
68fbff68dbea35 Subbaraya Sundeep    2021-06-15  342  				rate =3D act->poli=
ce.rate_pkt_ps * 8;
68fbff68dbea35 Subbaraya Sundeep    2021-06-15  343  				burst =3D act->pol=
ice.burst_pkt;
68fbff68dbea35 Subbaraya Sundeep    2021-06-15  344  				pps =3D true;
68fbff68dbea35 Subbaraya Sundeep    2021-06-15  345  			}
68fbff68dbea35 Subbaraya Sundeep    2021-06-15  346  			nr_police++;
68fbff68dbea35 Subbaraya Sundeep    2021-06-15  347  			break;
68fbff68dbea35 Subbaraya Sundeep    2021-06-15  348  		case FLOW_ACTION_MAR=
K:
68fbff68dbea35 Subbaraya Sundeep    2021-06-15  349  			mark =3D act->mark;
68fbff68dbea35 Subbaraya Sundeep    2021-06-15  350  			break;
1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  351  		default:
1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  352  			return -EOPNOTSUPP;
1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  353  		}
1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  354  	}
1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  355  =

68fbff68dbea35 Subbaraya Sundeep    2021-06-15  356  	if (nr_police > 1) {
68fbff68dbea35 Subbaraya Sundeep    2021-06-15  357  		NL_SET_ERR_MSG_MOD(e=
xtack,
68fbff68dbea35 Subbaraya Sundeep    2021-06-15  358  				   "rate limit pol=
ice offload requires a single action");
68fbff68dbea35 Subbaraya Sundeep    2021-06-15  359  		return -EOPNOTSUPP;
68fbff68dbea35 Subbaraya Sundeep    2021-06-15  360  	}
68fbff68dbea35 Subbaraya Sundeep    2021-06-15  361  =

68fbff68dbea35 Subbaraya Sundeep    2021-06-15  362  	if (nr_police)
68fbff68dbea35 Subbaraya Sundeep    2021-06-15 @363  		return otx2_tc_act_s=
et_police(nic, node, f, rate, burst,
68fbff68dbea35 Subbaraya Sundeep    2021-06-15  364  					      mark, req, =
pps);
68fbff68dbea35 Subbaraya Sundeep    2021-06-15  365  =

1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  366  	return 0;
1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  367  }
1d4d9e42c2406b Naveen Mamindlapalli 2021-03-18  368  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4230400038294061043==--

