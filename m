Content-Type: multipart/mixed; boundary="===============2022311466351673758=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 8713/8895] mm/slub.c:3063:16: warning: Local variable flush_slab shadows outer function [shadowFunction]
Date: Wed, 22 Dec 2021 03:13:10 +0800
Message-ID: <202112220235.ThWT1LcU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2022311466351673758==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Vlastimil Babka <vbabka@suse.cz>
CC: Roman Gushchin <guro@fb.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   2850c2311ef4bf30ae8dd8927f0f66b026ff08fb
commit: 86d75bda97ce13d7560c277e00ca98d65bd19170 [8713/8895] mm/slub: Conve=
rt most struct page to struct slab by spatch
:::::: branch date: 6 hours ago
:::::: commit date: 18 hours ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> mm/slub.c:3063:16: warning: Local variable flush_slab shadows outer func=
tion [shadowFunction]
     struct slab *flush_slab =3D c->slab;
                  ^
   mm/slub.c:2626:20: note: Shadowed declaration
   static inline void flush_slab(struct kmem_cache *s, struct kmem_cache_cp=
u *c)
                      ^
   mm/slub.c:3063:16: note: Shadow variable
     struct slab *flush_slab =3D c->slab;
                  ^
>> mm/slub.c:3804:16: warning: Local variable slab_size shadows outer funct=
ion [shadowFunction]
     unsigned int slab_size =3D (unsigned int)PAGE_SIZE << order;
                  ^
   mm/slab.h:170:22: note: Shadowed declaration
   static inline size_t slab_size(const struct slab *slab)
                        ^
   mm/slub.c:3804:16: note: Shadow variable
     unsigned int slab_size =3D (unsigned int)PAGE_SIZE << order;
                  ^
   mm/slub.c:5887:4: warning: Either the condition '!name' is redundant or =
there is pointer arithmetic with NULL pointer. [nullPointerArithmeticRedund=
antCheck]
    *p++ =3D ':';
      ^
   mm/slub.c:5885:9: note: Assuming that condition '!name' is not redundant
    BUG_ON(!name);
           ^
   mm/slub.c:5883:12: note: Assignment 'p=3Dname', assigned value is 0
    char *p =3D name;
              ^
   mm/slub.c:5887:4: note: Null pointer addition
    *p++ =3D ':';
      ^

vim +3063 mm/slub.c

213eeb9fd9d66c Christoph Lameter         2011-11-11  2876  =

