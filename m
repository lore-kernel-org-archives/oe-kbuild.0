Content-Type: multipart/mixed; boundary="===============6554567297229439692=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: lib/ref_tracker.c:24:9: sparse: sparse: static assertion failed: "pointer type mismatch in container_of()"
Date: Wed, 02 Feb 2022 22:21:02 +0800
Message-ID: <202202022257.hWV6TwxY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6554567297229439692==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Vlastimil Babka <vbabka@suse.cz>
CC: Marco Elver <elver@google.com>
CC: Colin Ian King <colin.king@canonical.com>
CC: Eric Dumazet <edumazet@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   26291c54e111ff6ba87a164d85d4a4e134b7315c
commit: 2dba5eb1c73b6ba2988ced07250edeac0f8cbf5a lib/stackdepot: allow opti=
onal init and stack_table allocation by kvmalloc()
date:   11 days ago
:::::: branch date: 3 days ago
:::::: commit date: 11 days ago
config: nds32-randconfig-s031-20220202 (https://download.01.org/0day-ci/arc=
hive/20220202/202202022257.hWV6TwxY-lkp(a)intel.com/config)
compiler: nds32le-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D2dba5eb1c73b6ba2988ced07250edeac0f8cbf5a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2dba5eb1c73b6ba2988ced07250edeac0f8cbf5a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dn=
ds32 SHELL=3D/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   lib/ref_tracker.c: note: in included file (through include/linux/ww_mute=
x.h, include/linux/seqlock.h, include/linux/mmzone.h, ...):
   include/linux/rtmutex.h:68:58: sparse: sparse: Expected ) in function de=
clarator
   include/linux/rtmutex.h:68:58: sparse: sparse: got $
   lib/ref_tracker.c: note: in included file:
   include/linux/stacktrace.h:91:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:54: sparse: sparse: got $
   include/linux/stacktrace.h:93:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:93:62: sparse: sparse: got $
   include/linux/stacktrace.h:103:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:103:69: sparse: sparse: got $
   include/linux/stacktrace.h:108:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/stacktrace.h:108:1: sparse: sparse: got }
   lib/ref_tracker.c:15:1: sparse: sparse: Expected ; at the end of type de=
claration
   lib/ref_tracker.c:15:1: sparse: sparse: got }
   lib/ref_tracker.c:24:9: sparse: sparse: using member 'head' in incomplet=
e struct ref_tracker
>> lib/ref_tracker.c:24:9: sparse: sparse: static assertion failed: "pointe=
r type mismatch in container_of()"
   lib/ref_tracker.c:24:9: sparse: sparse: using member 'head' in incomplet=
e struct ref_tracker
   lib/ref_tracker.c:24:9: sparse: sparse: using member 'head' in incomplet=
e struct ref_tracker
   lib/ref_tracker.c:24:9: sparse: sparse: using member 'head' in incomplet=
e struct ref_tracker
   lib/ref_tracker.c:24:9: sparse: sparse: using member 'head' in incomplet=
e struct ref_tracker
   lib/ref_tracker.c:24:9: sparse: sparse: using member 'head' in incomplet=
e struct ref_tracker
   lib/ref_tracker.c:24:9: sparse: sparse: using member 'head' in incomplet=
e struct ref_tracker
   lib/ref_tracker.c:29:9: sparse: sparse: using member 'head' in incomplet=
e struct ref_tracker
   lib/ref_tracker.c:29:9: sparse: sparse: static assertion failed: "pointe=
r type mismatch in container_of()"
   lib/ref_tracker.c:29:9: sparse: sparse: using member 'head' in incomplet=
e struct ref_tracker
   lib/ref_tracker.c:29:9: sparse: sparse: using member 'head' in incomplet=
e struct ref_tracker
   lib/ref_tracker.c:29:9: sparse: sparse: using member 'head' in incomplet=
e struct ref_tracker
   lib/ref_tracker.c:29:9: sparse: sparse: using member 'head' in incomplet=
e struct ref_tracker
   lib/ref_tracker.c:29:9: sparse: sparse: using member 'head' in incomplet=
e struct ref_tracker
   lib/ref_tracker.c:29:9: sparse: sparse: using member 'head' in incomplet=
e struct ref_tracker
   lib/ref_tracker.c:51:9: sparse: sparse: using member 'head' in incomplet=
e struct ref_tracker
   lib/ref_tracker.c:51:9: sparse: sparse: static assertion failed: "pointe=
r type mismatch in container_of()"
   lib/ref_tracker.c:51:9: sparse: sparse: using member 'head' in incomplet=
e struct ref_tracker
   lib/ref_tracker.c:51:9: sparse: sparse: using member 'head' in incomplet=
e struct ref_tracker
   lib/ref_tracker.c:51:9: sparse: sparse: using member 'head' in incomplet=
