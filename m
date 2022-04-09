Content-Type: multipart/mixed; boundary="===============6117955406321338862=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH bpf-next v4 05/13] bpf: Allow storing referenced kptr in map
Date: Sat, 09 Apr 2022 22:00:41 +0800
Message-ID: <202204092155.HhbdLcz8-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6117955406321338862==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220409093303.499196-6-memxor@gmail.com>
References: <20220409093303.499196-6-memxor@gmail.com>
TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>
TO: bpf(a)vger.kernel.org
CC: Alexei Starovoitov <ast@kernel.org>
CC: Andrii Nakryiko <andrii@kernel.org>
CC: Daniel Borkmann <daniel@iogearbox.net>
CC: "Toke H=C3=B8iland-J=C3=B8rgensen" <toke@redhat.com>
CC: Jesper Dangaard Brouer <brouer@redhat.com>

Hi Kumar,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Kumar-Kartikeya-Dwiv=
edi/Introduce-typed-pointer-support-in-BPF-maps/20220409-173513
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
409/202204092155.HhbdLcz8-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/bpf/verifier.c:5317 process_kptr_func() warn: passing zero to 'PTR_E=
RR'

vim +/PTR_ERR +5317 kernel/bpf/verifier.c

b00628b1c7d595 Alexei Starovoitov      2021-07-14  5295  =

dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5296  static int process=
_kptr_func(struct bpf_verifier_env *env, int regno,
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5297  			     struct bpf=
_call_arg_meta *meta)
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5298  {
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5299  	struct bpf_reg_st=
ate *regs =3D cur_regs(env), *reg =3D &regs[regno];
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5300  	struct bpf_map_va=
lue_off_desc *off_desc;
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5301  	struct bpf_map *m=
ap_ptr =3D reg->map_ptr;
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5302  	u32 kptr_off;
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5303  	int ret;
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5304  =

dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5305  	if (!tnum_is_cons=
t(reg->var_off)) {
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5306  		verbose(env,
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5307  			"R%d doesn't ha=
ve constant offset. kptr has to be at the constant offset\n",
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5308  			regno);
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5309  		return -EINVAL;
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5310  	}
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5311  	if (!map_ptr->btf=
) {
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5312  		verbose(env, "ma=
p '%s' has to have BTF in order to use bpf_kptr_xchg\n",
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5313  			map_ptr->name);
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5314  		return -EINVAL;
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5315  	}
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5316  	if (!map_value_ha=
s_kptrs(map_ptr)) {
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09 @5317  		ret =3D PTR_ERR(=
map_ptr->kptr_off_tab);
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5318  		if (ret =3D=3D -=
E2BIG)
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5319  			verbose(env, "m=
ap '%s' has more than %d kptr\n", map_ptr->name,
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5320  				BPF_MAP_VALUE_=
OFF_MAX);
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5321  		else if (ret =3D=
=3D -EEXIST)
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5322  			verbose(env, "m=
ap '%s' has repeating kptr BTF tags\n", map_ptr->name);
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5323  		else
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5324  			verbose(env, "m=
ap '%s' has no valid kptr\n", map_ptr->name);
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5325  		return -EINVAL;
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5326  	}
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5327  =

dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5328  	meta->map_ptr =3D=
 map_ptr;
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5329  	/* Check access f=
or BPF_WRITE */
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5330  	meta->raw_mode =
=3D true;
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5331  	ret =3D check_hel=
per_mem_access(env, regno, sizeof(u64), false, meta);
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5332  	if (ret < 0)
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5333  		return ret;
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5334  =

dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5335  	kptr_off =3D reg-=
>off + reg->var_off.value;
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5336  	off_desc =3D bpf_=
map_kptr_off_contains(map_ptr, kptr_off);
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5337  	if (!off_desc) {
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5338  		verbose(env, "of=
f=3D%d doesn't point to kptr\n", kptr_off);
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5339  		return -EACCES;
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5340  	}
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5341  	if (!(off_desc->f=
lags & BPF_MAP_VALUE_OFF_F_REF)) {
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5342  		verbose(env, "of=
f=3D%d kptr isn't referenced kptr\n", kptr_off);
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5343  		return -EACCES;
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5344  	}
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5345  	meta->kptr_off_de=
sc =3D off_desc;
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5346  	return 0;
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5347  }
dd8be1418d45aa Kumar Kartikeya Dwivedi 2022-04-09  5348  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6117955406321338862==--

