Content-Type: multipart/mixed; boundary="===============2292512797100097162=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4799/5667] kernel/bpf/memalloc.c:344 bpf_mem_alloc_destroy() error: potentially dereferencing uninitialized 'c'.
Date: Wed, 07 Sep 2022 03:38:02 +0800
Message-ID: <202209070305.VxmSXfFv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2292512797100097162==
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
head:   840126e36e8ff272cb63158646433fa1324533d9
commit: 7c8199e24fa09d2344ae0204527d55d7803e8409 [4799/5667] bpf: Introduce=
 any context BPF specific memory allocator.
:::::: branch date: 8 hours ago
:::::: commit date: 30 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
907/202209070305.VxmSXfFv-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

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
--===============2292512797100097162==--

