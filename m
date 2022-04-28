Content-Type: multipart/mixed; boundary="===============7322405166862142124=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 1/2] printk: stop including cache.h from printk.h
Date: Thu, 28 Apr 2022 10:00:32 +0800
Message-ID: <202204280806.pOcl1gU4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7322405166862142124==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220426203231.2107365-1-pcc@google.com>
References: <20220426203231.2107365-1-pcc@google.com>
TO: Peter Collingbourne <pcc@google.com>
TO: Andrey Konovalov <andreyknvl@gmail.com>
TO: Hyeonggon Yoo <42.hyeyoo@gmail.com>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Catalin Marinas <catalin.marinas@arm.com>
CC: Peter Collingbourne <pcc@google.com>
CC: Linux ARM <linux-arm-kernel@lists.infradead.org>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
CC: vbabka(a)suse.cz
CC: penberg(a)kernel.org
CC: roman.gushchin(a)linux.dev
CC: iamjoonsoo.kim(a)lge.com
CC: rientjes(a)google.com
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Andrey Ryabinin <ryabinin.a.a@gmail.com>
CC: Alexander Potapenko <glider@google.com>
CC: Dmitry Vyukov <dvyukov@google.com>
CC: "kasan-dev" <kasan-dev@googlegroups.com>
CC: Eric Biederman <ebiederm@xmission.com>
CC: Kees Cook <keescook@chromium.org>

