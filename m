Content-Type: multipart/mixed; boundary="===============5314281200241819763=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: mm/kfence/core.c:675:47: warning: Parameter 's' can be declared with const [constParameter]
Date: Sun, 12 Jun 2022 20:38:34 +0800
Message-ID: <202206122055.8QzOd7uJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5314281200241819763==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 mm/kfence/core.c:675:47: warning: Parameter 's' can be declared with const=
 [constParameter]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Sven Schnelle <svens@linux.ibm.com>
CC: Heiko Carstens <hca@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7a68065eb9cd194cf03f135c9211eeb2d5c4c0a0
commit: e41ba1115a351dd037c21ac75660638219d51485 s390: add support for KFEN=
CE
date:   11 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 11 months ago
compiler: s390-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout e41ba1115a351dd037c21ac75660638219d51485
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> mm/kfence/core.c:675:47: warning: Parameter 's' can be declared with con=
st [constParameter]
   void kfence_shutdown_cache(struct kmem_cache *s)
                                                 ^
>> net/netfilter/nf_tables_offload.c:598:27: warning: Parameter 'dev' can b=
e declared with const [constParameter]
          struct net_device *dev)
                             ^
--
>> net/ipv4/inet_hashtables.c:305:35: warning: Parameter 'hashinfo' can be =
declared with const [constParameter]
               struct inet_hashinfo *hashinfo,
                                     ^

vim +/s +675 mm/kfence/core.c

0ce20dd840897b1 Alexander Potapenko 2021-02-25  674  =

