Content-Type: multipart/mixed; boundary="===============6629722941158463941=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:bpf/bpf-next/master 18/45] kernel/bpf/btf.c:4584:5: warning: union member 'Anonymous3::__t' is never used. [unusedStructMember]
Date: Thu, 20 Jan 2022 11:28:03 +0800
Message-ID: <202201201135.MlbTXxnz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6629722941158463941==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: "GNU/Weeb Mailing List" <gwml@gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://github.com/ammarfaizi2/linux-block bpf/bpf-next/master
head:   4e950747ba126eb4accacf8f8b10459f374e6e9e
commit: dee872e124e8d5de22b68c58f6f6c3f5e8889160 [18/45] bpf: Populate kfun=
c BTF ID sets in struct btf
:::::: branch date: 6 hours ago
:::::: commit date: 29 hours ago
compiler: m68k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

                ^
   kernel/bpf/btf.c:4898:38: note: Null pointer addition
    args =3D (const struct btf_param *)(t + 1);
                                        ^
>> kernel/bpf/btf.c:4584:5: warning: union member 'Anonymous3::__t' is neve=
r used. [unusedStructMember]
    } *__t;
       ^
   kernel/bpf/btf.c:3877:29: warning: Variable 'tag' is not assigned a valu=
e. [unassignedVariable]
    const struct btf_decl_tag *tag;
                               ^

vim +4584 kernel/bpf/btf.c

91cc1a99740e2e Alexei Starovoitov 2019-11-14  4574  =

91cc1a99740e2e Alexei Starovoitov 2019-11-14  4575  #define BPF_MAP_TYPE(_i=
d, _ops)
f2e10bff16a0fd Andrii Nakryiko    2020-04-28  4576  #define BPF_LINK_TYPE(_=
id, _name)
91cc1a99740e2e Alexei Starovoitov 2019-11-14  4577  static union {
91cc1a99740e2e Alexei Starovoitov 2019-11-14  4578  	struct bpf_ctx_convert=
 {
91cc1a99740e2e Alexei Starovoitov 2019-11-14  4579  #define BPF_PROG_TYPE(_=
id, _name, prog_ctx_type, kern_ctx_type) \
91cc1a99740e2e Alexei Starovoitov 2019-11-14  4580  	prog_ctx_type _id##_pr=
og; \
91cc1a99740e2e Alexei Starovoitov 2019-11-14  4581  	kern_ctx_type _id##_ke=
rn;
91cc1a99740e2e Alexei Starovoitov 2019-11-14  4582  #include <linux/bpf_typ=
es.h>
91cc1a99740e2e Alexei Starovoitov 2019-11-14  4583  #undef BPF_PROG_TYPE
91cc1a99740e2e Alexei Starovoitov 2019-11-14 @4584  	} *__t;
91cc1a99740e2e Alexei Starovoitov 2019-11-14  4585  	/* 't' is written once=
 under lock. Read many times. */
91cc1a99740e2e Alexei Starovoitov 2019-11-14  4586  	const struct btf_type =
*t;
91cc1a99740e2e Alexei Starovoitov 2019-11-14  4587  } bpf_ctx_convert;
91cc1a99740e2e Alexei Starovoitov 2019-11-14  4588  enum {
91cc1a99740e2e Alexei Starovoitov 2019-11-14  4589  #define BPF_PROG_TYPE(_=
id, _name, prog_ctx_type, kern_ctx_type) \
91cc1a99740e2e Alexei Starovoitov 2019-11-14  4590  	__ctx_convert##_id,
91cc1a99740e2e Alexei Starovoitov 2019-11-14  4591  #include <linux/bpf_typ=
es.h>
91cc1a99740e2e Alexei Starovoitov 2019-11-14  4592  #undef BPF_PROG_TYPE
ce27709b8162e5 Alexei Starovoitov 2019-11-27  4593  	__ctx_convert_unused, =
/* to avoid empty enum in extreme .config */
91cc1a99740e2e Alexei Starovoitov 2019-11-14  4594  };
91cc1a99740e2e Alexei Starovoitov 2019-11-14  4595  static u8 bpf_ctx_conve=
rt_map[] =3D {
91cc1a99740e2e Alexei Starovoitov 2019-11-14  4596  #define BPF_PROG_TYPE(_=
id, _name, prog_ctx_type, kern_ctx_type) \
91cc1a99740e2e Alexei Starovoitov 2019-11-14  4597  	[_id] =3D __ctx_conver=
t##_id,
91cc1a99740e2e Alexei Starovoitov 2019-11-14  4598  #include <linux/bpf_typ=
es.h>
91cc1a99740e2e Alexei Starovoitov 2019-11-14  4599  #undef BPF_PROG_TYPE
4c80c7bc583a87 Arnd Bergmann      2019-12-10  4600  	0, /* avoid empty arra=
y */
91cc1a99740e2e Alexei Starovoitov 2019-11-14  4601  };
91cc1a99740e2e Alexei Starovoitov 2019-11-14  4602  #undef BPF_MAP_TYPE
f2e10bff16a0fd Andrii Nakryiko    2020-04-28  4603  #undef BPF_LINK_TYPE
91cc1a99740e2e Alexei Starovoitov 2019-11-14  4604  =


:::::: The code at line 4584 was first introduced by commit
:::::: 91cc1a99740e2ed1d903b5906afb470cc5a07379 bpf: Annotate context types

:::::: TO: Alexei Starovoitov <ast@kernel.org>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6629722941158463941==--