e struct ref_tracker
   lib/ref_tracker.c:132:27: sparse: sparse: using member 'head' in incompl=
ete struct ref_tracker
   lib/ref_tracker.c:132:27: sparse: sparse: static assertion failed: "poin=
ter type mismatch in container_of()"
   lib/ref_tracker.c:24:9: sparse: sparse: using member 'head' in incomplet=
e struct ref_tracker
>> lib/ref_tracker.c:24:9: sparse: sparse: unknown member
>> lib/ref_tracker.c:24:9: sparse: sparse: cast from unknown type
   lib/ref_tracker.c:24:9: sparse: sparse: using member 'head' in incomplet=
e struct ref_tracker
>> lib/ref_tracker.c:24:9: sparse: sparse: cast from unknown type
>> lib/ref_tracker.c:24:9: sparse: sparse: unknown member
>> lib/ref_tracker.c:24:9: sparse: sparse: cast from unknown type
   lib/ref_tracker.c:25:34: sparse: sparse: using member 'head' in incomple=
te struct ref_tracker
   lib/ref_tracker.c:24:9: sparse: sparse: using member 'head' in incomplet=
e struct ref_tracker
>> lib/ref_tracker.c:24:9: sparse: sparse: cast from unknown type
>> lib/ref_tracker.c:24:9: sparse: sparse: unknown member
>> lib/ref_tracker.c:24:9: sparse: sparse: cast from unknown type
   lib/ref_tracker.c:29:9: sparse: sparse: using member 'head' in incomplet=
e struct ref_tracker
   lib/ref_tracker.c:29:9: sparse: sparse: unknown member
   lib/ref_tracker.c:29:9: sparse: sparse: cast from unknown type
   lib/ref_tracker.c:29:9: sparse: sparse: using member 'head' in incomplet=
e struct ref_tracker
   lib/ref_tracker.c:29:9: sparse: sparse: cast from unknown type
   lib/ref_tracker.c:29:9: sparse: sparse: unknown member
   lib/ref_tracker.c:29:9: sparse: sparse: cast from unknown type
   lib/ref_tracker.c:31:28: sparse: sparse: using member 'alloc_stack_handl=
e' in incomplete struct ref_tracker
   lib/ref_tracker.c:32:50: sparse: sparse: using member 'alloc_stack_handl=
e' in incomplete struct ref_tracker
   lib/ref_tracker.c:34:34: sparse: sparse: using member 'head' in incomple=
te struct ref_tracker
   lib/ref_tracker.c:29:9: sparse: sparse: using member 'head' in incomplet=
e struct ref_tracker
   lib/ref_tracker.c:29:9: sparse: sparse: cast from unknown type
   lib/ref_tracker.c:29:9: sparse: sparse: unknown member
   lib/ref_tracker.c:29:9: sparse: sparse: cast from unknown type
   lib/ref_tracker.c:51:9: sparse: sparse: using member 'head' in incomplet=
e struct ref_tracker
   lib/ref_tracker.c:51:9: sparse: sparse: unknown member
   lib/ref_tracker.c:51:9: sparse: sparse: cast from unknown type
   lib/ref_tracker.c:54:36: sparse: sparse: using member 'alloc_stack_handl=
e' in incomplete struct ref_tracker
   lib/ref_tracker.c:55:58: sparse: sparse: using member 'alloc_stack_handl=
e' in incomplete struct ref_tracker
   lib/ref_tracker.c:51:9: sparse: sparse: using member 'head' in incomplet=
e struct ref_tracker
   lib/ref_tracker.c:51:9: sparse: sparse: cast from unknown type
   lib/ref_tracker.c:51:9: sparse: sparse: unknown member
   lib/ref_tracker.c:51:9: sparse: sparse: cast from unknown type
   lib/ref_tracker.c:85:16: sparse: sparse: using member 'alloc_stack_handl=
e' in incomplete struct ref_tracker
   lib/ref_tracker.c:88:26: sparse: sparse: using member 'head' in incomple=
te struct ref_tracker
   lib/ref_tracker.c:112:20: sparse: sparse: using member 'dead' in incompl=
ete struct ref_tracker
   lib/ref_tracker.c:114:28: sparse: sparse: using member 'alloc_stack_hand=
le' in incomplete struct ref_tracker
   lib/ref_tracker.c:116:50: sparse: sparse: using member 'alloc_stack_hand=
le' in incomplete struct ref_tracker
   lib/ref_tracker.c:118:28: sparse: sparse: using member 'free_stack_handl=
e' in incomplete struct ref_tracker
   lib/ref_tracker.c:120:50: sparse: sparse: using member 'free_stack_handl=
