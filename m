Content-Type: multipart/mixed; boundary="===============6619491998169521888=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH net 4/5] netdevsim: use IS_ERR instead of IS_ERR_OR_NULL for debugfs
Date: Fri, 17 Jan 2020 06:38:02 +0300
Message-ID: <20200117033802.GA19765@kadam>
In-Reply-To: <20200111163743.4339-1-ap420073@gmail.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6619491998169521888==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Taehee,

url:    https://github.com/0day-ci/linux/commits/Taehee-Yoo/netdevsim-fix-a=
-several-bugs-in-netdevsim-module/20200112-004546
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git a5c3a=
7c0ce1a1cfab15404018933775d7222a517

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/netdevsim/bpf.c:246 nsim_bpf_create_prog() error: dereferencing=
 freed memory 'state'

# https://github.com/0day-ci/linux/commit/923e31529b0b3f039f837f54c4a1bbd77=
793256b
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 923e31529b0b3f039f837f54c4a1bbd77793256b
vim +/state +246 drivers/net/netdevsim/bpf.c

d514f41e793d2c Jiri Pirko     2019-04-25  227  static int nsim_bpf_create_p=
rog(struct nsim_dev *nsim_dev,
b26b6946a62f37 Jiri Pirko     2019-04-12  228  				struct bpf_prog *prog)
31d3ad832948c7 Jakub Kicinski 2017-12-01  229  {
31d3ad832948c7 Jakub Kicinski 2017-12-01  230  	struct nsim_bpf_bound_prog =
*state;
31d3ad832948c7 Jakub Kicinski 2017-12-01  231  	char name[16];
31d3ad832948c7 Jakub Kicinski 2017-12-01  232  =

31d3ad832948c7 Jakub Kicinski 2017-12-01  233  	state =3D kzalloc(sizeof(*s=
tate), GFP_KERNEL);
31d3ad832948c7 Jakub Kicinski 2017-12-01  234  	if (!state)
31d3ad832948c7 Jakub Kicinski 2017-12-01  235  		return -ENOMEM;
31d3ad832948c7 Jakub Kicinski 2017-12-01  236  =

d514f41e793d2c Jiri Pirko     2019-04-25  237  	state->nsim_dev =3D nsim_de=
v;
31d3ad832948c7 Jakub Kicinski 2017-12-01  238  	state->prog =3D prog;
31d3ad832948c7 Jakub Kicinski 2017-12-01  239  	state->state =3D "verify";
31d3ad832948c7 Jakub Kicinski 2017-12-01  240  =

31d3ad832948c7 Jakub Kicinski 2017-12-01  241  	/* Program id is not popula=
ted yet when we create the state. */
d514f41e793d2c Jiri Pirko     2019-04-25  242  	sprintf(name, "%u", nsim_de=
v->prog_id_gen++);
d514f41e793d2c Jiri Pirko     2019-04-25  243  	state->ddir =3D debugfs_cre=
ate_dir(name, nsim_dev->ddir_bpf_bound_progs);
923e31529b0b3f Taehee Yoo     2020-01-11  244  	if (IS_ERR(state->ddir)) {
31d3ad832948c7 Jakub Kicinski 2017-12-01  245  		kfree(state);
                                                              ^^^^^
state is freed.

923e31529b0b3f Taehee Yoo     2020-01-11 @246  		return PTR_ERR(state->ddir=
);
                                                                       ^^^^=
^^^^^^^
Then dereferenced afterward.

31d3ad832948c7 Jakub Kicinski 2017-12-01  247  	}
31d3ad832948c7 Jakub Kicinski 2017-12-01  248  =

31d3ad832948c7 Jakub Kicinski 2017-12-01  249  	debugfs_create_u32("id", 04=
00, state->ddir, &prog->aux->id);
31d3ad832948c7 Jakub Kicinski 2017-12-01  250  	debugfs_create_file("state"=
, 0400, state->ddir,
31d3ad832948c7 Jakub Kicinski 2017-12-01  251  			    &state->state, &nsim_=
bpf_string_fops);
31d3ad832948c7 Jakub Kicinski 2017-12-01  252  	debugfs_create_bool("loaded=
", 0400, state->ddir, &state->is_loaded);
31d3ad832948c7 Jakub Kicinski 2017-12-01  253  =

d514f41e793d2c Jiri Pirko     2019-04-25  254  	list_add_tail(&state->l, &n=
sim_dev->bpf_bound_progs);
31d3ad832948c7 Jakub Kicinski 2017-12-01  255  =

31d3ad832948c7 Jakub Kicinski 2017-12-01  256  	prog->aux->offload->dev_pri=
v =3D state;
31d3ad832948c7 Jakub Kicinski 2017-12-01  257  =

31d3ad832948c7 Jakub Kicinski 2017-12-01  258  	return 0;
31d3ad832948c7 Jakub Kicinski 2017-12-01  259  }

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============6619491998169521888==--