0ce20dd840897b1 Alexander Potapenko 2021-02-25 @675  void kfence_shutdown_c=
ache(struct kmem_cache *s)
0ce20dd840897b1 Alexander Potapenko 2021-02-25  676  {
0ce20dd840897b1 Alexander Potapenko 2021-02-25  677  	unsigned long flags;
0ce20dd840897b1 Alexander Potapenko 2021-02-25  678  	struct kfence_metadat=
a *meta;
0ce20dd840897b1 Alexander Potapenko 2021-02-25  679  	int i;
0ce20dd840897b1 Alexander Potapenko 2021-02-25  680  =

0ce20dd840897b1 Alexander Potapenko 2021-02-25  681  	for (i =3D 0; i < CON=
FIG_KFENCE_NUM_OBJECTS; i++) {
0ce20dd840897b1 Alexander Potapenko 2021-02-25  682  		bool in_use;
0ce20dd840897b1 Alexander Potapenko 2021-02-25  683  =

0ce20dd840897b1 Alexander Potapenko 2021-02-25  684  		meta =3D &kfence_met=
adata[i];
0ce20dd840897b1 Alexander Potapenko 2021-02-25  685  =

0ce20dd840897b1 Alexander Potapenko 2021-02-25  686  		/*
0ce20dd840897b1 Alexander Potapenko 2021-02-25  687  		 * If we observe som=
e inconsistent cache and state pair where we
0ce20dd840897b1 Alexander Potapenko 2021-02-25  688  		 * should have retur=
ned false here, cache destruction is racing
0ce20dd840897b1 Alexander Potapenko 2021-02-25  689  		 * with either kmem_=
cache_alloc() or kmem_cache_free(). Taking
0ce20dd840897b1 Alexander Potapenko 2021-02-25  690  		 * the lock will not=
 help, as different critical section
0ce20dd840897b1 Alexander Potapenko 2021-02-25  691  		 * serialization wil=
l have the same outcome.
0ce20dd840897b1 Alexander Potapenko 2021-02-25  692  		 */
0ce20dd840897b1 Alexander Potapenko 2021-02-25  693  		if (READ_ONCE(meta->=
cache) !=3D s ||
0ce20dd840897b1 Alexander Potapenko 2021-02-25  694  		    READ_ONCE(meta->=
state) !=3D KFENCE_OBJECT_ALLOCATED)
0ce20dd840897b1 Alexander Potapenko 2021-02-25  695  			continue;
0ce20dd840897b1 Alexander Potapenko 2021-02-25  696  =

0ce20dd840897b1 Alexander Potapenko 2021-02-25  697  		raw_spin_lock_irqsav=
e(&meta->lock, flags);
0ce20dd840897b1 Alexander Potapenko 2021-02-25  698  		in_use =3D meta->cac=
he =3D=3D s && meta->state =3D=3D KFENCE_OBJECT_ALLOCATED;
0ce20dd840897b1 Alexander Potapenko 2021-02-25  699  		raw_spin_unlock_irqr=
estore(&meta->lock, flags);
0ce20dd840897b1 Alexander Potapenko 2021-02-25  700  =

0ce20dd840897b1 Alexander Potapenko 2021-02-25  701  		if (in_use) {
0ce20dd840897b1 Alexander Potapenko 2021-02-25  702  			/*
0ce20dd840897b1 Alexander Potapenko 2021-02-25  703  			 * This cache still=
 has allocations, and we should not
0ce20dd840897b1 Alexander Potapenko 2021-02-25  704  			 * release them bac=
k into the freelist so they can still
0ce20dd840897b1 Alexander Potapenko 2021-02-25  705  			 * safely be used a=
nd retain the kernel's default
0ce20dd840897b1 Alexander Potapenko 2021-02-25  706  			 * behaviour of kee=
ping the allocations alive (leak the
0ce20dd840897b1 Alexander Potapenko 2021-02-25  707  			 * cache); however,=
 they effectively become "zombie
0ce20dd840897b1 Alexander Potapenko 2021-02-25  708  			 * allocations" as =
the KFENCE objects are the only ones
0ce20dd840897b1 Alexander Potapenko 2021-02-25  709  			 * still in use and=
 the owning cache is being destroyed.
0ce20dd840897b1 Alexander Potapenko 2021-02-25  710  			 *
0ce20dd840897b1 Alexander Potapenko 2021-02-25  711  			 * We mark them fre=
ed, so that any subsequent use shows
0ce20dd840897b1 Alexander Potapenko 2021-02-25  712  			 * more useful erro=
r messages that will include stack
0ce20dd840897b1 Alexander Potapenko 2021-02-25  713  			 * traces of the us=
er of the object, the original
0ce20dd840897b1 Alexander Potapenko 2021-02-25  714  			 * allocation, and =
caller to shutdown_cache().
0ce20dd840897b1 Alexander Potapenko 2021-02-25  715  			 */
0ce20dd840897b1 Alexander Potapenko 2021-02-25  716  			kfence_guarded_free=
((void *)meta->addr, meta, /*zombie=3D*/true);
0ce20dd840897b1 Alexander Potapenko 2021-02-25  717  		}
0ce20dd840897b1 Alexander Potapenko 2021-02-25  718  	}
0ce20dd840897b1 Alexander Potapenko 2021-02-25  719  =

0ce20dd840897b1 Alexander Potapenko 2021-02-25  720  	for (i =3D 0; i < CON=
FIG_KFENCE_NUM_OBJECTS; i++) {
0ce20dd840897b1 Alexander Potapenko 2021-02-25  721  		meta =3D &kfence_met=
adata[i];
0ce20dd840897b1 Alexander Potapenko 2021-02-25  722  =

0ce20dd840897b1 Alexander Potapenko 2021-02-25  723  		/* See above. */
0ce20dd840897b1 Alexander Potapenko 2021-02-25  724  		if (READ_ONCE(meta->=
cache) !=3D s || READ_ONCE(meta->state) !=3D KFENCE_OBJECT_FREED)
0ce20dd840897b1 Alexander Potapenko 2021-02-25  725  			continue;
0ce20dd840897b1 Alexander Potapenko 2021-02-25  726  =

0ce20dd840897b1 Alexander Potapenko 2021-02-25  727  		raw_spin_lock_irqsav=
e(&meta->lock, flags);
0ce20dd840897b1 Alexander Potapenko 2021-02-25  728  		if (meta->cache =3D=
=3D s && meta->state =3D=3D KFENCE_OBJECT_FREED)
0ce20dd840897b1 Alexander Potapenko 2021-02-25  729  			meta->cache =3D NUL=
L;
0ce20dd840897b1 Alexander Potapenko 2021-02-25  730  		raw_spin_unlock_irqr=
estore(&meta->lock, flags);
0ce20dd840897b1 Alexander Potapenko 2021-02-25  731  	}
0ce20dd840897b1 Alexander Potapenko 2021-02-25  732  }
0ce20dd840897b1 Alexander Potapenko 2021-02-25  733  =


:::::: The code at line 675 was first introduced by commit
:::::: 0ce20dd840897b12ae70869c69f1ba34d6d16965 mm: add Kernel Electric-Fen=
ce infrastructure

:::::: TO: Alexander Potapenko <glider@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5314281200241819763==--

