Content-Type: multipart/mixed; boundary="===============4948318995040772445=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/core/flow_offload.c:254:26: warning: Parameter 'cb' can be declared with const [constParameter]
Date: Sun, 12 Jun 2022 13:08:10 +0800
Message-ID: <202206121301.VL3Ddb8j-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4948318995040772445==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: net/core/=
flow_offload.c:254:26: warning: Parameter 'cb' can be declared with const [=
constParameter]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Baowen Zheng <baowen.zheng@corigine.com>
CC: Louis Peens <louis.peens@corigine.com>
CC: Simon Horman <simon.horman@corigine.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7a68065eb9cd194cf03f135c9211eeb2d5c4c0a0
commit: 8cbfe939abe905280279e84a297b1cb34e0d0ec9 flow_offload: allow user t=
o offload tc action to net device
date:   6 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 6 months ago
compiler: powerpc-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 8cbfe939abe905280279e84a297b1cb34e0d0ec9
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> net/core/flow_offload.c:254:26: warning: Parameter 'cb' can be declared =
with const [constParameter]
           flow_setup_cb_t *cb, void *cb_ident)
                            ^
>> net/core/flow_offload.c:254:36: warning: Parameter 'cb_ident' can be dec=
lared with const [constParameter]
           flow_setup_cb_t *cb, void *cb_ident)
                                      ^
   net/core/flow_offload.c:286:45: warning: Parameter 'cb' can be declared =
