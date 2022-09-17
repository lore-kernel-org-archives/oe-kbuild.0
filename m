Content-Type: multipart/mixed; boundary="===============7876736004378258624=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4493/7639] kernel/bpf/memalloc.c:344 bpf_mem_alloc_destroy() error: potentially dereferencing uninitialized 'c'.
Date: Sat, 17 Sep 2022 18:42:47 +0800
Message-ID: <202209171821.7fj8Q7mp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7876736004378258624==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Alexei Starovoitov <ast@kernel.org>
CC: Daniel Borkmann <daniel@iogearbox.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   d5538ab91d3a9a237805be6f8c6c272af2987995
commit: 7c8199e24fa09d2344ae0204527d55d7803e8409 [4493/7639] bpf: Introduce=
 any context BPF specific memory allocator.
:::::: branch date: 28 hours ago
:::::: commit date: 12 days ago
config: ia64-randconfig-m031-20220915 (https://download.01.org/0day-ci/arch=
ive/20220917/202209171821.7fj8Q7mp-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/bpf/memalloc.c:344 bpf_mem_alloc_destroy() error: potentially derefe=
rencing uninitialized 'c'.

vim +/c +344 kernel/bpf/memalloc.c

7c8199e24fa09d Alexei Starovoitov 2022-09-02  331  =

7c8199e24fa09d Alexei Starovoitov 2022-09-02  332  void bpf_mem_alloc_destr=
oy(struct bpf_mem_alloc *ma)
7c8199e24fa09d Alexei Starovoitov 2022-09-02  333  {
7c8199e24fa09d Alexei Starovoitov 2022-09-02  334  	struct bpf_mem_caches *=
cc;
7c8199e24fa09d Alexei Starovoitov 2022-09-02  335  	struct bpf_mem_cache *c;
7c8199e24fa09d Alexei Starovoitov 2022-09-02  336  	int cpu, i;
7c8199e24fa09d Alexei Starovoitov 2022-09-02  337  =

7c8199e24fa09d Alexei Starovoitov 2022-09-02  338  	if (ma->cache) {
7c8199e24fa09d Alexei Starovoitov 2022-09-02  339  		for_each_possible_cpu(=
cpu) {
7c8199e24fa09d Alexei Starovoitov 2022-09-02  340  			c =3D per_cpu_ptr(ma-=
>cache, cpu);
7c8199e24fa09d Alexei Starovoitov 2022-09-02  341  			drain_mem_cache(c);
7c8199e24fa09d Alexei Starovoitov 2022-09-02  342  		}
7c8199e24fa09d Alexei Starovoitov 2022-09-02  343  		/* kmem_cache and memc=
g are the same across cpus */
7c8199e24fa09d Alexei Starovoitov 2022-09-02 @344  		kmem_cache_destroy(c->=
kmem_cache);
7c8199e24fa09d Alexei Starovoitov 2022-09-02  345  		if (c->objcg)
7c8199e24fa09d Alexei Starovoitov 2022-09-02  346  			obj_cgroup_put(c->obj=
cg);
7c8199e24fa09d Alexei Starovoitov 2022-09-02  347  		free_percpu(ma->cache);
7c8199e24fa09d Alexei Starovoitov 2022-09-02  348  		ma->cache =3D NULL;
7c8199e24fa09d Alexei Starovoitov 2022-09-02  349  	}
7c8199e24fa09d Alexei Starovoitov 2022-09-02  350  	if (ma->caches) {
7c8199e24fa09d Alexei Starovoitov 2022-09-02  351  		for_each_possible_cpu(=
cpu) {
7c8199e24fa09d Alexei Starovoitov 2022-09-02  352  			cc =3D per_cpu_ptr(ma=
->caches, cpu);
7c8199e24fa09d Alexei Starovoitov 2022-09-02  353  			for (i =3D 0; i < NUM=
_CACHES; i++) {
7c8199e24fa09d Alexei Starovoitov 2022-09-02  354  				c =3D &cc->cache[i];
7c8199e24fa09d Alexei Starovoitov 2022-09-02  355  				drain_mem_cache(c);
7c8199e24fa09d Alexei Starovoitov 2022-09-02  356  			}
7c8199e24fa09d Alexei Starovoitov 2022-09-02  357  		}
7c8199e24fa09d Alexei Starovoitov 2022-09-02  358  		if (c->objcg)
7c8199e24fa09d Alexei Starovoitov 2022-09-02  359  			obj_cgroup_put(c->obj=
cg);
7c8199e24fa09d Alexei Starovoitov 2022-09-02  360  		free_percpu(ma->caches=
);
7c8199e24fa09d Alexei Starovoitov 2022-09-02  361  		ma->caches =3D NULL;
7c8199e24fa09d Alexei Starovoitov 2022-09-02  362  	}
7c8199e24fa09d Alexei Starovoitov 2022-09-02  363  }
7c8199e24fa09d Alexei Starovoitov 2022-09-02  364  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7876736004378258624==--

