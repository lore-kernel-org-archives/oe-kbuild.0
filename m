Content-Type: multipart/mixed; boundary="===============2136838959468043474=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH bpf-next v3 03/13] bpf: Allow storing unreferenced kptr in map
Date: Mon, 21 Mar 2022 20:42:57 +0800
Message-ID: <202203212017.WL0shrHG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2136838959468043474==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220320155510.671497-4-memxor@gmail.com>
References: <20220320155510.671497-4-memxor@gmail.com>
TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>
TO: bpf(a)vger.kernel.org
CC: Alexei Starovoitov <ast@kernel.org>
CC: Andrii Nakryiko <andrii@kernel.org>
CC: Daniel Borkmann <daniel@iogearbox.net>
CC: "Toke H=C3=B8iland-J=C3=B8rgensen" <toke@redhat.com>
CC: Jesper Dangaard Brouer <brouer@redhat.com>

Hi Kumar,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Kumar-Kartikeya-Dwivedi/In=
troduce-typed-pointer-support-in-BPF-maps/20220320-235746
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20321/202203212017.WL0shrHG-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 85e9b2=
687a13d1908aa86d1b89c5ce398a06cd39)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/580de8298bfc6cb3dbeb3e865=
0585c6527d865b3
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Kumar-Kartikeya-Dwivedi/Introduce-=
typed-pointer-support-in-BPF-maps/20220320-235746
        git checkout 580de8298bfc6cb3dbeb3e8650585c6527d865b3
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:353:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:341:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:325:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   include/linux/list.h:292:2: note: Returning zero, which participates in =
a condition later
           return READ_ONCE(head->next) =3D=3D head;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:476:7: note: Returning from 'list_empty'
           if (!list_empty(list))
                ^~~~~~~~~~~~~~~~
   include/linux/list.h:476:2: note: Taking true branch
           if (!list_empty(list))
           ^
   include/linux/list.h:477:23: note: Passing null pointer value via 2nd pa=
rameter 'prev'
                   __list_splice(list, head->prev, head);
                                       ^~~~~~~~~~
   include/linux/list.h:477:3: note: Calling '__list_splice'
                   __list_splice(list, head->prev, head);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:450:13: note: Access to field 'next' results in a d=
