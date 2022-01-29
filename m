Content-Type: multipart/mixed; boundary="===============7168915036796773502=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 648/2855] kernel/bpf/btf.c:6613 btf_populate_kfunc_set() error: uninitialized symbol 'ret'.
Date: Sat, 29 Jan 2022 12:12:59 +0800
Message-ID: <202201291223.4Eukxxfd-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7168915036796773502==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   b605fdc54c2b28c30ef06d9db99282d8a32ae4be
commit: dee872e124e8d5de22b68c58f6f6c3f5e8889160 [648/2855] bpf: Populate k=
func BTF ID sets in struct btf
:::::: branch date: 24 hours ago
:::::: commit date: 10 days ago
config: powerpc64-randconfig-m031-20220125 (https://download.01.org/0day-ci=
/archive/20220129/202201291223.4Eukxxfd-lkp(a)intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/bpf/btf.c:6613 btf_populate_kfunc_set() error: uninitialized symbol =
'ret'.

vim +/ret +6613 kernel/bpf/btf.c

dee872e124e8d5 Kumar Kartikeya Dwivedi 2022-01-14  6598  =

dee872e124e8d5 Kumar Kartikeya Dwivedi 2022-01-14  6599  static int btf_pop=
ulate_kfunc_set(struct btf *btf, enum btf_kfunc_hook hook,
dee872e124e8d5 Kumar Kartikeya Dwivedi 2022-01-14  6600  				  const struct=
 btf_kfunc_id_set *kset)
dee872e124e8d5 Kumar Kartikeya Dwivedi 2022-01-14  6601  {
dee872e124e8d5 Kumar Kartikeya Dwivedi 2022-01-14  6602  	bool vmlinux_set =
=3D !btf_is_module(btf);
dee872e124e8d5 Kumar Kartikeya Dwivedi 2022-01-14  6603  	int type, ret;
dee872e124e8d5 Kumar Kartikeya Dwivedi 2022-01-14  6604  =

dee872e124e8d5 Kumar Kartikeya Dwivedi 2022-01-14  6605  	for (type =3D 0; =
type < ARRAY_SIZE(kset->sets); type++) {
dee872e124e8d5 Kumar Kartikeya Dwivedi 2022-01-14  6606  		if (!kset->sets[=
type])
dee872e124e8d5 Kumar Kartikeya Dwivedi 2022-01-14  6607  			continue;
dee872e124e8d5 Kumar Kartikeya Dwivedi 2022-01-14  6608  =

dee872e124e8d5 Kumar Kartikeya Dwivedi 2022-01-14  6609  		ret =3D __btf_po=
pulate_kfunc_set(btf, hook, type, kset->sets[type], vmlinux_set);
dee872e124e8d5 Kumar Kartikeya Dwivedi 2022-01-14  6610  		if (ret)
dee872e124e8d5 Kumar Kartikeya Dwivedi 2022-01-14  6611  			break;
dee872e124e8d5 Kumar Kartikeya Dwivedi 2022-01-14  6612  	}
dee872e124e8d5 Kumar Kartikeya Dwivedi 2022-01-14 @6613  	return ret;
dee872e124e8d5 Kumar Kartikeya Dwivedi 2022-01-14  6614  }
dee872e124e8d5 Kumar Kartikeya Dwivedi 2022-01-14  6615  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7168915036796773502==--

