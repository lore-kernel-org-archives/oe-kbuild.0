Content-Type: multipart/mixed; boundary="===============7660327628707411268=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 580/1375] drivers/powercap/dtpm.c:162 dtpm_update_power() warn: test_bit() takes a bit number
Date: Tue, 05 Jan 2021 08:51:33 +0800
Message-ID: <202101050827.XLL9ZhyA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7660327628707411268==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Daniel Lezcano <daniel.lezcano@linaro.org>
CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>
CC: Lukasz Luba <lukasz.luba@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   766eff5a4f6c1f2a8d5030727258d622f2f750fa
commit: a20d0ef97abf486a917aff066c457bdb930425af [580/1375] powercap/driver=
s/dtpm: Add API for dynamic thermal power management
:::::: branch date: 21 hours ago
:::::: commit date: 13 days ago
config: ia64-randconfig-m031-20210105 (attached as .config)
compiler: ia64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/powercap/dtpm.c:162 dtpm_update_power() warn: test_bit() takes a bi=
t number
drivers/powercap/dtpm.c:244 __set_power_limit_uw() warn: test_bit() takes a=
 bit number

Old smatch warnings:
drivers/powercap/dtpm.c:246 __set_power_limit_uw() warn: test_bit() takes a=
 bit number

vim +162 drivers/powercap/dtpm.c

a20d0ef97abf486 Daniel Lezcano 2020-12-08  136  =

a20d0ef97abf486 Daniel Lezcano 2020-12-08  137  /**
a20d0ef97abf486 Daniel Lezcano 2020-12-08  138   * dtpm_update_power - Upda=
te the power on the dtpm
a20d0ef97abf486 Daniel Lezcano 2020-12-08  139   * @dtpm: a pointer to a dt=
pm structure to update
a20d0ef97abf486 Daniel Lezcano 2020-12-08  140   * @power_min: a u64 repres=
enting the new power_min value
a20d0ef97abf486 Daniel Lezcano 2020-12-08  141   * @power_max: a u64 repres=
enting the new power_max value
a20d0ef97abf486 Daniel Lezcano 2020-12-08  142   *
a20d0ef97abf486 Daniel Lezcano 2020-12-08  143   * Function to update the p=
ower values of the dtpm node specified in
a20d0ef97abf486 Daniel Lezcano 2020-12-08  144   * parameter. These new val=
ues will be propagated to the tree.
a20d0ef97abf486 Daniel Lezcano 2020-12-08  145   *
a20d0ef97abf486 Daniel Lezcano 2020-12-08  146   * Return: zero on success,=
 -EINVAL if the values are inconsistent
a20d0ef97abf486 Daniel Lezcano 2020-12-08  147   */
a20d0ef97abf486 Daniel Lezcano 2020-12-08  148  int dtpm_update_power(struc=
t dtpm *dtpm, u64 power_min, u64 power_max)
a20d0ef97abf486 Daniel Lezcano 2020-12-08  149  {
a20d0ef97abf486 Daniel Lezcano 2020-12-08  150  	mutex_lock(&dtpm_lock);
a20d0ef97abf486 Daniel Lezcano 2020-12-08  151  =

a20d0ef97abf486 Daniel Lezcano 2020-12-08  152  	if (power_min =3D=3D dtpm-=
>power_min && power_max =3D=3D dtpm->power_max)
a20d0ef97abf486 Daniel Lezcano 2020-12-08  153  		return 0;
a20d0ef97abf486 Daniel Lezcano 2020-12-08  154  =

a20d0ef97abf486 Daniel Lezcano 2020-12-08  155  	if (power_max < power_min)
a20d0ef97abf486 Daniel Lezcano 2020-12-08  156  		return -EINVAL;
a20d0ef97abf486 Daniel Lezcano 2020-12-08  157  =

a20d0ef97abf486 Daniel Lezcano 2020-12-08  158  	__dtpm_sub_power(dtpm);
a20d0ef97abf486 Daniel Lezcano 2020-12-08  159  =

a20d0ef97abf486 Daniel Lezcano 2020-12-08  160  	dtpm->power_min =3D power_=
min;
a20d0ef97abf486 Daniel Lezcano 2020-12-08  161  	dtpm->power_max =3D power_=
max;
a20d0ef97abf486 Daniel Lezcano 2020-12-08 @162  	if (!test_bit(DTPM_POWER_L=
IMIT_FLAG, &dtpm->flags))
a20d0ef97abf486 Daniel Lezcano 2020-12-08  163  		dtpm->power_limit =3D pow=
er_max;
a20d0ef97abf486 Daniel Lezcano 2020-12-08  164  =

a20d0ef97abf486 Daniel Lezcano 2020-12-08  165  	__dtpm_add_power(dtpm);
a20d0ef97abf486 Daniel Lezcano 2020-12-08  166  =

a20d0ef97abf486 Daniel Lezcano 2020-12-08  167  	mutex_unlock(&dtpm_lock);
a20d0ef97abf486 Daniel Lezcano 2020-12-08  168  =

a20d0ef97abf486 Daniel Lezcano 2020-12-08  169  	return 0;
a20d0ef97abf486 Daniel Lezcano 2020-12-08  170  }
a20d0ef97abf486 Daniel Lezcano 2020-12-08  171  =