e' in incomplete struct ref_tracker
   lib/ref_tracker.c:126:16: sparse: sparse: using member 'dead' in incompl=
ete struct ref_tracker
   lib/ref_tracker.c:128:16: sparse: sparse: using member 'free_stack_handl=
e' in incomplete struct ref_tracker
   lib/ref_tracker.c:130:32: sparse: sparse: using member 'head' in incompl=
ete struct ref_tracker
   lib/ref_tracker.c:132:27: sparse: sparse: unknown member
   lib/ref_tracker.c:132:27: sparse: sparse: cast from unknown type
   lib/ref_tracker.c:133:34: sparse: sparse: using member 'head' in incompl=
ete struct ref_tracker
   lib/ref_tracker.c: note: in included file (through include/linux/irqflag=
s.h, include/asm-generic/cmpxchg.h, arch/nds32/include/generated/asm/cmpxch=
g.h, ...):
   arch/nds32/include/asm/irqflags.h:15:17: sparse: sparse: undefined ident=
ifier '__builtin_nds32_mfsr'
   lib/ref_tracker.c: note: in included file (through arch/nds32/include/as=
m/irqflags.h, include/linux/irqflags.h, include/asm-generic/cmpxchg.h, ...):
   arch/nds32/include/asm/nds32.h:32:9: sparse: sparse: undefined identifie=
r '__builtin_nds32_gie_dis'
   arch/nds32/include/asm/nds32.h:26:9: sparse: sparse: undefined identifie=
r '__builtin_nds32_gie_en'

vim +24 lib/ref_tracker.c

4e66934eaadc83 Eric Dumazet 2021-12-04  16  =

4e66934eaadc83 Eric Dumazet 2021-12-04  17  void ref_tracker_dir_exit(struc=
t ref_tracker_dir *dir)
4e66934eaadc83 Eric Dumazet 2021-12-04  18  {
4e66934eaadc83 Eric Dumazet 2021-12-04  19  	struct ref_tracker *tracker, *=
n;
4e66934eaadc83 Eric Dumazet 2021-12-04  20  	unsigned long flags;
4e66934eaadc83 Eric Dumazet 2021-12-04  21  	bool leak =3D false;
4e66934eaadc83 Eric Dumazet 2021-12-04  22  =

4e66934eaadc83 Eric Dumazet 2021-12-04  23  	spin_lock_irqsave(&dir->lock, =
flags);
4e66934eaadc83 Eric Dumazet 2021-12-04 @24  	list_for_each_entry_safe(track=
er, n, &dir->quarantine, head) {
4e66934eaadc83 Eric Dumazet 2021-12-04  25  		list_del(&tracker->head);
4e66934eaadc83 Eric Dumazet 2021-12-04  26  		kfree(tracker);
4e66934eaadc83 Eric Dumazet 2021-12-04  27  		dir->quarantine_avail++;
4e66934eaadc83 Eric Dumazet 2021-12-04  28  	}
4e66934eaadc83 Eric Dumazet 2021-12-04  29  	list_for_each_entry_safe(track=
er, n, &dir->list, head) {
4e66934eaadc83 Eric Dumazet 2021-12-04  30  		pr_err("leaked reference.\n");
4e66934eaadc83 Eric Dumazet 2021-12-04  31  		if (tracker->alloc_stack_hand=
le)
4e66934eaadc83 Eric Dumazet 2021-12-04  32  			stack_depot_print(tracker->a=
lloc_stack_handle);
4e66934eaadc83 Eric Dumazet 2021-12-04  33  		leak =3D true;
4e66934eaadc83 Eric Dumazet 2021-12-04  34  		list_del(&tracker->head);
4e66934eaadc83 Eric Dumazet 2021-12-04  35  		kfree(tracker);
4e66934eaadc83 Eric Dumazet 2021-12-04  36  	}
4e66934eaadc83 Eric Dumazet 2021-12-04  37  	spin_unlock_irqrestore(&dir->l=
ock, flags);
4e66934eaadc83 Eric Dumazet 2021-12-04  38  	WARN_ON_ONCE(leak);
4e66934eaadc83 Eric Dumazet 2021-12-04  39  	WARN_ON_ONCE(refcount_read(&di=
r->untracked) !=3D 1);
4e66934eaadc83 Eric Dumazet 2021-12-04  40  }
4e66934eaadc83 Eric Dumazet 2021-12-04  41  EXPORT_SYMBOL(ref_tracker_dir_e=
xit);
4e66934eaadc83 Eric Dumazet 2021-12-04  42  =


:::::: The code at line 24 was first introduced by commit
:::::: 4e66934eaadc83b27ada8d42b60894018f3bfabf lib: add reference counting=
 tracking infrastructure

:::::: TO: Eric Dumazet <edumazet@google.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6554567297229439692==--

