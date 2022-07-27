Content-Type: multipart/mixed; boundary="===============1995441146878216681=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH bpf-next 1/3] bpf: Add support for qp-trie map
Date: Wed, 27 Jul 2022 12:00:22 +0800
Message-ID: <202207271105.4Ac6T2QV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1995441146878216681==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: kernel/bp=
f/bpf_qp_trie.c:648:25: sparse: sparse: division by zero"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220726130005.3102470-2-houtao1@huawei.com>
References: <20220726130005.3102470-2-houtao1@huawei.com>
TO: Hou Tao <houtao1@huawei.com>

Hi Hou,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Hou-Tao/Add-support-=
for-qp-trie-map/20220726-204347
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: m68k-randconfig-s053-20220726 (https://download.01.org/0day-ci/arch=
ive/20220727/202207271105.4Ac6T2QV-lkp(a)intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/74890023aaa2d8ffed5=
4d96d4999f10bf14ccfef
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Hou-Tao/Add-support-for-qp-trie-ma=
p/20220726-204347
        git checkout 74890023aaa2d8ffed54d96d4999f10bf14ccfef
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dm=
68k SHELL=3D/bin/bash kernel/bpf/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   kernel/bpf/bpf_qp_trie.c:232:48: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void *node @@     got void=
 [noderef] __rcu * @@
   kernel/bpf/bpf_qp_trie.c:232:48: sparse:     expected void *node
   kernel/bpf/bpf_qp_trie.c:232:48: sparse:     got void [noderef] __rcu *
   kernel/bpf/bpf_qp_trie.c:263:60: sparse: sparse: incorrect type in argum=
ent 2 (different address spaces) @@     expected void *node @@     got void=
 [noderef] __rcu * @@
   kernel/bpf/bpf_qp_trie.c:263:60: sparse:     expected void *node
   kernel/bpf/bpf_qp_trie.c:263:60: sparse:     got void [noderef] __rcu *
   kernel/bpf/bpf_qp_trie.c:436:9: sparse: sparse: incompatible types in co=
mparison expression (different address spaces):
   kernel/bpf/bpf_qp_trie.c:436:9: sparse:    struct qp_trie_branch [nodere=
f] __rcu *
   kernel/bpf/bpf_qp_trie.c:436:9: sparse:    struct qp_trie_branch *
   kernel/bpf/bpf_qp_trie.c:477:9: sparse: sparse: incompatible types in co=
mparison expression (different address spaces):
   kernel/bpf/bpf_qp_trie.c:477:9: sparse:    struct qp_trie_branch [nodere=
f] __rcu *
   kernel/bpf/bpf_qp_trie.c:477:9: sparse:    struct qp_trie_branch *
   kernel/bpf/bpf_qp_trie.c:518:9: sparse: sparse: incompatible types in co=
mparison expression (different address spaces):
   kernel/bpf/bpf_qp_trie.c:518:9: sparse:    struct qp_trie_branch [nodere=
f] __rcu *
   kernel/bpf/bpf_qp_trie.c:518:9: sparse:    struct qp_trie_branch *
   kernel/bpf/bpf_qp_trie.c:547:9: sparse: sparse: incompatible types in co=
mparison expression (different address spaces):
   kernel/bpf/bpf_qp_trie.c:547:9: sparse:    struct qp_trie_branch [nodere=
f] __rcu *
   kernel/bpf/bpf_qp_trie.c:547:9: sparse:    struct qp_trie_branch *
   kernel/bpf/bpf_qp_trie.c:574:9: sparse: sparse: incompatible types in co=
mparison expression (different address spaces):
   kernel/bpf/bpf_qp_trie.c:574:9: sparse:    struct qp_trie_branch [nodere=
f] __rcu *
   kernel/bpf/bpf_qp_trie.c:574:9: sparse:    struct qp_trie_branch *
   kernel/bpf/bpf_qp_trie.c:593:21: sparse: sparse: incorrect type in assig=
nment (different address spaces) @@     expected void *new_sibling @@     g=
ot void [noderef] __rcu * @@
   kernel/bpf/bpf_qp_trie.c:600:9: sparse: sparse: incompatible types in co=
mparison expression (different address spaces):
   kernel/bpf/bpf_qp_trie.c:600:9: sparse:    struct qp_trie_branch [nodere=
f] __rcu *
   kernel/bpf/bpf_qp_trie.c:600:9: sparse:    struct qp_trie_branch *
   kernel/bpf/bpf_qp_trie.c:923:14: sparse: sparse: incorrect type in assig=
nment (different address spaces) @@     expected void **node @@     got voi=
d [noderef] __rcu ** @@
   kernel/bpf/bpf_qp_trie.c:934:22: sparse: sparse: incorrect type in assig=
nment (different address spaces) @@     expected void **node @@     got voi=
d [noderef] __rcu ** @@
   kernel/bpf/bpf_qp_trie.c:953:14: sparse: sparse: incorrect type in assig=
nment (different address spaces) @@     expected void **node @@     got voi=
d [noderef] __rcu ** @@
   kernel/bpf/bpf_qp_trie.c:973:22: sparse: sparse: incorrect type in assig=
nment (different address spaces) @@     expected void **node @@     got voi=
d [noderef] __rcu ** @@
   kernel/bpf/bpf_qp_trie.c:1010:14: sparse: sparse: incorrect type in assi=
gnment (different address spaces) @@     expected void **node @@     got vo=
id [noderef] __rcu ** @@
   kernel/bpf/bpf_qp_trie.c:1026:22: sparse: sparse: incorrect type in assi=
gnment (different address spaces) @@     expected void **node @@     got vo=
id [noderef] __rcu ** @@
>> kernel/bpf/bpf_qp_trie.c:648:25: sparse: sparse: division by zero

vim +648 kernel/bpf/bpf_qp_trie.c

74890023aaa2d8f Hou Tao 2022-07-26  637  =

74890023aaa2d8f Hou Tao 2022-07-26  638  static struct bpf_map *qp_trie_all=
oc(union bpf_attr *attr)
74890023aaa2d8f Hou Tao 2022-07-26  639  {
74890023aaa2d8f Hou Tao 2022-07-26  640  	struct qp_trie *trie;
74890023aaa2d8f Hou Tao 2022-07-26  641  	unsigned int i;
74890023aaa2d8f Hou Tao 2022-07-26  642  =

74890023aaa2d8f Hou Tao 2022-07-26  643  	trie =3D bpf_map_area_alloc(sizeo=
f(*trie), bpf_map_attr_numa_node(attr));
74890023aaa2d8f Hou Tao 2022-07-26  644  	if (!trie)
74890023aaa2d8f Hou Tao 2022-07-26  645  		return ERR_PTR(-ENOMEM);
74890023aaa2d8f Hou Tao 2022-07-26  646  =

74890023aaa2d8f Hou Tao 2022-07-26  647  	/* roots are zeroed by bpf_map_ar=
ea_alloc() */
74890023aaa2d8f Hou Tao 2022-07-26 @648  	for (i =3D 0; i < ARRAY_SIZE(trie=
->locks); i++)
74890023aaa2d8f Hou Tao 2022-07-26  649  		spin_lock_init(&trie->locks[i]);
74890023aaa2d8f Hou Tao 2022-07-26  650  =

74890023aaa2d8f Hou Tao 2022-07-26  651  	atomic_set(&trie->entries, 0);
74890023aaa2d8f Hou Tao 2022-07-26  652  	bpf_map_init_from_attr(&trie->map=
, attr);
74890023aaa2d8f Hou Tao 2022-07-26  653  =

74890023aaa2d8f Hou Tao 2022-07-26  654  	return &trie->map;
74890023aaa2d8f Hou Tao 2022-07-26  655  }
74890023aaa2d8f Hou Tao 2022-07-26  656  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1995441146878216681==--