Hi Peter,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on vbabka-slab/for-next]
[also build test ERROR on arm64/for-next/core linus/master v5.18-rc4 next-2=
0220427]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Collingbourne/=
printk-stop-including-cache-h-from-printk-h/20220427-043357
base:   git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git for-n=
ext
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: parisc-randconfig-s031-20220425 (https://download.01.org/0day-ci/ar=
chive/20220428/202204280806.pOcl1gU4-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/intel-lab-lkp/linux/commit/edcb0f592304f7849a3=
9586f9e3fe0d8f6e6c6b9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Peter-Collingbourne/printk-stop-in=
cluding-cache-h-from-printk-h/20220427-043357
        git checkout edcb0f592304f7849a39586f9e3fe0d8f6e6c6b9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dp=
arisc SHELL=3D/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from kernel/bpf/bpf_lru_list.c:8:
>> kernel/bpf/bpf_lru_list.h:36:29: error: expected ':', ',', ';', '}' or '=
__attribute__' before '____cacheline_aligned_in_smp'
      36 |         raw_spinlock_t lock ____cacheline_aligned_in_smp;
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/bpf/bpf_lru_list.c:5:
   kernel/bpf/bpf_lru_list.c: In function 'bpf_lru_list_push_free':
>> kernel/bpf/bpf_lru_list.c:313:33: error: 'struct bpf_lru_list' has no me=
mber named 'lock'
     313 |         raw_spin_lock_irqsave(&l->lock, flags);
         |                                 ^~
   include/linux/spinlock.h:242:48: note: in definition of macro 'raw_spin_=
lock_irqsave'
     242 |                 flags =3D _raw_spin_lock_irqsave(lock);   \
         |                                                ^~~~
   kernel/bpf/bpf_lru_list.c:315:38: error: 'struct bpf_lru_list' has no me=
mber named 'lock'
     315 |         raw_spin_unlock_irqrestore(&l->lock, flags);
         |                                      ^~
   include/linux/spinlock.h:280:45: note: in definition of macro 'raw_spin_=
unlock_irqrestore'
     280 |                 _raw_spin_unlock_irqrestore(lock, flags);       \
         |                                             ^~~~
   kernel/bpf/bpf_lru_list.c: In function 'bpf_lru_list_pop_free_to_local':
   kernel/bpf/bpf_lru_list.c:325:25: error: 'struct bpf_lru_list' has no me=
mber named 'lock'
     325 |         raw_spin_lock(&l->lock);
         |                         ^~
   include/linux/spinlock.h:215:48: note: in definition of macro 'raw_spin_=
lock'
     215 | #define raw_spin_lock(lock)     _raw_spin_lock(lock)
         |                                                ^~~~
   kernel/bpf/bpf_lru_list.c:344:27: error: 'struct bpf_lru_list' has no me=
mber named 'lock'
     344 |         raw_spin_unlock(&l->lock);
         |                           ^~
   include/linux/spinlock.h:274:58: note: in definition of macro 'raw_spin_=
unlock'
     274 | #define raw_spin_unlock(lock)           _raw_spin_unlock(lock)
         |                                                          ^~~~
   kernel/bpf/bpf_lru_list.c: In function 'bpf_percpu_lru_pop_free':
   kernel/bpf/bpf_lru_list.c:410:33: error: 'struct bpf_lru_list' has no me=
mber named 'lock'
     410 |         raw_spin_lock_irqsave(&l->lock, flags);
         |                                 ^~
   include/linux/spinlock.h:242:48: note: in definition of macro 'raw_spin_=
lock_irqsave'
     242 |                 flags =3D _raw_spin_lock_irqsave(lock);   \
         |                                                ^~~~
   kernel/bpf/bpf_lru_list.c:426:38: error: 'struct bpf_lru_list' has no me=
mber named 'lock'
     426 |         raw_spin_unlock_irqrestore(&l->lock, flags);
         |                                      ^~
   include/linux/spinlock.h:280:45: note: in definition of macro 'raw_spin_=
unlock_irqrestore'
     280 |                 _raw_spin_unlock_irqrestore(lock, flags);       \
         |                                             ^~~~
   kernel/bpf/bpf_lru_list.c: In function 'bpf_percpu_lru_push_free':
   kernel/bpf/bpf_lru_list.c:544:33: error: 'struct bpf_lru_list' has no me=
mber named 'lock'
     544 |         raw_spin_lock_irqsave(&l->lock, flags);
         |                                 ^~
   include/linux/spinlock.h:242:48: note: in definition of macro 'raw_spin_=
lock_irqsave'
     242 |                 flags =3D _raw_spin_lock_irqsave(lock);   \
         |                                                ^~~~
   kernel/bpf/bpf_lru_list.c:548:38: error: 'struct bpf_lru_list' has no me=
mber named 'lock'
     548 |         raw_spin_unlock_irqrestore(&l->lock, flags);
         |                                      ^~
   include/linux/spinlock.h:280:45: note: in definition of macro 'raw_spin_=
unlock_irqrestore'
     280 |                 _raw_spin_unlock_irqrestore(lock, flags);       \
         |                                             ^~~~
   kernel/bpf/bpf_lru_list.c: In function 'bpf_lru_list_init':
   kernel/bpf/bpf_lru_list.c:643:30: error: 'struct bpf_lru_list' has no me=
mber named 'lock'
     643 |         raw_spin_lock_init(&l->lock);
         |                              ^~
   include/linux/spinlock.h:106:31: note: in definition of macro 'raw_spin_=
lock_init'
     106 |         __raw_spin_lock_init((lock), #lock, &__key, LD_WAIT_SPIN=
);      \
         |                               ^~~~


vim +36 kernel/bpf/bpf_lru_list.h

3a08c2fd763450 Martin KaFai Lau 2016-11-11  29  =

3a08c2fd763450 Martin KaFai Lau 2016-11-11  30  struct bpf_lru_list {
3a08c2fd763450 Martin KaFai Lau 2016-11-11  31  	struct list_head lists[NR_=
BPF_LRU_LIST_T];
3a08c2fd763450 Martin KaFai Lau 2016-11-11  32  	unsigned int counts[NR_BPF=
_LRU_LIST_COUNT];
0ac16296ffc638 Qiujun Huang     2020-04-03  33  	/* The next inactive list =
rotation starts from here */
3a08c2fd763450 Martin KaFai Lau 2016-11-11  34  	struct list_head *next_ina=
ctive_rotation;
3a08c2fd763450 Martin KaFai Lau 2016-11-11  35  =

3a08c2fd763450 Martin KaFai Lau 2016-11-11 @36  	raw_spinlock_t lock ____ca=
cheline_aligned_in_smp;
3a08c2fd763450 Martin KaFai Lau 2016-11-11  37  };
3a08c2fd763450 Martin KaFai Lau 2016-11-11  38  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7322405166862142124==--