81819f0fc8285a Christoph Lameter         2007-05-06  2877  /*
894b8788d7f265 Christoph Lameter         2007-05-10  2878   * Slow path. Th=
e lockless freelist is empty or we need to perform
894b8788d7f265 Christoph Lameter         2007-05-10  2879   * debugging dut=
ies.
894b8788d7f265 Christoph Lameter         2007-05-10  2880   *
894b8788d7f265 Christoph Lameter         2007-05-10  2881   * Processing is=
 still very fast if new objects have been freed to the
894b8788d7f265 Christoph Lameter         2007-05-10  2882   * regular freel=
ist. In that case we simply take over the regular freelist
894b8788d7f265 Christoph Lameter         2007-05-10  2883   * as the lockle=
ss freelist and zap the regular freelist.
81819f0fc8285a Christoph Lameter         2007-05-06  2884   *
894b8788d7f265 Christoph Lameter         2007-05-10  2885   * If that is no=
t working then we fall back to the partial lists. We take the
894b8788d7f265 Christoph Lameter         2007-05-10  2886   * first element=
 of the freelist as the object to allocate now and move the
894b8788d7f265 Christoph Lameter         2007-05-10  2887   * rest of the f=
reelist to the lockless freelist.
81819f0fc8285a Christoph Lameter         2007-05-06  2888   *
894b8788d7f265 Christoph Lameter         2007-05-10  2889   * And if we wer=
e unable to get a new slab from the partial slab lists then
6446faa2ff30ca Christoph Lameter         2008-02-15  2890   * we need to al=
locate a new slab. This is the slowest path since it involves
6446faa2ff30ca Christoph Lameter         2008-02-15  2891   * a call to the=
 page allocator and the setup of a new slab.
a380a3c75529a5 Christoph Lameter         2015-11-20  2892   *
e500059ba55268 Vlastimil Babka           2021-05-07  2893   * Version of __=
slab_alloc to use when we know that preemption is
a380a3c75529a5 Christoph Lameter         2015-11-20  2894   * already disab=
led (which is the case for bulk allocation).
81819f0fc8285a Christoph Lameter         2007-05-06  2895   */
a380a3c75529a5 Christoph Lameter         2015-11-20  2896  static void *___=
slab_alloc(struct kmem_cache *s, gfp_t gfpflags, int node,
ce71e27c6fdc43 Eduard - Gabriel Munteanu 2008-08-19  2897  			  unsigned lo=
ng addr, struct kmem_cache_cpu *c)
81819f0fc8285a Christoph Lameter         2007-05-06  2898  {
6faa68337b0c90 Christoph Lameter         2012-05-09  2899  	void *freelist;
86d75bda97ce13 Vlastimil Babka           2021-11-03  2900  	struct slab *sl=
ab;
e500059ba55268 Vlastimil Babka           2021-05-07  2901  	unsigned long f=
lags;
81819f0fc8285a Christoph Lameter         2007-05-06  2902  =

9f986d998a3001 Abel Wu                   2020-10-13  2903  	stat(s, ALLOC_S=
LOWPATH);
9f986d998a3001 Abel Wu                   2020-10-13  2904  =

0b303fb402862d Vlastimil Babka           2021-05-08  2905  reread_page:
0b303fb402862d Vlastimil Babka           2021-05-08  2906  =

86d75bda97ce13 Vlastimil Babka           2021-11-03  2907  	slab =3D READ_O=
NCE(c->slab);
86d75bda97ce13 Vlastimil Babka           2021-11-03  2908  	if (!slab) {
0715e6c516f106 Vlastimil Babka           2020-03-21  2909  		/*
0715e6c516f106 Vlastimil Babka           2020-03-21  2910  		 * if the node=
 is not online or has no normal memory, just
0715e6c516f106 Vlastimil Babka           2020-03-21  2911  		 * ignore the =
node constraint
0715e6c516f106 Vlastimil Babka           2020-03-21  2912  		 */
0715e6c516f106 Vlastimil Babka           2020-03-21  2913  		if (unlikely(n=
ode !=3D NUMA_NO_NODE &&
7e1fa93deff446 Vlastimil Babka           2021-02-24  2914  			     !node_is=
set(node, slab_nodes)))
0715e6c516f106 Vlastimil Babka           2020-03-21  2915  			node =3D NUMA=
_NO_NODE;
81819f0fc8285a Christoph Lameter         2007-05-06  2916  		goto new_slab;
0715e6c516f106 Vlastimil Babka           2020-03-21  2917  	}
49e2258586b423 Christoph Lameter         2011-08-09  2918  redo:
6faa68337b0c90 Christoph Lameter         2012-05-09  2919  =

86d75bda97ce13 Vlastimil Babka           2021-11-03  2920  	if (unlikely(!n=
ode_match(slab, node))) {
0715e6c516f106 Vlastimil Babka           2020-03-21  2921  		/*
0715e6c516f106 Vlastimil Babka           2020-03-21  2922  		 * same as abo=
ve but node_match() being false already
0715e6c516f106 Vlastimil Babka           2020-03-21  2923  		 * implies nod=
e !=3D NUMA_NO_NODE
0715e6c516f106 Vlastimil Babka           2020-03-21  2924  		 */
7e1fa93deff446 Vlastimil Babka           2021-02-24  2925  		if (!node_isse=
t(node, slab_nodes)) {
0715e6c516f106 Vlastimil Babka           2020-03-21  2926  			node =3D NUMA=
_NO_NODE;
0715e6c516f106 Vlastimil Babka           2020-03-21  2927  			goto redo;
0715e6c516f106 Vlastimil Babka           2020-03-21  2928  		} else {
e36a2652d7d1ad Christoph Lameter         2011-06-01  2929  			stat(s, ALLOC=
_NODE_MISMATCH);
0b303fb402862d Vlastimil Babka           2021-05-08  2930  			goto deactiva=
te_slab;
fc59c05306fe1d Christoph Lameter         2011-06-01  2931  		}
a561ce00b09e15 Joonsoo Kim               2014-10-09  2932  	}
6446faa2ff30ca Christoph Lameter         2008-02-15  2933  =

072bb0aa5e0629 Mel Gorman                2012-07-31  2934  	/*
072bb0aa5e0629 Mel Gorman                2012-07-31  2935  	 * By rights, w=
e should be searching for a slab page that was
072bb0aa5e0629 Mel Gorman                2012-07-31  2936  	 * PFMEMALLOC b=
ut right now, we are losing the pfmemalloc
072bb0aa5e0629 Mel Gorman                2012-07-31  2937  	 * information =
when the page leaves the per-cpu allocator
072bb0aa5e0629 Mel Gorman                2012-07-31  2938  	 */
86d75bda97ce13 Vlastimil Babka           2021-11-03  2939  	if (unlikely(!p=
fmemalloc_match(slab, gfpflags)))
0b303fb402862d Vlastimil Babka           2021-05-08  2940  		goto deactivat=
e_slab;
072bb0aa5e0629 Mel Gorman                2012-07-31  2941  =

25c00c506e8176 Vlastimil Babka           2021-05-21  2942  	/* must check a=
gain c->page in case we got preempted and it changed */
bd0e7491a931f5 Vlastimil Babka           2021-05-22  2943  	local_lock_irqs=
ave(&s->cpu_slab->lock, flags);
86d75bda97ce13 Vlastimil Babka           2021-11-03  2944  	if (unlikely(sl=
ab !=3D c->slab)) {
bd0e7491a931f5 Vlastimil Babka           2021-05-22  2945  		local_unlock_i=
rqrestore(&s->cpu_slab->lock, flags);
0b303fb402862d Vlastimil Babka           2021-05-08  2946  		goto reread_pa=
ge;
0b303fb402862d Vlastimil Babka           2021-05-08  2947  	}
6faa68337b0c90 Christoph Lameter         2012-05-09  2948  	freelist =3D c-=
>freelist;
6faa68337b0c90 Christoph Lameter         2012-05-09  2949  	if (freelist)
73736e0387ba0e Eric Dumazet              2011-12-13  2950  		goto load_free=
list;
01ad8a7bc226dd Christoph Lameter         2011-04-15  2951  =

86d75bda97ce13 Vlastimil Babka           2021-11-03  2952  	freelist =3D ge=
t_freelist(s, slab);
6446faa2ff30ca Christoph Lameter         2008-02-15  2953  =

6faa68337b0c90 Christoph Lameter         2012-05-09  2954  	if (!freelist) {
86d75bda97ce13 Vlastimil Babka           2021-11-03  2955  		c->slab =3D NU=
LL;
bd0e7491a931f5 Vlastimil Babka           2021-05-22  2956  		local_unlock_i=
rqrestore(&s->cpu_slab->lock, flags);
03e404af26dc2e Christoph Lameter         2011-06-01  2957  		stat(s, DEACTI=
VATE_BYPASS);
fc59c05306fe1d Christoph Lameter         2011-06-01  2958  		goto new_slab;
03e404af26dc2e Christoph Lameter         2011-06-01  2959  	}
81819f0fc8285a Christoph Lameter         2007-05-06  2960  =

2cfb7455d223ab Christoph Lameter         2011-06-01  2961  	stat(s, ALLOC_R=
EFILL);
01ad8a7bc226dd Christoph Lameter         2011-04-15  2962  =

4eade540fc3535 Christoph Lameter         2011-06-01  2963  load_freelist:
0b303fb402862d Vlastimil Babka           2021-05-08  2964  =

bd0e7491a931f5 Vlastimil Babka           2021-05-22  2965  	lockdep_assert_=
held(this_cpu_ptr(&s->cpu_slab->lock));
0b303fb402862d Vlastimil Babka           2021-05-08  2966  =

507effeaba29bf Christoph Lameter         2012-05-09  2967  	/*
507effeaba29bf Christoph Lameter         2012-05-09  2968  	 * freelist is =
pointing to the list of objects to be used.
507effeaba29bf Christoph Lameter         2012-05-09  2969  	 * page is poin=
ting to the page from which the objects are obtained.
507effeaba29bf Christoph Lameter         2012-05-09  2970  	 * That page mu=
st be frozen for per cpu allocations to work.
507effeaba29bf Christoph Lameter         2012-05-09  2971  	 */
86d75bda97ce13 Vlastimil Babka           2021-11-03  2972  	VM_BUG_ON(!c->s=
lab->frozen);
6faa68337b0c90 Christoph Lameter         2012-05-09  2973  	c->freelist =3D=
 get_freepointer(s, freelist);
8a5ec0ba42c491 Christoph Lameter         2011-02-25  2974  	c->tid =3D next=
_tid(c->tid);
bd0e7491a931f5 Vlastimil Babka           2021-05-22  2975  	local_unlock_ir=
qrestore(&s->cpu_slab->lock, flags);
6faa68337b0c90 Christoph Lameter         2012-05-09  2976  	return freelist;
81819f0fc8285a Christoph Lameter         2007-05-06  2977  =

0b303fb402862d Vlastimil Babka           2021-05-08  2978  deactivate_slab:
0b303fb402862d Vlastimil Babka           2021-05-08  2979  =

bd0e7491a931f5 Vlastimil Babka           2021-05-22  2980  	local_lock_irqs=
ave(&s->cpu_slab->lock, flags);
86d75bda97ce13 Vlastimil Babka           2021-11-03  2981  	if (slab !=3D c=
->slab) {
bd0e7491a931f5 Vlastimil Babka           2021-05-22  2982  		local_unlock_i=
rqrestore(&s->cpu_slab->lock, flags);
0b303fb402862d Vlastimil Babka           2021-05-08  2983  		goto reread_pa=
ge;
0b303fb402862d Vlastimil Babka           2021-05-08  2984  	}
a019d20162586a Vlastimil Babka           2021-05-12  2985  	freelist =3D c-=
>freelist;
86d75bda97ce13 Vlastimil Babka           2021-11-03  2986  	c->slab =3D NUL=
L;
a019d20162586a Vlastimil Babka           2021-05-12  2987  	c->freelist =3D=
 NULL;
bd0e7491a931f5 Vlastimil Babka           2021-05-22  2988  	local_unlock_ir=
qrestore(&s->cpu_slab->lock, flags);
86d75bda97ce13 Vlastimil Babka           2021-11-03  2989  	deactivate_slab=
(s, slab, freelist);
0b303fb402862d Vlastimil Babka           2021-05-08  2990  =

81819f0fc8285a Christoph Lameter         2007-05-06  2991  new_slab:
2cfb7455d223ab Christoph Lameter         2011-06-01  2992  =

a93cf07bc3fb4e Wei Yang                  2017-07-06  2993  	if (slub_percpu=
_partial(c)) {
bd0e7491a931f5 Vlastimil Babka           2021-05-22  2994  		local_lock_irq=
save(&s->cpu_slab->lock, flags);
86d75bda97ce13 Vlastimil Babka           2021-11-03  2995  		if (unlikely(c=
->slab)) {
bd0e7491a931f5 Vlastimil Babka           2021-05-22  2996  			local_unlock_=
irqrestore(&s->cpu_slab->lock, flags);
fa417ab7506f92 Vlastimil Babka           2021-05-10  2997  			goto reread_p=
age;
fa417ab7506f92 Vlastimil Babka           2021-05-10  2998  		}
4b1f449dedd2ff Vlastimil Babka           2021-05-11  2999  		if (unlikely(!=
slub_percpu_partial(c))) {
bd0e7491a931f5 Vlastimil Babka           2021-05-22  3000  			local_unlock_=
irqrestore(&s->cpu_slab->lock, flags);
25c00c506e8176 Vlastimil Babka           2021-05-21  3001  			/* we were pr=
eempted and partial list got empty */
25c00c506e8176 Vlastimil Babka           2021-05-21  3002  			goto new_obje=
cts;
4b1f449dedd2ff Vlastimil Babka           2021-05-11  3003  		}
fa417ab7506f92 Vlastimil Babka           2021-05-10  3004  =

86d75bda97ce13 Vlastimil Babka           2021-11-03  3005  		slab =3D c->sl=
ab =3D slub_percpu_partial(c);
86d75bda97ce13 Vlastimil Babka           2021-11-03  3006  		slub_set_percp=
u_partial(c, slab);
bd0e7491a931f5 Vlastimil Babka           2021-05-22  3007  		local_unlock_i=
rqrestore(&s->cpu_slab->lock, flags);
49e2258586b423 Christoph Lameter         2011-08-09  3008  		stat(s, CPU_PA=
RTIAL_ALLOC);
49e2258586b423 Christoph Lameter         2011-08-09  3009  		goto redo;
81819f0fc8285a Christoph Lameter         2007-05-06  3010  	}
81819f0fc8285a Christoph Lameter         2007-05-06  3011  =

fa417ab7506f92 Vlastimil Babka           2021-05-10  3012  new_objects:
fa417ab7506f92 Vlastimil Babka           2021-05-10  3013  =

86d75bda97ce13 Vlastimil Babka           2021-11-03  3014  	freelist =3D ge=
t_partial(s, gfpflags, node, &slab);
3f2b77e35a4fc3 Vlastimil Babka           2021-05-11  3015  	if (freelist)
2a904905ae0415 Vlastimil Babka           2021-05-11  3016  		goto check_new=
_page;
2a904905ae0415 Vlastimil Babka           2021-05-11  3017  =

25c00c506e8176 Vlastimil Babka           2021-05-21  3018  	slub_put_cpu_pt=
r(s->cpu_slab);
86d75bda97ce13 Vlastimil Babka           2021-11-03  3019  	slab =3D new_sl=
ab(s, gfpflags, node);
25c00c506e8176 Vlastimil Babka           2021-05-21  3020  	c =3D slub_get_=
cpu_ptr(s->cpu_slab);
9e577e8b46ab0c Christoph Lameter         2011-07-22  3021  =

86d75bda97ce13 Vlastimil Babka           2021-11-03  3022  	if (unlikely(!s=
lab)) {
781b2ba6eb5f22 Pekka Enberg              2009-06-10  3023  		slab_out_of_me=
mory(s, gfpflags, node);
71c7a06ff0a2ba Christoph Lameter         2008-02-14  3024  		return NULL;
497b66f2ecc978 Christoph Lameter         2011-08-09  3025  	}
2cfb7455d223ab Christoph Lameter         2011-06-01  3026  =

53a0de06e50acb Vlastimil Babka           2021-05-11  3027  	/*
53a0de06e50acb Vlastimil Babka           2021-05-11  3028  	 * No other ref=
erence to the page yet so we can
53a0de06e50acb Vlastimil Babka           2021-05-11  3029  	 * muck around =
with it freely without cmpxchg
53a0de06e50acb Vlastimil Babka           2021-05-11  3030  	 */
86d75bda97ce13 Vlastimil Babka           2021-11-03  3031  	freelist =3D sl=
ab->freelist;
86d75bda97ce13 Vlastimil Babka           2021-11-03  3032  	slab->freelist =
=3D NULL;
53a0de06e50acb Vlastimil Babka           2021-05-11  3033  =

53a0de06e50acb Vlastimil Babka           2021-05-11  3034  	stat(s, ALLOC_S=
LAB);
53a0de06e50acb Vlastimil Babka           2021-05-11  3035  =

2a904905ae0415 Vlastimil Babka           2021-05-11  3036  check_new_page:
1572df7cbcb489 Vlastimil Babka           2021-05-11  3037  =

1572df7cbcb489 Vlastimil Babka           2021-05-11  3038  	if (kmem_cache_=
debug(s)) {
86d75bda97ce13 Vlastimil Babka           2021-11-03  3039  		if (!alloc_deb=
ug_processing(s, slab, freelist, addr)) {
1572df7cbcb489 Vlastimil Babka           2021-05-11  3040  			/* Slab faile=
d checks. Next slab needed */
1572df7cbcb489 Vlastimil Babka           2021-05-11  3041  			goto new_slab;
fa417ab7506f92 Vlastimil Babka           2021-05-10  3042  		} else {
1572df7cbcb489 Vlastimil Babka           2021-05-11  3043  			/*
1572df7cbcb489 Vlastimil Babka           2021-05-11  3044  			 * For debug =
case, we don't load freelist so that all
1572df7cbcb489 Vlastimil Babka           2021-05-11  3045  			 * allocation=
s go through alloc_debug_processing()
1572df7cbcb489 Vlastimil Babka           2021-05-11  3046  			 */
1572df7cbcb489 Vlastimil Babka           2021-05-11  3047  			goto return_s=
ingle;
1572df7cbcb489 Vlastimil Babka           2021-05-11  3048  		}
fa417ab7506f92 Vlastimil Babka           2021-05-10  3049  	}
1572df7cbcb489 Vlastimil Babka           2021-05-11  3050  =

86d75bda97ce13 Vlastimil Babka           2021-11-03  3051  	if (unlikely(!p=
fmemalloc_match(slab, gfpflags)))
1572df7cbcb489 Vlastimil Babka           2021-05-11  3052  		/*
1572df7cbcb489 Vlastimil Babka           2021-05-11  3053  		 * For !pfmema=
lloc_match() case we don't load freelist so that
1572df7cbcb489 Vlastimil Babka           2021-05-11  3054  		 * we don't ma=
ke further mismatched allocations easier.
1572df7cbcb489 Vlastimil Babka           2021-05-11  3055  		 */
1572df7cbcb489 Vlastimil Babka           2021-05-11  3056  		goto return_si=
ngle;
1572df7cbcb489 Vlastimil Babka           2021-05-11  3057  =

cfdf836e1f93df Vlastimil Babka           2021-05-12  3058  retry_load_page:
cfdf836e1f93df Vlastimil Babka           2021-05-12  3059  =

bd0e7491a931f5 Vlastimil Babka           2021-05-22  3060  	local_lock_irqs=
ave(&s->cpu_slab->lock, flags);
86d75bda97ce13 Vlastimil Babka           2021-11-03  3061  	if (unlikely(c-=
>slab)) {
cfdf836e1f93df Vlastimil Babka           2021-05-12  3062  		void *flush_fr=
eelist =3D c->freelist;
86d75bda97ce13 Vlastimil Babka           2021-11-03 @3063  		struct slab *f=
lush_slab =3D c->slab;
cfdf836e1f93df Vlastimil Babka           2021-05-12  3064  =

86d75bda97ce13 Vlastimil Babka           2021-11-03  3065  		c->slab =3D NU=
LL;
cfdf836e1f93df Vlastimil Babka           2021-05-12  3066  		c->freelist =
=3D NULL;
cfdf836e1f93df Vlastimil Babka           2021-05-12  3067  		c->tid =3D nex=
t_tid(c->tid);
cfdf836e1f93df Vlastimil Babka           2021-05-12  3068  =

bd0e7491a931f5 Vlastimil Babka           2021-05-22  3069  		local_unlock_i=
rqrestore(&s->cpu_slab->lock, flags);
cfdf836e1f93df Vlastimil Babka           2021-05-12  3070  =

86d75bda97ce13 Vlastimil Babka           2021-11-03  3071  		deactivate_sla=
b(s, flush_slab, flush_freelist);
cfdf836e1f93df Vlastimil Babka           2021-05-12  3072  =

cfdf836e1f93df Vlastimil Babka           2021-05-12  3073  		stat(s, CPUSLA=
B_FLUSH);
cfdf836e1f93df Vlastimil Babka           2021-05-12  3074  =

cfdf836e1f93df Vlastimil Babka           2021-05-12  3075  		goto retry_loa=
d_page;
cfdf836e1f93df Vlastimil Babka           2021-05-12  3076  	}
86d75bda97ce13 Vlastimil Babka           2021-11-03  3077  	c->slab =3D sla=
b;
3f2b77e35a4fc3 Vlastimil Babka           2021-05-11  3078  =

497b66f2ecc978 Christoph Lameter         2011-08-09  3079  	goto load_freel=
ist;
497b66f2ecc978 Christoph Lameter         2011-08-09  3080  =

1572df7cbcb489 Vlastimil Babka           2021-05-11  3081  return_single:
894b8788d7f265 Christoph Lameter         2007-05-10  3082  =

86d75bda97ce13 Vlastimil Babka           2021-11-03  3083  	deactivate_slab=
(s, slab, get_freepointer(s, freelist));
6faa68337b0c90 Christoph Lameter         2012-05-09  3084  	return freelist;
894b8788d7f265 Christoph Lameter         2007-05-10  3085  }
894b8788d7f265 Christoph Lameter         2007-05-10  3086  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2022311466351673758==--