a20d0ef97abf486 Daniel Lezcano 2020-12-08  172  /**
a20d0ef97abf486 Daniel Lezcano 2020-12-08  173   * dtpm_release_zone - Clea=
nup when the node is released
a20d0ef97abf486 Daniel Lezcano 2020-12-08  174   * @pcz: a pointer to a pow=
ercap_zone structure
a20d0ef97abf486 Daniel Lezcano 2020-12-08  175   *
a20d0ef97abf486 Daniel Lezcano 2020-12-08  176   * Do some housecleaning an=
d update the weight on the tree. The
a20d0ef97abf486 Daniel Lezcano 2020-12-08  177   * release will be denied i=
f the node has children. This function must
a20d0ef97abf486 Daniel Lezcano 2020-12-08  178   * be called by the specifi=
c release callback of the different
a20d0ef97abf486 Daniel Lezcano 2020-12-08  179   * backends.
a20d0ef97abf486 Daniel Lezcano 2020-12-08  180   *
a20d0ef97abf486 Daniel Lezcano 2020-12-08  181   * Return: 0 on success, -E=
BUSY if there are children
a20d0ef97abf486 Daniel Lezcano 2020-12-08  182   */
a20d0ef97abf486 Daniel Lezcano 2020-12-08  183  int dtpm_release_zone(struc=
t powercap_zone *pcz)
a20d0ef97abf486 Daniel Lezcano 2020-12-08  184  {
a20d0ef97abf486 Daniel Lezcano 2020-12-08  185  	struct dtpm *dtpm =3D to_d=
tpm(pcz);
a20d0ef97abf486 Daniel Lezcano 2020-12-08  186  	struct dtpm *parent =3D dt=
pm->parent;
a20d0ef97abf486 Daniel Lezcano 2020-12-08  187  =

a20d0ef97abf486 Daniel Lezcano 2020-12-08  188  	mutex_lock(&dtpm_lock);
a20d0ef97abf486 Daniel Lezcano 2020-12-08  189  =

a20d0ef97abf486 Daniel Lezcano 2020-12-08  190  	if (!list_empty(&dtpm->chi=
ldren))
a20d0ef97abf486 Daniel Lezcano 2020-12-08  191  		return -EBUSY;
a20d0ef97abf486 Daniel Lezcano 2020-12-08  192  =

a20d0ef97abf486 Daniel Lezcano 2020-12-08  193  	if (parent)
a20d0ef97abf486 Daniel Lezcano 2020-12-08  194  		list_del(&dtpm->sibling);
a20d0ef97abf486 Daniel Lezcano 2020-12-08  195  =

a20d0ef97abf486 Daniel Lezcano 2020-12-08  196  	__dtpm_sub_power(dtpm);
a20d0ef97abf486 Daniel Lezcano 2020-12-08  197  =

a20d0ef97abf486 Daniel Lezcano 2020-12-08  198  	mutex_unlock(&dtpm_lock);
a20d0ef97abf486 Daniel Lezcano 2020-12-08  199  =

a20d0ef97abf486 Daniel Lezcano 2020-12-08  200  	if (dtpm->ops)
a20d0ef97abf486 Daniel Lezcano 2020-12-08  201  		dtpm->ops->release(dtpm);
a20d0ef97abf486 Daniel Lezcano 2020-12-08  202  =

a20d0ef97abf486 Daniel Lezcano 2020-12-08  203  	kfree(dtpm);
a20d0ef97abf486 Daniel Lezcano 2020-12-08  204  =

a20d0ef97abf486 Daniel Lezcano 2020-12-08  205  	return 0;
a20d0ef97abf486 Daniel Lezcano 2020-12-08  206  }
a20d0ef97abf486 Daniel Lezcano 2020-12-08  207  =

a20d0ef97abf486 Daniel Lezcano 2020-12-08  208  static int __get_power_limi=
t_uw(struct dtpm *dtpm, int cid, u64 *power_limit)
a20d0ef97abf486 Daniel Lezcano 2020-12-08  209  {
a20d0ef97abf486 Daniel Lezcano 2020-12-08  210  	*power_limit =3D dtpm->pow=
er_limit;
a20d0ef97abf486 Daniel Lezcano 2020-12-08  211  	return 0;
a20d0ef97abf486 Daniel Lezcano 2020-12-08  212  }
a20d0ef97abf486 Daniel Lezcano 2020-12-08  213  =

