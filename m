Content-Type: multipart/mixed; boundary="===============5929320625259664503=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/fscache/cookie.c:187:17: warning: use of NULL 'aux_data' where non-null expected [CWE-476]
Date: Mon, 27 Jun 2022 03:04:29 +0000
Message-ID: <202206261427.dIQXL1M2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5929320625259664503==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: fs/fscach=
e/cookie.c:187:17: warning: use of NULL 'aux_data' where non-null expected =
[CWE-476] [-Wanalyzer-null-argument]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: David Howells <dhowells@redhat.com>
CC: Jeff Layton <jlayton@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0840a7914caa14315a3191178a9f72c742477860
commit: 7f3283aba39a0f395700c3b5defa4ec49d9914b3 fscache: Implement cookie =
registration
date:   6 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 6 months ago
config: arm-randconfig-c002-20220624
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D7f3283aba39a0f395700c3b5defa4ec49d9914b3
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 7f3283aba39a0f395700c3b5defa4ec49d9914b3
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
              |      |            (15) following 'false' branch...
              |......
              |  189 |                 cookie->aux =3D kmemdup(aux_data, co=
okie->aux_len, GFP_KERNEL);
              |      |                               ~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                               |
              |      |                               (16) ...to here
              |  190 |                 if (!cookie->aux)
              |      |                    ~
              |      |                    |
              |      |                    (17) following 'false' branch...
              |
            'fscache_alloc_cookie': event 18
              |
              |include/asm-generic/rwonce.h:55:37:
              |   55 |         *(volatile typeof(x) *)&(x) =3D (val);      =
                      \
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
              |      |                                     |
              |      |                                     (18) ...to here
   include/asm-generic/rwonce.h:61:9: note: in expansion of macro '__WRITE_=
ONCE'
              |   61 |         __WRITE_ONCE(x, val);                       =
                    \
              |      |         ^~~~~~~~~~~~
   arch/arm/include/asm/atomic.h:26:33: note: in expansion of macro 'WRITE_=
ONCE'
              |   26 | #define arch_atomic_set(v,i)    WRITE_ONCE(((v)->cou=
nter), (i))
              |      |                                 ^~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:42:9: note: in expansion of m=
