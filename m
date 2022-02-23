Content-Type: multipart/mixed; boundary="===============6620568165432755463=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/bpf/bpf_struct_ops.c:121 bpf_struct_ops_init() warn: we never enter this loop
Date: Thu, 24 Feb 2022 05:09:17 +0800
Message-ID: <202202240524.5hBX7Hho-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6620568165432755463==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Daniel Borkmann <daniel@iogearbox.net>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5c1ee569660d4a205dced9cb4d0306b907fb7599
commit: b24abcff918a5cbf44b0c982bd3477a93e8e4911 bpf, kconfig: Add consolid=
ated menu entry for bpf with core options
date:   10 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-m031-20220223 (https://download.01.org/0day-ci/archi=
ve/20220224/202202240524.5hBX7Hho-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/bpf/bpf_struct_ops.c:121 bpf_struct_ops_init() warn: we never enter =
this loop
kernel/bpf/bpf_struct_ops.c:208 bpf_struct_ops_find_value() warn: we never =
enter this loop
kernel/bpf/bpf_struct_ops.c:223 bpf_struct_ops_find() warn: we never enter =
this loop

vim +121 kernel/bpf/bpf_struct_ops.c

85d33df357b634 Martin KaFai Lau 2020-01-08  113  =

85d33df357b634 Martin KaFai Lau 2020-01-08  114  	module_id =3D btf_find_by=
_name_kind(btf, "module", BTF_KIND_STRUCT);
85d33df357b634 Martin KaFai Lau 2020-01-08  115  	if (module_id < 0) {
85d33df357b634 Martin KaFai Lau 2020-01-08  116  		pr_warn("Cannot find str=
uct module in btf_vmlinux\n");
85d33df357b634 Martin KaFai Lau 2020-01-08  117  		return;
85d33df357b634 Martin KaFai Lau 2020-01-08  118  	}
85d33df357b634 Martin KaFai Lau 2020-01-08  119  	module_type =3D btf_type_=
by_id(btf, module_id);
85d33df357b634 Martin KaFai Lau 2020-01-08  120  =

27ae7997a66174 Martin KaFai Lau 2020-01-08 @121  	for (i =3D 0; i < ARRAY_S=
IZE(bpf_struct_ops); i++) {
27ae7997a66174 Martin KaFai Lau 2020-01-08  122  		st_ops =3D bpf_struct_op=
s[i];
27ae7997a66174 Martin KaFai Lau 2020-01-08  123  =

85d33df357b634 Martin KaFai Lau 2020-01-08  124  		if (strlen(st_ops->name)=
 + VALUE_PREFIX_LEN >=3D
85d33df357b634 Martin KaFai Lau 2020-01-08  125  		    sizeof(value_name)) {
85d33df357b634 Martin KaFai Lau 2020-01-08  126  			pr_warn("struct_ops nam=
e %s is too long\n",
85d33df357b634 Martin KaFai Lau 2020-01-08  127  				st_ops->name);
85d33df357b634 Martin KaFai Lau 2020-01-08  128  			continue;
85d33df357b634 Martin KaFai Lau 2020-01-08  129  		}
85d33df357b634 Martin KaFai Lau 2020-01-08  130  		sprintf(value_name, "%s%=
s", VALUE_PREFIX, st_ops->name);
85d33df357b634 Martin KaFai Lau 2020-01-08  131  =

85d33df357b634 Martin KaFai Lau 2020-01-08  132  		value_id =3D btf_find_by=
_name_kind(btf, value_name,
85d33df357b634 Martin KaFai Lau 2020-01-08  133  						 BTF_KIND_STRUCT);
85d33df357b634 Martin KaFai Lau 2020-01-08  134  		if (value_id < 0) {
85d33df357b634 Martin KaFai Lau 2020-01-08  135  			pr_warn("Cannot find st=
ruct %s in btf_vmlinux\n",
85d33df357b634 Martin KaFai Lau 2020-01-08  136  				value_name);
85d33df357b634 Martin KaFai Lau 2020-01-08  137  			continue;
85d33df357b634 Martin KaFai Lau 2020-01-08  138  		}
85d33df357b634 Martin KaFai Lau 2020-01-08  139  =

27ae7997a66174 Martin KaFai Lau 2020-01-08  140  		type_id =3D btf_find_by_=
name_kind(btf, st_ops->name,
27ae7997a66174 Martin KaFai Lau 2020-01-08  141  						BTF_KIND_STRUCT);
27ae7997a66174 Martin KaFai Lau 2020-01-08  142  		if (type_id < 0) {
27ae7997a66174 Martin KaFai Lau 2020-01-08  143  			pr_warn("Cannot find st=
ruct %s in btf_vmlinux\n",
27ae7997a66174 Martin KaFai Lau 2020-01-08  144  				st_ops->name);
27ae7997a66174 Martin KaFai Lau 2020-01-08  145  			continue;
27ae7997a66174 Martin KaFai Lau 2020-01-08  146  		}
27ae7997a66174 Martin KaFai Lau 2020-01-08  147  		t =3D btf_type_by_id(btf=
, type_id);
27ae7997a66174 Martin KaFai Lau 2020-01-08  148  		if (btf_type_vlen(t) > B=
PF_STRUCT_OPS_MAX_NR_MEMBERS) {
27ae7997a66174 Martin KaFai Lau 2020-01-08  149  			pr_warn("Cannot support=
 #%u members in struct %s\n",
27ae7997a66174 Martin KaFai Lau 2020-01-08  150  				btf_type_vlen(t), st_o=
ps->name);
27ae7997a66174 Martin KaFai Lau 2020-01-08  151  			continue;
27ae7997a66174 Martin KaFai Lau 2020-01-08  152  		}
27ae7997a66174 Martin KaFai Lau 2020-01-08  153  =

27ae7997a66174 Martin KaFai Lau 2020-01-08  154  		for_each_member(j, t, me=
mber) {
27ae7997a66174 Martin KaFai Lau 2020-01-08  155  			const struct btf_type *=
func_proto;
27ae7997a66174 Martin KaFai Lau 2020-01-08  156  =

27ae7997a66174 Martin KaFai Lau 2020-01-08  157  			mname =3D btf_name_by_o=
ffset(btf, member->name_off);
27ae7997a66174 Martin KaFai Lau 2020-01-08  158  			if (!*mname) {
27ae7997a66174 Martin KaFai Lau 2020-01-08  159  				pr_warn("anon member i=
n struct %s is not supported\n",
27ae7997a66174 Martin KaFai Lau 2020-01-08  160  					st_ops->name);
27ae7997a66174 Martin KaFai Lau 2020-01-08  161  				break;
27ae7997a66174 Martin KaFai Lau 2020-01-08  162  			}
27ae7997a66174 Martin KaFai Lau 2020-01-08  163  =

27ae7997a66174 Martin KaFai Lau 2020-01-08  164  			if (btf_member_bitfield=
_size(t, member)) {
27ae7997a66174 Martin KaFai Lau 2020-01-08  165  				pr_warn("bit field mem=
ber %s in struct %s is not supported\n",
27ae7997a66174 Martin KaFai Lau 2020-01-08  166  					mname, st_ops->name);
27ae7997a66174 Martin KaFai Lau 2020-01-08  167  				break;
27ae7997a66174 Martin KaFai Lau 2020-01-08  168  			}
27ae7997a66174 Martin KaFai Lau 2020-01-08  169  =

27ae7997a66174 Martin KaFai Lau 2020-01-08  170  			func_proto =3D btf_type=
_resolve_func_ptr(btf,
27ae7997a66174 Martin KaFai Lau 2020-01-08  171  							       member->type,
27ae7997a66174 Martin KaFai Lau 2020-01-08  172  							       NULL);
27ae7997a66174 Martin KaFai Lau 2020-01-08  173  			if (func_proto &&
d3e42bb0a329fa Martin KaFai Lau 2020-01-27  174  			    btf_distill_func_pr=
oto(log, btf,
27ae7997a66174 Martin KaFai Lau 2020-01-08  175  						   func_proto, mname,
27ae7997a66174 Martin KaFai Lau 2020-01-08  176  						   &st_ops->func_mod=
els[j])) {
27ae7997a66174 Martin KaFai Lau 2020-01-08  177  				pr_warn("Error in pars=
ing func ptr %s in struct %s\n",
27ae7997a66174 Martin KaFai Lau 2020-01-08  178  					mname, st_ops->name);
27ae7997a66174 Martin KaFai Lau 2020-01-08  179  				break;
27ae7997a66174 Martin KaFai Lau 2020-01-08  180  			}
27ae7997a66174 Martin KaFai Lau 2020-01-08  181  		}
27ae7997a66174 Martin KaFai Lau 2020-01-08  182  =

27ae7997a66174 Martin KaFai Lau 2020-01-08  183  		if (j =3D=3D btf_type_vl=
en(t)) {
27ae7997a66174 Martin KaFai Lau 2020-01-08  184  			if (st_ops->init(btf)) {
27ae7997a66174 Martin KaFai Lau 2020-01-08  185  				pr_warn("Error in init=
 bpf_struct_ops %s\n",
27ae7997a66174 Martin KaFai Lau 2020-01-08  186  					st_ops->name);
27ae7997a66174 Martin KaFai Lau 2020-01-08  187  			} else {
27ae7997a66174 Martin KaFai Lau 2020-01-08  188  				st_ops->type_id =3D ty=
pe_id;
27ae7997a66174 Martin KaFai Lau 2020-01-08  189  				st_ops->type =3D t;
85d33df357b634 Martin KaFai Lau 2020-01-08  190  				st_ops->value_id =3D v=
alue_id;
85d33df357b634 Martin KaFai Lau 2020-01-08  191  				st_ops->value_type =3D=
 btf_type_by_id(btf,
85d33df357b634 Martin KaFai Lau 2020-01-08  192  								    value_id);
27ae7997a66174 Martin KaFai Lau 2020-01-08  193  			}
27ae7997a66174 Martin KaFai Lau 2020-01-08  194  		}
27ae7997a66174 Martin KaFai Lau 2020-01-08  195  	}
27ae7997a66174 Martin KaFai Lau 2020-01-08  196  }
27ae7997a66174 Martin KaFai Lau 2020-01-08  197  =

27ae7997a66174 Martin KaFai Lau 2020-01-08  198  extern struct btf *btf_vml=
inux;
27ae7997a66174 Martin KaFai Lau 2020-01-08  199  =

85d33df357b634 Martin KaFai Lau 2020-01-08  200  static const struct bpf_st=
ruct_ops *
85d33df357b634 Martin KaFai Lau 2020-01-08  201  bpf_struct_ops_find_value(=
u32 value_id)
85d33df357b634 Martin KaFai Lau 2020-01-08  202  {
85d33df357b634 Martin KaFai Lau 2020-01-08  203  	unsigned int i;
85d33df357b634 Martin KaFai Lau 2020-01-08  204  =

85d33df357b634 Martin KaFai Lau 2020-01-08  205  	if (!value_id || !btf_vml=
inux)
85d33df357b634 Martin KaFai Lau 2020-01-08  206  		return NULL;
85d33df357b634 Martin KaFai Lau 2020-01-08  207  =

85d33df357b634 Martin KaFai Lau 2020-01-08 @208  	for (i =3D 0; i < ARRAY_S=
IZE(bpf_struct_ops); i++) {
85d33df357b634 Martin KaFai Lau 2020-01-08  209  		if (bpf_struct_ops[i]->v=
alue_id =3D=3D value_id)
85d33df357b634 Martin KaFai Lau 2020-01-08  210  			return bpf_struct_ops[i=
];
85d33df357b634 Martin KaFai Lau 2020-01-08  211  	}
85d33df357b634 Martin KaFai Lau 2020-01-08  212  =

85d33df357b634 Martin KaFai Lau 2020-01-08  213  	return NULL;
85d33df357b634 Martin KaFai Lau 2020-01-08  214  }
85d33df357b634 Martin KaFai Lau 2020-01-08  215  =

27ae7997a66174 Martin KaFai Lau 2020-01-08  216  const struct bpf_struct_op=
s *bpf_struct_ops_find(u32 type_id)
27ae7997a66174 Martin KaFai Lau 2020-01-08  217  {
27ae7997a66174 Martin KaFai Lau 2020-01-08  218  	unsigned int i;
27ae7997a66174 Martin KaFai Lau 2020-01-08  219  =

27ae7997a66174 Martin KaFai Lau 2020-01-08  220  	if (!type_id || !btf_vmli=
nux)
27ae7997a66174 Martin KaFai Lau 2020-01-08  221  		return NULL;
27ae7997a66174 Martin KaFai Lau 2020-01-08  222  =

27ae7997a66174 Martin KaFai Lau 2020-01-08 @223  	for (i =3D 0; i < ARRAY_S=
IZE(bpf_struct_ops); i++) {
27ae7997a66174 Martin KaFai Lau 2020-01-08  224  		if (bpf_struct_ops[i]->t=
ype_id =3D=3D type_id)
27ae7997a66174 Martin KaFai Lau 2020-01-08  225  			return bpf_struct_ops[i=
];
27ae7997a66174 Martin KaFai Lau 2020-01-08  226  	}
27ae7997a66174 Martin KaFai Lau 2020-01-08  227  =

27ae7997a66174 Martin KaFai Lau 2020-01-08  228  	return NULL;
27ae7997a66174 Martin KaFai Lau 2020-01-08  229  }
85d33df357b634 Martin KaFai Lau 2020-01-08  230  =


:::::: The code at line 121 was first introduced by commit
:::::: 27ae7997a66174cb8afd6a75b3989f5e0c1b9e5a bpf: Introduce BPF_PROG_TYP=
E_STRUCT_OPS

:::::: TO: Martin KaFai Lau <kafai@fb.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6620568165432755463==--