ereference of a null pointer (loaded from variable 'prev')
           prev->next =3D first;
           ~~~~       ^
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   fs/coda/dir.c:387:4: warning: Value stored to 'ret' is never read [clang=
-analyzer-deadcode.DeadStores]
                           ret =3D -EBADF;
                           ^     ~~~~~~
   fs/coda/dir.c:387:4: note: Value stored to 'ret' is never read
                           ret =3D -EBADF;
                           ^     ~~~~~~
   fs/coda/dir.c:394:4: warning: Value stored to 'ret' is never read [clang=
-analyzer-deadcode.DeadStores]
                           ret =3D -EBADF;
                           ^     ~~~~~~
   fs/coda/dir.c:394:4: note: Value stored to 'ret' is never read
                           ret =3D -EBADF;
                           ^     ~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   fs/coda/upcall.c:259:9: warning: Value stored to 's' is never read [clan=
g-analyzer-deadcode.DeadStores]
           s =3D ( new_length & ~0x3) +4; /* round up to word boundary */
           ^   ~~~~~~~~~~~~~~~~~~~~~~~
   fs/coda/upcall.c:259:9: note: Value stored to 's' is never read
           s =3D ( new_length & ~0x3) +4; /* round up to word boundary */
           ^   ~~~~~~~~~~~~~~~~~~~~~~~
   fs/coda/upcall.c:430:9: warning: Value stored to 's' is never read [clan=
g-analyzer-deadcode.DeadStores]
           s =3D (len & ~0x3) + 4;
           ^   ~~~~~~~~~~~~~~~~
   fs/coda/upcall.c:430:9: note: Value stored to 's' is never read
           s =3D (len & ~0x3) + 4;
           ^   ~~~~~~~~~~~~~~~~
   Suppressed 14 warnings (4 in non-user code, 10 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   fs/exfat/inode.c:147:3: warning: Value stored to 'clu_offset' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                   clu_offset -=3D fclus;
                   ^             ~~~~~
   fs/exfat/inode.c:147:3: note: Value stored to 'clu_offset' is never read
                   clu_offset -=3D fclus;
                   ^             ~~~~~
   fs/exfat/inode.c:216:3: warning: Value stored to 'num_clusters' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   num_clusters +=3D num_to_be_allocated;
                   ^               ~~~~~~~~~~~~~~~~~~~
   fs/exfat/inode.c:216:3: note: Value stored to 'num_clusters' is never re=
ad
                   num_clusters +=3D num_to_be_allocated;
                   ^               ~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
>> kernel/bpf/btf.c:3417:19: warning: Assigned value is garbage or undefine=
d [clang-analyzer-core.uninitialized.Assign]
                   tab->off[i].btf =3D off_btf;
                                   ^ ~~~~~~~
   kernel/bpf/btf.c:3388:15: note: BPF_MAP_VALUE_OFF_MAX is equal to 8
           BUILD_BUG_ON(BPF_MAP_VALUE_OFF_MAX !=3D 8);
                        ^
   include/linux/build_bug.h:50:19: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
                            ^~~~~~~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                                            ^~~~
   include/linux/compiler_types.h:353:22: note: expanded from macro 'compil=
etime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:341:23: note: expanded from macro '_compi=
letime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:333:9: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   kernel/bpf/btf.c:3388:2: note: Taking false branch
           BUILD_BUG_ON(BPF_MAP_VALUE_OFF_MAX !=3D 8);
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:353:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:341:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:333:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   kernel/bpf/btf.c:3388:2: note: Loop condition is false.  Exiting loop
           BUILD_BUG_ON(BPF_MAP_VALUE_OFF_MAX !=3D 8);
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:353:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:341:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:325:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   kernel/bpf/btf.c:3390:8: note: Calling 'btf_find_field'
           ret =3D btf_find_field(btf, t, BTF_FIELD_KPTR, info_arr, ARRAY_S=
IZE(info_arr));
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
   kernel/bpf/btf.c:3319:2: note: Control jumps to 'case BTF_FIELD_KPTR:'  =
at line 3330
           switch (field_type) {
           ^
   kernel/bpf/btf.c:3334:3: note:  Execution continues on line 3340
                   break;
                   ^
   kernel/bpf/btf.c:3340:6: note: Calling '__btf_type_is_struct'
           if (__btf_type_is_struct(t))
               ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/btf.c:472:9: note: Assuming the condition is false
           return BTF_INFO_KIND(t->info) =3D=3D BTF_KIND_STRUCT;
                  ^
   include/uapi/linux/btf.h:55:29: note: expanded from macro 'BTF_INFO_KIND'
   #define BTF_INFO_KIND(info)     (((info) >> 24) & 0x1f)
                                   ^
   kernel/bpf/btf.c:472:2: note: Returning zero, which participates in a co=
ndition later
           return BTF_INFO_KIND(t->info) =3D=3D BTF_KIND_STRUCT;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/btf.c:3340:6: note: Returning from '__btf_type_is_struct'
           if (__btf_type_is_struct(t))
               ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/btf.c:3340:2: note: Taking false branch
           if (__btf_type_is_struct(t))
           ^
   kernel/bpf/btf.c:3342:11: note: Calling 'btf_type_is_datasec'
           else if (btf_type_is_datasec(t))
                    ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/btf.c:482:9: note: Assuming the condition is true
           return BTF_INFO_KIND(t->info) =3D=3D BTF_KIND_DATASEC;
                  ^
   include/uapi/linux/btf.h:55:29: note: expanded from macro 'BTF_INFO_KIND'
   #define BTF_INFO_KIND(info)     (((info) >> 24) & 0x1f)
                                   ^
   kernel/bpf/btf.c:482:2: note: Returning the value 1, which participates =
in a condition later
           return BTF_INFO_KIND(t->info) =3D=3D BTF_KIND_DATASEC;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/btf.c:3342:11: note: Returning from 'btf_type_is_datasec'
           else if (btf_type_is_datasec(t))
                    ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/btf.c:3342:7: note: Taking true branch
           else if (btf_type_is_datasec(t))

vim +3417 kernel/bpf/btf.c

580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3378  =

580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3379  struct bpf_map_val=
ue_off *btf_find_kptr(const struct btf *btf,
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3380  					const struct =
btf_type *t)
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3381  {
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3382  	/* btf_find_field=
 requires array of size max + 1 */
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3383  	struct btf_field_=
info info_arr[BPF_MAP_VALUE_OFF_MAX + 1];
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3384  	struct bpf_map_va=
lue_off *tab;
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3385  	int ret, i, nr_of=
f;
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3386  =

580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3387  	/* Revisit stack =
usage when bumping BPF_MAP_VALUE_OFF_MAX */
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3388  	BUILD_BUG_ON(BPF_=
MAP_VALUE_OFF_MAX !=3D 8);
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3389  =

580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3390  	ret =3D btf_find_=
field(btf, t, BTF_FIELD_KPTR, info_arr, ARRAY_SIZE(info_arr));
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3391  	if (ret < 0)
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3392  		return ERR_PTR(r=
et);
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3393  	if (!ret)
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3394  		return NULL;
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3395  =

580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3396  	nr_off =3D ret;
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3397  	tab =3D kzalloc(o=
ffsetof(struct bpf_map_value_off, off[nr_off]), GFP_KERNEL | __GFP_NOWARN);
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3398  	if (!tab)
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3399  		return ERR_PTR(-=
ENOMEM);
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3400  =

580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3401  	tab->nr_off =3D 0;
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3402  	for (i =3D 0; i <=
 nr_off; i++) {
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3403  		const struct btf=
_type *t;
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3404  		struct btf *off_=
btf;
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3405  		s32 id;
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3406  =

580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3407  		t =3D info_arr[i=
].type;
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3408  		id =3D bpf_find_=
btf_id(__btf_name_by_offset(btf, t->name_off), BTF_INFO_KIND(t->info),
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3409  				     &off_btf);
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3410  		if (id < 0) {
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3411  			ret =3D id;
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3412  			goto end;
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3413  		}
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3414  =

580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3415  		tab->off[i].offs=
et =3D info_arr[i].off;
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3416  		tab->off[i].btf_=
id =3D id;
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20 @3417  		tab->off[i].btf =
=3D off_btf;
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3418  		tab->nr_off =3D =
i + 1;
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3419  	}
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3420  	return tab;
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3421  end:
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3422  	while (tab->nr_of=
f--)
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3423  		btf_put(tab->off=
[tab->nr_off].btf);
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3424  	kfree(tab);
580de8298bfc6c Kumar Kartikeya Dwivedi 2022-03-20  3425  	return ERR_PTR(re=
t);
68134668c17f31 Alexei Starovoitov      2021-07-14  3426  }
68134668c17f31 Alexei Starovoitov      2021-07-14  3427  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2136838959468043474==--