with const [constParameter]
   bool flow_block_cb_is_busy(flow_setup_cb_t *cb, void *cb_ident,
                                               ^
   net/core/flow_offload.c:286:55: warning: Parameter 'cb_ident' can be dec=
lared with const [constParameter]
   bool flow_block_cb_is_busy(flow_setup_cb_t *cb, void *cb_ident,
                                                         ^
>> net/core/flow_offload.c:424:46: warning: Parameter 'release' can be decl=
ared with const [constParameter]
   static void __flow_block_indr_cleanup(void (*release)(void *cb_priv),
                                                ^
>> net/core/flow_offload.c:425:17: warning: Parameter 'cb_priv' can be decl=
ared with const [constParameter]
             void *cb_priv,
                   ^
   net/core/flow_offload.c:447:58: warning: Parameter 'cb' can be declared =
with const [constParameter]
   void flow_indr_dev_unregister(flow_indr_block_bind_cb_t *cb, void *cb_pr=
iv,
                                                            ^
>> net/core/flow_offload.c:514:57: warning: Parameter 'data' can be declare=
d with const [constParameter]
   static struct flow_indir_dev_info *find_indir_dev(void *data)
                                                           ^
>> net/core/flow_offload.c:402:17: warning: Uninitialized variable: indr_de=
v->cb [uninitvar]
     if (indr_dev->cb =3D=3D cb &&
                   ^
>> net/core/flow_offload.c:519:12: warning: Uninitialized variable: cur->da=
ta [uninitvar]
     if (cur->data =3D=3D data)
              ^

vim +/cb +254 net/core/flow_offload.c

d63db30c8537ba Pablo Neira Ayuso 2019-07-09  252  =

14bfb13f0ed525 Pablo Neira Ayuso 2019-07-19  253  struct flow_block_cb *flo=
w_block_cb_lookup(struct flow_block *block,
a7323311515d48 Pablo Neira Ayuso 2019-07-19 @254  					   flow_setup_cb_t *=
cb, void *cb_ident)
da3eeb904ff432 Pablo Neira Ayuso 2019-07-09  255  {
da3eeb904ff432 Pablo Neira Ayuso 2019-07-09  256  	struct flow_block_cb *bl=
ock_cb;
da3eeb904ff432 Pablo Neira Ayuso 2019-07-09  257  =

14bfb13f0ed525 Pablo Neira Ayuso 2019-07-19  258  	list_for_each_entry(bloc=
k_cb, &block->cb_list, list) {
0c7294ddae73ad Pablo Neira Ayuso 2019-07-19  259  		if (block_cb->cb =3D=3D=
 cb &&
da3eeb904ff432 Pablo Neira Ayuso 2019-07-09  260  		    block_cb->cb_ident =
=3D=3D cb_ident)
da3eeb904ff432 Pablo Neira Ayuso 2019-07-09  261  			return block_cb;
da3eeb904ff432 Pablo Neira Ayuso 2019-07-09  262  	}
da3eeb904ff432 Pablo Neira Ayuso 2019-07-09  263  =

da3eeb904ff432 Pablo Neira Ayuso 2019-07-09  264  	return NULL;
da3eeb904ff432 Pablo Neira Ayuso 2019-07-09  265  }
da3eeb904ff432 Pablo Neira Ayuso 2019-07-09  266  EXPORT_SYMBOL(flow_block_=
cb_lookup);
da3eeb904ff432 Pablo Neira Ayuso 2019-07-09  267  =

67bd0d5ea7974d Pablo Neira Ayuso 2019-07-09  268  void *flow_block_cb_priv(=
struct flow_block_cb *block_cb)
67bd0d5ea7974d Pablo Neira Ayuso 2019-07-09  269  {
67bd0d5ea7974d Pablo Neira Ayuso 2019-07-09  270  	return block_cb->cb_priv;
67bd0d5ea7974d Pablo Neira Ayuso 2019-07-09  271  }
67bd0d5ea7974d Pablo Neira Ayuso 2019-07-09  272  EXPORT_SYMBOL(flow_block_=
cb_priv);
67bd0d5ea7974d Pablo Neira Ayuso 2019-07-09  273  =

67bd0d5ea7974d Pablo Neira Ayuso 2019-07-09  274  void flow_block_cb_incref=
(struct flow_block_cb *block_cb)
67bd0d5ea7974d Pablo Neira Ayuso 2019-07-09  275  {
67bd0d5ea7974d Pablo Neira Ayuso 2019-07-09  276  	block_cb->refcnt++;
67bd0d5ea7974d Pablo Neira Ayuso 2019-07-09  277  }
67bd0d5ea7974d Pablo Neira Ayuso 2019-07-09  278  EXPORT_SYMBOL(flow_block_=
cb_incref);
67bd0d5ea7974d Pablo Neira Ayuso 2019-07-09  279  =

67bd0d5ea7974d Pablo Neira Ayuso 2019-07-09  280  unsigned int flow_block_c=
b_decref(struct flow_block_cb *block_cb)
67bd0d5ea7974d Pablo Neira Ayuso 2019-07-09  281  {
67bd0d5ea7974d Pablo Neira Ayuso 2019-07-09  282  	return --block_cb->refcn=
t;
67bd0d5ea7974d Pablo Neira Ayuso 2019-07-09  283  }
67bd0d5ea7974d Pablo Neira Ayuso 2019-07-09  284  EXPORT_SYMBOL(flow_block_=
cb_decref);
67bd0d5ea7974d Pablo Neira Ayuso 2019-07-09  285  =

a7323311515d48 Pablo Neira Ayuso 2019-07-19  286  bool flow_block_cb_is_bus=
y(flow_setup_cb_t *cb, void *cb_ident,
0d4fd02e7199fb Pablo Neira Ayuso 2019-07-09  287  			   struct list_head *d=
river_block_list)
0d4fd02e7199fb Pablo Neira Ayuso 2019-07-09  288  {
0d4fd02e7199fb Pablo Neira Ayuso 2019-07-09  289  	struct flow_block_cb *bl=
ock_cb;
0d4fd02e7199fb Pablo Neira Ayuso 2019-07-09  290  =

0d4fd02e7199fb Pablo Neira Ayuso 2019-07-09  291  	list_for_each_entry(bloc=
k_cb, driver_block_list, driver_list) {
0d4fd02e7199fb Pablo Neira Ayuso 2019-07-09  292  		if (block_cb->cb =3D=3D=
 cb &&
0d4fd02e7199fb Pablo Neira Ayuso 2019-07-09  293  		    block_cb->cb_ident =
=3D=3D cb_ident)
0d4fd02e7199fb Pablo Neira Ayuso 2019-07-09  294  			return true;
0d4fd02e7199fb Pablo Neira Ayuso 2019-07-09  295  	}
0d4fd02e7199fb Pablo Neira Ayuso 2019-07-09  296  =

0d4fd02e7199fb Pablo Neira Ayuso 2019-07-09  297  	return false;
0d4fd02e7199fb Pablo Neira Ayuso 2019-07-09  298  }
0d4fd02e7199fb Pablo Neira Ayuso 2019-07-09  299  EXPORT_SYMBOL(flow_block_=
cb_is_busy);
0d4fd02e7199fb Pablo Neira Ayuso 2019-07-09  300  =

4e95bc268b915c Pablo Neira Ayuso 2019-07-09  301  int flow_block_cb_setup_s=
imple(struct flow_block_offload *f,
4e95bc268b915c Pablo Neira Ayuso 2019-07-09  302  			       struct list_hea=
d *driver_block_list,
a7323311515d48 Pablo Neira Ayuso 2019-07-19  303  			       flow_setup_cb_t=
 *cb,
a7323311515d48 Pablo Neira Ayuso 2019-07-19  304  			       void *cb_ident,=
 void *cb_priv,
4e95bc268b915c Pablo Neira Ayuso 2019-07-09  305  			       bool ingress_on=
ly)
4e95bc268b915c Pablo Neira Ayuso 2019-07-09  306  {
955bcb6ea0df0d Pablo Neira Ayuso 2019-07-09  307  	struct flow_block_cb *bl=
ock_cb;
955bcb6ea0df0d Pablo Neira Ayuso 2019-07-09  308  =

4e95bc268b915c Pablo Neira Ayuso 2019-07-09  309  	if (ingress_only &&
32f8c4093ac353 Pablo Neira Ayuso 2019-07-09  310  	    f->binder_type !=3D =
FLOW_BLOCK_BINDER_TYPE_CLSACT_INGRESS)
4e95bc268b915c Pablo Neira Ayuso 2019-07-09  311  		return -EOPNOTSUPP;
4e95bc268b915c Pablo Neira Ayuso 2019-07-09  312  =

4e95bc268b915c Pablo Neira Ayuso 2019-07-09  313  	f->driver_block_list =3D=
 driver_block_list;
4e95bc268b915c Pablo Neira Ayuso 2019-07-09  314  =

4e95bc268b915c Pablo Neira Ayuso 2019-07-09  315  	switch (f->command) {
9c0e189ec988f3 Pablo Neira Ayuso 2019-07-09  316  	case FLOW_BLOCK_BIND:
0d4fd02e7199fb Pablo Neira Ayuso 2019-07-09  317  		if (flow_block_cb_is_bu=
sy(cb, cb_ident, driver_block_list))
0d4fd02e7199fb Pablo Neira Ayuso 2019-07-09  318  			return -EBUSY;
0d4fd02e7199fb Pablo Neira Ayuso 2019-07-09  319  =

0c7294ddae73ad Pablo Neira Ayuso 2019-07-19  320  		block_cb =3D flow_block=
_cb_alloc(cb, cb_ident, cb_priv, NULL);
955bcb6ea0df0d Pablo Neira Ayuso 2019-07-09  321  		if (IS_ERR(block_cb))
955bcb6ea0df0d Pablo Neira Ayuso 2019-07-09  322  			return PTR_ERR(block_c=
b);
955bcb6ea0df0d Pablo Neira Ayuso 2019-07-09  323  =

955bcb6ea0df0d Pablo Neira Ayuso 2019-07-09  324  		flow_block_cb_add(block=
_cb, f);
955bcb6ea0df0d Pablo Neira Ayuso 2019-07-09  325  		list_add_tail(&block_cb=
->driver_list, driver_block_list);
955bcb6ea0df0d Pablo Neira Ayuso 2019-07-09  326  		return 0;
9c0e189ec988f3 Pablo Neira Ayuso 2019-07-09  327  	case FLOW_BLOCK_UNBIND:
14bfb13f0ed525 Pablo Neira Ayuso 2019-07-19  328  		block_cb =3D flow_block=
_cb_lookup(f->block, cb, cb_ident);
955bcb6ea0df0d Pablo Neira Ayuso 2019-07-09  329  		if (!block_cb)
955bcb6ea0df0d Pablo Neira Ayuso 2019-07-09  330  			return -ENOENT;
955bcb6ea0df0d Pablo Neira Ayuso 2019-07-09  331  =

955bcb6ea0df0d Pablo Neira Ayuso 2019-07-09  332  		flow_block_cb_remove(bl=
ock_cb, f);
955bcb6ea0df0d Pablo Neira Ayuso 2019-07-09  333  		list_del(&block_cb->dri=
ver_list);
4e95bc268b915c Pablo Neira Ayuso 2019-07-09  334  		return 0;
4e95bc268b915c Pablo Neira Ayuso 2019-07-09  335  	default:
4e95bc268b915c Pablo Neira Ayuso 2019-07-09  336  		return -EOPNOTSUPP;
4e95bc268b915c Pablo Neira Ayuso 2019-07-09  337  	}
4e95bc268b915c Pablo Neira Ayuso 2019-07-09  338  }
4e95bc268b915c Pablo Neira Ayuso 2019-07-09  339  EXPORT_SYMBOL(flow_block_=
cb_setup_simple);
4e481908c51bf0 wenxu             2019-08-07  340  =

1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  341  static DEFINE_MUTEX(flow_=
indr_block_lock);
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  342  static LIST_HEAD(flow_blo=
ck_indr_list);
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  343  static LIST_HEAD(flow_blo=
ck_indr_dev_list);
74fc4f828769cc Eli Cohen         2021-08-17  344  static LIST_HEAD(flow_ind=
ir_dev_list);
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  345  =

1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  346  struct flow_indr_dev {
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  347  	struct list_head		list;
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  348  	flow_indr_block_bind_cb_=
t	*cb;
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  349  	void				*cb_priv;
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  350  	refcount_t			refcnt;
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  351  };
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  352  =

1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  353  static struct flow_indr_d=
ev *flow_indr_dev_alloc(flow_indr_block_bind_cb_t *cb,
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  354  						 void *cb_priv)
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  355  {
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  356  	struct flow_indr_dev *in=
dr_dev;
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  357  =

1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  358  	indr_dev =3D kmalloc(siz=
eof(*indr_dev), GFP_KERNEL);
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  359  	if (!indr_dev)
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  360  		return NULL;
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  361  =

1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  362  	indr_dev->cb		=3D cb;
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  363  	indr_dev->cb_priv	=3D cb=
_priv;
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  364  	refcount_set(&indr_dev->=
refcnt, 1);
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  365  =

1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  366  	return indr_dev;
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  367  }
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  368  =

74fc4f828769cc Eli Cohen         2021-08-17  369  struct flow_indir_dev_inf=
o {
74fc4f828769cc Eli Cohen         2021-08-17  370  	void *data;
74fc4f828769cc Eli Cohen         2021-08-17  371  	struct net_device *dev;
74fc4f828769cc Eli Cohen         2021-08-17  372  	struct Qdisc *sch;
74fc4f828769cc Eli Cohen         2021-08-17  373  	enum tc_setup_type type;
74fc4f828769cc Eli Cohen         2021-08-17  374  	void (*cleanup)(struct f=
low_block_cb *block_cb);
74fc4f828769cc Eli Cohen         2021-08-17  375  	struct list_head list;
74fc4f828769cc Eli Cohen         2021-08-17  376  	enum flow_block_command =
command;
74fc4f828769cc Eli Cohen         2021-08-17  377  	enum flow_block_binder_t=
ype binder_type;
74fc4f828769cc Eli Cohen         2021-08-17  378  	struct list_head *cb_lis=
t;
74fc4f828769cc Eli Cohen         2021-08-17  379  };
74fc4f828769cc Eli Cohen         2021-08-17  380  =

74fc4f828769cc Eli Cohen         2021-08-17  381  static void existing_qdis=
cs_register(flow_indr_block_bind_cb_t *cb, void *cb_priv)
74fc4f828769cc Eli Cohen         2021-08-17  382  {
74fc4f828769cc Eli Cohen         2021-08-17  383  	struct flow_block_offloa=
d bo;
74fc4f828769cc Eli Cohen         2021-08-17  384  	struct flow_indir_dev_in=
fo *cur;
74fc4f828769cc Eli Cohen         2021-08-17  385  =

74fc4f828769cc Eli Cohen         2021-08-17  386  	list_for_each_entry(cur,=
 &flow_indir_dev_list, list) {
74fc4f828769cc Eli Cohen         2021-08-17  387  		memset(&bo, 0, sizeof(b=
o));
74fc4f828769cc Eli Cohen         2021-08-17  388  		bo.command =3D cur->com=
mand;
74fc4f828769cc Eli Cohen         2021-08-17  389  		bo.binder_type =3D cur-=
>binder_type;
74fc4f828769cc Eli Cohen         2021-08-17  390  		INIT_LIST_HEAD(&bo.cb_l=
ist);
74fc4f828769cc Eli Cohen         2021-08-17  391  		cb(cur->dev, cur->sch, =
cb_priv, cur->type, &bo, cur->data, cur->cleanup);
74fc4f828769cc Eli Cohen         2021-08-17  392  		list_splice(&bo.cb_list=
, cur->cb_list);
74fc4f828769cc Eli Cohen         2021-08-17  393  	}
74fc4f828769cc Eli Cohen         2021-08-17  394  }
74fc4f828769cc Eli Cohen         2021-08-17  395  =

1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  396  int flow_indr_dev_registe=
r(flow_indr_block_bind_cb_t *cb, void *cb_priv)
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  397  {
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  398  	struct flow_indr_dev *in=
dr_dev;
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  399  =

1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  400  	mutex_lock(&flow_indr_bl=
ock_lock);
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  401  	list_for_each_entry(indr=
_dev, &flow_block_indr_dev_list, list) {
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29 @402  		if (indr_dev->cb =3D=3D=
 cb &&
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  403  		    indr_dev->cb_priv =
=3D=3D cb_priv) {
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  404  			refcount_inc(&indr_dev=
->refcnt);
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  405  			mutex_unlock(&flow_ind=
r_block_lock);
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  406  			return 0;
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  407  		}
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  408  	}
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  409  =

1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  410  	indr_dev =3D flow_indr_d=
ev_alloc(cb, cb_priv);
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  411  	if (!indr_dev) {
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  412  		mutex_unlock(&flow_indr=
_block_lock);
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  413  		return -ENOMEM;
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  414  	}
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  415  =

1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  416  	list_add(&indr_dev->list=
, &flow_block_indr_dev_list);
74fc4f828769cc Eli Cohen         2021-08-17  417  	existing_qdiscs_register=
(cb, cb_priv);
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  418  	mutex_unlock(&flow_indr_=
block_lock);
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  419  =

1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  420  	return 0;
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  421  }
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  422  EXPORT_SYMBOL(flow_indr_d=
ev_register);
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  423  =

a1db217861f33b wenxu             2020-06-18 @424  static void __flow_block_=
indr_cleanup(void (*release)(void *cb_priv),
a1db217861f33b wenxu             2020-06-18 @425  				      void *cb_priv,
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  426  				      struct list_hea=
d *cleanup_list)
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  427  {
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  428  	struct flow_block_cb *th=
is, *next;
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  429  =

1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  430  	list_for_each_entry_safe=
(this, next, &flow_block_indr_list, indr.list) {
a1db217861f33b wenxu             2020-06-18  431  		if (this->release =3D=
=3D release &&
5137d303659d8c Chris Mi          2020-12-08  432  		    this->indr.cb_priv =
=3D=3D cb_priv)
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  433  			list_move(&this->indr.=
list, cleanup_list);
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  434  	}
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  435  }
1fac52da5942c5 Pablo Neira Ayuso 2020-05-29  436  =


:::::: The code at line 254 was first introduced by commit
:::::: a7323311515d488b7714bb7504a1d50fabb0bfcf net: flow_offload: rename t=
c_setup_cb_t to flow_setup_cb_t

:::::: TO: Pablo Neira Ayuso <pablo@netfilter.org>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4948318995040772445==--

