Content-Type: multipart/mixed; boundary="===============2500789477043843098=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH bpf-next v3 2/7] bpf: per-cgroup lsm flavor
Date: Sat, 09 Apr 2022 06:02:08 +0800
Message-ID: <202204090535.gy7lTeMG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2500789477043843098==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220407223112.1204582-3-sdf@google.com>
References: <20220407223112.1204582-3-sdf@google.com>
TO: Stanislav Fomichev <sdf@google.com>
TO: netdev(a)vger.kernel.org
TO: bpf(a)vger.kernel.org
CC: ast(a)kernel.org
CC: daniel(a)iogearbox.net
CC: andrii(a)kernel.org
CC: Stanislav Fomichev <sdf@google.com>

Hi Stanislav,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Stanislav-Fomichev/b=
pf-cgroup_sock-lsm-flavor/20220408-063705
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: openrisc-randconfig-m031-20220408 (https://download.01.org/0day-ci/=
archive/20220409/202204090535.gy7lTeMG-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/bpf/cgroup.c:575 __cgroup_bpf_attach() warn: missing error code 'err'

vim +/err +575 kernel/bpf/cgroup.c

af6eea57437a83 Andrii Nakryiko    2020-03-29  457  =

3007098494bec6 Daniel Mack        2016-11-23  458  /**
af6eea57437a83 Andrii Nakryiko    2020-03-29  459   * __cgroup_bpf_attach()=
 - Attach the program or the link to a cgroup, and
3007098494bec6 Daniel Mack        2016-11-23  460   *                      =
   propagate the change to descendants
3007098494bec6 Daniel Mack        2016-11-23  461   * @cgrp: The cgroup whi=
ch descendants to traverse
324bda9e6c5add Alexei Starovoitov 2017-10-02  462   * @prog: A program to a=
ttach
af6eea57437a83 Andrii Nakryiko    2020-03-29  463   * @link: A link to atta=
ch
7dd68b3279f179 Andrey Ignatov     2019-12-18  464   * @replace_prog: Previo=
usly attached program to replace if BPF_F_REPLACE is set
324bda9e6c5add Alexei Starovoitov 2017-10-02  465   * @type: Type of attach=
 operation
1832f4ef5867fd Valdis Kletnieks   2019-01-29  466   * @flags: Option flags
3007098494bec6 Daniel Mack        2016-11-23  467   *
af6eea57437a83 Andrii Nakryiko    2020-03-29  468   * Exactly one of @prog =
or @link can be non-null.
3007098494bec6 Daniel Mack        2016-11-23  469   * Must be called with c=
group_mutex held.
3007098494bec6 Daniel Mack        2016-11-23  470   */
588e5d8766486e He Fengqing        2021-10-29  471  static int __cgroup_bpf_=
attach(struct cgroup *cgrp,
af6eea57437a83 Andrii Nakryiko    2020-03-29  472  			       struct bpf_pro=
g *prog, struct bpf_prog *replace_prog,
af6eea57437a83 Andrii Nakryiko    2020-03-29  473  			       struct bpf_cgr=
oup_link *link,
324bda9e6c5add Alexei Starovoitov 2017-10-02  474  			       enum bpf_attac=
h_type type, u32 flags)
3007098494bec6 Daniel Mack        2016-11-23  475  {
7dd68b3279f179 Andrey Ignatov     2019-12-18  476  	u32 saved_flags =3D (fl=
ags & (BPF_F_ALLOW_OVERRIDE | BPF_F_ALLOW_MULTI));
324bda9e6c5add Alexei Starovoitov 2017-10-02  477  	struct bpf_prog *old_pr=
og =3D NULL;
62039c30c19dca Andrii Nakryiko    2020-03-09  478  	struct bpf_cgroup_stora=
ge *storage[MAX_BPF_CGROUP_STORAGE_TYPE] =3D {};
7d9c3427894fe7 YiFei Zhu          2020-07-23  479  	struct bpf_cgroup_stora=
ge *new_storage[MAX_BPF_CGROUP_STORAGE_TYPE] =3D {};
3c3f15b5422ca6 Stanislav Fomichev 2022-04-07  480  	struct bpf_attach_targe=
t_info tgt_info =3D {};
6fc88c354f3af8 Dave Marchevsky    2021-08-19  481  	enum cgroup_bpf_attach_=
type atype;
af6eea57437a83 Andrii Nakryiko    2020-03-29  482  	struct bpf_prog_list *p=
l;
6fc88c354f3af8 Dave Marchevsky    2021-08-19  483  	struct list_head *progs;
324bda9e6c5add Alexei Starovoitov 2017-10-02  484  	int err;
324bda9e6c5add Alexei Starovoitov 2017-10-02  485  =

7dd68b3279f179 Andrey Ignatov     2019-12-18  486  	if (((flags & BPF_F_ALL=
OW_OVERRIDE) && (flags & BPF_F_ALLOW_MULTI)) ||
7dd68b3279f179 Andrey Ignatov     2019-12-18  487  	    ((flags & BPF_F_REP=
LACE) && !(flags & BPF_F_ALLOW_MULTI)))
324bda9e6c5add Alexei Starovoitov 2017-10-02  488  		/* invalid combination=
 */
324bda9e6c5add Alexei Starovoitov 2017-10-02  489  		return -EINVAL;
af6eea57437a83 Andrii Nakryiko    2020-03-29  490  	if (link && (prog || re=
place_prog))
af6eea57437a83 Andrii Nakryiko    2020-03-29  491  		/* only either link or=
 prog/replace_prog can be specified */
af6eea57437a83 Andrii Nakryiko    2020-03-29  492  		return -EINVAL;
af6eea57437a83 Andrii Nakryiko    2020-03-29  493  	if (!!replace_prog !=3D=
 !!(flags & BPF_F_REPLACE))
af6eea57437a83 Andrii Nakryiko    2020-03-29  494  		/* replace_prog implie=
s BPF_F_REPLACE, and vice versa */
af6eea57437a83 Andrii Nakryiko    2020-03-29  495  		return -EINVAL;
324bda9e6c5add Alexei Starovoitov 2017-10-02  496  =

3c3f15b5422ca6 Stanislav Fomichev 2022-04-07  497  	if (type =3D=3D BPF_LSM=
_CGROUP) {
3c3f15b5422ca6 Stanislav Fomichev 2022-04-07  498  		struct bpf_prog *p =3D=
 prog ? : link->link.prog;
3c3f15b5422ca6 Stanislav Fomichev 2022-04-07  499  =

3c3f15b5422ca6 Stanislav Fomichev 2022-04-07  500  		if (replace_prog) {
3c3f15b5422ca6 Stanislav Fomichev 2022-04-07  501  			/* Reusing shim from =
the original program.
3c3f15b5422ca6 Stanislav Fomichev 2022-04-07  502  			 */
3c3f15b5422ca6 Stanislav Fomichev 2022-04-07  503  			atype =3D replace_pro=
g->aux->cgroup_atype;
3c3f15b5422ca6 Stanislav Fomichev 2022-04-07  504  		} else {
3c3f15b5422ca6 Stanislav Fomichev 2022-04-07  505  			err =3D bpf_check_att=
ach_target(NULL, p, NULL,
3c3f15b5422ca6 Stanislav Fomichev 2022-04-07  506  						      p->aux->atta=
ch_btf_id,
3c3f15b5422ca6 Stanislav Fomichev 2022-04-07  507  						      &tgt_info);
3c3f15b5422ca6 Stanislav Fomichev 2022-04-07  508  			if (err)
3c3f15b5422ca6 Stanislav Fomichev 2022-04-07  509  				return -EINVAL;
3c3f15b5422ca6 Stanislav Fomichev 2022-04-07  510  =

3c3f15b5422ca6 Stanislav Fomichev 2022-04-07  511  			atype =3D bpf_lsm_att=
ach_type_get(p->aux->attach_btf_id);
3c3f15b5422ca6 Stanislav Fomichev 2022-04-07  512  			if (atype < 0)
3c3f15b5422ca6 Stanislav Fomichev 2022-04-07  513  				return atype;
3c3f15b5422ca6 Stanislav Fomichev 2022-04-07  514  		}
3c3f15b5422ca6 Stanislav Fomichev 2022-04-07  515  =

3c3f15b5422ca6 Stanislav Fomichev 2022-04-07  516  		p->aux->cgroup_atype =
=3D atype;
3c3f15b5422ca6 Stanislav Fomichev 2022-04-07  517  	} else {
6fc88c354f3af8 Dave Marchevsky    2021-08-19  518  		atype =3D to_cgroup_bp=
f_attach_type(type);
6fc88c354f3af8 Dave Marchevsky    2021-08-19  519  		if (atype < 0)
6fc88c354f3af8 Dave Marchevsky    2021-08-19  520  			return -EINVAL;
3c3f15b5422ca6 Stanislav Fomichev 2022-04-07  521  	}
6fc88c354f3af8 Dave Marchevsky    2021-08-19  522  =

6fc88c354f3af8 Dave Marchevsky    2021-08-19  523  	progs =3D &cgrp->bpf.pr=
ogs[atype];
6fc88c354f3af8 Dave Marchevsky    2021-08-19  524  =

6fc88c354f3af8 Dave Marchevsky    2021-08-19  525  	if (!hierarchy_allows_a=
ttach(cgrp, atype))
7f677633379b4a Alexei Starovoitov 2017-02-10  526  		return -EPERM;
7f677633379b4a Alexei Starovoitov 2017-02-10  527  =

6fc88c354f3af8 Dave Marchevsky    2021-08-19  528  	if (!list_empty(progs) =
&& cgrp->bpf.flags[atype] !=3D saved_flags)
324bda9e6c5add Alexei Starovoitov 2017-10-02  529  		/* Disallow attaching =
non-overridable on top
324bda9e6c5add Alexei Starovoitov 2017-10-02  530  		 * of existing overrid=
able in this cgroup.
324bda9e6c5add Alexei Starovoitov 2017-10-02  531  		 * Disallow attaching =
multi-prog if overridable or none
7f677633379b4a Alexei Starovoitov 2017-02-10  532  		 */
7f677633379b4a Alexei Starovoitov 2017-02-10  533  		return -EPERM;
7f677633379b4a Alexei Starovoitov 2017-02-10  534  =

324bda9e6c5add Alexei Starovoitov 2017-10-02  535  	if (prog_list_length(pr=
ogs) >=3D BPF_CGROUP_MAX_PROGS)
324bda9e6c5add Alexei Starovoitov 2017-10-02  536  		return -E2BIG;
324bda9e6c5add Alexei Starovoitov 2017-10-02  537  =

af6eea57437a83 Andrii Nakryiko    2020-03-29  538  	pl =3D find_attach_entr=
y(progs, prog, link, replace_prog,
af6eea57437a83 Andrii Nakryiko    2020-03-29  539  			       flags & BPF_F_=
ALLOW_MULTI);
af6eea57437a83 Andrii Nakryiko    2020-03-29  540  	if (IS_ERR(pl))
af6eea57437a83 Andrii Nakryiko    2020-03-29  541  		return PTR_ERR(pl);
324bda9e6c5add Alexei Starovoitov 2017-10-02  542  =

7d9c3427894fe7 YiFei Zhu          2020-07-23  543  	if (bpf_cgroup_storages=
_alloc(storage, new_storage, type,
7d9c3427894fe7 YiFei Zhu          2020-07-23  544  				      prog ? : link-=
>link.prog, cgrp))
324bda9e6c5add Alexei Starovoitov 2017-10-02  545  		return -ENOMEM;
d7bf2c10af0531 Roman Gushchin     2018-08-02  546  =

af6eea57437a83 Andrii Nakryiko    2020-03-29  547  	if (pl) {
1020c1f24a946e Andrey Ignatov     2019-12-18  548  		old_prog =3D pl->prog;
324bda9e6c5add Alexei Starovoitov 2017-10-02  549  	} else {
324bda9e6c5add Alexei Starovoitov 2017-10-02  550  		pl =3D kmalloc(sizeof(=
*pl), GFP_KERNEL);
d7bf2c10af0531 Roman Gushchin     2018-08-02  551  		if (!pl) {
7d9c3427894fe7 YiFei Zhu          2020-07-23  552  			bpf_cgroup_storages_f=
ree(new_storage);
324bda9e6c5add Alexei Starovoitov 2017-10-02  553  			return -ENOMEM;
d7bf2c10af0531 Roman Gushchin     2018-08-02  554  		}
324bda9e6c5add Alexei Starovoitov 2017-10-02  555  		list_add_tail(&pl->nod=
e, progs);
324bda9e6c5add Alexei Starovoitov 2017-10-02  556  	}
1020c1f24a946e Andrey Ignatov     2019-12-18  557  =

324bda9e6c5add Alexei Starovoitov 2017-10-02  558  	pl->prog =3D prog;
af6eea57437a83 Andrii Nakryiko    2020-03-29  559  	pl->link =3D link;
00c4eddf7ee5cb Andrii Nakryiko    2020-03-24  560  	bpf_cgroup_storages_ass=
ign(pl->storage, storage);
6fc88c354f3af8 Dave Marchevsky    2021-08-19  561  	cgrp->bpf.flags[atype] =
=3D saved_flags;
324bda9e6c5add Alexei Starovoitov 2017-10-02  562  =

6fc88c354f3af8 Dave Marchevsky    2021-08-19  563  	err =3D update_effectiv=
e_progs(cgrp, atype);
324bda9e6c5add Alexei Starovoitov 2017-10-02  564  	if (err)
324bda9e6c5add Alexei Starovoitov 2017-10-02  565  		goto cleanup;
324bda9e6c5add Alexei Starovoitov 2017-10-02  566  =

3c3f15b5422ca6 Stanislav Fomichev 2022-04-07  567  	bpf_cgroup_storages_lin=
k(new_storage, cgrp, type);
3c3f15b5422ca6 Stanislav Fomichev 2022-04-07  568  =

3c3f15b5422ca6 Stanislav Fomichev 2022-04-07  569  	if (type =3D=3D BPF_LSM=
_CGROUP && !old_prog) {
3c3f15b5422ca6 Stanislav Fomichev 2022-04-07  570  		struct bpf_prog *p =3D=
 prog ? : link->link.prog;
3c3f15b5422ca6 Stanislav Fomichev 2022-04-07  571  		int err;
3c3f15b5422ca6 Stanislav Fomichev 2022-04-07  572  =

3c3f15b5422ca6 Stanislav Fomichev 2022-04-07  573  		err =3D bpf_trampoline=
_link_cgroup_shim(p, &tgt_info);
3c3f15b5422ca6 Stanislav Fomichev 2022-04-07  574  		if (err)
3c3f15b5422ca6 Stanislav Fomichev 2022-04-07 @575  			goto cleanup_trampoli=
ne;
3c3f15b5422ca6 Stanislav Fomichev 2022-04-07  576  	}
3c3f15b5422ca6 Stanislav Fomichev 2022-04-07  577  =

af6eea57437a83 Andrii Nakryiko    2020-03-29  578  	if (old_prog)
324bda9e6c5add Alexei Starovoitov 2017-10-02  579  		bpf_prog_put(old_prog);
af6eea57437a83 Andrii Nakryiko    2020-03-29  580  	else
6fc88c354f3af8 Dave Marchevsky    2021-08-19  581  		static_branch_inc(&cgr=
oup_bpf_enabled_key[atype]);
3c3f15b5422ca6 Stanislav Fomichev 2022-04-07  582  =

324bda9e6c5add Alexei Starovoitov 2017-10-02  583  	return 0;
324bda9e6c5add Alexei Starovoitov 2017-10-02  584  =

3c3f15b5422ca6 Stanislav Fomichev 2022-04-07  585  cleanup_trampoline:
3c3f15b5422ca6 Stanislav Fomichev 2022-04-07  586  	bpf_cgroup_storages_unl=
ink(new_storage);
3c3f15b5422ca6 Stanislav Fomichev 2022-04-07  587  =

324bda9e6c5add Alexei Starovoitov 2017-10-02  588  cleanup:
af6eea57437a83 Andrii Nakryiko    2020-03-29  589  	if (old_prog) {
324bda9e6c5add Alexei Starovoitov 2017-10-02  590  		pl->prog =3D old_prog;
af6eea57437a83 Andrii Nakryiko    2020-03-29  591  		pl->link =3D NULL;
8bad74f9840f87 Roman Gushchin     2018-09-28  592  	}
7d9c3427894fe7 YiFei Zhu          2020-07-23  593  	bpf_cgroup_storages_fre=
e(new_storage);
af6eea57437a83 Andrii Nakryiko    2020-03-29  594  	if (!old_prog) {
324bda9e6c5add Alexei Starovoitov 2017-10-02  595  		list_del(&pl->node);
324bda9e6c5add Alexei Starovoitov 2017-10-02  596  		kfree(pl);
324bda9e6c5add Alexei Starovoitov 2017-10-02  597  	}
324bda9e6c5add Alexei Starovoitov 2017-10-02  598  	return err;
324bda9e6c5add Alexei Starovoitov 2017-10-02  599  }
324bda9e6c5add Alexei Starovoitov 2017-10-02  600  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2500789477043843098==--