a20d0ef97abf486 Daniel Lezcano 2020-12-08  214  static int get_power_limit_=
uw(struct powercap_zone *pcz,
a20d0ef97abf486 Daniel Lezcano 2020-12-08  215  			      int cid, u64 *powe=
r_limit)
a20d0ef97abf486 Daniel Lezcano 2020-12-08  216  {
a20d0ef97abf486 Daniel Lezcano 2020-12-08  217  	struct dtpm *dtpm =3D to_d=
tpm(pcz);
a20d0ef97abf486 Daniel Lezcano 2020-12-08  218  	int ret;
a20d0ef97abf486 Daniel Lezcano 2020-12-08  219  =

a20d0ef97abf486 Daniel Lezcano 2020-12-08  220  	mutex_lock(&dtpm_lock);
a20d0ef97abf486 Daniel Lezcano 2020-12-08  221  	ret =3D __get_power_limit_=
uw(dtpm, cid, power_limit);
a20d0ef97abf486 Daniel Lezcano 2020-12-08  222  	mutex_unlock(&dtpm_lock);
a20d0ef97abf486 Daniel Lezcano 2020-12-08  223  =

a20d0ef97abf486 Daniel Lezcano 2020-12-08  224  	return ret;
a20d0ef97abf486 Daniel Lezcano 2020-12-08  225  }
a20d0ef97abf486 Daniel Lezcano 2020-12-08  226  =