acro 'arch_atomic_set'
              |   42 |         arch_atomic_set(v, i);
              |      |         ^~~~~~~~~~~~~~~
              |
       <------+
       |
     '__fscache_acquire_cookie.part.0': events 19-22
       |
       |fs/fscache/cookie.c:300:18:
       |  300 |         cookie =3D fscache_alloc_cookie(volume, advice,
       |      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                  |
       |      |                  (19) returning to '__fscache_acquire_cooki=
e.part.0' from 'fscache_alloc_cookie'
       |  301 |                                       index_key, index_key_=
len,
       |      |                                       ~~~~~~~~~~~~~~~~~~~~~=
~~~~
       |  302 |                                       aux_data, aux_data_le=
n,
       |      |                                       ~~~~~~~~~~~~~~~~~~~~~=
~~
       |  303 |                                       object_size);
       |      |                                       ~~~~~~~~~~~~
       |  304 |         if (!cookie) {
       |      |            ~      =

       |      |            |
       |      |            (20) following 'false' branch (when 'cookie' is =
non-NULL)...
       |......
       |  309 |         if (!fscache_hash_cookie(cookie)) {
       |      |              ~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |              |
       |      |              (21) ...to here
       |      |              (22) calling 'fscache_hash_cookie' from '__fsc=
ache_acquire_cookie.part.0'
       |
       +--> 'fscache_hash_cookie': event 23
              |
              |  231 | static bool fscache_hash_cookie(struct fscache_cooki=
e *candidate)
              |      |             ^~~~~~~~~~~~~~~~~~~
              |      |             |
              |      |             (23) entry to 'fscache_hash_cookie'
              |
            'fscache_hash_cookie': event 24
              |
              |include/linux/list_bl.h:171:18:
              |  171 |              pos &&                                 =
                    \
   fs/fscache/cookie.c:242:9: note: in expansion of macro 'hlist_bl_for_eac=
h_entry'
              |  242 |         hlist_bl_for_each_entry(cursor, p, h, hash_l=
ink) {
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~
              |
            'fscache_hash_cookie': events 25-26
              |
              |  252 |         fscache_get_volume(candidate->volume, fscach=
e_volume_get_cookie);
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (25) ...to here
              |  253 |         atomic_inc(&candidate->volume->n_cookies);
              |  254 |         hlist_bl_add_head(&candidate->hash_link, h);
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (26) calling 'hlist_bl_add_head' from 'fscac=
he_hash_cookie'
              |
              +--> 'hlist_bl_add_head': events 27-30
                     |
                     |include/linux/list_bl.h:77:20:
                     |   77 | static inline void hlist_bl_add_head(struct h=
list_bl_node *n,
                     |      |                    ^~~~~~~~~~~~~~~~~
                     |      |                    |
                     |      |                    (27) entry to 'hlist_bl_ad=
d_head'
                     |......
                     |   83 |         if (first)
                     |      |            ~        =

                     |      |            |
                     |      |            (28) following 'true' branch...
                     |   84 |                 first->pprev =3D &n->next;
                     |      |                 ~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                              | |
                     |      |                              | (29) ...to here
                     |      |                              (30) dereference=
 of NULL '(struct hlist_bl_node *)((long unsigned int)*h.first & 4294967294=
)'
                     |
   include/linux/list_bl.h: In function 'fscache_alloc_cookie':
>> fs/fscache/cookie.c:187:17: warning: use of NULL 'aux_data' where non-nu=
ll expected [CWE-476] [-Wanalyzer-null-argument]
     187 |                 memcpy(cookie->inline_aux, aux_data, cookie->aux=
_len);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
     '__fscache_acquire_cookie.part.0': events 1-2
       |
       |  280 | struct fscache_cookie *__fscache_acquire_cookie(
       |      |                        ^~~~~~~~~~~~~~~~~~~~~~~~
       |      |                        |
       |      |                        (1) entry to '__fscache_acquire_cook=
ie.part.0'
       |......
       |  300 |         cookie =3D fscache_alloc_cookie(volume, advice,
       |      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                  |
       |      |                  (2) calling 'fscache_alloc_cookie' from '_=
_fscache_acquire_cookie.part.0'
       |  301 |                                       index_key, index_key_=
len,
       |      |                                       ~~~~~~~~~~~~~~~~~~~~~=
~~~~
       |  302 |                                       aux_data, aux_data_le=
n,
       |      |                                       ~~~~~~~~~~~~~~~~~~~~~=
~~
       |  303 |                                       object_size);
       |      |                                       ~~~~~~~~~~~~
       |
       +--> 'fscache_alloc_cookie': events 3-6
              |
              |  160 | static struct fscache_cookie *fscache_alloc_cookie(
              |      |                               ^~~~~~~~~~~~~~~~~~~~
              |      |                               |
              |      |                               (3) entry to 'fscache_=
alloc_cookie'
              |......
              |  171 |         if (!cookie)
              |      |            ~                   =

              |      |            |
              |      |            (4) following 'false' branch...
              |......
              |  175 |         cookie->volume          =3D volume;
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                                 |
              |      |                                 (5) ...to here
              |......
              |  183 |         if (fscache_set_key(cookie, index_key, index=
_key_len) < 0)
              |      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
              |      |             |
              |      |             (6) calling 'fscache_set_key' from 'fsca=
che_alloc_cookie'
              |
              +--> 'fscache_set_key': events 7-9
                     |
                     |  112 | static int fscache_set_key(struct fscache_coo=
kie *cookie,
                     |      |            ^~~~~~~~~~~~~~~
                     |      |            |
                     |      |            (7) entry to 'fscache_set_key'
                     |......
                     |  120 |         if (index_key_len > sizeof(cookie->in=
line_key)) {
                     |      |            ~
                     |      |            |
                     |      |            (8) following 'false' branch (when=
 'index_key_len <=3D 16')...
                     |......
                     |  126 |                 buf =3D cookie->inline_key;
                     |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                     |
                     |      |                     (9) ...to here
                     |
              <------+
              |
            'fscache_alloc_cookie': events 10-15
              |
              |  183 |         if (fscache_set_key(cookie, index_key, index=
_key_len) < 0)
              |      |            ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
              |      |            ||
              |      |            |(10) returning to 'fscache_alloc_cookie'=
 from 'fscache_set_key'
              |      |            (11) following 'false' branch...
              |......
              |  186 |         if (cookie->aux_len <=3D sizeof(cookie->inli=
ne_aux)) {
              |      |            ~~~~~~~~~~~~~~~~
              |      |            |      |
              |      |            |      (12) ...to here
              |      |            (13) following 'true' branch...
              |  187 |                 memcpy(cookie->inline_aux, aux_data,=
 cookie->aux_len);
              |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
              |      |                 |            |
              |      |                 |            (14) ...to here
              |      |                 (15) argument 2 ('aux_data') NULL wh=
ere non-null expected
              |
   In file included from include/linux/string.h:20,
                    from include/linux/bitmap.h:10,
                    from include/linux/cpumask.h:12,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from fs/fscache/cookie.c:12:
   arch/arm/include/asm/string.h:20:15: note: argument 2 of 'memcpy' must b=
e non-null
      20 | extern void * memcpy(void *, const void *, __kernel_size_t);
         |               ^~~~~~

vim +/aux_data +187 fs/fscache/cookie.c

7f3283aba39a0f David Howells 2021-10-20  156  =

7f3283aba39a0f David Howells 2021-10-20  157  /*
7f3283aba39a0f David Howells 2021-10-20  158   * Allocate a cookie.
7f3283aba39a0f David Howells 2021-10-20  159   */
7f3283aba39a0f David Howells 2021-10-20  160  static struct fscache_cookie =
*fscache_alloc_cookie(
7f3283aba39a0f David Howells 2021-10-20  161  	struct fscache_volume *volum=
e,
7f3283aba39a0f David Howells 2021-10-20  162  	u8 advice,
7f3283aba39a0f David Howells 2021-10-20  163  	const void *index_key, size_=
t index_key_len,
7f3283aba39a0f David Howells 2021-10-20  164  	const void *aux_data, size_t=
 aux_data_len,
7f3283aba39a0f David Howells 2021-10-20  165  	loff_t object_size)
7f3283aba39a0f David Howells 2021-10-20  166  {
7f3283aba39a0f David Howells 2021-10-20  167  	struct fscache_cookie *cooki=
e;
7f3283aba39a0f David Howells 2021-10-20  168  =

7f3283aba39a0f David Howells 2021-10-20  169  	/* allocate and initialise a=
 cookie */
7f3283aba39a0f David Howells 2021-10-20  170  	cookie =3D kmem_cache_zalloc=
(fscache_cookie_jar, GFP_KERNEL);
7f3283aba39a0f David Howells 2021-10-20  171  	if (!cookie)
7f3283aba39a0f David Howells 2021-10-20  172  		return NULL;
7f3283aba39a0f David Howells 2021-10-20  173  	fscache_stat(&fscache_n_cook=
ies);
7f3283aba39a0f David Howells 2021-10-20  174  =

7f3283aba39a0f David Howells 2021-10-20  175  	cookie->volume		=3D volume;
7f3283aba39a0f David Howells 2021-10-20  176  	cookie->advice		=3D advice;
7f3283aba39a0f David Howells 2021-10-20  177  	cookie->key_len		=3D index_k=
ey_len;
7f3283aba39a0f David Howells 2021-10-20  178  	cookie->aux_len		=3D aux_dat=
a_len;
7f3283aba39a0f David Howells 2021-10-20  179  	cookie->object_size	=3D obje=
ct_size;
7f3283aba39a0f David Howells 2021-10-20  180  	if (object_size =3D=3D 0)
7f3283aba39a0f David Howells 2021-10-20  181  		__set_bit(FSCACHE_COOKIE_NO=
_DATA_TO_READ, &cookie->flags);
7f3283aba39a0f David Howells 2021-10-20  182  =

7f3283aba39a0f David Howells 2021-10-20  183  	if (fscache_set_key(cookie, =
index_key, index_key_len) < 0)
7f3283aba39a0f David Howells 2021-10-20  184  		goto nomem;
7f3283aba39a0f David Howells 2021-10-20  185  =

7f3283aba39a0f David Howells 2021-10-20  186  	if (cookie->aux_len <=3D siz=
eof(cookie->inline_aux)) {
7f3283aba39a0f David Howells 2021-10-20 @187  		memcpy(cookie->inline_aux, =
aux_data, cookie->aux_len);
7f3283aba39a0f David Howells 2021-10-20  188  	} else {
7f3283aba39a0f David Howells 2021-10-20  189  		cookie->aux =3D kmemdup(aux=
_data, cookie->aux_len, GFP_KERNEL);
7f3283aba39a0f David Howells 2021-10-20  190  		if (!cookie->aux)
7f3283aba39a0f David Howells 2021-10-20  191  			goto nomem;
7f3283aba39a0f David Howells 2021-10-20  192  	}
7f3283aba39a0f David Howells 2021-10-20  193  =

7f3283aba39a0f David Howells 2021-10-20  194  	refcount_set(&cookie->ref, 1=
);
7f3283aba39a0f David Howells 2021-10-20  195  	cookie->debug_id =3D atomic_=
inc_return(&fscache_cookie_debug_id);
7f3283aba39a0f David Howells 2021-10-20  196  	cookie->state =3D FSCACHE_CO=
OKIE_STATE_QUIESCENT;
7f3283aba39a0f David Howells 2021-10-20  197  	spin_lock_init(&cookie->lock=
);
7f3283aba39a0f David Howells 2021-10-20  198  	INIT_LIST_HEAD(&cookie->comm=
it_link);
7f3283aba39a0f David Howells 2021-10-20  199  	INIT_WORK(&cookie->work, NUL=
L /* PLACEHOLDER */);
7f3283aba39a0f David Howells 2021-10-20  200  =

7f3283aba39a0f David Howells 2021-10-20  201  	write_lock(&fscache_cookies_=
lock);
7f3283aba39a0f David Howells 2021-10-20  202  	list_add_tail(&cookie->proc_=
link, &fscache_cookies);
7f3283aba39a0f David Howells 2021-10-20  203  	write_unlock(&fscache_cookie=
s_lock);
7f3283aba39a0f David Howells 2021-10-20  204  	fscache_see_cookie(cookie, f=
scache_cookie_new_acquire);
7f3283aba39a0f David Howells 2021-10-20  205  	return cookie;
7f3283aba39a0f David Howells 2021-10-20  206  =

7f3283aba39a0f David Howells 2021-10-20  207  nomem:
7f3283aba39a0f David Howells 2021-10-20  208  	fscache_free_cookie(cookie);
7f3283aba39a0f David Howells 2021-10-20  209  	return NULL;
7f3283aba39a0f David Howells 2021-10-20  210  }
7f3283aba39a0f David Howells 2021-10-20  211  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5929320625259664503==--

