Content-Type: multipart/mixed; boundary="===============3652696973043360019=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/bpf/btf.c:3827:24: warning: Variable 'tag' is not assigned a value. [unassignedVariable]
Date: Thu, 24 Mar 2022 06:37:24 +0800
Message-ID: <202203240646.5CTPzoky-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3652696973043360019==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Yonghong Song <yhs@fb.com>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6b1f86f8e9c7f9de7ca1cb987b2cf25e99b1ae3a
commit: b5ea834dde6b6e7f75e51d5f66dac8cd7c97b5ef bpf: Support for new btf k=
ind BTF_KIND_TAG
date:   6 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 6 months ago
compiler: microblaze-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

                ^
   kernel/bpf/btf.c:4849:38: note: Null pointer addition
    args =3D (const struct btf_param *)(t + 1);
                                        ^
   kernel/bpf/btf.c:4534:5: warning: union member 'Anonymous2::__t' is neve=
r used. [unusedStructMember]
    } *__t;
       ^
>> kernel/bpf/btf.c:3827:24: warning: Variable 'tag' is not assigned a valu=
e. [unassignedVariable]
    const struct btf_tag *tag;
                          ^

vim +/tag +3827 kernel/bpf/btf.c

b1828f0b04828aa Ilya Leoshkevich 2021-02-26  3822  =

b5ea834dde6b6e7 Yonghong Song    2021-09-14  3823  static s32 btf_tag_check=
_meta(struct btf_verifier_env *env,
b5ea834dde6b6e7 Yonghong Song    2021-09-14  3824  			      const struct bt=
f_type *t,
b5ea834dde6b6e7 Yonghong Song    2021-09-14  3825  			      u32 meta_left)
b5ea834dde6b6e7 Yonghong Song    2021-09-14  3826  {
b5ea834dde6b6e7 Yonghong Song    2021-09-14 @3827  	const struct btf_tag *t=
ag;
b5ea834dde6b6e7 Yonghong Song    2021-09-14  3828  	u32 meta_needed =3D siz=
eof(*tag);
b5ea834dde6b6e7 Yonghong Song    2021-09-14  3829  	s32 component_idx;
b5ea834dde6b6e7 Yonghong Song    2021-09-14  3830  	const char *value;
b5ea834dde6b6e7 Yonghong Song    2021-09-14  3831  =

b5ea834dde6b6e7 Yonghong Song    2021-09-14  3832  	if (meta_left < meta_ne=
eded) {
b5ea834dde6b6e7 Yonghong Song    2021-09-14  3833  		btf_verifier_log_basic=
(env, t,
b5ea834dde6b6e7 Yonghong Song    2021-09-14  3834  				       "meta_left:%u=
 meta_needed:%u",
b5ea834dde6b6e7 Yonghong Song    2021-09-14  3835  				       meta_left, me=
ta_needed);
b5ea834dde6b6e7 Yonghong Song    2021-09-14  3836  		return -EINVAL;
b5ea834dde6b6e7 Yonghong Song    2021-09-14  3837  	}
b5ea834dde6b6e7 Yonghong Song    2021-09-14  3838  =

b5ea834dde6b6e7 Yonghong Song    2021-09-14  3839  	value =3D btf_name_by_o=
ffset(env->btf, t->name_off);
b5ea834dde6b6e7 Yonghong Song    2021-09-14  3840  	if (!value || !value[0]=
) {
b5ea834dde6b6e7 Yonghong Song    2021-09-14  3841  		btf_verifier_log_type(=
env, t, "Invalid value");
b5ea834dde6b6e7 Yonghong Song    2021-09-14  3842  		return -EINVAL;
b5ea834dde6b6e7 Yonghong Song    2021-09-14  3843  	}
b5ea834dde6b6e7 Yonghong Song    2021-09-14  3844  =

b5ea834dde6b6e7 Yonghong Song    2021-09-14  3845  	if (btf_type_vlen(t)) {
b5ea834dde6b6e7 Yonghong Song    2021-09-14  3846  		btf_verifier_log_type(=
env, t, "vlen !=3D 0");
b5ea834dde6b6e7 Yonghong Song    2021-09-14  3847  		return -EINVAL;
b5ea834dde6b6e7 Yonghong Song    2021-09-14  3848  	}
b5ea834dde6b6e7 Yonghong Song    2021-09-14  3849  =

b5ea834dde6b6e7 Yonghong Song    2021-09-14  3850  	if (btf_type_kflag(t)) {
b5ea834dde6b6e7 Yonghong Song    2021-09-14  3851  		btf_verifier_log_type(=
env, t, "Invalid btf_info kind_flag");
b5ea834dde6b6e7 Yonghong Song    2021-09-14  3852  		return -EINVAL;
b5ea834dde6b6e7 Yonghong Song    2021-09-14  3853  	}
b5ea834dde6b6e7 Yonghong Song    2021-09-14  3854  =

b5ea834dde6b6e7 Yonghong Song    2021-09-14  3855  	component_idx =3D btf_t=
ype_tag(t)->component_idx;
b5ea834dde6b6e7 Yonghong Song    2021-09-14  3856  	if (component_idx < -1)=
 {
b5ea834dde6b6e7 Yonghong Song    2021-09-14  3857  		btf_verifier_log_type(=
env, t, "Invalid component_idx");
b5ea834dde6b6e7 Yonghong Song    2021-09-14  3858  		return -EINVAL;
b5ea834dde6b6e7 Yonghong Song    2021-09-14  3859  	}
b5ea834dde6b6e7 Yonghong Song    2021-09-14  3860  =

b5ea834dde6b6e7 Yonghong Song    2021-09-14  3861  	btf_verifier_log_type(e=
nv, t, NULL);
b5ea834dde6b6e7 Yonghong Song    2021-09-14  3862  =

b5ea834dde6b6e7 Yonghong Song    2021-09-14  3863  	return meta_needed;
b5ea834dde6b6e7 Yonghong Song    2021-09-14  3864  }
b5ea834dde6b6e7 Yonghong Song    2021-09-14  3865  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3652696973043360019==--