a20d0ef97abf486 Daniel Lezcano 2020-12-08  227  /*
a20d0ef97abf486 Daniel Lezcano 2020-12-08  228   * Set the power limit on t=
he nodes, the power limit is distributed
a20d0ef97abf486 Daniel Lezcano 2020-12-08  229   * given the weight of the =
children.
a20d0ef97abf486 Daniel Lezcano 2020-12-08  230   *
a20d0ef97abf486 Daniel Lezcano 2020-12-08  231   * The dtpm node lock must =
be held when calling this function.
a20d0ef97abf486 Daniel Lezcano 2020-12-08  232   */
a20d0ef97abf486 Daniel Lezcano 2020-12-08  233  static int __set_power_limi=
t_uw(struct dtpm *dtpm, int cid, u64 power_limit)
a20d0ef97abf486 Daniel Lezcano 2020-12-08  234  {
a20d0ef97abf486 Daniel Lezcano 2020-12-08  235  	struct dtpm *child;
a20d0ef97abf486 Daniel Lezcano 2020-12-08  236  	int ret =3D 0;
a20d0ef97abf486 Daniel Lezcano 2020-12-08  237  	u64 power;
a20d0ef97abf486 Daniel Lezcano 2020-12-08  238  =

a20d0ef97abf486 Daniel Lezcano 2020-12-08  239  	/*
a20d0ef97abf486 Daniel Lezcano 2020-12-08  240  	 * A max power limitation =
means we remove the power limit,
a20d0ef97abf486 Daniel Lezcano 2020-12-08  241  	 * otherwise we set a cons=
traint and flag the dtpm node.
a20d0ef97abf486 Daniel Lezcano 2020-12-08  242  	 */
a20d0ef97abf486 Daniel Lezcano 2020-12-08  243  	if (power_limit =3D=3D dtp=
m->power_max) {
a20d0ef97abf486 Daniel Lezcano 2020-12-08 @244  		clear_bit(DTPM_POWER_LIMI=
T_FLAG, &dtpm->flags);
a20d0ef97abf486 Daniel Lezcano 2020-12-08  245  	} else {
a20d0ef97abf486 Daniel Lezcano 2020-12-08  246  		set_bit(DTPM_POWER_LIMIT_=
FLAG, &dtpm->flags);
a20d0ef97abf486 Daniel Lezcano 2020-12-08  247  	}
a20d0ef97abf486 Daniel Lezcano 2020-12-08  248  =

a20d0ef97abf486 Daniel Lezcano 2020-12-08  249  	pr_debug("Setting power li=
mit for '%s': %llu uW\n",
a20d0ef97abf486 Daniel Lezcano 2020-12-08  250  		 dtpm->zone.name, power_l=
imit);
a20d0ef97abf486 Daniel Lezcano 2020-12-08  251  =

a20d0ef97abf486 Daniel Lezcano 2020-12-08  252  	/*
a20d0ef97abf486 Daniel Lezcano 2020-12-08  253  	 * Only leaves of the dtpm=
 tree has ops to get/set the power
a20d0ef97abf486 Daniel Lezcano 2020-12-08  254  	 */
a20d0ef97abf486 Daniel Lezcano 2020-12-08  255  	if (dtpm->ops) {
a20d0ef97abf486 Daniel Lezcano 2020-12-08  256  		dtpm->power_limit =3D dtp=
m->ops->set_power_uw(dtpm, power_limit);
a20d0ef97abf486 Daniel Lezcano 2020-12-08  257  	} else {
a20d0ef97abf486 Daniel Lezcano 2020-12-08  258  		dtpm->power_limit =3D 0;
a20d0ef97abf486 Daniel Lezcano 2020-12-08  259  =

a20d0ef97abf486 Daniel Lezcano 2020-12-08  260  		list_for_each_entry(child=
, &dtpm->children, sibling) {
a20d0ef97abf486 Daniel Lezcano 2020-12-08  261  =

a20d0ef97abf486 Daniel Lezcano 2020-12-08  262  			/*
a20d0ef97abf486 Daniel Lezcano 2020-12-08  263  			 * Integer division roun=
ding will inevitably
a20d0ef97abf486 Daniel Lezcano 2020-12-08  264  			 * lead to a different m=
in or max value when
a20d0ef97abf486 Daniel Lezcano 2020-12-08  265  			 * set several times. In=
 order to restore the
a20d0ef97abf486 Daniel Lezcano 2020-12-08  266  			 * initial value, we for=
ce the child's min or
a20d0ef97abf486 Daniel Lezcano 2020-12-08  267  			 * max power every time =
if the constraint is
a20d0ef97abf486 Daniel Lezcano 2020-12-08  268  			 * at the boundaries.
a20d0ef97abf486 Daniel Lezcano 2020-12-08  269  			 */
a20d0ef97abf486 Daniel Lezcano 2020-12-08  270  			if (power_limit =3D=3D d=
tpm->power_max) {
a20d0ef97abf486 Daniel Lezcano 2020-12-08  271  				power =3D child->power_=
max;
a20d0ef97abf486 Daniel Lezcano 2020-12-08  272  			} else if (power_limit =
=3D=3D dtpm->power_min) {
a20d0ef97abf486 Daniel Lezcano 2020-12-08  273  				power =3D child->power_=
min;
a20d0ef97abf486 Daniel Lezcano 2020-12-08  274  			} else {
a20d0ef97abf486 Daniel Lezcano 2020-12-08  275  				power =3D DIV_ROUND_CLO=
SEST(
a20d0ef97abf486 Daniel Lezcano 2020-12-08  276  					power_limit * child->w=
eight, 1024);
a20d0ef97abf486 Daniel Lezcano 2020-12-08  277  			}
a20d0ef97abf486 Daniel Lezcano 2020-12-08  278  =

a20d0ef97abf486 Daniel Lezcano 2020-12-08  279  			pr_debug("Setting power =
limit for '%s': %llu uW\n",
a20d0ef97abf486 Daniel Lezcano 2020-12-08  280  				 child->zone.name, powe=
r);
a20d0ef97abf486 Daniel Lezcano 2020-12-08  281  =

a20d0ef97abf486 Daniel Lezcano 2020-12-08  282  			ret =3D __set_power_limi=
t_uw(child, cid, power);
a20d0ef97abf486 Daniel Lezcano 2020-12-08  283  			if (!ret)
a20d0ef97abf486 Daniel Lezcano 2020-12-08  284  				ret =3D __get_power_lim=
it_uw(child, cid, &power);
a20d0ef97abf486 Daniel Lezcano 2020-12-08  285  =

a20d0ef97abf486 Daniel Lezcano 2020-12-08  286  			if (ret)
a20d0ef97abf486 Daniel Lezcano 2020-12-08  287  				break;
a20d0ef97abf486 Daniel Lezcano 2020-12-08  288  =

a20d0ef97abf486 Daniel Lezcano 2020-12-08  289  			dtpm->power_limit +=3D p=
ower;
a20d0ef97abf486 Daniel Lezcano 2020-12-08  290  		}
a20d0ef97abf486 Daniel Lezcano 2020-12-08  291  	}
a20d0ef97abf486 Daniel Lezcano 2020-12-08  292  =

a20d0ef97abf486 Daniel Lezcano 2020-12-08  293  	return ret;
a20d0ef97abf486 Daniel Lezcano 2020-12-08  294  }
a20d0ef97abf486 Daniel Lezcano 2020-12-08  295  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7660327628707411268==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
kUZDwDOpiX504g/cBtli/xenW/7dwy0BAA==
--===============7660327628707411268==--

