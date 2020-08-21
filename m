Content-Type: multipart/mixed; boundary="===============5857214975698779495=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH bpf-next v4 27/30] bpf: eliminate rlimit-based memory accounting for xskmap maps
Date: Sat, 22 Aug 2020 03:43:20 +0800
Message-ID: <202008220357.daByHaxo%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5857214975698779495==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200821150134.2581465-28-guro@fb.com>
References: <20200821150134.2581465-28-guro@fb.com>
TO: Roman Gushchin <guro@fb.com>

Hi Roman,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Roman-Gushchin/bpf-switch-=
to-memcg-based-memory-accounting/20200821-233104
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> net/xdp/xskmap.c:77:6: warning: Unused variable: err [unusedVariable]
    int err, numa_node;
        ^

# https://github.com/0day-ci/linux/commit/af82aa6260a6db216f3e1f17c2eb15d5c=
36909bd
git remote add linux-review https://github.com/0day-ci/linux
git fetch --no-tags linux-review Roman-Gushchin/bpf-switch-to-memcg-based-m=
emory-accounting/20200821-233104
git checkout af82aa6260a6db216f3e1f17c2eb15d5c36909bd
vim +77 net/xdp/xskmap.c

0402acd683c6788 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel    2019-08-15   7=
4  =

fbfc504a24f53f7 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel    2018-05-02   7=
5  static struct bpf_map *xsk_map_alloc(union bpf_attr *attr)
fbfc504a24f53f7 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel    2018-05-02   7=
6  {
e312b9e706ed6d9 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel    2019-12-19  @7=
7  	int err, numa_node;
fbfc504a24f53f7 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel    2018-05-02   7=
8  	struct xsk_map *m;
e312b9e706ed6d9 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel    2019-12-19   7=
9  	u64 size;
fbfc504a24f53f7 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel    2018-05-02   8=
0  =

fbfc504a24f53f7 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel    2018-05-02   8=
1  	if (!capable(CAP_NET_ADMIN))
fbfc504a24f53f7 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel    2018-05-02   8=
2  		return ERR_PTR(-EPERM);
fbfc504a24f53f7 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel    2018-05-02   8=
3  =

fbfc504a24f53f7 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel    2018-05-02   8=
4  	if (attr->max_entries =3D=3D 0 || attr->key_size !=3D 4 ||
fbfc504a24f53f7 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel    2018-05-02   8=
5  	    attr->value_size !=3D 4 ||
fbfc504a24f53f7 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel    2018-05-02   8=
6  	    attr->map_flags & ~(BPF_F_NUMA_NODE | BPF_F_RDONLY | BPF_F_WRONLY))
fbfc504a24f53f7 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel    2018-05-02   8=
7  		return ERR_PTR(-EINVAL);
fbfc504a24f53f7 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel    2018-05-02   8=
8  =

64fe8c061de7d7f kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel    2019-11-01   8=
9  	numa_node =3D bpf_map_attr_numa_node(attr);
64fe8c061de7d7f kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel    2019-11-01   9=
0  	size =3D struct_size(m, xsk_map, attr->max_entries);
64fe8c061de7d7f kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel    2019-11-01   9=
1  =

64fe8c061de7d7f kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel    2019-11-01   9=
2  	m =3D bpf_map_area_alloc(size, numa_node);
af82aa6260a6db2 net/xdp/xskmap.c    Roman Gushchin 2020-08-21   93  	if (!m)
fbfc504a24f53f7 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel    2018-05-02   9=
4  		return ERR_PTR(-ENOMEM);
fbfc504a24f53f7 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel    2018-05-02   9=
5  =

fbfc504a24f53f7 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel    2018-05-02   9=
6  	bpf_map_init_from_attr(&m->map, attr);
0402acd683c6788 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel    2019-08-15   9=
7  	spin_lock_init(&m->lock);
fbfc504a24f53f7 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel    2018-05-02   9=
8  =

fbfc504a24f53f7 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel    2018-05-02   9=
9  	return &m->map;
fbfc504a24f53f7 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel    2018-05-02  10=
0  }
fbfc504a24f53f7 kernel/bpf/xskmap.c Bj=C3=B6rn T=C3=B6pel    2018-05-02  10=
1  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5857214975698779495==--

