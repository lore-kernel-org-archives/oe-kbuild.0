Content-Type: multipart/mixed; boundary="===============8305630674082854200=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [linux-next:master 7513/7905] drivers/net/dsa/sja1105/sja1105_vl.c:447:21-22: ERROR: invalid reference to the index variable of the iterator on line 436
Date: Sun, 10 May 2020 07:08:05 +0800
Message-ID: <202005100702.AGgW8hXF%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8305630674082854200==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Vladimir Oltean <vladimir.oltean@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   30e2206e11ce27ae910cc0dab21472429e400a87
commit: 834f8933d5ddd732274cb6050252bd1c7cc7349d [7513/7905] net: dsa: sja1=
105: implement tc-gate using time-triggered virtual links
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


coccinelle warnings: (new ones prefixed by >>)

>> drivers/net/dsa/sja1105/sja1105_vl.c:447:21-22: ERROR: invalid reference=
 to the index variable of the iterator on line 436

# https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3D834f8933d5ddd732274cb6050252bd1c7cc7349d
git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/n=
ext/linux-next.git
git remote update linux-next
git checkout 834f8933d5ddd732274cb6050252bd1c7cc7349d
vim +447 drivers/net/dsa/sja1105/sja1105_vl.c

834f8933d5ddd7 Vladimir Oltean 2020-05-05  413  =

834f8933d5ddd7 Vladimir Oltean 2020-05-05  414  /* Insert into the global g=
ate list, sorted by gate action time. */
834f8933d5ddd7 Vladimir Oltean 2020-05-05  415  static int sja1105_insert_g=
ate_entry(struct sja1105_gating_config *gating_cfg,
834f8933d5ddd7 Vladimir Oltean 2020-05-05  416  				     struct sja1105_rul=
e *rule,
834f8933d5ddd7 Vladimir Oltean 2020-05-05  417  				     u8 gate_state, s64=
 entry_time,
834f8933d5ddd7 Vladimir Oltean 2020-05-05  418  				     struct netlink_ext=
_ack *extack)
834f8933d5ddd7 Vladimir Oltean 2020-05-05  419  {
834f8933d5ddd7 Vladimir Oltean 2020-05-05  420  	struct sja1105_gate_entry =
*e;
834f8933d5ddd7 Vladimir Oltean 2020-05-05  421  	int rc;
834f8933d5ddd7 Vladimir Oltean 2020-05-05  422  =

834f8933d5ddd7 Vladimir Oltean 2020-05-05  423  	e =3D kzalloc(sizeof(*e), =
GFP_KERNEL);
834f8933d5ddd7 Vladimir Oltean 2020-05-05  424  	if (!e)
834f8933d5ddd7 Vladimir Oltean 2020-05-05  425  		return -ENOMEM;
834f8933d5ddd7 Vladimir Oltean 2020-05-05  426  =

834f8933d5ddd7 Vladimir Oltean 2020-05-05  427  	e->rule =3D rule;
834f8933d5ddd7 Vladimir Oltean 2020-05-05  428  	e->gate_state =3D gate_sta=
te;
834f8933d5ddd7 Vladimir Oltean 2020-05-05  429  	e->interval =3D entry_time;
834f8933d5ddd7 Vladimir Oltean 2020-05-05  430  =

834f8933d5ddd7 Vladimir Oltean 2020-05-05  431  	if (list_empty(&gating_cfg=
->entries)) {
834f8933d5ddd7 Vladimir Oltean 2020-05-05  432  		list_add(&e->list, &gatin=
g_cfg->entries);
834f8933d5ddd7 Vladimir Oltean 2020-05-05  433  	} else {
834f8933d5ddd7 Vladimir Oltean 2020-05-05  434  		struct sja1105_gate_entry=
 *p;
834f8933d5ddd7 Vladimir Oltean 2020-05-05  435  =

834f8933d5ddd7 Vladimir Oltean 2020-05-05 @436  		list_for_each_entry(p, &g=
ating_cfg->entries, list) {
834f8933d5ddd7 Vladimir Oltean 2020-05-05  437  			if (p->interval =3D=3D e=
->interval) {
834f8933d5ddd7 Vladimir Oltean 2020-05-05  438  				NL_SET_ERR_MSG_MOD(exta=
ck,
834f8933d5ddd7 Vladimir Oltean 2020-05-05  439  						   "Gate conflict");
834f8933d5ddd7 Vladimir Oltean 2020-05-05  440  				rc =3D -EBUSY;
834f8933d5ddd7 Vladimir Oltean 2020-05-05  441  				goto err;
834f8933d5ddd7 Vladimir Oltean 2020-05-05  442  			}
834f8933d5ddd7 Vladimir Oltean 2020-05-05  443  =

834f8933d5ddd7 Vladimir Oltean 2020-05-05  444  			if (e->interval < p->int=
erval)
834f8933d5ddd7 Vladimir Oltean 2020-05-05  445  				break;
834f8933d5ddd7 Vladimir Oltean 2020-05-05  446  		}
834f8933d5ddd7 Vladimir Oltean 2020-05-05 @447  		list_add(&e->list, p->lis=
t.prev);
834f8933d5ddd7 Vladimir Oltean 2020-05-05  448  	}
834f8933d5ddd7 Vladimir Oltean 2020-05-05  449  =

834f8933d5ddd7 Vladimir Oltean 2020-05-05  450  	gating_cfg->num_entries++;
834f8933d5ddd7 Vladimir Oltean 2020-05-05  451  =

834f8933d5ddd7 Vladimir Oltean 2020-05-05  452  	return 0;
834f8933d5ddd7 Vladimir Oltean 2020-05-05  453  err:
834f8933d5ddd7 Vladimir Oltean 2020-05-05  454  	kfree(e);
834f8933d5ddd7 Vladimir Oltean 2020-05-05  455  	return rc;
834f8933d5ddd7 Vladimir Oltean 2020-05-05  456  }
834f8933d5ddd7 Vladimir Oltean 2020-05-05  457  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8305630674082854200==--

