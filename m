Content-Type: multipart/mixed; boundary="===============5996309681444676771=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 5904/9357] kernel/bpf/verifier.c:5331 process_kptr_func() warn: passing zero to 'PTR_ERR'
Date: Fri, 06 May 2022 08:51:42 +0800
Message-ID: <202205060842.u7DbHcHB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5996309681444676771==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   632a8c88e339fe86ae6e420a24dfc641d4dd0ab5
commit: c0a5a21c25f37c9fd7b36072f9968cdff1e4aa13 [5904/9357] bpf: Allow sto=
ring referenced kptr in map
:::::: branch date: 14 hours ago
:::::: commit date: 10 days ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
506/202205060842.u7DbHcHB-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/bpf/verifier.c:5331 process_kptr_func() warn: passing zero to 'PTR_E=
RR'

vim +/PTR_ERR +5331 kernel/bpf/verifier.c

b00628b1c7d595 Alexei Starovoitov      2021-07-14  5309  =

c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5310  static int process=
_kptr_func(struct bpf_verifier_env *env, int regno,
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5311  			     struct bpf=
_call_arg_meta *meta)
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5312  {
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5313  	struct bpf_reg_st=
ate *regs =3D cur_regs(env), *reg =3D &regs[regno];
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5314  	struct bpf_map_va=
lue_off_desc *off_desc;
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5315  	struct bpf_map *m=
ap_ptr =3D reg->map_ptr;
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5316  	u32 kptr_off;
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5317  	int ret;
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5318  =

c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5319  	if (!tnum_is_cons=
t(reg->var_off)) {
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5320  		verbose(env,
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5321  			"R%d doesn't ha=
ve constant offset. kptr has to be at the constant offset\n",
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5322  			regno);
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5323  		return -EINVAL;
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5324  	}
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5325  	if (!map_ptr->btf=
) {
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5326  		verbose(env, "ma=
p '%s' has to have BTF in order to use bpf_kptr_xchg\n",
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5327  			map_ptr->name);
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5328  		return -EINVAL;
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5329  	}
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5330  	if (!map_value_ha=
s_kptrs(map_ptr)) {
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25 @5331  		ret =3D PTR_ERR(=
map_ptr->kptr_off_tab);
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5332  		if (ret =3D=3D -=
E2BIG)
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5333  			verbose(env, "m=
ap '%s' has more than %d kptr\n", map_ptr->name,
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5334  				BPF_MAP_VALUE_=
OFF_MAX);
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5335  		else if (ret =3D=
=3D -EEXIST)
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5336  			verbose(env, "m=
ap '%s' has repeating kptr BTF tags\n", map_ptr->name);
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5337  		else
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5338  			verbose(env, "m=
ap '%s' has no valid kptr\n", map_ptr->name);
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5339  		return -EINVAL;
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5340  	}
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5341  =

c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5342  	meta->map_ptr =3D=
 map_ptr;
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5343  	kptr_off =3D reg-=
>off + reg->var_off.value;
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5344  	off_desc =3D bpf_=
map_kptr_off_contains(map_ptr, kptr_off);
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5345  	if (!off_desc) {
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5346  		verbose(env, "of=
f=3D%d doesn't point to kptr\n", kptr_off);
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5347  		return -EACCES;
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5348  	}
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5349  	if (off_desc->typ=
e !=3D BPF_KPTR_REF) {
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5350  		verbose(env, "of=
f=3D%d kptr isn't referenced kptr\n", kptr_off);
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5351  		return -EACCES;
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5352  	}
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5353  	meta->kptr_off_de=
sc =3D off_desc;
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5354  	return 0;
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5355  }
c0a5a21c25f37c Kumar Kartikeya Dwivedi 2022-04-25  5356  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5996309681444676771==--

